package com.artech.controls;

import com.artech.base.controls.IGxControlRuntimeContext;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;

/**
 * Interface for controls in a form.
 */
public interface IGxControl extends IGxControlRuntimeContext
{
	String getName();
	LayoutItemDefinition getDefinition();

	boolean isEnabled();
	ThemeClassDefinition getThemeClass();
	boolean isVisible();
	String getCaption();

	void setEnabled(boolean enabled);
	void setFocus(boolean showKeyboard);
	void setThemeClass(ThemeClassDefinition themeClass);
	void setVisible(boolean visible);
	void setCaption(String caption);

	void requestLayout();
	Object getInterface(Class c);

	// Gets the underlying View associated to this control. Use as sparingly as possible!
	//View getView();
}
