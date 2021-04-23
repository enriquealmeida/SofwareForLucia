package com.genexus.printer;

import com.artech.actions.ApiAction;
import com.artech.externalapi.ExternalApi;
import com.artech.externalapi.ExternalApiResult;

public class PrinterAPI extends ExternalApi {
    public static final String OBJECT_NAME = "GeneXus.SD.Printer";

    // API Method Names
    private static final String PROPERTY_PRINTER_NAME = "PrinterName";
    private static final String PROPERTY_DPI = "DPI";
    private static final String PROPERTY_WIDTH = "Width";
    private static final String VALUE_ROTATION_NO = "0";
    private static final String VALUE_ROTATION_LEFT = "1";
    private static final String VALUE_ROTATION_RIGHT = "2";
    private static final String METHOD_GET_DEVICES = "GetDevices";
    private static final String METHOD_PRINT = "Print";
    private static final String METHOD_CUT_PAPER = "CutPaper";

    private static Printer sPrinter = new Printer();

    public PrinterAPI(ApiAction action) {
        super(action);
        addPropertyHandler(PROPERTY_PRINTER_NAME, mGetPrinterNameProperty, mSetPrinterNameProperty);
        addPropertyHandler(PROPERTY_DPI, mGetDpiProperty, mSetDpiProperty);
        addPropertyHandler(PROPERTY_WIDTH, mGetWidthProperty, mSetWidthProperty);
        addMethodHandler(METHOD_GET_DEVICES, 0, mGetDevicesMethod);
        addMethodHandler(METHOD_PRINT, 1, mPrintMethod);
        addMethodHandler(METHOD_PRINT, 2, mPrintMethod);
        addMethodHandler(METHOD_CUT_PAPER, 1, mCutPaperMethod);
    }

    private final IMethodInvoker mGetPrinterNameProperty = parameters ->
		ExternalApiResult.success(sPrinter.getName());

    private final IMethodInvoker mSetPrinterNameProperty = parameters -> {
        sPrinter.setName((String)parameters.get(0));
        return ExternalApiResult.SUCCESS_CONTINUE;
    };

    private final IMethodInvoker mGetDpiProperty = parameters ->
		ExternalApiResult.success(sPrinter.getDpi());

    private final IMethodInvoker mSetDpiProperty = parameters -> {
        String dpi = (String)parameters.get(0);
        sPrinter.setDpi(Integer.parseInt(dpi));
        return ExternalApiResult.SUCCESS_CONTINUE;
    };

    private final IMethodInvoker mGetWidthProperty = parameters ->
		ExternalApiResult.success(sPrinter.getWidth());

    private final IMethodInvoker mSetWidthProperty = parameters -> {
        String width = (String)parameters.get(0);
        sPrinter.setWidth(Integer.parseInt(width));
        return ExternalApiResult.SUCCESS_CONTINUE;
    };

    private Printer.Rotation getRotationEnum(String rotation)
    {
        switch (rotation)
        {
            case VALUE_ROTATION_NO:
            default:
                return Printer.Rotation.No;
            case VALUE_ROTATION_LEFT:
                return Printer.Rotation.Left;
            case VALUE_ROTATION_RIGHT:
                return Printer.Rotation.Right;
        }
    }

    private final IMethodInvoker mGetDevicesMethod = parameters ->
		ExternalApiResult.success(sPrinter.getDevices());

    private final IMethodInvoker mPrintMethod = parameters -> {
        String filePath = (String)parameters.get(0);
        String rotation = parameters.size() > 1 ? (String)parameters.get(1) : VALUE_ROTATION_NO;
        sPrinter.print(filePath, getRotationEnum(rotation));
        return ExternalApiResult.SUCCESS_CONTINUE;
    };

    private final IMethodInvoker mCutPaperMethod = parameters -> {
        sPrinter.cutPaper();
        return ExternalApiResult.SUCCESS_CONTINUE;
    };
}
