package com.artech.android.media;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import android.content.ContentResolver;
import android.content.ContentValues;
import android.content.Context;
import android.media.MediaScannerConnection;
import android.net.Uri;
import android.os.Build;
import android.os.Environment;
import android.provider.MediaStore;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.android.media.actions.MediaAction;
import com.artech.application.MyApplication;
import com.artech.base.metadata.enums.ControlTypes;
import com.artech.base.model.PropertiesObject;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultDetail;
import com.artech.common.IProgressListener;
import com.artech.common.ImageResizingHelper;
import com.artech.common.StorageHelper;
import com.artech.utils.FileUtils2;

public class MediaUtils {
	public static final String FULL_FILE_SCHEME = ContentResolver.SCHEME_FILE + "://";

	/**
	 * Useful to check onActivityResult for MediaPicker request codes.
	 */
	public static boolean isPickMediaRequest(int requestCode) {
		return requestCode == MediaAction.PICK_IMAGE.getRequestCode()
				|| requestCode == MediaAction.PICK_VIDEO.getRequestCode()
				|| requestCode == MediaAction.PICK_AUDIO.getRequestCode()
				|| requestCode == MediaAction.PICK_IMAGES.getRequestCode();
	}

	/**
	 * Useful to check onActivityResult for CameraHelper request codes.
	 */
	public static boolean isTakeMediaRequest(int requestCode) {
		return requestCode == MediaAction.TAKE_PICTURE.getRequestCode()
				|| requestCode == MediaAction.CAPTURE_VIDEO.getRequestCode()
				|| requestCode == MediaAction.CAPTURE_AUDIO.getRequestCode();
	}
	
