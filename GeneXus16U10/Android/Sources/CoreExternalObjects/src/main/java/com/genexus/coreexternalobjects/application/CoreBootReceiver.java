package com.genexus.coreexternalobjects.application;
 
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

import com.artech.base.services.Services;
import com.genexus.coreexternalobjects.GeoLocationAPI;
import com.genexus.coreexternalobjects.LocalNotificationsAPI;

public class CoreBootReceiver extends BroadcastReceiver {
	
 	@Override
	public void onReceive(Context context, Intent intent) 
 	{
		Services.Log.debug("Core ExternalObjects BootReceiver");

		Services.Log.debug("reSetAlertsInAlarmManager");
 		LocalNotificationsAPI.reSetAlertsInAlarmManagerStatic();

		Services.Log.debug("reSetProximityAlertsInGeofences");
		GeoLocationAPI.reSetProximityAlertsInGeofencesStatic();
	}
 
}
