package com.artech.ui.navigation.slide;

import java.util.HashMap;

import com.artech.app.ComponentParameters;
import com.artech.base.metadata.ActionDefinition;
import com.artech.fragments.LayoutFragmentActivityState;
import com.artech.utils.Cast;

@SuppressWarnings("checkstyle:MemberName")
class SlideComponents {
	public boolean IsHub;
	private final HashMap<SlideNavigation.Target, ComponentParameters> mComponents = new HashMap<>();
	public boolean IsLeftMainComponent;
	public boolean IsRightMainComponent;
	public ActionDefinition PendingAction;

	private static final String STATE_KEY = "Gx::SlideNavigation::Components";

	public ComponentParameters get(SlideNavigation.Target target) {
		return mComponents.get(target);
	}

	public void set(SlideNavigation.Target target, ComponentParameters params) {
		mComponents.put(target, params);
	}

	public void saveTo(LayoutFragmentActivityState state) {
		state.setProperty(STATE_KEY, this);
	}

	public static SlideComponents readFrom(LayoutFragmentActivityState state) {
		if (state == null) {
			return null;
		}
		return Cast.as(SlideComponents.class, state.getProperty(STATE_KEY));
	}
}
