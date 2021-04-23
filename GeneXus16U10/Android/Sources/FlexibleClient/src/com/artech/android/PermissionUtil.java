package com.artech.android;

import android.app.Activity;
import android.content.Context;
import android.content.pm.PackageManager;
import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

/**
 * Helper class for the Android 6.0 permissions framework (this code is not GX-specific).
 */
public class PermissionUtil
{
	/**
	 * Determines whether the app already posseses ALL members of a set of permissions.
	 *
	 * @see Context#checkSelfPermission(String)
	 */
	public static boolean checkSelfPermissions(@NonNull Context context, @NonNull String[] permissions)
	{
		for (String permission : permissions)
		{
			if (ContextCompat.checkSelfPermission(context, permission) != PackageManager.PERMISSION_GRANTED)
				return false;
		}

		return true;
	}

	/**
	 * Determines whether the show app should display an UI for rationale for ANY member of
	 * a set of permissions.
	 *
	 * @see Activity#shouldShowRequestPermissionRationale(String)
	 */
	public static boolean shouldShowRequestPermissionRationale(Activity activity, String[] permissions)
	{
		for (String permission : permissions)
		{
			if (ActivityCompat.shouldShowRequestPermissionRationale(activity, permission))
				return true;
		}

		return false;
	}

	/**
	 * Checks that ALL given permissions have been granted by verifying that each entry in the
	 * given array is of the value {@link PackageManager#PERMISSION_GRANTED}.
	 *
	 * @see Activity#onRequestPermissionsResult(int, String[], int[])
	 */
	public static boolean verifyPermissionsResult(int[] grantResults)
	{
		for (int result : grantResults)
		{
			if (result != PackageManager.PERMISSION_GRANTED)
				return false;
		}

		return true;
	}
}
