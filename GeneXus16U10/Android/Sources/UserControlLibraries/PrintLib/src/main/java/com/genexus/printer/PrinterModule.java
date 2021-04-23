package com.genexus.printer;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

public class PrinterModule implements GenexusModule {

    @Override
    public void initialize(Context context) {
        ExternalApiFactory.addApi(new ExternalApiDefinition(PrinterAPI.OBJECT_NAME, PrinterAPI.class));
    }
}
