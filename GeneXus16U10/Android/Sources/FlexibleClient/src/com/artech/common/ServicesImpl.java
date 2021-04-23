package com.artech.common;

import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.services.Services;
import com.artech.base.synchronization.SynchronizationHelper;

public class ServicesImpl {

	public static void connectServices(MyApplication myApplicationInstance,
									   GenexusApplication genexusApplication) {
		Services.Application = myApplicationInstance;
		Services.Device = new DeviceHelper(myApplicationInstance);
		Services.Exceptions = new ExceptionManager();
		Services.HttpService = new ServiceHelper(myApplicationInstance, genexusApplication);
		Services.Images = new ImageHelper();
		Services.Language = new LanguageManager(myApplicationInstance);
		Services.Log = new LogManager();
		Services.Messages = new MessagesHelper(myApplicationInstance);
		Services.Notifications = new NotificationsManager(myApplicationInstance, genexusApplication);
		Services.Preferences = new PreferencesHelper(myApplicationInstance);
		Services.Resources = new ResourcesManager(myApplicationInstance);
		Services.Serializer = new SerializationHelper(myApplicationInstance);
		Services.Strings = new StringUtil(myApplicationInstance);
		Services.Sync = new SynchronizationHelper(myApplicationInstance, genexusApplication);
		Services.Themes = new ThemesManager();
		Services.Extensions = new ExtensionsManager();
	}
}
