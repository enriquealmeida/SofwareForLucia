package com.artech.controls.maps.baidu;

import android.app.Activity;
import android.content.Context;

import com.artech.application.MyApplication;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.IGxMapView;
import com.artech.controls.maps.common.IMapViewFactory;
import com.artech.ui.Coordinator;
import com.baidu.mapapi.BMapManager;
import com.baidu.mapapi.SDKInitializer;

class MapViewFactory implements IMapViewFactory
{
	private static BMapManager sMapManager;

	@Override
	public IGxMapView createView(Activity activity, Coordinator coordinator, GxMapViewDefinition definition)
	{
		prepareMapManager();
		return new BaiduMapView(activity, coordinator, definition);
	}

	static void prepareMapManager()
	{
		if (sMapManager == null)
		{
			Context context = MyApplication.getAppContext();
			String apiKey = context.getResources().getString(R.string.MapsApiKey);

			// Initialize Baidu MapManager.

			SDKInitializer.initialize( MyApplication.getAppContext() );

			//sMapManager = new BMapManager(context);
			//sMapManager.init(apiKey, sGeneralListener);
			//sMapManager.start();

			// TODO Baidu: error if not have permisson
		}
	}


	@Override
	public void afterAddView(IGxMapView view) { }
}
