package com.artech.base.model;

import java.math.BigDecimal;
import java.util.List;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.ITypeDefinition;
import com.artech.base.metadata.LevelDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.DataTypes;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.types.IStructuredDataType;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.utils.Cast;

/**
 * Helper class with (de)serialization methods for Entities (more to be added later).
 */
class EntitySerializer
{
	private static final String LOG_TAG = "EntitySerializer";

	private final Entity mEntity;

	EntitySerializer(Entity entity)
	{
		mEntity = entity;
	}

	public Object deserializeValue(String name, Object value)
	{
		if (value == null)
			return null;

		DataItem dataItem = mEntity.getPropertyDefinition(name);
		if (dataItem == null)
		{
			Services.Log.warning(LOG_TAG, String.format("Failed deserialization of property '%s' because property definition was not found. Value was '%s'.", name, value));
			return null;
		}

		IStructuredDataType structureInfo = dataItem.getTypeInfo(IStructuredDataType.class);
		if (structureInfo != null)
		{
			if (dataItem.isCollection() || structureInfo.isCollection())
			{
				// Deserialize collection SDT.
				EntityList collectionValues = deserializeStructureCollection(name, value, structureInfo);

				if (collectionValues != null)
				{
					EntityParentInfo parentInfo = EntityParentInfo.collectionMemberOf(mEntity, name, collectionValues);
					for (Entity collectionItem : collectionValues)
						collectionItem.setParentInfo(parentInfo);

					return collectionValues;
			    }
				else
				{
					Services.Log.error(String.format("Unexpected failure during deserialization of '%s'.", value));
					return null;
				}
			}
			else
			{
				// Deserialize SDT or BC.
				Entity itemValue = deserializeStructureItem(name, value, structureInfo.getStructure());

				EntityParentInfo parentInfo = EntityParentInfo.memberOf(mEntity, name);
				itemValue.setParentInfo(parentInfo);

				return itemValue;
			}
		}
		else if (dataItem.isCollection())
		{
			LevelDefinition level = Cast.as(LevelDefinition.class, dataItem);
			if (level != null && level.getNoParentLevel()) {
				// Collection of secondary grid level
				return deserializeGridCollection(value, level);
			}
			else {
				// Collection of base type.
				return deserializeValueCollection(value, dataItem.getBaseType());
			}
		}
		else
		{
			// Standard case, for a normal field member.
			return deserializeSimpleValue(value, dataItem.getBaseType());
		}
	}

	private Expression.Type getExpressionType(String type) {
		if (type.equalsIgnoreCase(DataTypes.SDT))
			return Expression.Type.SDT;
		else if (type.equalsIgnoreCase(DataTypes.BUSINESS_COMPONENT))
			return Expression.Type.BC;
		else
			throw new IllegalArgumentException(String.format("Unsupported type for entity list '%s'.", type));
	}

	@SuppressWarnings("unchecked")
	private EntityList deserializeStructureCollection(String name, Object value, IStructuredDataType structureInfo)
	{
		// Skip conversion if already deserialized.
		if (value instanceof EntityList)
			return (EntityList)value;

		Expression.Type itemsType = getExpressionType(structureInfo.getType());

		// Just create a new wrapper EntityList if an unsupported List type arrives.
		// TODO: Remove this when generator creates an EntityList.
		if (value instanceof List<?>)
		{
			List<?> otherList = (List<?>)value;

			 // Check for first item of correct type, assume all others match too.
			if (otherList.size() == 0 || otherList.get(0) instanceof Entity) {
				// list of Entities of the same type / definition
				EntityList items = new EntityList((Iterable<Entity>) otherList, structureInfo.getStructure());

				items.setItemType(itemsType);
				return items;
			}
		}

		// Get JSON collection from value (which can be JSON object, native JSON, or string).
		INodeCollection nodes = Services.Serializer.createCollection(value);
		if (nodes != null)
		{
			// Perform deserialization proper.
			EntityList items = new EntityList();
			items.setItemType(itemsType);
			EntityParentInfo parentInfo = EntityParentInfo.collectionMemberOf(mEntity, name, items);

			for (INodeObject node : nodes)
			{
				Entity entity = new Entity(structureInfo.getStructure(), parentInfo);
				entity.deserialize(node);
				items.addEntity(entity);
			}

			return items;
		}

		// Log failure.
		Services.Log.warning(LOG_TAG, String.format("Failed SDT collection deserialization (%s, '%s').", value.getClass(), value));
		return null;
	}

	private EntityList deserializeGridCollection(Object value, LevelDefinition level)
	{
		// Get JSON collection from value (which can be JSON object, native JSON, or string).
		INodeCollection nodes = Services.Serializer.createCollection(value);
		if (nodes != null)
		{
			// Perform deserialization proper.
			EntityList items = new EntityList();
			for (INodeObject node : nodes)
			{
				Entity entity = new Entity(level.getStructure(), level, EntityParentInfo.NONE);
				entity.deserialize(node);
				items.addEntity(entity);
			}
			return items;
		}

		// Log failure.
		Services.Log.warning(LOG_TAG, String.format("Failed Grid collection deserialization (%s, '%s').", value.getClass(), value));
		return null;
	}

	private Entity deserializeStructureItem(String name, Object value, StructureDefinition itemStructure)
	{
		// Skip conversion if already deserialized.
		if (value instanceof Entity)
			return (Entity)value;

		// Get JSON node from value (which can be JSON object, native JSON, or string).
		INodeObject node = Services.Serializer.createNode(value);
		if (node != null)
		{
			// Perform deserialization proper.
			Entity entity = new Entity(itemStructure, EntityParentInfo.memberOf(mEntity, name));
			entity.deserialize(node);
			return entity;
		}

		// Log failure.
		Services.Log.warning(LOG_TAG, String.format("Failed SDT item deserialization (%s, '%s').", value.getClass(), value));
		return null;
	}

	private ValueCollection deserializeValueCollection(Object value, ITypeDefinition itemType)
	{
		if (value instanceof ValueCollection)
			return (ValueCollection)value;

		INodeCollection jsonCollection = Services.Serializer.createCollection(value);
		if (jsonCollection != null)
		{
			ValueCollection collection = new ValueCollection(itemType);
			for (int i = 0; i < jsonCollection.length(); i++)
			{
				String jsonValue = jsonCollection.getString(i);
				Object item = deserializeSimpleValue(jsonValue, itemType);
				collection.add(item.toString());
			}

			return collection;
		}

		// Log failure.
		Services.Log.warning(LOG_TAG, String.format("Failed value collection deserialization (%s, '%s').", value.getClass(), value));
		return null;
	}

	private Object deserializeSimpleValue(Object value, ITypeDefinition baseType)
	{
		if (baseType != null)
		{
			// Handle numeric coercions as a special case (e.g. &int1 = 1.3)
			if (DataTypes.NUMERIC.equalsIgnoreCase(baseType.getType()) &&
				baseType.getDecimals() == 0)
			{
				BigDecimal number = Services.Strings.tryParseDecimal(String.valueOf(value));
				if (number != null)
					return String.valueOf(number.longValue());
			}
		}

		// Default case
		return String.valueOf(value);
	}
}
