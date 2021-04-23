package com.genexus.coreexternalobjects;

import android.app.Activity;
import android.content.ClipData;
import android.content.ContentResolver;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.R;
import com.artech.actions.ActionExecution;
import com.artech.actions.ApiAction;
import com.artech.android.FileDownloader;
import com.artech.android.FileDownloader.FileDownloaderListener;
import com.artech.android.media.MediaUtils;
import com.artech.android.media.actions.MediaAction;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.artech.utils.FileUtils2;

import org.apache.commons.io.FilenameUtils;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * PhotoLibraryAPI Spec: https://iwiki.genexus.com/hwikibypageid.aspx?16520
 */
public class PhotoLibraryAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.Media.PhotoLibrary";

	private static final String METHOD_SAVE_IMAGE = "Save";
	private static final String METHOD_SAVE_VIDEO = "SaveVideo";
	private static final String METHOD_CHOOSE_IMAGE = "ChooseImage";
	private static final String METHOD_CHOOSE_VIDEO = "ChooseVideo";
	private static final String METHOD_CHOOSE_IMAGES = "ChooseImages";

	private static final String[] PERMISSIONS = {"android.permission.WRITE_EXTERNAL_STORAGE"};

	private List<Uri> mSelectedMediaUris;
	private List<Uri> mUrisToCopy;

	public PhotoLibraryAPI(ApiAction action) {
		super(action);
		addMethodHandlerRequestingPermissions(METHOD_SAVE_IMAGE, 1, PERMISSIONS, mMethodSaveMedia);
		addMethodHandlerRequestingPermissions(METHOD_SAVE_VIDEO, 1, PERMISSIONS, mMethodSaveMedia);
		addMethodHandler(METHOD_CHOOSE_IMAGE, 0, mMethodChooseMedia);
		addMethodHandler(METHOD_CHOOSE_VIDEO, 0, mMethodChooseMedia);
		addMethodHandler(METHOD_CHOOSE_IMAGES, 0, mMethodChooseMedia);
	}

	/**
	 * Given an attr/var of type 'Image' or 'Video', it stores it in the device's Image Gallery.
	 */
	private final IMethodInvoker mMethodSaveMedia = new IMethodInvoker() {
		@NonNull
		@Override
		public ExternalApiResult invoke(List<Object> parameters) {
			String mediaPath = (String) parameters.get(0);
			if (!Strings.hasValue(mediaPath))
				return ExternalApiResult.FAILURE;

			Uri mediaUri = Uri.parse(mediaPath);
			String scheme = mediaUri.getScheme();

			if (scheme == null) {
				Services.Log.debug(String.format("%s has a no scheme declared.", mediaUri));
				return ExternalApiResult.FAILURE;
			}

			if (ContentResolver.SCHEME_FILE.equalsIgnoreCase(scheme)) {
				String fileName = FilenameUtils.getName(mediaPath);
				MediaUtils.addToGallery(getContext(), mediaUri, fileName);
				return ExternalApiResult.SUCCESS_CONTINUE;
			}

			if (FileUtils2.SCHEME_HTTP.equalsIgnoreCase(scheme) || FileUtils2.SCHEME_HTTPS.equalsIgnoreCase(scheme)) {
				FileDownloader.enqueue(getContext(), mSaveMediaDownloadListener, mediaUri);
				return ExternalApiResult.SUCCESS_WAIT;
			}

			if (ContentResolver.SCHEME_CONTENT.equalsIgnoreCase(scheme)) {
				FileUtils2.copyDataToFileAsync(getContext(), mediaUri, getContext().getCacheDir(), mCopyDataToFileListener2);
				return ExternalApiResult.SUCCESS_WAIT;
			}

			return ExternalApiResult.FAILURE;
		}
	};

	private final IMethodInvoker mMethodChooseMedia = new IMethodInvokerWithActivityResult() {
		@Override
		public @NonNull ExternalApiResult invoke(List<Object> parameters) {
			String methodName = getAction().getMethodName();
			MediaAction action;
			switch (methodName) {
				case METHOD_CHOOSE_IMAGE:
					action = MediaAction.PICK_IMAGE;
					break;
				case METHOD_CHOOSE_VIDEO:
					action = MediaAction.PICK_VIDEO;
					break;
				case METHOD_CHOOSE_IMAGES:
					action = MediaAction.PICK_IMAGES;
					break;
				default:
					throw new RuntimeException(
							String.format("Invalid method name: %s", methodName)
					);
			}
			return launchMediaPicker(action);
		}

		@NonNull
		@Override
		public ExternalApiResult handleActivityResult(int requestCode, int resultCode, @Nullable Intent result) {
			return handlePickMediaResult(requestCode, resultCode, result);
		}
	};

	private ExternalApiResult launchMediaPicker(MediaAction mediaAction) {
		Intent intent = mediaAction.buildIntent();

		if (intent.resolveActivity(getActivity().getPackageManager()) == null) {
			String message = Services.Strings.getResource(R.string.GXM_NoApplicationAvailable);
			Services.Messages.showMessage(getActivity(), message);
			return ExternalApiResult.FAILURE;
		}

		startActivityForResult(intent, mediaAction.getRequestCode());
		return ExternalApiResult.SUCCESS_WAIT;
	}

	private ExternalApiResult handlePickMediaResult(int requestCode, int resultCode, @Nullable Intent result) {
		if (MediaUtils.isPickMediaRequest(requestCode)) {
			// Media has just been picked.
			if (resultCode != Activity.RESULT_OK
					|| result == null
					|| (result.getData() == null && result.getClipData() == null)) {
				return ExternalApiResult.FAILURE;
			}

			// Check if one uri or several were returned
			if (result.getData() != null) {
				mUrisToCopy = new ArrayList<>(1);
				mUrisToCopy.add(result.getData());
			} else {
				ClipData data = result.getClipData();
				mUrisToCopy = new ArrayList<>(data.getItemCount());
				for (int i = 0; i < data.getItemCount(); i++) {
					mUrisToCopy.add(data.getItemAt(i).getUri());
				}
			}

			mSelectedMediaUris = new ArrayList<>(mUrisToCopy.size());
			Uri mediaUri = mUrisToCopy.get(mSelectedMediaUris.size());

			return copyMediaToAppDirectory(mediaUri);
		} else if (requestCode == RequestCodes.ACTION) {
			// Continuing action after executing the CopyDataToFileListener.

			if (mUrisToCopy == null || mUrisToCopy.size() == 0) {
				throw new RuntimeException("Invalid state.");
			}

			if (METHOD_CHOOSE_IMAGE.equals(getAction().getMethodName()) ||
					METHOD_CHOOSE_VIDEO.equals(getAction().getMethodName())) {
				return ExternalApiResult.success(mSelectedMediaUris.get(0));
			} else if (METHOD_CHOOSE_IMAGES.equals(getAction().getMethodName())) {
				if (mUrisToCopy.size() == 1) {
					JSONArray imagesCollection = createImagesCollectionSDT(mSelectedMediaUris);
					return ExternalApiResult.success(imagesCollection);
				} else {
					if (mSelectedMediaUris.size() < mUrisToCopy.size()) {
						Uri mediaUri = mUrisToCopy.get(mSelectedMediaUris.size());
						return copyMediaToAppDirectory(mediaUri);
					} else {
						JSONArray imagesCollection = createImagesCollectionSDT(mSelectedMediaUris);
						return ExternalApiResult.success(imagesCollection);
					}
				}
			} else {
				return ExternalApiResult.FAILURE;
			}
		} else {
			return ExternalApiResult.FAILURE;
		}
	}

	private ExternalApiResult copyMediaToAppDirectory(Uri mediaUri) {
		// Old picker apps may send a file path without scheme. Add the file scheme as prefix in this case.
		// TODO: See in which device models or os versions it happens.
		if (mediaUri.getScheme() == null) {
			mediaUri = Uri.parse(ContentResolver.SCHEME_FILE + "://" + mediaUri.toString());
		}

		if (!FileUtils2.canCopyDataToFile(mediaUri)) {
			return ExternalApiResult.FAILURE;
		}

		FileUtils2.copyDataToFileAsync(getContext(), mediaUri, getContext().getCacheDir(), mCopyDataToFileListener);

		return ExternalApiResult.SUCCESS_WAIT;
	}

	private FileDownloaderListener mSaveMediaDownloadListener = new FileDownloaderListener() {
		@Override
		public void onDownloadProgressUpdate(int progressPercentage) {

		}

		@Override
		public void onDownloadSuccessful(Uri fileUri, String fileName) {
			MediaUtils.addToGallery(getContext(), fileUri, fileName);
			ActionExecution.continueCurrent(getActivity(), false, getAction());
		}

		@Override
		public void onDownloadFailed() {
			ActionExecution.cancelCurrent(getAction());
		}
	};

	private FileUtils2.CopyDataToFileListener mCopyDataToFileListener = new FileUtils2.CopyDataToFileListener() {
		@Override
		public void onCopyDataFinished(boolean successful, @NonNull File destFile) {
			if (successful) {
				mSelectedMediaUris.add(Uri.fromFile(destFile));
				ActionExecution.continueCurrent(getActivity(), false, getAction());
			} else {
				ActionExecution.cancelCurrent(getAction());
			}
		}
	};

	private FileUtils2.CopyDataToFileListener mCopyDataToFileListener2 = (successful, destFile) -> {
		if (successful) {
			MediaUtils.addToGallery(getContext(), Uri.fromFile(destFile), destFile.getName());
			ActionExecution.continueCurrent(getActivity(), false, getAction());
		} else {
			ActionExecution.cancelCurrent(getAction());
		}
	};

	@NonNull
	private JSONArray createImagesCollectionSDT(List<Uri> mediaUris) {
		JSONArray array = new JSONArray();

		for (Uri mediaUri : mediaUris) {
			JSONObject item = new JSONObject();
			try {
				item.put("Image", mediaUri.toString());
			} catch (JSONException e) {
				// ignore
			}
			array.put(item);
		}
		return array;
	}
}
