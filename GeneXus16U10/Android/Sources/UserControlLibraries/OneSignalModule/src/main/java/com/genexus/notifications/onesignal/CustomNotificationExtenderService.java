package com.genexus.notifications.onesignal;

import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.onesignal.NotificationExtenderService;
import com.onesignal.OSNotificationReceivedResult;

import org.json.JSONObject;

public class CustomNotificationExtenderService extends NotificationExtenderService {

	@Override
	protected boolean onNotificationProcessing(OSNotificationReceivedResult notification) {
		String title = notification.payload.title;
		String content = notification.payload.body;
		JSONObject data = notification.payload.additionalData;

		if (data == null) {
			return false;
		}

		JSONObject dataToProcess = ParsingUtils.parseDefaultAction(data);

		String action = dataToProcess != null ? ParsingUtils.parseAction(dataToProcess) : Strings.EMPTY;
		String parameters = dataToProcess != null ? ParsingUtils.parseParameters(dataToProcess) : Strings.EMPTY;
		String executionTime = dataToProcess != null ? ParsingUtils.parseExecutionTime(dataToProcess) : Strings.EMPTY;

		Services.Notifications.handleNotification(title, content, action, parameters, executionTime);

		return true;
	}
}
