package com.genexus.controls.smartgrid;

import android.content.Context;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import android.view.View;

import static android.view.View.MeasureSpec.EXACTLY;

public class BySizeLayoutManager extends GridLayoutManager {
    private int mMinimum;
    private int mMaximum;
    private RecyclerView mRecyclerView;

    public BySizeLayoutManager(RecyclerView view, Context context, int minimum, int maximum, int orientation, boolean reverseLayout) {
        super(context, 1, orientation, reverseLayout);
        mMinimum = minimum == 0 ? Integer.MAX_VALUE : minimum;
        mMaximum = maximum == 0 ? Integer.MAX_VALUE : maximum;
        mRecyclerView = view;
    }

    @Override
    public void onMeasure(RecyclerView.Recycler recycler, RecyclerView.State state, int widthSpec, int heightSpec) {
        super.onMeasure(recycler, state, widthSpec, heightSpec);
        int width = mRecyclerView.getMeasuredWidth();
        int height = mRecyclerView.getMeasuredHeight();
        int spanSize = getOrientation() == VERTICAL ? width : height;
        int spanCount = Math.max(1, spanSize / mMinimum);
        int childSpanSize = Math.min(mMaximum, spanSize / spanCount);

        for (int i=0; i<getChildCount(); i++) {
            View v = getChildAt(i);

            int childWidth;
            int childHeight;
            if (getOrientation() == VERTICAL) {
                childWidth = childSpanSize;
                childHeight = v.getHeight() * childSpanSize / v.getWidth();
            }
            else {
                childWidth = v.getWidth() * childSpanSize / v.getHeight();
                childHeight = childSpanSize;
            }

            int childWidthSpec = View.MeasureSpec.makeMeasureSpec(childWidth, EXACTLY);
            int childHeightSpec = View.MeasureSpec.makeMeasureSpec(childHeight, EXACTLY);
            v.measure(childWidthSpec, childHeightSpec);
        }
        setSpanCount(spanCount);
    }
}
