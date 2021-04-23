package com.artech.controls;

import android.content.Context;
import android.content.Intent;

import com.artech.base.controls.IGxEditThemeable;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.google.android.material.textfield.TextInputLayout;

import com.artech.android.layout.ControlHelper;
import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.metadata.expressions.Expression.Value;

import androidx.annotation.NonNull;

public class GxTextInputLayout extends TextInputLayout implements IGxEdit, IGxControlRuntime, IGxEditThemeable
{
	private final GxEditText mEditText;

	public GxTextInputLayout(Context context, GxEditText editText) {
		super(context);
		mEditText = editText;
	}

	@Override
	public String getGxValue() {
		return mEditText.getGxValue();
	}

	@Override
	public void setGxValue(String value) {
		mEditText.setGxValue(value);
	}

	@Override
	public String getGxTag() {
		return (String)getTag();
	}

	@Override
	public void setGxTag(String tag) {
		setTag(tag);
	}

	@Override
	public void setValueFromIntent(Intent data) { }

	@Override
	public void setEnabled(boolean enabled) {
		super.setEnabled(enabled);
	}

	@Override
	public boolean isEditable() {
		return isEnabled();
	}

	@Override
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public void setPropertyValue(String name, Value value) {
		if (ControlHelper.PROPERTY_ISPASSWORD.equalsIgnoreCase(name)) {
			mEditText.setPropertyValue(name, value);
		}
	}

	@Override
	public Value getPropertyValue(String name) {
		if (ControlHelper.PROPERTY_ISPASSWORD.equalsIgnoreCase(name)) {
			return mEditText.getPropertyValue(name);
		} else {
			return null;
		}
	}

	public void setCaption(String caption) {
		setHint(caption);
	}

	@Override
	public void applyEditClass(@NonNull ThemeClassDefinition themeClass)
	{
		mEditText.applyEditClass(themeClass);
	}

	@Override
	public void setTag(int key, final Object tag)
	{
		// set tag to child edit text.
		mEditText.setTag( key, tag);
		super.setTag(key, tag);
	}
}
