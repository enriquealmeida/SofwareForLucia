package com.artech.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import android.app.Activity;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;

import com.artech.actions.Action;
import com.artech.actions.ActionFactory;
import com.artech.actions.ActionParameters;
import com.artech.actions.CompositeAction;
import com.artech.actions.CompositeAction.IEventListener;
import com.artech.actions.UIContext;
import com.artech.activities.ActivityController;
import com.artech.activities.IntentParameters;
import com.artech.app.ComponentId;
import com.artech.app.ComponentParameters;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.DataItemHelper;
import com.artech.base.metadata.IDataSourceDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.ObjectParameterDefinition;
import com.artech.base.metadata.SectionDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.DisplayModes;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityParentInfo;
import com.artech.base.providers.GxUri;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.fragments.IDataView;
import com.artech.services.EntityService;

public class DataViewController implements IDataViewController {
	private static int sNextSessionId = 1;
	private List<CompositeAction> mBlockingActions = new ArrayList<>();
	private final ComponentId mId;
	private final DataViewModel mModel;
	private final int mSessionId;
	private ActivityController mParent;
	private IDataView mDataView;
	// Controllers
	private HashMap<DataSourceModel, IDataSourceControllerInternal> mControllers;
	private ArrayList<IDataSourceControllerInternal> mRunningControllers; // Includes "Empty" controllers. Must keep order.
	private State mState;
	private Entity mRootData;
	// private HashMap<IDataSourceControllerInternal, ViewData> mSubordinatedData;
	private HashMap<String, String> mServerValues;

	public DataViewController(ActivityController parent, ComponentId id, DataViewModel model, IDataView dataView) {
		mParent = parent;
		mId = id;
		mModel = model;
		mDataView = dataView;
		mState = State.NOT_STARTED;
		mSessionId = createSessionId();

		initializeRootData();

		// Initialize controllers for each data source (though they will be attached to views later).
		initializeDataControllers();
	}

	public static synchronized int createSessionId() {
		return sNextSessionId++;
	}

	@Override
	public ComponentId getId() {
		return mId;
	}

	private void initializeRootData() {
		StructureDefinition rootStructure = StructureDefinition.EMPTY;
		if (mModel.getDefinition().getMainDataSource() != null)
			rootStructure = mModel.getDefinition().getMainDataSource().getStructure();

		Entity data = new Entity(rootStructure);
		data.setExtraMembers(mModel.getDefinition().getVariables());

		initializeVariablesFromParameters(data, null, true);

		// Get the &Mode variable ready for usage in events.
		DisplayModes.setVariable(data, mModel.getParams().Mode);

		mRootData = data;
	}

	private void initializeDataControllers() {
		mControllers = new HashMap<>();
		mRunningControllers = new ArrayList<>();

		StructureDefinition viewBC = null;
		if (DisplayModes.isEdit(mModel.getParams().Mode) && mModel.getDefinition() instanceof SectionDefinition) {
			// This component is a BC editor.
			viewBC = ((SectionDefinition) mModel.getDefinition()).getBusinessComponent();
		}

		for (DataSourceModel model : mModel.getDataSources()) {
			IDataSourceControllerInternal controller;

			if (viewBC != null && model.getDefinition() == model.getDefinition().getParent().getMainDataSource())
				controller = new DataSourceControllerBC(this, model, viewBC);
			else if (model.getDefinition().hasDataProvider())
				controller = new DataSourceController(this, model);
			else
				controller = new DataSourceControllerStub(this, model);

			mControllers.put(model, controller);
		}
	}

	public int getSessionId() {
		return mSessionId;
	}

	@Override
	public ActivityController getParent() {
		return mParent;
	}

	@Override
	public DataViewModel getModel() {
		return mModel;
	}

	@Override
	public IDataViewDefinition getDefinition() {
		return mModel.getDefinition();
	}

	@Override
	public ComponentParameters getComponentParams() {
		return mModel.getParams();
	}

	@Override
	public Iterable<IDataSourceController> getDataSources() {
		ArrayList<IDataSourceController> list = new ArrayList<>();
		list.addAll(mControllers.values());
		return list;
	}

