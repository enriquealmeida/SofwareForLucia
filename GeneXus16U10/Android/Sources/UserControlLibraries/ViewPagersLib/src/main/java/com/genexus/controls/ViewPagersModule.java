package com.genexus.controls;

import android.content.Context;

import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;
import com.genexus.controls.magazineviewer.GxHorizontalGrid;
import com.genexus.controls.magazineviewer.GxMagazineViewer;
import com.genexus.controls.viewpager.GxViewPager;


public class ViewPagersModule implements GenexusModule {

	@Override
	public void initialize(Context context) {
		UcFactory.addControl(new UserControlDefinition(GxMagazineViewer.NAME, GxMagazineViewer.class));
		UcFactory.addControl(new UserControlDefinition(GxViewPager.NAME, GxViewPager.class));
		UserControlDefinition uc = new UserControlDefinition(GxHorizontalGrid.NAME, GxHorizontalGrid.class);
		uc.SupportAutoGrow = true;
		UcFactory.addControl(uc);
	}
}
