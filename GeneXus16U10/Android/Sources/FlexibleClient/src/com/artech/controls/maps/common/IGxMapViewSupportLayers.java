package com.artech.controls.maps.common;

public interface IGxMapViewSupportLayers extends IGxMapView
{
	void addLayer(MapLayer layer);
	void removeLayer(MapLayer layer);
	void setLayerVisible(MapLayer layer, boolean visible);
	void adjustBoundsToLayer(MapLayer layer);
}
