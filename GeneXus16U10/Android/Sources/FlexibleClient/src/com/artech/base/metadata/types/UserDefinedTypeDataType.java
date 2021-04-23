package com.artech.base.metadata.types;

import com.artech.application.MyApplication;
import com.artech.base.metadata.DataTypeDefinition;
import com.artech.base.metadata.ITypeDefinition;
import com.artech.externalapi.ExternalApiFactory;

public class UserDefinedTypeDataType extends DataTypeDefinition implements ITypeDefinition {
    private String mTypeName;
    public UserDefinedTypeDataType(String typeName) {
        super(null);
        mTypeName = typeName;
    }

    @SuppressWarnings("deprecation")
    @Override
    public Object getEmptyValue(boolean isCollection) {
        ExternalApiFactory externalApiFactory = MyApplication.getInstance().getExternalApiFactory();
        return externalApiFactory.createInstance(mTypeName, null);
    }
}
