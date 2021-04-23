package com.artech.application;

import android.app.Activity;
import android.app.Application;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ActivityInfo;
import android.content.res.Configuration;
import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.WorkerThread;

import com.artech.actions.UIContext;
import com.artech.activities.AppLinksIntentHandler;
import com.artech.activities.IntentHandlers;
import com.artech.adapters.AdaptersHelper;
import com.artech.android.device.IGeoLocationHelper;
import com.artech.base.metadata.ApplicationDefinition;
import com.artech.base.metadata.AttributeDefinition;
import com.artech.base.metadata.DomainDefinition;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.GxObjectDefinition;
import com.artech.base.metadata.IDataSourceDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.ProcedureDefinition;
import com.artech.base.metadata.StructureDataType;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.settings.WorkWithSettings;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.model.Entity;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.services.ClientStorage;
import com.artech.base.services.ForegroundListener;
import com.artech.base.services.IApplication;
import com.artech.base.services.Services;
import com.artech.base.utils.NameMap;
import com.artech.base.utils.PlatformHelper;
import com.artech.base.utils.Strings;
import com.artech.common.ServicesImpl;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.fragments.IDataView;
import com.artech.framework.GenexusModule;
import com.artech.layers.ApplicationServers;
import com.artech.providers.DatabaseStorage;
import com.artech.providers.EntityDataProvider;
import com.artech.services.EntityService;
import com.artech.usercontrols.TableLayoutFactory;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;
import com.fedorvlasov.lazylist.ImageLoader;
import com.genexus.specific.android.Connect;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.concurrent.atomic.AtomicInteger;

public abstract class MyApplication extends Application	implements IApplication
{
	private static GenexusApplication sCurrentApplication;
	private static MyApplication sInstance;

	private static final ApplicationServers SERVERS = new ApplicationServers();

	private static final NameMap<Class<? extends Service>> SERVICE_CLASSES = new NameMap<>();

	private boolean mInitialized;
	private Set<GenexusModule> mModules = new HashSet<>();

	private boolean mIsLiveEditingModeEnabled = false;
	private String mAppsLinksProtocol = Strings.EMPTY;

	private ExternalApiFactory mExternalApiFactory;
	private TableLayoutFactory mTableLayoutFactory;

	private final List<MetadataLoadingListener> mMetadataLoadListeners = new ArrayList<>();
	private final List<ComponentEventsListener> mComponentEventsListeners = new ArrayList<>();

	// helper for geolocation methods from core module
	private IGeoLocationHelper mGeoLocationHelper = null;

	// configurarion status
	private Configuration mPrevConfig;

	/**
	 * Don't inject the application using a static method. Pass it via the constructor of the class
	 * that requires it.
	 */
	@Deprecated
	public static MyApplication getInstance()
	{
		return sInstance;
	}

	public static Context getAppContext()
	{
		return MyApplication.getInstance().getApplicationContext();
	}

	public static IApplicationServer getApplicationServer(Connectivity connectivity)
	{
		return SERVERS.getApplicationServer(connectivity);
	}

	public static GenexusApplication getApp()
	{
		return sCurrentApplication;
	}

	@NonNull
	private static ApplicationDefinition getAppDefinition()
	{
		if (sCurrentApplication != null)
			return sCurrentApplication.getDefinition();

		throw new IllegalStateException("sCurrentApplication is null. This is too soon to call this method!");
	}

	@Override
	public ApplicationDefinition getDefinition()
	{
		return getAppDefinition();
	}

	public static void setApp(GenexusApplication app)
	{
		sCurrentApplication = app;

		// Clear any static data that points to old application.
		PlatformHelper.reset();
	}

	@Override
	public boolean isLoaded()
	{
		return (sCurrentApplication != null &&
				sCurrentApplication.getDefinition() != null &&
				sCurrentApplication.getDefinition().isLoaded());
	}

