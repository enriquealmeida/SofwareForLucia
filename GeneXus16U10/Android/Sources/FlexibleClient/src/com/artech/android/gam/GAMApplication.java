package com.artech.android.gam;

import com.artech.application.MyApplication;

public class GAMApplication
{
	public GAMApplication()
	{
	}

	// Static API methods.
	public static String getClientId() { return MyApplication.getApp().getClientId(); }

}
