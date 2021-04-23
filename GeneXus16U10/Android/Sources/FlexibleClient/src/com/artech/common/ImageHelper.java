package com.artech.common;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;

import androidx.annotation.Nullable;
import androidx.core.content.ContextCompat;

import android.net.Uri;
import android.text.TextUtils;
import android.view.View;

import com.artech.android.content.FileProviderUtils;
import com.artech.application.MyApplication;
import com.artech.base.metadata.images.ImageFile;
import com.artech.base.services.IImagesService;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.common.IViewDisplayGifSupport;
import com.artech.controls.common.IViewDisplayImage;
import com.artech.resources.MediaTypes;
import com.artech.resources.StandardImages;
import com.fedorvlasov.lazylist.ImageLoader;

import org.apache.commons.io.FilenameUtils;

import java.io.File;
import java.io.IOException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

class ImageHelper implements IImagesService
{
	private ExecutorService mExecutorService;

	public ImageHelper() {
		mExecutorService = Executors.newCachedThreadPool();
	}

	@Override
	public Drawable getStaticImage(Context context, String imageName)
	{
		return getStaticImage(context, imageName, false);
	}

	@Override
	public Drawable getStaticImage(Context context, String imageName, boolean loadAsHdpi)
	{
		return getStaticImage(context, imageName, false, null, loadAsHdpi);
	}

	/**
	 * Gets the specified "static" image, given it image name. Tries to load it from
	 * the embedded resources, and if that fails, from the cache of downloaded images.
	 *
	 * If that also fails, then if the waitForServer parameter is true, the method
	 * blocks until the server returns the image. Otherwise a thread is launched to
	 * request the image from the server, though this call returns null.
	 */
	private Drawable getStaticImage(Context context, String imageName, boolean waitForImage,
									Handler onReceive, boolean loadAsHdpi)
	{
		if (!Services.Strings.hasValue(imageName))
			return null;

		// 1) Try to get from resources.
		Drawable drawable = Services.Resources.getImageDrawable(context, imageName);
		if (drawable != null) {
			return drawable;
		}

		// 1.1) Accept alternative resource format (Resources/<filename>).
		// When loading a variable with a static image they can be in either format!
		int resourceId = Services.Resources.getDataImageResourceId(imageName);
		if (resourceId != 0)
			return ContextCompat.getDrawable(context, resourceId);

		// 2) Try to get from cache.
		drawable = getImageFromCache(imageName);
		if (drawable != null)
			return drawable;

		if (waitForImage)
		{
			// 3.a) Download the image and return it.
			drawable = getImageFromServer(context, imageName, loadAsHdpi);
		}
		else
		{
			// 3.b) Launch a thread to get the image.
			mExecutorService.execute(new Runnable()
			{
				@Override
				public void run()
				{
					Drawable drawable = getImageFromServer(context, imageName, loadAsHdpi);
					if (onReceive != null)
						onReceive.receive(drawable);
				}
			});
		}

		return drawable;
	}

	/** Cache key is image URL **/
	private Drawable getImageFromCache(String imageName) {
		ImageFile imageFile = Services.Resources.getImage(imageName);
		String imageUrl = imageFile != null ? imageFile.getUri() : null;
		if (imageUrl == null)
			return null;

		return ImageLoader.getCachedDrawable(imageUrl);
	}

	/** Load Image with image loader **/
	private Drawable getImageFromServer(Context context, String imageName, boolean loadAsHdpi) {
		ImageFile imageFile = Services.Resources.getImage(imageName);
		String imageUrl = imageFile != null ? imageFile.getUri() : null;
		if (imageUrl == null)
			return null;

		return ImageLoader.getDrawable(context, imageUrl, imageUrl, loadAsHdpi);
	}

	@Override
	public void displayImage(IViewDisplayImage view, String imageName)
	{
		if (view != null && Services.Strings.hasValue(imageName))
		{
			Drawable drawable = getStaticImage(view.getContext(), imageName, false,
					new ImageHelperHandlers.ForImageView(view), false);
			if (drawable != null)
				view.setImageDrawable(drawable);
		}
	}

	@Override
	public void displayBackground(View view, String imageName)
	{
		if (view != null && Services.Strings.hasValue(imageName))
		{
			Drawable drawable = getStaticImage(view.getContext(), imageName, false,
					new ImageHelperHandlers.ForViewBackground(view), false);
			if (drawable != null)
				view.setBackground(drawable);
		}
	}

	@Nullable
	@Override
	public Uri getSharedImage(Context context, String imageName) {
		if (Strings.hasValue(imageName)) {
			// Get the image file (either from cache, or downloading it now).
			ImageLoader.LocalImageFile imageFile = ImageLoader.getImageFile(context, imageName);
			try {
				if (imageFile.exists()) {
					try {
						return FileProviderUtils.getSharedUriFromFile(context, imageFile.getFile());
					} catch (IOException e) {
						Services.Log.error("Error sharing image", e);
					}
				}
			} finally {
				// (Possibly) delete temporary file.
				imageFile.cleanup();
			}
		}

		return null;
	}

