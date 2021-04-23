package com.artech.base.metadata.loader;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.webkit.URLUtil;

import com.artech.R;
import com.artech.android.gam.GAMUser;
import com.artech.android.remotenotification.RemoteNotification;
import com.artech.application.ApplicationStorageHelper;
import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.InstanceProperties;
import com.artech.base.metadata.loader.steps.AttributesLoadStep;
import com.artech.base.metadata.loader.steps.DeepLinksLoadStep;
import com.artech.base.metadata.loader.steps.DomainsLoadStep;
import com.artech.base.metadata.loader.steps.EntitiesLoadStep;
import com.artech.base.metadata.loader.steps.PatternInstancesLoadStep;
import com.artech.base.metadata.loader.steps.PatternSettingsLoadStep;
import com.artech.base.metadata.loader.steps.ProceduresLoadStep;
import com.artech.base.metadata.loader.steps.ResourcesLoadStep;
import com.artech.base.metadata.loader.steps.SDTsLoadStep;
import com.artech.base.metadata.loader.steps.ServerInfoLoadStep;
import com.artech.base.metadata.loader.steps.ThemesLoadStep;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.IContext;
import com.artech.base.services.Services;
import com.artech.base.services.UrlBuilder;
import com.artech.base.utils.Strings;
import com.artech.common.ApplicationHelper;
import com.artech.common.SecurityHelper;

import org.sqldroid.SQLDroidHelper;

import java.util.Arrays;
import java.util.List;

public class ApplicationLoader {
	private final GenexusApplication mGenexusApplication;

	public ApplicationLoader(GenexusApplication genexusApplication) {
		mGenexusApplication = genexusApplication;
	}

	/**
	 * Reads the minimum metadata necessary to make startup decisions.
	 */
	public void preloadApplication(Context context) {
		new PatternSettingsLoadStep(context, false, mGenexusApplication).load();
		if (loadMainObjectProperties(context)) {
			Services.Log.init(mGenexusApplication.getMainProperties());
		}
	}

	public LoadResult loadApplication(IContext context,
									  Context appContext,
									  SyncManager.Listener syncListener) {
		String baseUri = mGenexusApplication.getAPIUri();
		String serverUrl = baseUri;
		if (baseUri.endsWith("/"))
			serverUrl = baseUri.substring(0, baseUri.length() - 1);

		if (!URLUtil.isNetworkUrl(serverUrl)) {
			return LoadResult.result(LoadResult.RESULT_INVALID_APP_URL);
		}

		mGenexusApplication.UriMaker = new UrlBuilder(serverUrl);

		RemoteApplicationInfo remoteAppInfo = Services.HttpService.getRemoteApplicationInfo();

		// Don't attempt to update the app if we can't retrieve this info from the remote server
		if (remoteAppInfo != null) {
			if (mGenexusApplication.getMajorVersion() < remoteAppInfo.getMajorVersion()) {
				return LoadResult.result(LoadResult.RESULT_UPDATE, remoteAppInfo.getAppStoreUrl());
			}

			String prefKey = MetadataLoader.getPrefsName(mGenexusApplication) + mGenexusApplication.getMajorVersion() + "-MinorVersion";
			int currentMinorVersion = (int) context.getMinorVersion(prefKey, mGenexusApplication.getMinorVersion());

			// If there is a download version, don't use the one from resources
			SharedPreferences settings = appContext.getSharedPreferences(MetadataLoader.getPrefsName(mGenexusApplication), 0);
			long currentDownloadedMetadataVersion = settings.getLong("API_VERSION", 0);
			if (currentDownloadedMetadataVersion > 0)
				mGenexusApplication.setShouldReadMetadataFromResources(false);

			// Download metadata from server if either:
			// - Current app minor version is lower than the remote
			// - Metadata is not embedded inside the app's resources
			if (currentMinorVersion < remoteAppInfo.getMinorVersion() || !MetadataLoader.hasAppIdInRaw(appContext)) {
				long remoteMetadataVersion = Services.HttpService.getRemoteMetadataVersion();

				// Don't download the metadata if we already have the latest version downloaded
				if (currentDownloadedMetadataVersion < remoteMetadataVersion) {
					Services.HttpService.downloadAndExtractMetadata(appContext);

					SharedPreferences.Editor editor = settings.edit();
					editor.putLong("API_VERSION", remoteMetadataVersion);
					editor.putString("DOWNLOADED_ZIP_VERSION", remoteAppInfo.getMajorVersion() + "." + remoteAppInfo.getMinorVersion());
					editor.apply();

					// save the new minor version, for this current mayor
					context.saveMinorVersion(prefKey, remoteAppInfo.getMinorVersion());

					// now read metadata from file system and not from raw/
					mGenexusApplication.setShouldReadMetadataFromResources(false);
				}
			}
		}

		// Load all metadata files.
		loadMetadata(appContext);

		Services.Application.getDefinition().setLoaded(true);

		// Post-processing.
		initializeMain();

		// Update logging setup, since its properties may have changed after updating metadata.
		Services.Log.init(mGenexusApplication.getMainProperties());

		// prepare SqlDroid Driver.
		SQLDroidHelper.initialize(appContext, new ApplicationStorageHelper(appContext));

		if (mGenexusApplication.isOfflineApplication()) {
			Services.Log.debug("Is OfflineApplication");
			// Create sync database before registering for notification
			if (!SyncManager.createSyncDatabase(mGenexusApplication)) {
				return LoadResult.error(new Exception("Database creation failed: could not find Reorganization programs."));
			}
		}

		// Load current user data from last session. This must be done
		// 1) before registerForNotifications() since the procedure may need authentication, and
		// 2) before synchronizing data, since it's common to use the GAMUser object there.
		SecurityHelper.restoreLoginInformation();

		registerForNotification(appContext, mGenexusApplication);
		//initialize Location services if used
		initLocationServices(appContext);

		logDeviceInfo();

		SyncManager.syncData(mGenexusApplication, syncListener);

		// Always acquire anonymous user on start. Fail if not connected.
		if (!Strings.hasValue(GAMUser.getCurrentUserId())
				&& mGenexusApplication.isSecure()
				&& mGenexusApplication.getEnableAnonymousUser()
				&& !SecurityHelper.tryAutomaticLogin()) {
			String errorMessage = Services.Strings.getResource(R.string.GXM_NetworkError, "connection failed");
			return LoadResult.error(new Exception(errorMessage));
		}

		if (mGenexusApplication.getUseDynamicUrl()
				&& (!mGenexusApplication.isOfflineApplication() || Services.HttpService.isOnline())
				&& !ApplicationHelper.checkApplicationUri(mGenexusApplication, mGenexusApplication.getAPIUri())) {
			return LoadResult.result(LoadResult.RESULT_INVALID_APP_URL);
		}

		return LoadResult.result(LoadResult.RESULT_OK);
	}

