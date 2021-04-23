package com.artech.base.metadata.layout;

import com.artech.base.serialization.INodeObject;

public class LayoutUserControlDefinition extends LayoutItemDefinition {


    public LayoutUserControlDefinition(LayoutDefinition layout, LayoutItemDefinition itemParent)
    {
        super(layout, itemParent);
    }

    @Override
    public void readData(INodeObject node)
    {
        super.readData(node);
    }

}
