package com.genexus.controls.flexgrid;

import android.content.Context;

import com.artech.application.MyApplication;
import com.artech.framework.GenexusModule;
import com.artech.usercontrols.TableLayoutFactory;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;

public class FlexGridModule implements GenexusModule {

	@Override
	public void initialize(Context context) {
		UcFactory.addControl(new UserControlDefinition(FlexGridView.NAME, FlexGridView.class));

		MyApplication application = (MyApplication) context;
		application.getTableLayoutFactory().addControl(TableLayoutFactory.FLEX, GxFlexLayout.class);
		application.getTableLayoutFactory().addControl(TableLayoutFactory.ROOTFLEX, GxRootFlexLayout.class);
	}
}
