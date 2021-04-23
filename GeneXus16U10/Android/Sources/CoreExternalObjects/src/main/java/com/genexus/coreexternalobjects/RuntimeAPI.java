package com.genexus.coreexternalobjects;

import com.artech.actions.ApiAction;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

public class RuntimeAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.Common.Runtime";

	public RuntimeAPI(ApiAction action) {
		super(action);

		addSimpleMethodHandler("Environment", 0, parameters -> RuntimeAPIOffline.getEnvironment());

		addPropertyHandler("ExitCode",
				parameters -> ExternalApiResult.success(RuntimeAPIOffline.getExitCode()),
				parameters -> {
					int exitCode = Services.Strings.tryParseInt(parameters.get(0).toString(), 0);
					RuntimeAPIOffline.setExitCode(exitCode);
					return ExternalApiResult.SUCCESS_CONTINUE;
				});
	}
}
