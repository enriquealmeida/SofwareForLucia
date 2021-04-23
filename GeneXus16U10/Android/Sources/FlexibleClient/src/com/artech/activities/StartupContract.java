package com.artech.activities;

import android.content.Context;
import android.net.Uri;

import com.artech.android.FileDownloader;
import com.artech.base.metadata.IViewDefinition;
import com.artech.controls.LaunchScreenViewProvider;

public interface StartupContract {
	interface View {
		void showLoadingScreen(LaunchScreenViewProvider.OnFinishListener onFinishListener);
		void showLoadError(String serverUrl, String appEntry);
		void showServerUrlError();
		void showApplicationLoadError(String errorMessage);
		void promptUserToInstallNewVersion(String appStoreUrl);
		void showDynamicAppMenu(String serverUrl, int messageRes);
		boolean setAppOrientation();
		void launchEntryScreen(IViewDefinition mainView);
		void launchAppStoreScreen(String appStoreUrl);
		void launchApkInstaller(Uri fileUri);
		void closeStartupScreen();
		void downloadAPK(Uri apkUrl, FileDownloader.FileDownloaderListener listener);
		void showUpdateError();
		void showSyncNotification(String title, String content, int drawableId);
		void hideSyncNotification();
		void showSyncDialog();
		void hideSyncDialog();
		void handleDeepLinkIntent(IViewDefinition mainView);
	}

	interface Presenter {
		void initApplicationLoad(Context context, String newServerUrl);
		void finishApplicationLoad();
		void launchNewAppVersionInstallation(String appStoreUrl);
	}
}
