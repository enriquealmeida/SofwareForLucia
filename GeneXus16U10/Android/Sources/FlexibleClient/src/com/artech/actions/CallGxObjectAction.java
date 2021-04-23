package com.artech.actions;

import java.util.List;

import android.app.Activity;
import android.bluetooth.BluetoothDevice;
import android.content.Intent;

import com.artech.activities.ActivityHelper;
import com.artech.activities.BTDeviceList;
import com.artech.android.media.MediaUtils;
import com.artech.application.MyApplication;
import com.artech.base.application.IGxObject;
import com.artech.base.application.OutputResult;
import com.artech.base.metadata.ActionDefinition;
import com.artech.base.metadata.ActionParameter;
import com.artech.base.metadata.AttributeDefinition;
import com.artech.base.metadata.DataItem;
import com.artech.base.metadata.GxObjectDefinition;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.ObjectParameterDefinition;
import com.artech.base.metadata.StructureDataType;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.VariableDefinition;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.enums.DataTypes;
import com.artech.base.metadata.enums.ImageUploadModes;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.expressions.ExpressionValueBridge;
import com.artech.base.metadata.layout.LayoutDefinition;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.model.PropertiesObject;
import com.artech.base.providers.IApplicationServer;
import com.artech.base.services.Services;
import com.artech.base.utils.ResultDetail;
import com.artech.base.utils.Strings;
import com.artech.fragments.IDataView;
import com.artech.layers.LocalProcedure;

public class CallGxObjectAction extends Action implements IActionWithOutput
{
    private OutputResult mOutput;
	private boolean isReportObject = false;
	private IGxObject gxObject = null;

	CallGxObjectAction(UIContext context, ActionDefinition definition, ActionParameters parameters)
	{
		super(context, definition, parameters);
	}

	@Override
	public boolean Do()
	{
		ActionDefinition definition = getDefinition();
		GxObjectDefinition actionObject = Services.Application.getGxObject(definition.getGxObject());
		IApplicationServer server = getApplicationServer(actionObject);
		if (Strings.hasValue(definition.getActionPackage()))
			gxObject = server.getGxObject(definition.getActionPackage(), definition.getGxObject());
		else
			gxObject = server.getGxObject(definition.getGxObject());

		// llamada a select printer
		if (gxObject instanceof LocalProcedure && ((LocalProcedure)gxObject).isPrinterReport())
		{
			BluetoothDevice btDevice = BTDeviceList.getBTDevice();
			if (btDevice == null)
			{
				isReportObject = true;
				Intent btIntent = new Intent(getActivity(), com.artech.activities.BTDeviceList.class);
				getActivity().startActivityForResult(btIntent, com.artech.activities.BTDeviceList.REQUEST_CONNECT_BT);
				ActivityHelper.registerActionRequestCode(com.artech.activities.BTDeviceList.REQUEST_CONNECT_BT);
				return OutputResult.ok().isOk();
			}
		}
		mOutput = runGxObject(this, gxObject, actionObject, definition, getParameters());
		return mOutput.isOk();
	}

	@Override
	public Activity getActivity()
	{
		return super.getActivity();
	}

	@Override
	public OutputResult getOutput()
	{
		return mOutput;
	}

