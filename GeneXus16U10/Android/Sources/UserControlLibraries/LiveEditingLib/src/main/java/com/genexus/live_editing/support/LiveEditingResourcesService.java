package com.genexus.live_editing.support;

import android.content.Context;
import android.graphics.drawable.Drawable;
import androidx.annotation.Nullable;
import androidx.annotation.NonNull;

import com.artech.base.metadata.images.ImageFile;
import com.artech.base.metadata.languages.Language;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.services.IResourcesService;
import com.artech.base.services.Services;
import com.fedorvlasov.lazylist.ImageLoader;

import java.util.HashMap;
import java.util.Map;

import okhttp3.HttpUrl;

class LiveEditingResourcesService implements ILiveEditingImageManager {
	private final IResourcesService mResourcesService;
	private final Map<String, String> mDirtyResources;
	private @Nullable Endpoint mCurrentEndpoint;

	public LiveEditingResourcesService(IResourcesService resourcesService) {
		mResourcesService = resourcesService;
		mDirtyResources = new HashMap<>();
	}

	@Override
	public @Nullable Drawable getImageDrawable(Context context, String imageName) {
		return null;
	}

	@Override
	public int getResourceId(String imageName, String defType) {
		if (mDirtyResources.containsKey(imageName)) {
			return 0;
		}

		return mResourcesService.getResourceId(imageName, defType);
	}

	@Override
	public @Nullable ImageFile getImage(@NonNull String imageName) {
		if (mDirtyResources.containsKey(imageName)) {
			return null;
		}

		return mResourcesService.getImage(imageName);
	}

	@Override
	public int getDataImageResourceId(String imageUri) {
		return 0;
	}

	@Override
	public @Nullable Drawable getActionBarDrawableFor(Context context, String action) {
		return null;
	}

	@Override
	public @Nullable Drawable getContentDrawableFor(Context context, String action) {
		return null;
	}

	@Override
	public @Nullable Endpoint getCurrentEndpoint() {
		return mCurrentEndpoint;
	}

	@Override
	public void setCurrentEndpoint(Endpoint endpoint) {
		mCurrentEndpoint = endpoint;
	}

	@Override
	public void addImageToDirtyList(@NonNull String imageName) {
		String imageUrl = buildLiveEditingImageUrl(imageName);
		if (imageUrl != null) {
			mDirtyResources.put(imageName, imageUrl);
			ImageLoader.clearImageFromAllCaches(imageUrl);
		}
	}

	private @Nullable String buildLiveEditingImageUrl(String imageName) {
		ThemeDefinition currentTheme = Services.Themes.getCurrentTheme();
		Language currentLanguage = Services.Application.getDefinition().getLanguageCatalog()
				.getCurrentLanguage();

		if (currentTheme == null || currentLanguage == null || mCurrentEndpoint == null) {
			return null;
		}

		return new HttpUrl.Builder()
				.scheme("http")
				.host(mCurrentEndpoint.ip)
				.port(mCurrentEndpoint.port)
				.addPathSegment("images")
				.addPathSegment("get")
				.addPathSegment(imageName)
				.addPathSegment(currentTheme.getName())
				.addPathSegment(currentLanguage.getName())
				.build()
				.toString();
	}
}
