package com.artech.controls.common;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

import com.artech.base.metadata.theme.ThemeClassDefinition;

public interface IViewDisplayImage
{
	void setImageBitmap(Bitmap bm);
	void setImageDrawable(Drawable drawable);
	void setImageResource(int resId);

	Context getContext();
	String getImageTag();
	void setImageTag(String tag);
	ThemeClassDefinition getThemeClass();
}
