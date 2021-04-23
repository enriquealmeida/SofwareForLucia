// Filename: MoveMoney.h
//
// Description: Declaration of MoveMoney
//
// This file is provided as part of the Microsoft Transaction Server Samples
//
// THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT 
// WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, 
// INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES 
// OF MERCHANTABILITY AND/OR FITNESS FOR A  PARTICULAR 
// PURPOSE.
//
// Copyright (C) 1997 Microsoft Corporation, All rights reserved

#include "resource.h"       // main symbols

/////////////////////////////////////////////////////////////////////////////
// Account

class CMoveMoney : 
	public CComDualImpl<IMoveMoney, &IID_IMoveMoney, &LIBID_ACCOUNT>, 
	//public IDispatchImpl<IMoveMoney, &IID_IMoveMoney, &LIBID_ACCOUNT>,
	public ISupportErrorInfo,
	public CComObjectRoot,
	public CComCoClass<CMoveMoney,&CLSID_CMoveMoney>
{
public:
	CMoveMoney() {}
BEGIN_COM_MAP(CMoveMoney)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(IMoveMoney)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()
//DECLARE_NOT_AGGREGATABLE(CMoveMoney) 
// Remove the comment from the line above if you don't want your object to 
// support aggregation.  The default is to support it

DECLARE_REGISTRY_RESOURCEID(IDR_MoveMoney)
// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);

// IMoveMoney
public:
	STDMETHOD(Perform)(
		IN long lPrimeAccount,
		IN long lSecondAccount,
		IN long lAmount,
		IN long lTranType,
		OUT BSTR* pbstrResult);
};
