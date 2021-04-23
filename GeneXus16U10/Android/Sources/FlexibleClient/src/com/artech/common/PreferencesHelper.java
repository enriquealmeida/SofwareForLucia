package com.artech.common;

import android.content.Context;
import android.content.SharedPreferences;

import com.artech.application.MyApplication;
import com.artech.base.services.IPreferences;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class PreferencesHelper implements IPreferences {
    private final MyApplication mApplication;

    public PreferencesHelper(MyApplication application) {
        mApplication = application;
    }

    @Override
    public void setString(String key, String value) {
        getAppSharedPreferences()
                .edit()
                .putString(key, value)
                .apply();
    }

    @Override
    public String getString(String key) {
        return getAppSharedPreferences().getString(key, Strings.EMPTY);
    }

    @Override
    public void setLong(String key, long value) {
        getAppSharedPreferences()
                .edit()
                .putLong(key, value)
                .apply();
    }

    @Override
    public long getLong(String key, long defaultValue) {
        return getAppSharedPreferences().getLong(key, defaultValue);
    }

    @Override
    public void setBoolean(String key, boolean value){
        getAppSharedPreferences()
                .edit()
                .putBoolean(key, value)
                .apply();
    }

    @Override
    public boolean getBoolean(String key, boolean defaultValue) {
        return getAppSharedPreferences().getBoolean(key, defaultValue);
    }

    @Override
    public SharedPreferences getAppSharedPreferences() {
        return getAppSharedPreferences(null);
    }

    @Override
    public SharedPreferences getAppSharedPreferences(String name) {
        String fullName = MyApplication.getApp().getName() + MyApplication.getApp().getAppEntry();
        if (Services.Strings.hasValue(name))
            fullName += "." + name;

        return mApplication.getSharedPreferences(fullName, Context.MODE_PRIVATE);
    }
}
