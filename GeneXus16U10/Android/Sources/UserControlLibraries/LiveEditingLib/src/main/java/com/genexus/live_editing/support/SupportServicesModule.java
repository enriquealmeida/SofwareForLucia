package com.genexus.live_editing.support;

import javax.inject.Singleton;

import com.artech.base.services.Services;

import dagger.Module;
import dagger.Provides;

@Module
public class SupportServicesModule {
	@Provides
	@Singleton
	public ILiveEditingImageManager providesLiveEditingImageManager() {
		return new LiveEditingResourcesService(Services.Resources);
	}

	@Provides
	@Singleton
	public ILifecycleTracker providesLifecycleTracker() {
		return new LifecycleTracker();
	}
}
