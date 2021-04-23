package com.artech.controls;

import android.content.Context;

import com.artech.base.metadata.enums.ImageScaleType;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.services.Services;
import com.artech.base.utils.GeoFormats;
import com.artech.base.utils.Strings;
import com.artech.controls.maps.Maps;
import com.artech.ui.Coordinator;

public class GxSDGeoLocation extends GxImageViewData implements IHandleSemanticDomain
{
	private final LayoutItemDefinition mDefinition;
	private String mMapType = Strings.EMPTY;
	private String mValue;
	private final Coordinator mCoordinator;

	public GxSDGeoLocation(Context context, Coordinator coordinator, LayoutItemDefinition def)
	{
		super(context, def);
		mDefinition = def;
		mCoordinator = coordinator;

		mMapType = Strings.toLowerCase(def.getControlInfo().optStringProperty("@SDGeoLocationMapType"));
	}

	@Override
	public String getGxValue()
	{
		return mValue;
	}

	@Override
	public void setGxValue(String value)
	{
		mValue = value;
		setImageScaleType(ImageScaleType.FIT);
		loadMapImage(false);
	}

	@Override
	protected void onLayout(boolean changed, int left, int top, int right, int bottom)
	{
		super.onLayout(changed, left, top, right, bottom);
		if (!Services.Application.isLiveEditingEnabled()) {
			// Disable loading the map on every layout since it creates an infinite loop when using LiveInspector's
			// Auto-Refresh (since it uses onGlobalLayoutChange callback to detect changes).
			loadMapImage(true);
		}
	}

    private void loadMapImage(final boolean isInLayoutPass)
    {
    	if (mValue == null)
    		return;
    	
        int width = getWidth();
        int height = getHeight();

        boolean isFullyWrapContent = getLayoutParams() != null &&
                getLayoutParams().height == LayoutParams.WRAP_CONTENT &&
                getLayoutParams().width == LayoutParams.WRAP_CONTENT;

        if (width == 0 && height == 0 && !isFullyWrapContent)
            return;

        if (width == 0)
        	width = ((com.artech.base.metadata.layout.CellDefinition) mDefinition.getParent()).getAbsoluteWidth();

        if (height == 0)
        	height = ((com.artech.base.metadata.layout.CellDefinition) mDefinition.getParent()).getAbsoluteHeight();

		Integer zoomInteger = null;
		String zoomString = (String)mDefinition.getControlInfo().getProperty("@SDGeoLocationMapZoom");
		if (zoomString != null)
        	zoomInteger = Integer.parseInt(zoomString);
        int zoom = zoomInteger == null ? 15 : zoomInteger.intValue(); // 15 was the old value used in zoom

		String geolocation = GeoFormats.convertToInternal(mValue, mDefinition.getDataItem());
		String requestMapUri = Maps.getMapImageUrl(getContext(), geolocation, width, height, mMapType, zoom);
		if (requestMapUri != null)
			super.setGxValue(requestMapUri);
    }

	@Override
	public IGxEdit getViewControl() { return this; }

	@Override
	public IGxEdit getEditControl()
	{
		GxLocationEdit edit = new GxLocationEdit(getContext(), mCoordinator, mDefinition);
		edit.setShowMap(true);
		return edit;
	}
}
