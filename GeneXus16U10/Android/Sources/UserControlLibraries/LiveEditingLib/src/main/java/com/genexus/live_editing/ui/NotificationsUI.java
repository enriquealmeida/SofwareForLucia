package com.genexus.live_editing.ui;

import android.app.Activity;
import android.view.View;

import com.artech.activities.ActivityHelper;
import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.genexus.live_editing.LiveEditingGenexusModule;
import com.genexus.live_editing.R;
import com.genexus.live_editing.support.Endpoint;
import com.google.android.material.snackbar.Snackbar;

class NotificationsUI implements IUserInterface {
	private static final int NOTIFICATION_ID = 53723;
	private final MyApplication mApplication;
	private LiveEditingGenexusModule mLiveEditingGenexusModule;

	public NotificationsUI(MyApplication application, LiveEditingGenexusModule liveEditingGenexusModule) {
		mApplication = application;
		mLiveEditingGenexusModule = liveEditingGenexusModule;
	}

	@Override
	public void displayConnectionAttempt(Endpoint targetEndpoint) {
		String message = mApplication.getString(R.string.status_connecting, targetEndpoint);
		showNotification(message);
	}

	@Override
	public void displayConnectionFailed() {
		Activity activity = ActivityHelper.getCurrentActivity();
		if (activity == null) {
			return;
		}

		String message = mApplication.getString(R.string.status_disconnected);
		showNotification(message);

		Snackbar.make(activity.findViewById(android.R.id.content), R.string.could_not_establish_connection, Snackbar.LENGTH_INDEFINITE)
				.setAction(R.string.retry, new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						mLiveEditingGenexusModule.initiate(mApplication);
					}
				})
				.show();
	}

	@Override
	public void displayConnectionEstablished(Endpoint endpoint) {
		Activity activity = ActivityHelper.getCurrentActivity();
		if (activity == null) {
			return;
		}

		String message = mApplication.getString(R.string.status_connected, endpoint);
		showNotification(message);

		Snackbar.make(activity.findViewById(android.R.id.content), R.string.connection_established, Snackbar.LENGTH_SHORT)
				.show();
	}

	@Override
	public void displayConnectionDropped() {
		Activity activity = ActivityHelper.getCurrentActivity();
		if (activity == null) {
			return;
		}

		String message = mApplication.getString(R.string.status_disconnected);
		showNotification(message);

		Snackbar
				.make(
						activity.findViewById(android.R.id.content),
						R.string.connection_dropped,
						Snackbar.LENGTH_INDEFINITE
				)
				.setAction(R.string.retry, new View.OnClickListener() {
					@Override
					public void onClick(View v) {
						mLiveEditingGenexusModule.initiate(mApplication);
					}
				}).show();
	}

	@Override
	public void stopDisplayingInformation() {
		Services.Notifications.closeOngoingNotification(NOTIFICATION_ID);
	}

	private void showNotification(String message) {
		Services.Notifications.showOngoingNotification(
			NOTIFICATION_ID,
			mApplication.getString(R.string.live_editing_title),
			message,
			android.R.drawable.ic_menu_edit,
			false
		);
	}
}
