package com.artech.base.metadata.types;

import java.io.Serializable;
import java.util.List;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.DataTypeDefinition;
import com.artech.base.metadata.LevelDefinition;
import com.artech.base.metadata.StructureDataType;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.DataTypes;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;

public class SdtCollectionItemDataType extends DataTypeDefinition implements Serializable, IStructuredDataType
{
	private static final long serialVersionUID = 1L;

	private final StructureDataType mSDT;
	private final LevelDefinition mLevel;
	private final boolean mIsCollection;

	public SdtCollectionItemDataType(StructureDataType sdt) {
		this(sdt, sdt.getStructure().Root, false);
	}

	public SdtCollectionItemDataType(StructureDataType sdt, LevelDefinition level, boolean isCollection)
	{
		super(null);
		mSDT = sdt;
		mLevel = level;
		mIsCollection = isCollection;
	}

	@Override
	public String getName()
	{
		return mSDT.getName() + "." + mLevel.getCollectionItemName();
	}

	@Override
	public String getType() { return DataTypes.SDT; }

	@Override
	public StructureDefinition getStructure() { return mSDT.getStructure(); }

	@Override
	public boolean isCollection() { return mIsCollection; }

	@Override
	public List<DataItem> getItems()
	{
		return mLevel.getAttributes();
	}

	@Override
	public DataItem getItem(String name)
	{
		return mLevel.getAttribute(name);
	}

	@Override
	public int getLength() { return 0; }

	@Override
	public int getDecimals() { return 0; }

	@Override
	public boolean getSigned() { return false; }

	@Override
	public boolean getIsEnumeration() { return false; }

	@Override
	public Object getEmptyValue(boolean isCollection)
	{
		if (isCollection)
		{
			return new EntityList();
		}
		else
		{
			Entity entity;
			if (mLevel == getStructure().Root)
				entity = new Entity(getStructure());
			else
				entity = new Entity(getStructure(), mLevel, null);
			entity.initialize();
			return entity;
		}
	}
}
