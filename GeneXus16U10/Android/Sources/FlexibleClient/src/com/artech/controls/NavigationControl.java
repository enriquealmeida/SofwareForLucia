package com.artech.controls;

import android.app.Activity;

import com.artech.base.metadata.DashboardItem;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.ExecutionContext;
import com.artech.ui.navigation.NavigationController;
import com.artech.utils.Cast;

public class NavigationControl implements IGxControl
{
	public static final String CONTROL_NAME = "NavigationControl";
	private final Activity mActivity;
	private final NavigationController mNavigationController;
	private final DashboardItem  mItem;

	public NavigationControl(Activity activity, NavigationController navigationController, DashboardItem item)
	{
		mActivity = activity;
		mNavigationController = navigationController;
		mItem = item;
	}

	@Override
	public String getName()
	{
		return CONTROL_NAME;
	}

	@Override
	public LayoutItemDefinition getDefinition()
	{
		return null;
	}

	@Override
	public boolean isVisible()
	{
		int index = mItem.getIndex()+1;
		return mNavigationController.isTargetVisible("tab[" + String.valueOf(index) + "]");
	}

	@Override
	public void setVisible(boolean visible)
	{
		// implement using show target, hide target
		// get tab[index] of this tab in all dashboard items
		int index = mItem.getIndex()+1;
		if (visible)
			mNavigationController.showTarget("tab[" + String.valueOf(index) + "]");
		else
			mNavigationController.hideTarget( "tab[" + String.valueOf(index) +"]");
	}

	@Override
	public ThemeClassDefinition getThemeClass()
	{
		if (Strings.hasValue(mItem.getThemeClass()))
			return Services.Themes.getThemeClass(mItem.getThemeClass());
		return null;
	}

	@Override
	public void setThemeClass(ThemeClassDefinition themeClass)
	{
		mItem.setThemeClass(themeClass.getName());
	}

	@Override
	public void setExecutionContext(ExecutionContext context) { }

	@Override
	public boolean isEnabled() { return true; }

	@Override
	public String getCaption() { return mItem.getTitle(); }

	@Override
	public void setEnabled(boolean enabled) { }

	@Override
	public void setFocus(boolean showKeyboard) { }

	@Override
	public void setCaption(String caption) {  mItem.setTitle(caption);}

	@Override
	public void requestLayout() { }

	@Override
	public Object getInterface(Class c) {
		return Cast.as(c, this);
	}
}
