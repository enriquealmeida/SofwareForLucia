package com.genexus.android.media.audio;

import java.util.List;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

/**
 * ExternalApi wrapper for AudioRecorder
 */
public class AudioRecorderApi extends ExternalApi
{
	public static final String OBJECT_NAME = "GeneXus.SD.Media.AudioRecorder";

	public AudioRecorderApi(ApiAction action)
	{
		super(action);

		addMethodHandlerRequestingPermissions("Start", 0, AudioRecorderImpl.PERMISSIONS, new IMethodInvoker()
		{
			@NonNull
			@Override
			public ExternalApiResult invoke(List<Object> parameters)
			{
				boolean result = AudioRecorderImpl.getInstance().start();
				return ExternalApiResult.success(result);
			}
		});

		addSimpleMethodHandler("Stop", 0, new ISimpleMethodInvoker()
		{
			@Override
			public Object invoke(List<Object> parameters)
			{
				return AudioRecorderImpl.getInstance().stop();
			}
		});

		addSimpleMethodHandler("IsRecording", 0, new ISimpleMethodInvoker()
		{
			@Override
			public Object invoke(List<Object> parameters)
			{
				return AudioRecorderImpl.getInstance().isRecording();
			}
		});
	}
}
