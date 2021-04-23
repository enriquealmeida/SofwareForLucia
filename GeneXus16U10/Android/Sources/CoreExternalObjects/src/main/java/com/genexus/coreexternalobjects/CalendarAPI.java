package com.genexus.coreexternalobjects;

import java.util.List;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

public class CalendarAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.Calendar";

	public CalendarAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters) {
		if (method.equalsIgnoreCase("schedule")) {
			if (!SDActionsHelper.addAppointmentFromParameters(getActivity(), toString(parameters))) {
				String str = Services.Strings.getResource(R.string.GXM_NoApplicationAvailable);
				Services.Messages.showMessage(getActivity(), str);
				return ExternalApiResult.FAILURE;
			}
			return ExternalApiResult.SUCCESS_CONTINUE;
		}

		return ExternalApiResult.failureUnknownMethod(this, method);
	}
}
