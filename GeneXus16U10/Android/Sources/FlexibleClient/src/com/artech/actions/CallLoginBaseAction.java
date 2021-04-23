package com.artech.actions;

import javax.crypto.Cipher;

import android.app.AlertDialog;
import android.content.Intent;
import android.os.AsyncTask;
import android.util.Pair;

import com.artech.R;
import com.artech.activities.ActivityLauncher;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.services.ServiceResponse;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultDetail;
import com.artech.base.utils.Strings;
import com.artech.common.BiometricsHelper;
import com.artech.common.SecurityHelper;
import com.artech.externalapi.ExternalApiResult;

public abstract class CallLoginBaseAction extends Action {
    protected String mErrorMessage = Strings.EMPTY;
    protected boolean mWaitForResult = false;

    private final ActionParameter mReturnValue;
    protected ServiceResponse mResponse;
    private boolean mAuthenticateCalled;
    private boolean mReturnContinue;

    CallLoginBaseAction(UIContext context, ActionDefinition definition, ActionParameters parameters) {
        super(context, definition, parameters);
        mReturnValue = ActionHelper.newAssignmentParameter(definition, "@returnValue", ActionHelper.ASSIGN_LEFT_EXPRESSION);
    }

    protected boolean checkBiometrics() {
        if (mResponse.getResponseOk() &&
                BiometricsHelper.isBiometricsEnabled() &&
                BiometricsHelper.isFingerprintAvailable(getContext())) {
            BiometricsHelper.hideProgress(getContext());

            getActivity().runOnUiThread(() -> {
                new AlertDialog.Builder(getActivity())
                        .setMessage(Services.Strings.getResource(R.string.GXM_DoYouWantBiometricQuestion, Services.Strings.getResource(R.string.GXM_FingerprintQuestion)))
                        .setPositiveButton(Services.Strings.getResource(R.string.GXM_Yes), (dialog, which) -> {
                            mAuthenticateCalled = true;
                            ExternalApiResult apiResult = BiometricsHelper.authenticate(getContext(), Cipher.ENCRYPT_MODE);
                            processResult(apiResult.getActionResult());
                        })
                        .setNegativeButton(Services.Strings.getResource(R.string.GXM_No), (dialog, which) -> {
                            AsyncTask.execute(this::afterLogin);
                            processResult(ActionResult.SUCCESS_CONTINUE);
                        })
                        .setCancelable(false)
                        .create()
                        .show();
            });

            mWaitForResult = true;
            return true;
        } else {
            // Already handled.
            return afterLogin();
        }
    }

    private void processResult(ActionResult result) {
        if (result == ActionResult.FAILURE) {
            ActionExecution.cancelCurrent(this);
        } else if (result == ActionResult.SUCCESS_WAIT) {
            // Nothing to do, already on wait
        } else {
            mReturnContinue = true;
            ActionExecution.continueCurrent(getActivity(), false, this);
        }
    }

    protected abstract boolean afterLogin();

    protected void setOutputValue(Expression.Value value) {
        setOutputValue(mReturnValue, value);
    }

	protected boolean hasOutput()
	{
		return mReturnValue.getExpression() != null || Strings.hasValue(mReturnValue.getValue());
	}

    public String getErrorMessage() {
        return mErrorMessage;
    }

    @Override
    public boolean catchOnActivityResult() {
        return mWaitForResult;
    }

    protected Pair<ActionResult, Boolean> afterActivityResultBiometrics(int requestCode, int resultCode, Intent result) {
        if (mReturnContinue) {
            mReturnContinue = false;
            return new Pair<>(ActionResult.SUCCESS_CONTINUE, true);
        } else if (mAuthenticateCalled) {
            mAuthenticateCalled = false;
            // authenticate result
            ExternalApiResult out = BiometricsHelper.authenticateOnActivityResult(requestCode, resultCode, result);
            if (out == null || (out.getActionResult() == ActionResult.SUCCESS_CONTINUE && !((Boolean) out.getReturnValue()))) {
                setOutputValue(Expression.Value.newBoolean(false));
                return new Pair<>(ActionResult.FAILURE, true);
            } else {
                if (out.getActionResult() == ActionResult.SUCCESS_CONTINUE) {
                    AsyncTask.execute(() -> { // SecurityHelper.afterLoginBiometrics() must be called in a background thread
                        SecurityHelper.afterLoginBiometrics(getContext(), BiometricsHelper::encrypt, mResponse);
                        processResult(ActionResult.SUCCESS_CONTINUE);
                    });
                    return new Pair<>(ActionResult.SUCCESS_WAIT, true);
                }
                return new Pair<>(out.getActionResult(), true);
            }
        }
        return new Pair<>(ActionResult.SUCCESS_CONTINUE, false);
    }

	private boolean redirectToChangePassword(ResultDetail<SecurityHelper.LoginStatus> result)
	{
		if (result.getData() == SecurityHelper.LoginStatus.CHANGE_PASSWORD) {
			// Go to the "change password" screen if available. The login screen waits.
			String changePasswordPanel = MyApplication.getApp().getChangePasswordObject();
			if (Services.Strings.hasValue(changePasswordPanel)) {
				// if must change password clear current session and token
				Services.Log.debug("do logout and call changePasswordPanel");
				SecurityHelper.logoutLocal();
				if (ActivityLauncher.callForResult(getContext(), changePasswordPanel, RequestCodes.ACTION)) {
					Services.Messages.showMessage(result.getMessage());

					mWaitForResult = true; // Current action must wait.
					return true;
				}
			}
		}
		return false;
	}

	protected boolean afterLoginCommon(ResultDetail<SecurityHelper.LoginStatus> result)
	{
		if (result.getResult()) {
			setOutputValue(Expression.Value.newBoolean(true));
			return true;
		} else
		{
			if (redirectToChangePassword(result))
			{
				mErrorMessage = Strings.EMPTY;
				return true; // Current action must wait.
			}
			// Keep error message if unsuccessful. Generic error, or we do not have a change password panel.
			mErrorMessage = result.getMessage();
			setOutputValue(Expression.Value.newBoolean(false));
			if (this.hasOutput())
			{
				// Set result to False and continue (new behavior). not show any error message
				mErrorMessage = Strings.EMPTY;
				return true; //continue anyway
			}
			return false;
		}
	}

}
