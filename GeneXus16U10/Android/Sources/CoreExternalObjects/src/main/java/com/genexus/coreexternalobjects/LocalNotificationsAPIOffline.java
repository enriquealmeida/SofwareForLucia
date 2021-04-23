package com.genexus.coreexternalobjects;

import com.genexus.GXBaseCollection;


public class LocalNotificationsAPIOffline
{

	public static int createAlerts(GXBaseCollection[] alerts)
	{
		GXBaseCollection collection = alerts[0];
		try
		{
		
			json.org.json.JSONArray jsalerts = (json.org.json.JSONArray)collection.GetJSONObject();
			
	        for (int i = 0; i < jsalerts.length(); i++)
	        {
	        	json.org.json.JSONObject a = null;
	        	if(jsalerts.get(i) instanceof json.org.json.JSONObject){
	        		a = jsalerts.getJSONObject(i);
	        	}else{
	        		a = (json.org.json.JSONObject) collection.getStruct().get(i);
	        	}
				LocalNotificationsAPI.createAlertsStatic(a.get("Text").toString(), a.get("DateTime").toString());
	        }
	        return 1;
	    }
		catch (json.org.json.JSONException e)
	    {
			return 0;
		}
	}
		
	public static GXBaseCollection listAlerts(){
		GXBaseCollection alerts = null;
    	alerts = LocalNotificationsAPI.listAlertsStatic();
		return alerts;
	}
	
	public static int removeAlerts(GXBaseCollection[] alerts){
		GXBaseCollection collection = alerts[0];
		try
		{
		
			json.org.json.JSONArray jsalerts = (json.org.json.JSONArray)collection.GetJSONObject();
			
	        for (int i = 0; i < jsalerts.length(); i++)
	        {
	        	json.org.json.JSONObject a = null;
	        	if(jsalerts.get(i) instanceof json.org.json.JSONObject){
	        		a = jsalerts.getJSONObject(i);
	        	}else{
	        		a = (json.org.json.JSONObject) collection.getStruct().get(i);
	        	}
				LocalNotificationsAPI.removeAlertsStatic(a.get("Text").toString(), a.get("DateTime").toString());
	        }
	        return 1;
	    }
		catch (json.org.json.JSONException e)
	    {
			return 0;
		}
	}
	
	public static int removeAllAlerts()
	{
		LocalNotificationsAPI.removeAllAlertsStatic();
		return 1;
	}
	
}
