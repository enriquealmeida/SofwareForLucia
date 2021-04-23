package com.genexus.live_editing.commands;

import android.app.Activity;
import androidx.annotation.NonNull;

import com.artech.activities.ActivityThemePropertiesHelper;
import com.artech.android.layout.GxTheme;
import com.artech.base.metadata.theme.ThemeApplicationBarClassDefinition;
import com.artech.base.metadata.theme.ThemeApplicationClassDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controls.IGxThemeable;
import com.genexus.live_editing.support.ILiveEditingImageManager;
import com.google.gson.annotations.SerializedName;


public class CommandThemeStyleChanged implements IServerCommand {
	@SerializedName("ObjName")
	private final String mThemeName;
	@SerializedName("StyleName")
	private final String mClassName;
	@SerializedName("Parent")
	private final String mParentClassName;
	@SerializedName("Data")
	private final INodeObject mNewMetadata;

	public CommandThemeStyleChanged(@NonNull String themeName, @NonNull String className,
									@NonNull String parentClassName,
									@NonNull INodeObject newMetadata) {
		mThemeName = themeName;
		mClassName = className;
		mParentClassName = parentClassName;
		mNewMetadata = newMetadata;
	}

	@Override
	public boolean execute(ILiveEditingImageManager liveEditingImageManager) {
		ThemeDefinition currentTheme = Services.Themes.getCurrentTheme();

		MetadataHelper.checkCurrentThemeName(currentTheme, mThemeName);

		ThemeClassDefinition classDef = currentTheme.getClass(mClassName);
		ThemeClassDefinition parentClassDef = Strings.hasValue(mParentClassName) ? currentTheme.getClass(mParentClassName) : null;
		// New class has been added
		if (classDef == null) {
			// No new root classes allowed
			if (parentClassDef != null) {
				MetadataHelper.addThemeClass(currentTheme, parentClassDef, mNewMetadata);
				return true;
			} else {
				return false;
			}
			// Existent class has been modified
		} else {
			MetadataHelper.replaceThemeClass(currentTheme, parentClassDef, mClassName, mNewMetadata);
			return true;
		}
	}

	@Override
	public void applyChanges(final Activity activity) {
		String newThemeClassName = mNewMetadata.getString("Name");
		String oldThemeClassName = mClassName;

		ThemeDefinition currentTheme = Services.Themes.getCurrentTheme();
		ThemeClassDefinition newThemeClassDefinition = currentTheme.getClass(newThemeClassName);
		String rootThemeClassName = newThemeClassDefinition.getRootName();

		if (ThemeApplicationClassDefinition.CLASS_NAME.equals(rootThemeClassName) ||
				ThemeApplicationBarClassDefinition.CLASS_NAME.equals(rootThemeClassName)) {
			ActivityThemePropertiesHelper.applyChanges(activity);
		} else {
			for (IGxThemeable control : ControlsUtils.getControlsWithThemeClassName(activity, oldThemeClassName)) {
				GxTheme.applyStyle(control, newThemeClassDefinition);
			}
		}
	}

	@Override
	public boolean shouldInspectUIAfterApplyingChanges() {
		return true;
	}
}
