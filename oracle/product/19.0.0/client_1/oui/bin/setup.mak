# Microsoft Developer Studio Generated NMAKE File, Based on setup.dsp
!IF "$(CFG)" == ""
CFG=setup - Win32 Release
!MESSAGE No configuration specified. Defaulting to setup - Win32 Release.
!ENDIF 

!IF "$(CFG)" != "setup - Win32 Release" && "$(CFG)" != "setup - Win32 Debug"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "setup.mak" CFG="setup - Win32 Release"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "setup - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "setup - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 

!IF  "$(CFG)" == "setup - Win32 Release"

OUTDIR=.\Release
INTDIR=.\Release

!IF "$(RECURSE)" == "0" 

ALL : ".\setup.exe"

!ELSE 

ALL : ".\setup.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\bootstrap.obj"
	-@erase "$(INTDIR)\prereqchecks.obj"
	-@erase "$(INTDIR)\setup.obj"
	-@erase "$(INTDIR)\setup.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\w32reg.obj"
	-@erase ".\setup.exe"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /ML /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\setup.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Release/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "NDEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\setup.res" /d "NDEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\setup.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /incremental:no\
 /pdb:"$(OUTDIR)\setup.pdb" /machine:I386 /out:".\setup.exe" 
LINK32_OBJS= \
	"$(INTDIR)\bootstrap.obj" \
	"$(INTDIR)\prereqchecks.obj" \
	"$(INTDIR)\setup.obj" \
	"$(INTDIR)\setup.res" \
	"$(INTDIR)\w32reg.obj"

".\setup.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "setup - Win32 Debug"

OUTDIR=.\Debug
INTDIR=.\Debug

!IF "$(RECURSE)" == "0" 

ALL : ".\setupd.exe"

!ELSE 

ALL : ".\setupd.exe"

!ENDIF 

CLEAN :
	-@erase "$(INTDIR)\bootstrap.obj"
	-@erase "$(INTDIR)\prereqchecks.obj"
	-@erase "$(INTDIR)\setup.obj"
	-@erase "$(INTDIR)\setup.res"
	-@erase "$(INTDIR)\vc50.idb"
	-@erase "$(INTDIR)\vc50.pdb"
	-@erase "$(INTDIR)\w32reg.obj"
	-@erase "$(OUTDIR)\setupd.pdb"
	-@erase ".\setupd.exe"
	-@erase ".\setupd.ilk"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

CPP=cl.exe
CPP_PROJ=/nologo /MLd /W3 /Gm /GX /Zi /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS"\
 /Fp"$(INTDIR)\setup.pch" /YX /Fo"$(INTDIR)\\" /Fd"$(INTDIR)\\" /FD /c 
CPP_OBJS=.\Debug/
CPP_SBRS=.

.c{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_OBJS)}.obj::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.c{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cpp{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

.cxx{$(CPP_SBRS)}.sbr::
   $(CPP) @<<
   $(CPP_PROJ) $< 
<<

MTL=midl.exe
MTL_PROJ=/nologo /D "_DEBUG" /mktyplib203 /win32 
RSC=rc.exe
RSC_PROJ=/l 0x409 /fo"$(INTDIR)\setup.res" /d "_DEBUG" 
BSC32=bscmake.exe
BSC32_FLAGS=/nologo /o"$(OUTDIR)\setup.bsc" 
BSC32_SBRS= \
	
LINK32=link.exe
LINK32_FLAGS=kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib\
 advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib\
 odbccp32.lib /nologo /subsystem:windows /incremental:yes\
 /pdb:"$(OUTDIR)\setupd.pdb" /debug /machine:I386 /out:".\setupd.exe" 
LINK32_OBJS= \
	"$(INTDIR)\bootstrap.obj" \
	"$(INTDIR)\prereqchecks.obj" \
	"$(INTDIR)\setup.obj" \
	"$(INTDIR)\setup.res" \
	"$(INTDIR)\w32reg.obj"

".\setupd.exe" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 


!IF "$(CFG)" == "setup - Win32 Release" || "$(CFG)" == "setup - Win32 Debug"
SOURCE=..\..\c\bootstrap.c
DEP_CPP_BOOTS=\
	"..\..\h\setup.h"\
	

"$(INTDIR)\bootstrap.obj" : $(SOURCE) $(DEP_CPP_BOOTS) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\c\prereqchecks.c

!IF  "$(CFG)" == "setup - Win32 Release"

DEP_CPP_PRERE=\
	"..\..\h\prereqchecks.h"\
	"..\..\h\setup.h"\
	

"$(INTDIR)\prereqchecks.obj" : $(SOURCE) $(DEP_CPP_PRERE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ELSEIF  "$(CFG)" == "setup - Win32 Debug"

DEP_CPP_PRERE=\
	"..\..\h\prereqchecks.h"\
	"..\..\h\setup.h"\
	

"$(INTDIR)\prereqchecks.obj" : $(SOURCE) $(DEP_CPP_PRERE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


!ENDIF 

SOURCE=..\..\c\setup.c
DEP_CPP_SETUP=\
	"..\..\h\setup.h"\
	

"$(INTDIR)\setup.obj" : $(SOURCE) $(DEP_CPP_SETUP) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)


SOURCE=..\..\h\setup.rc

!IF  "$(CFG)" == "setup - Win32 Release"


"$(INTDIR)\setup.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\setup.res" /i "\source\oracle\sysman\oii\oiib\h"\
 /i "\oui\source\oracle\sysman\oii\oiib\h" /i\
 "O:\Source\oracle\sysman\oii\oiib\h" /d "NDEBUG" $(SOURCE)


!ELSEIF  "$(CFG)" == "setup - Win32 Debug"


"$(INTDIR)\setup.res" : $(SOURCE) "$(INTDIR)"
	$(RSC) /l 0x409 /fo"$(INTDIR)\setup.res" /i "\source\oracle\sysman\oii\oiib\h"\
 /i "\oui\source\oracle\sysman\oii\oiib\h" /i\
 "O:\Source\oracle\sysman\oii\oiib\h" /d "_DEBUG" $(SOURCE)


!ENDIF 

SOURCE=..\..\c\w32reg.c
DEP_CPP_W32RE=\
	"..\..\h\setup.h"\
	

"$(INTDIR)\w32reg.obj" : $(SOURCE) $(DEP_CPP_W32RE) "$(INTDIR)"
	$(CPP) $(CPP_PROJ) $(SOURCE)



!ENDIF 

