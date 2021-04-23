package com.artech.fragments;

import java.util.ArrayList;
import java.util.List;

import android.content.Context;
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.artech.R;
import com.artech.actions.ActionFactory;
import com.artech.actions.CompositeAction;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityController;
import com.artech.activities.SearchResultsActivity;
import com.artech.android.ViewHierarchyVisitor;
import com.artech.android.layout.GxLayoutInTab;
import com.artech.android.layout.GxTheme;
import com.artech.android.layout.LayoutTag;
import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.controls.IGxControlRuntimeContext;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.IDataSourceDefinition;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.filter.FilterAttributeDefinition;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.layout.Size;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.providers.GxUri;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.DataRequest;
import com.artech.common.ExecutionContext;
import com.artech.common.SecurityHelper;
import com.artech.controllers.IDataSourceBoundView;
import com.artech.controllers.IDataSourceController;
import com.artech.controllers.IDataViewController;
import com.artech.controllers.RefreshParameters;
import com.artech.controllers.ViewData;
import com.artech.controls.GxControlViewWrapper;
import com.artech.controls.GxImageViewStatic;
import com.artech.controls.GxListView;
import com.artech.controls.GxTextBlockTextView;
import com.artech.controls.IDataViewHosted;
import com.artech.controls.IGridView;
import com.artech.controls.IGxGridControl;
import com.artech.controls.IGxThemeable;
import com.artech.controls.LoadingIndicatorView;
import com.artech.controls.grids.IGridSite;
import com.artech.controls.grids.ISupportsEditableControls;
import com.artech.controls.grids.ISupportsMultipleSelection;
import com.artech.ui.Coordinator;
import com.artech.usercontrols.UcFactory;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

/**
 * Container for all controls that implement a Grid interface.
 * Handles paging and necessary plumbing so that IGridViews only need to have an update([data]) method.
 */
public class GridContainer extends LinearLayout implements IGxGridControl, IDataViewHosted, IDataSourceBoundView, IGxThemeable, SwipeRefreshLayout.OnRefreshListener
{
	private IDataView mHost;
	private IDataSourceController mController;
	private final GridDefinition mDefinition;

	private final IGridView mGrid;
	private final View mGridView;
	private final GxImageViewStatic mEmptyDataSetImage;
	private final GxTextBlockTextView mEmptyDataSetText;
	private final TextView mStatusText;
	private final LoadingIndicatorView mLoadingIndicator;
	private final SwipeRefreshLayout mSwipeRefreshLayout;

	private ViewData mCurrentData;
	private boolean mNeedsMoreData;
	private final SecurityHelper.Token mSecurityToken;
	private ThemeClassDefinition mThemeClass;

	private final Coordinator mCoordinator;
	private final GxControlViewWrapper mControlWrapper;

	private boolean mMoveToTop = false;

	public GridContainer(Context context, Coordinator coordinator, GridDefinition definition)
	{
		super(context);
		setWillNotDraw(true);

		mDefinition = definition;
		mCoordinator = coordinator;
		mControlWrapper = new GxControlViewWrapper(this);
		mSecurityToken = new SecurityHelper.Token();

		setOrientation(VERTICAL);

		// Place for a generic message, such as filtering/search/error notifications.
		mStatusText = new TextView(getContext());
		LayoutParams statusTextLayoutParams = new LayoutParams(LayoutParams.MATCH_PARENT, Services.Device.dipsToPixels(48));
		statusTextLayoutParams.setMargins(Services.Device.dipsToPixels(8), 0, 0, 0);
		mStatusText.setLayoutParams(statusTextLayoutParams);
		mStatusText.setGravity(Gravity.CENTER_VERTICAL);
		mStatusText.setVisibility(GONE);
		addView(mStatusText);

		// Use factory to create underlying control (e.g. ListView, ImageGallery...)
		// NOTE: Coordinator is passed to grid control so that it can call events, but the grid is not registered
		// as a view for the Coordinator. Otherwise the gesture listener will mess up the default touch events.
		mGrid = UcFactory.createGrid(context, mCoordinator, mDefinition);
		mGridView = (View)mGrid;
		mGrid.addListener(mRequestDataListener);

		if (mDefinition.hasAutoGrow() && mDefinition.gridUserControlSupportAutoGrow())
		{
			// set layout params for autogrow in android
			mGridView.setLayoutParams(new LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT));
		}
		else if (mDefinition.hasAutoGrow() || mDefinition.getDataSource() == null || !mDefinition.getDataSource().getOrders().hasAnyWithAlphaIndexer())
		{
			// Use MATCH_PARENT unless we have alpha indexer, that doesn't seem to work in that case.
			mGridView.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
		}

