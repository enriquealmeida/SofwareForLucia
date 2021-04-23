package com.artech.layers;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.util.Pair;

import com.artech.application.MyApplication;
import com.artech.base.application.IBusinessComponent;
import com.artech.base.application.IGxObject;
import com.artech.base.application.IProcedure;
import com.artech.base.controls.MappedValue;
import com.artech.base.metadata.DataProviderDefinition;
import com.artech.base.metadata.GxObjectDefinition;
import com.artech.base.metadata.IGxObjectDefinition;
import com.artech.base.metadata.ProcedureDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.model.Entity;
import com.artech.base.providers.GxUri;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.providers.IDataSourceResult;
import com.artech.base.services.ServiceResponse;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultDetail;
import com.artech.common.IProgressListener;
import com.artech.utils.FileUtils2;

class RemoteApplicationServer implements IApplicationServer
{
	@Override
	public boolean supportsCaching()
	{
		// Server DPs support the "Last-Modified" / "If-Modified-Since" tags.
		return true;
	}

	@Override
	public IBusinessComponent getBusinessComponent(String name)
	{
		StructureDefinition bcDefinition = Services.Application.getBusinessComponent(name);
		validateObjectConnectivity(bcDefinition);

		return new RemoteBusinessComponent(name, bcDefinition);
	}

	@Override
	public IGxObject getGxObject(String name)
	{
		GxObjectDefinition gxObjectDefinition = Services.Application.getGxObject(name);
		validateObjectConnectivity(gxObjectDefinition);

		if (gxObjectDefinition != null && gxObjectDefinition instanceof ProcedureDefinition)
			return new RemoteProcedure(name, (ProcedureDefinition)gxObjectDefinition);
		else if (gxObjectDefinition != null && gxObjectDefinition instanceof DataProviderDefinition)
			return new RemoteDataProvider((DataProviderDefinition)gxObjectDefinition);
		else
			return new DummyObject(name);
	}

	@Override
	public IGxObject getGxObject(@NonNull String packageName, String name)
	{
		return  getGxObject(name);
	}

	@Override
	public IProcedure getProcedure(String name)
	{
		ProcedureDefinition procDefinition = Services.Application.getProcedure(name);
		validateObjectConnectivity(procDefinition);

		return new RemoteProcedure(name, procDefinition);
	}

	@Override
	public IDataSourceResult getData(GxUri uri, int sessionId, int start, int count, Date ifModifiedSince)
	{
		validateObjectConnectivity(uri.getDataSource().getParent());

		RemoteDataSource ds = new RemoteDataSource();
		return ds.execute(uri, sessionId, start, count, ifModifiedSince);
	}

	@Override
	public Entity getData(GxUri uri, int sessionId)
	{
		validateObjectConnectivity(uri.getDataSource().getParent());
		return CommonUtils.getDataSingle(this, uri, sessionId);
	}

	@Override
	public List<String> getDependentValues(String service, Map<String, String> input)
	{
		return RemoteServices.getDependentValues(service, input);
	}

	@NonNull
	@Override
	public ResultDetail<String> uploadBinary(@NonNull File file, @Nullable IProgressListener progressListener) throws IOException
	{
		String uploadUrl = MyApplication.getApp().UriMaker.getServerImagesUrl();
		InputStream data  = new FileInputStream(file);
		long size = file.length();
		String mimeType = FileUtils2.getMimeType(file);

		ServiceResponse serviceResponse = Services.HttpService.uploadInputStreamToServer(uploadUrl, data, size, mimeType, progressListener);

		if (serviceResponse.HttpCode == HttpURLConnection.HTTP_CREATED)
			return ResultDetail.ok(serviceResponse.get("object_id"));
		else
			return ResultDetail.error(serviceResponse.ErrorMessage, "");
	}

	@Override
	public List<Pair<String, String>> getDynamicComboValues(String serviceName, Map<String, String> inputValues)
	{
		return RemoteServices.getDynamicComboValues(serviceName, inputValues);
	}

	@Override
	public List<String> getSuggestions(String serviceName, Map<String, String> input)
	{
		return RemoteServices.getSuggestions(serviceName, input);
	}

	@Override
	public MappedValue getMappedValue(String serviceName, Map<String, String> input)
	{
		return RemoteServices.getMappedValue(serviceName, input);
	}

	private static void validateObjectConnectivity(IGxObjectDefinition gxObject)
	{
		// Sanity check.
		if (gxObject != null && gxObject.getConnectivitySupport() == Connectivity.Offline)
			throw new IllegalStateException(String.format("Object %s only supports OFFLINE but is being called via RemoteApplicationServer.",
					gxObject.getName()));
	}
}
