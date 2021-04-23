package com.genexus.uitesting.matchers;

import androidx.test.espresso.NoMatchingViewException;
import androidx.test.platform.app.InstrumentationRegistry;
import androidx.test.espresso.DataInteraction;
import androidx.test.espresso.ViewInteraction;

import android.view.View;

import com.artech.R;
import com.artech.base.services.Services;

import org.hamcrest.Matcher;

import static androidx.test.espresso.Espresso.onData;
import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.Espresso.openActionBarOverflowOrOptionsMenu;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static org.hamcrest.Matchers.allOf;
import static org.hamcrest.Matchers.either;

public class Selectors {
	public static ViewInteraction onControl(final Matcher<View> viewMatcher, String context) {
		if (context != null) {
			if (context.equalsIgnoreCase(UITestingContext.APPLICATION_BAR.mValue))
				tryOpeningMenu();
		}

		return onView(viewMatcher);
	}

	public static DataInteraction onGrid(Matcher<? extends Object> dataMatcher, String context) {
		return onData(dataMatcher);
	}

	/**
	 * <b>Note:</b> Works ONLY for List and Table menus (not Tabs).
	 */
	public static DataInteraction onMenu(Matcher<? extends Object> dataMatcher) {
		return onData(dataMatcher).inAdapterView(
			either(
				allOf(withId(R.id.DashBoardGridView), isDisplayed())
			).or(
				allOf(withId(R.id.DashBoardListView), isDisplayed())
			));
	}

	private static void tryOpeningMenu() {
		try {
			openActionBarOverflowOrOptionsMenu(InstrumentationRegistry.getInstrumentation().getTargetContext());
		} catch (NoMatchingViewException e) {
			Services.Log.warning("Context is ApplicationBar but Menu couldn't be expanded", e);
		}
	}

	private enum UITestingContext {

		APPLICATION_BAR("applicationbar");

		public final String mValue;

		UITestingContext(String value) {
			this.mValue = value;
		}
	}
}
