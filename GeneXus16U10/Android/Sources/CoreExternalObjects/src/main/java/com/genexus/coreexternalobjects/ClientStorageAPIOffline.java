package com.genexus.coreexternalobjects;

import androidx.annotation.NonNull;

import com.artech.base.services.ClientStorage;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class ClientStorageAPIOffline {
	private static ClientStorage sStorage;

	@NonNull
	private static synchronized ClientStorage getStorage() {
		final String PREFERENCES_KEY = "ClientStorageApi";

		if (sStorage == null)
			sStorage = Services.Application.getClientStorage(PREFERENCES_KEY);

		return sStorage;
	}

	public static void set(String key, String value) {
		getStorage().putString(key, value);
	}

	public static void secureSet(String key, String value) {
		getStorage().putStringSecure(key, value);
	}

	public static String get(String key) {
		return getStorage().getString(key, Strings.EMPTY);
	}

	public static void remove(String key) {
		getStorage().remove(key);
	}

	public static void clear() {
		getStorage().clear();
	}
}
