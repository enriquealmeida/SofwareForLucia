package com.artech.controls.maps.baidu;

import android.app.Activity;
import android.util.Pair;

import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.controls.maps.common.IMapLocation;
import com.artech.controls.maps.common.IMapViewFactory;
import com.artech.controls.maps.common.IMapsProvider;

public class MapsProvider implements IMapsProvider
{
	private static final String PROVIDER_ID = "MAPS_BAIDU";

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
		final String URL_FORMAT = "http://api.map.baidu.com/staticimage?markers=%s,%s&width=%s&height=%s&zoom=%s";

		// Baidu expects <longitude,latitude> instead of <latitude,longitude>.
		Pair<Double, Double> latlon = GeoFormats.parseGeolocation(location);
		if (latlon != null)
			return String.format(URL_FORMAT, latlon.second, latlon.first, width, height, zoom);
		else
			return null;
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