	@Override
	public IDataSourceController getDataSource(int id) {
		for (IDataSourceController dataSource : mControllers.values())
			if (dataSource.getId() == id)
				return dataSource;

		return null;
	}

	private IDataSourceControllerInternal getDataSource(IDataSourceDefinition dataSource) {
		DataSourceModel model = mModel.getDataSource(dataSource);
		return mControllers.get(model);
	}

	@Override
	public Entity getEntity() {
		return mRootData;
	}

	@Override
	public void attachDataController(IDataSourceBoundView view) {
		IDataSourceControllerInternal controller = getControllerForView(view);
		view.setController(controller);

		if (!mRunningControllers.contains(controller)) {
			updateDataSourceParameters(controller);
			mRunningControllers.add(controller);
		}

		mParent.track(controller);

		if (mState == State.STARTED)
			controller.onResume(); // Start new data controller if asked after the data view has started.
	}

	private IDataSourceControllerInternal getControllerForView(IDataSourceBoundView view) {
		IDataSourceDefinition dataSource = view.getDataSource();
		if (dataSource != null) {
			IDataSourceControllerInternal controller = getDataSource(dataSource);
			if (controller != null) {
				controller.getModel().setRowsPerPage(view.getDataSourceRowsPerPage());
				controller.attach(view);
				return controller;
			} else
				Services.Log.warning("No data controller found for view.");
		} else {
			for (IDataSourceControllerInternal controller : mRunningControllers) {
				if (controller.getName().equalsIgnoreCase(view.getDataSourceId())) {
					controller.attach(view);
					return controller;
				}
			}
		}

		// A new stub (or some error).
		return new DataSourceControllerStub(this, view);
	}

	@Override
	public void onFragmentStart(IDataView dataView) {
		if (mParent.isRunning() && mState == State.NOT_STARTED)
			onResume();
	}

	public void onResume() {
		if (mState == State.NOT_STARTED) {
			// Run ClientStart, if present.
			if (!runClientStart())
				mState = State.STARTED;
		}

		if (mState == State.STARTED)
			resumeDataControllers();
	}

	private void resumeDataControllers() {
		for (IDataSourceControllerInternal controller : mRunningControllers)
			controller.onResume();
	}

	public void onPause() {
		for (IDataSourceControllerInternal controller : mRunningControllers)
			controller.onPause();
	}

	@SuppressWarnings("deprecation")
	public void onDestroy() {
		Context context = MyApplication.getAppContext();
		Intent msgService = new Intent(EntityService.ACTION_DESTROY_SESSION);
		msgService.setComponent(new ComponentName(context, MyApplication.getInstance().getEntityServiceClass()));
		msgService.putExtra(IntentParameters.Service.DATA_VIEW_SESSION, getSessionId());
		try
		{
			Services.Log.debug("startService AppEntityService ACTION_DESTROY_SESSION " );
			context.startService(msgService);
		}
		catch (IllegalStateException ex)
		{
			//IllegalStateException If the application is in a state where the service
			//can not be started (such as not in the foreground in a state when services are allowed).
			// In Android 8.0 or above, start service is not allowed in background.
			Services.Log.error("Failed startService ACTION_DESTROY_SESSION " + ex.getMessage());
		}
	}

	public void detachController() {
		mParent = null;
		mDataView = null;
		for (IDataSourceControllerInternal controller : mRunningControllers)
			controller.detach();
	}

	public void attachController(ActivityController parent, IDataView dataView) {
		mParent = parent;
		mDataView = dataView;
	}

	public void onRefresh(RefreshParameters params) {
		updateDataSourceParameters();

		for (IDataSourceControllerInternal controller : mRunningControllers)
			controller.onRefresh(params);
	}

	private void updateDataSourceParameters() {
		if (mRootData != null) {
			for (IDataSourceControllerInternal controller : mRunningControllers)
				updateDataSourceParameters(controller);
		}
	}

