package com.genexus.uitesting.idlingresources;

import androidx.test.espresso.IdlingRegistry;
import androidx.test.espresso.IdlingResource;

public class WaitingIdlingResource implements IdlingResource {

	private ResourceCallback mResourceCallback;
	private long mMilliseconds;
	private long mStartTime;

	public WaitingIdlingResource(Integer millis) {
		this.mMilliseconds = millis.longValue();
		this.mStartTime = System.currentTimeMillis();
	}

	@Override
	public boolean isIdleNow() {
		long elapsed = System.currentTimeMillis() - mStartTime;
		boolean idle = (elapsed >= mMilliseconds);

		if (idle) {
			mResourceCallback.onTransitionToIdle();
			IdlingRegistry.getInstance().unregister(this);
		}

		return idle;
	}

	@Override
	public String getName() {
		return WaitingIdlingResource.class.getName();
	}

	@Override
	public void registerIdleTransitionCallback(ResourceCallback callback) {
		this.mResourceCallback = callback;
	}
}
