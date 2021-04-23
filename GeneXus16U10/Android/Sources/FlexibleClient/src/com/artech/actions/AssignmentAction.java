package com.artech.actions;

import android.app.Activity;
import android.content.Intent;

import com.artech.base.application.OutputResult;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.expressions.Expression.Value;

class AssignmentAction extends Action implements IActionWithOutput
{
	private final ActionParameter mAssignTarget;
	private final ActionParameter mAssignExpression;
	private boolean mCatchOnActivityResult;
	private OutputResult mOutputResult;

	AssignmentAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);
		mAssignTarget = ActionHelper.getAssignmentLeft(definition);
		mAssignExpression = ActionHelper.getAssignmentRight(definition);
	}

	public static boolean isAction(ActionDefinition definition)
	{
		return ActionHelper.hasProperties(definition, ActionHelper.ASSIGN_LEFT_VARIABLE, ActionHelper.ASSIGN_RIGHT_VALUE);
	}

	private ActionResult assign()
	{
		// Evaluate expression and perform assignment.
		mCatchOnActivityResult = false;
		Value value = getParameterValue(mAssignExpression);
		if (value.getType() == Expression.Type.WAIT) {
			mCatchOnActivityResult = true;
			return ActionResult.SUCCESS_WAIT;
		}
		else if (value.getType() == Expression.Type.FAIL) {
			mOutputResult = value.coerceToOutputResult();
			return ActionResult.FAILURE;
		}

		setOutputValue(mAssignTarget, value);
		return ActionResult.SUCCESS_CONTINUE;
	}

	@Override
	public boolean Do()
	{
		return assign().isSuccess();
	}

	@Override
	public ActionResult afterActivityResult(int requestCode, int resultCode, Intent result)
	{
		setActivityResultParameters(requestCode, resultCode, result);
		return assign();
	}

	@Override
	public boolean catchOnActivityResult()
	{
		return mCatchOnActivityResult;
	}

	@Override
	public Activity getActivity()
	{
		return super.getActivity();
	}

	@Override
	public OutputResult getOutput() {
		return mOutputResult;
	}
}
