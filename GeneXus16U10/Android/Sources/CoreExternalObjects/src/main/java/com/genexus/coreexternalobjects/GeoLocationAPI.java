package com.genexus.coreexternalobjects;

import android.app.Activity;
import android.content.Intent;
import android.location.Location;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.actions.ApiAction;
import com.artech.activities.ActivityLauncher;
import com.artech.android.ApiAuthorizationStatus;
import com.artech.android.PermissionUtil;
import com.artech.application.MyApplication;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityFactory;
import com.artech.base.model.EntityList;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultRunnable;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.GooglePlaceHelper;
import com.artech.controls.maps.common.LocationPickerHelper;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.genexus.coreexternalobjects.geolocation.LocationActionsHelper;
import com.genexus.coreexternalobjects.geolocation.LocationHelper;
import com.genexus.coreexternalobjects.geolocation.db.ProximityAlert;
import com.genexus.coreexternalobjects.geolocation.db.ProximityAlertsSQLiteHelper;
import com.google.android.gms.location.Geofence;

import org.json.JSONArray;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class GeoLocationAPI extends ExternalApi
{
	public static final String OBJECT_NAME = "GeneXus.Common.Geolocation";

	private static final String METHOD_CREATE_ALERTS = "SetProximityAlerts";
	private static final String METHOD_LIST_ALERTS = "GetProximityAlerts";
	private static final String METHOD_GETCURRENT_ALERT = "GetCurrentProximityAlert";
	private static final String METHOD_CLEAR_ALERTS = "ClearProximityAlerts";

	private static final String METHOD_PICK_LOCATION = "PickLocation";

	private static int iUniqueId;
	private static ProximityAlertsSQLiteHelper dbProximityAlerts = new ProximityAlertsSQLiteHelper(MyApplication.getAppContext());
	public static ProximityAlert sCurrentProximityAlert = null;

	public GeoLocationAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override @SuppressWarnings("deprecation")
	public ExternalApiResult execute(String method, List<Object> parameters)
	{
		final Activity activity = getActivity();
		final List<String> parameterValues = toString(parameters);

		if (method.equalsIgnoreCase("getmylocation"))
		{
			return executeRequestingPermissions(new ResultRunnable<ExternalApiResult>()
			{
				@Override
				public ExternalApiResult run()
				{
					// Get current location. Returns null if we have no location and ignoreErrors is false.
					Object result = LocationActionsHelper.getMyLocation(activity, parameterValues, true);
					if (result != null)
						return ExternalApiResult.success(result);
					else
						return ExternalApiResult.FAILURE;
				}
			});
		}
		else if (method.equalsIgnoreCase("getaddress") && parameterValues.size() >= 1)
		{
			// Get address from geolocation. Returns a collection
			JSONArray result = LocationActionsHelper.getAddressFromLocation(activity, parameterValues.get(0));
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("getlocationhistory"))
		{
			// Get distance to geolocation.
			JSONArray result = LocationActionsHelper.getLocationHistory(parameterValues);
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("getlocation"))
		{
			// Get geolocation from address. Returns a collection
			JSONArray result = LocationActionsHelper.getLocationFromAddress(activity, parameterValues);
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("getlatitude") && parameterValues.size() >= 1)
		{
			// Get latitude from geolocation.
			String result = LocationActionsHelper.getLatitudeFromLocation(parameterValues.get(0));
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("getlongitude") && parameterValues.size() >= 1)
		{
			// Get longitude from geolocation.
			String result = LocationActionsHelper.getLongitudeFromLocation(parameterValues.get(0));
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("getdistance") && parameterValues.size() >= 2)
		{
			// Get distance to geolocation.
			String result = LocationActionsHelper.getDistanceFromLocations(parameterValues.get(0), parameterValues.get(1));
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("starttracking"))
		{
			return executeRequestingPermissions(new ResultRunnable<ExternalApiResult>()
			{
				@Override
				public ExternalApiResult run()
				{
					boolean result = LocationActionsHelper.startTracking(activity, parameters, parameterValues);
					return ExternalApiResult.success(result);
				}
			});
		}
		else if (method.equalsIgnoreCase("endtracking"))
		{
			return executeRequestingPermissions(new ResultRunnable<ExternalApiResult>()
			{
				@Override
				public ExternalApiResult run()
				{
					boolean result = LocationActionsHelper.endTracking(activity);
					return ExternalApiResult.success(result);
				}
			});
		}
		else if (method.equalsIgnoreCase("clearlocationhistory"))
		{
			// Get distance to geolocation.
			boolean result = LocationActionsHelper.clearLocationHistory();
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("authorized"))
		{
			boolean result = PermissionUtil.checkSelfPermissions(getContext(), MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions());
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("serviceenabled"))
		{
			// In android location services are disable is network and gps location are disabled
			Object result = LocationActionsHelper.isLocationServiceEnabled();
			return ExternalApiResult.success(result);
		}
		else if (method.equalsIgnoreCase("authorizationstatus"))
		{
			int result = ApiAuthorizationStatus.getStatus(getContext(), MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions());
			return ExternalApiResult.success(result);
		}
		//Proximity Alerts Api
		else if (method.equalsIgnoreCase(METHOD_CREATE_ALERTS))
		{
			final  List<Object> parametersLocal = parameters;

			return executeRequestingPermissions(new ResultRunnable<ExternalApiResult>()
			{
				@Override
				public ExternalApiResult run()
				{
					if (!MyApplication.getInstance().getGeoLocationHelper().createFusedLocationHelper())
						return ExternalApiResult.success(false); // Cannot add geofences, but don't abort the action; just return false.

					EntityList proximityAlertList = (EntityList) parametersLocal.get(0);
					if (proximityAlertList != null)
					{
						for (Entity proximityAlert : proximityAlertList)
						{
							String name = (String) proximityAlert.getProperty("Name");
							String description = (String) proximityAlert.getProperty("Description");
							String geoLocation = (String) proximityAlert.getProperty("GeoLocation");
							Integer radius = Integer.parseInt((String) proximityAlert.getProperty("Radius"));
							String expirationTime = (String) proximityAlert.getProperty("ExpirationTime");
							String actionName = (String) proximityAlert.getProperty("ActionName");

							createProximityAlertsAddToGeoFences(name, description, geoLocation,
									radius, expirationTime, actionName, true, 0);
						}
						//Add proximity alerts in the android geofence system
						Services.Log.debug("add geofence to check " );
						LocationHelper.sFusedLocationHelper.addGeofencesToCheck(MyApplication.getAppContext());
					}

					return ExternalApiResult.success(true);
				}
			});
		}
		else if (method.equalsIgnoreCase(METHOD_LIST_ALERTS))
		{
			EntityList alerts = new EntityList();

			//online method
			List<ProximityAlert> proximityAlerts = getProximityAlertsFromDb();

			for (ProximityAlert pa : proximityAlerts)
			{
				Entity alert = EntityFactory.newSdt("GeneXus.Common.GeolocationProximityAlert");
				copyProximityAlertToEntity(pa, alert);
				alerts.add(alert);
			}
			return ExternalApiResult.success(alerts);
		}
		else if (method.equalsIgnoreCase(METHOD_CLEAR_ALERTS))
		{
			clearProximityAlerts();
			return ExternalApiResult.SUCCESS_CONTINUE;
		}
		else if (method.equalsIgnoreCase(METHOD_GETCURRENT_ALERT))
		{
			Entity alert = getCurrentProximityAlertEntity();
			return ExternalApiResult.success(alert);
		}
		else if (method.equalsIgnoreCase(METHOD_PICK_LOCATION))
		{
			// get current location form parameter
			String initialLocation = Strings.EMPTY;

			Entity sdtParamters = (Entity) parameters.get(0);
			initialLocation = sdtParamters.optStringProperty("InitialLocation");
			//call location picker.

			// retrun succes wait to handle result in afterActivityResult
			return callBestLocationPicker(initialLocation);
		}
		else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}

	// START Proximity alerts static methods.
	public static void clearProximityAlerts()
	{
		if (LocationHelper.sFusedLocationHelper !=null)
			LocationHelper.sFusedLocationHelper.removeGeofencesToCheck(MyApplication.getAppContext());

		dbProximityAlerts.deleteAllProximityAlerts();
	}

	@Nullable
	public static Entity getCurrentProximityAlertEntity()
	{
		Entity alert = EntityFactory.newSdt("GeneXus.Common.GeolocationProximityAlert");
		if (sCurrentProximityAlert !=null)
			copyProximityAlertToEntity(sCurrentProximityAlert, alert);
		return alert;
	}

	public static List<ProximityAlert> getProximityAlertsFromDb()
	{
		return dbProximityAlerts.getAllRpoximityAlerts();
	}

	// END Proximity alerts static methods.


	private static void copyProximityAlertToEntity(ProximityAlert pa, Entity alert)
	{
		alert.setProperty("Name", pa.getName());
		alert.setProperty("Description", pa.getDescription());
		alert.setProperty("GeoLocation", pa.getGeolocation());
		alert.setProperty("Radius", pa.getRadius().toString());
		alert.setProperty("ExpirationTime", pa.getExpirationDateTime());
		alert.setProperty("ActionName", pa.getActionName());
	}


	public static void createProximityAlertsAddToGeoFences(String name, String description, String geolocation,
														   Integer radius, String expirationDateTime, String actionName,
														   Boolean addToDababase, int paUniqueId)
	{
		ProximityAlert pa = new ProximityAlert();

		pa.setName(name);
		pa.setDescription(description);
		pa.setGeolocation(geolocation);
		pa.setRadius(radius);
		pa.setExpirationDateTime(expirationDateTime);
		pa.setActionName(actionName);

		// if already exits in database, not insert again.
		if (addToDababase)
			iUniqueId = (int) dbProximityAlerts.addProximityAlert(pa);
		else
			iUniqueId = paUniqueId;

		//set proximity alert in the android geofence system

		//DateTime
		Date date = Services.Strings.getDateTime(expirationDateTime);
		long expiration = Geofence.NEVER_EXPIRE;
		if (date!=null)
		{
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);

			Calendar calendarToday = Calendar.getInstance();
			//use today date

			expiration = calendar.getTimeInMillis() - calendarToday.getTimeInMillis();
		}
		if (expiration<=0) {
			expiration = Geofence.NEVER_EXPIRE;
		}

		Location geofenceLocation = getLocationFromString(geolocation);

		Services.Log.debug("create geofence " + iUniqueId + " location " + geofenceLocation);
		Services.Log.debug("create geofence " + iUniqueId + " radius " + radius);
		Services.Log.debug("create geofence " + iUniqueId + " expiration milliseconds " + expiration);
		LocationHelper.sFusedLocationHelper.createGeoFence(iUniqueId, geofenceLocation, radius, expiration);

	}

	// method to re enable proximity alerts after reboot
	@SuppressWarnings("deprecation")
	public static void reSetProximityAlertsInGeofencesStatic()
	{
		//online method
		List<ProximityAlert> proximityAlerts = getProximityAlertsFromDb();
		Services.Log.debug("reSetProximityAlertsInGeofencesStatic ");
		if (proximityAlerts.size()>0)
		{
			Services.Log.debug("add proximityAlerts to geofences, size " + proximityAlerts.size());
			MyApplication.getInstance().getGeoLocationHelper().createFusedLocationHelper();

			for (ProximityAlert pa : proximityAlerts)
			{
				//re create, already exits in database.
				createProximityAlertsAddToGeoFences(pa.getName(), pa.getDescription(), pa.getGeolocation(),
						pa.getRadius(), pa.getExpirationDateTime(), pa.getActionName(),
						false, pa.getId());
			}

			//Add proximity alerts in the android geofence system
			Services.Log.debug("add geofence to check ");
			LocationHelper.sFusedLocationHelper.addGeofencesToCheck(MyApplication.getAppContext());
		}
	}

	public static Location getLocationFromString(String locationString)
	{
		//read Parameters
		double latitude = 0;
		double longitude = 0;
		if (Strings.hasValue(locationString))
		{
			String[] valuesLocation = Services.Strings.split(locationString, ',');
			try{
				if (valuesLocation.length > 0)
					latitude = Double.parseDouble(valuesLocation[0]);
				if (valuesLocation.length > 1)
					longitude = Double.parseDouble(valuesLocation[1]);
			}
			catch (NumberFormatException ex)
			{ /* return 0 as default */
			}
		}
		Location location = new Location("POINT_LOCATION");
		location.setLatitude(latitude);
		location.setLongitude(longitude);
		return location;
	}

	// START Geolocation picker methods.

	private ExternalApiResult callBestLocationPicker(String initialLocation)
	{
		if (GooglePlaceHelper.isAvailable(getContext()))
		{
			usePlacePicker = true;
			Intent placePickerIntent = GooglePlaceHelper.buildIntent(getActivity(), initialLocation);
			if (placePickerIntent != null)
			{
				getActivity().startActivityForResult(placePickerIntent, RequestCodes.ACTIONNOREFRESH);
				return ExternalApiResult.SUCCESS_WAIT;
			}
		}
		else
		{
			usePlacePicker = false;
			Intent pickerIntent = ActivityLauncher.getLocationPickerIntent(getActivity(), Strings.EMPTY, initialLocation);
			if (pickerIntent !=null)
			{
				getActivity().startActivityForResult(pickerIntent, RequestCodes.ACTIONNOREFRESH);
				return ExternalApiResult.SUCCESS_WAIT;
			}
		}
		return ExternalApiResult.FAILURE;
	}

	private boolean usePlacePicker = false;

	@Override
	public ExternalApiResult afterActivityResult(int requestCode, int resultCode, Intent result, String method, List<Object> methodParameters)
	{
		if (method.equalsIgnoreCase(METHOD_PICK_LOCATION))
		{
			if (resultCode == Activity.RESULT_OK)
			{
				// read result and assign it.
				if (usePlacePicker)
				{
					String value = GooglePlaceHelper.getLocationValueFromResult(getContext(), resultCode, result);
					if (Strings.hasValue(value))
						return ExternalApiResult.success(value);
				}
				else
				{
					String value = result.getStringExtra(LocationPickerHelper.EXTRA_LOCATION);
					if (Strings.hasValue(value))
						return ExternalApiResult.success(value);
				}
				//

			}

			if (usePlacePicker && resultCode == GooglePlaceHelper.getPlacePickerResultError())
			{
				Services.Log.warning("Call to PlacePicker returned with RESULT_ERROR. Is 'Google Places API for Android' enabled in the Developer Console?");
			}

			// if not ok fails.
			return ExternalApiResult.FAILURE;
		}
		// return nothing
		return null;
	}

	// END Geolocation picker methods.


	@SuppressWarnings("deprecation")
	private ExternalApiResult executeRequestingPermissions(ResultRunnable<ExternalApiResult> code)
	{
		return executeRequestingPermissions(MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions(), code);
	}
}
