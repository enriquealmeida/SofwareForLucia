package com.artech.fragments;

import java.util.ArrayList;
import java.util.List;

import android.app.Activity;

import com.artech.actions.UIContext;
import com.artech.activities.IGxActivity;
import com.artech.base.controls.IGxEditFinishAware;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.layout.Size;
import com.artech.base.services.Services;
import com.artech.ui.ActionContext;
import com.artech.ui.Anchor;
import com.artech.ui.CoordinatorBase;
import com.artech.utils.Cast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatDialogFragment;

public abstract class BaseFragment extends AppCompatDialogFragment implements ActionContext, IInspectableComponent
{
	private final ArrayList<ActionDefinition> mPendingActions = new ArrayList<>();
	private Anchor mAnchor;
	private Size mDesiredSize;

	private boolean mAllowHeaderRow = false;

	@Override
	public void onStart()
	{
		super.onStart();
		if (getDialog() == null)
			return;

		if (mAnchor != null)
		{
			// A callout. Not modal, and (TODO) should be shown at specified position.
			getDialog().setCanceledOnTouchOutside(true);

			// WindowManager.LayoutParams p = getDialog().getWindow().getAttributes();
			// p.x =  mAnchorRect.left;
			// p.y = mAnchorRect.top + (mAbsoluteHeightForTable / 2) - mAnchorRect.height() / 2 - (screenSize.getHeight()/2); // 0 is the center of the screen
			// getDialog().getWindow().setAttributes(p);
		}
		else
		{
			// A popup is modal.
		    getDialog().setCanceledOnTouchOutside(false);
		}

		if (mDesiredSize != null)
		{
			// Set the dialog size. The frame adds padding (actually, insets); see
			// android\support\v7\appcompat\res\drawable\abc_dialog_material_background_dark.xml
			// so we need to add these pixels back to account for it; otherwise the content is cut.
			final int DIALOG_INSETS = Services.Device.dipsToPixels(16);
			int dialogWidth = mDesiredSize.getWidth() + 2 * DIALOG_INSETS;
			int dialogHeight = mDesiredSize.getHeight() + 2 * DIALOG_INSETS;

			// Normally the dialog would auto-size itself to match its content, but unfortunately
			// it does not grow beyond a certain width (hence, this code).
			getDialog().getWindow().setLayout(dialogWidth, dialogHeight);
		}
	}

	public void setDialogAnchor(Anchor anchor)
	{
		mAnchor = anchor;
	}

	public void setDesiredSize(Size size)
	{
		mDesiredSize = size;
	}

	protected Size getDesiredSize()
	{
		return mDesiredSize;
	}

	@SuppressWarnings("deprecation")
	@Override
	public void onAttach(Activity activity)
	{
		super.onAttach(activity);
		if (mPendingActions.size() != 0)
		{
			ArrayList<ActionDefinition> pendingActions = new ArrayList<>(mPendingActions);
			mPendingActions.clear();

			for (ActionDefinition action : pendingActions)
				runAction(action, null, false);
		}
	}

	public void finishEdit() {
		IGxEditFinishAware control = Cast.as(IGxEditFinishAware.class, getActivity().getCurrentFocus());
		if (control == null && getDialog() != null)
			control = Cast.as(IGxEditFinishAware.class, getDialog().getCurrentFocus());
		if (control != null)
			control.finishEdit();
	}

	@Override
	public void runAction(ActionDefinition action, Anchor anchor)
	{
		runAction(action, anchor, false);
	}

	@Override
	public void runAction(ActionDefinition action, Anchor anchor, boolean allowDuplicate)
	{
		// Enqueue action if it's fired before the fragment is attached to the activity
		// (Activity is necessary for building UIContext).
		if (getActivity() != null)
		{
			if (!CoordinatorBase.isInternalEvent(action.getName()))
				finishEdit();

			UIContext context = getUIContext();
			context.setAnchor(anchor);
			((IGxActivity)getActivity()).getController().runAction(context, action, getContextEntity(), allowDuplicate);
		}
		else
			mPendingActions.add(action);
	}

	@NonNull
	public abstract String getUri();
	public abstract UIContext getUIContext();
	public abstract void setActive(boolean active);

	public abstract void saveFragmentState(LayoutFragmentState state);
	public abstract void restoreFragmentState(LayoutFragmentState state);
	public abstract List<BaseFragment> getChildFragments();

	public boolean isAllowHeaderRow()
	{
		return mAllowHeaderRow;
	}

	public void setAllowHeaderRow(boolean mAllowHeaderRow)
	{
		this.mAllowHeaderRow = mAllowHeaderRow;
	}
}
