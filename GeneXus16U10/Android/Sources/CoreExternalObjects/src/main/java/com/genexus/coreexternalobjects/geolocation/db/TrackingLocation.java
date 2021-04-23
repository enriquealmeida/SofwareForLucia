package com.genexus.coreexternalobjects.geolocation.db;

public class TrackingLocation
{
	private Integer id;
	private String geolocation;
	private long dateTime;

	public TrackingLocation() {
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public long getDateTimetime()
	{
		return dateTime;
	}

	public void setDateTimetime(long dateTime)
	{
		this.dateTime = dateTime;
	}

	public String getGeolocationJson()
	{
		return geolocation;
	}

	public void setGeolocationJson(String geolocation)
	{
		this.geolocation = geolocation;
	}




	
}
