package com.artech.utils;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.LinkedHashMap;

import android.animation.ArgbEvaluator;
import android.animation.ValueAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager.TaskDescription;
import android.app.AlertDialog;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.graphics.drawable.StateListDrawable;
import android.graphics.drawable.TransitionDrawable;
import android.os.Build;
import android.text.TextUtils;
import android.util.TypedValue;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

import com.artech.R;
import com.artech.application.MyApplication;
import com.artech.base.controls.IGxOverrideThemeable;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.theme.AttributeThemeClassDefinition;
import com.artech.base.metadata.theme.BackgroundImageMode;
import com.artech.base.metadata.theme.LayoutBoxMeasures;
import com.artech.base.metadata.theme.ThemeApplicationBarClassDefinition;
import com.artech.base.metadata.theme.ThemeApplicationClassDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.metadata.theme.ThemeFontFamilyDefinition;
import com.artech.base.metadata.theme.ThemeOverrideProperties;
import com.artech.base.services.Services;
import com.artech.base.utils.ReflectionHelper;
import com.artech.base.utils.Strings;
import com.artech.compatibility.CompatibilityHelper;
import com.artech.controls.GxGradientDrawable;
import com.artech.ui.navigation.CustomInsetsRelativeLayout;
import com.google.android.material.textfield.TextInputLayout;

import androidx.annotation.AttrRes;
import androidx.annotation.ColorInt;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.widget.Toolbar;
import androidx.core.content.ContextCompat;
import androidx.core.graphics.ColorUtils;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;

public class ThemeUtils
{

	public static int getColorId(String colorString, int defaultColor)
	{
		Integer colorId = getColorId(colorString);
		if (colorId == null)
			colorId = defaultColor;

		return colorId;
	}

	@SuppressWarnings("DoubleBraceInitialization")
	private static final HashMap<String, Integer> COLORS = new LinkedHashMap<String, Integer>() {{
		put("#FFFFFF00", Color.TRANSPARENT);
	}};

	public static Integer getColorId(String colorString)
	{
		if (Strings.hasValue(colorString))
		{
			if (COLORS.containsKey(colorString))
				return COLORS.get(colorString);

			//gx format is #rrggbbaa , parse color in android is #aarrggbb , so convert it before parse.
			String colorNewFormatString = colorString.trim();
			if (colorNewFormatString.startsWith("#") && colorNewFormatString.length() >= 9)
				colorNewFormatString = "#" + colorNewFormatString.substring(7, 9) + colorNewFormatString.substring(1, 7);

			int colorInt = Color.parseColor(colorNewFormatString);
			COLORS.put(colorString, colorInt);
			return colorInt;
		}
		return null;
	}

	private static final HashMap<String, Typeface> TYPEFACE_CACHE = new HashMap<>();

	public static Typeface getFontFamily(ThemeDefinition theme, String name)
	{
		if (Strings.hasValue(name))
		{
			// Cache Typeface objects. For performance reasons, and also to avoid a memory leak
			// in some versions (http://code.google.com/p/android/issues/detail?id=9904).
			if (TYPEFACE_CACHE.containsKey(name))
				return TYPEFACE_CACHE.get(name);

			Typeface typeface = resolveTypeface(theme, name);
			TYPEFACE_CACHE.put(name, typeface);
			return typeface;
		}
		else
			return null;
	}

	/**
	 * Attempts to resolve the font first by searching for it in the embedded fonts directory in the
	 * APK and then by name in the system fonts.
	 */
	private static Typeface resolveTypeface(ThemeDefinition theme, String fontFamilyName)
	{
		Typeface typeFace = getEmbeddedFont(theme, fontFamilyName);

		if (typeFace == null) {
			typeFace = getSystemFont(fontFamilyName);
		}

		return typeFace;
	}

	private static Typeface getEmbeddedFont(ThemeDefinition theme, String fontFamilyName) {
		ThemeFontFamilyDefinition fontFamily = theme.getFontFamily(fontFamilyName);

		if (fontFamily == null) {
			return null;
		}

		return Typeface.createFromAsset(
				MyApplication.getAppContext().getAssets(),
				"fonts/" + fontFamily.getFileName()
		);
	}

	private static Typeface getSystemFont(String fontFamilyName) {
		Typeface defaultFont = Typeface.create((String)null, Typeface.NORMAL);

		String[] fontNames = Services.Strings.split(fontFamilyName, ',');
		for (String fontName : fontNames)
		{
			Typeface myFont = Typeface.create(fontName, Typeface.NORMAL);
			if (!defaultFont.equals(myFont))
				return myFont;
		}

		return defaultFont;
	}

