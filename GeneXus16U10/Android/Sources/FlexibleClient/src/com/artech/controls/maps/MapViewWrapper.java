package com.artech.controls.maps;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Pair;
import android.view.Menu;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;

import com.artech.actions.ICustomMenuManager;
import com.artech.base.controls.IGxControlPreserveState;
import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.base.utils.NameMap;
import com.artech.base.utils.Strings;
import com.artech.controllers.ViewData;
import com.artech.controls.GxImageViewStatic;
import com.artech.controls.GxListView;
import com.artech.controls.IGridView;
import com.artech.controls.grids.GridHelper;
import com.artech.controls.maps.common.IGxMapView;
import com.artech.controls.maps.common.IGxMapViewRuntimeMethods;
import com.artech.controls.maps.common.IMapLocation;
import com.artech.controls.maps.common.IMapViewFactory;
import com.artech.controls.maps.common.IMapsProvider;
import com.artech.controls.maps.common.MapViewHelper;
import com.artech.controls.maps.common.IGxMapViewSupportLayers;
import com.artech.controls.maps.common.kml.KmlReaderAsyncTask;
import com.artech.controls.maps.common.MapLayer;
import com.artech.ui.Coordinator;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

public class MapViewWrapper extends RelativeLayout implements IGridView, ICustomMenuManager, IGxControlRuntime, IGxControlPreserveState
{
	private final IMapViewFactory mFactory;
	@SuppressWarnings("unused")
	private final Coordinator mCoordinator;
	private final GxMapViewDefinition mDefinition;
	private IGridView mView;
	
	private NameMap<MapLayer> mLayers;

	// Properties
	private static final String PROPERTY_MAP_TYPE = "MapType";
	private static final String PROPERTY_MAP_DIRECTION_LAYER = "DirectionsLayer";
	private static final String PROPERTY_MAP_ANIMATION_LAYER = "AnimationLayer";

	// Methods
	private static final String METHOD_LOAD_KML = "LoadKML";
	private static final String METHOD_SET_LAYER_VISIBLE = "SetLayerVisible";
	private static final String METHOD_ADJUST_VISIBLE_AREA_TO_LAYER = "AdjustVisibleAreaToLayer";

	private static final String METHOD_DRAW_GEOLINE = "DrawGeoLine";
	private static final String METHOD_SET_MAPCENTER = "SetMapCenter";
	private static final String METHOD_SET_ZOOMLEVEL = "SetZoomLevel";

	public MapViewWrapper(Context context, Coordinator coordinator, LayoutItemDefinition layoutDefinition)
	{
		super(context);
		mFactory = Maps.getMapViewFactory(context);
		mCoordinator = coordinator;
		mDefinition = new GxMapViewDefinition(context, (GridDefinition)layoutDefinition);
		mLayers = new NameMap<>();

		if (mFactory != null)
			mView = mFactory.createView((Activity) getContext(), coordinator, mDefinition);

		if (mView == null)
		{
			// We couldn't create a MapView, probably because the device doesn't have API support.
			// Use a normal ListView in that case.
			mView = new GxListView(context, coordinator, (GridDefinition)layoutDefinition);
		}

		// Unlink from a possible parent before adding here.
		View view = (View)mView;
		if (view.getParent() != null)
			((ViewGroup)view.getParent()).removeView(view);

		RelativeLayout.LayoutParams lp = new RelativeLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT);
		addView(view, lp);

		if (mFactory != null && mView != null && mView instanceof IGxMapView)
			mFactory.afterAddView((IGxMapView)mView);

