package com.artech.base.metadata.loader;

import android.content.Context;

import java.util.HashMap;
import java.util.LinkedHashMap;

import com.artech.base.metadata.AttributeDefinition;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.metadata.LevelDefinition;
import com.artech.base.metadata.RelationDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class EntityDefinitionLoader extends MetadataLoader
{
	@Override
	public  IPatternMetadata load(Context context, String data)
	{
		data = Strings.toLowerCase(data);

		// Try to read with both name formats, new and old.
		INodeObject json = getDefinition(context, data + ".bc");
		if (json == null)
			json = getDefinition(context, data);

		if (json != null)
			return loadJSON(json);
		else
			return null;
	}

	private static StructureDefinition loadJSON(INodeObject jsonData)
	{
		INodeObject gxObject = jsonData.getNode("GxObject");
		INodeObject structure = gxObject.getNode("Structure");
		INodeObject relations = gxObject.optNode("Relations");
		StructureDefinition definition = new StructureDefinition(gxObject.getString("Name"));
		definition.setConnectivitySupport(MetadataParser.readConnectivity(gxObject));
		loadLevels(definition, structure);
		loadRelations(definition, relations);

		return definition;
	}

	private static void loadRelations(StructureDefinition definition, INodeObject relations)
	{
		INodeObject manyToOneReader = relations.optNode("ManyToOne");
		INodeCollection referencesReader = manyToOneReader.optCollection("references");
		for (int i = 0; i < referencesReader.length() ; i++)
		{
			INodeObject obj = referencesReader.getNode(i);
			RelationDefinition rel = readRelation(obj);
			if (rel.getBCRelated() == null || !rel.getBCRelated().equals(definition.getName()))
				definition.ManyToOneRelations.add(rel);
		}
	}

	/*{"Name":"OradoresOraCod","BusinessComponent":"Oradores","Description":"Oradores",
		"ForeignKey":
			{"KeyAttributes":[
				{"Name":"OraCod","Type":"char"}]},
			"InferredAttributes":
			{"Attributes":[
				{"Name":"OraApellido","Type":"char"},
				{"Name":"OraNombre","Type":"char"},
				{"Name":"OraEmpresa","Type":"char"}
				]
			}
	 },
*/

	private static RelationDefinition readRelation(INodeObject obj)
	{
		RelationDefinition relation = new RelationDefinition();
		relation.setName(obj.getString("Name"));
		relation.setBCRelated(obj.getString("BusinessComponent"));
		INodeObject foreignKey = obj.optNode("ForeignKey");
		INodeCollection keyAtts =  foreignKey.optCollection("KeyAttributes");
		INodeObject inferredAtts = obj.optNode("InferredAttributes");
		if (inferredAtts != null) {
			INodeCollection atts = inferredAtts.optCollection("Attributes");
			if (atts != null) {
				for (int i = 0 ; i < atts.length() ; i++) {
					INodeObject attRefjson = atts.getNode(i);

					String attName = attRefjson.optString("Name");
					AttributeDefinition att = Services.Application.getAttribute(attName);
					if (att != null) { // _GXI are being inferred so we have to ignore this here
						att.setProperty("AtributeSuperType", attRefjson.optString("AtributeSuperType"));
						relation.getInferredAtts().add(attName);
					}
				}
			}
		}
		for (int i = 0; i < keyAtts.length() ; i++)
		{
			INodeObject attRefjson = keyAtts.getNode(i);
			String attName = attRefjson.optString("Name");
			AttributeDefinition att = Services.Application.getAttribute(attName);
			if (att != null) {
				att.setProperty("AtributeSuperType", attRefjson.optString("AtributeSuperType"));
				relation.getKeys().add(attName);
			}
		}
		return relation;
	}

	private static void loadAttributes(LevelDefinition definition, INodeObject structure)
	{
		INodeCollection  attributes = structure.getCollection("Attributes");
		for (int i = 0; i < attributes.length() ; i++)
		{
			INodeObject attribute = attributes.getNode(i);
			String attName = attribute.optString("InternalName");
			if (!Services.Strings.hasValue(attName))
				attName = attribute.getString("Name");

			//get from globals att
			AttributeDefinition attDefinition = Services.Application.getAttribute(attName);
			if (attDefinition == null)
			{
				Services.Log.warning("Load Entity Attributes", "Attribute Definition not found for " + attName);
				continue;
			}

			DataItem trnAtt = new DataItem(attDefinition);
			for (String propName : attribute.names())
				trnAtt.setProperty(propName, attribute.get(propName));

			definition.Items.add(trnAtt);
		}
	}

	private static void loadLevels(StructureDefinition structureDef, INodeObject structure)
	{
		HashMap<String, LevelDefinition> tempLevels = new LinkedHashMap<>();
		INodeCollection  levels = structure.getCollection("Levels");

		for (int i = 0; i < levels.length() ; i++)
		{
			INodeObject level = levels.getNode(i);
			String parentLevel = Strings.toLowerCase(level.getString("ParentLevel"));

			LevelDefinition levelDefinition;
			// Is the first level -> take the already created level, otherwise create a new one an add to the hash
			if (parentLevel.length() == 0)
			{
				levelDefinition = structureDef.Root;
				tempLevels.put(Strings.toLowerCase(level.getString("Name")), structureDef.Root);
			}
			else
			{
				levelDefinition = new LevelDefinition(null);
				levelDefinition.setIsCollection(true);
				tempLevels.put(Strings.toLowerCase(level.getString("Name")), levelDefinition);
			}

			// Load Attributes for the level
			loadAttributes(levelDefinition, level);

			// Load the Property Bag for the Level
			levelDefinition.deserialize(level);

			levelDefinition.getName(); // only to force deserialization

			levelDefinition.setName(level.getString("LevelName"));
			levelDefinition.setDescription(level.getString("Description"));

			// Add the Level to the Parent Level
			if (parentLevel.length() > 0)
			{
				LevelDefinition parentLevelDefinition = tempLevels.get(parentLevel);
				parentLevelDefinition.Levels.add(levelDefinition);
				levelDefinition.setParent(parentLevelDefinition);
			}
		}
	}
}