	public static void setFontProperties(TextView textView, ThemeClassDefinition themeClass)
	{
		setFontProperties(textView, themeClass, false);
	}

	public static void setFontProperties(TextView textView, ThemeClassDefinition themeClass, boolean setEnabledColor)
	{
		if (themeClass == null) {
			ThemeDefaults.resetTextColor(textView);
			ThemeDefaults.resetTextSize(textView);
			ThemeDefaults.resetTypeface(textView);
			textView.setPaintFlags(textView.getPaintFlags() & ~Paint.STRIKE_THRU_TEXT_FLAG);
			return;
		}

		ThemeOverrideProperties overrideProperties = null;
		if (textView instanceof IGxOverrideThemeable)
		{
			overrideProperties = ((IGxOverrideThemeable)textView).getThemeOverrideProperties();
		}

		ThemeDefaults.beforeSetThemeProperties(textView);

		// Text Color
		Integer colorId = ThemeUtils.getColorId(themeClass.getColor());
		if (overrideProperties!=null && Strings.hasValue(overrideProperties.getForeColor()))
			colorId = ThemeUtils.getColorId(overrideProperties.getForeColor());

		Integer highlightedColorId = ThemeUtils.getColorId(themeClass.getHighlightedColor());
		if (colorId != null || highlightedColorId != null)
			setTextColor(textView, colorId, highlightedColorId, setEnabledColor);
		else
			ThemeDefaults.resetTextColor(textView);

		// Font Size
		Integer fontSize = themeClass.getFont().getFontSize();
		if (fontSize != null)
			textView.setTextSize(TypedValue.COMPLEX_UNIT_PX, fontSize);
		else
			ThemeDefaults.resetTextSize(textView);

		// Font
		Typeface font = ThemeUtils.getFontFamily(
				themeClass.getTheme(),
				themeClass.getFont().getFontFamily()
		);

		Integer fontStyle = themeClass.getFont().getFontStyle();
		if (fontStyle == null)
			fontStyle = Typeface.NORMAL;

		if (font != null)
			textView.setTypeface(font, fontStyle);
		else if (fontStyle != Typeface.NORMAL)
			textView.setTypeface(textView.getTypeface(), fontStyle);
		else
			ThemeDefaults.resetTypeface(textView);

		if (themeClass.getFont().getStrikeThrough())
			textView.setPaintFlags(textView.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
		else
			textView.setPaintFlags(textView.getPaintFlags() & ~Paint.STRIKE_THRU_TEXT_FLAG);

		// Set hint text color too.
		AttributeThemeClassDefinition attributeThemeClass = Cast.as(AttributeThemeClassDefinition.class, themeClass);
		if (attributeThemeClass != null)
		{
			String inviteMessageColor = attributeThemeClass.getInviteMessageColor();
			Integer inviteMessagedColorId = ThemeUtils.getColorId(inviteMessageColor);

			Integer labelColorId = null;
			if (attributeThemeClass.getLabelClass()!=null)
			{
				String labelColor = attributeThemeClass.getLabelClass().getColor();
				labelColorId = ThemeUtils.getColorId(labelColor);
			}

			if (inviteMessagedColorId != null || labelColorId != null)
			{
				//change this control hint color
				if (inviteMessagedColorId!=null)
					textView.setHintTextColor(inviteMessagedColorId);
				if (colorId == null)
					colorId = textView.getCurrentTextColor();
				setInputTextLayoutColor(textView, colorId, inviteMessagedColorId, labelColorId);
			}
		}
	}

	private static void setInputTextLayoutColor(TextView textView, Integer defaultColorId, Integer inviteColor, Integer labelForeColor)
	{
		TextInputLayout textInputLayout = null;
		if (textView.getParent()!= null && textView.getParent() instanceof TextInputLayout )
		{
			textInputLayout = (TextInputLayout) textView.getParent();
		}
		if (textView.getParent()!= null && textView.getParent().getParent()!=null && textView.getParent().getParent() instanceof TextInputLayout )
		{
			textInputLayout = (TextInputLayout) textView.getParent().getParent();
		}
		if (textInputLayout!=null)
		{
			try
			{
				if (inviteColor!=null)
				{
					Field fDefaultTextColor = TextInputLayout.class.getDeclaredField("defaultHintTextColor");
					fDefaultTextColor.setAccessible(true);

					// color of the floating label when , enable = empty text = hint, pressed = default
					ColorStateList colors = new ColorStateList(
							new int[][]{
									new int[]{android.R.attr.state_enabled},
									new int[]{android.R.attr.state_pressed},
									new int[0],
							},
							new int[]{
									inviteColor,
									defaultColorId,
									defaultColorId,
							});

					fDefaultTextColor.set(textInputLayout, colors);
				}

				if (labelForeColor!=null)
				{
					// color of floating label text when editing.
					Field fFocusedTextColor = TextInputLayout.class.getDeclaredField("focusedTextColor");
					fFocusedTextColor.setAccessible(true);
					fFocusedTextColor.set(textInputLayout, new ColorStateList(new int[][]{{0}}, new int[]{labelForeColor}));
				}

			} catch (IllegalAccessException | NoSuchFieldException e) {
				Services.Log.error("Error getting TextInputLayout inner fields");
			}
		}
	}


	public static void setFontTextColorWithInviteColor(TextView textView, ThemeClassDefinition themeClass)
	{
		if (themeClass == null)
			return;

		ThemeDefaults.beforeSetThemeProperties(textView);

		if (themeClass != null)
		{
			String inviteMessageColor = themeClass.getImageInviteMessageColor();
			Integer inviteMessagedColorId = ThemeUtils.getColorId(inviteMessageColor);
			if (inviteMessagedColorId != null)
			{
				//change this control hint color
				textView.setTextColor(inviteMessagedColorId);
			}
			else
			{
				//set default color
				ThemeDefaults.resetTextColor(textView);
			}
		}

	}


	private static void setTextColor(TextView tv, Integer color, Integer highlightedColor, boolean setEnabledColor)
	{
		if (highlightedColor != null)
		{
			if (color == null)
				color = ThemeDefaults.getDefaultTextColor(tv);

			ColorStateList colors = new ColorStateList(
				new int[][]	{
					new int [] { android.R.attr.state_pressed },
					new int [] { android.R.attr.state_selected },
					new int[0],
				},
				new int[] {
					highlightedColor,
					highlightedColor,
					color,
				});

			if (setEnabledColor)
			{
				// set the enabled color with half alpha of original color
				Integer colorDisabled = Color.argb(Color.alpha(color)/2, Color.red(color), Color.green(color), Color.blue(color));
				colors = new ColorStateList(
						new int[][]	{
								new int [] { android.R.attr.state_pressed },
								new int [] { android.R.attr.state_selected },
								new int [] { -android.R.attr.state_enabled },
								new int[0],
						},
						new int[] {
								highlightedColor,
								highlightedColor,
								colorDisabled,
								color,
						});
			}
			tv.setTextColor(colors);
		}
		else if (color != null)
		{
			if (setEnabledColor)
			{
				// set the enabled color with half alpha of original color
				Integer colorDisabled = Color.argb(Color.alpha(color)/2, Color.red(color), Color.green(color), Color.blue(color));
				ColorStateList colors = new ColorStateList(
						new int[][]	{
								new int [] { -android.R.attr.state_enabled },
								new int[0],
						},
						new int[] {
								colorDisabled,
								color,
						});
				tv.setTextColor(colors);
			}
			else
			{
				tv.setTextColor(color);
			}
		}
	}

	/**
	 * Sets the background properties (image and color) plus border to a specific control.
	 * @param view The view to be themed.
	 * @param themeClass The theme class to apply.
	 * @param options Options (such as how to handle background drawable's size).
	 */
	public static void setBackgroundBorderProperties(View view, ThemeClassDefinition themeClass, BackgroundOptions options)
	{
		if (themeClass == null)
		{
			ThemeDefaults.resetBackground(view);
			return;
		}

		ThemeOverrideProperties overrideProperties = null;
		if (view instanceof IGxOverrideThemeable)
		{
			overrideProperties = ((IGxOverrideThemeable)view).getThemeOverrideProperties();
		}

		ThemeDefaults.beforeSetThemeProperties(view);

		Drawable background = createBackgroundDrawableFromClass(view.getContext(), themeClass, options, overrideProperties);
		background = applyHighlightingFromClass(background, view, themeClass, options);

		if (background != null)
			view.setBackground(background);
		else
			ThemeDefaults.resetBackground(view);

		// "Elevation" is considered part of the border/background, since it involves the shadow.
		setElevation(view, themeClass.getElevation());
	}

	private static Drawable applyHighlightingFromClass(Drawable normalBackground, View view, ThemeClassDefinition themeClass, BackgroundOptions backgroundOptions)
	{
		// In LOLLIPOP map highlighted background color to ripple in touchable controls.
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP &&
			!Strings.hasValue(themeClass.getHighlightedBackgroundImage()) &&
			backgroundOptions != null && backgroundOptions.isActionableControl())
		{
			Integer rippleColor = getColorId(themeClass.getHighlightedBackgroundColor());
			boolean preferNativeFeedback = (backgroundOptions.hasDefaultActionFeedback() && normalBackground == null && rippleColor == null);

			if (rippleColor == null)
				rippleColor = getAndroidThemeColorId(view.getContext(), R.attr.colorControlHighlight);

			if (rippleColor != null && !preferNativeFeedback)
			{
				ColorStateList rippleColorStateList = new ColorStateList(new int[][] { new int[] {} }, new int[] { rippleColor });

				Drawable rippleMask;
				if (normalBackground != null && themeClass.hasBorder())
				{
					GradientDrawable gradientMask = new GradientDrawable();

					if (themeClass.getMaxCornersRadius() >0)
					{
						Integer[] corners = themeClass.getCornersRadius();
						gradientMask.setCornerRadii(new float[]{corners[0], corners[0], corners[1], corners[1],
								corners[2], corners[2], corners[3], corners[3]});
					}

					gradientMask.setStroke(themeClass.getBorderWidth() * 2, Color.TRANSPARENT);
					gradientMask.setColor(Color.WHITE);

					rippleMask = gradientMask;
				}
				else
					rippleMask = new ColorDrawable(Color.WHITE); // Color is irrelevant, must only be a solid drawable that fills a rectangle.

				return new RippleDrawable(rippleColorStateList, normalBackground, rippleMask);
			}
		}

		Drawable highlightedBackground = null;

		if (Strings.hasValue(themeClass.getHighlightedBackgroundColor()) || Strings.hasValue(themeClass.getHighlightedBackgroundImage()))
			highlightedBackground = createBackgroundDrawableFromClass(view.getContext(), themeClass, BackgroundOptions.copy(backgroundOptions).setIsHighlighted(true));

		if (highlightedBackground != null)
		{
			if (normalBackground == null)
				normalBackground = ThemeDefaults.getDefaultBackground(view);

			StateListDrawable stateBackground = new StateListDrawable();
			stateBackground.addState(new int[] { android.R.attr.state_selected }, highlightedBackground);
			stateBackground.addState(new int[] { android.R.attr.state_pressed }, highlightedBackground);
			stateBackground.addState(new int[]{}, normalBackground);
			//stateBackground.addState(new int[] { -android.R.attr.state_enabled }, highlightedBackground );
			return stateBackground;
		}
		else if (normalBackground != null)
		{
			return normalBackground;
		}
		else
			return null;
	}

