package com.artech.ui.navigation.split;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.NonNull;
import androidx.fragment.app.FragmentTransaction;
import android.util.Pair;
import android.view.View;

import com.artech.R;
import com.artech.activities.ActivityHelper;
import com.artech.activities.GenexusActivity;
import com.artech.android.ViewUtil;
import com.artech.app.ComponentId;
import com.artech.app.ComponentParameters;
import com.artech.app.ComponentUISettings;
import com.artech.base.metadata.DashboardItem;
import com.artech.base.metadata.DetailDefinition;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.WWListDefinition;
import com.artech.base.metadata.enums.LayoutModes;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.layout.Size;
import com.artech.fragments.BaseFragment;
import com.artech.fragments.IDataView;
import com.artech.fragments.LayoutFragmentActivityState;
import com.artech.ui.navigation.CallOptions;
import com.artech.ui.navigation.CallOptionsHelper;
import com.artech.ui.navigation.CallTarget;
import com.artech.ui.navigation.NavigationHandled;
import com.artech.ui.navigation.UIObjectCall;
import com.artech.ui.navigation.controllers.AbstractNavigationController;
import com.artech.ui.navigation.controllers.StandardNavigationController;

/**
 * "Split" Navigation Controller.
 */
class SplitNavigationController extends AbstractNavigationController
{
	private final GenexusActivity mActivity;
	private final WWListDefinition mMasterDefinition;

	private BaseFragment mMasterComponent;
	private BaseFragment mDetailComponent;
	private ComponentParameters mDetailParameters;

	private static final ComponentId COMPONENT_ID_MASTER = new ComponentId(null, "[Split]Master");
	private static final ComponentId COMPONENT_ID_DETAIL = new ComponentId(null, "[Split]Detail");
	private static final String STATE_KEY_DETAIL_PARAMS = "SplitDetail";

	SplitNavigationController(GenexusActivity activity, IViewDefinition mainView)
	{
		mActivity = activity;
		mMasterDefinition = (WWListDefinition)mainView;
	}

	@Override
	public Pair<View, Boolean> onPreCreate(Bundle savedInstanceState, ComponentParameters mainParams)
	{
		mActivity.setContentView(R.layout.split_navigation);

		View mainView = mActivity.findViewById(R.id.main_content_split);

		return new Pair<View, Boolean>( mainView, false);
	}

	@Override
	public void onCreate(Bundle savedInstanceState)
	{
		ActivityHelper.setSupportActionBar(mActivity);
		ActivityHelper.applyStyle(mActivity, mMasterDefinition.getLayout(LayoutDefinition.TYPE_VIEW));
	}

	@Override
	public boolean start(final ComponentParameters mainParams, final LayoutFragmentActivityState previousState)
	{
		final View masterContainer = mActivity.findViewById(R.id.split_fragment_master);
		ViewUtil.runWhenMeasured(masterContainer, new Runnable()
		{
			@Override
			public void run()
			{
				showMasterFragment(mainParams);

				if (previousState != null)
				{
					ComponentParameters detailParams = previousState.getProperty(ComponentParameters.class, STATE_KEY_DETAIL_PARAMS);
					if (detailParams != null)
						showDetailFragment(detailParams);
				}
			}
		});

		return true;
	}

	private void showMasterFragment(ComponentParameters mainParams)
	{
		ComponentUISettings uiSettings = new ComponentUISettings(true, null, getSizeOf(R.id.split_fragment_master));
		BaseFragment fragment = mActivity.createComponent(COMPONENT_ID_MASTER, mainParams, uiSettings, null);

		FragmentTransaction ft = mActivity.getSupportFragmentManager().beginTransaction();
		ft.replace(R.id.split_fragment_master, fragment);
		ft.commit();

		mMasterComponent = fragment;
	}

	@Override
	public boolean setTitle(IDataView fromDataView, CharSequence title)
	{
		// Only the title from the MASTER should be shown.
		if (fromDataView == mMasterComponent)
			mActivity.setTitle(title);

		// Return true to "drop" the others.
		return true;
	}

	@NonNull
	@Override
	public NavigationHandled handle(UIObjectCall call, Intent callIntent)
	{
		CallOptions callOptions = CallOptionsHelper.getCallOptions(call.getObject(), call.getMode());

		if (CallTarget.BLANK.isTarget(callOptions))
			return NavigationHandled.NOT_HANDLED; // Always create a new Activity for a Target=Blank call.

		if (StandardNavigationController.handlePopup(mActivity, call))
			return NavigationHandled.HANDLED_WAIT_FOR_RESULT; // Wait for popup output.

		if (call.getObject() instanceof DetailDefinition &&
			mMasterDefinition.getParent().getDetail() == call.getObject() &&
			call.getMode() == LayoutModes.VIEW)
		{
			if (mDetailComponent != null)
			{
				mActivity.destroyComponent(mDetailComponent);
				mDetailComponent = null;
				mDetailParameters = null;
			}

			// Calling detail from this master => show on right.
			showDetailFragment(call.toComponentParams());
			return NavigationHandled.HANDLED_CONTINUE;
		}
		else
			return NavigationHandled.NOT_HANDLED;
	}

	private void showDetailFragment(ComponentParameters params)
	{
		ComponentUISettings uiSettings = new ComponentUISettings(false, null, getSizeOf(R.id.split_fragment_detail));

		BaseFragment fragment = mActivity.createComponent(COMPONENT_ID_DETAIL, params, uiSettings, null);

		FragmentTransaction ft = mActivity.getSupportFragmentManager().beginTransaction();
		ft.replace(R.id.split_fragment_detail, fragment);
		ft.commit();

		mDetailComponent = fragment;
		mDetailComponent.setActive(true);
		mDetailParameters = params;
	}

	private Size getSizeOf(int containerId)
	{
		View containerView = mActivity.findViewById(containerId);
		if (containerView == null)
			throw new IllegalStateException(String.format("Container view with id %s not found!", containerId));

		if (containerView.getMeasuredWidth() == 0 || containerView.getMeasuredHeight() == 0)
			return null;

		return new Size(containerView.getMeasuredWidth(), containerView.getMeasuredHeight());
	}

	@Override
	public void saveActivityState(LayoutFragmentActivityState outState)
	{
		super.saveActivityState(outState);
		if (mDetailComponent != null)
			outState.setProperty(STATE_KEY_DETAIL_PARAMS, mDetailParameters);
	}

	@Override
	public boolean showTarget(String targetName)
	{
		return false;
	}

	@Override
	public boolean hideTarget(String targetName)
	{
		// Split Navigation has no implementation of hide targets, at least for now.
		return false;
	}

	@Override
	public boolean isTargetVisible(String targetName)
	{
		// default return true
		return true;
	}

	@Override
	public DashboardItem getMenuItemDefinition(String itemName)
	{
		return null;
	}
}
