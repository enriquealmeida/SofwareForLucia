package com.genexus.live_editing.network;

import androidx.annotation.NonNull;

import com.genexus.live_editing.support.Endpoint;
import com.genexus.live_editing.commands.IServerCommand;

public interface INetworkEventsListener {
	void onConnectionAttempt(@NonNull Endpoint targetEndpoint);
	void onMaxAttemptsReached();
	void onConnectionEstablished(@NonNull Endpoint endpoint);
	void onConnectionDropped();
	void onCommandReceived(IServerCommand command);
}
