package com.genexus.coreusercontrols.image;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.controls.ControlPropertiesDefinition;

class GxImageAnnotationsDefinition extends ControlPropertiesDefinition {

	private static final String PROPERTY_THICKNESS = "@SDImageAnnotationsTraceThickness";
	private static final String PROPERTY_COLOR = "@SDImageAnnotationsTraceColor";

	private int mTraceThickness;
	private String mTraceColor;

	GxImageAnnotationsDefinition(LayoutItemDefinition layoutItemDefinition) {
		super(layoutItemDefinition);
		mTraceThickness = layoutItemDefinition.getControlInfo().optIntProperty(PROPERTY_THICKNESS);
		mTraceColor = layoutItemDefinition.getControlInfo().optStringProperty(PROPERTY_COLOR);
	}

	int getTraceThickness() { return mTraceThickness; }

	String getTraceColor() {
		return mTraceColor;
	}

	void setTraceThickness(int traceThickness) {
		this.mTraceThickness = traceThickness;
	}

	void setTraceColor(String traceColor) {
		this.mTraceColor = traceColor;
	}
}
