package com.artech.layers;

import java.util.List;

import com.artech.application.MyApplication;
import com.artech.base.application.IBusinessComponent;
import com.artech.base.application.OutputResult;
import com.artech.base.model.Entity;
import com.artech.base.services.IGxBusinessComponent;
import com.artech.base.services.Services;
import com.genexus.GXRuntimeException;
import com.genexus.internet.MsgList;

class LocalBusinessComponent implements IBusinessComponent
{
	private final String mName;
	private final IGxBusinessComponent mImplementation;

	public LocalBusinessComponent(String name)
	{
		mName = name;
		mImplementation = GxObjectFactory.getBusinessComponent(name);
	}

	@Override
	public void initialize(Entity entity)
	{
		if (mImplementation != null)
			mImplementation.initentity(entity);
	}

	@Override
	public OutputResult load(Entity entity, List<String> key)
	{
		if (mImplementation != null)
		{
			entity.setKey(key);
			
			LocalUtils.beginTransaction();
		
			try
			{
				mImplementation.loadbcfromkey(entity);
			}
			finally
			{
				LocalUtils.endTransaction();
			}
		
			if (mImplementation.success())
				return OutputResult.ok();
			else
				return LocalUtils.translateOutput(false, mImplementation.getmessages());
		}
		else
			return LocalUtils.outputNoImplementation(mName);
	}

	@Override
	public OutputResult save(Entity entity)
	{
		if (mImplementation != null)
		{
			LocalUtils.beginTransaction();
		
			try
			{
				mImplementation.savebcfromentity(entity);
				if (mImplementation.success())
				{
					LocalUtils.commit();
					entity.resetDirties();
				}
			}
			catch (GXRuntimeException e)
			{
				// Catch all GXRuntimeException
				// Pending definitive solution getting the correct message from the BC itself in the standards.
				MsgList mList = new MsgList();
				if (e.getTargetException()!=null)
				{
					if (e.getTargetException().getMessage().contains("error code 19: constraint failed"))
						mList.addItem("SQL constraint failed.", 1, "");
					else	
						mList.addItem(e.getTargetException().getMessage(), 1, "");
				}		
				else				
					mList.addItem(e.getMessage(), 1, "");
				return LocalUtils.translateOutput(false, mList);
			}
			finally
			{
				LocalUtils.endTransaction();
			}
			// Send BC To server in offline
			postSendBCToServer();
			return LocalUtils.translateOutput(mImplementation.success(), mImplementation.getmessages());
		}
		else
			return LocalUtils.outputNoImplementation(mName);
	}

	@Override
	public OutputResult delete()
	{
		if (mImplementation != null)
		{
			LocalUtils.beginTransaction();
			try
			{
				mImplementation.delete();
				if (mImplementation.success())
					LocalUtils.commit();
			}
			finally
			{
				LocalUtils.endTransaction();
			}
			// Send BC To server in offline
			postSendBCToServer();
			return LocalUtils.translateOutput(mImplementation.success(), mImplementation.getmessages());
		}
		else
			return LocalUtils.outputNoImplementation(mName);
	}

	@Override
	public OutputResult insert(Entity entity)
	{
		// TODO: implement real insert
		return save(entity);
	}

	@Override
	public OutputResult insertOrUpdate(Entity entity)
	{
		// TODO: implement real insertOrUpdate
		return save(entity);
	}

	public static void postSendBCToServer()
	{
		if (MyApplication.getApp().isOfflineApplication()
				&& MyApplication.getApp().getSynchronizerSendAutomatic() 
				&& Services.HttpService.isOnline()
			 	)
		{
			// if the is some pending events send them.
			Services.Log.debug("sendPendingsToServerInBackground (Sync.Send) from Post BC or post procedure call ");
			Services.Sync.sendPendingsToServerInBackground();
			//SynchronizationHelper.sendPendingsToServerDummy();
		}
	}
}
