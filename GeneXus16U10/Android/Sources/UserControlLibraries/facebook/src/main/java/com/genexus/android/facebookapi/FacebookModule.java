package com.genexus.android.facebookapi;

import android.content.Context;

import com.artech.activities.IntentHandlers;
import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;
import com.genexus.android.controls.SDFacebookButton;

public class FacebookModule implements GenexusModule {

    @Override
    public void initialize(Context context) {
        ExternalApiFactory.addApi(new ExternalApiDefinition(FacebookAPI.OBJECT_NAME, FacebookAPI.class));
        UcFactory.addControl(new UserControlDefinition(SDFacebookButton.NAME, SDFacebookButton.class));

        AppLinksGx fbAppLinks = new AppLinksGx();
        fbAppLinks.initialize(context);
        IntentHandlers.addHandler(fbAppLinks);
    }
}
