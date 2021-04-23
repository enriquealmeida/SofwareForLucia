package com.genexus.controls.wheels;

import com.artech.controls.common.ValueItem;
import com.artech.controls.common.ValueItems;

import java.util.ArrayList;
import java.util.List;

public class GxWheelEnumControl implements IGxWheelControl
{
	private String[] mItemsKey = null;
	private String[] mItemsValue = null;

	protected void load(ValueItems<ValueItem> items)
	{
		mItemsKey = new String[items.size()];
		mItemsValue = new String[items.size()];
		for (int i = 0; i < items.size(); i++)
		{
			mItemsKey[i] = items.get(i).Value;
			mItemsValue[i] = items.get(i).Description;
		}
		if (mReadyEvent != null)
			mReadyEvent.onReady();
	}

	private IGxWheelControlReady mReadyEvent;

	@Override
	public Boolean isReady() {
		return mItemsKey != null && mItemsValue != null && mItemsValue.length > 0;
	}

	@Override
	public void setOnReady(IGxWheelControlReady ready) {
		mReadyEvent = ready;
	}

	@Override
	public String getDisplayInitialValue() {
		return isReady() ? mItemsValue[0] : null;
	}

	@Override
	public String getGxDisplayValue(String value) {
		if (!isReady())
			return value;
		return mItemsValue[GxWheelHelper.getPositionValue(mItemsKey, value)];
	}

	@Override
	public void setViewAdapter(String displayValue, GxWheelPicker wheelControlNumeric, GxWheelPicker wheelControlDecimal) {
		if (!isReady())
			return;
		wheelControlNumeric.setViewAdapter(mItemsValue);
		wheelControlNumeric.setCurrentItem(GxWheelHelper.getPositionValue(mItemsValue, displayValue));
	}

	@Override
	public String getCurrentStringValue(GxWheelPicker wheelControlNumeric, GxWheelPicker wheelControlDecimal) {
		if (!isReady())
			return "";
		int itemPosition = wheelControlNumeric.getCurrentItem();
		return mItemsValue[itemPosition];
	}

	@Override
	public String getGxValue(String displayValue) {
		if (!isReady())
			return displayValue;
		return mItemsKey[GxWheelHelper.getPositionValue(mItemsValue, displayValue)];
	}

	@Override
	public void onFirstSetGxValue() {
	}

	@Override
	public List<String> getDependencies() {
		return new ArrayList<>();
	}

	@Override
	public void onDependencyValueChanged(String name, Object value) {
	}

	@Override
	public void onRefresh() {
	}
}
