package com.artech.controls.maps.gaode;

import android.content.Intent;
import android.os.Bundle;
import android.os.RemoteException;
import androidx.appcompat.app.AppCompatActivity;
import android.util.Pair;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

import com.amap.api.maps.AMap;
import com.amap.api.maps.AMap.OnMapClickListener;
import com.amap.api.maps.AMap.OnMarkerDragListener;
import com.amap.api.maps.AMapOptions;
import com.amap.api.maps.CameraUpdate;
import com.amap.api.maps.CameraUpdateFactory;
import com.amap.api.maps.MapView;
import com.amap.api.maps.MapsInitializer;
import com.amap.api.maps.model.BitmapDescriptorFactory;
import com.amap.api.maps.model.LatLng;
import com.amap.api.maps.model.Marker;
import com.amap.api.maps.model.MarkerOptions;
import com.artech.activities.ActivityHelper;
import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.common.LocationPickerHelper;

public class LocationPickerActivity extends AppCompatActivity implements OnMapClickListener, OnMarkerDragListener
{
	private LocationPickerHelper mHelper;
	private MapView mMapView;
	private Marker mSelectionMarker;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
    	ActivityHelper.onBeforeCreate(this);
		super.onCreate(savedInstanceState);
        ActivityHelper.initialize(this, savedInstanceState);

		setContentView(R.layout.map_layout);

		// set support toolbar
		ActivityHelper.setSupportActionBar(this);

		mHelper = new LocationPickerHelper(this, true);

		try
		{
			MapsInitializer.initialize(this);

			mMapView = MapViewFactory.createStandardMapView(this, new AMapOptions());
			LinearLayout container = findViewById(R.id.map_container);
			if (mMapView != null && container != null)
			{
				container.addView(mMapView, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

				mMapView.onCreate(savedInstanceState);
				mMapView.getMap().setOnMapClickListener(LocationPickerActivity.this);
				mMapView.getMap().setOnMarkerDragListener(LocationPickerActivity.this);
				initializeFromIntent();
			}
		}
		catch (RemoteException e)
		{
			Services.Log.error(e);
		}
	}

	@SuppressWarnings("deprecation")
	private void initializeFromIntent()
	{
		// Map type (standard, satellite, hybrid).
		String mapType = getIntent().getStringExtra(LocationPickerHelper.EXTRA_MAP_TYPE);
		mMapView.getMap().setMapType(GaodeMapsHelper.mapTypeToGaodeMapType(mapType));

		// Map position. If no value is set, center on current location.
		String mapLocation = getIntent().getStringExtra(LocationPickerHelper.EXTRA_LOCATION);
		if (!Strings.hasValue(mapLocation))
			mapLocation = MyApplication.getInstance().getGeoLocationHelper().getLocationString(MyApplication.getInstance().getGeoLocationHelper().getLastKnownLocation());

		if (Strings.hasValue(mapLocation))
		{
			Pair<Double, Double> locationCoordinates = GeoFormats.parseGeolocation(mapLocation);
			if (locationCoordinates != null)
			{
				// Set marker.
				LatLng latlng = new LatLng(locationCoordinates.first, locationCoordinates.second);
				onMapClick(latlng);

				// Set center and radius.
				MapLocationBounds bounds = new MapUtils(null).getDefaultBoundingBox(new MapLocation(latlng));
				final CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLngBounds(bounds.getLatLngBounds(), Services.Device.dipsToPixels(GxMapViewCamera.CAMERA_MARGIN_DIPS));

				mMapView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener()
				{
					@Override
					@SuppressWarnings("deprecation")
					public void onGlobalLayout()
					{
						// Important: this must be done AFTER layout because the camera update needs the map view to have been measured to work.
						mMapView.getMap().moveCamera(cameraUpdate);
						mMapView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
					}
				});
			}
		}
	}

	@Override
	public void onMapClick(LatLng point)
	{
		AMap map = mMapView.getMap();
		if (mSelectionMarker != null)
			map.clear();

		MarkerOptions markerOptions = new MarkerOptions();
		markerOptions.position(point);
		markerOptions.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_AZURE));
		markerOptions.draggable(true);

		mSelectionMarker = map.addMarker(markerOptions);
		setPickedLocation(point);
	}

	@Override
	protected void onNewIntent(Intent intent)
	{
		super.onNewIntent(intent);
		ActivityHelper.onNewIntent(this, intent);
	}

	@Override
	protected void onStart()
	{
		super.onStart();
		ActivityHelper.onStart(this);
	}

	@Override
	protected void onResume()
	{
		super.onResume();
		ActivityHelper.onResume(this);

		if (mMapView != null)
			mMapView.onResume();
	}

	@Override
	protected void onPause()
	{
		if (mMapView != null)
			mMapView.onPause();

		ActivityHelper.onPause(this);
		super.onPause();
	}

	@Override
	protected void onStop()
	{
		ActivityHelper.onStop(this);
		super.onStop();
	}

	@Override
	protected void onDestroy()
	{
		if (mMapView != null)
			mMapView.onDestroy();

		ActivityHelper.onDestroy(this);
		super.onDestroy();
	}

	@Override
	public void onMarkerDragStart(Marker marker)
	{
		setPickedLocation(marker.getPosition());
	}

	@Override
	public void onMarkerDrag(Marker marker)
	{
		setPickedLocation(marker.getPosition());
	}

	@Override
	public void onMarkerDragEnd(Marker marker)
	{
		setPickedLocation(marker.getPosition());
	}

	private void setPickedLocation(LatLng position)
	{
		mHelper.setPickedLocation(new MapLocation(position));
	}
}
