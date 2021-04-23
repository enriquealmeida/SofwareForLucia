package com.genexus.coreusercontrols.imagemap;

import android.content.Context;

import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.controls.grids.CustomGridDefinition;

public class GxImageMapDefinition extends CustomGridDefinition {
	private static String mImage;
	private static String mImageAttribute;
	private static String mHCoordinateAttribute;
	private static String mVCoordinateAttribute;
	private static String mSizeAttribute;
	private static String mWidthAttribute;
	private static String mHeightAttribute;
	private static String mRotationAttribute;

	public GxImageMapDefinition(Context context, GridDefinition grid) {
		super(context, grid);
	}

	@Override
	protected void init(GridDefinition grid, ControlInfo controlInfo) {
		mImage = MetadataLoader.getObjectName(controlInfo.optStringProperty("@SDImageMapImage"));
		mImageAttribute = readDataExpression("@SDImageMapImageAtt", "@SDImageMapImageField");
		mHCoordinateAttribute = readDataExpression("@SDImageMapHCoordAtt", "@SDImageMapHCoordField");
		mVCoordinateAttribute = readDataExpression("@SDImageMapVCoordAtt", "@SDImageMapVCoordField");
		mSizeAttribute = readDataExpression("@SDImageMapSizeAtt", "@SDImageMapSizeField");
		mWidthAttribute = readDataExpression("@SDImageMapWidthAtt", "@SDImageMapWidthField");
		mHeightAttribute = readDataExpression("@SDImageMapHeightAtt", "@SDImageMapHeightField");
		mRotationAttribute = readDataExpression("@SDImageMapRotationAtt", "@SDImageMapRotationField");
	}

	public String getmImage() {
		return mImage;
	}

	public String getImageAttribute() {
		return mImageAttribute;
	}

	public String getHCoordinateAttribute() {
		return mHCoordinateAttribute;
	}

	public String getVCoordinateAttribute() {
		return mVCoordinateAttribute;
	}

	public String getSizeAttribute() {
		return mSizeAttribute;
	}

	public String getWidthAttribute() {
		return mWidthAttribute;
	}

	public String getHeightAttribute() {
		return mHeightAttribute;
	}

	public String getRotationAttribute() {
		return mRotationAttribute;
	}
}
