package com.artech.common;

import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.zip.GZIPInputStream;

import org.apache.commons.io.IOUtils;
import org.apache.http.*;
import org.apache.http.client.*;
import org.apache.http.client.entity.*;
import org.apache.http.client.methods.*;
import org.apache.http.client.params.*;
import org.apache.http.conn.*;
import org.apache.http.conn.params.*;
import org.apache.http.conn.scheme.*;
import org.apache.http.entity.*;
import org.apache.http.impl.client.*;
import org.apache.http.impl.conn.tsccm.*;
import org.apache.http.message.*;
import org.apache.http.params.*;
import org.apache.http.protocol.*;
import org.apache.http.util.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.Uri;
import android.os.Build;
import android.util.Pair;

import com.artech.R;
import com.artech.android.DebugService;
import com.artech.android.json.NodeObject;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.loader.RemoteApplicationInfo;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.IHttpService;
import com.artech.base.services.ServiceResponse;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

import static android.net.NetworkCapabilities.NET_CAPABILITY_NOT_ROAMING;

@SuppressWarnings("deprecation")
class ServiceHelper implements IHttpService {
	private static final String CONTENT_TYPE_JSON = "application/json";
	private static final int DEFAULT_CONNECTION_TIMEOUT = 5000; // 5 seconds
	private static final int DEFAULT_SOCKET_TIMEOUT = 60000; // 60 seconds.

	private final Context mAppContext;
	private final GenexusApplication mGenexusApplication;
	private DefaultHttpClient mHttpClient;

	public ServiceHelper(Context appContext, GenexusApplication genexusApplication) {
		mAppContext = appContext;
		mGenexusApplication = genexusApplication;
	}

	private DefaultHttpClient initHttpClient() {
		DefaultHttpClient client;

		DefaultHttpClient tmpClient = new DefaultHttpClient();
		ClientConnectionManager mgr = tmpClient.getConnectionManager();
		HttpParams params = tmpClient.getParams();

		// Default parameters are: max 20, max per route 2.
		// Increase both so that we can call our services with greater parallelism.
		ConnManagerParams.setMaxTotalConnections(params, 40);
		ConnManagerParams.setMaxConnectionsPerRoute(params, new ConnPerRouteBean(5));

		client = new DefaultHttpClient(new ThreadSafeClientConnManager(params, mgr.getSchemeRegistry()), params);

		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.M) {
			SchemeRegistry schemeRegistry = client.getConnectionManager().getSchemeRegistry();
			schemeRegistry.register(new Scheme("https", new TlsSniSocketFactory(), 443));
		}

		// network security config works in N or above, use custom verifier bellow N
		if ( Build.VERSION.SDK_INT < Build.VERSION_CODES.N)
		{
			if (PinningHostnameVerifier.getPinSet().length>0)
				PinningHostnameVerifier.registerVerifier(client);
		}

		// Set timeouts.
		// Connection Timeout - timeout in milliseconds until a connection is established.
		// Socket Timeout - timeout in milliseconds while waiting for the server to send data.
		HttpParams httpParameters = client.getParams();
		HttpConnectionParams.setConnectionTimeout(httpParameters, DEFAULT_CONNECTION_TIMEOUT);
		HttpConnectionParams.setSoTimeout(httpParameters, DEFAULT_SOCKET_TIMEOUT);

		enableCompression(client);

