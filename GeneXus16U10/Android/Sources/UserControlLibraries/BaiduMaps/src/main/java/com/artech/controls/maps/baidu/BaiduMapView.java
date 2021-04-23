package com.artech.controls.maps.baidu;

import java.util.ArrayList;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.graphics.Point;
import android.location.Location;
import android.view.View;
import android.widget.FrameLayout;

import com.artech.android.WithPermission;
import com.artech.application.MyApplication;
import com.artech.base.controls.IGxControlNotifyEvents;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.RunnableUtils;
import com.artech.controllers.ViewData;
import com.artech.controls.grids.GridAdapter;
import com.artech.controls.grids.GridHelper;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.IGxMapView;
import com.artech.controls.maps.common.MapItemViewHelper;
import com.artech.ui.Coordinator;
import com.baidu.location.BDLocation;
import com.baidu.location.BDLocationListener;
import com.baidu.location.LocationClient;
import com.baidu.location.LocationClientOption;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BaiduMapOptions;
import com.baidu.mapapi.map.MapStatus;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.map.Marker;
import com.baidu.mapapi.map.MyLocationConfiguration;
import com.baidu.mapapi.map.MyLocationData;
import com.baidu.mapapi.map.Projection;
import com.baidu.mapapi.model.inner.GeoPoint;

@SuppressLint("ViewConstructor")
public class BaiduMapView extends FrameLayout implements IGxMapView, IGxControlNotifyEvents
{
	private final Context mContext;
	private final Coordinator mCoordinator;
	private final GxMapViewDefinition mDefinition;

	private MapView mMapView;
	private BaiduMap mBaiduMap;

	private boolean mIsReady;
	private boolean mOnResumeInvoked;
	private boolean mOnDestroyInvoked;
	private boolean mDisableRequestPermission;

	private final MapUtils mUtils;

	private GridHelper mHelper;
	private GridAdapter mAdapter;

	private GxMapViewMarkers mMarkers;
	private GxMapViewCamera mCamera;
	private MapItemViewHelper mItemViewHelper;

	//private List<MapOverlayItem> mItems;
	//private MapItemizedOverlay mItemizedOverlay;

	private ViewData mPendingUpdate;
	private MapStatus mPendingCameraUpdate;
	private boolean mIsMarkerClickCameraChange;

	//private LoadMarkersTask mLoadMarkersTask;
	private GeoPoint mAutoCenter;

	private Location mMyLocation;
	private GeoPoint mCustomCenterLocation;
	private Double mCustomZoomRadius;

	private static final int ITEM_VIEW_WIDTH_MARGIN = 20; // dips
	private static final int MARKER_CAMERA_ANIMATION_DURATION = 500; // ms

	public BaiduMapView(Context context, Coordinator coordinator, GxMapViewDefinition definition)
	{
		super(context);
		mContext = context;
		mCoordinator = coordinator;
		mDefinition = definition;
		mUtils = new MapUtils(definition);
		initialize();
	}

	private void initialize()
	{
		mMapView = new MapView(this.getContext(), new BaiduMapOptions());
		this.addView(mMapView);
		mBaiduMap = mMapView.getMap();

		mHelper = new GridHelper(this, mCoordinator, mDefinition.getGrid());
		mAdapter = new GridAdapter(getContext(), mHelper, mDefinition.getGrid());
		mItemViewHelper = new MapItemViewHelper(this);

		mMapView.showZoomControls(true);

		mMapView.setFocusable(true);
		mMapView.setEnabled(true);
		mMapView.setClickable(true);

		if (Services.Strings.hasValue(mDefinition.getMapType()))
			setMapType(mDefinition.getMapType());

		//mItemizedOverlay = new MapItemizedOverlay(this, mDefinition.getPinImage());
		//mItemizedOverlay.setAdapter(mAdapter);
		//mItems = new ArrayList<MapOverlayItem>();

		mMarkers = new GxMapViewMarkers(getContext(), mBaiduMap, mDefinition);
		mCamera = new GxMapViewCamera(BaiduMapView.this);

		mBaiduMap.setMapType(BaiduMapsHelper.mapTypeToGoogleMapType(mDefinition.getMapType()));
		mBaiduMap.setOnMarkerClickListener(mMarkerClickListener);

		//mBaiduMap.setOnCameraChangeListener(mCameraChangeListener);

		makeMapReady();
	}

