package com.artech.controls.grids;

import java.util.HashMap;
import java.util.WeakHashMap;

import android.app.Activity;
import android.content.Context;
import androidx.annotation.NonNull;
import android.view.LayoutInflater;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.ViewGroup;
import android.widget.TextView;

import com.artech.R;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityHelper;
import com.artech.adapters.AdaptersHelper;
import com.artech.android.ViewHierarchyVisitor;
import com.artech.android.layout.ControlProperties;
import com.artech.android.layout.ControlPropertiesDefaults;
import com.artech.android.layout.DynamicProperties;
import com.artech.android.layout.GxLayout;
import com.artech.android.layout.GxTheme;
import com.artech.android.layout.LayoutBuilder;
import com.artech.base.controls.IGxEditFinishAware;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.enums.DisplayModes;
import com.artech.base.metadata.enums.LayoutModes;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.base.metadata.theme.LayoutBoxMeasures;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.controllers.ViewData;
import com.artech.controls.DataBoundControl;
import com.artech.controls.IGridView;
import com.artech.controls.IGxActionControl;
import com.artech.controls.IGxThemeable;
import com.artech.controls.ThemedViewHelper;
import com.artech.ui.Anchor;
import com.artech.ui.Coordinator;
import com.artech.ui.CoordinatorAdvanced;
import com.artech.ui.CoordinatorBase;
import com.artech.ui.GridItemCoordinator;
import com.artech.utils.BackgroundOptions;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

/**
 * Helper class for common functionality for grid controls.
 */
public class GridHelper
{
	public static final String PROPERTY_ITEM_LAYOUT = "ItemLayout";
	public static final String PROPERTY_ITEM_SELECTED_LAYOUT = "ItemSelectedLayout";
	public static final String PROPERTY_GRID_CURRENTPAGE = "CurrentPage";

	public static final String METHOD_SELECT = "Select";
	public static final String METHOD_DESELECT = "Deselect";
	public static final String PROPERTY_SELECTED_INDEX = "SelectedIndex";
	public static final String EVENT_SELECTION_CHANGED = "SelectionChanged";

	private final View mGrid;
	private final GridDefinition mDefinition;
	private final boolean mSupportReuse;
	private Integer mItemViewResourceId;

	private Activity mActivity;
	private LayoutBoxMeasures mDeferredMargins;
	private IGridView.GridEventsListener mEventsListener;
	private WeakHashMap<Entity, GridItemUIContext> mGridItemContext;
	private HashMap<String, ControlPropertiesDefaults> mControlPropertiesDefaults;
	private ThemedViewHelper mThemeViewHelper;

	private GridItemLayoutVersion mItemLayoutVersion;
	private Coordinator mCoordinator;

	public GridHelper(View grid, Coordinator coordinator, GridDefinition definition)
	{
		this(grid, coordinator, definition, true);
	}

	public GridHelper(View grid, Coordinator coordinator, GridDefinition definition, boolean supportItemViewReuse)
	{
		mGrid = grid;
		mCoordinator = coordinator;
		mDefinition = definition;
		mSupportReuse = !Services.Application.isLiveEditingEnabled() && supportItemViewReuse;

		mGridItemContext = new WeakHashMap<>();
		mControlPropertiesDefaults = new HashMap<>();

		// Don't care about actual values, just need to detect when changed.
		mItemLayoutVersion = new GridItemLayoutVersion(-1, -1, -1);
		mThemeViewHelper = new ThemedViewHelper(mGrid, mDefinition);
	}

	private Context getContext()
	{
		return mGrid.getContext();
	}

	public Coordinator getCoordinator()
	{
		return mCoordinator;
	}

	public GridDefinition getDefinition()
	{
		return mDefinition;
	}

	public View getGridView()
	{
		return mGrid;
	}

