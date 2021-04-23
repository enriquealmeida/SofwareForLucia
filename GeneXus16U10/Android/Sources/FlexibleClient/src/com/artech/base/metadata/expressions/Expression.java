package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import com.artech.base.application.OutputResult;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.BaseCollection;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.utils.Cast;
import com.genexus.GXutil;

public interface Expression extends Serializable {
	@NonNull Value eval(IExpressionContext context);

	void values(@NonNull HashMap<String, DataType> nameTypes);

	enum Type {
		UNKNOWN,
		STRING,
		INTEGER,
		DOUBLE,
		DECIMAL,
		BOOLEAN,
		DATE,
		DATETIME,
		TIME,
		GUID,
		GEOPOINT,
		GEOLINE,
		IMAGE,
		AUDIO,
		VIDEO,
		BLOB,
		BLOBFILE,
		CONTROL,
		SDT,
		BC,
		ENTITYLIST,
		COLLECTION,
		PANEL,
		API,
		DIRECTORY,
		OBJECT, // for values whose type cann't be resolved but can be resolved later
		WAIT, // ActionResult.SUCCESS_WAIT
		FAIL; // ActionResult.FAILURE

		boolean isNumeric() {
			return (this == DECIMAL || this == INTEGER);
		}

		boolean isDateTime() {
			return (this == DATE || this == DATETIME || this == TIME);
		}

		boolean isSimple() {
			return (this == STRING || this == INTEGER || this == DECIMAL || this == BOOLEAN ||
					this == DATE || this == DATETIME || this == TIME || this == GUID ||
					this == GEOPOINT || this == GEOLINE ||this == IMAGE || this == AUDIO || this == VIDEO ||
					this == BLOB|| this == BLOBFILE );
		}

		boolean isParameterized() {
			return (this == COLLECTION);
		}
	}

	class Value {
		private final Object mValue;
		private final Type mType;

		private DataItem mDefinition;
		private String mPicture;

		public Value(Type type, Object value) {
			mType = type;
			mValue = value;
		}

		private static Value tryNewValue(Object value) {
			if (value instanceof String)
				return newString((String) value);
			else if (value instanceof Integer)
				return newInteger((Integer) value);
			else if (value instanceof BigDecimal)
				return newDecimal((BigDecimal) value);
			else if (value instanceof Boolean)
				return newBoolean((Boolean) value);
			else if (value instanceof ThemeClassDefinition)
				return newString(((ThemeClassDefinition) value).getName()); // Because theme classes can be compared by equality on their names.
			else if (value instanceof Entity)
				return newSdt((Entity) value); // Use sdt because this are the case of external object return
			else if (value instanceof Collection<?>)
				return new Value(Expression.Type.COLLECTION, value); // i.e. Offline procedure that returns a collection of SDT (it uses LinkedList)
			else
				return null;
		}

		public static Value newValueObject(Object objValue) {
			Value value = tryNewValue(objValue);
			if (value != null)
				return value;
			else
				return new Value(Type.OBJECT, objValue);
		}

		public static Value newValue(Object objValue) {
			Value value = tryNewValue(objValue);
			if (value != null)
				return value;
			else
				throw new IllegalArgumentException(String.format("Could not guess value type for '%s'.", objValue));
		}

		public static Value newString(String value) {
			if (value == null)
				value = Strings.EMPTY;

			return new Value(Type.STRING, value);
		}

		public static Value newDirectory(String value) {
			if (value == null)
				value = Strings.EMPTY;

			return new Value(Type.DIRECTORY, value);
		}

		public static Value newInteger(long value) {
			return new Value(Type.INTEGER, new BigDecimal(value));
		}

		public static Value newDouble(double value) {
			return new Value(Type.DOUBLE, value);
		}

		public static Value newDecimal(BigDecimal value) {
			return new Value(Type.DECIMAL, value);
		}

		public static Value newBoolean(boolean value) {
			return new Value(Type.BOOLEAN, value);
		}

		public static Value newCollection(BaseCollection<?> value) {
			return new Value(Type.COLLECTION, value);
		}

		public static Value newGuid(UUID value) {
			return new Value(Type.GUID, value);
		}

		public static Value newSdt(Entity value) {
			return new Value(Type.SDT, value);
		}

		public static Value newBC(Entity value) {
			return new Value(Type.BC, value);
		}

		public static Value newEntityList(EntityList value) {
			return new Value(Type.ENTITYLIST, value);
		}

		public static Value newFail(OutputResult result) {
			return new Value(Type.FAIL, result);
		}

		@Override
		public String toString() {
			return String.format("[%s: %s]", mType, mValue);
		}

		public DataItem getDefinition() {
			return mDefinition;
		}

		public String getPicture() {
			if (!Strings.hasValue(mPicture))
				mPicture = ExpressionFormatHelper.getDefaultPicture(this);

			return mPicture;
		}

		public void setDefinition(DataItem definition) {
			mDefinition = definition;
			mPicture = definition.getInputPicture();
		}

		public void setPicture(String picture) {
			mPicture = picture;
		}

		public String coerceToString() {
			return mValue.toString();
		}

		public BigDecimal coerceToNumber() {
			if (mValue instanceof String)
				return Services.Strings.tryParseDecimal((String) mValue);

			BigDecimal value = (BigDecimal) mValue;
			if (mType == Type.INTEGER)
				return new BigDecimal(value.longValue());
			else
				return value;
		}

		public double coerceToDouble(double defaultValue) {
			if (mValue instanceof String)
				return Services.Strings.tryParseDouble((String) mValue, defaultValue);

			if (mValue instanceof BigDecimal)
				return ((BigDecimal) mValue).doubleValue();

			return (double) mValue;
		}

		public int coerceToInt() {
			return coerceToInteger(0);
		}

		public int coerceToInteger(int defaultValue) {
			if (mValue instanceof String)
				return Services.Strings.tryParseInt((String) mValue, defaultValue);

			return ((BigDecimal) mValue).intValue();
		}

		public Boolean coerceToBoolean() {
			if (mValue instanceof String)
				return Services.Strings.tryParseBoolean((String) mValue, false);

			if (mValue instanceof BigDecimal)
				return ((BigDecimal) mValue).intValue() != 0;

			return (Boolean) mValue;
		}

		public Date coerceToDate() {
			Date value = (Date) mValue;
			if (mType == Type.DATE)
				return GXutil.resetTime(value);
			else if (mType == Type.TIME)
				return GXutil.resetDate(value);
			else
				return value;
		}

		public UUID coerceToGuid() {
			return (UUID) mValue;
		}

		public Entity coerceToEntity() {
			if (mValue instanceof EntityList && ((EntityList) mValue).size() != 0)
				return ((EntityList) mValue).get(0);

			return (Entity) mValue;
		}

		public EntityList coerceToEntityList() {
			return Cast.as(EntityList.class, mValue);
		}

		public BaseCollection<?> coerceToCollection() {
			return (BaseCollection) mValue;
		}

		public OutputResult coerceToOutputResult() {
			return (OutputResult) mValue;
		}

		public Type getType() {
			return mType;
		}

		public Object getValue() {
			return mValue;
		}

		public static final Value UNKNOWN = new Value(Type.UNKNOWN, null);
		public static final Value WAIT = new Value(Type.WAIT, null);
		public static final Value FAIL = new Value(Type.FAIL, null);

		public boolean mustReturn() {
			return mType == Type.WAIT || mType == Type.FAIL;
		}
	}
}
