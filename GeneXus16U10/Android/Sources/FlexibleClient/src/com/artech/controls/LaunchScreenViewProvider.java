package com.artech.controls;

import android.content.Context;
import android.view.View;

import androidx.annotation.NonNull;

public interface LaunchScreenViewProvider {
	View createView(@NonNull Context context, @NonNull OnFinishListener onFinishListener);

	interface OnFinishListener {
		void onFinish();
	}
}
