package com.genexus.live_editing.commands;

import android.app.Activity;
import androidx.annotation.NonNull;

import com.artech.android.layout.GxTheme;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.controls.IGxThemeable;
import com.genexus.live_editing.support.ILiveEditingImageManager;
import com.google.gson.annotations.SerializedName;

public class CommandThemeTransformationChanged implements IServerCommand {
	@SerializedName("ObjName")
	private final String mThemeName;
	@SerializedName("TransformName")
	private final String mTransformationName;
	@SerializedName("Data")
	private final INodeObject mNewMetadata;

	public CommandThemeTransformationChanged(@NonNull String themeName,
											 @NonNull String transformationName,
											 @NonNull INodeObject newMetadata) {
		mThemeName = themeName;
		mTransformationName = transformationName;
		mNewMetadata = newMetadata;
	}

	@Override
	public boolean execute(ILiveEditingImageManager liveEditingImageManager) {
		ThemeDefinition currentTheme = Services.Themes.getCurrentTheme();
		MetadataHelper.checkCurrentThemeName(currentTheme, mThemeName);
		MetadataHelper.replaceTransformation(currentTheme, mTransformationName, mNewMetadata);
		return true;
	}

	@Override
	public void applyChanges(final Activity activity) {
		// Apply transformation changes to each control that has a theme class that uses this transformation.
		for (IGxThemeable control : ControlsUtils.getControlsWithTransformationName(activity, mTransformationName)) {
			// Re-apply the control's theme class definition in order to re-apply its associated transformation.
			GxTheme.applyStyle(control, control.getThemeClass(), true);
		}
	}

	@Override
	public boolean shouldInspectUIAfterApplyingChanges() {
		return true;
	}
}
