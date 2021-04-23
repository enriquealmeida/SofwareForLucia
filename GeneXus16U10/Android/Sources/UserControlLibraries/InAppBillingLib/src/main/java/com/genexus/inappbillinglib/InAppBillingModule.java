package com.genexus.inappbillinglib;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;


public class InAppBillingModule implements GenexusModule {

	@Override
	public void initialize(Context context) {
		ExternalApiFactory.addApi(new ExternalApiDefinition(StoreManager.OBJECT_NAME, StoreManager.class));
	}
}
