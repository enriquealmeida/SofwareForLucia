package com.artech.usercontrols;

import android.content.Context;

import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.Services;
import com.artech.ui.Coordinator;

/**
 * Default User Control Factory. Uses reflection to instantiate views.
 */
class DefaultControlFactory implements IControlFactory
{
	private final UserControlDefinition mDefinition;
	private Class<?> mClass;
	private boolean mClassLoaded;

	public DefaultControlFactory(UserControlDefinition definition)
	{
		mDefinition = definition;
	}

	@Override
	public IGxUserControl create(Context context, Coordinator coordinator, LayoutItemDefinition definition)
	{
		if (!mClassLoaded)
		{
			tryLoadClass();
			mClassLoaded = true; // Even if failed, to avoid reflection check again.
		}

		if (mClass != null)
			return (IGxUserControl)UcFactory.createUserControl(mClass, context, coordinator, definition);
		else
			return null;
	}

	private void tryLoadClass()
	{
		try
		{
			mClass = Class.forName(mDefinition.ClassName);
		}
		catch (ClassNotFoundException e)
		{
			Services.Log.error(String.format("Java class '%s' (for user control '%s') could not be loaded via reflection.", mDefinition.ClassName, mDefinition.Name), e);
		}
	}
}
