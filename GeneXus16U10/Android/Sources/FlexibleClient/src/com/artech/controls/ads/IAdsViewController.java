package com.artech.controls.ads;

import androidx.annotation.Nullable;
import android.view.View;

import com.artech.base.controls.IGxControlRuntime;

/**
 * Ad View Controller interface.
 */
public interface IAdsViewController extends IGxControlRuntime
{
	@Nullable View createView();
	void setViewSize(int width, int height);
}
