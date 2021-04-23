package com.artech.externalapi;

import com.artech.actions.ApiAction;
import com.artech.application.MyApplication;
import com.artech.base.utils.NameMap;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;

public class ExternalApiFactory {
    private final NameMap<ExternalApiDefinition> mDefinitions;
    private final NameMap<Constructor<? extends ExternalApi>> sConstructorsCache;

    public ExternalApiFactory() {
        mDefinitions = new NameMap<>();
        sConstructorsCache = new NameMap<>();
    }

    public void addDefinition(ExternalApiDefinition apiDefinition) {
        mDefinitions.put(apiDefinition.Name, apiDefinition);
        callInitialize(apiDefinition.mClass);
    }

    private void callInitialize(Class<? extends ExternalApi> clazz) {
        try {
            clazz.getMethod("initialize").invoke(null);
        } catch (NoSuchMethodException e) {
        } catch (IllegalAccessException e) {
        } catch (InvocationTargetException e) {
        }
    }

    @SuppressWarnings("deprecation")
    public static void addApi(ExternalApiDefinition externalApiDefinition) {
        MyApplication.getInstance().getExternalApiFactory().addDefinition(externalApiDefinition);
    }

    public ExternalApi createInstance(String apiName, ApiAction action) {
        ExternalApiDefinition apiDefinition = mDefinitions.get(apiName);

        if (apiDefinition == null) {
            throw new NoClassDefFoundError(String.format("No ExternalApiDefinition was found for '%s'.", apiName));
        }

        try {
            return getConstructor(apiDefinition.mClass).newInstance(action);
        } catch (InstantiationException | IllegalAccessException | InvocationTargetException e) {
            throw new RuntimeException(String.format("Error while instantiating External Api class '%s'.", apiDefinition.mClass.getName()), e);
        }
    }

    private Constructor<? extends ExternalApi> getConstructor(Class<? extends ExternalApi> clazz) {
        Constructor<? extends ExternalApi> constructor = sConstructorsCache.get(clazz.getName());

        if (constructor == null) {
            try {
                constructor = clazz.getConstructor(ApiAction.class);
            } catch (NoSuchMethodException e) {
                throw new RuntimeException(String.format("External Api class '%s' does not have the appropriate constructor.", clazz.getName()), e);
            }

            sConstructorsCache.put(clazz.getName(), constructor);
        }

        return constructor;
    }
}
