package com.artech.externalapi;

@SuppressWarnings({"InconsistentCapitalization", "checkstyle:MemberName"})
public class ExternalApiDefinition
{
	public ExternalApiDefinition(String name, Class<? extends ExternalApi> clazz)
	{
		Name = name;
		mClass = clazz;
	}

	public final String Name;
	public final Class<? extends ExternalApi> mClass;
}
