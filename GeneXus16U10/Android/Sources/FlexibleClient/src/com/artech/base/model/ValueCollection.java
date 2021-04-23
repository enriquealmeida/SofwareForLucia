package com.artech.base.model;

import com.artech.base.metadata.ITypeDefinition;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.expressions.ExpressionValueBridge;
import com.artech.base.serialization.INodeCollection;

/**
 * Collection of primitive values (such as Collection(Numeric)).
 */
public class ValueCollection extends BaseCollection<String>
{
	private final Expression.Type mItemType;

	public ValueCollection(ITypeDefinition itemType)
	{
		mItemType = ExpressionValueBridge.convertBasicTypeToExpressionType(itemType);
	}

	public ValueCollection(Expression.Type itemType)
	{
		mItemType = itemType;
	}

	@Override
	public Expression.Type getItemType()
	{
		return mItemType;
	}

	@Override
	protected void serializeItem(INodeCollection collection, String item, short jsonFormat) {
		collection.put(item);
	}

	@Override
	protected String deserializeItem(INodeCollection collection, int index, short jsonFormat) {
		return collection.getString(index);
	}
}
