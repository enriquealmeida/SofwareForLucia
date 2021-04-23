package com.genexus.live_editing.ui;

import javax.inject.Singleton;

import com.artech.application.MyApplication;
import com.genexus.live_editing.ApplicationModule;
import com.genexus.live_editing.LiveEditingGenexusModule;

import dagger.Module;
import dagger.Provides;

@Module(includes = ApplicationModule.class)
public class UIModule {
	private final LiveEditingGenexusModule mLiveEditingGXModule;

	public UIModule(LiveEditingGenexusModule liveEditingGXModule) {
		mLiveEditingGXModule = liveEditingGXModule;
	}

	@Provides
	@Singleton
	public IUserInterface providesUserInterface(MyApplication application) {
		return new NotificationsUI(application, mLiveEditingGXModule);
	}
}
