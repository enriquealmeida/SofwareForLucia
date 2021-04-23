package com.artech.ui.navigation.controllers;

import java.util.Collections;
import java.util.List;

import android.content.res.Configuration;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.MenuItem;

import com.artech.fragments.IDataView;
import com.artech.fragments.IInspectableComponent;
import com.artech.fragments.LayoutFragmentActivityState;
import com.artech.ui.navigation.NavigationController;

/**
 * Abstract (and empty) base implementation of the NavigationController interface.
 */
public abstract class AbstractNavigationController implements NavigationController
{
	@Override
	public void onPostCreate(Bundle savedInstanceState) { }

	@Override
	public void onResume() { }

	@Override
	public void onPostResume() { }

	@Override
	public void onConfigurationChanged(Configuration newConfig) { }

	@Override
	public void onSaveInstanceState(Bundle outState) { }

	@Override
	public void onPause() { }

	@Override
	public void saveActivityState(LayoutFragmentActivityState outState) { }

	@Override
	public boolean setTitle(IDataView fromDataView, CharSequence title) { return false; }

	@Override
	public boolean onOptionsItemSelected(MenuItem item) { return false; }

	@Override
	public boolean onKeyUp(int keyCode, KeyEvent event) { return false; }

	@Override
	public boolean onBackPressed() { return false; }

	@Override
	public List<IInspectableComponent> getActiveComponents() {
		return Collections.emptyList();
	}
}
