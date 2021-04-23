package com.genexus.qrscanner

import android.Manifest
import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.text.TextUtils
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.LinearLayout
import android.widget.TextView
import androidx.annotation.VisibleForTesting
import com.artech.R
import com.artech.android.WithPermission
import com.artech.base.controls.IGxEditThemeable
import com.artech.base.controls.IGxHandleActivityResult
import com.artech.base.metadata.layout.LayoutItemDefinition
import com.artech.base.metadata.theme.ThemeClassDefinition
import com.artech.controls.GxTextView
import com.artech.controls.IGxEdit
import com.artech.ui.Coordinator
import com.artech.utils.ThemeUtils

private val REQUIRED_PERMISSIONS = arrayOf(Manifest.permission.CAMERA)
private const val PERMISSION_REQUEST_CODE = 25232

@SuppressLint("ViewConstructor")
class QRScannerControl(
    context: Context,
    private val coordinator: Coordinator,
    private val definition: LayoutItemDefinition
) : LinearLayout(context), IGxEdit, IGxEditThemeable, IGxHandleActivityResult {

    companion object {
        const val NAME = "Scanner"
        @VisibleForTesting
        const val REQUEST_CODE = 12734
    }

    private val edit: TextView
    private val scanButton: Button

    init {
        edit = EditText(context)
        edit.isEnabled = false
        scanButton = Button(context)
        scanButton.setText(R.string.GXM_Scan)
        scanButton.setOnClickListener(ClickListener())

        addView(edit, LayoutParams(LayoutParams.MATCH_PARENT, LayoutParams.MATCH_PARENT, 1.0f))
        addView(scanButton, LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.MATCH_PARENT))
    }

    override fun getGxValue(): String {
        return edit.text.toString()
    }

    override fun setGxValue(value: String) {
        edit.text = value
    }

    override fun getGxTag(): String {
        return edit.tag as String
    }

    override fun setGxTag(tag: String) {
        edit.tag = tag
    }

    override fun setValueFromIntent(data: Intent) {}

    override fun setEnabled(enabled: Boolean) {
        scanButton.isEnabled = enabled
        super.setEnabled(enabled)
    }

    override fun getViewControl(): IGxEdit {
        return GxTextView(context, definition)
    }

    override fun getEditControl(): IGxEdit {
        return this
    }

    override fun isEditable(): Boolean {
        return isEnabled // Editable when enabled.
    }

    override fun applyEditClass(themeClass: ThemeClassDefinition) {
        // Only apply font properties to edit control. Background, border, etc are already set by DataBoundControl.
        ThemeUtils.setFontProperties(edit, themeClass)
    }

    override fun handleOnActivityResult(requestCode: Int, resultCode: Int, data: Intent): Boolean {
        if (requestCode != REQUEST_CODE) {
            return false
        }

        if (resultCode == Activity.RESULT_OK) {
            val value = data.getStringExtra(ZXingScannerActivity.EXTRA_RESULT)

            if (value != null) {
                val previousValue = edit.text
                edit.text = value
                val valueChanged = !TextUtils.equals(previousValue, value)
                if (valueChanged) {
                    coordinator.onValueChanged(this@QRScannerControl, true)
                }
            }
        }

        return true
    }

    inner class ClickListener : OnClickListener {
        override fun onClick(v: View) {
            WithPermission.Builder<Void>(getContext() as Activity)
                    .require(REQUIRED_PERMISSIONS)
                    .setRequestCode(PERMISSION_REQUEST_CODE)
                    .attachToActivityController()
                    .onSuccess(ClickRunnable())
                    .build()
                    .run()
        }
    }

    inner class ClickRunnable : Runnable {
        override fun run() {
            val intent = ZXingScannerActivity.newIntent(context)

            coordinator.uiContext.activityController?.setActivityResultHandler(this@QRScannerControl)

            val activity = context as Activity
            activity.startActivityForResult(intent, REQUEST_CODE)
        }
    }
}
