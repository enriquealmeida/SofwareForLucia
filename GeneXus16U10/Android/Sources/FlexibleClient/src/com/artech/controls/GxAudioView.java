package com.artech.controls;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.view.View;
import android.view.ViewGroup;

import com.artech.base.metadata.enums.ActionTypes;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.PhoneHelper;
import com.artech.resources.MediaTypes;
import com.artech.resources.StandardImages;

public class GxAudioView extends GxLinearLayout implements IGxEdit, IGxThemeable
{
	private final ViewGroup.LayoutParams mLayoutParams;
	private final GxImageViewStatic mImageView;
	private String mValue = Strings.EMPTY;

	public GxAudioView(Context context, LayoutItemDefinition definition) {
		super(context);
		mLayoutParams = new LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT, definition.getCellGravity());
		mImageView = new GxImageViewStatic(getContext(), null, null);
	}

	@Override
	public String getGxValue() {
		return mValue;
	}

	@Override
	public void setGxValue(String value) {
		mValue = value;

		removeAllViews();
		if (Strings.hasValue(value)) {
			Drawable drawable = Services.Resources.getContentDrawableFor(getContext(), ActionTypes.VIEW_AUDIO);
			mImageView.setImageDrawable(drawable);
			mImageView.setOnClickListener(new OnClickListener() {

				@Override
				public void onClick(View v) {
					PhoneHelper.launchDomainAction(getContext(), ActionTypes.VIEW_AUDIO, mValue);
				}
			});
		} else {
			Drawable drawable = Services.Resources.getContentDrawableFor(getContext(), MediaTypes.AUDIO_STUB);
			StandardImages.showPlaceholderImage(mImageView, drawable, true);
		}
		addView(mImageView, mLayoutParams);
	}

	@Override
	public IGxEdit getViewControl() {
		return this;
	}

	@Override
	public IGxEdit getEditControl() {
		return this;
	}

	@Override
	public String getGxTag() {
		return getTag().toString();
	}

	@Override
	public void setGxTag(String tag) {
		setTag(tag);
	}

	@Override
	public void setValueFromIntent(Intent data) {

	}

	@Override
	public boolean isEditable() {
		return false;
	}
}
