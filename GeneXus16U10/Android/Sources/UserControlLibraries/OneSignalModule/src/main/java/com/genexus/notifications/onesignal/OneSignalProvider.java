package com.genexus.notifications.onesignal;

import android.content.Context;

import androidx.annotation.NonNull;

import com.artech.android.device.ClientInformation;
import com.artech.android.notification.NotificationDeviceRegister;
import com.artech.android.remotenotification.IRemoteNotificationProvider;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.services.Services;
import com.google.gson.JsonObject;
import com.onesignal.OneSignal;

public class OneSignalProvider implements IRemoteNotificationProvider {
	private GenexusApplication mGenexusApplication;

	@NonNull
	@Override
	public String getId() {
		return "onesignal";
	}

	private static String mUserId = null;
	private static String mRegistrationId = null;

	@Override
	public void registerDevice(Context context, GenexusApplication genexusApplication) {
		mGenexusApplication = genexusApplication;

		OneSignal.idsAvailable((userId, registrationId) -> {
			Services.Log.debug("User:" + userId);
			if (registrationId != null) {
				Services.Log.debug("registrationId:" + registrationId);
				mRegistrationId = registrationId;
				mUserId = userId;
				reRegisterInServer();
			}
		});
	}

	private void reRegisterInServer() {
		Thread thread = new Thread(null, () -> {
			if (mUserId != null && mRegistrationId != null) {
				String deviceTokenJson = getDeviceTokenJson();
				NotificationDeviceRegister.registerWithServer(mGenexusApplication, deviceTokenJson);
			}
		}, "RegisterInBackground");
		thread.start();
	}

	// json like token :
	// { DeviceToken, DeviceId,  DeviceType,
	// NotificationPlatform = "APNS" || "GCM" || "OneSignal"
	// NotificationPlatformId = "ID del Usuario en el Platform" (en caso que aplique)
	// }
	private static String getDeviceTokenJson() {
		JsonObject objectToSend = new JsonObject();
		objectToSend.addProperty("DeviceToken", mRegistrationId);
		objectToSend.addProperty("DeviceId", ClientInformation.id());
		objectToSend.addProperty("DeviceType", 1);
		objectToSend.addProperty("NotificationPlatform", "OneSignal");
		objectToSend.addProperty("NotificationPlatformId", mUserId);
		return objectToSend.toString();
	}
}
