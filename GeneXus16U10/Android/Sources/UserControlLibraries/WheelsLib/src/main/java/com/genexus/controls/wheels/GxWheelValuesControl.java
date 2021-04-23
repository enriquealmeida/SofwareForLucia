package com.genexus.controls.wheels;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.controls.common.StaticValueItems;

public class GxWheelValuesControl extends GxWheelEnumControl {

    public GxWheelValuesControl(DataItem dataItem, ControlInfo info) {
        // Just use the new parsing mechanism for now, but refactor all this ASAP.
        load(new StaticValueItems(dataItem, info));
    }
}
