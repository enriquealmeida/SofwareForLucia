package com.artech.android.json;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class NodeObject implements INodeObject, Serializable
{
	private static final long serialVersionUID = 1L;

	private transient JSONObject mNode; // Transient because JSON classes are not serializable.

	public NodeObject(JSONObject obj)
	{
		mNode = obj;
	}

	/**
	 * Returns the JSON String corresponding to this Node Object.
	 */
	@Override
	public String toString()
	{
		return mNode.toString();
	}

	@Override
	public boolean has(String name)
	{
		return mNode.has(name);
	}

	@Override
	public Object get(String name)
	{
		Object value = mNode.opt(name);

		if (value instanceof JSONObject)
			return new NodeObject((JSONObject)value);
		else if (value instanceof JSONArray)
			return new NodeCollection((JSONArray)value);

		return value;
	}

	@Override
	public INodeCollection getCollection(String name)
	{
		JSONArray arr = mNode.optJSONArray(name);
		if (arr != null)
			return new NodeCollection(arr);

		return null;
	}

	@Override
	public INodeObject getNode(String name)
	{
		try
		{
			return new NodeObject(mNode.getJSONObject(name));
		} catch (JSONException e) {
		}
		return null;
	}

	@Override
	public String getString(String name) {
		try {
			return mNode.getString(name);
		} catch (JSONException e) {
		}
		return null;
	}

	@Override
	public List<String> names()
	{
		List<String> vector = new ArrayList<>();
		JSONArray nodeNames = mNode.names();
		if (nodeNames != null)
		{
			for (int i = 0; i < nodeNames.length() ; i++)
			{
				try {
					vector.add(nodeNames.getString(i));
				} catch (JSONException e) {
				}
			}
		}
		return vector;
	}

	@Override
	public INodeCollection optCollection(String name)
	{
		JSONArray array = mNode.optJSONArray(name);
		if (array != null)
			return new NodeCollection(array);

		// Return array from a single item if present.
		NodeCollection collection = new NodeCollection();
		JSONObject item = mNode.optJSONObject(name);
		if (item != null)
			collection.put(new NodeObject(item));

		return collection;
	}

	@Override
	public INodeObject optNode(String name)
	{
		JSONObject array = mNode.optJSONObject(name);
		if (array != null)
			return new NodeObject(array);
		return null;
	}

	@Override
	public String optString(String key)
	{
		return mNode.optString(key);
	}

	@Override
	public String optString(String key, String defaultValue)
	{
		return mNode.optString(key, defaultValue);
	}

	@Override
	public boolean optBoolean(String key)
	{
		return optBoolean(key, false);
	}

	@Override
	public int optInt(String key)
	{
		return mNode.optInt(key);
	}

	@Override
	public boolean optBoolean(String key, boolean defaultValue)
	{
		String strValue = optString(key);
		return Services.Strings.tryParseBoolean(strValue, defaultValue);
	}

	public JSONObject getInner()
	{
		return mNode;
	}

	@Override
	public void put(String name, Object value)
	{
		try
		{
			if (value instanceof NodeObject)
				value = ((NodeObject)value).getInner();
			else if (value instanceof NodeCollection)
				value = ((NodeCollection)value).getInner();

			mNode.put(name, value);
		}
		catch (JSONException e)
		{
			Services.Exceptions.handle(e);
		}
	}

	@Override
	public boolean isAtomic(String name)
	{
		try
		{
			// Is there a more efficient way to do this?
			Object value = mNode.get(name);
			if (value == null || value instanceof JSONObject || value instanceof JSONArray)
				return false;
		}
		catch (JSONException e)
		{
			return false;
		}

		return true;
	}

	private void writeObject(ObjectOutputStream out) throws IOException
	{
		out.writeObject(mNode.toString());
	}

	private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException
	{
		try
		{
			mNode = new JSONObject((String)in.readObject());
		}
		catch (JSONException ex)
		{
			throw new IOException(ex.getMessage());
		}
	}
}
