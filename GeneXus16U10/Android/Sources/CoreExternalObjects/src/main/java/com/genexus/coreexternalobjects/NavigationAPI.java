package com.genexus.coreexternalobjects;

import java.util.List;

import android.app.Activity;
import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.artech.ui.navigation.INavigationActivity;
import com.artech.utils.Cast;

public class NavigationAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.Common.UI.Navigation";

	private static final String METHOD_SHOW_TARGET = "ShowTarget";
	private static final String METHOD_HIDE_TARGET = "HideTarget";
	private static final String METHOD_EXPAND_TARGET = "ExpandTarget";
	private static final String METHOD_COLLAPSE_TARGET = "CollapseTarget";

	public NavigationAPI(ApiAction action) {
		super(action);
		addMethodHandler(METHOD_SHOW_TARGET, 1, new IMethodInvoker() {
			@NonNull
			@Override
			public ExternalApiResult invoke(List<Object> parameters) {
				showTarget(getActivity(), String.valueOf(parameters.get(0)));
				return ExternalApiResult.SUCCESS_CONTINUE;
			}
		});

		addMethodHandler(METHOD_HIDE_TARGET, 1, new IMethodInvoker()
		{
			@NonNull
			@Override
			public ExternalApiResult invoke(List<Object> parameters)
			{
				hideTarget(getActivity(), String.valueOf(parameters.get(0)));
				return ExternalApiResult.SUCCESS_CONTINUE;
			}
		});

		// These have no implementation currently.
		addMethodHandler(METHOD_EXPAND_TARGET, 1, DUMMY_METHOD);
		addMethodHandler(METHOD_COLLAPSE_TARGET, 1, DUMMY_METHOD);
	}

	public static void showTarget(final Activity activity, final String targetName) {
		Services.Device.invokeOnUiThread(new Runnable() {
			@Override
			public void run() {
				INavigationActivity navigationActivity = Cast.as(INavigationActivity.class, activity);

				if (navigationActivity != null)
					navigationActivity.getNavigationController().showTarget(targetName);
			}
		});
	}

	public static void hideTarget(final Activity activity, final String targetName)
	{
		Services.Device.invokeOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				INavigationActivity navigationActivity = Cast.as(INavigationActivity.class, activity);

				if (navigationActivity != null)
					navigationActivity.getNavigationController().hideTarget(targetName);
			}
		});
	}

	private static final IMethodInvoker DUMMY_METHOD = new IMethodInvoker()
	{
		@NonNull
		@Override
		public ExternalApiResult invoke(List<Object> parameters)
		{
			return ExternalApiResult.SUCCESS_CONTINUE;
		}
	};
}
