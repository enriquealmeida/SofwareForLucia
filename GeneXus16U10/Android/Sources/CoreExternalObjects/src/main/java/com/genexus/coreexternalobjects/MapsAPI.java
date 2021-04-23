package com.genexus.coreexternalobjects;

import java.util.List;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.Maps;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

public class MapsAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.Common.Maps";

	private static final String METHOD_CALCULATEDIRECTIONS = "CalculateDirections";

	public MapsAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters) {

		if (METHOD_CALCULATEDIRECTIONS.equalsIgnoreCase(method) && (parameters.size() == 2 || parameters.size() == 4))
		{
			// direction from a to b
			String origin = (String) parameters.get(0);
			String destination = (String) parameters.get(1);

			String transportType = Strings.EMPTY;
			Boolean requestAlternatives = false;
			if (parameters.size() == 4)
			{
				transportType = (String) parameters.get(2);
				requestAlternatives = (Boolean) Boolean.parseBoolean( (String) parameters.get(3));

			}
			return callCalculateDirections(origin, destination, transportType, requestAlternatives);
		} else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}


	private ExternalApiResult callCalculateDirections(String origin, String destination, String transportType, Boolean requestAlternatives)
	{
		Maps.calculateDirections(getActivity(), origin, destination, transportType, requestAlternatives);
		return ExternalApiResult.SUCCESS_CONTINUE;
	}


}
