package com.artech.controls.maps.gaode;

import android.app.Activity;

import com.artech.base.services.Services;
import com.artech.controls.maps.common.GoogleMapsImage;
import com.artech.controls.maps.common.IMapLocation;
import com.artech.controls.maps.common.IMapViewFactory;
import com.artech.controls.maps.common.IMapsProvider;

public class MapsProvider implements IMapsProvider
{
	private static final String PROVIDER_ID = "MAPS_GAODE";

	@Override
	public String getId()
	{
		return PROVIDER_ID;
	}

	@Override
	public IMapViewFactory getMapViewFactory()
	{
		return new MapViewFactory();
	}

	@Override
	public Class<? extends Activity> getLocationPickerActivityClass()
	{
		return LocationPickerActivity.class;
	}

	@Override
	public String getMapImageUrl(String location, int width, int height, String mapType, int zoom)
	{
		// Didn't find an "image API" for Gaode.
		return GoogleMapsImage.getUrl(location, width, height, mapType, zoom);
	}

	@Override
	public void calculateDirections(Activity activity, String origin, String destination, String transportType, Boolean requestAlternatives)
	{
		// Not implemented.
		Services.Log.debug("Directions API not implemented");
	}

	@Override
	public IMapLocation newMapLocation(double latitude, double longitude)
	{
		return new MapLocation(latitude, longitude);
	}
}
