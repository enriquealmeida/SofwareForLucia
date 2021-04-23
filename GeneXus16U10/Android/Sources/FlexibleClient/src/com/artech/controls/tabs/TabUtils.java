package com.artech.controls.tabs;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import androidx.annotation.Nullable;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.artech.R;
import com.artech.android.layout.LayoutTag;
import com.artech.base.metadata.enums.ImageScaleType;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.layout.TabControlDefinition;
import com.artech.base.metadata.theme.LayoutBoxMeasures;
import com.artech.base.metadata.theme.TabControlThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.utils.BackgroundOptions;
import com.artech.utils.BitmapUtils;
import com.artech.utils.Cast;
import com.artech.utils.DrawableUtils;
import com.artech.utils.ThemeUtils;

public class TabUtils
{
	private static final int TAB_DRAWABLE_PADDING_DIPS = 4;
	private static final int TAB_VIEW_MIN_PADDING_DIPS = 2;

	public static void applyTabControlClass(ViewGroup container, LayoutItemDefinition layoutItem, SlidingTabLayout slidingTabs, TabControlThemeClassDefinition themeClass)
	{
		LayoutBoxMeasures margins = themeClass == null ? LayoutBoxMeasures.EMPTY : themeClass.getMargins();
		if (margins != null) {
			ViewGroup.LayoutParams lp = container.getLayoutParams();
			if (lp != null) {
				ViewGroup.MarginLayoutParams marginParams = Cast.as(ViewGroup.MarginLayoutParams.class, lp);
				if (marginParams != null) {
					marginParams.setMargins(margins.left, margins.top, margins.right, margins.bottom);

					if (layoutItem != null) {
						if (lp.width > 0)
							lp.width = layoutItem.getDesiredWidth(themeClass);
						if (!layoutItem.hasAutoGrow()) {
							if (lp.height > 0)
								lp.height = layoutItem.getDesiredHeight(themeClass);
						}
					}

					ViewGroup parent = Cast.as(ViewGroup.class, container.getParent());
					if (parent != null) {
						parent.updateViewLayout(container, lp);
						parent.requestLayout();
						parent.invalidate();
					}
				}
			}
		}

		if (themeClass == null)
			return;
		
		// Reorder children, if necessary, according to "tabs at bottom" preference.
		boolean isTabStripAtBottom = (container.getChildAt(1) == slidingTabs);
		boolean shouldPutTabStripAtBottom = themeClass.getTabStripPosition() == TabControlThemeClassDefinition.TAB_STRIP_POSITION_BOTTOM;
		if (isTabStripAtBottom != shouldPutTabStripAtBottom)
		{
			View previousFirstChild = container.getChildAt(0);
			container.removeView(previousFirstChild);
			container.addView(previousFirstChild);
		}

		// Background for the whole tab control.
		ThemeUtils.setBackgroundBorderProperties(container, themeClass, BackgroundOptions.DEFAULT);

		// Background for the tab strip only.
		ThemeUtils.setBackgroundColor(slidingTabs, ThemeUtils.getColorId(themeClass.getTabStripColor()));

		Integer indicatorColor = ThemeUtils.getColorId(themeClass.getIndicatorColor());
		if (indicatorColor == null)
			indicatorColor = ThemeUtils.getAndroidThemeColorId(container.getContext(), R.attr.colorAccent); // As per material design guidelines.
		if (indicatorColor != null)
			slidingTabs.setSelectedIndicatorColors(indicatorColor);

		ThemeUtils.setElevation(slidingTabs, themeClass.getTabStripElevation());

		// As per Material Design guidelines
		slidingTabs.setDividerColors(Color.TRANSPARENT);
	}

	public static void applyTabItemClass(TextView tabTitleView, ThemeClassDefinition normalClass, ThemeClassDefinition selectedClass)
	{
		ThemeClassDefinition currentAppliedClass =
				applyTabItemClass(tabTitleView, normalClass, selectedClass, null);
		tabTitleView.setTag(LayoutTag.CONTROL_THEME_CLASS, currentAppliedClass);
	}