		return client;
	}

	@Override
	public JSONArray getJSONArrayFromUrl(String url) {
		ServiceDataResult result = getData(url, null, false);
		if (result.isOk() && result.getData().length() != 0)
			return result.getData();

		return null;
	}

	@Override
	public JSONObject getJSONFromUrl(String url) {
		ServiceDataResult result = getData(url, null, false);
		if (result.isOk() && result.getData().length() != 0) {
			try {
				return result.getData().getJSONObject(0);
			} catch (JSONException e) {
				// Should never happen, or isOk() would have returned false.
				return null;
			}
		} else
			return null;
	}

	@Override
	public ServiceDataResult getEntityDataBC(String type, List<String> keys) {
		String url = mGenexusApplication.UriMaker.getOneBCUrl(type, keys);
		return getData(url, null, false);
	}

	@Override
	public ServiceDataResult getDataFromProvider(String uri, Date ifModifiedSince, boolean isCollection) {
		if (!Services.HttpService.isOnline()) {
			String message = Services.Strings.getResource(R.string.GXM_NoInternetConnection);
			return ServiceDataResult.error(DataRequest.ERROR_NETWORK, message);
		}

		return getData(uri, ifModifiedSince, isCollection);
	}

	@Override
	public void downloadAndExtractMetadata(Context context) {
		String appMetadata = mGenexusApplication.UriMaker.getApplicationMetadataUrl(mGenexusApplication.getAppEntry());
		Services.Log.debug(String.format("Downloading '%s'.", appMetadata));
		InputStream stream = getInputStreamFromUrl(appMetadata);

		// If the app package is not there, also try the "old" package containing everything.
		if (stream == null) {
			appMetadata = mGenexusApplication.UriMaker.getApplicationMetadataUrl("app");
			Services.Log.debug(String.format("Downloading '%s'.", appMetadata));
			stream = getInputStreamFromUrl(appMetadata);
		}

		if (stream == null) {
			return;
		}

		try {
			ZipHelper zipper = new ZipHelper(stream);
			zipper.unzip(context, mGenexusApplication);
		} finally {
			IOUtils.closeQuietly(stream);
		}
	}

	private InputStream getInputStreamFromUrl(String url) {
		try {
			URL fileUrl = new URL(url);
			URLConnection urlConnection = fileUrl.openConnection();
			return urlConnection.getInputStream();
		} catch (IOException e) {
			Services.Log.error(e);
			return null;
		}
	}

	private static ServiceDataResult getData(String uri, Date ifModifiedSince, boolean parseList) {
		return getData(uri, ifModifiedSince, parseList, false);
	}

	private static ServiceDataResult getData(String uri, Date ifModifiedSince, boolean parseList,
											 boolean isRetryAttempt) {
		final HttpClient client = Services.HttpService.getThreadSafeClient();
		final HttpGet get = new HttpGet(uri);

		HttpHeaders.addSecurityHeaders(get);
		HttpHeaders.addMobileHeaders(get);

		if (ifModifiedSince != null)
			get.setHeader(HttpHeaders.IF_MODIFIED_SINCE, StringUtil.dateToHttpFormat(ifModifiedSince));

		try {
			NetworkLogger.logRequest(get);
			DebugService.onHttpRequest(get);

			GxHttpResponse response = new GxHttpResponse(client.execute(get));
			NetworkLogger.logResponse(get, response);

			ServiceDataResult result = new ServiceDataResult(get, response, parseList);

			// Retry if it's a recoverable error (e.g. token expired but successfully renewed).
			if (!isRetryAttempt && shouldRetryRequest(result.getErrorType()))
				return getData(uri, ifModifiedSince, parseList, true);

			return result;
		} catch (IOException ex) {
			get.abort();
			NetworkLogger.logException(get, ex);
			return ServiceDataResult.networkError(ex);
		}
	}

	private static boolean shouldRetryRequest(int responseCode) {
		// In case we get an authentication error, see if it can be resolved without
		// asking for user name & password, and in that case signal to repeat the query.
		//noinspection SimplifiableIfStatement
		if (responseCode == DataRequest.ERROR_SECURITY_AUTHENTICATION)
			return SecurityHelper.tryAutomaticLogin();

		return false;
	}

	@Override
	public ServiceResponse insertEntityData(String type, List<String> key, INodeObject node) {
		JSONObject json = ((NodeObject) node).getInner();
		String url = mGenexusApplication.UriMaker.getOneBCUrl(type, key);
		try {
			return postJson(url, json);
		} catch (IOException e) {
			return new ServiceResponse(e);
		}
	}

	@Override
	public ServiceResponse insertOrUpdateEntityData(String type, List<String> key, INodeObject node) {
		JSONObject json = ((NodeObject) node).getInner();
		String url = mGenexusApplication.UriMaker.getOneBCUrl(type, key, "insertorupdate=true");
		try {
			return postJson(url, json);
		} catch (IOException e) {
			return new ServiceResponse(e);
		}
	}

	@Override
	public ServiceResponse updateEntityData(String type, List<String> key, INodeObject node) {
		JSONObject json = ((NodeObject) node).getInner();
		String url = mGenexusApplication.UriMaker.getOneBCUrl(type, key);
		try {
			return putJson(url, json);
		} catch (IOException e) {
			return new ServiceResponse(e);
		}
	}

	@Override
	public ServiceResponse deleteEntityData(String type, List<String> key) {
		String url = mGenexusApplication.UriMaker.getOneBCUrl(type, key);
		try {
			return delete(url);
		} catch (IOException e) {
			return new ServiceResponse(e);
		}
	}

	@Override
	public DefaultHttpClient getThreadSafeClient() {
		if (mHttpClient == null) {
			mHttpClient = initHttpClient();
		}
		return mHttpClient;
	}

	private void setClientSoTimeout(int timeout) {
		if (timeout >= 0) {
			HttpParams httpParameters = mHttpClient.getParams();
			// Set the default socket timeout (SO_TIMEOUT)
			// in milliseconds which is the timeout for waiting for data.
			int timeoutSocket = timeout;
			HttpConnectionParams.setSoTimeout(httpParameters, timeoutSocket);
		}
	}

	private static void enableCompression(DefaultHttpClient client) {
		final String HEADER_ACCEPT_ENCODING = "Accept-Encoding";
		final String ENCODING_GZIP = "gzip";

		client.addRequestInterceptor(new HttpRequestInterceptor() {
			@Override
			public void process(HttpRequest request, HttpContext context) {
				// Add header to accept gzip content
				if (!request.containsHeader(HEADER_ACCEPT_ENCODING))
					request.setHeader(HEADER_ACCEPT_ENCODING, ENCODING_GZIP);
			}
		});

		client.addResponseInterceptor(new HttpResponseInterceptor() {
			@Override
			public void process(HttpResponse response, HttpContext context) {
				// Inflate any responses compressed with gzip.
				final HttpEntity entity = response.getEntity();

				// Ignore null entity (e.g. 304 response) or Content-Length=0 because it causes GZIPInputStream to throw an exception.
				// (according to the docs Content-Length can be zero ONLY if the response is empty, an unknown size should be negative).
				// In both of those cases keep the original Entity object, otherwise add a decompressor in the middle.
				if (entity != null && entity.getContentLength() != 0) {
					final Header encoding = entity.getContentEncoding();
					if (encoding != null) {
						for (HeaderElement element : encoding.getElements()) {
							if (element.getName().equalsIgnoreCase(ENCODING_GZIP)) {
								response.setEntity(new InflatingEntity(response.getEntity()));
								break;
							}
						}
					}
				}
			}
		});
	}

	private static class InflatingEntity extends HttpEntityWrapper {
		InflatingEntity(HttpEntity wrapped) {
			super(wrapped);
		}

		@Override
		public InputStream getContent() throws IOException {
			return new GZIPInputStream(wrappedEntity.getContent());
		}

		@Override
		public long getContentLength() {
			return -1;
		}
	}

	@Override
	public ServiceResponse uploadInputStreamToServer(String url, InputStream data, long dataLength, String mimeType, IProgressListener listener) {
		final HttpClient client = getThreadSafeClient();

		ProgressInputStreamEntity entity = new ProgressInputStreamEntity(data, dataLength, listener);
		entity.setContentType(mimeType);

		final HttpPost httpPost = new HttpPost(url);
		HttpHeaders.addMobileHeaders(httpPost);
		HttpHeaders.addSecurityHeaders(httpPost);
		httpPost.setEntity(entity);

		try {
			NetworkLogger.logRequest(httpPost);
			DebugService.onHttpRequest(httpPost);

			GxHttpResponse response = new GxHttpResponse(client.execute(httpPost));
			NetworkLogger.logResponse(httpPost, response);

			return responseToServiceResponse(httpPost, response.getEntity(), response, true);
		} catch (IOException e) {
			NetworkLogger.logException(httpPost, e);
			return new ServiceResponse(e);
		} finally {
			IOUtils.closeQuietly(data);
		}
	}

	@Override
	public ServiceResponse postJsonSyncResponse(String url, JSONArray jsonArray, String syncVersion) throws IOException {
		HttpPost post = new HttpPost(url);
		post.setHeader(HttpHeaders.GENEXUS_SYNC_VERSION, syncVersion);
		post.setHeader(HttpHeaders.GENEXUS_APP_IDENTIFIER, mAppContext.getPackageName());

		// set timeout
		if (mGenexusApplication.getSynchronizerTimeoutReceive() > 0) {
			int timeoutSeconds = (int) mGenexusApplication.getSynchronizerTimeoutReceive() * 1000;
			setClientSoTimeout(timeoutSeconds);
		}

		ServiceResponse response = null;
		try {
			response = doServerRequest(post, jsonArray.toString(), false);
		}  finally {
			if (mGenexusApplication.getSynchronizerTimeoutReceive() > 0) {
				//restore timeout
				setClientSoTimeout(DEFAULT_SOCKET_TIMEOUT);
			}
		}

		return response;
	}

	@Override
	public ServiceResponse postJsonSyncReplicator(String url, JSONObject jsonObject) throws IOException {
		// set timeout
		if (mGenexusApplication.getSynchronizerTimeoutSend() > 0) {
			int timeoutSeconds = (int) mGenexusApplication.getSynchronizerTimeoutSend() * 1000;
			setClientSoTimeout(timeoutSeconds);
		}

		ServiceResponse response = null;
		try {
			response = doServerRequest(new HttpPost(url), jsonObject.toString(), true);
		}  finally {
			if (mGenexusApplication.getSynchronizerTimeoutSend() > 0) {
				//restore timeout
				setClientSoTimeout(DEFAULT_SOCKET_TIMEOUT);
			}
		}

		return response;

	}

	@Override
	public ServiceResponse postJson(String url, JSONArray jsonArray) throws IOException {
		return doServerRequest(new HttpPost(url), jsonArray.toString(), true);
	}

	@Override
	public ServiceResponse postJson(String url, JSONObject jsonObject) throws IOException {
		return doServerRequest(new HttpPost(url), jsonObject.toString(), true);
	}

	private ServiceResponse putJson(String url, JSONObject json) throws IOException {
		return doServerRequest(new HttpPut(url), json.toString(), true);
	}

	private ServiceResponse delete(String url) throws IOException {
		return doServerRequest(new HttpDelete(url), null, false);
	}

	private ServiceResponse doServerRequest(HttpRequestBase request, String content, boolean readJsonInResponse) throws IOException {
		return doServerRequest(request, content, readJsonInResponse, false);
	}

	private ServiceResponse doServerRequest(HttpRequestBase request, String content, boolean readJsonInResponse, boolean isRetryAttempt) throws IOException {
		final HttpClient client = getThreadSafeClient();

		if (request instanceof HttpEntityEnclosingRequest && content != null) {
			StringEntity requestEntity = new StringEntity(content, HTTP.UTF_8);
			requestEntity.setContentType(CONTENT_TYPE_JSON);
			((HttpEntityEnclosingRequest) request).setEntity(requestEntity);
		}

		HttpHeaders.addSecurityHeaders(request);
		HttpHeaders.addMobileHeaders(request);

		DebugService.onHttpRequest(request);
		NetworkLogger.logRequest(request);

		GxHttpResponse response;
		try {
			response = new GxHttpResponse(client.execute(request));
			NetworkLogger.logResponse(request, response);
		} catch (IOException e) {
			// On exception, log *and* rethrow.
			NetworkLogger.logException(request, e);
			throw e;
		}

		HttpEntity responseEntity = response.getEntity();
		ServiceResponse serviceResponse = responseToServiceResponse(request, responseEntity, response, readJsonInResponse);

		// Retry if it's a recoverable error (e.g. token expired but successfully renewed).
		if (!isRetryAttempt && shouldRetryRequest(serviceResponse.StatusCode))
			return doServerRequest(request, content, readJsonInResponse, true);

		return serviceResponse;
	}

	private static ServiceResponse responseToServiceResponse(HttpRequestBase getBase, HttpEntity
			entity, final HttpResponse response, boolean returnJson) {
		ServiceResponse serviceResponse = new ServiceResponse();

		serviceResponse.HttpCode = response.getStatusLine().getStatusCode();
		if (serviceResponse.HttpCode == HttpURLConnection.HTTP_UNAUTHORIZED) {
			Pair<Integer, String> error = ServiceErrorParser.parse(getBase, response);
			serviceResponse.StatusCode = error.first;
			serviceResponse.ErrorMessage = error.second;
			return serviceResponse;
		}

		if (entity != null) {
			try {
				if (returnJson)
					serviceResponse.Message = EntityUtils.toString(entity, HTTP.UTF_8);
				else
					serviceResponse.Stream = entity.getContent();
			} catch (IOException ex) {
				Services.Log.error(ex);
			}
		}

		try {
			if (serviceResponse.getResponseOk()) {
				if (returnJson && serviceResponse.HttpCode != HttpURLConnection.HTTP_NO_CONTENT) {
					if (Services.Strings.hasValue(serviceResponse.Message))
						serviceResponse.Data = new NodeObject(new JSONObject(serviceResponse.Message));

					Header[] headers = response.getHeaders("Warning");
					if (headers != null) {
						serviceResponse.WarningMessage = Strings.EMPTY;
						for (Header header : headers) {
							readWarningFromHeader(serviceResponse, header);
						}
					}
				}
			} else {
				// Response is NOT ok. Try to read specific error message. If not present, return generic one.
				String errorMessage = null;

				String responseContent = serviceResponse.Message;
				if (!returnJson) {
					try {
						responseContent = IOUtils.toString(serviceResponse.Stream);
					} catch (IOException e) {
						responseContent = "";
					}
				}

				try {
					JSONObject jsonResponse = new JSONObject(responseContent);
					serviceResponse.Data = new NodeObject(jsonResponse);

					JSONObject errorObj = jsonResponse.optJSONObject("error");
					errorMessage = (errorObj != null ? errorObj.getString("message") : null);
				} catch (JSONException ignored) {
				} // An exception here means the response was not JSON or its format was unexpected.

				int httpStatusCode = response.getStatusLine().getStatusCode();
				if (errorMessage == null || httpStatusCode >= HttpURLConnection.HTTP_INTERNAL_ERROR) {
					// In case of error 500, ignore the returned message and show a generic one.
					if (errorMessage != null)
						Services.Log.error(errorMessage);

					String errorDetail = String.valueOf(httpStatusCode) + " - " + response.getStatusLine().getReasonPhrase();
					errorMessage = Services.Strings.getResource(R.string.GXM_ApplicationServerError, errorDetail);
				}

				serviceResponse.ErrorMessage = errorMessage;
			}

			return serviceResponse;
		} catch (JSONException e) {
			Services.Log.error(e);
			return new ServiceResponse(e);
		}
	}

	private static void readWarningFromHeader(ServiceResponse serviceResponse, Header header) {
		String value = header.getValue();
		int start = value.indexOf("\"Encoded:User:");
		boolean encoded = true;
		if (start == -1) {
			start = value.indexOf("\"User:");
			encoded = false;
		}
		if (start > 0) {
			int end = value.indexOf("\"", start + 1);
			if (end > start) {
				String messageWarning = value.substring(start + 6, end);
				if (encoded) {
					try {
						//Decode the message from server
						messageWarning = value.substring(start + 14, end);
						messageWarning = URLDecoder.decode(messageWarning, "UTF-8");
					} catch (UnsupportedEncodingException e) {
					}
				}
				serviceResponse.WarningMessage += messageWarning + Strings.SPACE;
			}
		}
	}

	@Override
	public boolean isOnline() {
		return connectionType() > 0;
	}

	@Override
	public int connectionType() {
		// 0 None, 1 Wifi , 2 WAN
		if (DebugService.isNetworkOffline())
			return 0;

		ConnectivityManager cm = (ConnectivityManager)mAppContext.getSystemService(Context.CONNECTIVITY_SERVICE);
		if (cm != null) {
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
				NetworkCapabilities nc = cm.getNetworkCapabilities(cm.getActiveNetwork());
				if (nc != null) {
					if (nc.hasTransport(NetworkCapabilities.TRANSPORT_WIFI))
						return 1;
					else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P && !nc.hasCapability(NET_CAPABILITY_NOT_ROAMING))
						return 3;
					else if (nc.hasTransport(NetworkCapabilities.TRANSPORT_CELLULAR))
						return 2;
				}
			} else {
				android.net.NetworkInfo networkInfo = cm.getActiveNetworkInfo();
				if (networkInfo == null)
					return 0;

				if (networkInfo.isConnected()) {
					if (networkInfo.getType() == ConnectivityManager.TYPE_WIFI)
						return 1;
					else if (networkInfo.isRoaming())
						return 3;
					else
						return 2;
				}
			}
		}
		return 0;
	}

	@Override
	public RemoteApplicationInfo getRemoteApplicationInfo() {
		String uri = mGenexusApplication.UriMaker.getApplicationVersionUrl(mGenexusApplication.getAppEntry());
		JSONObject obj = Services.HttpService.getJSONFromUrl(uri);

		if (obj == null) {
			Services.Log.error(String.format("Could not read remote metadata version from '%s'.", uri));
			return null;
		}

		int majorVersion = Integer.parseInt(obj.optString("major"));
		int minorVersion = Integer.parseInt(obj.optString("minor"));
		String appStoreUrl = obj.optString("uri");
		return new RemoteApplicationInfo(majorVersion, minorVersion, appStoreUrl);
	}

	@Override
	public long getRemoteMetadataVersion() {
		String uri = mGenexusApplication.UriMaker.getMetadataVersionUrl();
		JSONObject obj = Services.HttpService.getJSONFromUrl(uri);

		if (obj == null) {
			Services.Log.error(String.format("Could not read remote metadata version from '%s'.", uri));
			return 0;
		}

		return Long.parseLong(obj.optString("version"));
	}

	@Override
	public String uriEncode(String key) {
		return Uri.encode(key);
	}

	@Override
	public String uriDecode(String key) {
		return Uri.decode(key);
	}

	//Security

	//Login
	static ServiceResponse callAccessManager(String url, Map<String, String> parameters, String redirectUrlScheme) {
		final HttpClient client = Services.HttpService.getThreadSafeClient();
		final HttpPost post = new HttpPost(url);

		try {
			if (parameters != null) {
				ArrayList<NameValuePair> pairs = new ArrayList<>();
				for (Map.Entry<String, String> parameter : parameters.entrySet())
					pairs.add(new BasicNameValuePair(parameter.getKey(), parameter.getValue()));

				UrlEncodedFormEntity postEntity = new UrlEncodedFormEntity(pairs, HTTP.UTF_8);
				post.setEntity(postEntity);
			}

			HttpHeaders.addMobileHeaders(post);
			HttpHeaders.addSecurityHeaders(post); // Needed for logout, at least.

			if (Strings.hasValue(redirectUrlScheme))
				post.setHeader("redirect_urlscheme", redirectUrlScheme);

			// Don't follow an HTTP redirect.
			HttpClientParams.setRedirecting(client.getParams(), false);
			try {
				NetworkLogger.logRequest(post);
				final GxHttpResponse response = new GxHttpResponse(client.execute(post));
				NetworkLogger.logResponse(post, response);

				if (response.getStatusLine().getStatusCode() == HttpURLConnection.HTTP_SEE_OTHER) {
					String newUrl = ServiceDataResult.parseRedirectOnHeader(response);
					ServiceResponse serviceResponse = new ServiceResponse();

					serviceResponse.HttpCode = response.getStatusLine().getStatusCode();
					serviceResponse.Message = newUrl;

					// Read entity anyway. Why?
					//noinspection ResultOfMethodCallIgnored
					EntityUtils.toString(response.getEntity(), HTTP.UTF_8);

					return serviceResponse;
				} else {
					HttpEntity entity = response.getEntity();
					return responseToServiceResponse(post, entity, response, true);
				}
			} finally {
				// Revert to default
				HttpClientParams.setRedirecting(client.getParams(), true);
			}
		} catch (IOException ex) {
			return new ServiceResponse(ex);
		}
	}

	@Override
	public JSONObject getEntityDefaultsBC(String name) {
		String url = mGenexusApplication.UriMaker.getDefaultBCUrl(name);
		return getJSONFromUrl(url);
	}

	@Override
	public String getNetworkErrorMessage(IOException e) {
		// The message is usually the exception's message.
		// If it doesn't have one, use the class name, but substitute "known" ones by a more descriptive message.
		String detail = e.getMessage();
		if (detail == null) {
			// Special cases
			if (e instanceof SocketTimeoutException)
				detail = "connection timed out";
			else
				detail = e.getClass().getName();
		}

		return Services.Strings.getResource(R.string.GXM_NetworkError, detail);
	}

	@Override
	public boolean isReachable(String url) {
		if (url == null)
			throw new IllegalArgumentException("Url cannot be null");

		if (!isOnline())
			return false;

		try {
			URL netUrl = new URL(url);
			HttpURLConnection connection = (HttpURLConnection) netUrl.openConnection();
			connection.setConnectTimeout(4000);
			connection.setReadTimeout(4000);
			try {
				// We aren't interested in the response. So long as we're able to connect, it's fine.
				connection.connect();
				return true;
			} finally {
				connection.disconnect();
			}
		} catch (IOException e) {
			// Should be MalformedURLException, IOException.
			Services.Log.debug("Exception during ServiceHelper.isReachable: " + e.toString());
			return false;
		}
	}
}
