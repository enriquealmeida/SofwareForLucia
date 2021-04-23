package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.images.ImageCatalog;
import com.artech.base.metadata.languages.LanguageCatalog;
import com.artech.base.metadata.loader.ImagesMetadataLoader;
import com.artech.base.metadata.loader.LanguagesMetadataLoader;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class ResourcesLoadStep implements MetadataLoadStep {
	private final Context mContext;

	public ResourcesLoadStep(Context context) {
		mContext = context;
	}

	@Override
	public void load() {
		LanguageCatalog languages = new LanguageCatalog();
		INodeObject languagesFile = MetadataLoader.getDefinition(mContext, "languages");
		if (languagesFile != null)
			languages = LanguagesMetadataLoader.loadFrom(mContext, languagesFile);

		ImageCatalog images = new ImageCatalog();
		INodeObject imagesFile = MetadataLoader.getDefinition(mContext, "GXImages");
		if (imagesFile != null)
			images = ImagesMetadataLoader.loadFrom(mContext, imagesFile);

		Services.Language.initialize(languages, images);
	}
}
