package com.genexus.coreusercontrols.image;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.graphics.Matrix;
import android.graphics.drawable.Drawable;
import androidx.annotation.NonNull;
import android.view.MotionEvent;
import android.view.View;

import com.artech.base.controls.IGxEditThemeable;
import com.artech.base.metadata.enums.Alignment;
import com.artech.base.metadata.enums.ImageScaleType;
import com.artech.base.metadata.layout.GridDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.metadata.layout.TableDefinition;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.services.Services;
import com.artech.controls.GxTouchEvents;
import com.artech.controls.IGxEdit;
import com.artech.controls.ImageViewDisplayImageWrapper;
import com.artech.ui.Anchor;
import com.artech.ui.Coordinator;
import com.artech.utils.BitmapUtils;

@SuppressLint("ViewConstructor")
public class GxAdvancedImage extends ImageViewTouch implements IGxEdit, IGxEditThemeable
{
	public static final String NAME = "SD Advanced Image";
    private String mTag;
	private String mUri;
	private final GxAdvancedImageDefinition mDefinition;
	private ImageScaleType mScaleType = null;
	private Context mContext = null;

	public GxAdvancedImage(Context context, final Coordinator coordinator, LayoutItemDefinition def)
	{
		super(context, null);
		mContext = context;
		mDefinition = new GxAdvancedImageDefinition(def);
		setImageScaleType(ImageScaleType.FIT);

		float maxZoom = mDefinition.getImageMaxZoom();
		if (maxZoom > 0)
			setMaxZoom(maxZoom);

		setLongClickable(mDefinition.getEnableCopy());

		setTapListener(new GxAdvancedImageOnImageViewTouchTapListener(coordinator));

	}

	@Override
	public String getGxValue() {
		return mUri;
	}

	@Override
	public void setGxValue(String value) {
		mUri = value;
		ImageViewDisplayImageWrapper imageViewWrapper = ImageViewDisplayImageWrapper.to(this);
		Services.Images.showImage(mContext, imageViewWrapper, mUri, false, true);
	}

	@Override
	public String getGxTag() {
		return mTag;
	}

	@Override
	public void setGxTag(String data) {
		mTag = data;
		this.setTag(data);
	}

	@Override
	public void setValueFromIntent(Intent data) { }

	@Override
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public boolean isEditable() {
		return false; // Never editable.
	}

	@Override
	public void applyEditClass(@NonNull ThemeClassDefinition themeClass)
	{
		setImageScaleType(themeClass.getImageScaleType());
	}

	private void setImageScaleType(@NonNull ImageScaleType scaleType)
	{
		if (mScaleType != scaleType)
		{
			mScaleType = scaleType;
			if (mScaleType == ImageScaleType.NO_SCALE || mScaleType == ImageScaleType.TILE)
			{
				setFitToScreen(false);
			}
			else
			{
				setFitToScreen(true);
				requestLayout(); // Necessary because we might be changing between "different fits".
			}
		}
	}

	@Override
	protected void getProperBaseMatrixForFitToScreen(Drawable bitmap, Matrix matrix)
	{
		if (mScaleType == null || mScaleType == ImageScaleType.NO_SCALE || mScaleType == ImageScaleType.TILE)
			throw new IllegalStateException("Incorrect mScaleType value: " + mScaleType);

		// Substitute base implementation of this method to use different fit criteria.
		computeScalingMatrix(bitmap, mScaleType, matrix);
	}

	private void computeScalingMatrix(Drawable bitmap, ImageScaleType scaleType, Matrix matrix)
	{
		float viewWidth = getWidth();
		float viewHeight = getHeight();
		float w = bitmap.getIntrinsicWidth();
		float h = bitmap.getIntrinsicHeight();

		matrix.reset();
		BitmapUtils.computeScalingMatrix(w, h, viewWidth, viewHeight, scaleType, Alignment.CENTER, matrix);
	}

	private class GxAdvancedImageOnImageViewTouchTapListener implements ImageViewTouch.OnImageViewTouchTapListener
	{
		Coordinator mCoordinator;

		public GxAdvancedImageOnImageViewTouchTapListener(Coordinator coordinator) {
			mCoordinator = coordinator;
		}

		@Override
		public void onDoubleTap(){}

		@Override
		public void onTap(MotionEvent event)
		{
			if (mCoordinator != null)
			{
				// run this control tap event
				boolean handled = mCoordinator.runControlEvent(GxAdvancedImage.this, GxTouchEvents.TAP);
				// temporary fix , send this event to parents table and grid.
				if (!handled)
				{
					// try with table parent
					final TableDefinition parentTableDef = mDefinition.getItem().findParentOfType(TableDefinition.class);
					if (parentTableDef != null )
					{
						View parentTable = mCoordinator.getControl(parentTableDef.getName());
						if (parentTable!=null)
						{
							handled = mCoordinator.runControlEvent(parentTable, GxTouchEvents.TAP);
						}
					}
				}
				if (!handled)
				{
					// try with grid parent
					final GridDefinition parentGridDef = mDefinition.getItem().findParentOfType(GridDefinition.class);
					if (parentGridDef != null)
					{
						// tab action grid
						View parentGrid = mCoordinator.getControl(parentGridDef.getName());
						if (parentGrid!=null)
						{
							handled = mCoordinator.runControlEvent(parentGrid, GxTouchEvents.TAP);
						}
						// otherwise use default action
						if (!handled && parentGridDef.getDefaultAction() != null)
						{
							mCoordinator.runAction(parentGridDef.getDefaultAction(), new Anchor(GxAdvancedImage.this));
						}
					}
				}
			}
		}
	}

}
