package com.artech.common;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.Map;

import org.json.JSONObject;

import android.net.Uri;
import androidx.annotation.NonNull;
import android.util.Pair;

import com.artech.actions.UIContext;
import com.artech.activities.ActivityLauncher;
import com.artech.android.gam.GAMHelper;
import com.artech.application.MyApplication;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.ClientStorage;
import com.artech.base.services.ServiceResponse;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultDetail;
import com.artech.base.utils.Strings;
import com.artech.providers.EntityDataProvider;

public class SecurityHelper
{
	private static final String FIELD_USER_ID = "user_guid";
	private static final String FIELD_TOKENS = "tokens";
	private static final String FIELD_ACCESS_TOKEN = "access_token";
	private static final String FIELD_REFRESH_TOKEN = "refresh_token";
	private static final String FLAG_IS_ANONYMOUS = "is_anonymous_user";
	private static final String FLAG_DISABLE_ANONYMOUS = "disable_anonymous_login";

	public static final String TYPE_STANDARD = "password";
	private static final String TYPE_RENEW = "refresh_token";
	private static final String TYPE_ANONYMOUS = "device";

	private static final String TOKENS_SEPARATOR = ";";

	private static ClientStorage sStorage;
	private static GAMHelper sGAMHelper;

	/**
	 * If the caller needs the user to be logged in, and we have no current login, show the login screen.
	 * @param from Caller activity.
	 * @param definition View definition (normally a panel or dashboard).
	 * @return True if the user was sent to the login screen; otherwise false.
	 */
	public static boolean callLoginIfNecessary(UIContext from, IViewDefinition definition)
	{
		boolean needsLogin = MyApplication.getApp().isSecure();
		if (definition != null)
			needsLogin = definition.isSecure();

		if (needsLogin && !Strings.hasValue(HttpHeaders.getToken())) {
			// We don't have a token, but we may be able to reuse the previous one, try that first.
			if (restoreLoginInformation())
				return false; // Token recovered, login not necessary.

			// If the server supports anonymous logins, the connection-failed catcher will perform it, so return false here.
			if (MyApplication.getApp().getEnableAnonymousUser())
				return false;

			goToLogin(from);
			return true;
		} else {
			return false; // Token already set or no security needed.
		}
	}

	private static void goToLogin(UIContext from) {
		if (isBiometricsUsed() && BiometricsHelper.isFingerprintAvailable(from)) {
			BiometricsHelper.startBiometricsActivity(from);
		} else {
			ActivityLauncher.callLogin(from); // Don't use biometrics, it is not enabled, it was never used, or it was opted out
		}
	}

	public static boolean restoreLoginInformation()
	{
		boolean needsLogin = MyApplication.getApp().isSecure();
		if (needsLogin && !Strings.hasValue(HttpHeaders.getToken()))
		{
			// We don't have a token, but we may be able to reuse the previous one, try that first.
			String accessToken = getStorage().getString(FIELD_ACCESS_TOKEN, "");
			if (Strings.hasValue(accessToken))
			{
				HttpHeaders.setToken(accessToken);
				getGAMHelper().restoreUserData();
				return true; // Token recovered!
			}
		}

		return false;
	}

	public enum Handled
	{
		/** There was no error, or there was but we didn't do anything special about it. */
		NOT_HANDLED,
		/** Called another activity, such as login or the not authorized panel. */
		CALLED_ACTIVITY,
		/** Finished the caller activity. */
		FINISHED_ACTIVITY
	}

	@SuppressWarnings("checkstyle:MemberName")
	public static class Token
	{
		private boolean PreviousAuthorizationError;
	}

	/**
	 * Handles status codes for security errors (not authenticated/not authorized) after a server call.
	 * <ul>
	 *   <li>For <b>"NOT AUTHENTICATED"</b>, shows the login screen.</li>
	 *   <li>For <b>"NOT AUTHORIZED"</b>, shows the "Not authorized object" if set, otherwise it does nothing.</li>
 	 * </ul>
	 * @param from Caller activity.
	 * @param statusCode Status code returned by the server.
	 * @param statusMessage Message returned by the server.
	 * @param token Object to accumulate information on repeated calls to this method for the same data source.
	 * @return True if the user was sent to another screen; otherwise false.
	 */
	public static Handled handleSecurityError(UIContext from, int statusCode, String statusMessage, Token token)
	{
		if (token == null)
			token = new Token(); // If the caller did not supply a token it's not interested in "previous authorization error".

		if (statusCode == DataRequest.ERROR_SECURITY_AUTHENTICATION)
		{
			goToLogin(from);
			return Handled.CALLED_ACTIVITY;
		}
		else if (statusCode == DataRequest.ERROR_SECURITY_AUTHORIZATION)
		{
			// Call the not authorized panel, if defined.
			String notAuthorizedPanel = MyApplication.getApp().getNotAuthorizedObject();
			if (Strings.hasValue(notAuthorizedPanel))
			{
				// show status message in the log info
				if (Strings.hasValue(statusMessage))
					Services.Log.info(statusMessage);

				// If this is a repeat error, finish the activity instead. That way we prevent a
				// "not authorized -> back -> not authorized -> back" looping.
				if (!token.PreviousAuthorizationError)
				{
					if (ActivityLauncher.call(from, notAuthorizedPanel))
					{
						token.PreviousAuthorizationError = true;
						return Handled.CALLED_ACTIVITY;
					}
				}
				else
				{
					from.getActivity().finish();
					return Handled.FINISHED_ACTIVITY;
				}
			}
		}

		return Handled.NOT_HANDLED;
	}

