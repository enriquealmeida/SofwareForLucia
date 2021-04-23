package com.artech.ui.navigation.tabbed;

import java.util.Arrays;
import java.util.Locale;

import com.artech.activities.GenexusActivity;
import com.artech.base.metadata.DashboardMetadata;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.settings.PlatformDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.PlatformHelper;
import com.artech.base.utils.Strings;
import com.artech.ui.navigation.NavigationController;
import com.artech.ui.navigation.NavigationType;

public class TabbedNavigation implements NavigationType
{
	static final int TAB_NONE = -1;

	private static final Integer[] COMPATIBLE_NAVIGATION_STYLES = new Integer[] { 
		PlatformDefinition.NAVIGATION_DEFAULT, PlatformDefinition.NAVIGATION_FLIP, PlatformDefinition.NAVIGATION_UNKNOWN };
	
	@Override
	public boolean isNavigationFor(GenexusActivity activity, IViewDefinition mainView)
	{
		return (Arrays.asList(COMPATIBLE_NAVIGATION_STYLES).contains(PlatformHelper.getNavigationStyle()) &&
				mainView instanceof DashboardMetadata &&
				((DashboardMetadata)mainView).getControl().equalsIgnoreCase(DashboardMetadata.CONTROL_TABS));
	}

	@Override
	public NavigationController createController(GenexusActivity activity, IViewDefinition mainView)
	{
		return new TabbedNavigationController(activity, (DashboardMetadata)mainView);
	}

	static int getTabPositionFromTargetName(String targetName)
	{
		if (Strings.hasValue(targetName))
		{
			targetName = targetName.toLowerCase(Locale.US);
			if (targetName.startsWith("tab[") && targetName.endsWith("]"))
				return Services.Strings.tryParseInt(targetName.substring(4, targetName.length() - 1), TAB_NONE);

			if (targetName.startsWith("target[") && targetName.endsWith("]"))
				return Services.Strings.tryParseInt(targetName.substring(7, targetName.length() - 1), TAB_NONE);
		}

		return TAB_NONE;
	}
}
