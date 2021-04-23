package com.artech.ui;

import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.model.Entity;

/**
 * Interface for context that can be used to execute actions.
 */
public interface ActionContext
{
	IViewDefinition getDefinition();
	Entity getContextEntity();

	void runAction(ActionDefinition action, Anchor anchor);
	// run actions allow duplicates from fireEvent
	void runAction(ActionDefinition action, Anchor anchor, boolean allowDuplicate);
}
