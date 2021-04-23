package com.artech.controls.video;

import android.content.Context;
import android.content.res.Resources;
import androidx.annotation.NonNull;
import android.widget.FrameLayout;
import android.widget.Toast;

import com.artech.R;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.fragments.LayoutFragmentActivity;
import com.artech.utils.Cast;
import com.google.android.youtube.player.YouTubeInitializationResult;
import com.google.android.youtube.player.YouTubePlayer;
import com.google.android.youtube.player.YouTubePlayer.Provider;
import com.google.android.youtube.player.YouTubePlayerSupportFragment;

class GxYouTubeVideoView extends FrameLayout implements YouTubePlayer.OnInitializedListener {
	private static final String TAG = "GxYouTubeVideoView";
	private static final int RECOVERY_DIALOG_REQUEST = 1;

	private String mDeveloperKey;
	private VideoUtils.YouTubeVideoInfo mVideo;
	private LayoutFragmentActivity mActivity = null;
	private YouTubePlayerSupportFragment mPlayerFragment = null;
	private YouTubePlayer mPlayer = null;
	
	public GxYouTubeVideoView(Context context, VideoUtils.YouTubeVideoInfo video) {
		super(context);

		mVideo = video;
		
		// Get the Developer key specified in the control property.
		try {
			mDeveloperKey = Services.Strings.getResource(R.string.GoogleServicesApiKey);
		} catch (Resources.NotFoundException e) {
			// Android YouTube API Key not found in the resources.
			Services.Exceptions.handle(e);
			return;
		}
		
		if (mDeveloperKey.equalsIgnoreCase(Strings.EMPTY)) {
			Services.Log.error(TAG, "YouTube API Developer Key was empty.");
			return;
		}
		
		mActivity = Cast.as(LayoutFragmentActivity.class, context);
		if (mActivity == null) {
			throw new IllegalArgumentException(TAG + ": Invalid context");
		}
		
		inflate(context, R.layout.youtube_view, this);
		if (findViewById(R.id.youtube_fragment_container) == null) {
			Services.Log.error(TAG, "Failed to find the YouTube fragment container.");
			return;
		}
		
		mPlayerFragment = (YouTubePlayerSupportFragment) mActivity.getSupportFragmentManager().findFragmentById(R.id.youtube_fragment_container);

		if (mPlayerFragment != null) {
			mActivity.getSupportFragmentManager().beginTransaction().remove(mPlayerFragment).commit();
		}
		
		mPlayerFragment = YouTubePlayerSupportFragment.newInstance();
		mActivity.getSupportFragmentManager().beginTransaction().add(R.id.youtube_fragment_container, mPlayerFragment).commit();
		
		mPlayerFragment.initialize(mDeveloperKey, this);
	}

	private YouTubePlayer.OnFullscreenListener mOnFullScreenListener = new YouTubePlayer.OnFullscreenListener() {
		@Override
		public void onFullscreen(boolean entersFullscreen) {
			mActivity.setAllowUnrestrictedOrientationChange(entersFullscreen);
		}
	};

	@Override
	public void onInitializationSuccess(Provider provider, YouTubePlayer player, boolean wasRestored) {
		Services.Log.debug(TAG, "Player Initialized.");
		mPlayer = player;
		mPlayer.setOnFullscreenListener(mOnFullScreenListener);

		if (mVideo != null && !wasRestored)
		{
			Services.Log.debug(TAG, "Video Cued.");
			cueVideo(mVideo);
		}
	}
	
	@Override
	public void onInitializationFailure(YouTubePlayer.Provider provider, YouTubeInitializationResult errorReason) {
		Services.Log.error(TAG, "YoutubePlayer failed to initialize.");
		if (errorReason.isUserRecoverableError()) {
			errorReason.getErrorDialog(mActivity, RECOVERY_DIALOG_REQUEST).show();
		} else {
			String errorMessage = Services.Strings.getResource(R.string.GXM_YoutubeError, errorReason.toString());
			Toast.makeText(mActivity.getApplicationContext(), errorMessage, Toast.LENGTH_LONG).show();
		}
	}
	
	public void retryInitialization() {
		// Retry initialization if user performed a recovery action
		mPlayerFragment.initialize(mDeveloperKey, this);
	}

	public void setVideo(@NonNull VideoUtils.YouTubeVideoInfo video)
	{
		if (mVideo == null || !video.id.equals(mVideo.id))
		{
			// Re-load the player
			mVideo = video;
			cueVideo(video);
		}
	}

	private void cueVideo(VideoUtils.YouTubeVideoInfo video)
	{
		if (video.startTimeSeconds != null)
			mPlayer.cueVideo(video.id, video.startTimeSeconds * 1000);
		else
			mPlayer.cueVideo(video.id);
	}

	public void onDestroy() {
		mActivity.getSupportFragmentManager().beginTransaction().remove(mPlayerFragment).commit();
	}
}
