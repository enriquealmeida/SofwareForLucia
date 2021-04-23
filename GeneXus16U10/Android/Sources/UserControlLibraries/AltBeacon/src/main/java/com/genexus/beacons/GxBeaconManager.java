package com.genexus.beacons;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

import org.altbeacon.beacon.Beacon;
import org.altbeacon.beacon.BeaconConsumer;
import org.altbeacon.beacon.BeaconManager;
import org.altbeacon.beacon.BeaconParser;
import org.altbeacon.beacon.BleNotAvailableException;
import org.altbeacon.beacon.MonitorNotifier;
import org.altbeacon.beacon.RangeNotifier;
import org.altbeacon.beacon.Region;
import org.altbeacon.beacon.powersave.BackgroundPowerSaver;

import android.Manifest;
import android.bluetooth.BluetoothAdapter;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.location.LocationManager;
import android.os.RemoteException;

import com.artech.actions.ExternalObjectEvent;
import com.artech.android.ApiAuthorizationStatus;
import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.artech.base.utils.MultiMap;
import com.artech.base.utils.NameMap;
import com.artech.base.utils.Strings;

class GxBeaconManager {

	private final Context mContext;
	private final BeaconManager mBeaconManager;
	private static GxBeaconManager sInstance;

	private Boolean mIsServiceEnabled;
	private Boolean mIsRangingAvailable;
	private Boolean mAreProximityAlertsAvailable;
	private final ProximityAlertsDatabase mProximityAlerts;

	static final String[] REQUIRED_PERMISSIONS = {
			Manifest.permission.BLUETOOTH,
			Manifest.permission.BLUETOOTH_ADMIN,
			Manifest.permission.RECEIVE_BOOT_COMPLETED,
			Manifest.permission.ACCESS_COARSE_LOCATION
	};

	private static final String EVENT_ENTER_BEACON_REGION = "EnterBeaconRegion";
	private static final String EVENT_EXIT_BEACON_REGION = "ExitBeaconRegion";
	private static final String EVENT_CHANGE_BEACONS_IN_REGION = "ChangeBeaconsInRange";

	private static final String IBEACON_LAYOUT = "m:2-3=0215,i:4-19,i:20-21,i:22-23,p:24-24";

	private OnChangeRegionListener mEnterRegionListener;
	private OnChangeRegionListener mExitRegionListener;
	private OnChangeBeaconsListener mChangeBeaconsInRangeListener;

	private final NameMap<Integer> mRegionStates;
	private final MultiMap<String, GxBeaconState> mCurrentBeacons;

	static synchronized GxBeaconManager getInstance(Context context) {
		if (sInstance == null)
			sInstance = new GxBeaconManager(context);
		sInstance.initialize();

		return sInstance;
	}

	private GxBeaconManager(Context context) {
		mContext = context;
		mBeaconManager = BeaconManager.getInstanceForApplication(mContext);

		mProximityAlerts = new ProximityAlertsDatabase(mContext);
		mRegionStates = new NameMap<>();
		mCurrentBeacons = new MultiMap<>();

		mBeaconManager.getBeaconParsers().add(new BeaconParser().setBeaconLayout(IBEACON_LAYOUT));

		mBeaconManager.addMonitorNotifier(mMonitorNotifier);
		mBeaconManager.addRangeNotifier(mRangeNotifier);
		mBeaconManager.bind(mBeaconConsumer);

		if (BuildConfig.DEBUG) mBeaconManager.setDebug(true);

		// Add power saver so that scan period is longer when the app is in background.
		BackgroundPowerSaver mPowerSaver = new BackgroundPowerSaver(mContext);
		Services.Log.debug("PowerSaver created: " + mPowerSaver.toString()); // Just to prevent the "not used" warning.
	}

