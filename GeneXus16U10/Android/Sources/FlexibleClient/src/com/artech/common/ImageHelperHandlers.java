package com.artech.common;

import android.graphics.drawable.Drawable;
import android.view.View;

import com.artech.base.services.Services;
import com.artech.controls.common.IViewDisplayImage;

public class ImageHelperHandlers
{
	private abstract static class ForPostOnUiThread implements ImageHelper.Handler
	{
		@Override
		public void receive(final Drawable d)
		{
			Services.Device.runOnUiThread(new Runnable()
			{
				@Override
				public void run() { posted(d); }
			});
		}

		protected abstract void posted(Drawable d);
	}

	public static class ForViewBackground extends ForPostOnUiThread
	{
		private final View mView;

		public ForViewBackground(View view)
		{
			mView = view;
		}

		@SuppressWarnings("deprecation")
		@Override
		protected void posted(Drawable d)
		{
			mView.setBackgroundDrawable(d);
		}
	}

	public static class ForImageView extends ForPostOnUiThread
	{
		private final IViewDisplayImage mView;

		public ForImageView(IViewDisplayImage view)
		{
			mView = view;
		}

		@Override
		protected void posted(Drawable d)
		{
			mView.setImageDrawable(d);
		}
	}
}
