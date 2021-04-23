package com.artech.android.layout;

import android.view.View;

import com.artech.base.controls.IGxOverrideThemeable;
import com.artech.base.metadata.layout.CellDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.controls.GxHorizontalSeparator;
import com.artech.controls.IGxThemeable;
import com.artech.ui.Coordinator;

public interface IGxLayout extends IGxThemeable, IGxOverrideThemeable {
    void setLayout(Coordinator coordinator, TableDefinition layout);
    void updateHorizontalSeparators(GxHorizontalSeparator separator);
    void requestAlignFieldLabels();
    void setChildLayoutParams(CellDefinition cell, LayoutItemDefinition item, View view);
    void updateChildLayoutParams(CellDefinition cell, LayoutItemDefinition item, View view);
    void updateSelfLayoutParams();
}
