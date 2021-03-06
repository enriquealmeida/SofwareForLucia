package com.artech.android.layout;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.artech.base.controls.IGxOverrideThemeable;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeOverrideProperties;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.ExecutionContext;
import com.artech.controls.IGxControl;
import com.artech.controls.IGxEdit;

public class ControlHelper
{
	// Known properties than can be set in events.
	public static final String PROPERTY_CLASS = "Class";
	public static final String PROPERTY_ENABLED = "Enabled";
	public static final String PROPERTY_FOCUSED = "SetFocus";
	public static final String PROPERTY_VISIBLE = "Visible";
	public static final String PROPERTY_CAPTION = "Caption";
	public static final String PROPERTY_BACKCOLOR = "BackColor";
	public static final String PROPERTY_BACKGROUND = "Background";
	public static final String PROPERTY_FORECOLOR = "ForeColor";
	public static final String PROPERTY_ISPASSWORD = "IsPassword";
	public static final String PROPERTY_GXVALUE = "GxValue";
	public static final String METHOD_BACKGROUND_IMAGE = "SetBackgroundImage";

	private static final Set<String> KNOWN_PROPERTIES = Strings.newSet(PROPERTY_CLASS, PROPERTY_ENABLED, PROPERTY_FOCUSED, PROPERTY_VISIBLE, PROPERTY_CAPTION, PROPERTY_BACKCOLOR, PROPERTY_BACKGROUND);

	public static boolean isKnownProperty(String name)
	{
		return KNOWN_PROPERTIES.contains(name);
	}

	public static void setProperties(ExecutionContext context, IGxControl control, Map<String, Value> properties)
	{
		for (Map.Entry<String, Value> property : properties.entrySet())
			setProperty(context, control, property.getKey(), property.getValue());
	}

	public static boolean setProperty(final ExecutionContext context, final IGxControl control, final String propertyName, final Value propertyValue)
	{
		if (control == null || propertyName == null || propertyValue == null)
			return false;

		// Post if from a background thread, run directly otherwise.
		Services.Device.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				control.setExecutionContext(context);
				internalSetProperty(control, propertyName, propertyValue);
			}
		});

		return true;
	}

	public static Value getProperty(final ExecutionContext context, final IGxControl control, final String propertyName)
	{
		if (control == null || propertyName == null)
			return null;

		// Always invoke and wait, since we need the result.
		return Services.Device.invokeOnUiThread(() -> {
			control.setExecutionContext(context);
			return internalGetProperty(control, propertyName);
		});
	}

	public static Value callMethod(final ExecutionContext context, final IGxControl control, final String methodName, final List<Value> parameters)
	{
		if (control == null || methodName == null)
			return null;

		// Post if from a background thread, run directly otherwise.
		return Services.Device.invokeOnUiThread(() -> {
			control.setExecutionContext(context);
			return internalCallMethod(control, methodName, parameters);
		});
	}

	private static void internalSetProperty(IGxControl control, String propertyName, Value propertyValue)
	{
		if (propertyName.equalsIgnoreCase(PROPERTY_CLASS))
		{
			ThemeClassDefinition themeClass = Services.Themes.getThemeClass(propertyValue.coerceToString());
			if (themeClass != null)
				control.setThemeClass(themeClass);
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_VISIBLE))
		{
			control.setVisible(propertyValue.coerceToBoolean());
			control.requestLayout();
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_ENABLED))
		{
			control.setEnabled(propertyValue.coerceToBoolean());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_FOCUSED))
		{
			// Focus & show keyboard.
			control.setFocus(true);
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_CAPTION))
		{
			control.setCaption(propertyValue.coerceToString().trim());  // trim because it can be assigned from a attribute of type Character which have spaces at the end
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_BACKCOLOR))
		{
			IGxOverrideThemeable overrideThemeable = (IGxOverrideThemeable)control.getInterface(IGxOverrideThemeable.class);
			if (overrideThemeable != null)
				overrideThemeable.setOverride(ThemeOverrideProperties.Overrides.BACKGROUND_COLOR, propertyValue.coerceToString());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_BACKGROUND))
		{
			IGxOverrideThemeable overrideThemeable = (IGxOverrideThemeable)control.getInterface(IGxOverrideThemeable.class);
			if (overrideThemeable != null)
				overrideThemeable.setOverride(ThemeOverrideProperties.Overrides.BACKGROUND_IMAGE, propertyValue.coerceToString());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_FORECOLOR))
		{
			IGxOverrideThemeable overrideThemeable = (IGxOverrideThemeable)control.getInterface(IGxOverrideThemeable.class);
			if (overrideThemeable != null)
				overrideThemeable.setOverride(ThemeOverrideProperties.Overrides.FORE_COLOR, propertyValue.coerceToString());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_GXVALUE)) {
			// This is not a runtime property, it is the way to set the value of the variable in the dynamic props
			IGxEdit gxEdit = (IGxEdit)control.getInterface(IGxEdit.class);
			if (gxEdit != null)
				gxEdit.setGxValue(propertyValue.coerceToString());
		}
		else
		{
			// Possibly a custom property.
			control.setPropertyValue(propertyName, propertyValue);
		}
	}

	private static Value internalGetProperty(IGxControl control, String propertyName)
	{
		if (propertyName.equalsIgnoreCase(PROPERTY_CLASS)) {
			return Value.newValue(control.getThemeClass());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_VISIBLE)) {
			return Value.newBoolean(control.isVisible());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_ENABLED)) {
			return Value.newBoolean(control.isEnabled());
		}
		else if (propertyName.equalsIgnoreCase(PROPERTY_CAPTION)) {
			return Value.newString(control.getCaption());
		}
		else
		{
			// Possibly a custom property.
			return control.getPropertyValue(propertyName);
		}
	}

	private static Value internalCallMethod(IGxControl control, String methodName, List<Value> parameters)
	{
		if (PROPERTY_FOCUSED.equalsIgnoreCase(methodName)) {
			// Handle "SetFocus" as a special case (it is a dual property/method).
			control.setFocus(true);
			return null;
		} else {
			// Probably a custom method.
			return control.callMethod(methodName, parameters);
		}
	}
}
