package com.artech.android.layout;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;

import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.utils.Cast;

public class DynamicProperties extends ControlProperties
{
	private static final String DYNAMIC_PROPERTIES = "Gxdynprop";
	private static final String COLLECTION_DYNAMIC_PROPERTIES = "Gxprops_%s";

	private static final String CACHE_KEY = "com.artech.android.layout.DynamicProperties";

	public static DynamicProperties get(Entity entity)
	{
		DynamicProperties cached = Cast.as(DynamicProperties.class, entity.getCacheTag(CACHE_KEY));
		if (cached != null)
			return cached;

		DynamicProperties dynProps = new DynamicProperties();
		String props = getDynPropsString(entity);
		if (Strings.hasValue(props))
		{
			try
			{
				JSONArray values = new JSONArray(props);
				for (int i = 0; i < values.length(); i++)
				{
					JSONArray tuple = values.getJSONArray(i);
					if (tuple.length() == 3)
						parseEntry(dynProps, tuple);
				}
			}
			catch (JSONException e)
			{
				// Error parsing, properties will be ignored.
				Services.Log.warning("Error reading dynamic properties.", e);
			}
		}

		entity.setCacheTag(CACHE_KEY, dynProps);
		return dynProps;
	}

	private static String getDynPropsString(Entity entity)
	{
		// Default case: Gxdynprops variable.
		String props = Cast.as(String.class, entity.getProperty(DYNAMIC_PROPERTIES));

		// SDT collection item case: as corresponding item of Gxprops_<SDT> collection.
		if (!Strings.hasValue(props) && entity.getParentInfo().isMember() && entity.getParentInfo().getParentCollection() != null)
		{
			int index = entity.getParentInfo().getParentCollection().indexOf(entity);
			if (index != -1)
			{
				String propId = String.format(COLLECTION_DYNAMIC_PROPERTIES, Strings.toLowerCase(entity.getParentInfo().getMemberName()));
				String collectionProps = entity.getParentInfo().getParent().optStringProperty(propId);
				if (Strings.hasValue(collectionProps))
				{
					try
					{
						JSONArray collectionValues = new JSONArray(collectionProps);

						if (collectionValues.length() > index)
							props = collectionValues.getString(index);
					}
					catch (JSONException e) { }
				}
			}
		}

		return props;
	}

	private static void parseEntry(DynamicProperties dynProps, JSONArray tuple)
	{
		try
		{
			String controlName = tuple.getString(0);

			Object third = tuple.get(2);
			if (third instanceof JSONArray)
			{
				// A method call.
				String methodName = tuple.getString(1);
				JSONArray jsonParameters = (JSONArray)third;

				List<Value> methodParameters = new ArrayList<>();
				for (int i = 0; i < jsonParameters.length(); i++)
					methodParameters.add(Value.newString(jsonParameters.getString(i)));

				dynProps.putMethod(controlName, methodName, methodParameters);
			}
			else
			{
				// A property set.
				String propName = tuple.getString(1);
				String propValue = third.toString();
				dynProps.putProperty(controlName, propName, Value.newString(propValue));
			}
		}
		catch (JSONException e) { }
	}
}
