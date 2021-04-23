package com.genexus.controls.smartgrid;

import androidx.recyclerview.widget.RecyclerView;
import android.view.View;
import android.view.ViewGroup;

import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.base.model.Entity;
import com.artech.controllers.ViewData;
import com.artech.controls.grids.GridHelper;

import java.util.ArrayList;
import java.util.Collections;

public class RecyclerViewAdapter extends RecyclerView.Adapter<RecyclerViewAdapter.ViewHolder> {
    private final GridDefinition mDefinition;
    private final GridHelper mHelper;
    private ViewData mData;
    private ArrayList<Entity> mEntities;
    private ArrayList<TableDefinition> mLayout;
    private int mSelectedIndex;
    private View.OnClickListener mClickListener;

    public static final int SELECTED_INDEX_NONE = -1;

    public RecyclerViewAdapter(GridDefinition definition, GridHelper helper, GxRecyclerView recyclerView) {
        mDefinition = definition;
        mHelper = helper;
        mLayout = new ArrayList<>();
        mSelectedIndex = SELECTED_INDEX_NONE;
        mClickListener = new MyClickListener(recyclerView);
    }

    public static class ViewHolder extends RecyclerView.ViewHolder {
        public ViewHolder(View view) {
            super(view);
        }
    }

    private class MyClickListener implements View.OnClickListener {
        private GxRecyclerView mRecyclerView;

        public MyClickListener(GxRecyclerView recyclerView) {
            mRecyclerView = recyclerView;
        }

        @Override
        public void onClick(View v) {
            int itemPosition = mRecyclerView.getChildLayoutPosition(v);
            if (mDefinition.getShowSelector() == GridDefinition.ShowSelector.None) {
				selectIndex(itemPosition, true);
				mRecyclerView.scrollToPositionAfterLayout(itemPosition);
			}
            runDefaultAction(itemPosition);
        }
    }

    private void runDefaultAction(int position) {
        Entity item = getEntity(position);
        if (item != null)
            mHelper.runDefaultAction(item);
    }

    public void setData(ViewData data) {
        mData = data;
        mEntities = mData.getEntities();
        if (mDefinition.hasInverseLoad())
            Collections.reverse(mEntities);
        mHelper.clearCache();
        notifyDataSetChanged();
    }

    private boolean isSelected(int position) {
        return mSelectedIndex == position;
    }

    private Entity getSelectedItem() {
        if (mSelectedIndex >= 0 && mSelectedIndex < getItemCount())
            return getEntity(mSelectedIndex);
        else
            return null;
    }

    public Entity getEntity(int position) {
        return (mData != null ? mEntities.get(position) : null);
    }

    public int getSelectedIndex()
    {
        return mSelectedIndex;
    }

    public void selectIndex(int index, boolean fireSelectionChangedEvent)
    {
        if (mDefinition.getSelectionType() == GridDefinition.SelectionType.NoSelection) {
            // Can't select a grid item in this mode.
            return;
        }

        if (index < 0 || index >= getItemCount())
            return;

        Entity newSelection = getEntity(index);
        Entity previousSelection = getSelectedItem();

        boolean selectionChanged = false;

        if (newSelection != previousSelection)
        {
            if (!mDefinition.isMultipleSelectionEnabled()) {
                mSelectedIndex = index;
            }
            selectionChanged = true;

            if (fireSelectionChangedEvent)
                mHelper.getCoordinator().runControlEvent(mHelper.getGridView(), GridHelper.EVENT_SELECTION_CHANGED);
        }
        else
        {
            // Tapped on the selected item: Should it be deselected or remain selected?
    /*        if (mDefinition.getSelectionType() == GridDefinition.SelectionType.KeepUntilNewSelection)
            {
                mSelectedIndex = SELECTED_INDEX_NONE;
                selectionChanged = true;
            }*/
        }

        // Force a re-layout, if necessary.
        if (selectionChanged && (mHelper.hasDifferentLayoutWhenSelected(newSelection) || mHelper.hasDifferentLayoutWhenSelected(previousSelection)))
            notifyDataSetChanged();
    }

    public void deselectIndex(int index, boolean fireSelectionChangedEvent)
    {
        if (mDefinition.getSelectionType() == GridDefinition.SelectionType.NoSelection)
        {
            // Can't deselect a grid item in this mode.
            return;
        }

        if (index < 0 || index >= getItemCount())
            return;

        boolean selectionChanged;
        Entity previousSelection = getSelectedItem();

        if (mSelectedIndex != SELECTED_INDEX_NONE) {
            mSelectedIndex = SELECTED_INDEX_NONE;
            selectionChanged = true;

            if (fireSelectionChangedEvent)
                mHelper.getCoordinator().runControlEvent(mHelper.getGridView(), GridHelper.EVENT_SELECTION_CHANGED);
        } else {
            selectionChanged = false;
        }

        // Force a re-layout, if necessary.
        if (selectionChanged && mHelper.hasDifferentLayoutWhenSelected(previousSelection))
            notifyDataSetChanged();
    }

    @Override
    public int getItemViewType(int position) {
        TableDefinition table = mHelper.getLayoutFor(getEntity(position), position % 2 == 0, isSelected(position));
        for (int n = 0; n < mLayout.size(); n++) {
            if (table == mLayout.get(n)) {
                return n;
            }
        }
        mLayout.add(table);
        return mLayout.size() - 1;
    }

    @Override
    public ViewHolder onCreateViewHolder(ViewGroup viewGroup, int viewType) {
        TableDefinition table = mLayout.get(viewType);
        View view = mHelper.createNewView(table);
        view.setOnClickListener(mClickListener);
        return new ViewHolder(view);
    }

    @Override
    public void onBindViewHolder(ViewHolder viewHolder, int position) {
        mHelper.bindView(viewHolder.itemView, getEntity(position), mData, position, false);
    }

    @Override
    public int getItemCount() {
        return mEntities.size();
    }
}
