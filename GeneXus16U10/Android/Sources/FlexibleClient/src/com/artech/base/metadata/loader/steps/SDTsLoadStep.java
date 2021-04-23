package com.artech.base.metadata.loader.steps;

import android.util.Pair;

import com.artech.base.metadata.StructureDataType;
import com.artech.base.metadata.loader.MetadataFile;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

import java.util.ArrayList;
import java.util.List;

public class SDTsLoadStep implements MetadataLoadStep {
	private final MetadataFile mMetadataFile;

	public SDTsLoadStep(MetadataFile metadataFile) {
		mMetadataFile = metadataFile;
	}

	@Override
	public void load() {
		// We do two passes: first one creates all SDTs (with empty definition), second one deserializes them.
		// This is because SDT_A may have a member of type SDT_B, which is after it in the file.
		// If we did just one pass, the deserialized definition of SDT_A will be incomplete.
		INodeCollection arrSDTs = mMetadataFile.getSDTs();
		List<Pair<StructureDataType, INodeObject>> sdtDefinitions = new ArrayList<>();

		for (int i = 0; i < arrSDTs.length(); i++) {
			INodeObject jsonSdt = arrSDTs.getNode(i);
			StructureDataType sdt = new StructureDataType(jsonSdt);

			Services.Application.putSDT(sdt);
			sdtDefinitions.add(new Pair<>(sdt, jsonSdt));
		}

		for (Pair<StructureDataType, INodeObject> sdt : sdtDefinitions)
			sdt.first.deserialize(sdt.second);
	}
}
