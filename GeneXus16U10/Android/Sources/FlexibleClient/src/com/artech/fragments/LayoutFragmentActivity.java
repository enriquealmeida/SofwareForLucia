package com.artech.fragments;

import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.Set;

import android.app.Activity;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Pair;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.Window;
import android.view.WindowManager;

import com.artech.actions.UIContext;
import com.artech.activities.ActivityController;
import com.artech.activities.ActivityHelper;
import com.artech.activities.ActivityLauncher;
import com.artech.activities.ActivityModel;
import com.artech.activities.DataViewHelper;
import com.artech.activities.GenexusActivity;
import com.artech.activities.GxBaseActivity;
import com.artech.activities.IGxActivity;
import com.artech.adapters.AdaptersHelper;
import com.artech.android.analytics.Analytics;
import com.artech.android.gam.AuthBrowserHelper;
import com.artech.android.gam.AuthManagementActivity;
import com.artech.app.ComponentId;
import com.artech.app.ComponentParameters;
import com.artech.app.ComponentUISettings;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.ILayoutDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.enums.Orientation;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.theme.ThemeApplicationBarClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.PlatformHelper;
import com.artech.base.utils.Strings;
import com.artech.common.BiometricsHelper;
import com.artech.common.DataRequest;
import com.artech.common.SecurityHelper;
import com.artech.controllers.DataViewController;
import com.artech.controllers.DataViewModel;
import com.artech.controllers.IDataViewController;
import com.artech.controllers.RefreshParameters;
import com.artech.controllers.ViewData;
import com.artech.controls.IGxLocalizable;
import com.artech.ui.navigation.tabbed.TabbedNavigationController;
import com.artech.utils.Cast;

import androidx.annotation.NonNull;

/**
 * Base class for all activities that support fragments.
 */
public abstract class LayoutFragmentActivity extends GxBaseActivity implements IGxActivity, IDataViewHost, IGxLocalizable
{
	private ActivityController mController;
	private Set<BaseFragment> mFragments;
	private Set<IDataView> mDataViews;
	private LayoutFragment mMainFragment;

	// State
	private boolean mShouldNotSaveState;
	private boolean mLoginCalled;
	private LayoutFragmentActivityState mPreviousState;
	private boolean mPreviousUIStateRestored;
	private long mActivityTimestamp;
	private boolean mActivityDestroyedToApplyOrientation;
	private Orientation mCurrentDesiredOrientation;
	private boolean mAllowUnrestrictedOrientationChange;

	public abstract UIContext getUIContext();

	private boolean mWaitingLoginResult = false;

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		mShouldNotSaveState = false;
		mCurrentDesiredOrientation = Orientation.UNDEFINED;
		mAllowUnrestrictedOrientationChange = false;
		mWaitingLoginResult = false;

    	ActivityHelper.onBeforeCreate(this);
		super.onCreate(savedInstanceState);
		ActivityHelper.initialize(this, savedInstanceState);

		mFragments = new LinkedHashSet<>();
		mDataViews = new LinkedHashSet<>();
		mController = new ActivityController(this);

		if (!initializeController(mController))
		{
			setContentView(ActivityHelper.getInvalidMetadataMessage(this));
			return;
		}

		if (BiometricsHelper.isBlurOnBackgroundEnabled())
			getWindow().setFlags(WindowManager.LayoutParams.FLAG_SECURE, WindowManager.LayoutParams.FLAG_SECURE);

		// Restore state if changing orientation. Store it in local variable to pass to fragments later.
		mPreviousState = Cast.as(LayoutFragmentActivityState.class, getLastCustomNonConfigurationInstance());
		if (mPreviousState != null) {
			mController.restoreState(mPreviousState);
			restoreActivityState(mPreviousState);
		}

