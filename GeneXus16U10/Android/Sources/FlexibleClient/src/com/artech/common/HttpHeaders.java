package com.artech.common;

import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.LinkedHashMap;

import org.apache.http.client.methods.*;

import com.artech.android.LocaleHelper;
import com.artech.android.device.ClientInformation;
import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

@SuppressWarnings({"deprecation", "InconsistentCapitalization"})
public class HttpHeaders
{
	// Genexus headers
	public static final String GENEXUS_LANGUAGE = "GeneXus-Language";
	public static final String GENEXUS_AGENT = "GeneXus-Agent";
	public static final String GENEXUS_THEME = "GeneXus-Theme";
	public static final String GENEXUS_TIMEZONE = "GxTZOffset";
	public static final String GENEXUS_SYNC_VERSION = "GXSynchronizerVersion";
	public static final String GENEXUS_APP_IDENTIFIER = "GXApplicationIdentifier";

	// Device headers
	public static final String DEVICE_OS_NAME = "DeviceOSName";
	public static final String DEVICE_OS_VERSION = "DeviceOSVersion";
	public static final String DEVICE_ID = "DeviceId";
	public static final String DEVICE_NAME = "DeviceName";
	public static final String DEVICE_PLATFORM = "DevicePlatform";
	public static final String DEVICE_TYPE = "DeviceType";
	public static final String DEVICE_APPVERSIONCODE = "GXAppVersionCode";
	public static final String DEVICE_APPVERSIONNAME = "GXAppVersionName";
	public static final String DEVICE_APPID = "GXApplicationId";

	// Standard headers
	public static final String ACCEPT_LANGUAGE = "Accept-Language";
	public static final String IF_MODIFIED_SINCE = "If-Modified-Since";
	public static final String AUTHORIZATION = "Authorization";

	private static String sToken = Strings.EMPTY;

	// need to use from STD classes.
	public static HashMap<String, String> getSecurityHeaders() {
		HashMap<String, String> headers = new LinkedHashMap<>();
		if (sToken != null && sToken.length() != 0)
			headers.put(AUTHORIZATION, "OAuth " + sToken);
		return headers;
	}

	// need to use from STD classes.
	public static HashMap<String, String> getMobileHeaders() {
		HashMap<String, String> headers = new LinkedHashMap<>();
		String language = Services.Language.getCurrentLanguage();
		if (language != null)
			headers.put(GENEXUS_LANGUAGE, language);
		String themeName = Services.Themes.getCurrentThemeName();
		if (themeName != null)
			headers.put(GENEXUS_THEME, themeName);
		headers.put(GENEXUS_AGENT, "SmartDevice Application");
		headers.put(ACCEPT_LANGUAGE, LocaleHelper.getLocaleString(Services.Device.getLocales()));
		headers.put(GENEXUS_TIMEZONE, StringUtil.timeZoneOffsetID());
		headers.putAll(getClientInformationHeaders());
		return headers;
	}

	public static HashMap<String, String> getClientInformationHeaders() {
		HashMap<String, String> headers = new LinkedHashMap<>();
		headers.put(DEVICE_OS_NAME, ClientInformation.osName());
		headers.put(DEVICE_OS_VERSION, ClientInformation.osVersion());
		headers.put(DEVICE_ID, ClientInformation.id());
		headers.put(DEVICE_NAME, ClientInformation.deviceName());
		headers.put(DEVICE_PLATFORM, ClientInformation.getPlatformName());
		headers.put(DEVICE_TYPE, String.valueOf(ClientInformation.deviceType()));
		headers.put(DEVICE_APPVERSIONCODE, ClientInformation.getAppVersionCode());
		headers.put(DEVICE_APPVERSIONNAME, ClientInformation.getAppVersionName());
		headers.put(DEVICE_APPID, ClientInformation.applicationId());
		return headers;
	}

	private static void addHeadersToHttpBase(HashMap<String, String> headers, HttpRequestBase httpBase) {
		for (String key : headers.keySet()) {
			httpBase.setHeader(key, headers.get(key));
		}
	}

	public static void addSecurityHeaders(final HttpRequestBase httpBase) {
		addHeadersToHttpBase(getSecurityHeaders(), httpBase);
	}

	public static void addMobileHeaders(final HttpRequestBase httpBase) {
		addHeadersToHttpBase(getMobileHeaders(), httpBase);
	}

	// need to use from STD classes.
	public static void addSDHeader(String host, String baseUrl,	Hashtable<String, String> headerToSend) {
		URI uri;
		try {
			uri = new URI(MyApplication.getApp().UriMaker.getRootUrl());

			// if are the same app root, add headers
			if (Services.Strings.hasValue(host) && Services.Strings.hasValue(baseUrl) &&
					host.equalsIgnoreCase(uri.getHost()) && baseUrl.startsWith(uri.getPath())) {
				headerToSend.putAll(getSecurityHeaders());
				headerToSend.putAll(getMobileHeaders());
			}
		} catch (URISyntaxException e) {
		}
	}

	public static String getToken()
	{
		return sToken;
	}

	public static void setToken(String token)
	{
		sToken = token.trim();
	}
}
