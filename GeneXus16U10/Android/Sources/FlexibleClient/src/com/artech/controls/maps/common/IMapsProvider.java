package com.artech.controls.maps.common;

import android.app.Activity;

public interface IMapsProvider
{
	String getId();

	IMapViewFactory getMapViewFactory();
	Class<? extends Activity> getLocationPickerActivityClass();
	String getMapImageUrl(String location, int width, int height, String mapType, int zoom);

	void calculateDirections(Activity activity, String origin, String destination, String transportType, Boolean requestAlternatives);

	IMapLocation newMapLocation(double latitude, double longitude);
}
