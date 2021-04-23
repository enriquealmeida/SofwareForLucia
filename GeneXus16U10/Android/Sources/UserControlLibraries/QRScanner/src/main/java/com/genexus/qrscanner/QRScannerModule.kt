package com.genexus.qrscanner

import android.content.Context
import com.artech.externalapi.ExternalApiDefinition
import com.artech.externalapi.ExternalApiFactory
import com.artech.framework.GenexusModule
import com.artech.usercontrols.UcFactory
import com.artech.usercontrols.UserControlDefinition

class QRScannerModule : GenexusModule {

    override fun initialize(context: Context) {
        val sdScannerExternalObject = ExternalApiDefinition(
                QRScannerExternalObject.NAME,
                QRScannerExternalObject::class.java
        )
        ExternalApiFactory.addApi(sdScannerExternalObject)
        UcFactory.addControl(UserControlDefinition(QRScannerControl.NAME, QRScannerControl::class.java))
    }
}
