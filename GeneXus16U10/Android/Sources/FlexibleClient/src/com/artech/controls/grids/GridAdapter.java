package com.artech.controls.grids;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.SectionIndexer;

import com.artech.adapters.AdaptersHelper;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.IDataSourceDefinition;
import com.artech.base.metadata.OrderAttributeDefinition;
import com.artech.base.metadata.OrderDefinition;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.GridDefinition.SelectionType;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.base.metadata.theme.LayoutBoxMeasures;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.FormatHelper;
import com.artech.controllers.ViewData;

public class GridAdapter extends BaseAdapter implements IGridAdapter, SectionIndexer
{
	private final GridHelper mHelper;
	private final GridDefinition mDefinition;

	private ViewData mViewData;
	private ArrayList<Entity> mData;
	private int mSelectedIndex;
	private IDataSourceDefinition mCurrentDataSource;
	private OrderDefinition mCurrentOrder;

	private String[] mSections;
	private HashMap<String, Integer> mAlphaIndexer;

	private boolean mInSelectionMode;
	private static final int CHECKBOX_WIDTH = 70; // dip

	public static final int SELECTED_INDEX_NONE = -1;

	public GridAdapter(Context context, GridHelper helper, GridDefinition definition)
	{
		mHelper = helper;
		mDefinition = definition;
		mSelectedIndex = SELECTED_INDEX_NONE;
	}

	public GridDefinition getDefinition()
	{
		return mDefinition;
	}

	public void setData(ViewData data)
	{
		mViewData = data;

		mData = new ArrayList<>(data.getEntities());
		if (mDefinition.hasInverseLoad())
			Collections.reverse(mData);

		mCurrentDataSource = (data.getUri() != null ? data.getUri().getDataSource() : null);
		mCurrentOrder = (data.getUri() != null ? data.getUri().getOrder() : null);
		notifyDataSetChanged();
	}

	public void runDefaultAction(int index)
	{
		mHelper.runDefaultAction(getEntity(index));
	}

	@Override
	public ViewData getData()
	{
		return mViewData;
	}

	@Override
	public int getCount()
	{
		return (mData != null ? mData.size() : 0);
	}

	@Override
	public Object getItem(int position)
	{
		return getEntity(position);
	}

	@Override
	public Entity getEntity(int position)
	{
		return (mData != null ? mData.get(position) : null);
	}

	public int getIndexOf(Entity item)
	{
		return (mData != null ? mData.indexOf(item) : -1);
	}

	public int getSelectedIndex()
	{
		return mSelectedIndex;
	}

	private Entity getSelectedItem()
	{
		if (mSelectedIndex >= 0 && mSelectedIndex < getCount())
			return getEntity(mSelectedIndex);
		else
			return null;
	}

	public void selectIndex(int index, boolean fireSelectionChangedEvent)
	{
		if (mDefinition.getSelectionType() == SelectionType.NoSelection)
		{
			// Can't select a grid item in this mode.
			return;
		}

		if (index < 0 || index >= getCount())
			return;

		Entity newSelection = getEntity(index);
		Entity previousSelection = getSelectedItem();

		boolean selectionChanged = false;

		if (newSelection != previousSelection)
		{
			if (!mDefinition.isMultipleSelectionEnabled()) {
				mSelectedIndex = index;
			}
			selectionChanged = true;

			if (fireSelectionChangedEvent)
				mHelper.getCoordinator().runControlEvent(mHelper.getGridView(), GridHelper.EVENT_SELECTION_CHANGED);
		}
		else
		{
			// Tapped on the selected item: Should it be deselected or remain selected?
			if (mDefinition.getSelectionType() == SelectionType.KeepUntilNewSelection)
			{
				mSelectedIndex = SELECTED_INDEX_NONE;
				selectionChanged = true;
			}
		}

		// Force a re-layout, if necessary.
		if (selectionChanged && (mHelper.hasDifferentLayoutWhenSelected(newSelection) || mHelper.hasDifferentLayoutWhenSelected(previousSelection)))
			notifyDataSetChanged();
	}

