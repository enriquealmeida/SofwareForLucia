package com.genexus.android.media.audio;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;

import android.Manifest;
import android.app.Activity;
import android.app.Application;
import android.media.MediaRecorder;
import android.net.Uri;

import com.artech.android.PermissionUtil;
import com.artech.application.MyApplication;
import com.artech.base.services.ForegroundListener;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

/**
 * Audio Recorder implementation.
 */

class AudioRecorderImpl
{
	private static AudioRecorderImpl sInstance;

	static synchronized AudioRecorderImpl getInstance()
	{
		if (sInstance == null)
			sInstance = new AudioRecorderImpl();

		return sInstance;
	}

	static final String[] PERMISSIONS = new String[] { Manifest.permission.RECORD_AUDIO };

	private MediaRecorder mRecorder;
	private File mOutputFile;

	private AudioRecorderImpl() { }

	/**
	 * Starts audio recording.
	 * This method must be called with all necessary permissions already acquired.
	 *
	 * @return True if the audio recording was successfully started. False if it could not
	 * (for example, if we're already recording).
	 */
	@SuppressWarnings("deprecation")
	synchronized boolean start()
	{
		final Application appContext = MyApplication.getInstance();

		if (!PermissionUtil.checkSelfPermissions(appContext, PERMISSIONS))
			throw new IllegalStateException("Permissions are needed to call this method: " + Arrays.toString(PERMISSIONS));

		if (mRecorder == null)
		{
			mRecorder = new MediaRecorder();
			mRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
			mRecorder.setOutputFormat(MediaRecorder.OutputFormat.MPEG_4);
			mRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AAC);
			// change default rate, set same rate in all sd generator, default is 8khz, set better quality 16khz.
			mRecorder.setAudioSamplingRate(16000);

			try
			{
				mOutputFile = File.createTempFile("audio_rec_", ".m4a", appContext.getCacheDir());
				mRecorder.setOutputFile(mOutputFile.getAbsolutePath());
				mRecorder.prepare();
			}
			catch (IOException e)
			{
				Services.Log.warning("AudioRecorder prepare failed", e);
				mRecorder = null;
				return false;
			}

			// Add a foreground listener to cancel recording if activity is sent to background.
			Services.Application.addForegroundListener(mForegroundListener);

			mRecorder.start();
			return true;
		}
		else
		{
			// Already recording. Do not change state, but return false.
			return false;
		}
	}

	synchronized boolean isRecording()
	{
		return (mRecorder != null);
	}

	/**
	 * Stops audio recording session, returning the name of the file with the recorded audio.
	 *
	 * @return The URI of the file we just recorded, or an empty string if we were not recording.
	 */
	synchronized String stop()
	{
		if (mRecorder != null)
		{
			Services.Application.removeForegroundListener(mForegroundListener);

			// Stop recording and return the file name.
			mRecorder.stop();
			mRecorder.release();
			mRecorder = null;

			return Uri.fromFile(mOutputFile).toString();
		}
		else
			return Strings.EMPTY;
	}

	private final ForegroundListener mForegroundListener = new ForegroundListener()
	{
		@Override
		public void onBecameForeground(Activity justStarted) { }

		@Override
		public void onBecameBackground(Activity justStopped)
		{
			// Cancel audio recording when the activity is sent to background.
			cancel();
		}
	};

	/**
	 * Cancels the current recording session and deletes the file.
	 */
	private synchronized void cancel()
	{
		if (mRecorder != null)
		{
			Services.Application.removeForegroundListener(mForegroundListener);

			// Stop recording and delete the recording so far.
			mRecorder.stop();
			mRecorder.release();
			mRecorder = null;

			if (mOutputFile.exists())
			{
				boolean deleted = mOutputFile.delete();
				if (!deleted)
					Services.Log.debug("Recording was stopped, but file could not be deleted? File: " + mOutputFile.getAbsolutePath());
			}
		}
	}
}
