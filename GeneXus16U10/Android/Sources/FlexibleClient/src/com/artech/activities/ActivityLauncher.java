package com.artech.activities;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;

import androidx.annotation.NonNull;
import androidx.browser.customtabs.CustomTabsIntent;

import com.artech.R;
import com.artech.actions.UIContext;
import com.artech.application.MyApplication;
import com.artech.base.metadata.DetailDefinition;
import com.artech.base.metadata.IDataSourceDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.RelationDefinition;
import com.artech.base.metadata.WWLevelDefinition;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.enums.DisplayModes;
import com.artech.base.metadata.enums.Orientation;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.model.Entity;
import com.artech.base.providers.GxUri;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.IntentHelper;
import com.artech.controllers.IDataSourceController;
import com.artech.controls.SearchBoxDefinition;
import com.artech.controls.maps.Maps;
import com.artech.controls.maps.common.LocationPickerHelper;
import com.artech.ui.navigation.CallOptions;
import com.artech.ui.navigation.CallOptionsHelper;
import com.artech.ui.navigation.CallTarget;
import com.artech.ui.navigation.CallType;
import com.artech.utils.Cast;
import com.artech.utils.ThemeUtils;

public class ActivityLauncher
{
	private static final String INTENT_EXTRA_OBJECT_NAME = "com.artech.activities.ActivityLauncher.ObjectName";

	public static void call(UIContext context, IDataViewDefinition dataView, List<String> parameters)
	{
		Intent intent = getIntent(context, dataView, parameters, DisplayModes.VIEW, null);
		startActivity(context.getActivity(), intent);
	}

	public static void callSearchResult(UIContext context, IDataViewDefinition dataView, List<String> parameters,
										SearchBoxDefinition searchBoxDefinition)
	{
		Intent intent = getIntent(context, dataView, parameters, DisplayModes.VIEW, null);
		intent.setClass(context, SearchResultsActivity.class);
		intent.putExtra(IntentParameters.SEARCH_BOX_DEFINITION, searchBoxDefinition);
		startActivity(context.getActivity(), intent);
	}

	public static void callForResult(UIContext context, IDataViewDefinition dataView, List<String> parameters, int requestCode, boolean isSelecting)
	{
		Intent intent = getIntent(context, dataView, parameters, DisplayModes.VIEW, null);
		ActivityLauncher.setIntentFlagsNewDocument(intent);

		intent.putExtra(IntentParameters.IS_SELECTING, isSelecting);
		startActivityForResult(context.getActivity(), intent, requestCode);
	}

	public static Intent getIntent(UIContext context, IViewDefinition dataView, List<String> parameters, short mode, Map<String, String> fieldParameters)
	{
		Intent intent = new Intent();
		setupDataViewIntent(intent, context, context.getConnectivitySupport(), dataView, parameters, mode, fieldParameters);
        return intent;
	}

	static void setupDataViewIntent(Intent intent, Context context, Connectivity connectivity,
									IViewDefinition dataView, List<String> parameters, short mode,
									Map<String, String> fieldParameters)
	{
		intent.setClass(context, GenexusActivity.class);
		intent.putExtra(INTENT_EXTRA_OBJECT_NAME, dataView.getObjectName());
		intent.putExtra(IntentParameters.DATA_VIEW, dataView.getName());
		intent.putExtra(IntentParameters.MODE, mode);
		intent.putExtra(IntentParameters.CONNECTIVITY, connectivity);

		CallOptions callOptions = CallOptionsHelper.getCallOptions(dataView, mode);
		CallOptionsHelper.setCurrentCallOptions(intent, callOptions);

		IntentHelper.putList(intent, IntentParameters.PARAMETERS, parameters);
		IntentHelper.putMap(intent, IntentParameters.BC_FIELD_PARAMETERS, fieldParameters);
	}

	public static void callRelated(UIContext context, Entity baseEntity, RelationDefinition relation)
	{
		// TODO: We should have a global dictionary for Entity -> View Panel, just like for edit panels.
		WorkWithDefinition relatedWorkWith = Services.Application.getWorkWithForBC(relation.getBCRelated());
		if (relatedWorkWith != null && relatedWorkWith.getLevels().size() != 0 && relatedWorkWith.getLevel(0).getDetail() != null)
		{
			DetailDefinition detail = relatedWorkWith.getLevel(0).getDetail();
			ArrayList<String> keys = new ArrayList<>();
			for (String att : relation.getKeys())
				keys.add((String) baseEntity.getProperty(att));

			Intent intent = new Intent();
			intent.setClass(context, GenexusActivity.class);
			intent.putExtra(IntentParameters.CONNECTIVITY, context.getConnectivitySupport());
			intent.putExtra(IntentParameters.DATA_VIEW, detail.getName());
			IntentHelper.putList(intent, IntentParameters.PARAMETERS, keys);

			startActivity(context.getActivity(), intent);
		}
	}

