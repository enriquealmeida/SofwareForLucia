package com.artech.app;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.base.metadata.layout.Size;
import com.artech.fragments.BaseFragment;

public class ComponentUISettings
{
	public boolean isMain;
	public BaseFragment parent;
	public Size size;

	public ComponentUISettings(boolean isMain, BaseFragment parent, Size size)
	{
		this.isMain = isMain;
		this.parent = parent;
		this.size = size;
	}

	@NonNull
	public static ComponentUISettings main()
	{
		return new ComponentUISettings(true, null, null);
	}

	@NonNull
	public static ComponentUISettings childOf(@NonNull BaseFragment parent, @Nullable Size size)
	{
		return new ComponentUISettings(false, parent, size);
	}
}
