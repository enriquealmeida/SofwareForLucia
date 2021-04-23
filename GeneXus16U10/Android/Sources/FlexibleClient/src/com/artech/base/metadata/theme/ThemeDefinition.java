package com.artech.base.metadata.theme;

import java.io.Serializable;

import com.artech.base.utils.NameMap;
import com.artech.base.utils.Strings;

public class ThemeDefinition implements Serializable
{
	private static final long serialVersionUID = 1L;

	private final String mName;
	private final NameMap<ThemeClassDefinition> mClasses = new NameMap<>();
	private final NameMap<TransformationDefinition> mTransformations = new NameMap<>();
	private final NameMap<ThemeFontFamilyDefinition> mFontFamilies = new NameMap<>();
	private ThemeDefinition mDarkTheme;

	public ThemeDefinition(String name)
	{
		mName = name;
	}

	public String getName() { return mName; }

	public ThemeApplicationClassDefinition getApplicationClass()
	{
		ThemeClassDefinition appClass = getClass(ThemeApplicationClassDefinition.CLASS_NAME);
		if (appClass != null)
			return (ThemeApplicationClassDefinition)appClass;

		return new ThemeApplicationClassDefinition(this, null);
	}

	public ThemeClassDefinition getClass(String id)
	{
		if (!Strings.hasValue(id))
			return null;

		return mClasses.get(Strings.trimAll(id));
	}

	public TransformationDefinition getTransformation(String id)
	{
		return mTransformations.get(id);
	}

	public ThemeFontFamilyDefinition getFontFamily(String id) {
		return mFontFamilies.get(id);
	}

	public void putClass(ThemeClassDefinition def)
	{
		mClasses.put(def.getName(), def);
	}

	public void removeClass(String defName) {
		mClasses.remove(defName);
	}

	public void putTransformation(TransformationDefinition transformation)
	{
		mTransformations.put(transformation.getName(), transformation);
	}

	public void removeTransformation(String defName) {
		mTransformations.remove(defName);
	}

	public void putFontFamily(ThemeFontFamilyDefinition font) {
		mFontFamilies.put(font.getName(), font);
	}

	public void removeFontFamily(String defName) {
		mFontFamilies.remove(defName);
	}

	public void setDarkTheme(ThemeDefinition darkTheme) {
		mDarkTheme = darkTheme;
	}

	public ThemeDefinition getDarkTheme() {
		return mDarkTheme;
	}
}