	/**
	 * Calls a GeneXus object on the server and returns its result.
	 * Receives definition and parameters separately because they may differ from those in the action
	 * (e.g. if a custom action is mapped to a procedure call).
	 * However the output is assigned to the "real" action.
	 */
	private static OutputResult runGxObject(Action action, IGxObject gxObject, GxObjectDefinition actionObject, ActionDefinition definition, ActionParameters parameters)
	{
		beginWorking();
		try
		{
			// Read definition from action.
			List<ActionParameter> actionParameters = definition.getParameters();

			// Obtain implementation.
			IApplicationServer server = action.getApplicationServer(actionObject);

			// Prepare input parameters.
			ResultDetail<PropertiesObject> prepareResult = prepareCallParameters(server, action, definition, actionObject, parameters.getEntity());
			if (!prepareResult.getResult())
				return OutputResult.error(prepareResult.getMessage()); // Abort because parameters could not be marshaled.

			// Call object.
			PropertiesObject callParameters = prepareResult.getData();
			OutputResult result = gxObject.execute(callParameters);

			if (result.isOk())
			{
				// Read output parameters.
				for (int i = 0; i < actionObject.getParameters().size(); i++)
				{
					ObjectParameterDefinition procParameter = actionObject.getParameter(i);
					if (procParameter.isOutput())
					{
						// Read result parameter from object.
						Object outValue = callParameters.getProperty(procParameter.getName());

						// See if we have a local variable to assign it to.
						if (i < actionParameters.size())
						{
							ActionParameter actionParameter = actionParameters.get(i);
							if (actionParameter != null && actionParameter.isAssignable()) {
								if (procParameter.isMediaOrBlob()) {
									// fix blob data type path from offline code.
									outValue = MediaUtils.translateGenexusBlobPathToUri(outValue);
								}
								// If an online object returns a SDT collection it would be JSONArray, those are set as Value of Type.OBJECT and are processed in EntitySerializer.deserializeStructureItem()
								action.setOutputValue(actionParameter, Value.newValueObject(outValue));
							}
						}
					}
				}
			}
			return result;
		}
		finally
		{
			endWorking();
		}
	}

	static ResultDetail<PropertiesObject> prepareCallParameters(IApplicationServer server, Action actionContext, ActionDefinition actionDefinition, GxObjectDefinition actionObject, Entity from)
	{
		PropertiesObject callParameters = new PropertiesObject();
		ResultDetail<Void> blobUploadError = null;

		if (actionObject != null)
		{
			List<ActionParameter> arguments = actionDefinition.getParameters();
			for (int index = 0; index < arguments.size() && index < actionObject.getParameters().size(); index++)
			{
				ObjectParameterDefinition parameter = actionObject.getParameters().get(index);
				if (parameter.isInput())
				{
					Value value = actionContext.getParameterValue(arguments.get(index), from);
					Object objValue = ExpressionValueBridge.convertValueToEntityFormat(value, parameter);
					callParameters.setProperty(parameter.getName(), objValue);

					int maxUploadSizeModeControlOrData = getMaxUploadSizeModeControlOrData(actionContext, arguments.get(index));
					int maxUploadSizeModeCalled = parameter.getMaximumUploadSizeMode();
					int maxUploadSizeMode = ImageUploadModes.resolveModeForUpload(maxUploadSizeModeControlOrData, maxUploadSizeModeCalled);

					// Upload any blobs in object parameters
					ResultDetail<Void> uploadResult = BCMethodHandler.uploadBlobsFromContainer(server, maxUploadSizeMode, callParameters, parameter);
					if (blobUploadError == null && !uploadResult.getResult())
						blobUploadError = uploadResult; // Continue, but remember the error and return it at the end.
				}
			}
		}

		if (blobUploadError == null)
			return ResultDetail.ok(callParameters);
		else
			return ResultDetail.error(blobUploadError.getMessage(), callParameters);
	}

