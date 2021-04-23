package com.artech.base.metadata;

import java.io.Serializable;
import java.util.List;

import com.artech.base.metadata.enums.ImageUploadModes;
import com.artech.base.serialization.INodeObject;

public class AttributeDefinition extends DataTypeDefinition implements Serializable
{
	private static final long serialVersionUID = 1L;

	public AttributeDefinition(INodeObject jsonData)
	{
		super(jsonData);
	}

	public String getSupertype()
	{
		return optStringProperty("AtributeSuperType");
	}

	public int getMaximumUploadSizeMode() {
		String maxUploadSize = super.optStringProperty("MaximumUploadSize");
		return ImageUploadModes.getModeFromString(maxUploadSize);
	}

	@Override
	public List<EnumValuesDefinition> getEnumValues()
	{
		if (getBaseType() != null)
			return getBaseType().getEnumValues();

		return null;
	}
}
