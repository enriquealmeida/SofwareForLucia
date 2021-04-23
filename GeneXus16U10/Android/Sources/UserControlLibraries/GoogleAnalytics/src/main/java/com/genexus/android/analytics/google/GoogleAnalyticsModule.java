package com.genexus.android.analytics.google;

import android.content.Context;

import com.artech.android.analytics.Analytics;
import com.artech.framework.GenexusModule;

/**
 * Google Analytics Module.
 */
public class GoogleAnalyticsModule implements GenexusModule
{
	@Override
	public void initialize(Context context)
	{
		Analytics.setProvider(new GoogleAnalyticsProvider(context));
	}
}
