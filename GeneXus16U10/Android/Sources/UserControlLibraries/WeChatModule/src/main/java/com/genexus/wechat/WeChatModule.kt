package com.genexus.wechat

import android.content.Context
import com.artech.base.services.Services
import com.artech.externalapi.ExternalApiDefinition
import com.artech.externalapi.ExternalApiFactory
import com.artech.framework.GenexusModule

class WeChatModule : GenexusModule {
    override fun initialize(context: Context) {
        ExternalApiFactory.addApi(ExternalApiDefinition(
            WeChatApi.NAME,
            WeChatApi::class.java
        ))
        ExternalApiFactory.addApi(ExternalApiDefinition(
            WeChatPayApi.NAME,
            WeChatPayApi::class.java
        ))

        val loginProvider = WeChatLoginProvider()
        WeChatEntryActivity.loginProvider = loginProvider
        Services.Extensions.externalLoginManager.addProvider(loginProvider)
    }

    companion object {
        const val TAG = "WeChat"
    }
}
