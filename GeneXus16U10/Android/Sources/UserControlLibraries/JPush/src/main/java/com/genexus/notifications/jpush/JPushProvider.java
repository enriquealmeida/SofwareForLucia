package com.genexus.notifications.jpush;

import android.content.Context;

import androidx.annotation.NonNull;

import com.artech.android.device.ClientInformation;
import com.artech.android.notification.NotificationDeviceRegister;
import com.artech.android.remotenotification.IBadgeNotification;
import com.artech.android.remotenotification.IRemoteNotificationProvider;
import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.google.gson.JsonObject;

import cn.jpush.android.api.JPushInterface;

public class JPushProvider implements IRemoteNotificationProvider, IBadgeNotification {
	private Context mContext;
	private GenexusApplication mGenexusApplication;

	@Override
	public @NonNull String getId() {
		return "jpush";
	}

	private static String sDeviceId = null;
	private static String sRegistrationId = null;
	private static int sRegisterTimes = 0;

	@Override
	public void registerDevice(Context context, GenexusApplication genexusApplication) {
		mContext = context;
		mGenexusApplication = genexusApplication;
		sDeviceId = JPushUtil.getDeviceId(context);
		JPushUtil.showLog("Device Id: " + sDeviceId);
		sRegistrationId = JPushInterface.getRegistrationID(context);
		if (!sRegistrationId.isEmpty())
			registerInServer();
		else
			registerInJPush();
	}

	private void registerInServer() {
		JPushUtil.showLog("Registration Id: " + sRegistrationId);
		Thread thread = new Thread(null, () -> {
			if (sDeviceId != null && sRegistrationId != null) {
				String deviceTokenJson = getDeviceTokenJson();
				NotificationDeviceRegister.registerWithServer(mGenexusApplication, deviceTokenJson);
			}
		}, "RegisterServerInBackground");
		thread.start();
	}

	private void registerInJPush() {
		Thread thread = new Thread(null, () -> {
			if (sRegisterTimes == 0) {
				JPushUtil.showLog("Trying to initialize in background process #" + sRegisterTimes);
				JPushInterface.init(mContext);
			} else
				try {
					Thread.sleep(1000);
				} catch (InterruptedException e) {
				}
			sRegisterTimes += 1;
			JPushUtil.showLog("Trying to register id in background process #" + sRegisterTimes);
			sRegistrationId = JPushInterface.getRegistrationID(mContext);
			if (!sRegistrationId.isEmpty())
				registerInServer();
			else if (sRegisterTimes < 60)
				registerInJPush();
			else
				JPushUtil.showToast("Get notification registration id fail.", MyApplication.getAppContext());
		}, "RegisterInJPushBackground");
		thread.start();
	}

	// json like token :
	// { DeviceToken, DeviceId,  DeviceType,
	// NotificationPlatform = "APNS" || "GCM" || "OneSignal"
	// NotificationPlatformId = "ID del Usuario en el Platform" (en caso que aplique)
	// }
	private static String getDeviceTokenJson() {
		JsonObject objectToSend = new JsonObject();
		objectToSend.addProperty("DeviceToken", sDeviceId);
		objectToSend.addProperty("DeviceId", ClientInformation.id());
		objectToSend.addProperty("DeviceType", 1);
		objectToSend.addProperty("NotificationPlatform", "JPush");
		objectToSend.addProperty("NotificationPlatformId", sRegistrationId);
		return objectToSend.toString();
	}

	@Override
	public void setBadgeCount(Context context, int number) {
		BadgeManager.setBadge(context, number);
	}
}
