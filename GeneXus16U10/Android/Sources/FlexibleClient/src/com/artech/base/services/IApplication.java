package com.artech.base.services;

import android.content.Intent;

import androidx.annotation.NonNull;

import com.artech.actions.UIContext;
import com.artech.base.metadata.ApplicationDefinition;
import com.artech.base.metadata.AttributeDefinition;
import com.artech.base.metadata.DomainDefinition;
import com.artech.base.metadata.GxObjectDefinition;
import com.artech.base.metadata.IDataSourceDefinition;
import com.artech.base.metadata.IDataViewDefinition;
import com.artech.base.metadata.IPatternMetadata;
import com.artech.base.metadata.IViewDefinition;
import com.artech.base.metadata.ProcedureDefinition;
import com.artech.base.metadata.StructureDataType;
import com.artech.base.metadata.StructureDefinition;
import com.artech.base.metadata.WorkWithDefinition;
import com.artech.base.metadata.loader.MetadataLoader;
import com.artech.base.metadata.settings.WorkWithSettings;
import com.artech.base.metadata.theme.ThemeDefinition;
import com.artech.base.model.Entity;
import com.artech.externalapi.ExternalApiFactory;
import com.artech.fragments.IDataView;
import com.artech.usercontrols.TableLayoutFactory;

public interface IApplication
{
	ApplicationDefinition getDefinition(); // We should remove  every put/get defined below...
	boolean isLoaded();

	// Get definitions.
	WorkWithSettings getPatternSettings();
	IPatternMetadata getPattern(String name);
	IViewDefinition getView(String name);
	WorkWithDefinition getWorkWithForBC(String bcName);
	IDataViewDefinition getDataView(String name);
	IDataSourceDefinition getDataSource(String name);
	GxObjectDefinition getGxObject(String name);
	ProcedureDefinition getProcedure(String name);
	StructureDefinition getBusinessComponent(String name);
	StructureDataType getSDT(String name);
	AttributeDefinition getAttribute(String name);
	DomainDefinition getDomain(String name);
	ThemeDefinition getTheme(String name);
	String getDeepLink(String link);

	// Set definitions.
	void setPatternSettings(WorkWithSettings settings);
	void putPattern(IPatternMetadata data, MetadataLoader loader, String filename);
	void putGxObject(GxObjectDefinition gxObject);
	void putBusinessComponent(StructureDefinition bc);
	void putSDT(StructureDataType sdt);
	void putAttribute(AttributeDefinition attribute);
	void putDomain(DomainDefinition domain);
	void putTheme(ThemeDefinition theme);
	void putDeepLink(String link, String panel);

	/*
	 * Try to handle an application Intent, traversing all registered handlers. (ie: App Indexing, App Links, etc)
	 */
	boolean handleIntent(UIContext ctx, Intent intent, Entity entity);
	/*
	 * The protocol handler for this application
	 */
	String getAppsLinksProtocol();

	/**
	 * Returns a {@link ClientStorage} object that can be used to store property values securely.
	 * @param name Storage file name.
	 */
	@NonNull ClientStorage getClientStorage(@NonNull String name);

	/**
	 * Returns whether the application is currently in the foreground (i.e. showing an activity).
	 */
	boolean isForeground();

	/**
	 * Adds a listener to be notified when the application's foreground/background state changes.
	 */
	void addForegroundListener(ForegroundListener listener);

	/**
	 * Removes a listener from the set to be notified when the application's foreground/background state changes.
	 */
	void removeForegroundListener(ForegroundListener listener);

	boolean isLiveEditingEnabled();
	void enableLiveEditingMode();

	void registerOnMetadataLoadFinished(MetadataLoadingListener listener);
	void unregisterOnMetadataLoadFinished(MetadataLoadingListener listener);

	void registerComponentEventsListener(ComponentEventsListener listener);
	void unregisterComponentEventsListener(ComponentEventsListener listener);

	ExternalApiFactory getExternalApiFactory();
	TableLayoutFactory getTableLayoutFactory();

	void clearData();
	void notifyMetadataLoadFinished();
	void notifyComponentInitialized(IDataView component);

	interface MetadataLoadingListener {
		void onMetadataLoadFinished(IApplication application);
	}

	interface ComponentEventsListener {
		void onComponentInitialized(IDataView component);
	}
}
