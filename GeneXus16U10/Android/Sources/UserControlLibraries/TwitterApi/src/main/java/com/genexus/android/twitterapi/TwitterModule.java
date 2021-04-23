package com.genexus.android.twitterapi;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;


public class TwitterModule implements GenexusModule {

	@Override
	public void initialize(Context context) {
		ExternalApiFactory.addApi(new ExternalApiDefinition(TwitterApi.OBJECT_NAME, TwitterApi.class));
	}
}