	public void deselectIndex(int index, boolean fireSelectionChangedEvent)
	{
        if (mDefinition.getSelectionType() == SelectionType.NoSelection)
        {
            // Can't deselect a grid item in this mode.
            return;
        }

		if (index < 0 || index >= getCount())
			return;

		boolean selectionChanged;
		Entity previousSelection = getSelectedItem();

		if (mSelectedIndex != SELECTED_INDEX_NONE) {
			mSelectedIndex = SELECTED_INDEX_NONE;
			selectionChanged = true;

			if (fireSelectionChangedEvent)
				mHelper.getCoordinator().runControlEvent(mHelper.getGridView(), GridHelper.EVENT_SELECTION_CHANGED);
		} else {
			selectionChanged = false;
		}

		// Force a re-layout, if necessary.
		if (selectionChanged && mHelper.hasDifferentLayoutWhenSelected(previousSelection))
			notifyDataSetChanged();
	}

	private boolean isSelected(Entity item)
	{
		if (item.isSelected())
			return true;

		if (mSelectedIndex != -1)
		{
			int itemIndex = getIndexOf(item);
			if (itemIndex == mSelectedIndex)
				return true;
		}

		return false;
	}

	private boolean isSelected(int position)
	{
		Entity item = getEntity(position);
		return (item != null && isSelected(item));
	}

	@Override
	public long getItemId(int position)
	{
		return position;
	}

	@Override
	public View getView(int position, View convertView, ViewGroup parent)
	{
		GridItemViewInfo itemView = mHelper.getItemView(this, position, convertView, mInSelectionMode, isSelected(position));

		// Header for alpha indexer.
		if (isGroupHeaderVisible(position))
		{
			itemView.getHeaderText().setVisibility(View.VISIBLE);
			itemView.getHeaderText().setText(getGroupHeaderText(position));
		}
		else
		{
			if (itemView.getHeaderText() != null)
				itemView.getHeaderText().setVisibility(View.GONE);
		}

		return itemView.getView();
	}

	@Override
	public int getItemViewType(int position)
	{
		Entity item = getEntity(position);
		if (item != null)
		{
			boolean odd = position % 2 == 0;
			TableDefinition itemLayout = mHelper.getLayoutFor(item, odd, isSelected(item));
			if (itemLayout != null)
				return mDefinition.getItemLayouts(odd).indexOf(itemLayout);
		}

		return 0;
	}

	public TableDefinition getLayoutFor(Entity item, boolean odd)
	{
		return mHelper.getLayoutFor(item, odd, isSelected(item));
	}

	@Override
	public int getViewTypeCount()
	{
		return mDefinition.getItemLayouts().size(); // They are the same count for odd or even
	}

	/**
	 * Returns whether the item's view is empty (i.e. either it has no possible layout,
	 * or its associated layout is an empty table with no controls), so that the Grid
	 * may decide to forgo showing it altogether.
	 */
	public boolean isItemViewEmpty(Entity item)
	{
		if (item == null)
			return true;

		TableDefinition itemLayout = mHelper.getLayoutFor(item, true, false); // They are the same count for odd or even
		if (itemLayout == null)
			return true;

		return (itemLayout.Rows.size() == 0);
	}

	public void setSelectionMode(boolean value)
	{
		if (mInSelectionMode != value)
		{
			mInSelectionMode = value;

			// Update table bounds to reserve/free space for checkbox.
			mHelper.setReservedSpace(value ? CHECKBOX_WIDTH : 0);

			// Refresh so that checkbox is shown/hidden.
			notifyDataSetChanged();
		}
	}

	public void adjustSizeWithMarginPadding(GridDefinition mDefinition)
	{
		// reserve space for margin/padding in width, for scroll grids
		int widthToRemove = 0;
		ThemeClassDefinition themeClass = mDefinition.getThemeClass();

		if (themeClass!=null && themeClass.hasMarginSet())
		{
			LayoutBoxMeasures margins = themeClass.getMargins();
			widthToRemove = widthToRemove + (margins.left+margins.right);
		}

		if (themeClass!=null && themeClass.hasPaddingSet())
		{
			LayoutBoxMeasures padding = themeClass.getPadding();
			widthToRemove = widthToRemove + (padding.left + padding.right);
		}

		if (widthToRemove>0)
			mHelper.setReservedSpace(widthToRemove);
	}

	public void setBounds(int width, int height)
	{
		mHelper.setBounds(width, height);
	}

