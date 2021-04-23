package com.artech.controls.chart;

import android.content.Context;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.controls.chart.pie.GxPieChart;
import com.artech.controls.chart.pie.GxPieChartDefinition;
import com.artech.controls.chart.timeline.GxTimelineChart;
import com.artech.controls.chart.timeline.GxTimelineChartDefinition;
import com.artech.framework.GenexusModule;
import com.artech.ui.Coordinator;
import com.artech.usercontrols.IControlFactory;
import com.artech.usercontrols.IGxUserControl;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;

/**
 * Charts Module.
 * Supports creation of different Chart classes according to the "chart type" property value.
 */
public class ChartsModule implements GenexusModule
{
	@Override
	public void initialize(Context context)
	{
		UcFactory.addControl(new UserControlDefinition(ChartFactory.USER_CONTROL_NAME, new ChartFactory()));
	}

	private static class ChartFactory implements IControlFactory
	{
		static final String USER_CONTROL_NAME = "SD Charts";

		@Override
		public IGxUserControl create(Context context, Coordinator coordinator, LayoutItemDefinition definition)
		{
			// This needs an Activity context (to get theme), so it cannot be done in initialize().
			DefaultStyle.initialize(context);

			if (definition.getControlInfo() != null)
			{
				String chartType = definition.getControlInfo().optStringProperty("@SDChartsChartType");

				if (GxPieChartDefinition.CHART_TYPE.equalsIgnoreCase(chartType))
					return new GxPieChart(context, new GxPieChartDefinition(definition));
				else if (GxTimelineChartDefinition.CHART_TYPE.equalsIgnoreCase(chartType))
					return new GxTimelineChart(context, new GxTimelineChartDefinition(definition));
				else
					throw new IllegalArgumentException("Unknown chart type: " + chartType);
			}

			return null;
		}
	}
}
