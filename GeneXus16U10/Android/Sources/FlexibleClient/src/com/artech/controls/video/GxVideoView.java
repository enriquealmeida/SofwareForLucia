package com.artech.controls.video;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.widget.FrameLayout;

import com.artech.application.MyApplication;
import com.artech.base.controls.IGxControlPreserveState;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.Services;
import com.artech.common.StorageHelper;
import com.artech.controls.GxImageViewStatic;
import com.artech.controls.IGxEdit;
import com.artech.resources.MediaTypes;
import com.artech.resources.StandardImages;

import java.util.Map;

public class GxVideoView extends FrameLayout implements IGxEdit, IGxControlPreserveState {
	private static final String TAG = "GxVideoView";
	private static final String STATE_CURRENT_POSITION = "CurrentPosition";
	private FrameLayout mVideoView;
	private Uri mVideoUri;
	private int mCurrentPosition;
	private final LayoutItemDefinition mDefinition;
	private final ViewGroup.LayoutParams mLayoutParams;

	public GxVideoView(Context context, LayoutItemDefinition definition) {
		super(context);
		mDefinition = definition;
		mLayoutParams = new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, mDefinition.getCellGravity());
		mCurrentPosition = 1;
	}

	@Override
	public String getGxTag() {
		return getTag().toString();
	}

	@Override
	public void setGxTag(String tag) {
		setTag(tag);
	}

	@Override
	public String getGxValue() {
		return (mVideoUri == null) ? null : mVideoUri.toString();
	}

	private void insertEmptyVideo() {
		// Make sure to remove all views in the layout.
		removeAllViews();

		if (mVideoView instanceof GxYouTubeVideoView) {
			((GxYouTubeVideoView) mVideoView).onDestroy();
		}

		mVideoView = null;

		// Set default image.
		GxImageViewStatic imageView = new GxImageViewStatic(getContext(), null, null);
		Drawable drawable = Services.Resources.getContentDrawableFor(getContext(), MediaTypes.VIDEO_STUB);
		StandardImages.showPlaceholderImage(imageView, drawable, true);
		addView(imageView, mLayoutParams);
	}

	private void insertYouTubeVideo()
	{
		// Get the videoId from the YouTube URL.
		VideoUtils.YouTubeVideoInfo videoInfo = VideoUtils.getYouTubeVideo(mVideoUri.toString());
		if (videoInfo == null) {
			insertEmptyVideo();
			Services.Log.error(TAG, "Invalid YouTube video URL.");
			return;
		}

		// If there's already a GxYouTubeVideoView loaded, update it. Otherwise, instantiate a new one.
		if (mVideoView instanceof GxYouTubeVideoView) {
			((GxYouTubeVideoView) mVideoView).setVideo(videoInfo);
		} else {
			// Make sure to remove all views in the layout.
			removeAllViews();

			// Add the new GxYouTubeVideoView.
			mVideoView = new GxYouTubeVideoView(getContext(), videoInfo);
			addView(mVideoView, mLayoutParams);
		}
	}

	private void insertRegularVideo() {
		// If it's not a local video file and it's not an absolute URL, add base path of the application server.
		if (!StorageHelper.isLocalFile(mVideoUri.toString()) && !mVideoUri.toString().contains("://")) {
			mVideoUri = Uri.parse(MyApplication.getApp().UriMaker.getImageUrl(mVideoUri.toString()));
		}

		// If there's already a GxRegularVideoView loaded, update it. Otherwise, instantiate a new one.
		if (mVideoView instanceof GxRegularVideoView) {
			((GxRegularVideoView) mVideoView).setVideoUri(mVideoUri);
			((GxRegularVideoView) mVideoView).setCurrentPosition(mCurrentPosition);
		} else {
			// If there's a different videoView instantiated destroy it.
			if (mVideoView instanceof GxYouTubeVideoView) {
				((GxYouTubeVideoView) mVideoView).onDestroy();
			}

			// Make sure to remove all views on the layout.
			removeAllViews();

			// Add the new GxRegularVideoView.
			mVideoView = new GxRegularVideoView(getContext(), mDefinition, mVideoUri, mCurrentPosition);
			addView(mVideoView, mLayoutParams);
		}
	}

	@Override
	public void setGxValue(String value) {
		mVideoUri = (value == null) ? null : Uri.parse(value);

		if (TextUtils.isEmpty(value)) {
			insertEmptyVideo();
		} else if (VideoUtils.isYouTubeUrl(value)) {
			insertYouTubeVideo();
		} else {
			insertRegularVideo();
		}
	}

	@Override
	public void setValueFromIntent(Intent data) 
	{
	}

	public void retryYoutubeInitialization() 
	{
		if (mVideoView instanceof GxYouTubeVideoView) 
		{
			((GxYouTubeVideoView) mVideoView).retryInitialization();
		}
	}
	
	private int getCurrentPosition() {
		if (mVideoView instanceof GxRegularVideoView) {
			mCurrentPosition = ((GxRegularVideoView) mVideoView).getCurrentPosition();
		}
		return mCurrentPosition;
	}

	private void setCurrentPosition(int currentPosition) {
		mCurrentPosition = currentPosition;
	}

	@Override
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public boolean isEditable()
	{
		return false; // Never editable.
	}

	@Override
	public String getControlId() {
		return mDefinition.getName();
	}

	@Override
	public void saveState(Map<String, Object> state) {
		state.put(STATE_CURRENT_POSITION, getCurrentPosition());
	}

	@Override
	public void restoreState(Map<String, Object> state) {
		int currentPosition = (Integer) state.get(STATE_CURRENT_POSITION);
		setCurrentPosition(currentPosition);
	}
}
