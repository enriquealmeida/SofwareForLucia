package com.genexus.controls.maps.googlev2;

import java.util.HashMap;

import android.content.Context;
import android.os.AsyncTask;
import androidx.annotation.NonNull;

import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.MapPinHelper;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.model.BitmapDescriptor;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;

@SuppressWarnings("InconsistentCapitalization")
class GxMapViewMarkers
{
	private final GoogleMap mMap;
	private HashMap<String, GxMapViewItem> mMarkerData;

	private LoaderTask mTask;
	private MapPinHelper mPinHelper;

	private boolean updateAnimation;
	private HashMap<String, Marker> mMarkers;
	private GxMapViewDefinition mDefinition;
	private AnimationLayer mAnimationLayer;

	public GxMapViewMarkers(@NonNull Context context, @NonNull GoogleMap map, @NonNull GxMapViewDefinition definition)
	{
		mMap = map;
		mMarkerData = new HashMap<>();
		mMarkers = new HashMap<>();
		mPinHelper = new MapPinHelper(context, definition);
		mDefinition = definition;
	}

	public void update(GxMapViewData mapData, boolean useAnimation)
	{
		if (mTask != null)
			mTask.cancel(true);

		updateAnimation = useAnimation;

		if (!useAnimation)
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
			Marker marker = null;
			String markerKey = null;
			if (updateAnimation)
			{
				Services.Log.debug(" onProgressUpdate " + updateAnimation + " " );
				markerKey = AnimationLayer.getAnimationMarkerKey(values[0].Data, mDefinition);
				if (Strings.hasValue(markerKey))
					marker = mMarkers.get(markerKey);
				Services.Log.debug(" onProgressUpdate " + markerKey );
			}

			if (marker==null)
				marker = mMap.addMarker(values[0].Options);
			mMarkerData.put(marker.getId(), values[0].Data);

			if (Strings.hasValue(markerKey))
			{
				//get old marker
				Marker oldMarker = mMarkers.get(markerKey);
				if (oldMarker!=null)
				{
					// animated from old market to new marker
					if (mAnimationLayer==null)
						mAnimationLayer = new AnimationLayer();

					Services.Log.debug(" animateMarkers " + markerKey + " to " + values[0].Options.getPosition() );
					mAnimationLayer.animateMarkers(values[0].Data, mDefinition, values[0].Options.getPosition(), marker);
				}
				mMarkers.put(markerKey, marker);
			}

		}
	}

	@SuppressWarnings("checkstyle:MemberName")
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
