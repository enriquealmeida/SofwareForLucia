package com.artech.actions;

import com.artech.android.layout.ControlHelper;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.services.Services;
import com.artech.common.ExecutionContext;
import com.artech.controls.IGxControl;
import com.artech.fragments.LayoutFragment;
import com.artech.utils.Cast;

import java.util.List;

import static com.artech.android.layout.ControlHelper.METHOD_BACKGROUND_IMAGE;

public class ControlMethodAction extends Action
{
	private final String mControl;
	private final String mMethod;

	protected ControlMethodAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);

		mControl = definition.optStringProperty("@executeControl");
		mMethod = definition.optStringProperty("@executeMethod");
	}

	public static boolean isAction(ActionDefinition definition)
	{
		return (definition.getProperty("@executeControl") != null);
	}


	public boolean isActionForControlMethod(String control, String method)
	{
		if (control.equalsIgnoreCase(mControl) && method.equalsIgnoreCase(mMethod))
			return true;
		return false;
	}

	@Override
	public boolean Do()
	{
		if (Services.Strings.hasValue(mControl) &&
			Services.Strings.hasValue(mMethod))
		{
			// Find the control to run method.
			IGxControl control = findControl(mControl);
			if (control != null) {
				List<Expression.Value> parameters = getParameterValues();
				if (mMethod.equalsIgnoreCase(METHOD_BACKGROUND_IMAGE)) {
					LayoutFragment fragment = Cast.as(LayoutFragment.class, getContext().getDataView());
					if (fragment != null)
						fragment.getRuntimeProperties().putMethod(mControl, mMethod, parameters);
				}

				ControlHelper.callMethod(ExecutionContext.inAction(this), control, mMethod, parameters);
			}
		}

		// Never fail. Ignore wrong control or method.
		return true;
	}
}
