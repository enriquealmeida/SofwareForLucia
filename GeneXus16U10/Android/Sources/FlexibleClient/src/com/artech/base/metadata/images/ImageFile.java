package com.artech.base.metadata.images;

import java.io.Serializable;

import com.artech.application.MyApplication;
import com.artech.base.services.Services;
import com.artech.base.utils.Strings;

public class ImageFile implements Serializable
{
	private static final long serialVersionUID = 1L;

	public static final int TYPE_INTERNAL = 0;
	public static final int TYPE_EXTERNAL = 1;

	private final ImageCollection mParent;
	private final String mName;
	private final int mType;
	private final String mLocation;
	private final boolean mAutoMirror;

	private String mUri;
	private String mResourceName;

	public ImageFile(ImageCollection parent, String name, int type, String location, boolean autoMirror)
	{
		mParent = parent;
		mName = name;
		mType = type;
		mLocation = location;
		mAutoMirror = autoMirror;
	}

	public String getName() { return mName; }
	public int getType() { return mType; }

	public boolean hasAutoMirror() {
		return mAutoMirror;
	}

	public String getUri()
	{
		if (mUri == null)
		{
			if (mType == TYPE_INTERNAL)
			{
				// Relative, for internal images.
				StringBuilder sb = new StringBuilder();
				sb.append(MyApplication.getApp().UriMaker.getBaseImagesUrl());
				sb.append("/");

				if (Services.Strings.hasValue(mParent.getBaseDirectory()))
				{
					sb.append(mParent.getBaseDirectory());
					sb.append("/");
				}

				sb.append(mLocation);
				mUri = sb.toString();
			}
			else
			{
				// Absolute, for external images.
				mUri = mLocation;
			}
		}

		return mUri;
	}

	public void setUri(String uri) {
		mUri = uri;
	}

	private static final String RESOURCE_CHAR_REPLACER = "_";

	public String getResourceName()
	{
		if (mType == TYPE_EXTERNAL)
			return null; // External images cannot have been embedded as resources.

		if (mResourceName == null)
		{
			mResourceName = Strings.toLowerCase(mLocation);
			mResourceName = mResourceName.replace(".", RESOURCE_CHAR_REPLACER).replace("/", RESOURCE_CHAR_REPLACER).replace("\\", RESOURCE_CHAR_REPLACER);
		}

		return mResourceName;
	}
}
