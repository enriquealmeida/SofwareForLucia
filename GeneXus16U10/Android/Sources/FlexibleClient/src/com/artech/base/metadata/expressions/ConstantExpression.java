package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.base.serialization.INodeObject;

import java.util.HashMap;

abstract class ConstantExpression implements Expression
{
	private final String mConstant;

	public ConstantExpression(INodeObject node)
	{
		mConstant = node.getString("@exprValue");
	}

	@Override
	public String toString()
	{
		return mConstant;
	}

	protected String getConstant()
	{
		return mConstant;
	}

	@Override
	public void values(@NonNull HashMap<String, DataType> nameTypes) { }
}
