// Filename: UpdateReceipt.cpp
//
// Description: Implementation of CUpdateReceipt
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

#include "stdafx.h"
#include "Account.h"
#include "UpdateReceipt.h"

#include <mtx.h>


#include <oramts.h>
#include <oci.h>               
#include "oramisc.h"
#define OMTS_UPDATE_STM  "Update Receipt set NextReceipt = NextReceipt + 100"
#define OMTS_SELECT_STM  "SELECT NextReceipt FROM Receipt"
#define OMTS_MSG_OVERDRAWN _T("Error. Account %ld would be overdrawn by %ld.  Balance is still %ld.")
#define OMTS_MSG_NOACCOUNT _T("Error. Account %ld not on file.")
#define OMTS_MSG_LOGONTODB _T("Error. Connect to Oracle failed - %ld.") 
#define OMTS_MSG_HNDLALLOC _T("Error. OCI handle allocation failed.")
#define OMTS_MSG_UPDATFAIL _T("Error. Receipt update failed. %s.")
#define OMTS_MSG_RFRSHFAIL _T("Error. Receipt refresh failed. %s.")
#define OMTS_MSG_OPERSUCCS _T("%s account %ld, balance is $%ld. (VC++)")

/////////////////////////////////////////////////////////////////////////////
//

STDMETHODIMP CUpdateReceipt::InterfaceSupportsErrorInfo(REFIID riid)
{
	static const IID* arr[] = 
	{
		&IID_IUpdateReceipt,
	};
	
	for (int i=0;i<sizeof(arr)/sizeof(arr[0]);i++)
	{
		if (IsEqualGUID((REFGUID)IID_IUpdateReceipt,riid))
			return S_OK;
	}
	return S_FALSE;
}

//	Update: update the database next receipt number when 100 receipts have been issued by GetReceipt
//
//	returns: S_OK or E_FAIL

