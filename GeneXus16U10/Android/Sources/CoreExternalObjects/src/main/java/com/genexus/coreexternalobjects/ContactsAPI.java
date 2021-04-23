package com.genexus.coreexternalobjects;

import android.Manifest;

import androidx.annotation.NonNull;

import com.artech.actions.ApiAction;
import com.artech.base.model.Entity;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultRunnable;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

import java.util.List;

public class ContactsAPI extends ExternalApi {
	public static final String OBJECT_NAME = "GeneXus.SD.Contacts";

	private static final String METHOD_ADD_CONTACT = "AddContact";
	private static final String METHOD_GET_ALL_CONTACTS = "GetAllContacts";

	private static final String[] PERMISSIONS = new String[]{Manifest.permission.READ_CONTACTS};

	public ContactsAPI(ApiAction action) {
		super(action);
	}

	@NonNull
	@Override
	public ExternalApiResult execute(String method, List<Object> parameters) {
		if (method.equalsIgnoreCase(METHOD_ADD_CONTACT)) {
			if (!SDActionsHelper.addContactFromParameters(getActivity(), toString(parameters))) {
				String str = Services.Strings.getResource(R.string.GXM_NoApplicationAvailable);
				Services.Messages.showMessage(getActivity(), str);
				return ExternalApiResult.FAILURE;
			}
			return ExternalApiResult.SUCCESS_WAIT;
		} else if (method.equalsIgnoreCase(METHOD_GET_ALL_CONTACTS)) {
			return executeRequestingPermissions(new ResultRunnable<ExternalApiResult>() {
				@Override
				public ExternalApiResult run() {
					Contacts helper = new Contacts(getContext());
					List<Entity> contactsData = helper.getAllContacts();

					return ExternalApiResult.success(contactsData);
				}
			});
		} else
			return ExternalApiResult.failureUnknownMethod(this, method);
	}

	private ExternalApiResult executeRequestingPermissions(ResultRunnable<ExternalApiResult> code) {
		return executeRequestingPermissions(PERMISSIONS, code);
	}
}
