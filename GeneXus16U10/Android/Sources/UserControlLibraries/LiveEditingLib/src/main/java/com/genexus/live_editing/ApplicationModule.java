package com.genexus.live_editing;

import android.content.Context;

import com.artech.application.MyApplication;

import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import javax.inject.Singleton;

import dagger.Module;
import dagger.Provides;

@Module
public class ApplicationModule {
	private MyApplication mApplication;

	public ApplicationModule(MyApplication application) {
		mApplication = application;
	}

	@Provides
	@Singleton
	MyApplication providesMyApplication() {
		return mApplication;
	}

	@Provides
	@Singleton
	Context providesContext() {
		return mApplication.getApplicationContext();
	}

	@Provides
	@Singleton
	Executor providesExecutor() {
		return Executors.newSingleThreadExecutor();
	}
}
