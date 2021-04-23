package com.genexus.coreexternalobjects;

import java.util.List;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.android.analytics.Analytics;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

public class AnalyticsAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.Common.Analytics";

	public AnalyticsAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters) {
		List<String> parameterValues = toString(parameters);

		if (method.equalsIgnoreCase("setUserId") && parameterValues.size() == 1) {
			Analytics.setUserId(parameterValues.get(0));
		} else if (method.equalsIgnoreCase("trackView") && parameterValues.size() == 1) {
			Analytics.trackView(getActivity(), parameterValues.get(0));
		} else if (method.equalsIgnoreCase("trackPurchase") && parameters.size() == 1) {
			Entity sdt = (Entity) parameters.get(0);
			Analytics.trackPurchase((String) sdt.getProperty("TransactionId"),
					(String) sdt.getProperty("Affiliation"),
					Double.parseDouble((String) sdt.getProperty("Revenue")),
					Double.parseDouble((String) sdt.getProperty("Tax")),
					Double.parseDouble((String) sdt.getProperty("Shipping")),
					(String) sdt.getProperty("CurrencyCode"));

			EntityList items = sdt.getLevel("Items");
			if (items != null) {
				for (Entity item : items) {
					Analytics.trackPurchaseItem((String) item.getProperty("TransactionId"),
							(String) item.getProperty("Id"),
							(String) item.getProperty("Name"),
							(String) item.getProperty("Category"),
							Double.parseDouble((String) item.getProperty("Price")),
							(long) Double.parseDouble((String) item.getProperty("Quantity")),
							(String) item.getProperty("CurrencyCode"));
				}
			}
		} else if (method.equalsIgnoreCase("trackEvent") && parameterValues.size() == 4) {
			Analytics.trackEvent(parameterValues.get(0),
					parameterValues.get(1),
					parameterValues.get(2),
					Long.parseLong(parameterValues.get(3)));
		} else if (method.equalsIgnoreCase("setCommerceTrackerId") && parameterValues.size() == 1) {
			Analytics.setCommerceTrackerId(parameterValues.get(0));
		} else {
			return ExternalApiResult.failureUnknownMethod(this, method);
		}
		return ExternalApiResult.SUCCESS_CONTINUE;
	}
}