	private void initialize() {
		final ExternalObjectEvent enterBeaconRegion = new ExternalObjectEvent(BeaconsAPI.OBJECT_NAME, EVENT_ENTER_BEACON_REGION);
		final ExternalObjectEvent exitBeaconRegion = new ExternalObjectEvent(BeaconsAPI.OBJECT_NAME, EVENT_EXIT_BEACON_REGION);
		final ExternalObjectEvent changeBeaconsInRange = new ExternalObjectEvent(BeaconsAPI.OBJECT_NAME, EVENT_CHANGE_BEACONS_IN_REGION);

		this.setOnEnterRegionListener(region -> enterBeaconRegion
				.fire(Collections.singletonList(BeaconsEntitiesFactory.regionToEntity(region))));
		this.setOnExitRegionListener(region -> exitBeaconRegion
				.fire(Collections.singletonList(BeaconsEntitiesFactory.regionToEntity(region))));
		this.setOnChangeBeaconsInRangeListener((region, beacons) -> changeBeaconsInRange
				.fire(Arrays.asList(BeaconsEntitiesFactory.regionToEntity(region),
						BeaconsEntitiesFactory.beaconStatesToEntityList(beacons))));

		this.restoreSavedProximityAlerts();
	}

	private void setOnEnterRegionListener(OnChangeRegionListener listener) {
		mEnterRegionListener = listener;
	}

	private void setOnExitRegionListener(OnChangeRegionListener listener) {
		mExitRegionListener = listener;
	}

	private void setOnChangeBeaconsInRangeListener(OnChangeBeaconsListener listener) {
		mChangeBeaconsInRangeListener = listener;
	}

	boolean isServiceEnabled() {
		BluetoothAdapter bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
		if (bluetoothAdapter == null) {
			mIsServiceEnabled = false;
		} else {
			mIsServiceEnabled = bluetoothAdapter.isEnabled() && isLocationServiceEnabled();
		}
		return mIsServiceEnabled;
	}

	boolean isRangingAvailable() {
		try {
			mIsRangingAvailable = mBeaconManager.checkAvailability();
		} catch (BleNotAvailableException ex) {
			Services.Log.error("Ranging Service not available:", ex);
			mIsRangingAvailable = false;
		}
		return mIsRangingAvailable;
	}

	boolean areProximityAlertsAvailable() {
		if (mAreProximityAlertsAvailable == null) {
			mAreProximityAlertsAvailable = true;
		}
		return mAreProximityAlertsAvailable;
	}

	int getAuthorizationStatus() {
		boolean authorizationStatus = isAuthorized() && isLocationServiceEnabled();
		if (authorizationStatus) return ApiAuthorizationStatus.AUTHORIZED;
		return ApiAuthorizationStatus.DENIED;
	}

	private boolean isAuthorized() {
		return ApiAuthorizationStatus.getStatus(mContext, REQUIRED_PERMISSIONS) == ApiAuthorizationStatus.AUTHORIZED;
	}

	@SuppressWarnings("deprecation")
	private static boolean isLocationServiceEnabled() {
		LocationManager aLocationManager = (LocationManager) MyApplication.getInstance().getSystemService(Context.LOCATION_SERVICE);
		return aLocationManager.isProviderEnabled(LocationManager.GPS_PROVIDER) || aLocationManager.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
	}

	boolean addProximityAlert(GxBeaconProximityAlert alert) {
		ArrayList<GxBeaconProximityAlert> alerts = new ArrayList<>();
		alerts.add(alert);
		return addProximityAlerts(alerts);
	}

	boolean addProximityAlerts(List<GxBeaconProximityAlert> alerts) {
		try {
			for (GxBeaconProximityAlert alert : alerts) {
				mProximityAlerts.addProximityAlert(alert);
				mBeaconManager.startMonitoringBeaconsInRegion(alert.getRegion().toRegion());
			}
			return true;
		} catch (RemoteException e) {
			return false;
		}
	}

	List<GxBeaconProximityAlert> getProximityAlerts() {
		return mProximityAlerts.getProximityAlerts();
	}

	void removeProximityAlert(String regionId) {
		try {
			mProximityAlerts.removeProximityAlert(regionId);
			mBeaconManager.stopMonitoringBeaconsInRegion(new Region(regionId, null, null, null));
			mRegionStates.remove(regionId);
		} catch (RemoteException ignored) {
		}
	}

	void clearProximityAlerts() {
		for (Region region : mBeaconManager.getMonitoredRegions())
			removeProximityAlert(region.getUniqueId());

		mProximityAlerts.clearProximityAlerts();
		mRegionStates.clear();
	}

	int getRegionState(String regionId) {
		Integer state = mRegionStates.get(regionId);
		if (state != null)
			return state;
		else
			return GxBeaconRegion.STATE_UNKNOWN;
	}

