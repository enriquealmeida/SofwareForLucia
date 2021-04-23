package com.genexus.mercadopago;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

public class MercadoPagoModule implements GenexusModule {
    @Override
    public void initialize(Context context) {
        ExternalApiFactory.addApi(new ExternalApiDefinition(MercadoPagoAPI.OBJECT_NAME, MercadoPagoAPI.class));
    }
}
