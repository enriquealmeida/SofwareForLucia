package com.genexus.queryviewer;

import android.content.Context;

import com.artech.framework.GenexusModule;
import com.artech.usercontrols.UcFactory;
import com.artech.usercontrols.UserControlDefinition;

public class QueryViewerModule implements GenexusModule {

    @Override
    public void initialize(Context context) {

        UserControlDefinition basicUserControl = new UserControlDefinition(
                QueryViewer.NAME,
                QueryViewer.class
        );
        UcFactory.addControl(basicUserControl);
    }
}