	/**
	 * Creates a local file in the DCIM directory storing the media content and scans it so it pops up in the Gallery.
	 * 
	 * @param uri the media's uri. Supports content:// or file:// schemes.
	 * @param fileName name for the file that will be created.
	 * @return the file path to the created media file.
	 */
	public static String addToGallery(Context context, Uri uri, String fileName) {
		if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) {
			return addToGalleryPreQ(context, uri, fileName);
		} else {
			ContentResolver resolver = context.getContentResolver();
			String mimeType = resolver.getType(uri);
			Uri contentUri = null;
			if (mimeType != null) {
				if (mimeType.startsWith("video"))
					contentUri = MediaStore.Video.Media.EXTERNAL_CONTENT_URI;
				else if (mimeType.startsWith("image"))
					contentUri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI;
				else if (mimeType.startsWith("audio"))
					contentUri = MediaStore.Audio.Media.EXTERNAL_CONTENT_URI;
			}

			if (contentUri != null) {
				ContentValues contentValues = new ContentValues();
				contentValues.put(MediaStore.MediaColumns.DISPLAY_NAME, fileName);
				contentValues.put(MediaStore.MediaColumns.MIME_TYPE, mimeType);
				contentValues.put(MediaStore.MediaColumns.RELATIVE_PATH, Environment.DIRECTORY_DCIM);

				Uri outputUri = resolver.insert(contentUri, contentValues);

				try {
					OutputStream outputStream = resolver.openOutputStream(outputUri);
					InputStream inputStream;
					if (ContentResolver.SCHEME_CONTENT.equals(uri.getScheme())) {
						inputStream = context.getContentResolver().openInputStream(uri);
					} else { // Assume it's a local file (with or without the file:// scheme).
						inputStream = new FileInputStream(uri.getPath());
					}
					IOUtils.copy(inputStream, outputStream);
					inputStream.close();
					outputStream.close();
					return uri.getPath();
				} catch (IOException ex) {
					Services.Log.error(String.format("Adding to gallery '%s'", outputUri.toString()), ex);
				}
			}

			return null;
		}
	}

	@SuppressWarnings("deprecation")
	private static String addToGalleryPreQ(Context context, Uri uri, String fileName) {
		File externalDir = Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DCIM);
		externalDir.mkdirs();
		File outputFile = new File(externalDir, fileName);

		try {
			if (ContentResolver.SCHEME_CONTENT.equals(uri.getScheme())) {
				InputStream inputStream = context.getContentResolver().openInputStream(uri);
				FileUtils.copyInputStreamToFile(inputStream, outputFile);
			} else { // Assume it's a local file (with or without the file:// scheme).
				File inputFile = new File(uri.getPath());
				FileUtils.copyFile(inputFile, outputFile);
			}
		} catch (IOException e) {
			return null;
		}

		MediaScannerConnection.scanFile(context, new String[]{outputFile.getAbsolutePath()}, null, null);

		return outputFile.getAbsolutePath();
	}

	@Deprecated
	// TODO: Stop using this method.
	public static Uri translateGenexusImageUri(Uri imageUri)
	{
		if (ContentResolver.SCHEME_CONTENT.equalsIgnoreCase(imageUri.getScheme()))
			return imageUri;

		String imagePath = imageUri.toString();
		if (imagePath.startsWith("Resources/")) {
			imagePath = FileUtils2.SCHEME_GX_RESOURCE + "://" + imagePath;
		} else if (StorageHelper.isLocalFile(imagePath)) {
			if (!imagePath.startsWith(FULL_FILE_SCHEME)) {
				imagePath = FULL_FILE_SCHEME + imagePath;
			}
		} else {
			imagePath = MyApplication.getApp().UriMaker.getImageUrl(imagePath);
		}
		return Uri.parse(imagePath);
	}

	public static Object translateGenexusBlobPathToUri(Object blobPath)
	{
		if (blobPath instanceof String)
		{
			String blobPathString = (String)blobPath;
			// check if its local file. Then add scheme
			if (Services.Strings.hasValue(blobPathString) && blobPathString.startsWith("/"))
			{
				File file = new File(blobPathString);
				if (file.exists())
					return FULL_FILE_SCHEME + blobPath;
			}
		}
		return blobPath;

	}

	/**
	 *  Map Genexus' video quality parameter values to Android's parameter values.
	 */
	public static int mapVideoQualityValue(String videoQuality) {
		int videoQualityExtra;
		switch (videoQuality) {
			case "3": // Low quality
				videoQualityExtra = 0;
				break;
			default:
			case "5": // Medium quality
				videoQualityExtra = 1;
				break;
			case "7": // High quality
				videoQualityExtra = 2;
				break;
		}
		return videoQualityExtra;
	}

	/**
	 * Given a content://, file:// or gx.resource:// URI, it saves the data to the server and sets
	 * the token returned by the server to the corresponding control.
	 * If the control is of type {@link ControlTypes#PHOTO_EDITOR}, it also re-sizes the image before
	 * uploading it, in accordance to the policy established.
	 *
	 * @return whether or not the data was successfully saved.
	 */
	@NonNull
	public static ResultDetail<Void> uploadMedia(@NonNull Context context, @NonNull Uri dataUri, @NonNull String controlName, String controlType,
														  int maxUploadSizeMode, @NonNull IApplicationServer appServer, @NonNull PropertiesObject properties,
														  @Nullable IProgressListener listener)
	{
		ResultDetail<Void> result;
		File tmpFile = null;
		try
		{
			File tempDir = new File(context.getCacheDir(), "temp");
			tmpFile = FileUtils2.copyDataToFile(context, dataUri, tempDir);

			if (ControlTypes.PHOTO_EDITOR.equalsIgnoreCase(controlType))
			{
				File resizedImageFile = ImageResizingHelper.resizeImageForUpload(tmpFile, maxUploadSizeMode);
				FileUtils.deleteQuietly(tmpFile);
				tmpFile = resizedImageFile;
			}

			ResultDetail<String> uploadResult = appServer.uploadBinary(tmpFile, listener);
			if (uploadResult.getResult())
			{
				String binaryToken = uploadResult.getData();
				if (binaryToken != null)
				{
					properties.setProperty(controlName, binaryToken);
					result = ResultDetail.ok(null);
				}
				else
					result = ResultDetail.error("Media upload was successful but no token was returned", null);
			}
			else
				result = ResultDetail.error(uploadResult.getMessage(), null);
		}
		catch (IOException e)
		{
			Services.Log.error("Error while attempting to save control value.", e);
			result = ResultDetail.error(e.getMessage(), null);
		}
		finally
		{
			FileUtils.deleteQuietly(tmpFile);
		}

		return result;
	}
}
