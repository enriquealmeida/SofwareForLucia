package com.artech.base.metadata.theme;

public class ThemeApplicationClassDefinition extends ThemeClassDefinition
{
	private static final long serialVersionUID = 1L;

	public static final String CLASS_NAME = "Application";

	public static final String PLACEHOLDER_IMAGE = "placeholder_image";
	public static final String PROMPT_IMAGE = "prompt_image";
	public static final String DATEPICKER_IMAGE = "datepicker_image";

	public ThemeApplicationClassDefinition(ThemeDefinition theme, ThemeClassDefinition parentClass)
	{
		super(theme, parentClass);
	}

	@Override
	public String getBackgroundColor()
	{
		return optStringProperty("background_color");
	}

	@Override
	public String getBackgroundImage()
	{
		return getImage("background_image");
	}

	public String getActionTintColor()
	{
		return optStringProperty("action_tint_color");
	}

	public String getPlaceholderImage()
	{
		return getImage("placeholder_image");
	}

	public String getPromptImage()
	{
		return getImage(PROMPT_IMAGE);
	}

	public String getDatePickerImage()
	{
		return getImage(DATEPICKER_IMAGE);
	}

	public boolean useImageLoadingIndicator()
	{
		return optBooleanProperty("image_loading_indicator");
	}
}
