package com.artech.android.layout;

import com.artech.base.metadata.enums.ControlTypes;
import com.artech.base.metadata.enums.LayoutItemsTypes;
import com.artech.base.metadata.layout.ControlInfo;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.ILayoutVisitor;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;

public class GridsLayoutVisitor implements ILayoutVisitor
{
	private boolean mHasScrollableGrid = false;
	private boolean mHasScrollableView = false;
	private boolean mHasScrollableSection = false;
	private boolean mHasScrollableWebView = false;

	private GridsLayoutVisitor() { }

	public static boolean hasScrollableViews(LayoutDefinition layout)
	{
		if (layout != null)
			return hasScrollableViews(layout.getTable());
		else
			return false;
	}

	public static boolean hasScrollableViews(LayoutItemDefinition item)
	{
		if (item != null)
		{
			GridsLayoutVisitor visitor = new GridsLayoutVisitor();
			item.accept(visitor);
			return visitor.hasScrollableView();
		}
		else
			return false;
	}

	public static boolean hasAnyScrollable(LayoutDefinition layout)
	{
		if (layout != null)
			return hasAnyScrollable(layout.getTable());
		else
			return false;
	}

	public static boolean hasAnyScrollable(LayoutItemDefinition item)
	{
		if (item != null)
		{
			GridsLayoutVisitor visitor = new GridsLayoutVisitor();
			item.accept(visitor);
			return visitor.hasAnyScrollable();
		}
		else
			return false;
	}
	
	@Override
	public void enterVisitor(LayoutItemDefinition visitable) {	}

	@Override
	public void visit(LayoutItemDefinition visitable)
	{
		if (visitable.getType().equalsIgnoreCase(LayoutItemsTypes.GRID))
		{
			GridDefinition grid = (GridDefinition)visitable;

			UserControlDefinition gridControl = null;
			if (grid.getControlInfo() != null)
				gridControl = UcFactory.getControlDefinition(grid.getControlInfo().getControl());

			if (gridControl != null)
			{
				if (gridControl.IsScrollable)
					mHasScrollableGrid = true;
			}
			else
			{
				// A default ListView supports autogrow and in that case it will not have scroll.
				if (!grid.hasAutoGrow())
					mHasScrollableGrid = true;
			}
		}

		if (visitable.getType().equalsIgnoreCase(LayoutItemsTypes.DATA))
		{
			//sd chart can be associated to an att or var too.
			ControlInfo controlInfo = visitable.getControlInfo();
			if (controlInfo != null)
			{
				String name = controlInfo.getControl();
				UserControlDefinition attView = UcFactory.getControlDefinition(name);
				if (attView != null && attView.IsScrollable)
					mHasScrollableView = true;
			}

			if (visitable.getControlType().equals(ControlTypes.WEB_VIEW))
			{
				 if (!visitable.hasAutoGrow() && !visitable.noRequireScrollView())
					 mHasScrollableWebView = true; // WebView doesn't support nested scroll
			}
		}
		
		//Temp , component.  allowscroll outside it, will not scroll inside.
		if (visitable.getType().equalsIgnoreCase(LayoutItemsTypes.COMPONENT))
		{
			// if autogrow allow scroll outside.
			if (!visitable.hasAutoGrow())
			{
				// TODO: see how to decide it
				mHasScrollableSection = true;
			}
		}
		//Temp , section cannot scroll outside it, to allow scroll inside.
		if (visitable.getType().equalsIgnoreCase(LayoutItemsTypes.ONE_CONTENT))
		{
			// TODO: see how to decide it
			mHasScrollableSection = true;
		}
		//Temp , section cannot scroll outside it, to allow scroll inside.
		if (visitable.getType().equalsIgnoreCase(LayoutItemsTypes.ALL_CONTENT))
		{
			//should be a tab with sections or one section.
			mHasScrollableView = true;
		}
	}

	private boolean hasScrollableGrid() { return mHasScrollableGrid; }
	private boolean hasScrollableView() { return mHasScrollableGrid || mHasScrollableView; }
	private boolean hasScrollableSection() { return mHasScrollableSection; }
	private boolean hasScrollableWebView() { return mHasScrollableWebView; }

	private boolean hasAnyScrollable()
	{
		return (mHasScrollableGrid || mHasScrollableView || mHasScrollableSection || mHasScrollableWebView);
	}

	@Override
	public void leaveVisitor(LayoutItemDefinition visitable) { }
}
