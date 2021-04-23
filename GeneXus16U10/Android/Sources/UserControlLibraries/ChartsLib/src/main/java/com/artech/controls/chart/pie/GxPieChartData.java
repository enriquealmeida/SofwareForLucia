package com.artech.controls.chart.pie;

import java.util.ArrayList;
import java.util.List;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.DataItemHelper;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controllers.ViewData;

/**
 * Data model for a pie chart.
 */
class GxPieChartData
{
	private final GxPieChartDefinition mDefinition;
	private final ArrayList<Item> mItems;
	private int mDecimals;

	public static class Item
	{
		public String category;
		public float value;
		public String comment;
		public Entity data;
	}

	public GxPieChartData(GxPieChartDefinition definition, ViewData data)
	{
		mDefinition = definition;
		mItems = new ArrayList<>();

		boolean first = true;
		for (Entity item : data.getEntities())
		{
			Item pieItem = new Item();
			pieItem.category = getCategoryFrom(item);
			pieItem.value = getValueFrom(item);
			pieItem.comment = getCommentFrom(item);
			pieItem.data = item;

			mItems.add(pieItem);

			if (first) {
				String valuePropertyName = DataItemHelper.getNormalizedName(definition.getValueItem());
				for (DataItem dataItem : item.getDefinition().getItems()) {
					if (valuePropertyName.equalsIgnoreCase(dataItem.getName())) {
						mDecimals = dataItem.getBaseType().getDecimals();
						break;
					}
				}
				first = false; // Just do it once since all items have the same definition
			}
		}
	}

	public int getValueDecimals() {
		return mDecimals;
	}

	public List<Item> getItems()
	{
		return mItems;
	}

	@NonNull
	private String getCategoryFrom(Entity item)
	{
		if (Strings.hasValue(mDefinition.getCategoryItem()))
			return item.optStringProperty(mDefinition.getCategoryItem());
		else
			return Strings.EMPTY;
	}

	private float getValueFrom(Entity item)
	{
		String strValue = item.optStringProperty(mDefinition.getValueItem());
		return Services.Strings.tryParseFloat(strValue, 0f);
	}

	@Nullable
	private String getCommentFrom(Entity item)
	{
		if (Strings.hasValue(mDefinition.getDetailTextItem()))
			return item.optStringProperty(mDefinition.getDetailTextItem());
		else
			return null;
	}
}
