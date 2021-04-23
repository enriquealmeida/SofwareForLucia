package com.genexus.android.ads.googlemobileads;

import android.content.Context;

import com.artech.controls.ads.Ads;
import com.artech.framework.GenexusModule;

/**
 * GoobleMobile Ads Module.
 */
public class GoogleMobileAdsModule implements GenexusModule
{
	@Override
	public void initialize(Context context)
	{
		GoogleMobileAdsProvider adMob = new GoogleMobileAdsProvider();
		Ads.addProvider(adMob);
		Ads.setDefaultProvider(adMob);
	}
}
