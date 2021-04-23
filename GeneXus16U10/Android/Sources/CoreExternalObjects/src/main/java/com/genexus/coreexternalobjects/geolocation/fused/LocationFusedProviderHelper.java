package com.genexus.coreexternalobjects.geolocation.fused;

import java.util.ArrayList;

import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.location.Location;
import android.os.Bundle;
import android.os.IBinder;

import com.artech.base.services.Services;
import com.genexus.coreexternalobjects.geolocation.geofence.GeofenceTransitionsIntentService;
import com.genexus.coreexternalobjects.geolocation.tracking.LocationUpdatesService;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.GoogleApiClient.ConnectionCallbacks;
import com.google.android.gms.common.api.GoogleApiClient.OnConnectionFailedListener;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.location.Geofence;
import com.google.android.gms.location.GeofencingRequest;
import com.google.android.gms.location.LocationListener;
import com.google.android.gms.location.LocationRequest;
import com.google.android.gms.location.LocationServices;

public class LocationFusedProviderHelper implements ConnectionCallbacks, OnConnectionFailedListener, ResultCallback<Status>
{
	private final Context mAppContext;
	private GoogleApiClient  mGoogleApiClient;
	private LocationRequest mLocationRequest;
	
	private int mMinAccuracyRequest = 0;
	private int mMinTimeRequest = 0;
	private int mMinDistanceRequest = 0;
	private boolean mUseForegroundService = false;


	private LocationListener mLocationListener;
	private boolean mRequestLocationUpdatesPending = false;
	private boolean mIsBackgroundRequest = false;

	private boolean mGeoFenceLocationPending = false;
	private ArrayList<Geofence> mGeofenceList = new ArrayList();

	// A reference to the service used to get location updates.
	private LocationUpdatesService mService = null;

	public LocationFusedProviderHelper(Context context)
	{
		mAppContext = context;
		/**
			* LocationClient(arg1, arg2 , arg3)
			* arg1 :Context
			* arg2 : ConnectionCallbacks
			* arg3 :OnConnectionFailedListener
		**/
		init();
	}
	
	public void init()
	{
		buildGoogleApiClient();
		//mLocationClient = new LocationClient(MyApplication.getAppContext(), this , this);
		//mLocationClient.connect();
		
		/**
		 * Note: connect() method will take some time. So for getting the
		 * current location or getting location update at particular interval,
		 * we have to wait for the connection established.
		**/
		mGoogleApiClient.connect();
	}
	
	private synchronized void buildGoogleApiClient()
	{
	    mGoogleApiClient = new GoogleApiClient.Builder(mAppContext)
	        .addConnectionCallbacks(this)
	        .addOnConnectionFailedListener(this)
	        .addApi(LocationServices.API)
	        .build();
	}

	public boolean isLocationClientConnected()
	{
		if (mGoogleApiClient!=null)
			return mGoogleApiClient.isConnected();
		return false;
	}
	
	public void disconnectLocationClient()
	{
		if (mGoogleApiClient!=null)
			mGoogleApiClient.disconnect();
	}

	@SuppressWarnings("deprecation")
	public Location getLastLocation()
	{
		if (mGoogleApiClient!=null)
		{
			if (mGoogleApiClient.isConnected())
				return LocationServices.FusedLocationApi.getLastLocation(mGoogleApiClient);
			else
				Services.Log.warning("Fused getLastLocation, not connected.");
		}
		return null;
	}
	
	
	// request location update for getmylocation, with default accuracy (for compatibility)
	@SuppressWarnings("deprecation")
	public void requestLocationUpdates(LocationListener listener, int minDistance)
	{
		// for compatibility use location request with high accuracy by default.
		initLocationRequest(1000, minDistance, 20);
		
		if (mGoogleApiClient!=null)
		{
			if (mGoogleApiClient.isConnected())
			{
				LocationServices.FusedLocationApi.requestLocationUpdates(mGoogleApiClient, mLocationRequest, listener);
			}
			else
			{
				Services.Log.warning("Fused requestLocationUpdates, not connected.");
				storeParameters(1000, minDistance, 20, false);
				mIsBackgroundRequest = false;
				mLocationListener = listener;
				mRequestLocationUpdatesPending = true;
			}
		}
	}

	public void requestLocationUpdatesBackground(int minTime, int minDistance, int trackingAccuracy, boolean useForegroundService)
	{
		initLocationRequest(minTime, minDistance, trackingAccuracy);
		
		if (mGoogleApiClient!=null)
		{
			if (mGoogleApiClient.isConnected())
			{
				//request location update in background
				requestLocationUpdateBackgroundToReceiver(useForegroundService);
			}
			else
			{
				Services.Log.warning("Fused requestLocationUpdatesBackground, not connected.");
				mIsBackgroundRequest = true;
				storeParameters(minTime, minDistance, trackingAccuracy, useForegroundService);
				mRequestLocationUpdatesPending = true;
			}
		}
	}

