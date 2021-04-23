package com.genexus.live_editing;

import android.content.Context;

import androidx.annotation.NonNull;

import com.artech.application.MyApplication;
import com.artech.base.services.IApplication;
import com.artech.base.services.Services;
import com.artech.framework.GenexusModule;
import com.genexus.live_editing.commands.IServerCommand;
import com.genexus.live_editing.executor.ICommandExecutor;
import com.genexus.live_editing.inspector.IInspector;
import com.genexus.live_editing.network.INetworkClient;
import com.genexus.live_editing.network.INetworkEventsListener;
import com.genexus.live_editing.network.NetworkModule;
import com.genexus.live_editing.storage.IDataStorage;
import com.genexus.live_editing.support.Endpoint;
import com.genexus.live_editing.support.ILiveEditingImageManager;
import com.genexus.live_editing.ui.IUserInterface;
import com.genexus.live_editing.ui.UIModule;

import java.util.concurrent.atomic.AtomicBoolean;

public class LiveEditingGenexusModule implements GenexusModule,
												 IApplication.MetadataLoadingListener,
												 INetworkEventsListener {
	private IDataStorage mDataStorage;
	private ILiveEditingImageManager mLiveEditingImageManager;
	private IInspector mInspector;
	private ICommandExecutor mCommandExecutor;
	private IUserInterface mUserInterface;
	private INetworkClient mNetworkClient;
	private AtomicBoolean mEnabled;

	@Override
	public void initialize(Context context) {
		MyApplication application = (MyApplication) context;
		application.registerOnMetadataLoadFinished(this);
	}

	/**
	 * At this point we are certain that the Live Editing module has finished its initialization
	 * (its last step was registering this callback), and the app's metadata has finished loading.
	 */
	@Override
	public void onMetadataLoadFinished(IApplication application) {
		// Start Live Editing
		initiate((MyApplication)application);
	}

	public void initiate(MyApplication application) {
		mEnabled = new AtomicBoolean(false);

		LiveEditingComponent liveEditingComponent = DaggerLiveEditingComponent.builder()
				.applicationModule(new ApplicationModule(application))
				.networkModule(new NetworkModule(this))
				.uIModule(new UIModule(this))
				.build();

		// Bind
		mDataStorage = liveEditingComponent.getDataStorage();
		mLiveEditingImageManager = liveEditingComponent.getLiveEditingImageManager();
		mInspector = liveEditingComponent.getInspector();
		mCommandExecutor = liveEditingComponent.getCommandExecutor();
		mUserInterface = liveEditingComponent.getUserInterface();
		mNetworkClient = liveEditingComponent.getNetworkClient();

		// Begin tracking activities
		liveEditingComponent.getLifecycleTracker().beginTracking(application);

		Services.overrideResourcesService(mLiveEditingImageManager);
		Services.Application.enableLiveEditingMode();
		mNetworkClient.connect();
	}

	@Override
	public void onConnectionAttempt(@NonNull Endpoint targetEndpoint) {
		mUserInterface.displayConnectionAttempt(targetEndpoint);
	}

	@Override
	public void onMaxAttemptsReached() {
		mUserInterface.displayConnectionFailed();
	}

	@Override
	public void onConnectionEstablished(@NonNull Endpoint endpoint) {
		mDataStorage.storeEndpoint(endpoint);
		mLiveEditingImageManager.setCurrentEndpoint(endpoint);
		mInspector.enable();
		mEnabled.compareAndSet(false, true);
		mUserInterface.displayConnectionEstablished(endpoint);
	}

	@Override
	public void onConnectionDropped() {
		mInspector.disable();
		mEnabled.compareAndSet(true, false);
		mUserInterface.displayConnectionDropped();
	}

	@Override
	public void onCommandReceived(IServerCommand command) {
		if (mEnabled.get()) {
			mCommandExecutor.enqueue(command);
		}
	}
}
