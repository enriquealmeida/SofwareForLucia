package com.artech.base.metadata.theme;

public class ThemeApplicationBarClassDefinition extends ThemeClassDefinition
{
	private static final long serialVersionUID = 1L;

	public static final String CLASS_NAME = "ApplicationBars";

	public ThemeApplicationBarClassDefinition(ThemeDefinition theme, ThemeClassDefinition parentClass)
	{
		super(theme, parentClass);
	}

	public String getTitleImage()
	{
		return getImage("title_image");
	}

	public String getIcon()
	{
		return getImage("application_bar_icon");
	}

	public String getStatusBarColor()
	{
		return optStringProperty("status_bar_color");
	}
}
