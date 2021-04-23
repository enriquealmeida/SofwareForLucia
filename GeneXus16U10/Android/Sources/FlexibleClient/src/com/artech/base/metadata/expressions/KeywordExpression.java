package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.base.serialization.INodeObject;

class KeywordExpression extends ConstantExpression
{
	static final String TYPE = "keyword";

	public KeywordExpression(INodeObject node)
	{
		super(node);
	}

	@NonNull
	@Override
	public Value eval(IExpressionContext context)
	{
		return Value.newString(getConstant());
	}
}
