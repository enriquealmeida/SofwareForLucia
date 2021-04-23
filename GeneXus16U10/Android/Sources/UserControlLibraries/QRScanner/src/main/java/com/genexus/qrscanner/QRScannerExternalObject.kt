package com.genexus.qrscanner

import android.app.Activity
import android.content.Intent
import com.artech.actions.ApiAction
import com.artech.base.model.EntityFactory
import com.artech.base.model.ValueCollection
import com.artech.externalapi.ExternalApi
import com.artech.externalapi.ExternalApiResult

private const val METHOD_SCAN = "ScanBarcode"
private const val METHOD_SCAN_LOOP = "ScanInLoop"
private val PERMISSIONS = arrayOf("android.permission.CAMERA")
private const val REQUEST_CODE = 45296

class QRScannerExternalObject(action: ApiAction) : ExternalApi(action) {

    companion object {
        const val NAME = "GeneXus.SD.Scanner"
    }

    private val methodScan = object : IMethodInvokerWithActivityResult {

        override fun invoke(parameters: List<Any>): ExternalApiResult {
            var barcodeTypes = if (parameters.size == 1) (parameters[0] as ValueCollection) else null
            val intent = ZXingScannerActivity.newIntent(context, barcodeTypes = barcodeTypes)
            startActivityForResult(intent, REQUEST_CODE)
            return ExternalApiResult.SUCCESS_WAIT
        }

        override fun handleActivityResult(requestCode: Int, resultCode: Int, result: Intent?): ExternalApiResult {
            if (requestCode != REQUEST_CODE || resultCode != Activity.RESULT_OK) {
                return ExternalApiResult.FAILURE
            }

            val scannedBarcode = result?.getStringExtra(ZXingScannerActivity.EXTRA_RESULT)
                ?: return ExternalApiResult.FAILURE

            return ExternalApiResult.success(scannedBarcode)
        }
    }

    private val methodScanLoop = object : IMethodInvokerWithActivityResult {

        override fun invoke(parameters: List<Any>): ExternalApiResult {
            val beepOnEachRead = parameters[0] == "true"
            val intent = ZXingScannerActivity.newIntent(context, true, beepOnEachRead)
            startActivityForResult(intent, REQUEST_CODE)
            return ExternalApiResult.SUCCESS_WAIT
        }

        override fun handleActivityResult(requestCode: Int, resultCode: Int, result: Intent?): ExternalApiResult {
            if (requestCode != REQUEST_CODE || resultCode != Activity.RESULT_OK) {
                return ExternalApiResult.FAILURE
            }

            val scannedBarcodes = result?.getStringExtra(ZXingScannerActivity.EXTRA_RESULT)
                ?: return ExternalApiResult.FAILURE

            val values = scannedBarcodes.split(",").toMutableList()
            values.removeAll { s -> s.isEmpty() }

            val collection = EntityFactory.newSdtCollection("GeneXus.SD.ScannedBarcodes", values)

            return ExternalApiResult.success(collection)
        }
    }

    init {
        addMethodHandlerRequestingPermissions(METHOD_SCAN, 0, PERMISSIONS, methodScan)
        addMethodHandlerRequestingPermissions(METHOD_SCAN, 1, PERMISSIONS, methodScan)
        addMethodHandlerRequestingPermissions(METHOD_SCAN_LOOP, 1, PERMISSIONS, methodScanLoop)
    }
}
