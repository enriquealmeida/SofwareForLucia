package com.artech.base.metadata.images;

import java.io.Serializable;
import java.util.ArrayList;

import com.artech.base.services.Services;

public class ImageCatalog implements Serializable
{
	private static final long serialVersionUID = 1L;

	private final ArrayList<ImageCollection> mCollections;

	private ImageCollection mDefaultCollection;
	private String mDefaultLanguage;

	public ImageCatalog()
	{
		mCollections = new ArrayList<>();
	}

	public void setDefaultLanguage(String language)
	{
		mDefaultLanguage = language;
	}

	public void add(ImageCollection collection)
	{
		mCollections.add(collection);

		if (collection.isDefault())
			mDefaultCollection = collection;
	}

	public ImageFile getImage(String imageName)
	{
		ImageCollection collection = getImageCollection();
		if (collection != null)
			return collection.get(imageName);
		else
			return null;
	}

	private ImageCollection getImageCollection()
	{
		ImageCollection current = getCurrentCollection();
		return (current != null ? current : mDefaultCollection);
	}

	private ImageCollection getCurrentCollection()
	{
		// Filter by theme and language to get best one.
		String deviceTheme = Services.Themes.getCurrentThemeName();
		String deviceLanguage = Services.Language.getCurrentLanguage();
		if (deviceLanguage == null)
			deviceLanguage = mDefaultLanguage;

		// If theme and language are unknown, the return null, so that the default image collection is used.
		if (!Services.Strings.hasValue(deviceTheme) || !Services.Strings.hasValue(deviceLanguage))
			return null;

		for (ImageCollection collection : mCollections)
		{
			if (deviceLanguage.equalsIgnoreCase(collection.getLanguage()) &&
				deviceTheme.equalsIgnoreCase(collection.getTheme()))
			{
				// TODO: Cache this, but must be refreshed when system language changes!
				return collection;
			}
		}

		return null;
	}
}
