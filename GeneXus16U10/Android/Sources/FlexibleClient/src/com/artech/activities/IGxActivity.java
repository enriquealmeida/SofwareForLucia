package com.artech.activities;

import com.artech.base.metadata.IDataViewDefinition;
import com.artech.controllers.RefreshParameters;
import com.artech.fragments.IDataView;

public interface IGxActivity extends IGxBaseActivity
{
	ActivityModel getModel();
	ActivityController getController();
	Iterable<IDataView> getDataViews();
	Iterable<IDataView> getActiveDataViews(boolean includeNoLayoutDataViews);

	IDataViewDefinition getMainDefinition();
	void refreshData(RefreshParameters params);

	void setReturnResult();
}
