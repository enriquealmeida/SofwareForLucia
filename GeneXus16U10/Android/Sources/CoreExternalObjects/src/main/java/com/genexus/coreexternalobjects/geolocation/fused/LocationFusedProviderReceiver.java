package com.genexus.coreexternalobjects.geolocation.fused;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.location.Location;

import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.genexus.coreexternalobjects.geolocation.LocationActionsHelper;
import com.genexus.coreexternalobjects.geolocation.tracking.TrackingData;

public class LocationFusedProviderReceiver extends BroadcastReceiver {

	public LocationFusedProviderReceiver() {
		Services.Log.info("LocationFusedProviderReceiver constructor");

		if (!LocationActionsHelper.sIsTracking) {
			Services.Log.info("LocationFusedProviderReceiver constructor. isTracking " + LocationActionsHelper.sIsTracking);
			Services.Log.info("LocationFusedProviderReceiver constructor. restore from session ");

			TrackingData.restoreTrackingData();
		}

		Services.Log.info("LocationFusedProviderReceiver constructor. isTracking " + LocationActionsHelper.sIsTracking);
	}

	@SuppressWarnings("deprecation")
	@Override
	public void onReceive(Context context, Intent intent) {

		Location location = (Location) intent.getExtras().get(com.google.android.gms.location.FusedLocationProviderApi.KEY_LOCATION_CHANGED);

		Services.Log.info("LocationFusedProviderReceiver onReceive onLocationChanged", "Location: " + location);
		Services.Log.info("LocationFusedProviderReceiver ", "isTracking : " + LocationActionsHelper.sIsTracking);

		MyApplication.getInstance().getGeoLocationHelper().onLocationChange(context, location);
	}
}
