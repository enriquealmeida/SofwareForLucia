package com.artech.controls.maps.gaode;

import java.util.HashMap;

import android.location.Location;
import android.os.AsyncTask;

import com.amap.api.maps.AMap;
import com.amap.api.maps.model.BitmapDescriptor;
import com.amap.api.maps.model.BitmapDescriptorFactory;
import com.amap.api.maps.model.LatLng;
import com.amap.api.maps.model.Marker;
import com.amap.api.maps.model.MarkerOptions;
import com.artech.application.MyApplication;
import com.artech.base.model.Entity;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.MapPinHelper;

class GxMapViewMarkers
{
	private final AMap mMap;
	private final GxMapViewDefinition mDefinition;
	private HashMap<String, GxMapViewItem> mMarkerData;

	private LoaderTask mTask;
	private MapPinHelper mPinHelper;

	public GxMapViewMarkers(GxMapView mapView, GxMapViewDefinition definition)
	{
		mMap = mapView.getMap();
		mDefinition = definition;
		mMarkerData = new HashMap<String, GxMapViewItem>();
		mPinHelper = new MapPinHelper(mapView.getContext(), mDefinition);
	}

	public void update(GxMapViewData mapData)
	{
		if (mTask != null)
			mTask.cancel(true);

		mMap.clear();
		mTask = new LoaderTask();
		mTask.execute(mapData);
	}

	public Entity getMarkerData(Marker marker)
	{
		GxMapViewItem mapItem = mMarkerData.get(marker.getId());
		if (mapItem != null)
			return mapItem.getData();
		else
			return null;
	}


	private class LoaderTask extends AsyncTask<GxMapViewData, MarkerInfo, Void>
	{
		@SuppressWarnings("deprecation")
		@Override
		protected Void doInBackground(GxMapViewData... params)
		{
			GxMapViewData mapData = params[0];
			for (GxMapViewItem item : mapData)
			{
				if (isCancelled())
					return null;

				MarkerOptions marker = new MarkerOptions();
				marker.position(item.getLocation().getLatLng());
				marker.icon(getMarkerImage(item.getData()));

				publishProgress(new MarkerInfo(marker, item));
			}

			if (mDefinition.getShowMyLocation())
			{
				Location myLocation = MyApplication.getInstance().getGeoLocationHelper().getLastKnownLocation();
				if (myLocation != null)
				{
					// Add 'My Location' as a marker. AMap.setMyLocationEnabled() does not work.
					MarkerOptions marker = new MarkerOptions();

					LatLng myLatLng = new LatLng(myLocation.getLatitude(), myLocation.getLongitude());
					marker.position(myLatLng);

					marker.icon(BitmapDescriptorFactory.fromResource(R.drawable.pin_here_arrow));
					publishProgress(new MarkerInfo(marker, null));
				}
			}

			return null;
		}

		@Override
		protected void onProgressUpdate(MarkerInfo... values)
		{
			Marker marker = mMap.addMarker(values[0].Options);

			if (values[0].Data != null)
				mMarkerData.put(marker.getId(), values[0].Data);
		}
	}

	@SuppressWarnings({"InconsistentCapitalization", "checkstyle:MemberName"})
	private static class MarkerInfo
	{
		final MarkerOptions Options;
		final GxMapViewItem Data;

		MarkerInfo(MarkerOptions options, GxMapViewItem data)
		{
			Options = options;
			Data = data;
		}
	}

	private BitmapDescriptor getMarkerImage(Entity itemData)
	{
		MapPinHelper.ResourceOrBitmap pin = mPinHelper.getPinImage(itemData);
		
		if (pin.resourceId != null)
			return BitmapDescriptorFactory.fromResource(pin.resourceId);
		else if (pin.bitmap != null)
			return BitmapDescriptorFactory.fromBitmap(pin.bitmap);
		else
			return BitmapDescriptorFactory.defaultMarker();
	}
}
