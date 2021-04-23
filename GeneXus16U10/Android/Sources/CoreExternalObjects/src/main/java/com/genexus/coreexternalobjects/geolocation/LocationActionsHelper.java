package com.genexus.coreexternalobjects.geolocation;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.content.Context;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationManager;

import com.artech.activities.ActivityHelper;
import com.artech.activities.GenexusActivity;
import com.artech.android.device.IGeoLocationHelper;
import com.artech.application.MyApplication;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.genexus.coreexternalobjects.GeoLocationAPI;
import com.genexus.coreexternalobjects.SDActionsHelper;
import com.genexus.coreexternalobjects.geolocation.db.TrackingLocation;
import com.genexus.coreexternalobjects.geolocation.db.TrackingSQLiteHelper;
import com.genexus.coreexternalobjects.geolocation.tracking.TrackingData;

public class LocationActionsHelper
{
	private static TrackingSQLiteHelper dbTracking = TrackingSQLiteHelper.getInstance(MyApplication.getAppContext());

	@SuppressWarnings("deprecation")
	private static android.app.ProgressDialog sProgressDialog = null;
	private static Activity myActivity = null;

	public static boolean sIsTracking = false;
	private static Integer sMinTime = 0;
	private static Integer sMinDistance = 0;
	private static String sAction = "";
	private static Integer sActionInterval = 0;
	private static Date sLastLocationActionTime = new Date();
	private static Integer sTrackingAccuracy = 20; //default for compatibility
	private static boolean sUseForegroundService = false;
	private	static boolean sIncludeHeadingAndSpeed;

	//Geolocation API, use Google Play Services API when possible
	@SuppressWarnings("deprecation")
	public static JSONObject getMyLocation(Activity activity, List<String> values, boolean showMessages)
	{
		myActivity = activity;

		// read parameters
		int minAccuracy = readInteger(values, 0, 0);
		int timeout = readInteger(values, 1, 0);
		sIncludeHeadingAndSpeed = readBoolean(values, 2);
		boolean ignoreErrors = readBoolean(values, 3);

		//create a FusedLocationHelper if not created already
		MyApplication.getInstance().getGeoLocationHelper().createFusedLocationHelper();

		if (!ignoreErrors)
		{
			// if location service are disabled return null, and composite block not continue.
			Object locationServiceEnabled = isLocationServiceEnabled();
			boolean locationServiceEnabledboolean = Boolean.valueOf(locationServiceEnabled.toString());
			if (!locationServiceEnabledboolean)
			{
				// show message with error, only a toast.
				if (myActivity != null && showMessages)
					SDActionsHelper.showMessage(null, myActivity, Services.Strings.getResource(com.artech.R.string.GXM_LocationServicesAreDisabled), true, null);

				return null;
			}
		}
		// don't request updates if already in tracking
		if (myActivity!=null && !sIsTracking)
		{
			if (showMessages)
				myActivity.runOnUiThread(requestLocationUpdatesinUI);
			else
				myActivity.runOnUiThread(requestLocationUpdatesinUINoDialog);
		}

		JSONObject location = MyApplication.getInstance().getGeoLocationHelper().getLocationJsonGeoLocationInfo(minAccuracy, timeout, sIncludeHeadingAndSpeed);

		// dont cancel request updates if already in tracking, would cancel it.
		if (myActivity != null && !sIsTracking)
			myActivity.runOnUiThread(removeLocationUpdatesinUI);

		// return value is set to Empty and execution of the composite block continues without error.
		if (location == null && ignoreErrors)
			location = new JSONObject();

		Services.Log.info("getMyLocation", "End return location.");
		return location;
	}

	private static Runnable requestLocationUpdatesinUI = new Runnable(){
		@Override
		public void run(){
			requestLocationUpdates(true, false) ;
		}
	};

	private static Runnable requestLocationUpdatesinUINoDialog = new Runnable(){
		@Override
		public void run(){
			requestLocationUpdates(false, false) ;
		}
	};

	private static Runnable requestLocationUpdatesinUIForTracking = new Runnable(){
		@Override
		public void run(){
			requestLocationUpdates(false, true) ;
		}
	};

