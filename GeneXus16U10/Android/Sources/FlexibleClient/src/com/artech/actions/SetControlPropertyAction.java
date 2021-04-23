package com.artech.actions;

import androidx.annotation.NonNull;

import com.artech.android.layout.ControlHelper;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.services.Services;
import com.artech.common.ExecutionContext;
import com.artech.controls.IGxControl;
import com.artech.fragments.LayoutFragment;
import com.artech.utils.Cast;

class SetControlPropertyAction extends Action
{
	private final String mControl;
	private final String mProperty;
	private final ActionParameter mValue;

	public SetControlPropertyAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);

		mControl = definition.optStringProperty(ActionHelper.ASSIGN_CONTROL);
		mProperty = definition.optStringProperty(ActionHelper.ASSIGN_CONTROL_PROPERTY);
		mValue = ActionHelper.getAssignmentRight(definition);
	}

	public static boolean isAction(ActionDefinition definition)
	{
		return ActionHelper.hasProperties(definition, ActionHelper.ASSIGN_CONTROL, ActionHelper.ASSIGN_CONTROL_PROPERTY, ActionHelper.ASSIGN_RIGHT_VALUE);
	}

	@NonNull
	@Override
	public ThreadPreference getThreadPreference()
	{
		return ThreadPreference.MAIN_THREAD;
	}

	@Override
	public boolean Do()
	{
		if (Services.Strings.hasValue(mControl) &&
			Services.Strings.hasValue(mProperty) &&
			mValue != null)
		{
			// Find the control to update properties.
			IGxControl control = findControl(mControl);
			if (control != null)
			{
				// mValue is an expression (e.g. True, "Textblock.SubClass", &Variable1...)
				Value propertyValue = getParameterValue(mValue);
				if (propertyValue != null)
				{
					// Store for reapplying later (if activity is recreated).
					LayoutFragment fragment = Cast.as(LayoutFragment.class, getContext().getDataView());
					if (fragment != null)
						fragment.getRuntimeProperties().putProperty(mControl, mProperty, propertyValue);

					ControlHelper.setProperty(ExecutionContext.inAction(this), control, mProperty, propertyValue);
				}
			}
		}

		// Never fail. Ignore wrong control, property, or value.
		return true;
	}

	@Override
	public boolean catchOnActivityResult()
	{
		return false;
	}
}