STDMETHODIMP CUpdateReceipt::Update (OUT long* plReceiptNo) {
	
	HRESULT hr = S_OK;

	IObjectContext* pObjectContext = NULL;

	OCISvcCtx	*hOCISvc = NULL;
	OCIError	*hOCIErr = NULL;
	OCIStmt		*hOCIStm = NULL;
	OCIEnv		*hOCIEnv = NULL;
	OCIDefine   *hOCIDef = NULL;
	ub4			ub4Receipt = 0;
	TCHAR		szBuffer [512],
				szBuffer1[512];
	TCHAR*		pErrMsg = NULL;
	DWORD       dwErr;
	long		lErrFlag = 0;
	sword		swStat;

	*plReceiptNo = 0;

	try
	{
		// First of all, get the object context
		THROW_ERR ( GetObjectContext(&pObjectContext), "GetObjectContext" );
		// obtain a connection to the Oracle database of interest
		if (dwErr = OraMTSSvcGet(
									OMTS_ORA_USER, OMTS_ORA_PSWD, OMTS_ORA_DBNM,
									&hOCISvc,&hOCIEnv,
									ORAMTS_CFLG_ALLDEFAULT			
								) != ORAMTSERR_NOERROR)
		{
			// throw an error here
			wsprintf(szBuffer, OMTS_MSG_LOGONTODB, dwErr);
			THROW_STR (szBuffer);
		}
		// allocate the relevant OCI handles
		OMTS_ALLOCHANDLES(hOCIEnv,hOCIErr,hOCIStm,OMTS_MSG_HNDLALLOC)
		// Update the account balance and then check to see if account would be 
		// overdrawn		
		if (
			((swStat = OCIStmtPrepare(
										hOCIStm, hOCIErr,
										(text*)OMTS_UPDATE_STM, 
										lstrlenA(OMTS_UPDATE_STM),
										OCI_NTV_SYNTAX, OCI_DEFAULT
									 )) != OCI_SUCCESS) ||
			((swStat = OCIStmtExecute(
										hOCISvc, hOCIStm, hOCIErr,
										1,0,
										NULL,NULL,
										OCI_DEFAULT
									 )) != OCI_SUCCESS)
		   )
		{
			// throw an error here
			sb4   sb4Code;
			GetOCIErrorText(
							swStat, hOCIErr, 
							(TCHAR*)&szBuffer1,sizeof(szBuffer1)/sizeof(TCHAR),
							&sb4Code);
			wsprintf (szBuffer, OMTS_MSG_UPDATFAIL, szBuffer1);		
			THROW_STR ( szBuffer );
		}		
		if (
			((swStat = OCIStmtPrepare(
										hOCIStm, hOCIErr,
										(text*)OMTS_SELECT_STM, 
										lstrlenA(OMTS_SELECT_STM),
										OCI_NTV_SYNTAX, OCI_DEFAULT
									 )) != OCI_SUCCESS) ||
			((swStat = OCIDefineByPos(
										hOCIStm, &hOCIDef, hOCIErr, 
										1, 
										&ub4Receipt, 
										sizeof(ub4Receipt), 
										SQLT_INT,
										NULL, NULL, NULL,
										OCI_DEFAULT
									)) != OCI_SUCCESS) ||
			((swStat = OCIStmtExecute(
										hOCISvc, hOCIStm, hOCIErr,
										1,0,
										NULL,NULL,
										OCI_DEFAULT
			                         )) != OCI_SUCCESS)
		   )
		{
			// throw an error here
			sb4   sb4Code;
			GetOCIErrorText(
							swStat, hOCIErr, 
							(TCHAR*)&szBuffer1,sizeof(szBuffer1)/sizeof(TCHAR),
							&sb4Code);
			wsprintf (szBuffer, OMTS_MSG_RFRSHFAIL, szBuffer1);		
			THROW_STR ( szBuffer );
		}
		// free the statement handle 
		if (hOCIStm) OCIHandleFree((void*)hOCIStm, OCI_HTYPE_STMT);
		// free the error handle
		if (hOCIErr) OCIHandleFree((void*)hOCIErr, OCI_HTYPE_ERROR);
		// logoff Oracle in case we are logged on
		if (hOCISvc) OraMTSSvcRel(hOCISvc);

		// We are finished and happy
		pObjectContext->SetComplete();

		// Prepare return value
		*plReceiptNo = ub4Receipt;
		hr = S_OK;
	}
	catch (HRESULT hr) 
	{
		//
		//	ErrorInfo is saved here because the following ADO cleanup code 
		//	may clear it.
		//
		IErrorInfo * pErrorInfo = NULL;
		GetErrorInfo(NULL, &pErrorInfo);

		// free the statement handle 
		if (hOCIStm) OCIHandleFree((void*)hOCIStm, OCI_HTYPE_STMT);
		// free the error handle
		if (hOCIErr) OCIHandleFree((void*)hOCIErr, OCI_HTYPE_ERROR);
		// logoff Oracle in case we are logged on
		if (hOCISvc) OraMTSSvcRel(hOCISvc);

		// Fill in error information
		switch (lErrFlag) 
		{			
		case (0):
			// Unknown error occurred in this object
			TCHAR szErr [512];
			wsprintf (szErr, _T("Error 0x%x from CUpdateReceipt calling %s."), hr, pErrMsg);
			pErrMsg = szErr;
			// Fall through				
		case (1):
			// An application error occurred in this object
			//
			//	we are going to put our own error in TLS, so if there is one there, clear it
			//
			if (pErrorInfo) pErrorInfo -> Release();
			
			AtlReportError( CLSID_CUpdateReceipt, pErrMsg, IID_IUpdateReceipt, hr);
			break;		
		default:
			// Will never reach here
			break;
		}

		// Indicate our unhappiness
		if (pObjectContext) pObjectContext->SetAbort();
	}
	
	// Resource cleanup
	if (pObjectContext)	pObjectContext->Release();
	
	return hr;
}
