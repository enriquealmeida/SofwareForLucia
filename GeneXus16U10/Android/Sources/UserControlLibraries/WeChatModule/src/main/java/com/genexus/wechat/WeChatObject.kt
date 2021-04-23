package com.genexus.wechat

import android.content.Context
import com.artech.application.MyApplication
import com.artech.base.services.Services
import com.tencent.mm.opensdk.openapi.IWXAPI
import com.tencent.mm.opensdk.openapi.WXAPIFactory

object WeChatObject {
    var api: IWXAPI? = null

    val appId: String
        get() = MyApplication.getApp().mainProperties.optStringProperty("WeChat_AppId")

    fun Api(context: Context): IWXAPI? {
        if (api == null)
            api = WXAPIFactory.createWXAPI(context, appId, true)
        api?.let {
            if (!it.isWXAppInstalled) {
                Services.Log.error(WeChatModule.TAG, "Wechat has not been installed on your mobile phone. Please login after installation.")
            } else if (!it.registerApp(appId)) {
                Services.Log.error(WeChatModule.TAG, "Register Failed")
            } else {
                Services.Log.info(WeChatModule.TAG, "Register OK")
                return it
            }
        }
        return null
    }
}
