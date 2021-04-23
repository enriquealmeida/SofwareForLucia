# Microsoft Developer Studio Project File - Name="Account" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=Account - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "account.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "account.mak" CFG="Account - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Account - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "Account - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""$/viper97/samples/Account.VC", ZPSCAAAA"
# PROP Scc_LocalPath "."
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Account - Win32 Release"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir ".\Release"
# PROP BASE Intermediate_Dir ".\Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir ".\Release"
# PROP Intermediate_Dir ".\Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MT /W3 /GX /Zi /O2 /Ob2 /I ".\gen" /I "..\..\oci\include" /D "NDEBUG" /D "_MBCS" /D "USE_ORAMTS_WIN32_WINNT" /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /FR /c
# ADD BASE MTL /nologo /D "NDEBUG" /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /machine:I386
# ADD LINK32 odbc32.lib mtxguid.lib mtx.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib oci.lib oramts10.lib /nologo /subsystem:windows /dll /pdb:"Release/Vcacct.pdb" /machine:I386 /nodefaultlib:"msvcrt.lib" /out:"Release/Vcacct.dll" /libpath:"..\..\..\oci\lib\msvc"
# SUBTRACT LINK32 /pdb:none
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy .\release\vcacct.dll .\vcacct.dll.rel
# End Special Build Tool

!ELSEIF  "$(CFG)" == "Account - Win32 Debug"

# PROP BASE Use_MFC 1
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir ".\Debug"
# PROP BASE Intermediate_Dir ".\Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir ".\Debug"
# PROP Intermediate_Dir ".\Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_WINDLL" /D "_MBCS" /Yu"stdafx.h" /c
# ADD CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /I ".\gen" /I "..\..\oci\include" /D "_DEBUG" /D "_MBCS" /D "WIN32" /D "_WINDOWS" /D "_USRDLL" /FR /c
# ADD BASE MTL /nologo /D "_DEBUG" /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /debug /machine:I386
# ADD LINK32 odbc32.lib mtxguid.lib mtx.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib oci.lib oramts10.lib /nologo /subsystem:windows /dll /pdb:none /debug /debugtype:coff /machine:I386 /nodefaultlib:"msvcrt.lib" /out:"Debug/Vcacct.dll" /libpath:"..\..\..\oci\lib\msvc"
# Begin Special Build Tool
SOURCE="$(InputPath)"
PostBuild_Cmds=copy .\debug\vcacct.dll .\vcacct.dll.dbg
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "Account - Win32 Release"
# Name "Account - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;hpj;bat;for;f90"
# Begin Source File

SOURCE=.\Account.cpp
DEP_CPP_ACCOU=\
	".\CACCOUNT.H"\
	".\gen\Account.h"\
	".\gen\Account_i.c"\
	".\GetReceipt.h"\
	".\movemoney.h"\
	".\STDAFX.H"\
	".\UpdateReceipt.h"\
	
# End Source File
# Begin Source File

SOURCE=.\Account.def
# End Source File
# Begin Source File

SOURCE=.\Account.idl

!IF  "$(CFG)" == "Account - Win32 Release"

# PROP Intermediate_Dir ".\gen"
# PROP Ignore_Default_Tool 1
# Begin Custom Build
IntDir=.\gen
InputPath=.\Account.idl

BuildCmds= \
	midl Account.idl /out  $(IntDir)

"$(IntDir)\Account.tlb" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\Account.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\Account_i.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\Account_p.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\dlldata.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ELSEIF  "$(CFG)" == "Account - Win32 Debug"

# PROP Intermediate_Dir ".\gen"
# PROP Ignore_Default_Tool 1
# Begin Custom Build
IntDir=.\gen
InputPath=.\Account.idl

BuildCmds= \
	midl Account.idl /out $(IntDir)

"$(IntDir)\Account.tlb" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\Account.h" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\Account_i.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\account_p.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)

"$(IntDir)\dlldata.c" : $(SOURCE) "$(INTDIR)" "$(OUTDIR)"
   $(BuildCmds)
# End Custom Build

!ENDIF 

# End Source File
# Begin Source File

SOURCE=.\Account.rc
# End Source File
# Begin Source File

SOURCE=.\CAccount.cpp
DEP_CPP_CACCO=\
	".\CACCOUNT.H"\
	".\gen\Account.h"\
	".\oramisc.h"\
	".\STDAFX.H"\
	
# End Source File
# Begin Source File

SOURCE=.\CACCOUNT.RGS
# End Source File
# Begin Source File

SOURCE=.\GetReceipt.cpp
DEP_CPP_GETRE=\
	".\gen\Account.h"\
	".\GetReceipt.h"\
	".\STDAFX.H"\
	".\UpdateReceipt.h"\
	
# End Source File
# Begin Source File

SOURCE=.\MoveMoney.cpp
DEP_CPP_MOVEM=\
	".\gen\Account.h"\
	".\GetReceipt.h"\
	".\movemoney.h"\
	".\STDAFX.H"\
	
# End Source File
# Begin Source File

SOURCE=.\movemoney.rgs
# End Source File
# Begin Source File

SOURCE=.\StdAfx.cpp
DEP_CPP_STDAF=\
	".\STDAFX.H"\
	
# SUBTRACT CPP /YX /Yc
# End Source File
# Begin Source File

SOURCE=.\UpdateReceipt.cpp
DEP_CPP_UPDAT=\
	".\gen\Account.h"\
	".\oramisc.h"\
	".\STDAFX.H"\
	".\UpdateReceipt.h"\
	
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter "h;hpp;hxx;hm;inl;fi;fd"
# Begin Source File

SOURCE=.\CACCOUNT.H
# End Source File
# Begin Source File

SOURCE=.\DLLDATAX.H
# End Source File
# Begin Source File

SOURCE=.\GetReceipt.h
# End Source File
# Begin Source File

SOURCE=.\movemoney.h
# End Source File
# Begin Source File

SOURCE=.\oramisc.h
# End Source File
# Begin Source File

SOURCE=.\STDAFX.H
# End Source File
# Begin Source File

SOURCE=.\UpdateReceipt.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;cnt;rtf;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=.\updatere.bin
# End Source File
# End Group
# Begin Source File

SOURCE=.\GetReceipt.rgs
# End Source File
# Begin Source File

SOURCE=.\UpdateReceipt.rgs
# End Source File
# End Target
# End Project
