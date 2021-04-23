package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import java.util.HashMap;
import java.util.List;

import com.artech.actions.BCMethodHandler;
import com.artech.android.layout.ControlHelper;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.model.BaseCollection;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.model.EntityParentInfo;
import com.artech.base.model.ValueCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.IGxControl;
import com.artech.externalapi.ExternalApi;
import com.artech.utils.Cast;

import static com.artech.base.metadata.expressions.ExpressionFormatHelper.toUrlParameterString;

public class MethodExpression implements Expression, ITargetedExpression, IMethodCall
{
	static final String TYPE = "method";

	private final Expression mTarget;
	private final String mMethod;
	private final List<Expression> mParameters;

	private static final String METHOD_TO_STRING = "ToString";
	private static final String METHOD_TO_FORMATTED_STRING = "ToFormattedString";
	private static final String METHOD_CREATE = "Create";
	private static final String METHOD_LINK = "Link";

	public MethodExpression(INodeObject node)
	{
		mTarget = ExpressionFactory.parse(node.getNode("target"));
		mMethod = node.getString("@methName");
		mParameters = ExpressionFactory.parseParameters(node);
	}

	public MethodExpression(Expression target, String method, List<Expression> parameters)
	{
		mTarget = target;
		mMethod = method;
		mParameters = parameters;
	}

	@Override
	public String toString()
	{
		String parameters = mParameters.toString();
		parameters = parameters.substring(1, parameters.length() - 1); // Remove the [ ]
		return String.format("%s.%s(%s)", mTarget, mMethod, parameters);
	}

	@Override
	public Expression getTarget()
	{
		return mTarget;
	}

	@Override
	public String getMethod()
	{
		return mMethod;
	}

	@NonNull
	@Override
	public Value eval(IExpressionContext context)
	{
		Value target = context.eval(mTarget);
		if (target.mustReturn())
			return target;

		List<Value> parameters = ExpressionHelper.evalExpressions(mParameters, context);
		if (!parameters.isEmpty()) {
			Value last = parameters.get(parameters.size() - 1);
			if (last.mustReturn())
				return last;
		}

		// Special cases that are not mapped to actual methods.
		if (target.getType() == Type.COLLECTION)
		{
			BaseCollection<?> collection = target.coerceToCollection();
			EntityParentInfo parentInfo = null;
			if (collection instanceof EntityList) {
				Entity entity = context.getExecutionContext().getData();
				VariableExpression expr = Cast.as(VariableExpression.class, mTarget);
				if (expr != null)
					parentInfo = EntityParentInfo.collectionMemberOf(entity, expr.getName(), (EntityList)collection);
			}
			String variableName = null;
			if (mTarget instanceof IAssignableExpression)
			{
				variableName = ((IAssignableExpression)mTarget).getRootName();
			}
			else if (mTarget instanceof ValueExpression)
			{
				variableName = ((ValueExpression)mTarget).getName();
			}

			return evalCollectionMethod(context, collection, mMethod, parentInfo, parameters, variableName);
		}
		else if (target.getType() == Type.SDT)
		{
			return evalSdtMethod(target, mMethod, parameters);
		}
		else if (target.getType() == Type.BC)
		{
			return evalBCMethod(context, target, mMethod, parameters);
		}
		else if (target.getType() == Type.PANEL)
		{
			WorkWithDefinition workwith = (WorkWithDefinition)target.getValue();
			return evalWorkWithMethod(workwith, mMethod, parameters);
		}
		else if (target.getType() == Type.API)
		{
			ExternalApi api = (ExternalApi)target.getValue();
			List<Object> values = ExpressionValueBridge.convertValuesToEntityFormat(parameters);
			return api.execute(this, context, mMethod, values);
		}
		else if (target.getType() == Type.CONTROL)
		{
			IGxControl control = (IGxControl)target.getValue();
			return ControlHelper.callMethod(context.getExecutionContext(), control, mMethod, parameters);
		}
		else if (METHOD_TO_STRING.equalsIgnoreCase(mMethod) && target.getType().isNumeric())
		{
			return Value.newString(ExpressionFormatHelper.toString(target));
		}
		else if (METHOD_TO_FORMATTED_STRING.equalsIgnoreCase(mMethod) && parameters.isEmpty())
		{
			return Value.newString(ExpressionFormatHelper.toFormattedString(target));
		}

		// Generic methods
		return MethodHelper.call(target, mMethod, parameters);
	}