	public void setBounds(int width, int height)
	{
		if (width != mItemLayoutVersion.itemWidth || height != mItemLayoutVersion.itemHeight)
		{
			for (TableDefinition itemLayout : mDefinition.getOddItemLayouts())
				AdaptersHelper.setBounds(itemLayout, width, height);
			for (TableDefinition itemLayout : mDefinition.getEvenItemLayouts())
				AdaptersHelper.setBounds(itemLayout, width, height);

			mItemLayoutVersion = new GridItemLayoutVersion(width, height, mItemLayoutVersion.itemReservedWidth);
		}
	}

	public void setReservedSpace(int reservedWidth)
	{
		if (reservedWidth != mItemLayoutVersion.itemReservedWidth)
		{
			for (TableDefinition itemLayout : mDefinition.getOddItemLayouts())
				itemLayout.recalculateBounds(reservedWidth);
			for (TableDefinition itemLayout : mDefinition.getEvenItemLayouts())
				itemLayout.recalculateBounds(reservedWidth);

			mItemLayoutVersion = new GridItemLayoutVersion(mItemLayoutVersion.itemWidth, mItemLayoutVersion.itemHeight, reservedWidth);
		}
	}

	public void setListener(IGridView.GridEventsListener listener)
	{
		mEventsListener = listener;
	}

	// ********************************************************************
	// Event handlers for requesting data, default action and buttons.

	public void requestMoreData()
	{
		if (mEventsListener != null)
			mEventsListener.requestMoreData();
	}

	/**
	 * Run an action that is NOT associated to the grid (e.g. a multiple selection action).
	 */
	public boolean runExternalAction(ActionDefinition action)
	{
		saveEditValues();

		//noinspection SimplifiableIfStatement
		if (mEventsListener != null)
			return mEventsListener.runAction(null, action, null);
		else
			return false;
	}

	/**
	 * Run an action in the context of the grid item.
	 * @param action Action definition.
	 * @param entity Entity corresponding to the grid item.
	 */
	public boolean runAction(ActionDefinition action, Entity entity, Anchor anchor)
	{
		if (!CoordinatorBase.isInternalEvent(action.getName())) {
			IGxEditFinishAware control = Cast.as(IGxEditFinishAware.class, getActivity().getCurrentFocus());
			if (control != null)
				control.finishEdit();
		}

		saveEditValues();

		//noinspection SimplifiableIfStatement
		if (mEventsListener != null)
			return mEventsListener.runAction(getUIContextFor(entity, anchor), action, entity);
		else
			return false;
	}

	/**
	 * Run the default action associated to the grid.
	 * @param entity Entity corresponding to the grid item.
	 */
	public boolean runDefaultAction(Entity entity)
	{
		return runDefaultAction(entity, null);
	}

	public boolean runDefaultAction(Entity entity, Anchor anchor)
	{
		saveEditValues();

		//noinspection SimplifiableIfStatement
		if (mEventsListener != null)
			return mEventsListener.runDefaultAction(getUIContextFor(entity, anchor), entity);
		else
			return false;
	}

	// Executed when an "in grid action" is fired.
	private OnClickListener mActionHandler = new OnClickListener()
	{
		@Override
		public void onClick(View v)
		{
			if (mEventsListener == null)
				return;

			if (!(v instanceof IGxActionControl))
				return;

			IGxActionControl action = (IGxActionControl)v;
			runAction(action.getAction(), action.getEntity(), new Anchor(v));
		}
	};

	@NonNull
	private UIContext getUIContextFor(Entity entity, Anchor anchor)
	{
		UIContext itemContext = mGridItemContext.get(entity);
		if (itemContext == null)
			throw new IllegalStateException(String.format("Could not get UIContext associated to entity '%s'", entity.toDebugString()));

		itemContext.setAnchor(anchor);
		return itemContext;
	}

	public Activity getActivity()
	{
		// Try to get activity from grid view context (by casting or via base context).
		// As a last resort fall on ActivityHelper's current activity.
		if (mActivity == null)
		{
			Context context = getContext();
			mActivity = (context instanceof Activity) ?
					(Activity) context : ActivityHelper.getCurrentActivity();
		}

		return mActivity;
	}