	/**
	 * Sets the background color of the view to the supplied color value.
	 *
	 * If {@code color} is null, then the original background color of the view (i.e. before any calls to
	 * {@link #setBackgroundBorderProperties(View, ThemeClassDefinition, BackgroundOptions)},
	 * this methods, or related ones.
	 */
	public static void setBackgroundColor(View view, Integer color)
	{
		ThemeDefaults.beforeSetThemeProperties(view);

		if (color != null)
			view.setBackgroundColor(color);
		else
			ThemeDefaults.resetBackground(view);
	}

	/**
	 * Sets the elevation of the view to the supplied value (in Android 5.0 or newer).
	 *
	 * If {@code elevation} is null, then the original elevation of the view is restored (i.e.
	 * before any calls to {@link #setBackgroundBorderProperties(View, ThemeClassDefinition, BackgroundOptions)}
	 * or this method.
	 */
	public static void setElevation(View view, Integer elevation)
	{
		ThemeDefaults.beforeSetThemeProperties(view);

		if (elevation != null)
		{
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
			{
				view.setElevation(elevation);

				// For buttons, the StateListAnimator overrides the specified elevation. So clear it.
				// See http://stackoverflow.com/questions/27080338
				if (view instanceof Button)
					view.setStateListAnimator(null);
			}
		}
		else
			ThemeDefaults.resetElevation(view);
	}