	private boolean loadMainObjectProperties(Context context) {
		String resourceName = String.format("%s.properties", Strings.toLowerCase(mGenexusApplication.getAppEntry()));
		INodeObject json = MetadataLoader.getDefinition(context, resourceName);
		if (json != null) {
			INodeObject jsonProperties = json.optNode("properties");
			if (jsonProperties != null) {
				InstanceProperties mainProperties = new InstanceProperties();
				mainProperties.deserialize(jsonProperties);
				mGenexusApplication.setMainProperties(mainProperties);
				return true;
			}
		}

		return false;
	}

	private void loadMetadata(Context context) {
		// Read the project file, used below.
		MetadataFile metadataFile = new MetadataFile(context, mGenexusApplication.getAppEntry());

		List<MetadataLoadStep> steps = Arrays.asList(
			new ServerInfoLoadStep(context, mGenexusApplication),
			new PatternSettingsLoadStep(context, true, mGenexusApplication),
			new ThemesLoadStep(context),
			new ResourcesLoadStep(context),
			new DomainsLoadStep(context),
			new AttributesLoadStep(metadataFile),
			new SDTsLoadStep(metadataFile),
			new EntitiesLoadStep(context, metadataFile),
			new PatternInstancesLoadStep(context, metadataFile),
			new ProceduresLoadStep(metadataFile),
			new DeepLinksLoadStep(context, mGenexusApplication)
		);

		for (MetadataLoadStep step : steps) {
			step.load();
		}
	}

	private void initializeMain() {
		IViewDefinition mainView = mGenexusApplication.getDefinition().getView(mGenexusApplication.getAppEntry());
		if (mainView == null) {
			throw new IllegalArgumentException("Could not find the DataView for the main: " + mGenexusApplication.getAppEntry());
		}
		mGenexusApplication.setMain(mainView);
	}

	private void registerForNotification(Context appContext, GenexusApplication genexusApplication) {
		// Notification only available if enabled them and if device is 2.2
		if (mGenexusApplication.getUseNotification() && Services.Device.isDeviceNotificationEnabled()) {
			if (RemoteNotification.getDefaultProvider() != null) {
				// register with default provider
				RemoteNotification.getDefaultProvider().registerDevice(appContext, genexusApplication);
			}
		}
	}

	@SuppressWarnings("deprecation")
	private void initLocationServices(Context appContext) {
		boolean hasReadLocationPermission = PackageManager.PERMISSION_GRANTED == appContext.checkCallingOrSelfPermission(android.Manifest.permission.ACCESS_FINE_LOCATION);
		if (hasReadLocationPermission)
			MyApplication.getInstance().getGeoLocationHelper().createFusedLocationHelper();
	}

	private void logDeviceInfo() {
		Services.Log.debug("Device Information");
		Services.Log.debug("Name: " + android.os.Build.MODEL);
		Services.Log.debug("Brand: " + android.os.Build.BRAND);
		Services.Log.debug("Product: " + android.os.Build.PRODUCT);
		Services.Log.debug("SDK: " + Services.Device.getSDKVersion());
		Services.Log.debug("OS: " + Services.Device.getOSVersion());
		Services.Log.debug("Version: " + Services.Device.getOSVersion());

		int widthDips = Services.Device.getScreenWidth();
		int heightDips = Services.Device.getScreenHeight();
		Services.Log.debug("Smallest width (dips): " + Services.Device.getScreenSmallestWidth());
		Services.Log.debug("Screen size (dips): " + widthDips + "x" + heightDips); // Screen size
		Services.Log.debug("Screen size (pixels): " + Services.Device.dipsToPixels(widthDips) + "x" + Services.Device.dipsToPixels(heightDips));
	}
}
