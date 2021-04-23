package com.genexus.coreusercontrols;

import android.content.Context;
import android.view.MotionEvent;
import android.view.View;
import android.widget.AdapterView;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.IValuesFormatter;
import com.artech.base.utils.Strings;
import com.artech.controls.GxTextView;
import com.artech.controls.IGxEdit;
import com.artech.controls.SpinnerControl;
import com.artech.controls.common.SpinnerItemsAdapter;
import com.artech.controls.common.StaticValueItems;
import com.artech.controls.common.TextViewUtils;
import com.artech.ui.Coordinator;

public class StaticSpinnerControl extends SpinnerControl implements IGxEdit {
    public static final String NAME = "Combo Box";
	private String mEmptyItemDescription;

    public StaticSpinnerControl(Context context, Coordinator coordinator, LayoutItemDefinition definition) {
        super(context, coordinator, definition);
        initValues();
    }

    private void initValues()
    {
        StaticValueItems items = new StaticValueItems(mDefinition.getDataItem(), mDefinition.getControlInfo());
        mEmptyItemDescription = items.getEmptyItem() == null ? Strings.EMPTY : items.getEmptyItem().Description;
        mAdapter = new SpinnerItemsAdapter(getContext(), items, mThemeClass, mDefinition);
        setAdapter(mAdapter);

        SpinnerInteractionListener listener = new SpinnerInteractionListener(mCoordinator, this);
        setOnTouchListener(listener);
        setOnItemSelectedListener(listener);
    }

    @Override
    public String getGxValue() {
        if (getSelectedItemPosition() == -1)
            return null; // It's important to return null instead of Strings.EMPTY because when called from AdaptersHelper.SaveEditValue() the property is not set
        else
            return mAdapter.getItem(getSelectedItemPosition()).Value;
    }

    @Override
    public void setGxValue(String value) {
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

            setSelection(newPosition, false);
        }
    }

    @Override
    public IGxEdit getViewControl()
    {
        return new GxTextView(getContext(), mCoordinator, mDefinition, new Formatter());
    }

    @Override
    public IGxEdit getEditControl()
    {
        return this;
    }

    // Auxliliar classes

    private class Formatter implements IValuesFormatter
    {
        @Override
        public CharSequence format(String value)
        {
            int index = getIndex(value);
            String description = index == -1 ? mEmptyItemDescription : mAdapter.getItem(index).Description;
            return TextViewUtils.toCharSequence(description, mDefinition);
        }

        @Override
        public boolean needsAsync()
        {
            return false;
        }
    }

    private static class SpinnerInteractionListener implements AdapterView.OnItemSelectedListener,
            View.OnTouchListener {
        private final Coordinator mCoordinator;
        private final IGxEdit mView;
        private boolean mWasUserSelected;

        public SpinnerInteractionListener(Coordinator coordinator, IGxEdit view) {
            mCoordinator = coordinator;
            mView = view;
            mWasUserSelected = false;
        }

        @Override
        public boolean onTouch(View v, MotionEvent event) {
            mWasUserSelected = true;
            return false;
        }

        @Override
        public void onItemSelected(AdapterView<?> parent, View view, int pos, long id) {
            if (mWasUserSelected) {
                mCoordinator.onValueChanged(mView, true);
                mWasUserSelected = false;
            }
        }

        @Override
        public void onNothingSelected(AdapterView<?> parent) {
        }
    }
}