	public static boolean call(UIContext context, String workWithName, List<String> parameters)
	{
		IDataViewDefinition definition = getDefaultDataView(workWithName);
		if (definition != null)
		{
			call(context, definition, parameters);
			return true;
		}
		else
			return false;
	}

	public static boolean callSearchResult(UIContext context, String workWithName, List<String> parameters,
										   SearchBoxDefinition searchBoxDefinition)
	{
		IDataViewDefinition definition = getDefaultDataView(workWithName);
		if (definition != null)
		{
			callSearchResult(context, definition, parameters, searchBoxDefinition);
			return true;
		}
		else
			return false;
	}

	public static boolean call(UIContext context, String workWithName)
	{
		return call(context, workWithName, null);
	}

	public static boolean callForResult(UIContext from, String workWithName, int requestCode)
	{
		IDataViewDefinition definition = getDefaultDataView(workWithName);
		if (definition != null)
		{
			callForResult(from, definition, null, requestCode, false);
			return true;
		}
		else
			return false;
	}

	private static IDataViewDefinition getDefaultDataView(String objectName)
	{
		WorkWithDefinition pattern = Cast.as(WorkWithDefinition.class, Services.Application.getPattern(objectName));
		if (pattern != null && pattern.getLevels().size() != 0)
		{
			WWLevelDefinition wwLevel = pattern.getLevel(0);
			if (wwLevel != null)
			{
				if (wwLevel.getList() != null)
					return wwLevel.getList();
				else if (wwLevel.getDetail() != null)
					return wwLevel.getDetail();
			}
		}

		return null; // Could not find WW definition, or it was empty.
	}

	public static void callLocationPicker(Activity context, String mapType, String currentValue)
	{
		Intent intent = getLocationPickerIntent(context, mapType, currentValue);
		if (intent!=null)
		{
			context.startActivityForResult(intent, RequestCodes.PICKER);
		}
	}

	public static Intent getLocationPickerIntent(Activity context, String mapType, String currentValue)
	{
		Class<? extends Activity> pickerClass = Maps.getLocationPickerActivityClass(context);
		if (pickerClass != null)
		{
			Intent intent = new Intent();
			intent.setClass(context, pickerClass);

			if (Strings.hasValue(mapType))
				intent.putExtra(LocationPickerHelper.EXTRA_MAP_TYPE, mapType);
			if (Strings.hasValue(currentValue))
				intent.putExtra(LocationPickerHelper.EXTRA_LOCATION, currentValue);

			return intent;
		}
		return null;
	}

	public static void startWebBrowser(Context context, String link)
	{
		// According to https://developer.chrome.com/multidevice/android/customtabs
		// Caller should not be setting FLAG_ACTIVITY_NEW_TASK or FLAG_ACTIVITY_NEW_DOCUMENT.
		Intent intent = newCustomTabsIntent(context, Uri.parse(link));

		try
		{
			context.startActivity(intent);
		}
		catch (ActivityNotFoundException e)
		{
			// Should never happen (unless no browser is installed!?).
			// Fall back to legacy WebViewActivity.
			Intent webViewIntent = new Intent(context, WebViewActivity.class);
			webViewIntent.putExtra("Link", link);
			ActivityLauncher.setIntentFlagsNewDocument(webViewIntent);
			context.startActivity(webViewIntent);
		}
	}

	public static void callViewVideo(Context context, String link)
	{
		Intent intent = IntentFactory.getMultimediaViewerIntent(context, link, true, null, 0);
   		context.startActivity(intent);
	}

	public static void callViewVideoFullscreen(Context context, String link, Orientation orientation, int currentPosition)
	{
		Intent intent = IntentFactory.getMultimediaViewerIntent(context, link, true, orientation, currentPosition);
		context.startActivity(intent);
	}

	public static void callViewAudio(Context context, String link)
	{
		Intent intent = IntentFactory.getMultimediaViewerIntent(context, link, true, null, 0);
   		intent.putExtra(VideoViewActivity.INTENT_EXTRA_IS_AUDIO, true);
   		intent.putExtra(VideoViewActivity.INTENT_EXTRA_SHOW_BUTTONS, true);
   		context.startActivity(intent);
	}

	public static void callLogin(UIContext from)
	{
		// Call login panel.
		String loginObject = MyApplication.getApp().getLoginObject();
		WorkWithDefinition wwMetadata = (WorkWithDefinition) Services.Application.getPattern(loginObject);

		if (wwMetadata != null && wwMetadata.getLevels().size() != 0 && wwMetadata.getLevel(0).getDetail() != null)
		{
			CallOptionsHelper.setCallOption(loginObject, CallOptions.OPTION_TARGET, CallTarget.BLANK.getName());
			ActivityLauncher.callForResult(from, wwMetadata.getLevel(0).getDetail(), null, RequestCodes.LOGIN, false);
		}
		else
			Services.Log.error(String.format("Login object (%s) is not defined.", loginObject));
	}

