package com.artech.ui.navigation.controllers;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.fragment.app.DialogFragment;
import androidx.fragment.app.FragmentTransaction;
import androidx.appcompat.app.ActionBar;
import android.util.Pair;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import android.widget.RelativeLayout;

import com.artech.R;
import com.artech.actions.ActionFactory;
import com.artech.actions.CompositeAction;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityFlowControl;
import com.artech.activities.ActivityHelper;
import com.artech.activities.GenexusActivity;
import com.artech.activities.IntentParameters;
import com.artech.adapters.AdaptersHelper;
import com.artech.android.layout.OrientationLock;
import com.artech.app.ComponentId;
import com.artech.app.ComponentParameters;
import com.artech.app.ComponentUISettings;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.DashboardItem;
import com.artech.base.metadata.Events;
import com.artech.base.metadata.ILayoutDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.enums.GxObjectTypes;
import com.artech.base.metadata.layout.Size;
import com.artech.base.metadata.theme.ThemeApplicationBarClassDefinition;
import com.artech.compatibility.CompatibilityHelper;
import com.artech.fragments.BaseFragment;
import com.artech.fragments.IInspectableComponent;
import com.artech.fragments.LayoutFragmentActivityState;
import com.artech.resources.BuiltInResources;
import com.artech.ui.navigation.CallOptions;
import com.artech.ui.navigation.CallOptionsHelper;
import com.artech.ui.navigation.CallType;
import com.artech.ui.navigation.NavigationHandled;
import com.artech.ui.navigation.UIObjectCall;

import java.util.ArrayList;
import java.util.List;

public class StandardNavigationController extends AbstractNavigationController
{
	private final GenexusActivity mActivity;

	private static final ComponentId COMPONENT_POPUP = new ComponentId(null, "POPUP");

	public StandardNavigationController(GenexusActivity activity)
	{
		mActivity = activity;
	}

	@Override
	public Pair<View, Boolean> onPreCreate(Bundle savedInstanceState, ComponentParameters mainParams)
	{
		boolean useStatusBar = false;
		// EnabledHeaderRowPattern
		if (mActivity.getMainLayout() != null && mActivity.getMainLayout().getEnableHeaderRowPattern())
		{
			//set up new drawer properties.
			// ActionBar EnableHeaderRowPattern
			ActivityHelper.setActionBarOverlay(mActivity);
			// StatusBar EnableHeaderRowPattern
			ActivityHelper.setStatusBarOverlay(mActivity);

			useStatusBar = true;
		}

		mActivity.setContentView(R.layout.standard_navigation);

		View mainView = mActivity.findViewById(R.id.main_content_insets_container);

		return new Pair<View, Boolean>( mainView, useStatusBar);
	}

	@Override
	public void onCreate(Bundle savedInstanceState)
	{

		// Set support toolbar
		ActivityHelper.setSupportActionBarAndShadow(mActivity);

		setupActionBarInitLayout(mActivity, mActivity.getMainLayout(), true, false);
	}

