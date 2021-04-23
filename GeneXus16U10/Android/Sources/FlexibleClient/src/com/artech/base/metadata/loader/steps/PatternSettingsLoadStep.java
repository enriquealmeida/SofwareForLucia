package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.settings.WorkWithSettings;
import com.artech.base.metadata.settings.WorkWithSettingsLoader;
import com.artech.base.services.Services;
import com.artech.base.utils.Version;

public class PatternSettingsLoadStep implements MetadataLoadStep {
	private final Context mContext;
	private final boolean mCheckSchemaVersion;
	private final GenexusApplication mApplication;

	public PatternSettingsLoadStep(Context context, boolean checkSchemaVersion, GenexusApplication application) {
		mContext = context;
		mCheckSchemaVersion = checkSchemaVersion;
		mApplication = application;
	}

	@Override
	public void load() {
		WorkWithSettings wwSettings = WorkWithSettingsLoader.load(mContext, mApplication);
		if (wwSettings != null) {
			Services.Application.setPatternSettings(wwSettings);

			if (mCheckSchemaVersion) {
				final Version VERSION_AT_LEAST = new Version("15.0.1");
				Version version = new Version(wwSettings.getInstanceProperties().optStringProperty("@Version"));

				if (version.isLessThan(VERSION_AT_LEAST))
					throw new IllegalStateException(String.format("Metadata generated with version '%s' cannot be read. It should be at least '%s'.", version, VERSION_AT_LEAST));
			}
		}
	}
}