	private static ThreadLocal<Boolean> sInsideAutomaticLogin = new ThreadLocal<>();

	/**
	 * Should be called (on a background thread) whenever a connection to the server fails due
	 * to an AUTHENTICATION error. If the access token is expired and we have a refresh token then
	 * it will try a refresh. If refresh is not possible (or fails) but we have anonymous logins
	 * enabled, try anonymous login. If both fail, returns false.
	 *
	 * @return True if automatic login was successful, otherwise false.
	 */
	public static boolean tryAutomaticLogin()
	{
		// In case of a server bug, an authentication attempt may return 401.
		// This would cause an infinite recursion (and a stack overflow) if we continually retry.
		Boolean isRecursive = sInsideAutomaticLogin.get();
		if (isRecursive != null && isRecursive)
			return false;

		sInsideAutomaticLogin.set(true);
		try
		{
			if (tryRenewLogin())
				return true;

			// Anonymous login is disabled if last login was a 'full' one.
			if (!getStorage().getBoolean(FLAG_DISABLE_ANONYMOUS, false))
			{
				if (tryAnonymousLogin())
					return true;
			}

			return false;
		}
		finally
		{
			sInsideAutomaticLogin.set(false);
		}
	}

	/**
	 * Tries to renew the current access token using the previously acquired refresh token.
	 * @return True if renewal was successful, otherwise false.
	 */
	private static boolean tryRenewLogin()
	{
		// Get the refresh token from the previous login.
		String refreshToken = getStorage().getString(FIELD_REFRESH_TOKEN, "");
		if (!Strings.hasValue(refreshToken))
			return false;

		// Forget the renew token, so we won't attempt again until we get a new one.
		getStorage().remove(FIELD_REFRESH_TOKEN);

		// Try to renew the access token
		Map<String, String> oauthParameters = getOauthParameters(TYPE_RENEW, null, null, refreshToken, null);
		return doAutomaticLogin(oauthParameters, isAnonymousUser());
	}

	/**
	 * Tries to log in anonymously if the server has that feature enabled.
	 * @return True if anonymous login was successful, otherwise false.
	 */
	private static boolean tryAnonymousLogin()
	{
		if (!MyApplication.getApp().getEnableAnonymousUser())
			return false;

		// Try to get anonymous session.
		Map<String, String> oauthParameters = getOauthParameters(TYPE_ANONYMOUS, null, null, null, null);
		return doAutomaticLogin(oauthParameters, true);
	}

	private static boolean doAutomaticLogin(Map<String, String> oauthParameters, boolean isAnonymous)
	{
		String oauthUri = MyApplication.getApp().UriMaker.getLoginUrl();
		ServiceResponse loginResponse = ServiceHelper.callAccessManager(oauthUri, oauthParameters, null);

		// See if the response was successful and "simulate" completed login if so.
		ResultDetail<?> result = afterLogin(loginResponse, true, isAnonymous);

		return result.getResult();
	}

	@NonNull
	public static Map<String, String> getOauthParameters(String type, String user, String password, String refreshToken, Entity additionalParameters)
	{
		Map<String, String> parameters = new LinkedHashMap<>();
		parameters.put("client_id", MyApplication.getApp().getClientId());
		parameters.put("grant_type", type);

		if (Strings.hasValue(refreshToken))
			parameters.put("refresh_token", refreshToken);

		if (Strings.hasValue(user))
		{
			parameters.put("username", user);
			parameters.put("password", password);
		}

		// Additional parameters go as JSON.
		if (additionalParameters != null)
			parameters.put("additional_parameters", additionalParameters.serialize(Entity.JSONFORMAT_INTERNAL).toString());

		parameters.put("scope", "FullControl");
		return parameters;
	}

