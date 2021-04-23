package com.genexus.live_editing.commands;

import android.app.Activity;
import androidx.annotation.NonNull;

import com.artech.activities.ActivityThemePropertiesHelper;
import com.artech.android.layout.GxTheme;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.IGxThemeable;
import com.genexus.live_editing.support.ILiveEditingImageManager;
import com.google.gson.annotations.SerializedName;

public class CommandThemeColorChanged implements IServerCommand {
	@SerializedName("ObjName")
	private final String mThemeName;
	@SerializedName("Data")
	private final INodeCollection mNewClassesMetadata;

	public CommandThemeColorChanged(@NonNull String themeName,
									@NonNull INodeCollection newClassesMetadata) {
		mThemeName = themeName;
		mNewClassesMetadata = newClassesMetadata;
	}

	@Override
	public boolean execute(ILiveEditingImageManager liveEditingImageManager) {
		ThemeDefinition currentTheme = Services.Themes.getCurrentTheme();

		MetadataHelper.checkCurrentThemeName(currentTheme, mThemeName);

		for (INodeObject newMetadata : mNewClassesMetadata) {
			String className = newMetadata.getString("Name");
			if (Strings.hasValue(className)) {
				ThemeClassDefinition parentDefinition = currentTheme.getClass(className)
						.getParentClass();
				MetadataHelper.replaceThemeClass(currentTheme, parentDefinition, className,
						newMetadata);
			}
		}
		return true;
	}

	@Override
	public void applyChanges(final Activity activity) {
		ActivityThemePropertiesHelper.applyChanges(activity);
		ThemeDefinition currentTheme = Services.Themes.getCurrentTheme();

		for (IGxThemeable control : ControlsUtils.getControlsWithThemeClass(activity)) {
			String themeClassName = control.getThemeClass().getName();
			ThemeClassDefinition newDefinition = currentTheme.getClass(themeClassName);
			GxTheme.applyStyle(control, newDefinition);
		}
	}

	@Override
	public boolean shouldInspectUIAfterApplyingChanges() {
		return true;
	}
}
