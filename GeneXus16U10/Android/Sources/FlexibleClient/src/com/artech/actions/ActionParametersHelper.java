package com.artech.actions;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import androidx.annotation.NonNull;
import android.util.Pair;

import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.expressions.ExpressionValueBridge;
import com.artech.base.model.Entity;
import com.artech.base.model.PropertiesObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public abstract class ActionParametersHelper
{
	private static Value getParameterValue(Entity entity, ActionParameter parameter)
	{
		return getParameterValue(entity, parameter.getValue());
	}

	@NonNull
	public static Value getParameterValue(Entity entity, String parameter)
	{
		if (!Services.Strings.hasValue(parameter))
			return Value.UNKNOWN;

		parameter = parameter.trim(); // Workaround for bug in metadata generator, sometimes inserts line breaks at the end.

		// Try to evaluate as a constant (i.e. a string between quotes, number, &c).
		Pair<Boolean, String> asConstant = evaluateAsConstantExpression(parameter);
		if (asConstant.first)
			return Value.newString(asConstant.second);

		// Try to evaluate as an attribute/variable name.
		if (entity != null) {
			Object objValue = entity.getProperty(parameter);
			if (objValue != null) { // If null the property doesn't exist
				return Value.newValue(objValue);
			}
		}

		return Value.UNKNOWN;
	}

	public static Object getParameterValueFromEntity(PropertiesObject entity, String parameter)
	{
		if (!Services.Strings.hasValue(parameter))
			return null;

		parameter = parameter.trim(); // Workaround for bug in metadata generator, sometimes inserts line breaks at the end.

		// Try to evaluate as an attribute/variable name.
		return getValueFromEntity(parameter, entity);

	}

	public static boolean isConstantExpression(String parameter)
	{
		return evaluateAsConstantExpression(parameter).first;
	}

	private static Pair<Boolean, String> evaluateAsConstantExpression(String parameter)
	{
		// String constant?
		// TODO: Error, this matches something like "hello" + "how are you?" which is not a constant
		// (but can't be evaluated by getValueFromEntities() anyway).
		String[] quoteSet = new String[] { "\"", "'" };
		for (String quote : quoteSet)
			if (parameter.startsWith(quote) && parameter.endsWith(quote))
				return new Pair<>(true, parameter.substring(1, parameter.length() - 1));

		// Numeric constant?
		if (parameter.matches("^(-)?[0-9.]+$"))
			return new Pair<>(true, parameter);

		// Boolean constant?
		if (parameter.equalsIgnoreCase("true") || parameter.equalsIgnoreCase("false"))
			return new Pair<>(true, parameter);

		// Special constants?
		if (parameter.equalsIgnoreCase("nowait") || parameter.equalsIgnoreCase("status") || parameter.equalsIgnoreCase("keep"))
			return new Pair<>(true, parameter);

		// Not a constant value, apparently.
		return new Pair<>(false, parameter);
	}

	private static Object getValueFromEntity(String name, PropertiesObject entity)
	{
		if (entity != null)
		{
			Object value = entity.getProperty(name);
			if (value != null)
				return value;
		}

		return null;
	}

	public static Map<String, String> getParametersForBC(Action action)
	{
		TreeMap<String, String> values = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);
		for (ActionParameter parameter : action.getDefinition().getParameters())
		{
			if (Strings.hasValue(parameter.getName()))
			{
				Value oneValue = action.getParameterValue(parameter);
				Object value = ExpressionValueBridge.convertValueToEntityFormat(oneValue, parameter.getValueDefinition());
				values.put(parameter.getName(), value != null ? value.toString() : Strings.EMPTY);
			}
		}

		return values;
	}

	public static List<String> getParametersForDataView(Action action)
	{
		ArrayList<String> values = new ArrayList<>();
		for (ActionParameter parameter : action.getDefinition().getParameters())
		{
			Value oneValue = action.getParameterValue(parameter);
			Object value = ExpressionValueBridge.convertValueToEntityFormat(oneValue, parameter.getValueDefinition());
			values.add(value != null ? value.toString() : Strings.EMPTY);
		}

		return values;
	}

	public static List<String> getParametersForDataView(List<ActionParameter> parameters, Entity data)
	{
		ArrayList<String> values = new ArrayList<>();
		for (ActionParameter parameter : parameters)
		{
			Value oneValue = getParameterValue(data, parameter);
			values.add(oneValue != null ? oneValue.coerceToString() : Strings.EMPTY);
		}

		return values;
	}
}
