package com.genexus.android.ads.admob;

import android.content.Context;

import com.artech.controls.ads.Ads;
import com.artech.framework.GenexusModule;

/**
 * AdMob Ads Module.
 */
public class AdMobModule implements GenexusModule
{
	@Override
	public void initialize(Context context)
	{
		AdMobAdProvider adMob = new AdMobAdProvider();

		Ads.addProvider(adMob);
		Ads.setDefaultProvider(adMob);
	}
}
