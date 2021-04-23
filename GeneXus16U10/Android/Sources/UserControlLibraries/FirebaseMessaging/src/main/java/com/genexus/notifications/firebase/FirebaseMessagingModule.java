package com.genexus.notifications.firebase;

import android.content.Context;

import com.artech.android.remotenotification.RemoteNotification;
import com.artech.framework.GenexusModule;

public class FirebaseMessagingModule implements GenexusModule {
    @Override
    public void initialize(Context context)
    {
        FirebaseMessagingProvider notificationProvider = new FirebaseMessagingProvider();
        RemoteNotification.addProvider(notificationProvider);
        RemoteNotification.setDefaultProvider(notificationProvider);
    }
}
