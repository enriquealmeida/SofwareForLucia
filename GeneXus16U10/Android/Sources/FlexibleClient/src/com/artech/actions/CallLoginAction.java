package com.artech.actions;

import android.content.Intent;

import com.artech.base.metadata.ActionDefinition;
import com.artech.base.utils.ResultDetail;
import com.artech.common.ActionsHelper;
import com.artech.common.SecurityHelper;

class CallLoginAction extends CallLoginBaseAction
{
	CallLoginAction(UIContext context, ActionDefinition definition, ActionParameters parameters) {
		super(context, definition, parameters);
	}

	@Override
	public boolean Do() {
		mResponse = ActionsHelper.runLoginAction(this);
		return checkBiometrics();
	}

	@Override
	protected boolean afterLogin() {
		ResultDetail<SecurityHelper.LoginStatus> result = SecurityHelper.afterLogin(mResponse);

		return afterLoginCommon(result);
	}


	@Override
	public ActionResult afterActivityResult(int requestCode, int resultCode, Intent result) {
		return afterActivityResultBiometrics(requestCode, resultCode, result).first;
	}
}
