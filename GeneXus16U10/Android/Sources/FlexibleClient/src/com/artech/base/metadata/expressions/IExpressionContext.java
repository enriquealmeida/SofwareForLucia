package com.artech.base.metadata.expressions;

import android.content.Intent;

import com.artech.base.metadata.expressions.Expression.Type;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.common.ExecutionContext;
import com.artech.controls.IGxControl;

public interface IExpressionContext
{
	Value getValue(String name, Type expectedType);
	void setValue(String name, Value value);
	IGxControl getControl(String name);
	ExecutionContext getExecutionContext();
	void updateUIAfterOutput(String name);

	// Activity result
	Value eval(Expression expression); // saves the state so the eval can wait
	boolean isActivityResult(Expression expression);
	int requestCode();
	int resultCode();
	Intent result();
}
