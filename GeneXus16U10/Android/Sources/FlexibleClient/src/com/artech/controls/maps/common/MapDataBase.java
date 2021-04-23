package com.artech.controls.maps.common;

import java.util.ArrayList;
import java.util.List;

import android.util.Pair;

import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.base.utils.Strings;
import com.artech.controllers.ViewData;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.utils.Cast;

public abstract class MapDataBase<ItemT extends MapItemBase<LocationT>, LocationT extends IMapLocation, BoundsT extends IMapLocationBounds<LocationT>> extends ArrayList<ItemT>
{
	private static final long serialVersionUID = 1L;

	private final MapUtilsBase<LocationT, BoundsT> mMapUtils;
	private LocationT mCustomCenter;
	private Double mZoomRadius;

	protected MapDataBase(ViewData itemsData, MapUtilsBase<LocationT, BoundsT> mapUtils)
	{
		mMapUtils = mapUtils;
		GxMapViewDefinition mapDefinition = mapUtils.getMapDefinition();

		for (Entity itemData : itemsData.getEntities())
		{
			ItemT item = newMapItem(itemData);
			if (item != null)
				add(item);

			if (mapDefinition.getInitialCenter() == GxMapViewDefinition.INITIAL_CENTER_CUSTOM)
				mCustomCenter = newMapLocation(itemData, mapDefinition.getCustomCenterExpression());

			if (mapDefinition.getInitialZoom() == GxMapViewDefinition.INITIAL_ZOOM_RADIUS)
				mZoomRadius = Services.Strings.tryParseDouble(Cast.as(String.class, itemData.getProperty(mapDefinition.getZoomRadiusExpression())));
		}
	}

	public ItemT newMapItem(Entity itemData)
	{
		LocationT location = newMapLocation(itemData, mMapUtils.getMapDefinition().getGeoLocationExpression());
		if (location != null)
			return newMapItem(location, itemData);
		else
			return null;
	}

	private LocationT newMapLocation(Entity itemData, String geolocationExpression)
	{
		if (Strings.hasValue(geolocationExpression))
		{
			String geolocation = Cast.as(String.class, itemData.getProperty(geolocationExpression));
			if (Strings.hasValue(geolocation))
			{
				Pair<Double, Double> coordinates = GeoFormats.tryParse(geolocation);
				if (coordinates != null)
					return mMapUtils.newMapLocation(coordinates.first, coordinates.second);
			}
		}

		return null;
	}

	private LocationT newMapLocation(Pair<Double, Double> coordinates)
	{
		if (coordinates!=null)
			return mMapUtils.newMapLocation(coordinates.first, coordinates.second);
		return null;
	}

	protected abstract ItemT newMapItem(LocationT location, Entity itemData);

	public BoundsT calculateBounds(Pair<Double, Double> currentCenter)
	{
		LocationT currentCenterLocation = newMapLocation(currentCenter);
		return mMapUtils.calculateBounds(currentCenterLocation, getLocations(), mCustomCenter, mZoomRadius);
	}

	public List<LocationT> getLocations()
	{
		ArrayList<LocationT> locations = new ArrayList<>();
		for (MapItemBase<LocationT> item : this)
			locations.add(item.getLocation());

		return locations;
	}

	public LocationT getCustomCenter()
	{
		return mCustomCenter;
	}

	public Double getZoomRadius()
	{
		return mZoomRadius;
	}

}
