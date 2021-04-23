package com.genexus.coreusercontrols;

import android.content.Context;

import com.artech.base.metadata.enums.Orientation;
import com.artech.base.services.Services;
import com.artech.controls.LaunchScreenViewProviderFactory;
import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;
import com.genexus.coreusercontrols.gauge.RangeControl;
import com.genexus.coreusercontrols.image.GxAdvancedImage;
import com.genexus.coreusercontrols.image.GxImageAnnotations;
import com.genexus.coreusercontrols.imagegallery.ImageGallery;
import com.genexus.coreusercontrols.imagemap.GxImageMap;
import com.genexus.coreusercontrols.matrixgrid.MatrixGrid;
import com.genexus.coreusercontrols.rating.RatingControl;
import com.genexus.coreusercontrols.sparkline.GxSparkLine;

public class CoreUserControlsModule implements GenexusModule {
	private static final String LANDSCAPE_LAUNCH_IMAGE_NAME = "appwelcomedefaultlandscape";
	private static final String LAUNCH_IMAGE_NAME = "appwelcomedefault";

	@Override
	public void initialize(Context context) {
		UcFactory.addControl(new UserControlDefinition(GxSwitch.NAME, GxSwitch.class));
		UcFactory.addControl(new UserControlDefinition(GxChronometer.NAME, GxChronometer.class));
		UcFactory.addControl(new UserControlDefinition(SeekBarControl.NAME, SeekBarControl.class));
		UcFactory.addControl(new UserControlDefinition(RadioGroupControl.NAME, RadioGroupControl.class));
		UcFactory.addControl(new UserControlDefinition(StaticSpinnerControl.NAME, StaticSpinnerControl.class));
		UcFactory.addControl(new UserControlDefinition(RatingControl.NAME, RatingControl.class));
		UcFactory.addControl(new UserControlDefinition(GxSparkLine.NAME, GxSparkLine.class));
		UcFactory.addControl(new UserControlDefinition(RangeControl.NAME, RangeControl.class));
		UcFactory.addControl(new UserControlDefinition(MatrixGrid.NAME, MatrixGrid.class, true));
		UcFactory.addControl(new UserControlDefinition(GxAdvancedImage.NAME, GxAdvancedImage.class, true));
		UcFactory.addControl(new UserControlDefinition(GxImageAnnotations.NAME, GxImageAnnotations.class, true));
		UcFactory.addControl(new UserControlDefinition(GxImageMap.NAME, GxImageMap.class));
		UcFactory.addControl(new UserControlDefinition(ImageGallery.NAME, ImageGallery.class));
		UcFactory.addControl(new UserControlDefinition(GxInPlaceDatePicker.NAME, GxInPlaceDatePicker.class));

		int imageResId = 0;
		if (Services.Device.getScreenOrientation() == Orientation.LANDSCAPE)
			imageResId = Services.Resources.getResourceId(LANDSCAPE_LAUNCH_IMAGE_NAME, "drawable");
		if (imageResId <= 0)
			imageResId = Services.Resources.getResourceId(LAUNCH_IMAGE_NAME, "drawable");

		if (imageResId > 0) {
			LaunchScreenViewProviderFactory.setProvider(new StaticImageLaunchScreenViewProvider(imageResId));
		}
	}
}
