package com.genexus.controls.maps.googlev2;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.location.Location;
import android.os.Bundle;
import android.os.Handler;
import android.os.SystemClock;
import android.view.View;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;

import com.artech.android.WithPermission;
import com.artech.application.MyApplication;
import com.artech.base.controls.IGxControlNotifyEvents;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.base.utils.RunnableUtils;
import com.artech.controllers.ViewData;
import com.artech.controls.grids.GridAdapter;
import com.artech.controls.grids.GridHelper;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.IGxMapView;
import com.artech.controls.maps.common.IGxMapViewRuntimeMethods;
import com.artech.controls.maps.common.IMapLocation;
import com.artech.controls.maps.common.MapItemViewHelper;
import com.artech.controls.maps.common.IGxMapViewSupportLayers;
import com.artech.controls.maps.common.MapLayer;
import com.artech.ui.Coordinator;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.*;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.Projection;
import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.LatLngBounds;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.gms.maps.model.Polygon;
import com.google.android.gms.maps.model.PolygonOptions;
import com.google.android.gms.maps.model.Polyline;
import com.google.android.gms.maps.model.PolylineOptions;

public class GxMapView extends MapView implements IGxMapView, IGxControlNotifyEvents, IGxMapViewSupportLayers, IGxMapViewRuntimeMethods
{
	private final Coordinator mCoordinator;
	private final GxMapViewDefinition mDefinition;

	private boolean mIsReady;
	private boolean mOnResumeInvoked;
	private boolean mOnDestroyInvoked;
	private boolean mDisableRequestPermission;

	private GoogleMap mMap;
	private GridHelper mHelper;
	private GridAdapter mAdapter;
	private GxMapViewMarkers mMarkers;
	private GxMapViewCamera mCamera;
	private MapItemViewHelper mItemViewHelper;

	private ArrayList<MapLayer> mPendingLayers = new ArrayList<MapLayer>();
	private ViewData mPendingUpdate;
	private CameraUpdate mPendingCameraUpdate;
	private boolean mIsMarkerClickCameraChange;

	private static final int ITEM_VIEW_WIDTH_MARGIN = 20; // dips
	private static final int MARKER_CAMERA_ANIMATION_DURATION = 500; // ms

	private static final String EVENT_CONTROL_VALUE_CHANGED = "ControlValueChanged";
	private static final String EVENT_CONTROL_VALUE_CHANGING = "ControlValueChanging";

	private int mSelectedIndex = -1;
	private LatLng mLastCenterSet = null;

	private boolean mAddDirectionLayer = false;
	private MapRouteLayer mRouteLayer = null;

	private boolean mAddAnimationLayer = false;

	private boolean mUpdateFromDataReady = false;


	@SuppressWarnings("UnusedParameters")
	public GxMapView(Context context, Coordinator coordinator, GxMapViewDefinition definition)
	{
		super(context, new GoogleMapOptions());
		mCoordinator = coordinator;
		mDefinition = definition;
		onCreate(new Bundle());
		initialize();
	}

	// TODO: Pass on events: onSaveInstanceState(Bundle) & onLowMemory().
	@SuppressWarnings("deprecation")
	private void initialize()
	{
		mHelper = new GridHelper(this, mCoordinator, mDefinition.getGrid());
		mHelper.setReservedSpace(ITEM_VIEW_WIDTH_MARGIN);

		mAdapter = new GridAdapter(getContext(), mHelper, mDefinition.getGrid());
		mItemViewHelper = new MapItemViewHelper(this);

		mAddDirectionLayer = mDefinition.getShowDirectionsLayer();
		mAddAnimationLayer = mDefinition.getShowAnimationLayer();

		getMapAsync(new OnMapReadyCallback()
		{
			@Override
			public void onMapReady(final GoogleMap googleMap)
			{
				mMap = googleMap;

				mMarkers = new GxMapViewMarkers(getContext(), googleMap, mDefinition);
				mCamera = new GxMapViewCamera(GxMapView.this);

				googleMap.setMapType(GoogleMapsHelper.mapTypeToGoogleMapType(mDefinition.getMapType()));
				googleMap.setOnMarkerClickListener(mMarkerClickListener);
				googleMap.setOnCameraChangeListener(mCameraChangeListener);

				if (mDefinition.getShowSelectionLayer())
				{
					googleMap.setOnCameraIdleListener(mCameraIdleListener);
					googleMap.setOnCameraMoveListener(mCameraMoveListener);
				}

				// set traffic
				if (mDefinition.getShowTraffic())
				{
					googleMap.setTrafficEnabled(true);
				}

				makeMapReady();
			}
		});
	}

