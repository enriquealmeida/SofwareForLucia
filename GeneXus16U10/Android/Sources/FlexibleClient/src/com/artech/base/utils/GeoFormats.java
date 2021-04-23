package com.artech.base.utils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.util.Pair;

import com.artech.base.metadata.DataItem;
import com.artech.base.services.Services;

/**
 * Geolocation and GeoPoint string parser/builder.
 */
public class GeoFormats
{
	public static final String TYPE_GEOPOINT = "GeoPoint";
	public static final String TYPE_GEOLINE = "GeoLine";

	public static final String TYPE_GEOLOCATION = "Geolocation";

	@NonNull
	public static String convertToInternal(String externalGeo, DataItem definition)
	{
		if (!Strings.hasValue(externalGeo))
			return Strings.EMPTY;

		// Internal format is same as GEOLOCATION. Convert from GEOPOINT format if necessary.
		String type = definition.getType();
		if (TYPE_GEOPOINT.equalsIgnoreCase(type))
		{
			Pair<Double, Double> latLon = parseGeopoint(externalGeo);
			if (latLon != null)
				return buildGeolocation(latLon.first, latLon.second);
		}

		return externalGeo;
	}

	@NonNull
	public static String convertToExternal(String internalGeo, DataItem definition)
	{
		if (!Strings.hasValue(internalGeo))
			return Strings.EMPTY;

		// Internal format is same as GEOLOCATION. Convert to GEOPOINT format if necessary.
		String type = definition.getType();
		if (TYPE_GEOPOINT.equalsIgnoreCase(type))
		{
			Pair<Double, Double> latLon = parseGeolocation(internalGeo);
			if (latLon != null)
				return buildGeopoint(latLon.first, latLon.second);
		}

		return internalGeo;
	}

	@Nullable
	public static Pair<Double, Double> tryParse(String geo)
	{
		// We don't know the format here. Just guess.
		Pair<Double, Double> coordinates = parseGeolocation(geo);
		if (coordinates == null)
			coordinates = parseGeopoint(geo);

		return coordinates;
	}

	@NonNull
	public static String buildGeolocation(double latitude, double longitude)
	{
		// Format is "<latitude>, <longitude>"
		return coordinateToString(latitude) + ',' + coordinateToString(longitude);
	}

	@Nullable
	public static Pair<Double, Double> parseGeolocation(String geolocation)
	{
		if (!Strings.hasValue(geolocation))
			return null;

		// Format is "<latitude>, <longitude>"
		String[] latLon = Services.Strings.split(geolocation, ',');
		if (latLon.length == 2)
		{
			try
			{
				double lat = Double.valueOf(latLon[0].trim());
				double lon = Double.valueOf(latLon[1].trim());
				return new Pair<>(lat, lon);
			}
			catch (NumberFormatException ignored) { }
		}

		Services.Log.warning(String.format("Unexpected geolocation format in '%s'.", geolocation));
		return null;
	}

	@NonNull
	public static String buildGeopoint(double latitude, double longitude)
	{
		// Format is "POINT (<longitude> <latitude>)"
		return "POINT (" + coordinateToString(longitude) + " " + coordinateToString(latitude) + ")";
	}

	@Nullable
	public static Pair<Double, Double> parseGeopoint(String geopoint)
	{
		if (!Strings.hasValue(geopoint))
			return null;

		// Format is "POINT(<longitude> <latitude>)"
		if (geopoint.startsWith("POINT"))
		{
			String unwrapped = geopoint.substring(5).trim();
			if (unwrapped.startsWith("(") && unwrapped.endsWith(")"))
			{
				unwrapped = unwrapped.substring(1, unwrapped.length() - 1).trim();
				String[] lonLat = Services.Strings.split(unwrapped, ' ');
				if (lonLat.length == 2)
				{
					try
					{
						double lat = Double.valueOf(lonLat[1].trim());
						double lon = Double.valueOf(lonLat[0].trim());
						return new Pair<>(lat, lon);
					}
					catch (NumberFormatException ignored) { }
				}
			}
		}

		Services.Log.warning(String.format("Unexpected geopoint format in '%s'.", geopoint));
		return null;
	}

	@NonNull
	public static String coordinateToString(double value)
	{
		final int DECIMAL_PLACES = 7; // Maximum precision.
		return BigDecimal.valueOf(value).setScale(DECIMAL_PLACES, BigDecimal.ROUND_HALF_EVEN).toPlainString();
	}

	// list pair (lat, lng)
	@NonNull
	public static String buildGeoline(List<Pair<Double, Double>> path)
	{
		// Format is "LINESTRING (<longitude> <latitude>, <longitude> <latitude>, <longitude> <latitude>)"
		StringBuilder builder = new StringBuilder();
		builder.append("LINESTRING (");

		boolean isFirstPoint = true;
		// decode overview polyline (List<LatLng>) and add it to the path.
		for (Pair<Double, Double> coordinate : path)
		{
			if (!isFirstPoint)
				builder.append(", ");
			else
				isFirstPoint = false;

			builder.append(GeoFormats.coordinateToString(coordinate.second) + " " + GeoFormats.coordinateToString(coordinate.first));
		}
		builder.append(")");

		return builder.toString();
	}

	@Nullable
	public static List<Pair<Double, Double>> parseGeoline(String geoline)
	{
		if (!Strings.hasValue(geoline))
			return null;

		// Format is "LINESTRING(<longitude> <latitude>)"
		if (geoline.startsWith("LINESTRING"))
		{
			String unwrapped = geoline.substring(10).trim();
			if (unwrapped.startsWith("(") && unwrapped.endsWith(")"))
			{
				unwrapped = unwrapped.substring(1, unwrapped.length() - 1).trim();
				String[] points = Services.Strings.split(unwrapped, ',');
				if (points.length > 1)
				{
					List<Pair<Double, Double>> result = new ArrayList<Pair<Double, Double>>();

					for(String point : points)
					{
						String[] lonLat = Services.Strings.split(point.trim(), ' ');
						if (lonLat.length == 2)
						{
							try
							{
								double lat = Double.valueOf(lonLat[1].trim());
								double lon = Double.valueOf(lonLat[0].trim());
								result.add(new Pair<>(lat, lon));
							} catch (NumberFormatException ignored)
							{
							}
						}
					}
					return result;
				}
			}
		}
		Services.Log.warning(String.format("Unexpected geoline format in '%s'.", geoline));
		return null;
	}

}
