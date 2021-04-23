package com.artech.controls.common;

import java.util.List;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class StaticValueItems extends ValueItems<ValueItem>
{
	public StaticValueItems(DataItem dataItem, ControlInfo controlInfo)
	{
		super();
		initializeItems(dataItem, controlInfo);
	}

	private void initializeItems(DataItem dataItem, ControlInfo controlInfo)
	{
		if (controlInfo.optBooleanProperty("@AddEmptyItem"))
		{
			Object emptyValue = (dataItem != null ? dataItem.getEmptyValue() : null);
			if (emptyValue == null)
				emptyValue = Strings.EMPTY;

			ValueItem emptyItem = new ValueItem(emptyValue.toString(), controlInfo.getTranslatedProperty("@EmptyItemText"));
			setEmptyItem(emptyItem);
		}

		String strControlValues = controlInfo.optStringProperty("@ControlValues");
		if (Services.Strings.hasValue(strControlValues))
		{
			List<String> controlValues = Services.Strings.decodeStringList(strControlValues, ',');
			for (String strItem : controlValues)
			{
				List<String> itemParts = Services.Strings.decodeStringList(strItem, ':');
				if (itemParts.size() == 2)
				{
					String itemValue = itemParts.get(1);
					String itemDescription = Services.Language.getTranslation(itemParts.get(0));

					add(new ValueItem(itemValue, itemDescription));
				}
			}
		}
	}
}