	private void makeMapReady()
	{
		mIsReady = true;
		ViewData pendingUpdate = mPendingUpdate;
		mPendingUpdate = null;

		if (pendingUpdate != null)
			update(pendingUpdate);
	}

	@Override
	public void notifyEvent(EventType type)
	{
		if (mOnDestroyInvoked)
			return; // Ignore double onDestroy().

		switch (type)
		{
			case ACTIVITY_RESUMED:
				onResume();
				mOnResumeInvoked = true;
				break;

			case ACTIVITY_PAUSED:
				onPause();
				break;

			case ACTIVITY_DESTROYED:
				onDestroy();
				mOnDestroyInvoked = true;
				break;

			default:
				// Only interested in being notified for the onResume, onPause & onDestroy activity events.
		}
	}

	GridAdapter getAdapter() { return mAdapter; }

	@Override
	public void addListener(GridEventsListener listener)
	{
		mHelper.setListener(listener);
	}

	void animateCamera(CameraUpdate update)
	{
		if (mMap != null)
		{
			try
			{
				mMap.animateCamera(update);
				return; // Done!
			}
			catch (IllegalStateException e)
			{
				// Map is not ready.
			}
		}

		mPendingCameraUpdate = update;
	}

	@Override
	public void update(ViewData data)
	{
		if (mIsReady)
		{
			// MapView.onResume() may not have been called if the fragment was added
			// afterwards (e.g. with slide navigation).
			if (!mOnResumeInvoked)
			{
				mOnResumeInvoked = true;
				// do not resume mapview is already destroy. (e.g. replace in client start)
				if (!mOnDestroyInvoked)
					onResume();
			}

			mAdapter.setData(data);

			// Add markers and position camera according to center/zoom properties.
			updateFromData();
		}
		else
			mPendingUpdate = data;
	}

	@SuppressWarnings("deprecation")
	private void updateFromData()
	{
		// We have two tasks that MAY need the location permissions: "update map" (if the location
		// participates in boundary calculations) and "show my location".
		ArrayList<Runnable> tasksWithLocationSuccess = new ArrayList<>();
		ArrayList<Runnable> tasksWithLocationFailure = new ArrayList<>();
		ArrayList<Runnable> standaloneTasks = new ArrayList<>();

		if (mDefinition.getShowMyLocation())
			tasksWithLocationSuccess.add(mRunnableEnableMyLocationLayer);

		if (mDefinition.needsUserLocationForMapBounds())
		{
			// If we don't get the location permission, we still need to load the data.
			// We will have to make do without the user's location (e.g. bounds will be inaccurate).
			tasksWithLocationSuccess.add(mRunnableUpdateFromData);
			tasksWithLocationFailure.add(mRunnableUpdateFromData);
		}
		else
			standaloneTasks.add(mRunnableUpdateFromData);

		// If the request is denied, don't ask permission again in this screen (e.g. on refresh).
		tasksWithLocationFailure.add(new Runnable()
		{
			@Override
			public void run()
			{
				mDisableRequestPermission = true;
			}
		});

		// We fire the "standalone" tasks immediately, and ask permission for the others.
		RunnableUtils.chainRunnables(standaloneTasks).run();

		if (!mDisableRequestPermission && !tasksWithLocationSuccess.isEmpty())
		{
			WithPermission.Builder<Void> permissionRequestBuilder =
				new WithPermission.Builder<Void>((Activity) getContext())
					.require(MyApplication.getInstance().getGeoLocationHelper().getRequiredPermissions())
					.setRequestCode(200)
					.attachToActivityController()
					.onSuccess(RunnableUtils.chainRunnables(tasksWithLocationSuccess))
					.onFailure(RunnableUtils.chainRunnables(tasksWithLocationFailure));

			permissionRequestBuilder.build().run();
		}
		else
			RunnableUtils.chainRunnables(tasksWithLocationFailure).run();
	}

