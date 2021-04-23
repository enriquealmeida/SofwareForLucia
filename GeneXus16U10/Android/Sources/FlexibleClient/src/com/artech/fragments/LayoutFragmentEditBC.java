package com.artech.fragments;

import java.util.LinkedHashMap;
import java.util.Map;

import android.content.ContentResolver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Message;
import androidx.appcompat.app.AlertDialog;
import android.view.View;

import com.artech.R;
import com.artech.actions.ActionExecution;
import com.artech.actions.WorkWithAction;
import com.artech.activities.IntentParameters;
import com.artech.android.media.MediaUtils;
import com.artech.application.MyApplication;
import com.artech.base.application.IBusinessComponent;
import com.artech.base.application.OutputResult;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.enums.DisplayModes;
import com.artech.base.metadata.enums.LayoutModes;
import com.artech.base.model.Entity;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultDetail;
import com.artech.base.utils.Strings;
import com.artech.common.IProgressListener;
import com.artech.common.IntentHelper;
import com.artech.common.TrnHelper;
import com.artech.controllers.DataSourceControllerBC;
import com.artech.controllers.IDataSourceController;
import com.artech.controls.GxImageViewData;
import com.artech.controls.IGxEdit;
import com.artech.controls.ProgressDialogFactory;

public class LayoutFragmentEditBC extends LayoutFragment
{
	private DataSourceControllerBC mController;
	@SuppressWarnings("deprecation")
	private android.app.ProgressDialog mProgressDialog;
	
	@Override
	public void setController(IDataSourceController controller)
	{
		if (!(controller instanceof DataSourceControllerBC))
			throw new IllegalArgumentException("Controller for LayoutFragmentEditBC is not of the correct type.");
		
		mController = (DataSourceControllerBC)controller;
	}

	@Override
	protected short getLayoutMode()
	{
		return LayoutModes.EDIT;
	}
	
	public void runSaveAction()
	{
		SaveActionTask saveActionTask = new SaveActionTask();
		saveActionTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
	}

	private class SaveActionTask extends AsyncTask<Entity, Message, OutputResult> implements IProgressListener
	{
		private LinkedHashMap<String, Uri> mMediaToUpload;
		private int mProgressStep;

		public SaveActionTask()
		{
			mMediaToUpload = calculateMediaToUpload(mController.getBCEntity());
		}

		private LinkedHashMap<String, Uri> calculateMediaToUpload(Entity entity)
		{
			LinkedHashMap<String, Uri> mediaToUpload = new LinkedHashMap<>();
			for (DataItem dataItem : entity.getLevel().Items)
			{
				if (dataItem.isMediaOrBlob())
				{
					String value = entity.optStringProperty(dataItem.getName());
					if (Strings.hasValue(value))
					{
						Uri mediaUri = Uri.parse(value);
						String scheme = mediaUri.getScheme();

						// Offline app blobs used to use filepaths with no schemes, whereas selected custom media files should use the file:// scheme.
						// Now, offline path use file:// scheme also, if offline and file schema (server is offline)
						// check that value is dirty to send to server (entity dataItem.getName() is dirty)
						if (ContentResolver.SCHEME_FILE.equals(scheme) || ContentResolver.SCHEME_CONTENT.equals(scheme))
						{
							if (entity.isDirtyByChange(dataItem.getName()))
							{
								mediaToUpload.put(dataItem.getName(), mediaUri);
							}
						}
					}
				}
			}

			return mediaToUpload;
		}

		@Override
		@SuppressWarnings("deprecation")
		protected void onPreExecute()
		{
			// Show default progress indicator only if there isn't another one running.
			if (ProgressDialogFactory.isShowing(getActivity()))
				return;

			int textId = R.string.GXM_Saving;
			if (mController.getMode() == DisplayModes.DELETE)
				textId = R.string.GXM_Deleting;

			mProgressDialog = new android.app.ProgressDialog(getActivity());
			mProgressDialog.setTitle(textId);
			mProgressDialog.setCancelable(false);
			mProgressDialog.setProgressNumberFormat(null);

			if (mMediaToUpload.size() != 0)
			{
				mProgressDialog.setProgressStyle(android.app.ProgressDialog.STYLE_HORIZONTAL);
			}
			else
			{
				mProgressDialog.setProgressStyle(android.app.ProgressDialog.STYLE_SPINNER);
				mProgressDialog.setIndeterminate(true);
			}

			mProgressDialog.show();
		}

		@Override
		protected OutputResult doInBackground(Entity... params)
		{
			return saveBCAndMedia(mController.getBCEntity());
		}

		private OutputResult saveBCAndMedia(Entity entity)
		{
			if (entity == null)
				return null;

			short mode = mController.getMode();
			IBusinessComponent bc = mController.getBusinessComponent();

			if (mode == DisplayModes.INSERT || mode == DisplayModes.EDIT)
			{
				ResultDetail<Void> mediaUploadResult = uploadMedia();
				if (!mediaUploadResult.getResult())
					return OutputResult.error(mediaUploadResult.getMessage());

				notifyProgressMessage(Services.Strings.getResource(R.string.GXM_Saving));
				return bc.save(entity);
			}
			else if (mode == DisplayModes.DELETE)
			{
				return bc.delete();
			}
			else
				throw new IllegalArgumentException(String.format("Unknown mode: %s", mode)); //$NON-NLS-1$
		}

