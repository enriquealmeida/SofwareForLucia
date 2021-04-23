package com.genexus.controls.maps.googlev2;

import android.animation.ValueAnimator;
import android.os.Handler;
import android.view.animation.LinearInterpolator;

import com.artech.base.services.Services;
import com.artech.controls.maps.GxMapViewDefinition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.Marker;


// MarketAnimation helper
public class MarkerAnimation {

	private Marker mMarker;

	private LatLng mStartPosition;
	private LatLng mEndPosition;

	private int mDuration;
	private int mEndBehavior;

	private Handler mHandler;
	ValueAnimator mValueAnimator;

	public MarkerAnimation(Marker marker)
	{
		mMarker = marker;
	}

	// Start marker animation
	public void startAnimation(LatLng endPosition, int duration, int endBehavior) {

		mEndPosition = endPosition;
		mDuration = duration;
		mEndBehavior = endBehavior;

		mStartPosition = mMarker.getPosition();

		Services.Log.debug(" startAnimation duration " + duration + " to " + endPosition + " from " + mStartPosition );

		if (mStartPosition.equals(endPosition))
		{
			Services.Log.debug(" startAnimation same position cancel animation " );
			return;
		}

		// cancel any previous animation
		cancelAnimation();

		mHandler = new Handler();
		mHandler.post( runnableAnimation);

	}

	public void cancelAnimation()
	{
		if (mHandler!=null)
			mHandler.removeCallbacks(runnableAnimation);
		if (mEndBehavior== GxMapViewDefinition.ANIMATION_REPEAT
			&& mValueAnimator!=null)
			mValueAnimator.cancel();

	}

	final Runnable runnableAnimation = new Runnable() {
		@Override
		public void run() {

			mValueAnimator = ValueAnimator.ofFloat(0, 1);
			mValueAnimator.setDuration(mDuration);
			mValueAnimator.setInterpolator(new LinearInterpolator());

			mMarker.setVisible(true);

			mValueAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener() {
				@Override
				public void onAnimationUpdate(ValueAnimator valueAnimator) {
					float v = valueAnimator.getAnimatedFraction();
					double lng = v * mEndPosition.longitude + (1 - v)
							* mStartPosition.longitude;
					double lat = v * mEndPosition.latitude + (1 - v)
							* mStartPosition.latitude;
					LatLng newPos = new LatLng(lat, lng);
					mMarker.setPosition(newPos);
					mMarker.setAnchor(0.5f, 0.5f);
					mMarker.setRotation(getBearing(mStartPosition, newPos));
				}
			});
			mValueAnimator.start();
			if (mEndBehavior== GxMapViewDefinition.ANIMATION_REPEAT)
				mHandler.postDelayed(this, mDuration);
			if (mEndBehavior== GxMapViewDefinition.ANIMATION_DISAPPEAR)
				mHandler.postDelayed(runnableDisappear, mDuration);
		}
	};

	final Runnable runnableDisappear = new Runnable() {
		@Override
		public void run() {
			mMarker.setVisible(false);
		}
	};


	// get Bearing angle
	private float getBearing(LatLng begin, LatLng end) {
		double lat = Math.abs(begin.latitude - end.latitude);
		double lng = Math.abs(begin.longitude - end.longitude);

		if (begin.latitude < end.latitude && begin.longitude < end.longitude)
			return (float) Math.toDegrees(Math.atan(lng / lat));
		else if (begin.latitude >= end.latitude && begin.longitude < end.longitude)
			return (float) ((90 - Math.toDegrees(Math.atan(lng / lat))) + 90);
		else if (begin.latitude >= end.latitude && begin.longitude >= end.longitude)
			return (float) (Math.toDegrees(Math.atan(lng / lat)) + 180);
		else /* if (begin.latitude < end.latitude && begin.longitude >= end.longitude) */
			return (float) ((90 - Math.toDegrees(Math.atan(lng / lat))) + 270);

	}
}

