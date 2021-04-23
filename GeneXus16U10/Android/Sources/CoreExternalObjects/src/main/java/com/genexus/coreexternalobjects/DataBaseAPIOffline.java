package com.genexus.coreexternalobjects;

import com.artech.layers.LocalUtils;

public class DataBaseAPIOffline {

	// static method to be called inside a offline procedure
	public static short backup(String path) {
		//Call From a Gx Procedure, should close transaction first
		LocalUtils.commit();
		LocalUtils.endTransaction();

		short result = DataBaseAPI.backupAllDB(path);

		//Start procedure transaction again
		LocalUtils.beginTransaction();

		return result;
	}

	// static method to be called inside a offline procedure
	public short restore(String path) {
		//Call From a Gx Procedure, should close transaction first
		LocalUtils.commit();
		LocalUtils.endTransaction();

		short result = DataBaseAPI.restoreAllDB(path);

		//Start procedure transaction again
		LocalUtils.beginTransaction();

		return result;
	}

}