		if (getMainDefinition() != null)
		{
			LayoutDefinition mainLayout = Cast.as(LayoutDefinition.class, getMainLayout());
			if (mainLayout != null)
			{

				Orientation desiredOrientation = mainLayout.getActualOrientation();
				mCurrentDesiredOrientation = desiredOrientation;
				if (desiredOrientation != Orientation.UNDEFINED && desiredOrientation != Services.Device.getScreenOrientation()
						&& !mAllowUnrestrictedOrientationChange)
				{
					mActivityDestroyedToApplyOrientation = true;
					ActivityHelper.setOrientation(this, desiredOrientation);
					return;
				}
			}

			Services.Log.debug(String.format("Starting '%s'...", getMainDefinition().getName()));

			DataViewHelper.setTitle(this, null, getMainDefinition().getCaption());
		}
		else
		{
			// if Main and tabbed navigation. No definition, set orientation like dashboardactivity.
			// there is no mainLayout for dashboard.
			if (isTabbedNavigationController())
			{
				// get main orientation
				Orientation desiredOrientation = PlatformHelper.getDefaultOrientation();
				mCurrentDesiredOrientation = desiredOrientation;
				if (desiredOrientation != Orientation.UNDEFINED && desiredOrientation != Services.Device.getScreenOrientation()
						&& !mAllowUnrestrictedOrientationChange)
				{
					mActivityDestroyedToApplyOrientation = true;
					ActivityHelper.setOrientation(this, desiredOrientation);
					return;
				}
			}
		}

		final Pair<View, Boolean> initViewResult = preInitializeView(mController, savedInstanceState, mPreviousState);

		// if use a tabbed navigation. finish create view here.
		// Tabbed do not need cache size, it calculate it for each tabs later. Also if change draw methods (after onCreate)tabs replace fail on rotate.
		if (isTabbedNavigationController())
		{
			onCreateInitView(savedInstanceState);
			return;
		}

		Orientation deviceOrientation = Services.Device.getScreenOrientation();
		boolean hasCacheWindowSizes = AdaptersHelper.hasCacheWindowSizes(deviceOrientation);

