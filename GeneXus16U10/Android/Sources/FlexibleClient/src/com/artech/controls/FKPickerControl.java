package com.artech.controls;

import android.content.Context;
import androidx.appcompat.widget.AppCompatImageView;

import com.artech.resources.StandardImages;

public class FKPickerControl extends AppCompatImageView
{
	public FKPickerControl(Context context)
	{
		super(context);
		StandardImages.setPromptImage(this);
	}
}