	@SuppressWarnings("deprecation")
	private static void requestLocationUpdates(boolean showdialog, boolean applyTrakingParameters) {

		if (showdialog)
		{
			//wait for location
			sProgressDialog = new android.app.ProgressDialog(myActivity);
			//sProgressDialog.setTitle(Strings.EMPTY);
			sProgressDialog.setMessage(myActivity.getResources().getText(com.artech.R.string.GXM_WaitingForLocation));
			// show only if possible
			if (myActivity instanceof GenexusActivity)
			{
				GenexusActivity gxActivity = (GenexusActivity) myActivity;
				// only show if activity is "active". fix crash with slide.start and app update
				if (gxActivity.isActive())
					sProgressDialog.show();
			}
			else
			{
				sProgressDialog.show();
			}
		}

		//request location update
		if (applyTrakingParameters)
		{
			if (LocationHelper.sFusedLocationHelper !=null) {
				Services.Log.info("requestLocationUpdates", "using FusedLocationHelper for tracking.");
				sLastLocationActionTime = new Date();
				TrackingData.setTrackingData(sIsTracking, sLastLocationActionTime, sAction, sActionInterval);
				LocationHelper.sFusedLocationHelper.requestLocationUpdatesBackground(sMinTime, sMinDistance, sTrackingAccuracy, sUseForegroundService);
			}
			else {
				Services.Log.info("requestLocationUpdates", "minTime: " + sMinTime + " minDistance " + sMinDistance);
				sLastLocationActionTime = new Date();
				MyApplication.getInstance().getGeoLocationHelper().requestLocationUpdatesLocationManager(sMinTime, sMinDistance, false, sAction, sActionInterval);
				TrackingData.setTrackingData(sIsTracking, sLastLocationActionTime, sAction, sActionInterval);
			}
		}
		else
		{
			if (LocationHelper.sFusedLocationHelper !=null)
				MyApplication.getInstance().getGeoLocationHelper().requestLocationUpdatesFused(0);
			else {
				Services.Log.info("requestLocationUpdates", "minTime: " + sMinTime + " minDistance " + sMinDistance);
				sLastLocationActionTime = new Date();
				MyApplication.getInstance().getGeoLocationHelper().requestLocationUpdatesLocationManager(0, 0, sIncludeHeadingAndSpeed, "", 0);
			}
		}
	}

	private static Runnable removeLocationUpdatesinUI = new Runnable(){
		@Override
		public void run(){
			removeLocationUpdates() ;
		}
	};

	@SuppressWarnings("deprecation")
	private static void removeLocationUpdates() {
		MyApplication.getInstance().getGeoLocationHelper().removeLocationUpdatesFromFused();
		MyApplication.getInstance().getGeoLocationHelper().removeLocationUpdatesFromLocationManager();
		if (sProgressDialog !=null)
		{
			sProgressDialog.dismiss();
			// release progress dialog.
			sProgressDialog = null;
		}
	}

	//read getmylocation parameters
	private static boolean readBoolean(List<String> values, int arrayIndex)
	{
		boolean includeHeadingAndSpeed = false;
		if (values.size() > arrayIndex)
		{
			includeHeadingAndSpeed = Boolean.parseBoolean(values.get(arrayIndex));
		}
		return includeHeadingAndSpeed;
	}

	private static Integer readInteger(List<String> values, int arrayIndex, int defaultValue)
	{
		Integer timeout = defaultValue;
		if (values.size() > arrayIndex)
		{
			try{
				timeout = Integer.valueOf(values.get(arrayIndex)); }
			catch (NumberFormatException ex)
			{ /* return 0 as default */}
		}
		return timeout;
	}

	private static Date readDate(List<String> values, int arrayIndex)
	{
		Date resultDate = new Date(0);
		if (values.size() > arrayIndex)
		{
			try{
				resultDate = Services.Strings.getDate(values.get(arrayIndex));
			}
			catch (NumberFormatException ex)
			{ /* return minDate as default */}
		}
		return resultDate;
	}

	private static String readString(List<String> values, int arrayIndex) {
		String valueStr = Strings.EMPTY;
		if (values.size() > arrayIndex)
		{
			valueStr = values.get(arrayIndex);
		}
		return valueStr;
	}

