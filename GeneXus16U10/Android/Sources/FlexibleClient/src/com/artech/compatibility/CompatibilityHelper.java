package com.artech.compatibility;

import android.os.Build.VERSION;
import android.os.Build.VERSION_CODES;

public class CompatibilityHelper
{
	public static boolean isStatusBarOverlayingAvailable()
	{
		return VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP;
	}
}
