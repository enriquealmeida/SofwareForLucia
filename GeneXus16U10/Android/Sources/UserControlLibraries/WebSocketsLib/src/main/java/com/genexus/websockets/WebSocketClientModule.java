package com.genexus.websockets;

import android.app.Application;
import android.content.Context;

import com.artech.base.services.IApplication;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

public class WebSocketClientModule implements GenexusModule, IApplication.MetadataLoadingListener {

	@Override
	public void initialize(Context context) {
		ExternalApiFactory.addApi(new ExternalApiDefinition(WebSocketClient.OBJECT_NAME, WebSocketClient.class));
		IApplication application = (IApplication) context;
		application.registerOnMetadataLoadFinished(this);
	}

	@Override
	public void onMetadataLoadFinished(IApplication application) {
		Foreground.init((Application)application);
		Services.Application.registerComponentEventsListener(WebSocketsServiceFactory.getInstance());
	}
}
