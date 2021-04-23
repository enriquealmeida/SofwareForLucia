package com.genexus.coreexternalobjects.network;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.net.ConnectivityManager;

import androidx.core.net.ConnectivityManagerCompat;

import com.artech.android.api.EventDispatcher;
import com.artech.base.synchronization.SynchronizationWhenConnected;
import com.genexus.coreexternalobjects.NetworkAPI;

import java.util.Collections;

/**
 * Monitors changes to the network status.
 */
public class NetworkBroadcastReceiver extends BroadcastReceiver {
	@Override
	@SuppressWarnings("deprecation")
	public void onReceive(Context context, Intent intent) {
		ConnectivityManager cm = (ConnectivityManager) context.getSystemService(Context.CONNECTIVITY_SERVICE);
		android.net.NetworkInfo networkInfo = ConnectivityManagerCompat.getNetworkInfoFromBroadcast(cm, intent);

		// Fire Network.NetworkStatusChanged event to current panel.
		EventDispatcher.fireEvent(context, NetworkAPI.OBJECT_NAME, NetworkAPI.EVENT_NETWORK_STATUS_CHANGED, Collections.emptyList());

		// Signal connection change to synchronization; it might want to send data.
		SynchronizationWhenConnected.onNetworkStatusChanged(context, networkInfo);
	}
}
