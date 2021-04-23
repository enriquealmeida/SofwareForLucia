package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.ITypeDefinition;
import com.artech.base.metadata.enums.DataTypes;
import com.artech.base.metadata.expressions.Expression.Type;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.model.BaseCollection;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.genexus.GXutil;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * Class to implement conversions from "Expression.Value" format to and from
 * "Entity Storage" format. This should be mostly removed when entities contain
 * values of the correct type.
 */
public class ExpressionValueBridge
{
	@NonNull
	public static Type convertBasicTypeToExpressionType(@NonNull ITypeDefinition typeDefinition)
	{
		String dataType = typeDefinition.getType();
		if (dataType == null)
			throw new IllegalArgumentException(String.format("Type definition '%s' has no basic type", typeDefinition.getName()));

		if (DataTypes.isCharacter(dataType))
			return Type.STRING;
		else if (dataType.equalsIgnoreCase("boolean"))
			return Type.BOOLEAN;
		else if (dataType.equalsIgnoreCase(DataTypes.DATE))
			return Type.DATE;
		if (dataType.equalsIgnoreCase(DataTypes.DATETIME) || dataType.equalsIgnoreCase(DataTypes.DTIME))
			return Type.DATETIME;
		else if (dataType.equalsIgnoreCase(DataTypes.TIME))
			return Type.TIME;
		else if (dataType.equalsIgnoreCase(DataTypes.GUID))
			return Type.GUID;
		else if (dataType.equalsIgnoreCase("GeoPoint"))
			return Type.GEOPOINT;
		else if (dataType.equalsIgnoreCase("GeoLine"))
			return Type.GEOLINE;
		else if (DataTypes.isImage(dataType))
			return Type.IMAGE;
		else if (dataType.equalsIgnoreCase(DataTypes.AUDIO))
			return Type.AUDIO;
		else if (dataType.equalsIgnoreCase(DataTypes.VIDEO))
			return Type.VIDEO;
		else if (dataType.equalsIgnoreCase(DataTypes.BLOB))
			return Type.BLOB;
		else if (dataType.equalsIgnoreCase(DataTypes.BLOBFILE))
			return Type.BLOBFILE;
		else if (dataType.equals(DataTypes.NUMERIC))
			return (typeDefinition.getDecimals() > 0 ? Type.DECIMAL : Type.INTEGER);
		else
			throw new IllegalArgumentException("Unexpected basic data type: " + dataType);
	}

	public static Value convertEntityFormatToValue(Entity entity, String name, Type type)
	{
		// Obtain and convert value.
		Object entityValue = entity.getProperty(name);
		Value value = convertEntityFormatToValue(type, entityValue);

		// Obtain picture, if available.
		DataItem definition = getValueDefinition(entity, name);
		if (definition != null)
			value.setDefinition(definition);

		return value;
	}

	private static DataItem getValueDefinition(Entity entity, String name)
	{
		if (entity == null)
			return null;

		DataItem definition = entity.getPropertyDefinition(name);
		if (definition == null && entity.getParentInfo() != null)
			definition = getValueDefinition(entity.getParentInfo().getParent(), name);

		return definition;
	}

	static Value convertCollectionItemToValue(BaseCollection<?> collection, Object item)
	{
		return convertEntityFormatToValue(collection.getItemType(), item);
	}

