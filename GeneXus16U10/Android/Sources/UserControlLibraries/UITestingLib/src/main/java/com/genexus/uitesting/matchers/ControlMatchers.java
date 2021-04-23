package com.genexus.uitesting.matchers;

import android.view.View;

import androidx.annotation.NonNull;
import androidx.test.espresso.matcher.BoundedMatcher;

import com.artech.android.layout.LayoutTag;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.controls.DataBoundControl;
import com.artech.controls.IGxEdit;
import com.genexus.uitesting.utils.GenexusModel;

import org.hamcrest.Description;
import org.hamcrest.Matcher;
import org.hamcrest.TypeSafeMatcher;

import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.equalToIgnoringCase;

public class ControlMatchers {
    /**
     * Returns a matcher that matches {@link com.artech.controls.IGxControl} based on its control
     * name. The match for the name is <b>case insensitive</b>.
     * <p>
     * Note: Sugar for withName(equalToIgnoringCase("string")).
     */
    public static Matcher<View> withName(@NonNull final String name) {
        return withName(equalToIgnoringCase(name));
    }

    /**
     * Returns a matcher that matches {@link com.artech.controls.IGxControl} based on its control
     * name.
     */
    public static Matcher<View> withName(@NonNull final Matcher<String> stringMatcher) {
        return new TypeSafeMatcher<View>() {

            @Override
            public void describeTo(Description description) {
                description.appendText("with control name: ");
                stringMatcher.describeTo(description);
            }

            @Override
            protected boolean matchesSafely(View view) {
                if (!GenexusModel.isGenexusControl(view)) {
                    return false;
                }

                LayoutItemDefinition definition = (LayoutItemDefinition) view.getTag(LayoutTag.CONTROL_DEFINITION);

                if (definition == null) {
                    return false;
                }

                String controlName = definition.getName();

                return stringMatcher.matches(controlName);
            }
        };
    }

    /**
     * Returns a matcher that matches {@link com.artech.controls.IGxControl} based on the theme
     * class name it has assigned. The match for the name is <b>case insensitive</b>.
     * <p>
     * Note: Sugar for withThemeClass(equalTo("string")).
     */
    public static Matcher<View> withThemeClass(@NonNull final String name) {
        return withThemeClass(equalToIgnoringCase(name));
    }

    /**
     * Returns a matcher that matches {@link com.artech.controls.IGxControl} based on the theme
     * class name it has assigned.
     */
    public static Matcher<View> withThemeClass(@NonNull final Matcher<String> stringMatcher) {
        return new TypeSafeMatcher<View>() {

            @Override
            public void describeTo(Description description) {
                description.appendText("with theme class: ");
                stringMatcher.describeTo(description);
            }

            @Override
            protected boolean matchesSafely(View view) {
                if (!GenexusModel.isGenexusControl(view)) {
                    return false;
                }

                Object themeClassTag = view.getTag(LayoutTag.CONTROL_THEME_CLASS);

                if (!(themeClassTag instanceof ThemeClassDefinition)) {
                    return false;
                }

                ThemeClassDefinition themeClassDefinition = (ThemeClassDefinition) themeClassTag;

                return stringMatcher.matches(themeClassDefinition.getName());
            }
        };
    }

    /**
     * Returns a matcher that matches {@link DataBoundControl} based on its caption string value.
     * The match for the name is <b>case sensitive</b>.
     * <p>
     * Note: Sugar for withLabelCaption(equalTo("string")).
     */
    public static Matcher<View> withLabelCaption(@NonNull final String label) {
        return withLabelCaption(equalTo(label));
    }

    /**
     * Returns a matcher that matches {@link DataBoundControl} based on its caption string value.
     */
    public static Matcher<View> withLabelCaption(@NonNull final Matcher<String> stringMatcher) {
        return new BoundedMatcher<View, DataBoundControl>(DataBoundControl.class) {

            @Override
            public void describeTo(Description description) {
                description.appendText("with control label: ");
                stringMatcher.describeTo(description);
            }

            @Override
            protected boolean matchesSafely(DataBoundControl control) {
                return stringMatcher.matches(control.getLabel().getText().toString());
            }
        };
    }

    /**
     * Returns a matcher that matches {@link IGxEdit} based on its control value.
     * <p>
     * Note: Sugar for withControlValue(equalTo("string")).
     */
    public static Matcher<View> withControlValue(@NonNull final String value) {
        return withControlValue(equalTo(value));
    }

    /**
     * Returns a matcher that matches {@link IGxEdit} based on its control value.
     */
    public static Matcher<View> withControlValue(@NonNull final Matcher<String> stringMatcher) {
        return new BoundedMatcher<View, View>(View.class) {

            @Override
            public void describeTo(Description description) {
                description.appendText("with control value: ");
                stringMatcher.describeTo(description);
            }

            @Override
            protected boolean matchesSafely(View view) {
                if (!(view instanceof IGxEdit)) {
                    return false;
                }
                IGxEdit control = (IGxEdit) view;
                return stringMatcher.matches(control.getGxValue());
            }
        };
    }
}
