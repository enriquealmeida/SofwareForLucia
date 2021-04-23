package com.artech.base.services;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.content.Context;
import android.graphics.drawable.Drawable;

import com.artech.base.metadata.images.ImageFile;

public interface IResourcesService {
	@Nullable Drawable getImageDrawable(Context context, String imageName);
    int getResourceId(String imageName, String defType);

	/**
	 *
	 * @param name Name of the image to give information
	 * @return ImageFile associated with the given name
	 */
	@Nullable ImageFile getImage(@NonNull String name);

	/**
	 * If the data image is actually embedded in the app, return its resource id.
	 * This can happen, for example, if the image is loaded with &var.FromImage(KB_image).
	 * @return The resource id if found or 0 otherwise.
	 */
	int getDataImageResourceId(String imageUri);

	/**
	 * Returns the {@link Drawable} associated to {@code action} for displaying on the
	 * <b>toolbar</b>.
	 *
	 * @param action the name of a standard action (e.g. Insert, Refresh, Share)
	 */
	@Nullable Drawable getActionBarDrawableFor(Context context, String action);

	/**
	 * Returns the {@link Drawable} associated to {@code action} for displaying on the <b>content
	 * area</b>.
	 *
	 * @param action the name of a standard action (e.g. Insert, Refresh, Share)
	 */
	@Nullable Drawable getContentDrawableFor(Context context, String action);
}
