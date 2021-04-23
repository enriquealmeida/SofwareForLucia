package com.genexus.coreexternalobjects;

import java.util.List;

import android.content.Intent;
import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

public class ShareAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.Social.Share";

	private static final String METHOD_SHARE_TEXT = "ShareText";
	private static final String METHOD_SHARE_IMAGE = "ShareImage";

	public ShareAPI(ApiAction action) {
		super(action);
		addMethodHandler(METHOD_SHARE_TEXT, 3, new IMethodInvoker() {
			@NonNull
			@Override
			public ExternalApiResult invoke(List<Object> parameters) {
				List<String> values = ExternalApi.toString(parameters);
				shareText(values.get(2), values.get(0), values.get(1));
				return ExternalApiResult.SUCCESS_WAIT;
			}
		});

		addMethodHandler(METHOD_SHARE_IMAGE, 4, new IMethodInvoker() {
			@NonNull
			@Override
			public ExternalApiResult invoke(List<Object> parameters) {
				List<String> values = ExternalApi.toString(parameters);
				shareImage(values.get(3), values.get(1), values.get(2), values.get(0));
				return ExternalApiResult.SUCCESS_WAIT;
			}
		});
	}

	private void shareText(String title, String text, String url) {
		Intent intent = new Intent(Intent.ACTION_SEND);
		intent.setType("text/plain");
		intent.putExtra(Intent.EXTRA_SUBJECT, title);
		intent.putExtra(Intent.EXTRA_TEXT, getSharedText(text, url));

		startShareActivity(intent);
	}

	private void shareImage(String title, String text, String url, String image) {
		Intent intent = new Intent(Intent.ACTION_SEND);
		intent.setType("image/*");
		intent.putExtra(Intent.EXTRA_SUBJECT, title);
		intent.putExtra(Intent.EXTRA_TEXT, getSharedText(text, url));
		intent.putExtra(Intent.EXTRA_STREAM, Services.Images.getSharedImage(getContext(), image));

		startShareActivity(intent);
	}

	private void startShareActivity(Intent intent) {
		getContext().startActivity(Intent.createChooser(intent, null));
	}

	@NonNull
	private String getSharedText(String text, String url) {
		if (Strings.hasValue(text) && Strings.hasValue(url))
			return text + Strings.NEWLINE + url;
		else if (Strings.hasValue(text))
			return text;
		else if (Strings.hasValue(url))
			return url;
		else
			return Strings.EMPTY;
	}
}