	private final Runnable mRunnableUpdateFromData = new Runnable()
	{
		@Override
		public void run()
		{
			GxMapViewData mapData = new GxMapViewData(mDefinition, mAdapter.getData());
			Services.Log.debug("update from data");

			mMarkers.update(mapData, mAddAnimationLayer);

			mCamera.update(mapData);

			// set direction layer
			if (mAddDirectionLayer)
			{
				// create direction layer
				mRouteLayer = new MapRouteLayer(GxMapView.this);
				// add layer to map
				boolean zoomToLayer = mDefinition.getInitialZoom()== GxMapViewDefinition.INITIAL_ZOOM_DEFAULT;
				mRouteLayer.addRouteLayer(mapData, mDefinition.getRouteTransportType(), mDefinition.getRouteClass(), zoomToLayer);
			}

			mUpdateFromDataReady = true;

			// Draw pending layers.
			// Draw it in every update from data, because update clear the map at refresh.
			for (MapLayer layer : mPendingLayers)
			{
				GxMapView.this.addLayer(layer);
			}
		}
	};

	@SuppressWarnings({"deprecation", "MissingPermission"}) // Checked by updateFromData()
	private final Runnable mRunnableEnableMyLocationLayer = new Runnable()
	{
		@Override
		public void run()
		{
			mMap.setMyLocationEnabled(true);

			// show my location icon and animate it
			if (mDefinition.getMyLocationImageResourceId()!=0)
				mMap.setOnMyLocationChangeListener(new GxMapOnMyLocationChangeListener());
		}
	};

	@SuppressWarnings("deprecation")
	private class GxMapOnMyLocationChangeListener implements GoogleMap.OnMyLocationChangeListener
	{
		Marker mPositionMarker;
		BitmapDescriptor mBitmapDescriptor;

		@Override
		public void onMyLocationChange(Location location)
		{
			Services.Log.debug("onMyLocationChange");
			if (location == null)
				return;

			Services.Log.debug("onMyLocationChange 2 ");
			int myLocationIconResourceId = mDefinition.getMyLocationImageResourceId();
			if (myLocationIconResourceId != 0)
			{
				Services.Log.debug("onMyLocationChange 3 "+ myLocationIconResourceId);
				if (mBitmapDescriptor==null)
					mBitmapDescriptor = BitmapDescriptorFactory.fromResource(myLocationIconResourceId);

				if (mPositionMarker == null)
				{
					Services.Log.debug("onMyLocationChange 4 new marker "+ myLocationIconResourceId);
					mPositionMarker = mMap.addMarker(new MarkerOptions()
							.flat(true)
							.icon(mBitmapDescriptor)
							.anchor(0.5f, 0.5f)
							.position(	new LatLng(location.getLatitude(), location.getLongitude())));

				}
				else
				{
					//update market
					Services.Log.debug("onMyLocationChange 5 update marker "+ myLocationIconResourceId);
					mPositionMarker.setIcon(mBitmapDescriptor);

					mPositionMarker.setPosition(new LatLng(location.getLatitude(), location
							.getLongitude()));
				}

				// animation
				animateMarker(mPositionMarker, location); // Helper method for smooth
			}
		}

		private void animateMarker(final Marker marker, final Location location)
		{
			final Handler handler = new Handler();
			final long start = SystemClock.uptimeMillis();
			final LatLng startLatLng = marker.getPosition();
			final double startRotation = marker.getRotation();
			final long duration = 500;

			final Interpolator interpolator = new LinearInterpolator();

			handler.post(new Runnable()
			{
				@Override
				public void run()
				{
					long elapsed = SystemClock.uptimeMillis() - start;
					float t = interpolator.getInterpolation((float) elapsed
							/ duration);

					double lng = t * location.getLongitude() + (1 - t)
							* startLatLng.longitude;
					double lat = t * location.getLatitude() + (1 - t)
							* startLatLng.latitude;

					float rotation = (float) (t * location.getBearing() + (1 - t)
							* startRotation);

					marker.setPosition(new LatLng(lat, lng));
					marker.setRotation(rotation);

					if (t < 1.0) {
						// Post again 16ms later.
						handler.postDelayed(this, 16);
					}
				}
			});
		}

	}