	void updateDataSourceParameters(IDataSourceControllerInternal controller) {
		if (mRootData != null && controller.getModel() != null) {
			boolean updated = false;
			GxUri dsUri = controller.getModel().getUri();

			// Update each parameter in the Data Source's URI.
			for (ObjectParameterDefinition dsParameter : dsUri.getDataSource().getParameters()) {
				// Only try to update if the attribute/variable is present in the structure,
				// otherwise we could lose the initial value. If it's not present then
				// it cannot be changed in the client anyway.
				if (mRootData.getPropertyDefinition(dsParameter.getName()) != null) {
					Object oldParameterValue = dsUri.getParameters().get(dsParameter.getName());
					Object newParameterValue = mRootData.getProperty(dsParameter.getName());
					if (newParameterValue != null && !newParameterValue.equals(oldParameterValue)) {
						dsUri.setParameter(dsParameter.getName(), newParameterValue);
						updated = true;
					}
				}
			}

			if (updated)
				controller.getModel().setUri(dsUri);
		}
	}

	public void onReceive(IDataSourceControllerInternal controller, ViewData data) {
		IDataSourceDefinition dsDefinition = controller.getDefinition();
		if (dsDefinition == null || dsDefinition == mModel.getDefinition().getMainDataSource()) {
			Entity newRootData = data.getSingleEntity();
			if (newRootData != null) {
				// Since this entity will contain the data view variables, set them in extra definition.
				newRootData.setExtraMembers(mModel.getDefinition().getVariables());
				initializeVariablesFromParameters(newRootData, controller.getModel(), false);

				// Preserve variables assigned by ClientStart (or before a refresh).
				if (mRootData != null)
					mergeOldAndNewData(mRootData, newRootData);
			}

			// This is the root data. Save it so that any subordinated data can set it as parent.
			// Optionally we *could* update any previous subordinated data with this new parent. However,
			// since subordinated DP can never be current if the parent isn't, it shouldn't be necessary.
			mRootData = newRootData;
		} else {
			// This is subordinated data.
			// Set the parent entity to the root one (so that root variables can be read or written).
			if (mRootData != null) {
				for (Entity entity : data.getEntities())
					entity.setParentInfo(EntityParentInfo.subordinatedProviderOf(mRootData));
			} else
				Services.Log.warning("DataViewController: Subordinated data arrived without previous root data?");
		}
	}

	private void mergeOldAndNewData(Entity oldData, Entity newData) {
		// ALWAYS preserve variables that cannot possibly have arrived from the server.
		HashSet<DataItem> itemsToCopy = new HashSet<>();
		itemsToCopy.addAll(mModel.getDefinition().getVariables());

		StructureDefinition structure = newData.getDefinition();
		if (structure != null) {
			// Other data items are preserved if:
			if (mServerValues == null) {
				// 1) For START, if the properties already have a value in the client (e.g. assigned in ClientStart).
				for (DataItem item : structure.getItems()) {
					Object destValue = newData.getProperty(item.getName());
					if (item.isEmptyValue(destValue))
						itemsToCopy.add(item);
				}
			} else {
				// 2) For REFRESH, if the values arriving are the same as those who arrived the last time.
				for (DataItem item : structure.getItems()) {
					String newServerValue = Strings.toString(newData.getProperty(item.getName()));
					String oldServerValue = mServerValues.get(item.getName());
					if (Strings.areEqual(newServerValue, oldServerValue))
						itemsToCopy.add(item);
				}
			}

			// Save server data for comparison with case 2.
			mServerValues = new HashMap<>();
			for (DataItem item : structure.getItems())
				mServerValues.put(item.getName(), Strings.toString(newData.getProperty(item.getName())));
		}

		newData.movePropertiesFrom(oldData, itemsToCopy);
		newData.clearCacheTags();
	}

	private void initializeVariablesFromParameters(Entity entity, DataSourceModel model, boolean isFirstInitialization) {
		if (model != null) {
			GxUri uri = model.getUri();
			for (Map.Entry<String, Object> parameter : uri.getParameters().entrySet()) {
				String parameterName = parameter.getKey();
				if (shouldInitializeVariableFromParameters(parameterName, isFirstInitialization))
					entity.setProperty(parameterName, parameter.getValue());
			}
		} else {
			// Initialize from the DV parameters if the DS does not have a model (e.g. an "only grid" screen).
			for (int i = 0; i < mModel.getDefinition().getParameters().size(); i++) {
				if (i < mModel.getParams().Parameters.size()) {
					String parameterName = mModel.getDefinition().getParameters().get(i).getName();
					String parameterValue = mModel.getParams().Parameters.get(i);

					if (shouldInitializeVariableFromParameters(parameterName, isFirstInitialization))
						entity.setProperty(parameterName, parameterValue);
				}
			}
		}
	}

