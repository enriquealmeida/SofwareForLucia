package com.genexus.coreusercontrols.image;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.Services;
import com.artech.controls.ControlPropertiesDefinition;

class GxAdvancedImageDefinition extends ControlPropertiesDefinition
{
	private boolean mEnableCopy;
	private String mImageMaxZoomRel;
	private float mImageMaxZoom;

	public GxAdvancedImageDefinition(LayoutItemDefinition definition)
	{
		super(definition);
		mEnableCopy = definition.getControlInfo().optBooleanProperty("@SDAdvancedImageEnableCopy");
		mImageMaxZoomRel = definition.getControlInfo().optStringProperty("@SDAdvancedImageMaxZoomRel");

		Float maxZoom = Services.Strings.tryParseFloat(definition.getControlInfo().optStringProperty("@SDAdvancedImageMaxZoom"));
		if (maxZoom != null)
			mImageMaxZoom = maxZoom / 100f;
		else
			mImageMaxZoom = -1;
	}

	public boolean getEnableCopy()
	{
		return mEnableCopy;
	}

	public float getImageMaxZoom()
	{
		return mImageMaxZoom;
	}

	public String getImageMaxZoomRel() {
		return mImageMaxZoomRel;
	}
}
