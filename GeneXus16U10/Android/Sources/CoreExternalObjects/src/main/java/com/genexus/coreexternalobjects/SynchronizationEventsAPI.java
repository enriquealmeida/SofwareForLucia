package com.genexus.coreexternalobjects;

import java.util.List;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

/**
 * This class allow access to synchronization events from API.
 */
public class SynchronizationEventsAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.Synchronization.SynchronizationEvents";

	public SynchronizationEventsAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters) {
		List<String> parameterValues = toString(parameters);

		if (method.equalsIgnoreCase("hasevents")) {
			Integer status = readInteger(parameterValues, 0);
			boolean result = SynchronizationEventsOffline.hasEvents(status);
			return ExternalApiResult.success(result);
		} else if (method.equalsIgnoreCase("getevents")) {
			Integer status = readInteger(parameterValues, 0);
			Object result = SynchronizationEventsOffline.getEventsLocal(status);
			return ExternalApiResult.success(result);
		} else if (method.equalsIgnoreCase("markeventaspending")) {
			String guid = parameterValues.get(0);
			java.util.UUID guidVal = java.util.UUID.fromString(guid);

			// Mark event as pending
			SynchronizationEventsOffline.markEventAsPending(guidVal, true);
			return ExternalApiResult.SUCCESS_CONTINUE;
		} else if (method.equalsIgnoreCase("removeevent")) {
			String guid = parameterValues.get(0);
			java.util.UUID guidVal = java.util.UUID.fromString(guid);

			// Remove event
			SynchronizationEventsOffline.removeEvent(guidVal, true);
			return ExternalApiResult.SUCCESS_CONTINUE;
		} else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}

	private static Integer readInteger(List<String> values, int arrayIndex) {
		Integer timeout = 0;
		if (values.size() > arrayIndex) {
			try {
				timeout = Integer.valueOf(values.get(arrayIndex));
			} catch (NumberFormatException ex) { /* return 0 as default */}
		}
		return timeout;
	}
}
