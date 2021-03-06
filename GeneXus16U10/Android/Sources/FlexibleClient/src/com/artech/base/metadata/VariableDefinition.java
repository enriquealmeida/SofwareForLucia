package com.artech.base.metadata;

import com.artech.base.metadata.enums.DataTypes;
import com.artech.base.serialization.INodeObject;

public class VariableDefinition extends DataItem
{
	private static final long serialVersionUID = 1L;

	public VariableDefinition(INodeObject varNode)
	{
		super(null);
		setName(varNode.getString("@Name"));
		DataItemTypeReader.readDataType(this, varNode);
	}

	public VariableDefinition(String name, boolean isCollection, StructureDefinition defSdt)
	{
		super(null);
		setName(name);
		setIsCollection(isCollection);
		setProperty("Type", DataTypes.SDT);
		setProperty("TypeName", defSdt.getName());

		setDataType(DataTypes.getDataTypeOf(getInternalProperties()));
	}

	@Override
	public boolean isVariable() { return true; }
}
