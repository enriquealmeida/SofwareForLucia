package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.loader.MetadataParser;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class ThemesLoadStep implements MetadataLoadStep {
	private final Context mContext;

	public ThemesLoadStep(Context context) {
		mContext = context;
	}

	@Override
	public void load() {
		String theTheme = Services.Themes.calculateAppThemeName();
		if (!Services.Strings.hasValue(theTheme))
			return;

		INodeObject themes = MetadataLoader.getDefinition(mContext, "themes");
		if (themes != null) {
			INodeCollection arrThemes = themes.optCollection("Themes");
			for (int i = 0; i < arrThemes.length(); i++) {
				INodeObject obj = arrThemes.getNode(i);
				String themeName = obj.optString("Name");
				if (themeName.length() > 0 && themeName.equalsIgnoreCase(theTheme)) {
					ThemeDefinition def = MetadataParser.readOneTheme(mContext, themeName);
					if (def != null)
						Services.Application.putTheme(def);
				}
			}
		}
	}
}