	public enum LoginStatus
	{
		/** Successful login */
		SUCCESS,

		/** Login failed. */
		FAILURE,

		/** The user/password was correct, but the login failed because the password must be changed. */
		CHANGE_PASSWORD,
	}

	public interface IEncryptString {
		String encrypt(String v);
	}

	public interface IDecryptString {
		String decrypt(String v);
	}

	public static ResultDetail<LoginStatus> afterLoginBiometrics(UIContext context, IEncryptString f, ServiceResponse response) {
		if (response.getResponseOk()) {
			String userId = response.get(FIELD_USER_ID);
			String accessToken = response.get(FIELD_ACCESS_TOKEN);
			String refreshToken = response.get(FIELD_REFRESH_TOKEN);

			String secureTokens = f.encrypt(userId + TOKENS_SEPARATOR + accessToken + TOKENS_SEPARATOR + refreshToken);

			if (secureTokens != null) {
				BiometricsHelper.registerLifecycleObserver(context);
				afterLoginCommonTokens(userId, accessToken, secureTokens);
				return ResultDetail.ok(LoginStatus.SUCCESS);
			}
			else {
				Services.Log.error("Failed to encrypt in afterLoginBiometrics");
				return ResultDetail.error("", LoginStatus.FAILURE);
			}
		}
		return afterLoginFail(response);
	}

	public static Pair<Boolean, String> afterLoginBiometrics(UIContext context, IDecryptString f) {
		String tokens = getStorage().getString(FIELD_TOKENS, "");
		String decryptedTokens = f.decrypt(tokens);
		if (!Strings.hasValue(decryptedTokens))
			return new Pair(false, null);

		BiometricsHelper.registerLifecycleObserver(context);

		String[] parts = decryptedTokens.split(TOKENS_SEPARATOR, -1);
		String userId = parts[0];
		String accessToken = parts[1];
		String refreshToken = parts[2];
		return new Pair(afterLoginCommon(userId, accessToken, false, false), refreshToken);
	}

	public static boolean isBiometricsUsed() {
		if (BiometricsHelper.isBiometricsEnabled()) {
			// to have FIELD_TOKENS biometrics has been accepted before
			String tokens = getStorage().getString(FIELD_TOKENS, "");
			return Strings.hasValue(tokens);
		}
		return false;
	}

	public static ServiceResponse tryRenewLogin(String refreshToken) {
		// Try to renew the access token
		Map<String, String> oauthParameters = getOauthParameters(TYPE_RENEW, null, null, refreshToken, null);
		String oauthUri = MyApplication.getApp().UriMaker.getLoginUrl();
		return ServiceHelper.callAccessManager(oauthUri, oauthParameters, null);
	}

	public static ResultDetail<LoginStatus> afterLogin(ServiceResponse response)
	{
		return afterLogin(response, false, false);
	}

	private static ResultDetail<LoginStatus> afterLogin(ServiceResponse response, boolean isAutomatic, boolean isAnonymous) {
		if (response.getResponseOk()) {
			String userId = response.get(FIELD_USER_ID);
			String accessToken = response.get(FIELD_ACCESS_TOKEN);
			String refreshToken = response.get(FIELD_REFRESH_TOKEN);

			afterLoginCommonNormal(userId, accessToken, refreshToken, isAutomatic, isAnonymous);
			return ResultDetail.ok(LoginStatus.SUCCESS);
		}
		return afterLoginFail(response);
	}

	public static ResultDetail<LoginStatus> afterLoginFail(ServiceResponse response) {
		// An error occurred. Build the message.
		ArrayList<String> messages = new ArrayList<>();
		if (Strings.hasValue(response.get("error_description")))
			messages.add(response.get("error_description"));
		if (Strings.hasValue(response.ErrorMessage))
			messages.add(response.ErrorMessage);

		String message = Services.Strings.join(messages, Strings.NEWLINE);

		// Check for special error codes.
		if (response.StatusCode == DataRequest.ERROR_SECURITY_CHANGE_PASSWORD)
			return ResultDetail.error(message, LoginStatus.CHANGE_PASSWORD);

		return ResultDetail.error(message, LoginStatus.FAILURE);
	}

