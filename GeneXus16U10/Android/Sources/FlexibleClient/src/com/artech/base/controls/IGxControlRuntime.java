package com.artech.base.controls;

import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.expressions.ExpressionValueBridge;

import java.util.List;

/**
 * Interface for user controls that support runtime properties, methods, and events.
 */
public interface IGxControlRuntime
{
	/**
	 * @deprecated use {@link #setPropertyValue(String, Value) }
	 */
	@Deprecated
	default void setProperty(String name, Object value) { }

	/**
	 * @deprecated use {@link #getPropertyValue(String) }
	 */
	@Deprecated
	default Object getProperty(String name) {
		return null;
	}

	/**
	 * @deprecated use {@link #callMethod(String, List<Value>) }
	*/
	@Deprecated
	default void runMethod(String name, List<Object> parameters) { }

	// NEW Methods, they call old methods for compatibility

	default void setPropertyValue(String name, Value value) {
		Object objValue = ExpressionValueBridge.convertValueToEntityFormat(value, null);
		setProperty(name, objValue);
	}

	default Value getPropertyValue(String name) {
		Object value = getProperty(name);
		if (value == null)
			return null;
		else
			return Value.newValue(value);
	}

	default Value callMethod(String name, List<Value> parameters) {
		runMethod(name, ExpressionValueBridge.convertValuesToEntityFormat(parameters));
		return null;
	}
}
