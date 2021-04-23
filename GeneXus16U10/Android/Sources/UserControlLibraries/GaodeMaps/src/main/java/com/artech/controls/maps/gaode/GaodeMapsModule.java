package com.artech.controls.maps.gaode;

import android.content.Context;

import com.artech.controls.maps.Maps;
import com.artech.framework.GenexusModule;

public class GaodeMapsModule implements GenexusModule {

    @Override
    public void initialize(Context context) {
        Maps.addProvider(new MapsProvider());
    }
}
