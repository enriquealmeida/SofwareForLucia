package com.artech.framework;

import android.content.Context;

/**
 * A "Module" is a component of the application that is not part of FlexibleClient but adds
 * functionality to applications (such as new user controls, external object implementations,
 * intent handlers, &c).
 */
public interface GenexusModule
{
	/**
	 * This method will be called at application start-up, before metadata has been loaded.
	 * From here you should call methods to register external objects, user controls, &c.
	 * Some methods to be aware of:
	 * <ul>
	 *     <li>{@link com.artech.externalapi.ExternalApiFactory#addApi(com.artech.externalapi.ExternalApiDefinition)} </li>
	 *     <li>{@link com.artech.usercontrols.UcFactory#addControl(com.artech.usercontrols.UserControlDefinition)}</li>
	 *     <li>{@link com.artech.controls.maps.Maps#addProvider(com.artech.controls.maps.common.IMapsProvider)}</li>
	 *     <li>{@link com.artech.activities.IntentHandlers#addHandler(com.artech.activities.IIntentHandler)}</li>
	 * </ul>
	 *
	 * @param context Application context.
	 */
	void initialize(Context context);
}
