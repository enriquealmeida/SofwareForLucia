package com.artech.actions;

import android.app.Activity;
import android.content.Intent;

import com.artech.base.metadata.ActionDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.services.Services;
import com.artech.controls.IGxGridControl;
import com.artech.utils.Cast;

import java.util.ArrayList;

class ForEachLineAction extends Action
{
	private final ActionDefinition.MultipleSelectionInfo mInfo;
	private boolean mCatchOnActivityResult;

	ForEachLineAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);
		mInfo = definition.getMultipleSelectionInfo();

		// TODO: Enable this when "selection on demand" works.
		// Action needs a continuation if grid selection mode = "on action" and it's a "for each SELECTED line" action.
		// Otherwise Do() already has all the information needed and can proceed.
		// mSelectionOnDemand = (mInfo.useSelection() && mGrid != null && mGrid.getDefinition().getShowSelector() == GridDefinition.SELECTION_ON_ACTION);
	}

	public static boolean isAction(ActionDefinition definition)
	{
		return "foreachline".equals(definition.optStringProperty(ActionHelper.STATEMENT_NAME));
	}

	@Override
	public boolean Do()
	{
		final IGxGridControl grid = Cast.as(IGxGridControl.class, findControl(mInfo.getGrid()));
		if (grid != null)
		{
			final EntityList entities = grid.getData();
			ArrayList<Entity> list = new ArrayList<>();
			for (Entity entity : entities) {
				if (!mInfo.useSelection() || entity.isSelected()) {
					list.add(entity);
				}
			}
			final ActionParameters parameters = new ActionParameters(list);

			if (parameters.getEntity() != null) {
				CompositeAction actionBlock = ActionFactory.getInnerActionChildren(getContext(), getDefinition(), parameters);
				actionBlock.setLoopCondition(() -> {
					if (parameters.getEntities().isEmpty())
						return false; // this may be called after the loop has ended

					parameters.getEntities().remove(0); // next entity
					if (parameters.getEntity() != null) {
						entities.setCurrentItem(parameters.getEntity()); // Set "CurrentItem" so that selection can be evaluated over SDTs.
						return true;
					}
					else {
						mCatchOnActivityResult = false;

						// Either clear selection (if selection mode = "always") or end selection (if "on demand").
						Services.Device.runOnUiThread(() -> grid.setSelectionMode(false, null));
						return false;
					}
				});

				mCatchOnActivityResult = true;

				// Set "CurrentItem" so that selection can be evaluated over SDTs.
				entities.setCurrentItem(parameters.getEntity());
				ActionExecution exec = new ActionExecution(actionBlock);
				exec.executeAction();
			}

			return true;
		}
		else
		{
			Services.Log.error(String.format("Grid '%s' not found on UI context.", mInfo.getGrid()));
			return false;
		}
	}

	@Override
	public ActionResult afterActivityResult(int requestCode, int resultCode, Intent result)
	{
		return ActionResult.SUCCESS_CONTINUE;
	}

	@Override
	public boolean catchOnActivityResult()
	{
		return mCatchOnActivityResult;
	}

	@Override
	public Activity getActivity()
	{
		return super.getActivity();
	}
}
