package com.artech.android.notification;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager.NameNotFoundException;

import com.artech.android.device.ClientInformation;
import com.artech.application.MyApplication;
import com.artech.base.application.IProcedure;
import com.artech.base.application.OutputResult;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.IGxObjectDefinition;
import com.artech.base.metadata.ProcedureDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.model.PropertiesObject;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

import androidx.annotation.NonNull;

public class NotificationDeviceRegister {

	private static final String PROPERTY_REG_ID = "registration_id";
	private static final String TAG = "GCM Client";
	private static final String PROPERTY_APP_VERSION = "appVersion";
	
	public static boolean registerWithServer(GenexusApplication genexusApplication, String registrationToken)
	{
		//Register Device in the server
		Services.Log.debug("Register in Notification Handler" + "Handler " + genexusApplication.getNotificationRegistrationHandler());

		// Respect procedure connectivity support. Default online.
		// Obtain implementation.
		ProcedureDefinition actionObject = Services.Application.getProcedure(genexusApplication.getNotificationRegistrationHandler());
		IApplicationServer server = getApplicationServer(actionObject);
		IProcedure procedureRegister = server.getProcedure(genexusApplication.getNotificationRegistrationHandler());

		PropertiesObject parameters = new PropertiesObject();

		parameters.setProperty("DeviceType", Strings.ONE);
		parameters.setProperty("DeviceId", ClientInformation.id());
		parameters.setProperty("DeviceToken", registrationToken);
		parameters.setProperty("DeviceName", ClientInformation.osName() + Strings.SPACE + ClientInformation.osVersion());

		Services.Log.debug("Register with server " + parameters.getInternalProperties().toString() );

		OutputResult result = procedureRegister.execute(parameters);

		if (result.isOk())
		{
			Services.Log.debug("Call to NotificationRegistrationHandler ok ");
			return true;
		}
		return false;
	}

	 /**
     * Gets the current registration ID for application on GCM service, if there is one.
     * <p>
     * If result is empty, the app needs to register.
     *
     * @return registration ID, or empty string if there is no existing
     *         registration ID.
     */
    public static String getRegistrationId(Context context) 
    {
        final SharedPreferences prefs = getGcmPreferences(context);
        String registrationId = prefs.getString(PROPERTY_REG_ID, "");
        if (!Services.Strings.hasValue(registrationId)) {
			Services.Log.info(TAG, "Registration not found.");
            return "";
        }
        // Check if app was updated; if so, it must clear the registration ID
        // since the existing regID is not guaranteed to work with the new
        // app version.
        int registeredVersion = prefs.getInt(PROPERTY_APP_VERSION, Integer.MIN_VALUE);
        int currentVersion = getAppVersion(context);
        if (registeredVersion != currentVersion) {
			Services.Log.info(TAG, "App version changed.");
            return "";
        }
        return registrationId;
    }

    /**
     * Stores the registration ID and the app versionCode in the application's
     * {@code SharedPreferences}.
     *
     * @param context application's context.
     * @param regId registration ID
     */
    private static void storeRegistrationId(Context context, String regId)
    {
        final SharedPreferences prefs = getGcmPreferences(context);
        int appVersion = getAppVersion(context);
		Services.Log.info(TAG, "Saving regId on app version " + appVersion);
        SharedPreferences.Editor editor = prefs.edit();
        editor.putString(PROPERTY_REG_ID, regId);
        editor.putInt(PROPERTY_APP_VERSION, appVersion);
        editor.commit();
    }
    
    /**
     * @return Application's {@code SharedPreferences}.
     */
    private static SharedPreferences getGcmPreferences(Context context) {
        // This sample app persists the registration ID in shared preferences, but
        // how you store the regID in your app is up to you.
        return context.getSharedPreferences(NotificationDeviceRegister.class.getSimpleName(),
                Context.MODE_PRIVATE);
    }
    
    /**
     * @return Application's version code from the {@code PackageManager}.
     */
    // TODO: Should use getLongVersionCode for API >= 28
    @SuppressWarnings("deprecation")
    private static int getAppVersion(Context context) {
        try {
            PackageInfo packageInfo = context.getPackageManager()
                    .getPackageInfo(context.getPackageName(), 0);
            return packageInfo.versionCode;
        } catch (NameNotFoundException e) {
            // should never happen
            throw new RuntimeException("Could not get package name: " + e);
        }
    }

	protected static IApplicationServer getApplicationServer(@NonNull IGxObjectDefinition gxObject)
	{
		if (gxObject.getConnectivitySupport() != Connectivity.Inherit)
			return MyApplication.getApplicationServer(gxObject.getConnectivitySupport());
		else
			return getDefaultApplicationServer();
	}

	protected static IApplicationServer getDefaultApplicationServer()
	{
		return  MyApplication.getApplicationServer(Connectivity.Online);
	}
    
    
}
