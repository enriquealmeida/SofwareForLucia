package com.genexus.coreusercontrols;

import java.util.List;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.os.SystemClock;
import androidx.annotation.NonNull;
import android.widget.Chronometer;

import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.controls.IGxEditThemeable;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.controls.IGxEdit;
import com.artech.ui.Coordinator;
import com.artech.utils.ThemeUtils;

@SuppressLint("ViewConstructor")
public class GxChronometer extends Chronometer implements IGxEdit,
														  IGxEditThemeable,
														  IGxControlRuntime,
														  Chronometer.OnChronometerTickListener {
	public static final String NAME = "SDChronometer";
	private static final String PROPERTY_TICK_INTERVAL = "TickInterval";
	private static final String PROPERTY_MAX_VALUE = "MaxValue";
	private static final String PROPERTY_MAX_VALUE_TEXT = "MaxValueText";

	private static final String METHOD_START = "Start";
	private static final String METHOD_STOP = "Stop";
	private static final String METHOD_RESET = "Reset";

	private static final int DEFAULT_TICK_INTERVAL = 1; // in seconds
	private static final int DEFAULT_MAX_VALUE = 0;
	private static final String DEFAULT_VALUE_TEXT = "";

	private Coordinator mCoordinator;
	private LayoutItemDefinition mDefinition;

	private long mTickInterval;
	private long mMaxValue;
	private String mMaxValueText;

	private long mMilliseconds;
	private int mTicks;

	public GxChronometer(Context context, Coordinator coordinator, LayoutItemDefinition definition) {
		super(context);

		mDefinition = definition;
		mCoordinator = coordinator;

		mMilliseconds = 0;
		mTicks = -1;

		ControlInfo info = definition.getControlInfo();
		if (info != null) {
			mTickInterval = Services.Strings.tryParseLong(info.optStringProperty("@SDChronometerTickInterval"), DEFAULT_TICK_INTERVAL);
			mMaxValue = Services.Strings.tryParseLong(info.optStringProperty("@SDChronometerMaxValue"), DEFAULT_MAX_VALUE);
			mMaxValueText = info.optStringProperty("@SDChronometerMaxValueText");
		} else {
			mTickInterval = DEFAULT_TICK_INTERVAL;
			mMaxValue = DEFAULT_MAX_VALUE;
			mMaxValueText = DEFAULT_VALUE_TEXT;
		}
	}

	@Override
	public String getGxValue() {
		// Value in seconds
		return Long.toString(mMilliseconds / 1000);
	}

	@Override
	public void setGxValue(String value) {
		mMilliseconds = Long.parseLong(value) * 1000;
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
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public void applyEditClass(@NonNull ThemeClassDefinition themeClass) {
		ThemeUtils.setFontProperties(this, themeClass);
	}

	@Override
	public void setPropertyValue(String name, Value value) {
		if (name.equalsIgnoreCase(PROPERTY_MAX_VALUE)) {
			mMaxValue = value.coerceToInt();
		}
		else if (name.equalsIgnoreCase(PROPERTY_MAX_VALUE_TEXT)) {
			mMaxValueText = value.coerceToString();
		}
		else {
			Services.Log.warning("GxChronometer", "Unsupported property: " + name);
		}
	}

	@Override
	public Value getPropertyValue(String name) {
		switch (name) {
			case PROPERTY_MAX_VALUE:
				return Value.newInteger(mMaxValue);
			case PROPERTY_MAX_VALUE_TEXT:
				return Value.newString(mMaxValueText);
		}
		return null;
	}

	@Override
	public Value callMethod(String name, List<Value> parameters) {
		if (METHOD_START.equalsIgnoreCase(name) && parameters.size() == 0) {
			start();
		} else if (METHOD_STOP.equalsIgnoreCase(name) && parameters.size() == 0) {
			stop();
		} else if (METHOD_RESET.equalsIgnoreCase(name) && parameters.size() == 0) {
			reset();
		}
		return null;
	}

	@Override
	public void start() {
		Services.Log.debug("Gx Chronometer start");
		setBase(SystemClock.elapsedRealtime() - mMilliseconds);
		setOnChronometerTickListener(this);
		super.start();
	}

	@Override
	public void stop() {
		Services.Log.debug("Gx Chronometer stop");
		mTicks = -1;
		super.stop();
	}

	public void reset() {
		Services.Log.debug("Gx Chronometer reset");
		mMilliseconds = 0;
		mTicks = -1;
		setBase(SystemClock.elapsedRealtime());
	}

	@Override
	public void onChronometerTick(Chronometer chronometer) {
		Services.Log.debug("Gx Chronometer On Tick");
		mMilliseconds = SystemClock.elapsedRealtime() - chronometer.getBase();
		setDisplayText(chronometer);

		mTicks++;
		//Services.Log.debug("Gx Chronometer mullisecconds : " + mMilliseconds );
		//Services.Log.debug("Gx Chronometer tickInterval : " + mTickInterval + " ticks " + mTicks + " " );
		if (mMilliseconds > 0 && mCoordinator != null && mTickInterval > 0 && mTicks >= mTickInterval) {
			Services.Log.debug("Gx Chronometer ruun On Tick Event");
			mCoordinator.runControlEvent(this, "Tick");
			mTicks = 0;
		}
	}

	private void setDisplayText(Chronometer chronometer) {
		long totalInSeconds = mMilliseconds / 1000;
		long hours = totalInSeconds / 3600;
		long seconds = totalInSeconds % 60;
		long minutes = (totalInSeconds / 60) % 60;
		chronometer.setText(
				mMaxValue > 0 && totalInSeconds >= mMaxValue ?
						mMaxValueText :
						String.format("%02d:%02d:%02d", hours, minutes, seconds)
		);
	}

	@Override
	public boolean isEditable() {
		return true; // Although not editable, its value changes, so it needs to be read before executing actions.
	}
}
