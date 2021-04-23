package com.genexus.coreexternalobjects;

import com.artech.actions.ApiAction;
import com.artech.android.gam.GAMApplication;
import com.artech.externalapi.ExternalApi;

import java.util.List;

public class GAMApplicationAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXusSecurity.GAMApplication";

	public GAMApplicationAPI(ApiAction action) {
		super(action);

		addSimpleMethodHandler("GetClientId", 0, mMethodGetClientID);
	}

	private ISimpleMethodInvoker mMethodGetClientID = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			return GAMApplication.getClientId();
		}
	};
}
