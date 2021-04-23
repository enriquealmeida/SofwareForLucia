package com.genexus.coreexternalobjects;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

import java.util.List;

@SuppressWarnings("unused")
public class ClientStorageAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.Client.ClientStorage";

	private static final String METHOD_SET = "Set";
	private static final String METHOD_SECURE_SET = "SecureSet";
	private static final String METHOD_GET = "Get";
	private static final String METHOD_REMOVE = "Remove";
	private static final String METHOD_CLEAR = "Clear";

	public ClientStorageAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters) {
		List<String> parameterValues = toString(parameters);
		if (METHOD_GET.equalsIgnoreCase(method) && parameters.size() >= 1) {
			String key = parameterValues.get(0);
			Object value = ClientStorageAPIOffline.get(key);
			return ExternalApiResult.success(value);
		} else if (METHOD_SET.equalsIgnoreCase(method) && parameters.size() >= 2) {
			String key = parameterValues.get(0);
			String value = parameterValues.get(1);
			ClientStorageAPIOffline.set(key, value);
			return ExternalApiResult.SUCCESS_CONTINUE;
		} else if (METHOD_SECURE_SET.equalsIgnoreCase(method) && parameters.size() >= 2) {
			String key = parameterValues.get(0);
			String value = parameterValues.get(1);
			ClientStorageAPIOffline.secureSet(key, value);
			return ExternalApiResult.SUCCESS_CONTINUE;
		} else if (METHOD_REMOVE.equalsIgnoreCase(method) && parameters.size() >= 1) {
			String key = parameterValues.get(0);
			ClientStorageAPIOffline.remove(key);
			return ExternalApiResult.SUCCESS_CONTINUE;
		} else if (METHOD_CLEAR.equalsIgnoreCase(method)) {
			ClientStorageAPIOffline.clear();
			return ExternalApiResult.SUCCESS_CONTINUE;
		} else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}
}
