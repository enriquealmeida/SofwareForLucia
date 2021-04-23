package com.artech.ui.navigation.split;

import android.content.res.Configuration;

import com.artech.activities.GenexusActivity;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.WWListDefinition;
import com.artech.base.metadata.settings.PlatformDefinition;
import com.artech.base.utils.PlatformHelper;
import com.artech.ui.navigation.NavigationController;
import com.artech.ui.navigation.NavigationType;

/**
 * Split Navigation (only enabled for WWSD list/detail for now).
 */
public class SplitNavigation implements NavigationType
{
	@Override
	public boolean isNavigationFor(GenexusActivity activity, IViewDefinition mainView)
	{
		return (PlatformHelper.getNavigationStyle() == PlatformDefinition.NAVIGATION_SPLIT &&
				isValidConfigurationForSplit(activity.getResources().getConfiguration()) &&
				mainView instanceof WWListDefinition);
	}

	private static boolean isValidConfigurationForSplit(Configuration configuration)
	{
		return (configuration != null &&
				configuration.smallestScreenWidthDp >= PlatformDefinition.SMALLEST_WIDTH_DP_TABLET);
		// 		&& configuration.orientation == Configuration.ORIENTATION_LANDSCAPE); ?
	}

	@Override
	public NavigationController createController(GenexusActivity activity, IViewDefinition mainView)
	{
		return new SplitNavigationController(activity, mainView);
	}
}
