package com.artech.controls.maps.baidu;

import com.artech.base.utils.Strings;
import com.artech.controls.maps.GxMapViewDefinition;
import com.baidu.mapapi.map.BaiduMap;

class BaiduMapsHelper
{

	static int mapTypeToGoogleMapType(String mapType)
	{
		if (Strings.hasValue(mapType))
		{
			if (mapType.equalsIgnoreCase(GxMapViewDefinition.MAP_TYPE_HYBRID))
				return BaiduMap.MAP_TYPE_NORMAL;
			else if (mapType.equalsIgnoreCase(GxMapViewDefinition.MAP_TYPE_SATELLITE))
				return BaiduMap.MAP_TYPE_SATELLITE;
			else if (mapType.equalsIgnoreCase(GxMapViewDefinition.MAP_TYPE_TERRAIN))
				return BaiduMap.MAP_TYPE_NORMAL;
		}

		return BaiduMap.MAP_TYPE_NORMAL;
	}

	static String mapTypeFromGoogleMapType(int googleMapType)
	{
		switch (googleMapType)
		{
			case BaiduMap.MAP_TYPE_NONE :
				return GxMapViewDefinition.MAP_TYPE_STANDARD;
			case BaiduMap.MAP_TYPE_SATELLITE :
				return GxMapViewDefinition.MAP_TYPE_SATELLITE;
			case BaiduMap.MAP_TYPE_NORMAL :
				return GxMapViewDefinition.MAP_TYPE_STANDARD;
			default :
				return GxMapViewDefinition.MAP_TYPE_STANDARD;
		}
	}
}
