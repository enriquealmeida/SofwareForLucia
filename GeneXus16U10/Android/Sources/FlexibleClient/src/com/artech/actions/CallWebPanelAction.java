package com.artech.actions;

import java.util.ArrayList;

import android.content.Intent;

import com.artech.activities.IntentFactory;
import com.artech.app.ComponentParameters;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.expressions.ExpressionFormatHelper;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.ui.navigation.Navigation;
import com.artech.ui.navigation.NavigationHandled;
import com.artech.ui.navigation.UIObjectCall;

class CallWebPanelAction extends Action
{
	private boolean mWaitForResult;
	
	public CallWebPanelAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);
	}

	@Override
	public boolean Do()
	{
		mWaitForResult = true;
		String webUrl = getUrl();

		Intent intent = IntentFactory.getIntentForWebApplication(getContext(), webUrl);
		UIObjectCall call = new UIObjectCall(getContext(), new ComponentParameters(webUrl));

		NavigationHandled handled = Navigation.handle(call, intent);
		if (handled != NavigationHandled.NOT_HANDLED)
		{
			mWaitForResult = (handled == NavigationHandled.HANDLED_WAIT_FOR_RESULT);
			return true;
		}
	
		getContext().startActivity(intent);
		return true;
	}

	@Override
	public boolean catchOnActivityResult()
	{
		return mWaitForResult;
	}
	
	private String getUrl()
	{
		ArrayList<String> urlParameters = new ArrayList<>();
		for (ActionParameter parameter : getDefinition().getParameters())
		{
			Value value = getParameterValue(parameter);
			if (value != null) {
				String url = ExpressionFormatHelper.toUrlParameterString(value);
				urlParameters.add(Services.HttpService.uriEncode(url));
			}
		}

		String link = MyApplication.getApp().link(getDefinition().getGxObject());
		if (urlParameters.size() > 0)
			link += Strings.QUESTION + Services.Strings.join(urlParameters, Strings.COMMA);
		
		return link;
	}
}
