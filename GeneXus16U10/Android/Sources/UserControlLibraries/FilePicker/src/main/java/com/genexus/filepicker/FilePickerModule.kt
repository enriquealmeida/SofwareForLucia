package com.genexus.filepicker

import android.content.Context
import com.artech.externalapi.ExternalApiDefinition
import com.artech.externalapi.ExternalApiFactory
import com.artech.framework.GenexusModule
import com.artech.usercontrols.UcFactory
import com.artech.usercontrols.UserControlDefinition

class FilePickerModule : GenexusModule {
    override fun initialize(context: Context?) {
        ExternalApiFactory.addApi(ExternalApiDefinition(FilePickerAPI.OBJECT_NAME, FilePickerAPI::class.java))
        UcFactory.addControl(UserControlDefinition(FileControl.NAME, FileControl::class.java))
    }
}