	public static ResultDetail<?> afterExternalLogin(String resultUri)
	{
		Uri uri = Uri.parse(resultUri);
		if (uri == null)
			return ResultDetail.FALSE;

		// Read fields from login-redirected URI.
		String userId = uri.getQueryParameter(FIELD_USER_ID);
		String accessToken = uri.getQueryParameter(FIELD_ACCESS_TOKEN);
		String refreshToken = uri.getQueryParameter(FIELD_REFRESH_TOKEN);

		if (Strings.hasValue(accessToken))
		{
			// Sucessful login.
			afterLoginCommonNormal(userId, accessToken, refreshToken, false, false);
			return ResultDetail.TRUE;
		}
		else
		{
			// Read and return error detail from URI.
			String errorMessage = uri.getQueryParameter("error_message");
			return ResultDetail.error(errorMessage);
		}
	}

	private static void afterLoginCommonTokens(String userId, String accessToken, String secureTokens) {
		getStorage().putStringSecure(FIELD_TOKENS, secureTokens);
		getStorage().remove(FIELD_ACCESS_TOKEN);
		getStorage().remove(FIELD_REFRESH_TOKEN);
		afterLoginCommon(userId, accessToken, false, false);
	}

	private static void afterLoginCommonNormal(String userId, String accessToken, String refreshToken, boolean isAutomatic, boolean isAnonymous) {
		getStorage().putStringSecure(FIELD_ACCESS_TOKEN, accessToken);
		getStorage().putStringSecure(FIELD_REFRESH_TOKEN, refreshToken);
		getStorage().remove(FIELD_TOKENS);
		afterLoginCommon(userId, accessToken, isAutomatic, isAnonymous);
	}

	private static boolean afterLoginCommon(String userId, String accessToken, boolean isAutomatic, boolean isAnonymous)
	{
		// Set the token for requests.
		HttpHeaders.setToken(accessToken);

		if (!isAutomatic)
		{
			// If user id is different from previous one (or NOT received from the server) then clear caches.
			// That way we are assured that the cache is ALWAYS cleared if there is a chance that the
			// new user is not the same as the previous one.
			String previousUserId = getStorage().getString(FIELD_USER_ID, "");
			if (!Strings.hasValue(userId) || !userId.equalsIgnoreCase(previousUserId))
				EntityDataProvider.clearAllCaches();
		}

		// Remember user id, access token, and refresh token.
		getStorage().putStringSecure(FIELD_USER_ID, userId);
		getStorage().putBoolean(FLAG_IS_ANONYMOUS, isAnonymous);

		// In case of a "real" login, disable anonymous login on token expiration.
		getStorage().putBoolean(FLAG_DISABLE_ANONYMOUS, !isAnonymous);

		// Obtain user information from server and store it in the device.
		// This currently (sept 2013) fails for the anonymous user. So make up userInfo in that case.
		JSONObject jsonUserInfo = Services.HttpService.getJSONFromUrl(
				MyApplication.getApp().UriMaker.getUserInformationUrl());
		if (jsonUserInfo != null) {
			getGAMHelper().afterLogin(jsonUserInfo);
			return true;
		} else {
			getGAMHelper().afterLogin(userId, isAnonymous);
			return false;
		}
	}

	public static boolean isLoggedIn()
	{
		return Strings.hasValue(HttpHeaders.getToken());
	}

	public static boolean isAnonymousUser()
	{
		return (MyApplication.getApp().getEnableAnonymousUser() &&
				getStorage().getBoolean(FLAG_IS_ANONYMOUS, false));
	}

	public static void logout()
	{
		// Call server to clear session (ignoring any errors).
		// This must go first because the server needs the token to identify the client logging out.
		ServiceHelper.callAccessManager(MyApplication.getApp().UriMaker.getLogoutUrl(), null, null);

		// remove local data in device
		logoutLocal();

	}

	public static void logoutLocal()
	{
		// Clear current access token.
		HttpHeaders.setToken(Strings.EMPTY);

		// Clear remembered properties.
		getStorage().remove(FIELD_TOKENS);
		getStorage().remove(FIELD_ACCESS_TOKEN);
		getStorage().remove(FIELD_REFRESH_TOKEN);
		getStorage().remove(FIELD_USER_ID);
		getStorage().remove(FLAG_IS_ANONYMOUS);
		getStorage().remove(FLAG_DISABLE_ANONYMOUS);

		// Clear user information.
		getGAMHelper().afterLogout();

		// Also clear cache.
		EntityDataProvider.clearAllCaches();
	}

	@NonNull
	private static synchronized ClientStorage getStorage()
	{
		final String STORAGE_KEY = "connection_info";

		if (sStorage == null)
			sStorage = Services.Application.getClientStorage(STORAGE_KEY);

		return sStorage;
	}

	@NonNull
	private static synchronized GAMHelper getGAMHelper()
	{
		if (sGAMHelper == null)
			sGAMHelper = new GAMHelper(getStorage());

		return sGAMHelper;
	}
}
