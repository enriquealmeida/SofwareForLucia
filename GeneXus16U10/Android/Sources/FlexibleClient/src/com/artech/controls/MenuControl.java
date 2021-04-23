package com.artech.controls;

import android.app.Activity;

import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.common.ExecutionContext;
import com.artech.ui.navigation.INavigationActivity;
import com.artech.ui.navigation.tabbed.TabbedNavigationController;
import com.artech.utils.Cast;

public class MenuControl implements IGxControl {
    public static final String CONTROL_NAME = "Menu";
    private final TabbedNavigationController mTabbedController;

    public MenuControl(Activity activity) {
        if (activity instanceof INavigationActivity)
            mTabbedController = Cast.as(TabbedNavigationController.class, ((INavigationActivity) activity).getNavigationController());
        else
            mTabbedController = null;
    }

    @Override
    public String getName() {
        return CONTROL_NAME;
    }

    @Override
    public LayoutItemDefinition getDefinition() {
        return null;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public ThemeClassDefinition getThemeClass() {
        return null;
    }

    @Override
    public boolean isVisible() {
        return true;
    }

    @Override
    public String getCaption() {
        return null;
    }

    @Override
    public void setEnabled(boolean enabled) {
    }

    @Override
    public void setFocus(boolean showKeyboard) {
    }

    @Override
    public void setThemeClass(ThemeClassDefinition themeClass) {
    }

    @Override
    public void setVisible(boolean visible) {
    }

    @Override
    public void setCaption(String caption) {
    }

    @Override
    public void requestLayout() {
    }

    @Override
    public Object getInterface(Class c) {
        return Cast.as(c, this);
    }

    @Override
    public void setExecutionContext(ExecutionContext context) {
    }

    @Override
    public void setPropertyValue(String name, Value value) {
        if (mTabbedController != null)
            mTabbedController.setActivePage(value.coerceToInt() - 1);
    }

    @Override
    public Value getPropertyValue(String name) {
        if (mTabbedController != null)
            return Value.newInteger(mTabbedController.getActivePage() + 1);
        return null;
    }
}
