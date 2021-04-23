package com.genexus.android.ads.admob;

import java.util.List;

import android.content.Context;
import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.RelativeLayout;

import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.controls.IGxControlRuntime;

import com.artech.base.utils.Strings;
import com.artech.controls.ads.IAdsProvider;
import com.artech.controls.ads.IAdsViewController;
import com.google.android.gms.ads.AdRequest;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.AdView;
import com.google.android.gms.ads.NativeExpressAdView;
import com.artech.base.services.Services;

/**
 * AdMob Ads Provider.
 */
class AdMobAdProvider implements IAdsProvider
{
	@NonNull
	@Override
	public String getId()
	{
		return "AdMob";
	}

	@NonNull
	@Override
	public IAdsViewController createViewController(Context context, LayoutItemDefinition layoutItemDefinition)
	{
		return new AdsViewController(context, layoutItemDefinition);
	}

	private static class AdsViewController implements IAdsViewController, IGxControlRuntime
	{
		private final Context mContext;
		private final LayoutItemDefinition mDefinition;
		private String mUnitId = "";
		private boolean mIsNative = false;
		private RelativeLayout mRelativeLayout;
		private int mWidth;
		private int mHeight;
		private boolean adRequested;
		private AdRequest adRequest;

		private AdsViewController(Context context, LayoutItemDefinition def)
		{
			mContext = context;
			mDefinition = def;
			mUnitId = mDefinition.getControlInfo().optStringProperty("@SDAdsViewAdUnitId");
			//mIsNative = mDefinition.getControlInfo().optBooleanProperty("@SDAdsViewNativeAds");
			mDefinition.setUnusableForReuse();
		}

		@Nullable
		@Override
		public View createView()
		{
			mRelativeLayout = new RelativeLayout(mContext);
			return mRelativeLayout;
		}

		@Override
		public void setPropertyValue(String name, Value value) {
			if (name.toLowerCase(java.util.Locale.US).endsWith("adunitid")) {
				mUnitId = value.coerceToString().trim();
			}
			if (name.toLowerCase().endsWith("nativeads"))
				mIsNative = value.coerceToBoolean();
		}

		private void requestAdView(boolean forceRequest) {
			if (Strings.hasValue(mUnitId) &&  mWidth > 0 && mHeight > 0
				&& (!adRequested || forceRequest) )
			{
				// Initiate a request to load it with an ad
				AdRequest.Builder adRequestBuilder = new AdRequest.Builder();
				adRequestBuilder.addTestDevice(AdRequest.DEVICE_ID_EMULATOR);

				AdRequest adRequest = adRequestBuilder.build();
				if (forceRequest)
					mRelativeLayout.removeAllViews();
				// Create the view.
				if (mIsNative)
				{
					NativeExpressAdView adView = new NativeExpressAdView(mContext);
					adView.setAdSize(new AdSize(mWidth, mHeight));
					adView.setAdUnitId(mUnitId);
					adView.loadAd(new AdRequest.Builder().build());
					mRelativeLayout.addView(adView, new RelativeLayout.LayoutParams(FrameLayout.LayoutParams.MATCH_PARENT, RelativeLayout.LayoutParams.MATCH_PARENT));
				}
				else {
					AdView adView = new AdView(mContext);
					adView.setAdSize(AdSize.SMART_BANNER);
					adView.setAdUnitId(mUnitId);
					adView.loadAd(adRequest);
					mRelativeLayout.addView(adView, new RelativeLayout.LayoutParams(RelativeLayout.LayoutParams.MATCH_PARENT, RelativeLayout.LayoutParams.MATCH_PARENT));
				}
				adRequested = true;
			}

		}
		@Override
		public Value callMethod(String name, List<Value> parameters) {
			//LoadAd
			if (Strings.hasValue(mUnitId)) {
				// Initiate a request to load it with an ad
				requestAdView(true);
			}
			else
			{
				Services.Log.warning("AdMob", "adUnitId is empty!");
			}
			return null;
		}

		@Override
		public void setViewSize(int width, int height) {
				mWidth = width;
				mHeight = height;
				requestAdView( false);
		}
	}
}
