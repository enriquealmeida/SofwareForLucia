package com.artech.base.controls;

import com.artech.base.metadata.theme.ThemeOverrideProperties;

public interface IGxOverrideThemeable {

    /*
        Name and value for a property override. For example: setOverride("background-color", "Red")
     */
    void setOverride(String propertyName, String propertyValue);

	/*
	get the ThemeOverrideProperties of this view
	 */
	ThemeOverrideProperties getThemeOverrideProperties();
}
