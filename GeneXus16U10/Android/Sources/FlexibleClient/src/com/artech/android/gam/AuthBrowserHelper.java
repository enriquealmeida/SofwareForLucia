package com.artech.android.gam;

import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.AsyncTask;
import androidx.annotation.NonNull;

import com.artech.activities.ActivityLauncher;
import com.artech.activities.IntentFactory;
import com.artech.application.MyApplication;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.utils.ResultDetail;
import com.artech.base.utils.Strings;
import com.artech.common.SecurityHelper;

/**
 * Helper class for supplying authorization credentials by means of a Web Browser.
 * Used for external logins such as Google, Facebook, or Twitter.
 */
public class AuthBrowserHelper
{
	public static final int ACTION_CODE = 1337; // used for special case, handle login external result for 4.x devices
	public static final String EXTRA_EXTERNAL_LOGIN_RESULT = "com.artech.android.gam.AuthBrowserHelper.EXTERNAL_LOGIN_RESULT";
	public static final String EXTRA_IS_EXTERNAL_LOGIN = "com.artech.android.gam.AuthBrowserHelper.IS_EXTERNAL_LOGIN";

	public static void requestAuthorization(@NonNull Activity context, @NonNull Uri uri)
	{
		Intent browserIntent = ActivityLauncher.newCustomTabsIntent(context, uri);
		if (supportsCustomTabs() && context.getPackageManager().resolveActivity(browserIntent, PackageManager.MATCH_DEFAULT_ONLY) != null)
		{
			// Login with Chrome Custom Tab
			context.startActivityForResult(AuthManagementActivity.createStartIntent(context, browserIntent), RequestCodes.ACTION_ALWAYS_SUCCESSFUL);
		}
		else
		{
			// As fallback, login with a WebView. This won't work for Google (as of Apr 2017)
			// but might be necessary for restricted profiles or other devices without a browser.
			Intent intent = IntentFactory.getIntentForWebApplication(context, uri.toString());
			intent.putExtra(EXTRA_IS_EXTERNAL_LOGIN, true);
			context.startActivityForResult(intent, RequestCodes.ACTION_ALWAYS_SUCCESSFUL);
		}
	}

	public static void finishExternalLogin(final Activity tempActivity, final Uri uri)
	{
		AsyncTask<Void, Void, ResultDetail<?>> afterLoginTask = new AsyncTask<Void, Void, ResultDetail<?>>()
		{
			@Override
			protected ResultDetail<?> doInBackground(Void... params)
			{
				// Do this in background, since it involves an additional network call.
				return SecurityHelper.afterExternalLogin(uri.toString());
			}

			@Override
			protected void onPostExecute(ResultDetail<?> result)
			{
				// Return the login result to the caller.
				Intent resultIntent = new Intent();
				resultIntent.putExtra(EXTRA_EXTERNAL_LOGIN_RESULT, result);
				AuthManagementActivity.resultIntent = resultIntent;
				AuthManagementActivity.resultCode = Activity.RESULT_OK;
				tempActivity.setResult(Activity.RESULT_OK, resultIntent);
				tempActivity.finish();
			}
		};

		afterLoginTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
	}

	public static String getSupportedRedirectUrlScheme()
	{
		if (supportsCustomTabs() && Strings.hasValue(MyApplication.getApp().getClientId()))
		{
			// This must match the scheme of the intent-filter added to the AuthRedirectActivity.
			return "gxgam" + MyApplication.getApp().getClientId();
		}
		else
			return null;
	}

	private static boolean supportsCustomTabs()
	{
		final Context context = MyApplication.getAppContext();
		final Uri SAMPLE_URI = Uri.parse("https://www.genexus.com/");
		Intent intent = ActivityLauncher.newCustomTabsIntent(context, SAMPLE_URI);

		List<ResolveInfo> apps = context.getPackageManager().queryIntentActivities(intent, 0);
		return (apps.size() != 0);
	}
}
