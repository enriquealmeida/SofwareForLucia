package com.artech.base.metadata;

import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.model.PropertiesObject;
import com.artech.base.serialization.INodeObject;
import com.artech.base.services.Services;
import com.artech.base.synchronization.SynchronizationHelper.DataSyncCriteria;
import com.artech.base.synchronization.SynchronizationHelper.LocalChangesProcessing;
import com.artech.base.utils.Version;

public class InstanceProperties extends PropertiesObject
{
	private static final long SERIAL_VERSION_UID = 1L;
	private static final String SECURITY_NONE = "SecurityNone";

	private Version mVersion;

	@Override
	public void deserialize(INodeObject obj)
	{
		super.deserialize(obj);
		mVersion = new Version(obj.optString("@Version"));
	}

	@Override
	public Object getProperty(String name)
	{
		// Check both with and without '@'.
		Object value = super.getProperty(name);
		if (value == null)
		{
			if (name.startsWith("@"))
				name = name.substring(1);
			else
				name = "@" + name;

			value = super.getProperty(name);
		}

		return value;
	}

	public String getIntegratedSecurityLevel()
	{
		return optStringProperty("@IntegratedSecurityLevel");
	}

	public boolean notSecureInstance()
	{
		return getIntegratedSecurityLevel().equalsIgnoreCase(SECURITY_NONE);
	}

	public Version getDefinitionVersion()
	{
		return mVersion;
	}

	public Connectivity getConnectivitySupport()
	{
		String connectivity = optStringProperty("@idConnectivitySupport");
		if (Services.Strings.hasValue(connectivity)) {
			if (connectivity.equalsIgnoreCase("idOffline")) {
				return Connectivity.Offline;
			} else if (connectivity.equalsIgnoreCase("idInherit")) {
				return Connectivity.Inherit;
			}
		}
		return Connectivity.Online;
	}

	public boolean getShowLogoutButton() {
		return getBooleanProperty("@IntegratedSecurityShowLogoutButton", true);
	}

	public String getSynchronizer() {
		return MetadataLoader.getAttributeName( optStringProperty("@Synchronizer"));
	}

	public DataSyncCriteria getSynchronizerDataSyncCriteria()
	{
		String dataSyncCriteria = optStringProperty("@idDataSyncCriteria");
		if (Services.Strings.hasValue(dataSyncCriteria)) {
			if (dataSyncCriteria.equalsIgnoreCase("idAutomatic")) {
				return DataSyncCriteria.Automatic;
			} else if (dataSyncCriteria.equalsIgnoreCase("OnAppLaunch")) {
				return DataSyncCriteria.Automatic;
			}
			else if (dataSyncCriteria.equalsIgnoreCase("ElapsedTime")) {
				return DataSyncCriteria.AfterElapsedTime;
			}
			else if (dataSyncCriteria.equalsIgnoreCase("idManual")) {
				return DataSyncCriteria.Manual;
			}
		}
		return DataSyncCriteria.Manual;
	}

	public long getSynchronizerMinTimeBetweenSync()
	{
		return optLongProperty("@idMinTimeBetweenSync");
	}

	public LocalChangesProcessing getSendLocalChangesProcessing()
	{
		String localChangesProcessing = optStringProperty("@LocalChangesProcessing");
		if (Services.Strings.hasValue(localChangesProcessing)) {
			if (localChangesProcessing.equalsIgnoreCase("WhenConnected")) {
				return LocalChangesProcessing.WhenConnected;
			} else if (localChangesProcessing.equalsIgnoreCase("UserDefined")) {
				return LocalChangesProcessing.UserDefined;
			} else if (localChangesProcessing.equalsIgnoreCase("Never")) {
				return LocalChangesProcessing.Never;
			}
		}
		return LocalChangesProcessing.UserDefined;
	}
	
	public long getSynchronizerMinTimeBetweenSends()
	{
		return optLongProperty("@MinTimeBetweenSends");
	}

	public long getSynchronizerTimeoutReceive()
	{
		return optLongProperty("@idSyncTimeoutReceive");
	}

	public long getSynchronizerTimeoutSend()
	{
		return optLongProperty("@idSyncTimeoutSend");
	}

}
