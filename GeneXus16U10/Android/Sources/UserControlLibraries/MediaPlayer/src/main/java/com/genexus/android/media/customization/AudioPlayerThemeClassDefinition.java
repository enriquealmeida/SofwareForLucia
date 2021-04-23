package com.genexus.android.media.customization;

import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;

/**
 * Theme class for the Media Player playback controls.
 */
public class AudioPlayerThemeClassDefinition extends ThemeClassDefinition
{
	public static final String CLASS_NAME = "AudioController";

	public AudioPlayerThemeClassDefinition(ThemeDefinition theme, ThemeClassDefinition parentClass)
	{
		super(theme, parentClass);
	}

	public ThemeClassDefinition getMiniPlayerTitleClass()
	{
		return getRelatedClass("MiniPlayerTitleLabelClass");
	}

	public ThemeClassDefinition getMiniPlayerSubtitleClass()
	{
		return getRelatedClass("MiniPlayerSubtitleLabelClass");
	}

	public ThemeClassDefinition getMiniPlayerImageClass()
	{
		return getRelatedClass("MiniPlayerImageClass");
	}

	public ThemeClassDefinition getMiniPlayerButtonClass()
	{
		return getRelatedClass("MiniPlayerPlayPauseButtonClass");
	}

	public ThemeClassDefinition getFullScreenPlayerTitleClass()
	{
		return getRelatedClass("FullScreenPlayerTitleLabelClass");
	}

	public ThemeClassDefinition getFullScreenPlayerSubtitleClass()
	{
		return getRelatedClass("FullScreenPlayerSubtitleLabelClass");
	}

	public ThemeClassDefinition getFullScreenPlayerImageClass()
	{
		return getRelatedClass("FullScreenPlayerImageClass");
	}

	public ThemeClassDefinition getFullScreenPlayerPlayPauseButtonClass()
	{
		return getRelatedClass("FullScreenPlayerPlayPauseButtonClass");
	}

	public ThemeClassDefinition getFullScreenPlayerButtonsClass()
	{
		return getRelatedClass("FullScreenPlayerButtonsClass");
	}
}
