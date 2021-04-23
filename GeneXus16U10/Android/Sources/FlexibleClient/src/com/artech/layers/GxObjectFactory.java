package com.artech.layers;

import androidx.annotation.NonNull;

import com.artech.application.MyApplication;
import com.artech.base.services.IGxBusinessComponent;
import com.artech.base.services.IGxProcedure;
import com.artech.base.services.Services;
import com.artech.base.synchronization.GXOfflineDatabase;
import com.artech.base.utils.ReflectionHelper;
import com.genexus.Application;
import com.genexus.GXProcedure;
import com.genexus.GXReorganization;

public class GxObjectFactory
{
	public static IGxBusinessComponent getBusinessComponent(String name)
	{
		//String className = /*getPackageName() + ".bcs." +*/ "Sdt" + name + "";
		String className = name ;
		// if has module
		if (name.contains("."))
		{
			int index = name.lastIndexOf(".");
			className = name.substring(0, index+1).toLowerCase() + "Sdt" + name.substring(index+1);
		}
		else
		{
			className = "Sdt" + className;
		}
		return createInstanceInt(IGxBusinessComponent.class, className);
	}

	public static IGxProcedure getProcedure(String name)
	{
		String className = name.toLowerCase() ;
		return createInstanceInt(IGxProcedure.class, className);
	}

	public static IGxProcedure getProcedure(@NonNull String packageName, String name)
	{
		String fullClassName = packageName + "." + name.toLowerCase() ;
		return createInstanceInt(IGxProcedure.class, fullClassName, false);
	}


	public static GXProcedure getComboValuesClass(String name)
	{
		String className = /*getPackageName() + ".procs." +*/ name.toLowerCase() + "";
		return createInstanceInt(GXProcedure.class, className);
	
	}
	
	public static GXReorganization getReorganization()
	{
		String reorName = "Reorganization";
		String offlineDatabaseName = MyApplication.getApp().getSynchronizer();
		// if has module
		if (offlineDatabaseName!=null && offlineDatabaseName.contains("."))
		{
			int index = offlineDatabaseName.lastIndexOf(".");
			offlineDatabaseName = offlineDatabaseName.substring(0,index+1).toLowerCase() + offlineDatabaseName.substring(index+1);
		}
		String className = offlineDatabaseName + "_" + reorName;
		Services.Log.debug("trying to create " + className);
		GXReorganization reorReturn = createInstanceDefault(GXReorganization.class, className);
		//for compatibility, create old reor if null
		if (reorReturn==null)
		{
			className = reorName;
			Services.Log.debug("trying to create " + className);
			reorReturn = createInstanceDefault(GXReorganization.class, className);
		}
		return reorReturn;
	}

	public static GXOfflineDatabase getSyncOfflineDatabase(String syncClassName)
	{
		return createInstanceInt(GXOfflineDatabase.class, syncClassName);
	}

	@SuppressWarnings("unused")
	private static String getPackageName()
	{
		return MyApplication.getAppContext().getPackageName();
	}


	private static <T> T createInstanceDefault(Class<T> base, String className)
	{
		String fullClassName = addAppPackageNameToClass(className);
		Class<? extends T> clazz = ReflectionHelper.getClass(base, fullClassName);
		return ReflectionHelper.createDefaultInstance(clazz, true);
	}

	private static <T> T createInstanceInt(Class<T> base, String className,  boolean addPackage)
	{
		String fullClassName = className;
		if (addPackage)
			fullClassName = addAppPackageNameToClass(className);
		Class<? extends T> clazz = ReflectionHelper.getClass(base, fullClassName);
		return ReflectionHelper.createDefaultInstance(clazz, false);
	}

	private static <T> T createInstanceInt(Class<T> base, String className)
	{
		String fullClassName = addAppPackageNameToClass(className);
		Class<? extends T> clazz = ReflectionHelper.getClass(base, fullClassName);
		return ReflectionHelper.createDefaultInstance(clazz, false);
	}

	private static String addAppPackageNameToClass(String className)
	{
		if (Application.getClientContext()!=null
					&& Application.getClientContext().getClientPreferences()!=null
					&& Services.Strings.hasValue(Application.getClientContext().getClientPreferences().getPACKAGE()))
		{
			String packageName = Application.getClientContext().getClientPreferences().getPACKAGE();
			return packageName + "." + className;
		}
		return className;
	}
}
