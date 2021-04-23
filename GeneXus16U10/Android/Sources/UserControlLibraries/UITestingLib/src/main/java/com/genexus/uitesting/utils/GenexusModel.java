package com.genexus.uitesting.utils;

import android.view.View;

import com.artech.android.layout.LayoutTag;

public class GenexusModel {
    public static boolean isGenexusControl(View view) {
        Object isControlTag = view.getTag(LayoutTag.CONTROL_GENEXUS);

        if (isControlTag == null || !(isControlTag instanceof Boolean)) {
            return false;
        }

        return (Boolean) isControlTag;
    }
}
