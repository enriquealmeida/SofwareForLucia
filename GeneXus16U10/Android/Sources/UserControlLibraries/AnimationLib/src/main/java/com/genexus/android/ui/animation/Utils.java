package com.genexus.android.ui.animation;

import android.content.Context;

import androidx.annotation.NonNull;

import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.LinkedHashMap;

public class Utils {
	private static HashMap<String, String> cache = new LinkedHashMap<>();

	public static boolean hasAsset(@NonNull Context context, String assetName) {
		try (InputStream asset = context.getAssets().open(assetName))
		{
			return true;
		} catch (IOException e) {
			return false;
		}
	}

	@NonNull
	public static String getFileName(@NonNull Context context, String animationName) {
		if (cache.containsKey(animationName)) {
			return cache.get(animationName);
		}
		String fileName = animationName.toLowerCase() + "_animation.json";
		if (!hasAsset(context, fileName)) {
			//try with custom file name
			fileName = animationName + ".json";
			if (!hasAsset(context, fileName)) {
				//return to default one, will fail later
				fileName = animationName.toLowerCase() + "_animation.json";
			}
		}
		// return
		cache.put(animationName, fileName);
		return fileName;
	}
}