	boolean startRangingRegion(GxBeaconRegion region) {
		try {
			mBeaconManager.startRangingBeaconsInRegion(region.toRegion());
			return true;
		} catch (RemoteException e) {
			return false;
		}
	}

	void stopRangingRegion(String regionId) {
		try {
			Region region = new Region(regionId, null, null, null);
			mBeaconManager.stopRangingBeaconsInRegion(region);
		} catch (RemoteException ignored) {
		}
	}

	List<GxBeaconRegion> getRangedRegions() {
		return GxBeaconRegion.newCollection(mBeaconManager.getRangedRegions());
	}

	List<GxBeaconState> getBeaconsInRange(String regionId) {
		ArrayList<GxBeaconState> beacons = new ArrayList<>();

		if (Strings.hasValue(regionId))
			beacons.addAll(mCurrentBeacons.get(regionId));
		else
			beacons.addAll(mCurrentBeacons.values());

		return beacons;
	}

	boolean startAsBeacon(GxBeaconInfo beaconInfo) {
		return false;
	}

	boolean stopAsBeacon() {
		return false;
	}

	private final BeaconConsumer mBeaconConsumer = new BeaconConsumer() {
		@Override
		public void onBeaconServiceConnect() {
			// TODO Auto-generated method stub
		}

		@Override
		public Context getApplicationContext() {
			return mContext;
		}

		@Override
		public void unbindService(ServiceConnection connection) {
			mContext.unbindService(connection);
		}

		@Override
		public boolean bindService(Intent intent, ServiceConnection connection, int mode) {
			return mContext.bindService(intent, connection, mode);
		}
	};

	private final MonitorNotifier mMonitorNotifier = new MonitorNotifier() {
		@Override
		public void didEnterRegion(Region region) {
			GxBeaconProximityAlert alert = mProximityAlerts.getProximityAlert(region.getUniqueId());
			if (alert != null && alert.shouldNotifyOnEntry()) {
				if (mEnterRegionListener != null)
					mEnterRegionListener.onChangeRegion(new GxBeaconRegion(region));
			}
		}

		@Override
		public void didExitRegion(Region region) {
			GxBeaconProximityAlert alert = mProximityAlerts.getProximityAlert(region.getUniqueId());
			if (alert != null && alert.shouldNotifyOnExit()) {
				if (mExitRegionListener != null)
					mExitRegionListener.onChangeRegion(new GxBeaconRegion(region));
			}
		}

		@Override
		public void didDetermineStateForRegion(int state, Region region) {
			int gxState = GxBeaconRegion.STATE_UNKNOWN;
			if (state == MonitorNotifier.INSIDE)
				gxState = GxBeaconRegion.STATE_INSIDE;
			else if (state == MonitorNotifier.OUTSIDE)
				gxState = GxBeaconRegion.STATE_OUTSIDE;

			mRegionStates.put(region.getUniqueId(), gxState);
		}
	};

	private final RangeNotifier mRangeNotifier = new RangeNotifier() {
		@Override
		public void didRangeBeaconsInRegion(Collection<Beacon> beacons, Region region) {
			GxBeaconRegion gxRegion = new GxBeaconRegion(region);

			// Special case: Although the base API reports on every scan when ranging is enabled,
			// we DON'T fire events whenever we had 0 beacons in range and we still have 0.
			// This is done (according to the spec) to prevent "useless" events.
			if (beacons.size() == 0 && mCurrentBeacons.get(gxRegion.getId()).size() == 0)
				return;

			List<GxBeaconState> gxBeacons = GxBeaconState.newCollection(beacons);

			mCurrentBeacons.clear(gxRegion.getId());
			mCurrentBeacons.putAll(gxRegion.getId(), gxBeacons);

			if (mChangeBeaconsInRangeListener != null)
				mChangeBeaconsInRangeListener.onChangeBeacons(gxRegion, gxBeacons);
		}
	};

	interface OnChangeRegionListener {
		void onChangeRegion(GxBeaconRegion region);
	}

	interface OnChangeBeaconsListener {
		void onChangeBeacons(GxBeaconRegion region, List<GxBeaconState> beacons);
	}

	private void restoreSavedProximityAlerts() {
		List<GxBeaconProximityAlert> savedAlerts = mProximityAlerts.getProximityAlerts();
		addProximityAlerts(savedAlerts);
	}
}
