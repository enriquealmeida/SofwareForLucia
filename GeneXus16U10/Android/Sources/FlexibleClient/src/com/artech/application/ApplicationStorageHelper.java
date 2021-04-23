package com.artech.application;

import org.sqldroid.ISQLDroidData;

import android.content.Context;

import com.artech.base.services.Services;

public class ApplicationStorageHelper implements ISQLDroidData
{
	private Context mContext;
	public ApplicationStorageHelper(Context context)
	{
		mContext = context;
	}


	@Override
	public String getSQLDroidData()
	{
		Services.Log.debug("getSQLDroidData called, getDeviceStorageValue");
		return new ApplicationStorageImpl(mContext).getDeviceStorageValue();
	}
}
