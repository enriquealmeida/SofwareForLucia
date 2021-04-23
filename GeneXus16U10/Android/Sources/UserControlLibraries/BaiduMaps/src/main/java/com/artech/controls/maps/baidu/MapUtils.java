package com.artech.controls.maps.baidu;

import android.util.Pair;

import com.artech.base.utils.GeoFormats;
import com.artech.controls.maps.GxMapViewDefinition;
import com.artech.controls.maps.common.MapUtilsBase;
import com.baidu.mapapi.model.LatLng;
import com.baidu.mapapi.model.LatLngBounds;
import com.baidu.mapapi.model.inner.GeoPoint;

class MapUtils extends MapUtilsBase<MapLocation, MapLocationBounds>
{
	public MapUtils(GxMapViewDefinition definition)
	{
		super(definition);
	}

	@Override
	protected MapLocation newMapLocation(double latitude, double longitude)
	{
		return new MapLocation(latitude, longitude);
	}

	@Override
	protected MapLocationBounds newMapBounds(MapLocation southwest, MapLocation northeast)
	{
		LatLngBounds.Builder builder = new LatLngBounds.Builder();
		builder.include(southwest.getLatLng());
		builder.include(northeast.getLatLng());
		LatLngBounds latLngBounds = builder.build();
		return new MapLocationBounds(latLngBounds);
	}


	/**
	 * Decodes a {@link GeoPoint} instance from its string representation.
	 */
	public static GeoPoint stringToGeoPoint(String str)
	{
		Pair<Double, Double> coordinates = GeoFormats.parseGeolocation(str);
		if (coordinates != null)
			return new GeoPoint((int)(coordinates.first * 1E6), (int)(coordinates.second * 1E6));
		else
			return null;
	}

	/**
	 * Decodes a {@link LatLng} instance from its string representation.
	 */
	public static LatLng stringToLatLng(String str)
	{
		Pair<Double, Double> coordinates = GeoFormats.parseGeolocation(str);
		if (coordinates != null)
			return new LatLng(coordinates.first, coordinates.second);
		else
			return null;
	}
}
