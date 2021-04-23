package com.genexus.coreusercontrols;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import androidx.appcompat.widget.SwitchCompat;
import android.widget.CompoundButton;
import android.widget.CompoundButton.OnCheckedChangeListener;
import android.widget.LinearLayout;

import com.artech.base.metadata.enums.Alignment;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.controls.IGxEdit;
import com.artech.controls.IManualAlignment;
import com.artech.ui.Coordinator;
import com.artech.utils.Cast;

@SuppressLint("ViewConstructor")
public class GxSwitch extends SwitchCompat implements IGxEdit, OnCheckedChangeListener, IManualAlignment {
	public static final String NAME = "SDSwitch";
	private String mCheckedValue = "";
	private String mUncheckedValue = "";
	private Coordinator mCoordinator = null;
	private boolean mFireControlValueChanged;
	private LayoutItemDefinition mItemDefinition;

	public GxSwitch(Context context, Coordinator coordinator, LayoutItemDefinition item) {
		super(context);

		mCheckedValue = item.getControlInfo().optStringProperty("@SDSwitchCheckedValue");
		mUncheckedValue = item.getControlInfo().optStringProperty("@SDSwitchUncheckedValue");
		mCoordinator = coordinator;
		mFireControlValueChanged = true;
		mItemDefinition = item;

		setOnCheckedChangeListener(this);
	}

	@Override
	public String getGxValue() {
		return isChecked() ? mCheckedValue : mUncheckedValue;
	}

	@Override
	public void setGxValue(String value) {
		boolean currentState = isChecked();
		boolean newState = value != null && value.equalsIgnoreCase(mCheckedValue);

		if (newState != currentState) {
			mFireControlValueChanged = false;
			setChecked(newState);
			mFireControlValueChanged = true;
		}
	}

	@Override
	public String getGxTag() {
		return (String) this.getTag();
	}

	@Override
	public void setGxTag(String data) {
		this.setTag(data);
	}

	@Override
	public void setValueFromIntent(Intent data) {
	}

	@Override
	public void setEnabled(boolean enabled) {
		super.setEnabled(enabled);
		super.setFocusable(enabled);
	}

	@Override
	public IGxEdit getViewControl() {
		setEnabled(false);
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
		if (mCoordinator != null)
			mCoordinator.onValueChanged(this, mFireControlValueChanged);
	}

	@Override
	public boolean isEditable() {
		return isEnabled(); // Editable when enabled.
	}

	@Override
	public void applyAlignment() {
		// SwitchCompat always draw the control aligned to the right, to simulate alignment we use the rightMargin
		int margin = -1;
		switch (mItemDefinition.getCellGravity() & Alignment.HORIZONTAL_MASK) {
			case Alignment.LEFT:
				margin = getWidth() - getCompoundPaddingRight(); // getCompoundPaddingRight() is used because inspecting the code it returns mSwitchWidth
				break;
			case Alignment.CENTER_HORIZONTAL:
				margin = (getWidth() - getCompoundPaddingRight()) / 2;
				break;
		}

		if (margin >= 0) {
			LinearLayout.LayoutParams params = Cast.as(LinearLayout.LayoutParams.class, getLayoutParams());
			if (params != null && margin != params.rightMargin) {
				params.rightMargin = margin;
				setLayoutParams(params);
			}
		}
	}
}
