package com.genexus.controls.maps.googlev2;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.android.GooglePlayServicesHelper;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.controls.maps.GooglePlaceHelper;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.location.places.Place;
import com.google.android.gms.location.places.ui.*;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;

/**
 * Helper class to manage Places API functionality.
 */
@SuppressWarnings("deprecation")
public class GooglePlacePickerHelper implements GooglePlaceHelper.IPickerPlaces
{
	private static final MapUtils MAP_UTILS = new MapUtils(null);
	private static final double DEFAULT_RADIUS_KM = 0.14; // guessed from default behavior when no LatLngBounds is supplied.

	@Nullable
	@Override
	public Intent buildIntent(@NonNull Activity activity, String initialValue)
	{
		try
		{
			PlacePicker.IntentBuilder builder = new PlacePicker.IntentBuilder();

			// Center on current value, if any.
			LatLng latLng = MapUtils.stringToLatLng(initialValue);
			if (latLng != null)
			{
				LatLngBounds initialBounds = MAP_UTILS.getBoundingBox(new MapLocation(latLng), DEFAULT_RADIUS_KM).getLatLngBounds();
				builder.setLatLngBounds(initialBounds);
			}

			return builder.build(activity);
		}
		catch (GooglePlayServicesRepairableException e)
		{
			GooglePlayServicesHelper.showError(activity, e.getConnectionStatusCode());
			return null;
		}
		catch (GooglePlayServicesNotAvailableException e)
		{
			GooglePlayServicesHelper.showError(activity, e.errorCode);
			return null;
		}
	}

	@Nullable
	@Override
	public String getLocationValueFromResult(@NonNull Context context, int resultCode, Intent data)
	{
		if (resultCode == Activity.RESULT_OK)
		{
			Place place = PlacePicker.getPlace(context, data);
			if (place != null)
			{
				LatLng latLng = place.getLatLng();
				return GeoFormats.buildGeolocation(latLng.latitude, latLng.longitude);
			}
		}
		else if (resultCode == PlacePicker.RESULT_ERROR)
		{
			Services.Log.warning("Call to PlacePicker returned with RESULT_ERROR. Is 'Google Places API for Android' enabled in the Developer Console?");
		}

		return null;
	}

	@Override
	public int getPlacePickerResultError()
	{
		return PlacePicker.RESULT_ERROR;
	}
}
