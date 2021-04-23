package com.artech.android.analytics;

import android.app.Activity;

import com.artech.actions.UIContext;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.IViewDefinition;

/**
 * Interface for Analytics providers.
 */
public interface AnalyticsProvider
{
	void onActivityStart(Activity activity);
	void onActivityStop(Activity activity);

	void onComponentStart(Activity activity, IViewDefinition definition);
	void onAction(UIContext context, ActionDefinition action);

	void onException(Exception e);
}