	public static void setupActionBarInitLayout(Activity myActivity, ILayoutDefinition layout, boolean addMargins, boolean hideShowActionBar)
	{
		if (layout != null)
		{

			if (hideShowActionBar)
			{
				if (layout.getShowApplicationBar())
					ActivityHelper.setActionBarVisibility(myActivity, true);
				else
					ActivityHelper.setActionBarVisibility(myActivity, false);
			}

			if (layout.getEnableHeaderRowPattern())
			{
				ThemeApplicationBarClassDefinition appBarClass = layout.getHeaderRowApplicationBarClass();
				if (appBarClass != null)
				{
					ActivityHelper.setActionBarThemeClass(myActivity, appBarClass);
				}

				// content over action bar
				ViewGroup contentLayout = myActivity.findViewById(R.id.content_frame);
				RelativeLayout.LayoutParams relativeLayoutParams = (RelativeLayout.LayoutParams)contentLayout.getLayoutParams();
				relativeLayoutParams.addRule(RelativeLayout.BELOW, R.id.toolbarDummyTop);
				contentLayout.setLayoutParams(relativeLayoutParams);

				if (CompatibilityHelper.isStatusBarOverlayingAvailable() && addMargins)
				{
					//add margins (size status bar) to ActionBar
					androidx.appcompat.widget.Toolbar toolbar = myActivity.findViewById(R.id.action_bar_toolbar);
					RelativeLayout.LayoutParams toolbarRelativeLayoutParams = (RelativeLayout.LayoutParams) toolbar.getLayoutParams();
					toolbarRelativeLayoutParams.setMargins(0, AdaptersHelper.getStatusBarHeight(myActivity), 0, 0);
					toolbar.setLayoutParams(toolbarRelativeLayoutParams);
				}
				return;
			}

			// Action Bar below statusbar
			if (layout.getShowApplicationBar())
			{
				// content bellow action bar
				ViewGroup contentLayout = myActivity.findViewById(R.id.content_frame);
				RelativeLayout.LayoutParams relativeLayoutParams = (RelativeLayout.LayoutParams) contentLayout.getLayoutParams();
				relativeLayoutParams.addRule(RelativeLayout.BELOW, R.id.action_bar_toolbar);
				contentLayout.setLayoutParams(relativeLayoutParams);
			}
			else
			{
				// content bellow status bar, Action bar is hidden
				ViewGroup contentLayout = myActivity.findViewById(R.id.content_frame);
				RelativeLayout.LayoutParams relativeLayoutParams = (RelativeLayout.LayoutParams) contentLayout.getLayoutParams();
				relativeLayoutParams.addRule(RelativeLayout.BELOW, R.id.statusBarDummyTop);
				contentLayout.setLayoutParams(relativeLayoutParams);
			}

			if (CompatibilityHelper.isStatusBarOverlayingAvailable() && addMargins)
			{
				//no margins to ActionBar
				androidx.appcompat.widget.Toolbar toolbar = myActivity.findViewById(R.id.action_bar_toolbar);
				RelativeLayout.LayoutParams toolbarRelativeLayoutParams = (RelativeLayout.LayoutParams) toolbar.getLayoutParams();
				toolbarRelativeLayoutParams.setMargins(0, 0, 0, 0);
				toolbar.setLayoutParams(toolbarRelativeLayoutParams);
			}

			if ( layout.getApplicationBarClass() != null)
				ActivityHelper.setActionBarThemeClass(myActivity, layout.getApplicationBarClass());
		}
	}


	@Override
	public boolean start(ComponentParameters mainParams, LayoutFragmentActivityState previousState)
	{
		BaseFragment fragment = mActivity.createComponent(ComponentId.ROOT, mainParams, ComponentUISettings.main(), null);

		ActionBar actionBar = mActivity.getSupportActionBar();
		if (actionBar != null) {
			// Add the back navigation arrow unless it's a main panel
			if (!mActivity.getIntent().hasExtra(IntentParameters.IS_STARTUP_ACTIVITY)) {
				actionBar.setDisplayHomeAsUpEnabled(true);
				actionBar.setHomeButtonEnabled(true);
			}

			// Hide the back navigation arrow if the 'Back' event is empty
			if (mActivity.getMainDefinition() != null) {
				ActionDefinition actionBack = mActivity.getMainDefinition().getEvent(Events.BACK);
				if (actionBack != null) {
					if (isEmptyEvent(actionBack))
						actionBar.setDisplayHomeAsUpEnabled(false);
				}
			}
		}

		// Allow header row for the main fragment.
		fragment.setAllowHeaderRow(true);
		FragmentTransaction fragmentTransaction = mActivity.getSupportFragmentManager().beginTransaction();
		fragmentTransaction.replace(R.id.content_frame, fragment);
		fragmentTransaction.commit();

		return true;
	}

	@NonNull
	@Override
	public NavigationHandled handle(UIObjectCall call, Intent callIntent)
	{
		if (handlePopup(mActivity, call))
			return NavigationHandled.HANDLED_WAIT_FOR_RESULT;

		// Let the action create a new activity.
		return NavigationHandled.NOT_HANDLED;
	}

