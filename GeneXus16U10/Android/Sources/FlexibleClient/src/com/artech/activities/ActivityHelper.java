package com.artech.activities;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Point;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import androidx.core.util.Pair;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import android.view.Display;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.TextView;

import com.artech.R;
import com.artech.android.ActivityResources;
import com.artech.android.layout.LayoutTag;
import com.artech.base.metadata.ILayoutDefinition;
import com.artech.base.metadata.enums.Orientation;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.theme.ThemeApplicationBarClassDefinition;
import com.artech.base.metadata.theme.ThemeApplicationClassDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.PlatformHelper;
import com.artech.compatibility.CompatibilityHelper;
import com.artech.compatibility.SherlockHelper;
import com.artech.controls.ApplicationBarControl;
import com.artech.fragments.IInspectableComponent;
import com.artech.fragments.LayoutFragmentActivity;
import com.artech.ui.navigation.CustomInsetsRelativeLayout;
import com.artech.ui.navigation.slide.SlideNavigationController;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

/**
 * Class used to centralize calls to tasks that must be performed at particular points of
 * an activity's lifecycle (create, pause, resume, destroy) and other helper methods.
 */
public class ActivityHelper {
	private static final String KEY_BAR_THEME_CLASS = "ApplicationBarThemeClass";
	private static LayoutFragmentActivity sMainActivity;
	private static Activity sCurrentActivity;
	private static List<MainActivitySetListener> mListeners = new ArrayList<>();
	private static HashSet<Integer> sActionRequestCodes = new HashSet<>();

	/**
	 * Must be called as the first line of the Activity's onCreate() method, before super.onCreate().
	 */
	@SuppressWarnings("UnusedParameters")
	public static void onBeforeCreate(Activity activity) {
		// Nothing yet.
		Services.Language.onBeforeCreate(activity);
	}

	/**
	 * Performs initialization of an Activity (such as enabling hardware acceleration).
	 * Must be the first method called after super.onCreate().
	 */
	@SuppressWarnings("deprecation")
	public static void initialize(Activity activity, Bundle savedInstanceState) {
		SherlockHelper.requestWindowFeature(activity, Window.FEATURE_INDETERMINATE_PROGRESS);
		SherlockHelper.requestWindowFeature(activity, Window.FEATURE_PROGRESS);
		ActivityResources.onCreate(activity, savedInstanceState);

		//DebugService.onCreate(activity);
	}

