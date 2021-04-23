package com.artech.android.device;

import android.os.Build;

import com.artech.android.LocaleHelper;
import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.artech.base.utils.PlatformHelper;
import com.artech.base.utils.Strings;

/**
 * This class allow access to device information.
 */
public class ClientInformation
{
	private static final String OS_NAME = "Android";
	private static String sApplicationId = null;

	/***
	 * Return a value that identify the device. This id is network independent.
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static String id()
	{
		DeviceUuidFactory factory = new DeviceUuidFactory(MyApplication.getInstance());
		return factory.getDeviceUuid().toString();
	}

	/***
	 * Returns Android as the operating system
	 * @return
	 */
	public static String osName() { return OS_NAME; }

	/***
	 * Return the OS Version code, you can see the values from
	 * http://developer.android.com/reference/android/os/Build.VERSION_CODES.html
	 * @return
	 */
	public static String osVersion()
	{
		// change implementation, issue 29979, retornar version release.
		//return String.valueOf(android.os.Build.VERSION.SDK_INT);
		return String.valueOf(android.os.Build.VERSION.RELEASE);
	}

	@SuppressWarnings("deprecation")
	public static String deviceName()
	{
		return Build.DEVICE + "-" + Build.SERIAL;
	}

	public static String getPlatformName()
	{
		return PlatformHelper.getPlatform().getName();
	}

	public static String getLanguage()
	{
		return LocaleHelper.getLocaleString(Services.Device.getLocales());
	}

	public static int deviceType() { return 1; } // SmartDeviceType Enum, Android=1

	public static String getAppVersionCode()
	{
		if (MyApplication.getApp() != null && MyApplication.getApp().getMainProperties() != null)
			return MyApplication.getApp().getMainProperties().optStringProperty("@idAPPAndroidVersionCode");
		else
			return Strings.EMPTY;
	}

	public static String getAppVersionName()
	{
		if (MyApplication.getApp() != null && MyApplication.getApp().getMainProperties() != null)
		{
			String valueVersionCode = MyApplication.getApp().getMainProperties().optStringProperty("@idAPPAndroidVersionName");
			// if has default value is now written in metadata.
			if (Strings.hasValue(valueVersionCode))
				return valueVersionCode;
			else
				return "1.0";
		}
		else
			return Strings.EMPTY;
	}

	/***
	 * Return a value that identify the device app instalation.
	 * @return
	 */
	@SuppressWarnings("deprecation")
	public static String instalationId()
	{
		DeviceInstallUuidFactory factory = new DeviceInstallUuidFactory(MyApplication.getInstance());
		return factory.getDeviceInstalationUuid().toString();
	}

	public static String applicationId()
	{
		if (sApplicationId==null)
		{
			sApplicationId = MyApplication.getAppContext().getPackageName();
		}
		return sApplicationId;
	}

}