		// calculate screen size only if necessary (cache size if not available) from main layout view
		if (!hasCacheWindowSizes)
		{
			View mainView = initViewResult.first;

			// get the correct size
			mainView.getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener()
			{
				@Override
				public void onGlobalLayout()
				{
					mainView.getViewTreeObserver().removeOnGlobalLayoutListener(this);

					View content = getWindow().findViewById(Window.ID_ANDROID_CONTENT);

					int height = 0;
					int witdh = 0;
					if (content != null)
					{
						height = content.getHeight();
						witdh = content.getWidth();
					}
					//View rootView = mContentView.getFirstChild();
					Services.Log.debug("LayoutFragmentActivity view size height : " + height);
					Services.Log.debug("LayoutFragmentActivity view size width : " + witdh);

					Services.Log.debug("orientation : " + deviceOrientation.toString());

					// if use status bar., use boolean to know if rest status bar or not.
					AdaptersHelper.cacheWindowSizes(LayoutFragmentActivity.this, deviceOrientation, height, witdh, initViewResult.second);

					//actually set content view.
					onCreateInitView(savedInstanceState);
					onResume();
				}
			});
		}
		else
		{
			//actually set content view.
			onCreateInitView(savedInstanceState);
		}
	}

	public void onCreateInitView(Bundle savedInstanceState)
	{
		//actually set content view.
		initializeView(mController, savedInstanceState, mPreviousState);

		// Hide title bar if MAIN data view instructs it. This must be done after calling setContentView().
		if (getMainLayout() != null && !getMainLayout().getShowApplicationBar())
			ActivityHelper.setActionBarVisibilityForNavigationController(this, false);

		ActivityHelper.applyStyle(this, getMainLayout());

		// Analytics tracking.
		Analytics.onActivityStart(this);

		mActivityTimestamp = System.nanoTime();
	}

	@Override
	public IDataViewDefinition getMainDefinition()
	{
		if (mController != null && mController.getModel() != null && mController.getModel().getMain() != null)
			return mController.getModel().getMain().getDefinition();
		else
			return null;
	}

	@Override
	public ILayoutDefinition getMainLayout()
	{
		// TODO: This is a redundant calculation; should be done somewhere else.
		if (mController != null && mController.getModel() != null && mController.getModel().getMain() != null)
		{
			DataViewModel model = mController.getModel().getMain();
			if (model.getDefinition() != null)
				return model.getDefinition().getLayoutForMode(model.getParams().Mode);
		}

		return null;
	}

	public void setAllowUnrestrictedOrientationChange(boolean allow) {
		mAllowUnrestrictedOrientationChange = allow;

		if (!allow && !mCurrentDesiredOrientation.equals(Services.Device.getScreenOrientation())) {
			ActivityHelper.setOrientation(this, mCurrentDesiredOrientation);
		}
	}

	protected abstract boolean initializeController(ActivityController controller);
	protected abstract Pair<View, Boolean> preInitializeView(ActivityController controller, Bundle savedInstanceState, LayoutFragmentActivityState previousState);
	protected abstract boolean initializeView(ActivityController controller, Bundle savedInstanceState, LayoutFragmentActivityState previousState);

	protected void registerFragment(BaseFragment fragment)
	{
		mFragments.add(fragment);
	}

	protected void unregisterFragment(BaseFragment fragment)
	{
		mFragments.remove(fragment);
	}

	protected void initializeLayoutFragment(LayoutFragment component, ComponentId id, ComponentParameters params, ComponentUISettings uiSettings, Connectivity parentConnectivity)
	{
		mDataViews.add(component);

		UIContext parentContext = getUIContext();
		// change the connectivity when necessary, do not touch if inherit (parent could not be inherit)
		if (parentConnectivity!=null &&  (parentConnectivity!=Connectivity.Inherit)
				&& !parentConnectivity.equals(parentContext.getConnectivitySupport()) )
		{
			parentContext = new UIContext(parentContext, parentConnectivity);
		}

		IDataViewController controller = mController.getController(parentContext, component, id, params);
		component.initialize(parentContext.getConnectivitySupport(), this, (LayoutFragment)uiSettings.parent, controller);

		if (uiSettings.size != null)
			component.setDesiredSize(uiSettings.size);

		if (uiSettings.isMain)
		{
			mMainFragment = component;
			LayoutDefinition mainLayout = component.getLayout();

			if (mainLayout != null)
			{
				// Change orientation if MAIN data view asks to do so.
				Orientation desiredOrientation = mainLayout.getActualOrientation();
				if (desiredOrientation != Orientation.UNDEFINED)
				{
					// Make sure ALL activity stops before CHANGING orientation.
					// Otherwise controllers may return with data for the now-defunct activity.
					if (desiredOrientation != Services.Device.getScreenOrientation())
					{
						mController.onDestroy();
						mActivityDestroyedToApplyOrientation = true;
					}

					// Request a FIXED orientation if needed.
					// This could mean rotating now (if current orientation is different) or preventing a future rotation.
					mCurrentDesiredOrientation = desiredOrientation;
					if (!mainLayout.isOrientationSwitchable() && !mAllowUnrestrictedOrientationChange) {
						ActivityHelper.setOrientation(this, desiredOrientation);
					}
				}
			}

		}

		// Restore state associated to this DV.
		restoreFragmentState(component);

		// Main data view is always active.
		if (uiSettings.isMain)
			component.setActive(true);
	}

	protected void checkSecurity(UIContext context, ComponentParameters params) {
		// If entering a restricted data view, redirect to login.
		// Must be done at the end of this method (after expanding layout), because successful login will return here.
		// Also, only call login ONCE per activity (without flag, it may be called once by detail and once by inline section).
		if (!mLoginCalled && SecurityHelper.callLoginIfNecessary(context, params.Object))
		{
			mLoginCalled = true;
			Services.Log.debug(String.format("Redirecting from '%s' startup to login.", params.Object));
		}
	}

	protected void restoreFragmentState(BaseFragment fragment)
	{
		if (mPreviousState != null)
		{
			LayoutFragmentState fragmentState = mPreviousState.getState(fragment.getUri());
			if (fragmentState != null)
			{
				if (fragment instanceof LayoutFragment)
				{
					LayoutFragment layoutFragment = (LayoutFragment)fragment;
					if (fragmentState.getData() != null && !fragmentState.getData().isEmpty())
					{
						// Set entity from saved state.
						ViewData data = ViewData.customData(fragmentState.getData(), DataRequest.RESULT_SOURCE_LOCAL);
						((DataViewController)layoutFragment.getController()).restoreRootData(data);
						layoutFragment.update(data);
					}
				}

				// Opportunity to restore custom state.
				fragment.restoreFragmentState(fragmentState);
			}
		}
	}

	public boolean isLoginPending()
	{
		return mLoginCalled;
	}

	protected void finalizeLayoutFragment(LayoutFragment dataView)
	{
		mDataViews.remove(dataView);
		mController.remove(dataView);
		dataView.setActive(false);
	}

	protected void registerDashboardFragment(DashboardFragment dataView)
	{
		mDataViews.add(dataView);
		dataView.setActive(true);
	}

	@Override
	public Iterable<IDataView> getDataViews()
	{
		return mDataViews;
	}

	@Override
	public Iterable<IDataView> getActiveDataViews(boolean includeNoLayoutDataViews)
	{
		ArrayList<IDataView> activeViews = new ArrayList<>();
		for (IDataView dataView : mDataViews)
			if (dataView.isActive() && (includeNoLayoutDataViews || dataView.getLayout() != null) )
				activeViews.add(dataView);

		return activeViews;
	}

	@Override
	public ActivityModel getModel()
	{
		return mController.getModel();
	}

	@Override
	public ActivityController getController()
	{
		return mController;
	}

	@Override
	protected void onStart()
	{
		super.onStart();
		ActivityHelper.onStart(this);
	}

	@Override
	protected void onNewIntent(Intent intent)
	{
		super.onNewIntent(intent);
		ActivityHelper.onNewIntent(this, intent);
	}

	@Override
	protected void onResume()
	{
		super.onResume();

		if (!ActivityHelper.onResume(this))
			return;

		// Restore global activity state.
		if (mPreviousState != null && !mPreviousUIStateRestored)
		{
			restoreActivityUIState(mPreviousState);
			mPreviousUIStateRestored = true;
		}

		mController.onResume();

		if ( Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP)
		{
			// special case, handle login external result for 4.x devices.
			if (mWaitingLoginResult && AuthManagementActivity.resultIntent != null)
			{
				// When this code is deleted, also delete the constant AuthBrowserHelper.ACTION_CODE
				this.onActivityResult(AuthBrowserHelper.ACTION_CODE, AuthManagementActivity.resultCode, AuthManagementActivity.resultIntent);
				mWaitingLoginResult = false;
			}
		}
	}

	@Override
	protected void onPause()
	{
		ActivityHelper.onPause(this);
		mController.onPause();
		super.onPause();
	}

	@Override
	public void refreshData(RefreshParameters params)
	{
		mController.onRefresh(params);
	}

	@Override
	public boolean onCreateOptionsMenu(Menu menu)
	{
		if (mController != null)
			return mController.onCreateOptionsMenu(menu);

		return false;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item)
	{
		return mController.onOptionsItemSelected(item);
	}

	@Override
	protected void onSaveInstanceState(Bundle outState) {
		super.onSaveInstanceState(outState);
		ActivityHelper.onSaveInstanceState(this, outState);
	}


	@Override
	public void onActivityResult(int requestCode, int resultCode, Intent data)
	{
		if ( Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP)
		{
			// special case, handle login external result for 4.x devices.
			if (AuthManagementActivity.ignoreActivityResult && requestCode == AuthBrowserHelper.ACTION_CODE
					&& resultCode == Activity.RESULT_CANCELED && data == null)
			{
				mWaitingLoginResult = true;
				return;
			}
		}

		// Handle action continuation and refresh/reload on activity result.
		mController.onActivityResult(requestCode, resultCode, data);
		ActivityHelper.onActivityResult(this, requestCode, resultCode, data);
		mLoginCalled = false;
	}

	@Override
	public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults)
	{
		mController.onRequestPermissionsResult(requestCode, permissions, grantResults);
	}

	@Override
	public boolean onSearchRequested()
	{
		return mController.onSearchRequested();
	}

	@Override
	public final Object onRetainCustomNonConfigurationInstance()
	{
		LayoutFragmentActivityState state = null;
		if (mActivityDestroyedToApplyOrientation)
			state = mPreviousState;
		else {
			// Fix for (at least) Samsung Galaxy bug: when the camera is invoked and returns, the activity
			// may be rotated twice very quickly. In that case, the 2nd, interim activity doesn't get the
			// data from the taken photo into the control, and when it's asked to copy control data into the
			// entity, overwrites the correct value.
			// As a temporary fix, assume that an activity with a very short lifetime doesn't have any changed data.
			long lifetimeMillis = (System.nanoTime() - mActivityTimestamp) / 1000000;
			if (mPreviousState != null && lifetimeMillis < 800) {
				state = mPreviousState;
			} else if (!mShouldNotSaveState) {
				state = new LayoutFragmentActivityState();
				if (mController != null)
					mController.saveState(state);

				saveActivityState(state);

				for (BaseFragment fragment : mFragments)
					state.saveState(fragment);
			}
		}

		if (state != null && needsToApplyCurrentTheme())
			state.removeProperty(STATE_ACTION_BAR_THEME_CLASS); // Do it here for recreate() to work when the theme is changed

		return state;
	}

	private static final String STATE_ACTION_BAR_THEME_CLASS = "ActionBar::ThemeClass";
	private static final String ALLOW_UNRESTRICTED_ORIENTATION_CHANGE = "::AllowUnrestrictedOrientationChange";
	private static final String CURRENT_DESIRED_ORIENTATION = "::CurrentDesiredOrientation";

	/**
	 * Override to save custom state (for orientation change).
	 */
	protected void saveActivityState(LayoutFragmentActivityState state)
	{
		state.setProperty(STATE_ACTION_BAR_THEME_CLASS, ActivityHelper.getActionBarThemeClass(this));
		state.setProperty(ALLOW_UNRESTRICTED_ORIENTATION_CHANGE, mAllowUnrestrictedOrientationChange);
		state.setProperty(CURRENT_DESIRED_ORIENTATION, mCurrentDesiredOrientation);
	}

	/**
	 * Override to restore custom state (from orientation change).
	 */
	protected void restoreActivityState(LayoutFragmentActivityState state)
	{
		mAllowUnrestrictedOrientationChange = state.getBooleanProperty(ALLOW_UNRESTRICTED_ORIENTATION_CHANGE, false);
		mCurrentDesiredOrientation = state.getProperty(Orientation.class, CURRENT_DESIRED_ORIENTATION);
	}

	protected void restoreActivityUIState(LayoutFragmentActivityState state) {
		ActivityHelper.setActionBarThemeClass(this, state.getProperty(ThemeApplicationBarClassDefinition.class, STATE_ACTION_BAR_THEME_CLASS));
	}

	@Override
	public void setReturnResult()
	{
		Intent data = new Intent();

		if (mMainFragment != null)
			mMainFragment.setReturnResult(data);

		setResult(Activity.RESULT_OK, data);
	}

	@Override
	public void onBackPressed()
	{
		if (mController != null && mController.handleOnBackPressed())
			return;

		super.onBackPressed();
	}

	@Override
	public void finish()
	{
		Services.Device.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				LayoutFragmentActivity.super.finish();
				ActivityLauncher.onReturn(LayoutFragmentActivity.this, getIntent());
			}
		});
	}

	@Override
	public void onStop()
	{
		Analytics.onActivityStop(this);
		ActivityHelper.onStop(this);
		super.onStop();
	}

	@Override
	protected void onDestroy()
	{
		if (mController != null)
			mController.onDestroy();

		ActivityHelper.onDestroy(this);
		super.onDestroy();
	}

	@Override
	public void onTranslationChanged() {
		if (getMainDefinition() != null && Strings.hasValue(getMainDefinition().getCaption())) {
			DataViewHelper.setTitle(this, null, getMainDefinition().getCaption());
		}
	}

	public LayoutFragment getMainFragment() {
		return mMainFragment;
	}

	public void setShouldNotSaveState(boolean shouldNotSaveState) {
		mShouldNotSaveState = shouldNotSaveState;
	}

	private boolean isTabbedNavigationController()
	{
		if (this instanceof GenexusActivity)
		{
			GenexusActivity activity = (GenexusActivity) this;
			if (activity.getNavigationController() instanceof TabbedNavigationController)
			{
				return true;
			}
		}
		return false;
	}
}
