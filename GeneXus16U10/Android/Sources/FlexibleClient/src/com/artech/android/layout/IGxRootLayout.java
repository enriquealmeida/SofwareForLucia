package com.artech.android.layout;

import android.view.View;

public interface IGxRootLayout extends IGxLayout
{
    View getFirstChild();
    void afterExpandLayout();
}
