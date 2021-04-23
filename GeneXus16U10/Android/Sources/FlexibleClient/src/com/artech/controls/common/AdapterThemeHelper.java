package com.artech.controls.common;

import android.view.View;
import android.widget.TextView;

import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.utils.BackgroundOptions;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

/**
 * Helper class for control-based adapters (such as suggestion or combo drop-downs).
 */
class AdapterThemeHelper
{
	static void applyStyle(View view, ThemeClassDefinition themeClass, boolean setBackground)
	{
		if (themeClass != null)
		{
			TextView text = Cast.as(TextView.class, view.findViewById(android.R.id.text1));
			if (text != null)
			{
				ThemeUtils.setFontProperties(text, themeClass);
				if (setBackground)
					ThemeUtils.setBackgroundBorderProperties(text, themeClass, BackgroundOptions.DEFAULT);
			}
		}
	}
}
