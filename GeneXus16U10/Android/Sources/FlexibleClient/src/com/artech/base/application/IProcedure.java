package com.artech.base.application;

import java.util.List;

import com.artech.base.model.PropertiesObject;

public interface IProcedure extends IGxObject
{
	OutputResult executeMultiple(List<PropertiesObject> parameters);

	// apply replicator timeout if correspond
	OutputResult executeReplicator(PropertiesObject parameters);
}
