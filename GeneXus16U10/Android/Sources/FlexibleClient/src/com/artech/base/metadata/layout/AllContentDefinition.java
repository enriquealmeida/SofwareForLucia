package com.artech.base.metadata.layout;

import java.util.List;

import com.artech.android.layout.SectionsLayoutVisitor;
import com.artech.base.metadata.DetailDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.common.LayoutHelper;

/**
 * Metadata definition for the "all content" control.
 */
public class AllContentDefinition extends LayoutItemDefinition
{
	private int mDisplay;

	public static final int DISPLAY_TABS = 0;
	public static final int DISPLAY_INLINE = 1;
	public static final int DISPLAY_LINK = 2;

	public AllContentDefinition(LayoutDefinition layout, LayoutItemDefinition itemParent)
	{
		super(layout, itemParent);
	}

	@Override
	public void readData(INodeObject node)
	{
		super.readData(node);
		mDisplay = Services.Strings.parseIntEnum(node.optString("@display"), DISPLAY_TABS, "Tab", "Inline", "Link");
	}

	public int getDisplay()
	{
		return mDisplay;
	}

	// DisplayModes
	private short mTrnMode = 0;

	public void setTrnMode(short trnMode)
	{
		mTrnMode = trnMode;
	}

	@Override
	public boolean hasAutoGrow()
	{
		if (mDisplay == DISPLAY_INLINE)
			return super.hasAutoGrow();
		else
		{
			this.getChildItems().size();
			IDataViewDefinition dataView = this.getLayout().getParent();
			if (dataView != null && dataView instanceof DetailDefinition)
			{
				List<SectionsLayoutVisitor.LayoutSection> tabsSections = LayoutHelper.getDetailSections((DetailDefinition) dataView, mTrnMode);
				if (tabsSections.size() == 1)
				{
					// One section container , need autogrow = true to scroll to work. In the metadata nothing is coming?
					//
					return true;
					//return super.hasAutoGrow();
				}
			}
			return false; // Tabs and Link do not have the autogrow property.
		}

	}
}