	// Executed when an "domain" action is fired.
	private OnClickListener mDomainActionHandler = new OnClickListener()
	{
		@Override
		public void onClick(View v)
		{
			if (mEventsListener == null)
				return;

			if (!(v instanceof DataBoundControl))
				return;

			saveEditValues();
			DataBoundControl actionDomainControl = (DataBoundControl)v;
			AdaptersHelper.launchDomainAction(getUIContextFor(actionDomainControl.getEntity(), new Anchor(v)), v, actionDomainControl.getEntity());
		}
	};

	public void saveEditValues()
	{
		// Post pending edits in visible items (those that were recycled were previously posted).
		for (GridItemLayout gridItem : ViewHierarchyVisitor.getViews(GridItemLayout.class, mGrid))
			saveEditValues(gridItem.getItemInfo());
	}

	private void saveEditValues(GridItemViewInfo gridItem)
	{
		// Post any pending edits to the underlying data.
		// Necessary before running any actions that may depend on typed values (otherwise
		// the old value will be used), and before reusing the view (otherwise the edited value is lost).
		if (gridItem.getData() != null)
			AdaptersHelper.saveEditValues(gridItem.getBoundViews(), gridItem.getData());
	}

	// ********************************************************************
	// Expand view.

	private LayoutInflater mInflater;
	private boolean mNotReuseViews;

	/**
	 * Called to create the view corresponding to an item.
	 * @param previousView View to reuse, if the control supports it.
	 */
	public GridItemViewInfo getItemView(IGridAdapter adapter, int position, View previousView, boolean inSelectionMode, boolean isItemSelected)
	{
		if (previousView != null && previousView.getTag(R.id.tag_grid_item_view_in_use) != null)
			throw new IllegalArgumentException("If passing in a previousView for reusing, make sure discardItemView() was called on it before.");

		// Initialize LayoutInflater only once.
		if (mInflater == null)
			mInflater = LayoutInflater.from(getContext());

		Entity item = adapter.getEntity(position);

		View view;
		boolean shouldExpandLayout;

		// If this row is being recreated, then get previous UI context and previous set properties, if any,
		// but associate to new view. Otherwise, create a new context and associate it.
		GridItemUIContext uiContext = mGridItemContext.get(item);
		if (uiContext == null)
		{
			//Services.Log.debug("create GridItemUIContext for item " + item.toString());
			uiContext = createGridItemUIContext(item);
		}

		GridItemViewInfo itemView = GridItemViewInfo.fromView(previousView);

		// A GridItemView keeps references to children views to avoid repeated calls to findViewById() on each row.
		// If the supplied view is not null, reuse it directly (unless drawListItem instructs us not to do so).
		if (previousView == null || itemView == null  || itemView.getVersion() == null || !itemView.getVersion().equals(mItemLayoutVersion))
		{
			int layoutResId = getItemViewResourceId();
			view = mInflater.inflate(layoutResId, null);
			shouldExpandLayout = true;
		}
		else
		{
			view = previousView;
			shouldExpandLayout = mNotReuseViews;
		}

		GridItemCoordinator itemCoordinator;
		if (shouldExpandLayout)
		{
			// Create a coordinator for this item view.
			itemCoordinator = new GridItemCoordinator(uiContext, this, item);

			itemView = createNewItemView((GridItemLayout)view, itemCoordinator, getLayoutFor(item, position % 2 == 0, isItemSelected));
			itemView.assignTo(view);
			itemView.setCoordinator(itemCoordinator);

			// Set theme for group separator header, only the first time we expand the layout
			if (itemView.getHeaderText() != null)
				applyGroupHeaderClass(itemView.getHeaderText());
		}
		else
			itemCoordinator = itemView.getCoordinator();

		mNotReuseViews |= bindViewToData(item, adapter.getData(), position, inSelectionMode, itemView, itemCoordinator, uiContext, shouldExpandLayout, mNotReuseViews);

		itemView.getView().setTag(R.id.tag_grid_item_view_in_use, true);
		return itemView;
	}

