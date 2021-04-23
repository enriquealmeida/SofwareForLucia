package com.genexus.inappbillinglib;

import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Intent;
import android.os.Bundle;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.application.MyApplication;
import com.artech.base.metadata.enums.RequestCodes;
import com.artech.base.model.Entity;
import com.artech.base.model.ValueCollection;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;
import com.genexus.inappbillinglib.util.IabException;
import com.genexus.inappbillinglib.util.IabHelper.OnIabPurchaseFinishedListener;
import com.genexus.inappbillinglib.util.IabResult;
import com.genexus.inappbillinglib.util.Inventory;
import com.genexus.inappbillinglib.util.Purchase;
import com.genexus.inappbillinglib.util.SkuDetails;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GoogleApiAvailability;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;

public class StoreManager extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.Store.StoreManager";

	private static final String READ_PROPERTY_CAN_MAKE_PURCHASES = "CanMakePurchases";
	private static final String METHOD_GET_PRODUCTS = "GetProducts";
	private static final String METHOD_PURCHASE_PRODUCT = "purchaseProduct";
	private static final String METHOD_CONSUME_PRODUCT = "ConsumeProduct";
	private static final String METHOD_GET_PURCHASES = "GetPurchases";
	@SuppressWarnings("unused")
	private static final String METHOD_IS_PRODUCT_ENABLED = "IsEnabled";
	@SuppressWarnings("unused")
	private static final String METHOD_ENABLE_PRODUCT = "EnableProduct";
	@SuppressWarnings("unused")
	private static final String METHOD_DISABLE_PRODUCT = "DisableProduct";

	private AtomicBoolean mOperationInProgress;
	private AtomicBoolean mDisposeRequested;
	private Entity mPurchaseResult;

	public StoreManager(ApiAction action) {
		super(action);
		mOperationInProgress = new AtomicBoolean(false);
		mDisposeRequested = new AtomicBoolean(false);
		registerActivityLifeCycleListener();
		addSimpleMethodHandler(READ_PROPERTY_CAN_MAKE_PURCHASES, 0, mPropertyCanMakePurchases);
		addSimpleMethodHandler(METHOD_GET_PRODUCTS, 1, mMethodGetProducts);
		addMethodHandler(METHOD_PURCHASE_PRODUCT, 2, mMethodPurchaseProduct);
		addMethodHandler(METHOD_PURCHASE_PRODUCT, 1, mMethodPurchaseProduct);
		addSimpleMethodHandler(METHOD_GET_PURCHASES, 0, mMethodGetPurchases);
		addSimpleMethodHandler(METHOD_CONSUME_PRODUCT, 1, mMethodConsumeProduct);
	}

	private final ISimpleMethodInvoker mPropertyCanMakePurchases = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			int result = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(getContext());
			return result == ConnectionResult.SUCCESS;
		}
	};

	private final ISimpleMethodInvoker mMethodGetProducts = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			ValueCollection skus = (ValueCollection) parameters.get(0);

			List<ProductDetail> productDetails;
			try {
				onOperationStarted();
				Inventory inventory = IabService.getInstance().queryInventory(true, skus, skus);
				productDetails = new ArrayList<>();
				for (String sku : skus) {
					SkuDetails details = inventory.getSkuDetails(sku);
					if (details == null) {
						continue;
					}
					ProductDetail productDetail = new ProductDetail(
							sku,
							details.getTitle(),
							details.getDescription(),
							details.getPrice(),
							inventory.hasPurchase(sku)
					);
					productDetails.add(productDetail);
				}
			} catch (IabException | IllegalStateException e) {
				productDetails = Collections.emptyList();
			} finally {
				onOperationEnded();
			}
			return StoreEntitiesFactory.createStoreProductCollection(productDetails);
		}
	};

	private final IMethodInvoker mMethodPurchaseProduct = new IMethodInvoker() {
		@NonNull
		@Override
		public
		ExternalApiResult invoke(List<Object> parameters) {
			String sku = (String) parameters.get(0);

			if (parameters.size() > 1) {
				int productQty = Integer.parseInt(((String) parameters.get(1)));

				// Google's In-app Billing API only supports buying one product at a time.
				if (productQty != 1) {
					mPurchaseResult = StoreEntitiesFactory.createEmptyPurchaseResult();
					return ExternalApiResult.success(mPurchaseResult);
				}
			}

			/*
			   In case we have the sku registered as purchased in our inventory, the onPurchaseFinishedListener
			   is called directly by launchPurchaseFlow. So after it finishes we already have our PurchaseResult
			   ready and want to return the result immediately.

			   Otherwise, onPurchaseFinishedListener is called by handleActivityResult which should be called on
			   ActivityResult, so we want to defer returning our PurchaseResult to afterActivityResult.
			 */
			onOperationStarted();
			mPurchaseResult = null;
			try {
				List<String> skus = Collections.singletonList(sku);
				Inventory inventory = IabService.getInstance().queryInventory(true, skus, skus);
				SkuDetails skuDetails = inventory.getSkuDetails(sku);
				IabService.getInstance().launchPurchaseFlow(
						getActivity(),
						skuDetails.getSku(),
						skuDetails.getType(),
						RequestCodes.ACTION_ALWAYS_SUCCESSFUL,
						mPurchaseFinishedListener,
						Strings.EMPTY);
				return ExternalApiResult.SUCCESS_WAIT;
			} catch (IabException | IllegalStateException e) {
				mPurchaseResult = StoreEntitiesFactory.createEmptyPurchaseResult();
				onOperationEnded();
				Services.Log.debug(OBJECT_NAME, String.format("PurchaseProduct failed. Reason: %s", e.getMessage()));
				return ExternalApiResult.success(mPurchaseResult);
			}
		}
	};

	private ISimpleMethodInvoker mMethodGetPurchases = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			onOperationStarted();
			List<Purchase> purchases;
			try {
				Inventory inventory = IabService.getInstance().queryInventory(true, null, null);
				purchases = inventory.getAllPurchases();
			} catch (IabException | IllegalStateException e) {
				purchases = Collections.emptyList();
				Services.Log.debug(OBJECT_NAME, String.format("GetPurchases failed. Reason: %s", e.getMessage()));
			} finally {
				onOperationEnded();
			}
			return StoreEntitiesFactory.createPurchasesInformation(purchases);
		}
	};

	private ISimpleMethodInvoker mMethodConsumeProduct = new ISimpleMethodInvoker() {
		@Override
		public Object invoke(List<Object> parameters) {
			String sku = (String) parameters.get(0);

			onOperationStarted();
			boolean success = true;
			try {
				Inventory inventory = IabService.getInstance().queryInventory(true, null);
				Purchase purchase = inventory.getPurchase(sku);
				if (purchase != null) {
					IabService.getInstance().consume(purchase);
				} else {
					Services.Log.debug(OBJECT_NAME, String.format("No purchase for product '%s' found.", sku));
					success = false;
				}
			} catch (IabException | IllegalStateException e) {
				Services.Log.debug(OBJECT_NAME, String.format("Consume failed. Reason: %s", e.getMessage()));
				success = false;
			} finally {
				onOperationEnded();
			}
			return success;
		}
	};

	@Override
	public ExternalApiResult afterActivityResult(int requestCode, int resultCode, Intent data, String method, List<Object> methodParameters) {
		boolean handled;
		try {
			handled = IabService.getInstance().handleActivityResult(requestCode, resultCode, data);
		} catch (IllegalStateException e) {
			handled = false;
		}

		if (handled) {
			Services.Log.debug(OBJECT_NAME, "onActivityResult handled by IABHelper.");
		} else {
			super.afterActivityResult(requestCode, resultCode, data, method, methodParameters);
		}

		return ExternalApiResult.successNoRefresh(mPurchaseResult);
	}

	// This listener might be called from handleActivityResult, i.e. it might use the UI thread, so it should NOT take long.
	private OnIabPurchaseFinishedListener mPurchaseFinishedListener = new OnIabPurchaseFinishedListener() {
		@Override
		public void onIabPurchaseFinished(IabResult result, Purchase purchase) {
			mPurchaseResult = result.isSuccess() ?
					StoreEntitiesFactory.createSuccessfulPurchaseResult(purchase.getSku(), purchase.getOriginalJson(), purchase.getToken())
					: StoreEntitiesFactory.createFailedPurchaseResult(result.getMessage());
			onOperationEnded();
		}
	};

	private void onOperationStarted() {
		mOperationInProgress.compareAndSet(false, true);
	}

	private void onOperationEnded() {
		mOperationInProgress.compareAndSet(true, false);
		if (mDisposeRequested.get()) {
			IabService.dispose();
			mDisposeRequested.compareAndSet(true, false);
		}
	}

	private ActivityLifecycleCallbacks mActivityLifecycleListener = new ActivityLifecycleCallbacks() {
		@Override
		public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
		}

		@Override
		public void onActivityStarted(Activity activity) {
		}

		@Override
		public void onActivityStopped(Activity activity) {
		}

		@Override
		public void onActivityResumed(Activity activity) {
		}

		@Override
		public void onActivityPaused(Activity activity) {
		}

		@Override
		public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
		}

		@Override
		public void onActivityDestroyed(Activity activity) {
			if (activity == getActivity()) {
				if (mOperationInProgress.get()) {
					mDisposeRequested.compareAndSet(false, true);
				} else {
					IabService.dispose();
				}
			}
		}
	};

	@SuppressWarnings("deprecation")
	private void registerActivityLifeCycleListener() {
		MyApplication.getInstance().registerActivityLifecycleCallbacks(mActivityLifecycleListener);
	}
}
