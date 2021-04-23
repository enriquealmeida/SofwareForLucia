package com.artech.base.metadata.theme;

import com.artech.base.metadata.DimensionValue;

public class ThemeFormClassDefinition extends ThemeClassDefinition
{
	private static final long serialVersionUID = 1L;

	static final String CLASS_NAME = "Form";

	private TargetSize mTargetSize;

	public ThemeFormClassDefinition(ThemeDefinition theme, ThemeClassDefinition parentClass)
	{
		super(theme, parentClass);
	}

	public String getCallType()
	{
		return optStringProperty("call_type");
	}

	public String getEnterEffect()
	{
		return optStringProperty("enter_effect");
	}

	public String getExitEffect()
	{
		return optStringProperty("close_effect");
	}

	public String getTargetName()
	{
		return optStringProperty("target_name");
	}

	public TargetSize getTargetSize()
	{
		if (mTargetSize == null)
		{
			String size = optStringProperty("target_size");
			String width = optStringProperty("target_width");
			String height = optStringProperty("target_height");

			mTargetSize = new TargetSize(size, DimensionValue.parse(width), DimensionValue.parse(height));
		}

		return mTargetSize;
	}

	/**
	 * Form size (for Popup and Callout types).
	 */
	@SuppressWarnings({"InconsistentCapitalization", "checkstyle:MemberName"})
	public static class TargetSize
	{
		public final String Name;
		public final DimensionValue CustomWidth;
		public final DimensionValue CustomHeight;

		public static final String SIZE_DEFAULT = "gx_default";
		public static final String SIZE_SMALL = "small";
		public static final String SIZE_MEDIUM = "medium";
		public static final String SIZE_LARGE = "large";
		public static final String SIZE_CUSTOM = "custom";

		private TargetSize(String name, DimensionValue customWidth, DimensionValue customHeight)
		{
			Name = name;
			CustomWidth = customWidth;
			CustomHeight = customHeight;
		}

		@Override
		public String toString()
		{
			return String.format("%s (%s * %s)", Name, CustomWidth, CustomHeight);
		}
	}
}
