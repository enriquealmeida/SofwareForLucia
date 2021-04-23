package com.genexus.coreexternalobjects.network;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;

import androidx.annotation.NonNull;
import androidx.annotation.RequiresApi;

import com.artech.android.api.EventDispatcher;
import com.artech.base.services.Services;
import com.artech.base.synchronization.SynchronizationWhenConnected;
import com.genexus.coreexternalobjects.NetworkAPI;

import java.util.Collections;

@RequiresApi(Build.VERSION_CODES.LOLLIPOP)
public class NetworkCallback extends ConnectivityManager.NetworkCallback {
    private final Context mContext;
    private final ConnectivityManager mConnectivityManager;

    public NetworkCallback(@NonNull Context context,
						   @NonNull ConnectivityManager connectivityManager) {
        mContext = context;
        mConnectivityManager = connectivityManager;
    }

    private void onNetworkStatusChanged(NetworkCapabilities networkCapabilities) {
        // Fire Network.NetworkStatusChanged event to current panel.
        EventDispatcher.fireEvent(mContext, NetworkAPI.OBJECT_NAME, NetworkAPI.EVENT_NETWORK_STATUS_CHANGED, Collections.emptyList());

        // Signal connection change to synchronization; it might want to send data.
        SynchronizationWhenConnected.onNetworkStatusChanged(mContext, networkCapabilities);
    }

    private void onNetworkStatusChanged(Network network) {
        NetworkCapabilities networkCapabilities = mConnectivityManager.getNetworkCapabilities(network);
        onNetworkStatusChanged(networkCapabilities);
    }

    @Override
    public void onAvailable(@NonNull Network network) {
        Services.Log.debug("requestNetwork onAvailable()");
        onNetworkStatusChanged(network);
    }

    @Override
    public void onCapabilitiesChanged (@NonNull Network network, @NonNull NetworkCapabilities networkCapabilities) {
        Services.Log.debug("requestNetwork onCapabilitiesChanged()");
        onNetworkStatusChanged(networkCapabilities);
    }

    @Override
    public void onLinkPropertiesChanged (@NonNull Network network, @NonNull LinkProperties linkProperties) {
        Services.Log.debug("requestNetwork onLinkPropertiesChanged()");
        onNetworkStatusChanged(network);
    }

    @Override
    public void onLosing(@NonNull Network network, int maxMsToLive) {
        Services.Log.debug("requestNetwork onLosing()");
        onNetworkStatusChanged(network);
    }

    @Override
    public void onLost(@NonNull Network network) {
        Services.Log.debug("requestNetwork onLost()");
        onNetworkStatusChanged(network);
    }
}
