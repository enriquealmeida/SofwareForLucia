package com.genexus.coreexternalobjects;

import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import android.app.Activity;
import androidx.annotation.NonNull;

import com.artech.activities.ActivityHelper;
import com.artech.android.ApiAuthorizationStatus;
import com.artech.android.PermissionUtil;
import com.artech.android.WithPermission;
import com.artech.application.MyApplication;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.ReflectionHelper;
import com.artech.base.utils.ResultRunnable;
import com.genexus.GXBaseCollection;
import com.genexus.GXSimpleCollection;
import com.genexus.coreexternalobjects.geolocation.LocationActionsHelper;
import com.genexus.coreexternalobjects.geolocation.LocationHelper;
import com.genexus.coreexternalobjects.geolocation.db.ProximityAlert;
import com.genexus.xml.GXXMLSerializable;

import org.json.JSONArray;
import org.json.JSONException;

@SuppressWarnings({"unused", "WeakerAccess"})
public class GeolocationAPIOffline
{
	public static double getLatitude(String geolocation)
	{
		return com.genexus.util.GXGeolocation.getLatitude(geolocation);
	}

	public static double getLongitude(String geolocation)
	{
		return com.genexus.util.GXGeolocation.getLongitude(geolocation);
	}

	public static int getDistance(String location1, String location2)
	{
		return com.genexus.util.GXGeolocation.getDistance(location1, location2);
	}

	public static Vector<String> getAddress(String location)
	{
		Vector<String> result = new GXSimpleCollection<String>();
		JSONArray arrayResult = LocationActionsHelper.getAddressFromLocation(MyApplication.getAppContext(), location);
		for (int i = 0; i < arrayResult.length(); i++) {
			try
			{
				String address = arrayResult.getString(i);
				result.add(address);
			}
			catch (JSONException ex) {
				Services.Log.error(ex.getMessage());
			}
		}
		return result;
	}

	public static Vector<String> getLocation(String address)
	{
		Vector<String> result = new GXSimpleCollection<String>();
		JSONArray arrayResult = LocationActionsHelper.getLocationFromAddress(MyApplication.getAppContext(), address);
		for (int i = 0; i < arrayResult.length(); i++) {
			try
			{
				String location = arrayResult.getString(i);
				result.add(location);
			}
			catch (JSONException ex) {
				Services.Log.error(ex.getMessage());
			}
		}
		return result;
	}

	public static Object getmylocation(Integer minAccuracy, Integer timeout, Boolean includeHeadingAndSpeed)
	{
		return getmylocation(minAccuracy, timeout, includeHeadingAndSpeed, false);
	}
	
	public static Object getmylocation(Integer minAccuracy, Integer timeout, Boolean includeHeadingAndSpeed, Boolean ignoreErrors)
	{
		final Activity activity = ActivityHelper.getCurrentActivity();

		final List<String> values = new ArrayList<>();
		values.add(String.valueOf(minAccuracy));
		values.add(String.valueOf(timeout));
		values.add(String.valueOf(includeHeadingAndSpeed));
		values.add(String.valueOf(ignoreErrors));

		return executeWithPermission(
				new ResultRunnable<Object>()
				{
					@Override
					public Object run()
					{
						return internalGetMyLocation(activity, values);
					}
				},
				new ResultRunnable<Object>()
				{
					@Override
					public Object run()
					{
						return newGeolocationInfo(); // Empty geolocation object
					}
				});
	}

	private static Object internalGetMyLocation(Activity activity, List<String> values)
	{
		GXXMLSerializable result = newGeolocationInfo();

		// Convert json to GXXMLSerializable (SDT)
		org.json.JSONObject resultJson = LocationActionsHelper.getMyLocation(activity, values, false);
		if (resultJson != null)
			result.fromJSonString(resultJson.toString());

		return result;
	}

	@NonNull
	private static GXXMLSerializable newGeolocationInfo()
	{
		Class<?> clazz = ReflectionHelper.getClass(Object.class, "com.genexuscore.genexus.common.SdtGeolocationInfo");
		if (clazz == null)
			throw new IllegalStateException("SdtGeolocationInfo class could not be loaded!");

		Object obj = ReflectionHelper.createDefaultInstance(clazz, true);

		if (obj == null)
			throw new IllegalStateException("SdtGeolocationInfo class could not be instantiated!");

		return (GXXMLSerializable)obj;
	}

	//START Proximity Alerts methods
	public static void clearproximityalerts()
	{
		GeoLocationAPI.clearProximityAlerts();
	}

	public static Object getcurrentproximityalert( )
	{
		// use Core module sdt name
		Class<?> clazz = ReflectionHelper.getClass(Object.class, "com.genexuscore.genexus.common.SdtGeolocationProximityAlert");
		if (clazz != null)
		{
			Object sdtGeoLocationInfo = ReflectionHelper.createDefaultInstance(clazz, true);

			// Convert json to GXXMLSerializable (SDT)
			Entity alert = GeoLocationAPI.getCurrentProximityAlertEntity();
			//org.json.JSONObject resultJson = SDActions.getMyLocation(activity, values, false);
			GXXMLSerializable result = (GXXMLSerializable) sdtGeoLocationInfo;
			if (alert != null && result != null)
				result.fromJSonString(alert.toString());

			return sdtGeoLocationInfo;
		}

		Services.Log.error("getcurrentproximityalert fails, cannot get SdtGeoLocationProximityAlert class");
		return null;

		//
	}

