package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.base.serialization.INodeObject;

import java.util.HashMap;

abstract class ValueExpression implements Expression
{
	private final String mName;
	private final DataType mType;

	public ValueExpression(INodeObject node)
	{
		mName = node.getString("@exprValue");
		mType = ExpressionFactory.parseGxDataType(node.optString("@exprDataType"));
	}

	public String getName()
	{
		return mName;
	}

	@Override
	public String toString()
	{
		return mName;
	}

	@NonNull
	@Override
	public Value eval(IExpressionContext context)
	{
		// Special keywords, but they arrive as values.
		if (mName.equalsIgnoreCase("nowait") || mName.equalsIgnoreCase("status") || mName.equalsIgnoreCase("keep"))
			return Value.newString(mName);

		return context.getValue(mName, mType.type);
	}

	@Override
	public void values(@NonNull HashMap<String, DataType> nameTypes) {
		if (!nameTypes.containsKey(mName))
			nameTypes.put(mName, mType);
	}
}
