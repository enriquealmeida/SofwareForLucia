package com.genexus.controls.magazineviewer;

import java.util.ArrayList;

import android.content.Context;
import android.util.AttributeSet;

import com.artech.base.metadata.enums.Orientation;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.ui.Coordinator;
import com.genexus.controls.magazineviewer.FlipperOptions.FlipperLayoutType;

public class GxHorizontalGrid extends GxMagazineViewer {
	public static final String NAME = "SDHorizontalGrid";

	public GxHorizontalGrid(Context context, Coordinator coordinator, GridDefinition def) {
		super(context, coordinator, def);
	}

	public GxHorizontalGrid(Context context, AttributeSet attrs) {
		super(context, attrs);
	}

	@Override
	protected void setControlInfo(ControlInfo info) {
		mFlipperOptions = new FlipperOptions();

		ArrayList<Integer> layout = new ArrayList<Integer>();
		int columns = 1;
		int rows = 1;
		if (Services.Device.getScreenOrientation() == Orientation.PORTRAIT)
		{
			columns = info.optIntProperty("@SDHorizontalGridColumnsPerPagePortrait");
			rows = info.optIntProperty("@SDHorizontalGridRowsPerPagePortrait");
		}
		else
		{
			columns = info.optIntProperty("@SDHorizontalGridColumnsPerPageLandscape");
			rows = info.optIntProperty("@SDHorizontalGridRowsPerPageLandscape");
		}
		for (int i = 0; i < columns; i++)
			layout.add(rows);

		mFlipperOptions.setRowsPerColumn(rows);
		mFlipperOptions.setLayout(layout);

		mFlipperOptions.setItemsPerPage(columns * rows);
		mFlipperOptions.setShowFooter(info.optBooleanProperty("@SDHorizontalGridShowPageController"));
		mFlipperOptions.setLayoutType(FlipperLayoutType.Specific);

		ThemeClassDefinition indicatorClass = Services.Themes.getThemeClass(info.optStringProperty("@SDHorizontalGridPageControllerClass"));
		if (indicatorClass != null)
			mFlipperOptions.setFooterThemeClass(indicatorClass);
	}
}
