package com.artech.base.metadata;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import com.artech.base.metadata.enums.GxObjectTypes;
import com.artech.base.model.PropertiesObject;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class ActionDefinition extends PropertiesObject implements Serializable
{
	private static final long serialVersionUID = 1L;

	private String mName;
	private final IViewDefinition mViewDefinition;
	private String mActionType;
	private String mActionPackage;

	 // TODO: We should separate "action" from "event". "Action" is a line of a composite block, "Event" is the whole thing.
	private final ArrayList<ActionParameter> mEventParameters = new ArrayList<>();
	private List<ActionParameter> mParameters = new ArrayList<>();

	private short mGxObjectType = GxObjectTypes.NONE;
	private String mGxObject = null;

	public static class StandardAction
	{
		public static final String REFRESH = "Refresh";
		public static final String SEARCH = "Search";
		public static final String FILTER = "Filter";
		public static final String INSERT = "Insert";
		public static final String UPDATE = "Update";
		public static final String EDIT = "Edit";
		public static final String DELETE = "Delete";
		public static final String SAVE = "Save";
		public static final String CANCEL = "Cancel";
		public static final String SHARE = "Share";
	}

	public ActionDefinition(IViewDefinition definition)
	{
		mViewDefinition = definition;
	}

	@Override
	protected void internalDeserialize(INodeObject data)
	{
		super.internalDeserialize(data);

		// The base deserialization doesn't read any non-atomic nodes. So read extras here.
		deserializeSubNode(data, "expression");
		deserializeSubNode(data, "assignExpression");
		deserializeSubNode(data, "targetExpression");
		deserializeSubNode(data, "commandExpression");
		deserializeSubNode(data, "ForInCollectionExpression");
	}

	private void deserializeSubNode(INodeObject data, String key)
	{
		INodeObject expression = data.optNode(key);
		if (expression != null)
			setProperty(key, expression);
	}

	public void setParameters(List<ActionParameter> parameters) {
		mParameters = parameters;
	}

	private final ArrayList<ActionDefinition> mNextActions = new ArrayList<>();
	private final ArrayList<ActionDefinition> mInnerActions = new ArrayList<>();

	public List<ActionParameter> getEventParameters() { return mEventParameters; }
	public List<ActionParameter> getParameters() { return mParameters; }

	public ActionParameter getParameter(int position)
	{
		if (position < mParameters.size())
			return mParameters.get(position);

		return null;
	}

	public IViewDefinition getViewDefinition() { return mViewDefinition; }

	public String getName()
	{
		if (mName == null)
			mName = optStringProperty("@name");

		return mName;
	}

	public List<ActionDefinition> getNextActions() {
		return mNextActions;
	}

	public List<ActionDefinition> getInnerActions() {
		return mInnerActions;
	}

	public String getGxObject() { return mGxObject; }
	public void setGxObject(String value) { mGxObject = value; }

	public short getGxObjectType() { return mGxObjectType; }
	public void setGxObjectType(short value) { mGxObjectType = value; }

	public String getActionType()
	{
		if (mActionType == null)
			mActionType = optStringProperty("@actionType");

		return mActionType;
		
	}

	public String getActionPackage()
	{
		if (mActionPackage == null)
			mActionPackage = optStringProperty("@androidPackage");

		return mActionPackage;

	}

	public MultipleSelectionInfo getMultipleSelectionInfo()
	{
		if (Services.Strings.hasValue(optStringProperty(MultipleSelectionInfo.PROP_FOREACHLINE)))
			return new MultipleSelectionInfo(this);
		else
			return null;
	}

	public static class MultipleSelectionInfo
	{
		private final String mGrid;
		private final boolean mUseSelection;

		private static final String PROP_FOREACHLINE = "@ForEachLineType";

		private MultipleSelectionInfo(ActionDefinition action)
		{
			mGrid = action.optStringProperty("@ForEachLineGrid");
			mUseSelection = action.optStringProperty(PROP_FOREACHLINE).equalsIgnoreCase("selected");
		}

		public String getGrid() { return mGrid; }
		public boolean useSelection() { return mUseSelection; }
	}

	public static class DependencyInfo
	{
		public static final String SERVICE = "@DependencyService";
		public static final String SERVICE_INPUT = "@DependencyServiceInput";
		public static final String SERVICE_OUTPUT = "@DependencyServiceOutput";
	}
}
