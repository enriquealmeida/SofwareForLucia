#ifndef _ORAMISC_H_
#define _ORAMISC_H_

#include <oci.h>

// logon information for the components
# define OMTS_ORA_USER    (text *)"scott"
# define OMTS_ORA_PSWD    (text *)"tiger"
# define OMTS_ORA_DBNM    (text *)"mtsdemo"
// common error message tags
# define OMTS_MSG_LOGONTODB _T("Error. Connect to Oracle failed - %ld.") 
# define OMTS_MSG_HNDLALLOC _T("Error. OCI handle allocation failed.")
// macro to allocate the error and statement handles from an env handle
#define OMTS_ALLOCHANDLES(a,b,c,d)  if (									\
										(OCIHandleAlloc(					\
														(void*)(a),			\
														(void**)&(b),		\
														OCI_HTYPE_ERROR,	\
														0,0					\
													   ) != OCI_SUCCESS) ||	\
										(OCIHandleAlloc(					\
														(void*)(a),			\
														(void**)&(c),		\
														OCI_HTYPE_STMT,		\
														0,0					\
													   ) != OCI_SUCCESS)	\
									  )										\
									{										\
										THROW_STR ( (d) );					\
									}		


// function to retrieve error code and 
inline void GetOCIErrorText(
							sb4			swStat, 
							OCIError	*hOCIErr, 
							TCHAR		*szBuf, 
							ub4			ub4Siz, 
							sb4			*lpCode
						   )
{
	WCHAR* wszBuf;

	if (!szBuf || !ub4Siz) return;

#ifdef UNICODE
	 // use an ASCII buffer if we are compiling with UNICODE on
	text *lpBuf = new char[ub4Siz];
#else
	text *lpBuf = (text *)szBuf;
#endif /* UNICODE */

	// if we couldn't allocate memory then return
	szBuf[0] = _T('\0');
	if (!lpBuf) return;

	// check the OCI status code and retrieve the error message 
	switch(swStat)
	{
	case OCI_SUCCESS:
		break;
	case OCI_NEED_DATA        : 
    case OCI_NO_DATA          : 
    case OCI_INVALID_HANDLE   : 
    case OCI_STILL_EXECUTING  : 
    case OCI_CONTINUE         : 
    case OCI_SUCCESS_WITH_INFO: 
    case OCI_ERROR            : 
		OCIErrorGet(
                      (dvoid *) hOCIErr, 
                      (ub4) 1, 
                      (text *) NULL, 
                      lpCode,
                      lpBuf, 
                      ub4Siz, 
                      (ub4) OCI_HTYPE_ERROR
                    );
#ifdef UNICODE
		// convert the ASCII to a wide char error message
		MultiByteToWideChar( 
								CP_ACP, 0, 
								(LPCSTR )lpBuf, -1, 
								(LPWSTR)szBuf, ub4Siz 
						   );
#endif /* UNICODE */
		break;
	default:
		break;
	}



	// call the 
#ifndef UNICODE
	wszBuf = new WCHAR [512];
	MultiByteToWideChar( CP_ACP, 0, szBuf, -1, wszBuf, 512 );
#else
	wszBuf = szBuf;
#endif
	
	BSTR bstrNew = ::SysAllocString (wszBuf);

#ifndef UNICODE
	delete [] wszBuf;
#endif

}

#endif /* _ORAMISC_H_ */