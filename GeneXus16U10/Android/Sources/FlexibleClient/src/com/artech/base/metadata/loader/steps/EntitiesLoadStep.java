package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.loader.EntityDefinitionLoader;
import com.artech.base.metadata.loader.MetadataFile;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

import java.util.ArrayList;

public class EntitiesLoadStep implements MetadataLoadStep {
	private final Context mContext;
	private final MetadataFile mMetadataFile;

	public EntitiesLoadStep(Context context, MetadataFile metadataFile) {
		mContext = context;
		mMetadataFile = metadataFile;
	}

	@Override
	public void load() {
		ArrayList<String> bcNames = new ArrayList<>();

		// Try reading list of BCs from new file (bc_list.json).
		// Unlike the other get() methods, this may return null. In that case read from the older file.
		INodeCollection bcList = mMetadataFile.getBCs();
		if (bcList != null) {
			for (INodeObject jsonBC : bcList) {
				String bcName = jsonBC.optString("n");
				if (Strings.hasValue(bcName))
					bcNames.add(bcName);
			}
		} else {
			// Try reading list of BCs from old file (gx_entity_list.json).
			INodeObject entities = MetadataLoader.getDefinition(mContext, "gx_entity_list");
			if (entities != null) {
				INodeObject jsonMetadata = entities.getNode("Metadata");
				for (INodeObject jsonEntity : jsonMetadata.optCollection("ObjectList")) {
					String objType = jsonEntity.getString("ObjectType");
					if (objType.equals("BC")) {
						String bcName = jsonEntity.getString("ObjectName");
						if (Strings.hasValue(bcName))
							bcNames.add(bcName);
					}
				}
			}
		}

		// Read the definition for each BC listed before.
		for (String bcName : bcNames) {
			EntityDefinitionLoader loader = new EntityDefinitionLoader();
			IPatternMetadata data = loader.load(mContext, bcName);
			if (data != null)
				Services.Application.putBusinessComponent((StructureDefinition) data);
		}
	}
}
