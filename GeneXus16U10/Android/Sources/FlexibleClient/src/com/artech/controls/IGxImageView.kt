package com.artech.controls

import com.artech.base.metadata.enums.ImageScaleType
import com.artech.base.metadata.theme.ThemeClassDefinition

interface IGxImageView {
    fun setImagePropertiesFromThemeClass(themeClass: ThemeClassDefinition)
    fun setImageScaleType(type: ImageScaleType)
    fun setImageSize(width: Int, height: Int)
    fun hasImageDrawable(): Boolean
}
