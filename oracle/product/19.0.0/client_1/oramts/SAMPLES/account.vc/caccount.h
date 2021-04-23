// Filename: CAccount.h
//
// Description: Declaration of CAccount
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

class CAccount : 
	public CComDualImpl<IAccount, &IID_IAccount, &LIBID_ACCOUNT>, 
	//public IDispatchImpl<IAccount, &IID_IAccount, &LIBID_ACCOUNT>,
	public ISupportErrorInfo,
	public CComObjectRoot,
	public CComCoClass<CAccount,&CLSID_CAccount>
{
public:
	CAccount() {}
BEGIN_COM_MAP(CAccount)
	COM_INTERFACE_ENTRY(IDispatch)
	COM_INTERFACE_ENTRY(IAccount)
	COM_INTERFACE_ENTRY(ISupportErrorInfo)
END_COM_MAP()
//DECLARE_NOT_AGGREGATABLE(CAccount) 
// Remove the comment from the line above if you don't want your object to 
// support aggregation.  The default is to support it

DECLARE_REGISTRY_RESOURCEID(IDR_Account)
// ISupportsErrorInfo
	STDMETHOD(InterfaceSupportsErrorInfo)(REFIID riid);

// IAccount
public:
	STDMETHOD(Post)(
		IN long lAccount,
		IN long lAmount,
		OUT BSTR* pbstrResult);
};
