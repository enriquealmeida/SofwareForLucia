package com.genexus.coreusercontrols;

import java.text.NumberFormat;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import androidx.annotation.NonNull;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.SeekBar;
import android.widget.TextView;

import com.artech.R;
import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.controls.IGxEditThemeable;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.controls.IGxEdit;
import com.artech.ui.Coordinator;
import com.artech.utils.Cast;
import com.artech.utils.DrawableUtils;
import com.artech.utils.ThemeUtils;

public class SeekBarControl extends LinearLayout implements IGxEdit, IGxEditThemeable, IGxControlRuntime
{
	public static final String NAME = "SDSlider";
	private static final String PROPERTY_MIN_VALUE = "MinValue";
	private static final String PROPERTY_MAX_VALUE = "MaxValue";
	private static final String PROPERTY_STEP = "Step";

	private LayoutItemDefinition mDefinition;
	private Coordinator mCoordinator;

	private TextView mTextCurrent;
	private TextView mTextMin;
	private TextView mTextMax;
	private SeekBar mSeekBar;
	private String mLastValue;

	private int mMaxValue;
	private double seekBarMinValue;
	private double seekBarMaxValue;
	private double seekBarStep;

	public SeekBarControl(Context context, Coordinator coordinator, LayoutItemDefinition def) {
		super(context);
		LayoutInflater inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	    if (inflater != null)
	       inflater.inflate(com.artech.R.layout.seekbarcontrol, this, true);
	    mCoordinator = coordinator;
	    setLayoutDefinition(def);
	    init();
	}

	public SeekBarControl(Context context, AttributeSet attrs) {
		super(context, attrs);
		LayoutInflater inflater = (LayoutInflater)context.getSystemService(Context.LAYOUT_INFLATER_SERVICE);
	    if(inflater != null)
	       inflater.inflate(com.artech.R.layout.seekbarcontrol, this, true);

	    init();
	}

	@Override
	public String getGxValue() {
		return getCurrentValue();
	}

	@Override
	public void setGxValue(String value) {
		setCurrentValue(value);
		mLastValue = getCurrentValue();
	}

	@Override
	public String getGxTag() {
		return getTag().toString();
	}

	@Override
	public void setGxTag(String tag) {
		setTag(tag);
	}