		private ResultDetail<Void> uploadMedia()
		{
			IApplicationServer server = mController.getServer();
			Context context = MyApplication.getAppContext();
			Entity entity = mController.getBCEntity();

			for (Map.Entry<String, Uri> mediaItem : mMediaToUpload.entrySet())
			{
				String controlName = mediaItem.getKey();
				Uri mediaUri = mediaItem.getValue();

				IGxEdit view = getAdapter().getEdit(controlName);
				GxImageViewData imageView = TrnHelper.getGxImage((View)view);
				notifyProgressMessage(getResources().getText(R.string.GXM_Uploading).toString());

				String controlType = imageView != null ? imageView.getControlType() : null;
				int maxUploadSizeMode = imageView != null ? imageView.getMaximumUploadSizeMode() : -1;

				ResultDetail<Void> mediaUploaded = MediaUtils.uploadMedia(context, mediaUri, controlName, controlType, maxUploadSizeMode, server, entity, this);

				if (!mediaUploaded.getResult())
					return mediaUploaded; // Abort on this error
			}

			return ResultDetail.ok();
		}

		@Override
		public void setCount(long length)
		{
			notifyProgressTotal(length);
		}

		private void notifyProgressTotal(long length)
		{
			Message msg = Message.obtain();
			Bundle b = new Bundle();
			b.putInt("Total", (int)length); //$NON-NLS-1$
			msg.setData(b);
			onProgress(msg);
		}

		@Override
		public void step()
		{
			mProgressStep++;
			notifyProgressStep();
		}

		private void notifyProgressStep()
		{
			Message msg = Message.obtain();
			Bundle b = new Bundle();
			b.putInt("Step", mProgressStep); //$NON-NLS-1$
			msg.setData(b);
			onProgress(msg);
		}

		private void notifyProgressMessage(String data)
		{
			Message msg = Message.obtain();
			Bundle b = new Bundle();
			b.putString("Message", data); //$NON-NLS-1$
			msg.setData(b);
			onProgress(msg);
		}

		@Override
		@SuppressWarnings("deprecation")
		protected void onProgressUpdate(Message... progress)
		{
			if (mProgressDialog != null && mProgressDialog.isShowing() && progress != null && progress.length > 0)
			{
				Message p = progress[0];
				String message = p.getData().getString("Message"); //$NON-NLS-1$
				if (message != null)
					mProgressDialog.setTitle(message);

				int total = p.getData().getInt("Total"); //$NON-NLS-1$
				if (total > 0)
				{
					mProgressDialog.setProgressStyle(android.app.ProgressDialog.STYLE_HORIZONTAL);
					mProgressDialog.setMax(total);
				}

				int step = p.getData().getInt("Step"); //$NON-NLS-1$
				if (step > 0)
					mProgressDialog.setProgress(step);
			}
		}

		public void onProgress(Message s)
		{
			publishProgress(s);
		}

		@Override
		protected void onPostExecute(final OutputResult result)
		{
			if (result == null)
				return;

			// Display the result of insert/update/delete.
			afterSaveAction(result);
		}

		private void afterSaveAction(OutputResult result)
		{
			if (getActivity() == null)
				return;

			if (mProgressDialog != null)
				mProgressDialog.dismiss();

			if (result.isOk())
			{
				// Show warnings (if any) then continue (possibly finishing activity).
				String warningText = result.getWarningText();
				if (Services.Strings.hasValue(warningText))
				{
					AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
					builder.setMessage(warningText);
					builder.setPositiveButton(R.string.GXM_button_ok, new DialogInterface.OnClickListener()
					{
						@Override
						public void onClick(DialogInterface dialog, int which)
						{
							endSaveAction();
						}
					});

					builder.show();
				}
				else
				{
					endSaveAction();
				}
			}
			else
			{
				// Show errors.
				String errorText = result.getErrorText();
				showErrorDialog(errorText, false);

				// finish save event on fail
				ActionExecution.cancelCurrent(null);
			}
		}

		private void endSaveAction()
		{
			Services.Messages.showMessage(getActivity(), getString(DisplayModes.getSuccessMessageResource(mController.getMode())));
			ActionExecution.continueCurrent(getActivity(), false, null);
		}
	}

	@Override
	public void setReturnResult(Intent data)
	{
		// Parm rule is not used in edit. Only set result with updated entity.
		// super.setReturnResult(data);

		data.putExtra(IntentParameters.MODE, mController.getMode());
		IntentHelper.putObject(data, WorkWithAction.EXTRA_INSERTED_ENTITY, Entity.class, mController.getBCEntity());
	}

	private void showErrorDialog(String message, final boolean finishAfterwards)
	{
		if (getActivity() == null)
			return;
		
		AlertDialog.Builder builder = new AlertDialog.Builder(getActivity());
		builder.setTitle(R.string.GXM_errtitle);
		builder.setCancelable(false);
		builder.setMessage(message);
		builder.setPositiveButton(R.string.GXM_button_ok, new DialogInterface.OnClickListener()
		{
			@Override
			public void onClick(DialogInterface dialog, int id)
			{
				if (finishAfterwards)
					getActivity().finish();
			}
		});

		try {
			builder.show();
		} catch (@SuppressWarnings("checkstyle:IllegalCatch") Exception e) {
			// TODO: We should investigate why and which exception we're catching here
		}
	}
}
