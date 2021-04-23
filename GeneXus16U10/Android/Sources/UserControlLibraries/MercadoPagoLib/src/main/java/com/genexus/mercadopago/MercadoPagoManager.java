package com.genexus.mercadopago;

import android.content.Context;

import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.mercadopago.android.px.model.CardToken;
import com.mercadopago.android.px.model.IdentificationType;
import com.mercadopago.android.px.model.PaymentMethod;
import com.mercadopago.android.px.model.SavedCardToken;
import com.mercadopago.android.px.model.exceptions.ApiException;
import com.mercadopago.android.px.model.exceptions.CardTokenException;
import com.mercadopago.android.px.services.Callback;
import com.mercadopago.android.px.services.MercadoPagoServices;

import java.util.List;

class MercadoPagoManager {

    private static final String EMPTY_PAYMENT_METHOD_ID = "0";
    private static final int ERROR_CODE_CARD_NUMBER = 1;
    private static final int ERROR_CODE_SECURITY_CODE = 2;
    private static final int ERROR_CODE_EXPIRATION_DATE = 3;
    private static final int ERROR_CODE_CARDHOLDER_NAME = 4;
    private static final int ERROR_CODE_IDENTIFICATION_NUMBER = 5;
    private static final int ERROR_CODE_IDENTIFICATION_TYPE = 6;
    private static final int ERROR_CODE_PAYMENT_METHOD = 7;
    static final int ERROR_CODE_PROCESS_ERROR = 8;
    static final int ERROR_CODE_OK = 0;

    private final MercadoPagoServices mMercadoPagoServices;
    private final CreateTokenCallback mCreateTokenCallback;

    MercadoPagoManager(Context context, String publicKey, String privateKey, CreateTokenCallback callback) {
        mMercadoPagoServices = new MercadoPagoServices(context, publicKey, privateKey);
        mCreateTokenCallback = callback;
    }

    Entity getFirstCardToken(String paymentMethodParameter, String identificationTypeParameter,
                             String cardNumber, String securityCode, String cardHolderName,
                             String identificationNumber, int expiryMonth, int expiryYear) {

        PaymentMethod paymentMethod = getPaymentMethod(paymentMethodParameter);
        if (paymentMethod == null || paymentMethod.getId().equals(EMPTY_PAYMENT_METHOD_ID)) {
            return MercadoPagoEntitiesFactory.buildFailedCardResultSDT(ERROR_CODE_PAYMENT_METHOD);
        }

        IdentificationType identificationType = getIdentificationType(identificationTypeParameter);
        if (identificationType == null || identificationType.getId() == null) {
            return MercadoPagoEntitiesFactory.buildFailedCardResultSDT(ERROR_CODE_IDENTIFICATION_TYPE);
        }

        CardToken cardToken = MercadoPagoEntitiesFactory.buildCardToken(cardNumber, securityCode,
                cardHolderName, identificationNumber, identificationType.getId(), expiryMonth, expiryYear);
        if (cardToken == null) {
            return MercadoPagoEntitiesFactory.buildFailedCardResultSDT(ERROR_CODE_PROCESS_ERROR);
        }

        int formErrorCode = validateForm(cardToken, identificationType, paymentMethod);
        if (formErrorCode != ERROR_CODE_OK) {
            return MercadoPagoEntitiesFactory.buildFailedCardResultSDT(formErrorCode);
        }

        mMercadoPagoServices.createToken(cardToken, mCreateTokenCallback);
        return null;
    }

    Entity getSavedCardToken(String cardId, String securityCode) {
        SavedCardToken savedCardToken = new SavedCardToken(cardId, securityCode);

        if (!savedCardToken.validateSecurityCode()) {
            Services.Log.error("Security code verification failed");
            return MercadoPagoEntitiesFactory.buildFailedCardResultSDT(ERROR_CODE_SECURITY_CODE);
        }

        mMercadoPagoServices.createToken(savedCardToken, mCreateTokenCallback);
        return null;
    }

    private IdentificationType getIdentificationType(String identificationType) {
        SyncedResult<IdentificationType> syncedIdentificationType = new SyncedResult<>();
        mMercadoPagoServices.getIdentificationTypes(new Callback<List<IdentificationType>>() {
            @Override
            public void success(List<IdentificationType> identificationTypes) {
                boolean found = false;
                for (IdentificationType i : identificationTypes) {
                    if (i.getId().toLowerCase().equals(identificationType.toLowerCase())) {
                        Services.Log.debug("Identification type found: " + i.getId());
                        found = true;
                        syncedIdentificationType.setResult(i);
                        break;
                    }
                }
                if (!found) {
                    Services.Log.warning(String.format("'%s' identification type not found", identificationType));
                    syncedIdentificationType.setResult(new IdentificationType());
                }
            }

            @Override
            public void failure(ApiException error) {
                Services.Log.error("Failed to retrieve identification types: " + error.toString());
                syncedIdentificationType.setResult(new IdentificationType());
            }
        });
        return syncedIdentificationType.getResult();
    }

    private PaymentMethod getPaymentMethod(String paymentMethod) {
        SyncedResult<PaymentMethod> syncedPaymentMethod = new SyncedResult<>();
        mMercadoPagoServices.getPaymentMethods(new Callback<List<PaymentMethod>>() {
            @Override
            public void success(List<PaymentMethod> paymentMethods) {
                boolean found = false;
                for (PaymentMethod p : paymentMethods) {
                    if (p.getId().toLowerCase().equals(paymentMethod.toLowerCase())) {
                        Services.Log.debug("Payment method found: " + p.getId());
                        found = true;
                        syncedPaymentMethod.setResult(p);
                        break;
                    }
                }
                if (!found) {
                    Services.Log.warning(String.format("'%s' payment method not found", paymentMethod));
                    syncedPaymentMethod.setResult(new PaymentMethod(EMPTY_PAYMENT_METHOD_ID));
                }
            }

            @Override
            public void failure(ApiException error) {
                Services.Log.error("Failed to retrieve payment methods: " + error.toString());
                syncedPaymentMethod.setResult(new PaymentMethod(EMPTY_PAYMENT_METHOD_ID));
            }
        });
        return syncedPaymentMethod.getResult();
    }

    private int validateForm(CardToken cardToken, IdentificationType identificationType, PaymentMethod paymentMethod) {
        try {
            cardToken.validateCardNumber(paymentMethod);
        } catch (CardTokenException ex) {
            Services.Log.error("Card number verification failed", ex);
            return ERROR_CODE_CARD_NUMBER;
        }

        try {
            cardToken.validateSecurityCode(paymentMethod);
        } catch (CardTokenException ex) {
            Services.Log.error("Security code verification failed", ex);
            return ERROR_CODE_SECURITY_CODE;
        }

        if (!cardToken.validateExpiryDate()) {
            Services.Log.error("Expiration date verification failed");
            return ERROR_CODE_EXPIRATION_DATE;
        }

        if (!cardToken.validateCardholderName()) {
            Services.Log.error("Cardholder name verification failed");
            return ERROR_CODE_CARDHOLDER_NAME;
        }

        if (identificationType == null || !cardToken.validateIdentificationNumber()) {
            Services.Log.error("Customer identification verification failed");
            return ERROR_CODE_IDENTIFICATION_NUMBER;
        }
        return ERROR_CODE_OK;
    }
}
