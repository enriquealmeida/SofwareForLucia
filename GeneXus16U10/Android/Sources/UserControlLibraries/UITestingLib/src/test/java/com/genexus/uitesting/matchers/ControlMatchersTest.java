package com.genexus.uitesting.matchers;

import android.content.Context;
import android.view.View;

import androidx.test.core.app.ApplicationProvider;
import androidx.test.filters.SmallTest;

import com.artech.android.layout.LayoutTag;
import com.artech.base.metadata.Properties;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.controls.DataBoundControl;
import com.artech.controls.GxTextView;
import com.artech.ui.Coordinator;
import com.genexus.testing.MyTestApplication;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static com.genexus.uitesting.matchers.ControlMatchers.withLabelCaption;
import static com.genexus.uitesting.matchers.ControlMatchers.withName;
import static com.genexus.uitesting.matchers.ControlMatchers.withThemeClass;
import static com.google.common.truth.Truth.assertThat;
import static org.mockito.Mockito.mock;

/**
 * Unit tests for {@link ControlMatchers}.
 */
@SmallTest
@RunWith(RobolectricTestRunner.class)
@Config(application = MyTestApplication.class)
public class ControlMatchersTest {
    private Context mContext;

    @Before
    public void setUp() {
        mContext = ApplicationProvider.getApplicationContext();
    }

    @Test
    public void withNameString() {
        String controlName = "Name1";
        LayoutItemDefinition definition = new LayoutItemDefinition(null);
        definition.setName(controlName);
        View control = new View(mContext);
        control.setTag(LayoutTag.CONTROL_GENEXUS, true);
        control.setTag(LayoutTag.CONTROL_DEFINITION, definition);

        assertThat(withName(controlName).matches(control)).isTrue();
        assertThat(withName("Name2").matches(control)).isFalse();
    }

    @Test
    public void withThemeClassString() {
        String themeClassName = "Button";
        ThemeClassDefinition themeClassDefinition = new ThemeClassDefinition(null, null);
        themeClassDefinition.setName(themeClassName);
        View control = new View(mContext);
        control.setTag(LayoutTag.CONTROL_GENEXUS, true);
        control.setTag(LayoutTag.CONTROL_THEME_CLASS, themeClassDefinition);

        assertThat(withThemeClass(themeClassName).matches(control)).isTrue();
        assertThat(withThemeClass("Attribute").matches(control)).isFalse();
    }

    @Test
    public void withLabelCaptionString() {
        String caption = "Desc1";
        Coordinator coordinator = mock(Coordinator.class);
        LayoutItemDefinition definition = new LayoutItemDefinition(null);
        definition.setCaption(caption);
        definition.setLabelPosition(Properties.LabelPositionType.LEFT);

        GxTextView labelView = new GxTextView(mContext, (LayoutItemDefinition) null);
        View editView = mock(GxTextView.class);

        DataBoundControl control = new DataBoundControl(mContext, coordinator, definition, labelView, editView, null);

        assertThat(withLabelCaption(caption).matches(control)).isTrue();
        assertThat(withLabelCaption("Desc2").matches(control)).isFalse();
    }
}
