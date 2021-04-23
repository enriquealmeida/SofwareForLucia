package com.artech.activities;

import android.app.Activity;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.artech.R;
import com.artech.actions.UIContext;
import com.artech.android.FileDownloader;
import com.artech.application.MyApplication;
import com.artech.application.Preferences;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.controls.LaunchScreenViewProvider;
import com.artech.controls.LaunchScreenViewProviderFactory;
import com.artech.controls.ProgressDialogFactory;

public class StartupActivity extends AppCompatActivity implements StartupContract.View {
	public static final String EXTRA_NOTIFICATION_ACTION = "NotificationAction";
	public static final String EXTRA_NOTIFICATION_PARAMS = "NotificationParams";
	private static final int SYNC_NOTIFICATION_ID = 164251;
	private StartupContract.Presenter mPresenter;
	private ProgressDialogFactory.ProgressViewProvider mProgressDialogViewProvider;
	private boolean mShouldHideProgressDialog = false;

	@Override
	protected void onCreate(@Nullable Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);

		// Possible work around for market/play store launches.
		// Essentially, the market launches the main activity on top of other activities. Same may
		// happen with apps list shortcut and desktop shortcut. We never want this to happen. So
		// instead, we check if we are the root and if not, we finish.
		// See http://code.google.com/p/android/issues/detail?id=2373 for more details.
		if (!isTaskRoot()) {
			String action = getIntent().getAction();
			if (action != null && action.equals(Intent.ACTION_MAIN)
					&& getIntent().hasCategory(Intent.CATEGORY_LAUNCHER)) {
				Services.Log.warning("Main Activity is not the root. Finishing Main Activity instead of launching.");
				finish();
				return;
			}
		}

		boolean handleDeepLink = Intent.ACTION_VIEW.equals(getIntent().getAction());
		String newServerUrl = getIntent().getStringExtra(IntentParameters.SERVER_URL);

		mPresenter = new StartupPresenter(this, MyApplication.getApp(), handleDeepLink);