	@SuppressWarnings("deprecation")
	private void requestLocationUpdateBackgroundToReceiver(boolean useForegroundService)
	{
		// request location update in Background.
		// if parameters do so, use a Foregound service to get the update more accurate.
		if (useForegroundService){
			// Bind to the service. If the service is in foreground mode, this signals to the service
			// that since this activity is in the foreground, the service can exit foreground mode.
			mAppContext.bindService(new Intent(mAppContext, LocationUpdatesService.class), mServiceConnection,
					Context.BIND_AUTO_CREATE);
		}
		else { // use LocationFusedProviderReceiver
			PendingIntent locationIntent = getLocationPendingIntent();
			LocationServices.FusedLocationApi.requestLocationUpdates(mGoogleApiClient, mLocationRequest, locationIntent);
		}
	}

	private PendingIntent getLocationPendingIntent() 
	{
		//request location update in background
		// from : https://codelabs.developers.google.com/codelabs/background-location-updates-android-o/
		// use a Broadcast Receiver with FLAG_UPDATE_CURRENT
		Intent intent = new Intent(mAppContext, LocationFusedProviderReceiver.class);
		return PendingIntent.getBroadcast(mAppContext, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT);

	}


	private void storeParameters(int minTime, int minDistance, int minAccuracy, boolean useForegroundService)
	{
		mMinTimeRequest = minTime;
		mMinDistanceRequest = minDistance;
		mMinAccuracyRequest = minAccuracy;
		mUseForegroundService = useForegroundService;
	}
	
	
	private void initLocationRequest(long updateInteval, int minDistance , int minAccuracy) 
	{
		// Create a new global location parameters object
		mLocationRequest = LocationRequest.create();
				 
		//Set the update interval, only override when use tracking., if not update each 1 seconds
		mLocationRequest.setInterval(updateInteval);
		mLocationRequest.setFastestInterval(updateInteval);
				
		if (minDistance>0)
			mLocationRequest.setSmallestDisplacement(minDistance);
		
		// from http://www.intelligrape.com/blog/googles-fused-location-api-for-android/
		// and https://developer.android.com/training/location/receive-location-updates.html
		Services.Log.info("initLocationRequest minAccuracy: " + minAccuracy);
		if (minAccuracy<= 0)
			mLocationRequest.setPriority(LocationRequest.PRIORITY_LOW_POWER);
		else if (minAccuracy<= 20)
			// 	Use high accuracy
			mLocationRequest.setPriority(LocationRequest.PRIORITY_HIGH_ACCURACY);
		else if (minAccuracy<= 100)
			mLocationRequest.setPriority(LocationRequest.PRIORITY_BALANCED_POWER_ACCURACY);
		else 
			mLocationRequest.setPriority(LocationRequest.PRIORITY_LOW_POWER);
		
		//  includeHeadingAndSpeed ?
	}

	@SuppressWarnings("deprecation")
	public void removeLocationUpdates(LocationListener listener)
	{
		if (mGoogleApiClient!=null)
		{
			if (mGoogleApiClient.isConnected())
			{

				PendingIntent locationIntent = getLocationPendingIntent();
				LocationServices.FusedLocationApi.removeLocationUpdates(mGoogleApiClient, locationIntent);

				LocationServices.FusedLocationApi.removeLocationUpdates(mGoogleApiClient, listener);
				Services.Log.debug("Fused removeLocationUpdates, connected.");

			}
			else
			{
				Services.Log.warning("Fused removeLocationUpdates, not connected.");
				mRequestLocationUpdatesPending = false;
			}
		}
		// remove location update from foreground services also
		if (mService!=null)
		{
			mService.removeLocationUpdates();
		}
	}

	@Override
	@SuppressWarnings("deprecation")
	public void onConnected(Bundle arg0)
	{
		Services.Log.debug("GooglePlayServicesClient onConnected!!!");
		
		if (mRequestLocationUpdatesPending)
		{
			if (mGoogleApiClient!=null)
			{
				Services.Log.debug("Fused requestLocationUpdates, after connected.");
				initLocationRequest(mMinTimeRequest, mMinDistanceRequest, mMinAccuracyRequest);
				if (mIsBackgroundRequest)
				{
					//request location update in background
					requestLocationUpdateBackgroundToReceiver(mUseForegroundService);
				}
				else
				{
					LocationServices.FusedLocationApi.requestLocationUpdates(mGoogleApiClient, mLocationRequest, mLocationListener);
				}
			}
		}
		mRequestLocationUpdatesPending = false;
		if (mGeoFenceLocationPending)
		{
			if (mGoogleApiClient!=null)
			{
				Services.Log.warning( "Fused , after connected, addGeofencesToCheck");
				addGeofencesToCheck(mAppContext);
			}
		}
		mGeoFenceLocationPending = false;
	}

