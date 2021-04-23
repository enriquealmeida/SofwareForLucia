package com.genexus.uitesting.idlingresources;

import android.app.Activity;
import androidx.test.espresso.IdlingResource;
import android.view.View;

import com.artech.activities.ActivityHelper;
import com.artech.android.ViewHierarchyVisitor;
import com.artech.controls.LoadingIndicatorView;

import java.util.List;

public class LoadingIndicatorIdlingResource implements IdlingResource {
	private ResourceCallback mResourceCallback;

	@Override
	public String getName() {
		return LoadingIndicatorIdlingResource.class.getName();
	}

	@Override
	public boolean isIdleNow() {
		Activity currentActivity = ActivityHelper.getCurrentActivity(); // TODO: Should have a better way to get the LoadingIndicatorViews from the current activity.
		if (currentActivity == null) {
			return false;
		}

		List<LoadingIndicatorView> views = ViewHierarchyVisitor.getViews(LoadingIndicatorView.class, currentActivity.findViewById(android.R.id.content));
		boolean idle = true;
		for (LoadingIndicatorView view : views) {
			if (view.getVisibility() == View.VISIBLE) {
				idle = false;
				break;
			}
		}

		if (idle) {
			mResourceCallback.onTransitionToIdle(); // TODO: REMOVE
		}

		return idle;
	}

	@Override
	public void registerIdleTransitionCallback(ResourceCallback callback) {
		mResourceCallback = callback;
	}
}
