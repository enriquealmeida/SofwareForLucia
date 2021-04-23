package com.artech.controls;

import android.content.Context;
import android.content.Intent;
import android.graphics.Paint;
import androidx.annotation.NonNull;
import androidx.appcompat.widget.AppCompatTextView;
import android.text.TextUtils;
import android.text.method.LinkMovementMethod;
import android.util.AttributeSet;

import com.artech.base.controls.IGxEditThemeable;
import com.artech.base.controls.IGxOverrideThemeable;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeOverrideProperties;
import com.artech.base.services.IValuesFormatter;
import com.artech.common.FormatHelper;
import com.artech.controls.common.EditInputDescriptions;
import com.artech.controls.common.TextViewFormatter;
import com.artech.controls.common.TextViewUtils;
import com.artech.ui.Coordinator;
import com.artech.utils.BackgroundOptions;
import com.artech.utils.ThemeUtils;

public class GxTextView extends AppCompatTextView implements IGxEdit, IGxThemeable, IGxEditThemeable, IGxOverrideThemeable
{
	protected LayoutItemDefinition mDefinition;
	private TextViewFormatter mFormatter;
	private ThemeClassDefinition mClassDefinition;

	private String mValue;

	private ThemeClassDefinition mThemeClass;
	private ThemeOverrideProperties mThemeOverrideProperties = new ThemeOverrideProperties();
	private boolean mSetMaxSize = true;

	public GxTextView(Context context, LayoutItemDefinition definition)
	{
		this(context, null, definition);
	}

	public GxTextView(Context context, Coordinator coordinator, LayoutItemDefinition definition)
	{
		this(context, coordinator, definition, null);
	}

	public GxTextView(Context context, Coordinator coordinator, LayoutItemDefinition definition, IValuesFormatter formatter)
	{
		super(context);
		mDefinition = definition;

		if (formatter == null && definition != null)
		{
			if (coordinator != null && EditInputDescriptions.isInputTypeDescriptions(definition))
				formatter = new EditInputDescriptions(coordinator, definition).getValuesFormatter();
			else
				formatter = FormatHelper.getFormatter(definition.getDataItem());
		}

		mFormatter = new TextViewFormatter(this, formatter);

		TextViewUtils.configureBreakStrategy(this);

	}

	public void setSetMaxSize(boolean setMaxSize) {
		mSetMaxSize = setMaxSize;
	}

	@Override
	protected void onSizeChanged(int w, int h, int oldw, int oldh) {
		super.onSizeChanged(w, h, oldw, oldh);
		if (mDefinition != null && !mDefinition.hasAutoGrow() && mSetMaxSize) {
			Paint.FontMetrics fm = getPaint().getFontMetrics();
			float fontHeight = fm.bottom - fm.top + fm.leading;
			int maxLines = (int) Math.floor(h / fontHeight);
			setMaxLines(Math.max(1, maxLines));
			setEllipsize(TextUtils.TruncateAt.END);
		}
	}

	public GxTextView(Context context, AttributeSet attrs)
	{
		super(context, attrs);
	}

	@Override
	public String getGxValue() {
		return mValue;
	}

	@Override
	public void setGxValue(String value)
	{
		mValue = value;

		if (mFormatter != null && !mDefinition.isHtml()) {
			mFormatter.setText(mValue);
		}
		else {
			TextViewUtils.setText(this, mValue, mDefinition);
			setMovementMethod(LinkMovementMethod.getInstance()); // Enable link click
		}
	}


	@Override
	public String getGxTag() {
		return (String)this.getTag();
	}

	@Override
	public void setGxTag(String data) {
		this.setTag(data);
	}

	@Override
	public void setValueFromIntent(Intent data) { }


	@Override
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public void setThemeClass(ThemeClassDefinition themeClass)
	{
		mClassDefinition = themeClass;
		applyClass(themeClass);
	}

	@Override
	public ThemeClassDefinition getThemeClass() {
		return mClassDefinition;
	}

	@Override
	public void applyClass(ThemeClassDefinition themeClass)
	{
		ThemeUtils.setFontProperties(this, themeClass);
		ThemeUtils.setBackgroundBorderProperties(this, themeClass, BackgroundOptions.defaultFor(mDefinition));
	}

	@Override
	public void applyEditClass(@NonNull ThemeClassDefinition themeClass)
	{
		ThemeUtils.setFontProperties(this, themeClass);
	}

	@Override
	public boolean isEditable()
	{
		return false; // Never editable.
	}

	// needed for override EditText foreColor
	@Override
	public void setOverride(String propertyName, String propertyValue)
	{
		mThemeOverrideProperties.setOverride(propertyName, propertyValue);
		applyEditClass(mThemeClass);
	}

	@Override
	public ThemeOverrideProperties getThemeOverrideProperties()
	{
		return mThemeOverrideProperties;
	}

}
