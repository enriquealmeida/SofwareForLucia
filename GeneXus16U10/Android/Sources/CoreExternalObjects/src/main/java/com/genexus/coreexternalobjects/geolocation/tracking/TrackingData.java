package com.genexus.coreexternalobjects.geolocation.tracking;

import java.util.Date;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;

import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.genexus.coreexternalobjects.geolocation.LocationActionsHelper;

public class TrackingData
{
	private static final String PREFERENCES_KEY = "TrackingData";

	private static final String ISTRACKING = "isTracking";
	private static final String LASTLOCATIONACTIONTIME = "lastLocationActionTime";
	private static final String ACTION = "action";
	private static final String ACTIONINTERVAL = "actionInterval";

	public static void setTrackingData(boolean isTracking ,Date lastLocationActionTime, String action, Integer actionInterval )
	{
		SharedPreferences session = Services.Preferences.getAppSharedPreferences(PREFERENCES_KEY);
		Editor sessionEditor = session.edit();
		sessionEditor.putBoolean(ISTRACKING, isTracking);
		sessionEditor.putLong(LASTLOCATIONACTIONTIME, lastLocationActionTime.getTime());
		sessionEditor.putString(ACTION, action);
		sessionEditor.putInt(ACTIONINTERVAL, actionInterval);
		sessionEditor.commit();
	}

	public static void setTrackingDataDate(Date lastLocationActionTime)
	{
		SharedPreferences session = Services.Preferences.getAppSharedPreferences(PREFERENCES_KEY);
		Editor sessionEditor = session.edit();
		sessionEditor.putLong(LASTLOCATIONACTIONTIME, lastLocationActionTime.getTime());
		sessionEditor.commit();
	}

	public static void restoreTrackingData()
	{
		SharedPreferences session = Services.Preferences.getAppSharedPreferences(PREFERENCES_KEY);

		boolean isTracking = session.getBoolean(ISTRACKING, false);
		long dateTime = session.getLong(LASTLOCATIONACTIONTIME, 0);
		Date lastLocationActionTime = new Date(dateTime);
		String action = session.getString(ACTION, Strings.EMPTY);
		int actionInterval = session.getInt(ACTIONINTERVAL, 0);

		LocationActionsHelper.restore(isTracking, lastLocationActionTime, action, actionInterval);
	}

	public static void clear()
	{
		SharedPreferences session = Services.Preferences.getAppSharedPreferences(PREFERENCES_KEY);
		Editor sessionEditor = session.edit();
		sessionEditor.clear();
		sessionEditor.commit();
	}
}
