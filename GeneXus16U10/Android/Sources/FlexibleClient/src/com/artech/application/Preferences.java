package com.artech.application;

import android.app.ActionBar;
import android.app.Dialog;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;

import com.artech.R;
import com.artech.activities.ActivityHelper;
import com.artech.activities.ActivityLauncher;
import com.artech.activities.IntentParameters;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.ApplicationHelper;

public class Preferences extends AppCompatActivity {
	private static final String EXTRA_SHOW_TOAST = "showToast";
	private static final String EXTRA_MESSAGE_TOAST = "messageToast";
	private Dialog mServerUrlDialog;
	private EditText mEditText;

	private String mServerURL;
	private boolean mViewDialog = false;

	private static final String PREFERENCES_KEY = "DynamicUrlPreference";
	private static final int SCAN = 0;

	public static Intent newIntent(Context context, boolean showToast, int message, String serverURL) {
		Intent intent = new Intent(context, Preferences.class);
		intent.putExtra(EXTRA_SHOW_TOAST, showToast);
		intent.putExtra(EXTRA_MESSAGE_TOAST, message);
		intent.putExtra(IntentParameters.SERVER_URL, serverURL);
		return intent;
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		setContentView(R.layout.preferences);

		// set support toolbar
		ActivityHelper.setSupportActionBarAndShadow(this);
		ActionBar actionBar = getActionBar();
		if (actionBar != null) {
			actionBar.setDisplayHomeAsUpEnabled(true);
			actionBar.setDisplayShowHomeEnabled(true);
		}

		Intent intent = getIntent();
		boolean showToast = intent.getBooleanExtra(EXTRA_SHOW_TOAST, false);
		int messageToast = intent.getIntExtra(EXTRA_MESSAGE_TOAST, R.string.GXM_ServerUrlIncorrect);
		mServerURL = intent.getStringExtra(IntentParameters.SERVER_URL);

		if (showToast)
			Toast.makeText(this, messageToast, Toast.LENGTH_SHORT).show();

		findViewById(R.id.layoutServerUrl).setOnClickListener(v -> createDialog());
	}

	private void createDialog() {
		// Create the dialog
		mServerUrlDialog = new Dialog(Preferences.this);
		mServerUrlDialog.setContentView(R.layout.dynamic_url_dialog);
		mServerUrlDialog.setTitle(R.string.GXM_ServerUrl);

		mEditText = mServerUrlDialog.findViewById(R.id.EditTextServerUrl);
		if ((mServerURL != null) && (mServerURL.length() > 0))
			mEditText.setText(mServerURL);

		mViewDialog = true;

		//Ok button
		Button okButton = mServerUrlDialog.findViewById(R.id.OkDialog);
		okButton.setOnClickListener(v -> {
			mServerURL = mEditText.getText().toString();
			if (!mServerURL.contains("://")) {
				mServerURL = "http://" + mServerURL;
			}
			mViewDialog = false;
			Thread thread = new Thread(null, new ValidateAppServerUri(mServerURL, mValidateAppServerUriListener), "Background");
			thread.start();
		});

		//Cancel button
		Button cancelButton = mServerUrlDialog.findViewById(R.id.CancelDialog);
		cancelButton.setOnClickListener(v -> {
			mServerUrlDialog.dismiss();
			mViewDialog = false;
		});

		//Scan button
		Button scanButton = mServerUrlDialog.findViewById(R.id.ScanDialog);
		scanButton.setOnClickListener(v -> {
			try {
				Intent intent = new Intent("com.google.zxing.client.android.SCAN");
				ActivityLauncher.setIntentFlagsNewDocument(intent);
				intent.putExtra("SCAN_MODE", "QR_CODE_MODE");
				startActivityForResult(intent, SCAN);
			} catch (ActivityNotFoundException ex) {
			}
		});

		mServerUrlDialog.show();
	}

	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent intent) {
		if (requestCode == SCAN) {
			if (resultCode == RESULT_OK) {
				String contents = intent.getStringExtra("SCAN_RESULT");
				String newContents = contents;


					newContents = Strings.EMPTY;
					String[] strURL = contents.split("/", -1);
					for (int i = 0; i < strURL.length - 1; i++) {
						newContents = newContents.concat(strURL[i]);
						newContents = newContents.concat("/");
					}


				mEditText.setText(newContents);
				mServerURL = mEditText.getText().toString();

				// Handle successful scan
			} else if (resultCode == RESULT_CANCELED) {
				// Handle cancel
			}
		}
	}

	private void finishPreferences(int result) {
		if (result == RESULT_OK) {
			// Persist new API Uri in the application's preferences.
			SharedPreferences preferences = Services.Preferences.getAppSharedPreferences(PREFERENCES_KEY);
			Editor editor = preferences.edit();
			editor.putString("dynamicUrl", mServerURL);
			editor.commit();
		}

		Intent resultIntent = new Intent();
		resultIntent.putExtra(IntentParameters.SERVER_URL, mServerURL);
		setResult(result, resultIntent);
		finish();
	}

	@Override
	public void onRestoreInstanceState(@NonNull Bundle savedInstanceState) {
		super.onRestoreInstanceState(savedInstanceState);
		if (savedInstanceState.getBoolean("ShowDialog")) {
			mServerURL = savedInstanceState.getString("ServerURL");
			createDialog();
		}
	}

	@Override
	public void onSaveInstanceState(@NonNull Bundle savedInstanceState) {
		savedInstanceState.putBoolean("ShowDialog", mViewDialog);
		if (mEditText != null && mEditText.getText() != null) {
			savedInstanceState.putString("ServerURL", mEditText.getText().toString());
		}
		super.onSaveInstanceState(savedInstanceState);
	}

	@Override
	protected void onDestroy() {
		if (mServerUrlDialog != null)
			mServerUrlDialog.dismiss();

		mEditText = null;
		super.onDestroy();
	}

	private static class ValidateAppServerUri implements Runnable {
		private static final int VALID_URL = 0;
		private static final int INVALID_URL = 1;
		private static final int NO_CONNECTION = 2;
		private final String mServerUrl;
		private final ValidateAppServerUriListener mListener;

		public ValidateAppServerUri(String serverUrl, ValidateAppServerUriListener listener) {
			mServerUrl = serverUrl;
			mListener = listener;
		}

		@Override
		public void run() {
			if (!Services.HttpService.isOnline()) {
				mListener.onCheckApplicationUriResult(NO_CONNECTION);
				return;
			}
			boolean result = ApplicationHelper.checkApplicationUri(MyApplication.getApp(), mServerUrl);
			if (result) {
				mListener.onCheckApplicationUriResult(VALID_URL);
			} else {
				mListener.onCheckApplicationUriResult(INVALID_URL);
			}
		}
	}

	interface ValidateAppServerUriListener {
		void onCheckApplicationUriResult(int result);
	}

	private final ValidateAppServerUriListener mValidateAppServerUriListener = result -> Services.Device.runOnUiThread(() -> {
		switch (result) {
			case ValidateAppServerUri.VALID_URL:
				finishPreferences(RESULT_OK);
				break;
			case ValidateAppServerUri.INVALID_URL:
				Toast.makeText(getApplicationContext(), R.string.GXM_ServerUrlIncorrect, Toast.LENGTH_SHORT).show();
				break;
			case ValidateAppServerUri.NO_CONNECTION:
				Toast.makeText(getApplicationContext(), R.string.GXM_NoInternetConnection, Toast.LENGTH_SHORT).show();
				break;
	}});
}
