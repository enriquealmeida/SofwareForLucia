package com.genexus.android.media;

import android.content.Context;

import com.artech.android.ActivityResources;
import com.artech.base.metadata.theme.ThemeClassFactory;
import com.artech.base.utils.Strings;
import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;
import com.example.android.uamp.R;
import com.genexus.android.media.audio.AudioApi;
import com.genexus.android.media.audio.AudioPlayerBackground;
import com.genexus.android.media.customization.AudioPlayerThemeClassDefinition;
import com.genexus.android.media.ui.ApplicationAudioResource;
import com.genexus.android.media.ui.PlaybackControlsContainer;

/**
 * Media Player module.
 */
public class MediaPlayerModule implements GenexusModule
{
	private static String mGoogleCastApplicationId;

	@Override
	public void initialize(Context context)
	{
		// Register external objects.
		ExternalApiFactory.addApi(new ExternalApiDefinition(AudioApi.OBJECT_NAME, AudioApi.class));
		// ExternalApiFactory.addApi(new ExternalApiDefinition(VideoApi.NAME, VideoApi.class)); pending commit

		// Register user controls.
		UcFactory.addControl(new UserControlDefinition("AudioController", PlaybackControlsContainer.class));
		ThemeClassFactory.register(AudioPlayerThemeClassDefinition.CLASS_NAME, AudioPlayerThemeClassDefinition.class);

		// Prepare Google Cast support.
		mGoogleCastApplicationId = context.getResources().getString(R.string.gx_cast_application_id);

		// Start up the MediaBrowserClient associated to the background Audio Player.
		AudioPlayerBackground.getInstance(context);

		// Add a listener for global activity events.
		ActivityResources.addApplicationResource(ApplicationAudioResource.getInstance());

		// Turn on for debugging
		// LogHelper.setDebug(true);
	}

	public static String getGoogleCastApplicationId()
	{
		return mGoogleCastApplicationId;
	}

	public static boolean isGoogleCastEnabled()
	{
		return Strings.hasValue(mGoogleCastApplicationId);
	}
}
