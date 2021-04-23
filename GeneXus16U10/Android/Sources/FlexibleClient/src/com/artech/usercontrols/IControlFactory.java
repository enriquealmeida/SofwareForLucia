package com.artech.usercontrols;

import android.content.Context;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.ui.Coordinator;

/**
 * Interface for UC factory.
 */
public interface IControlFactory
{
	IGxUserControl create(Context context, Coordinator coordinator, LayoutItemDefinition definition);
}
