package com.genexus.inappbillinglib;

import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.artech.inappbillinglib.R;
import com.genexus.inappbillinglib.util.IabHelper;
import com.genexus.inappbillinglib.util.IabResult;

public class IabService {
	private static final String TAG = "IabService";
	private static IabHelper sIabHelper = null;
	
	/**
	 * Returns the singleton instance of IabHelper. Its initialization is done
	 * on first usage and returns it only after the setup has completed successfully.
	 * 
	 * @return the ready to use IabHelper singleton.
	 * @throws IllegalStateException if it fails to setup the IabHelper.
	 */
	public static IabHelper getInstance() throws IllegalStateException {
		synchronized (IabService.class) {
			if (sIabHelper == null) {
				String publicKey = MyApplication.getAppContext().getString(R.string.InAppBillingPublicKey);
				sIabHelper = new IabHelper(MyApplication.getAppContext(), publicKey);
				setupSync();
			}
			return sIabHelper;
		}
	}
	
	/**
	 * Does the IabHelper synchronously.
	 * Must be called from within a synchronized block.
	 */
	private static void setupSync() throws IllegalStateException {
		sIabHelper.startSetup(mIabSetupFinishedListener);
		if (sIabHelper != null) {
			try {
				IabService.class.wait();
			} catch (InterruptedException e) {
				sIabHelper = null;
			}
		}
		if (sIabHelper == null) {
			throw new IllegalStateException("IAB helper setup failed.");
		}
	}
	
	private static IabHelper.OnIabSetupFinishedListener mIabSetupFinishedListener = new IabHelper.OnIabSetupFinishedListener() {
		
		@Override
		public void onIabSetupFinished(IabResult result) {
			Services.Log.debug(TAG,
					result.isSuccess() ? "IabHelper init succeded." : "IabHelper init failed. Reason: " + result.getMessage()
			);
			if (result.isFailure() && result.getResponse() == IabHelper.BILLING_RESPONSE_RESULT_BILLING_UNAVAILABLE) {
				// Message is "%1$s won't work unless you enable Google Play services."
				String appName = Services.Strings.getResource(R.string.app_name);
				String message = Services.Strings.getResource(R.string.common_google_play_services_enable_text, appName);
				Services.Messages.showMessage(message);
			}
			synchronized (IabService.class) {
				if (result.isFailure()) {
					sIabHelper = null;
				}
				IabService.class.notify();
			}
		}
	};
	
    public static void dispose() {
    	synchronized (IabService.class) {
    		if (sIabHelper != null) {
    			sIabHelper.dispose();
    			sIabHelper = null;
				Services.Log.debug(TAG, "IabHelper disposed.");
    		}
		}
    }
}
