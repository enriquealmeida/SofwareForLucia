package com.artech.base.metadata.settings;

import android.content.Context;

import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.serialization.INodeObject;
import com.artech.base.utils.Strings;

public class WorkWithSettingsLoader
{
	private static final String FILE_NAME = "settings";

	public static WorkWithSettings load(Context context, GenexusApplication application)
	{
		String resourceName = String.format("%s.%s", Strings.toLowerCase(application.getAppEntry()), FILE_NAME);
		INodeObject jsonData = MetadataLoader.getDefinition(context, resourceName);
		if (jsonData == null)
			jsonData = MetadataLoader.getDefinition(context, FILE_NAME);
		if (jsonData == null)
			return null;

		return loadFromJson(jsonData);
	}

	private static WorkWithSettings loadFromJson(INodeObject jsonData)
	{
		return new WorkWithSettings(jsonData);
	}
}
