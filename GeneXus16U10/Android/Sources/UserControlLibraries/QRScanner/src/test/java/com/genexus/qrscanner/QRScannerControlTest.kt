package com.genexus.qrscanner

import android.app.Activity
import android.content.Context
import android.content.Intent
import androidx.test.core.app.ApplicationProvider
import com.artech.base.metadata.layout.LayoutItemDefinition
import com.artech.ui.Coordinator
import com.genexus.testing.MyTestApplication
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.mockito.ArgumentMatchers.anyBoolean
import org.mockito.ArgumentMatchers.eq
import org.mockito.Mockito.mock
import org.mockito.Mockito.never
import org.mockito.Mockito.times
import org.mockito.Mockito.verify
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = MyTestApplication::class)
class QRScannerControlTest {
    private lateinit var mCoordinator: Coordinator
    private lateinit var mControl: QRScannerControl

    @Before
    fun setupControl() {
        val context = ApplicationProvider.getApplicationContext<Context>()
        mCoordinator = mock<Coordinator>(Coordinator::class.java)
        val definition = mock<LayoutItemDefinition>(LayoutItemDefinition::class.java)
        mControl = QRScannerControl(context, mCoordinator, definition)
    }

    @Test
    fun verifyThatControlValueChangedEventIsNotTriggeredWhenSettingControlValueProgrammatically() {
        mControl.gxValue = "QRCodeText"
        verify<Coordinator>(mCoordinator, never()).onValueChanged(eq<QRScannerControl>(mControl), anyBoolean())
    }

    @Test
    fun verifyThatControlValueChangedEventIsTriggeredWhenUserChangesControlValue() {
        val resultIntent = Intent()
        resultIntent.putExtra(ZXingScannerActivity.EXTRA_RESULT, "QRCodeText")
        mControl.handleOnActivityResult(QRScannerControl.REQUEST_CODE, Activity.RESULT_OK, resultIntent)

        verify<Coordinator>(mCoordinator, times(1)).onValueChanged(eq<QRScannerControl>(mControl), eq(true))
    }

    @Test
    fun verifyThatControlValueChangedEventIsNotTriggeredWhenControlValueHasNotChanged() {
        mControl.gxValue = "QRCodeText"

        val resultIntent = Intent()
        resultIntent.putExtra(ZXingScannerActivity.EXTRA_RESULT, "QRCodeText")
        mControl.handleOnActivityResult(QRScannerControl.REQUEST_CODE, Activity.RESULT_OK, resultIntent)

        verify<Coordinator>(mCoordinator, never()).onValueChanged(eq<QRScannerControl>(mControl), anyBoolean())
    }
}
