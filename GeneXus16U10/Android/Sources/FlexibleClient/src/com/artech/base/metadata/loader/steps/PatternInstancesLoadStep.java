package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.metadata.enums.GxObjectTypes;
import com.artech.base.metadata.loader.DashboardMetadataLoader;
import com.artech.base.metadata.loader.MetadataFile;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.loader.WorkWithMetadataLoader;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class PatternInstancesLoadStep implements MetadataLoadStep {
	private final Context mContext;
	private final MetadataFile mMetadata;

	public PatternInstancesLoadStep(Context context, MetadataFile metadata) {
		mContext = context;
		mMetadata = metadata;
	}

	@Override
	public void load() {
		INodeCollection patterns = mMetadata.getPatternInstances();

		DashboardMetadataLoader dashboardLoader = new DashboardMetadataLoader();
		WorkWithMetadataLoader workWithLoader = new WorkWithMetadataLoader();

		for (INodeObject instance : patterns) {
			String instanceType = instance.getString("Type");
			String instanceName = instance.getString("Name");

			MetadataLoader loader = null;
			String fileName = null;

			if (instanceType.equalsIgnoreCase(GxObjectTypes.DASHBOARD_GUID)) {
				// Dashboard
				loader = dashboardLoader;
				fileName = Strings.toLowerCase(instanceName) + ".menu";
			} else if (instanceType.equalsIgnoreCase(GxObjectTypes.SD_PANEL_GUID)) {
				// Panel.
				loader = workWithLoader;
				fileName = Strings.toLowerCase(instanceName) + ".panel";
			} else if (instanceType.equalsIgnoreCase(GxObjectTypes.WORK_WITH_GUID)) {
				// WWSD.
				loader = workWithLoader;
				fileName = Strings.toLowerCase(instanceName) + ".ww";
			}

			if (loader != null) {
				IPatternMetadata data = loader.load(mContext, fileName);
				if (data != null) {
					data.setName(instanceName);
					Services.Application.putPattern(data, loader, fileName);
				}
			} else
				Services.Log.error(String.format("Instance '%s' has an unrecognized type (%s).", instanceName, instanceType));
		}
	}
}
