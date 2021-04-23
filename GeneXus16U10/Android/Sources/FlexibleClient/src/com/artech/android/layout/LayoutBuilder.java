package com.artech.android.layout;

import android.content.Context;
import android.os.Build;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;

import com.artech.R;
import com.artech.base.metadata.layout.CellDefinition;
import com.artech.base.metadata.layout.ILayoutContainer;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.layout.RowDefinition;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.controllers.IDataSourceBoundView;
import com.artech.controls.GxHorizontalSeparator;
import com.artech.controls.IGxThemeable;
import com.artech.controls.tabs.GxTabControl;
import com.artech.fragments.ComponentContainer;
import com.artech.fragments.GridContainer;
import com.artech.ui.CoordinatorAdvanced;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/***
 * The main class for expanding a Layout
 */
public class LayoutBuilder
{
	private final Context mContext;
	private final CoordinatorAdvanced mCoordinator;

	private short mLayoutMode;
	private short mTrnMode;

	private ArrayList<View> mBoundViews;
	private ArrayList<IDataSourceBoundView> mDataSourceBoundViews;
	private ArrayList<ComponentContainer> mComponentContainers;

	public LayoutBuilder(Context context, CoordinatorAdvanced coordinator, short layoutMode, short trnMode)
	{
		mContext = context;
		mCoordinator = coordinator;

		mBoundViews = new ArrayList<>();
		mDataSourceBoundViews = new ArrayList<>();
		mComponentContainers = new ArrayList<>();

		// Maybe these could be changed later instead of fixed in constructor?
		mLayoutMode = layoutMode;
		mTrnMode = trnMode;
	}

	// Get collected results.
	public List<View> getBoundViews() { return mBoundViews; }
	public List<IDataSourceBoundView> getDataSourceBoundViews() { return mDataSourceBoundViews; }
	public List<ComponentContainer> getComponentContainers() { return mComponentContainers; }

	/**
	 * Create views from layout definition.
	 */
	public void expandLayout(IGxLayout parent, TableDefinition table)
	{
		ViewGroup parentView = (ViewGroup)parent;
		if (table == null)
		{
			putErrorNoLayout(parentView);
			return;
		}

		initialize();
		LayoutControlFactory.setTags(parentView, table, true);
		mCoordinator.addControl(parentView, table);

		if (table.hasAutoGrow())
		{
			// Table layout should height all the size to align vertical to work
			int minHeight = table.getDesiredHeight();
			parentView.setMinimumHeight(minHeight);
		}

		expandInnerLayout(parent, table);
	}

	private void initialize()
	{
		mBoundViews.clear();
		mDataSourceBoundViews.clear();
		mComponentContainers.clear();
	}

	private void expandInnerLayout(@NonNull IGxLayout parent, ILayoutContainer container)
	{
		// Get the main table for the container (all container MUST have a TableDefinition inside
		TableDefinition def = container.getContent();

		// Expand Rows inside it the specified parent.
		expandRows(def, parent);

		// After processing the layout apply style. (should we do this before? in order to take into account style settings
		GxTheme.applyStyle(parent, def.getThemeClass());
		ThemeUtils.setBackground(def, (ViewGroup)parent, def.getThemeClass());

		parent.requestAlignFieldLabels();
	}

	private void expandRows(TableDefinition table, IGxLayout layout)
	{
		for (RowDefinition row : table.Rows)
			expandRow(table, layout, row);

		layout.updateHorizontalSeparators(new GxHorizontalSeparator(mContext, table));
	}

	private void expandRow(TableDefinition table, IGxLayout layout, RowDefinition row)
	{
		ArrayList<CellDefinition> rowCells = new ArrayList<>(row.Cells);

		if (table.isCanvas())
		{
			// Canvas tables have only one row with all the canvas controls inside it. Create them
			// in their Z-order, since Android treats the order of a view's children as their z-order.
			// IMPORTANT: The sort MUST be stable (controls with equal z-order should not be shuffled).
			// Collections.sort() does (http://docs.oracle.com/javase/tutorial/collections/algorithms/#sorting)
			Collections.sort(rowCells, new Comparator<CellDefinition>()
			{
				@Override
				public int compare(CellDefinition lhs, CellDefinition rhs)
				{
					return Integer.compare(lhs.getZOrder(), rhs.getZOrder());
				}
			});
		}

		for (CellDefinition cell : rowCells)
			expandCell(layout, cell);
	}

