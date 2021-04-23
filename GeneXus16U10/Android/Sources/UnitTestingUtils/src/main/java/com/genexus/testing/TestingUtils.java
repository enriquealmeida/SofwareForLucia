package com.genexus.testing;

import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;

public class TestingUtils {
	public static LayoutItemDefinition createControlDefinition(ControlInfo controlInfo) {
		LayoutItemDefinition definition = new LayoutItemDefinition(new LayoutDefinition(null), null);
		definition.setControlInfo(controlInfo);
		return definition;
	}
}
