package com.artech.base.serialization;

public interface INodeCollection extends Iterable<INodeObject>
{
	int length();

	String getString(int index);
	void put(String value);

	INodeObject getNode(int index);
	void put(INodeObject value);
}
