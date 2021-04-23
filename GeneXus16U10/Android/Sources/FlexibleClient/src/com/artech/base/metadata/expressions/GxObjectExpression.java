package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.actions.ActionFactory;
import com.artech.actions.ApiAction;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.metadata.enums.GxObjectTypes;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApi;

import java.util.HashMap;

class GxObjectExpression implements Expression
{
	static final String TYPE = "gxobject";
	private final String mName;

	public GxObjectExpression(INodeObject node)
	{
		mName = node.getString("@exprValue");
	}

	public String getName()
	{
		return mName;
	}

	@Override
	public String toString()
	{
		return mName;
	}

	@NonNull
	@Override
	public Value eval(IExpressionContext context)
	{
		switch (GxObjectTypes.getGxObjectTypeFromName(mName)) {
			case GxObjectTypes.SDPANEL: {
				String name = MetadataLoader.getObjectName(mName);
				WorkWithDefinition workwith = (WorkWithDefinition) Services.Application.getPattern(name);
				if (workwith == null || workwith.getLevels().size() == 0)
					throw new IllegalArgumentException(String.format("Could not found panel '%s'.", name));
				return new Value(Type.PANEL, workwith);
			}
			case GxObjectTypes.API: {
				String apiName = MetadataLoader.getObjectName(mName);
				ActionDefinition definition = new ActionDefinition(null);
				definition.setGxObjectType(GxObjectTypes.API);
				definition.setGxObject(apiName);
				ApiAction apiAction = (ApiAction)ActionFactory.getAction(context.getExecutionContext().getUIContext(), definition, null).getComponents().iterator().next();
				ExternalApi api = Services.Application.getExternalApiFactory().createInstance(apiName, apiAction);
				if (api == null)
					throw new IllegalArgumentException(String.format("Could not found api '%s'.", apiName));
				return new Value(Type.API, api);
			}
			default:
				return null;
		}
	}

	@Override
	public void values(@NonNull HashMap<String, DataType> nameTypes) { }
}
