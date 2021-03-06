package com.genexus.uitesting.action;

import androidx.test.espresso.UiController;
import androidx.test.espresso.ViewAction;
import android.view.View;

import com.artech.controls.DataBoundControl;
import com.artech.controls.GxDateTimeEdit;
import com.genexus.diagnostics.Log;

import org.hamcrest.Matcher;

import static androidx.test.espresso.matcher.ViewMatchers.hasDescendant;
import static androidx.test.espresso.matcher.ViewMatchers.isAssignableFrom;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static org.hamcrest.Matchers.allOf;

/**
 * Performs a click event on the Open Time Dialog button of the {@code GxDateTimeEdit}'s view. This
 * causes a {@code TimePicker} dialog to show up.
 */
class OpenTimeDialogAction implements ViewAction {

	@Override
	public Matcher<View> getConstraints() {
		return allOf(
				isDisplayed(),
				isAssignableFrom(DataBoundControl.class),
				hasDescendant(isAssignableFrom(GxDateTimeEdit.class))
		);
	}

	@Override
	public String getDescription() {
		return "open time dialog";
	}

	@Override
	public void perform(UiController uiController, View view) {
		DataBoundControl control = (DataBoundControl) view;

		View attrView = control.getAttribute();

		if (!(attrView instanceof GxDateTimeEdit)) {
			Log.debug("Could not perform view action 'OpenTimeDialog' on attribute field.");
			return;
		}

		GxDateTimeEdit dateTimeEdit = (GxDateTimeEdit) attrView;
		dateTimeEdit.getTimeButton().performClick();
	}
}
