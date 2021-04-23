package com.genexus.mercadopago;

import android.Manifest;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.base.model.Entity;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

import java.util.List;

public class MercadoPagoAPI extends ExternalApi {

    static final String OBJECT_NAME = "MercadoPago.MercadoPagoCheckout";
    private static final String METHOD_NEW_CARD = "GetCardToken";
    private static final String METHOD_SAVED_CARD = "GetSavedCardToken";

    private final MercadoPagoManager mMercadoPagoManager;

    public MercadoPagoAPI(ApiAction action) {
        super(action);
        addMethodHandlerRequestingPermissions(METHOD_NEW_CARD,8,new String[]
                {Manifest.permission.ACCESS_COARSE_LOCATION},mGetCardTokenMethod);
        addMethodHandlerRequestingPermissions(METHOD_SAVED_CARD,2,new String[]
                {Manifest.permission.ACCESS_COARSE_LOCATION},mGetSavedCardToken);

        String publicKey = getContext().getResources().getString(R.string.MercadoPagoAPIPublicKey);
        String privateKey = getContext().getResources().getString(R.string.MercadoPagoAPIPrivateKey);
        CreateTokenCallback createTokenCallback = new CreateTokenCallback(getActivity(), action);
        mMercadoPagoManager = new MercadoPagoManager(getActivity(), publicKey, privateKey, createTokenCallback);
    }

    @SuppressWarnings("FieldCanBeLocal")
    private final IMethodInvoker mGetCardTokenMethod = new IMethodInvoker() {

        @NonNull @Override
        public ExternalApiResult invoke(List<Object> parameters) {
            String paymentMethod = (String) parameters.get(0);
            String cardNumber = (String) parameters.get(1);
            String securityCode = (String) parameters.get(2);
            String cardHolderName = (String) parameters.get(3);
            String identificationNumber = (String) parameters.get(4);
            String identificationType = (String) parameters.get(5);
            int expiryMonth = Integer.parseInt((String) parameters.get(6));
            int expiryYear = Integer.parseInt((String) parameters.get(7));

            // Returns an entity in case of failure. Otherwise, an async call is launched and we'll wait
            Entity result = mMercadoPagoManager.getFirstCardToken(paymentMethod, identificationType, cardNumber,
                    securityCode, cardHolderName, identificationNumber, expiryMonth, expiryYear);

            return result == null ? ExternalApiResult.SUCCESS_WAIT : ExternalApiResult.success(result);
        }
    };

    @SuppressWarnings("FieldCanBeLocal")
    private final IMethodInvoker mGetSavedCardToken = new IMethodInvoker() {

        @NonNull @Override
        public ExternalApiResult invoke(List<Object> parameters) {
            String cardId =  (String) parameters.get(0);
            String securityCode = (String) parameters.get(1);

            // Returns an entity in case of failure. Otherwise, an async call is launched and we'll wait
            Entity result = mMercadoPagoManager.getSavedCardToken(cardId, securityCode);

            return result == null ? ExternalApiResult.SUCCESS_WAIT : ExternalApiResult.success(result);
        }
    };
}