	@Override
	public void onCreate()
	{
		super.onCreate();

		sInstance = this;

		registerActivityLifecycleCallbacks(mActivityLifecycleCallbacks);

		ServicesImpl.connectServices(this, sCurrentApplication);
		connectUserControls();
		// create external apis factory
		mExternalApiFactory = new ExternalApiFactory();
		connectIntentHandlers();
		initializeExtensibility(); // before connectModules()
		connectModules();

		// init Std Classes, connect service for use Std classes from Android app
		Connect.init();

		//DebugService.onCreate(this);
		Services.Language.onApplicationCreate(this);

		mPrevConfig = new Configuration(getResources().getConfiguration());

		if ((mPrevConfig.uiMode & Configuration.UI_MODE_NIGHT_YES) != 0)
			Services.Themes.setDarkMode(true);
	}

	protected void registerModule(GenexusModule module)
	{
		if (mInitialized)
			throw new IllegalStateException("Cannot register new modules at this point -- initialization has already been completed.");

		if (mModules.contains(module))
			throw new IllegalArgumentException(String.format("Module '%s' has already been registered.", module.getClass()));

		mModules.add(module);
	}

	private void connectModules()
	{
		for (GenexusModule module : mModules)
			module.initialize(this);

		mInitialized = true;
	}

	private void connectIntentHandlers()
	{
		IntentHandlers.addHandler(new AppLinksIntentHandler());
	}

	private void initializeExtensibility()
	{
		mTableLayoutFactory = new TableLayoutFactory();
	}

	@Override
	public void onConfigurationChanged(Configuration newConfig)
	{
		//DebugService.onConfigurationChanged(newConfig);
		//LocaleHelper.onConfigurationChanged(newConfig);
		super.onConfigurationChanged(newConfig);

		// app config change
		Services.Log.debug("App on onConfigurationChanged");
		int diff = newConfig.diff(mPrevConfig);

		boolean changeSizeOnly = false;
		if(((diff & ActivityInfo.CONFIG_SCREEN_SIZE) != 0)) {
			Services.Log.debug("Screen size has been changed.");
			changeSizeOnly = true;
		}

		if(((diff & ActivityInfo.CONFIG_ORIENTATION) != 0)	) {
			Services.Log.debug("Orientation has been changed.");
			changeSizeOnly = false;
		}

		if(((diff & ActivityInfo.CONFIG_LOCALE) != 0)) {
			Services.Log.debug("Locale has been changed.");
		}

		Services.Themes.setDarkMode((newConfig.uiMode & Configuration.UI_MODE_NIGHT_YES) != 0);

		// other configuration change checking goes here

		// if windows size change , clear windows size cache.
		if (changeSizeOnly)
			AdaptersHelper.clearCacheWindowSizes();

		mPrevConfig = new Configuration(newConfig);
	}

	@Override
	public boolean handleIntent(UIContext ctx, Intent intent, Entity data)
	{
		return IntentHandlers.tryHandleIntent(ctx, intent, data);
	}

	private void connectUserControls()
	{
		// Load Default Controls
		UserControlDefinition [] definitions = { new UserControlDefinition("Check Box", com.artech.controls.GxCheckBox.class),
												 new UserControlDefinition("Dynamic Combo Box", com.artech.controls.DynamicSpinnerControl.class),
												 new UserControlDefinition("SDGeoLocation", com.artech.controls.GxSDGeoLocation.class),
												 new UserControlDefinition("SDAdsView", com.artech.controls.ads.SDAdsViewControl.class),
												 new UserControlDefinition("SearchBox", com.artech.controls.SearchBox.class),
												 new UserControlDefinition("SD Maps", com.artech.controls.maps.MapViewWrapper.class)
												};

		for (UserControlDefinition definition : definitions)
			UcFactory.addControl(definition);
	}

	@Override
	public void registerOnMetadataLoadFinished(MetadataLoadingListener listener) {
		mMetadataLoadListeners.add(listener);
	}

	@Override
	public void unregisterOnMetadataLoadFinished(MetadataLoadingListener listener) {
		mMetadataLoadListeners.remove(listener);
	}

	@Override
	public void notifyMetadataLoadFinished() {
		for (MyApplication.MetadataLoadingListener listener : new ArrayList<>(mMetadataLoadListeners))
			listener.onMetadataLoadFinished(this);
	}

