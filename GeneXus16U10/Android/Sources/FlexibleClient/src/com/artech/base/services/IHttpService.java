package com.artech.base.services;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import org.apache.http.impl.client.*;
import org.json.JSONArray;
import org.json.JSONObject;

import android.content.Context;

import com.artech.base.metadata.loader.RemoteApplicationInfo;
import com.artech.base.serialization.INodeObject;
import com.artech.common.IProgressListener;
import com.artech.common.ServiceDataResult;

@SuppressWarnings("deprecation")
public interface IHttpService {
	DefaultHttpClient getThreadSafeClient();

	boolean isOnline();
	boolean isReachable(String url);
	int connectionType();

	RemoteApplicationInfo getRemoteApplicationInfo();
	long getRemoteMetadataVersion();

	String uriEncode(String key);
	String uriDecode(String key);

	ServiceResponse insertEntityData(String type, List<String> key, INodeObject node);
	ServiceResponse insertOrUpdateEntityData(String type, List<String> key, INodeObject node);
	ServiceResponse updateEntityData(String type, List<String> key, INodeObject node);
	ServiceResponse deleteEntityData(String type, List<String> key);

	JSONObject getEntityDefaultsBC(String name);
	JSONArray getJSONArrayFromUrl(String url);
	JSONObject getJSONFromUrl(String url);

	ServiceDataResult getEntityDataBC(String type, List<String> keys);
	ServiceDataResult getDataFromProvider(String uri, Date ifModifiedSince, boolean isCollection);

	void downloadAndExtractMetadata(Context context);

	ServiceResponse postJsonSyncResponse(String url, JSONArray jsonArray, String syncVersion) throws IOException;
	ServiceResponse postJson(String url, JSONArray jsonArray) throws IOException;
	ServiceResponse postJson(String url, JSONObject jsonObject) throws IOException;
	ServiceResponse postJsonSyncReplicator(String url, JSONObject jsonObject) throws IOException;

	String getNetworkErrorMessage(IOException e);

	ServiceResponse uploadInputStreamToServer(String url, InputStream data, long dataLength,
											  String mimeType, IProgressListener listener);
}
