package com.genexus.controls.maps.googlev2;

import android.content.Context;

import com.artech.controls.maps.GooglePlaceHelper;
import com.artech.controls.maps.Maps;
import com.artech.framework.GenexusModule;

public class GoogleMapsModule implements GenexusModule {

    @Override
    public void initialize(Context context) {
        Maps.addProvider(new MapsProvider());
		GooglePlaceHelper.registerPickerPlaces(new GooglePlacePickerHelper() );
    }
}
