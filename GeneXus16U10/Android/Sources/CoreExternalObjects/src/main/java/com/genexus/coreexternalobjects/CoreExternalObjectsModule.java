package com.genexus.coreexternalobjects;

import android.app.Application;
import android.content.Context;
import android.content.IntentFilter;
import android.net.ConnectivityManager;
import android.net.NetworkRequest;
import android.os.Build;

import androidx.annotation.RequiresApi;

import com.artech.application.MyApplication;
import com.artech.base.services.IApplication;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;
import com.genexus.coreexternalobjects.geolocation.LocationActionsHelper;
import com.genexus.coreexternalobjects.geolocation.LocationHelper;
import com.genexus.coreexternalobjects.network.NetworkBroadcastReceiver;
import com.genexus.coreexternalobjects.network.NetworkCallback;

public class CoreExternalObjectsModule implements GenexusModule, IApplication.MetadataLoadingListener {

	@SuppressWarnings("deprecation")
	@Override
	public void initialize(Context context) {
		ExternalApiFactory.addApi(new ExternalApiDefinition(ActionsAPI.OBJECT_NAME, ActionsAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(AnalyticsAPI.OBJECT_NAME, AnalyticsAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(AppLifecycleAPI.OBJECT_NAME, AppLifecycleAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(CalendarAPI.OBJECT_NAME, CalendarAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(CameraAPI.OBJECT_NAME, CameraAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(ClientInformationAPI.OBJECT_NAME, ClientInformationAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(ClientStorageAPI.OBJECT_NAME, ClientStorageAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(ClipboardAPI.OBJECT_NAME, ClipboardAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(ContactsAPI.OBJECT_NAME, ContactsAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(GAMUserAPI.OBJECT_NAME, GAMUserAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(GAMApplicationAPI.OBJECT_NAME, GAMApplicationAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(HttpClientAPI.OBJECT_NAME, HttpClientAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(InteropAPI.OBJECT_NAME, InteropAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(LogAPI.OBJECT_NAME, LogAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(NavigationAPI.OBJECT_NAME, NavigationAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(NetworkAPI.OBJECT_NAME, NetworkAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(PhotoLibraryAPI.OBJECT_NAME, PhotoLibraryAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(RuntimeAPI.OBJECT_NAME, RuntimeAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(ShareAPI.OBJECT_NAME, ShareAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(SynchronizationEventsAPI.OBJECT_NAME, SynchronizationEventsAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(DataBaseAPI.OBJECT_NAME, DataBaseAPI.class));

		ExternalApiFactory.addApi(new ExternalApiDefinition(LocalNotificationsAPI.OBJECT_NAME, LocalNotificationsAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(ProgressIndicatorAPI.OBJECT_NAME, ProgressIndicatorAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(GeoLocationAPI.OBJECT_NAME, GeoLocationAPI.class));
		ExternalApiFactory.addApi(new ExternalApiDefinition(MapsAPI.OBJECT_NAME, MapsAPI.class));

		// init GeoLocation Helper
		LocationHelper locationHelper = new LocationHelper(context);
		MyApplication.getInstance().setGeoLocationHelper(locationHelper);
		locationHelper.addOnLocationChangeListener(LocationActionsHelper.sOnLocationChangeListener);

		IApplication application = (IApplication) context;
		application.registerOnMetadataLoadFinished(this);
	}

	@Override
	public void onMetadataLoadFinished(IApplication application) {
		Application appContext = (Application) application;

		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
			registerBroadcastReceiver(appContext);
			return;
		}

		try {
			registerNetworkCallback(appContext);
		} catch (SecurityException e) {
			Services.Log.info("We're in the case of the Android 6.0.0 bug in which is not" +
				"being granted automatically for an app that declares it in the AndroidManifest.xml" +
				"as it happens in 6.0.1+. Using the fallback method...");
			registerBroadcastReceiver(appContext);
		}
	}

	@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
	private void registerNetworkCallback(Context context) {
		ConnectivityManager connectivityManager = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
		connectivityManager.requestNetwork(new NetworkRequest.Builder().build(), new NetworkCallback(context, connectivityManager));
	}

	@SuppressWarnings("deprecation")
	private void registerBroadcastReceiver(Context context) {
		IntentFilter intentFilter = new IntentFilter(ConnectivityManager.CONNECTIVITY_ACTION);
		context.registerReceiver(new NetworkBroadcastReceiver(), intentFilter);
	}
}
