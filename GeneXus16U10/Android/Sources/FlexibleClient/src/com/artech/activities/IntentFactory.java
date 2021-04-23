package com.artech.activities;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;

import com.artech.actions.UIContext;
import com.artech.application.MyApplication;
import com.artech.base.metadata.DashboardMetadata;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.metadata.enums.DisplayModes;
import com.artech.base.metadata.enums.Orientation;
import com.artech.base.metadata.settings.PlatformDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.PlatformHelper;
import com.artech.common.StorageHelper;

import java.util.Collections;

public class IntentFactory {
	public static Intent createNotificationActionIntent(Context context, String action, String params) {
		Intent intent = new Intent();
		intent.setClass(context, StartupActivity.class);
		intent.putExtra(StartupActivity.EXTRA_NOTIFICATION_ACTION, action);
		intent.putExtra(StartupActivity.EXTRA_NOTIFICATION_PARAMS, params);

		if (Services.Strings.hasValue(action)) {
			intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
		}

		return intent;
	}

	public static Intent getMainObject(IViewDefinition mainView, Activity activity, boolean asRoot) {
		Intent intent = new Intent();
		intent.putExtra(IntentParameters.IS_STARTUP_ACTIVITY, true);

		if (mainView instanceof DashboardMetadata) {
			intent.setClass(activity.getApplicationContext(), GenexusActivity.class);
			intent.putExtra(IntentParameters.DASHBOARD_METADATA, mainView.getName());
		} else if (mainView instanceof IDataViewDefinition) {
			ActivityLauncher.setupDataViewIntent(intent, activity.getApplicationContext(),
					mainView.getConnectivitySupport(), mainView, Collections.emptyList(),
					DisplayModes.VIEW, null);
		} else {
			String message = String.format("%s is not a valid main view definition.", mainView.getObjectName());
			throw new IllegalArgumentException(message);
		}

		if (asRoot) {
			IPatternMetadata pattern = Services.Application.getPattern(MyApplication.getApp().getAppEntry());

			if (pattern instanceof WorkWithDefinition || isDashboardTabOrNavigationSlide(pattern)) {
				// if ww is the main, the main dashboard call to it and the main is not in the stack
				intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK | Intent.FLAG_ACTIVITY_NEW_TASK);
			} else {
				intent.setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_NEW_TASK);
			}
		}

		return intent;
	}

	public static Intent getStartupActivity(Context context) {
		Intent intent = new Intent();
		intent.setClass(context, StartupActivity.class);
		return intent;
	}

	private static boolean isDashboardTabOrNavigationSlide(IPatternMetadata pattern) {
		if (pattern instanceof DashboardMetadata) {
			DashboardMetadata dashboard = (DashboardMetadata) pattern;

			if (dashboard.getControl().equalsIgnoreCase(DashboardMetadata.CONTROL_TABS)
					|| PlatformHelper.getNavigationStyle() == PlatformDefinition.NAVIGATION_SLIDE) {
				return true;
			}
		}
		return false;
	}

	public static Intent getStartupActivityWithNewServicesURL(Context context, String newServicesURL) {
		Intent intent = getStartupActivity(context);
		intent.putExtra(IntentParameters.SERVER_URL, newServicesURL);
		return intent;
	}

	public static Intent getDashboard(UIContext context, String dashboardName) {
		Intent intent = new Intent();
		intent.setClass(context, GenexusActivity.class);
		intent.putExtra(IntentParameters.DASHBOARD_METADATA, dashboardName);
		intent.putExtra(IntentParameters.CONNECTIVITY, context.getConnectivitySupport());

		return intent;
	}

	/**
	 * Returns an intent to open a webpage in an internal WebView (that shares session state,
	 * i.e. cookies) with the Android application. This should be used instead of startWebBrowser()
	 * whenever sharing this state is relevant. For example, web login, calling a webpanel that
	 * needs to share the GAM token, &c.
	 */
	public static Intent getIntentForWebApplication(Context context, String link) {
		Intent intent = new Intent();
		intent.setClass(context, WebViewActivity.class);
		intent.putExtra("Link", link);
		intent.putExtra("ShareSession", true);
		return intent;
	}

	public static Intent getMultimediaViewerIntent(Context context, String link, boolean showButtons, Orientation orientation, int currentPosition) {
		Intent intent = new Intent();
		intent.setClass(context, VideoViewActivity.class);
		ActivityLauncher.setIntentFlagsNewDocument(intent);

		// If not an absolute URL, add base path
		if (!link.contains("://") && !StorageHelper.isLocalFile(link))
			link = MyApplication.getApp().UriMaker.getImageUrl(link);

		intent.putExtra(VideoViewActivity.INTENT_EXTRA_LINK, link);
		intent.putExtra(VideoViewActivity.INTENT_EXTRA_SHOW_BUTTONS, showButtons);

		if (orientation != null)
			intent.putExtra(VideoViewActivity.INTENT_EXTRA_ORIENTATION, orientation.toString());

		if (currentPosition != 0)
			intent.putExtra(VideoViewActivity.INTENT_EXTRA_CURRENT_POSITION, currentPosition);

		return intent;
	}
}
