package com.artech.controls.common;

import com.artech.base.controls.MappedValue;
import com.artech.base.metadata.enums.DataTypes;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.IValuesFormatter;

public class EditInputValues extends EditInput
{
	private final LayoutItemDefinition mLayoutItem;
	private String mValue;

	public EditInputValues(LayoutItemDefinition layoutItem)
	{
		mLayoutItem = layoutItem;
	}

	@Override
	public void setValue(String value, OnMappedAvailable onTextAvailable)
	{
		setValueOrText(value, onTextAvailable);
	}

	@Override
	public void setText(String text, OnMappedAvailable onValueAvailable)
	{
		setValueOrText(text, onValueAvailable);
	}

	private void setValueOrText(String value, OnMappedAvailable onMappedAvailable)
	{
		mValue = value;
		if (onMappedAvailable != null)
			onMappedAvailable.run(MappedValue.exact(value));
	}

	@Override
	public String getValue()
	{
		return mValue;
	}

	@Override
	public String getText()
	{
		return mValue;
	}

	@Override
	public boolean getSupportsAutocorrection()
	{
		return true;
	}

	@Override
	public Integer getEditLength()
	{
		if (mLayoutItem != null && mLayoutItem.getDataItem() != null)
		{
			if (DataTypes.isCharacter(mLayoutItem.getDataTypeName().getDataType())
					|| DataTypes.isCharacterDomain(mLayoutItem.getDataTypeName().getDataType()))
				return mLayoutItem.getDataItem().getLength();
		}

		return null;
	}

	@Override
	public IValuesFormatter getValuesFormatter()
	{
		return null;
	}
}
