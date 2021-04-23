package com.genexus.controls.maps.googlev2;

import android.os.AsyncTask;
import android.util.Pair;

import com.artech.base.services.Services;
import com.google.android.gms.maps.CameraUpdate;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.model.LatLngBounds;

class GxMapViewCamera
{
	private final GxMapView mMap;
	private CalculateBoundsTask mTask;

	static final int CAMERA_MARGIN_DIPS = 40;

	public GxMapViewCamera(GxMapView mapView)
	{
		mMap = mapView;
	}

	public void update(GxMapViewData mapData)
	{
		if (mTask != null)
			mTask.cancel(true);

		mTask = new CalculateBoundsTask();
		mTask.execute(mapData);
	}

	private void updateCamera(LatLngBounds bounds)
	{
		if (bounds != null)
		{
			CameraUpdate update = CameraUpdateFactory.newLatLngBounds(bounds, Services.Device.dipsToPixels(CAMERA_MARGIN_DIPS));
			mMap.animateCamera(update);
		}
	}

	private class CalculateBoundsTask extends AsyncTask<GxMapViewData, Void, LatLngBounds>
	{
		@Override
		protected LatLngBounds doInBackground(GxMapViewData... params)
		{
			GxMapViewData mapData = params[0];

			Pair<Double, Double> currentCenter = null;
			if (mMap.getLastMapCenter()!=null)
				currentCenter = new Pair<>(mMap.getLastMapCenter().getLatitude(), mMap.getLastMapCenter().getLongitude());

			MapLocationBounds bounds = mapData.calculateBounds(currentCenter);
			return (bounds != null ? bounds.getLatLngBounds() : null);
		}

		@Override
		protected void onPostExecute(LatLngBounds result)
		{
			updateCamera(result);
		}
	}
}