	private void expandCell(IGxLayout parentLayout, CellDefinition cell)
	{
		// Actually we support only one control per cell, so just take the first one
		LayoutItemDefinition item = cell.getContent();
		if (item == null)
			return;

		item.setCellGravity(cell.getCellGravity());
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
			item.setJustificationMode(cell.getJustificationMode());

		View view = LayoutControlFactory.createView(mContext, mCoordinator, item, mLayoutMode, mTrnMode);

		// Register as a view for this screen.
		mCoordinator.addControl(view, item);
		parentLayout.setChildLayoutParams(cell, item, view);

		if (view instanceof GridContainer)
		{
			GridContainer grid = (GridContainer)view;
			grid.setAbsoluteSize(cell.getAbsoluteSize());
			mDataSourceBoundViews.add(grid);
		}
		if (view instanceof ComponentContainer)
		{
			ComponentContainer component = (ComponentContainer)view;
			component.setComponentSize(cell.getAbsoluteSize());
			mComponentContainers.add(component);
		}

		if (item instanceof ILayoutContainer &&	!LayoutControlFactory.isAdsTable(item))
		{
			ILayoutContainer itemContainer = (ILayoutContainer) item;
			TableDefinition def = itemContainer.getContent();

			if (def.addScrollView())
			{
				ViewGroup.LayoutParams lp = view.getLayoutParams();
				ScrollViewThemeable scrollView = new ScrollViewThemeable(mContext);
				scrollView.addView(view);
				scrollView.setLayoutParams(lp);
				((ViewGroup)parentLayout).addView(scrollView);

				GxTheme.applyStyle(scrollView, item.getThemeClass());

				// call updateChildLayoutParams with scrollview?
			}
			else
			{
				((ViewGroup)parentLayout).addView(view);
			}

			if (view instanceof IGxThemeable)
				GxTheme.applyStyle((IGxThemeable)view, item.getThemeClass());

			if (!(view instanceof IGxLayout))
				throw new IllegalStateException(String.format("Only GxLayout views should be processed here. Class found is %s", view.getClass()));

			IGxLayout innerLayout = (IGxLayout)view;
			expandInnerLayout(innerLayout, itemContainer);
		}
		else
		{
			((ViewGroup)parentLayout).addView(view);
			mBoundViews.add(view);
		}

		if (view instanceof GxTabControl)
		{
			GxTabControl tabControl = (GxTabControl)view;
			for (GxTabControl.TabItemInfo tabItemInfo : tabControl.getTabItems())
			{
				expandInnerLayout(tabItemInfo.contentView, tabItemInfo.definition.getTable());

				//resize container size if its a table.
				//TODO: Remove it if auto grow not work.
				TableDefinition def = tabItemInfo.definition.getTable().getContent();
				ViewGroup.LayoutParams params = tabItemInfo.contentView.getLayoutParams();
				params.width = def.getAbsoluteWidth();
				params.height = def.getAbsoluteHeight();
				tabItemInfo.contentView.setLayoutParams(params);
			}

			if (item.getThemeClass() != null)
				GxTheme.applyStyle(tabControl, item.getThemeClass());
			else
				GxTheme.applyStyle(tabControl, "Tab"); // hardcoded for Tabs created on the fly
		}

		parentLayout.updateChildLayoutParams(cell, item, view);

		IGxLayout gxLayout = Cast.as(IGxLayout.class, view);
		if (gxLayout != null)
			gxLayout.updateSelfLayoutParams();
	}

	private void putErrorNoLayout(ViewGroup parent)
	{
		TextView txtMessage = new TextView(mContext);
		txtMessage.setText(R.string.GXM_NoLayout);
		parent.addView(txtMessage);
	}
}
