package com.genexus.websockets;

import com.artech.application.MyApplication;

import java.util.concurrent.TimeUnit;


import okhttp3.OkHttpClient;

public class WebSocketsServiceFactory {
	private static WebSocketsService sInstance = null;

	public static WebSocketsService getInstance() {
		synchronized (WebSocketsServiceFactory.class) {
			if (sInstance == null) {
				OkHttpClient okHttpClient = new OkHttpClient.Builder()
						.connectTimeout(10, TimeUnit.SECONDS)
						.readTimeout(0, TimeUnit.SECONDS)
						.build();
				int maxConnectionAttempts = 10;
				String endpointUrl = Utils.getDefaultWebSocketsUrl(MyApplication.getApp());
				sInstance = new WebSocketsService(WebSocketClient.WEB_SOCKETS_EVENTS_LISTENER,
						okHttpClient, maxConnectionAttempts, endpointUrl);
			}
			return sInstance;
		}
	}
}
