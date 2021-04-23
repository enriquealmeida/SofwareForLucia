package com.genexus.controls.maps.googlev2;

import android.app.Activity;

import com.artech.R;
import com.artech.base.services.Services;
import com.artech.base.utils.Function;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.IGxMapView;
import com.artech.controls.maps.common.IMapViewFactory;
import com.artech.ui.Coordinator;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;

/**
 * MapViewFactory for Google Maps API v2.
 */
class MapViewFactory implements IMapViewFactory
{
	@Override
	public IGxMapView createView(final Activity activity, final Coordinator coordinator, final GxMapViewDefinition definition)
	{
		return createInstance(activity, new Function<Void, IGxMapView>()
		{
			@Override
			public IGxMapView run(Void input)
			{
				return new GxMapView(activity, coordinator, definition);
			}
		});
	}

	@Override
	public void afterAddView(IGxMapView view)
	{
		// Nothing to do.
	}

	static MapView createStandardMapView(final Activity activity, final GoogleMapOptions options)
	{
		return createInstance(activity, new Function<Void, MapView>()
		{
			@Override
			public MapView run(Void input)
			{
				return new MapView(activity, options);
			}
		});
	}

	private static <ViewT> ViewT createInstance(Activity activity, Function<Void, ViewT> creator)
	{
		String apiKey = activity.getResources().getString(R.string.GoogleServicesApiKey);
		if (Strings.hasValue(apiKey))
		{
			if (GoogleMapsHelper.checkGoogleMapsV2(activity))
			{
				return creator.run(null);
			}
			else
			{
				Services.Log.error("Google Play Services and/or Google Maps is not installed.");
			}
		}
		else
		{
			Services.Log.error("No key was provided for Google Maps API V2.");
			Services.Log.error("Please create one in the Google Developer Console.");
			Services.Log.error("Ensure that the Google Maps Android API v2 is enabled.");
			Services.Log.error("Put the API key in the main object property: Android Google Services API.");
		}
		Services.Log.error("Could not create Genexus SD Maps control instance!");
		return null; // Could not create.
	}
}
