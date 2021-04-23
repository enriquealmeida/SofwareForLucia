package com.artech.base.metadata.expressions;

import androidx.annotation.NonNull;

import com.artech.base.metadata.images.ImageFile;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;

public class ConstantImageExpression extends ConstantExpression {
    static final String TYPE = "image";

    public ConstantImageExpression(INodeObject node)
    {
        super(node);
    }

    @NonNull
	@Override
	public Value eval(IExpressionContext context)
    {
        String strValue = getConstant();
        if (strValue != null)
        {
            ImageFile imageFile = Services.Resources.getImage(strValue);
            String str = imageFile != null ? imageFile.getUri() : null;
            if (str != null) {
                int pos = str.toLowerCase().indexOf("/resources/");
                if (pos >= 0) {
                    str = str.substring(pos + 1);
                    return Value.newString(str);
                }
            }
        }

        Services.Log.warning(String.format("Image not found in constant image expression '%s'.", strValue));
        return Value.newString("");
    }
}
