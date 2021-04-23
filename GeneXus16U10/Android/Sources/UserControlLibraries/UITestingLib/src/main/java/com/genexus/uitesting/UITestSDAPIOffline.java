package com.genexus.uitesting;

import android.widget.DatePicker;
import android.widget.TimePicker;

import androidx.test.espresso.IdlingRegistry;
import androidx.test.espresso.ViewAction;

import com.artech.base.services.Services;
import com.genexus.uitesting.idlingresources.WaitingIdlingResource;
import com.genexus.uitesting.utils.Preconditions;

import org.apache.commons.lang.NotImplementedException;

import static androidx.test.espresso.Espresso.onView;
import static androidx.test.espresso.Espresso.pressBack;
import static androidx.test.espresso.action.ViewActions.click;
import static androidx.test.espresso.action.ViewActions.doubleClick;
import static androidx.test.espresso.action.ViewActions.longClick;
import static androidx.test.espresso.action.ViewActions.swipeDown;
import static androidx.test.espresso.action.ViewActions.swipeLeft;
import static androidx.test.espresso.action.ViewActions.swipeRight;
import static androidx.test.espresso.action.ViewActions.swipeUp;
import static androidx.test.espresso.assertion.ViewAssertions.doesNotExist;
import static androidx.test.espresso.assertion.ViewAssertions.matches;
import static androidx.test.espresso.contrib.PickerActions.setDate;
import static androidx.test.espresso.contrib.PickerActions.setTime;
import static androidx.test.espresso.matcher.RootMatchers.isDialog;
import static androidx.test.espresso.matcher.ViewMatchers.hasDescendant;
import static androidx.test.espresso.matcher.ViewMatchers.isChecked;
import static androidx.test.espresso.matcher.ViewMatchers.isDisplayed;
import static androidx.test.espresso.matcher.ViewMatchers.isEnabled;
import static androidx.test.espresso.matcher.ViewMatchers.isRoot;
import static androidx.test.espresso.matcher.ViewMatchers.withClassName;
import static androidx.test.espresso.matcher.ViewMatchers.withId;
import static androidx.test.espresso.matcher.ViewMatchers.withText;
import static com.genexus.uitesting.action.CustomActionViews.openDateDialog;
import static com.genexus.uitesting.action.CustomActionViews.openTimeDialog;
import static com.genexus.uitesting.action.CustomActionViews.replaceText;
import static com.genexus.uitesting.matchers.ControlMatchers.withName;
import static com.genexus.uitesting.matchers.DataMatchers.withItemCount;
import static com.genexus.uitesting.matchers.Selectors.onControl;
import static com.genexus.uitesting.matchers.Selectors.onGrid;
import static com.genexus.uitesting.matchers.ViewMatchers.withActionTarget;
import static org.hamcrest.CoreMatchers.allOf;
import static org.hamcrest.CoreMatchers.not;
import static org.hamcrest.Matchers.equalTo;

public class UITestSDAPIOffline {
	public static void back() {
		pressBack();
	}

	public static void tap(String target) {
		tap(target, null);
	}

	public static void tap(String target, String context) {
		onControl(withActionTarget(target), context)
			.perform(click());
	}

	public static void longTap(String target) {
		longTap(target, null);
	}

	public static void longTap(String target, String context) {
		onControl(withActionTarget(target), context)
			.perform(longClick());
	}

	public static void doubleTap(String target) {
		doubleTap(target, null);
	}

	public static void doubleTap(String target, String context) {
		onControl(withActionTarget(target), context)
			.perform(doubleClick());
	}

	public static void fill(String controlName, String value) {
		fill(controlName, value, null);
	}

	public static void fill(String controlName, String value, String context) {
		onControl(withName(controlName), context)
			.perform(replaceText(value));
	}

	public static void pickDate(String controlName, Short year, Byte month, Byte day) {
		pickDate(controlName, year, month, day, null);
	}

	public static void pickDate(String controlName, Short year, Byte month, Byte day,
								String context) {
		onControl(withName(controlName), context)
			.perform(openDateDialog());
		onView(withClassName(equalTo(DatePicker.class.getName())))
			.perform(setDate(year, month, day));
		onView(withId(android.R.id.button1))
			.perform(click());
	}

	public static void pickTime(String controlName, Byte hour, Byte minutes) {
		pickTime(controlName, hour, minutes, null);
	}

	public static void pickTime(String controlName, Byte hour, Byte minutes, String context) {
		onControl(withName(controlName), context)
			.perform(openTimeDialog());
		onView(withClassName(equalTo(TimePicker.class.getName())))
			.perform(setTime(hour, minutes));
		onView(withId(android.R.id.button1))
			.perform(click());
	}