	public static void setSupportActionBarAndShadow(AppCompatActivity activity) {
		setSupportActionBar(activity);

		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
			// hide shadow in 5.x
			View toolbarShadow = activity.findViewById(R.id.toolbar_shadow);
			if (toolbarShadow != null)
				toolbarShadow.setVisibility(View.GONE);
		} else {
			// Use custom shadow in 4.x if possible
			CustomInsetsRelativeLayout customToolbarContainer = activity.findViewById(R.id.main_content_insets_container);
			if (customToolbarContainer != null)
				customToolbarContainer.setDrawShadow(true);

		}
	}

	public static void setSupportActionBar(AppCompatActivity activity) {
		// set support toolbar
		Toolbar toolbar = activity.findViewById(R.id.action_bar_toolbar);
		activity.setSupportActionBar(toolbar);
	}

	public static void setActionBarOverlay(Activity activity) {
		SherlockHelper.requestWindowFeature(activity, Window.FEATURE_ACTION_BAR_OVERLAY);
	}

	public static void setStatusBarOverlay(Activity activity) {
		// check http://stackoverflow.com/questions/27856603/lollipop-draw-behind-statusbar-with-its-color-set-to-transparent
		if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP && CompatibilityHelper.isStatusBarOverlayingAvailable()) {
			// api level 21. min 16 for above, 21 for status bar color
			activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS);
			activity.getWindow().getDecorView().setSystemUiVisibility(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | View.SYSTEM_UI_FLAG_LAYOUT_STABLE);
		}
	}

	/**
	 * Applies "global" theme properties (application bar color, background color
	 * and image) to an activity. Should be called in Activity.onCreate()
	 * <em>after</em> setContentView() has executed.
	 */
	@SuppressWarnings("deprecation")
	public static void applyStyle(Activity activity, ILayoutDefinition definition) {
		// set action bar home option enable
		ActionBar bar = SherlockHelper.getActionBar(activity);
		if (bar != null && hasActionBar(activity))
			customizeAppBar(activity, definition, bar);

		if (activity.getParent() == null) {
			// Set app background color and image.
			// Don't do it for "inner" activities; otherwise we end up with a "double background".
			ThemeApplicationClassDefinition appClass = Services.Themes.getApplicationClass();
			if (appClass != null)
				ThemeUtils.setBackground(activity, appClass);
		}

		// Set progress to end to hide progress bar at activity startup
		// Progress bar will only appear if progress is set to other value in other place. ie. webview
		SherlockHelper.setProgress(activity, Window.PROGRESS_END);
	}

	private static void customizeAppBar(Activity activity, ILayoutDefinition layout, ActionBar bar) {
		bar.setHomeButtonEnabled(true);
		bar.setDisplayShowHomeEnabled(true);

		SherlockHelper.setProgressBarIndeterminateVisibility(activity, false);

		boolean allowHeaderRow = true;
		if (activity instanceof LayoutFragmentActivity) {
			LayoutFragmentActivity layoutFragmentActivity = ((LayoutFragmentActivity) activity);
			if (layoutFragmentActivity.getMainFragment() != null && !layoutFragmentActivity.getMainFragment().isAllowHeaderRow())
				allowHeaderRow = false;
		}

		if (layout != null && allowHeaderRow && layout.getEnableHeaderRowPattern()) {
			ThemeApplicationBarClassDefinition appBarClass = layout.getHeaderRowApplicationBarClass();
			if (appBarClass != null) {
				setActionBarThemeClass(activity, appBarClass);
				return;
			}
		}

		// if not use default action bar theme
		setActionBarTheme(activity, layout, false);
	}

	public static void setActionBarTheme(Activity activity, ILayoutDefinition layout, boolean animateBackgroundChange) {
		// Get specific application bar class from definition, or use generic one.
		ThemeApplicationBarClassDefinition appBarClass = null;
		if (layout != null)
			appBarClass = layout.getApplicationBarClass();
		if (appBarClass == null)
			appBarClass = Services.Themes.getThemeClass(ThemeApplicationBarClassDefinition.class, ThemeApplicationBarClassDefinition.CLASS_NAME);

		setActionBarThemeClass(activity, appBarClass, animateBackgroundChange);
	}

	public static void setActionBarThemeClass(Activity activity, ThemeApplicationBarClassDefinition themeClass) {
		setActionBarThemeClass(activity, themeClass, false);
	}

	public static void setActionBarThemeClass(Activity activity, ThemeApplicationBarClassDefinition themeClass, boolean animateBackgroundChange) {
		ActionBar bar = SherlockHelper.getActionBar(activity);
		if (bar != null && themeClass != null) {
			//Services.Log.debug("setActionBarThemeClass", "themeClass " + themeClass);

			ThemeApplicationBarClassDefinition previousClass = getActionBarThemeClass(activity);
			if (previousClass == themeClass)
				return; // Avoid re-applying the same exact class.

			ActivityTags.put(activity, KEY_BAR_THEME_CLASS, themeClass);

			//Services.Log.debug("setActionBarThemeClass", "themeClass2 " + themeClass);

			// Set title bar properties
			ThemeUtils.setActionBarBackground(activity, bar, themeClass, animateBackgroundChange, previousClass);
			ThemeUtils.setTitleFontProperties(activity, themeClass);
			ThemeUtils.setStatusBarColor(activity, themeClass, animateBackgroundChange, previousClass);

			// app icon and title image supported also.
			ThemeUtils.setAppBarIconImage(bar, themeClass);
			ThemeUtils.setAppBarTitleImage(activity, bar, themeClass);
		}
	}

	public static ThemeApplicationBarClassDefinition getActionBarThemeClass(Activity activity) {
		return Cast.as(ThemeApplicationBarClassDefinition.class, ActivityTags.get(activity, KEY_BAR_THEME_CLASS));
	}


	public static void setActionBarVisibilityForNavigationController(Activity activity, boolean visible)
	{
		if (activity instanceof GenexusActivity)
		{
			GenexusActivity gxActivity = (GenexusActivity) activity;
			// slide navigation already set action bar visibility for content fragment, do not override with main data.
			if (gxActivity.getNavigationController() instanceof SlideNavigationController)
				return;
		}
		setActionBarVisibility(activity, visible);
	}


	public static void setActionBarVisibility(Activity activity, boolean visible) {
		ActionBar bar = SherlockHelper.getActionBar(activity);
		if (bar != null) {
			if (visible) {
				bar.show();
				// show shadow in 4.x, only for old activities that use the shadow view
				if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
					View toolbarShadow = activity.findViewById(R.id.toolbar_shadow);
					if (toolbarShadow != null)
						toolbarShadow.setVisibility(View.VISIBLE);
				}
			} else {
				bar.hide();
				// hide shadow in 4.x, only for old activities that use the shadow view
				if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
					View toolbarShadow = activity.findViewById(R.id.toolbar_shadow);
					if (toolbarShadow != null)
						toolbarShadow.setVisibility(View.GONE);
				}
			}
		}
	}

	public static boolean hasActionBar(Activity activity) {
		ActionBar bar = SherlockHelper.getActionBar(activity);
		return (bar != null && bar.isShowing());
	}

	public static Activity getMainActivity() {
		return sMainActivity;
	}

	public static void addMainActivitySetListener(MainActivitySetListener listener) {
		mListeners.add(listener);
	}

	public static void removeMainActivitySetListener(MainActivitySetListener listener) {
		mListeners.remove(listener);
	}

	private static void onMainActivitySet() {
		for (MainActivitySetListener listener : new ArrayList<>(mListeners))
			listener.onMainActivitySet();
	}

	public static Activity getCurrentActivity() {
		return sCurrentActivity;
	}

	public static boolean hasCurrentActivity() {
		return sCurrentActivity != null;
	}

	public static void onNewIntent(Activity activity, Intent intent) {
		ActivityResources.onNewIntent(activity, intent);
	}

	public static void onStart(Activity activity) {
		if (sMainActivity == null && activity instanceof LayoutFragmentActivity) {
			sMainActivity = (LayoutFragmentActivity)activity;
			onMainActivitySet();
		}
		ActivityResources.onStart(activity);
	}

	/**
	 * Registers the currently running activity.
	 */
	public static boolean onResume(Activity activity) {
		//DebugService.onResume(activity);
		if (!ActivityFlowControl.onResume(activity))
			return false;

		if (activity != sCurrentActivity) {
			// If missed previous onPause, signal it now.
			if (sCurrentActivity != null)
				onPause(sCurrentActivity);

			sCurrentActivity = activity;
			ActivityResources.onResume(activity);
		}

		return true;
	}

	public static void onActivityResult(Activity activity, int requestCode, int resultCode, Intent data) {
		ActivityResources.onActivityResult(activity, requestCode, resultCode, data);
	}

	public static void onSaveInstanceState(Activity activity, Bundle outState) {
		ActivityResources.onSaveInstanceState(activity, outState);
	}

	public static void onPause(Activity activity) {
		ActivityFlowControl.onPause(activity);
		ActivityResources.onPause(activity);

		if (sCurrentActivity == activity)
			sCurrentActivity = null;
	}

	public static void onStop(Activity activity) {
		ActivityResources.onStop(activity);
	}

	public static void onDestroy(Activity activity) {
		if (sMainActivity == activity)
			sMainActivity = null; // If back is pressed to leave main panel
		ActivityResources.onDestroy(activity);
		unbindReferences(activity);
	}

	/**
	 * Removes the reference to the activity from every view in a view hierarchy (listeners, images etc.).
	 * This method should be called in the onDestroy() method of each activity
	 * <p>
	 * see http://code.google.com/p/android/issues/detail?id=8488
	 */
	private static void unbindReferences(Activity activity) {
		try {
			View view = activity.findViewById(android.R.id.content);
			if (view != null) {
				unbindViewReferences(view);
				if (view instanceof ViewGroup)
					unbindViewGroupReferences((ViewGroup) view);
			}

			System.gc();
		} catch (@SuppressWarnings("checkstyle:IllegalCatch") Throwable t) {
			// TODO: We should investigate why and which exception we're catching here
		}
	}

	private static void unbindViewGroupReferences(ViewGroup viewGroup) {
		int nChildren = viewGroup.getChildCount();
		for (int i = 0; i < nChildren; i++) {
			View view = viewGroup.getChildAt(i);

			if (view instanceof WebView) {
				// WebView must be removed from the view hierarchy before calling destroy() on it.
				// Otherwise we will get a "WebView.destroy() called while still attached" exception.
				// Since we remove a view, adjust the iteration indexes accordingly.
				viewGroup.removeViewAt(i);
				nChildren--;
				i--;
			}

			unbindViewReferences(view);

			if (view instanceof ViewGroup)
				unbindViewGroupReferences((ViewGroup) view);
		}

		try {
			viewGroup.removeAllViews();
		} catch (UnsupportedOperationException mayHappen) {
			// AdapterViews, ListViews and potentially other ViewGroups don't support the removeAllViews operation
		}
	}

	// TODO: Check if it's actually required to call destroyDrawingCache().
	@SuppressWarnings("deprecation")
	private static void unbindViewReferences(View view) {
		// set all listeners to null (not every view and not every API level supports the methods).
		try {
			view.setOnClickListener(null);
			view.setOnCreateContextMenuListener(null);
			view.setOnFocusChangeListener(null);
			view.setOnKeyListener(null);
			view.setOnLongClickListener(null);
			view.setOnClickListener(null);
			view.setOnTouchListener(null);
			view.setTag(R.id.tag_grid_item_info, null);
		} catch (@SuppressWarnings("checkstyle:IllegalCatch") Throwable t) {
			// TODO: We should investigate why and which exception we're catching here
		}

		// set background to null and remove callback.
		Drawable d = view.getBackground();
		if (d != null)
			d.setCallback(null);

		if (view instanceof ImageView) {
			ImageView imageView = (ImageView) view;
			d = imageView.getDrawable();
			if (d != null)
				d.setCallback(null);

			imageView.setImageDrawable(null);
			imageView.setBackground(null);
		}

		// destroy webview
		if (view instanceof WebView) {
			view.destroyDrawingCache();
			((WebView) view).destroy();
		}
	}

	/**
	 * Sets the orientation of the activity to the default orientation specified in the app
	 * (either switching it, or locking to the current one).
	 *
	 * @return True if the orientation was switched, false otherwise.
	 */
	public static boolean setDefaultOrientation(Activity activity) {
		Orientation defaultOrientation = PlatformHelper.getDefaultOrientation();
		if (defaultOrientation != Orientation.UNDEFINED) {
			boolean isSwitch = (defaultOrientation != Services.Device.getScreenOrientation());
			setOrientation(activity, defaultOrientation);
			return isSwitch;
		} else
			return false;
	}

	public static void setOrientation(Activity activity, Orientation orientation) {
		if (orientation != Orientation.UNDEFINED) {
			int requestedOrientation = (orientation == Orientation.PORTRAIT ? ActivityInfo.SCREEN_ORIENTATION_SENSOR_PORTRAIT : ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE);
			activity.setRequestedOrientation(requestedOrientation);
		}
	}

	public static View getInvalidMetadataMessage(IGxActivity activity) {
		return getInvalidMetadataMessage((Context) activity, activity.getModel().getName());
	}

	public static View getInvalidMetadataMessage(Context context, String objectName) {
		if (objectName == null)
			objectName = Services.Strings.getResource(R.string.GXM_Unknown);

		String message = String.format(Services.Strings.getResource(R.string.GXM_InvalidDefinition), objectName);
		return getErrorMessage(context, message);
	}

	public static View getErrorMessage(Context context, String message) {
		TextView text = new TextView(context);
		text.setText(message);
		return text;
	}

	public static void registerActionRequestCode(int requestCode) {
		sActionRequestCodes.add(requestCode);
	}

	public static boolean isActionRequest(int requestCode) {
		return (requestCode == RequestCodes.ACTION ||
				requestCode == RequestCodes.ACTIONNOREFRESH ||
				requestCode == RequestCodes.ACTION_ALWAYS_SUCCESSFUL ||
				sActionRequestCodes.contains(requestCode));
	}

	/**
	 * Returns a pair of (height, width) of the window's dimensions in dips.
	 */
	public static Pair<Integer, Integer> getAppUsableScreenSize(Context context) {
		WindowManager windowManager = (WindowManager) context.getSystemService(Context.WINDOW_SERVICE);
		Display display = windowManager.getDefaultDisplay();
		Point size = new Point();
		display.getSize(size);

		int heightInDips = Services.Device.pixelsToDips(size.y);
		int widthInDips = Services.Device.pixelsToDips(size.x);

		return new Pair<>(heightInDips, widthInDips);
	}

	public static void addApplicationBarComponent(Activity activity, List<IInspectableComponent> activeComponents) {
		if (SherlockHelper.hasActionBar(activity)) {
			ApplicationBarControl appBarControl = new ApplicationBarControl(activity);
			LayoutItemDefinition definition = new LayoutItemDefinition(null);
			definition.setName(appBarControl.getName());
			View view = appBarControl.getRootView();
			view.setTag(LayoutTag.CONTROL_DEFINITION, definition);
			view.setTag(LayoutTag.CONTROL_THEME_CLASS, appBarControl.getThemeClass());
			view.setTag(LayoutTag.CONTROL_GENEXUS, true);
			activeComponents.add(appBarControl);
		}
	}

	public interface MainActivitySetListener {
		void onMainActivitySet();
	}
}