	public static ThemeClassDefinition applyTabItemClass(TextView tabTitleView, ThemeClassDefinition normalClass, ThemeClassDefinition selectedClass, ThemeClassDefinition currentAppliedClass)
	{
		// applyTabItemClass for tab menu
		ThemeClassDefinition themeClass = getThemeClassToApply(tabTitleView.isSelected(), normalClass, selectedClass);

		if (themeClass != null && themeClass != currentAppliedClass)
		{
			ThemeUtils.setBackgroundBorderProperties(tabTitleView, themeClass, BackgroundOptions.DEFAULT);
			ThemeUtils.setFontProperties(tabTitleView, themeClass);

			// change default allCaps if necessary
			if (!themeClass.getFontAllCaps())
				tabTitleView.setAllCaps(false);

			return themeClass;
		}
		else
			return currentAppliedClass;
	}

	public static ThemeClassDefinition applyTabItemClass(GxTabPageTextView tabTitleView, ThemeClassDefinition normalClass, ThemeClassDefinition selectedClass, ThemeClassDefinition currentAppliedClass)
	{
		// applyTabItemClass for tab control
		ThemeClassDefinition themeClass = getThemeClassToApply(tabTitleView.isSelected(), normalClass, selectedClass);

		if (themeClass != null && themeClass != currentAppliedClass)
		{
			ThemeUtils.setBackgroundBorderProperties(tabTitleView, themeClass, BackgroundOptions.DEFAULT);
			ThemeUtils.setFontProperties(tabTitleView.getInternalTextView(), themeClass);
			// change default allCaps if necessary
			if (!themeClass.getFontAllCaps())
				tabTitleView.getInternalTextView().setAllCaps(false);

			return themeClass;
		}
		else
			return currentAppliedClass;
	}

	@Nullable
	private static ThemeClassDefinition getThemeClassToApply(boolean isSelected, ThemeClassDefinition normalClass, ThemeClassDefinition selectedClass)
	{
		ThemeClassDefinition themeClass;
		if (normalClass != null && selectedClass != null)
			themeClass = (isSelected ? selectedClass : normalClass);
		else if (normalClass != null)
			themeClass = normalClass;
		else if (selectedClass != null)
			themeClass = selectedClass;
		else
			themeClass = null;
		return themeClass;
	}

	public static void setTabImage(TextView tabTitleView, String image, String selectedImage, int imageAlignment)
	{
		Context context = tabTitleView.getContext();

		Drawable normalDrawable = fixTabIconDrawable(context, Services.Images.getStaticImage(context, image));
		Drawable selectedDrawable = fixTabIconDrawable(context, Services.Images.getStaticImage(context, selectedImage));

		Drawable tabImage = DrawableUtils.newStateListDrawable(normalDrawable, selectedDrawable);
		if (tabImage != null)
		{
			if (tabTitleView.getText().length() != 0)
			{
				// Combine text and image
				tabTitleView.setCompoundDrawablePadding(Services.Device.dipsToPixels(TAB_DRAWABLE_PADDING_DIPS));
				DrawableUtils.setCompoundDrawableWithIntrinsicBounds(tabTitleView, tabImage, imageAlignment);

			}
			else
			{
				// Just image
				tabTitleView.setBackground(tabImage);
			}
		}
	}

	private static Drawable fixTabIconDrawable(Context context, Drawable drawable)
	{
		if (drawable != null)
		{
			Bitmap tmpBitmap = BitmapUtils.createFromDrawable(drawable);

			final int iconSizePx = Services.Device.dipsToPixels(TabControlDefinition.TAB_ICON_SIZE);
			tmpBitmap = BitmapUtils.createScaledBitmap(context.getResources(), tmpBitmap, iconSizePx, iconSizePx, ImageScaleType.FIT);

			BitmapDrawable tmpDrawable = new BitmapDrawable(context.getResources(), tmpBitmap);
			tmpDrawable.setGravity(Gravity.CENTER);
			return tmpDrawable;
		}
		else
			return null;
	}

	public static void fixTabHeightAndPadding(LinearLayout tabView, int tabHeight, boolean hasImageAndText)
	{
		// HACK: We need a FIXED size for tab title views, because we have measured all controls before!
		// Remove this when we measure in onMeasure() instead of before adding the controls.
		tabView.getLayoutParams().height = tabHeight;
		int minPadding = Services.Device.dipsToPixels(TAB_VIEW_MIN_PADDING_DIPS);
		if (hasImageAndText)
			tabView.setPadding(minPadding, 0, minPadding, 0);
		else
			tabView.setPadding(tabView.getPaddingLeft(), 0, tabView.getPaddingRight(), 0);
		// End HACK
	}

}
