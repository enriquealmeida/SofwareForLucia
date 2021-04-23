package com.genexus.controls.smartgrid;

import android.content.Context;

import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;

public class SmartGridModule implements GenexusModule {

	@Override
	public void initialize(Context context) {
		UserControlDefinition uc = new UserControlDefinition(GxSmartGrid.NAME, GxSmartGrid.class);
		uc.SupportAutoGrow = true;
		UcFactory.addControl(uc);
	}
}
