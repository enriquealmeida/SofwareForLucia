package com.artech.controls.maps.baidu;

import com.artech.controls.maps.common.IMapLocationBounds;
import com.baidu.mapapi.model.LatLngBounds;


class MapLocationBounds implements IMapLocationBounds<MapLocation>
{
	private final LatLngBounds mBounds;

	public MapLocationBounds(LatLngBounds bounds)
	{
		mBounds = bounds;
	}

	LatLngBounds getLatLngBounds()
	{
		return mBounds;
	}

	@Override
	public MapLocation southwest()
	{
		return new MapLocation(mBounds.southwest);
	}

	@Override
	public MapLocation northeast()
	{
		return new MapLocation(mBounds.northeast);
	}
}
