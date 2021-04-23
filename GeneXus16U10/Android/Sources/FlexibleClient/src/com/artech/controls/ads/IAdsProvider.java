package com.artech.controls.ads;

import android.content.Context;
import androidx.annotation.NonNull;

import com.artech.base.metadata.layout.LayoutItemDefinition;

/**
 * Ads Provider interface.
 */
public interface IAdsProvider
{
	/***
	 * Get the id for this provider. ie: "mobfox", "admob", "smartadserver", etc
	 */
	@NonNull String getId();

	/***
	 * Create a view controller for a banner
	 */
	@NonNull IAdsViewController createViewController(Context context, LayoutItemDefinition layoutItemDefinition);
}
