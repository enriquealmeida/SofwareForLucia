package com.artech.activities;

import android.app.Activity;

import com.artech.base.metadata.ILayoutDefinition;
import com.artech.base.services.Services;
import com.artech.fragments.IDataViewHost;
import com.artech.fragments.LayoutFragmentActivity;

public class ActivityThemePropertiesHelper {
    public static void applyChanges(Activity activity) {
        ILayoutDefinition layoutDefinition = null;
        if (activity instanceof LayoutFragmentActivity) {
            layoutDefinition = ((IDataViewHost) activity).getMainLayout();
        } else if (activity instanceof IGxDashboardActivity) {
            layoutDefinition = (ILayoutDefinition) ((IGxDashboardActivity) activity).getDashboardDefinition();
        }
        ActivityHelper.applyStyle(activity, layoutDefinition);
    }

    public static void applyCurrentAppTheme(Activity activity) {
        int themeId = activity.getResources().getIdentifier("ApplicationTheme" + Services.Themes.getCurrentThemeName(), "style", activity.getPackageName());
        if (themeId == 0) {
            Services.Log.error("ApplyAppTheme", "Failure to get " + Services.Themes.getCurrentThemeName() + " theme id. Try getting the default theme id");
            themeId = activity.getResources().getIdentifier("ApplicationTheme", "style", activity.getPackageName());
        }
        if (themeId != 0) {
            activity.setTheme(themeId);
        } else {
            Services.Log.error("ApplyAppTheme", "Failure to get default theme id.");
        }
    }
}