		// if pull to refresh , add a SwipeRefreshLayout wrapper to grid and add this view to the layout.
		if (mDefinition.hasPullToRefresh() && !mDefinition.hasInverseLoad())
		{
			mSwipeRefreshLayout = new SwipeRefreshLayout(context);
			mSwipeRefreshLayout.addView(mGridView);
			mSwipeRefreshLayout.setOnRefreshListener(this);
			addView(mSwipeRefreshLayout);

			Integer refreshIndicatorColor = ThemeUtils.getAndroidThemeColorId(context, R.attr.colorAccent);
			if (refreshIndicatorColor != null)
				mSwipeRefreshLayout.setColorSchemeColors(refreshIndicatorColor);
		}
		else
		{
			mSwipeRefreshLayout = null;
			addView(mGridView);
		}

		// Add indicator for "empty data set".
		mEmptyDataSetImage = new GxImageViewStatic(context, null, null);
		mEmptyDataSetImage.setVisibility(GONE);
		mEmptyDataSetImage.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
		addView(mEmptyDataSetImage);

		// Add indicator for "empty data set" as text.
		mEmptyDataSetText = new GxTextBlockTextView(context);
		mEmptyDataSetText.setVisibility(GONE);
		mEmptyDataSetText.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));
		mEmptyDataSetText.setGravity(Gravity.CENTER);
		addView(mEmptyDataSetText);

		// Add "loading" indicator.
		mLoadingIndicator = new LoadingIndicatorView(getContext());
		mLoadingIndicator.setLayoutParams(new LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT));

		addView(mLoadingIndicator);
		setGridVisibility(GONE);

		if (mDefinition.getShowSelector() == GridDefinition.ShowSelector.Always)
			setSelectionMode(true, null);
	}

	public View getGridView() {
		return mGridView;
	}

	@Override
	public String getName()
	{
		return mDefinition.getName();
	}

	@Override
	public GridDefinition getDefinition()
	{
		return mDefinition;
	}

	@Override
	public String getDataSourceId()
	{
		IDataSourceDefinition dataSource = getDataSource();
		if (dataSource != null)
			return dataSource.getName();
		else
			return mDefinition.getName();
	}

	@Override
	public IDataSourceDefinition getDataSource()
	{
		return mDefinition.getDataSource();
	}

	@Override
	public String getDataSourceMember()
	{
		String member = mDefinition.getDataSourceMember();
		if (Services.Strings.hasValue(member))
			return member; // SDT collection, for now.

		if (!isFirstLevelGrid())
			return getName();

		return "";
	}

	private boolean isFirstLevelGrid()
	{
		LayoutItemDefinition definition = mDefinition.getParent();
		while (definition != null) {
			if (definition instanceof GridDefinition)
				return false;
			definition = definition.getParent();
		}
		return true;
	}

	@Override
	public int getDataSourceRowsPerPage()
	{
		return mDefinition.getRowsPerPage();
	}

	@Override
	public void setController(IDataSourceController controller)
	{
		mController = controller;
		mNeedsMoreData = true;
	}

	@Override
	@SuppressWarnings("RedundantIfStatement")
	public boolean isActive()
	{
		if (!isShown())
			return false;

		GxLayoutInTab parentTab = ViewHierarchyVisitor.getParent(GxLayoutInTab.class, this);
		if (parentTab != null && !parentTab.isActiveTab())
			return false;

		return true;
	}

	public void setAbsoluteSize(Size size)
	{
		// setBounds() is currently done by LayoutFragmentAdapter. Override setLayoutParams if you want to keep size properties.
		// AdaptersHelper.setBounds(mDefinition.getItemTable(), size.getWidth(), size.getHeight(), getContext());
		if (Cast.as(IGridSite.class, mGrid) != null)
			((IGridSite)mGrid).setAbsoluteSize(size);
	}

	@Override
	public void onBeforeRefresh(RefreshParameters params)
	{
		if (params.isSearchOrFilter() || showLoadingInSearchPatternResults(params))
		{
			// Replace the current data with the loading indicator.
			setGridVisibility(GONE);

			// restore loading indicator
			mLoadingIndicator.restoreLoadingView();
			// show loading indicator
			mLoadingIndicator.setVisibility(VISIBLE);

			// Also remove the previous "searched for X" text, if any. It's no longer current.
			mStatusText.setVisibility(GONE);
		}
		// if is a full refresh go to top
		if (!params.keepPosition)
			mMoveToTop = true;
	}


	private boolean showLoadingInSearchPatternResults(RefreshParameters params)
	{
		if (params.reason == RefreshParameters.Reason.IMPLICIT)
			return false;
		if (mController != null)
		{
			ActivityController activityController = mController.getParent().getParent();
			if (activityController.getActivity() instanceof SearchResultsActivity)
				return true;
		}
		return false;
	}

	@Override
	public void update(ViewData data)
	{
		// Always remove loading indicator. Will be replaced either by Grid or empty view.
		// hide loading indicator.
		mLoadingIndicator.setVisibility(GONE);
		// release loading View
		mLoadingIndicator.releaseLoadingView();

		if (mSwipeRefreshLayout != null)
			mSwipeRefreshLayout.setRefreshing(false);

		if (data.getDataUnchanged()/* ||
				(mCurrentData != null && mCurrentData.getEntities() != null && mCurrentData.getEntities().equals(data.getEntities()))*/) // Commented because mGrid.update call is needed to hide the loading indicator when the pagination rows is equal to the total items (in mHelper.showFooter)
		{
			// This is the same data that we already had. However, the visibility of inner views
			// might not be up to date, so we check that.
			if (mCurrentData != null)
				updateComponentsVisibility(mCurrentData);

			return;
		}

		if (SecurityHelper.handleSecurityError(mCoordinator.getUIContext(),	data.getStatusCode(), data.getStatusMessage(), mSecurityToken) != SecurityHelper.Handled.NOT_HANDLED)
			return;

		if (mDefinition.getShowSelector() != GridDefinition.ShowSelector.None)
			prepareForSelection(data);

		updateComponentsVisibility(data);

		mCurrentData = data;
		mNeedsMoreData = false; // Reset before update(), since Grid may request extra data immediately after updating.

		if (mMoveToTop)
			data.setMoveToTop(true);
		else
			data.setMoveToTop(false);

		mGrid.update(data);
		mMoveToTop = false;

		// Update ListView with autogrow (does not support WRAP_CONTENT).
		if (mDefinition.hasAutoGrow() && mGrid instanceof GxListView && data.getEntities().size() != 0)
		{
			ViewGroup.LayoutParams p = getLayoutParams();
			p.height = ((GxListView)mGrid).calculateAutoHeight();
			setLayoutParams(p);
		}
	}

	/**
	 * Updates the visibility of each of the inner views (e.g. the grid itself, status text,
	 * empty data set text, &c) depending on the data being displayed.
	 */
	private void updateComponentsVisibility(ViewData data)
	{
		if (data.getEntities().size() != 0)
		{
			// Make grid control visible if it wasn't.
			setGridVisibility(VISIBLE);
			mEmptyDataSetImage.setVisibility(GONE);
			mEmptyDataSetText.setVisibility(GONE);
		}
		else
		{
			// Make empty data set text (or image) visible (if applicable).
			if (Services.Strings.hasValue(mDefinition.getEmptyDataSetText()))
			{
				setGridVisibility(GONE);
				mEmptyDataSetText.setText(Services.Strings.attemptFromHtml(mDefinition.getEmptyDataSetText()));
				GxTheme.applyStyle(mEmptyDataSetText, mDefinition.getEmptyDataSetTextClass());
				mEmptyDataSetText.setVisibility(VISIBLE);
			}
			else if (Services.Strings.hasValue(mDefinition.getEmptyDataSetImage()))
			{
				setGridVisibility(GONE);
				Services.Images.displayImage(mEmptyDataSetImage, mDefinition.getEmptyDataSetImage());
				GxTheme.applyStyle(mEmptyDataSetImage, mDefinition.getEmptyDataSetImageClass());
				mEmptyDataSetImage.setVisibility(VISIBLE);
			}
			else
				setGridVisibility(VISIBLE);
		}

		// Update the "searched for, filtered by" status text.
		updateStatus(data);
	}

	private void setGridVisibility(int visibility)
	{
		mGridView.setVisibility(visibility);
		if (mSwipeRefreshLayout != null)
			mSwipeRefreshLayout.setVisibility(visibility);
	}

	private void updateStatus(ViewData data)
	{
		ArrayList<String> messages = new ArrayList<>();

		// Update the "searched/filtered" indicator.
		GxUri dataUri = data.getUri();
		if (dataUri != null)
		{
			// Search
			if (Services.Strings.hasValue(dataUri.getSearchText()))
				messages.add(Services.Strings.getResource(R.string.GXM_DataSearched, dataUri.getSearchText()));

			// Filters
			if (dataUri.hasFilterValues())
			{
				ArrayList<String> filteredBy = new ArrayList<>();
				for (FilterAttributeDefinition filterAttribute : dataUri.getDataSource().getFilter().getAttributes())
				{
					if (dataUri.getFilter(filterAttribute) != null)
						filteredBy.add(filterAttribute.getDescription());
				}

				messages.add(Services.Strings.getResource(R.string.GXM_DataFiltered, Services.Strings.join(filteredBy, ", ")));
			}
		}

		mStatusText.setText(Services.Strings.join(messages, Strings.SPACE));
		mStatusText.setVisibility(messages.size() != 0 ? VISIBLE : GONE);
	}

	@Override
	public EntityList getData()
	{
		return (mCurrentData != null ? mCurrentData.getEntities() : new EntityList());
	}

	public void saveEditValues()
	{
		if (mGrid instanceof ISupportsEditableControls)
			((ISupportsEditableControls)mGrid).saveEditValues();
	}

	@Override
	public IDataView getHost()
	{
		if (mHost == null)
		{
			// This is ugly as hell.
			// Ideally the GridContainer should receive the host as a constructor parameter,
			// but that is very difficult when creating nested grids. So we either use the provided
			// one or try to get it from the view hierarchy.
			for (ViewParent parent = getParent(); parent != null; parent = parent.getParent())
			{
				if (parent instanceof IDataViewHosted)
				{
					mHost = ((IDataViewHosted)parent).getHost();
					break; // Do not continue upwards, if previous hosted didn't have a host, no one else does either.
				}
			}
		}

		return mHost;
	}

	@Override
	public void setHost(IDataView host)
	{
		mHost = host;
	}

	private final IGridView.GridEventsListener mRequestDataListener = new IGridView.GridEventsListener()
	{
		@Override
		public void requestMoreData()
		{
			if (mController == null)
				return;

			// Ignore new request if a previous one is pending.
			if (mNeedsMoreData)
				return;

			// Ignore requests for more data if last request caused a network error.
			if (mCurrentData != null && mCurrentData.hasErrors())
				return;

			mNeedsMoreData = true;
			mController.onRequestMoreData();
		}

		@Override
		@SuppressWarnings("SimplifiableIfStatement")
		public boolean runDefaultAction(UIContext context, Entity entity)
		{
			IDataViewController hostController = getHostController();
			if (hostController == null)
				return false;

			if (hostController.handleSelection(entity))
				return true;

			// Execute the default action for the Grid.
			if (mDefinition == null || mDefinition.getDefaultAction() == null)
				return false;

			return runAction(context, mDefinition.getDefaultAction(), entity);
		}

		@Override
		public boolean runAction(UIContext context, ActionDefinition action, Entity entity)
		{
			IDataViewController hostController = getHostController();
			if (hostController == null)
				return false;

			if (mCurrentData == null || action == null)
				return false;

			// Set current entity to evaluate expressions like '&Collection.CurrentItem.X'
			if (entity != null)
				mCurrentData.getEntities().setCurrentItem(entity);

			if (getHost() != null)
			{
				// Ask host to move values to its entity (needed if variables from form are used in action).
				Entity hostEntity = getHost().getContextEntity();

				// Context and entity may be null if executing an action that is NOT associated to a grid item.
				if (context == null)
					context = getHost().getUIContext();

				if (entity == null)
					entity = hostEntity;
			}

			hostController.runAction(context, action, entity);
			return true;
		}

		private IDataViewController getHostController()
		{
			if (mController != null)
				return mController.getParent();

			IDataView host = getHost();
			if (host != null && host.getController() != null)
				return host.getController();

			Services.Log.warning("GridContainer has neither a specific controller nor an associated host with a controller.");
			return null;
		}

		@Override
		public UIContext getHostUIContext()
		{
			return mCoordinator.getUIContext();
		}
	};

	@Override
	public boolean needsMoreData()
	{
		return mNeedsMoreData;
	}

	@Override
	public Object getInterface(Class c) {
		return Cast.as(c, this);
	}

	@Override
	public void setThemeClass(ThemeClassDefinition themeClass)
	{
		mThemeClass = themeClass;
		applyClass(themeClass);
	}

	@Override
	public ThemeClassDefinition getThemeClass()
	{
		return mThemeClass;
	}

	private void prepareForSelection(ViewData data)
	{
		// Notify items if a particular expression should be used to evaluate selection.
		String selectionExpression = mDefinition.getSelectionExpression();
		for (Entity item : data.getEntities())
			item.setSelectionExpression(selectionExpression);
	}

	@Override
	public void setSelectionMode(boolean enabled, ActionDefinition forAction)
	{
		if (!enabled && mCurrentData != null)
		{
			for (Entity entity : mCurrentData.getEntities())
				entity.setIsSelected(false);
		}

		if (mGrid != null)
		{
			if (mGrid instanceof ISupportsMultipleSelection)
				((ISupportsMultipleSelection)mGrid).setSelectionMode(enabled, forAction);
			else
				Services.Log.warning(String.format("'%s' does not support multiple selection.", mGrid.getClass().getName()));
		}

		// Selection cannot be fully disabled if working on "always on" selection mode.
		// So enabled=false clears selection, and we re-enable it afterwards.
		if (!enabled && mDefinition.getShowSelector() == GridDefinition.ShowSelector.Always)
			setSelectionMode(true, null);
	}

	@Override
	public void setFocus(boolean showKeyboard)
	{
		mControlWrapper.setFocus(showKeyboard);
	}

	@Override
	public void setVisible(boolean visible)
	{
		mControlWrapper.setVisible(visible);
	}

	@Override
	public void setCaption(String caption)
	{
		mControlWrapper.setCaption(caption);
	}

	@Override
	public void setExecutionContext(ExecutionContext context)
	{
		// Pass properties to the custom control if it supports them.
		if (mGrid instanceof IGxControlRuntimeContext)
			((IGxControlRuntimeContext)mGrid).setExecutionContext(context);
	}

	@Override
	public Value getPropertyValue(String name)
	{
		// Retrieve properties from custom control if it supports them.
		if (mGrid instanceof IGxControlRuntime)
			return ((IGxControlRuntime)mGrid).getPropertyValue(name);
		else
			return null;
	}

	@Override
	public void setPropertyValue(String name, Value value)
	{
		// Pass properties to the custom control if it supports them.
		if (mGrid instanceof IGxControlRuntime)
			((IGxControlRuntime)mGrid).setPropertyValue(name, value);
	}

	private static final String METHOD_REFRESH = "Refresh";

	@Override
	public Value callMethod(String name, List<Value> parameters)
	{
		// Grid.Refresh() is a standard method, handle it here instead of passing it on to concrete grids.
		if (METHOD_REFRESH.equalsIgnoreCase(name))
		{
			refreshData(false);
		}
		else if (mGrid instanceof IGxControlRuntime)
		{
			// Pass on the method to the custom grid.
			return ((IGxControlRuntime)mGrid).callMethod(name, parameters);
		}
		return null;
	}

	private void refreshData(boolean keepPosition)
	{
		if (mController != null)
			mController.getParent().getParent().onRefresh(mController, new RefreshParameters(RefreshParameters.Reason.MANUAL, keepPosition));
		else
		{
			Entity entity = mHost.getContextEntity();
			EntityList gridData = Cast.as(EntityList.class, entity.getProperty(getDataSourceMember()));
			if (gridData != null)
				update(ViewData.customData(gridData, DataRequest.RESULT_SOURCE_LOCAL));
		}
	}

	@Override
	public void applyClass(ThemeClassDefinition themeClass)
	{
		if (mGrid instanceof IGxThemeable) {
			((IGxThemeable)mGrid).setThemeClass(themeClass);
			setTag(LayoutTag.CONTROL_THEME_CLASS, themeClass);
		}

		// initialize loading indicator.
		if (themeClass!=null)
			mLoadingIndicator.setThemeClass(themeClass.getThemeAnimationClass());

	}

	@Override
	public boolean isVisible()
	{
		return mControlWrapper.isVisible();
	}

	@Override
	public String getCaption()
	{
		return mControlWrapper.getCaption();
	}

	private static final String PULL_RELEASE_EVENT = "PullRelease";
	// SwipeRefreshLayout.OnRefreshListener.onRefresh()
	@Override
	public void onRefresh()
	{
		boolean pullReleaseHasRefresh = pullReleaseHasRefresh();
		//Services.Log.debug("event has refresh " + pullReleaseHasRefresh);
		// if grid event PullRelease exits, fire this event
		boolean executeCustomEvent;
		if (pullReleaseHasRefresh)
		{
			//run pull release method
			executeCustomEvent = mCoordinator.runControlEvent(this, PULL_RELEASE_EVENT);
		}
		else
		{
			// run method, and remove pull release indicator at the end.
			executeCustomEvent = mCoordinator.runControlEvent(this, PULL_RELEASE_EVENT, null, new Runnable() {
				@Override
				public void run()
				{
					// remove swipe refresh at event end
					if (mSwipeRefreshLayout != null)
					{
						Services.Device.runOnUiThread(new Runnable()
							 {
								  @Override
								  public void run()
								  {
									  mSwipeRefreshLayout.setRefreshing(false);
								  }
							 }
						);

					}
				}
			});
		}
		//Services.Log.debug("event execute custom " + executeCustomEvent);
		if (!executeCustomEvent)
		{
			// if not run event, do only the default, refresh grid.
			refreshData(true);
		}
	}

	private boolean pullReleaseHasRefresh()
	{
		ActionDefinition action = mCoordinator.getControlEventHandler(this, PULL_RELEASE_EVENT);
		if (action != null)
		{
			CompositeAction myAction = ActionFactory.getAction(mCoordinator.getUIContext(), action, null);
			if (myAction.hasRefresh() || myAction.hasControlAction(this.getName(), "Refresh"))
				return true;
		}
		return false;
	}

	// implement enabled = false design property
	@Override
	public void setEnabled(boolean enabled)
	{
		super.setEnabled(enabled);
		if (mGridView!=null)
		{
			mGridView.setEnabled(enabled);
		}
	}
}
