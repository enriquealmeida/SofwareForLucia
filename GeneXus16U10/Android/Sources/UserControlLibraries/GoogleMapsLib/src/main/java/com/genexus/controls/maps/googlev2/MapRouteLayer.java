package com.genexus.controls.maps.googlev2;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONException;

import android.app.Activity;
import android.os.AsyncTask;
import android.util.Pair;

import com.artech.actions.ExternalObjectEvent;
import com.artech.activities.IGxActivity;
import com.artech.application.MyApplication;
import com.artech.base.application.IProcedure;
import com.artech.base.application.OutputResult;
import com.artech.base.metadata.enums.Connectivity;
import com.artech.base.metadata.expressions.Expression;
import com.artech.base.metadata.theme.ThemeClassDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityFactory;
import com.artech.base.model.EntityList;
import com.artech.base.model.PropertiesObject;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.controls.maps.MapViewWrapper;
import com.artech.controls.maps.common.IMapLocation;
import com.artech.controls.maps.common.MapLayer;
import com.artech.ui.Coordinator;
import com.google.android.gms.maps.model.LatLng;

import androidx.annotation.NonNull;

public class MapRouteLayer
{
	private final GxMapView mMapView;

	public static final String OBJECT_NAME_MAPS = "GeneXus.Common.Maps";

	private MapLayer mMapLayer = null;

	public MapRouteLayer(GxMapView gxMapView)
	{
		mMapView = gxMapView;
	}

	public void addRouteLayer(GxMapViewData mapData, String travelMode, ThemeClassDefinition mapRouteClass, boolean zoomToLayer)
	{
		// need at least 2 point for do a route layer.
		if (mapData.getLocations().size()<=1)
		{
			Services.Log.info("cannot show Route Layer with less than 2 point");
			return;
		}

		//Define list to get all latlng for the route
		String origin = null;
		String destination = null;
		String[] waypoints = new String[mapData.getLocations().size()-2];
		int index = 0;
		for (MapLocation loc : mapData.getLocations())
		{
			// first point is origin
			if (index==0)
				origin = GeoFormats.buildGeopoint(loc.getLatitude(), loc.getLongitude());
			else
			{
				// all point inn the midlle are waypoints, last point is the destination
				if (index <= waypoints.length)
					waypoints[index-1] = GeoFormats.buildGeopoint(loc.getLatitude(), loc.getLongitude());
				else
					destination = GeoFormats.buildGeopoint(loc.getLatitude(), loc.getLongitude());
			}
			index++;
		}

		// callDirectionsBackground , do doDirectionsApiRequest and after that update map with processOutputToMap
		callDirectionsBackground(travelMode, origin, destination, waypoints, false, mapRouteClass, zoomToLayer);

	}

	public void removeRouteLayer()
	{
		if (mMapLayer!=null)
			mMapView.removeLayer(mMapLayer);

	}

	private void callDirectionsBackground(final String travelMode, final String origin, final String destination, final String[] waypoints,
										  final boolean alternatives, final ThemeClassDefinition mapRouteClass, final boolean zoomToLayer) {
		AsyncTask<Void, Void, PropertiesObject> callDirectionTask = new AsyncTask<Void, Void, PropertiesObject>() {
			@Override
			protected PropertiesObject doInBackground(Void... params)
			{
				PropertiesObject requestResult = doDirectionsApiRequest(travelMode, origin, destination, waypoints, alternatives);
				return requestResult;
			}

			@Override
			protected void onPostExecute(PropertiesObject procResult)
			{
				if (procResult!=null)
				{
					processOutputToMap(procResult, mapRouteClass, zoomToLayer);
				}
			}
		};
		callDirectionTask.executeOnExecutor(AsyncTask.THREAD_POOL_EXECUTOR);
	}

	@NonNull
	private static PropertiesObject doDirectionsApiRequest(String travelMode,
														   String origin,
														   String destination,
														   String[] waypoints,
														   Boolean alternatives)
	{
		IProcedure procedure = MyApplication.getApplicationServer(Connectivity.Online).getProcedure("DirectionsServiceRequest");

		PropertiesObject parameter = new PropertiesObject();

		String providerName = "Google";
		parameter.setProperty("DirectionsServiceProvider", providerName);

		// DirectionsRequestParameters
		Entity requestEntityParm = EntityFactory.newSdt("GeneXus.Common.DirectionsRequestParameters");
		requestEntityParm.setProperty("sourceLocation", origin);
		requestEntityParm.setProperty("destinationLocation", destination);
		// waypoints.
		requestEntityParm.setProperty("transportType", travelMode);
		requestEntityParm.setProperty("requestAlternateRoutes", alternatives);
		parameter.setProperty("DirectionsRequestParameters", requestEntityParm);

		OutputResult procResult = procedure.execute(parameter);

		if (procResult.isOk())
		{
			Services.Log.debug("DirectionsServiceRequest result ok");
			// read result
			String result =  parameter.optStringProperty("Routes");
			Services.Log.debug("Routes: " + result);

			String resultError =  parameter.optStringProperty("errorMessages");
			Services.Log.debug("Error: " + resultError);

			return parameter;
		}
		else
		{
			Services.Log.error("Error calling DirectionsServiceRequest" + procResult.getErrorText());
		}

		return null;
	}