	private static int getMaxUploadSizeModeControlOrData(Action actionContext, ActionParameter argument) {
		if (argument.isAssignable()) { // This filter some of the non valid argument
			String argumentValue = argument.getValue();
			IDataView dataView = actionContext.getContext().getDataView();
			if (dataView != null) {
				LayoutDefinition layoutDefinition = dataView.getLayout();
				if (layoutDefinition!=null)
				{
					LayoutItemDefinition layoutItemDefinition = layoutDefinition.getDataControl(argumentValue);
					if (layoutItemDefinition != null)
						return layoutItemDefinition.getMaximumUploadSizeMode();

					VariableDefinition variableDefinition = layoutDefinition.getParent().getVariable(argumentValue);
					if (variableDefinition != null)
						return variableDefinition.getMaximumUploadSizeMode();
				}
				else
				{
					// in dasboard has only view definition
					IViewDefinition definition = dataView.getDefinition();
					VariableDefinition variableDefinition = definition.getVariable(argumentValue);
					if (variableDefinition != null)
						return variableDefinition.getMaximumUploadSizeMode();

				}
			}

			AttributeDefinition attributeDefinition = Services.Application.getAttribute(argumentValue);
			if (attributeDefinition != null)
				return attributeDefinition.getMaximumUploadSizeMode();

			// sdt items
			if (dataView != null) {
				int index = argumentValue.indexOf(Strings.DOT);
				if (index != -1) {
					String varName = argumentValue.substring(0, index);
					String fieldSpecifier = argumentValue.substring(index + 1);
					VariableDefinition variableDefinition = null;
					if (dataView.getLayout()!=null)
					{
						variableDefinition = dataView.getLayout().getParent().getVariable(varName);
					}
					else
					{
						variableDefinition = dataView.getDefinition().getVariable(varName);
					}
					if (variableDefinition != null && variableDefinition.getType() != null && variableDefinition.getType().equalsIgnoreCase(DataTypes.SDT))
					{
						StructureDataType sdt = Services.Application.getSDT(variableDefinition.getName());
						if (sdt != null)
						{
							DataItem item = sdt.getItem(fieldSpecifier);
							if (item != null)
								return item.getMaximumUploadSizeMode();
						}
					}
				}
			}
		}
		return ImageUploadModes.ACTUALSIZE; // It will use the other since it chooses the smaller
	}

	@Override
	public boolean catchOnActivityResult()
	{
		return isReportObject;
	}

	@Override
	public ActionResult afterActivityResult(int requestCode, int resultCode, Intent result)
	{
		if (requestCode == com.artech.activities.BTDeviceList.REQUEST_CONNECT_BT) {
			if (resultCode == Activity.RESULT_OK) {
				// guardar selected printer
				BluetoothDevice btDevice = BTDeviceList.getBTDevice();
				if (btDevice != null) {
					ActionDefinition definition = getDefinition();
					GxObjectDefinition actionObject = Services.Application.getGxObject(definition.getGxObject());
					IApplicationServer server = getApplicationServer(actionObject);
					mOutput = runGxObject( this, gxObject, actionObject, definition, getParameters());
					return mOutput.isOk()? ActionResult.SUCCESS_CONTINUE:ActionResult.FAILURE;
				}

			}
			else
            {
				// cancelar call a proc.
				return ActionResult.FAILURE;
			}
		}
		return ActionResult.SUCCESS_CONTINUE;
	}



	private static int sWorkingCount = 0;
	private static final Object WORKING_LOCK = new Object();

	public static boolean isWorking()
	{
		synchronized (WORKING_LOCK) { return (sWorkingCount > 0); }
	}

	private static void beginWorking()
	{
		synchronized (WORKING_LOCK) { sWorkingCount++; }
	}

	private static void endWorking()
	{
		synchronized (WORKING_LOCK) { sWorkingCount--; }
	}


