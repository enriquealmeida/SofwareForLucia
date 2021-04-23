package com.artech.actions;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;

import com.artech.activities.ActivityHelper;
import com.artech.activities.IGxActivity;
import com.artech.application.MyApplication;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.fragments.IDataView;
import com.artech.fragments.LayoutFragment;
import com.artech.fragments.LayoutFragmentActivity;
import com.artech.ui.Coordinator;
import com.artech.utils.Cast;

import androidx.annotation.NonNull;

public class ExternalObjectEvent {
	private final String mFullEventName;

	public ExternalObjectEvent(String externalObject, String event) {
		mFullEventName = String.format("%s.%s", externalObject, event);
	}

	private static boolean fireApplicationEvent(final String eventName, List<Object> parameters, final IEntityEventListener entityEventListener) {
		return fireApplicationEvent(eventName, parameters, null, entityEventListener);
	}

	private static boolean fireApplicationEvent(final String eventName, List<Object> parameters, Coordinator coordinator, final IEntityEventListener entityEventListener) {
		if (!Services.Application.isLoaded())
			return false;

		Activity activity = ActivityHelper.getMainActivity();
		if (activity == null) {
			// MainActivity can be null before the app opens the main panel,
			// in this case the CurrentActivity is the one from the generated Main.cs
			activity = ActivityHelper.getCurrentActivity();
		}

		// get event from mainObject or coordinator if not null.
		final IViewDefinition mainObject = MyApplication.getApp().getMain();
		if (mainObject == null)
			return false;

		// get from main
		ActionDefinition eventHandler = mainObject.getEvent(eventName);
		StructureDefinition structureDefinition = StructureDefinition.EMPTY;
		if (eventHandler != null) {
			if (mainObject instanceof IDataViewDefinition && ((IDataViewDefinition) mainObject).getMainDataSource() != null)
				structureDefinition = ((IDataViewDefinition) mainObject).getMainDataSource().getStructure();
		}
		// get from coordinator
		if (eventHandler == null && coordinator != null) {
			if (ActivityHelper.getCurrentActivity() != null)
				activity = ActivityHelper.getCurrentActivity();
			eventHandler = coordinator.getFormEventHandler(eventName);
			IDataViewDefinition dvDef = coordinator.getFormDataViewDefinition();
			if (dvDef != null && dvDef.getDataSources() != null && dvDef.getMainDataSource() != null)
				structureDefinition = dvDef.getMainDataSource().getStructure();
		}

		if (eventHandler == null)
		{
			Services.Log.info("Cannot run event " + eventName + " : not found");
			return false; // No event to fire.
		}

		UIContext context;
		Entity data;

		LayoutFragmentActivity fragmentActivity = Cast.as(LayoutFragmentActivity.class, activity);
		// if use coordinator , try to use fragment from if
		if (coordinator!=null && coordinator.getUIContext().getDataView()!=null) {
			IDataView dataView = coordinator.getUIContext().getDataView();
			context = dataView.getUIContext();
			data = dataView.getController().getEntity(); // Use this instead of fragment.getContextEntity() because it is not the same before Start event
		}
		else if (fragmentActivity != null && fragmentActivity.getMainFragment() != null) {
			LayoutFragment fragment = fragmentActivity.getMainFragment();
			context = fragment.getUIContext();
			if (context.getActivity() == null) {
				// It may happen that we're executing just before a Fragment is initialized
				// Therefore, its host Activity will not be set yet.
				// In this case, we'll set it manually since we know the host activity.
				Connectivity connectivity = mainObject.getConnectivitySupport();
				context = new UIContext(activity, fragment, fragment.getRootView(), connectivity);
			}
			data = fragment.getController().getEntity(); // Use this instead of fragment.getContextEntity() because it is not the same before Start event
		} else {
			Connectivity connectivity = mainObject.getConnectivitySupport();
			context = getUIContext(activity, connectivity);
			data = new Entity(structureDefinition);
			data.setExtraMembers(mainObject.getVariables());
		}

		// Assign the event parameters to the event handler input variables, by position.
		for (int i = 0; i < eventHandler.getEventParameters().size() && i < parameters.size(); i++)
			data.setProperty(eventHandler.getEventParameters().get(i).getValue(), parameters.get(i));

		final ActionDefinition eventHandlerAux = eventHandler;
		final CompositeAction eventHandlerImpl = ActionFactory.getAction(context, eventHandler, new ActionParameters(data));
		if (entityEventListener != null) {
			eventHandlerImpl.setEventListener((event, successful) -> {
				List<Object> outParameters = new ArrayList<>();
				for (int i = 0; i < eventHandlerAux.getEventParameters().size(); i++)
					outParameters.add(data.getProperty(eventHandlerAux.getEventParameters().get(i).getValue()));
				entityEventListener.onEndEvent(successful, outParameters);
			});
		}

		// Fire the event.
		if (coordinator!=null && coordinator.getUIContext().getDataView()!=null) {
			coordinator.getUIContext().getDataView().getController().runBlockingStart(eventHandlerImpl, eventHandler);
		}
		else if (fragmentActivity != null && fragmentActivity.getMainFragment() != null) {
			fragmentActivity.getMainFragment().getController().runBlockingStart(eventHandlerImpl, eventHandler);
		} else {
			Services.Device.invokeOnUiThread(() -> {
				ActionExecution eventHandlerExec = new ActionExecution(eventHandlerImpl);
				eventHandlerExec.executeAction();
			});
		}

		return true;
	}

	/**
	 * Try to build a UI context based on the current activity, if any.
	 * Otherwise use the app's context. This means that External Object Events
	 * MAY NOT be able to use UI, depending on when they are fired.
	 */
	@NonNull
	private static UIContext getUIContext(Activity activity, Connectivity connectivity) {
		if (activity == null) {
			return new UIContext(MyApplication.getAppContext(), connectivity);
		}

		if (!(activity instanceof IGxActivity)) {
			return new UIContext(activity, null, activity.getWindow().getDecorView().getRootView(), connectivity);
		}

		IGxActivity gxActivity = (IGxActivity) activity;

		for (IDataView dataView : gxActivity.getActiveDataViews(false)) {
			UIContext uiContext = dataView.getUIContext();
			if (uiContext != null) {
				return uiContext;
			}
		}

		return new UIContext(activity, null, activity.getWindow().getDecorView().getRootView(), connectivity);
	}

	public boolean fire(List<Object> parameters) {
		return fire(parameters, null);
	}

	public boolean fire(List<Object> parameters, IEntityEventListener eventListener) {
		return fire(parameters, null, eventListener);
	}

	public boolean fire(List<Object> parameters, Coordinator coordinator, IEntityEventListener eventListener) {
		// This event is fired in two places:
		// 1) In the main object (even if the app is in background).
		return ExternalObjectEvent.fireApplicationEvent(mFullEventName, parameters, coordinator, eventListener);

		// 2) In the current object (if any).
	}


	public interface IEntityEventListener {
		void onEndEvent(boolean successful, List<Object> parameters);
	}

	public Coordinator getFormCoordinatorForEvent(@NonNull IGxActivity gxActivity)
	{
		for (IDataView dataView : gxActivity.getActiveDataViews(false))
		{
			if (dataView.getController() != null && dataView instanceof LayoutFragment &&
					dataView.getController().getDefinition().getEvent(mFullEventName)!=null)
			{
				return ((LayoutFragment)dataView).getFormCoordinator();
			}
		}
		return null;
	}
}
