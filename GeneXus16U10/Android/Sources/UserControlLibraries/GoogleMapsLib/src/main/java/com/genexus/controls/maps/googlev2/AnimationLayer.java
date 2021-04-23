package com.genexus.controls.maps.googlev2;

import com.artech.base.services.Services;
import com.artech.controls.maps.GxMapViewDefinition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;

import java.util.HashMap;


public class AnimationLayer
{
	private HashMap<Marker, MarkerAnimation> mMarkersAnimation;

	public AnimationLayer()
	{
		mMarkersAnimation = new HashMap<>();
	}

	public void animateMarkers(GxMapViewItem mapData, GxMapViewDefinition definition, LatLng endPosition, Marker marker)
	{
		MarkerAnimation markerAnimation = mMarkersAnimation.get(marker);
		if (markerAnimation==null) {
			markerAnimation = new MarkerAnimation(marker);
			mMarkersAnimation.put(marker, markerAnimation);
		}

		int duration = AnimationLayer.getAnimationDuration(mapData, definition);
		int endBehavior =  AnimationLayer.getAnimationEndBehavior(mapData, definition);

		Services.Log.debug(" animateMarkers duration " + duration + " to " + endPosition );

		markerAnimation.startAnimation(endPosition, duration, endBehavior);
	}

	public static String getAnimationMarkerKey(GxMapViewItem mapData, GxMapViewDefinition definition)
	{
		return mapData.getData().optStringProperty(definition.getAnimationKeyExpression());
	}

	public static int getAnimationDuration(GxMapViewItem mapData, GxMapViewDefinition definition) {

		int duration = definition.getAnimationDuration() * 1000;
		if (duration == 0 && definition.getAnimationDurationExpression()!=null)
			duration = mapData.getData().optIntProperty(definition.getAnimationDurationExpression()) * 1000;
		return duration;
	}

	public static int getAnimationEndBehavior(GxMapViewItem mapData, GxMapViewDefinition definition) {

		int endBehavior = definition.getAnimationEndBehavior();
		if (endBehavior == 0 && definition.getAnimationEndBehaviorExpression()!=null)
			endBehavior = mapData.getData().optIntProperty(definition.getAnimationEndBehaviorExpression()) ;
		return endBehavior;
	}
}
