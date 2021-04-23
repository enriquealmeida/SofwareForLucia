package com.artech.actions;

import android.app.Activity;
import android.content.Intent;

import com.artech.base.application.OutputResult;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression;

public class CommandAction extends Action implements IActionWithOutput {
    private final ActionParameter mExpression;
    private boolean mCatchOnActivityResult;
    private OutputResult mOutputResult;

    static final String COMMAND_EXPRESSION = "commandExpression";

    CommandAction(UIContext context, ActionDefinition definition, ActionParameters parameters) {
        super(context, definition, parameters);
        mExpression = ActionHelper.getParameter(COMMAND_EXPRESSION, definition);
    }

    public static boolean isAction(ActionDefinition definition) {
        return ActionHelper.hasProperties(definition, COMMAND_EXPRESSION);
    }

    private ActionResult eval() {
        // Evaluate expression
        mCatchOnActivityResult = false;
        Expression.Value value = getParameterValue(mExpression);
        if (value.getType() == Expression.Type.WAIT) {
            mCatchOnActivityResult = true;
            return ActionResult.SUCCESS_WAIT;
        } else if (value.getType() == Expression.Type.FAIL) {
            mOutputResult = value.coerceToOutputResult();
            return ActionResult.FAILURE;
        }

        return ActionResult.SUCCESS_CONTINUE;
    }

    @Override
    public boolean Do() {
        return eval().isSuccess();
    }

    @Override
    public ActionResult afterActivityResult(int requestCode, int resultCode, Intent result) {
        setActivityResultParameters(requestCode, resultCode, result);
        return eval();
    }

    @Override
    public boolean catchOnActivityResult() {
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
