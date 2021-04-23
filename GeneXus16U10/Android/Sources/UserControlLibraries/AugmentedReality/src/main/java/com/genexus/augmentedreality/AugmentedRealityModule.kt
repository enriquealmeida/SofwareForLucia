package com.genexus.augmentedreality

import android.content.Context
import com.artech.externalapi.ExternalApiDefinition
import com.artech.externalapi.ExternalApiFactory
import com.artech.framework.GenexusModule

const val TAG = "GxAugmentedReality"

class AugmentedRealityModule : GenexusModule {

    override fun initialize(context: Context) {
        val arExternalObject = ExternalApiDefinition(
                AugmentedRealityExternalObject.NAME,
                AugmentedRealityExternalObject::class.java
        )
        ExternalApiFactory.addApi(arExternalObject)
    }
}
