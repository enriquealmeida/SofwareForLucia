package com.artech.controls.maps.baidu;

import android.content.Context;
import android.os.AsyncTask;
import androidx.annotation.NonNull;

import com.artech.base.model.Entity;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.MapPinHelper;
import com.baidu.mapapi.map.BaiduMap;
import com.baidu.mapapi.map.BitmapDescriptor;
import com.baidu.mapapi.map.BitmapDescriptorFactory;
import com.baidu.mapapi.map.Marker;
import com.baidu.mapapi.map.MarkerOptions;
import com.baidu.mapapi.map.Overlay;

import java.util.HashMap;

class GxMapViewMarkers
{
	private final BaiduMap mMap;
	private HashMap<Marker, GxMapViewItem> mMarkerData;

	private LoaderTask mTask;
	private MapPinHelper mPinHelper;

	public GxMapViewMarkers(@NonNull Context context, @NonNull BaiduMap map, @NonNull GxMapViewDefinition definition)
	{
		mMap = map;
		mMarkerData = new HashMap<>();
		mPinHelper = new MapPinHelper(context, definition);
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
		GxMapViewItem mapItem = mMarkerData.get(marker);
		if (mapItem != null)
			return mapItem.getData();
		else
			return null;
	}

	private class LoaderTask extends AsyncTask<GxMapViewData, MarkerInfo, Void>
	{
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

			return null;
		}

		@Override
		protected void onProgressUpdate(MarkerInfo... values)
		{
			//Marker marker = mMap.addMarker(values[0].Options);
			Overlay overlay = mMap.addOverlay(values[0].Options);
			if (overlay instanceof Marker)
				mMarkerData.put((Marker)overlay, values[0].Data);
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
			return BitmapDescriptorFactory.fromResource(R.drawable.red_markers);
	}
}
