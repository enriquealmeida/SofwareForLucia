package com.artech.controls;

import android.view.View;

import com.artech.base.controls.IGxOverrideThemeable;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeOverrideProperties;

/**
 * Class used to centralize code among all IGxOverrideThemeable controls.
 * Should be called on all IGxOverrideThemeable methods.
 */
public class ThemedOverrideViewHelper extends ThemedViewHelper implements IGxOverrideThemeable
{
    private ThemeOverrideProperties mThemeOverrideProperties = new ThemeOverrideProperties();

    public ThemedOverrideViewHelper(View view, LayoutItemDefinition layoutItem) {
        super(view, layoutItem);
    }

    public ThemedOverrideViewHelper(View view) {
        super(view, null);
    }

    // needed for override Table Background and BackColor
    @Override
    public void setOverride(String propertyName, String propertyValue) {
        mThemeOverrideProperties.setOverride(propertyName, propertyValue);
        applyClass(mThemeClass);
    }

    @Override
    public ThemeOverrideProperties getThemeOverrideProperties() {
        return mThemeOverrideProperties;
    }
}
