package com.artech.actions;

import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.services.Services;
import com.artech.ui.navigation.CallOptionsHelper;

public class SetCallOptionsAction extends Action
{
	private final String mTargetObject;
	private final String mOption;
	private final String mValue;

	public SetCallOptionsAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);

		mTargetObject = MetadataLoader.getObjectName(definition.optStringProperty("@optionTarget"));
		mOption = definition.optStringProperty("@optionName");
		String value = definition.optStringProperty("@optionValue");
		mValue = Services.Language.getExpressionTranslation(value);
	}

	public static boolean isAction(ActionDefinition definition)
	{
		return (definition.getProperty("@optionTarget") != null);
	}

	@Override
	public boolean Do()
	{
		Value optionValue = getParameterValue(new ActionParameter(mValue));
		if (optionValue == null)
			return false;

		CallOptionsHelper.setCallOption(mTargetObject, mOption, optionValue.coerceToString());
		return true; // Never fail, ignore wrong options.
	}
}
