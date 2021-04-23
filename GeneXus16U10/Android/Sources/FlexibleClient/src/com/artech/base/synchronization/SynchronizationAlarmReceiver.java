package com.artech.base.synchronization;

import java.io.File;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;

import com.artech.application.MyApplication;
import com.artech.base.application.IProcedure;
import com.artech.base.application.OutputResult;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.model.PropertiesObject;
import com.artech.base.services.AndroidContext;
import com.artech.base.services.Services;

public class SynchronizationAlarmReceiver extends BroadcastReceiver
{
	@Override
	public void onReceive(Context context, Intent intent) 
	{
		Services.Log.debug("SynchronizationAlarmReceiver alarm onReceive");
		
		if (MyApplication.getApp()== null)
		{
			Services.Log.error("SynchronizationAlarmReceiver onReceive, current app null");
			//Toast.makeText(context, "current app null ", Toast.LENGTH_SHORT).show();
			return;
		}
	
		Services.Log.debug("SynchronizationAlarmReceiver onReceive " + MyApplication.getApp().getAppEntry());
		
		// Do a receive automatically after alarm 
		if (MyApplication.getApp().isOfflineApplication()
				&& MyApplication.getApp().getSynchronizerReceiveAfterElapsedTime() )
		{
			if (SynchronizationSendHelper.isRunningSendBackground)
			{
				Services.Log.warning("SynchronizationAlarmReceiver onReceive, other sending working, cannot do a receive.");
				return;
			}
		
			if (SynchronizationHelper.isRunningSendOrReceive)
			{
				Services.Log.warning("SynchronizationAlarmReceiver onReceive, Send Or Receive running, cannot do a receive.");
				return;
			}
		
			String filePath = AndroidContext.ApplicationContext.getDataBaseFilePath();
			File file = new File(filePath);
			if (!file.exists())
			{
				Services.Log.warning("SynchronizationAlarmReceiver onReceive, Database File not exits.");
				return;
			}
			if (!Services.Application.isLoaded())
			{
				Services.Log.warning("SynchronizationAlarmReceiver onReceive, Application is not loaded yet");
				return;
				
			}
				
			callSyncInBackground();
				
		}
	}
	
	private void callSyncInBackground()
	{
		Thread thread = new Thread(null, doBackgroundSyncProcessing,"BackgroundSync");
		thread.start();
	}

	private final Runnable doBackgroundSyncProcessing = new Runnable(){
		@Override
		public void run(){
			GenexusApplication genexusApplication = MyApplication.getApp();
	
			// Do a sync receive or call custom proc.
			if (Services.Strings.hasValue(genexusApplication.getSynchronizerReceiveCustomProcedure()))
			{
				IProcedure procedure = MyApplication.getApplicationServer(Connectivity.Offline).getProcedure(genexusApplication.getSynchronizerReceiveCustomProcedure());
				
				PropertiesObject parameter = new PropertiesObject();
				
				OutputResult procResult = procedure.execute(parameter);
				
				if (procResult.isOk())
				{
					Services.Log.debug("SynchronizationAlarmReceiver call custom proc successfully ");
				}
				else
				{
					Services.Log.warning("SynchronizationAlarmReceiver call custom proc failed ");
						
				}
					
			}
			else
			{
				Services.Log.debug("callSynchronizer (Sync.Receive) from SynchronizationAlarmReceiver onReceive ");
				//boolean failed = SynchronizationHelper.callSynchronizer( false)!=SynchronizationHelper.SYNC_OK;
				Services.Sync.callSynchronizer(true, false);
			}
		}
	};

	public void setAlarm(Context context)
    {
		long minTimeBetweenSync = MyApplication.getApp().getSynchronizerMinTimeBetweenSync();
		// minTimeBetweenSync in seconds
		Services.Log.debug("Synchronizer (Sync.Receive) setAlarm in seconds " + minTimeBetweenSync);

		AlarmManager am=(AlarmManager)context.getSystemService(Context.ALARM_SERVICE);
        Intent intent = new Intent(context, SynchronizationAlarmReceiver.class);
        PendingIntent pi = PendingIntent.getBroadcast(context, 0, intent, 0);

        // Execute after minTimeBetweenSync and every minTimeBetweenSync in seconds
        am.setRepeating(AlarmManager.ELAPSED_REALTIME, SystemClock.elapsedRealtime()+ (1000 * minTimeBetweenSync), (1000 * minTimeBetweenSync) , pi);
    }

    public void cancelAlarm(Context context)
    {
        Intent intent = new Intent(context, SynchronizationAlarmReceiver.class);
        PendingIntent sender = PendingIntent.getBroadcast(context, 0, intent, 0);
        AlarmManager alarmManager = (AlarmManager) context.getSystemService(Context.ALARM_SERVICE);
        alarmManager.cancel(sender);
    }
}
