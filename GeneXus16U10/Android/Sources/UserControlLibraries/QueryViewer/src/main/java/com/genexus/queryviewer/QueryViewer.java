package com.genexus.queryviewer;


import android.annotation.SuppressLint;
import android.content.Context;
import android.view.ViewTreeObserver;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Toast;

import com.artech.application.MyApplication;
import com.artech.base.controls.IGxControlRuntime;
import com.artech.base.metadata.GenexusApplication;
import com.artech.base.metadata.expressions.Expression.Value;
import com.artech.base.metadata.layout.LayoutItemDefinition;
import com.artech.base.model.Entity;
import com.artech.base.model.EntityList;
import com.artech.base.services.Services;
import com.artech.base.services.UrlBuilder;
import com.artech.ui.Coordinator;
import com.artech.usercontrols.IGxUserControl;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class QueryViewer extends WebView implements IGxUserControl, IGxControlRuntime {

    public static final String NAME                                     = "SDQueryViewer";

    //private static final String EVENT_ON_CLICK                        = "OnClick";
    private static final String CONTROL_ID                              = "@SDQueryViewer";
    private static final String UTF8                                    = "UTF-8";
    private static final String SERVICE_NAME_NET                        = "gxqueryviewerforsd";
    private static final String SERVICE_NAME_JAVA                       = "qviewer.services.gxqueryviewerforsd";

    private static final String PROPERTY_OBJECT_NAME                    = "ObjectName";
    private static final String PROPERTY_AXES                           = "Axes";
    private static final String PROPERTY_PARAMETERS                     = "Parameters";
    private static final String PROPERTY_USE_CACHE                      = "UseCache";
    private static final String PROPERTY_TYPE                           = "Type";
    private static final String PROPERTY_CHART_TYPE                     = "ChartType";
    private static final String PROPERTY_PAGING                         = "Paging";
    private static final String PROPERTY_PAGE_SIZE                      = "PageSize";
    private static final String PROPERTY_SHOW_DATA_LABELS_IN            = "ShowDataLabelsIn";
    private static final String PROPERTY_PLOT_SERIES                    = "PlotSeries";
    private static final String PROPERTY_XAXIS_LABELS                   = "XAxisLabels";
    private static final String PROPERTY_XAXIS_INTERSECTION_AT_ZERO     = "XAxisIntersectionAtZero";
    private static final String PROPERTY_SHOW_VALUES                    = "ShowValues";
    private static final String PROPERTY_XAXIS_TITLE                    = "XAxisTitle";
    private static final String PROPERTY_YAXIS_TITLE                    = "YAxisTitle";
    private static final String PROPERTY_SHOW_DATA_AS                   = "ShowDataAs";
    private static final String PROPERTY_INCLUDE_TREND                  = "IncludeTrend";
    private static final String PROPERTY_TREND_PERIOD                   = "TrendPeriod";
    private static final String PROPERTY_REMEMBER_LAYOUT                = "RememberLayout";
    private static final String PROPERTY_LANGUAGE                       = "Language";
    private static final String PROPERTY_WIDTH                          = "Width";
    private static final String PROPERTY_HEIGHT                         = "Height";
    private static final String PROPERTY_ORIENTATION                    = "Orientation";
    private static final String PROPERTY_INCLUDE_SPARKLINE              = "IncludeSparkline";
    private static final String PROPERTY_INCLUDE_MAX_MIN                = "IncludeMaxAndMin";
    private static final String PROPERTY_THEME                          = "Theme";

    private static final String METHOD_REFRESH                          = "Refresh";

    private String mLanguage;
    private String mObjectName;
    private EntityList mAxes;
    private EntityList mParameters;
    private boolean mUseCache;
    private String mType;
    private String mChartType;
    private boolean mPaging;
    private int mPageSize;
    private String mShowDataLabelsIn;
    private String mPlotSeries;
    private String mXAxisLabels;
    private boolean mXAxisIntersectionAtZero;
    private boolean mShowValues;
    private String mXAxisTitle;
    private String mYAxisTitle;
    private String mShowDataAs;
    private boolean mIncludeTrend;
    private String mTrendPeriod;
    private boolean mRememberLayout;
    private String mWidth = "";
    private String mHeight = "";
    private String mOrientation = "";
    private boolean mIncludeSparkline;
    private boolean mIncludeMaxMin;
    private String mTheme;

    private Context mContext;
    private LayoutItemDefinition mLayoutDefinition;
    private String mServicesURL;

    public QueryViewer(Context context, Coordinator coordinator, LayoutItemDefinition definition) {
        super(context);
        mContext = context;
        mLayoutDefinition = definition;
        initializeControl();
    }

    private void initializeControl() {
        initializeWebView();
        initializeServiceURL();
        initializeProperties();

        getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override
            public void onGlobalLayout() {
                float density = getResources().getDisplayMetrics().density;
                int width = Math.round(getMeasuredWidth()/density);
                int height = Math.round(getMeasuredHeight()/density);
                if (width > 0) {
                    mWidth = String.valueOf(width); //width is ready
                    mHeight = String.valueOf(height); //height is ready
                    getViewTreeObserver().removeOnGlobalLayoutListener(this);
                    show();
                }
            }
        });
    }

    private void initializeServiceURL() {

        GenexusApplication mApplication = MyApplication.getApp();
        int mServerType = mApplication.getServerType();

        String objectName;
        if (mServerType == UrlBuilder.JAVA_SERVER)
            objectName = SERVICE_NAME_JAVA;
        else
            objectName = SERVICE_NAME_NET;

        mServicesURL = mApplication.link(objectName);

    }

    @SuppressWarnings("deprecation")
    @SuppressLint("SetJavaScriptEnabled")
    private void initializeWebView() {

        WebSettings settings = getSettings();
        settings.setLoadWithOverviewMode(true);
        settings.setUseWideViewPort(true);
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setBuiltInZoomControls(true);
        //setScrollBarStyle(WebView.SCROLLBARS_OUTSIDE_OVERLAY);
        //setScrollbarFadingEnabled(false);

        /*
        this.setWebChromeClient(new WebChromeClient() {

            @Override
            public void onProgressChanged(WebView view, int progress)
            {
                // Activities and WebViews measure progress with different scales.
                // The progress meter will automatically disappear when we reach 100%
                SherlockHelper.setProgress(, progress * 100);
            }
        });*/


        this.setWebViewClient(new WebViewClient() {

            public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
                Toast.makeText(mContext, description, Toast.LENGTH_SHORT).show();
                //Services.Log.Error("errorCode " + errorCode, " description " + description + " failingUrl " + failingUrl);
            }

            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                view.loadUrl(url);
                return true;
            }
        });

    }

    private void initializeProperties() {

        mLanguage = Services.Language.getCurrentLanguage();
        mTheme = getDefinitionProperty(PROPERTY_THEME);

        mChartType                  = getDefinitionProperty(PROPERTY_CHART_TYPE);
        mIncludeTrend               = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_INCLUDE_TREND));
        mObjectName                 = getDefinitionProperty(PROPERTY_OBJECT_NAME);
        mPageSize                   = Integer.parseInt(getDefinitionProperty(PROPERTY_PAGE_SIZE));
        mPaging                     = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_PAGING));
        mPlotSeries                 = getDefinitionProperty(PROPERTY_PLOT_SERIES);
        mRememberLayout             = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_REMEMBER_LAYOUT));
        mShowDataAs                 = getDefinitionProperty(PROPERTY_SHOW_DATA_AS);
        mShowDataLabelsIn           = getDefinitionProperty(PROPERTY_SHOW_DATA_LABELS_IN);
        mShowValues                 = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_SHOW_VALUES));
        mTrendPeriod                = getDefinitionProperty(PROPERTY_TREND_PERIOD);
        mType                       = getDefinitionProperty(PROPERTY_TYPE);
        mUseCache                   = Boolean.parseBoolean( getDefinitionProperty(PROPERTY_USE_CACHE));
        mXAxisIntersectionAtZero    = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_XAXIS_INTERSECTION_AT_ZERO));
        mXAxisLabels                = getDefinitionProperty(PROPERTY_XAXIS_LABELS);
        mXAxisTitle                 = getDefinitionProperty(PROPERTY_XAXIS_TITLE);
        mYAxisTitle                 = getDefinitionProperty(PROPERTY_YAXIS_TITLE);
        mOrientation                = getDefinitionProperty(PROPERTY_ORIENTATION);
        mIncludeSparkline           = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_INCLUDE_SPARKLINE));
        mIncludeMaxMin              = Boolean.parseBoolean(getDefinitionProperty(PROPERTY_INCLUDE_MAX_MIN));
    }

    private String getDefinitionProperty(String propertyName) {
        return mLayoutDefinition.getControlInfo().optStringProperty(CONTROL_ID + propertyName);
    }

    @Override
    public void setPropertyValue(String name, Value value) {
        if (PROPERTY_CHART_TYPE.equalsIgnoreCase(name)) {
            mChartType = value.coerceToString();
        }
        else if (PROPERTY_INCLUDE_TREND.equalsIgnoreCase(name)) {
            mIncludeTrend = value.coerceToBoolean();
        }
        else if (PROPERTY_OBJECT_NAME.equalsIgnoreCase(name)) {
            mObjectName = value.coerceToString();
        }
        else if (PROPERTY_PAGE_SIZE.equalsIgnoreCase(name)) {
            mPageSize = value.coerceToInt();
        }
        else if (PROPERTY_PAGING.equalsIgnoreCase(name)) {
            mPaging = value.coerceToBoolean();
        }
        else if (PROPERTY_PLOT_SERIES.equalsIgnoreCase(name)) {
            mPlotSeries = value.coerceToString();
        }
        else if (PROPERTY_REMEMBER_LAYOUT.equalsIgnoreCase(name)) {
            mRememberLayout = value.coerceToBoolean();
        }
        else if (PROPERTY_SHOW_DATA_AS.equalsIgnoreCase(name)) {
            mShowDataAs = value.coerceToString();
        }
        else if (PROPERTY_SHOW_DATA_LABELS_IN.equalsIgnoreCase(name)) {
            mShowDataLabelsIn = value.coerceToString();
        }
        else if (PROPERTY_SHOW_VALUES.equalsIgnoreCase(name)) {
            mShowValues = value.coerceToBoolean();
        }
        else if (PROPERTY_TREND_PERIOD.equalsIgnoreCase(name)) {
            mTrendPeriod = value.coerceToString();
        }
        else if (PROPERTY_TYPE.equalsIgnoreCase(name)) {
            mType = value.coerceToString();
        }
        else if (PROPERTY_USE_CACHE.equalsIgnoreCase(name)) {
            mUseCache = value.coerceToBoolean();
        }
        else if (PROPERTY_XAXIS_INTERSECTION_AT_ZERO.equalsIgnoreCase(name)) {
            mXAxisIntersectionAtZero = value.coerceToBoolean();
        }
        else if (PROPERTY_XAXIS_LABELS.equalsIgnoreCase(name)) {
            mXAxisLabels = value.coerceToString();
        }
        else if (PROPERTY_XAXIS_TITLE.equalsIgnoreCase(name)) {
            mXAxisTitle = value.coerceToString();
        }
        else if (PROPERTY_YAXIS_TITLE.equalsIgnoreCase(name)) {
            mYAxisTitle = value.coerceToString();
        }
        else if (PROPERTY_AXES.equalsIgnoreCase(name)) {
            EntityList list = value.coerceToEntityList();
            if (list != null)
                mAxes = list;
            else
                Services.Log.error("Error: Invalid value for Axes property");
        }
        else if (PROPERTY_PARAMETERS.equalsIgnoreCase(name)) {
            EntityList list = value.coerceToEntityList();
            if (list != null)
                mParameters = list;
            else
                Services.Log.error("Error: Invalid value for Parameters property");
        }
        else if (PROPERTY_ORIENTATION.equalsIgnoreCase(name)) {
            mOrientation = value.coerceToString();
        }
        else if (PROPERTY_INCLUDE_SPARKLINE.equalsIgnoreCase(name)) {
            mIncludeSparkline = value.coerceToBoolean();
        }
        else if (PROPERTY_INCLUDE_MAX_MIN.equalsIgnoreCase(name)) {
            mIncludeMaxMin = value.coerceToBoolean();
        }

        //showQuery();
    }

    @Override
    public Value getPropertyValue(String name) {
        if (PROPERTY_CHART_TYPE.equalsIgnoreCase(name)) {
            return Value.newString(mChartType);
        }
        else if (PROPERTY_INCLUDE_TREND.equalsIgnoreCase(name)) {
            return Value.newBoolean(mIncludeTrend);
        }
        else if (PROPERTY_OBJECT_NAME.equalsIgnoreCase(name)) {
            return Value.newString(mObjectName);
        }
        else if (PROPERTY_PAGE_SIZE.equalsIgnoreCase(name)) {
            return Value.newInteger(mPageSize);
        }
        else if (PROPERTY_PAGING.equalsIgnoreCase(name)) {
            return Value.newBoolean(mPaging);
        }
        else if (PROPERTY_PLOT_SERIES.equalsIgnoreCase(name)) {
            return Value.newString(mPlotSeries);
        }
        else if (PROPERTY_REMEMBER_LAYOUT.equalsIgnoreCase(name)) {
            return Value.newBoolean(mRememberLayout);
        }
        else if (PROPERTY_SHOW_DATA_AS.equalsIgnoreCase(name)) {
            return Value.newString(mShowDataAs);
        }
        else if (PROPERTY_SHOW_DATA_LABELS_IN.equalsIgnoreCase(name)) {
            return Value.newString(mShowDataLabelsIn);
        }
        else if (PROPERTY_SHOW_VALUES.equalsIgnoreCase(name)) {
            return Value.newBoolean(mShowValues);
        }
        else if (PROPERTY_TREND_PERIOD.equalsIgnoreCase(name)) {
            return Value.newString(mTrendPeriod);
        }
        else if (PROPERTY_TYPE.equalsIgnoreCase(name)) {
            return Value.newString(mType);
        }
        else if (PROPERTY_USE_CACHE.equalsIgnoreCase(name)) {
            return Value.newBoolean(mUseCache);
        }
        else if (PROPERTY_XAXIS_INTERSECTION_AT_ZERO.equalsIgnoreCase(name)) {
            return Value.newBoolean(mXAxisIntersectionAtZero);
        }
        else if (PROPERTY_XAXIS_LABELS.equalsIgnoreCase(name)) {
            return Value.newString(mXAxisLabels);
        }
        else if (PROPERTY_XAXIS_TITLE.equalsIgnoreCase(name)) {
            return Value.newString(mXAxisTitle);
        }
        else if (PROPERTY_YAXIS_TITLE.equalsIgnoreCase(name)) {
            return Value.newString(mYAxisTitle);
        }
        else if (PROPERTY_AXES.equalsIgnoreCase(name)) {
            return Value.newEntityList(mAxes);
        }
        else if (PROPERTY_PARAMETERS.equalsIgnoreCase(name)) {
            return Value.newEntityList(mParameters);
        }
        else if (PROPERTY_ORIENTATION.equalsIgnoreCase(name)) {
            return Value.newString(mOrientation);
        }
        else if (PROPERTY_INCLUDE_SPARKLINE.equalsIgnoreCase(name)) {
            return Value.newBoolean(mIncludeSparkline);
        }
        else if (PROPERTY_INCLUDE_MAX_MIN.equalsIgnoreCase(name)) {
            return Value.newBoolean(mIncludeMaxMin);
        }
        else {
            return null;
        }
    }

    @Override
    public Value callMethod(String name, List<Value> parameters) {
        if (METHOD_REFRESH.equalsIgnoreCase(name) && parameters.size() == 1) {
            EntityList parm = parameters.get(0).coerceToEntityList();
            if (parm != null)
                mParameters = parm;
            else
                Services.Log.error("Error: Invalid parameter for refresh method");
            show();
        }
        return null;
    }

    public void show() {
        this.postUrl(mServicesURL, getPostData());
    }

    public byte[] getPostData() {

        HashMap<String, String> params = new HashMap<>();

        params.put(PROPERTY_LANGUAGE, mLanguage);
        params.put(PROPERTY_THEME, mTheme);
        params.put(PROPERTY_OBJECT_NAME, mObjectName);
        params.put(PROPERTY_USE_CACHE, String.valueOf(mUseCache));
        params.put(PROPERTY_TYPE, mType);
        params.put(PROPERTY_CHART_TYPE, mChartType);
        params.put(PROPERTY_AXES, convertToJSON(mAxes));
        params.put(PROPERTY_PARAMETERS, convertToJSON(mParameters));
        //params.put(POST_PROPERTY_AUTORESIZE, "false");
        params.put(PROPERTY_WIDTH, mWidth);
        params.put(PROPERTY_HEIGHT, mHeight);
        params.put(PROPERTY_PAGING, String.valueOf(mPaging));
        params.put(PROPERTY_PAGE_SIZE, String.valueOf(mPageSize));
        params.put(PROPERTY_PLOT_SERIES, mPlotSeries);
        params.put(PROPERTY_INCLUDE_TREND, String.valueOf(mIncludeTrend));
        params.put(PROPERTY_REMEMBER_LAYOUT, String.valueOf(mRememberLayout));
        params.put(PROPERTY_SHOW_DATA_AS, String.valueOf(mShowDataAs));
        params.put(PROPERTY_SHOW_DATA_LABELS_IN, mShowDataLabelsIn);
        params.put(PROPERTY_TREND_PERIOD, mTrendPeriod);
        params.put(PROPERTY_XAXIS_INTERSECTION_AT_ZERO, String.valueOf(mXAxisIntersectionAtZero));
        params.put(PROPERTY_XAXIS_LABELS, mXAxisLabels);
        params.put(PROPERTY_XAXIS_TITLE, mXAxisTitle);
        params.put(PROPERTY_YAXIS_TITLE, mYAxisTitle);
        params.put(PROPERTY_SHOW_VALUES, String.valueOf(mShowValues));
        params.put(PROPERTY_ORIENTATION, mOrientation);
        params.put(PROPERTY_INCLUDE_SPARKLINE, String.valueOf(mIncludeSparkline));
        params.put(PROPERTY_INCLUDE_MAX_MIN, String.valueOf(mIncludeMaxMin));

        return getPostDataString(params).getBytes(StandardCharsets.UTF_8);
    }

    public String getPostDataString(HashMap<String, String> params) {

        StringBuilder result = new StringBuilder();
        boolean first = true;

        for (Map.Entry<String, String> entry : params.entrySet()) {

            if (first)
                first = false;
            else
                result.append("&");
            try {
                result.append(URLEncoder.encode(entry.getKey(), UTF8));
                result.append("=");
                result.append(URLEncoder.encode(entry.getValue(), UTF8));
            } catch (UnsupportedEncodingException e) {
            }

        }
        return result.toString();
    }

    public String convertToJSON(EntityList entityList) {

        StringBuilder json = new StringBuilder();

        if (entityList != null) {

            json.append("[");
            for (int i = 0; i < entityList.size(); i++) {

                Entity entity = entityList.get(i);
                json.append(entity);

                /*
                String entityName = entity.getDefinition().getName();
                if (entityName == "QueryViewerParameters"){
                    String name = (String) entity.getProperty("Name");
                    String value = (String) entity.getProperty("Value");
                    json.append("{\"Name\":\"" + name + "\", Value\":\"" + value + "\"}");
                }
                else if (entityName == "QueryViewerAxes"){

                }*/

                if (i < entityList.size()-1)
                    json.append(",");
            }
            json.append("]");
        }
        return json.toString();
    }

}
