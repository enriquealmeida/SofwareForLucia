package com.genexus.live_editing.inspector;

import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;

import android.app.Activity;
import android.os.Looper;
import androidx.annotation.NonNull;
import android.view.View;
import android.view.ViewTreeObserver;

import com.artech.activities.ActivityHelper;
import com.artech.base.services.Services;
import com.genexus.live_editing.support.GxActivitiesLifecycleListener;
import com.genexus.live_editing.support.ILifecycleTracker;
import com.genexus.live_editing.commands.CommandMasterLayout;
import com.genexus.live_editing.network.INetworkClient;

class InspectorImpl implements IInspector,
							   ViewTreeObserver.OnGlobalLayoutListener,
							   GxActivitiesLifecycleListener {
	private final INetworkClient mClient;
	private final ILifecycleTracker mLifecycleTracker;
	private final Executor mExecutor;
	private final AtomicBoolean mEnabled;
	private final ReschedulableTimer mTimer;
	private static final int WAIT_FOR_UI_CHANGES_TIMEOUT = 300;

	public InspectorImpl(@NonNull INetworkClient client,
						 @NonNull ILifecycleTracker lifecycleTracker,
						 @NonNull Executor executor) {
		mClient = client;
		mLifecycleTracker = lifecycleTracker;
		mExecutor = executor;
		mEnabled = new AtomicBoolean(false);
		mTimer = new ReschedulableTimer(new ExecuteInspectUIOnUIThread(), WAIT_FOR_UI_CHANGES_TIMEOUT);
	}

	@Override
	public void enable() {
		if (mEnabled.compareAndSet(false, true)) {
			mLifecycleTracker.registerActivitiesLifecycleListener(this);
			Activity frontActivity = ActivityHelper.getCurrentActivity();
			if (frontActivity != null) {
				addLayoutChangesListener(frontActivity);
			}
			mTimer.schedule();
		}
	}

	@Override
	public void disable() {
		if (mEnabled.compareAndSet(true, false)) {
			mLifecycleTracker.unregisterActivitiesLifecycleListener(this);
			Activity frontActivity = ActivityHelper.getCurrentActivity();
			if (frontActivity != null) {
				removeLayoutChangesListener(frontActivity);
			}
			mTimer.cancelTask();
		}
	}

	@Override
	public void requestUIInspection() {
		mTimer.reschedule();
	}

	/**
	 * Runs on background Thread.
	 */
	private class ExecuteInspectUIOnUIThread implements Runnable {

		@Override
		public void run() {
			if (Looper.myLooper() == Looper.getMainLooper()) {
				throw new IllegalStateException("Caught in UI thread.");
			}
			Services.Device.runOnUiThread(new InspectUIAction());
		}
	}

	/**
	 * Runs on UI Thread.
	 */
	private class InspectUIAction implements Runnable {

		@Override
		public void run() {
			if (Looper.myLooper() != Looper.getMainLooper()) {
				throw new IllegalStateException("Caught in background thread.");
			}
			if (ActivityHelper.hasCurrentActivity()) {
				Activity frontActivity = ActivityHelper.getCurrentActivity();
				MasterLayoutData masterLayoutData = ScreenCapture.createMasterLayoutData(frontActivity);
				mExecutor.execute(new CreateInspectUICommand(masterLayoutData));
			}
		}
	}

	/**
	 * Runs on background Thread.
	 */
	private class CreateInspectUICommand implements Runnable {
		private final MasterLayoutData mMasterLayoutData;

		public CreateInspectUICommand(MasterLayoutData masterLayoutData) {
			mMasterLayoutData = masterLayoutData;
		}

		@Override
		public void run() {
			if (Looper.myLooper() == Looper.getMainLooper()) {
				throw new IllegalStateException("Caught in UI thread.");
			}
			mClient.send(new CommandMasterLayout(mMasterLayoutData));
		}
	}

	@Override
	public void onActivityCreated(Activity activity) {

	}

	@Override
	public void onActivityResumed(Activity activity) {
		if (mEnabled.get()) {
			addLayoutChangesListener(activity);
		}
	}

	@Override
	public void onActivityPaused(Activity activity) {
		if (mEnabled.get()) {
			removeLayoutChangesListener(activity);
		}
	}

	@Override
	public void onActivityDestroyed(Activity activity) {
		requestUIInspection();
	}

	@Override
	public void onGlobalLayout() {
		mTimer.reschedule();
	}

	private void addLayoutChangesListener(Activity activity) {
		View content = activity.findViewById(android.R.id.content);
		content.getViewTreeObserver().addOnGlobalLayoutListener(this);
	}

	private void removeLayoutChangesListener(Activity activity) {
		View content = activity.findViewById(android.R.id.content);
		content.getViewTreeObserver().removeOnGlobalLayoutListener(this);
	}
}
