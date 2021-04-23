package com.genexus.filepicker

import android.app.Activity
import android.content.ActivityNotFoundException
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.net.Uri
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import androidx.appcompat.widget.AppCompatImageView
import com.artech.base.controls.IGxHandleActivityResult
import com.artech.base.metadata.layout.LayoutItemDefinition
import com.artech.base.services.Services
import com.artech.controls.IGxEdit
import com.artech.ui.Coordinator

class FileControl(context: Context, private val coordinator: Coordinator, @Suppress("UNUSED_PARAMETER") definition: LayoutItemDefinition) : FrameLayout(context), IGxEdit, IGxHandleActivityResult {
    private var value: String = ""
    private var tag: String = ""
    private val imageView = AppCompatImageView(context)
    private var imageViewEdit: AppCompatImageView? = null

    init {
        addView(imageView)
        val editable = !definition.optStringProperty("@readonly").equals("True", ignoreCase = true)
        if (editable) {
            val imageViewEditAlpha = View(context)
            imageViewEditAlpha.setBackgroundColor(Color.BLACK)
            imageViewEditAlpha.getBackground().alpha = 85 // 33%
            addView(imageViewEditAlpha)

            imageViewEdit = AppCompatImageView(context)
            val paramsEdit = LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
            paramsEdit.gravity = Gravity.CENTER
            addView(imageViewEdit, paramsEdit)

            setOnClickListener {
                val intent = Intent(Intent.ACTION_GET_CONTENT)
                intent.type = "*/*"
                intent.addCategory(Intent.CATEGORY_OPENABLE)
                coordinator.uiContext.activityController?.setActivityResultHandler(this)
                try {
                    (context as Activity).startActivityForResult(Intent.createChooser(intent, "Select a File"), FILE_SELECT_CODE)
                } catch (e: ActivityNotFoundException) {
                    Services.Log.debug("BlobFilePicker", "Chooser not found: $e")
                }
            }
        }
    }

    override fun getGxTag(): String {
        return tag
    }

    override fun setGxTag(tag: String?) {
        this.tag = tag ?: ""
    }

    override fun setValueFromIntent(data: Intent?) {
    }

    override fun getGxValue(): String {
        return value
    }

    override fun setGxValue(value: String?) {
        if (!Services.Strings.hasValue(value)) {
            val img = Services.Resources.getImageDrawable(context, "ic_add")
            imageViewEdit?.setImageDrawable(img)
        } else {
            imageView.setImageURI(Uri.parse(value))
            if (imageView.drawable == null) {
                val img = Services.Resources.getImageDrawable(context, "ic_binary_file")
                imageView.setImageDrawable(img)
            }
            val imgEdit = Services.Resources.getImageDrawable(context, "ic_edit")
            imageViewEdit?.setImageDrawable(imgEdit)
        }
        this.value = value ?: ""
    }

    override fun getEditControl(): IGxEdit {
        return this
    }

    override fun getViewControl(): IGxEdit {
        return this
    }

    override fun isEditable(): Boolean {
        return true
    }

    override fun handleOnActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (resultCode == Activity.RESULT_OK && requestCode == FILE_SELECT_CODE) {
            gxValue = data?.data.toString()
            return true
        }
        return false
    }

    companion object {
        const val NAME = "SDFileControl"
        private const val FILE_SELECT_CODE = 325
    }
}