	/**
	 * Sets the background properties (image and color) for the whole activity window.
	 */
	public static void setBackground(Activity activity, ThemeApplicationClassDefinition themeClass)
	{
		Drawable background = createBackgroundDrawableFromClass(activity, themeClass, BackgroundOptions.DEFAULT);
		if (background != null)
			activity.getWindow().setBackgroundDrawable(background);
	}

	/**
	 * Sets the background properties (image, color, and elevation) for the ActionBar.
	 */
	// TODO: Should use TaskDescription constructor with icon resource instead for API >= 28
	@SuppressWarnings("deprecation")
	public static void setActionBarBackground(final Activity activity, final ActionBar actionBar, ThemeApplicationBarClassDefinition themeClass,
											  boolean animateBackgroundChange, ThemeApplicationBarClassDefinition previousClass)
	{
		Drawable background = createBackgroundDrawableFromClass(activity, themeClass, BackgroundOptions.DEFAULT);

		if (background == null)
			background = getActionBarDefaultColor(activity);

		final Integer elevation = themeClass.getElevation();
		if (animateBackgroundChange)
		{
			Drawable oldBackground = createBackgroundDrawableFromClass(activity, previousClass, BackgroundOptions.DEFAULT);
			if (oldBackground == null)
				oldBackground = getActionBarDefaultColor(activity);

			TransitionDrawable changeBackground = new TransitionDrawable(new Drawable[]{oldBackground, background});
			changeBackground.setCrossFadeEnabled(true);

			actionBar.setBackgroundDrawable(changeBackground);
			changeBackground.startTransition(activity.getResources().getInteger(android.R.integer.config_mediumAnimTime));
		}
		else
		{
			if (background != null)
				actionBar.setBackgroundDrawable(background);
		}

		setActionBarElevation(activity, actionBar, elevation);

		// Task color must match the primary color (i.e. the application bar color).
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
		{
			Integer primaryColor = ThemeUtils.getColorId(themeClass.getBackgroundColor());
			if (primaryColor != null)
			{
				// Task description color cannot be transparent
				int taskDescriptionColor = ColorUtils.setAlphaComponent(primaryColor, 0xFF);
				TaskDescription taskDescription = new TaskDescription(null, null, taskDescriptionColor);
				activity.setTaskDescription(taskDescription);
			}
		}
	}

