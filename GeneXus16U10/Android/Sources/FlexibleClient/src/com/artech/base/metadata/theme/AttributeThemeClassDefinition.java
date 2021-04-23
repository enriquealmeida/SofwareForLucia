package com.artech.base.metadata.theme;

/**
 * Theme class for TabControl control.
 */
public class AttributeThemeClassDefinition extends ThemeClassDefinition
{
	static final String CLASS_NAME = "Attribute";

	// Cached properties (most accessed, or slowest).
	private String mInviteMessageColor;


	public AttributeThemeClassDefinition(ThemeDefinition theme, ThemeClassDefinition parentClass)
	{
		super(theme, parentClass);
	}

	public String getInviteMessageColor()
	{
		if (mInviteMessageColor == null)
			mInviteMessageColor = optStringProperty("invitemessage_color");

		return mInviteMessageColor;
	}

}
