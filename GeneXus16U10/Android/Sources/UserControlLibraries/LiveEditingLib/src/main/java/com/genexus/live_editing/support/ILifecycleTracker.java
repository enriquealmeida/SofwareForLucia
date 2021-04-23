package com.genexus.live_editing.support;

import android.app.Activity;
import android.app.Application;

import java.util.Set;

public interface ILifecycleTracker {
	void registerActivitiesLifecycleListener(GxActivitiesLifecycleListener listener);
	void unregisterActivitiesLifecycleListener(GxActivitiesLifecycleListener listener);
	void beginTracking(Application application);
	void endTracking(Application application);
	Set<Activity> getActivities();
}
