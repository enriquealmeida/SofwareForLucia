package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.base.serialization.INodeObject;

import java.util.HashMap;

class ControlExpression implements Expression
{
	static final String TYPE = "control";

	private final String mControlName;

	public ControlExpression(INodeObject node)
	{
		mControlName = node.getString("@exprValue");
	}

	@Override
	public String toString()
	{
		return mControlName;
	}

	@NonNull
	@Override
	public Value eval(IExpressionContext context)
	{
		return new Value(Type.CONTROL, context.getControl(mControlName));
	}

	@Override
	public void values(@NonNull HashMap<String, DataType> nameTypes) { }
}
