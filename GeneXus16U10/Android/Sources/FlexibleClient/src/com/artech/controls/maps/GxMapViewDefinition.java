package com.artech.controls.maps;

import android.content.Context;
import android.graphics.drawable.Drawable;

import com.artech.R;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.DataTypeName;
import com.artech.base.metadata.enums.ImageScaleType;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.grids.CustomGridDefinition;

public class GxMapViewDefinition extends CustomGridDefinition
{
	private String mGeoLocationExpression;
	private String mPinImageExpression;
	private String mPinImage;
	private String mPinImageClass;
	private boolean mShowMyLocation;
	private String mMyLocationImage;
	private String mMapType;
	private boolean mCanChooseMapType;
	private boolean mShowTraffic;

	private int mInitialCenter;
	private String mCustomCenterExpression;

	private int mInitialZoom;
	private String mZoomRadiusExpression;

	public static final int INITIAL_CENTER_DEFAULT = 0;
	public static final int INITIAL_CENTER_MY_LOCATION = 1;
	public static final int INITIAL_CENTER_CUSTOM = 2;

	public static final int INITIAL_ZOOM_DEFAULT = 0;
	public static final int INITIAL_ZOOM_NEAREST_POINT = 1;
	public static final int INITIAL_ZOOM_RADIUS = 2;

	public static final String MAP_TYPE_STANDARD = "Standard";
	public static final String MAP_TYPE_HYBRID = "Hybrid";
	public static final String MAP_TYPE_SATELLITE = "Satellite";
	public static final String MAP_TYPE_TERRAIN = "Terrain";

	public static final int ANIMATION_REPEAT = 0;
	public static final int ANIMATION_NOREPEAT = 1;
	public static final int ANIMATION_DISAPPEAR = 2;

	// Selection layer
	private boolean mShowSelectionLayer;
	private String mSelectionPinImage;
	private String mSelectionPinImageClass;

	// Route Layer
	private boolean mShowDirectionsLayer;
	private String mRouteTransportType;
	private String mRouteClass;

	// Animation Layer
	private boolean mShowAnimationLayer;
	private String mAnimationKeyExpression;
	private int mAnimationDuration;
	private String mAnimationDurationExpression;
	private int mAnimationEndBehavior;
	private String mAnimationEndBehaviorExpression;


	/**
	 * Gets the Android Maps API Key for the currently running application.
	 * Can be overridden in resources.
	 */
	public static String getApiKey()
	{
		return Services.Strings.getResource(R.string.GoogleServicesApiKey);
	}

	public GxMapViewDefinition(Context context, GridDefinition grid)
	{
		super(context, grid);
	}

	@Override
	protected void init(GridDefinition grid, ControlInfo controlInfo)
	{
		mGeoLocationExpression = readGeoLocationExpression(grid, controlInfo);
		mPinImageExpression = readDataExpression("@SDMapsPinImageAtt", "@SDMapsPinImageField");

		mMapType = controlInfo.optStringProperty("@SDMapsMapType");
		mCanChooseMapType = controlInfo.optBooleanProperty("@SDMapsCanChooseType");
		mPinImage = MetadataLoader.getObjectName(controlInfo.optStringProperty("@SDMapsPinImage"));
		mPinImageClass = controlInfo.optStringProperty("@SDMapsPinImageClass");
		mShowMyLocation = controlInfo.optBooleanProperty("@SDMapsShowMyLocation");
		mMyLocationImage = MetadataLoader.getObjectName(controlInfo.optStringProperty("@SDMapsPinImageMyLocation"));

		mInitialCenter = Services.Strings.parseIntEnum(controlInfo.optStringProperty("@SDMapsCenter"), INITIAL_CENTER_DEFAULT,  "Default", "MyLocation", "Custom");
		mCustomCenterExpression = readDataExpression("@SDMapsCenterAtt", "@SDMapsCenterField");

		mInitialZoom = Services.Strings.parseIntEnum(controlInfo.optStringProperty("@SDMapsInitialZoomBehavior"), INITIAL_ZOOM_DEFAULT, "ShowAll", "NearestPoint", "Radius");
		mZoomRadiusExpression = readDataExpression("@SDMapsZoomRadiusAtt", "@SDMapsZoomRadiusField");

		mShowTraffic = controlInfo.optBooleanProperty("@SDMapsShowTraffic");

		//Selection Layer
		mShowSelectionLayer = controlInfo.optBooleanProperty("@SDMapsSelectionLayer");
		mSelectionPinImage = MetadataLoader.getObjectName(controlInfo.optStringProperty("@SDMapsSelectionTargetImage"));
		mSelectionPinImageClass = controlInfo.optStringProperty("@SDMapsSelectionTargetImageClass");

    	//Direction Layer
		mShowDirectionsLayer = controlInfo.optBooleanProperty("@SDMapsDirectionsLayer");
		mRouteTransportType = controlInfo.optStringProperty("@SDMapsTransportType");
		mRouteClass = controlInfo.optStringProperty("@SDMapsDefaultRouteClass");

		//Animation Layer
		mShowAnimationLayer = controlInfo.optBooleanProperty("@SDMapsAnimationsLayer");
		mAnimationKeyExpression = readDataExpression("@SDMapsAnimationKeyAtt", "@SDMapsAnimationKeyField");
		mAnimationDuration = controlInfo.optIntProperty("@SDMapsAnimationDuration", 0);
		mAnimationDurationExpression = readDataExpression("@SDMapsAnimationDurationAtt", "@SDMapsAnimationDurationField");
		mAnimationEndBehavior = Services.Strings.parseIntEnum(controlInfo.optStringProperty("@SDMapsAnimationEndBehavior"), ANIMATION_REPEAT,  "Repeat", "DoNotRepeat", "Disappear");
		mAnimationEndBehaviorExpression = readDataExpression("@SDMapsAnimationEndBehaviorAtt", "@SDMapsAnimationEndBehaviorField");

	}

