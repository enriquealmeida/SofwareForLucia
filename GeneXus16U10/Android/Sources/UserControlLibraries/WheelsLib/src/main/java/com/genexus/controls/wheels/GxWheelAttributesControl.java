package com.genexus.controls.wheels;

import android.os.AsyncTask;
import android.util.Pair;

import com.artech.application.MyApplication;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.controls.common.DynamicValueItems;
import com.artech.controls.common.ValueItem;
import com.artech.controls.common.ValueItems;
import com.artech.ui.Coordinator;

import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

public class GxWheelAttributesControl extends GxWheelEnumControl {
    private String mServiceName;
    private String mServiceInputs;
    private Coordinator mCoordinator;
    private Boolean mLoading = false;

    public GxWheelAttributesControl(Coordinator coordinator, ControlInfo info) {
        mServiceName = info.optStringProperty("@service");
        mServiceInputs = info.optStringProperty("@serviceInputs");
        mCoordinator = coordinator;
        // do the loadWheelItems() in onFirstSetGxValue() else the parameters to dataproviders aren't available
    }

    private class LoadDataTask extends AsyncTask<Void, Void, ValueItems<ValueItem>> {
        @Override
        protected ValueItems<ValueItem> doInBackground(Void... p) {
            Connectivity connectivity = mCoordinator.getUIContext().getConnectivitySupport();
            LinkedHashMap<String, String> conditionValues = null;
            if (mServiceInputs != null && mServiceInputs.length() > 0) {
                conditionValues = new LinkedHashMap<>();
                for (String inputMember : mServiceInputs.split(",", -1))
                    conditionValues.put(inputMember, mCoordinator.getStringValue(inputMember));
            }
            List<Pair<String, String>> items = MyApplication.getApplicationServer(connectivity).getDynamicComboValues(mServiceName, conditionValues);
            mLoading = false; // If an update is required from here on do it
            return new DynamicValueItems(items);
        }

        @Override
        protected void onPostExecute(ValueItems<ValueItem> result) {
            load(result);
        }
    }

    private void loadWheelItems() {
        if (!mLoading) {
            mLoading = true;
            new LoadDataTask().execute();
        }
    }

    @Override
    public void onFirstSetGxValue() {
        loadWheelItems();
    }

    @Override
    public List<String> getDependencies() {
        if (mServiceInputs != null && mServiceInputs.length() > 0) {
            return Arrays.asList(mServiceInputs.split(","));
        }
        else {
            return super.getDependencies();
        }
    }

    @Override
    public void onDependencyValueChanged(String name, Object value) {
        loadWheelItems();
    }

    @Override
    public void onRefresh() {
        loadWheelItems();
    }
}
