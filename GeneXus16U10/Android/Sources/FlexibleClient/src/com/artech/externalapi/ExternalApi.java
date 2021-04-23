package com.artech.externalapi;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import android.app.Activity;
import android.content.Intent;
import android.text.TextUtils;

import com.artech.actions.ApiAction;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityController;
import com.artech.activities.ActivityHelper;
import com.artech.android.WithPermission;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.expressions.IExpressionContext;
import com.artech.base.services.Services;
import com.artech.base.utils.Function;
import com.artech.base.utils.ResultRunnable;
import com.artech.base.utils.SafeBoundsList;
import com.artech.base.utils.Strings;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public abstract class ExternalApi
{
	private String mDebugTag = null;
	private final ApiAction mAction;

	public ExternalApi(ApiAction action) {
		mAction = action;
	}

	public final void setDebugTag(String tag) { mDebugTag = tag; }

	public final ApiAction getAction() { return mAction; }
	public final ActionDefinition getDefinition() { return mAction.getDefinition(); }
	public final UIContext getContext() { return mAction.getContext(); }
	public final Activity getActivity() { return mAction.getMyActivity(); }
	
	private HashMap<HashKey, IMethodInvoker> mHandlers = new HashMap<>();
	private WithPermission<ExternalApiResult> mWaitForRequestPermissionResult;
	
	/**
	 * Utility method to convert parameter values from objects to strings.
	 * Should be used at the start of execute() if only string values are to be received.
	 */
	protected static SafeBoundsList<String> toString(List<Object> values)
	{
		SafeBoundsList<String> strValues = new SafeBoundsList<>();
		for (Object obj : values)
			strValues.add(obj != null ? obj.toString() : Strings.EMPTY);

		return strValues;
	}

	@NonNull
	public ExternalApiResult execute(String method, List<Object> parameters)
	{
		return invokeMethod(method, parameters);
	}

	@NonNull
	public Value execute(Expression expression, IExpressionContext context, String method, List<Object> parameters)
	{
		ExternalApiResult result;
		if (context.isActivityResult(expression))
			result = afterActivityResult(context.requestCode(), context.resultCode(), context.result(), method, parameters);
		else
			result = execute(method, parameters);

		if (result == ExternalApiResult.FAILURE)
			return Value.FAIL;
		else if (result == ExternalApiResult.SUCCESS_WAIT)
			return Value.WAIT;

		Object returnValue = result.getReturnValue();
		if (returnValue == null)
			return Value.newString(null); // return something to avoid exception
		else
			return Value.newValue(returnValue);
	}

	private WithPermission.Builder<ExternalApiResult> newCodeBuilder()
	{
		return new WithPermission.Builder<ExternalApiResult>(getActivity())
				.setBlockThread(false)
				.onPermissionRequested(new Function<WithPermission<ExternalApiResult>, ExternalApiResult>()
				{
					@Override
					public ExternalApiResult run(WithPermission<ExternalApiResult> runner)
					{
						// Register this object as waiting for the permission request result.
						mWaitForRequestPermissionResult = runner;

						ActivityController controller = ActivityController.from(getActivity());
						if (controller != null)
							controller.setActionWaitingForPermissionsResult(mAction);

						return ExternalApiResult.SUCCESS_WAIT;
					}
				})
				.onFailure(new ResultRunnable<ExternalApiResult>()
				{
					@Override
					public ExternalApiResult run()
					{
						// Permissions could not be obtained, fail.
						return ExternalApiResult.FAILURE;
					}
				})
				.lockAlternativeCode(); // These two handlers CANNOT be changed.
	}

	public ExternalApiResult afterActivityResult(int requestCode, int resultCode, Intent result, String method, List<Object> methodParameters)
	{
		IMethodInvoker handler = mHandlers.get(new HashKey(method, methodParameters.size()));

		if (handler instanceof IMethodInvokerWithActivityResult) {
			IMethodInvokerWithActivityResult activityResultHandler = (IMethodInvokerWithActivityResult) handler;
			return activityResultHandler.handleActivityResult(requestCode, resultCode, result);
		}

		return null;
	}

	public final ExternalApiResult afterRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults)
	{
		if (mWaitForRequestPermissionResult != null)
			return mWaitForRequestPermissionResult.onRequestPermissionsResult(requestCode, permissions, grantResults);

		return null;
	}

	/**
	 * Register a pair of IMethodInvokers (getter & setter) to handle a particular property of the External Object.
	 */
	protected final void addPropertyHandler(String property, IMethodInvoker getterHandler, IMethodInvoker setterHandler)
	{
		mHandlers.put(new HashKey(property, 0), getterHandler);
		mHandlers.put(new HashKey("set" + property, 1), setterHandler);
	}

	/**
	 * Register a IMethodInvokers to get the value of a particular property of the External Object.
	 */
	protected final void addReadonlyPropertyHandler(String property, IMethodInvoker getterHandler)
	{
		mHandlers.put(new HashKey(property, 0), getterHandler);
	}

	/**
	 * Register a IMethodInvokers to get the value of a particular property of the External Object,
	 * but only if the needed permissions are already held by the application or if the uses
	 * accepts granting them.
	 */
	protected final void addReadonlyPropertyHandlerRequestingPermission(String property, final String[] permissions, IMethodInvoker getterHandler)
	{
		addMethodHandlerRequestingPermissions(property, 0, permissions, getterHandler);
	}

	/**
	 * Register a IMethodInvoker to handle a particular method of the External Object.
	 */
	protected final void addMethodHandler(String method, int argsCount, IMethodInvoker handler)
	{
		mHandlers.put(new HashKey(method, argsCount), handler);
	}

	/**
	 * Register a ISimpleMethodInvoker to handle a particular method of the External Object.
	 * Unlike addMethodHandler, this method doesn't have to return an ExternalApiResult, and
	 * is assumed to always succeed.
	 */
	protected final void addSimpleMethodHandler(String method, int argsCount, final ISimpleMethodInvoker handler)
	{
		// Use a wrapper to map a "simple" output to ExternalApiResult.
		mHandlers.put(new HashKey(method, argsCount), new IMethodInvoker()
		{
			@NonNull
			@Override
			public ExternalApiResult invoke(List<Object> parameters)
			{
				Object returnValue = handler.invoke(parameters);
				return ExternalApiResult.success(returnValue);
			}
		});
	}

	/**
	 * Register an IMethodHandler to handle a particular method of the External Object, but
	 * only if the needed permissions are already held by the application or if the uses
	 * accepts granting them.
	 *
	 * @param method Method name
	 * @param argsCount Argument count (for overloading)
	 * @param permissions Needed permissions
	 * @param handler Handler to be called
	 */
	protected final void addMethodHandlerRequestingPermissions(String method, int argsCount, final String[] permissions, final IMethodInvoker handler)
	{
		// Use a wrapper that requests the permissions and then calls the original handler.
		if (handler instanceof IMethodInvokerWithActivityResult) {
			addMethodHandler(method, argsCount, new IMethodInvokerWithActivityResult() {
				@Override
				public @NonNull ExternalApiResult handleActivityResult(int requestCode, int resultCode, @Nullable Intent result) {
					return ((IMethodInvokerWithActivityResult) handler).handleActivityResult(requestCode, resultCode, result);
				}

				@Override
				public @NonNull ExternalApiResult invoke(List<Object> parameters) {
					return executeRequestingPermissions(permissions, () -> handler.invoke(parameters));
				}
			});
		} else {
			addMethodHandler(method, argsCount, parameters -> executeRequestingPermissions(permissions, () -> handler.invoke(parameters)));
		}
	}

	protected ExternalApiResult executeRequestingPermissions(String[] neededPermissions, ResultRunnable<ExternalApiResult> code)
	{
		return newCodeBuilder()
				.require(neededPermissions)
				.onSuccess(code)
				.build()
				.run();
	}

	protected ExternalApiResult executeRequestingPermissions(String[] requestPermissions, String[] neededPermissions, ResultRunnable<ExternalApiResult> code)
	{
		return newCodeBuilder()
			.require(neededPermissions)
			.request(requestPermissions)
			.onSuccess(code)
			.build()
			.run();
	}

	@NonNull
	protected ExternalApiResult invokeMethod(String method, List<Object> parameters)
	{
		if (!TextUtils.isEmpty(mDebugTag))
			logMethodInvocation(mDebugTag, method, parameters);

		IMethodInvoker handler = mHandlers.get(new HashKey(method, parameters.size()));

		if (handler != null)
			return handler.invoke(parameters);
		else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}

	@NonNull
	protected ExternalApiResult invokeMethod(String method)
	{
	    return invokeMethod(method, Collections.emptyList());
	}

	protected final void startActivityForResult(Intent intent, int requestCode) {
		ActivityHelper.registerActionRequestCode(requestCode);
		mAction.getMyActivity().startActivityForResult(intent, requestCode);
	}

	private void logMethodInvocation(String tag, String method, List<Object> params)
	{
		String message = "CALL\n    " + method + "\nPARAMETERS\n";
		if (params.isEmpty()) {
			message += "    None\n";
		} else {
			for (Object param : params) {
				message += "    " + String.valueOf(param) + "\n";
			}
		}
		Services.Log.debug(tag, message);
	}

	protected interface IMethodInvoker
	{
		@NonNull ExternalApiResult invoke(List<Object> parameters);
	}

	protected interface IMethodInvokerWithActivityResult extends IMethodInvoker
	{
		@NonNull ExternalApiResult handleActivityResult(int requestCode, int resultCode, @Nullable Intent result);
	}

	protected interface ISimpleMethodInvoker
	{
		Object invoke(List<Object> parameters);
	}

	private static class HashKey
	{
	    private final String mMethodName;
	    private final int mArgsCount;
	    private final int mHashCode;
	    
        HashKey(String methodName, int argsCount)
	    {
            mMethodName = methodName;
            mArgsCount = argsCount;
	        mHashCode = methodName.toLowerCase(Locale.US).hashCode() * 31 + argsCount;
	    }
        
        @Override
        public boolean equals(Object o)
        {
            if (!(o instanceof HashKey))
                return false;

            HashKey other = (HashKey) o;
            return this.mArgsCount == other.mArgsCount && this.mMethodName.equalsIgnoreCase(other.mMethodName);
        }
        
        @Override
        public int hashCode()
        {
            return mHashCode;
        }
	}
}
