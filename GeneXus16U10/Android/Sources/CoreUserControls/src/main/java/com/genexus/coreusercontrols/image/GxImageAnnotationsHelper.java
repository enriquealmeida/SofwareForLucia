package com.genexus.coreusercontrols.image;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Color;

import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.common.StorageHelper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

class GxImageAnnotationsHelper {

	private static final String EXTENSION_PNG = ".png";
	private static final String PROTOCOL_FILE = "file:///";

	static int parseHexColor(String hexColor) {
		return Color.parseColor(hexColor);
	}

	static String getCurrentCanvasImage(Context context, Bitmap bitmap) {
		String path = Strings.EMPTY;
		try {
			File file = StorageHelper.createNewFileInAppExtStorage(context, "annotations", EXTENSION_PNG);
			FileOutputStream outputStream = new FileOutputStream(file);
			bitmap.compress(Bitmap.CompressFormat.PNG, 100, outputStream);
			path = PROTOCOL_FILE + file.getAbsolutePath();
		} catch (IOException e) {
			Services.Log.error(e);
		}
		return path;
	}
}