	@Override
	public boolean showTarget(String targetName)
	{
		// Standard Navigation has no targets, at least for now.
		return false;
	}

	@Override
	public boolean hideTarget(String targetName)
	{
		// Standard Navigation has no targets, at least for now.
		return false;
	}

	@Override
	public boolean isTargetVisible(String targetName)
	{
		// default return true
		return true;
	}

	/**
	 * Standard popup/callout handling. Can be used by other navigations.
	 * @param call Call to (possibly) handle.
	 * @return True if handled (was a popup/callout), otherwise false.
	 */
	public static boolean handlePopup(GenexusActivity activity, UIObjectCall call)
	{
		CallOptions callOptions = CallOptionsHelper.getCallOptions(call.getObject(), call.getMode());
		if (callOptions.getCallType() == CallType.CALLOUT || callOptions.getCallType() == CallType.POPUP)
		{
			// Use DialogFragment for Callouts & Popups, consider that we don't have navigation inside this kind of dialogs
			handlePopup(activity, call, callOptions);

			// Remove global configured CallOptions after call.
			CallOptionsHelper.resetCallOptions(call.getObject().getObjectName());

			return true;
		}
		else
			return false;
	}

	private static void handlePopup(GenexusActivity activity, UIObjectCall call, CallOptions callOptions)
	{
		// Get the fragment for the given object.
		ComponentParameters parameters = call.toComponentParams();
		Size popupSize = CallOptionsHelper.getTargetSize(call, callOptions);
		ComponentUISettings uiSettings = new ComponentUISettings(false, null, popupSize);
		BaseFragment popupFragment = activity.createComponent(COMPONENT_POPUP, parameters, uiSettings, call.getContext().getConnectivitySupport());

		// only if full screen callOption call Dialog Style to avoid padding
		// http://stackoverflow.com/questions/18536439/dialogfragment-fullscreen-shows-padding-on-sides
		if (CallOptionsHelper.isFullScreen(callOptions))
		{
			int themeDialog = BuiltInResources.getResource(activity, R.style.CustomDialogDark, R.style.CustomDialogLight, R.style.CustomDialogLight);
			popupFragment.setStyle(DialogFragment.STYLE_NO_TITLE, themeDialog);
		}
		else
		{
			// dont use custom dialog style if has size, because it breaks it if used
			popupFragment.setStyle(DialogFragment.STYLE_NO_TITLE, 0);
		}

		// Today we are not using the anchor rect to give a contextual position to the dialog,
		// pass this information anyway for a different approach later.
		if (callOptions.getCallType() == CallType.CALLOUT)
			popupFragment.setDialogAnchor(call.getContext().getAnchor());


		// Show the dialog
		OrientationLock.lock(activity, OrientationLock.REASON_SHOW_POPUP);
		popupFragment.show(activity.getSupportFragmentManager(), "genexus");
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{
		if (item.getItemId() == android.R.id.home)
		{
			// Home button normally calls main. Disable it if already on main.
			if (mActivity.getMainDefinition() == MyApplication.getApp().getMain())
				return true;
			else
			{
				//home as up/back button
				// in other activities , acts like the back/up button.
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

		activeComponents.add(mActivity.getMainFragment());
		ActivityHelper.addApplicationBarComponent(mActivity, activeComponents);

		return activeComponents;
	}

	public static boolean isEmptyEvent(ActionDefinition definition)
	{
		if (definition.getActionType().equalsIgnoreCase("Action")  //is an event
				&& definition.getNextActions().size() == 0 && definition.getInnerActions().size() == 0  // has not children
				&& definition.getGxObjectType() == GxObjectTypes.NONE)
		//and has no methods to run
		{
			CompositeAction tempAction = ActionFactory.getAction(new UIContext(MyApplication.getAppContext(), Connectivity.Online), definition, null);
			if (tempAction.isEmpty())
				return true;
		}
		return false;
	}

	@Override
	public DashboardItem getMenuItemDefinition(String itemName)
	{
		// TODO , should search in main definition?
		return null;
	}
}
