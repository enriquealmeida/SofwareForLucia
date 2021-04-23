package com.artech.base.metadata.loader;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import android.content.Context;
import android.content.SharedPreferences;

import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.base.utils.Version;

public abstract class MetadataLoader {
	private static final int GUID_LENGTH = 36;
	private static final String GUID_REGEX = "[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}";

	public static String getPrefsName(GenexusApplication application) {
		return "Metadata-" + application.getName() + "-" + application.getAppEntry() + "-";
	}

	private static InputStream getFromResources(Context context, String data) {
		int resId = context.getResources().getIdentifier(data, "raw", context.getPackageName());
		return resId != 0 ? context.getResources().openRawResource(resId) : null;
	}

	public static String getObjectName(String guidName) {
		return getAttributeName(guidName);
	}

	public static String getObjectType(String guidName) {
		if (hasGuidPrefix(guidName))
			return guidName.substring(0, GUID_LENGTH);
		else
			return Strings.EMPTY;
	}

	public static String getAttributeName(String guidName) {
		if (hasGuidPrefix(guidName))
			return guidName.substring(GUID_LENGTH + 1);
		else
			return guidName;
	}

	private static boolean hasGuidPrefix(String str) {
		return (str != null && str.length() > 36 && Strings.toLowerCase(str.substring(0, 36)).matches(GUID_REGEX));
	}

	public abstract IPatternMetadata load(Context context, String metadata);

	public static long getLocalVersion(Context context) {
		InputStream stream = getFromResources(context, "gxversion");
		String dataInfo = Services.Strings.convertStreamToString(stream);

		if (Services.Strings.hasValue(dataInfo)) {
			INodeObject obj = Services.Serializer.createNode(dataInfo);
			if (obj != null)
				return Services.Strings.valueOf(obj.optString("version"));
		}
		return -1;
	}

	public static boolean hasAppIdInRaw(Context context) {
		int resId = context.getResources().getIdentifier("appid", "raw", context.getPackageName());
		return resId != 0;
	}

	public static INodeObject getDefinition(Context context, String data) {
		GenexusApplication app = MyApplication.getApp();

		// Check if the local metadata version is older than the remote version
		// if it is older so we have to try to load the remote version.
		// This could fail due to connectivity problems so that we have to be defensive
		// and try to load the local version if something goes wrong.
		String dataFile = app.getName() + data;

		// get last downloaded zip version.
		SharedPreferences prefs = context.getSharedPreferences(MetadataLoader.getPrefsName(app), 0);
		String currentDownloadVersion = prefs.getString("DOWNLOADED_ZIP_VERSION", "");

		Version downloadedVersion = new Version(currentDownloadVersion);
		Version currentVersion = new Version(app.getMajorVersion() + "." + app.getMinorVersion());

		// Try to get previously downloaded resource.
		InputStream stream = app.shouldReadMetadataFromResources()
			? getFromResources(context, Strings.toLowerCase(data).replace('.', '_'))
			: null;

		try {
			// get the files from greater version, raw or zip
			if (downloadedVersion.isGreaterThan(currentVersion)) {
				// read from previous downloaded file
				if (stream == null) {
					stream = context.openFileInput(dataFile);
				}
				//	defensing programming, if all fails read from raw
				if (stream == null)
					stream = getFromResources(context, Strings.toLowerCase(data).replace('.', '_'));
			} else {
				// read from raw
				if (stream == null)
					stream = getFromResources(context, Strings.toLowerCase(data).replace('.', '_'));
				// defensing programming, if all fails read from previous downloaded file
				if (stream == null) {
					stream = context.openFileInput(dataFile);
				}
			}

			String dataInfo = Services.Strings.convertStreamToString(stream);

			return Strings.hasValue(dataInfo) ? Services.Serializer.createNode(dataInfo) : null;
		} catch (FileNotFoundException e) {
			Services.Log.warning("MetadataLoader", "File not found: " + dataFile);
			return null;
		} finally {
			if (stream != null) {
				try {
					stream.close();
				} catch (IOException ex) {
					Services.Log.warning("MetadataLoader", ex.getMessage());
				}
			}
		}
	}
}