	private static Drawable getActionBarDefaultColor(Activity activity)
	{
		Integer actionBarColor = ThemeUtils.getAndroidThemeColorId(activity, R.attr.colorPrimary);
		if (actionBarColor == null)
			actionBarColor = Color.TRANSPARENT;

		return new ColorDrawable(actionBarColor);
	}

	private static void setActionBarElevation(Activity activity, ActionBar actionBar, Integer elevation)
	{
		//Use platform default elevation value.
		if (elevation == null)
			elevation = (int)activity.getResources().getDimension(R.dimen.action_bar_default_elevation);

		// use a custom control to create the shadow in pre-5.0 devices
		// set elevation to the new shadow control if found.
		View toolbarShadow = activity.findViewById(R.id.toolbar_shadow);
		CustomInsetsRelativeLayout customToolbarContainer = activity.findViewById(R.id.main_content_insets_container);

		if (toolbarShadow!=null && toolbarShadow.getVisibility()!=View.GONE)
		{
			ViewGroup.LayoutParams params = toolbarShadow.getLayoutParams();
			params.height = elevation;
			toolbarShadow.setLayoutParams(params);
			//Services.Log.debug("setActionBarElevation", "elevation shadow view " + elevation);
		}
		// set elevation to container controls that draw shadows, if exists and enable.
		else if (customToolbarContainer!=null && customToolbarContainer.getDrawShadow())
		{
			//Services.Log.debug("setActionBarElevation", "elevation shadow container " + elevation);
			customToolbarContainer.setElevation(elevation);
		}
		else
		{
			// use system toolbar shadow
			//Services.Log.debug("setActionBarElevation", "elevation actionBar " + elevation);
			actionBar.setElevation(elevation);
		}
	}

