package com.genexus.controls.cardscanner;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

/**
 * Card Scanner Module.
 * Supports the scan of credit cards with the camera.
 */
public class CardScannerModule implements GenexusModule
{
	@Override
	public void initialize(Context context)
	{
		ExternalApiFactory.addApi(new ExternalApiDefinition(CardScannerApi.OBJECT_NAME, CardScannerApi.class));
	}
}
