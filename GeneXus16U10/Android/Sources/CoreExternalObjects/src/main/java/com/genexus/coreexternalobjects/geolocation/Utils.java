package com.genexus.coreexternalobjects.geolocation;

public class Utils {
	public static long getDiffInSeconds(long startTime, long endTime) {
		return (endTime - startTime) / 1000;
	}
}