	private static Value convertEntityFormatToValue(Type type, Object value)
	{
		if (value instanceof BaseCollection<?>)
		{
			// Fix type for collections.
			return new Value(Type.COLLECTION, value);
		}

		switch (type) {
			case SDT:
			case BC:
			case COLLECTION: {
				// Fix type for single SDTs.
				if (type == Type.COLLECTION && value instanceof Entity)
					type = Type.SDT;

				return new Value(type, value); // These are passed directly and can be null.
			}
			case STRING: {
				if (value != null)
					return Value.newString(value.toString());
				else
					return Value.newString("");
			}
			case INTEGER:
			case DECIMAL: {
				if (value != null) {
					String str = value.toString();
					if (str.length() > 0) { // it can be an empty string when it is the value of an empty edit control
						BigDecimal parsedValue = Services.Strings.tryParseDecimal(str);
						if (parsedValue == null)
							throw new IllegalArgumentException(String.format("Invalid %s value: '%s'.", type, str));

						return new Value(type, parsedValue);
					}
				}
				return new Value(type, BigDecimal.ZERO);
			}
			case BOOLEAN: {
				if (value != null) {
					String str = value.toString();
					Boolean parsedValue = Services.Strings.tryParseBoolean(str);
					if (parsedValue == null)
						throw new IllegalArgumentException(String.format("Invalid %s value: '%s'.", type, str));

					return Value.newBoolean(parsedValue);
				} else
					return Value.newBoolean(false);
			}
			case DATE:
			case DATETIME:
			case TIME: {
				if (value != null) {
					String str = value.toString();
					if (str.length() != 0) {
						// should use getDateTime with length for milliseconds, need another type?
						// This checks if it's time-only.
						// Unfortunately this is the only way we have to check it at this point
						Date date = str.startsWith("0001-01-01") ?
								Services.Strings.getDateTime(str, true, false)
								: Services.Strings.getDateTime(str);
						if (date == null)
							date = GXutil.nullDate();

						return new Value(type, date);
					} else
						return new Value(type, GXutil.nullDate());
				} else
					return new Value(type, GXutil.nullDate());
			}
			case GUID: {
				if (value != null)
					return Value.newGuid(UUID.fromString(value.toString()));
				else
					return Value.newGuid(new UUID(0, 0));
			}
			case GEOPOINT:
			case GEOLINE:
			case IMAGE:
			case DIRECTORY: {
				if (value != null)
					return new Value(type, value);
				else
					return new Value(type, "");
			}
			case API: {
				return new Value(type, value);
			}
			default: {
				throw new IllegalArgumentException(String.format("Unsupported type for value expression '%s'.", type));
			}
		}
	}

	public static Object convertValueToEntityFormat(Value value, DataItem type)
	{
		if (value == null || value.getValue() == null)
			return null;

		switch (value.getType())
		{
			case SDT :
			case BC :
			case COLLECTION :
			case STRING :
			case OBJECT:
				return value.getValue();

			case INTEGER :
			case DECIMAL :
				return convertNumberToEntityFormat(value, null);

			case DATE :
				return convertDateToEntityFormat(value);

			case DATETIME :
			case TIME :
				return convertDateTimeToEntityFormat(value, type);

			case BOOLEAN :
				return value.coerceToBoolean().toString();

			case GUID :
			case GEOPOINT :
			case GEOLINE :
			case IMAGE :
			case DIRECTORY:
				return value.coerceToString();

			default :
				throw new IllegalArgumentException(String.format("Unexpected value (%s) for converting to entity format.", value));
		}
	}

	public static List<Object> convertValuesToEntityFormat(List<Value> values)
	{
		List<Object> objValues = new ArrayList<>();
		for (Value v : values) {
			Object value = ExpressionValueBridge.convertValueToEntityFormat(v, null);
			objValues.add(value);
		}
		return objValues;
	}

	public static List<String> convertValuesToString(List<Value> values)
	{
		List<String> objValues = new ArrayList<>();
		for (Value v : values) {
			String value = v.coerceToString();
			objValues.add(value);
		}
		return objValues;
	}

	private static Object convertNumberToEntityFormat(Value value, DataItem dataItem)
	{
		return value.coerceToNumber().stripTrailingZeros().toPlainString();

		/* Eventually we want to do this, but we don't have the correct variable definition for most parameters.
		if (dataItem != null && dataItem.getBaseType() != null &&
			DataTypes.numeric.equalsIgnoreCase(dataItem.getBaseType().getType()) &&
			dataItem.getBaseType().getDecimals() == 0)
		{
			// Force conversion of number with decimals to integer.
			return String.valueOf(value.coerceToInt());
		}
		else
			return value.coerceToNumber().stripTrailingZeros().toPlainString();
		*/
	}

	private static Object convertDateToEntityFormat(Value value)
	{
		Date date = value.coerceToDate();
		if (GXutil.nullDate().equals(date))
			date = null;

		return Services.Strings.getDateStringForServer(date);
	}

	private static Object convertDateTimeToEntityFormat(Value value, DataItem type)
	{
		Date date = value.coerceToDate();
		if (GXutil.nullDate().equals(date))
			date = null;

		if (type != null && DataTypes.isTime(type.getType(), type.getLength()))
			// don't convert for timezone, use hour, minutes and seconds as they are.
			return Services.Strings.getDateTimeStringForServer(date, true, type.getDecimals()==12);
		else {
			// should use getDateTime with length for milliseconds, need another type?
			return Services.Strings.getDateTimeStringForServer(date);
		}
	}

}
