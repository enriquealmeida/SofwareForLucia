package com.genexus.beacons;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

public class BeaconsModule implements GenexusModule {
	@Override
	public void initialize(Context context) {
		ExternalApiFactory.addApi(new ExternalApiDefinition(BeaconsAPI.OBJECT_NAME, BeaconsAPI.class));
	}
}
