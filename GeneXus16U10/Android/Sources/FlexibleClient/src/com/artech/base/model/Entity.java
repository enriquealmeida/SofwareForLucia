package com.artech.base.model;

import androidx.annotation.NonNull;
import android.util.Pair;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.DataItemHelper;
import com.artech.base.metadata.LevelDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.IEntity;
import com.artech.base.services.Services;
import com.artech.base.utils.NameMap;
import com.artech.base.utils.Strings;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public class Entity extends PropertiesObject implements IEntity
{
	private static final long serialVersionUID = 1L;

	public static final int OPERATION_INSERT = 1;
	public static final int OPERATION_UPDATE = 2;
	public static final int OPERATION_DELETE = 3;
	public static final int OPERATION_INSERT_UPDATE = 4;

	public static final short JSONFORMAT_AUTO = 1;
	public static final short JSONFORMAT_INTERNAL = 2;
	public static final short JSONFORMAT_EXTERNAL = 3;


	private boolean mLoadingHeader = false;
	private String mKeyString = Strings.EMPTY;

	private EntityParentInfo mParentInfo;
	private final StructureDefinition mDefinition;
	private final LevelDefinition mLevel;

	// Data items that can be read or written, but are not part of the structure.
	private final Map<String, DataItem> mExtraMembers = new TreeMap<>(String.CASE_INSENSITIVE_ORDER);

	private OnPropertyValueChangeListener mOnPropertyValueChangeListener;

	private String mSelectionExpression;
	private boolean mIsSelected = false; // Flag used when "selection expression" is not set.

	private final transient EntitySerializer mSerializer;

	private final LinkedHashMap<String, EntityList> mLevels = new LinkedHashMap<>();

	private final NameMap<Object> mTags = new NameMap<>();
	private final NameMap<Object> mCacheTags = new NameMap<>();

	public Entity(StructureDefinition definition)
	{
		this(definition, EntityParentInfo.NONE);
	}

	Entity(StructureDefinition definition, EntityParentInfo parent)
	{
		this(definition, (definition != null ? definition.Root : null), parent);
	}

	public Entity(StructureDefinition definition, LevelDefinition level, EntityParentInfo parent)
	{
		if (level == null && definition != null)
			level = definition.Root;

		if (parent == null)
			parent = EntityParentInfo.NONE;

		mDefinition = definition;
		mLevel = level;

		mParentInfo = parent;
		mSerializer = new EntitySerializer(this);
	}

	public EntityParentInfo getParentInfo()
	{
		return mParentInfo;
	}

	public void setParentInfo(EntityParentInfo parentInfo)
	{
		if (mParentInfo.getParent() != null && mParentInfo.getParent() != parentInfo.getParent())
			Services.Log.warning("Changing Entity parent. This should never happen.");

		mParentInfo = parentInfo;
	}

	public boolean isEmpty()
	{
		return (getInternalProperties().size() == 0);
	}

	public void setExtraMembers(List<? extends DataItem> members)
	{
		mExtraMembers.clear();
		for (DataItem item : members)
			mExtraMembers.put(item.getName(), item);

		initializeMembers(members);
	}

	@Override
	public String toString()
	{
		return serialize(Entity.JSONFORMAT_INTERNAL).toString();
	}

	public String toDebugString()
	{
		return String.format("[Id=%s, Data=%s]", System.identityHashCode(this), toString());
	}

	/**
	 * Initializes all members of the entity with their "empty" values (e.g. 0 for numbers,
	 * empty string for characters, "default" Entity for inner structures).
	 */
	public void initialize()
	{
		initializeMembers(mLevel.Items);
	}

	private void initializeMembers(Iterable<? extends DataItem> members)
	{
		for (DataItem di : members)
		{
			if (baseGetProperty(di.getName()) == null)
				baseSetProperty(di.getName(), di.getEmptyValue());
		}
	}

	@Override
	public boolean setProperty(String name, Object value)
	{
		if (isSpecialProperty(name))
			return baseSetProperty(name, value);

		Pair<Entity, String> propertyContainer = resolvePropertyContainer(name, true);
		if (propertyContainer != null)
		{
			Entity innerEntity = propertyContainer.first;
			String innerName = propertyContainer.second;

			if (value instanceof Iterable && mLevel.getLevel(innerName) != null) {
				// Dataproviders offline use setProperty to set the levels, capture that case here
				// TODO: dont have support for entity list with a definition of a sub level entity.
				EntityList level = new EntityList((Iterable<Entity>) value, null);
				level.setItemType(Expression.Type.SDT);
				putLevel(innerName, level);
				return true;
			}
			else {
				// Perform conversion if necessary.
				Object propertyValue = innerEntity.mSerializer.deserializeValue(innerName, value);
				if (propertyValue != null)
					value = propertyValue;

				Object oldValue = innerEntity.baseGetProperty(innerName);
				boolean set = innerEntity.baseSetProperty(innerName, value);
				// Fire the "property value change" event if applicable.

				if (set) {
					if (mOnPropertyValueChangeListener != null && (oldValue == null || !oldValue.equals(value))) {
						mOnPropertyValueChangeListener.onPropertyValueChange(name, oldValue, value);
						innerEntity.setDirtyByChange(innerName); // dirty needed for BC media upload
					}
					innerEntity.setDirtyBySet(innerName); // dirty needed for Null Serialization
				}

				return set;
			}
		}

		// TODO: Remove this line ASAP. It's only for the chart control.
		baseSetProperty(name, value);

		Services.Log.warning(String.format("Entity.setProperty(%s, %s) failed.", name, value));
		return false;
	}

	//TODO: This function should be removed, all levels should be accessible through getProperty
	public EntityList getLevel(String name)
	{
		return mLevels.get(name);
	}

	private Object baseGetPropertyOrLevel(String name)
	{
		Object value = mLevels.get(name);
		if (value != null)
			return value;
		return baseGetProperty(name);
	}

	@Override
	public Object getProperty(String name)
	{
		if (isSpecialProperty(name))
			return baseGetProperty(name);

		if (name != null)
		{
			Pair<Entity, String> propertyContainer = resolvePropertyContainer(name, true);
			if (propertyContainer != null)
			{
				Object value = propertyContainer.first.baseGetPropertyOrLevel(propertyContainer.second);
				if (value != null)
					return value;
			}

			// TODO: Remove these lines ASAP. It's only for the chart control.
			Object valueHere = baseGetProperty(name);
			if (valueHere != null)
				return valueHere;
		}

		Services.Log.warning(String.format("Entity.getProperty(%s) failed.", name));
		return null;
	}

	/**
	 * Given an entity and a (possibly complex) property name, return the entity
	 * that "really" contains the property. May return the same entity and property name,
	 * or a subordinated entity (e.g. an SDT member) and the property name inside it.
	 */
	private Pair<Entity, String> resolvePropertyContainer(String propertyName, boolean allowGoUp)
	{
		// Variables and attributes are not distinct here, so ignore the '&'.
		propertyName = DataItemHelper.getNormalizedName(propertyName);

		// Consider properties of the type "&var.field".
		String[] propertyPath = Services.Strings.split(propertyName, '.');

		// First find if the property (actually its most immediate member) actually belongs to this entity.
		String rootProperty = propertyPath[0];
		DataItem propDefinition = getPropertyDefinition(rootProperty);
		LevelDefinition sublevel = mLevel.getLevel(rootProperty);
		if (propDefinition == null && sublevel == null)
		{
			// NOT here. So we cannot assign in this entity, or go further below if it's a composite property.
			// It MAY, however, be a parent property (e.g. assigning a form variable from a grid row context).
			// This is DISABLED if we already went down a level, because it makes no sense to look for
			// a partial expression in the parent context.
			if (allowGoUp && mParentInfo.getParent() != null)
				return mParentInfo.getParent().resolvePropertyContainer(propertyName, true);

			// Failure. Property unknown here, and we don't have a parent to check.
			return null;
		}

		if (propertyPath.length == 1)
		{
			// Simple property, the current entity is the correct one.
			return new Pair<>(this, propertyName);
		}
		else
		{
			// Compound property. Find the entity of the first level and go recursively down.
			Object component = baseGetPropertyOrLevel(propertyPath[0]);
			if (component != null)
			{
				// Build the *remaining* path into an ArrayList, to ease manipulation.
				ArrayList<String> rest = new ArrayList<>();
				rest.addAll(Arrays.asList(propertyPath).subList(1, propertyPath.length));

				if (component instanceof Entity)
				{
					// A single item. Go recursively.
					return ((Entity)component).resolvePropertyContainer(Services.Strings.join(rest, Strings.DOT), false);
				}
				else if (component instanceof EntityList)
				{
					// A collection item. Go recursively.
					EntityList list = (EntityList)component;

					// The following term in the expression MUST be a collection item selector, either
					// an explicit indexer (item(<n>)) or the enumeration position (CurrentItem).
					String itemSelector = rest.get(0);
					rest.remove(0);

					Entity item = null;
					if (itemSelector.equalsIgnoreCase(BaseCollection.PROPERTY_CURRENT_ITEM))
					{
						item = list.getCurrentItem();
					}
					else if (Strings.toLowerCase(itemSelector).contains(Strings.toLowerCase(BaseCollection.METHOD_GET_ITEM)))
					{
						String itemIndexStr = Strings.toLowerCase(itemSelector).replace(Strings.toLowerCase(BaseCollection.METHOD_GET_ITEM), Strings.EMPTY)
							.replace("(", Strings.EMPTY).replace(")", Strings.EMPTY);

						int itemIndex = Services.Strings.tryParseInt(itemIndexStr, 0) - 1; // GX is 1-based.
						if (itemIndex >= 0 && itemIndex < list.size())
							item = list.get(itemIndex);
					}

					if (item == null)
					{
						Services.Log.warning(String.format("Could not get collection item with selector '%s'.", itemSelector));
						return null;
					}

					return item.resolvePropertyContainer(Services.Strings.join(rest, Strings.DOT), false);
				}
				else
					return null; // Unknown component found.
			}
			else
				return null; // Component not found.
		}
	}

	public DataItem getPropertyDefinition(String name)
	{
		// Variables and attributes are not distinct here, so ignore the '&'.
		name = DataItemHelper.getNormalizedName(name);

		// First look up in structure.
		DataItem member = mLevel.getAttribute(name);
		if (member != null)
			return member;

		// Then look up in "extra members" (i.e. variables).
		member = mExtraMembers.get(name);
		if (member != null)
			return member;

		// Then look in member without parent (i.e. secondary grid level)
		member = mLevel.getLevel(name);
		if (member != null && ((LevelDefinition)member).getNoParentLevel())
			return member;

		return null;
	}

	private static boolean isSpecialProperty(String name)
	{
		return (name != null &&
				(name.equalsIgnoreCase("gx_md5_hash") ||
				 name.equalsIgnoreCase("gxdynprop") ||
				 name.equalsIgnoreCase("gxdyncall") ||
				 Strings.starsWithIgnoreCase(name, "Gxprops_")));
	}

	/**
	 * Calls super.setProperty(), without trying to parse property name to find components.
	 */
	private boolean baseSetProperty(String name, Object value)
	{
		return super.setProperty(name, value);
	}

	/**
	 * Calls super.getProperty(), without trying to parse property name to find components.
	 */
	private Object baseGetProperty(String name)
	{
		return super.getProperty(name);
	}

	public void movePropertiesFrom(Entity other, Iterable<DataItem> itemsToCopy)
	{
		for (DataItem item : itemsToCopy)
		{
			Object itemValue = other.baseGetProperty(item.getName());
			if (itemValue != null) {
				baseSetProperty(item.getName(), itemValue);
				if (itemValue instanceof EntityList) {
					EntityParentInfo parentInfo = null;
					for (Entity entityItem : (EntityList)itemValue) {
						if (parentInfo == null) {
							parentInfo = EntityParentInfo.collectionMemberOf(this, entityItem.getParentInfo().getMemberName(), entityItem.getParentInfo().getParentCollection());
							if (!itemValue.equals(entityItem.getParentInfo().getParentCollection())){
								Services.Log.warning("Incorrect EntityList parent collection. This should never happen.");
							}
						}
						entityItem.mParentInfo = parentInfo;
					}
				}
			}
		}
	}

	public void load(INodeObject obj)
	{
		if (obj != null)
			deserialize(obj);
	}

	public void loadHeader(INodeObject obj)
	{
		mLoadingHeader = true;
		deserialize(obj);
		mLoadingHeader = false;
	}

	private boolean hasLevel(String name)
	{
		if (mLevel!=null)
		{
			for (int j = 0; j < mLevel.Levels.size(); j++)
			{
				LevelDefinition level = mLevel.Levels.get(j);
				if (name.equalsIgnoreCase(level.getName()))
					return true;
			}
		}
		return false;
	}

	@Override
	public void deserialize(INodeObject obj)
	{
		deserialize(obj, JSONFORMAT_AUTO);
	}

	// auto try both format, internal only use only internal name, external only external name
	public void deserialize(INodeObject obj, short jsonFormat)
	{
		if (obj == null)
			return;

		// Deserialize first level, including complex variables, but not levels.
		for (String jsonName : obj.names())
		{
			if (hasLevel(jsonName))
				continue;

			DataItem di = null;
			if (mDefinition != null)
			{
				if (jsonFormat==JSONFORMAT_AUTO)
				{
					di = mDefinition.getAttribute(jsonName);
					if (di==null)
						di = mDefinition.getAttributeByExternalName(jsonName);
				}
				else if (jsonFormat==JSONFORMAT_INTERNAL)
				{
					di = mDefinition.getAttribute(jsonName);
				}
				else if (jsonFormat==JSONFORMAT_EXTERNAL)
				{
					di = mDefinition.getAttributeByExternalName(jsonName);
				}
			}

			if (di != null)
				deserializeValue(di.getName(), obj.get(jsonName));
			else // Get extra values for example gx_md5_hash when changing a BC in WWD.  Before it was ignored everything for those without definition, usefull for BC that have extra fields, but now those extra numeric fields are read as string.
				setProperty(jsonName, obj.getString(jsonName));
		}

//		if (mLoadingHeader) // More than the header is needed for loading nested grids from the same dataprovider
//			return;			// Since there was no clear need to only load the header, this was commented

		boolean hasNoParentLevel = false;
		for (int j = 0; j < mLevel.Levels.size(); j++) {
			LevelDefinition level = mLevel.Levels.get(j);
			if (level.isCollection()) {
				INodeCollection entities = obj.optCollection(level.getName());

				EntityList items = new EntityList();
				items.setItemType(Expression.Type.SDT); // deserialize() is only called for SDT
				if (entities != null) {
					int lenEntities = entities.length();
					for (int i = 0; i < lenEntities; i++) {
						INodeObject entityJson = entities.getNode(i);
						if (entityJson != null) {
							Entity entity;
							if (level.getNoParentLevel()) {
								entity = new Entity(mDefinition, level, EntityParentInfo.NONE);
								hasNoParentLevel = true;
							}
							else {
								entity = new Entity(mDefinition, level, EntityParentInfo.collectionMemberOf(this, level.getName(), items));
							}
							entity.deserialize(entityJson, jsonFormat);
							items.addEntity(entity);
						}
					}
				}
				putLevel(level.getName(), items);
			}
			else {
				INodeObject node = obj.optNode(level.getName());
				Entity entity = new Entity(mDefinition, level, EntityParentInfo.memberOf(this, level.getName()));
				entity.deserialize(node, jsonFormat);
				setProperty(level.getName(), entity);
			}
		}
		if (!hasNoParentLevel && mLevel.Levels.size() > 0) {
			Services.Log.error("EntityDeserialize", "Found level in only header case");
		}
	}

	public void putLevel(String levelName, EntityList items)
	{
		mLevels.put(levelName, items);
	}

	public boolean deserializeValue(String name, Object value)
	{
		Object propertyValue = mSerializer.deserializeValue(name, value);
		if (propertyValue != null)
		{
			// We already know that this is the proper entity and value has been converted, so just assign it.
			baseSetProperty(name, propertyValue);
			return true;
		}
		else
			return false;
	}

	/**
	 * Gets the entity keys
	 * @return String with entity keys concatenated
	 * */
	public String getKeyString()
	{
		if (mKeyString == null || mKeyString.length() == 0)
		{
			ArrayList<String> keys = new ArrayList<>();
			if (mLevel != null)
			{
				for(DataItem keyAtt : mLevel.getKeys())
					keys.add((String)getProperty(keyAtt.getName()));

				mKeyString = Services.Strings.join(keys, Strings.COMMA);
			}
		}
		return mKeyString;
	}

	public List<String> getKey()
	{
		ArrayList<String> keys = new ArrayList<>();
		for (DataItem att : mDefinition.Root.getKeys())
			keys.add((String)getProperty(att.getName()));

		return keys;
	}

	public void setKey(List<String> keys)
	{
		List<DataItem> keysList = mDefinition.Root.getKeys();

		for(int i = 0; i < keysList.size(); i++)
		{
			DataItem att = keysList.get(i);
			if (keys.size() > i)
				setProperty(att.getName(), keys.get(i));
		}
	}

	public StructureDefinition getDefinition()
	{
		return mDefinition;
	}

	public LevelDefinition getLevel()
	{
		return mLevel;
	}

	// auto and internal only use only internal name for now (use internal for clarify), external only use external name
	@NonNull
	public INodeObject serialize(short jsonFormat)
	{
		INodeObject obj = Services.Serializer.createNode();

		// serialize only first level
		for (String key : getPropertyNames())
		{
			DataItem itemDefinition = mLevel.getAttribute(key);
			LevelDefinition sublevel = mLevel.getLevel(key);

			// ignore att that doesn't exist in the structure definition.
			if (!key.equalsIgnoreCase("gx_md5_hash") && itemDefinition == null && (sublevel == null || sublevel.isCollection()))
			{
				if (getPropertyDefinition(key) == null && !mLevels.containsKey(key)) // Only warn if it's not a variable or level.
					Services.Log.warning("entitySerialize", key + " is not present in the structure");

				continue;
			}

			if (mLevels.containsKey(key))
				continue;

			String serializedKey = key;
			if (jsonFormat==JSONFORMAT_EXTERNAL && itemDefinition != null)
				serializedKey = itemDefinition.getExternalName();

			Object value = getProperty(key);

			// in external format, do not write empty collections or not set values with JsonSerialize NoProperty
			if (jsonFormat==JSONFORMAT_EXTERNAL && itemDefinition != null)
			{
				boolean jsonNoProperty;
				if (itemDefinition.getJsonNullSerialization() == null)
					jsonNoProperty = itemDefinition.isCollection(); // compatibility default
				else
					jsonNoProperty = itemDefinition.getJsonNullSerialization().equalsIgnoreCase("idJsonNoProperty");
				if (jsonNoProperty) {
					if (itemDefinition.isCollection()) {
						if (value instanceof BaseCollection) {
							BaseCollection valueC = (BaseCollection) value;
							if (valueC.isEmpty())
								continue;
						}
					} else if (!isDirtyBySet(key)) {
						continue;
					}
				}
			}

			if (value instanceof Entity) {
				INodeObject innerNode = ((Entity)value).serialize(jsonFormat);
				obj.put(serializedKey, innerNode);
			}
			else if (value instanceof BaseCollection) {
				INodeCollection innerCollection = ((BaseCollection)value).serialize(jsonFormat);
				obj.put(serializedKey, innerCollection);
			}
			else {
				obj.put(serializedKey, value);
			}
		}

		// Serialize sub levels
		for (Map.Entry<String, EntityList> level : mLevels.entrySet()) {
			INodeCollection arrayLines = Services.Serializer.createCollection();
			for (Entity entity : level.getValue())
			{
				INodeObject objLine = entity.serialize(jsonFormat);
				arrayLines.put(objLine);
			}

			obj.put(level.getKey(), arrayLines);
		}

		// in external format, write empty levels with JsonSerialize Empty
		if (jsonFormat==JSONFORMAT_EXTERNAL) {
			for (LevelDefinition levelDefinition : mLevel.Levels) {
				if (mLevels.get(levelDefinition.getName()) == null
						&& levelDefinition.getJsonNullSerialization().equalsIgnoreCase("idJsonEmpty")) {
					INodeCollection arrayLines = Services.Serializer.createCollection();
					obj.put(levelDefinition.getName(), arrayLines);
				}
			}
		}

		return obj;
	}

	public boolean isSelected()
	{
		if (Services.Strings.hasValue(mSelectionExpression))
			return optBooleanProperty(mSelectionExpression);
		else
			return mIsSelected;
	}

	public void setIsSelected(boolean value)
	{
		if (Services.Strings.hasValue(mSelectionExpression))
			setProperty(mSelectionExpression, value);
		else
			mIsSelected = value;
	}

	public void setSelectionExpression(String expression)
	{
		mSelectionExpression = expression;
	}

	public interface OnPropertyValueChangeListener
	{
		void onPropertyValueChange(String propertyName, Object oldValue, Object newValue);
	}

	public void setOnPropertyValueChangeListener(OnPropertyValueChangeListener listener)
	{
		mOnPropertyValueChangeListener = listener;
	}

	public Object getTag(String key)
	{
		return mTags.get(key);
	}

	public void setTag(String key, Object value)
	{
		mTags.put(key, value);
	}

	public Object getCacheTag(String key)
	{
		return mCacheTags.get(key);
	}

	public void setCacheTag(String key, Object value)
	{
		mCacheTags.put(key, value);
	}

	public void clearCacheTags() {
		mCacheTags.clear();

		for (Object value : getPropertyValues()) {
			if (value instanceof Entity) {
				((Entity)value).clearCacheTags();
			}
			else if (value instanceof Collection<?>) {
				for (Object element : (Collection<?>)value) {
					if (element instanceof Entity)
						((Entity)element).clearCacheTags();
				}
			}
		}
	}
}
