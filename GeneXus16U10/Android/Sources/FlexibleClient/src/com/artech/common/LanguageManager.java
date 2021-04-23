package com.artech.common;

import android.content.Context;
import androidx.annotation.NonNull;

import com.artech.android.LocaleHelper;
import com.artech.base.metadata.images.ImageCatalog;
import com.artech.base.metadata.languages.Language;
import com.artech.base.metadata.languages.LanguageCatalog;
import com.artech.base.services.IApplication;
import com.artech.base.services.ILanguage;
import com.artech.base.services.Services;
import com.artech.providers.EntityDataProvider;

import java.util.List;
import java.util.Locale;

class LanguageManager implements ILanguage {
	private static final String APP_CURRENT_LANGUAGE = "ApplicationCurrentLanguage";
	private static final String APP_CURRENT_LOCALE_LANGUAGE = "ApplicationCurrentLocaleLanguage";
	private static final String APP_CURRENT_LOCALE_COUNTRY = "ApplicationCurrentLocaleCountry";

	private final IApplication mApplication;
	private List<Locale> mSystemLocales;
	private Locale mCurrentLocale;

	public LanguageManager(@NonNull IApplication application) {
		mApplication = application;
		mCurrentLocale = null;
	}

	@Override
	public void initialize(LanguageCatalog languages, ImageCatalog images) {
		mApplication.getDefinition().setImageCatalog(images);
		mApplication.getDefinition().setLanguageCatalog(languages);
	}

	@Override
	public String getCurrentLanguage() {
		Language currentLanguage = mApplication.getDefinition().getLanguageCatalog().getCurrentLanguage();
		return (currentLanguage != null) ? currentLanguage.getName() : null;
	}

	@Override
	public String getCurrentLanguageProperty(String property) {
		Language currentLanguage = mApplication.getDefinition().getLanguageCatalog().getCurrentLanguage();
		return (currentLanguage != null) ? currentLanguage.getProperties().get(property) : null;
	}

	@Override
	public String getTranslation(String message) {
		return mApplication.getDefinition().getLanguageCatalog().getTranslation(message);
	}

	@Override
	public String getTranslation(String message, String language) {
		return mApplication.getDefinition().getLanguageCatalog().getTranslation(message, language);
	}

	@Override
	public String getExpressionTranslation(String expression) {
		return mApplication.getDefinition().getLanguageCatalog().getExpressionTranslation(expression);
	}

	@Override
	public void setLanguageAndLocale(@NonNull Context context, String languageName, Locale locale,
									 boolean persistValues) {
		mCurrentLocale = locale;

		if (persistValues) {
			// store locale in app setting to restore at startup.
			Services.Preferences.setString(APP_CURRENT_LANGUAGE, languageName);
			Services.Preferences.setString(APP_CURRENT_LOCALE_LANGUAGE, locale.getLanguage());
			Services.Preferences.setString(APP_CURRENT_LOCALE_COUNTRY, locale.getCountry());
		}

		// Change locate of current app, actually change language on getCurrentLanguage recalculate
		LocaleHelper.updateLocale(context, mCurrentLocale, mSystemLocales);
		// Clear stored data since it may have translations
		clearCacheOnLanguageChange();
	}

	@Override
	public void setLocaleToSystemDefault(@NonNull Context context) {
		if (mSystemLocales.size() >= 1) {
			mCurrentLocale = mSystemLocales.get(0);

			//change locate of current app, actually change language when recalculate it in getCurrentLanguage
			LocaleHelper.updateLocale(context, mCurrentLocale, mSystemLocales);
			// Clear stored data since it may have translations
			clearCacheOnLanguageChange();
		}

		// Forget about selected locale, so that the default will be used later.
		Services.Preferences.setString(APP_CURRENT_LANGUAGE, "");
		Services.Preferences.setString(APP_CURRENT_LOCALE_LANGUAGE, "");
		Services.Preferences.setString(APP_CURRENT_LOCALE_COUNTRY, "");
	}

	@Override
	public void clearCacheOnLanguageChange() {
		final String APP_LANGUAGE = "ApplicationLanguage";

		String previousLanguage = Services.Preferences.getString(APP_LANGUAGE);
		String currentLanguage = getCurrentLanguage();

		if (previousLanguage == null || !previousLanguage.equalsIgnoreCase(currentLanguage)) {
			EntityDataProvider.clearAllCaches();
		}

		Services.Preferences.setString(APP_LANGUAGE, currentLanguage);
	}

	@Override
	public void onApplicationCreate(@NonNull Context context) {
		// Store the default (Android) locale, to be able to restore it later.
		mSystemLocales = Services.Device.getLocales();
		Services.Log.debug("onApplicationCreate :" + mSystemLocales.toString());

		// getLocate from setting if exits.
		String currentLanguageString = Services.Preferences.getString(APP_CURRENT_LANGUAGE);

		if (Services.Strings.hasValue(currentLanguageString)) {
			Services.Log.debug("Restore last language used :" + currentLanguageString);

			String currentLocaleLanguageString = Services.Preferences.getString(APP_CURRENT_LOCALE_LANGUAGE);
			String currentLocaleCountryString = Services.Preferences.getString(APP_CURRENT_LOCALE_COUNTRY);
			Locale locale = new Locale(currentLocaleLanguageString, currentLocaleCountryString);

			// Actually change locale
			setLanguageAndLocale(context, currentLanguageString, locale, false);
		} else {
			if (mCurrentLocale != null) {
				LocaleHelper.updateLocale(context, mCurrentLocale, mSystemLocales);
			}
		}
	}

	@Override
	public void onBeforeCreate(@NonNull Context context) {
		if (mCurrentLocale != null) {
			LocaleHelper.updateLocale(context, mCurrentLocale, mSystemLocales);
		}
	}
}
