package com.artech.base.services;

import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;

public interface ISerialization
{
	INodeObject createNode();
	INodeObject createNode(String json);
	INodeObject createNode(Object json);

	INodeCollection createCollection();
	INodeCollection createCollection(String json);
	INodeCollection createCollection(Object json);

	boolean serializeObject(Object object, String filename);
	Object deserializeObject(String filename);
}