	@NonNull
	public GridItemUIContext createGridItemUIContext(Entity item)
	{
		GridItemUIContext uiContext;
		uiContext = new GridItemUIContext(mEventsListener.getHostUIContext(), this);
		mGridItemContext.put(item, uiContext);
		return uiContext;
	}

	public void clearCache()
	{
		mGridItemContext.clear();
	}

	public void applyGroupHeaderClass(TextView groupHeader)
	{
		if (mDefinition.getThemeClass() != null)
		{
			ThemeClassDefinition groupHeaderClass = mDefinition.getThemeClass().getThemeGridGroupSeparatorClass();
			if (groupHeaderClass != null)
			{
				// Apply font and background.
				ThemeUtils.setFontProperties(groupHeader, groupHeaderClass);
				ThemeUtils.setBackgroundBorderProperties(groupHeader, groupHeaderClass, BackgroundOptions.defaultFor(mDefinition));

				// Apply padding.
				LayoutBoxMeasures padding = groupHeaderClass.getPadding();
				if (padding.isEmpty())
					groupHeader.setPadding(Services.Device.dipsToPixels(4), 0, 0, 0); // Default if empty.
				else
					groupHeader.setPadding(padding.left, padding.top, padding.right, padding.bottom);
			}
		}
	}

	@SuppressWarnings("ConstantConditions")
	private int getItemViewResourceId()
	{
		if (mItemViewResourceId == null)
		{
			boolean hasBreakBy = mDefinition.hasBreakBy();
			boolean hasSelection = (mDefinition.getShowSelector() != GridDefinition.ShowSelector.None);

			// Use a simple layout if possible, to avoid nesting controls.
			if (hasBreakBy && hasSelection)
				mItemViewResourceId = R.layout.grid_item_with_all;
			else if (hasBreakBy && !hasSelection)
				mItemViewResourceId = R.layout.grid_item_with_break;
			else if (!hasBreakBy && hasSelection)
				mItemViewResourceId = R.layout.grid_item_with_checkbox;
			else
				mItemViewResourceId = R.layout.grid_item_basic;
		}

		return mItemViewResourceId;
	}

	private GridItemViewInfo createNewItemView(GridItemLayout convertView, CoordinatorAdvanced coordinator, TableDefinition table)
	{
		GxLayout holderLayout = convertView.findViewById(R.id.grid_item_content);
		holderLayout.setTag(table.getName());

		//remove and re add views
		holderLayout.removeAllViews();
		//clean previews view theme settings
		// background and borders
		holderLayout.setBackground(null);

		holderLayout.setLayout(coordinator, table.getContent());

		LayoutBuilder builder = new LayoutBuilder(convertView.getContext(), coordinator, LayoutModes.LIST, DisplayModes.VIEW);
		builder.expandLayout(holderLayout, table);

		// Creates a ViewHolder and store references to the children views we want to bind data to.
		return new GridItemViewInfo(convertView, mItemLayoutVersion, builder.getBoundViews(), holderLayout);
	}

	public View createNewView(TableDefinition table) {
		GridItemUIContext uiContext;
		uiContext = new GridItemUIContext(mEventsListener.getHostUIContext(), this);
		GridItemCoordinator itemCoordinator = new GridItemCoordinator(uiContext, this, null);

		// Initialize LayoutInflater only once.
		if (mInflater == null)
			mInflater = LayoutInflater.from(getContext());

		int layoutResId = getItemViewResourceId();
		View view = mInflater.inflate(layoutResId, null);
		GridItemViewInfo itemViewInfo = createNewItemView((GridItemLayout)view, itemCoordinator, table);
		itemViewInfo.assignTo(view);
		itemViewInfo.setCoordinator(itemCoordinator);

		return view;
	}

	public void bindView(View itemView, Entity item, ViewData data, int position, boolean inSelectionMode) {
		GridItemViewInfo itemViewInfo = GridItemViewInfo.fromView(itemView);
		GridItemCoordinator itemCoordinator = itemViewInfo.getCoordinator();

		GridItemUIContext uiContext = mGridItemContext.get(item);
		if (uiContext == null)
			uiContext = createGridItemUIContext(item);

		bindViewToData(item, data, position, inSelectionMode, itemViewInfo, itemCoordinator, uiContext, false, false);
	}

