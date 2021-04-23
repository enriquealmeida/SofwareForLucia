package com.artech.base.metadata.theme;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;

import com.artech.base.utils.NameMap;

public class ThemeClassFactory
{
	private static final ArrayList<Class<? extends ThemeClassDefinition>> CLASSES;
	private static final NameMap<Class<? extends ThemeClassDefinition>> CLASSES_BY_NAME;

	static
	{
		CLASSES = new ArrayList<>();
		CLASSES_BY_NAME = new NameMap<>();

		// Known classes are registered here, though user controls may add more.
		register(ThemeApplicationClassDefinition.CLASS_NAME, ThemeApplicationClassDefinition.class);
		register(ThemeApplicationBarClassDefinition.CLASS_NAME, ThemeApplicationBarClassDefinition.class);
		register(ThemeFormClassDefinition.CLASS_NAME, ThemeFormClassDefinition.class);
		register(TabControlThemeClassDefinition.CLASS_NAME, TabControlThemeClassDefinition.class);
		register(AttributeThemeClassDefinition.CLASS_NAME, AttributeThemeClassDefinition.class);
	}

	public static void register(String className, Class<? extends ThemeClassDefinition> clazz)
	{
		CLASSES.add(clazz);
		CLASSES_BY_NAME.put(className, clazz);
	}

	public static ThemeClassDefinition createClass(ThemeDefinition theme, String className, ThemeClassDefinition parentClass)
	{
		Class<? extends ThemeClassDefinition> clazz;
		if (parentClass != null && CLASSES.contains(parentClass.getClass()))
			clazz = parentClass.getClass(); // Derived theme classes must be of the same (Java) class.
		else
			clazz = CLASSES_BY_NAME.get(className);

		if (clazz != null)
		{
			try
			{
				Constructor<? extends ThemeClassDefinition> constructor = clazz.getConstructor(ThemeDefinition.class, ThemeClassDefinition.class);
				return constructor.newInstance(theme, parentClass);
			}
			catch (InstantiationException | NoSuchMethodException | IllegalAccessException
					| InvocationTargetException e)
			{
				String errorMessage = String.format("Error creating class '%s' by reflection. Does it have the proper constructor?", clazz.getName());
				throw new IllegalArgumentException(errorMessage, e);
			}
		}
		else
			return new ThemeClassDefinition(theme, parentClass);
	}
}
