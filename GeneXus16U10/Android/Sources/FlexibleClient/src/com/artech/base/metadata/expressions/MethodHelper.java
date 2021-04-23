package com.artech.base.metadata.expressions;

import java.util.ArrayList;
import java.util.List;

import com.artech.base.metadata.expressions.Expression.Type;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.utils.DoubleMap;

class MethodHelper
{
	private static DoubleMap<String, String, Method> sMethods;

	public static Value call(Value target, String methodName, List<Value> parameters)
	{
		initMethodHelper();

		Method method = getMethod(target.getType(), methodName);
		if (method == null)
			throw new IllegalArgumentException(String.format("Unknown method %s.%s()/%s.", target.getType(), methodName, parameters.size()));

		return method.run(target, parameters);
	}

	private static Method getMethod(Type targetType, String name)
	{
		return sMethods.get(targetType.toString(), name);
	}

	private static synchronized void initMethodHelper()
	{
		if (sMethods == null)
		{
			sMethods = DoubleMap.newStringMap();
			registerMethods();
		}
	}

	private static void registerMethods()
	{
		// BOOLEAN methods.
		registerMethod(new Method(Type.BOOLEAN, "IsEmpty", "BOOLEAN::IsEmpty"));
		registerMethod(new Method(Type.BOOLEAN, "SetEmpty", "BOOLEAN::SetEmpty"));
		registerMethod(new Method(Type.BOOLEAN, "ToString", "BOOLEAN::ToString"));

		// DATE/DATETIME methods.
		registerMethod(new Method(Type.DATETIME, "AddDays", "DATETIME::AddDays"));
		registerMethod(new Method(Type.DATETIME, "AddHours", "DATETIME::AddHours"));
		registerMethod(new Method(Type.DATETIME, "AddMinutes", "DATETIME::AddMinutes"));
		registerMethod(new Method(Type.DATETIME, "AddMonths", "AddMth"));
		registerMethod(new Method(Type.DATETIME, "AddSeconds", "TAdd"));
		registerMethod(new Method(Type.DATETIME, "AddYears", "AddYr"));
		registerMethod(new Method(Type.DATETIME, "Age", "Age"));
		registerMethod(new Method(Type.DATETIME, "Day", "Day"));
		registerMethod(new Method(Type.DATETIME, "DayOfWeek", "DoW"));
		registerMethod(new Method(Type.DATETIME, "DayOfWeekName", "CDoW"));
		registerMethod(new Method(Type.DATETIME, "Difference", "TDiff"));
		registerMethod(new Method(Type.DATETIME, "EndOfMonth", "EoM"));
		registerMethod(new Method(Type.DATETIME, "Hour", "Hour"));
		registerMethod(new Method(Type.DATETIME, "IsEmpty", "DATETIME::IsEmpty"));
		registerMethod(new Method(Type.DATETIME, "Minute", "Minute"));
		registerMethod(new Method(Type.DATETIME, "Month", "Month"));
		registerMethod(new Method(Type.DATETIME, "MonthName", "CMonth"));
		registerMethod(new Method(Type.DATETIME, "Second", "Second"));
		registerMethod(new Method(Type.DATETIME, "SetEmpty", "DATETIME::SetEmpty"));
		registerMethod(new Method(Type.DATETIME, "ToDate", "DATETIME::ToDate"));
		registerMethod(new Method(Type.DATETIME, "ToString", "TtoC"));
		registerMethod(new Method(Type.DATETIME, "ToUniversalTime", "DATETIME::ToUniversalTime"));
		registerMethod(new Method(Type.DATETIME, "Year", "Year"));

		// DECIMAL/INTEGER methods.
		registerMethod(new Method(Type.DECIMAL, "Integer", "Int"));
		registerMethod(new Method(Type.DECIMAL, "IsEmpty", "DECIMAL::IsEmpty"));
		registerMethod(new Method(Type.DECIMAL, "Round", "Round"));
		registerMethod(new Method(Type.DECIMAL, "RoundToEven", "RoundToEven"));
		registerMethod(new Method(Type.DECIMAL, "SetEmpty", "DECIMAL::SetEmpty"));
		registerMethod(new Method(Type.DECIMAL, "ToString", "Str"));
		registerMethod(new Method(Type.DECIMAL, "Truncate", "Trunc"));

		// GEOPOINT methods.
		registerMethod(new Method(Type.GEOPOINT, "ToString", "GEOPOINT::ToString"));
		registerMethod(new Method(Type.GEOPOINT, "ToWKT", "GEOPOINT::ToWKT"));
		// GEOLINE methods.
		registerMethod(new Method(Type.GEOLINE, "ToString", "GEOLINE::ToString"));

		// GUID methods.
		registerMethod(new Method(Type.GUID, "IsEmpty", "GUID::IsEmpty"));
		registerMethod(new Method(Type.GUID, "SetEmpty", "GUID::SetEmpty"));
		registerMethod(new Method(Type.GUID, "ToString", "GUID::ToString"));

		// INTEGER methods.
		registerMethod(new Method(Type.INTEGER, "IsEmpty", "INTEGER::IsEmpty"));
		registerMethod(new Method(Type.INTEGER, "SetEmpty", "INTEGER::SetEmpty"));

		// STRING methods.
		registerMethod(new Method(Type.STRING, "CharAt", "STRING::CharAt"));
		registerMethod(new Method(Type.STRING, "Contains", "STRING::Contains"));
		registerMethod(new Method(Type.STRING, "EndsWith", "STRING::EndsWith"));
		registerMethod(new Method(Type.STRING, "IndexOf", "StrSearch"));
		registerMethod(new Method(Type.STRING, "IsEmpty", "STRING::IsEmpty"));
		registerMethod(new Method(Type.STRING, "IsMatch", "STRING::IsMatch"));
		registerMethod(new Method(Type.STRING, "LastIndexOf", "StrSearchRev"));
		registerMethod(new Method(Type.STRING, "Length", "Len"));
		registerMethod(new Method(Type.STRING, "PadLeft", "PadL"));
		registerMethod(new Method(Type.STRING, "PadRight", "PadR"));
		registerMethod(new Method(Type.STRING, "Replace", "StrReplace"));
		registerMethod(new Method(Type.STRING, "ReplaceRegEx", "STRING::ReplaceRegEx"));
		registerMethod(new Method(Type.STRING, "SetEmpty", "STRING::SetEmpty"));
		registerMethod(new Method(Type.STRING, "StartsWith", "STRING::StartsWith"));
		registerMethod(new Method(Type.STRING, "Substring", "SubStr"));
		registerMethod(new Method(Type.STRING, "ToLower", "Lower"));
		registerMethod(new Method(Type.STRING, "ToNumeric", "Val"));
		registerMethod(new Method(Type.STRING, "ToString", "STRING::ToString"));
		registerMethod(new Method(Type.STRING, "ToUpper", "Upper"));
		registerMethod(new Method(Type.STRING, "Trim", "Trim"));
		registerMethod(new Method(Type.STRING, "TrimEnd", "RTrim"));
		registerMethod(new Method(Type.STRING, "TrimStart", "LTrim"));
		registerMethod(new Method(Type.STRING, "RemoveDiacritics", "RemoveDiacritics"));

		// IMAGE methods. (is STRING in the expressions)
		registerMethod(new Method(Type.STRING, "FromImage", true, "IMAGE::FromImage"));
		registerMethod(new Method(Type.STRING, "FromURL", true, "IMAGE::FromURL")); // Also used for AUDIO, VIDEO and BLOBFILE

		// Static methods.
		registerMethod(new Method(Type.GUID, "Empty", true, "STATIC.GUID::Empty"));
		registerMethod(new Method(Type.GUID, "NewGuid", true, "STATIC.GUID::NewGuid"));

		// Special case: "FromString" methods. These do not atually use the target value,
		// only the parameters. They are "kinda-sorta-static" methods.
		registerMethod(new Method(Type.BOOLEAN, "FromString", true, "BOOLEAN::FROM_STRING"));
		registerMethod(new Method(Type.DATE, "FromString", true, "DATE::FROM_STRING"));
		registerMethod(new Method(Type.DATETIME, "FromString", true, "DATETIME::FROM_STRING"));
		registerMethod(new Method(Type.DECIMAL, "FromString", true, "DECIMAL::FROM_STRING"));
		registerMethod(new Method(Type.GEOPOINT, "FromString", true, "GEOPOINT::FROM_STRING"));
		registerMethod(new Method(Type.GEOLINE, "FromString", true, "GEOLINE::FROM_STRING"));
		registerMethod(new Method(Type.GUID, "FromString", true, "GUID::FROM_STRING"));
		registerMethod(new Method(Type.INTEGER, "FromString", true, "INTEGER::FROM_STRING"));
		registerMethod(new Method(Type.STRING, "FromString", true, "STRING::FROM_STRING"));
	}

