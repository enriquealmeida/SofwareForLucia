package com.genexus.android.media;

import android.content.Context;

import com.artech.externalapi.ExternalApiDefinition;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.framework.GenexusModule;
import com.genexus.android.media.audio.AudioRecorderApi;

/**
 * Media Recorder Module
 */
public class MediaRecorderModule implements GenexusModule
{
	@Override
	public void initialize(Context context)
	{
		ExternalApiFactory.addApi(new ExternalApiDefinition(AudioRecorderApi.OBJECT_NAME, AudioRecorderApi.class));
	}
}