	private void makeMapReady()
	{
		mIsReady = true;
		ViewData pendingUpdate = mPendingUpdate;
		mPendingUpdate = null;

		if (pendingUpdate != null)
			update(pendingUpdate);
	}

	public MapView getMapView()
	{
		return mMapView;
	}

	public BaiduMap getBaiduMap()
	{
		return mBaiduMap;
	}

	@Override
	public void notifyEvent(EventType type)
	{
		switch (type)
		{
			case ACTIVITY_RESUMED :
				mMapView.onResume();
				mOnResumeInvoked = true;
				break;
			case ACTIVITY_PAUSED :
				mMapView.onPause();
				break;
			case ACTIVITY_DESTROYED :
				mMapView.onDestroy();
				onDestroyMap();
				mOnDestroyInvoked = true;
				break;
			default: break;
		}
	}

	GridHelper getHelper() { return mHelper; }

	@Override
	public void addListener(GridEventsListener listener)
	{
		mHelper.setListener(listener);
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
				mMapView.onResume();
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
			mMarkers.update(mapData);
			mCamera.update(mapData);
		}
	};

	// helper listenner for myLocation
	LocationClient mLocClient;
	public MyLocationListenner myListener = new MyLocationListenner();

	@SuppressWarnings("MissingPermission") // Checked by updateFromData()
	private final Runnable mRunnableEnableMyLocationLayer = new Runnable()
	{
		@Override
		public void run()
		{
			mBaiduMap.setMyLocationConfiguration(new MyLocationConfiguration(
							MyLocationConfiguration.LocationMode.NORMAL, true, null));

			mBaiduMap.setMyLocationEnabled(true);

			// show my location icon and animate it
			//if (mDefinition.getMyLocationImageResourceId()!=0)
			//	mBaiduMap.setOnMyLocationChangeListener(new GxMapOnMyLocationChangeListener());

			// 定位初始化
			mLocClient = new LocationClient(mContext);
			mLocClient.registerLocationListener(myListener);

			LocationClientOption option = new LocationClientOption();
			option.setOpenGps(true); // 打开gps
			option.setCoorType("bd09ll"); // 设置坐标类型
			option.setScanSpan(1000);
			mLocClient.setLocOption(option);
			mLocClient.start();

		}
	};

	// helper fields for mylocation
	private int mCurrentDirection = 0;
	private double mCurrentLat = 0.0;
	private double mCurrentLon = 0.0;
	private float mCurrentAccracy;

	private MyLocationData locData;
	boolean isFirstLoc = true; // 是否首次定位

	/**
	 * 定位SDK监听函数
	 */
	public class MyLocationListenner implements BDLocationListener
	{
		@Override
		public void onReceiveLocation(BDLocation location) {
			// map view 销毁后不在处理新接收的位置
			if (location == null || mMapView == null) {
				return;
			}
			mCurrentLat = location.getLatitude();
			mCurrentLon = location.getLongitude();
			mCurrentAccracy = location.getRadius();
			locData = new MyLocationData.Builder()
					.accuracy(location.getRadius())
					// 此处设置开发者获取到的方向信息，顺时针0-360
					.direction(mCurrentDirection).latitude(location.getLatitude())
					.longitude(location.getLongitude()).build();
			mBaiduMap.setMyLocationData(locData);

		}

		public void onReceivePoi(BDLocation poiLocation) {
		}
	}

	private final BaiduMap.OnMarkerClickListener mMarkerClickListener = new BaiduMap.OnMarkerClickListener()
	{
		@Override
		public boolean onMarkerClick(Marker marker)
		{
			// Show the "InfoWindow" associated to the marker.
			// Marker's InfoWindow cannot be used, because that view is not active. So we simulate it using this.
			Entity itemData = mMarkers.getMarkerData(marker);
			if (itemData != null)
			{
				// Do not show InfoWindow if item has no layout.
				if (mAdapter.isItemViewEmpty(itemData))
					return false;

				int position = mAdapter.getIndexOf(itemData);
				if (position != -1)
				{
					View itemView = mAdapter.getView(position, null, null);

					// Run default action if item detail is clicked.
					if (mDefinition.getGrid().getDefaultAction() != null)
						itemView.setOnClickListener(new OnItemViewClickListener(itemData));

					// Move camera to point (slightly off) and show item view afterwards.

					Projection projection = mBaiduMap.getProjection();
					Point centerPoint = projection.toScreenLocation(marker.getPosition());
					centerPoint.y -= Math.round(getHeight() * MapItemViewHelper.MARKER_INFO_WINDOW_OFF_CENTER_FACTOR);

					// TODO:animate camera baidu, show point view

					MapStatusUpdate cameraUpdate = MapStatusUpdateFactory.newLatLng(projection.fromScreenLocation(centerPoint));
					mBaiduMap.setOnMapStatusChangeListener(new OnMarkerCameraUpdateCallback(itemView));
					mBaiduMap.animateMapStatus(cameraUpdate, MARKER_CAMERA_ANIMATION_DURATION);
					//mMap.animateCamera(cameraUpdate, MARKER_CAMERA_ANIMATION_DURATION, new OnMarkerCameraUpdateCallback(itemView));


					//CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLng(projection.fromScreenLocation(centerPoint));
					//mMap.animateCamera(cameraUpdate, MARKER_CAMERA_ANIMATION_DURATION, new OnMarkerCameraUpdateCallback(itemView));
					return true;
				}
			}

			return false;
		}
	};

	// TODO update item baidu
	private class OnMarkerCameraUpdateCallback implements BaiduMap.OnMapStatusChangeListener
	{
		private View mItemView;

		OnMarkerCameraUpdateCallback(View itemView)
		{
			mItemView = itemView;
		}

		@Override
		public void onMapStatusChangeStart(MapStatus status)
		{
			// Remove item view when the map is scrolled, if any.
			mItemViewHelper.removeCurrentItem();
		}

		@Override
		public void onMapStatusChangeFinish(MapStatus status)
		{
			Services.Log.debug("baidumaps updateCamera finish!");

			if (mItemView!=null)
			{
				Services.Log.debug("baidumaps updateCamera finish, show ItemView!");

				mItemViewHelper.displayItem(mItemView);
				mIsMarkerClickCameraChange = true;

				// already add, remove it reference
				mItemView = null;
			}
		}

		@Override
		public void onMapStatusChange(MapStatus status)
		{
		}

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

	@Override
	public String getMapType()
	{
		if (mBaiduMap.getMapType()==BaiduMap.MAP_TYPE_SATELLITE)
			return GxMapViewDefinition.MAP_TYPE_SATELLITE;
		else
			return GxMapViewDefinition.MAP_TYPE_STANDARD;
	}

	@Override
	public void setMapType(String type)
	{
		boolean isSatellite = (type.equalsIgnoreCase(GxMapViewDefinition.MAP_TYPE_SATELLITE) || type.equalsIgnoreCase(GxMapViewDefinition.MAP_TYPE_HYBRID));
		if (isSatellite)
			mBaiduMap.setMapType(BaiduMap.MAP_TYPE_SATELLITE);
		else
			mBaiduMap.setMapType(BaiduMap.MAP_TYPE_NORMAL);

	}

	protected void onDestroyMap()
	{
		// 退出时销毁定位
		if (mLocClient!=null)
			mLocClient.stop();
		// 关闭定位图层
		if (mBaiduMap!=null)
			mBaiduMap.setMyLocationEnabled(false);
	}

}
