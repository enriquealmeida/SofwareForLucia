package com.genexus.coreexternalobjects;

import android.content.Intent;

import com.artech.actions.ApiAction;
import com.artech.activities.IntentFactory;
import com.artech.application.MyApplication;
import com.artech.common.SecurityHelper;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.artech.providers.EntityDataProvider;

/**
 * This class allow access to network information from API.
 */
@SuppressWarnings("FieldCanBeLocal")
public class NetworkAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.Network";
	private static final String PROPERTY_APPLICATION_SERVER_URL = "ApplicationServerURL";
	private static final String METHOD_IS_SERVER_AVAILABLE = "IsServerAvailable";
	private static final String METHOD_TYPE = "Type";
	private static final String METHOD_TRAFFIC_BASED_COST = "TrafficBasedCost";
	private static final String METHOD_SET_APPLICATION_SERVER_URL = "SetApplicationServerURL";
	public static final String EVENT_NETWORK_STATUS_CHANGED = "NetworkStatusChanged";

	public NetworkAPI(ApiAction action) {
		super(action);
		addReadonlyPropertyHandler(PROPERTY_APPLICATION_SERVER_URL, mGetApplicationServerURLProperty);
		addMethodHandler(METHOD_IS_SERVER_AVAILABLE, 0, mIsServerAvailableMethod);
		addMethodHandler(METHOD_IS_SERVER_AVAILABLE, 1, mIsServerAvailableMethod);
		addMethodHandler(METHOD_TYPE, 0, mTypeMethod);
		addMethodHandler(METHOD_TRAFFIC_BASED_COST, 0, mTrafficBasedCostMethod);
		addMethodHandler(METHOD_SET_APPLICATION_SERVER_URL, 1, mSetApplicationServerMethod);
	}

	private final IMethodInvoker mGetApplicationServerURLProperty =
			parameters -> ExternalApiResult.success(NetworkAPIOffline.applicationServerUrl());

	private final IMethodInvoker mIsServerAvailableMethod = parameters -> {
		String serverAddress = (parameters.size() != 0 ? parameters.get(0).toString() : null);
		return ExternalApiResult.success(NetworkAPIOffline.isServerAvailable(serverAddress));
	};

	private final IMethodInvoker mTypeMethod =
			parameters -> ExternalApiResult.success(NetworkAPIOffline.type());

	private final IMethodInvoker mTrafficBasedCostMethod =
			parameters -> ExternalApiResult.success(NetworkAPIOffline.trafficBasedCost());

	private final IMethodInvoker mSetApplicationServerMethod = parameters -> {
		String url = (String) parameters.get(0);

		if (MyApplication.getApp().isSecure()) {
			SecurityHelper.logout();
		} else {
			EntityDataProvider.clearAllCaches();
		}

		Intent intent = IntentFactory.getStartupActivityWithNewServicesURL(getActivity(), url);
		getActivity().startActivity(intent);

		return ExternalApiResult.SUCCESS_CONTINUE;
	};
}
