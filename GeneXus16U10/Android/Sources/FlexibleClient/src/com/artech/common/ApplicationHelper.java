package com.artech.common;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.IOUtils;
import org.apache.http.*;
import org.apache.http.client.methods.*;
import org.apache.http.impl.client.*;
import org.apache.http.params.*;
import org.json.JSONException;
import org.json.JSONObject;

import android.net.Uri;

import com.artech.base.metadata.GenexusApplication;
import com.artech.base.services.Services;

@SuppressWarnings("deprecation")
public class ApplicationHelper {
	private static final String TAG = "ApplicationHelper";

	/**
	 * Sends a HTTP request to retrieve the appid.json containing the name of the Knowledge Base and then compares it to the one stored in the app.
	 * @return true if all the steps succeed, false otherwise.
	 */
	public static boolean checkApplicationUri(GenexusApplication application, String appUrl) {
		InputStream inputStream = null;
		String result;

		try {
			DefaultHttpClient httpClient = new DefaultHttpClient(new BasicHttpParams());

			String url = Uri.withAppendedPath(Uri.parse(appUrl), "gxmetadata/appid.json").toString();

			HttpGet httpGet = new HttpGet(url);
			httpGet.setHeader("Content-type", "application/json");

			HttpResponse response = httpClient.execute(httpGet);
			StatusLine statusLine = response.getStatusLine();

			if (statusLine.getStatusCode() != 200) {
				return false;
			}

			HttpEntity entity = response.getEntity();
			inputStream = entity.getContent();

			BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8), 8);
			StringBuilder stringBuilder = new StringBuilder();

			String line;
			while ((line = reader.readLine()) != null)
				stringBuilder.append(line).append("\n");

			result = stringBuilder.toString();
		} catch (IOException e) {
			Services.Log.error(TAG, "Error while downloading appid.json from server.");
			return false;
		} finally {
			IOUtils.closeQuietly(inputStream);
		}

		String kbName;

		try {
			JSONObject jsonObject = new JSONObject(result);
			kbName = jsonObject.getString("id");
		} catch (JSONException e) {
			Services.Log.error(TAG, "Error while parsing the appid.json.");
			return false;
		}

		if (kbName == null || !kbName.equalsIgnoreCase(application.getName())) {
			Services.Log.error(TAG, "AppId names don't match.");
			return false;
		}

		return true;
	}
}
