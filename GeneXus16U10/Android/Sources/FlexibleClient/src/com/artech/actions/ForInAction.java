package com.artech.actions;

import android.app.Activity;
import android.content.Intent;

import com.artech.base.application.OutputResult;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression;

import java.util.Iterator;

/**
 * Statments that correspond to for &variable in &collection
 */
class ForInAction extends Action implements IActionWithOutput
{
    private String mVariable;
    private ActionParameter mCollectionExpression;
    private CompositeAction mActionBlock;
    private boolean mCatchOnActivityResult;
    private OutputResult mOutputResult;
    private Iterator<?> mIterator;

    protected ForInAction(UIContext context, ActionDefinition definition, ActionParameters parameters) {
        super(context, definition, parameters);

        mVariable = definition.optStringProperty("@ForInVariable");
        mCollectionExpression = ActionHelper.getParameter("ForInCollectionExpression", definition);
        mActionBlock = ActionFactory.getInnerActionChildren(context, definition, parameters);
    }

    public static boolean isAction(ActionDefinition definition) {
        return "forin".equals(definition.optStringProperty(ActionHelper.STATEMENT_NAME));
    }

    private ActionResult execute() {
        mCatchOnActivityResult = false;
        Expression.Value value = getParameterValue(mCollectionExpression);
        if (value.getType() == Expression.Type.WAIT) {
            mCatchOnActivityResult = true;
            return ActionResult.SUCCESS_WAIT;
        }
        else if (value.getType() == Expression.Type.FAIL) {
            mOutputResult = value.coerceToOutputResult();
            return ActionResult.FAILURE;
        }
        else if (value.getType() == Expression.Type.COLLECTION) {
            mIterator = value.coerceToCollection().iterator();
            CompositeAction.LoopCondition loopCondition = () -> {
                if (mIterator.hasNext()) {
                    Object item = mIterator.next();
                    setOutputValue(mVariable, Expression.Value.newValue(item));
                    return true;
                }
                return false;
            };
            if (loopCondition.continueLoop()) {
                mActionBlock.setLoopCondition(loopCondition);
                ActionExecution exec = new ActionExecution(mActionBlock);
                exec.executeAction();
                mCatchOnActivityResult = true;
                return ActionResult.SUCCESS_WAIT;
            }
            else {
                mIterator = null;
            }
        }
        return ActionResult.SUCCESS_CONTINUE;
    }

    @Override
    public boolean Do()
    {
        return execute().isSuccess();
    }

    @Override
    public ActionResult afterActivityResult(int requestCode, int resultCode, Intent result)
    {
        setActivityResultParameters(requestCode, resultCode, result);
        return execute();
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
