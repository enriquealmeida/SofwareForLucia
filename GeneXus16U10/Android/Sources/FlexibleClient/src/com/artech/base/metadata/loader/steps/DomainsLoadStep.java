package com.artech.base.metadata.loader.steps;

import android.content.Context;

import com.artech.base.metadata.DomainDefinition;
import com.artech.base.metadata.loader.MetadataLoadStep;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class DomainsLoadStep implements MetadataLoadStep {
	private final Context mContext;

	public DomainsLoadStep(Context context) {
		mContext = context;
	}

	@Override
	public void load() {
		INodeObject domains = MetadataLoader.getDefinition(mContext, "domains");
		if (domains != null) {
			INodeCollection arrEntities = domains.getCollection("Domains");
			for (int i = 0; i < arrEntities.length(); i++) {
				INodeObject obj = arrEntities.getNode(i);
				DomainDefinition def = new DomainDefinition(obj);
				Services.Application.putDomain(def);
			}
		}
	}
}
