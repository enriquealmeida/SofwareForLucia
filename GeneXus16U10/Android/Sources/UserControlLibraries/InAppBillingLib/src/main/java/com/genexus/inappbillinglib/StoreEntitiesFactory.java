package com.genexus.inappbillinglib;

import java.util.List;

import com.artech.base.model.Entity;
import com.artech.base.model.EntityFactory;
import com.artech.base.model.EntityList;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.genexus.inappbillinglib.util.Purchase;

public class StoreEntitiesFactory {
	public static EntityList createStoreProductCollection(List<ProductDetail> productDetails) {
		EntityList collection = new EntityList();
		for (ProductDetail productDetail : productDetails) {
			Entity item = createStoreProduct(productDetail);
			collection.add(item);
		}
		return collection;
	}

	private static Entity createStoreProduct(ProductDetail productDetails) {
		Entity item = EntityFactory.newSdt("GeneXus.SD.Store.StoreProduct");
		item.setProperty("Identifier", productDetails.getId());
		item.setProperty("LocalizedTitle", productDetails.getTitle());
		item.setProperty("LocalizedDescription", productDetails.getDesc());
		item.setProperty("LocalizedPriceAsString", productDetails.getPrice());
		item.setProperty("Purchased", String.valueOf(productDetails.isPurchased()));
		return item;
	}

	public static Entity createSuccessfulPurchaseResult(String productId, String transactionData, String purchaseId) {
		return createPurchaseResult(true, productId, transactionData, purchaseId);
	}

	public static Entity createFailedPurchaseResult(String message) {
		Services.Log.debug(StoreManager.OBJECT_NAME, String.format("Purchase failed. Error: %s", message));
		return createPurchaseResult(false, Strings.EMPTY, Strings.EMPTY, Strings.EMPTY);
	}

	private static Entity createPurchaseResult(boolean purchaseSuccess, String productId, String transactionData, String purchaseId) {
		Entity purchaseResult = EntityFactory.newSdt("GeneXus.SD.Store.PurchaseResult");
		purchaseResult.setProperty("Success", purchaseSuccess);
		purchaseResult.setProperty("ProductIdentifier", productId);
		purchaseResult.setProperty("TransactionData", transactionData);
		purchaseResult.setProperty("PurchaseId", purchaseId);
		purchaseResult.setProperty("PurchasePlatform", 1); // 1: Google Play, 2: iTunes
		return purchaseResult;
	}

	public static Entity createEmptyPurchaseResult() {
		return createPurchaseResult(false, Strings.EMPTY, Strings.EMPTY, Strings.EMPTY);
	}

	private static EntityList createPurchaseResultCollection(List<Purchase> purchases) {
		EntityList collection = new EntityList();
		for (Purchase purchase : purchases) {
			int purchaseState = purchase.getPurchaseState(); // 0 (purchased), 1 (canceled), or 2 (refunded).
			Entity item = createPurchaseResult(purchaseState == 0, purchase.getSku(), purchase.getOriginalJson(), purchase.getToken());
			collection.add(item);
		}
		return collection;
	}

	public static Entity createPurchasesInformation(List<Purchase> result) {
		Entity purchasesInfo = EntityFactory.newSdt("GeneXus.SD.Store.PurchasesInformation");
		purchasesInfo.setProperty("Purchases", createPurchaseResultCollection(result));
		purchasesInfo.setProperty("PurchasePlatform", 1); // 1: Google Play, 2: iTunes
		return purchasesInfo;
	}
}
