package com.artech.base.metadata.loader;

import android.content.Context;

import com.artech.base.metadata.DataProviderDefinition;
import com.artech.base.metadata.GxObjectDefinition;
import com.artech.base.metadata.ObjectParameterDefinition;
import com.artech.base.metadata.ProcedureDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeClassFactory;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.metadata.theme.ThemeFontFamilyDefinition;
import com.artech.base.metadata.theme.TransformationDefinition;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class MetadataParser {
	public static Connectivity readConnectivity(INodeObject obj) {
		String connectivity = obj.optString("@idConnectivitySupport");
		if (!Services.Strings.hasValue(connectivity)) {
			//read the other format
			connectivity = obj.optString("idConnectivitySupport");
		}
		if (Services.Strings.hasValue(connectivity)) {
			if (connectivity.equalsIgnoreCase("idOffline")) {
				return Connectivity.Offline;
			} else if (connectivity.equalsIgnoreCase("idOnline")) {
				return Connectivity.Online;
			}
		}
		return Connectivity.Inherit;
	}

	public static GxObjectDefinition readOneGxObject(INodeObject obj) {
		String objName = obj.getString("n");
		String objType = obj.optString("t"); // Procedure (default) or Data Provider

		GxObjectDefinition gxObject;
		if (Strings.hasValue(objType) && objType.equalsIgnoreCase("D"))
			gxObject = new DataProviderDefinition(objName);
		else
			gxObject = new ProcedureDefinition(objName);

		// Read Connectivity Support consider Inherit for old metadata without this information
		gxObject.setConnectivitySupport(readConnectivity(obj));

		for (INodeObject procParam : obj.getCollection("p")) {
			// New or old format?
			String parameterName = procParam.optString("Name");
			if (!Strings.hasValue(parameterName))
				parameterName = procParam.getString("n");

			String parameterMode = procParam.getString("m");

			ObjectParameterDefinition parDef = new ObjectParameterDefinition(parameterName, parameterMode);
			parDef.readDataType(procParam);

			gxObject.getParameters().add(parDef);
		}

		return gxObject;
	}

	public static ThemeDefinition readOneTheme(Context context, String name) {
		INodeObject theme = MetadataLoader.getDefinition(context, Strings.toLowerCase(name) + ".theme");

		if (theme != null) {
			ThemeDefinition themeDef = new ThemeDefinition(name);

			INodeObject propertiesNode = theme.optNode("Properties");
			if (propertiesNode != null) {
				String dartThemeName = MetadataLoader.getAttributeName(propertiesNode.optString("dark_theme"));
				if (dartThemeName != null)
					themeDef.setDarkTheme(readOneTheme(context, dartThemeName));
			}

			INodeCollection arrStyles = theme.optCollection("Styles");
			for (int i = 0; i < arrStyles.length(); i++) {
				INodeObject obj = arrStyles.getNode(i);
				ThemeClassDefinition classDef = readOneStyleAndChilds(themeDef, null, obj);
				themeDef.putClass(classDef);
			}

			for (INodeObject jsonTransformation : theme.optCollection("Transformations")) {
				TransformationDefinition transformation = new TransformationDefinition(jsonTransformation);
				themeDef.putTransformation(transformation);
			}

			for (INodeObject jsonFonts : theme.optCollection("Fonts")) {
				ThemeFontFamilyDefinition fontFamily = new ThemeFontFamilyDefinition(jsonFonts);
				themeDef.putFontFamily(fontFamily);
			}

			return themeDef;
		}

		return null;
	}

	public static ThemeClassDefinition readOneStyleAndChilds(ThemeDefinition theme, ThemeClassDefinition parentClass, INodeObject styleJson) {
		String className = styleJson.getString("Name");
		ThemeClassDefinition themeClass = ThemeClassFactory.createClass(theme, className, parentClass);

		themeClass.setName(className);
		themeClass.deserialize(styleJson);

		INodeCollection arrStyles = styleJson.optCollection("Styles");
		for (int i = 0; i < arrStyles.length(); i++) {
			INodeObject obj = arrStyles.getNode(i);

			ThemeClassDefinition classDef = readOneStyleAndChilds(theme, themeClass, obj);
			themeClass.getChildItems().add(classDef);
			theme.putClass(classDef);
		}

		return themeClass;
	}
}
