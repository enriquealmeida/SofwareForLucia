package com.genexus.controls.relativetimer

import android.content.Context
import com.artech.framework.GenexusModule
import com.artech.usercontrols.UcFactory
import com.artech.usercontrols.UserControlDefinition
import net.time4j.android.ApplicationStarter

class RelativeTimerModule : GenexusModule {
    override fun initialize(context: Context?) {
        val basicUserControl = UserControlDefinition(
                RelativeTimerControl.NAME,
                RelativeTimerControl::class.java
        )
        UcFactory.addControl(basicUserControl)
        ApplicationStarter.initialize(context, true)
    }
}
