package com.genexus.notifications.onesignal;

import android.content.Context;

import com.artech.android.remotenotification.RemoteNotification;
import com.artech.framework.GenexusModule;
import com.onesignal.OneSignal;

public class OneSignalModule implements GenexusModule {

	@Override
	public void initialize(Context context)
	{
		OneSignal.startInit(context)
				.inFocusDisplaying(OneSignal.OSInFocusDisplayOption.Notification)
				.init();

		OneSignalProvider notificationProvider = new OneSignalProvider();

		RemoteNotification.addProvider(notificationProvider);
		RemoteNotification.setDefaultProvider(notificationProvider);
	}
}
