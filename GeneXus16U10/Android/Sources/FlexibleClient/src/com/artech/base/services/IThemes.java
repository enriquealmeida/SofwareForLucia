package com.artech.base.services;

import android.app.Activity;

import com.artech.base.metadata.theme.ThemeApplicationClassDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;

public interface IThemes {
    ThemeDefinition getCurrentTheme();
    String getCurrentThemeName();
    boolean setCurrentTheme(Activity activity, String name);
    void applyCurrentTheme(Activity activity);

    ThemeApplicationClassDefinition getApplicationClass();
    ThemeClassDefinition getThemeClass(String className);
    <T extends ThemeClassDefinition> T getThemeClass(Class<T> t, String className);

    String calculateAppThemeName();
    void setDarkMode(boolean darkMode);
    void reset();
}