	private final OnMarkerClickListener mMarkerClickListener = new OnMarkerClickListener()
	{
		@Override
		public boolean onMarkerClick(Marker marker)
		{
			// Show the "InfoWindow" associated to the marker.
			// Marker's InfoWindow cannot be used, because that view is not active. So we simulate it using this.
			Entity itemData = mMarkers.getMarkerData(marker);
			if (itemData != null)
			{
				// run MapViewItemTap event, experimental
				//if (mDefinition.getGrid().getLayout().getParent()!=null)
				//{
				//	ActionDefinition actionDefinition = mDefinition.getGrid().getLayout().getParent().getEvent("MapViewItemTap");
				//	if (actionDefinition != null)
				//	{
				//		mHelper.runAction(actionDefinition, itemData, new Anchor(GxMapView.this));
				//		return true;
				//	}
				//}

				// Do not show InfoWindow if item has no layout.
				if (mAdapter.isItemViewEmpty(itemData))
					return false;

				int position = mAdapter.getIndexOf(itemData);
				if (position != -1)
				{
					View itemView = mAdapter.getView(position, null, null);

					selectMarkerInMap(marker.getPosition(), itemData, itemView);

					// selected index position
					if (position != mSelectedIndex)
					{
						mSelectedIndex = position;
						raiseControlSelectionChangedEvent();
					}
					return true;
				}
			}

			return false;
		}
	};

	private void selectMarkerInMap(LatLng position, Entity itemData, View itemView)
	{
		// Run default action if item detail is clicked.
		if (mDefinition.getGrid().getDefaultAction() != null)
			itemView.setOnClickListener(new OnItemViewClickListener(itemData));

		// Move camera to point (slightly off) and show item view afterwards.
		Projection projection = mMap.getProjection();
		Point centerPoint = projection.toScreenLocation(position);
		centerPoint.y -= Math.round(getHeight() * MapItemViewHelper.MARKER_INFO_WINDOW_OFF_CENTER_FACTOR);

		CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLng(projection.fromScreenLocation(centerPoint));
		mMap.animateCamera(cameraUpdate, MARKER_CAMERA_ANIMATION_DURATION, new OnMarkerCameraUpdateCallback(itemView));
	}

	private class OnMarkerCameraUpdateCallback implements CancelableCallback
	{
		private final View mItemView;

		OnMarkerCameraUpdateCallback(View itemView)
		{
			mItemView = itemView;
		}

		@Override
		public void onFinish()
		{
			mItemViewHelper.displayItem(mItemView);
			mIsMarkerClickCameraChange = true;
		}

		@Override
		public void onCancel() { }
	}

	private class OnItemViewClickListener implements OnClickListener
	{
		private final Entity mItemData;

		private OnItemViewClickListener(Entity itemData)
		{
			mItemData = itemData;
		}

		@Override
		public void onClick(View v)
		{
			mHelper.runDefaultAction(mItemData);
		}
	}

	@SuppressWarnings("deprecation")
	private final OnCameraChangeListener mCameraChangeListener = new OnCameraChangeListener()
	{
		@Override
		public void onCameraChange(CameraPosition position)
		{
			// Fire camera update if it was pending due to layout not having been performed yet.
			if (mPendingCameraUpdate != null)
			{
				CameraUpdate pendingUpdate = mPendingCameraUpdate;
				mPendingCameraUpdate = null;

				GxMapView.this.animateCamera(pendingUpdate);
			}

			if (mIsMarkerClickCameraChange)
			{
				mIsMarkerClickCameraChange = false;
				return;
			}

			// Remove item view when the map is scrolled.
			mItemViewHelper.removeCurrentItem();
			if (mSelectedIndex!=-1)
			{
				// selected index none
				mSelectedIndex = -1;
				raiseControlSelectionChangedEvent();
			}
		}
	};

	private final OnCameraIdleListener mCameraIdleListener = new OnCameraIdleListener()
	{
		@Override
		public void onCameraIdle()
		{
			raiseControlChangeEvent(EVENT_CONTROL_VALUE_CHANGED);
		}
	};

	private final OnCameraMoveListener mCameraMoveListener = new OnCameraMoveListener()
	{
		@Override
		public void onCameraMove()
		{
			raiseControlChangeEvent(EVENT_CONTROL_VALUE_CHANGING);
		}
	};

