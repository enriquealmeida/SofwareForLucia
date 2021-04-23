package com.artech.controls.maps.common;

import com.artech.base.model.Entity;

public abstract class MapItemBase<LocationT extends IMapLocation>
{
	private final LocationT mLocation;
	private final Entity mData;

	protected MapItemBase(LocationT location, Entity itemData)
	{
		mLocation = location;
		mData = itemData;
	}

	public LocationT getLocation()
	{
		return mLocation;
	}

	public Entity getData()
	{
		return mData;
	}
}
