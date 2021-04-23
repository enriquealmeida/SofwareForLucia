package com.artech.actions;

import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.enums.GxObjectTypes;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.services.Services;

public class JumpAction extends Action
{
	private static final String METHOD_JUMP_IF_NOT = "JumpIfNot";
	private static final String METHOD_JUMP = "Jump";

	private final Integer mJumpLength;
	private final ActionParameter mIgnoreCondition;

	protected JumpAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);
		String methodName = definition.optStringProperty("@exoMethod");

		if (methodName.equalsIgnoreCase(METHOD_JUMP_IF_NOT) && definition.getParameters().size() >= 2)
		{
			mIgnoreCondition = definition.getParameter(0);
			mJumpLength = Services.Strings.tryParseInt(definition.getParameter(1).getValue());
		}
		else if (methodName.equalsIgnoreCase(METHOD_JUMP) && definition.getParameters().size() >= 1)
		{
			mIgnoreCondition = null;
			mJumpLength = Services.Strings.tryParseInt(definition.getParameter(0).getValue());
		}
		else
		{
			Services.Log.warning("Invalid JumpAction definition");
			mIgnoreCondition = null;
			mJumpLength = null;
		}
	}

	public static boolean isAction(ActionDefinition definition)
	{
		String objectName = definition.getGxObject();
		String methodName = definition.optStringProperty("@exoMethod");

		return (objectName != null && methodName != null &&
				definition.getGxObjectType() == GxObjectTypes.API &&
				objectName.equalsIgnoreCase("GeneXus.SD.Interop") &&
				(methodName.equalsIgnoreCase(METHOD_JUMP_IF_NOT) || methodName.equalsIgnoreCase(METHOD_JUMP)));
	}

	@Override
	public boolean Do()
	{
		CompositeAction parentComposite = getParentComposite();
		if (parentComposite == null)
			throw new IllegalStateException("JumpAction cannot be executed without a parent composite.");

		if (mJumpLength != null)
		{
			// Check for condition
			boolean doNotJump = false;
			if (mIgnoreCondition != null)
			{
				Value eval = getParameterValue(mIgnoreCondition);
				if (eval != null) {
					Boolean evalIgnore = eval.coerceToBoolean();
					if (evalIgnore != null)
						doNotJump = evalIgnore;
				}
			}

			if (!doNotJump)
				parentComposite.move(mJumpLength);
		}

		// Always succeeds.
		return true;
	}
}
