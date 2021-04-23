package com.genexus.filepicker

import android.app.Activity.RESULT_OK
import android.content.ActivityNotFoundException
import android.content.Intent
import com.artech.actions.ApiAction
import com.artech.base.services.Services
import com.artech.externalapi.ExternalApi
import com.artech.externalapi.ExternalApiResult

class FilePickerAPI(action: ApiAction) : ExternalApi(action) {

    private val chooseFile = object : IMethodInvokerWithActivityResult {
        override fun invoke(parameters: MutableList<Any>?): ExternalApiResult {
            val intent = Intent(Intent.ACTION_GET_CONTENT)
            intent.type = "*/*"
            intent.addCategory(Intent.CATEGORY_OPENABLE)
            if (parameters != null && parameters.count() >= 1) {
                val mimeTypes = parameters[0].toString().split(',').toTypedArray()
                intent.putExtra(Intent.EXTRA_MIME_TYPES, mimeTypes)
            }
            try {
                startActivityForResult(Intent.createChooser(intent, "Select a File"), FILE_SELECT_CODE)
                return ExternalApiResult.SUCCESS_WAIT
            } catch (e: ActivityNotFoundException) {
                Services.Log.debug("FilePicker", "Chooser not found: $e")
                return ExternalApiResult.FAILURE
            }
        }

        override fun handleActivityResult(requestCode: Int, resultCode: Int, result: Intent?): ExternalApiResult {
            if (resultCode == RESULT_OK)
                return ExternalApiResult.success(result?.data.toString())
            else
                return ExternalApiResult.FAILURE
        }
    }

    init {
        addMethodHandler(METHOD_CHOOSE_FILE, 0, chooseFile)
        addMethodHandler(METHOD_CHOOSE_FILE, 1, chooseFile)
    }

    companion object {
        const val OBJECT_NAME = "GeneXus.SD.Media.Files"
        private const val FILE_SELECT_CODE = 324
        private const val METHOD_CHOOSE_FILE = "ChooseFile"
    }
}
