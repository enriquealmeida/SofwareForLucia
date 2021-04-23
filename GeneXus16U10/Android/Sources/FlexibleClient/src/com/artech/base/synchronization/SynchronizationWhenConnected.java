package com.artech.base.synchronization;

import java.io.File;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.Build;

import androidx.annotation.RequiresApi;

import com.artech.application.MyApplication;
import com.artech.base.services.AndroidContext;
import com.artech.base.services.Services;

public class SynchronizationWhenConnected {
	private static final int NO = 0;
	private static final int WIFI = 1;
	private static final int CELLULAR = 2;

	@SuppressWarnings("deprecation")
	public static void onNetworkStatusChanged(Context context, android.net.NetworkInfo networkInfo) {
		int connectionType = NO;
		if (networkInfo != null && networkInfo.isConnected()) {
			if (networkInfo.getType() == ConnectivityManager.TYPE_WIFI)
				connectionType = WIFI;
			else
				connectionType = CELLULAR;
		}
		onNetworkStatusChanged(context, connectionType);
	}

	@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
	public static void onNetworkStatusChanged(Context context, NetworkCapabilities networkCapabilities) {
		int connectionType = NO;
		if (networkCapabilities != null) {
			if (networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
				connectionType = WIFI;
			else if (networkCapabilities.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))
				connectionType = CELLULAR;
		}
		onNetworkStatusChanged(context, connectionType);
	}

	private static void onNetworkStatusChanged(Context context, int connectionType)
	{
		if (MyApplication.getApp() == null)
		{
			Services.Log.error("SynchronizationWhenConnected, current app null");
			return;
		}
	
		if (MyApplication.getApp().isOfflineApplication() &&
				MyApplication.getApp().getSynchronizerSendAutomatic() && connectionType != NO)
		{

			if (SynchronizationSendHelper.isRunningSendBackground)
			{
				Services.Log.warning("SynchronizationWhenConnected, other receiving working.");
				return;
			}
		
			if (SynchronizationHelper.isRunningSendOrReceive)
			{
				Services.Log.warning("SynchronizationWhenConnected, Send Or Receive running, cannot do a send.");
				return;
			}
		
			String filePath = AndroidContext.ApplicationContext.getDataBaseFilePath();
			File file = new File(filePath);
			if (!file.exists())
			{
				Services.Log.warning("SynchronizationWhenConnected, Database File not exits.");
				return;
			}

			if (connectionType == WIFI)
			{
				Services.Log.debug("Wifi connected");
				sendPendingEvents();
			}
			else if (connectionType == CELLULAR)
			{
				Services.Log.debug("Mobile connected");
				sendPendingEvents();
			}
		}
	}

	private static void sendPendingEvents()
	{
		//	Send events in background
		Services.Log.debug("sendPendingsToServerInBackground (Sync.Send) from NetworkReceiver onReceive ");
		Services.Sync.sendPendingsToServerInBackground();
	}
}	