	/**
	 * Calls a GeneXus object on the server and returns its result.
	 * Receives definition and parameters
	 * Return the output as PropertiesObject.
	 */
	public static PropertiesObject runGxObjectFromProcedure(String objectToCall, PropertiesObject parameters)
	{
		GxObjectDefinition gxObjectDefinition = Services.Application.getGxObject(objectToCall);
		IApplicationServer server = MyApplication.getApplicationServer(Connectivity.Online);
		IGxObject gxObject = server.getGxObject(objectToCall);


		// get parameters definition for call this procedure
		List<ObjectParameterDefinition> actionParameters = gxObjectDefinition.getParameters();

		// Prepare input parameters.
		ResultDetail<PropertiesObject> prepareResult = prepareCallParametersFromProcedure(server, gxObjectDefinition, parameters);
		if (!prepareResult.getResult())
			return null; // if fails return null, caller should ignore result

		// Call object.
		PropertiesObject callParameters = prepareResult.getData();
		OutputResult result = gxObject.execute(callParameters);

		if (result.isOk())
		{
			// out are read with it index in out parameters , start in 1
			int count =1;
			PropertiesObject outParamteres = new PropertiesObject();

			StructureDefinition def = gxObjectDefinition.getParametersStructure();
			Entity parameterEntity = new Entity(def);

			// Read output parameters.
			for (int index = 0; index < gxObjectDefinition.getParameters().size(); index++)
			{
				ObjectParameterDefinition procParameter = gxObjectDefinition.getParameter(index);
				if (procParameter.isOutput())
				{
					// Read result parameter from object.
					Object outValue = callParameters.getProperty(procParameter.getName());

					// convert using parameter entity to get the correct type.
					parameterEntity.setProperty(procParameter.getName(),outValue );

					outParamteres.setProperty( String.valueOf(count).toString(), parameterEntity.getProperty(procParameter.getName()));
					count++;

				}
			}
			return outParamteres;
		}
		return null; // if fails return null, caller should ignore result
	}

	public static ResultDetail<PropertiesObject> prepareCallParametersFromProcedure(IApplicationServer server, GxObjectDefinition gxObjectDefinition, PropertiesObject from)
	{
		PropertiesObject callParameters = new PropertiesObject();
		ResultDetail<Void> blobUploadError = null;

		if (gxObjectDefinition != null)
		{
			// input parameter como with it index in all parameters
			List<ObjectParameterDefinition> arguments = gxObjectDefinition.getParameters();
			for (int index = 0; index < arguments.size() && index < gxObjectDefinition.getParameters().size(); index++)
			{
				ObjectParameterDefinition parameter = gxObjectDefinition.getParameters().get(index);
				if (parameter.isInput())
				{
					// value in numeric array index
					Object value = ActionParametersHelper.getParameterValueFromEntity(from, String.valueOf(index).toString());

					// if value is LinkedList convert to EntityList
					//this is for the tojson works ok later. need a basecollection
					// Just create a new wrapper EntityList if an unsupported List type arrives.
					// TODO: Remove this when generator creates an EntityList.
					if (value instanceof List<?>)
					{
						List<?> otherList = (List<?>)value;

						// Check for first item of correct type, assume all others match too.
						// list of Entities of the same type / definition
						if (otherList.size() == 0 || otherList.get(0) instanceof Entity)
							value = new EntityList((Iterable<Entity>)otherList, ((Entity)otherList.get(0)).getDefinition());
					}

					// set values in parameters names to call procedure
					callParameters.setProperty(parameter.getName(), value);

					//int maxUploadSizeModeControlOrData = getMaxUploadSizeModeControlOrData(actionContext, arguments.get(index));
					int maxUploadSizeModeControlOrData = ImageUploadModes.LARGE;
					int maxUploadSizeModeCalled = parameter.getMaximumUploadSizeMode();
					int maxUploadSizeMode = ImageUploadModes.resolveModeForUpload(maxUploadSizeModeControlOrData, maxUploadSizeModeCalled);

					// Upload any blobs in object parameters
					ResultDetail<Void> uploadResult = BCMethodHandler.uploadBlobsFromContainer(server, maxUploadSizeMode, callParameters, parameter);
					if (blobUploadError == null && !uploadResult.getResult())
						blobUploadError = uploadResult; // Continue, but remember the error and return it at the end.
				}
			}
		}

		if (blobUploadError == null)
			return ResultDetail.ok(callParameters);
		else
			return ResultDetail.error(blobUploadError.getMessage(), callParameters);
	}

}
