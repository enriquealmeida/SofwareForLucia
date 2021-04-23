package com.artech.controls;

import android.content.Context;
import android.text.InputType;
import android.view.Gravity;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.ui.Coordinator;

public class GxEditTextPhone extends GxEditText{
	public GxEditTextPhone(Context context, Coordinator coordinator, LayoutItemDefinition def) {
		super(context, coordinator, def);
		this.setInputType(InputType.TYPE_CLASS_PHONE);
		setGravity(Gravity.END);
		setMaxEms(10);
	}
}