	@Override
	public void onConnectionFailed(ConnectionResult arg0) 
	{
		Services.Log.debug("GooglePlayServicesClient onConnectionFailed");
	}

	@Override
	public void onConnectionSuspended(int arg0) 
	{
		Services.Log.debug("GooglePlayServicesClient onConnectionSuspended");
		
	}

	//Geofence helpers.
	public void createGeoFence(int geofenceId, Location geolocation, int radius, long expirationMiliSeconds)
	{
		mGeofenceList.add(new Geofence.Builder()
				// Set the request ID of the geofence. This is a string to identify this
				// geofence.
				.setRequestId(String.valueOf(geofenceId))

				.setCircularRegion(
						geolocation.getLatitude(),
						geolocation.getLongitude(),
						radius
				)

				.setExpirationDuration(expirationMiliSeconds)
				.setTransitionTypes(Geofence.GEOFENCE_TRANSITION_ENTER |
						Geofence.GEOFENCE_TRANSITION_EXIT)
				.build());
	}

	private GeofencingRequest getGeofencingRequest()
	{
		GeofencingRequest.Builder builder = new GeofencingRequest.Builder();
		builder.setInitialTrigger(GeofencingRequest.INITIAL_TRIGGER_ENTER);
		builder.addGeofences(mGeofenceList);
		return builder.build();
	}

	//private PendingIntent mGeofencePendingIntent;

	private PendingIntent getGeofencePendingIntent(Context context) {
		// Reuse the PendingIntent if we already have it.
		//if (mGeofencePendingIntent != null) {
		//	return mGeofencePendingIntent;
		//}
		Intent intent = new Intent(context, GeofenceTransitionsIntentService.class);
		// We use FLAG_UPDATE_CURRENT so that we get the same pending intent back when
		// calling addGeofences() and removeGeofences().
		return PendingIntent.getService(context, 0, intent, PendingIntent.
				FLAG_UPDATE_CURRENT);
	}

	@SuppressWarnings("deprecation")
	public void addGeofencesToCheck(Context context)
	{
		if (!mGoogleApiClient.isConnected()) {
			Services.Log.warning( "not_connected googleapi addGeofencesToCheck");
			mGeoFenceLocationPending = true;
			return;
		}
		try {
			LocationServices.GeofencingApi.addGeofences(
					mGoogleApiClient,
					// The GeofenceRequest object.
					getGeofencingRequest(),
					// A pending intent that that is reused when calling removeGeofences(). This
					// pending intent is used to generate an intent when a matched geofence
					// transition is observed.
					getGeofencePendingIntent(context)
			).setResultCallback(this); // Result processed in onResult().
			mGeoFenceLocationPending = false;
			mGeofenceList = new ArrayList();
		} catch (SecurityException securityException) {
			// Catch exception generated if the app does not use ACCESS_FINE_LOCATION permission.
			Services.Log.error(securityException);
		}
	}

	@SuppressWarnings("deprecation")
	public void removeGeofencesToCheck(Context context)
	{
		try {
			LocationServices.GeofencingApi.removeGeofences(
				mGoogleApiClient,
				// This is the same pending intent that was used in addGeofences().
				getGeofencePendingIntent(context)
			).setResultCallback(this); // Result processed in onResult().
		} catch (SecurityException securityException) {
			// Catch exception generated if the app does not use ACCESS_FINE_LOCATION permission.
			Services.Log.error(securityException);
		}
	}
	@Override
	public void onResult(Status status)
	{
		if (status.isSuccess()) {
			Services.Log.info("geofences_change success ");
		} else {
			Services.Log.info("geofences_change error code " + status.getStatusCode());
		}
	}

	// START Foreground Service helpers
	// Monitors the state of the connection to the service.
	private final ServiceConnection mServiceConnection = new ServiceConnection() {

		@Override
		public void onServiceConnected(ComponentName name, IBinder service) {
			LocationUpdatesService.LocalBinder binder = (LocationUpdatesService.LocalBinder) service;
			mService = binder.getService();

			// pass to services locationupdate parameters.
			mService.setLocationRequest(mLocationRequest);
			// request location update using new ForeGroundService.
			mService.requestLocationUpdates();

			// always use this service unbound to activity
			// Unbind from the service. This signals to the service that this activity is no longer
			// in the foreground, and the service can respond by promoting itself to a foreground
			// service.
			mAppContext.unbindService(mServiceConnection);
		}

		@Override
		public void onServiceDisconnected(ComponentName name) {
			mService = null;
		}

	};
	// END Foreground Service helpers

}
