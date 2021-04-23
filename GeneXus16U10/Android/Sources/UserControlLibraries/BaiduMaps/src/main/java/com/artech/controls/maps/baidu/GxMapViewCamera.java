package com.artech.controls.maps.baidu;

import android.os.AsyncTask;

import com.artech.base.services.Services;
import com.baidu.mapapi.map.MapStatusUpdate;
import com.baidu.mapapi.map.MapStatusUpdateFactory;
import com.baidu.mapapi.model.LatLngBounds;

class GxMapViewCamera
{
	private final BaiduMapView mMap;
	private CalculateBoundsTask mTask;

	//static final int CAMERA_MARGIN_DIPS = 40;

	public GxMapViewCamera(BaiduMapView mapView)
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

	private void updateCamera(final LatLngBounds bounds)
	{
		if (bounds != null)
		{
			// new..
			Services.Log.debug("baidumaps updateCamera");
			updateCameraToBounds(bounds);

			//uodate again because in some cases dont show all point the first time.
			Services.Device.postOnUiThreadDelayed(new Runnable()
			{
				@Override
				public void run()
				{
					updateCameraToBounds(bounds);
				}
			}, 1000);
		}
	}

	private void updateCameraToBounds(final LatLngBounds bounds)
	{
		if (bounds != null)
		{
			Services.Log.debug("baidumaps updateCamera to Bounds");

			MapStatusUpdate updateStatus = MapStatusUpdateFactory.newLatLngBounds(bounds);
			mMap.getBaiduMap().animateMapStatus(updateStatus);

		}
	}


private class CalculateBoundsTask extends AsyncTask<GxMapViewData, Void, LatLngBounds>
	{
		@Override
		protected LatLngBounds doInBackground(GxMapViewData... params)
		{
			GxMapViewData mapData = params[0];

			MapLocationBounds bounds = mapData.calculateBounds(null);
			return (bounds != null ? bounds.getLatLngBounds() : null);
		}

		@Override
		protected void onPostExecute(LatLngBounds result)
		{
			updateCamera(result);
		}
	}
}