	private boolean shouldInitializeVariableFromParameters(String parameterName, boolean isFirstInitialization) {
		if (DataItemHelper.find(mModel.getDefinition().getVariables(), parameterName) != null)
			return true;

		// Also initialize Data Source variables, but only if first initialization.
		// For subsequent ones, the actual value is returned from the server.
		if (isFirstInitialization && mModel.getDefinition().getMainDataSource() != null) {
			if (DataItemHelper.find(mModel.getDefinition().getMainDataSource(), parameterName, false) != null)
				return true;
		}

		return false;
	}


	public void restoreRootData(ViewData data) {
		if (data != null) {
			mRootData = data.getSingleEntity();
			updateDataSourceParameters();
			mState = State.STARTED;
		}
	}

	@Override
	@Deprecated
	/**
	 * @deprecated This is only used for the "old" prompts, and those are only used from filters. Filters should use the standard prompts.
	 */
	public boolean handleSelection(Entity entity) {
		// TODO: This code is deprecated, should be removed when FiltersActivity starts to use "standard" prompts.
		if (mParent.getModel().getInSelectionMode()) {
			// Return selected item to parent
			Intent resultIntent = new Intent();
			StructureDefinition selectionBC = null;

			if (mModel.getParams().Object instanceof IDataViewDefinition)
				selectionBC = ((IDataViewDefinition) mModel.getParams().Object).getPattern().getBusinessComponent();

			if (selectionBC != null) {
				resultIntent.putExtra("MetaBCName", selectionBC.getName());
				for (DataItem att : entity.getLevel().Items)
					resultIntent.putExtra(att.getName(), entity.optStringProperty(att.getName()));
			}

			mParent.getActivity().setResult(Activity.RESULT_OK, resultIntent);
			mParent.getActivity().finish();
			return true;
		} else
			return false;
	}

	@Override
	public void runAction(UIContext context, ActionDefinition action, Entity data) {
		mParent.runAction(context, action, data);
	}

	public void runCreatedAction(Action action, ActionDefinition actionDefinition) {
		mParent.runCreatedAction(action, actionDefinition);
	}

	@Override
	public void runBlockingStart(CompositeAction action, ActionDefinition actionDefinition) {
		if (mState != State.STARTED) {
			// Save the actions which execution is needed before Start event (resumeDataControllers)
			mBlockingActions.add(action);
			final IEventListener listener = action.getEventListener();
			action.setEventListener((event, successful) -> {
				if (listener != null)
					listener.onEndEvent(event, successful);

				// Remove the finished action and check if no one is left
				mBlockingActions.remove(event);
				if (mBlockingActions.size() == 0) {
					Services.Device.runOnUiThread(() -> {
						mState = State.STARTED;

						// Variables assigned in ClientStart may be parameters in data source's URL.
						updateDataSourceParameters();

						// ClientStart has finished, fire request to Start.
						if (mParent.isRunning())
							resumeDataControllers();
					});
				}
			});
		}
		runCreatedAction(action, actionDefinition);
	}

	private boolean runClientStart() {
		ActionDefinition clientStartDefinition = mModel.getDefinition().getClientStart();
		if (clientStartDefinition != null) {
			mState = State.STARTING;

			// Prepare and fire the ClientStart event.
			CompositeAction clientStart = ActionFactory.getAction(mDataView.getUIContext(), clientStartDefinition, new ActionParameters(mRootData));
			runBlockingStart(clientStart, clientStartDefinition);

			return true;
		} else if (mBlockingActions.size() > 0) {
			// Another event running, wait for it to finish
			mState = State.STARTING;
			return true;
		}
		return false;
	}

	enum State {NOT_STARTED, STARTING, STARTED}
}
