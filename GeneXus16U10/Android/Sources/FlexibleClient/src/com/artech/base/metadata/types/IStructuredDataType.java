package com.artech.base.metadata.types;

import java.util.List;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.ITypeDefinition;
import com.artech.base.metadata.StructureDefinition;

public interface IStructuredDataType extends ITypeDefinition
{
	/**
	 * Gets the full structure of the type.
	 */
	StructureDefinition getStructure();

	/**
	 * Gets the list of all the members in the structure.
	 */
	List<DataItem> getItems();

	/**
	 * Searches for a particular member by name.
	 */
	DataItem getItem(String name);

	/**
	 * Gets whether the structure represents a collection.
	 */
	boolean isCollection();
}
