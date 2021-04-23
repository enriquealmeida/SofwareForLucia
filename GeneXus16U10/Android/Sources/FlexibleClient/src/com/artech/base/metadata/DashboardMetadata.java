package com.artech.base.metadata;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import android.annotation.SuppressLint;
import android.view.View;

import com.artech.actions.UIContext;
import com.artech.application.MyApplication;
import com.artech.base.metadata.enums.Alignment;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.layout.TabControlDefinition;
import com.artech.base.metadata.theme.TabControlThemeClassDefinition;
import com.artech.base.metadata.theme.ThemeApplicationBarClassDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.controllers.IDataViewController;
import com.artech.controllers.RefreshParameters;
import com.artech.fragments.IDataView;
import com.artech.ui.Anchor;

public class DashboardMetadata implements IPatternMetadata, IViewDefinition, ILayoutDefinition, IDataView
{
	private static final long serialVersionUID = 1L;

	public static final String CONTROL_TABS = "Tabs";
	public static final String CONTROL_LIST = "List";
	public static final String CONTROL_GRID = "Grid";

	private final ArrayList<DashboardItem> mItems;
	private final ArrayList<ActionDefinition> mEvents;
	private final ArrayList<ActionDefinition> mSubroutines;
	private final List<VariableDefinition> mVariables;
	private final HashMap<String, DashboardItem> mNotificationActions;

	private String mBackgroundImage;
	private String mHeaderImage;
	private String mTitle;
	private String mName;
	private String mControl;
	private String mUserControl;
	private String mThemeClass;
	private String mTabsBehavior;
	private String mTabsImagePosition;

	private final InstanceProperties mInstanceProperties = new InstanceProperties();
	private boolean mShowAds;
	private String mAdsPosition;

	private boolean mShowApplicationBar;
	private String mApplicationBarClass;

	public DashboardMetadata()
	{
		mItems = new ArrayList<>();
		mEvents = new ArrayList<>();
		mSubroutines = new ArrayList<>();
		mVariables = new ArrayList<>();
		mNotificationActions = new HashMap<>();
	}

	public String getBackgroundImage() { return mBackgroundImage; }
	public void setBackgroundImage(String image) { mBackgroundImage = image; }

	public String getHeaderImage() { return mHeaderImage; }
	public void setHeaderImage(String image) { mHeaderImage = image; }

	public DashboardItem getItem(int position) { return mItems.get(position); }
	public List<DashboardItem> getItems() { return mItems; }
	public List<ActionDefinition> getEvents() { return mEvents; }
	public List<ActionDefinition> getSubroutines() { return mSubroutines; }

	@Override
	public List<ObjectParameterDefinition> getParameters()
	{
		// Dashboards, for now, do not have parameters.
		return Collections.emptyList();
	}

	public HashMap<String, DashboardItem> getNotificationActions() { return mNotificationActions; }

	@Override
	public String getCaption() { return Services.Language.getTranslation(mTitle); }
	public void setCaption(String value) { mTitle = value; }

	@Override
	public String getObjectName() { return mName; }

	@Override
	public String getName() { return mName; }

	@Override
	public void setName(String name) { mName = name; }

	public String getControl() { return mControl; }
	public void setControl(String value) { mControl = value; }

	public String getUserControl() { return mUserControl; }
	public void setUserControl(String value) { mUserControl = value; }

	public void setThemeClass(String value) { mThemeClass = value; }

	public ThemeClassDefinition getThemeClassForGrid()
	{
		ThemeClassDefinition dashboardClass = Services.Themes.getThemeClass(mThemeClass);
		if (dashboardClass != null)
			return Services.Themes.getThemeClass(dashboardClass.getThemeGrid());
		else
			return null;
	}

	public TabControlThemeClassDefinition getThemeClassForTabs()
	{
		ThemeClassDefinition dashboardClass = Services.Themes.getThemeClass(mThemeClass);
		if (dashboardClass != null)
			return Services.Themes.getThemeClass(TabControlThemeClassDefinition.class, dashboardClass.getThemeTab());
		else
			return null;
	}

	@Override
	public InstanceProperties getInstanceProperties() { return mInstanceProperties; }

	//Ads
	public void setShowAds(boolean value) { mShowAds = value; }
	public boolean getShowAds() { return mShowAds; }


