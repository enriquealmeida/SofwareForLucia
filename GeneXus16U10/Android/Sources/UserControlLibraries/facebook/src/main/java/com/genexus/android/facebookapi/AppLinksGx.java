package com.genexus.android.facebookapi;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import com.artech.actions.DynamicCallAction;
import com.artech.actions.UIContext;
import com.artech.activities.IIntentHandler;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.facebook.FacebookSdk;
import com.facebook.applinks.AppLinkData;

import bolts.AppLinks;

class AppLinksGx implements IIntentHandler
{
	void initialize(Context context)
	{
		if (Strings.hasValue(FacebookSdk.getApplicationId()))
		{
			AppLinkData.fetchDeferredAppLinkData(context, new AppLinkData.CompletionHandler()
			{
				@Override
				public void onDeferredAppLinkDataFetched(AppLinkData appLinkData)
				{
					// TODO: We should open the deferred URI by passing it to the current activity.
					/*
					if (appLinkData != null)
					{
						Uri deferredTargetUri = appLinkData.getTargetUri();
						// ...
					}
					*/
				}
			});
		}
	}

	@Override
	public boolean tryHandleIntent(UIContext context, Intent intent, Entity entity)
	{
		Uri targetUrl = AppLinks.getTargetUrlFromInboundIntent(context, intent);

	    if (targetUrl != null)
		{
			int iStartTarget = intent.getDataString().lastIndexOf("?");
			String myLink = intent.getDataString().substring(0, iStartTarget);
			// At this moment we are just supporting linking but no actions so we just create a DynamicCallAction and execute it
			String dynamicAll = createDynamicCallFromTargetUrl(myLink);
			DynamicCallAction.redirect(context, null, dynamicAll);
			return true;
		}

		return false;
	}

	private String createDynamicCallFromTargetUrl(String targetUrl)
	{
		String protocolHandler = String.format("%s://", Services.Application.getAppsLinksProtocol());
		targetUrl = targetUrl.replace(protocolHandler, "sd:");
		// Now is not coming encoded so here we support for  "Obj.Detal?123,124"  = "Obj-Detail---123--124"
		targetUrl = targetUrl.replace("---", "?");
		targetUrl = targetUrl.replace("--", ",");
		targetUrl = targetUrl.replace("-", ".");
		return targetUrl;
	}
}
