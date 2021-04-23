package com.artech.base.metadata.loader.steps;

import com.artech.base.metadata.GxObjectDefinition;
import com.artech.base.metadata.loader.MetadataFile;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataParser;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class ProceduresLoadStep implements MetadataLoadStep {
	private final MetadataFile mMetadata;

	public ProceduresLoadStep(MetadataFile metadata) {
		mMetadata = metadata;
	}

	@Override
	public void load() {
		INodeCollection arrProcs = mMetadata.getProcedures();
		for (int i = 0; i < arrProcs.length(); i++) {
			INodeObject obj = arrProcs.getNode(i);
			GxObjectDefinition def = MetadataParser.readOneGxObject(obj);
			Services.Application.putGxObject(def);
		}
	}
}
