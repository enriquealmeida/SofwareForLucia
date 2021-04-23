package com.artech.base.metadata.theme;

import com.artech.base.metadata.enums.MeasureUnit;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

/**
 * Theme class for TabControl control.
 */
public class TabControlThemeClassDefinition extends ThemeClassDefinition
{
	static final String CLASS_NAME = "Tab";

	public static final int TAB_STRIP_POSITION_TOP = 0;
	public static final int TAB_STRIP_POSITION_BOTTOM = 1;

	public TabControlThemeClassDefinition(ThemeDefinition theme, ThemeClassDefinition parentClass)
	{
		super(theme, parentClass);
	}

	public int getTabStripPosition()
	{
		String tabPosition = optStringProperty("tabs_position");
		if (Strings.hasValue(tabPosition) && tabPosition.equalsIgnoreCase("bottom"))
			return TAB_STRIP_POSITION_BOTTOM;
		else
			return TAB_STRIP_POSITION_TOP; // Default
	}

	public String getTabStripColor()
	{
		return optStringProperty("tab_strip_background_color");
	}

	public Integer getTabStripElevation()
	{
		Integer elevation = Services.Strings.tryParseInt(optStringProperty("tab_strip_elevation"));
		if (elevation != null)
			return Services.Device.dipsToPixels(elevation);
		else
			return null;
	}

	public String getIndicatorColor()
	{
		return optStringProperty("tab_strip_indicator_color");
	}

	public ThemeClassDefinition getSelectedPageClass()
	{
		return getRelatedClass("ThemeSelectedTabPageClassReference");
	}

	public ThemeClassDefinition getUnselectedPageClass()
	{
		return getRelatedClass("ThemeUnselectedTabPageClassReference");
	}

	private Integer mTabStripHeight;

	/**
	 * Gets the TabStrip height (in pixels) set in this class.
	 * If null, use the control's default height instead.
	 */
	public int getTabStripHeight()
	{
		if (mTabStripHeight == null)
		{
			String str = optStringProperty("tab_strip_height");
			Integer dipValue = Services.Strings.parseMeasureValue(str, MeasureUnit.DIP);
			if (dipValue != null)
				mTabStripHeight = Services.Device.dipsToPixels(dipValue);

			if (mTabStripHeight == null)
				mTabStripHeight = 0;
		}

		return mTabStripHeight;
	}
}