	private boolean bindViewToData(Entity item, ViewData data, int position, boolean inSelectionMode, GridItemViewInfo itemViewInfo, GridItemCoordinator itemCoordinator, GridItemUIContext uiContext, boolean shouldExpandLayout, boolean notReuseViews) {
		// IMPORTANT TO UNDERSTAND WHAT'S GOING ON HERE
		// 1) Item views may be reused as the grid is scrolled.
		// 2) Each item VIEW has a single, immutable GridItemCoordinator, because its child views have references to it.
		// 3) Each item DATA has a single, immutable UIContext, because it keeps state about the row's controls.
		// Therefore, we need to bind the GridItemCoordinator and UIContext when views are reused.
		// In particular, we set the UIContext's root view to the assigned view, and the coordinator's UIContext to the context.
		itemCoordinator.setItemContext(uiContext);
		uiContext.setGridItem(itemViewInfo);
		itemViewInfo.setData(mGrid, position, item, inSelectionMode);

		// If this is a recycled view then we need to reset any changed visual properties.
		ControlPropertiesDefaults defaults = getControlPropertiesDefault(itemViewInfo);
		if (!shouldExpandLayout)
			applyProperties(uiContext, defaults);

		IGxThemeable themeable = Cast.as(IGxThemeable.class, mGrid);
		if (themeable != null) {
			ThemeClassDefinition gridClass = themeable.getThemeClass();
			if (gridClass != null) {
				ThemeClassDefinition rowClass = (position % 2 == 0 ? gridClass.getThemeGridOddRowClass() : gridClass.getThemeGridEvenRowClass());
				GxLayout table = itemViewInfo.getHolder();
				ThemeClassDefinition themeClass = table.getRowThemeClass(rowClass);
				if (themeClass != null)
					GxTheme.applyStyle(table, themeClass); // ask the table for the class to get a merged class from row + table
			}
		}
		else {
			// i.e. GxImageMap
			GxLayout table = itemViewInfo.getHolder();
			ThemeClassDefinition themeClass = table.getThemeClass();
			if (themeClass != null)
				GxTheme.applyStyle(table, themeClass);
		}

		boolean drawNeedsDisableReuse = AdaptersHelper.drawListItem(data, itemViewInfo, item, mActionHandler, mDomainActionHandler, notReuseViews, inSelectionMode);

		applyDynamicProperties(uiContext, item, defaults);

		return drawNeedsDisableReuse;
	}

	private ControlPropertiesDefaults getControlPropertiesDefault(GridItemViewInfo viewInfo) {
		TableDefinition tableDefinition = getLayoutFor(viewInfo.getData(), viewInfo.getPosition() % 2 == 0, viewInfo.getSelected());
		ControlPropertiesDefaults defaults = mControlPropertiesDefaults.get(tableDefinition.getName());
		if (defaults == null) {
			defaults = new ControlPropertiesDefaults(tableDefinition);
			mControlPropertiesDefaults.put(tableDefinition.getName(), defaults);
		}
		return defaults;
	}

	private void applyDynamicProperties(GridItemUIContext rowContext, Entity data, ControlPropertiesDefaults defaults)
	{
		// 1) Read dynprops from row data. These are the visual properties set in Load event.
		DynamicProperties dynProps = DynamicProperties.get(data);

		// 2) If we are about to change a visual property, then we must take note its default value,
		// so that it can be restored later when the view for that row is recycled.
		// If this is unsuccessful we disable reuse from now on.
		if (!defaults.putDefaultsFor(dynProps))
			disableViewReuse();

		// 3) Construct the set of visual properties to apply. These comprise the ones assigned in the Load event,
		// plus any properties assigned by actions on this row, before its view was recycled.
		ControlProperties rowProps = new ControlProperties();
		rowProps.putAll(dynProps);
		rowProps.putAll(rowContext.getAssignedControlProperties());

		// 4) Apply the full set. Don't consider these ase "properties assigned by actions on this row".
		applyProperties(rowContext, rowProps);
	}