	@Override
	public void showImage(Context context, IViewDisplayImage imageView, String imageUrl, boolean showPlaceholder, boolean fullResolution) {
		if (TextUtils.isEmpty(imageUrl)) {
			if (showPlaceholder) {
				imageView.setImageTag(null);
				StandardImages.stopLoading(imageView);
				Drawable drawable = Services.Resources.getContentDrawableFor(context, MediaTypes.IMAGE_STUB);
				StandardImages.showPlaceholderImage(imageView, drawable, true);
			}
			return;
		}

		StandardImages.startLoading(imageView);

		// TODO: check if url is a resources file in a better way.
		if (imageUrl.startsWith("/")) { // It's a URL relative to the server endpoint.
			String resourceName = FilenameUtils.getBaseName(imageUrl);
			showStaticImage(context, imageView, resourceName);
		} else {
			showDataImage(context, imageView, imageUrl, showPlaceholder, fullResolution);
		}
	}

	@Override
	public void showStaticImage(Context context, IViewDisplayImage icon, String imageName)
	{
		if (TextUtils.isEmpty(imageName)) {
			return;
		}

		// 1) Check if it is a gif
		ImageFile file = Services.Resources.getImage(imageName);
		if (file != null && file.getUri().endsWith(".gif") && icon instanceof IViewDisplayGifSupport) {
			int id = Services.Resources.getResourceId(imageName, "raw");
			if (id != 0)
				((IViewDisplayGifSupport)icon).setGifImageResource(id);
			return;
		}

		// 2) Try to get from resources.
		Drawable drawable = Services.Resources.getImageDrawable(context, imageName);
		if (drawable != null) {
			icon.setImageDrawable(drawable);
			return;
		}

		// 3) Try to get from cache.
		drawable = getImageFromCache(imageName);
		if (drawable != null) {
			icon.setImageDrawable(drawable);
			return;
		}

		// 4) Try to get with image loader.
		String imageUrl = file != null ? file.getUri() : null;
		if (imageUrl != null) {
			icon.setImageTag(imageUrl);
			ImageLoader loader = ImageLoader.fromContext(context);
			loader.displayImage(imageUrl, icon, false, false, file.hasAutoMirror());
		}
	}

	// TODO: If it´s a local image, we should check if we have storage permission and ask for it if we don't.
	@Override
	public void showDataImage(Context context, IViewDisplayImage imageView, String imageUri, boolean placeholderRequired, boolean fullResolution)
	{
		ImageLoader loader = ImageLoader.fromContext(context);

		if (Strings.hasValue(imageUri))
		{
			// Try to load from resources first, in case it is embedded.
			int resourceId = Services.Resources.getDataImageResourceId(imageUri);
			if (resourceId != 0)
			{
				if (imageUri.endsWith(".gif") && imageView instanceof IViewDisplayGifSupport)
					((IViewDisplayGifSupport)imageView).setGifImageResource(resourceId);
				else
					imageView.setImageResource(resourceId);
				return;
			}

			// It's an image file, either remote or in the local filesystem. Load Image with image loader.
			String imageFullPath;
			boolean showLoading = true;
			if (StorageHelper.isLocalFile(imageUri))
			{
				imageFullPath = imageUri;
				showLoading = false;
			}
			else if (!imageUri.contains("://"))
			{
				imageFullPath = MyApplication.getApp().UriMaker.getImageUrl(imageUri);
			}
			else
				imageFullPath = imageUri; // http://, content://, &c

			imageView.setImageTag(imageFullPath);

			// Enqueue the request to load.
			imageView.setImageBitmap(null);
			loader.displayImage(imageFullPath, imageView, showLoading, fullResolution, false);
		}
		else
		{
			// Set image identifier to null, to clear it in list when reusing views.
			imageView.setImageTag(null);

			StandardImages.stopLoading(imageView);
			Drawable drawable = Services.Resources.getContentDrawableFor(context, MediaTypes.IMAGE_STUB);
			StandardImages.showPlaceholderImage(imageView, drawable, placeholderRequired);
		}
	}

	@Override
	public Bitmap getBitmap(Context context, String imageUrl) {
		ImageLoader imageLoader = ImageLoader.fromContext(context);
		if (!StorageHelper.isLocalFile(imageUrl)) {
			imageUrl = MyApplication.getApp().UriMaker.getImageUrl(imageUrl);
		}

		return imageLoader.getBitmap(imageUrl, false);
	}

	@Override
	public void clearCache()
	{
		ImageLoader.clearCache();
	}

	public interface Handler
	{
		void receive(final Drawable d);
	}

	@Override
	public File getCachedImageFile(String imageIdentifier)
	{
		if (!Services.Strings.hasValue(imageIdentifier))
			return null;

		String imageRemoteUri = MyApplication.getApp().UriMaker.getImageUrl(imageIdentifier);
		return ImageLoader.getCachedImageFile(imageRemoteUri);
	}
}
