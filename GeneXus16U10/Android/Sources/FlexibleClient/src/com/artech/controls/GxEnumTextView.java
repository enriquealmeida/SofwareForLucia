package com.artech.controls;

import java.util.List;

import android.content.Context;

import com.artech.base.metadata.EnumValuesDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.utils.Strings;

public class GxEnumTextView extends GxTextView implements IGxComboEdit
{
	private List<? extends EnumValuesDefinition> mEnumValues = null;

	public GxEnumTextView(Context context, LayoutItemDefinition definition)
	{
		super(context, definition);
	}

	@Override
	public String getGxValue() {

		String description = getText().toString();
		if (description!=null)
		{
			return findValueFromDescription(description);
		}
		return Strings.EMPTY;
	}

	@Override
	public void setGxValue(String value) {
		String description = findValueDescription(value);
		this.setText(description);
	}

	@Override
	public String getGxTag() {
		return (String)this.getTag();
	}

	@Override
	public void setComboValues(List<? extends EnumValuesDefinition> values)
	{
		//Do something with enumvalues.
		mEnumValues = values;
	}

	private String findValueDescription(String value)
	{
		if (mEnumValues !=null)
		{
			for (EnumValuesDefinition item : mEnumValues) {
				if (value.equalsIgnoreCase(item.getValue()))
						return item.getDescription();
			}
		}
		return Strings.EMPTY;
	}

	private String findValueFromDescription(String description)
	{
		if (mEnumValues !=null)
		{
			for (EnumValuesDefinition item : mEnumValues) {
				if (description.equalsIgnoreCase(item.getDescription()))
					return item.getValue();
			}
		}
		return Strings.EMPTY;
	}

	@Override
	public void setGxTag(String data) {
		this.setTag(data);
	}

	@Override
	public LayoutItemDefinition getDefinition() {
		return mDefinition;
	}


}
