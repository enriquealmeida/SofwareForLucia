package com.artech.controls.maps.gaode;

import android.app.Activity;

import com.amap.api.maps.AMapOptions;
import com.amap.api.maps.MapView;
import com.artech.base.services.Services;
import com.artech.base.utils.Function;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.IGxMapView;
import com.artech.controls.maps.common.IMapViewFactory;
import com.artech.ui.Coordinator;

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

	static MapView createStandardMapView(final Activity activity, final AMapOptions options)
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
		String apiKey = activity.getResources().getString(R.string.MapsApiKey);
		if (Strings.hasValue(apiKey))
		{
			try {
				return creator.run(null);
			} catch (@SuppressWarnings("checkstyle:IllegalCatch") Exception e) {
				// TODO: We should investigate why and which exception we're catching here
				Services.Log.error("Exception creating map instance", e);
			}
		}
		else
			Services.Log.error("No key was provided for Gaode Maps API.");

		return null; // Could not create.
	}
}
