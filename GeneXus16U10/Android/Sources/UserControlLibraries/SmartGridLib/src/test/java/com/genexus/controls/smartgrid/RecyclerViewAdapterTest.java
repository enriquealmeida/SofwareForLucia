package com.genexus.controls.smartgrid;

import androidx.recyclerview.widget.RecyclerView;

import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.controllers.ViewData;
import com.artech.controls.grids.GridHelper;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import static org.hamcrest.Matchers.is;
import static org.junit.Assert.assertThat;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE)
public class RecyclerViewAdapterTest {
    private RecyclerViewAdapter mAdapter;

    @Before
    public void createView() {
        GridDefinition definition = mock(GridDefinition.class);
        RecyclerView recyclerView = mock(RecyclerView.class);
        GridHelper helper = mock(GridHelper.class);
        mAdapter = new RecyclerViewAdapter(definition, helper, recyclerView);
        setData(new EntityList());
    }

    private void setData(EntityList entities) {
        ViewData data = mock(ViewData.class);
        when(data.getEntities()).thenReturn(entities);
        mAdapter.setData(data);
    }

    @Test
    public void createViewHolder() {
//        ViewGroup view = mock(ViewGroup.class);
//        RecyclerView.ViewHolder holder = mAdapter.onCreateViewHolder(view, 0);
    }

    @Test
    public void itemCountZero() {
        assertThat(mAdapter.getItemCount(), is(0));
    }

    @Test
    public void itemCountTwo() {
        EntityList entities = new EntityList();
        Entity entity = mock(Entity.class);
        entities.addEntity(entity);
        entities.addEntity(entity);
        setData(entities);
        assertThat(mAdapter.getItemCount(), is(2));
    }
}
