package com.artech.base.application;

import com.artech.base.model.PropertiesObject;

/**
 * Interface of callable GeneXus objects.
 */
public interface IGxObject
{
	OutputResult execute(PropertiesObject parameters);
}
