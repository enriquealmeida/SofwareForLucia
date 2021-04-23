package com.genexus.wechat

import com.artech.actions.ApiAction
import com.artech.externalapi.ExternalApi
import com.artech.externalapi.ExternalApiResult

class WeChatApi(action: ApiAction?) : ExternalApi(action) {
    private val isAvailableProperty = IMethodInvoker {
        ExternalApiResult.success(WeChatObject.Api(context) != null)
    }

    init {
        addReadonlyPropertyHandler(PROPERTY_IS_AVAILABLE, isAvailableProperty)
    }

    companion object {
        const val NAME = "GeneXus.Social.WeChat"
        private const val PROPERTY_IS_AVAILABLE = "IsAvailable"
    }
}
