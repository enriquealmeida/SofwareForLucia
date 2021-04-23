package com.artech.base.services;

import android.content.SharedPreferences;

public interface IPreferences {
    void setString(String key, String value);
    String getString(String key);
    void setLong(String key, long value);
    long getLong(String key, long defaultValue);
    void setBoolean(String key, boolean value);
    boolean getBoolean(String key, boolean defaultValue);
    SharedPreferences getAppSharedPreferences();
    SharedPreferences getAppSharedPreferences(String name);
}
