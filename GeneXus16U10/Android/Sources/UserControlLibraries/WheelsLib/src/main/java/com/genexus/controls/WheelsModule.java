package com.genexus.controls;

import android.content.Context;

import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;
import com.genexus.controls.wheels.GxMultiWheelPicker;
import com.genexus.controls.wheels.GxWheelControl;
import com.genexus.controls.wheels.measures.GxMeasuresControl;


public class WheelsModule implements GenexusModule {

	@Override
	public void initialize(Context context) {
		UcFactory.addControl(new UserControlDefinition(GxWheelControl.NAME, GxWheelControl.class));
		UcFactory.addControl(new UserControlDefinition(GxMultiWheelPicker.NAME, GxMultiWheelPicker.class));
		UcFactory.addControl(new UserControlDefinition(GxMeasuresControl.NAME, GxMeasuresControl.class));
	}
}
