package com.genexus.coreexternalobjects;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.android.notification.LocalNotificationsSQLiteHelper;
import com.artech.android.notification.Notification;
import com.artech.android.notification.NotificationAlert;
import com.artech.application.MyApplication;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityFactory;
import com.artech.base.model.EntityList;
import com.artech.base.services.Services;
import com.artech.base.utils.ReflectionHelper;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.genexus.GXBaseCollection;

public class LocalNotificationsAPI extends ExternalApi
{
	public static final String OBJECT_NAME = "GeneXus.SD.Notifications.LocalNotifications";

	private static final String METHOD_CREATE_ALERTS = "CreateAlerts";
	private static final String METHOD_LIST_ALERTS = "ListAlerts";
	private static final String METHOD_REMOVE_ALERTS = "RemoveAlerts";
	private static final String METHOD_REMOVE_ALL_ALERTS = "RemoveAllAlerts";

    private static AlarmManager am = (AlarmManager) MyApplication.getAppContext().getSystemService(Context.ALARM_SERVICE);
	private static int iUniqueId;
	private static LocalNotificationsSQLiteHelper db = new LocalNotificationsSQLiteHelper(MyApplication.getAppContext());

	public LocalNotificationsAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters)
	{
		if (method.equalsIgnoreCase(METHOD_CREATE_ALERTS))
		{
			EntityList notificationList = (EntityList) parameters.get(0);
			
			if (notificationList != null)
			{
				for (Entity notification : notificationList)
				{
					String text = (String)notification.getProperty("Text");
					String dateTime = (String)notification.getProperty("DateTime");
					createAlertsStatic(text, dateTime);		
				}
			}

			return ExternalApiResult.SUCCESS_CONTINUE;
		}
		else if (method.equalsIgnoreCase(METHOD_LIST_ALERTS))
		{
			EntityList alerts = new EntityList();
			GXBaseCollection collection = listAlertsStatic();
			
			if (collection!=null)
			{
				try
				{
					json.org.json.JSONArray jsalerts = (json.org.json.JSONArray)collection.GetJSONObject();
				
					for (int i = 0; i < jsalerts.length(); i++)
					{
						json.org.json.JSONObject a;
						if(jsalerts.get(i) instanceof json.org.json.JSONObject){
							a = jsalerts.getJSONObject(i);
						}else{
							a = (json.org.json.JSONObject) collection.getStruct().get(i);
						}

						Entity alert = EntityFactory.newSdt("GeneXus.SD.Notifications.LocalNotificationsInfo");
						alert.setProperty("DateTime",a.get("DateTime"));
						alert.setProperty("Text",a.get("Text"));
						alerts.add(alert);
					}
				}
				catch (json.org.json.JSONException e)
				{
				}

				return ExternalApiResult.success(alerts);
			}
			else
			{
				//online method
				List<Notification> notifications = db.getAllNotifications();
				
		    	for (Notification n : notifications) {
					Entity alert = EntityFactory.newSdt("GeneXus.SD.Notifications.LocalNotificationsInfo");
					alert.setProperty("DateTime",n.getDateTime());
					alert.setProperty("Text",n.getText());
					alerts.add(alert);
		    	}

		    	return ExternalApiResult.success(alerts);
			}
		}
		else if (method.equalsIgnoreCase(METHOD_REMOVE_ALERTS))
		{
			EntityList alerts = (EntityList)parameters.get(0);
			
			if (alerts != null)
			{
				for (Entity a : alerts)
					removeAlertsStatic((String) a.getProperty("Text"),(String) a.getProperty("DateTime"));
			}

			return ExternalApiResult.SUCCESS_CONTINUE;

		}
		else if (method.equalsIgnoreCase(METHOD_REMOVE_ALL_ALERTS))
		{
			removeAllAlertsStatic();
			return ExternalApiResult.SUCCESS_CONTINUE;
		}
		else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}

	public static void createAlertsStatic(String text, String dateTime)
	{		
		Notification n = new Notification();
		n.setDateTime(dateTime);
		n.setText(text);
		iUniqueId = (int)db.addNotification(n);
		
		PendingIntent pendingIntent = getPendingIntent(text, iUniqueId);
		
		//DateTime
		Date date = Services.Strings.getDateTime(dateTime);
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(date);

		am.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingIntent);
	}

	private static PendingIntent getPendingIntent(String text, int uniqueId) {
		//Text
		Intent intent = new Intent(MyApplication.getAppContext(), NotificationAlert.class);
		intent.putExtra("ID", uniqueId);
		intent.putExtra("NOTIFICATION", text);
		
		//Pending Intent
		return PendingIntent.getBroadcast(MyApplication.getAppContext(), uniqueId,intent, PendingIntent.FLAG_ONE_SHOT);
	}
	
	public static GXBaseCollection listAlertsStatic()
	{
		// use Core module sdt name
		Class<?> clazzType = ReflectionHelper.getClass(Object.class, "com.genexuscore.genexus.sd.notification.SdtLocalNotificationsInfo_Item");
		if (clazzType == null)
		{
			Services.Log.error("SdtLocalNotificationsInfo_Item not found ");
			return null;
		}

		GXBaseCollection base = new GXBaseCollection(clazzType, "LocalNotificationsInfo.Item", "LocalNotifications", MyApplication.getApp().getRemoteHandle());

		List<Notification> notifications = db.getAllNotifications();
		json.org.json.JSONArray jsonotifications = new json.org.json.JSONArray();
		try {
			for (Notification n : notifications)
			{
				json.org.json.JSONObject jsonotification = new json.org.json.JSONObject();
				jsonotification.put("Text", n.getText());
				jsonotification.put("DateTime",n.getDateTime());
				jsonotifications.put(jsonotification);
			}
		} catch (json.org.json.JSONException e) {
		}
		base.fromJSonString(jsonotifications.toString());
		return base;
	}
	
	public static void removeAlertsStatic(String text,String dateTime)
	{
		// before remove alert, remove am alert
		
		Notification n = new Notification();
		n.setText(text);
		n.setDateTime(dateTime);
		int uniqueId = db.getId(n);
		
		PendingIntent pendingIntent = getPendingIntent(text, uniqueId);
		// Cancel Alarm manager with this intent
		am.cancel(pendingIntent);
		
		db.deleteNotification(uniqueId);
	}
	
	public static void removeAllAlertsStatic()
	{
		// before remove alert, remove all current am alert
		List<Notification> notifications = db.getAllNotifications();
		for (Notification n : notifications) 
		{
    		int uniqueId = db.getId(n);
    		PendingIntent pendingIntent = getPendingIntent(n.getText(), uniqueId);
    		// Cancel Alarm manager with this intent
    		am.cancel(pendingIntent);
    	}
    	
		db.deleteAllNotifications();
	}

	// method to re enable notification after reboot
	public static void reSetAlertsInAlarmManagerStatic() 
	{
		List<Notification> notifications = db.getAllNotifications();
		for (Notification n : notifications)
		{
			int uniqueId = db.getId(n);
			Services.Log.debug("Notification Id :" + uniqueId + " time " + n.getDateTime() );
			PendingIntent pendingIntent = getPendingIntent(n.getText(), uniqueId);
			
			//DateTime
			Date date = Services.Strings.getDateTime(n.getDateTime());
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(date);

			am.set(AlarmManager.RTC_WAKEUP, calendar.getTimeInMillis(), pendingIntent);	
		}
	}
}
