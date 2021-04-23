package com.artech.externalapi;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.actions.ActionResult;
import com.artech.base.utils.Strings;

/**
 * Class to represent the result of an external API call.
 */
public class ExternalApiResult {
	private final ActionResult mResult;
	private final Object mReturnValue;
	private final String mMessage;

	private ExternalApiResult(ActionResult result, @Nullable Object returnValue, String message) {
		mResult = result;
		mReturnValue = returnValue;
		mMessage = message;
	}

	private ExternalApiResult(ActionResult result, @Nullable Object returnValue) {
		this(result, returnValue, Strings.EMPTY);
	}

	private ExternalApiResult(ActionResult result) {
		this(result, null);
	}

	public ActionResult getActionResult() {
		return mResult;
	}

	public Object getReturnValue() {
		return mReturnValue;
	}

	public String getMessage() {
		return mMessage;
	}

	// Some common API results.
	public static final ExternalApiResult SUCCESS_CONTINUE = new ExternalApiResult(ActionResult.SUCCESS_CONTINUE);
	public static final ExternalApiResult SUCCESS_WAIT = new ExternalApiResult(ActionResult.SUCCESS_WAIT);
	public static final ExternalApiResult FAILURE = new ExternalApiResult(ActionResult.FAILURE);

	public static ExternalApiResult success(@NonNull Object returnValue) {
		return new ExternalApiResult(ActionResult.SUCCESS_CONTINUE, returnValue);
	}

	public static ExternalApiResult successNoRefresh(@NonNull Object returnValue) {
		return new ExternalApiResult(ActionResult.SUCCESS_CONTINUE_NO_REFRESH, returnValue);
	}

	public static ExternalApiResult failureUnknownMethod(@NonNull ExternalApi api, @NonNull String methodName) {
		return new ExternalApiResult(ActionResult.FAILURE, null, "Unknown method '" + methodName + "' in '" + api.getClass() + "'.");
	}

	public static ExternalApiResult failureUnknownMethod(@NonNull ExternalApi api, @NonNull String methodName, int paramCount) {
		methodName = methodName + "(" + paramCount + " parameters)";
		return failureUnknownMethod(api, methodName);
	}
}
