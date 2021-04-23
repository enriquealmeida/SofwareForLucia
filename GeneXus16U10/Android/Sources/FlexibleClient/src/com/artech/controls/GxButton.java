package com.artech.controls;

import android.content.Context;
import android.graphics.drawable.Drawable;
import androidx.appcompat.widget.AppCompatButton;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;

import com.artech.android.analytics.IGxAnalyticsControl;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.layout.LayoutActionDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.UIActionHelper;
import com.artech.controls.common.FocusHelper;
import com.artech.controls.common.IAdjustContentSizeText;
import com.artech.controls.common.TextViewUtils;
import com.artech.ui.Coordinator;
import com.artech.utils.ThemeUtils;

import org.jetbrains.annotations.NotNull;

public class GxButton extends LinearLayout implements IGxActionControl, IGxThemeable, IGxLocalizable, IAdjustContentSizeText, IGxAnalyticsControl
{
	private Coordinator mCoordinator;
	private LayoutActionDefinition mLayoutAction;

	private Entity mEntity; // Optional, only for "in grid" buttons.

	// Child control(s).
	private View mControl;
	private Button mButton;
	private ThemedViewHelper mThemedHelper;
	private ThemedViewHelper mThemedHelperControl;

	public GxButton(Context context, AttributeSet attrs)
	{
		super(context, attrs);
		mButton = new AppCompatButton(context);
		mThemedHelper = new ThemedViewHelper(this, null);
		mThemedHelperControl = new ThemedViewHelper(mButton, null);
		mThemedHelper.setScope(true, false, false);
		mThemedHelperControl.setScope(false, true, true);
	}

	public GxButton(Context context, Coordinator coordinator, LayoutActionDefinition layoutAction)
	{
		super(context);
		mCoordinator = coordinator;

		// Get action definition from layout parent and set button properties from there.
		mLayoutAction = layoutAction;

		mControl = createControl(context, mLayoutAction);
		mControl.setOnClickListener(mOnClickListener);
		FocusHelper.removeFocusabilityIfNecessary(mControl, layoutAction);

		mThemedHelper = new ThemedViewHelper(this, null);
		mThemedHelperControl = new ThemedViewHelper(mControl, layoutAction);
		mThemedHelper.setScope(true, false, false);
		mThemedHelperControl.setScope(false, true, true);

		// Respect size if specified.
		int width = (mLayoutAction.getWidth() != 0 ? mLayoutAction.getWidth() : LinearLayout.LayoutParams.MATCH_PARENT);
		int height = (mLayoutAction.getHeight() != 0 ? mLayoutAction.getHeight() : LinearLayout.LayoutParams.MATCH_PARENT);

		mControl.setLayoutParams(new LinearLayout.LayoutParams(width, height));
		setGravity(mLayoutAction.getCellGravity());

		addView(mControl);
	}

	private static View createControl(Context context, LayoutActionDefinition layoutAction)
	{
		String caption = layoutAction.getCaption();

		// If image and no caption, use image. If there is caption, use a button (with or without image).
		if (Services.Strings.hasValue(layoutAction.getImage()) && !Services.Strings.hasValue(caption))
		{
			Drawable actionImage = UIActionHelper.getActionImage(context, layoutAction);
			if (actionImage != null)
			{
				ImageView imageView = new ImageView(context);
				imageView.setImageDrawable(actionImage);
				return imageView;
			}
			else
			{
				// If the image is not there, and there is no caption either, make up a caption from
				// the name. Otherwise a blank will be displayed, although the action is still clickable!
				caption = layoutAction.getEventName();
			}
		}

		Button button = new AppCompatButton(context);
		TextViewUtils.setText(button, caption, layoutAction);
		UIActionHelper.setActionButtonImage(context, layoutAction, layoutAction.getImagePosition(), button);

		return button;
	}

	private final OnClickListener mOnClickListener = new OnClickListener()
	{
		@Override
		public void onClick(View v)
		{
			// On child control click, fire composite click.
			// Apparently button touches are not reported to coordinator, do so.
			boolean handled = (mCoordinator != null && mCoordinator.runControlEvent(GxButton.this, GxTouchEvents.TAP));

			if (!handled)
			{
				// Calling performClick() causes a repeat click sound. Use callOnClick() instead.
				callOnClick();
			}
		}
	};

	@Override
	public ActionDefinition getAction()
	{
		return mLayoutAction.getEvent();
	}

	@Override
	public Entity getEntity()
	{
		return mEntity;
	}

	@Override
	public void setEntity(Entity entity)
	{
		mEntity = entity;
	}

	@Override
	public void setEnabled(boolean enabled)
	{
		super.setEnabled(enabled);
		if (mControl != null)
			mControl.setEnabled(enabled);
	}

	public void setAttributes(int caption, int width, int height)
	{
		mButton.setText(caption);
		mButton.setOnClickListener(mOnClickListener);
		mButton.setLayoutParams(new LinearLayout.LayoutParams(width, height));

		mControl = mButton;
		addView(mButton);
	}

	public String getCaption()
	{
		if (mControl != null && mControl instanceof Button)
			return ((Button)mControl).getText().toString();
		else
			return Strings.EMPTY;
	}

	public void setCaption(String caption)
	{
		if (mControl != null)
		{
			// Set caption property
			if (mControl instanceof Button)
				TextViewUtils.setText((Button) mControl, caption, mLayoutAction);
		}
	}

	@Override
	public void setThemeClass(ThemeClassDefinition themeClass) {
		mThemedHelper.setThemeClass(themeClass);
		mThemedHelperControl.setThemeClass(themeClass);
		applyControlClass(themeClass);
	}

	@Override
	public ThemeClassDefinition getThemeClass() {
		return mThemedHelper.getThemeClass();
	}

	@Override
	public void applyClass(ThemeClassDefinition themeClass) {
		if (mControl != null) {
			mThemedHelper.applyClass(themeClass);
			mThemedHelperControl.applyClass(themeClass);
			applyControlClass(themeClass);
		}
	}

	private void applyControlClass(ThemeClassDefinition themeClass) {
		// Set font properties
		if (mControl instanceof Button)
		{
			ThemeUtils.setFontProperties((Button) mControl, themeClass, true);

			// if all caps is false
			if (!themeClass.getFontAllCaps())
				((Button) mControl).setAllCaps(false);
		}
	}

	@Override
	public void setLayoutParams(ViewGroup.LayoutParams params) {
		super.setLayoutParams(params);
		mThemedHelper.setLayoutParams(params);
		mThemedHelperControl.setLayoutParams(params);
	}

	@Override
	public void onTranslationChanged() {
		setCaption(mLayoutAction.getCaption());
	}

	public View getInnerControl()
	{
		return mControl;
	}

	@Override
	public void adjustContentSize() {
		mControl.setLayoutParams(new LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT));
	}

	@NotNull
	@Override
	public String getLabel() {
		return getCaption();
	}

	@Override
	public long getValue() {
		return 0;
	}
}
