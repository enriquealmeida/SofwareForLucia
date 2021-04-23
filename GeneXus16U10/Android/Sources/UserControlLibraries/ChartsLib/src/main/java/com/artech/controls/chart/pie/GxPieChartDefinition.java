package com.artech.controls.chart.pie;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.Services;
import com.artech.controls.ControlPropertiesDefinition;

public class GxPieChartDefinition
{
	public static final String CHART_TYPE = "pie";

	private CharSequence mTitle;
	private String mCategoryAttribute;
	private String mValueAttribute;
	private String mDetailTextAttribute;
	private boolean mShowInPercentage;

	public GxPieChartDefinition(LayoutItemDefinition definition)
	{
		mShowInPercentage = definition.getControlInfo().optBooleanProperty("@SDChartsShowinPercentage");
		mTitle = Services.Strings.attemptFromHtml(definition.getControlInfo().optStringProperty("@SDChartsTitle"));

		ControlPropertiesDefinition props = new ControlPropertiesDefinition(definition);
		mCategoryAttribute = props.readDataExpression("@SDChartsCategoryAttribute", "@SDChartsCategoryField");
  		mValueAttribute = props.readDataExpression("@SDChartsValueAttribute", "@SDChartsValueField");
		mDetailTextAttribute = props.readDataExpression("@SDChartsCommentsAttribute", "@SDChartsCommentsField");
	}

	public CharSequence getTitle()
	{
		return mTitle;
	}

	public boolean isShowInPercentage()
	{
		return mShowInPercentage;
	}

	public boolean showValuesOutsideSlice()
	{
		return false;
	}

	public String getCategoryItem()
	{
		return mCategoryAttribute;
	}

	public String getValueItem()
	{
		return mValueAttribute;
	}

	public String getDetailTextItem()
	{
		return mDetailTextAttribute;
	}
}
