package com.genexus.controls.maps.googlev2;

import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import android.view.Menu;
import android.view.MenuItem;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.LinearLayout;
import android.widget.LinearLayout.LayoutParams;

import com.artech.R;
import com.artech.activities.ActivityHelper;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.UIActionHelper;
import com.artech.controls.maps.common.LocationPickerHelper;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.GoogleMap.OnMapClickListener;
import com.google.android.gms.maps.GoogleMap.OnMarkerDragListener;
import com.google.android.gms.maps.GoogleMapOptions;
import com.google.android.gms.maps.MapView;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.android.libraries.places.api.Places;
import com.google.android.libraries.places.api.model.Place;
import com.google.android.libraries.places.widget.Autocomplete;
import com.google.android.libraries.places.widget.AutocompleteActivity;
import com.google.android.libraries.places.widget.model.AutocompleteActivityMode;

import java.util.Arrays;
import java.util.List;

public class LocationPickerActivity extends AppCompatActivity implements OnMapClickListener, OnMarkerDragListener
{

	private LocationPickerHelper mHelper;
	private MapView mMapView;
	private GoogleMap mMap;
	private Marker mSelectionMarker;

	private static final int MENU_SELECT = 2;
	private static final int MENU_CANCEL = 3;
	private static final int MENU_SEARCH = 4;

	private static final int AUTOCOMPLETE_REQUEST_CODE = 2291;

	@Override
	protected void onCreate(Bundle savedInstanceState)
	{
    	ActivityHelper.onBeforeCreate(this);
		super.onCreate(savedInstanceState);
        ActivityHelper.initialize(this, savedInstanceState);

		setContentView(R.layout.map_layout);

		// set support toolbar
		ActivityHelper.setSupportActionBar(this);

		String apiKey = getResources().getString(R.string.GoogleServicesApiKey);
		if (!Places.isInitialized()) {
			Places.initialize(this, apiKey);
		}

		mHelper = new LocationPickerHelper(this, false);

        if (GoogleMapsHelper.checkGoogleMapsV2(this))
        {
			mMapView = MapViewFactory.createStandardMapView(this, new GoogleMapOptions());
			LinearLayout container = findViewById(R.id.map_container);
			if (mMapView != null && container != null)
			{
				container.addView(mMapView, new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
				mMapView.onCreate(savedInstanceState);

				mMapView.getMapAsync(googleMap -> {
					mMap = googleMap;

					googleMap.setOnMapClickListener(LocationPickerActivity.this);
					googleMap.setOnMarkerDragListener(LocationPickerActivity.this);
					initializeFromIntent();
				});
			}
		}
	}

	@SuppressWarnings("deprecation")
	private void initializeFromIntent()
	{
		// Map type (standard, satellite, hybrid).
		String mapType = getIntent().getStringExtra(LocationPickerHelper.EXTRA_MAP_TYPE);
		mMap.setMapType(GoogleMapsHelper.mapTypeToGoogleMapType(mapType));

		// Map position. If no value is set, center on current location.
		String mapLocation = getIntent().getStringExtra(LocationPickerHelper.EXTRA_LOCATION);
		if (!Strings.hasValue(mapLocation))
			mapLocation = MyApplication.getInstance().getGeoLocationHelper().getLocationString(MyApplication.getInstance().getGeoLocationHelper().getLastKnownLocation());

		LatLng latlng = MapUtils.stringToLatLng(mapLocation);
		if (latlng != null)
		{
			// Set marker.
			setPointOnMap(latlng);

			// Set center and radius.
			MapLocationBounds bounds = new MapUtils(null).getDefaultBoundingBox(new MapLocation(latlng));
			final CameraUpdate cameraUpdate = CameraUpdateFactory.newLatLngBounds(bounds.getLatLngBounds(), Services.Device.dipsToPixels(GxMapViewCamera.CAMERA_MARGIN_DIPS));

			mMapView.getViewTreeObserver().addOnGlobalLayoutListener(new OnGlobalLayoutListener()
			{
				@Override
				public void onGlobalLayout()
				{
					// Important: this must be done AFTER layout because the camera update needs the map view to have been measured to work.
					mMap.moveCamera(cameraUpdate);
					mMapView.getViewTreeObserver().removeOnGlobalLayoutListener(this);
				}
			});
		}
	}

	@Override
	public void onMapClick(LatLng point)
	{
		setPointOnMap(point);
	}

	public void setPointOnMap(LatLng point) {
		if (mSelectionMarker != null)
			mMap.clear();

		MarkerOptions markerOptions = new MarkerOptions();
		markerOptions.position(point);
		markerOptions.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_AZURE));
		markerOptions.draggable(true);

		mMap.moveCamera(CameraUpdateFactory.newLatLng(point));
		mSelectionMarker = mMap.addMarker(markerOptions);
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

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		MenuItem itemSelect = menu.add(Menu.NONE, MENU_SELECT, Menu.NONE, R.string.GX_BtnSelect);
		UIActionHelper.setStandardMenuItemImage(this, itemSelect, ActionDefinition.StandardAction.SAVE);
		itemSelect.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);

		MenuItem itemCancel = menu.add(Menu.NONE, MENU_CANCEL, Menu.NONE, R.string.GXM_cancel);
		UIActionHelper.setStandardMenuItemImage(this, itemCancel, ActionDefinition.StandardAction.CANCEL);
		itemCancel.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);

		MenuItem itemSearch = menu.add(Menu.NONE, MENU_SEARCH, Menu.NONE, R.string.GXM_search);
		UIActionHelper.setStandardMenuItemImage(this, itemSearch, ActionDefinition.StandardAction.SEARCH);
		itemSearch.setShowAsAction(MenuItem.SHOW_AS_ACTION_ALWAYS);

		return super.onCreateOptionsMenu(menu);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		int itemId = item.getItemId();

		if (itemId == MENU_SELECT)
		{
			mHelper.selectLocation();
		}
		else if (itemId == MENU_CANCEL)
		{
			mHelper.cancelSelect();
		}
		else if (itemId == MENU_SEARCH)
		{
			showAutocompleteSearchBox();
		}
		return super.onOptionsItemSelected(item);
	}

	private void showAutocompleteSearchBox() {
		List<Place.Field> fields = Arrays.asList(Place.Field.ID, Place.Field.NAME,
				Place.Field.LAT_LNG, Place.Field.ADDRESS);

		Intent intent = new Autocomplete.IntentBuilder(AutocompleteActivityMode.OVERLAY, fields)
				.build(this);
		startActivityForResult(intent, AUTOCOMPLETE_REQUEST_CODE);
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
		if (requestCode == AUTOCOMPLETE_REQUEST_CODE) {
			if (resultCode == AutocompleteActivity.RESULT_OK) {
				if (data == null) {
					throw new IllegalArgumentException("Place data returned is empty");
				} else {
					Place place = Autocomplete.getPlaceFromIntent(data);
					Services.Log.debug("Place selected: " + place.toString());
					if (place.getLatLng() == null) {
						Services.Log.warning("Place data doesn't contain LatLng value");
					} else {
						setPointOnMap(place.getLatLng());
					}
				}
			} else if (resultCode == AutocompleteActivity.RESULT_ERROR) {
				Status status = Autocomplete.getStatusFromIntent(data);
				Services.Log.error(status.toString());
			}
		}
	}
}
