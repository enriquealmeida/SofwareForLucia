package com.artech.base.services;

import android.content.Context;
import androidx.annotation.NonNull;

import com.artech.base.metadata.images.ImageCatalog;
import com.artech.base.metadata.languages.LanguageCatalog;

import java.util.Locale;

public interface ILanguage {
	void initialize(LanguageCatalog languages, ImageCatalog images);

	/**
	 * Returns the current (GX) language name, calculated from the current device locale. May be null.
	 */
	String getCurrentLanguage();

	/**
	 * Returns the properties of the current (GX) language.
	 */
	String getCurrentLanguageProperty(String property);

	/**
	 * Gets the translation of a message in the current language.
	 */
	String getTranslation(String message);

	/**
	 * Gets the translation of a message in the specified language.
	 */
	String getTranslation(String message, String language);

	/**
	 * Gets the translation of an expression (by substituting translatable strings inside it).
	 */
	String getExpressionTranslation(String expression);

	/**
	 * Forces the application to use a specific locale instead of the system one.
	 */
	void setLanguageAndLocale(@NonNull Context context, String languageName, Locale locale, boolean persistValues);

	void setLocaleToSystemDefault(@NonNull Context context);

	void clearCacheOnLanguageChange();

	void onApplicationCreate(@NonNull Context context);

	void onBeforeCreate(@NonNull Context context);
}