	@Override
	public void registerComponentEventsListener(ComponentEventsListener listener) {
		mComponentEventsListeners.add(listener);
	}

	@Override
	public void unregisterComponentEventsListener(ComponentEventsListener listener) {
		mComponentEventsListeners.remove(listener);
	}

	@Override
	public void notifyComponentInitialized(IDataView component) {
		for (ComponentEventsListener listener : new ArrayList<>(mComponentEventsListeners))
			listener.onComponentInitialized(component);
	}

	@Override
	public ExternalApiFactory getExternalApiFactory() {
		return mExternalApiFactory;
	}

	@Override
	public TableLayoutFactory getTableLayoutFactory() { return mTableLayoutFactory; }

	@WorkerThread
	@Override
	public void clearData() {
		// Initialize DB offline storage.
		DatabaseStorage.initialize(this, sCurrentApplication.getDefinition().getCacheDatabase());

		// If language changes, clear stored data, since it may have translations.
		Services.Language.clearCacheOnLanguageChange();

		// Make sure that the cache has not grown too much.
		ImageLoader.trimCacheSize();
	}

	public IGeoLocationHelper getGeoLocationHelper() { return mGeoLocationHelper; }

	public void setGeoLocationHelper(IGeoLocationHelper value) { mGeoLocationHelper = value;; }

	public void clearCacheOnLanguageChange()
	{
		final String APP_LANGUAGE = "ApplicationLanguage";

		String lastLanguage = Services.Preferences.getString(APP_LANGUAGE);
		String currentLanguage = Services.Language.getCurrentLanguage();

		if (lastLanguage == null || !lastLanguage.equalsIgnoreCase(currentLanguage))
			EntityDataProvider.clearAllCaches();

		Services.Preferences.setString(APP_LANGUAGE, currentLanguage);
	}

	public abstract Class<? extends EntityService> getEntityServiceClass();

	public static void registerServiceClass(String key, Class<? extends Service> serviceClass)
	{
		SERVICE_CLASSES.put(key, serviceClass);
	}

	public static Class<? extends Service> getServiceClass(String key)
	{
		return SERVICE_CLASSES.get(key);
	}

	public abstract EntityDataProvider getProvider();


	@Override
	public IViewDefinition getView(String name)
	{
		return getAppDefinition().getView(name);
	}

	@Override
	public IDataViewDefinition getDataView(String name)
	{
		return getAppDefinition().getDataView(name);
	}

	@Override
	public IDataSourceDefinition getDataSource(String dpName)
	{
		return getAppDefinition().getDataSource(dpName);
	}

	@NonNull
	@Override
	public ClientStorage getClientStorage(@NonNull String name)
	{
		SharedPreferences preferences = Services.Preferences.getAppSharedPreferences(name);
		return new ClientStorageImpl(this, preferences);
	}

	@Override
	public StructureDefinition getBusinessComponent(String name)
	{
		return getAppDefinition().getBusinessComponent(name);
	}

	@Override
	public void putBusinessComponent(StructureDefinition bc)
	{
		getAppDefinition().putBusinessComponent(bc);
	}

	public boolean hasBusinessComponents()
	{
		return getAppDefinition().hasBusinessComponents();
	}

	@Override
	public WorkWithSettings getPatternSettings()
	{
		if (sCurrentApplication != null && sCurrentApplication.getDefinition() != null)
			return sCurrentApplication.getDefinition().getSettings();

		Services.Log.error("getPatternSettings sCurrentApplication null");
		return null;
	}

	@Override
	public void setPatternSettings(WorkWithSettings settings)
	{
		getAppDefinition().putSettings(settings);
	}

	@Override
	public void putPattern(IPatternMetadata pattern, MetadataLoader loader, String filename)
	{
		getAppDefinition().putObject(pattern, loader, filename);
	}

	@Override
	public DomainDefinition getDomain(String name)
	{
		return getAppDefinition().getDomain(name);
	}