	private String readGeoLocationExpression(GridDefinition grid, ControlInfo controlInfo)
	{
		String locationAttribute = controlInfo.optStringProperty("@SDMapsLocationAtt");
		String locationField = controlInfo.optStringProperty("@SDMapsLocationField");

		if (Services.Strings.hasValue(locationAttribute))
			return buildDataExpression(locationAttribute, locationField);
		else
			return getDefaultGeoLocationAttribute(grid);
	}

	private static String getDefaultGeoLocationAttribute(GridDefinition grid)
	{
		for (DataItem item : grid.getDataSourceItems())
		{
			if (item.getDataTypeName() != null && item.getDataTypeName().getDataType().equalsIgnoreCase(DataTypeName.GEOLOCATION))
				return item.getName();
		}

		return null;
	}

	// Properties
	public String getGeoLocationExpression() { return mGeoLocationExpression; }
	public String getPinImageExpression() { return mPinImageExpression; }
	public Drawable getPinImage() { return getDrawable(mPinImage, R.drawable.red_markers); }
	public boolean getShowMyLocation() { return mShowMyLocation; }
	public boolean getCanChooseMapType() { return mCanChooseMapType; }
	public String getMapType() { return mMapType; }
	public Drawable getMyLocationImage() { return getDrawable(mMyLocationImage, R.drawable.pin_here_arrow); }
	public boolean getShowTraffic() { return mShowTraffic; }

	public boolean getShowSelectionLayer() { return mShowSelectionLayer; }
	public Drawable getSelectionPinImageDrawable(Context context)
	{
		return Services.Resources.getImageDrawable(context, mSelectionPinImage);
	}
	public ThemeClassDefinition getSelectionPinImageClass()
	{
		return Services.Themes.getThemeClass(mSelectionPinImageClass);
	}

	public boolean getShowDirectionsLayer() { return mShowDirectionsLayer; }
	public ThemeClassDefinition getRouteClass()
	{
		return Services.Themes.getThemeClass(mRouteClass);
	}
	public String getRouteTransportType() { return mRouteTransportType; }

	public boolean getShowAnimationLayer() { return mShowAnimationLayer; }
	public String getAnimationKeyExpression() { return mAnimationKeyExpression; }
	public int getAnimationDuration() { return mAnimationDuration; }
	public String getAnimationDurationExpression() { return mAnimationDurationExpression; }
	public int getAnimationEndBehavior() { return mAnimationEndBehavior; }
	public String getAnimationEndBehaviorExpression() { return mAnimationEndBehaviorExpression; }

	public int getMyLocationImageResourceId()
	{
		return Services.Resources.getResourceId(mMyLocationImage, "drawable");
	}

	public int getInitialCenter() { return mInitialCenter; }
	public String getCustomCenterExpression() { return mCustomCenterExpression; }

	public int getInitialZoom() { return mInitialZoom; }
	public String getZoomRadiusExpression() { return mZoomRadiusExpression; }

	public int getPinImageResourceId()
	{
		if (Strings.hasValue(mPinImage))
			return Services.Resources.getResourceId(mPinImage, "drawable");
		else
			return 0;
	}

	public boolean needsUserLocation()
	{
		return (getShowMyLocation() || needsUserLocationForMapBounds());
	}

	public boolean needsUserLocationForMapBounds()
	{
		return (getInitialCenter() == INITIAL_CENTER_MY_LOCATION ||
				getInitialZoom() == INITIAL_ZOOM_NEAREST_POINT);
	}

	public static class PinImageProperties
	{
		public ImageScaleType scaleType = ImageScaleType.FIT;
		public int width = 0;
		public int height = 0;
	}

	private PinImageProperties mPinImageProperties;

	public PinImageProperties getPinImageProperties()
	{
		if (mPinImageProperties == null)
		{
			PinImageProperties properties = new PinImageProperties();
			ThemeClassDefinition pinImageClass = Services.Themes.getThemeClass(mPinImageClass);
			if (pinImageClass != null)
			{
				properties.width = Services.Device.dipsToPixels(Services.Strings.tryParseInt(pinImageClass.optStringProperty("PinWidth"), 0));
				properties.height = Services.Device.dipsToPixels(Services.Strings.tryParseInt(pinImageClass.optStringProperty("PinHeight"), 0));
				properties.scaleType = ImageScaleType.parse(pinImageClass.optStringProperty("PinScaleType"));
			}

			mPinImageProperties = properties;
		}

		return mPinImageProperties;
	}

}
