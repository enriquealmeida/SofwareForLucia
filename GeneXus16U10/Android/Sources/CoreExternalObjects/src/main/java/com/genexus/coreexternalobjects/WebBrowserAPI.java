package com.genexus.coreexternalobjects;

import com.artech.actions.ApiAction;
import com.artech.externalapi.ExternalApi;

import java.util.List;

public class WebBrowserAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.WebBrowser";

	private static final String METHOD_OPEN = "Open";
	private static final String METHOD_CLOSE = "Close";

	// TODO: Events BeforeNavigate, OnClose?

	public WebBrowserAPI(ApiAction action) {
		super(action);
		addSimpleMethodHandler(METHOD_OPEN, 1, mMethodOpen);
		addSimpleMethodHandler(METHOD_CLOSE, 0, mMethodClose);
	}

	private final ISimpleMethodInvoker mMethodOpen = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			return null;
		}
	};

	private final ISimpleMethodInvoker mMethodClose = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			return null;
		}
	};
}
