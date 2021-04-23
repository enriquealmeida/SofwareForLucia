package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class DeepLinksLoadStep implements MetadataLoadStep {
	private final Context mContext;
	private final GenexusApplication mApplication;

	public DeepLinksLoadStep(Context context, GenexusApplication application) {
		mContext = context;
		mApplication = application;
	}

	@Override
	public void load() {
		String file = mApplication.getAppEntry().toLowerCase() + ".deeplink";
		INodeObject deepLink = MetadataLoader.getDefinition(mContext, file);
		if (deepLink != null) {
			for (INodeObject obj : deepLink.getCollection("DeepLinks")) {
				String link = obj.getString("link");
				String panel = obj.getString("panel");
				Services.Application.putDeepLink(link, panel);
			}
		}
	}
}
