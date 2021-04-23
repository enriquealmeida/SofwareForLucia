package com.artech.base.services;

import android.app.Activity;

/**
 * Interface used by the Application service to signal changes in foreground/background state.
 */
public interface ForegroundListener
{
	/**
	 * Called when the application is brought to the foreground.
	 * @param justStarted The activity that was just started.
	 */
	void onBecameForeground(Activity justStarted);

	/**
	 * Called when the application is dropped to the background.
	 * @param justStopped The activity that was just stopped.
	 */
	void onBecameBackground(Activity justStopped);
}
