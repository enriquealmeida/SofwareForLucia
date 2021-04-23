package com.artech.controls;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import androidx.core.content.ContextCompat;

import com.artech.base.metadata.theme.BackgroundImageMode;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeOverrideProperties;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.utils.ThemeUtils;

public class GxGradientDrawable extends GradientDrawable
{
    private Drawable mBackground;
    private BackgroundImageMode mBackgroundImageMode;
	private Integer mBorderWidth;
	private ThemeClassDefinition mThemeClass;

    public GxGradientDrawable()
    {
		super();
    }

    public void setBackground(Drawable background)
    {
    	mBackground = background;
    }

    public void setBackgroundImageMode(BackgroundImageMode imageMode)
    {
    	mBackgroundImageMode = imageMode;
    }

    @Override
    public void draw(Canvas canvas)
    {
    	super.draw(canvas);
    	if (mBackground != null)
    	{
    		if (mBorderWidth == null)
				mBorderWidth = 0;

	    	Rect rect = copyBounds();
			rect.left = rect.left + mBorderWidth;
			rect.top = rect.top + mBorderWidth;
			rect.right = rect.right - mBorderWidth;
			rect.bottom = rect.bottom - mBorderWidth;

			if (mBackground instanceof BitmapDrawable)
			{
				BitmapDrawable backgroundBitmap = (BitmapDrawable)mBackground;
				if (mBackgroundImageMode == BackgroundImageMode.TILE)
					backgroundBitmap.setTileModeXY(TileMode.REPEAT, TileMode.REPEAT);
				else
					backgroundBitmap.setTileModeXY(null, null);
			}

			mBackground.setBounds(rect);
    		mBackground.draw(canvas);
    	}
    }

	@SuppressWarnings("SuspiciousNameCombination")
	@Override
	public boolean getPadding(Rect padding)
	{
		if (mBackground != null && mBackground.getPadding(padding))
		{
			// Add the class border to the drawable's intrinsic padding (probably a 9-patch).
			if (mThemeClass != null)
			{
				int borderWidth = mThemeClass.getBorderWidth();
				padding.top += borderWidth;
				padding.left += borderWidth;
				padding.right += borderWidth;
				padding.bottom += borderWidth;
			}

			return true;
		}

		return super.getPadding(padding);
	}

	public void setThemeClass(Context context, ThemeClassDefinition themeClass, boolean isHighlighted, ThemeOverrideProperties overrideProperties)
	{
		if (themeClass == null)
			throw new IllegalArgumentException("themeClass cannot be null.");

		mThemeClass = themeClass;

		String backgroundColor = themeClass.getBackgroundColor();
		if (overrideProperties!=null && Strings.hasValue(overrideProperties.getBackgroundColor()))
			backgroundColor = overrideProperties.getBackgroundColor();

		if (isHighlighted && Strings.hasValue(themeClass.getHighlightedBackgroundColor()))
			backgroundColor = themeClass.getHighlightedBackgroundColor();

		Integer backgroundColorId = ThemeUtils.getColorId(backgroundColor);

		if (backgroundColorId != null)
			setColor(backgroundColorId);
		else
			setColor(ContextCompat.getColor(context, android.R.color.transparent));

		Integer borderColorId = ThemeUtils.getColorId(themeClass.getBorderColor());
		String borderStyle = themeClass.getBorderStyle();

		if (borderColorId != null)
		{
			mBorderWidth = themeClass.getBorderWidth();

			if (borderStyle.equalsIgnoreCase("dotted"))
			{
				int dashWidth = mBorderWidth;
				int dashGap = mBorderWidth * 3;
				setStroke(mBorderWidth, borderColorId, dashWidth, dashGap);
			}

			if (borderStyle.equalsIgnoreCase("dashed"))
			{
				int dashWidth = Services.Device.dipsToPixels(7);
				int dashGap = dashWidth;
				setStroke(mBorderWidth, borderColorId, dashWidth, dashGap);
			}

			if (borderStyle.equalsIgnoreCase("solid") || borderStyle.equalsIgnoreCase("double"))
			{
				setStroke(mBorderWidth, borderColorId);
			}
		}

		// Corner Radius
		if (themeClass.getMaxCornersRadius()>0)
		{
			Integer[] corners = themeClass.getCornersRadius();
			setCornerRadii(new float[] { corners[0],corners[0], corners[1],corners[1],
					corners[2],corners[2], corners[3],corners[3] });
		}

		mBackgroundImageMode = themeClass.getBackgroundImageMode();
	}
}
