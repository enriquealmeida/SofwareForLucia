package com.genexus.authentication;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

public class DeviceAuthenticationModule implements GenexusModule {
    @Override
    public void initialize(Context context)
    {
        ExternalApiFactory.addApi(new ExternalApiDefinition(DeviceAuthenticationAPI.OBJECT_NAME, DeviceAuthenticationAPI.class));
    }
}
