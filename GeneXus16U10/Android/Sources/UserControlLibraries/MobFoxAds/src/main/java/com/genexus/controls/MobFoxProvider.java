package com.genexus.controls;

import android.content.Context;
import androidx.annotation.NonNull;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.controls.ads.IAdsProvider;
import com.artech.controls.ads.IAdsViewController;

/**
 * MobFox Ads Provider.
 */
public class MobFoxProvider implements IAdsProvider
{
	@NonNull
	@Override
	public String getId()
	{
		return "mobfox";
	}

	@NonNull
	@Override
	public IAdsViewController createViewController(Context context, LayoutItemDefinition definition)
	{
		if (definition != null)
			return new GxAdViewController(context, definition.getControlInfo());
		else
			return new GxAdViewController(context, null);
	}
}
