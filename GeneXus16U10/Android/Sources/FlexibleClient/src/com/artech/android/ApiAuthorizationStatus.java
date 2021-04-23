package com.artech.android;

import android.content.Context;
import androidx.annotation.NonNull;

/**
 * Mapping to GX ApiAuthorizationStatus from its Android counterpart.
 */
public class ApiAuthorizationStatus
{
	public static final int DENIED = 2;
	public static final int AUTHORIZED = 3;

	public static int getStatus(@NonNull Context context, @NonNull String[] permissions)
	{
		boolean result = PermissionUtil.checkSelfPermissions(context, permissions);
		return (result ? AUTHORIZED : DENIED);
	}
}
