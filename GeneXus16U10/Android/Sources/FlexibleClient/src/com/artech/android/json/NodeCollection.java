package com.artech.android.json;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.util.Iterator;
import java.util.NoSuchElementException;

import org.json.JSONArray;
import org.json.JSONException;

import com.artech.base.serialization.INodeCollection;
import com.artech.base.serialization.INodeObject;

public class NodeCollection implements INodeCollection, Serializable
{
	private static final long serialVersionUID = 1L;

	private transient JSONArray mCollection; // Transient because JSON classes are not serializable.

	public NodeCollection()
	{
		mCollection = new JSONArray();
	}

	public NodeCollection(JSONArray array)
	{
		mCollection = array;
	}

	/**
	 * Returns the JSON String corresponding to this Node Collection.
	 */
	@Override
	public String toString()
	{
		return mCollection.toString();
	}

	@Override
	public int length()
	{
		return mCollection.length();
	}

	@Override
	public INodeObject getNode(int index)
	{
		try
		{
			return new NodeObject(mCollection.getJSONObject(index));
		}
		catch (JSONException e)
		{
			if (e.getMessage().startsWith("Value null at"))
				return null; // null in json
			else
				throw new IllegalStateException("Exception retrieving INodeObject item from NodeCollection", e);
		}
	}

	@Override
	public void put(INodeObject value)
	{
		mCollection.put(((NodeObject)value).getInner());
	}

	@Override
	public String getString(int index)
	{
		try
		{
			return mCollection.getString(index);
		}
		catch (JSONException e)
		{
			throw new IllegalStateException("Exception retrieving string item from NodeCollection", e);
		}
	}

	@Override
	public void put(String value)
	{
		mCollection.put(value);
	}

	public JSONArray getInner()
	{
		return mCollection;
	}

	@Override
	public Iterator<INodeObject> iterator()
	{
		return new CollectionIterator();
	}

	private void writeObject(ObjectOutputStream out) throws IOException
	{
		out.defaultWriteObject();
		out.writeBytes(mCollection.toString());
	}

	private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException
	{
		in.defaultReadObject();

		try
		{
			mCollection = new JSONArray((String)in.readObject());
		}
		catch (JSONException ex)
		{
			throw new IOException(ex.getMessage());
		}
	}

	class CollectionIterator implements Iterator<INodeObject>
	{
		private int mCurrent = 0;

		@Override
		public boolean hasNext()
		{
			return (mCurrent < mCollection.length());
		}

		@Override
		public INodeObject next()
		{
			if (!hasNext())
				throw new NoSuchElementException();

			return getNode(mCurrent++);
		}

		@Override
		public void remove()
		{
			throw new UnsupportedOperationException();
		}
	}
}