	private void processOutputToMap(PropertiesObject requestResult, ThemeClassDefinition mapRouteClass, boolean zoomToLayer)
	{
		// Handle successful request.
		List<LatLng> path = new ArrayList<LatLng>();

		String result = requestResult.optStringProperty("Routes");

		try {
			JSONArray arrayJson = new JSONArray(result);

			if (arrayJson != null && arrayJson.length() > 0) {
				JSONObject routeJson = arrayJson.getJSONObject(0);

				String geoLineString = routeJson.getString("geoline");
				List<Pair<Double, Double>> geoLine = GeoFormats.parseGeoline(geoLineString);
				for (Pair<Double, Double> coordinate : geoLine) {
					path.add(new LatLng(coordinate.first, coordinate.second));
				}
			} else {
				Services.Log.info("No route found for these points and transportation type");
			}
		}
		catch (JSONException ex)
		{
			Services.Log.info(ex.getMessage());
		}
		addPathToMap(mapRouteClass, path, zoomToLayer);

	}

	private void addPathToMap(ThemeClassDefinition mapRouteClass, List<LatLng> path, boolean zoomToLayer)
	{
		MapLayer mapLayer = new MapLayer();

		MapLayer.Polyline polyline = new MapLayer.Polyline();
		// add the result path to the polyline.
		polyline.points.addAll(newMapLocationList(path));

		// apply the class to this polyline
		MapViewWrapper.applyClassToPolyline(polyline, mapRouteClass);

		mapLayer.features.add(polyline);

		Runnable taskAddLayer = () ->
		{
			mMapView.addLayer(mapLayer);
			if (zoomToLayer)
				mMapView.adjustBoundsToLayer(mapLayer);
		};
		//Draw the polyline on map, ui change
		Services.Device.runOnUiThread(taskAddLayer);
		mMapLayer = mapLayer;

	}

	private List<IMapLocation> newMapLocationList(List<LatLng> path)
	{
		ArrayList<IMapLocation> list = new ArrayList<IMapLocation>();

		for (LatLng coordinate : path)
			list.add(newMapLocation(coordinate));

		return list;
	}

	private IMapLocation newMapLocation(LatLng data)
	{
		return new MapLocation(data.latitude, data.longitude);
	}

	// For Maps Api
	public static void calculateRoute(Activity activity, String origin,
									  String destination,
									  String travelMode,
									  boolean requestAlternativeRoutes )
	{

		PropertiesObject requestResult = doDirectionsApiRequest(travelMode, origin, destination, null, requestAlternativeRoutes);

		if (requestResult!=null) {
			// process result.
			handleResult(activity, requestResult, travelMode);
		}

	}

	private static void handleResult(@NonNull Activity activity, PropertiesObject requestResult, String travelMode) {

		// get the data form the services and copy to route SDT
		EntityList routes = new EntityList();
		routes.setItemType(Expression.Type.SDT);
		EntityList errors = new EntityList();
		errors.setItemType(Expression.Type.SDT);

		// Load routes
		String resultRoutes = requestResult.optStringProperty("Routes");

		try {
			JSONArray arrayRoutesJson = new JSONArray(resultRoutes);
			if (arrayRoutesJson != null && arrayRoutesJson.length() > 0) {
				JSONObject routeJson = arrayRoutesJson.getJSONObject(0);
				String summary = routeJson.getString("name");
				String distanceInMeters = routeJson.getString("distance");
				String durationInSeconds = routeJson.getString("expectedTravelTime");
				String geoLineString = routeJson.getString("geoline");

				routes.add(routeToEntity(summary, distanceInMeters, durationInSeconds, travelMode, geoLineString));
				Services.Log.debug("route1 sdt : " + routes.toString());
			} else {
				Services.Log.info("No route found for these points and transportation type");
				errors.add(messageToEntity("No route found for these points and transportation type", 1));
			}

			// load messages
			String message = requestResult.optStringProperty("errorMessages");
			JSONArray arrayMessageJson = new JSONArray(message);

			if (arrayMessageJson != null && arrayMessageJson.length() > 0) {
				JSONObject messageJson = arrayMessageJson.getJSONObject(0);
				int type = messageJson.getInt("Type");
				String description = messageJson.getString("Description");

				errors.add(messageToEntity(description, type));
			}
		}
		catch (JSONException ex)
		{
			Services.Log.error(ex.getMessage());
		}

		// fire events
		ExternalObjectEvent event = new ExternalObjectEvent(OBJECT_NAME_MAPS, "DirectionsCalculated");

		// sent result to context activity, to the coordinator where the event is defined.
		Coordinator coordinator = null;
		if (activity instanceof IGxActivity )
			coordinator = event.getFormCoordinatorForEvent((IGxActivity)activity);

		// raise DirectionsCalculated event with route SDT loaded
		event.fire(Arrays.asList(routes, errors), coordinator, null );
	}

	private static Entity routeToEntity(String summary, String distanceInMeters, String durationInSeconds, String travelMode, String geoline)
	{
		Entity entity = EntityFactory.newSdt("GeneXus.Common.Route");
		entity.setProperty("name", summary);
		entity.setProperty("distance", distanceInMeters);
		entity.setProperty("expectedTravelTime", durationInSeconds);
		entity.setProperty("transportType", travelMode);
		entity.setProperty("geoline", geoline);

		return entity;
	}

	private static Entity messageToEntity(String message, int typeMsg)
	{
		Entity entity = EntityFactory.newSdt("GeneXus.Common.Messages");
		entity.setProperty("Type", typeMsg);
		entity.setProperty("Description", message);

		return entity;
	}

}
