package com.genexus.uitesting.matchers;


import com.artech.base.metadata.DashboardItem;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.fragments.GridContainer;
import com.genexus.testing.MyTestApplication;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static com.genexus.uitesting.matchers.DataMatchers.withItemCount;
import static com.genexus.uitesting.matchers.DataMatchers.withMenuItemTitle;
import static com.genexus.uitesting.matchers.DataMatchers.withTextInRow;
import static com.google.common.truth.Truth.assertThat;
import static org.hamcrest.Matchers.greaterThan;
import static org.hamcrest.Matchers.lessThan;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

/**
 * Unit tests for {@link DataMatchers}.
 */
@RunWith(RobolectricTestRunner.class)
@Config(application = MyTestApplication.class)
public class DataMatchersTest {

    @Test
    public void withTextInRowString() {
        String text1 = "SampleText1";
        String text2 = "SampleText2";

        Entity item = new Entity(StructureDefinition.EMPTY);
        item.setProperty("PropName1", text1);

        assertThat(withTextInRow(text1).matches(item)).isTrue();
        assertThat(withTextInRow(text2).matches(item)).isFalse();
    }

    @Test
    public void withMenuItemTitleString() {
        String text1 = "SampleText1";
        String text2 = "SampleText2";

        DashboardItem item = new DashboardItem(null);
        item.setTitle(text1);

        assertThat(withMenuItemTitle(text1).matches(item)).isTrue();
        assertThat(withMenuItemTitle(text2).matches(item)).isFalse();
    }

    @Test
    public void withItemCountInt() {
        EntityList data = mock(EntityList.class);
        when(data.size()).thenReturn(10);

        GridContainer view = mock(GridContainer.class);
        when(view.getData()).thenReturn(data);

        assertThat(withItemCount(10).matches(view)).isTrue();
        assertThat(withItemCount(lessThan(11)).matches(view)).isTrue();
        assertThat(withItemCount(greaterThan(9)).matches(view)).isTrue();
    }
}
