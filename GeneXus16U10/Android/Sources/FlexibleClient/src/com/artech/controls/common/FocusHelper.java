package com.artech.controls.common;

import android.view.View;

import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;

/**
 * Helper class for focus-related code.
 */
public class FocusHelper
{
	public static void removeFocusabilityIfNecessary(View view, LayoutItemDefinition definition)
	{
		GridDefinition ownerGrid = definition.getOwnerGrid();
		if (ownerGrid != null && ownerGrid.getDefaultAction() != null)
		{
			// A ListView that contains focusable controls automatically disables its OnClickListener.
			// Therefore, set the view as non-focusable to preserve that.
			view.setFocusable(false);
			view.setFocusableInTouchMode(false);
		}
	}
}
