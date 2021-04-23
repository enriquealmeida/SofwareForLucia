package com.genexus.controls.smartgrid;

import android.content.Context;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.controllers.ViewData;
import com.artech.controls.IGridView;
import com.artech.controls.IGxThemeable;
import com.artech.controls.grids.GridHelper;
import com.artech.ui.Coordinator;

import java.util.List;

public class GxRecyclerView extends RecyclerView implements IGridView, IGxThemeable, IGxControlRuntime {
    private final Coordinator mCoordinator;
    private final GridDefinition mDefinition;
    private final GridHelper mHelper;
    private final RecyclerViewAdapter mAdapter;
    private boolean mIsMoreAvailable;
    private ThemeClassDefinition mThemeClass;
	private int mScrollToItemPosition = -1;

    private static final int VISIBLE_THRESHOLD_ROWS = 5;

    public GxRecyclerView(Context context, Coordinator coordinator, GridDefinition gridDefinition) {
        super(context);
        mCoordinator = coordinator;
        mDefinition = gridDefinition;
        if (mDefinition != null)
            setControlInfo(mDefinition.getControlInfo(), mDefinition.optBooleanProperty("@inverseLoad"));
        mHelper = createHelper(mCoordinator, mDefinition);

        mAdapter = new RecyclerViewAdapter(mDefinition, mHelper, this);
        setAdapter(mAdapter);
        setPagination();
    }

    protected GridHelper createHelper(Coordinator coordinator, GridDefinition gridDefinition) {
        return new GridHelper(this, coordinator, gridDefinition, false);
    }

    private void setPagination() {
        addOnScrollListener(new RecyclerView.OnScrollListener() {
            @Override
            public void onScrollStateChanged(RecyclerView recyclerView, int newState) {
                super.onScrollStateChanged(recyclerView, newState);
            }

            @Override
            public void onScrolled(RecyclerView recyclerView, int dx, int dy) {
                super.onScrolled(recyclerView, dx, dy);
                if (!mIsMoreAvailable)
                    return;

                int totalItemCount = getLayoutManager().getItemCount();
                int lastVisibleItemPosition = findLastVisibleItemPosition();

                if (lastVisibleItemPosition + VISIBLE_THRESHOLD_ROWS * itemsPerRow() >= totalItemCount) {
                    mHelper.requestMoreData();
                }
            }
        });
    }

    protected void setControlInfo(ControlInfo controlInfo, boolean reverseLayout) {
    }

    protected int findLastVisibleItemPosition() {
        LayoutManager layoutManager = getLayoutManager();
        if (layoutManager instanceof LinearLayoutManager)
            return ((LinearLayoutManager)layoutManager).findLastVisibleItemPosition();
        else if (layoutManager instanceof GridLayoutManager)
            return ((GridLayoutManager)layoutManager).findLastVisibleItemPosition();
        else
            return layoutManager.getItemCount();
    }

    protected int itemsPerRow() {
        LayoutManager layoutManager = getLayoutManager();
        if (layoutManager instanceof GridLayoutManager)
            return ((GridLayoutManager)layoutManager).getSpanCount();
        else
            return 1;
    }

    @Override
    public void addListener(GridEventsListener listener) {
        mHelper.setListener(listener);
    }

    @Override
    public void update(ViewData data) {
        mIsMoreAvailable = data.isMoreAvailable();
        mAdapter.setData(data);
    }

    @Override
    public void setThemeClass(ThemeClassDefinition themeClass) {
        mThemeClass = themeClass;
        applyClass(themeClass);
    }

    @Override
    public ThemeClassDefinition getThemeClass() {
        return mThemeClass;
    }

    @Override
    public void applyClass(ThemeClassDefinition themeClass) {
        mHelper.setThemeClass(themeClass);
        mAdapter.notifyDataSetChanged();
    }

    @Override
    public Expression.Value getPropertyValue(String name) {
        if (GridHelper.PROPERTY_SELECTED_INDEX.equals(name)) {
            return Expression.Value.newInteger(mAdapter.getSelectedIndex() + 1);
        }
        return null;
    }

    @Override
    public Expression.Value callMethod(String name, List<Expression.Value> parameters) {
        if (GridHelper.METHOD_SELECT.equals(name) && parameters.size() == 1) {
            int selectedIndex = parameters.get(0).coerceToInt() - 1;

            // If the item to select has not been loaded in the grid, this method has no effect.
            if (selectedIndex >= mAdapter.getItemCount()) {
                return null;
            }

            smoothScrollToPosition(selectedIndex);
            mAdapter.selectIndex(selectedIndex, true);
        }
        else if (GridHelper.METHOD_DESELECT.equals(name) && parameters.size() == 1) {
            int deselectedIndex = parameters.get(0).coerceToInt() - 1;

            // If the item to deselect has not been loaded in the grid, this method has no effect.
            if (deselectedIndex >= mAdapter.getItemCount()) {
                return null;
            }

            mAdapter.deselectIndex(deselectedIndex, true);
        }
        return null;
    }

    public void scrollToPositionAfterLayout(int itemPosition) {
		mScrollToItemPosition = itemPosition;
	}

	@Override
	protected void onLayout(boolean changed, int l, int t, int r, int b) {
		super.onLayout(changed, l, t, r, b);
		if (mScrollToItemPosition >= 0) {
			// Hack: so the scroll is done after the new GX Layouts are rendered
			// which are in the first call to super.onLayout(), after that a call
			// to scrollToPosition() is needed but it is only made on the next layout
			// hence the second call to super.onLayout()
			scrollToPosition(mScrollToItemPosition);
			mScrollToItemPosition = -1;
			super.onLayout(changed, l, t, r, b);
		}
	}
}
