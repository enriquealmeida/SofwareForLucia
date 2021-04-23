package com.genexus.android.analytics.firebase;

import android.content.Context;

import com.artech.android.analytics.Analytics;
import com.artech.framework.GenexusModule;

public class FirebaseAnalyticsModule implements GenexusModule {
    @Override
    public void initialize(Context context)
    {
        Analytics.setProvider(new FirebaseAnalyticsProvider(context));
    }
}
