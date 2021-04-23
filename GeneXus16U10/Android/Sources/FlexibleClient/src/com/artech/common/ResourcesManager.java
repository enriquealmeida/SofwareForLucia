package com.artech.common;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;

import com.artech.application.MyApplication;
import com.artech.base.metadata.images.ImageFile;
import com.artech.base.services.IResourcesService;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.resources.BuiltInResources;
import com.fedorvlasov.lazylist.ImageLoader;

public class ResourcesManager implements IResourcesService {
    private final MyApplication mApplication;

    public ResourcesManager(MyApplication application) {
        mApplication = application;
    }

    @Override
    public ImageFile getImage(@NonNull String imageName) {
        return mApplication.getDefinition().getImageCatalog().getImage(imageName);
    }

    @Override
    public @Nullable Drawable getImageDrawable(Context context, String imageName) {
        int resourceId = getResourceId(imageName, "drawable");
        if (resourceId != 0) {
            try {
                Drawable drawable = ContextCompat.getDrawable(context, resourceId);
                if (drawable != null) {
                    ImageFile imageFile = getImage(imageName);
                    if (imageFile != null) {
                        drawable.setAutoMirrored(imageFile.hasAutoMirror());
                    }
                }
                return drawable;
            } catch (OutOfMemoryError e) {
                ImageLoader.clearMemoryCache();
                Services.Log.error(String.format("Out of memory loading resource '%s'.", imageName), e);

                // Return a stub drawable instead of null; otherwise it will try to download the image from the server.
                // We ALREADY have that image, we just couldn't load (ran out of memory).
                return new ColorDrawable(Color.TRANSPARENT);
            }
        } else
            return null;
    }

    @Override
    public int getResourceId(String imageName, String defType) {
        ImageFile imageFile = mApplication.getDefinition().getImageCatalog().getImage(imageName);

        // Return the same name when resource is not found. For now it's necessary
        // for the welcome image (which is embedded with that fixed name).
        String resourceName = imageFile != null ? imageFile.getResourceName() : imageName;

        if (Services.Strings.hasValue(resourceName)) {
			int id = mApplication.getResources().getIdentifier(resourceName, defType, mApplication.getPackageName());
			if (id == 0)
				Services.Log.error("Image not found: " + resourceName);
			return id;
		} else if (imageFile == null) {
			Services.Log.error("Image requested is null");
			return 0;
		} else {
			Services.Log.error("Image resource name not found: " + imageName);
			return 0;
		}
    }

    @Override
    public int getDataImageResourceId(String imageUri) {
        String imageResourceLC = Strings.toLowerCase(imageUri);
        if (!(imageResourceLC.startsWith("http://") || imageResourceLC.startsWith("https://")) && imageResourceLC.contains("resources")) {
            String lastSegment = imageUri.replace('\\', '/');
            int pos = lastSegment.lastIndexOf('/') + 1;
            if (pos > 1) {
                lastSegment = lastSegment.substring(pos);
                pos = lastSegment.lastIndexOf(".");
                if (pos > 1) {
                    // try with new resources format
                    String resourceName = lastSegment.replace(".", "_");
                    int resourceId = Services.Resources.getResourceId(resourceName.toLowerCase(), "drawable");

                    if (resourceId > 0)
                        return resourceId;

                    //try with old resources format
                    resourceName = lastSegment.substring(0, pos);
                    resourceId = Services.Resources.getResourceId(resourceName, "drawable");

                    if (resourceId > 0)
                        return resourceId;
                }
            }
        }

        return 0;
    }

    @Override
    public @Nullable Drawable getActionBarDrawableFor(Context context, String action) {
        return getDrawableFor(context, action, BuiltInResources.PLACE_ACTION_BAR);
    }

    @Override
    public @Nullable Drawable getContentDrawableFor(Context context, String action) {
        return getDrawableFor(context, action, BuiltInResources.PLACE_CONTENT);
    }

    private Drawable getDrawableFor(Context context, String action, int place) {
        int resId = BuiltInResources.getResId(context, action, place);
        if (resId == 0) {
            return null;
        }
        Drawable drawable = ContextCompat.getDrawable(context, resId);
        if (drawable != null && BuiltInResources.shouldAutoMirror(action)) {
            drawable.setAutoMirrored(true);
        }
        return drawable;
    }
}
