package com.artech.controls.maps.common.kml;

import java.io.InputStream;

import com.artech.controls.maps.common.IMapsProvider;
import com.artech.controls.maps.common.MapLayer;

public interface IKmlDeserializer
{
	MapLayer deserialize(IMapsProvider mapsProvider, InputStream is);
}
