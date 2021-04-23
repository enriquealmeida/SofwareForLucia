package com.artech.activities;

import java.util.Collections;

import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Pair;
import android.view.KeyEvent;
import android.view.MenuItem;
import android.view.View;

import com.artech.actions.UIContext;
import com.artech.app.ComponentId;
import com.artech.app.ComponentParameters;
import com.artech.app.ComponentUISettings;
import com.artech.application.MyApplication;
import com.artech.base.metadata.DashboardMetadata;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.enums.DisplayModes;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.fragments.BaseFragment;
import com.artech.fragments.DashboardFragment;
import com.artech.fragments.FragmentFactory;
import com.artech.fragments.IDataView;
import com.artech.fragments.LayoutFragment;
import com.artech.fragments.LayoutFragmentActivity;
import com.artech.fragments.LayoutFragmentActivityState;
import com.artech.ui.navigation.INavigationActivity;
import com.artech.ui.navigation.Navigation;
import com.artech.ui.navigation.NavigationController;
import com.artech.ui.navigation.controllers.StandardNavigationController;

import androidx.annotation.NonNull;

public class GenexusActivity extends LayoutFragmentActivity implements INavigationActivity
{
	private boolean mIsActive;
	private NavigationController mNavigationController = new StandardNavigationController(this);
	private ComponentParameters mMainParams;

	@Override
	protected boolean initializeController(ActivityController controller)
	{
		Intent intent = getIntent();
		if (controller.initializeFrom(getIntent()))
		{
			mMainParams = controller.getModel().getMain().getParams();
		}
		else if (Strings.hasValue(intent.getStringExtra(IntentParameters.DASHBOARD_METADATA)))
		{
			DashboardMetadata mainViewDefinition = (DashboardMetadata) Services.Application.getPattern(intent.getStringExtra(IntentParameters.DASHBOARD_METADATA));
			// Only create main Params if has a valid definition.
			if (mainViewDefinition!=null)
				mMainParams = new ComponentParameters(mainViewDefinition, DisplayModes.VIEW, Collections.emptyList());
		}

		if (mMainParams != null)
			mNavigationController = Navigation.createController(this, mMainParams.Object);

		return (mMainParams != null);
	}

	@Override
	protected Pair<View, Boolean> preInitializeView(ActivityController controller, Bundle savedInstanceState, LayoutFragmentActivityState previousState)
	{
		return mNavigationController.onPreCreate(savedInstanceState, mMainParams);
	}

	@Override
	protected boolean initializeView(ActivityController controller, Bundle savedInstanceState, LayoutFragmentActivityState previousState)
	{
		mNavigationController.onCreate(savedInstanceState);
		return mNavigationController.start(mMainParams, previousState);
	}

	@Override
	public NavigationController getNavigationController()
	{
		return mNavigationController;
	}

	@Override
	public UIContext getUIContext()
	{
		return getController().getModel().getUIContext();
	}

	@NonNull
	@Override
	public BaseFragment createComponent(@NonNull ComponentId id, @NonNull ComponentParameters parameters, @NonNull ComponentUISettings uiSettings, Connectivity parentConnectivity)
	{
		BaseFragment fragment = FragmentFactory.newFragment(parameters);
		initializeComponent(fragment, id, parameters, uiSettings, parentConnectivity);
		registerFragment(fragment);

		if (uiSettings.isMain) {
			String action = getIntent().getStringExtra(StartupActivity.EXTRA_NOTIFICATION_ACTION);
			String params = getIntent().getStringExtra(StartupActivity.EXTRA_NOTIFICATION_PARAMS);
			if (!TextUtils.isEmpty(action)) {
				Services.Notifications.executeNotificationAction(this, action, params);
			}
		}

		return fragment;
	}

	private void initializeComponent(BaseFragment fragment, ComponentId id, ComponentParameters params, ComponentUISettings uiSettings, Connectivity parentConnectivity)
	{
		if (fragment != null)
		{
			UIContext context = fragment.getUIContext();
			if (context.getActivity() == null)
				context = getUIContext(); // Workaround: Fragment.getActivity() is null until the fragment has been attached.

			if (params.Object instanceof IDataViewDefinition)
			{
				LayoutFragment layoutFragment = (LayoutFragment)fragment;
				initializeLayoutFragment(layoutFragment, id, params, uiSettings, parentConnectivity);
				layoutFragment.setDesiredSize(uiSettings.size);
			}
			else if (params.Object instanceof DashboardMetadata)
			{
				DashboardFragment dashboardFragment = (DashboardFragment)fragment;
				dashboardFragment.initialize((DashboardMetadata)params.Object, getUIContext().getConnectivitySupport());
				// register dashboardFragment as other fragment do in initialize
				registerDashboardFragment(dashboardFragment);
				restoreFragmentState(dashboardFragment);
			}

			String objectName = params.Object.getObjectName();
			String loginObjectName = MyApplication.getApp().getLoginObject();

			// Don't launch another GAM Login panel if we're already in it
			if (objectName != null && !objectName.equals(loginObjectName)) {
				checkSecurity(context, params);
			}

			Services.Application.notifyComponentInitialized((IDataView) fragment);
		}
	}

	@Override
	public void destroyComponent(BaseFragment fragment)
	{
		for (BaseFragment child : fragment.getChildFragments())
			destroyComponent(child);

		if (fragment instanceof LayoutFragment)
		{
			// Requires custom finalization.
			LayoutFragment layoutFragment = (LayoutFragment)fragment;
			finalizeLayoutFragment(layoutFragment);
		}

		unregisterFragment(fragment);
	}

	public boolean isActive()
	{
		return mIsActive;
	}

	// *************************************************************************
	// Forwarding of events to NavigationController.
	// *************************************************************************

	@Override
	public void onPostCreate(Bundle savedInstanceState)
	{
		super.onPostCreate(savedInstanceState);
		mNavigationController.onPostCreate(savedInstanceState);
	}

	@Override
	public void onResume()
	{
		super.onResume();
		mIsActive = true;
		mNavigationController.onResume();
	}

	@Override
	public void onPostResume()
	{
		super.onPostResume();
		mNavigationController.onPostResume();
	}

	@Override
	public void onConfigurationChanged(Configuration newConfig)
	{
		super.onConfigurationChanged(newConfig);
		mNavigationController.onConfigurationChanged(newConfig);

		Services.Log.debug("Activity on onConfigurationChanged");
	}

	@Override
	protected void onSaveInstanceState(Bundle outState)
	{
		super.onSaveInstanceState(outState);
		mNavigationController.onSaveInstanceState(outState);
	}

	@Override
	protected void saveActivityState(LayoutFragmentActivityState outState)
	{
		super.saveActivityState(outState);
		mNavigationController.saveActivityState(outState);
	}

	@Override
	protected void onPause()
	{
		mNavigationController.onPause();
		mIsActive = false;
		super.onPause();
	}

	public void setTitle(CharSequence title, IDataView fromDataView)
	{
		if (mNavigationController.setTitle(fromDataView, title))
			return;

		// Default implementation.
		setTitle(title);
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{
		if (mNavigationController.onOptionsItemSelected(item))
			return true;

		return super.onOptionsItemSelected(item);
	}

	@Override
	public boolean onKeyUp(int keyCode, @NonNull KeyEvent event)
	{
		if (mNavigationController.onKeyUp(keyCode, event))
			return true;

		return super.onKeyUp(keyCode, event);
	}
	
	@Override
	public void onBackPressed()
	{
		if (mNavigationController.onBackPressed())
			return;

		super.onBackPressed();
	}	
}
