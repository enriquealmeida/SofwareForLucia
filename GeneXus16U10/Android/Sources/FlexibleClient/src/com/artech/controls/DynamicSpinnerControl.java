package com.artech.controls;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import android.annotation.SuppressLint;
import android.content.Context;
import android.os.AsyncTask;
import android.util.Pair;
import android.view.View;
import android.widget.AdapterView;
import android.widget.AdapterView.OnItemSelectedListener;

import com.artech.application.MyApplication;
import com.artech.base.controls.IGxControlNotifyEvents;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.IValuesFormatter;
import com.artech.base.utils.Strings;
import com.artech.controls.common.ControlServiceDefinition;
import com.artech.controls.common.DynamicValueItems;
import com.artech.controls.common.FocusHelper;
import com.artech.controls.common.SpinnerItemsAdapter;
import com.artech.ui.Coordinator;

@SuppressLint("ViewConstructor")
public class DynamicSpinnerControl extends SpinnerControl implements IGxEditWithDependencies, OnItemSelectedListener, IGxControlNotifyEvents
{
	private final DynamicComboDefinition mDynDefinition;

	// Status flags
	private boolean mIsEditControl;
	private boolean mFireControlValueChanged;
	private String mPreviousValue;

	public DynamicSpinnerControl(Context context, Coordinator coordinator, LayoutItemDefinition definition)
	{
		super(context, coordinator, definition);
		mDynDefinition = new DynamicComboDefinition(definition);
		mFireControlValueChanged = false;

		FocusHelper.removeFocusabilityIfNecessary(this, definition);
		setOnItemSelectedListener(this);
		init();
	}

	@Override
	public String getGxValue()
	{
		if (mAdapter == null || getSelectedItemPosition() == -1)
			return null; // It's important to return null instead of Strings.EMPTY because when called from AdaptersHelper.SaveEditValue() the property is not set
		else
			return mAdapter.getItem(getSelectedItemPosition()).Value;
	}

	@Override
	public void setGxValue(String value)
	{
		if (mAdapter == null)
		{
			// Calls setGxValue(value) again after loading the items.
			loadComboItems(value);
			return;
		}

		// Only make a selection if there are items in the adapter.
		if (getCount() > 0)
		{
			int currentPosition = getSelectedItemPosition();
			int newPosition = getIndex(value);

			// Reset to the first item if the value was invalid.
			if (newPosition == -1)
				newPosition = 0;

			// Do nothing if there's no change of item position.
			if (newPosition == currentPosition)
				return;

			mFireControlValueChanged = false;
			setSelection(newPosition);
		}
	}

	@Override
	public void onItemSelected(AdapterView<?> parent, View view, int position, long id)
	{
		String value = getGxValue();
		if (!Strings.areEqual(value, mPreviousValue))
		{
			mPreviousValue = value;

			if (mCoordinator != null)
				mCoordinator.onValueChanged(this, mFireControlValueChanged);
		}

		mFireControlValueChanged = true;
	}

	@Override
	public void onNothingSelected(AdapterView<?> parent) { }

	private void init()
	{
		LayoutParams param = new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.WRAP_CONTENT);
		setLayoutParams(param);
	}

	@Override
	public IGxEdit getViewControl()
	{
		return new GxTextView(getContext(), mCoordinator, mDefinition, new Formatter());
	}

	@Override
	public IGxEdit getEditControl()
	{
		mIsEditControl = true;
		return this;
	}

	@Override
	public List<String> getDependencies()
	{
		return mDynDefinition.ServiceInput;
	}

	@Override
	public void onDependencyValueChanged(String name, Object value)
	{
		String currentValue = null;
		if (mAdapter != null)
			currentValue = getGxValue();

		loadComboItems(currentValue);
	}

	private LoadComboTask taskLoad;

	private void loadComboItems(String setValueAfter)
	{
		if (mIsEditControl)
		{
			//if (taskLoad!=null && taskLoad.getStatus()!=Status.FINISHED)
			//{
			//	taskLoad.cancel(true);
			//}
			taskLoad = new LoadComboTask(setValueAfter);
			taskLoad.execute();
		}
	}

	// Auxiliar classes

	private class LoadComboTask extends AsyncTask<Void, Void, DynamicValueItems>
	{
		private Map<String, String> mConditionValues;
		private String mSetValueAfterLoadItems;

		public LoadComboTask(String setValueAfterLoadItems)
		{
			if (setValueAfterLoadItems != null)
				mSetValueAfterLoadItems = setValueAfterLoadItems;
		}

		@Override
		protected void onPreExecute()
		{
			mConditionValues = getConditionValues();
		}

		private LinkedHashMap<String, String> getConditionValues()
		{
			// Get the input values for the service call (for dependent combos).
			LinkedHashMap<String, String> conditionValues = new LinkedHashMap<>();
			for (String inputMember : mDynDefinition.ServiceInput)
				conditionValues.put(inputMember, mCoordinator.getStringValue(inputMember));

			return conditionValues;
		}

		@Override
		protected DynamicValueItems doInBackground(Void... params)
		{
			// Call remote service to obtain items.
			Connectivity connectivity = mCoordinator.getUIContext().getConnectivitySupport();
			List<Pair<String, String>> items = MyApplication.getApplicationServer(connectivity).getDynamicComboValues(mDynDefinition.Service, mConditionValues);
			return new DynamicValueItems(items);
		}

		@Override
		protected void onPostExecute(DynamicValueItems result)
		{
			mAdapter = new SpinnerItemsAdapter(getContext(), result, mThemeClass, mDynDefinition.LayoutItem);
			setAdapter(mAdapter);

			// If setValue executed before values were available...
			String valueToSet = mSetValueAfterLoadItems;
			if (valueToSet != null)
			{
				mSetValueAfterLoadItems = null;
				setGxValue(valueToSet);
			}
		}
	}

	private class Formatter implements IValuesFormatter
	{
		private DynamicValueItems mValues;
		private String mCondition;

		@Override
		public boolean needsAsync() { return true; }

		@Override
		public CharSequence format(String value)
		{
			LoadComboTask task = new LoadComboTask(null);
			String condition = task.getConditionValues().toString();

			if (mValues == null || !mCondition.equalsIgnoreCase(condition))
			{
				// Load combo values (this is executed in a background thread so directly calling the
				// AsyncTask implementation is reasonable).
				task.onPreExecute();
				mValues = task.doInBackground();
				mCondition = condition;
			}

			return mValues.getDescription(value);
		}
	}

	private static class DynamicComboDefinition extends ControlServiceDefinition
	{
		public DynamicComboDefinition(LayoutItemDefinition itemDefinition)
		{
			super(itemDefinition, "");
		}
	}

	@Override
	public void notifyEvent(EventType type)
	{
		if (type == EventType.REFRESH && mAdapter != null)
		{
			String currentValue = getGxValue();
			loadComboItems(currentValue);
		}
	}
}
