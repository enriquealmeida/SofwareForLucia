package com.artech.common;

import android.content.Intent;

import com.artech.R;
import com.artech.actions.ApiAction;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityLauncher;
import com.artech.activities.LoginBiometricsActivity;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.services.Services;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.crypto.Cipher;

public class BiometricsHelper {
    private static ExternalApi sAuthenticationInstance;
    private static List<Object> sAuthenticationParameters;
    private static boolean sCallLoginNextStartBiometricActivity;

    private static final String OBJECT_NAME_AUTHENTICATION = "GeneXus.SD.DeviceAuthentication";
    private static final String OBJECT_NAME_PROGRESS = "GeneXus.Common.UI.Progress";
    private static final String METHOD_HIDE = "Hide";
    private static final String METHOD_IS_AVAILABLE = "IsAvailable";
    private static final String METHOD_AUTHENTICATE = "Authenticate";
    private static final String METHOD_REGISTER_REUSE_OBSERVER = "RegisterReuseObserver";
    private static final String METHOD_ENCRYPT = "Encrypt";
    private static final String METHOD_DECRYPT = "Decrypt";
    private static final String VALUE_POLICY_BIOMETRICS = "1";
    private static final String PROPERTY_ENABLE_BIOMETRICS = "IntegratedSecurityEnableBiometrics";
    private static final String PROPERTY_BIOMETRICS_REUSE_DURATION = "IntegratedSecutiryBiometricsReuseDuration";
    private static final String PROPERTY_BLUR_ON_BACKGROUND = "IntegratedSecurityBlurOnBackground";
    private static final int DEFAULT_BIOMETRICS_REUSE_DURATION = 300;

    public static void registerLifecycleObserver(UIContext context) {
        if (BiometricsHelper.isBiometricsEnabled()) {
            ApiAction dummyAction = new ApiAction(context, new ActionDefinition(null), null);
            ExternalApi api = Services.Application.getExternalApiFactory().createInstance(OBJECT_NAME_AUTHENTICATION, dummyAction);
            api.execute(METHOD_REGISTER_REUSE_OBSERVER, Arrays.asList(new Object[0]));
        }
    }

    public static boolean isBiometricsEnabled() {
        return MyApplication.getApp().getMainProperties().optBooleanProperty(PROPERTY_ENABLE_BIOMETRICS);
    }

    public static int biometricsReuseDuration() {
        return MyApplication.getApp().getMainProperties().optIntProperty(PROPERTY_BIOMETRICS_REUSE_DURATION, DEFAULT_BIOMETRICS_REUSE_DURATION);
    }

    public static boolean isBlurOnBackgroundEnabled() {
        return MyApplication.getApp().getMainProperties().optBooleanProperty(PROPERTY_BLUR_ON_BACKGROUND);
    }

    public static void callLoginNextStartBiometricActivity() {
        sCallLoginNextStartBiometricActivity = true;
    }

    public static void startBiometricsActivity(UIContext context) {
        if (sCallLoginNextStartBiometricActivity) {
            sCallLoginNextStartBiometricActivity = false;
            ActivityLauncher.callLogin(context);
        } else {
            Intent intent = new Intent(context, LoginBiometricsActivity.class);
            context.getActivity().startActivityForResult(intent, RequestCodes.LOGIN);
        }
    }

    public static boolean isFingerprintAvailable(UIContext context) {
        ApiAction dummyAction = new ApiAction(context, new ActionDefinition(null), null);
        ExternalApi api = Services.Application.getExternalApiFactory().createInstance(OBJECT_NAME_AUTHENTICATION, dummyAction);
        return (boolean) api.execute(METHOD_IS_AVAILABLE, Arrays.asList(new Object[]{VALUE_POLICY_BIOMETRICS})).getReturnValue();
    }

    public static ExternalApiResult authenticate(UIContext context, int mode) {
        String title = context.getResources().getString(R.string.GXM_AuthenticateTitle, context.getResources().getString(R.string.GXM_FingerprintTitle));
        String description = context.getResources().getString(mode == Cipher.ENCRYPT_MODE ? R.string.GXM_AuthenticateDescriptionSave : R.string.GXM_AuthenticateDescriptionLogin);
        ApiAction dummyAction = new ApiAction(context, new ActionDefinition(null), null);
        sAuthenticationInstance = Services.Application.getExternalApiFactory().createInstance(OBJECT_NAME_AUTHENTICATION, dummyAction);
        sAuthenticationParameters = Arrays.asList(new Object[]{VALUE_POLICY_BIOMETRICS, title, description, mode});
        return sAuthenticationInstance.execute(METHOD_AUTHENTICATE, sAuthenticationParameters);
    }

    public static ExternalApiResult authenticateOnActivityResult(int requestCode, int resultCode, Intent data) {
        return sAuthenticationInstance.afterActivityResult(requestCode, resultCode, data, METHOD_AUTHENTICATE, sAuthenticationParameters);
    }

    public static String encrypt(String v) {
        return (String) sAuthenticationInstance.execute(METHOD_ENCRYPT, Arrays.asList(new Object[]{v})).getReturnValue();
    }

    public static String decrypt(String v) {
        return (String) sAuthenticationInstance.execute(METHOD_DECRYPT, Arrays.asList(new Object[]{v})).getReturnValue();
    }

    public static void hideProgress(UIContext context) {
        ApiAction dummyAction = new ApiAction(context, new ActionDefinition(null), null);
        ExternalApi api = Services.Application.getExternalApiFactory().createInstance(OBJECT_NAME_PROGRESS, dummyAction);
        api.execute(METHOD_HIDE, new ArrayList());
    }
}
