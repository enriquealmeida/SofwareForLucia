package com.genexus.android.ui.animation;

import android.content.Context;

import com.artech.controls.LaunchScreenViewProviderFactory;
import com.artech.controls.LoadingIndicatorView;
import com.artech.controls.ProgressDialogFactory;
import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;

/**
 * Animation support Module. Uses Lottie by Airbnb.
 */
public class AnimationModule implements GenexusModule {
	private static final String LAUNCH_ANIMATION_NAME = "gxlaunch";

	@Override
	public void initialize(Context context) {
		LoadingIndicatorView.registerLoadingViewProvider(new LoadingAnimationProvider());
		ProgressDialogFactory.registerProgressDialogProvider(new ProgressDialogAnimationProvider());
		UcFactory.addControl(new UserControlDefinition(GxAnimationView.USER_CONTROL_NAME, GxAnimationView.class));

		String assetName = Utils.getFileName(context, LAUNCH_ANIMATION_NAME);
		if (Utils.hasAsset(context, assetName)) {
			LaunchScreenViewProviderFactory.setProvider(new LottieAnimationLaunchScreenViewProvider(assetName));
		}
	}
}
