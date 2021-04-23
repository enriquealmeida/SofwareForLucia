package com.artech.controls.maps.common;

import java.util.ArrayList;
import java.util.List;

/**
 * Definition of a Map Layer .
 * Contains a number of MapFeatures, which can currently be polygons or polylines (LineString).
 */
public class MapLayer
{
	public String id;
	public final List<MapFeature> features;
	
	public MapLayer()
	{
		features = new ArrayList<>();
	}
	
	public enum FeatureType { Polyline, Polygon }
	
	public abstract static class MapFeature
	{
		public final FeatureType type;
		
		public String id;
		public String name;
		public String description;
		
		// Place to store the actual "map implementation object"
		// (e.g. com.google.android.gms.maps.model.Polygon for polygons in Google Maps API V2).
		public Object mapObject;
		
		protected MapFeature(FeatureType type)
		{
			this.type = type;
		}
		
		public abstract List<IMapLocation> getPoints();
	}
	
	public static class Polygon extends MapFeature
	{
		public final List<IMapLocation> outerBoundary;
		public final List<List<IMapLocation>> holes;

		public Integer strokeColor;
		public Float strokeWidth;
		public Integer fillColor;
		
		public Polygon()
		{
			super(FeatureType.Polygon);
			outerBoundary = new ArrayList<>();
			holes = new ArrayList<>();
		}

		@Override
		public List<IMapLocation> getPoints()
		{
			return outerBoundary;
		}
	}

	public static class Polyline extends MapFeature
	{
		public final List<IMapLocation> points;
		public Integer strokeColor;
		public Float strokeWidth;
		
		public Polyline()
		{
			super(FeatureType.Polyline);
			points = new ArrayList<>();
		}

		@Override
		public List<IMapLocation> getPoints()
		{
			return points;
		}
	}
}
