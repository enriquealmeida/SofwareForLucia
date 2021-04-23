package com.artech.base.model;

import androidx.annotation.NonNull;

import com.artech.application.MyApplication;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.LevelDefinition;
import com.artech.base.metadata.StructureDataType;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

import java.util.List;

/**
 * Entity factory. Creates specialized kinds of entities.
 */
public class EntityFactory
{
	/**
	 * Creates a new SDT Entity, from its data type name.
	 * @param sdtTypeName SDT name (GX name).
	 * @throws IllegalArgumentException When the SDT definition is not found in the application's metadata.
	 */
	@NonNull
	public static Entity newSdt(@NonNull String sdtTypeName)
	{
		StructureDataType sdtDefinition = getSdtDefinition(sdtTypeName);
		Entity entity = new Entity(sdtDefinition.getStructure());
		entity.initialize(); // create inner members empty values
		return entity;
	}

	/**
	 * Creates a new BC Entity, from its data type name.
	 * @param bcTypeName BC name (GX name).
	 * @throws IllegalArgumentException When the BC definition is not found in the application's metadata.
	 */
	@NonNull
	public static Entity newBC(@NonNull String bcTypeName)
	{
		StructureDefinition bcDefinition = Services.Application.getBusinessComponent(bcTypeName);
		if (bcDefinition == null)
			throw new IllegalArgumentException(String.format("BC definition for '%s' is missing.", bcTypeName));
		Entity entity = new Entity(bcDefinition);
		entity.initialize(); // create inner members empty values
		return entity;
	}

	/**
	 * Creates a new SDT inner level Entity, from its data type name.
	 * @param sdtTypeName SDT name (GX name).
	 * @param levelName Level name (GX name).
	 * @throws IllegalArgumentException When the SDT definition or its level is not found in the application's metadata.
	 */
	@NonNull
	public static Entity newSdt(@NonNull String sdtTypeName, @NonNull String levelName)
	{
		// TODO: When getLevel() is removed, this should be merged with the other overload and
		// TODO: receive the "full" data type name, i.e. sdtTypeName.levelTypeName.
		// TODO: Note that levelTypeName should NOT be the same as levelName!
		StructureDataType sdtDefinition = getSdtDefinition(sdtTypeName);
		LevelDefinition levelDefinition = sdtDefinition.getLevel(levelName);
		if (levelDefinition == null)
			throw new IllegalArgumentException(String.format("SDT '%s' does not contain a level with name '%s'.", sdtTypeName, levelName));

		return new Entity(sdtDefinition.getStructure(), levelDefinition, EntityParentInfo.NONE);
	}

	/**
	 * Creates a new SDT Collection from its data type name and the given values.
	 * @param sdtTypeName SDT name (GX name).
	 * @param values the serialized values to put in each item of the SDT.
	 * @throws IllegalArgumentException if the SDT definition doesn't have an item inside.
	 */
	@NonNull
	public static INodeCollection newSdtCollection(@NonNull String sdtTypeName, @NonNull List<String> values) {
		StructureDataType sdtDefinition = getSdtDefinition(sdtTypeName);

		List<DataItem> items = sdtDefinition.getRoot().Items;
		if (items.isEmpty()) {
			throw new IllegalArgumentException(String.format("SDT '%s' does not contain an item inside.", sdtTypeName));
		}

		DataItem item = sdtDefinition.getRoot().Items.get(0);

		INodeCollection collection = Services.Serializer.createCollection();

		for (String value : values) {
			INodeObject node = Services.Serializer.createNode(String.format("{\"%s\": \"%s\"}", item.getName(), value));
			collection.put(node);
		}

		return collection;
	}

	@NonNull
	private static StructureDataType getSdtDefinition(@NonNull String sdtTypeName)
	{
		StructureDataType sdtDefinition = MyApplication.getApp().getDefinition().getSDT(sdtTypeName);
		if (sdtDefinition == null)
			throw new IllegalArgumentException(String.format("SDT definition for '%s' is missing.", sdtTypeName));

		return sdtDefinition;
	}
}
