package com.genexus.controls.flexgrid;

import android.content.Context;
import android.view.View;

import com.artech.android.layout.IGxRootLayout;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.ui.Coordinator;

public class GxRootFlexLayout extends GxFlexLayout implements IGxRootLayout
{
    public GxRootFlexLayout(Context context, LayoutDefinition layout, Coordinator coordinator)
    {
        super(context, layout.getTable(), coordinator);
    }

    // IGxRootLayout

    @Override
    public View getFirstChild() {
        return null;
    }

    @Override
    public void afterExpandLayout() {

    }
}
