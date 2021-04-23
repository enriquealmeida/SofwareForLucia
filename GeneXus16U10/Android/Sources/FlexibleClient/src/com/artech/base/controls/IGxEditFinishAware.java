package com.artech.base.controls;

import com.artech.controls.IGxEdit;

public interface IGxEditFinishAware extends IGxEdit {
    /***
     * Called when the value is considered edited, this event should
     * be used to call onValueChanged() if needed since lose focus
     * may not happend at this time.
     */
    void finishEdit();
}
