package com.artech.ui.navigation.slide;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Build;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.fragment.app.FragmentTransaction;
import androidx.core.view.GravityCompat;
import androidx.drawerlayout.widget.DrawerLayout;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.ActionBarDrawerToggle;
import androidx.appcompat.widget.Toolbar;
import android.util.Pair;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;

import com.artech.R;
import com.artech.activities.ActivityFlowControl;
import com.artech.activities.ActivityHelper;
import com.artech.activities.DataViewHelper;
import com.artech.activities.GenexusActivity;
import com.artech.adapters.AdaptersHelper;
import com.artech.app.ComponentId;
import com.artech.app.ComponentParameters;
import com.artech.app.ComponentUISettings;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.DashboardItem;
import com.artech.base.metadata.Events;
import com.artech.base.metadata.ILayoutDefinition;
import com.artech.base.metadata.enums.LayoutModes;
import com.artech.base.services.Services;
import com.artech.compatibility.CompatibilityHelper;
import com.artech.fragments.BaseFragment;
import com.artech.fragments.IDataView;
import com.artech.fragments.IInspectableComponent;
import com.artech.fragments.LayoutFragmentActivityState;
import com.artech.resources.BuiltInResources;
import com.artech.ui.navigation.CallOptions;
import com.artech.ui.navigation.CallOptionsHelper;
import com.artech.ui.navigation.CallTarget;
import com.artech.ui.navigation.CallType;
import com.artech.ui.navigation.CustomInsetsRelativeLayout;
import com.artech.ui.navigation.FragmentLauncher;
import com.artech.ui.navigation.NavigationHandled;
import com.artech.ui.navigation.UIObjectCall;
import com.artech.ui.navigation.controllers.AbstractNavigationController;
import com.artech.ui.navigation.controllers.StandardNavigationController;
import com.artech.ui.navigation.slide.SlideNavigation.Target;
import com.artech.utils.Cast;
import com.artech.utils.KeyboardUtils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class SlideNavigationController extends AbstractNavigationController
{
	private final GenexusActivity mActivity;
	private DrawerLayout mDrawerLayout;
	private ActionBarDrawerToggle mDrawerToggle;

	private SlideComponents mComponents;
	private SlideNavigationTargets mTargets;
	private Pair<UIObjectCall, Target> mPendingReplace;
	private boolean mStartupComplete;
	private boolean mOnCreateComplete;

	public SlideNavigationController(GenexusActivity activity)
	{
		mActivity = activity;
	}

	@Override
	public Pair<View, Boolean> onPreCreate(Bundle savedInstanceState, ComponentParameters mainParams)
	{
		//EnableHeaderRowPattern, set up new drawer properties.
		// ActionBar EnableHeaderRowPattern
		ActivityHelper.setActionBarOverlay(mActivity);
		// StatusBar EnableHeaderRowPattern
		ActivityHelper.setStatusBarOverlay(mActivity);

		// Set up layout.
		mActivity.setContentView(R.layout.slide_navigation);
		mDrawerLayout = mActivity.findViewById(R.id.drawer_layout);
		mDrawerLayout.setDrawerShadow(R.drawable.gx_drawer_shadow, GravityCompat.START);
		mTargets = new SlideNavigationTargets(mDrawerLayout);

		// Set support toolbar, use custom shadow in slide menu applications.
		ActivityHelper.setSupportActionBarAndShadow(mActivity);

		// Set drawer background according to theme.
		setupDrawer(R.id.left_drawer);
		setupDrawer(R.id.right_drawer);

		// Enable ActionBar app icon to behave as action to toggle nav drawer
		// and don't show default action bar shadow.
		ActionBar actionBar = mActivity.getSupportActionBar();
		if (actionBar != null)
		{
			// default values enabled.
			actionBar.setDisplayHomeAsUpEnabled(true);
			actionBar.setHomeButtonEnabled(true);
		}

		//temporary, use custom shadow in 6.x because system one not work ok with slide (using CustomInsets).
		CustomInsetsRelativeLayout customToolbarContainer = mActivity.findViewById(R.id.main_content_insets_container);
		if (customToolbarContainer != null && Build.VERSION.SDK_INT > Build.VERSION_CODES.LOLLIPOP_MR1)
		{
			customToolbarContainer.setDrawShadow(true);
			if (actionBar!=null)
				actionBar.setElevation(0);
		}

		if (CompatibilityHelper.isStatusBarOverlayingAvailable())
		{
			// set size of statusbar to dummy view
			FrameLayout toolbarStatusBarDummyTop = mActivity.findViewById(R.id.statusBarDummyTop);
			ViewGroup.LayoutParams params = toolbarStatusBarDummyTop.getLayoutParams();
			params.height = AdaptersHelper.getStatusBarHeight(mActivity);
			params.width = ViewGroup.LayoutParams.MATCH_PARENT;
			toolbarStatusBarDummyTop.setLayoutParams(params);

			//set toolbar margin, do it only one time
			Toolbar toolbar = mActivity.findViewById(R.id.action_bar_toolbar);
			RelativeLayout.LayoutParams toolbarRelativeLayoutParams = (RelativeLayout.LayoutParams) toolbar.getLayoutParams();
			toolbarRelativeLayoutParams.setMargins(0, AdaptersHelper.getStatusBarHeight(mActivity), 0, 0);
			toolbar.setLayoutParams(toolbarRelativeLayoutParams);
		}

		// setup drawer , setupDrawerFitsSystemWindows before draw
		// create component , just to setup drawer.
		SlideComponents slideComponents = SlideNavigation.getComponents(mActivity.getIntent(), mainParams);
		// init drawers
		setupDrawerFitsWindows(Target.Left, slideComponents);

		// return main view create and if use status bar by default.
		return new Pair<View, Boolean>(mDrawerLayout, true);
	}

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		mOnCreateComplete = true;
	}

	private void setupDrawer(int drawerContainerId)
	{
		// Set drawer background according to theme.
		View drawerContainer = mActivity.findViewById(drawerContainerId);
		int drawerBackground = BuiltInResources.getResource(mActivity, android.R.drawable.screen_background_dark, android.R.drawable.screen_background_light, android.R.drawable.screen_background_light);
		drawerContainer.setBackgroundResource(drawerBackground);

	}

	private void setupDrawerFitsWindows(Target target, SlideComponents slideComponents)
	{
		ComponentParameters params = slideComponents.get(target);
		if (params != null)
		{
			UIObjectCall data = new UIObjectCall(mActivity.getUIContext(), params);
			if (data.getObjectLayout() != null)
			{
				ILayoutDefinition layout = data.getObjectLayout();
				setupDrawerFitsSystemWindows(target, layout);
			}
		}
	}


	@SuppressWarnings("deprecation")
	@Override
	public boolean start(ComponentParameters mainParams, LayoutFragmentActivityState previousState)
	{
		if (previousState != null)
			mComponents = SlideComponents.readFrom(previousState);

		if (mComponents == null)
			mComponents = SlideNavigation.getComponents(mActivity.getIntent(), mainParams);

		if (MyApplication.getApp().getSlidePositionRight())
			mTargets.start(mActivity, mComponents.IsRightMainComponent ? mComponents.get(Target.Right) : mComponents.get(Target.Content));
		else
			mTargets.start(mActivity, mComponents.IsLeftMainComponent ? mComponents.get(Target.Left) : mComponents.get(Target.Content));

		// Set up custom drawer toggle manager.
		mDrawerToggle = new DrawerToggle(mActivity, mDrawerLayout);
		mDrawerLayout.setDrawerListener(mDrawerToggle);
		mDrawerToggle.setDrawerIndicatorEnabled(mComponents.IsHub);


		if (MyApplication.getApp().getSlideHideIcon() && mComponents.IsHub)
		{
			mDrawerToggle.setDrawerIndicatorEnabled(false);
			//mDrawerToggle.setDrawerArrowDrawable(null);
			//set toolbar icon to empty
			Toolbar toolbar = mActivity.findViewById(R.id.action_bar_toolbar);
			toolbar.setNavigationIcon(R.drawable.gx_action_empty);
		}

		// if content target hide back button do it here.
		ActionBar actionBar = mActivity.getSupportActionBar();
		if (actionBar != null &&  mActivity.getMainDefinition()!=null)
		{
			// if has an empty back event , do not show it
			ActionDefinition actionBack = mActivity.getMainDefinition().getEvent(Events.BACK);
			// do not change slide menu icon visible for main slide menu content (IsHub).
			if (actionBack != null && !mComponents.IsHub
					&& StandardNavigationController.isEmptyEvent(actionBack) )
				actionBar.setDisplayHomeAsUpEnabled(false);
		}

		FragmentTransaction transaction = mActivity.getSupportFragmentManager().beginTransaction();

		// Initialize the drawer and content fragments (if available).
		IDataView contentFragment = null;
		IDataView leftFragment = null;
		IDataView rightFragment = null;

		if (MyApplication.getApp().getSlidePositionRight())
		{
			contentFragment = initializeFragment(transaction, Target.Content, !mComponents.IsRightMainComponent);
			rightFragment = initializeDrawerFragment(transaction, Target.Right, mComponents.IsRightMainComponent);
			leftFragment = initializeDrawerFragment(transaction, Target.Left, false);
		}
		else
		{
			contentFragment = initializeFragment(transaction, Target.Content, !mComponents.IsLeftMainComponent);
			leftFragment = initializeDrawerFragment(transaction, Target.Left, mComponents.IsLeftMainComponent);
			rightFragment = initializeDrawerFragment(transaction, Target.Right, false);
		}

		mTargets.putFragment(Target.Left, leftFragment);
		mTargets.putFragment(Target.Content, contentFragment);
		mTargets.putFragment(Target.Right, rightFragment);

		mTargets.restoreStateFrom(previousState);

		transaction.commit();

		if (!mActivity.isLoginPending())
			afterStart();

		return true;
	}

	private IDataView initializeFragment(FragmentTransaction transaction, Target target, boolean isMain)
	{
		ComponentParameters params = mComponents.get(target);
		if (params != null)
		{
			ComponentId componentId = SlideNavigationTargets.getComponentId(target);
			ComponentUISettings uiSettings = new ComponentUISettings(isMain, null, mTargets.getSize(mActivity, target, params));

			BaseFragment fragment = mActivity.createComponent(componentId, params, uiSettings, null);
			int targetViewId = SlideNavigationTargets.getTargetViewId(target);
			transaction.replace(targetViewId, fragment);

			UIObjectCall data = new UIObjectCall(mActivity.getUIContext(), params);
			if (data.getObjectLayout() != null)
			{
				ILayoutDefinition layout = data.getObjectLayout();
				if (target == Target.Content)
				{
					StandardNavigationController.setupActionBarInitLayout(mActivity, layout, false, true);
					// Allow header row for the main fragment (content).
					fragment.setAllowHeaderRow(true);
				}
				else
				{
					setupDrawerFitsSystemWindows(target, layout);
				}
			}
			return Cast.as(IDataView.class, fragment);
		}
		else
			return null;
	}

	private void setupDrawerFitsSystemWindows(Target target, ILayoutDefinition layout)
	{
		int drawerContainerId = R.id.left_drawer;
		int drawerContainerOppositeId = R.id.right_drawer;
		if (target == Target.Right)
		{
			drawerContainerId = R.id.right_drawer;
			drawerContainerOppositeId = R.id.left_drawer;
		}
		View drawerContainer = mActivity.findViewById(drawerContainerId);
		View drawerContainerOpposite = mActivity.findViewById(drawerContainerOppositeId);


		// if HR not set, 5.x drawer dont fits system windows.
		// if HR set, 4.x header get cut.
		if (!layout.getEnableHeaderRowPattern())
		{
			if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP)
			{
				//drawerContainer.setPadding(0, AdaptersHelper.getStatusBarHeight(mActivity) , 0 ,0 );
				// change both right and left drawer before draw them...
				if (drawerContainer.getFitsSystemWindows())
				{
					drawerContainer.setFitsSystemWindows(false);
				}
				if (drawerContainerOpposite.getFitsSystemWindows())
				{
					drawerContainerOpposite.setFitsSystemWindows(false);
				}
			}
		}
		else
		{
			if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP)
			{
				DrawerLayout.LayoutParams drawerContainerRelativeLayoutParams = (DrawerLayout.LayoutParams) drawerContainer.getLayoutParams();
				drawerContainerRelativeLayoutParams.setMargins(0, (AdaptersHelper.getStatusBarHeight(mActivity) * -1), 0, 0);
				drawerContainer.setLayoutParams(drawerContainerRelativeLayoutParams);
			}
		}
	}

	private IDataView initializeDrawerFragment(FragmentTransaction transaction, Target target, boolean isMain)
	{
		if (mComponents.get(target) != null)
		{
			// Initialize the drawer fragment.
			return initializeFragment(transaction, target, isMain);
		}
		else
		{
			// Lock drawer if no fragment will be shown in it.
			int drawerGravity = SlideNavigationTargets.getGravity(target);
			//noinspection ResourceType
			mDrawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_LOCKED_CLOSED, drawerGravity);
			return null;
		}
	}

	private void afterStart()
	{
		// Run the startup action.
		if (MyApplication.getApp().getSlidePositionRight())
		{
			if (mTargets.getFragment(Target.Right) != null && mComponents.PendingAction != null)
			{
				mTargets.getFragment(Target.Right).runAction(mComponents.PendingAction, null);
				mComponents.PendingAction = null;
			}
		}
		else
		{
			if (mTargets.getFragment(Target.Left) != null && mComponents.PendingAction != null)
			{
				mTargets.getFragment(Target.Left).runAction(mComponents.PendingAction, null);
				mComponents.PendingAction = null;
			}
		}

		mStartupComplete = true;

		syncDrawerState();
	}

	@Override
	public boolean showTarget(String targetName)
	{
		if (SlideNavigation.TARGET_LEFT.isTarget(targetName))
		{
			if (mComponents.get(Target.Left) != null)
			{
				mDrawerLayout.closeDrawer(GravityCompat.END);
				mDrawerLayout.openDrawer(GravityCompat.START);
				return true;
			}
		}
		else if (SlideNavigation.TARGET_CONTENT.isTarget(targetName))
		{
			mDrawerLayout.closeDrawer(GravityCompat.START);
			mDrawerLayout.closeDrawer(GravityCompat.END);
			return true;
		}
		else if (SlideNavigation.TARGET_RIGHT.isTarget(targetName))
		{
			if (mComponents.get(Target.Right) != null)
			{
				mDrawerLayout.closeDrawer(GravityCompat.START);
				mDrawerLayout.openDrawer(GravityCompat.END);
				return true;
			}
		}

		return false;
	}

	@Override
	public boolean hideTarget(String targetName)
	{
		// Slide Navigation has no implementation for hide targets, at least for now.
		return false;
	}

	@Override
	public boolean isTargetVisible(String targetName)
	{
		// default return true, target are always visible
		return true;
	}

	@NonNull
	@Override
	public NavigationHandled handle(final UIObjectCall call, Intent callIntent)
	{
		CallOptions callOptions = CallOptionsHelper.getCallOptions(call.getObject(), call.getMode());

		if (CallTarget.BLANK.isTarget(callOptions))
			return NavigationHandled.NOT_HANDLED; // Always create a new Activity for a Target=Blank call.

		if (StandardNavigationController.handlePopup(mActivity, call))
			return NavigationHandled.HANDLED_WAIT_FOR_RESULT; // Wait for popup/callout output.

		if (!canCreateFragment(call))
			return NavigationHandled.NOT_HANDLED; // We cannot perform this action locally, so always call a new activity.

		Target target;
		boolean isReplace;
		boolean isForcedReplace = callOptions.getCallType() == CallType.REPLACE;

		// If the call specifies a custom target, it's implicit to be replace.
		if (SlideNavigation.TARGET_LEFT.isTarget(callOptions))
		{
			target = Target.Left;
			isReplace = true;
		}
		else if (SlideNavigation.TARGET_CONTENT.isTarget(callOptions))
		{
			target = Target.Content;
			isReplace = true;
		}
		else if (SlideNavigation.TARGET_RIGHT.isTarget(callOptions))
		{
			target = Target.Right;
			isReplace = true;
		}
		else
		{
			// No (or invalid) target: Use default behavior.
			target = Target.Content;
			boolean isFromLeft = (mTargets.getFragment(Target.Left) != null &&
								  call.getContext().getDataView() == mTargets.getFragment(Target.Left));

			boolean isFromRight = (mTargets.getFragment(Target.Right) != null &&
					call.getContext().getDataView() == mTargets.getFragment(Target.Right));

			if (MyApplication.getApp().getSlidePositionRight())
				isReplace = (isFromRight || isForcedReplace);
			else
				isReplace = (isFromLeft || isForcedReplace);
		}

		// We currently don't have PUSH, so any non-replaces are handled as standard calls.
		if (!isReplace)
			return NavigationHandled.NOT_HANDLED;

		// Executing from menu, but we are NOT currently in a hub?
		// We want to execute a new activity, but signal it that it's a hub.
		if (!mComponents.IsHub && target == Target.Content && !isForcedReplace)
		{
			callIntent.putExtra(SlideNavigation.INTENT_EXTRA_IS_HUB_CALL, true);
			return NavigationHandled.NOT_HANDLED;
		}

		// Run the specified component by replacing fragment in this activity.
		// Subsequent lines in the event (if any) execute immediately.
		final Target replaceTarget = target;
		Services.Device.runOnUiThread(new Runnable()
		{
			@Override
			public void run() { replaceFragment(call, replaceTarget); }
		});

		return NavigationHandled.HANDLED_CONTINUE;
	}

	private boolean canCreateFragment(UIObjectCall call)
	{
		// TODO: Should this be in GenexusActivity?
		// The only unsupported thing is an edit fragment.
		return (call.getObject() != null && call.getMode() == LayoutModes.VIEW);
	}

	@SuppressWarnings("ResourceType") // @EdgeGravity is not public!
	private void replaceFragment(UIObjectCall data, Target target)
	{
		if (!mActivity.isActive())
		{
			mPendingReplace = new Pair<>(data, target);
			return;
		}

		// Close the virtual keyboard. The focus was either in the old fragment (which is destroyed)
		// or inside the drawer (which is closed). In both cases, it should not be visible anymore.
		KeyboardUtils.hideKeyboard(mActivity);

		// If there was a previous fragment, discard it.
		IDataView previousFragment = mTargets.getFragment(target);
		if (previousFragment != null)
			mActivity.destroyComponent((BaseFragment) previousFragment);

		ComponentParameters params = data.toComponentParams();
		mComponents.set(target, params);

		ComponentId id = SlideNavigationTargets.getComponentId(target);
		ComponentUISettings uiSettings = new ComponentUISettings(target == Target.Content, null, mTargets.getSize(mActivity, target, params));

		BaseFragment newFragment = mActivity.createComponent(id, params, uiSettings, data.getContext().getConnectivitySupport());
		IDataView newDataView = (IDataView)newFragment;
		mTargets.putFragment(target, newDataView);

		// TODO: Should use BackStack depending on data.getCallOptions().
		FragmentTransaction transaction = mActivity.getSupportFragmentManager().beginTransaction();
		prepareFragmentTransaction(transaction, data);
		transaction.replace(SlideNavigationTargets.getTargetViewId(target), newFragment);
		transaction.commit();

		ILayoutDefinition layout = null;
		if (data.getObjectLayout() != null)
		{
			layout = data.getObjectLayout();
		}

		if (target == Target.Content)
		{
			// For content, set title and hide the menu (show content full-screen).
			DataViewHelper.setTitle(mActivity, newDataView, data.getObject().getCaption());
			mDrawerLayout.closeDrawer(SlideNavigationTargets.getGravity(Target.Left));
			mDrawerLayout.closeDrawer(SlideNavigationTargets.getGravity(Target.Right));

			if (layout != null)
			{
				StandardNavigationController.setupActionBarInitLayout(mActivity, layout, false, true);
			}
			// Allow header row for the main fragment (content).
			newFragment.setAllowHeaderRow(true);

			// if content target hide / show back button do it here.
			ActionBar actionBar = mActivity.getSupportActionBar();
			if (actionBar != null )
			{
				// default visible, other replace could change it.
				actionBar.setDisplayHomeAsUpEnabled(true);

				// if has an empty back event , do not show it
				ActionDefinition actionBack = newDataView.getDefinition().getEvent(Events.BACK);
				// do not change slide menu icon visible for replace in main slide menu content (IsHub).
				if (actionBack != null && !mComponents.IsHub
						&& StandardNavigationController.isEmptyEvent(actionBack) )
					actionBar.setDisplayHomeAsUpEnabled(false);
			}
		}
		else
		{
			if (layout != null)
			{
				// setup new drawer size and position
				setupDrawerFitsSystemWindows(target, layout);
			}

			// Drawer may have been locked, unlock it.
			mDrawerLayout.setDrawerLockMode(DrawerLayout.LOCK_MODE_UNLOCKED, SlideNavigationTargets.getGravity(target));

			// If showing drawer on an open Target (e.g. CallType = Replace on itself) set it as Active.
			if (mDrawerLayout.isDrawerOpen(SlideNavigationTargets.getGravity(target)))
				newDataView.setActive(true);
		}
	}

	private static void prepareFragmentTransaction(FragmentTransaction transaction, UIObjectCall data)
	{
		CallOptions callOptions = CallOptionsHelper.getCallOptions(data.getObject(), data.getMode());
		FragmentLauncher.applyCallOptions(transaction, data.getObject(), callOptions);
	}

	private class DrawerToggle extends ActionBarDrawerToggle
	{
		public DrawerToggle(Activity activity, DrawerLayout drawerLayout)
		{
			super(activity, drawerLayout, 0, 0);
		}

		private IDataView getDrawerFragmentFromDrawerView(View view)
		{
			if (view.getId() == R.id.right_drawer)
				return mTargets.getFragment(Target.Right);
			else
				return mTargets.getFragment(Target.Left);
		}

		@Override
		public void onDrawerClosed(View drawerView)
		{
			IDataView drawerFragment = getDrawerFragmentFromDrawerView(drawerView);
			if (drawerFragment != null)
				drawerFragment.setActive(false);
		}

		@Override
		public void onDrawerOpened(View drawerView)
		{
			KeyboardUtils.hideKeyboard(mActivity);

			IDataView drawerFragment = getDrawerFragmentFromDrawerView(drawerView);
			if (drawerFragment != null)
				drawerFragment.setActive(true);
		}
	}

	@Override
	public void onPostCreate(Bundle savedInstanceState)
	{
		syncDrawerState();
	}

	private void syncDrawerState()
	{
		if (mDrawerToggle != null)
			mDrawerToggle.syncState();
	}

	@Override
	public void onConfigurationChanged(Configuration newConfig)
	{
		if (mDrawerToggle != null)
			mDrawerToggle.onConfigurationChanged(newConfig);
	}

	@Override
	public void saveActivityState(LayoutFragmentActivityState outState)
	{
		if (mComponents != null)
			mComponents.saveTo(outState);

		if (mTargets != null)
			mTargets.saveStateTo(outState);
	}

	@Override
	public void onPostResume()
	{
		if (mTargets == null)
			return; // onCreate() was not called? Probably because the activity is being destroyed.

		// Only execute if OnCreate is ended. probably a size change.
		if (!mOnCreateComplete)
			return;

		if (!mStartupComplete)
		{
			// If startup was aborted due to a login call, continue it now.
			if (!mActivity.isLoginPending())
				afterStart();
		}
		else
		{
			Pair<UIObjectCall, Target> pendingReplace = mPendingReplace;
			mPendingReplace = null;

			// Fire the replaceFragment() operation that was ignored the last time
			// (e.g. due to calling the login activity).
			if (pendingReplace != null)
				replaceFragment(pendingReplace.first, pendingReplace.second);
		}
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{
		if (item.getItemId() == android.R.id.home)
		{
			if (mComponents.IsHub)
			{
				mDrawerToggle.onOptionsItemSelected(item);
				return true; // Bug: ActionBarDrawerToggle.onOptionsItemSelected() always return false. Change to return when it's fixed.
			}
			else
			{
				// Not a hub, use as back (try with Back event first).
				if (mActivity.getController() == null || !mActivity.getController().handleOnBackPressed())
					ActivityFlowControl.finishWithCancel(mActivity);

				return true;
			}
		}

		return false;
	}

	@Override
	public List<IInspectableComponent> getActiveComponents() {
		List<IInspectableComponent> activeComponents = new ArrayList<>();

		IInspectableComponent content = mTargets.getFragment(Target.Content);
		if (content != null) {
			activeComponents.add(content);
		}

		ActivityHelper.addApplicationBarComponent(mActivity, activeComponents);

		for (Target target : Arrays.asList(Target.Left, Target.Right)) {
			if (mDrawerLayout.isDrawerOpen(SlideNavigationTargets.getGravity(target))) {
				activeComponents.add(mTargets.getFragment(target));
			}
		}

		return activeComponents;
	}

	@Override
	public DashboardItem getMenuItemDefinition(String itemName)
	{
		return null;
	}
}
