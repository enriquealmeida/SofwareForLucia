package com.artech.actions;

import android.content.ContentResolver;
import android.net.Uri;
import androidx.annotation.NonNull;

import com.artech.android.media.MediaUtils;
import com.artech.application.MyApplication;
import com.artech.base.application.IBusinessComponent;
import com.artech.base.application.OutputResult;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.enums.ControlTypes;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.expressions.ExpressionValueBridge;
import com.artech.base.metadata.types.IStructuredDataType;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.model.PropertiesObject;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.utils.ResultDetail;
import com.artech.base.utils.Strings;
import com.artech.utils.FileUtils2;

import java.util.List;
import java.util.Set;

public class BCMethodHandler {
    private static final String METHOD_BC_LOAD = "Load";
    private static final String METHOD_BC_SAVE = "Save";
    private static final String METHOD_BC_DELETE = "Delete";
    private static final String METHOD_BC_INSERT = "Insert";
    private static final String METHOD_BC_INSERT_OR_UPDATE = "InsertOrUpdate";
    private static final String TAG_BC = "IBusinessComponent";

    public static Value eval(UIContext context, Value value, String method, List<Value> parameters) {
        Entity entity = value.coerceToEntity();
        StructureDefinition structureDef = ((IStructuredDataType) value.getDefinition().getBaseType()).getStructure();
        IApplicationServer server;
        if (structureDef.getConnectivitySupport() != Connectivity.Inherit)
            server = MyApplication.getApplicationServer(structureDef.getConnectivitySupport());
        else
            server = MyApplication.getApplicationServer(context.getConnectivitySupport());
        IBusinessComponent businessComponent = (IBusinessComponent)entity.getTag(TAG_BC);
        if (businessComponent == null)
            businessComponent = server.getBusinessComponent(structureDef.getName());
        OutputResult result;

        if (METHOD_BC_LOAD.equalsIgnoreCase(method)) {
            List<String> key = ExpressionValueBridge.convertValuesToString(parameters);
            result = businessComponent.load(entity, key);
            if (result.isOk())
                entity.setTag(TAG_BC, businessComponent); // So the update mode is not lost
        }
        else if (METHOD_BC_SAVE.equalsIgnoreCase(method)) {
            uploadBlobsFromEntity(server, entity);
            result = businessComponent.save(entity);
        }
        else if (METHOD_BC_DELETE.equalsIgnoreCase(method)) {
            result = businessComponent.delete();
        }
        else if (METHOD_BC_INSERT.equalsIgnoreCase(method)) {
            uploadBlobsFromEntity(server, entity);
            result = businessComponent.insert(entity);
        }
        else if (METHOD_BC_INSERT_OR_UPDATE.equalsIgnoreCase(method)) {
            uploadBlobsFromEntity(server, entity);
            result = businessComponent.insertOrUpdate(entity);
        }
        else {
            throw new IllegalArgumentException(String.format("Unexpected BC method: '%s'", method));
        }

        if (result.isOk())
            return Value.UNKNOWN;
        else
            return Value.newFail(result);
    }

    private static final Set<String> URI_SCHEMES_FOR_UPLOAD = Strings.newSet(ContentResolver.SCHEME_CONTENT,
            ContentResolver.SCHEME_FILE, FileUtils2.SCHEME_GX_RESOURCE);

    private static ResultDetail<Void> uploadBlobsFromEntity(IApplicationServer server, Entity entity) {
        return uploadBlobsFromEntity(server, 0, entity);
    }

    private static ResultDetail<Void> uploadBlobsFromEntity(IApplicationServer mServer, int maxUploadSizeMode, Entity innerEntity) {
        for (DataItem def : innerEntity.getLevel().Items) {
            int innerMaxUploadSizeMode = maxUploadSizeMode == 0 ? maxUploadSizeMode : def.getMaximumUploadSizeMode();
            ResultDetail<Void> subResult = uploadBlobsFromContainer(mServer, innerMaxUploadSizeMode, innerEntity, def);
            if (!subResult.getResult())
                return subResult; // Abort on failure
        }
        return ResultDetail.ok(); // All ok
    }

    @NonNull
	@SuppressWarnings("deprecation")
	static ResultDetail<Void> uploadBlobsFromContainer(IApplicationServer mServer, int maxUploadSizeMode, PropertiesObject container, DataItem def) {
        String controlName = def.getName();
        String controlType = def.getControlType();

        if (def.isMediaOrBlob()) {
            String valueString = container.optStringProperty(controlName);
            if (Strings.hasValue(valueString)) {
                Uri mediaUri = Uri.parse(valueString);

                if (ControlTypes.PHOTO_EDITOR.equalsIgnoreCase(controlType))
                    mediaUri = MediaUtils.translateGenexusImageUri(mediaUri);

                // avoid crash path with no schema. ie. server relative url
				if (mediaUri.getScheme()==null)
					return ResultDetail.ok(); // All ok

				if (URI_SCHEMES_FOR_UPLOAD.contains(mediaUri.getScheme())) {
                    ResultDetail<Void> uploadResult = MediaUtils.uploadMedia(MyApplication.getAppContext(),
                            mediaUri, controlName, controlType, maxUploadSizeMode, mServer,
                            container, null);

                    if (!uploadResult.getResult())
                        return uploadResult; // Abort on failure
                }
            }
        }
        else {
            Object valueObj = container.getProperty(controlName);
            if (valueObj instanceof Entity) {
                Entity innerEntity = (Entity) valueObj;

                ResultDetail<Void> subResult = uploadBlobsFromEntity(mServer, maxUploadSizeMode, innerEntity);
                if (!subResult.getResult())
                    return subResult; // Abort on failure
            }
            else if (valueObj instanceof EntityList) {
                EntityList innerEntityList = (EntityList) valueObj;
                for (Entity innerEntity : innerEntityList) {
                    ResultDetail<Void> subResult = uploadBlobsFromEntity(mServer, maxUploadSizeMode, innerEntity);
                    if (!subResult.getResult())
                        return subResult; // Abort on failure
                }
            }
        }

        return ResultDetail.ok(); // All ok
    }
}