	@SuppressLint({ "NewApi", "InlinedApi" })
	public static void setStatusBarColor(Activity activity, ThemeApplicationBarClassDefinition themeClass,
										 boolean animateBackgroundChange, ThemeApplicationBarClassDefinition previousThemeClass)
	{
		if (CompatibilityHelper.isStatusBarOverlayingAvailable())
		{
			Integer statusBarColor = getColorId(themeClass.getStatusBarColor());
			if (statusBarColor == null)
			{
				// Reset to original colorPrimaryDark.
				statusBarColor = getStatusBarDefaultColor(activity);
			}

			if (statusBarColor != null)
			{
				if (animateBackgroundChange)
				{
					Integer oldStatusBarColor = null;
					if (previousThemeClass==null)
						Services.Log.debug("no previous theme class");
					else
						oldStatusBarColor = getColorId(previousThemeClass.getStatusBarColor());

					if (oldStatusBarColor == null)
					{
						// Reset to original colorPrimaryDark.
						oldStatusBarColor = getStatusBarDefaultColor(activity);
					}

					if (oldStatusBarColor != null)
					{
						final ValueAnimator valueAnimator = ValueAnimator.ofObject(new ArgbEvaluator(),
								oldStatusBarColor,
								statusBarColor);

						//final GradientDrawable background = (GradientDrawable) view.getBackground();
						final Window myWindow = activity.getWindow();
						final DrawerLayout myDrawerLayout = activity.findViewById(R.id.drawer_layout);
						final FrameLayout myFrameStatusBarLayout = activity.findViewById(R.id.statusBarDummyTop);

						valueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
						{
							@Override
							public void onAnimationUpdate(final ValueAnimator animator)
							{
								//when use slide
								if (myDrawerLayout!=null)
								{
									myDrawerLayout.setStatusBarBackgroundColor((Integer) animator.getAnimatedValue());
									myFrameStatusBarLayout.setBackgroundColor((Integer) animator.getAnimatedValue());
									myWindow.setStatusBarColor(Color.TRANSPARENT);
								}
								else
								{
									// if not slide set status bar normally.
									myWindow.setStatusBarColor((Integer) animator.getAnimatedValue());
								}
							}

						});
						valueAnimator.setDuration(activity.getResources().getInteger(android.R.integer.config_mediumAnimTime));
						valueAnimator.start();
						return;
					}
				}
				setStatusBarColor(activity, statusBarColor);

			}
		}
	}

	@SuppressLint({ "NewApi", "InlinedApi" })
	private static void setStatusBarColor(Activity activity, Integer statusBarColor)
	{
		if (CompatibilityHelper.isStatusBarOverlayingAvailable())
		{
			//when use slide
			DrawerLayout myDrawerLayout = activity.findViewById(R.id.drawer_layout);
			FrameLayout myFrameStatusBarLayout = activity.findViewById(R.id.statusBarDummyTop);
			if (myDrawerLayout!=null)
			{
				myDrawerLayout.setStatusBarBackgroundColor(statusBarColor);
				myFrameStatusBarLayout.setBackgroundColor(statusBarColor);
				activity.getWindow().setStatusBarColor(Color.TRANSPARENT);
			}
			else
			{
				// if not slide set status bar normally.
				activity.getWindow().setStatusBarColor(statusBarColor);
			}
		}
	}

	private static Integer getStatusBarDefaultColor(Activity activity)
	{
		int colorPrimary = R.attr.colorPrimaryDark;
		return ThemeUtils.getAndroidThemeColorId(activity, colorPrimary);
	}

	public static void setTitleFontProperties(Activity activity, ThemeClassDefinition appBarsClass)
	{
		Toolbar actionBarToolbar = activity.findViewById(R.id.action_bar_toolbar);
		if (actionBarToolbar != null)
		{
			try
			{
				// We can set a color with standard methods, but setTextAppearance() only admits resources.
				// Get access to the internal TextView and customize it directly.
				// This is hacky stuff, and may break later. It's working with appcompat_v7 r23.0.1.
				TextView titleView = (TextView)ReflectionHelper.getField(actionBarToolbar, "mTitleTextView");

				if (titleView == null && TextUtils.isEmpty(actionBarToolbar.getTitle()))
				{
					// Force the creation of mTitleView. Another hack :(
					actionBarToolbar.setTitle(" ");
					actionBarToolbar.setTitle("");
					titleView = (TextView)ReflectionHelper.getField(actionBarToolbar, "mTitleTextView");
				}

				if (titleView != null)
					setFontProperties(titleView, appBarsClass);
			} catch (IllegalAccessException | NoSuchFieldException e) {
				Services.Log.warning("Exception trying to reflect title view", e);
			}
		}
	}

	public static void setAppBarIconImage(ActionBar bar, ThemeApplicationBarClassDefinition appBarsClass)
	{
		Drawable iconImage = createDrawableImageFromClass(bar.getThemedContext(), appBarsClass, appBarsClass.getIcon());
		if (iconImage != null)
			bar.setIcon(iconImage);
	}

	public static void setAppBarTitleImage(Activity activity, ActionBar bar, ThemeApplicationBarClassDefinition appBarsClass)
	{
		Drawable titleImage = createDrawableImageFromClass(activity, appBarsClass, appBarsClass.getTitleImage());
		if (titleImage != null)
		{
			ImageView imageView = new ImageView(activity);
			imageView.setImageDrawable(titleImage);
			imageView.setAdjustViewBounds(true);

			ActionBar.LayoutParams params = new ActionBar.LayoutParams(ActionBar.LayoutParams.WRAP_CONTENT, ActionBar.LayoutParams.WRAP_CONTENT);
			params.gravity = GravityCompat.START | Gravity.CENTER_VERTICAL;
			bar.setCustomView(imageView, params);

			// Show image, hide title
			bar.setDisplayOptions(ActionBar.DISPLAY_SHOW_CUSTOM, ActionBar.DISPLAY_SHOW_TITLE | ActionBar.DISPLAY_SHOW_CUSTOM);
		}
		else
		{
			bar.setDisplayOptions(ActionBar.DISPLAY_SHOW_TITLE, ActionBar.DISPLAY_SHOW_TITLE | ActionBar.DISPLAY_SHOW_CUSTOM);
		}
	}

	public static void setAlertDialogTitleFontProperties(ThemeClassDefinition progressThemeClassDefinition, final AlertDialog dialog )
	{
		ThemeClassDefinition titleThemeClass = progressThemeClassDefinition.getProgressThemeTitleClass();
		int textViewId = dialog.getContext().getResources().getIdentifier("android:id/alertTitle", null, null);
		TextView textView = dialog.findViewById(textViewId);
		if (titleThemeClass!=null && textView!=null)
		{
			ThemeUtils.setFontProperties(textView, titleThemeClass);
		}

	}

	public static void setAlertDialogMessageFontProperties(ThemeClassDefinition progressDescriptionThemeClassDefinition, final AlertDialog dialog )
	{
		try
		{
			// We can set a color with standard methods, but setTextAppearance() only admits resources.
			// Get access to the internal TextView and customize it directly.
			// This is hacky stuff, and may break later.
			TextView messageView = (TextView) ReflectionHelper.getField(dialog, "mMessageView");

			if (messageView != null)
				setFontProperties(messageView, progressDescriptionThemeClassDefinition);
		} catch (IllegalAccessException | NoSuchFieldException e) {
			Services.Log.warning("Exception trying to reflect dialog message view", e);
		}
	}

	public static Drawable createBackgroundDrawableFromClass(Context context, ThemeClassDefinition themeClass, BackgroundOptions options)
	{
		return createBackgroundDrawableFromClass(context, themeClass, options, null);
	}

	public static Drawable createBackgroundDrawableFromClass(Context context, ThemeClassDefinition themeClass, BackgroundOptions options, ThemeOverrideProperties overrideProperties)
	{
		if (themeClass == null)
			return null;

		// Background and Border.
		GxGradientDrawable gradient = null;
		if (overrideProperties!=null &&	Strings.hasValue(overrideProperties.getBackgroundColor()) )
		{
			gradient = new GxGradientDrawable();
			gradient.setThemeClass(context, themeClass, options.getIsHighlighted(), overrideProperties);
		}
		else if (themeClass.hasBackgroundColor(options.getIsHighlighted()) || themeClass.hasBorder())
		{
			gradient = new GxGradientDrawable();
			gradient.setThemeClass(context, themeClass, options.getIsHighlighted(), null);
		}

		String image = themeClass.getBackgroundImage();
		if (overrideProperties!=null &&	Strings.hasValue(overrideProperties.getBackgroundImage()) )
			image = overrideProperties.getBackgroundImage();

		if (options.getIsHighlighted() && Strings.hasValue(themeClass.getHighlightedBackgroundImage()))
			image = themeClass.getHighlightedBackgroundImage();

		if (image.length() > 0)
		{
			Drawable back = Services.Images.getStaticImage(context, image);
			if (back != null)
			{
				if (gradient == null)
				{
					BitmapDrawable bitmap = Cast.as(BitmapDrawable.class, back);
					if (bitmap != null)
					{
						// Always create a new gradient for each new background image.
						gradient = createGradientFromBitmap(bitmap, themeClass.getBackgroundImageMode(), options.getUseBitmapSize());
						return gradient;
					}
					return back;
				}
				else
				{
					// Set the gradient's size from the bitmap if specified.
					if (options.getUseBitmapSize() && back instanceof BitmapDrawable)
					{
						BitmapDrawable backBitmap = (BitmapDrawable)back;
						gradient.setSize(backBitmap.getIntrinsicWidth(), backBitmap.getIntrinsicHeight());
					}

					gradient.setBackground(back);
				}
			}
		}
		return gradient;
	}

	private static Drawable createDrawableImageFromClass(Context context, ThemeClassDefinition themeClass, String imageName)
	{
		if (imageName.length() > 0)
		{
			Drawable back = Services.Images.getStaticImage(context, imageName);
			if (back != null)
			{
				BitmapDrawable bitmap = Cast.as(BitmapDrawable.class, back);
				if (bitmap != null)
				{
					// Always create a new gradient for each new background image. Initialize it with the image size.
					return createGradientFromBitmap(bitmap, themeClass.getBackgroundImageMode(), true);
				}
				else
					return back;
			}
		}

		return null;
	}

	private static GxGradientDrawable createGradientFromBitmap(BitmapDrawable bitmap, BackgroundImageMode imageMode, boolean useBitmapSize)
	{
		GxGradientDrawable gradient;
		gradient = new GxGradientDrawable();

		if (useBitmapSize)
			gradient.setSize(bitmap.getIntrinsicWidth(), bitmap.getIntrinsicHeight());

		// Set the image as background.
		gradient.setColor(Color.TRANSPARENT);
		gradient.setBackground(bitmap);
		gradient.setBackgroundImageMode(imageMode);
		return gradient;
	}

	public static void setBackground(TableDefinition tableDef, ViewGroup rootView, ThemeClassDefinition themeClass)
	{
		if (Strings.hasValue(tableDef.getBackground()))
		{
			//String key = themeClass + MetadataLoader.getObjectName(tableDef.getBackground());
			setBackground(rootView.getContext(), tableDef.getBackground(), rootView, themeClass);
		}
	}

	private static void setBackground(Context context, String background, ViewGroup rootView, ThemeClassDefinition themeClass)
	{
		Drawable back = Services.Images.getStaticImage(context, MetadataLoader.getObjectName(background));
		if (back != null)
		{
			if (themeClass != null)
			{
				GxGradientDrawable draw = new GxGradientDrawable();
				draw.setThemeClass(context, themeClass, false, null);
				draw.setBackground(back);
				back = draw;
			}

			rootView.setBackground(back);
		}
	}

	public static String getAndroidThemeColor(Context context, int attr) {
		TypedValue tv = new TypedValue();
		context.getTheme().resolveAttribute(attr, tv, true);

	    //System.out.println("tv.string=" + tv.string);
	    //System.out.println("tv.coerced=" + tv.coerceToString());
	    String color = "#ffffff";
	    try
	    {
	    	int colorId = ContextCompat.getColor(context, tv.resourceId);
	    	//System.out.println("colorResourceId=" + colorId);
	    	color = "#"+Integer.toHexString(colorId).substring(2);
	    }
	    catch(Resources.NotFoundException ex)
	    {
	    	if (tv.coerceToString().toString().length()==9)
	    	color = "#"+ tv.coerceToString().toString().substring(3);
	    }
		return color;
	}

	public static Integer getAndroidThemeColorId(Context context, int attr)
	{
		final int[] attrs = new int[] { attr };
		TypedArray a = context.obtainStyledAttributes(null, attrs);
		try
		{
			return (a.hasValue(0) ? a.getColor(0, 0) : null);
		}
		finally
		{
			a.recycle();
		}
	}

	public static int getAndroidThemeColor(Context context, @AttrRes int attr, @ColorInt int defaultValue)
	{
		Integer value = getAndroidThemeColorId(context, attr);
		return (value != null ? value : defaultValue);
	}

	public static void setMargins(ViewGroup.MarginLayoutParams lp, ThemeClassDefinition themeClass)
	{
		LayoutBoxMeasures margins = themeClass.getMargins();
		lp.setMargins(margins.left, margins.top, margins.right, margins.bottom);
	}

	public static void setPadding(View view, ThemeClassDefinition themeClass)
	{
		LayoutBoxMeasures padding = themeClass.getPadding();
		view.setPadding(padding.left, padding.top, padding.right, padding.bottom);
	}
}