	@Override
	public void putDomain(DomainDefinition domain)
	{
		getAppDefinition().putDomain(domain);
	}

	@Override
	public String getDeepLink(String link)
	{
		return getAppDefinition().getDeepLink(link);
	}

	@Override
	public void putDeepLink(String link, String panel)
	{
		getAppDefinition().putDeepLink(link, panel);
	}

	@Override
	public GxObjectDefinition getGxObject(String name)
	{
		return getAppDefinition().getGxObject(GxObjectDefinition.class, name);
	}

	@Override
	public ProcedureDefinition getProcedure(String name)
	{
		return getAppDefinition().getGxObject(ProcedureDefinition.class, name);
	}

	@Override
	public void putGxObject(GxObjectDefinition gxObject)
	{
		getAppDefinition().putGxObject(gxObject);
	}

	@Override
	public AttributeDefinition getAttribute(String name)
	{
		return getAppDefinition().getAttribute(name);
	}

	@Override
	public void putAttribute(AttributeDefinition attribute)
	{
		getAppDefinition().putAttribute(attribute);
	}

	@Override
	public ThemeDefinition getTheme(String name)
	{
		return getAppDefinition().getTheme(name);
	}

	@Override
	public void putTheme(ThemeDefinition theme)
	{
		getAppDefinition().putTheme(theme);
	}

	@Override
	public void putSDT(StructureDataType sdt)
	{
		getAppDefinition().putSDT(sdt);
	}

	@Override
	public StructureDataType getSDT(String name)
	{
		return getAppDefinition().getSDT(name);
	}

	@Override
	public IPatternMetadata getPattern(String name)
	{
		return getAppDefinition().getObject(name);
	}

	@Override
	public WorkWithDefinition getWorkWithForBC(String bcName)
	{
		return getAppDefinition().getWorkWithForBC(bcName);
	}

	public void setAppsLinksProtocol(String value) {
		mAppsLinksProtocol = value;
	}

	@Override
	public String getAppsLinksProtocol() {
		return mAppsLinksProtocol;
	}

	@Override
	public boolean isForeground()
	{
		return mActivityCounter.get() > 0;
	}

	@Override
	public void addForegroundListener(ForegroundListener listener)
	{
		mForegroundListeners.add(listener);
	}

	@Override
	public void removeForegroundListener(ForegroundListener listener)
	{
		mForegroundListeners.remove(listener);
	}

	private final AtomicInteger mActivityCounter = new AtomicInteger(0);
	private final HashSet<ForegroundListener> mForegroundListeners = new HashSet<>();

	private final ActivityLifecycleCallbacks mActivityLifecycleCallbacks = new ActivityLifecycleCallbacks()
	{
		@Override
		public void onActivityCreated(Activity activity, Bundle savedInstanceState) { }

		@Override
		public void onActivityStarted(Activity activity)
		{
			// Tracked in start/stop instead of resume/pause because start/stop do overlap
			// when an activity starts another one.
			int counter = mActivityCounter.incrementAndGet();
			if (counter == 1)
			{
				for (ForegroundListener listener : mForegroundListeners)
					listener.onBecameForeground(activity);
			}
		}

		@Override
		public void onActivityResumed(Activity activity) { }

		@Override
		public void onActivityPaused(Activity activity) { }

		@Override
		public void onActivityStopped(Activity activity)
		{
			int counter = mActivityCounter.decrementAndGet();
			if (counter < 0)
				throw new IllegalStateException("Internal error in activity count tracking. Counter is less than zero!");

			if (counter == 0)
			{
				for (ForegroundListener listener : mForegroundListeners)
					listener.onBecameBackground(activity);
			}
		}

		@Override
		public void onActivitySaveInstanceState(Activity activity, Bundle outState) { }

		@Override
		public void onActivityDestroyed(Activity activity) { }
	};

	@Override
	public boolean isLiveEditingEnabled() {
		return mIsLiveEditingModeEnabled;
	}

	@Override
	public void enableLiveEditingMode() {
		mIsLiveEditingModeEnabled = true;
	}
}