	public boolean isGroupHeaderVisible(int position)
	{
		if (mCurrentDataSource == null || !mCurrentDataSource.getOrders().hasBreakBy(mCurrentOrder))
			return false;

		List<DataItem> groupAttributes = mCurrentDataSource.getOrders().getBreakByAttributes(mCurrentOrder);
		if (groupAttributes.size() == 0)
			return false;

		if (mViewData!=null && mViewData.getUri().hasSearchValue()
			&& mDefinition.hasBreakBy()
			&& mCurrentDataSource!=null && mCurrentDataSource.getFilter().getSearch()!=null &&
			!mCurrentDataSource.getFilter().getSearch().showBreakBy())
			return false;

		if (position == 0)
			return true;

		// Compare position with position-1 item.
		Entity item = getEntity(position);
		Entity itemPrevious = getEntity(position - 1);

		boolean sameGroup = true;
		for (DataItem att : groupAttributes)
		{
			Object propertyValue = item.getProperty(att.getName());
			if (propertyValue != null)
			{
				if (!propertyValue.equals(itemPrevious.getProperty(att.getName())))
				{
					sameGroup = false;
					break;
				}
			}
		}

		return !sameGroup;
	}

	public CharSequence getGroupHeaderText(int position)
	{
		int index = 0;
		Entity item = getEntity(position);
		StringBuilder result = new StringBuilder();
		for (DataItem att : mCurrentDataSource.getOrders().getBreakByDescriptionAttributes(mCurrentOrder))
		{
			if (index != 0)
				result.append(" - ");

			result.append(AdaptersHelper.getFormattedText(item, att.getName(), att));
			index++;
		}

		return result.toString();
	}

	private boolean showAlphaIndexer()
	{
		return (mCurrentOrder != null && mCurrentOrder.getEnableAlphaIndexer());
	}

	@Override
	public int getPositionForSection(int section)
	{
		if (showAlphaIndexer())
		{
			calculateSections();
			if (section < mSections.length)
				return mAlphaIndexer.get(mSections[section]);
		}
		return 0;
	}

	@Override
	public int getSectionForPosition(int position)
	{
		return 1;
	}

	@Override
	public Object[] getSections()
	{
		if (showAlphaIndexer())
		{
			calculateSections();
			return mSections;
		}
		return new Object[0];
	}

	@Override
	public void notifyDataSetChanged()
	{
		super.notifyDataSetChanged();

		if (showAlphaIndexer())
		{
			mSections = null;
			calculateSections();
		}
	}

	private void calculateSections()
	{
		if (mSections == null)
		{
			int count = getCount();
			mAlphaIndexer = new HashMap<>();
			for (int x = count-1; x >= 0; x--)
			{
				Entity ent = mData.get(x);

				// get the first letter.
				String currentValue = getSectionText(ent);
				if (Services.Strings.hasValue(currentValue))
				{
					try
					{
						// Check if the currentValue is a number.
						//noinspection ResultOfMethodCallIgnored
						Integer.valueOf(currentValue);
						mAlphaIndexer.put(currentValue, x);
					}
					catch (NumberFormatException ex)
					{
						// The currentValue is a String.
						// Convert to uppercase, otherwise lowercase a-z will be sorted after upper A-Z.
						String ch = currentValue.substring(0, 1).toUpperCase(Locale.getDefault());

						// HashMap will prevent duplicates
						mAlphaIndexer.put(ch, x);
					}
				}
			}

			Set<String> sectionLetters = mAlphaIndexer.keySet();

			// create a list from the set to sort
			ArrayList<String> sectionList = new ArrayList<>(sectionLetters);
			Collections.sort(sectionList);
			mSections = new String[sectionList.size()];
			sectionList.toArray(mSections);
		}
	}

	private String getSectionText(Entity item)
	{
		String result = Strings.EMPTY;
		if (mCurrentOrder != null && mCurrentOrder.getEnableAlphaIndexer())
		{
			for (OrderAttributeDefinition orderAtt : mCurrentOrder.getAttributes())
			{
				String attValue = item.optStringProperty(orderAtt.getName());
				result += FormatHelper.formatValue(attValue, orderAtt.getAttribute());
			}
		}

		return result;
	}
}