	public static void pickDateTime(String controlName, Short year, Byte month, Byte day, Byte hour,
									Byte minutes) {
		pickDateTime(controlName, year, month, day, hour, minutes, null);
	}

	public static void pickDateTime(String controlName, Short year, Byte month, Byte day, Byte hour,
									Byte minutes, String context) {
		pickDate(controlName, year, month, day, context);
		pickTime(controlName, hour, minutes, context);
	}

	public static void selectValue(String controlName, String value) {
		selectValue(controlName, value, null);
	}

	public static void selectValue(String controlName, String value, String context) {
		throw new NotImplementedException(); // TODO:
	}

	public static void swipe(Integer swipeDirection) {
		swipe(swipeDirection, null, null);
	}

	public static void swipe(Integer swipeDirection, String controlName) {
		swipe(swipeDirection, controlName, null);
	}

	public static void swipe(Integer swipeDirection, String controlName, String context) {
		ViewAction action;
		switch (swipeDirection) {
			case 1:
				action = swipeUp();
				break;
			case 2:
				action = swipeDown();
				break;
			case 3:
				action = swipeLeft();
				break;
			case 4:
				action = swipeRight();
				break;
			default:
				throw new IllegalArgumentException("Invalid swipe direction");
		}

		onControl(controlName == null ? isRoot() : withName(controlName), context)
			.perform(action);
	}

	public static void wait(Integer milliseconds) {
		IdlingRegistry.getInstance().register(new WaitingIdlingResource(milliseconds));
	}

	public static void verifyText(String text) {
		verifyText(text, true, null);
	}

	public static void verifyText(String text, Boolean expected) {
		verifyText(text, expected, null);
	}

	public static void verifyText(String text, Boolean expected, String context) {
		onControl(withText(text), context)
			.check(expected ? matches(isDisplayed()) : doesNotExist());
	}

	public static void verifyGridRowsCount(String gridControlName, Integer value) {
		verifyGridRowsCount(gridControlName, value, true, null);
	}

	public static void verifyGridRowsCount(String gridControlName, Integer value,
										   Boolean expected) {
		verifyGridRowsCount(gridControlName, value, expected, null);
	}

	public static void verifyGridRowsCount(String gridControlName, Integer value, Boolean expected,
										   String context) {
		onGrid(withName(gridControlName), context)
			.check(matches(expected ? withItemCount(value) : not(withItemCount(value))));
	}

	public static void verifyCheckbox(String controlName, Boolean value) {
		verifyCheckbox(controlName, value, null);
	}

	public static void verifyCheckbox(String controlName, Boolean value, String context) {
		onControl(withName(controlName), context)
			.check(matches(hasDescendant(value ? isChecked() : not(isChecked()))));
	}

	public static void verifyControlValue(String controlName, String value) {
		verifyControlValue(controlName, value, true, null);
	}

	public static void verifyControlValue(String controlName, String value, Boolean expected) {
		verifyControlValue(controlName, value, expected, null);
	}

	public static void verifyControlValue(String controlName, String value, Boolean expected,
										  String context) {
		onControl(withName(controlName), context)
			.check(matches(
				Preconditions.isDateTime(value) ?
					allOf(
						hasDescendant(expected ? withText(Services.Strings.split(value, ",")[0].trim())
							: not(withText(Services.Strings.split(value, ",")[0].trim()))),
						hasDescendant(expected ? withText(Services.Strings.split(value, ",")[1].trim())
							: not(withText(Services.Strings.split(value, ",")[1].trim())))
					)
					: hasDescendant(expected ? withText(value) : not(withText(value)))
			));
	}

	public static void verifyControlEnabled(String controlName) {
		verifyControlEnabled(controlName, true, null);
	}

	public static void verifyControlEnabled(String controlName, Boolean expected) {
		verifyControlEnabled(controlName, expected, null);
	}

	public static void verifyControlEnabled(String controlName, Boolean expected, String context) {
		onControl(withName(controlName), context)
			.check(matches(expected ? isEnabled() : not(isEnabled())));
	}

	public static void verifyControlVisible(String controlName) {
		verifyControlVisible(controlName, true, null);
	}

	public static void verifyControlVisible(String controlName, Boolean expected) {
		verifyControlVisible(controlName, expected, null);
	}

	public static void verifyControlVisible(String controlName, Boolean expected, String context) {
		onControl(withName(controlName), context)
			.check(expected ? matches(isDisplayed()) : doesNotExist());
	}

	public static void verifyMsg(String text) {
		verifyMsg(text, true);
	}

	public static void verifyMsg(String text, Boolean expected) {
		onControl(withText(text), null)
			.inRoot(isDialog())
			.check(expected ? matches(isDisplayed()) : doesNotExist());
	}
}