	public static void callFilters(UIContext context, IDataSourceController dataSource)
	{
		Intent intent = new Intent();
	    intent.setClass(context, FiltersActivity.class);
	    ActivityLauncher.setIntentFlagsNewDocument(intent);


	    IntentHelper.putObject(intent, IntentParameters.Filters.DATA_SOURCE, IDataSourceDefinition.class, dataSource.getDefinition());
	    intent.putExtra(IntentParameters.Filters.DATA_SOURCE_ID, dataSource.getId());
	    IntentHelper.putObject(intent, IntentParameters.Filters.URI, GxUri.class, dataSource.getModel().getUri());
	    intent.putExtra(IntentParameters.Filters.FILTERS_FK, dataSource.getModel().getFilterExtraInfo());
		intent.putExtra(IntentParameters.CONNECTIVITY, context.getConnectivitySupport());


		context.getActivity().startActivityForResult(intent, RequestCodes.FILTERS);
	}

	public static void callDetailFilters(UIContext context, IDataSourceDefinition dataSource, String attName, String rangeBegin, String rangeEnd, String filterDefault, String filterRangeFk)
	{
		Intent next = new Intent();
		next.setClass(context, DetailFiltersActivity.class);
		IntentHelper.putObject(next, IntentParameters.Filters.DATA_SOURCE, IDataSourceDefinition.class, dataSource);
    	next.putExtra(IntentParameters.ATT_NAME, attName);
    	next.putExtra(IntentParameters.RANGE_BEGIN, rangeBegin);
    	next.putExtra(IntentParameters.RANGE_END, rangeEnd);
    	next.putExtra(IntentParameters.FILTER_DEFAULT, filterDefault);
    	next.putExtra(IntentParameters.FILTER_RANGE_FK, filterRangeFk);
    	next.putExtra(IntentParameters.CONNECTIVITY, context.getConnectivitySupport());

    	context.getActivity().startActivityForResult(next, 0);
	}

	/**
	 * Start an activity from a given context.
	 * This called is made on the UI thread (so that transitions work).
	 */
	public static void startActivity(final Activity from, final Intent intent)
	{
		Services.Device.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				from.startActivity(intent);
				applyCallOptions(from, intent);
			}
		});
	}

	public static void startActivityForResult(final Activity from, final Intent intent, final int requestCode)
	{
		Services.Device.runOnUiThread(new Runnable()
		{
			@Override
			public void run()
			{
				from.startActivityForResult(intent, requestCode);
				applyCallOptions(from, intent);
			}
		});
	}

	public static void applyCallOptions(Activity fromActivity, Intent intent)
	{
		String objectName = intent.getStringExtra(INTENT_EXTRA_OBJECT_NAME);
		CallOptions callOptions = CallOptionsHelper.getCurrentCallOptions(intent);

		if (callOptions != null && fromActivity != null)
		{
			// Use enter/exit effects.
			if (callOptions.getEnterEffect() != null)
				callOptions.getEnterEffect().onCall(fromActivity);

			// Use replace/push.
			// TODO: Use popup, callout, target, target size.
			if (callOptions.getCallType() == CallType.REPLACE)
			{
				intent.addFlags(Intent.FLAG_ACTIVITY_FORWARD_RESULT);
				fromActivity.finish();
			}
		}

		// Remove global configured CallOptions after call.
		CallOptionsHelper.resetCallOptions(objectName);
	}

	public static void onReturn(Activity from, Intent intent)
	{
		CallOptions callOptions = CallOptionsHelper.getCurrentCallOptions(intent);

		if (callOptions != null && callOptions.getExitEffect() != null)
			callOptions.getExitEffect().onReturn(from);
	}

	@SuppressLint("InlinedApi")
	public static void setIntentFlagsNewDocument(Intent intent)
	{
		intent.setFlags(Intent.FLAG_ACTIVITY_NEW_DOCUMENT);
	}

	@NonNull
	public static Intent newCustomTabsIntent(@NonNull Context context, @NonNull Uri uri)
	{
		CustomTabsIntent.Builder builder = new CustomTabsIntent.Builder();
		builder.setShowTitle(true);

		Integer primaryColor = ThemeUtils.getAndroidThemeColorId(context, R.attr.colorPrimary);
		if (primaryColor != null)
			builder.setToolbarColor(primaryColor);

		Intent intent = builder.build().intent;
		intent.setData(uri);
		return intent;
	}
}
