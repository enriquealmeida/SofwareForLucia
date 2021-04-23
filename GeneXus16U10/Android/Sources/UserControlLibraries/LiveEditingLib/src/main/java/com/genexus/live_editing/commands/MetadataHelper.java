package com.genexus.live_editing.commands;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.metadata.languages.Language;
import com.artech.base.metadata.loader.MetadataParser;
import com.artech.base.metadata.loader.WorkWithMetadataLoader;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.metadata.theme.TransformationDefinition;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

class MetadataHelper {
    public static void addThemeClass(@NonNull ThemeDefinition theme, @Nullable ThemeClassDefinition parentDefinition,
                                     @NonNull INodeObject newMetadata) {
        ThemeClassDefinition newDefinition = MetadataParser.readOneStyleAndChilds(theme, parentDefinition, newMetadata);
        theme.putClass(newDefinition);
    }

    public static void replaceThemeClass(@NonNull ThemeDefinition theme, @Nullable ThemeClassDefinition parentDefinition,
                                         @NonNull String previousThemeClassName, @NonNull INodeObject newMetadata) {
        theme.removeClass(previousThemeClassName);
        addThemeClass(theme, parentDefinition, newMetadata);
    }

    public static void replaceTransformation(@NonNull ThemeDefinition theme, @NonNull String transformationName,
                                             @NonNull INodeObject newMetadata) {
        theme.removeTransformation(transformationName);
        TransformationDefinition newDefinition = new TransformationDefinition(newMetadata);
        theme.putTransformation(newDefinition);
    }

    public static void replaceTranslation(@NonNull Language currentLanguage, @NonNull INodeObject newMetadata) {
        String message = newMetadata.getString("M");
        String translation = newMetadata.getString("T");

        if (Strings.hasValue(translation)) {
            currentLanguage.add(message, translation);
        } else {
            currentLanguage.remove(message);
        }
    }

    public static void replacePattern(@NonNull String objName, @NonNull INodeObject newMetadata) {
        WorkWithMetadataLoader wwLoader = new WorkWithMetadataLoader();
        WorkWithDefinition newDefinition = wwLoader.loadJSON(newMetadata);
        if (newDefinition != null) {
            newDefinition.setName(objName);
            Services.Application.putPattern(newDefinition, wwLoader, null);
        }
    }

    public static void checkCurrentThemeName(ThemeDefinition currentTheme, String targetThemeName) {
        String currentThemeName = currentTheme.getName();
        if (!Strings.areEqual(currentThemeName, targetThemeName)) {
            throw new IllegalArgumentException(String.format("Current theme is not '%s'.", targetThemeName));
        }
    }

    public static void checkCurrentLanguage(Language currentLanguage, String targetLanguageName) {
        String currentLanguageName = currentLanguage.getName();
        if (!Strings.areEqual(currentLanguageName, targetLanguageName)) {
            throw new IllegalArgumentException(String.format("Current language is not '%s'.", targetLanguageName));
        }
    }
}
