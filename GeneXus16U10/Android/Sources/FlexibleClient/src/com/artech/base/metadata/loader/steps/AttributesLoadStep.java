package com.artech.base.metadata.loader.steps;

import com.artech.base.metadata.AttributeDefinition;
import com.artech.base.metadata.loader.MetadataFile;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class AttributesLoadStep implements MetadataLoadStep {
	private final MetadataFile mMetadataFile;

	public AttributesLoadStep(MetadataFile metadataFile) {
		mMetadataFile = metadataFile;
	}

	@Override
	public void load() {
		for (INodeObject obj : mMetadataFile.getAttributes()) {
			AttributeDefinition def = new AttributeDefinition(obj);
			Services.Application.putAttribute(def);
		}
	}
}
