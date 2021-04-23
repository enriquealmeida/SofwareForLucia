package com.artech.controls.grids;

import com.artech.base.model.Entity;
import com.artech.controllers.ViewData;

public interface IGridAdapter
{
	ViewData getData();
	Entity getEntity(int position);
}
