package com.artech.android.layout;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.artech.actions.UIContext;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.utils.DoubleMap;
import com.artech.base.utils.Triplet;
import com.artech.common.ExecutionContext;
import com.artech.controls.IGxControl;

public class ControlProperties
{
	private final DoubleMap<String, String, Value> mProperties = DoubleMap.newStringMap();
	private final List<Triplet<String, String, List<Value>>> mMethods = new ArrayList<>();

	public void apply(UIContext context)
	{
		applyProperties(context);
		runMethods(context);
	}

	private void applyProperties(UIContext context)
	{
		for (Map.Entry<String, Map<String, Value>> controlProperties : getProperties())
		{
			IGxControl control = context.findControl(controlProperties.getKey());
			if (control != null)
			{
				// Set all specified properties for this control.
				ControlHelper.setProperties(ExecutionContext.base(context), control, controlProperties.getValue());
			}
		}
	}

	private void runMethods(UIContext context)
	{
		for (Triplet<String, String, List<Value>> controlMethod : mMethods)
		{
			IGxControl control = context.findControl(controlMethod.first);
			if (control != null)
				ControlHelper.callMethod(ExecutionContext.base(context), control, controlMethod.second, controlMethod.third);
		}
	}

	private Value getProperty(String control, String propertyName)
	{
		return mProperties.get(control, propertyName);
	}

	public String getStringProperty(String control, String propertyName)
	{
		Value value = getProperty(control, propertyName);
		return (value != null ? value.coerceToString() : null);
	}

	Iterable<Map.Entry<String, Map<String, Value>>> getProperties()
	{
		return mProperties.entrySet();
	}

	public void putProperty(String controlName, String propName, Value propValue)
	{
		mProperties.put(controlName, propName, propValue);
	}

	public void putMethod(String controlName, String methodName, List<Value> methodParameters)
	{
		mMethods.add(new Triplet<>(controlName, methodName, methodParameters));
	}

	public void putAll(ControlProperties other)
	{
		mProperties.putAll(other.mProperties);
		mMethods.addAll(other.mMethods);
	}
}