	// setproximityalerts, getproximityalerts from procedures

	public static GXBaseCollection getproximityalerts()
	{
		String classTypeName = "com.genexuscore.genexus.common.SdtGeolocationProximityAlert";
		Class clazzType = ReflectionHelper.getClass(Object.class, classTypeName);
		if (clazzType == null)
		{
			Services.Log.error("SdtGeoLocationProximityAlert not found ");
			return null;
		}

		//noinspection unchecked
		@SuppressWarnings("unchecked")
		GXBaseCollection base = new GXBaseCollection(clazzType, "GeolocationProximityAlert", "GeoLocation", MyApplication.getApp().getRemoteHandle() );

		List<ProximityAlert> proximityAlerts = GeoLocationAPI.getProximityAlertsFromDb();

		json.org.json.JSONArray jsonAlerts = new json.org.json.JSONArray();
		try {
			for (ProximityAlert n : proximityAlerts)
			{
				json.org.json.JSONObject jsonAlert = new json.org.json.JSONObject();
				jsonAlert.put("Name", n.getName());
				jsonAlert.put("Description",n.getDescription());
				jsonAlert.put("GeoLocation", n.getGeolocation());
				jsonAlert.put("Radius", n.getRadius());
				jsonAlert.put("ExpirationTime", n.getExpirationDateTime());
				jsonAlert.put("ActionName", n.getActionName());
				jsonAlerts.put(jsonAlert);
			}
		} catch (json.org.json.JSONException e) {
		}
		base.fromJSonString(jsonAlerts.toString());

		return base;
	}

	@SuppressWarnings("deprecation")
	public static boolean setproximityalerts(final GXBaseCollection proximityAlerts)
	{
		if (!MyApplication.getInstance().getGeoLocationHelper().createFusedLocationHelper())
			return false; // Cannot add geofences without GMS. We shouldn't even request permission to do so.

		return executeWithPermission(
				new ResultRunnable<Boolean>()
				{
					@Override
					public Boolean run()
					{
						return internalSetProximityAlerts(proximityAlerts);
					}
				},
				new ResultRunnable<Boolean>()
				{
					@Override
					public Boolean run()
					{
						return false;
					}
				});
	}

	private static boolean internalSetProximityAlerts(GXBaseCollection proximityAlerts)
	{
		try
		{
			//set alerts from procedures.
			json.org.json.JSONArray jsalerts = (json.org.json.JSONArray)proximityAlerts.GetJSONObject();

			for (int i = 0; i < jsalerts.length(); i++)
			{
				json.org.json.JSONObject a;
				if(jsalerts.get(i) instanceof json.org.json.JSONObject){
					a = jsalerts.getJSONObject(i);
				}else{
					a = (json.org.json.JSONObject) proximityAlerts.getStruct().get(i);
				}

				String name = (String) a.get("Name");
				String description = (String) a.get("Description");
				String geoLocation = (String) a.get("GeoLocation");
				Integer radius = Integer.parseInt( a.get("Radius").toString());
				String expirationTime = (String) a.get("ExpirationTime");
				String actionName = (String) a.get("ActionName");

				GeoLocationAPI.createProximityAlertsAddToGeoFences(name, description, geoLocation,
						radius, expirationTime, actionName, true, 0);
			}
			//Add proximity alerts in the android geofence system
			Services.Log.debug("add geofence to check " );
			LocationHelper.sFusedLocationHelper.addGeofencesToCheck(MyApplication.getAppContext());

			return true;
		}
		catch (json.org.json.JSONException e)
		{
			return false;
		}
	}

	//END Proximity Alerts methods

	// Authorized, ServiceEnabled  methods and AuthorizationStatus property
	@SuppressWarnings("deprecation")
	public static int authorizationStatus()
	{
		return ApiAuthorizationStatus.getStatus(MyApplication.getAppContext(), MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions());

	} // AuthorizationStatus enum

	@SuppressWarnings("deprecation")
	public static boolean authorized()
	{
		return PermissionUtil.checkSelfPermissions(MyApplication.getAppContext(), MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions());
	}

	public static boolean serviceEnabled()
	{
		return (boolean)LocationActionsHelper.isLocationServiceEnabled();
	}

	//Pending Tracking methods in offline

	@SuppressWarnings("deprecation")
	private static <TRESULT> TRESULT executeWithPermission(ResultRunnable<TRESULT> code, ResultRunnable<TRESULT> emptyResult)
	{
		Activity activity = ActivityHelper.getCurrentActivity();

		WithPermission<TRESULT> method = new WithPermission.Builder<TRESULT>(activity)
				.require(MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions())
				.request(MyApplication.getInstance().getGeoLocationHelper().getRequestPermissions())
				.setBlockThread(true)
				.attachToActivityController()
				.onSuccess(code)
				.onFailure(emptyResult)
				.build();

		return method.run();
	}
}
