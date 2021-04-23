// Filename: CAccount.cpp
//
// Description: Implementation of CAccount
//
// This file is provided as part of the Microsoft Transaction Server
// Software Development Kit
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
#include "CAccount.h"
#include <stdio.h>

#include <mtx.h>

#include <oramts.h>
#include <oci.h>               
#include "oramisc.h"
#define OMTS_UPDATE_STM  "UPDATE Account SET Balance = Balance + %li WHERE AccountNo = %li"
#define OMTS_SELECT_STM  "SELECT Balance FROM Account WHERE AccountNo = %ld"
#define OMTS_MSG_OVERDRAWN _T("Error. Account %ld would be overdrawn by %ld. Balance is still %ld.")
#define OMTS_MSG_NOACCOUNT _T("Error. Account %ld not on file.")
#define OMTS_MSG_UPDATFAIL _T("Error. Account update failed. %s.")
#define OMTS_MSG_BALANFAIL _T("Error. Account balance verification failed. %s.")
#define OMTS_MSG_OPERSUCCS _T("%s account %ld, balance is $%ld. (VC++)")

/////////////////////////////////////////////////////////////////////////////
//

STDMETHODIMP CAccount::InterfaceSupportsErrorInfo(REFIID riid)
{
	static const IID* arr[] = 
	{
		&IID_IAccount,
	};
	
	for (int i=0;i<sizeof(arr)/sizeof(arr[0]);i++)
	{
		if (IsEqualGUID((REFGUID)IID_IAccount,(REFGUID)riid))
			return S_OK;
	}    
	return S_FALSE;
}

//	Post: modifies the specified account by the specified amount
//
//	pbstrResult: a BSTR giving information.  NOTE: this is set to NULL when an error occurs
//
//	returns:  S_OK or E_FAIL

STDMETHODIMP CAccount::Post (IN long lAccount, IN long lAmount, OUT BSTR* pbstrResult) 
{

	HRESULT hr = S_OK;

	IObjectContext* pObjectContext = NULL;

	OCISvcCtx	*hOCISvc = NULL;
	OCIError	*hOCIErr = NULL;
	OCIStmt		*hOCIStm = NULL;
	OCIEnv		*hOCIEnv = NULL;
	OCIDefine   *hOCIDef = NULL;
	sb4			sb4Balance = 0;
	TCHAR		szBuffer [512],
				szBuffer1[512];
	TCHAR*		pErrMsg = NULL;
	char        szStmt[MAX_PATH+1];
	DWORD       dwErr;
	long		lErrFlag = 0;
	sword		swStat;

	*pbstrResult = NULL;

	try {

		// Get our object context
		THROW_ERR (GetObjectContext(&pObjectContext), "GetObjectContext" );
		
		// Check security for large transfers
		if (lAmount > 500 || lAmount < -500) 
		{
			BOOL bInRole;
			BSTR bstrRole;
			
			bstrRole = ::SysAllocString(L"Managers");
			hr = pObjectContext->IsCallerInRole (bstrRole, &bInRole);
			::SysFreeString(bstrRole);
			
			if (!SUCCEEDED ( hr )) 
			{
				THROW_STR ( _T("IsCallerInRole() call failed!  Please add the 'Managers' Roll to the package."));
			}
			
			if (!bInRole) 
			{
				THROW_STR ( _T("Need 'Managers' role for amounts over $500") );
			}
		}				
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
		wsprintfA(szStmt, OMTS_UPDATE_STM, lAmount, lAccount);
		if (
			((swStat = OCIStmtPrepare(
										hOCIStm, hOCIErr,
										(text*)szStmt, lstrlenA(szStmt),
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
		// verify the balance first to check if it will be overdrawn
		wsprintfA(szStmt, OMTS_SELECT_STM, lAccount);
		if (
			((swStat = OCIStmtPrepare(
										hOCIStm, hOCIErr,
										(text*)szStmt, lstrlenA(szStmt),
										OCI_NTV_SYNTAX, OCI_DEFAULT
									 )) != OCI_SUCCESS) ||
			((swStat = OCIDefineByPos(
										hOCIStm, &hOCIDef, hOCIErr, 
										1, 
										&sb4Balance, 
										sizeof(sb4Balance), 
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
			wsprintf (szBuffer, OMTS_MSG_BALANFAIL, szBuffer1);		
			THROW_STR ( szBuffer );
		}
		else if (sb4Balance < 0)
		{
			// throw an error here -- account will be overdrawn
			wsprintf (
					  szBuffer,OMTS_MSG_OVERDRAWN ,
					  lAccount, sb4Balance, sb4Balance - lAmount
					 );	
			THROW_STR ( szBuffer );
		}
		// free the statement handle 
		if (hOCIStm) OCIHandleFree((void*)hOCIStm, OCI_HTYPE_STMT);
		// free the error handle
		if (hOCIErr) OCIHandleFree((void*)hOCIErr, OCI_HTYPE_ERROR);
		// logoff Oracle in case we are logged on
		if (hOCISvc) OraMTSSvcRel(hOCISvc);
		// create a success message
		wsprintf(
				  szBuffer, OMTS_MSG_OPERSUCCS,
				  ((lAmount >= 0) ? _T("Credit to") : _T("Debit from")), 
				  lAccount, sb4Balance
				);
		*pbstrResult = TCHAR2BSTR (szBuffer);

		// We are finished and happy
		pObjectContext->SetComplete();

	}
	catch(HRESULT hr)
	{
		IErrorInfo * pErrorInfo = NULL;
		GetErrorInfo(NULL, &pErrorInfo);

		// free the statement handle 
		if (hOCIStm) OCIHandleFree((void*)hOCIStm, OCI_HTYPE_STMT);
		// free the error handle
		if (hOCIErr) OCIHandleFree((void*)hOCIErr, OCI_HTYPE_ERROR);
		// logoff Oracle in case we are logged on
		if (hOCISvc) OraMTSSvcRel(hOCISvc);
		// Indicate our unhappiness
		if (pObjectContext) pObjectContext->SetAbort();
		// Fill in error information
		switch (lErrFlag) 
		{					
		case (0):
			// Unknown error occurred in this object
			TCHAR szErr [512];
			wsprintf (szErr, _T("Error 0x%x from CAccount calling %s."), hr, pErrMsg);
			pErrMsg = szErr;
			// Fall through						
		case (1):
			// An application error occurred in this object
			//
			//	we are going to put our own error in TLS, so if there is one there, clear it
			//
			if (pErrorInfo)
				pErrorInfo -> Release();
			
			AtlReportError( CLSID_CAccount, pErrMsg, IID_IAccount, hr);
			break;
			// Will never reach here
		default:			
			break;
		}
	}

	// release the object context 
	if (pObjectContext)	pObjectContext->Release();

	return hr;
}
