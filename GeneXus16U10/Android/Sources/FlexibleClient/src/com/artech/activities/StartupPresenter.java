package com.artech.activities;

import android.content.Context;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.text.TextUtils;

import com.artech.R;
import com.artech.android.FileDownloader;
import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.loader.ApplicationLoader;
import com.artech.base.metadata.loader.LoadResult;
import com.artech.base.metadata.loader.SyncManager;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.LaunchScreenViewProvider;
import com.artech.init.AppInitRunnable;
import com.artech.utils.FileUtils2;

import java.io.File;
import java.io.IOException;

public class StartupPresenter implements StartupContract.Presenter {
	private StartupContract.View mView;
	private GenexusApplication mGenexusApplication;
	private final boolean mHandleDeepLink;
	private final ApplicationLoader mApplicationLoader;
	private boolean mLaunchScreenHasFinished;
	private boolean mInitializationHasFinished;

	public StartupPresenter(StartupContract.View view, GenexusApplication genexusApplication,
							boolean handleDeepLink) {
		mView = view;
		mGenexusApplication = genexusApplication;
		mHandleDeepLink = handleDeepLink;
		mApplicationLoader = new ApplicationLoader(genexusApplication);
	}

	@Override
	public void initApplicationLoad(Context context, String newServerUrl) {
		if (mGenexusApplication.getUseDynamicUrl()) {
			// Restore dynamic url if persisted in the application's preferences.
			SharedPreferences preferences = Services.Preferences.getAppSharedPreferences("DynamicUrlPreference");
			String serverUrl = preferences.getString("dynamicUrl", null);
			if (serverUrl != null) {
				mGenexusApplication.setAPIUri(serverUrl);
			}

			if (newServerUrl != null) {
				if (TextUtils.isEmpty(newServerUrl)) {
					mView.showDynamicAppMenu(mGenexusApplication.getAPIUri(), R.string.GXM_ServerUrlEmpty);
					return;
				}
				mGenexusApplication.setAPIUri(newServerUrl);
			}
		}

		mApplicationLoader.preloadApplication(context);

		if (mView.setAppOrientation())
			return; // This activity will rotate and loading will continue later.

		mInitializationHasFinished = false;
		mLaunchScreenHasFinished = false;

		mView.showLoadingScreen(mOnLaunchScreenHasFinishedListener);

		Runnable runnable = new AppInitRunnable(
				context,
				mApplicationLoader,
				mOnInitializationHasFinishedListener,
				mSyncListener
		);
		Thread thread = new Thread(null, runnable, "Background");
		thread.start();
	}

	@Override
	public void finishApplicationLoad() {
		IViewDefinition mainView = mGenexusApplication.getMain();
		if (mainView == null) {
			mView.showLoadError(mGenexusApplication.getAPIUri(), mGenexusApplication.getAppEntry());
			return;
		}

		if (mHandleDeepLink) {
			mView.handleDeepLinkIntent(mainView);
		} else {
			mView.launchEntryScreen(mainView);
		}

		mView.closeStartupScreen();
	}

	@Override
	public void launchNewAppVersionInstallation(String appStoreUrl) {
		if (TextUtils.isEmpty(appStoreUrl)) {
			return;
		}

		// if it's a direct link to the APK, download it and launch an intent to install it
		if (appStoreUrl.endsWith(".apk")) {
			mView.downloadAPK(Uri.parse(appStoreUrl), mDownloaderListener);
			return;
		}

		// Otherwise, just launch the intent that invokes its store page
		mView.launchAppStoreScreen(appStoreUrl);
		mView.closeStartupScreen();
	}

	private LaunchScreenViewProvider.OnFinishListener mOnLaunchScreenHasFinishedListener = () -> {
		mLaunchScreenHasFinished = true;
		if (mInitializationHasFinished) {
			finishApplicationLoad();
		}
	};

	private AppInitRunnable.Listener mOnInitializationHasFinishedListener = (loadResult) -> {
		switch (loadResult.getCode()) {
			case LoadResult.RESULT_OK:
				mInitializationHasFinished = true;
				if (mLaunchScreenHasFinished) {
					finishApplicationLoad();
				}
				break;
			case LoadResult.RESULT_UPDATE:
				String appStoreUrl = loadResult.getData();
				if (!TextUtils.isEmpty(appStoreUrl)) {
					mView.promptUserToInstallNewVersion(appStoreUrl);
				} else {
					mView.showServerUrlError();
				}
				break;
			case LoadResult.RESULT_ERROR:
				mGenexusApplication.resetDefinition();
				mView.showApplicationLoadError(loadResult.getErrorMessage());
				break;
			case LoadResult.RESULT_INVALID_APP_URL:
				if (mGenexusApplication.getUseDynamicUrl()) {
					mView.showDynamicAppMenu(mGenexusApplication.getAPIUri(), R.string.GXM_ServerUrlIncorrect);
				} else {
					mView.showServerUrlError();
				}
				break;
			default:
				throw new IllegalArgumentException("Invalid LoadResult");
		}
	};

	private SyncManager.Listener mSyncListener = new SyncManager.Listener() {
		@Override
		public void onSyncStarted() {
			String title = Services.Strings.getResource(R.string.GXM_ReceivingData);
			String content = Strings.EMPTY;
			int drawableId = R.drawable.gx_stat_notify_sync;
			mView.showSyncDialog();
			mView.showSyncNotification(title, content, drawableId);
		}

		@Override
		public void onSyncFinished(boolean failed, boolean delayed) {
			mView.hideSyncDialog();
			if (delayed) {
				String title = Services.Strings.getResource(R.string.GXM_ReceivingData);
				String content = failed ? Services.Strings.getResource(R.string.GXM_ReceptionFailed) : Services.Strings.getResource(R.string.GXM_ReceptionCompleted);
				int drawableId = failed ? R.drawable.gx_stat_notify_sync_error : R.drawable.gx_stat_notify_sync_ok;
				mView.showSyncNotification(title, content, drawableId);
				int removalDelay = (failed ? 10000 : 5000); // ms
				Services.Device.postOnUiThreadDelayed(() -> mView.hideSyncNotification(), removalDelay);
			} else {
				mView.hideSyncNotification();
			}
		}
	};

	private FileDownloader.FileDownloaderListener mDownloaderListener = new FileDownloader.FileDownloaderListener() {

		@Override
		public void onDownloadProgressUpdate(int progressPercentage) {

		}

		@Override
		public void onDownloadSuccessful(Uri fileUri, String fileName) {
			if (Build.VERSION.SDK_INT < 24) {
				File tempDir = new File(MyApplication.getAppContext().getExternalCacheDir(), "temp");
				try {
					File file = FileUtils2.copyDataToFile(MyApplication.getAppContext(), fileUri, tempDir);
					fileUri = Uri.fromFile(file);
				} catch (IOException e) {
					mView.showUpdateError();
				}
			}
			mView.launchApkInstaller(fileUri);
			mView.closeStartupScreen();
		}

		@Override
		public void onDownloadFailed() {
			mView.showUpdateError();
			mView.closeStartupScreen();
		}
	};
}
