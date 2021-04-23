package com.artech.activities;

import android.content.Intent;

import com.artech.actions.UIContext;
import com.artech.base.model.Entity;

/**
 * An intent handler is a component registered to handle certain intents (such as links,
 * share actions, search from Google Now, &c).
 */
public interface IIntentHandler
{
	boolean tryHandleIntent(UIContext context, Intent intent, Entity data);
}
