package com.genexus.live_editing.commands;

import android.app.Activity;

import com.artech.base.metadata.languages.Language;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.controls.IGxLocalizable;
import com.genexus.live_editing.support.ILiveEditingImageManager;
import com.google.gson.annotations.SerializedName;

public class CommandTranslationChanged implements IServerCommand {
	@SerializedName("ObjName")
	private final String mLanguageName;
	@SerializedName("Data")
	private final INodeObject mNewMetadata;

	public CommandTranslationChanged(String languageName, INodeObject newMetadata) {
		mLanguageName = languageName;
		mNewMetadata = newMetadata;
	}

	@Override
	public boolean execute(ILiveEditingImageManager liveEditingImageManager) {
		Language currentLanguage = Services.Application.getDefinition().getLanguageCatalog().
				getCurrentLanguage();
		MetadataHelper.checkCurrentLanguage(currentLanguage, mLanguageName);
		MetadataHelper.replaceTranslation(currentLanguage, mNewMetadata);
		return true;
	}

	@Override
	public void applyChanges(final Activity activity) {
		// Activity (to change the action bar title)
		if (activity instanceof IGxLocalizable) {
			((IGxLocalizable) activity).onTranslationChanged();
		}

		// Individual controls
		for (IGxLocalizable control : ControlsUtils.getLocalizableControls(activity)) {
			control.onTranslationChanged();
		}
	}

	@Override
	public boolean shouldInspectUIAfterApplyingChanges() {
		return true;
	}
}
