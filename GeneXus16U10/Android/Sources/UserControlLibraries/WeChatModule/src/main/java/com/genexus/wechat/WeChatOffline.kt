package com.genexus.wechat

import com.artech.application.MyApplication

class WeChatOffline {
    companion object {
        @JvmStatic
        fun isAvailable(): Boolean {
            return WeChatObject.Api(MyApplication.getAppContext()) != null
        }
    }
}
