package com.artech.common;

import java.util.Iterator;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.app.Activity;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Build;
import android.text.TextUtils;

import com.artech.R;
import com.artech.actions.Action;
import com.artech.actions.ActionExecution;
import com.artech.actions.ActionFactory;
import com.artech.actions.ActionParameters;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityHelper;
import com.artech.activities.IntentFactory;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.INotifications;
import com.artech.base.services.Services;
import com.artech.base.utils.PrimitiveUtils;
import com.artech.base.utils.Strings;
import com.artech.utils.Cast;

import androidx.annotation.DrawableRes;
import androidx.annotation.RequiresApi;
import androidx.core.app.NotificationCompat;
import androidx.core.content.ContextCompat;

public class NotificationsManager implements INotifications {
	private static final String DEFAULT_CHANNEL_ID = "default";
	private static final String DEFAULT_CHANNEL_NAME = "Default";
	private static final String DEFAULT_CHANNEL_DESCRIPTION = "Default Channel";
	private static final String LOW_CHANNEL_ID = "defaultLow";
	private static final String LOW_CHANNEL_NAME = "Low";
	private static final String LOW_CHANNEL_DESCRIPTION = "Low Importance Channel";
	private final Context mAppContext;
	private final GenexusApplication mGenexusApplication;
	private final NotificationManager mNotificationManager;

	public NotificationsManager(Context context, GenexusApplication genexusApplication) {
		mAppContext = context;
		mGenexusApplication = genexusApplication;
		mNotificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

		if (Build.VERSION.SDK_INT >= 26) {
			createChannelIfNotExists(DEFAULT_CHANNEL_ID, DEFAULT_CHANNEL_NAME, DEFAULT_CHANNEL_DESCRIPTION, NotificationManager.IMPORTANCE_DEFAULT);
			createChannelIfNotExists(LOW_CHANNEL_ID, LOW_CHANNEL_NAME, LOW_CHANNEL_DESCRIPTION, NotificationManager.IMPORTANCE_LOW);
		}
	}

	@RequiresApi(26)
	private void createChannelIfNotExists(String id, String name, String description, int importance) {
		NotificationChannel channelExists = mNotificationManager.getNotificationChannel(id);
		if (channelExists != null) {
			return;
		}

		NotificationChannel channel = new NotificationChannel(id, name, importance);
		channel.setDescription(description);
		mNotificationManager.createNotificationChannel(channel);
	}

	@Override
	public void handleNotification(String title, String content, String action, String parameters, String executionTime) {
		// 1 = OnNotificationArrive
		boolean isSilent = executionTime != null && executionTime.equalsIgnoreCase("1");

		if (Strings.hasValue(action) && isSilent) {
			executeNotificationAction(ActivityHelper.getCurrentActivity(), action, Strings.EMPTY);
		} else {
			Intent actionIntent = IntentFactory.createNotificationActionIntent(mAppContext, action, parameters);
			showNotification(-1, title, content, actionIntent);
		}
	}

	@Override
	public void showNotification(int id, String title, String content, Intent actionIntent) {
		if (TextUtils.isEmpty(title)) {
			title = mAppContext.getString(R.string.app_name);
		}

		PendingIntent pendingIntent = PendingIntent.getActivity(mAppContext, 0, actionIntent, PendingIntent.FLAG_UPDATE_CURRENT);

		NotificationCompat.Builder builder = new NotificationCompat.Builder(mAppContext, DEFAULT_CHANNEL_ID);

		builder.setSmallIcon(R.drawable.gx_notification_default);
		int customResourceId = Services.Resources.getResourceId("gx_notification_icon", "drawable");
		if (PrimitiveUtils.isNonZero(customResourceId))
			builder.setSmallIcon(customResourceId);

		int colorResId = mAppContext.getResources().getIdentifier("gx_colorPrimary", "color", mAppContext.getPackageName());
		if (colorResId != 0) {
			int color = ContextCompat.getColor(mAppContext, colorResId);
			builder.setColor(color);
			// Eventually we could also do something like: builder.setLights(color, onMs, offMs);
		}

		Notification notification = builder
			.setWhen(System.currentTimeMillis())
			.setContentTitle(title)
			.setContentText(content)
			.setContentIntent(pendingIntent)
			.setStyle(new NotificationCompat.BigTextStyle().bigText(content))
			.setDefaults(Notification.DEFAULT_ALL)
			.setAutoCancel(true)
			.build();

		if (id == -1) {
			SharedPreferences prefs = Services.Preferences.getAppSharedPreferences();
			id = prefs.getInt("notificationID", 0); // allow multiple notifications
			prefs.edit()
				.putInt("notificationID", ++id % 32)
				.apply();
		}

		mNotificationManager.notify(id, notification);
	}

	@Override
	public void showOngoingNotification(int id, String title, String content,
										@DrawableRes int drawableId, boolean showIndeterminateProgress) {
		Intent intentAction = IntentFactory.getStartupActivity(mAppContext);
		PendingIntent pendingIntent = PendingIntent.getActivity(mAppContext, 0, intentAction, PendingIntent.FLAG_UPDATE_CURRENT);

		NotificationCompat.Builder builder = new NotificationCompat.Builder(mAppContext, LOW_CHANNEL_ID)
			.setOngoing(true)
			.setAutoCancel(true)
			.setContentIntent(pendingIntent)
			.setContentText(content)
			.setSmallIcon(drawableId);

		if (showIndeterminateProgress) {
			builder.setProgress(0, 0, true);
		}

		mNotificationManager.notify(id, builder.build());
	}

	@Override
	public void closeOngoingNotification(int id) {
		mNotificationManager.cancel(id);
	}

	@Override
	public void executeNotificationAction(Activity activity, String notificationAction, String parameters) {
		IViewDefinition viewDefinition = mGenexusApplication.getMain();
		ActionDefinition action = viewDefinition.getEvent(notificationAction);
		if (action == null) {
			Services.Log.error("Failed to execute Notification Action: Action is null");
			return;
		}

		Entity entityParam = new Entity(StructureDefinition.EMPTY);
		IDataViewDefinition dataViewDef = Cast.as(IDataViewDefinition.class, viewDefinition);
		if (dataViewDef != null && dataViewDef.getMainDataSource() != null) {
			entityParam = new Entity(dataViewDef.getMainDataSource().getStructure());
		}
		entityParam.setExtraMembers(viewDefinition.getVariables());

		// Set parameters to entity.
		if (Services.Strings.hasValue(parameters)) {
			try {
				JSONObject jsonObject = null;

				try {
					JSONArray jsonArray = new JSONArray(parameters);
					jsonObject = jsonArray.getJSONObject(0);
				} catch (JSONException e) {
					Services.Log.debug("failed to read notificationParameters as JSONArray");
				}

				if (jsonObject == null)
					jsonObject = new JSONObject(parameters);

				Iterator<?> it = jsonObject.keys();
				while (it.hasNext()) {
					String key = (String) it.next();
					String value = jsonObject.getString(key);
					entityParam.setProperty(key, value);
				}
			} catch (JSONException e) {
			}
		}

		UIContext uiContext = UIContext.base(activity, viewDefinition.getConnectivitySupport());

		Action doAction = ActionFactory.getAction(uiContext, action, new ActionParameters(entityParam));
		ActionExecution exec = new ActionExecution(doAction);
		exec.executeAction();
	}
}
