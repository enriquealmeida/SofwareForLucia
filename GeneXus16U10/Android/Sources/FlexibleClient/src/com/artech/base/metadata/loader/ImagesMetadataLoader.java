package com.artech.base.metadata.loader;

import android.content.Context;

import com.artech.base.metadata.images.ImageCatalog;
import com.artech.base.metadata.images.ImageCollection;
import com.artech.base.metadata.images.ImageFile;
import com.artech.base.serialization.INodeObject;

public class ImagesMetadataLoader
{
	public static ImageCatalog loadFrom(Context context, INodeObject jsonResources)
	{
		ImageCatalog catalog = new ImageCatalog();
		
		String defaultLanguage = jsonResources.optString("DefaultLanguage");
		catalog.setDefaultLanguage(defaultLanguage);

		// Read all themes and languages since they may change dynamically.
		for (INodeObject jsonFileReference : jsonResources.optCollection("Resources"))
		{
			boolean isDefault = jsonFileReference.optBoolean("IsDefault");
			String theme = jsonFileReference.optString("Theme");
			String file = jsonFileReference.optString("ResourceFile");

			// Remove file extension because MetadataLoader adds it.
			if (file != null && file.endsWith(".json"))
				file = file.substring(0, file.length() - 5);

			INodeObject jsonResourceFile = MetadataLoader.getDefinition(context, file);
			if (jsonResourceFile != null)
				loadResourceFile(catalog, jsonResourceFile, isDefault);
		}
		
		return catalog;
	}

	private static void loadResourceFile(ImageCatalog catalog, INodeObject jsonResources, boolean isDefault)
	{
		String baseDirectory = jsonResources.optString("ResourcesLocation");
		String theme = jsonResources.optString("Theme");
		String language = jsonResources.optString("Language");
		
		ImageCollection imageCollection = new ImageCollection(language, theme, isDefault, baseDirectory);
		catalog.add(imageCollection);
		
		for (INodeObject jsonImage : jsonResources.optCollection("Images"))
		{
			String name = jsonImage.optString("Name");
			String strType = jsonImage.optString("Type");
			int type = (strType != null && strType.equals("E") ? ImageFile.TYPE_EXTERNAL : ImageFile.TYPE_INTERNAL);
			String location = jsonImage.optString("Location");
			boolean autoMirror = jsonImage.optBoolean("FlipsForRTL", false);

			ImageFile imageFile = new ImageFile(imageCollection, name, type, location, autoMirror);
			imageCollection.add(imageFile);
		}
	}
}
