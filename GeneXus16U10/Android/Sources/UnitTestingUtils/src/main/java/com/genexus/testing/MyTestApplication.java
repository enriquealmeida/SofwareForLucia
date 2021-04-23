package com.genexus.testing;

import com.artech.android.ContextImpl;
import com.artech.application.MyApplication;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.services.AndroidContext;
import com.artech.providers.EntityDataProvider;
import com.artech.services.EntityService;

public class MyTestApplication extends MyApplication {

    @Override
    public final void onCreate()
    {
        GenexusApplication application = new GenexusApplication();
        MyApplication.setApp(application);
        super.onCreate();
        AndroidContext.ApplicationContext = new ContextImpl(getApplicationContext());
    }

    @Override
    public Class<? extends EntityService> getEntityServiceClass() {
        return null;
    }

    @Override
    public EntityDataProvider getProvider() {
        return null;
    }
}
