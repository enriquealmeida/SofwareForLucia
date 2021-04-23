package com.artech.controls.maps.common;

public interface IGxMapViewRuntimeMethods extends IGxMapView
{
	// methods
	void setMapCenter(IMapLocation location, int zoomLevel);
	void setZoomLevel(int zoomLevel);

	void selectIndex(int index);
	void deselectIndex(int index);

	//properties
	int getSelectedIndex();
	void setDirectionsLayer(boolean directionsLayer);
	void setAnimationLayer(boolean useAnimationLayer);

}
