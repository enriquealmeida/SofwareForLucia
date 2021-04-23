package com.artech.common;

import com.artech.base.services.IExceptions;
import com.artech.base.services.Services;

class ExceptionManager implements IExceptions {

	@Override
	public void handle(Exception ex) {
		if (ex != null && ex.getMessage() != null) {
			Services.Log.error("ERROR:", ex.getMessage());
		}
		if (ex == null)
			Services.Log.error("ERROR:", " invalid exception was caught");
	}

	@Override
	public void printStackTrace(Exception ex) {
	}

}
