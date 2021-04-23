package com.artech.controls.media;

import android.Manifest;
import android.app.Activity;
import android.content.Context;
import android.content.DialogInterface;
import androidx.appcompat.app.AlertDialog;

import com.artech.R;
import com.artech.activities.ActivityController;
import com.artech.android.ManifestHelper;
import com.artech.android.PermissionUtil;
import com.artech.android.WithPermission;
import com.artech.android.media.actions.MediaAction;
import com.artech.base.metadata.enums.ControlTypes;
import com.artech.base.services.Services;
import com.artech.ui.Coordinator;

public class SelectMediaDialog implements DialogInterface.OnClickListener {
	private static final int PERMISSION_REQUEST_CODE = 584;
	private final Context mContext;
	private final Coordinator mCoordinator;
	private final GxMediaEditControl mEditControl;
	private MediaAction[] mDialogActions;
	private AlertDialog mAlertDialog;

	public SelectMediaDialog(Context context, Coordinator coordinator, GxMediaEditControl
			editControl) {
		mContext = context;
		mCoordinator = coordinator;
		mEditControl = editControl;
	}

	public void show() {
		String[] menuOptions;
		String controlType = mEditControl.getControlType();
		switch (controlType) {
			case ControlTypes.PHOTO_EDITOR:
				menuOptions = new String[]{
						Services.Strings.getResource(R.string.GXM_TakePhoto),
						Services.Strings.getResource(R.string.GXM_SelectImage)
				};
				mDialogActions = new MediaAction[]{
						MediaAction.TAKE_PICTURE,
						MediaAction.PICK_IMAGE
				};
				break;
			case ControlTypes.VIDEO_VIEW:
				menuOptions = new String[]{
						Services.Strings.getResource(R.string.GXM_RecordVideo),
						Services.Strings.getResource(R.string.GXM_SelectVideo)
				};
				mDialogActions = new MediaAction[]{
						MediaAction.CAPTURE_VIDEO,
						MediaAction.PICK_VIDEO
				};
				break;
			case ControlTypes.AUDIO_VIEW:
				menuOptions = new String[]{
						Services.Strings.getResource(R.string.GXM_RecordAudio),
						Services.Strings.getResource(R.string.GXM_SelectAudio)
				};
				mDialogActions = new MediaAction[]{
						MediaAction.CAPTURE_AUDIO,
						MediaAction.PICK_AUDIO
				};
				break;
			default:
				throw new IllegalArgumentException("Invalid control type: " + controlType);
		}

		AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(mContext)
				.setTitle(R.string.GX_BtnSelect)
				.setItems(menuOptions, this);

		mAlertDialog = dialogBuilder.show();
	}

	public void dismiss() {
		if (mAlertDialog != null) {
			mAlertDialog.dismiss();
			mAlertDialog = null;
		}
	}

	@Override
	public void onClick(DialogInterface dialog, int which) {
		if (which < 0 || which >= mDialogActions.length) {
			throw new IllegalArgumentException(String.format("Invalid index '%s'.", which));
		}

		ActivityController controller = mCoordinator.getUIContext().getActivityController();
		if (controller != null) {
			controller.setActivityResultHandler(mEditControl);
		}

		Activity activity = mCoordinator.getUIContext().getActivity();

		if (ManifestHelper.hasPermissionDeclared(mContext, Manifest.permission.CAMERA)
				&& !PermissionUtil.checkSelfPermissions(mContext, new String[] {Manifest.permission.CAMERA})) {
			// Ask for CAMERA permission
			new WithPermission.Builder<Void>(activity)
					.require(Manifest.permission.CAMERA)
					.setRequestCode(PERMISSION_REQUEST_CODE)
					.attachToActivityController()
					.onSuccess(() -> mEditControl.callMediaAction(mDialogActions[which], activity))
					.build()
					.run();
		} else {
			mEditControl.callMediaAction(mDialogActions[which], activity);
		}
	}
}