	private void raiseControlChangeEvent(String eventName)
	{
		CameraPosition position = mMap.getCameraPosition();
		LatLng center = position.target;

		// raise event  ?  Event Grid1.ControlValueChanged(&geoPoint)
		// this will be when dragging is over.
		// use coordinator
		// control that should raise grid events
		View gridControl = (View) GxMapView.this.getParent();
		ActionDefinition actionDef = mCoordinator.getControlEventHandler(gridControl, eventName);
		// Check if the control implements this event.
		if (actionDef!=null)
		{
			// execute event
			List<ActionParameter> params = actionDef.getEventParameters();
			if (params.size() != 1) {
				throw new IllegalArgumentException(eventName + " requires a parameter.");
			}
			String paramName = params.get(0).getValue();
			String geoValue = GeoFormats.buildGeopoint(center.latitude, center.longitude);
			mCoordinator.setValue(paramName, geoValue);
			mCoordinator.runControlEvent(gridControl, eventName);
		}
	}

	@Override
	public String getMapType()
	{
		if (mMap != null)
			return GoogleMapsHelper.mapTypeFromGoogleMapType(mMap.getMapType());
		else
			return GxMapViewDefinition.MAP_TYPE_STANDARD;
	}

	@Override
	public void setMapType(String mapType)
	{
		if (mMap != null)
			mMap.setMapType(GoogleMapsHelper.mapTypeToGoogleMapType(mapType));
	}

	@Override
	public void addLayer(MapLayer layer)
	{
		if (mMap == null)
			return;

		if (!mUpdateFromDataReady) {
			mPendingLayers.add(layer);
			return;
		}

		for (MapLayer.MapFeature feature : layer.features)
		{
			if (feature.type == MapLayer.FeatureType.Polygon)
			{
				MapLayer.Polygon polygon = (MapLayer.Polygon)feature;
				
				PolygonOptions options = new PolygonOptions();
				options.geodesic(true);
				
				// Polygon points, holes, and other properties.
				options.addAll(MapLocation.listToLatLng(polygon.outerBoundary));
				for (List<IMapLocation> hole : polygon.holes)
					options.addHole(MapLocation.listToLatLng(hole));
				if (polygon.strokeWidth != null)
					options.strokeWidth(polygon.strokeWidth);
				if (polygon.strokeColor != null)
					options.strokeColor(polygon.strokeColor);
				if (polygon.fillColor != null)
					options.fillColor(polygon.fillColor);

				// Add the polygon and store the reference to the map object.
				feature.mapObject = mMap.addPolygon(options);
			}
			else if (feature.type == MapLayer.FeatureType.Polyline)
			{
				MapLayer.Polyline polyline = (MapLayer.Polyline)feature;

				PolylineOptions options = new PolylineOptions();
				options.geodesic(true);

				// Polyline points and other properties.
				options.addAll(MapLocation.listToLatLng(polyline.points));
				if (polyline.strokeWidth != null)
					options.width(polyline.strokeWidth);
				if (polyline.strokeColor != null)
					options.color(polyline.strokeColor);

				feature.mapObject = mMap.addPolyline(options);
			}
		}
	}

	@Override
	public void removeLayer(MapLayer layer)
	{
		for (MapLayer.MapFeature feature : layer.features)
		{
			if (feature.type == MapLayer.FeatureType.Polygon)
				((Polygon)feature.mapObject).remove();
			else if (feature.type == MapLayer.FeatureType.Polyline)
				((Polyline)feature.mapObject).remove();
		}
	}

	@Override
	public void setLayerVisible(MapLayer layer, boolean visible)
	{
		for (MapLayer.MapFeature feature : layer.features)
		{
			if (feature.type == MapLayer.FeatureType.Polygon)
				((Polygon)feature.mapObject).setVisible(visible);
			else if (feature.type == MapLayer.FeatureType.Polyline)
				((Polyline)feature.mapObject).setVisible(visible);
		}
	}

	@Override
	public void adjustBoundsToLayer(MapLayer layer)
	{
		boolean builderHasPoint = false;
		LatLngBounds.Builder builder = LatLngBounds.builder();
		{
			for (MapLayer.MapFeature feature : layer.features)
			{
				for (LatLng point : MapLocation.listToLatLng(feature.getPoints()))
				{
					builder.include(point);
					builderHasPoint = true;
				}
			}
		}

		if (builderHasPoint)
		{
			CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLngBounds(builder.build(), Services.Device.dipsToPixels(GxMapViewCamera.CAMERA_MARGIN_DIPS));
			animateCamera(cameraUpdate);
		}
	}