		if (mDefinition.getShowSelectionLayer())
		{
			GxImageViewStatic imageView = new GxImageViewStatic(context, null);
			imageView.setImageDrawable(mDefinition.getSelectionPinImageDrawable(context));

			RelativeLayout.LayoutParams lpImage = new RelativeLayout.LayoutParams(LinearLayout.LayoutParams.WRAP_CONTENT, LinearLayout.LayoutParams.WRAP_CONTENT);
			lpImage.addRule(RelativeLayout.CENTER_IN_PARENT, RelativeLayout.TRUE);

			// if has theme class apply it
			ThemeClassDefinition pinClass = mDefinition.getSelectionPinImageClass();
			if (pinClass!=null
					&& pinClass.getPinImageWidth()>0 && pinClass.getPinImageHeight()>0 )
			{
				imageView.setImageScaleType(pinClass.getPinImageScaleType());
				imageView.setImageSize(pinClass.getPinImageWidth(), pinClass.getPinImageHeight());
			}
			addView(imageView, lpImage);

		}

	}

	@Override
	public void addListener(GridEventsListener listener)
	{
		mView.addListener(listener);
	}

	@Override
	public void update(ViewData data)
	{
		mView.update(data);
	}

	public String getControlName()
	{
		return mDefinition.getGrid().getName();
	}

	@Override
	public void onCustomCreateOptionsMenu(Menu menu)
	{
		if (mView instanceof IGxMapView && mDefinition.getCanChooseMapType())
			MapViewHelper.addMapTypeMenu((IGxMapView)mView, menu);
	}

	public MapViewWrapper(Context context)
	{
		super(context);
		throw new UnsupportedOperationException("Unsupported constructor.");
	}

	@Override
	public Value getPropertyValue(String name) {
		// Maps must implement the interface to support these methods.
		final IGxMapViewRuntimeMethods mapView = Cast.as(IGxMapViewRuntimeMethods.class, mView);

		switch (name) {
			case GridHelper.PROPERTY_SELECTED_INDEX:
				if (mapView!=null)
					return Value.newInteger(mapView.getSelectedIndex() + 1);
		}
		Services.Log.warning("Unsupported get map property: " + name);
		return null;
	}
	
	@Override
	public void setPropertyValue(String name, Value value) {
		// Maps must implement the interface to support these methods.
		final IGxMapViewRuntimeMethods mapView = Cast.as(IGxMapViewRuntimeMethods.class, mView);
		if (mapView!=null)
		{
			if (PROPERTY_MAP_DIRECTION_LAYER.equalsIgnoreCase(name))
				mapView.setDirectionsLayer( value.coerceToBoolean());
			else if (PROPERTY_MAP_ANIMATION_LAYER.equalsIgnoreCase(name))
				mapView.setAnimationLayer( value.coerceToBoolean());
			else
				Services.Log.warning("Unsupported set map property: " + name);
		}
		else
			Services.Log.warning("Map control Unsupported runtime properties. set property: " + name);
	}


	@Override
	public Value callMethod(String name, List<Value> parameters)
	{
		runLayersMethods(name, parameters);
		runRuntimeMethods(name, parameters);

		return null;
	}

	private void runLayersMethods(String name, List<Value> parameters)
	{
		final IGxMapViewSupportLayers mapView = Cast.as(IGxMapViewSupportLayers.class, mView);
		if (mapView == null) // Maps must implement the interface to support these methods.
			return;

		if (METHOD_LOAD_KML.equalsIgnoreCase(name) && parameters.size() == 3)
		{
			final String layerId = parameters.get(0).coerceToString();
			final String kmlString = parameters.get(1).coerceToString();
			final boolean visible = Services.Strings.tryParseBoolean(String.valueOf(parameters.get(2)), true);

			// Remove previous layer with same id, if any.
			MapLayer previousLayer = mLayers.get(layerId);
			if (previousLayer != null)
				mapView.removeLayer(previousLayer);

			// Deserialize and add new layer.
			// NOTE: This is asynchronous because the file may be on the server (and even if not, KML parsing is expensive).

			KmlReaderAsyncTask kmlReaderTask = new KmlReaderAsyncTask(Maps.getProvider(getContext()))
			{
				@Override
				protected void onPostExecute(MapLayer result)
				{
					if (result != null)
					{
						result.id = layerId;
						mLayers.put(layerId, result);

						mapView.addLayer(result);

						if (!visible)
							mapView.setLayerVisible(result, false);
					}
				}
			};
			kmlReaderTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR, kmlString);
		}
		else if (METHOD_SET_LAYER_VISIBLE.equalsIgnoreCase(name) && parameters.size() == 2)
		{
			MapLayer layer = mLayers.get(parameters.get(0).coerceToString());
			if (layer != null)
				mapView.setLayerVisible(layer, Services.Strings.tryParseBoolean(String.valueOf(parameters.get(1)), false));
		}
		else if (METHOD_ADJUST_VISIBLE_AREA_TO_LAYER.equalsIgnoreCase(name) && parameters.size() == 1)
		{
			MapLayer layer = mLayers.get(parameters.get(0).coerceToString());
			if (layer != null)
				mapView.adjustBoundsToLayer(layer);
		}
		else if (METHOD_DRAW_GEOLINE.equalsIgnoreCase(name) && (parameters.size() == 1 || parameters.size() == 2 ))
		{
			String geoline = parameters.get(0).coerceToString();
			String lineClass = null;
			if (parameters.size() == 2)
				lineClass = parameters.get(1).coerceToString();

			MapLayer mapLayer = new MapLayer();
			MapLayer.Polyline polyline = new MapLayer.Polyline();
			// add the geoline to the polyline.
			polyline.points.addAll(newMapLocationList(geoline));

			// apply the class to this polyline
			ThemeClassDefinition mapRouteClass = null;
			if (Strings.hasValue(lineClass))
				mapRouteClass = Services.Themes.getThemeClass(lineClass);
			applyClassToPolyline(polyline, mapRouteClass);

			mapLayer.features.add(polyline);

			mapView.addLayer(mapLayer);

		}
	}

	private void runRuntimeMethods(String name, List<Value> parameters)
	{
		final IGxMapViewRuntimeMethods mapView = Cast.as(IGxMapViewRuntimeMethods.class, mView);
		if (mapView == null) // Maps must implement the interface to support these methods.
			return;

		if (METHOD_SET_MAPCENTER.equalsIgnoreCase(name) && (parameters.size() == 1 || parameters.size() == 2 ))
		{
			String geoPoint = parameters.get(0).coerceToString();
			int zoomlevel = 0;
			if (parameters.size() == 2)
				zoomlevel = parameters.get(1).coerceToInt();

			// parse point as GeoPoint.
			Pair<Double, Double> pointPair = GeoFormats.parseGeopoint(geoPoint);
			if (pointPair==null)
			{
				// try parse as old format GeoLocation.
				pointPair = GeoFormats.parseGeolocation(geoPoint);
			}

			// set map center
			if (pointPair!=null)
				mapView.setMapCenter(newMapLocation(pointPair.first, pointPair.second), zoomlevel);

		}
		else if (METHOD_SET_ZOOMLEVEL.equalsIgnoreCase(name) && (parameters.size() == 1))
		{
			int zoomlevel = parameters.get(0).coerceToInt();
			mapView.setZoomLevel(zoomlevel);
		}
		else if (GridHelper.METHOD_SELECT.equalsIgnoreCase(name) && (parameters.size() == 1))
		{
			int index = parameters.get(0).coerceToInt();
			mapView.selectIndex(index - 1);
		}
		else if (GridHelper.METHOD_DESELECT.equalsIgnoreCase(name) && (parameters.size() == 1))
		{
			int index = parameters.get(0).coerceToInt();
			mapView.deselectIndex(index - 1);
		}
	}

	private List<IMapLocation> newMapLocationList(String geoline)
	{
		ArrayList<IMapLocation> list = new ArrayList<IMapLocation>();

		List<Pair<Double, Double>> path = GeoFormats.parseGeoline(geoline);
		// pair lat, lng
		for (Pair<Double, Double> coordinate : path)
			list.add(newMapLocation(coordinate.first, coordinate.second));

		return list;
	}

	private IMapLocation newMapLocation(double lat, double lng)
	{
		IMapsProvider maps = Maps.getProvider(getContext());
		return maps.newMapLocation(lat, lng);
	}

	public static void applyClassToPolyline(MapLayer.Polyline polyline, ThemeClassDefinition mapRouteClass)
	{
		if (mapRouteClass != null)
		{
			// width in pixels
			if (mapRouteClass.getLineWidth()>0)
				polyline.strokeWidth = (float)mapRouteClass.getLineWidth();
			polyline.strokeColor = ThemeUtils.getColorId(mapRouteClass.getStrokeColor());
		}
	}

	@Override
	public String getControlId()
	{
		return mDefinition.getGrid().getName();
	}
	
	@Override
	public void saveState(Map<String, Object> state)
	{
		if (mView instanceof IGxMapView)
		{
			String mapType = ((IGxMapView)mView).getMapType();
			state.put(PROPERTY_MAP_TYPE, mapType);
		}
	}
	
	@Override
	public void restoreState(Map<String, Object> state)
	{
		if (mView instanceof IGxMapView)
		{
			String mapType = (String)state.get(PROPERTY_MAP_TYPE);
			if (Strings.hasValue(mapType))
				((IGxMapView)mView).setMapType(mapType);
		}
	}
}
