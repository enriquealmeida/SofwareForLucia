package com.artech.common;

import android.app.Activity;

import com.artech.activities.IGxThemeableActivity;
import com.artech.application.MyApplication;
import com.artech.base.metadata.loader.MetadataParser;
import com.artech.base.metadata.settings.PlatformDefinition;
import com.artech.base.metadata.theme.ThemeApplicationClassDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.services.IThemes;
import com.artech.base.services.Services;
import com.artech.base.utils.PlatformHelper;
import com.artech.base.utils.Strings;
import com.artech.utils.Cast;

public class ThemesManager implements IThemes {
    private ThemeDefinition sAppTheme = null;
    private boolean sAppThemeCalculated = false;
    private boolean sDarkMode = false; // Selected in the device by the user
    private boolean sSetThemeWasUsed = false; // GX SetTheme function used, theme manually set

    @Override
    public ThemeDefinition getCurrentTheme()
    {
        if (!sAppThemeCalculated || sAppTheme == null)
            setTheme(calculateAppTheme());
        if (sAppTheme != null && useDarkThemeProperty()) {
            ThemeDefinition darkTheme = sAppTheme.getDarkTheme();
            if (darkTheme != null)
                return darkTheme;
        }
        return sAppTheme;
    }

    private boolean useDarkThemeProperty() {
        if (sSetThemeWasUsed)
            return false;

        if (MyApplication.getApp().getMainProperties() != null &&
                !MyApplication.getApp().getMainProperties().optBooleanProperty("idEnablePreferredColorScheme")) {
            return "AndroidBaseStyleDark".equals(MyApplication.getApp().getMainProperties().optStringProperty("AndroidBaseStyle"));
        }

        return sDarkMode;
    }

    @Override
    public String getCurrentThemeName()
    {
        ThemeDefinition theme = getCurrentTheme();
        return (theme != null ? theme.getName() : null);
    }

    private void setTheme(ThemeDefinition appTheme) {
        sAppTheme = appTheme;
        sAppThemeCalculated = true;
    }

    @Override
    public void setDarkMode(boolean darkMode) {
        sDarkMode = darkMode;
    }

    private static ThemeDefinition loadTheme(Activity activity, String name) {
        ThemeDefinition theme = Services.Application.getTheme(name);
        if (theme == null) {
            theme = MetadataParser.readOneTheme(activity, name);
            if (theme != null)
                Services.Application.putTheme(theme);
        }
        return theme;
    }

    @Override
    public boolean setCurrentTheme(Activity activity, String name) {
        ThemeDefinition theme = loadTheme(activity, name);
        if (theme != null) {
            sSetThemeWasUsed = true;
            setTheme(theme);
            return true;
        } else {
            return false;
        }
    }

    @Override
    public void applyCurrentTheme(Activity activity) {
        IGxThemeableActivity themeableActivity = Cast.as(IGxThemeableActivity.class, activity);
        if (themeableActivity != null)
            activity.runOnUiThread(themeableActivity::applyCurrentTheme);
    }

    @Override
    public ThemeApplicationClassDefinition getApplicationClass()
    {
        ThemeDefinition theme = getCurrentTheme();
        if (theme == null)
            return null;

        return theme.getApplicationClass();
    }

    @Override
    public ThemeClassDefinition getThemeClass(String className)
    {
        return getThemeClass(ThemeClassDefinition.class, className);
    }

    @Override
    public <T extends ThemeClassDefinition> T getThemeClass(Class<T> t, String className)
    {
        if (!Strings.hasValue(className))
            return null;

        ThemeDefinition theme = getCurrentTheme();
        if (theme == null)
            return null;

        // We accept "old" names (e.g. Attribute.Title) in case they were used as constant strings in GX code.
        className = className.replace(".", "");

        ThemeClassDefinition themeClass = theme.getClass(className);
        if (themeClass == null && !className.equalsIgnoreCase("(None)"))
            Services.Log.warning(String.format("Class '%s' not found in theme '%s'.", className, theme.getName()));

        return (t.isInstance(themeClass) ? t.cast(themeClass) : null);
    }

    private ThemeDefinition calculateAppTheme()
    {
        String name = calculateAppThemeName();
        if (Strings.hasValue(name))
            return Services.Application.getTheme(name);

        return null;
    }

    @Override
    public String calculateAppThemeName()
    {
        // Get the theme from the first applicable platform that has a set theme, if any.
        for (PlatformDefinition platform : PlatformHelper.getValidPlatforms())
        {
            String themeName = platform.getTheme();
            if (Strings.hasValue(themeName))
                return themeName;
        }

        return null;
    }

    @Override
    public void reset() {
        sAppTheme = null;
        sAppThemeCalculated = false;
    }
}