	public void setAdsPosition(String value) { mAdsPosition = value; }
	public String getAdsPosition() { return mAdsPosition; }

	public boolean getShowLogout()
	{
		return mInstanceProperties.getShowLogoutButton();
	}

	public void setTabsBehavior(String value) { mTabsBehavior = value; }

	public void setTabsImagePosition(String value) { mTabsImagePosition = value; }

	@Override
	public boolean isSecure()
	{
		return (MyApplication.getApp().isSecure() && !getInstanceProperties().notSecureInstance());
	}

	@Override
	public boolean getShowApplicationBar() { return mShowApplicationBar; }
	public void setShowApplicationBar(boolean value) { mShowApplicationBar = value; }

	//Dashboard do not have a Layout, neither a main table.
	@Override
	public boolean getEnableHeaderRowPattern() { return false; }

	@Override
	public ThemeApplicationBarClassDefinition getHeaderRowApplicationBarClass()
	{
		return null;
	}

	@Override
	public ThemeApplicationBarClassDefinition getApplicationBarClass() {
		return Services.Themes.getThemeClass(ThemeApplicationBarClassDefinition.class, mApplicationBarClass);
	}

	public void setApplicationBarClass(String value) { mApplicationBarClass = value; }

	@Override
	public List<VariableDefinition> getVariables()
	{
		return mVariables;
	}

	// Connectivity Support
	@Override
	public Connectivity getConnectivitySupport() {
		return mInstanceProperties.getConnectivitySupport();
	}

	@SuppressLint("DefaultLocale")
	@Override
	public VariableDefinition getVariable(String name) {
		String variableName = name.replace("&", "");
		for (VariableDefinition var : getVariables()) {
			if (var.getName().equalsIgnoreCase(variableName)) {
				return var;
			}
		}
		return null;
	}

	@Override
	public ActionDefinition getEvent(String name)
	{
		ActionDefinition event = Events.find(mEvents, name);
		if (event == null)
		{
			// Also look among notification events
			DashboardItem dashboardItem = getNotificationActions().get(name);
			if (dashboardItem != null)
				event = dashboardItem.getActionDefinition();
		}
		if (event == null)
		{
			// Check subroutines
			event = Events.find(mSubroutines, name);
		}
		return event;
	}

	@Override
	public ActionDefinition getClientStart()
	{
		return getEvent(Events.CLIENT_START);
	}

	private TabControlDefinition.TabStripKind mTabStripKind;

	public TabControlDefinition.TabStripKind getTabStripKind()
	{
		if (mTabStripKind==null)
		{
			// Platform Default: Fixed
			String strValue = mTabsBehavior;
			if (Strings.hasValue(strValue) && strValue.equalsIgnoreCase("Show More Button"))
				mTabStripKind = TabControlDefinition.TabStripKind.Fixed;
			else if (Strings.hasValue(strValue) && strValue.equalsIgnoreCase("Scroll"))
				mTabStripKind = TabControlDefinition.TabStripKind.Scrollable;
			else // No value, unknown, or "Platform Default"., default fixed
				mTabStripKind = TabControlDefinition.TabStripKind.Fixed;
		}

		return mTabStripKind;
	}

	public int getTabsImageAlignment()
	{
		return Alignment.parseImagePosition(mTabsImagePosition, Alignment.START);
	}

	@Override
	public IViewDefinition getDefinition() {
		return this;
	}

	@Override
	public short getMode() {
		return 0;
	}

	@Override
	public LayoutDefinition getLayout() {
		return null;
	}

	@Override
	public IDataViewController getController() {
		return null;
	}

	@Override
	public void runAction(ActionDefinition action, Anchor anchor) {

	}

	@Override
	public UIContext getUIContext() {
		return null;
	}

	@Override
	public Entity getContextEntity() {
		return null;
	}

	@Override
	public boolean isActive() {
		return false;
	}

	@Override
	public void setActive(boolean value) {

	}

	@Override
	public boolean isDataReady() {
		return false;
	}

	@Override
	public void refreshData(RefreshParameters params) {

	}

	@Override
	public void updateActionBar() {

	}

	@Override
	public View getRootView() {
		return null;
	}
}
