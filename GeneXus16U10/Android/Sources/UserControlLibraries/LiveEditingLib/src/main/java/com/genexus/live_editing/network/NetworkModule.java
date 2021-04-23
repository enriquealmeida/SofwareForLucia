package com.genexus.live_editing.network;

import com.artech.application.MyApplication;
import com.genexus.live_editing.ApplicationModule;
import com.genexus.live_editing.serializers.ParsingModule;
import com.genexus.live_editing.storage.IDataStorage;
import com.google.gson.Gson;

import java.util.concurrent.TimeUnit;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;
import okhttp3.OkHttpClient;

@Module(includes = {ApplicationModule.class, ParsingModule.class})
public class NetworkModule {
	private INetworkEventsListener mConnectionEventsListener;

	public NetworkModule(INetworkEventsListener connectionEventsListener) {
		mConnectionEventsListener = connectionEventsListener;
	}

	@Provides
	@Singleton
	public OkHttpClient providesOkHttpClient() {
		OkHttpClient.Builder okHttpClientBuilder = new OkHttpClient.Builder()
				.connectTimeout(200, TimeUnit.MILLISECONDS)
				.readTimeout(0, TimeUnit.MILLISECONDS);
		OkHttpTweaks.configure(okHttpClientBuilder);
		return okHttpClientBuilder.build();
	}

	@Provides
	@Singleton
	public ConnectionStringInfo providesConnectionStringInfo(MyApplication application) {
		String connectionString = application.getPatternSettings().getIDEConnectionString();
		return ConnectionStringInfo.parse(connectionString);
	}

	@Provides
	@Singleton
	public INetworkClient providesWebSocketClient(OkHttpClient okHttpClient, Gson gson,
												  ConnectionStringInfo connectionStringInfo,
												  IDataStorage dataStorage) {
		return new WebSocketClient(okHttpClient, gson, mConnectionEventsListener,
				connectionStringInfo, dataStorage.getStoredEndpoints());
	}
}