	public IMapLocation getLastMapCenter()
	{
		if (mLastCenterSet == null)
			return null;
		return new MapLocation(mLastCenterSet.latitude, mLastCenterSet.longitude);
	}

	@Override
	public void setMapCenter(IMapLocation location, int zoomLevel)
	{
		mLastCenterSet = new LatLng(location.getLatitude(), location.getLongitude());
		CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLng(mLastCenterSet);
		if (zoomLevel>0)
			cameraUpdate = CameraUpdateFactory.newLatLngZoom(new LatLng(location.getLatitude(), location.getLongitude()), zoomLevel);

		mMap.animateCamera(cameraUpdate, MARKER_CAMERA_ANIMATION_DURATION, null);

	}

	@Override
	public void setZoomLevel(int zoomLevel)
	{
		CameraPosition position = mMap.getCameraPosition();
		LatLng center = position.target;
		CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLngZoom(center, zoomLevel);
		mMap.animateCamera(cameraUpdate, MARKER_CAMERA_ANIMATION_DURATION, null);
	}

	@Override
	public void selectIndex(int index)
	{
		if (index >= 0)
		{
			// index in data , not in markers.
			if (index>= mAdapter.getCount())
			{
				Services.Log.debug("Index of map point not found " + index + " Total " + mAdapter.getCount());
				return;
			}

			Entity itemData = mAdapter.getEntity(index);
			if (itemData != null)
			{
				// Do not show InfoWindow if item has no layout.
				if (mAdapter.isItemViewEmpty(itemData))
					return ;

				// find map item  view and location
				GxMapViewData mapData = new GxMapViewData(mDefinition, mAdapter.getData());
				GxMapViewItem gxMapViewItem = mapData.newMapItem(itemData);
				if (gxMapViewItem == null)
				{
					Services.Log.debug("Marker not found. " + itemData.toString());
					return;
				}
				View itemView = mAdapter.getView(index, null, null);

				// select this item in map.
				selectMarkerInMap(gxMapViewItem.getLocation().getLatLng(), itemData, itemView);

				// selected index position
				if (index != mSelectedIndex)
				{
					mSelectedIndex = index;
					raiseControlSelectionChangedEvent();
				}
			}
		}
	}

	@Override
	public void deselectIndex(int index)
	{
		if (index >= 0)
		{
			// Remove item view when deselect it.
			mItemViewHelper.removeCurrentItem();
			// selected index none
			if (mSelectedIndex!=-1)
			{
				mSelectedIndex = -1;
				raiseControlSelectionChangedEvent();
			}
		}
	}

	@Override
	public int getSelectedIndex()
	{
		return mSelectedIndex;
	}

	private void raiseControlSelectionChangedEvent()
	{
		// use coordinator
		// control that should raise grid events
		View gridControl = (View) GxMapView.this.getParent();
		ActionDefinition actionDef = mCoordinator.getControlEventHandler(gridControl, GridHelper.EVENT_SELECTION_CHANGED);
		// Check if the control implements this event.
		if (actionDef!=null)
		{
			// execute event
			mCoordinator.runControlEvent(gridControl, GridHelper.EVENT_SELECTION_CHANGED);
		}
	}

	@Override
	public void setDirectionsLayer(boolean directionsLayer)
	{
		if (directionsLayer)
		{
			mAddDirectionLayer = true;
			if (mUpdateFromDataReady)
			{
				GxMapViewData mapData = new GxMapViewData(mDefinition, mAdapter.getData());
				boolean zoomToLayer = mDefinition.getInitialZoom()== GxMapViewDefinition.INITIAL_ZOOM_DEFAULT;
				if (mRouteLayer == null)
				{
					// create direction layer
					mRouteLayer = new MapRouteLayer(GxMapView.this);
				} else
				{
					mRouteLayer.removeRouteLayer();
				}
				// add layer to map
				mRouteLayer.addRouteLayer(mapData, mDefinition.getRouteTransportType(), mDefinition.getRouteClass(), zoomToLayer);
			}
		}
		else
		{
			mAddDirectionLayer = false;
			if (mRouteLayer!=null)
				mRouteLayer.removeRouteLayer();
		}
	}

	@Override
	public void setAnimationLayer(boolean useAnimationLayer)
	{
		mAddAnimationLayer = useAnimationLayer;
	}
}
