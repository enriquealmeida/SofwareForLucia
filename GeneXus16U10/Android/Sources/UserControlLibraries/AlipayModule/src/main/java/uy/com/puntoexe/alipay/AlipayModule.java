package uy.com.puntoexe.alipay;


import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;

public class AlipayModule implements GenexusModule {

    @Override
    public void initialize(Context context) {
        ExternalApiDefinition basicExternalObject = new ExternalApiDefinition(
                AlipayApi.NAME,
                AlipayApi.class
        );
        ExternalApiFactory.addApi(basicExternalObject);
    }

}
