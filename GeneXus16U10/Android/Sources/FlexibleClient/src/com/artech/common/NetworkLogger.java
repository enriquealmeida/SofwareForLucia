package com.artech.common;

import java.io.IOException;
import java.net.HttpURLConnection;

import org.apache.http.*;
import org.apache.http.client.methods.*;
import org.apache.http.entity.*;
import org.apache.http.protocol.*;
import org.apache.http.util.*;
import org.json.JSONException;
import org.json.JSONObject;

import com.artech.base.services.LogCategory;
import com.artech.base.services.LogLevel;
import com.artech.base.services.Services;

@SuppressWarnings("deprecation")
class NetworkLogger
{
	private static final String LOG_TAG = "Genexus-HTTP";

	static void logRequest(HttpUriRequest request)
	{
		int logLevel = Services.Log.getLevel(LogCategory.DATA_HTTP);

		if (logLevel >= LogLevel.INFO)
		{
			String uri = request.getURI().toString();
			String method = request.getMethod();

			if (logLevel >= LogLevel.DEBUG)
			{
				// Detailed logging
				try
				{
					JSONObject jsonRequest = new JSONObject();
					jsonRequest.put("url", uri);
					jsonRequest.put("method", method);

					// Headers
					addHeaders(jsonRequest, request.getAllHeaders());

					// Body
					if (request instanceof HttpEntityEnclosingRequest)
					{
						try
						{
							HttpEntity entity = ((HttpEntityEnclosingRequest)request).getEntity();
							if (entity instanceof StringEntity)
							{
								// Since entities of other classes (in particular InputStreamEntity) might not be repeatable-readable,
								// calling toString() may "break" them. For safety, only do this for StringEntity.
								jsonRequest.put("body", EntityUtils.toString(entity, HTTP.UTF_8));
							}
							else
								jsonRequest.put("body", (entity != null ? String.format("<STREAM::%s>", entity.getClass().getSimpleName()) : "<NULL>"));
						}
						catch (ParseException | IOException ignored) { }
					}

					log("request", jsonRequest, false);
				}
				catch (JSONException ignored) { }
			}
			else
			{
				// Just log request URL.
				log(String.format("Request (%s) to %s ", method, uri), false);
			}
		}
	}

	static void logResponse(HttpUriRequest request, GxHttpResponse response)
	{
		int logLevel = Services.Log.getLevel(LogCategory.DATA_HTTP);

		if (logLevel >= LogLevel.INFO)
		{
			String uri = request.getURI().toString();
			int statusCode = response.getStatusLine().getStatusCode();

			if (logLevel >= LogLevel.DEBUG)
			{
				// Detailed logging
				try
				{
					JSONObject jsonResponse = new JSONObject();
					jsonResponse.put("url", uri);
					jsonResponse.put("statusCode", statusCode);

					// Headers
					addHeaders(jsonResponse, response.getAllHeaders());

					try
					{
						// Body
						HttpEntity entity = response.getEntity();
						jsonResponse.put("bytes", entity.getContentLength());
						jsonResponse.put("data", EntityUtils.toString(entity, HTTP.UTF_8));
					}
					catch (ParseException | IOException ignored) { }

					log("response", jsonResponse, isHttpError(statusCode));
				}
				catch (JSONException ignored) { }
			}
			else
			{
				// Just log request URL.
				log(String.format("Response (%s) from %s", statusCode, uri), isHttpError(statusCode));
			}
		}
	}

	static void logException(HttpUriRequest request, IOException exception)
	{
		int logLevel = Services.Log.getLevel(LogCategory.DATA_HTTP);

		if (logLevel >= LogLevel.ERROR)
		{
			String uri = request.getURI().toString();
			String exceptionClass = exception.getClass().getName();

			if (logLevel >= LogLevel.DEBUG)
			{
				// Detailed logging
				try
				{
					JSONObject jsonException = new JSONObject();
					jsonException.put("url", request.getURI().toString());

					// Exception detail.
					JSONObject jsonError = new JSONObject();
					jsonError.put("class", exceptionClass);
					jsonError.put("message", exception.getMessage());
					jsonException.put("error", jsonError);

					jsonException.put("localizedDescription", exception.getLocalizedMessage());

					log("requestFail", jsonException, true);
				}
				catch (JSONException ignored) { }
			}
			else
			{
				String logMessage = String.format("Error (%s) from %s", exceptionClass, uri);
				Services.Log.error(LogCategory.DATA_HTTP, LOG_TAG, logMessage, exception);
			}
		}
	}

	/**
	 * Returns true if the NetworkLogger will ready the Entity associated to the request or
	 * response. In that case, we need an entity that can be read twice (i.e. buffered).
	 */
	static boolean needsBufferedEntity()
	{
		return (Services.Log.getLevel(LogCategory.DATA_HTTP) >= LogLevel.DEBUG);
	}

	private static void log(String name, JSONObject entry, boolean isError)
	{
		try
		{
			JSONObject enclosing = new JSONObject();
			enclosing.put(name, entry);
			log(enclosing.toString(), isError);
		}
		catch (JSONException ignored) { }
	}

	private static void log(String text, boolean isError)
	{
		if (isError)
			Services.Log.error(LogCategory.DATA_HTTP, LOG_TAG, text);
		else
			Services.Log.debug(LogCategory.DATA_HTTP, LOG_TAG, text);
	}

	private static void addHeaders(JSONObject entry, Header[] headers) throws JSONException
	{
		// Headers
		JSONObject jsonHeaders = new JSONObject();
		for (Header header : headers)
			jsonHeaders.put(header.getName(), header.getValue());

		entry.put("headers", jsonHeaders);
	}

	private static boolean isHttpError(int statusCode)
	{
		// Take anything as "unexpected" except for the following "normal" statuses.
		return !(statusCode == HttpURLConnection.HTTP_OK ||
				 statusCode == HttpURLConnection.HTTP_CREATED ||
				 statusCode == HttpURLConnection.HTTP_NOT_MODIFIED ||
				 statusCode == HttpURLConnection.HTTP_SEE_OTHER);
	}
}
