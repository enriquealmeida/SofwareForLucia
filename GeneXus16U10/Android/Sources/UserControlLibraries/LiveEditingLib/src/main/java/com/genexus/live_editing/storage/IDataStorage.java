package com.genexus.live_editing.storage;

import java.util.List;

import com.genexus.live_editing.support.Endpoint;

public interface IDataStorage {
	void storeEndpoint(Endpoint endpoint);
	List<Endpoint> getStoredEndpoints();
}