	@NonNull
	private static Value evalCollectionMethod(IExpressionContext context, BaseCollection<?> collection, String method, EntityParentInfo parentInfo, List<Value> parameters, String targetVariable)
	{
		if (BaseCollection.METHOD_GET_ITEM.equalsIgnoreCase(method) && parameters.size() == 1)
		{
			int position = parameters.get(0).coerceToInt();
			Object item = collection.get(position - 1);

			return ExpressionValueBridge.convertCollectionItemToValue(collection, item);
		}
		else if (BaseCollection.METHOD_ADD.equalsIgnoreCase(method) && parameters.size() >= 1)
		{
			Value item = ExpressionHelper.applyImplicitConversion(parameters.get(0), collection.getItemType());
			if (item == null)
				throw new IllegalArgumentException(String.format("Type mismatch! Trying to add item of type '%s' to collection of '%s'. " +
						"Types differ and no implicit conversion is available.", parameters.get(0).getType(), collection.getItemType()));

			int position = 0;
			if (parameters.size() >= 2)
				position = parameters.get(1).coerceToInt();

			if (position == 0)
				position = collection.size() + 1;

			// We could avoid this by receiving a BaseCollection with no captures, because type
			// compatibility has been already checked. However, we take the extra step for
			// better (Java) type safety.
			if (collection instanceof EntityList)
			{
				Entity typedItem = item.coerceToEntity();
				EntityList typedCollection = (EntityList)collection;
				typedCollection.add(position - 1, typedItem);
				if (parentInfo != null)
					typedItem.setParentInfo(parentInfo);
			}
			else
			{
				String typedItem = ExpressionValueBridge.convertValueToEntityFormat(item, null).toString();
				ValueCollection typedCollection = (ValueCollection)collection;
				typedCollection.add(position - 1, typedItem);
			}

			return Value.UNKNOWN; // Void
		}
		else if (BaseCollection.METHOD_REMOVE.equalsIgnoreCase(method) && parameters.size() == 1)
		{
			int position = parameters.get(0).coerceToInt();
			collection.remove(position - 1);
			return Value.UNKNOWN; // Void
		}
		else if (BaseCollection.METHOD_CLEAR.equalsIgnoreCase(method))
		{
			collection.clear();
			return Value.UNKNOWN; // Void
		}
		else if (BaseCollection.METHOD_TO_JSON.equalsIgnoreCase(method))
		{
			String json = collection.serialize(Entity.JSONFORMAT_EXTERNAL).toString();
			return Value.newString(json);
		}
		else if (BaseCollection.METHOD_FROM_JSON.equalsIgnoreCase(method) && parameters.size() >= 1)
		{
			String json = parameters.get(0).coerceToString();
			collection.deserialize(Services.Serializer.createCollection(json), Entity.JSONFORMAT_EXTERNAL);
			if (collection instanceof EntityList && parentInfo != null) {
				for (Entity collectionItem : (EntityList)collection)
					collectionItem.setParentInfo(parentInfo);
			}
			if (targetVariable!=null)
				context.updateUIAfterOutput(targetVariable);

			return Value.UNKNOWN; // Void
		}
		else if (BaseCollection.METHOD_INDEXOF.equalsIgnoreCase(method) && parameters.size() == 1)
		{
			Value item = ExpressionHelper.applyImplicitConversion(parameters.get(0), collection.getItemType());
			if (item == null)
				throw new IllegalArgumentException(String.format("Type mismatch! Trying to get index of item of type '%s' to collection of '%s'. " +
						"Types differ and no implicit conversion is available.", parameters.get(0).getType(), collection.getItemType()));

			int position;
			if (collection instanceof EntityList)
			{
				Entity typedItem = item.coerceToEntity();
				position = collection.indexOf(typedItem) + 1;
			}
			else
			{
				String typedItem = ExpressionValueBridge.convertValueToEntityFormat(item, null).toString();
				ValueCollection typedCollection = (ValueCollection)collection;
				position = typedCollection.indexOf(typedItem) + 1;
			}

			return Value.newInteger(position);
		}
		else
			throw new IllegalArgumentException(String.format("Unexpected collection method: '%s'", method));
	}

	@NonNull
	private static Value evalEntityMethod(Entity entity, Type valueType, String method, List<Value> parameters)
	{
		if (BaseCollection.METHOD_TO_JSON.equalsIgnoreCase(method)) {
			String json = entity.serialize(Entity.JSONFORMAT_EXTERNAL).toString();
			return Value.newString(json);
		}
		else if (BaseCollection.METHOD_FROM_JSON.equalsIgnoreCase(method) && parameters.size() >= 1) {
			entity = new Entity(entity.getDefinition());
			entity.initialize(); // So it initialize members that are not in the json

			String json = parameters.get(0).coerceToString();
			entity.deserialize(Services.Serializer.createNode(json), Entity.JSONFORMAT_EXTERNAL);

			return new Value(valueType, entity); // it will be assigned in MethodCallAction.Do()
		}
		return null;
	}

	@NonNull
	private static Value evalSdtMethod(Value value, String method, List<Value> parameters)
	{
		Value result = evalEntityMethod(value.coerceToEntity(), Type.SDT, method, parameters);
		if (result != null)
			return result;
		else
			throw new IllegalArgumentException(String.format("Unexpected SDT method: '%s'", method));
	}

	@NonNull
	private static Value evalBCMethod(IExpressionContext context, Value value, String method, List<Value> parameters)
	{
		Value result = evalEntityMethod(value.coerceToEntity(), Type.BC, method, parameters);
		if (result != null)
			return result;
		else
			return BCMethodHandler.eval(context.getExecutionContext().getUIContext(), value, method, parameters);
	}

	@NonNull
	private static Value evalWorkWithMethod(WorkWithDefinition wwd, String method, List<Value> parameters)
	{
		if (METHOD_CREATE.equalsIgnoreCase(method) || METHOD_LINK.equalsIgnoreCase(method)) {
			StringBuilder builder = new StringBuilder();
			builder.append("sd:");
			builder.append(wwd.getName());
			builder.append(Strings.QUESTION);
			int count = parameters.size();
			for (int n = 0; n < count; n++) {
				builder.append(Services.HttpService.uriEncode(toUrlParameterString(parameters.get(n))) );
				if (n+1 < count)
					builder.append(',');
			}
			return Value.newString(builder.toString());
		}
		else
			throw new IllegalArgumentException(String.format("Unexpected PANEL method: '%s'", method));
	}

	@Override
	public void values(@NonNull HashMap<String, DataType> nameTypes) {
		mTarget.values(nameTypes);
		for (Expression e : mParameters)
			e.values(nameTypes);
	}
}
