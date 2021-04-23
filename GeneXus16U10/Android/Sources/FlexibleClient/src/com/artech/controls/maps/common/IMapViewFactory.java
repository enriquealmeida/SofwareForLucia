package com.artech.controls.maps.common;

import android.app.Activity;

import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.ui.Coordinator;

public interface IMapViewFactory
{
	IGxMapView createView(Activity activity, Coordinator coordinator, GxMapViewDefinition definition);
	void afterAddView(IGxMapView view);
}
