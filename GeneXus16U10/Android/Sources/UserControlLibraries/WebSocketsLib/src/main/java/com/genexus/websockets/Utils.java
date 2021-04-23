package com.genexus.websockets;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import android.app.Activity;
import android.content.Intent;

import com.artech.actions.ExternalObjectEvent;
import com.artech.activities.ActivityHelper;
import com.artech.activities.IGxActivity;
import com.artech.android.device.ClientInformation;
import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.services.Services;
import com.artech.base.services.UrlBuilder;
import com.artech.fragments.IDataView;
import com.artech.fragments.LayoutFragment;

import androidx.localbroadcastmanager.content.LocalBroadcastManager;

class Utils {
	public static String getDefaultWebSocketsUrl(GenexusApplication app) {
		String baseUrl = app.getAPIUri();
		String serverType = app.getServerType() == UrlBuilder.NET_SERVER ? ".svc" : "";
		String deviceUUID = ClientInformation.id();

		return String.format(Locale.US, "%sgxwebsocket%s?%s",
				baseUrl,
				serverType,
				deviceUUID
		);
	}

	public static boolean isMainComponentPresent(IGxActivity activity) {
		boolean isMainPresent = false;

		IViewDefinition mainDefinition = MyApplication.getApp().getMain();
		for (IDataView dataView : activity.getDataViews()) {
			if (dataView.getDefinition() == mainDefinition) {
				isMainPresent = true;
				break;
			}
		}

		return isMainPresent;
	}

	public static void fireEvent(String objectName, String eventName, Object... eventArgs) {
		List<Object> args = Arrays.asList(eventArgs);

		notifyCurrentActivity(objectName, eventName, args);
		notifyMainActivityIfNeeded(objectName, eventName, args);
	}

	private static void notifyCurrentActivity(String objectName, String eventName, List<Object> args) {
		// the code bellow do the same as EventDispatcher.fireEvent , but now use a queue for message received instead

		Intent intent = new Intent(LayoutFragment.GENEXUS_EVENTS);
		intent.putExtra("__GxAction", objectName + "." + eventName);

		int i = 0;
		for (Object arg : args) {
			intent.putExtra(String.valueOf(i), String.valueOf(arg));
			i++;
		}

		Services.Log.debug("pre sendBroadcast: " + eventName + intent.getExtras().toString());

		// try doing a queue for message receive event
		if (eventName.equalsIgnoreCase(WebSocketClient.EVENT_MESSAGE_RECEIVED))
		{
			ProcessMessagesHelper messagesHelper = ProcessMessagesHelper.getInstance(objectName + "." + eventName);
			// always use message queue for message receive.
			// enqueue event
			Services.Log.debug("event enqueue " + eventName);
			messagesHelper.enQueue(intent);
			// launch processing, raise when other pending events are done or immediately if empty.
			Services.Log.debug("start messagesAsyncTask.execute ");
			messagesHelper.startProcess();
		}
		else
		{
			Services.Log.debug("start normal sendBroadcast " + eventName);
			LocalBroadcastManager.getInstance(MyApplication.getAppContext()).sendBroadcast(intent);
		}
	}

	/**
	 * Notifies the main activity if it's not the current activity (i.e. it does not contain a
	 * main component).
	 */
	private static void notifyMainActivityIfNeeded(String objectName, String eventName, List<Object> args) {
		Activity activity = ActivityHelper.getCurrentActivity();
		if (activity instanceof IGxActivity && !isMainComponentPresent((IGxActivity) activity)) {
			notifyMainActivity(objectName, eventName, args);
		}
	}

	private static void notifyMainActivity(String objectName, String eventName, List<Object> args) {
		ExternalObjectEvent event = new ExternalObjectEvent(
				objectName,
				eventName
		);
		event.fire(args);
	}

	public static boolean hasAnyEventDeclared(IViewDefinition viewDefinition) {
		return viewDefinition != null && (
				viewDefinition.getEvent(WebSocketClient.OBJECT_NAME + "." + WebSocketClient.EVENT_CONNECTED) != null ||
				viewDefinition.getEvent(WebSocketClient.OBJECT_NAME + "." + WebSocketClient.EVENT_CONNECTION_FAILED) != null ||
				viewDefinition.getEvent(WebSocketClient.OBJECT_NAME + "." + WebSocketClient.EVENT_MESSAGE_RECEIVED) != null
		);
	}
}