	//getaddress
	public static JSONArray getAddressFromLocation(Context context, String locationString)
	{
		//read parameter
		Location location = GeoLocationAPI.getLocationFromString(locationString);

		//convert geolocation to address.
		List<Address> addresses = null;
		Geocoder geocoder = new Geocoder(context, Locale.getDefault());
		try {
			addresses = geocoder.getFromLocation(location.getLatitude(), location.getLongitude(), 10);
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}

		JSONArray arrayResult = new JSONArray();
		if (addresses != null && addresses.size() > 0)
		{
			for (int j= 0; j < addresses.size(); j++)
			{
				Address address = addresses.get(j);
				StringBuilder result = new StringBuilder();

				for (int i = 0; i <= address.getMaxAddressLineIndex(); i++) {
					if (address.getAddressLine(i)!=null)
						result.append(address.getAddressLine(i)).append(Strings.NEWLINE);
				}
				if (address.getLocality()!=null)
					result.append(address.getLocality()).append(Strings.NEWLINE);
				if (address.getPostalCode()!=null)
					result.append(address.getPostalCode()).append(Strings.NEWLINE);
				if (address.getCountryName()!=null)
					result.append(address.getCountryName()).append(Strings.NEWLINE);

				arrayResult.put(result.toString());
			}
			// Services.Log.info("getLocationFromAddress", arrayResult.toString());
		}

		return arrayResult;
	}

	//getlocation
	public static JSONArray getLocationFromAddress(Context context, List<String> values) {
		//read Parameters
		String address = Strings.EMPTY;
		if (values.size() > 0) {
			address = values.get(0);
		}
		return getLocationFromAddress(context, address);
	}

	public static JSONArray getLocationFromAddress(Context context, String address)
	{
		//convert geolocation to address.
		List<Address> locations = null;
		Geocoder geocoder = new Geocoder(context, Locale.getDefault());
		try {
			locations = geocoder.getFromLocationName(address, 10);
		} catch (IOException e) {
			// TODO Auto-generated catch block
		}

		JSONArray arrayResult = new JSONArray();
		if (locations!=null && locations.size()>0)
		{
			for (int j =0; j< locations.size(); j++)
			{
				Address location = locations.get(j);
				arrayResult.put(location.getLatitude() + Strings.COMMA + location.getLongitude());
			}
			// Services.Log.info("getLocationFromAddress", arrayResult.toString());
		}

		return arrayResult;
	}

	//getlatitude
	public static String getLatitudeFromLocation(String locationString)
	{
		Location location = GeoLocationAPI.getLocationFromString(locationString);
		return String.valueOf(location.getLatitude());
	}

	//getlongitude
	public static String getLongitudeFromLocation(String locationString)
	{
		Location location = GeoLocationAPI.getLocationFromString(locationString);
		return String.valueOf(location.getLongitude());
	}

	//getdistance
	public static String getDistanceFromLocations(String locationString1, String locationString2)
	{
		//read parameter
		Location location = GeoLocationAPI.getLocationFromString(locationString1);
		Location location2 = GeoLocationAPI.getLocationFromString(locationString2);

		float distance = location.distanceTo(location2);
		// Services.Log.info("getDistanceFromLocations", String.valueOf(distance));

		return String.valueOf(distance);
	}

	@SuppressWarnings("deprecation")
	public static boolean startTracking(Activity activity, List<Object> values, List<String> valuesString)
	{
		myActivity = activity;

		//create a FusedLocationHelper if not created already
		MyApplication.getInstance().getGeoLocationHelper().createFusedLocationHelper();

		// check if is the new tracking with one Sdt parameters.
		if (values.size()==1) {
			//read parameters from sdt
			Entity trackingParameters = (Entity) values.get(0);
			if (trackingParameters != null) {
				sMinTime = Integer.parseInt((String) trackingParameters.getProperty("ChangesInterval")) * 1000; //convert seconds to miliseconds
				sMinDistance = Integer.parseInt((String) trackingParameters.getProperty("Distance"));
				sAction = (String) trackingParameters.getProperty("Action");
				sActionInterval = Integer.parseInt((String) trackingParameters.getProperty("ActionTimeInterval")); //in seconds!
				sTrackingAccuracy = Integer.parseInt((String) trackingParameters.getProperty("Accuracy"));
				sUseForegroundService = Boolean.parseBoolean((String) trackingParameters.getProperty("UseForegroundService"));
			}
		}
		else {
			//read parameters
			sMinTime = readInteger(valuesString, 0, 0) * 1000; //convert seconds to miliseconds
			sMinDistance = readInteger(valuesString, 1, 0);

			sAction = readString(valuesString, 2);
			sActionInterval = readInteger(valuesString, 3, 0); //in seconds!

			// read optional parameter , tracking accuracy
			sTrackingAccuracy = readInteger(valuesString, 4, 20);  //default 20 for compatibility
			sUseForegroundService = false;
		}

		Services.Log.info("startTracking " + " minTime " + String.valueOf(sMinTime) + " minDistance " + String.valueOf(sMinDistance) );
		Services.Log.info("startTracking " + " Action " + String.valueOf(sAction) + " ActionInterval " + String.valueOf(sActionInterval) );
		Services.Log.info("startTracking " + " TrackingAccuracy " + String.valueOf(sTrackingAccuracy) );

		myActivity.runOnUiThread(requestLocationUpdatesinUIForTracking);
		sIsTracking = true;

		TrackingData.setTrackingData(sIsTracking, sLastLocationActionTime, sAction, sActionInterval);

		return true;
	}

