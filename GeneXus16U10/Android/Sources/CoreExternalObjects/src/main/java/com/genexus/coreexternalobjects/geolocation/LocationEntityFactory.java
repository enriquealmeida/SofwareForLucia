package com.genexus.coreexternalobjects.geolocation;

import android.location.Location;

import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.Date;

public class LocationEntityFactory {
	/**
	 * Returns the JSON represeting a GeoLocationInfo SDT
	 */
	public static JSONObject createLocationEntity(Location location) {
		JSONObject jsonProperty = new JSONObject();
		try {
			jsonProperty.put("Location", location.getLatitude() + Strings.COMMA + location.getLongitude());
			jsonProperty.put("Description", "LocationInfo (" + location.getProvider() + ")");
			Date date = new Date();
			date.setTime(location.getTime());
			jsonProperty.put("Time", Services.Strings.getDateTimeStringForServer(date));
			jsonProperty.put("Precision", String.valueOf(location.getAccuracy()));

			if (location.hasBearing())
				jsonProperty.put("Heading", String.valueOf(location.getBearing()));
			else
				jsonProperty.put("Heading", String.valueOf(-1));

			if (location.hasSpeed())
				jsonProperty.put("Speed", String.valueOf(location.getSpeed()));
			else
				jsonProperty.put("Speed", String.valueOf(-1));
		} catch (JSONException e) {
			Services.Log.error("Error creating JSON for Location", "Exception in JSONObject.put()", e);
		}
		return jsonProperty;
	}
}
