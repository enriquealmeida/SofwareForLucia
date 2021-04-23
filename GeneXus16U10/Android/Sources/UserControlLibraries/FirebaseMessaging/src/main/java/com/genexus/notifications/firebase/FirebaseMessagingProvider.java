package com.genexus.notifications.firebase;

import android.content.Context;
import androidx.annotation.NonNull;

import com.artech.android.notification.NotificationDeviceRegister;
import com.artech.android.remotenotification.IRemoteNotificationProvider;
import com.artech.base.metadata.GenexusApplication;
import com.google.firebase.iid.FirebaseInstanceId;

public class FirebaseMessagingProvider implements IRemoteNotificationProvider {
    @NonNull
    @Override
    public String getId() {
        return "firebase";
    }

    @Override
    @SuppressWarnings("deprecation") // TODO: Fix this deprecation!
    public void registerDevice(Context context, GenexusApplication genexusApplication) {
//        FirebaseMessaging.getInstance().subscribeToTopic("A");

        String token = FirebaseInstanceId.getInstance().getToken();
        String deviceTokenJson = MyFirebaseMessagingService.getDeviceTokenJson(token);
        NotificationDeviceRegister.registerWithServer(genexusApplication, deviceTokenJson);
    }
}
