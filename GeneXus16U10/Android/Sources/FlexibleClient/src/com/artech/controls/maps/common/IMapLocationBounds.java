package com.artech.controls.maps.common;

public interface IMapLocationBounds<LocationT extends IMapLocation>
{
	LocationT southwest();
	LocationT northeast();
}