	private static void applyProperties(GridItemUIContext rowContext, ControlProperties properties)
	{
		rowContext.setControlPropertiesTrackingEnabled(false);
		properties.apply(rowContext);
		rowContext.setControlPropertiesTrackingEnabled(true);
	}

	public boolean hasDifferentLayoutWhenSelected(Entity item)
	{
		if (item != null)
		{
			TableDefinition oddStandardLayout = getLayoutFor(item, true, false);
			TableDefinition oddSelectedLayout = getLayoutFor(item, true, true);
			TableDefinition evenStandardLayout = getLayoutFor(item, false, false);
			TableDefinition evenSelectedLayout = getLayoutFor(item, false, true);

			return oddSelectedLayout != oddStandardLayout || evenSelectedLayout != evenStandardLayout;
		}
		else
			return false;
	}

	public TableDefinition getLayoutFor(Entity item, boolean odd, boolean isSelected)
	{
		DynamicProperties dynProps = DynamicProperties.get(item);
		String itemLayoutName = dynProps.getStringProperty(mDefinition.getName(), PROPERTY_ITEM_LAYOUT);
		String selectedItemLayoutName = dynProps.getStringProperty(mDefinition.getName(), PROPERTY_ITEM_SELECTED_LAYOUT);

		if (isSelected)
		{
			TableDefinition selectedItemLayout = mDefinition.getItemLayout(selectedItemLayoutName, odd);
			if (selectedItemLayout == null)
				selectedItemLayout = mDefinition.getDefaultSelectedItemLayout(odd);

			if (selectedItemLayout != null)
				return selectedItemLayout;
		}

		// Not selected, or was selected but didn't have a "selected layout" set, nor a default one.
		TableDefinition itemLayout = mDefinition.getItemLayout(itemLayoutName, odd);
		if (itemLayout == null)
			itemLayout = mDefinition.getDefaultItemLayout(odd);

		return itemLayout;
	}

	/**
	 * Called before a view is about to be destroyed. Must be called for grids that support editing.
	 */
	public void discardItemView(View view)
	{
		if (view != null)
			view.setTag(R.id.tag_grid_item_view_in_use, null);

		GridItemViewInfo viewInfo = GridItemViewInfo.fromView(view);
		if (viewInfo != null)
		{
			// if viewInfo.getData() is null, view already discarded.
			// bellow saveEditValues already ask for viewInfo getdata null
			// discardItemView is called more than one in Android 4.x and 5.x (Nexus 7) at least.
			// works ok in android 7.0 and 9.0 (Pixel).
			if (viewInfo.getData()!=null)
			{
				// Check all properties that were set on this row to ensure that they CAN be returned to their
				// default values. If not, it means that the row cannot be reused, so we disable reuse from here on.
				GridItemUIContext rowContext = mGridItemContext.get(viewInfo.getData());
				// here reuse view could be invalidated for inner elements
				ControlPropertiesDefaults defaults = getControlPropertiesDefault(viewInfo);
				if (rowContext != null && !defaults.putDefaultsFor(rowContext.getAssignedControlProperties()))
					disableViewReuse();
			}
			else
			{
				Services.Log.debug("ViewInfo data null , view already discarded.");
			}
			// Before reusing the view, post its edited values to the underlying Entity.
			if (!isMeasuring())
				saveEditValues(viewInfo);

			// Release memory.
			viewInfo.setData(-1, null, false);

			if (!mSupportReuse)
				GridItemViewInfo.discard(view);
		}
	}

	protected boolean isMeasuring()
	{
		return false;
	}

	void disableViewReuse()
	{
		mNotReuseViews = true;
	}

	// ********************************************************************
	// Theme and layout parameters.

	public void setThemeClass(ThemeClassDefinition themeClass)
	{
		mThemeViewHelper.applyClass(themeClass);
	}

	public void adjustMargins(ViewGroup.LayoutParams params)
	{
		mThemeViewHelper.setLayoutParams(params);
	}
}
