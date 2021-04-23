package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.android.layout.ControlHelper;
import com.artech.base.metadata.LevelDefinition;
import com.artech.base.metadata.WWLevelDefinition;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.model.BaseCollection;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.serialization.INodeObject;
import com.artech.base.utils.Strings;
import com.artech.common.StorageHelper;
import com.artech.controls.IGxControl;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.artech.utils.Cast;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

class PropertyExpression implements Expression, IAssignableExpression, ITargetedExpression
{
	static final String TYPE = "property";

	private Expression mTarget;
	private String mProperty;
	private DataType mType;

	public PropertyExpression(INodeObject node)
	{
		mTarget = ExpressionFactory.parse(node.getNode("target"));
		mProperty = node.getString("@propName");

		// Control properties do not have a data type, but SDT properties do.
		String exprDataType = node.optString("@exprDataType");
		if (Strings.hasValue(exprDataType))
			mType = ExpressionFactory.parseGxDataType(node.optString("@exprDataType"));
		else
			mType = new DataType(Type.UNKNOWN);
	}

	@Override
	public String toString()
	{
		return String.format("%s.%s", mTarget, mProperty);
	}

	@NonNull
	@Override
	public Value eval(IExpressionContext context)
	{
		Value target = context.eval(mTarget);
		if (target.mustReturn())
			return target;

		if (target.getType() == Type.CONTROL) {
			return ControlHelper.getProperty(context.getExecutionContext(), (IGxControl)target.getValue(), mProperty);
		}
		else if (target.getType() == Type.COLLECTION) {
			BaseCollection<?> collection = target.coerceToCollection();
			if (mProperty.equalsIgnoreCase(BaseCollection.PROPERTY_COUNT))
				return Value.newInteger(collection.size());
			else if (mProperty.equalsIgnoreCase(BaseCollection.PROPERTY_CURRENT_ITEM))
				return ExpressionValueBridge.convertCollectionItemToValue(collection, collection.getCurrentItem());
		}
		else if (target.getType() == Type.SDT || target.getType() == Type.BC) {
			// The second part of this condition shouldn't be necessary.
			// However, in entity deserialization we are assuming that ALL levels are collections.
			// It's that way for BCs, but not necessarily for SDTs.
			Entity entity = target.coerceToEntity();

			// Check for sublevel first
			// TODO: This should not exist, but getProperty() doesn't return sublevels.
			EntityList subLevel = entity.getLevel(mProperty);
			if (subLevel != null)
				return Value.newCollection(subLevel);

			// It doesn't exist, add it. Only do it if sub level is collection.
			// Do not do it for normal sdt items (non collection), because it will put an invalid value.
			LevelDefinition subLevelDefinition = entity.getLevel().getLevel(mProperty);
			if (subLevelDefinition != null && subLevelDefinition.isCollection())
			{
				subLevel = new EntityList();
				subLevel.setItemType(Type.SDT);
				entity.putLevel(mProperty, subLevel);
				return Value.newCollection(subLevel);
			}

			// Generic property of entity.
			return ExpressionValueBridge.convertEntityFormatToValue(entity, mProperty, mType.type);
		}
		else if (target.getType() == Type.PANEL) {
			WorkWithDefinition wwd = Cast.as(WorkWithDefinition.class, target.getValue());
			if (wwd != null) {
				WWLevelDefinition level = wwd.getLevel(mProperty);
				if (level != null)
					return new Value(Type.PANEL, level);
			}
			else {
				WWLevelDefinition level = Cast.as(WWLevelDefinition.class, target.getValue());
				if (level != null) {
					if ("list".equalsIgnoreCase(mProperty))
						return new Value(Type.PANEL, level.getList());
					else if ("detail".equalsIgnoreCase(mProperty))
						return new Value(Type.PANEL, level.getDetail());
				}
			}
		}
		else if (target.getType() == Type.API) {
			ExternalApi api = (ExternalApi)target.getValue();
			return api.execute(this, context, mProperty, Collections.emptyList());
		}
		else if (target.getType() == Type.DIRECTORY) {
			if ("ApplicationDataPath".equalsIgnoreCase(mProperty))
				return Value.newDirectory(StorageHelper.getApplicationDataPath());
			if ("TemporaryFilesPath".equalsIgnoreCase(mProperty))
				return Value.newDirectory(StorageHelper.getTemporaryFilesPath());
			if ("ExternalFilesPath".equalsIgnoreCase(mProperty))
				return Value.newDirectory(StorageHelper.getExternalFilesPath());
			if ("CacheFilesPath".equalsIgnoreCase(mProperty))
				return Value.newDirectory(StorageHelper.getTemporaryFilesPath());
		}
		throw new IllegalArgumentException(String.format("Unknown property ('%s').", toString()));
	}

	public DataType getType()
	{
		return mType;
	}

	@Override
	public Expression getTarget()
	{
		return mTarget;
	}

	@Override
	public boolean setValue(IExpressionContext context, Value value)
	{
		Value target = context.eval(mTarget);
		if (target.mustReturn())
			return false;

		if (target.getType() == Type.COLLECTION && mProperty.equalsIgnoreCase(BaseCollection.PROPERTY_CURRENT_ITEM))
		{
			// Handle special case: setting &SDTCollection.CurrentItem = &SDTItem.
			EntityList collection = Cast.as(EntityList.class, target.coerceToCollection());
			Entity setCurrentItem = value.coerceToEntity();
			if (collection != null && setCurrentItem != null && collection.contains(setCurrentItem))
			{
				collection.setCurrentItem(setCurrentItem);
				return true;
			}
		}
		else if (target.getType() == Type.SDT || target.getType() == Type.BC || target.getType() == Type.COLLECTION)
		{
			Entity entity = target.coerceToEntity();
			Object objValue = ExpressionValueBridge.convertValueToEntityFormat(value, entity.getPropertyDefinition(mProperty));
			return entity.setProperty(mProperty, objValue);
		}
		// For the "Uri" members of variables of media types, assign the variable itself
		else if (target.getType() == Type.STRING && DataTypeProperties.MEDIA_URIS.contains(mProperty))
		{
			if (mTarget instanceof IAssignableExpression)
			{
				// Target might be an assignable expression itself (e.g. &sdt.image.imageuri = "x").
				return ((IAssignableExpression)mTarget).setValue(context, value);
			}
			else if (mTarget instanceof ValueExpression)
			{
				// Target is a variable (e.g. &theimage.imageuri = "x").
				context.setValue(((ValueExpression)mTarget).getName(), value);
				return true;
			}
		}
		else if (target.getType() == Type.API)
		{
			ExternalApi api = (ExternalApi)target.getValue();
			List<Object> values = new ArrayList<>();
			Object objValue = ExpressionValueBridge.convertValueToEntityFormat(value, null);
			values.add(objValue);
			ExternalApiResult result = api.execute("set" + mProperty, values);
			return result.getActionResult().isSuccess();
		}

		return false;
	}

	@Override
	public String getRootName()
	{
		return getRootName(this);
	}

	private static String getRootName(Expression expression)
	{
		if (expression instanceof ValueExpression)
			return ((ValueExpression)expression).getName();

		if (expression instanceof ITargetedExpression)
			return getRootName(((ITargetedExpression)expression).getTarget());

		return null;
	}

	@Override
	public void values(@NonNull HashMap<String, DataType> nameTypes) {
		mTarget.values(nameTypes);
	}
}
