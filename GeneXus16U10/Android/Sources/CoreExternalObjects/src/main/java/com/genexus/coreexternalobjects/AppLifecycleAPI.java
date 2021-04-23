package com.genexus.coreexternalobjects;

import androidx.lifecycle.DefaultLifecycleObserver;
import androidx.lifecycle.LifecycleOwner;
import androidx.lifecycle.ProcessLifecycleOwner;
import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.actions.ExternalObjectEvent;
import com.artech.activities.ActivityHelper;
import com.artech.base.services.IApplication;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.artech.fragments.IDataView;

import java.util.Arrays;

public class AppLifecycleAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.AppLifecycle";

	private static final String PROPERTY_APPLICATION_STATE = "ApplicationState";
	private static final String EVENT_APP_STATE_CHANGED = "AppStateChanged";

	private static final int APPLICATION_STATE_ACTIVE = 0;
	private static final int APPLICATION_STATE_INACTIVE = 1;
	private static final int APPLICATION_STATE_BACKGROUND = 2;
	private static final int APPLICATION_STATE_NOT_RUNNING = 3;
	private static final MyLifecycleObserver APPLICATION_LIFECYCLE_OBSERVER = new MyLifecycleObserver();
	private final IMethodInvoker mGetApplicationState = parameters ->
			ExternalApiResult.success(APPLICATION_LIFECYCLE_OBSERVER.getCurrentState());

	public AppLifecycleAPI(ApiAction action) {
		super(action);
		addReadonlyPropertyHandler(PROPERTY_APPLICATION_STATE, mGetApplicationState);
	}

	public static void initialize() {
		ProcessLifecycleOwner.get().getLifecycle().addObserver(APPLICATION_LIFECYCLE_OBSERVER);
	}

	private static class MyLifecycleObserver implements DefaultLifecycleObserver {
		private final ExternalObjectEvent mAppStateChanged = new ExternalObjectEvent(OBJECT_NAME, EVENT_APP_STATE_CHANGED);
		private int mCurrentState = APPLICATION_STATE_NOT_RUNNING;

		public int getCurrentState() {
			return mCurrentState;
		}

		private void fireEvent(int newState) {
			if (mCurrentState != newState) {
				int oldState = mCurrentState;
				mCurrentState = newState;
				mAppStateChanged.fire(Arrays.asList(oldState, newState));
			}
		}

		@Override
		public void onCreate(@NonNull LifecycleOwner owner) {
			class Listener implements IApplication.MetadataLoadingListener, ActivityHelper.MainActivitySetListener, IApplication.ComponentEventsListener {
				private boolean mApplicationLoaded;
				private boolean mMainActivitySet;
				private boolean mComponentInitialized;

				private void fireEventIfReady() {
					if (mApplicationLoaded && mMainActivitySet && mComponentInitialized)
						fireEvent(APPLICATION_STATE_ACTIVE);
				}

				@Override
				public void onMetadataLoadFinished(IApplication application) {
					mApplicationLoaded = true;
					fireEventIfReady();
					Services.Application.unregisterOnMetadataLoadFinished(this);
				}

				@Override
				public void onMainActivitySet() {
					mMainActivitySet = true;
					fireEventIfReady();
					ActivityHelper.removeMainActivitySetListener(this);
				}

				@Override
				public void onComponentInitialized(IDataView component) {
					mComponentInitialized = true;
					fireEventIfReady();
					Services.Application.unregisterComponentEventsListener(this);
				}
			}

			Listener listener = new Listener();
			Services.Application.registerOnMetadataLoadFinished(listener);
			ActivityHelper.addMainActivitySetListener(listener);
			Services.Application.registerComponentEventsListener(listener);
		}

		@Override
		public void onStart(@NonNull LifecycleOwner owner) {
			if (mCurrentState != APPLICATION_STATE_NOT_RUNNING)
				fireEvent(APPLICATION_STATE_ACTIVE);
		}

		@Override
		public void onStop(@NonNull LifecycleOwner owner) {
			fireEvent(APPLICATION_STATE_BACKGROUND);
		}

		@Override
		public void onDestroy(@NonNull LifecycleOwner owner) {
			// Never called, https://developer.android.com/reference/android/arch/lifecycle/ProcessLifecycleOwner
			fireEvent(APPLICATION_STATE_NOT_RUNNING);
		}
	}
}