	private void init()
	{
		mSeekBar = findViewById(R.id.seekBar);
		mTextCurrent = findViewById(R.id.textCurrent);
		mTextMin = findViewById(R.id.textMin);
		mTextMax = findViewById(R.id.textMax);

		// Do not show texts as specified
		mTextCurrent.setVisibility(GONE);
		mTextMin.setVisibility(GONE);
		mTextMax.setVisibility(GONE);

		mSeekBar.setMax(mMaxValue);
		mSeekBar.incrementProgressBy(1);
		mTextMin.setText(String.valueOf(seekBarMinValue));
		mTextMax.setText(String.valueOf(seekBarMaxValue));

		mLastValue = "";

		final View control = this;
		mSeekBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener()
		{
			@Override
			public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser)
			{
				if (mTextCurrent.isShown())
					mTextCurrent.setText(getCurrentValue());
			}

			@Override
			public void onStartTrackingTouch(SeekBar seekBar) { }

			@Override
			public void onStopTrackingTouch(SeekBar seekBar)
			{
				if (mCoordinator!=null)
					mCoordinator.runControlEvent(control, "ValueChanged");

				if (!getCurrentValue().equals(mLastValue) && mCoordinator != null) {
					mCoordinator.onValueChanged(SeekBarControl.this, true);
				}

				mLastValue = getCurrentValue();
			}
		});
	}

	@Override
	public void setValueFromIntent(Intent data) { }

	@Override
	public void setEnabled(boolean enabled)
	{
		mSeekBar.setEnabled(enabled);
		mTextMin.setEnabled(enabled);
		mTextMax.setEnabled(enabled);
		mTextCurrent.setEnabled(enabled);
	}

	@Override
	public IGxEdit getViewControl()
	{
		setEnabled(false);
		return this;
	}

	@Override
	public IGxEdit getEditControl()
	{
		return this;
	}

	private void setCurrentValue(String value)
	{
		int numberOfDecimals = mDefinition.getDataItem().getDecimals();
		double val = Double.parseDouble(value);

		int progress;
		if (seekBarStep == 0)
			progress = (int) ((val - seekBarMinValue) * Math.pow(10, numberOfDecimals));
		else
			progress = (int) ((val - seekBarMinValue) / seekBarStep);

		mSeekBar.setProgress(progress);
	}

	private String getCurrentValue()
	{
		int numberOfDecimals = mDefinition.getDataItem().getDecimals();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setGroupingUsed(false);
        nf.setMaximumFractionDigits(numberOfDecimals);
		if (seekBarStep == 0) {
			return nf.format((seekBarMinValue + (mSeekBar.getProgress() / Math.pow(10, numberOfDecimals))));
		}
		else {
			return nf.format((seekBarMinValue + (mSeekBar.getProgress() * seekBarStep)));
		}
	}

	private void calculateSettings(LayoutItemDefinition layoutItemDefinition) {
		int numberOfDecimals = layoutItemDefinition.getDataItem().getDecimals();
		if (seekBarStep == 0) {
				int maxValue = (int) (seekBarMaxValue *  Math.pow(10, numberOfDecimals));
				int minValue = (int) (seekBarMinValue * Math.pow(10, numberOfDecimals));
				mMaxValue = maxValue - minValue;
		} else
			if (seekBarStep > 0)
				mMaxValue = (int) ((seekBarMaxValue - seekBarMinValue) / seekBarStep);
	}

	private void updateSeekbar()
	{
		calculateSettings(mDefinition);
		mSeekBar.setMax(mMaxValue);
	}

	private void setLayoutDefinition(LayoutItemDefinition layoutItemDefinition)
	{
		mDefinition = layoutItemDefinition;
		ControlInfo info = layoutItemDefinition.getControlInfo();
		if (info == null)
			return;

		seekBarMinValue = Services.Strings.tryParseDouble(info.optStringProperty("@SDSliderMinValue"), 0);
		seekBarMaxValue = Services.Strings.tryParseDouble(info.optStringProperty("@SDSliderMaxValue"), 10);
		seekBarStep = Services.Strings.tryParseDouble(info.optStringProperty("@SDSliderStep"), 0);
		if (seekBarMinValue > seekBarMaxValue)
			resetValues();

		calculateSettings(layoutItemDefinition);
	}

	private void resetValues()
	{
		seekBarMinValue = 0;
		seekBarMaxValue = 10;
		seekBarStep = 1;
	}

	@Override
	public void setPropertyValue(String name, Value value)
	{
		boolean isChanged = false;
		String currentValue = getGxValue();

		if (PROPERTY_MIN_VALUE.equalsIgnoreCase(name) && value != null)
		{
			seekBarMinValue = value.coerceToDouble(0);
			isChanged = true;
		}
		else if (PROPERTY_MAX_VALUE.equalsIgnoreCase(name) && value != null)
		{
			seekBarMaxValue = value.coerceToDouble(10);
			isChanged = true;
		}
		else if (PROPERTY_STEP.equalsIgnoreCase(name) && value != null)
		{
			seekBarStep = value.coerceToDouble(0);
			isChanged = true;
		}

		if (isChanged)
		{
			// Update calculations and visual position in seekbar.
			updateSeekbar();
			setCurrentValue(currentValue);
		}
	}

	@Override
	public Value getPropertyValue(String name)
	{
		if (PROPERTY_MIN_VALUE.equalsIgnoreCase(name)) {
			return Value.newDouble(seekBarMinValue);
		}
		else if (PROPERTY_MAX_VALUE.equalsIgnoreCase(name)) {
			return Value.newDouble(seekBarMaxValue);
		}
		else if (PROPERTY_STEP.equalsIgnoreCase(name)) {
			return Value.newDouble(seekBarStep);
		}
		return null;
	}

	@Override
	public void applyEditClass(@NonNull ThemeClassDefinition themeClass)
	{
		Integer progressColor = ThemeUtils.getColorId(themeClass.getColor());
		LayerDrawable layers = Cast.as(LayerDrawable.class, mSeekBar.getProgressDrawable());

		// Enable reverting to original color, which is colorControlActivated according to support TintManager.
		if (progressColor == null)
			progressColor = ThemeUtils.getAndroidThemeColorId(getContext(), R.attr.colorControlActivated);

		if (progressColor != null && layers != null)
		{
			Drawable progressDrawable = layers.findDrawableByLayerId(android.R.id.progress);
			if (progressDrawable != null)
			{
				progressDrawable = DrawableUtils.applyTint(progressDrawable, progressColor);
				layers.setDrawableByLayerId(android.R.id.progress, progressDrawable);
			}

			Drawable thumb = mSeekBar.getThumb();
			if (thumb != null)
			{
				thumb = DrawableUtils.applyTint(thumb, progressColor);
				mSeekBar.setThumb(thumb);
			}

			invalidate();
		}
	}

	@Override
	public boolean isEditable()
	{
		return isEnabled(); // Editable when enabled.
	}
}