	private static void registerMethod(Method method)
	{
		for (Type type : ExpressionHelper.getCompatibleTypesForType(method.mTargetType))
		{
			// Take care to not override more specific versions of this method for compatible types.
			// E.g. by registering DateTime.ToString() after Date.ToString().
			if (type == method.mTargetType ||
				sMethods.get(type.toString(), method.mMethodName) == null)
			{
				// Either exact type, or we didn't have one.
				sMethods.put(type.toString(), method.mMethodName, method);
			}
		}
	}

	private static class Method
	{
		private final Type mTargetType;
		private final String mMethodName;
		private final boolean mIsStatic;

		private final String mMappedFunction;

		private Method(Type targetType, String methodName, String mappedFunction)
		{
			this(targetType, methodName, false, mappedFunction);
		}

		private Method(Type targetType, String methodName, boolean isStatic, String mappedFunction)
		{
			mTargetType = targetType;
			mMethodName = methodName;
			mIsStatic = isStatic;
			mMappedFunction = mappedFunction;
		}

		public Value run(Value target, List<Value> parameters)
		{
			List<Value> functionParameters = new ArrayList<>();

			if (!mIsStatic)
				functionParameters.add(target);

			functionParameters.addAll(parameters);

			// Delegate to the corresponding function.
			return FunctionHelper.call(mMappedFunction, functionParameters);
		}
	}
}
