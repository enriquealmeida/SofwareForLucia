package com.artech.base.metadata.layout;

import java.util.ArrayList;
import java.util.List;

import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.loader.WorkWithMetadataLoader;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class ComponentDefinition extends LayoutItemDefinition
{
	private String mDesignObject;
	private List<ActionParameter> mDesignParameters;

	private String mClientStartObject;
	private List<ActionParameter> mClientStartParameters;

	public ComponentDefinition(LayoutDefinition layout, LayoutItemDefinition itemParent)
	{
		super(layout, itemParent);
		mDesignParameters = new ArrayList<>();
	}

	@Override
	public void readData(INodeObject node)
	{
		super.readData(node);
		String designObject = MetadataLoader.getObjectName(node.optString("@object"));
		String designObjectSub = node.optString("@objectPanel");
		if (Strings.hasValue(designObjectSub))
			designObject += "." + designObjectSub;

		// This is the info for a "fixed" component.
		// It may not be present if the component is dynamically initialized.
		mDesignObject = designObject;
		WorkWithMetadataLoader.readActionParameterList(null, mDesignParameters, node.optNode("parameters"));
	}

	public IViewDefinition getObject()
	{
		if (Strings.hasValue(mDesignObject))
			return Services.Application.getView(mDesignObject);
		if (Strings.hasValue(mClientStartObject))
			return Services.Application.getView(mClientStartObject);
		else
			return null;
	}

	public List<ActionParameter> getParameters()
	{
		if (mDesignParameters==null && mClientStartParameters!=null)
			return mClientStartParameters;
		return mDesignParameters;
	}

	public void setClientStartObject(String clientStartObject)
	{
		mClientStartObject = clientStartObject;
	}

	public void setClientStartParameters(List<ActionParameter> clientStartParameters)
	{
		mClientStartParameters = clientStartParameters;
	}
}
