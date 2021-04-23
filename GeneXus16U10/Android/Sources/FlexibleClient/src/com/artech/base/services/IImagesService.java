package com.artech.base.services;

import java.io.File;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.view.View;

import androidx.annotation.Nullable;

import com.artech.controls.common.IViewDisplayImage;

public interface IImagesService {
	Drawable getStaticImage(Context context, String imageName);
	Drawable getStaticImage(Context context, String imageName, boolean loadAsHdpi);
	void displayImage(IViewDisplayImage view, String imageName);
	void displayBackground(View view, String imageName);

	@Nullable
	Uri getSharedImage(Context context, String imageName);

	/**
	 * Common utility method to load an image from an {@code imageUrl} source into an {@code imageView}.
	 *
	 * @param context         for retrieving the ImageLoader instance.
	 * @param imageView       target view to load the image into.
	 * @param imageUrl        source from which to get the image.
	 * @param showPlaceholder whether a placeholder should be shown when the value is empty or invalid.
	 * @param fullResolution  whether the image should be scaled to fit the view or not.
	 */
	void showImage(Context context, IViewDisplayImage imageView, String imageUrl,
				   boolean showPlaceholder, boolean fullResolution);
	void showStaticImage(Context context, IViewDisplayImage icon, String imageName);
	void showDataImage(Context context, IViewDisplayImage imageView, String imageUri,
					   boolean placeholderRequired, boolean fullResolution);
	Bitmap getBitmap(Context context, String imageUrl);
	void clearCache();
	File getCachedImageFile(String imageIdentifier);
}
