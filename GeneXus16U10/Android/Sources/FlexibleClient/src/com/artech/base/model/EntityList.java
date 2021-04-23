package com.artech.base.model;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.UUID;

import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.services.IEntityList;

public class EntityList extends BaseCollection<Entity> implements IEntityList
{
	private static final long serialVersionUID = 1L;
	private HashMap<String, Entity> mEntities = new LinkedHashMap<>();
	private UUID mVersion;
	private StructureDefinition mDefinition;
	private Expression.Type mItemType = Expression.Type.UNKNOWN;

	public EntityList()
	{
		super();
		updateVersion();
	}

	public EntityList(StructureDefinition definition)
	{
		this();
		mDefinition = definition;
	}

	public EntityList(EntityList other)
	{
		this();
		for (int i = 0; i < other.size(); i++)
			addEntity(other.get(i));

		mVersion = other.mVersion;
		mDefinition = other.mDefinition;
		mItemType = other.mItemType;
	}

	public EntityList(Iterable<Entity> other, StructureDefinition definition )
	{
		this();
		for (Entity entity : other)
			addEntity(entity);

		mDefinition = definition;
	}

	@Override
	public Expression.Type getItemType()
	{
		return mItemType;
	}

	public void setItemType(Expression.Type itemType)
	{
		mItemType = itemType;
	}

	public UUID getVersion() { return mVersion; }

	public StructureDefinition getDefinition()
	{
		return mDefinition;
	}

	public void addEntity(Entity entity)
	{
		String key = entity.getKeyString();

		if (key != null && key.length() > 0)
		{
			if (!mEntities.containsKey(key))
			{
				mEntities.put(key, entity);
				add(entity);
			}
		}
		else
		{
			key = String.valueOf(mEntities.size() + 1);
			mEntities.put(key, entity);
			add(entity);
		}

		updateVersion();
	}

	@Override
	protected void serializeItem(INodeCollection collection, Entity item, short jsonFormat) {
		collection.put(item.serialize(jsonFormat));
	}

	@Override
	protected Entity deserializeItem(INodeCollection collection, int index, short jsonFormat) {
		Entity item = new Entity(mDefinition);
		item.deserialize(collection.getNode(index), jsonFormat);
		return item;
	}

	private void updateVersion()
	{
		mVersion = UUID.randomUUID();
	}
}
