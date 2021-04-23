package com.artech.controls.maps.baidu;

import android.content.Intent;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.widget.LinearLayout;

import com.artech.activities.ActivityHelper;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.utils.Strings;
import com.artech.common.UIActionHelper;
import com.artech.controls.maps.common.LocationPickerHelper;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BitmapDescriptorFactory;
import com.baidu.mapapi.map.MapPoi;
import com.baidu.mapapi.map.MapView;
import com.baidu.mapapi.map.MarkerOptions;
import com.baidu.mapapi.model.LatLng;

public class LocationPickerActivity extends AppCompatActivity
{
	private LocationPickerHelper mHelper;
	private MapView mMapView;
	private BaiduMap mMap;

	private int menuSelect = 2;
	private int menuCancel = 3;

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
    	ActivityHelper.onBeforeCreate(this);
		super.onCreate(savedInstanceState);
        ActivityHelper.initialize(this, savedInstanceState);

		setContentView(R.layout.map_layout);

		// set support toolbar
		ActivityHelper.setSupportActionBar(this);

		// Initialize map sdk if not done yet
		MapViewFactory.prepareMapManager();

		// Place the actual map view in the generic layout.
		mMapView = new MapView(this);
		LinearLayout mapContainer = findViewById(R.id.map_container);
		mapContainer.addView(mMapView, new LinearLayout.LayoutParams(LinearLayout.LayoutParams.MATCH_PARENT, LinearLayout.LayoutParams.MATCH_PARENT));

		mMap = mMapView.getMap();
		mMap.setMapType(BaiduMap.MAP_TYPE_NORMAL);
		mMapView.showZoomControls(true);

		mMapView.setFocusable(true);
		mMapView.setEnabled(true);
		mMapView.setClickable(true);

		mHelper = new LocationPickerHelper(this, true);


		mMap.setOnMapClickListener(new BaiduMap.OnMapClickListener()
		{
			@Override
			public void onMapClick(LatLng latLng)
			{
				mHelper.setPickedLocation(new MapLocation(latLng));
				updateMapStatePoint(latLng);
			}

			@Override
			public boolean onMapPoiClick(MapPoi mapPoi)
			{
				return false;
			}
		});

		initializeFromIntent();

	}

	@SuppressWarnings("deprecation")
	private void initializeFromIntent()
	{
		// Map position. If no value is set, center on current location.
		String mapLocation = getIntent().getStringExtra(LocationPickerHelper.EXTRA_LOCATION);
		if (!Strings.hasValue(mapLocation))
			mapLocation = MyApplication.getInstance().getGeoLocationHelper().getLocationString(MyApplication.getInstance().getGeoLocationHelper().getLastKnownLocation());

		LatLng latlng = MapUtils.stringToLatLng(mapLocation);
		if (latlng != null)
		{
			// Set marker.
			updateMapStatePoint(latlng);

			// Set center and radius.

		}
	}

	private void updateMapStatePoint(LatLng latLng)
	{
		if (mMap!=null && latLng!=null)
		{
			MarkerOptions markerOptions = new MarkerOptions();
			markerOptions.position(latLng);
			markerOptions.icon(BitmapDescriptorFactory.fromResource(R.drawable.red_markers));

			mMap.clear();
			mMap.addOverlay(markerOptions);
		}
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
		mMapView.onResume();
	}

	@Override
	protected void onPause()
	{
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
		mMapView.onDestroy();
		ActivityHelper.onDestroy(this);
		super.onDestroy();
	}


	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		MenuItem itemSelect = menu.add(Menu.NONE, menuSelect, Menu.NONE, com.artech.R.string.GX_BtnSelect);
		UIActionHelper.setStandardMenuItemImage(this, itemSelect, ActionDefinition.StandardAction.SAVE);
		itemSelect.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);

		MenuItem itemCancel = menu.add(Menu.NONE, menuCancel, Menu.NONE, com.artech.R.string.GXM_cancel);
		UIActionHelper.setStandardMenuItemImage(this, itemCancel, ActionDefinition.StandardAction.CANCEL);
		itemCancel.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);

		return super.onCreateOptionsMenu(menu);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		int itemId = item.getItemId();

		if (itemId == menuSelect)
		{
			mHelper.selectLocation();
		}
		else if (itemId == menuCancel)
		{
			mHelper.cancelSelect();
		}
		return super.onOptionsItemSelected(item);
	}

}
