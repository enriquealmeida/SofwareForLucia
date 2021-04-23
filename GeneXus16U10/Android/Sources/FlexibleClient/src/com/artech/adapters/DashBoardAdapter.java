package com.artech.adapters;

import android.graphics.drawable.Drawable;
import androidx.core.content.ContextCompat;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.BaseAdapter;

import com.artech.R;
import com.artech.actions.Action;
import com.artech.actions.ActionExecution;
import com.artech.actions.ActionFactory;
import com.artech.actions.ActionParameters;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityLauncher;
import com.artech.android.analytics.Analytics;
import com.artech.android.layout.GxTheme;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.DashboardItem;
import com.artech.base.metadata.DashboardMetadata;
import com.artech.base.metadata.loader.DashboardMetadataLoader;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.controls.GxImageViewStatic;
import com.artech.controls.GxLinearLayout;
import com.artech.controls.GxTextView;
import com.artech.resources.StandardImages;
import com.artech.utils.ThemeUtils;

public class DashBoardAdapter extends BaseAdapter implements AdapterView.OnItemClickListener
{
	private DashboardMetadata mDefinition;
	private final UIContext mContext;
	private final LayoutInflater mInflater;
	private final Entity mDashboardEntity;

	public DashBoardAdapter(UIContext context, Entity dashboardEntity)
	{
		mContext = context;
		mDashboardEntity = dashboardEntity;

		// Cache the LayoutInflate to avoid asking for a new one each time.
		mInflater = LayoutInflater.from(context);
    }

	public void setDefinition(DashboardMetadata value)
	{
		mDefinition = value;
	}

	@Override
	public int getCount()
	{
		if (mDefinition == null)
			return 0;

		return mDefinition.getItems().size();
	}

	@Override
	public Object getItem(int position)
	{
		return mDefinition.getItem(position);
	}

	@Override
	public long getItemId(int position)
	{
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent)
	{
		ViewHolder holder;

		if (convertView == null)
		{
			if (mDefinition.getControl().equalsIgnoreCase(DashboardMetadata.CONTROL_LIST))
				convertView = mInflater.inflate(R.layout.dashboarditeminlist, parent, false);
			else
				convertView = mInflater.inflate(R.layout.dashboarditem, parent, false);

			holder = new ViewHolder();
			holder.text = convertView.findViewById(R.id.DashBoardTextView);
			holder.icon = convertView.findViewById(R.id.DashBoardImageView);

			convertView.setTag(holder);
		}
		else
			holder = (ViewHolder) convertView.getTag();

		// Bind the data efficiently with the holder.
		DashboardItem dashboardItem = mDefinition.getItems().get(position);
		holder.text.setText( dashboardItem.getTitle());

		GxLinearLayout layout = (GxLinearLayout) convertView;
		layout.setId(R.id.dashboard_item);
		String themeClass = dashboardItem.getThemeClass();
		if (Services.Strings.hasValue(themeClass))
		{
			// Apply Style for the item
			GxTheme.applyStyle(layout, dashboardItem.getThemeClass());
			ThemeUtils.setFontProperties(holder.text, Services.Themes.getThemeClass(dashboardItem.getThemeClass()));

			// Take into account the Content Mode of Images
			ThemeClassDefinition classDef = Services.Themes.getThemeClass(themeClass);
			if (classDef != null)
			{
				String imageClass = classDef.getThemeImageClass();
				if (Services.Strings.hasValue(imageClass))
					GxTheme.applyStyle(holder.icon, imageClass);
			}
		}

		if (dashboardItem.hasImage()) {
			Services.Images.showStaticImage(mContext.getActivity(), holder.icon, dashboardItem.getImageName());
		} else {
			Drawable drawable = ContextCompat.getDrawable(mContext, R.drawable.stub_dashboard);
			StandardImages.showPlaceholderImage(holder.icon, drawable, true);
		}

		return convertView;
	}

	@Override
	public void onItemClick(AdapterView<?> parent, View view, int position, long id)
	{
		DashboardItem dashboardItem = mDefinition.getItems().get(position);

		if (dashboardItem.getKind() == DashboardMetadataLoader.COMPONENT_KIND)
		{
			String link = dashboardItem.getObjectName();
			ActivityLauncher.startWebBrowser(mContext, link);
		}
		else
		{
			runDashboardItem(mContext, dashboardItem, mDashboardEntity);
		}
	}

	private static class ViewHolder
	{
		GxTextView text;
		GxImageViewStatic icon;
	}

	public static void runDashboardItem(UIContext context, DashboardItem dashboardItem, Entity entityParam)
	{
		if (dashboardItem != null)
		{
			ActionDefinition action = dashboardItem.getActionDefinition();
			Analytics.onAction(context, action);

			Action doAction = ActionFactory.getAction(context, action, new ActionParameters(entityParam));
			ActionExecution exec = new ActionExecution(doAction);
			exec.executeAction();
		}
	}
}
