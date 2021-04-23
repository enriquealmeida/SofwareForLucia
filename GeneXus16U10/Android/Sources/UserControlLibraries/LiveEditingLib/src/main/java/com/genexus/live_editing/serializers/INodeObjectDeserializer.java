package com.genexus.live_editing.serializers;

import java.lang.reflect.Type;

import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.google.gson.JsonDeserializationContext;
import com.google.gson.JsonDeserializer;
import com.google.gson.JsonElement;
import com.google.gson.JsonParseException;

class INodeObjectDeserializer implements JsonDeserializer<INodeObject> {

	@Override
	public INodeObject deserialize(JsonElement json, Type typeOfT, JsonDeserializationContext context) throws JsonParseException {
		return Services.Serializer.createNode(json.toString());
	}
}