	public static boolean endTracking(Activity activity)
	{
		myActivity = activity;
		//read parameters

		myActivity.runOnUiThread(removeLocationUpdatesinUI);
		sIsTracking = false;

		TrackingData.clear();

		return true;
	}

	public static boolean clearLocationHistory()
	{
		dbTracking.deleteAllLocation();
		return true;
	}

	public static JSONArray getLocationHistory(List<String> parameterValues)
	{
		// return json array of location in array of history
		Date startDate = readDate(parameterValues, 0);

		Services.Log.info("getLocationHistory start");

		JSONArray arrayResult = new JSONArray();
		List<TrackingLocation> trackingLocations = dbTracking.getAllLocations();

		if (!trackingLocations.isEmpty()) {
			Services.Log.info("getLocationHistory trackingLocations size " + trackingLocations.size());
			for (int j = 0; j < trackingLocations.size(); j++) {
				TrackingLocation trackingLocation = trackingLocations.get(j);
				if (trackingLocation != null) {
					if (startDate == null || trackingLocation.getDateTimetime() > startDate.getTime()) {
						try {
							JSONObject jsonObject = new JSONObject(trackingLocation.getGeolocationJson());
							arrayResult.put(jsonObject);
							if (startDate == null)
								Services.Log.info("getLocationHistory add location date is null");
						} catch (JSONException ex) {
							Services.Log.error(ex);
						}

					} else {
						Services.Log.info("getLocationHistory not add location for time restriction", trackingLocation.getGeolocationJson());
					}
				}
			}
			Services.Log.info("getLocationHistory", arrayResult.toString());
		} else {
			Services.Log.info("getLocationHistory trackingLocations empty");
		}

		return arrayResult;
	}

	@SuppressWarnings("deprecation")
	public static Object isLocationServiceEnabled() {
		LocationManager aLocationManager = (LocationManager) MyApplication.getInstance().getSystemService(Context.LOCATION_SERVICE);
		return aLocationManager.isProviderEnabled(LocationManager.GPS_PROVIDER) || aLocationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
	}

	public static IGeoLocationHelper.IOnLocationChangeListener sOnLocationChangeListener = location -> {
		// Keep location change in tracking array if were are tracking.
		if (sIsTracking) {
			//MyApplication.getInstance().showMessage("Location change traking : " + location.toString());
			Services.Log.info("onLocationChanged", "Add location to tracking : " + location.toString());
			dbTracking.addLocation(location);

			//If have a tracking action and action interval has been complete, raise the action.

			if (Services.Strings.hasValue(sAction)) {
				Services.Log.debug("has an action an new location");

				Date nowTime = new Date();
				long difLocInSeconds = Utils.getDiffInSeconds(sLastLocationActionTime.getTime(), nowTime.getTime());

				Services.Log.debug("dif in seconds " + difLocInSeconds);

				if (difLocInSeconds > sActionInterval) {
					Services.Log.debug("time elapsed , raise new action " + sAction);

					// get the action and raise it.
					Services.Notifications.executeNotificationAction(ActivityHelper.getCurrentActivity(), sAction, Strings.EMPTY);

					Services.Log.debug("reset last location action time");
					sLastLocationActionTime = new Date();
					TrackingData.setTrackingDataDate(sLastLocationActionTime);
				}
			}
		}
	};

	public static void restore(boolean isTracking, Date lastLocationActionTime, String action, int actionInterval) {
		sIsTracking = isTracking;
		sLastLocationActionTime = lastLocationActionTime;
		sAction = action;
		sActionInterval = actionInterval;
		Services.Log.info("restoreTrackingData, isTracking " + isTracking + " sAction " + sAction + " ");
	}
}
