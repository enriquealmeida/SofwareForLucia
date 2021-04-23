package com.artech.base.metadata.theme;

import java.io.Serializable;

import android.content.res.Resources;
import android.graphics.Typeface;
import android.os.Build;
import android.os.Build.VERSION_CODES;
import android.util.TypedValue;

import com.artech.base.model.PropertiesObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class ThemeFontDefinition implements Serializable
{
	private static final long serialVersionUID = 1L;

	private String mFontFamily;
	private Integer mFontStyle;
	private Float mFontSize;
	private boolean mFontDecorationStrikeThrough;

	public ThemeFontDefinition(PropertiesObject properties)
	{
		mFontFamily = null;
		mFontStyle = Typeface.NORMAL;
		mFontSize = null;
		mFontDecorationStrikeThrough = false;

		// Use font category defaults first.
		String fontCategory = properties.optStringProperty("font_category");
		if (Strings.hasValue(fontCategory))
			loadFromFontCategory(fontCategory);

		// Overrides from individual properties.
		String fontFamily = properties.optStringProperty("font_family");
		if (Strings.hasValue(fontFamily))
			mFontFamily = fontFamily;

		String fontWeightStr = properties.optStringProperty("font_weight");
		String fontStyleStr = properties.optStringProperty("font_style");
		Integer fontStyle = getFontWeightAndStyle(fontWeightStr, fontStyleStr);
		if (fontStyle != null)
			mFontStyle = fontStyle;

		String fontSizeStr = properties.optStringProperty("font_size");
		fontSizeStr = fontSizeStr.replace("pt", Strings.EMPTY).replace("dip", Strings.EMPTY);
		Float fontSize = Services.Strings.tryParseFloat(fontSizeStr);
		if (fontSize != null)
			mFontSize = fontSize;

		String fontDecoration = properties.optStringProperty("text_decoration");
		if (Strings.hasValue(fontDecoration) && fontDecoration.equalsIgnoreCase("line-through"))
			mFontDecorationStrikeThrough = true;
	}

	private void loadFromFontCategory(String fontCategory)
	{
		// Replace spaces (e.g. "Display 2" -> "Display2").
		fontCategory = fontCategory.replace(Strings.SPACE, Strings.EMPTY);

		// Predefined GX styles, mapped as per http://www.google.com/design/spec/style/typography.html
		if (fontCategory.equalsIgnoreCase("Headline"))
		{
			// Regular 24sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 24f;
		}
		else if (fontCategory.equalsIgnoreCase("Subhead") || fontCategory.equalsIgnoreCase("Subheadline"))
		{
			// Regular 16sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 16f;
		}
		else if (fontCategory.equalsIgnoreCase("Body") || fontCategory.equalsIgnoreCase("Body1"))
		{
			// Regular 14sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 14f;
		}
		else if (fontCategory.equalsIgnoreCase("Body2"))
		{
			// Medium 14sp
			mFontFamily = getDefaultFontFamily(FONT_VARIANT_MEDIUM);
			mFontSize = 14f;
		}
		else if (fontCategory.equalsIgnoreCase("Caption") || fontCategory.equalsIgnoreCase("Caption1") || fontCategory.equalsIgnoreCase("Caption2") || fontCategory.equalsIgnoreCase("Footnote"))
		{
			// Regular 12sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 12f;
		}
		else if (fontCategory.equalsIgnoreCase("Display1"))
		{
			// Regular 34sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 34f;
		}
		else if (fontCategory.equalsIgnoreCase("Display2"))
		{
			// Regular 45sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 45f;
		}
		else if (fontCategory.equalsIgnoreCase("Display3"))
		{
			// Regular 56sp
			mFontFamily = getDefaultFontFamily(null);
			mFontSize = 56f;
		}
		else if (fontCategory.equalsIgnoreCase("Display4"))
		{
			// Light 112sp
			mFontFamily = getDefaultFontFamily(FONT_VARIANT_LIGHT);
			mFontSize = 112f;
		}
		else if (fontCategory.equalsIgnoreCase("Title"))
		{
			// Medium 20sp
			mFontFamily = getDefaultFontFamily(FONT_VARIANT_MEDIUM);
			mFontSize = 20f;
		}
		else if (fontCategory.equalsIgnoreCase("Menu"))
		{
			// Medium 14sp
			mFontFamily = getDefaultFontFamily(FONT_VARIANT_MEDIUM);
			mFontSize = 14f;
		}
		else if (fontCategory.equalsIgnoreCase("Button"))
		{
			// Medium 14sp (all caps)
			mFontFamily = getDefaultFontFamily(FONT_VARIANT_MEDIUM);
			mFontSize = 14f;
		}
	}

	private static final String FONT_VARIANT_MEDIUM = "medium";
	private static final String FONT_VARIANT_THIN = "thin";
	private static final String FONT_VARIANT_LIGHT = "light";
	private static final String FONT_VARIANT_CONDENSED = "condensed";

	private static String getDefaultFontFamily(String variant)
	{
		if (!Strings.hasValue(variant) || variant.equalsIgnoreCase("regular"))
			return "sans-serif";

		// "Medium" was introduced in Android 5.0.
		if (Build.VERSION.SDK_INT >= VERSION_CODES.LOLLIPOP)
		{
			if (variant.equalsIgnoreCase(FONT_VARIANT_MEDIUM))
				return "sans-serif-medium";
		}

		if (variant.equalsIgnoreCase(FONT_VARIANT_THIN))
			return "sans-serif-thin";

		// "Light" & "Condensed" were introduced in Android 4.1
		if (variant.equalsIgnoreCase(FONT_VARIANT_LIGHT))
			return "sans-serif-light";
		if (variant.equalsIgnoreCase(FONT_VARIANT_CONDENSED))
			return "sans-serif-condensed";

		return "sans-serif";
	}

	private static Integer getFontWeightAndStyle(String fontWeight, String fontStyle)
	{
		if (fontWeight.equalsIgnoreCase("bold") && fontStyle.equalsIgnoreCase("italic"))
			return Typeface.BOLD_ITALIC;
		if (fontWeight.equalsIgnoreCase("bold"))
			return Typeface.BOLD;
		if (fontStyle.equalsIgnoreCase("italic"))
			return Typeface.ITALIC;

		return null;
	}

	public String getFontFamily()
	{
		return mFontFamily;
	}

	public Integer getFontSize()
	{
		// mFontSize is in dips, convert to pixels.
		if (mFontSize != null)
			return (int)TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, mFontSize, Resources.getSystem().getDisplayMetrics());
		else
			return null;
	}

	public Integer getFontStyle()
	{
		return mFontStyle;
	}

	public boolean getStrikeThrough() { return mFontDecorationStrikeThrough; }
}