		if (!Services.Application.isLoaded() || (MyApplication.getApp().getUseDynamicUrl() && newServerUrl != null)) {
			mPresenter.initApplicationLoad(getApplicationContext(), newServerUrl);
		} else {
			mPresenter.finishApplicationLoad();
		}
	}

	@Override
	protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {
		super.onActivityResult(requestCode, resultCode, data);

		if (requestCode == RequestCodes.PREFERENCE) {
			if (resultCode == Activity.RESULT_OK && data != null) {
				String newServerUrl = data.getStringExtra(IntentParameters.SERVER_URL);
				mPresenter.initApplicationLoad(getApplicationContext(), newServerUrl);
			}
		}
	}

	@Override
	public void showLoadingScreen(LaunchScreenViewProvider.OnFinishListener onFinishListener) {
		View launchScreenView = LaunchScreenViewProviderFactory.getLaunchScreenViewProvider()
				.createView(this, onFinishListener);
		setContentView(launchScreenView);
	}

	@Override
	public void showLoadError(String serverUrl, String appEntry) {
		String message = String.format(
				Services.Strings.getResource(R.string.GXM_InvalidApplication),
				serverUrl,
				appEntry
		);
		Services.Messages.showErrorDialog(this, message);
	}

	@Override
	public void showServerUrlError() {
		new AlertDialog.Builder(this)
				.setMessage(R.string.GXM_ServerUrlIncorrect)
				.setPositiveButton(R.string.GXM_button_ok, (dialog, which) -> finish())
				.show();
	}

	@Override
	public void promptUserToInstallNewVersion(String appStoreUrl) {
		new AlertDialog.Builder(this)
				.setTitle(R.string.GXM_NewVersionAvailable)
				.setMessage(R.string.GXM_NewVersionInstallQuestion)
				.setCancelable(false)
				.setPositiveButton(R.string.GXM_button_ok, (dialog, which) -> mPresenter.launchNewAppVersionInstallation(appStoreUrl))
				.setNegativeButton(R.string.GXM_cancel, (dialog, which) -> finish())
				.show();
	}

	@Override
	public void showApplicationLoadError(String errorMessage) {
		new AlertDialog.Builder(this)
				.setTitle(R.string.GXM_errtitle)
				.setMessage(errorMessage)
				.setPositiveButton(R.string.GXM_button_ok, (dialog, which) -> finish())
				.show();
	}

	@Override
	public void showDynamicAppMenu(String serverUrl, int messageRes) {
		Intent intent = Preferences.newIntent(this, true, R.string.GXM_ServerUrlIncorrect, serverUrl);
		startActivityForResult(intent, RequestCodes.PREFERENCE);
	}

	@Override
	public boolean setAppOrientation() {
		return ActivityHelper.setDefaultOrientation(this);
	}

	@Override
	public void launchEntryScreen(IViewDefinition mainView) {
		Intent intent = IntentFactory.getMainObject(mainView, this, true);

		String action = getIntent().getStringExtra(EXTRA_NOTIFICATION_ACTION);
		if (action != null) {
			intent.putExtra(EXTRA_NOTIFICATION_ACTION, action);
		}

		String params = getIntent().getStringExtra(EXTRA_NOTIFICATION_PARAMS);
		if (params != null) {
			intent.putExtra(EXTRA_NOTIFICATION_PARAMS, params);
		}

		startActivity(intent);
		ActivityLauncher.applyCallOptions(this, intent);
		overridePendingTransition(R.anim.gx_fade_in, R.anim.gx_fade_out);
	}

	@Override
	public void launchAppStoreScreen(String appStoreUrl) {
		Intent promptInstall = new Intent(Intent.ACTION_VIEW);
		promptInstall.setData(Uri.parse(appStoreUrl));

		if (promptInstall.resolveActivity(getPackageManager()) == null) {
			Services.Messages.showMessage(this, R.string.GXM_NoApplicationAvailable);
		} else {
			startActivity(promptInstall);
		}
	}

	@Override
	public void launchApkInstaller(Uri fileUri) {
		final Intent installIntent = new Intent(Intent.ACTION_VIEW);
		installIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
		installIntent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION);
		installIntent.setDataAndType(fileUri, "application/vnd.android.package-archive");

		if (installIntent.resolveActivity(getPackageManager()) == null) {
			Services.Messages.showMessage(this, R.string.GXM_NoApplicationAvailable);
		} else {
			startActivity(installIntent);
		}
	}

	@Override
	public void closeStartupScreen() {
		finish();
	}

	@Override
	public void downloadAPK(Uri apkUrl, FileDownloader.FileDownloaderListener listener) {
		FileDownloader.enqueue(this, listener, apkUrl);
	}

	@Override
	public void showUpdateError() {
		new AlertDialog.Builder(this)
			.setTitle(R.string.GXM_UpdatingApplication)
			.setMessage(R.string.GXM_ReceptionFailed)
			.setPositiveButton(R.string.GXM_button_ok, (dialog, which) -> finish())
			.show();
	}

	@Override
	public void showSyncNotification(String title, String content, int drawableId) {
		Services.Notifications.showOngoingNotification(SYNC_NOTIFICATION_ID, title, content,
			drawableId, true);
	}

	@Override
	public void hideSyncNotification() {
		Services.Notifications.closeOngoingNotification(SYNC_NOTIFICATION_ID);
	}

	@Override
	public void showSyncDialog() {
		ProgressDialogFactory progressDialogFactory = new ProgressDialogFactory();
		ThemeClassDefinition indicatorClass = Services.Themes.getThemeClass("AnimationProgressIndicator");
		if (indicatorClass != null) {
			progressDialogFactory.setThemeClass(this, indicatorClass);
		}

		mProgressDialogViewProvider = progressDialogFactory.getViewProvider();
		if (indicatorClass != null) {
			mProgressDialogViewProvider.setAnimationName(this, indicatorClass.getName());
		}

		// run in ui thread, show in 2 sec if necessary, if sync takes less than 2 sec , do not show
		Services.Device.postOnUiThreadDelayed(new Runnable()
		{
			@Override
			public void run() {
				// Dont show it already end
				if (mShouldHideProgressDialog) {
					Services.Log.debug("not show sync progress, already done");
					return;
				}
				if (StartupActivity.this.isFinishing() || StartupActivity.this.isDestroyed()){
					Services.Log.debug("not show sync progress, already finished activity");
					return; // Discard operation for activity that is being torn down.
				}

				if (mProgressDialogViewProvider != null) {
					mProgressDialogViewProvider.showProgressIndicator(
						StartupActivity.this,
						Services.Strings.getResource(R.string.GXM_ReceivingData),
						Services.Strings.getResource(R.string.GXM_PleaseWait));
				}
			}

		}, 2000);
	}

	@Override
	public void hideSyncDialog() {
		mShouldHideProgressDialog = true;
		Services.Device.runOnUiThread( new Runnable() {
			@Override
			public void run() {
				if (mProgressDialogViewProvider != null) {
					mProgressDialogViewProvider.hideProgressIndicator(StartupActivity.this);
					mProgressDialogViewProvider = null;
				}
			}
		});
	}

	@Override
	public void handleDeepLinkIntent(IViewDefinition mainView) {
		ActivityHelper.onResume(this); // Yeah it's not very clean code, but it is needed because inside the handleIntent() it calls ActivityHelper.getCurrentActivity() for Manual handling
		Services.Application.handleIntent(
				UIContext.base(this, mainView.getConnectivitySupport()),
				getIntent(),
				new Entity(new StructureDefinition("dummy"))
		); // Activity send here for Automatic handling
		ActivityHelper.onPause(this);
	}
}
