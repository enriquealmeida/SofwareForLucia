@ECHO Off
c:
echo --- Setea exes de gam y workflow para forzar el uso de 32bits ---
set gxdir=c:\GeneXus\Genexus16u10
echo --- instalacion de geneXus %gxdir% 

REM -- ACTUALIZA reorg.xsl para poder usarla con el KBSaveReorganization
fart.exe "%gxdir%\gxxml\reorg.xsl" "gxsql:GetSql(.)" "."

set cmdcorflags="C:\Program Files (x86)\Microsoft SDKs\Windows\v10.0A\bin\NETFX 4.8 Tools\corflags.exe" /32BITREQ+  /FORCE /NOLOGO

REM -- ACTUALIZA LA REORG GENERAL PARA QUE SOLO PUEDA USARSE CON 32BITS. 
set GxnetDir=%gxdir%\gxnet\bin
CD %GxnetDir%
%cmdcorflags%  Reor.exe


REM -- ACTUALIZA PROGRAMAS DE GAM PARA QUE PUEDAN CORRERSE EN 32BITS. 
set GAMLibraryPath=%gxdir%\Library\GAM\Platforms\NetOracle9to11g
cd %GAMLibraryPath% 
%cmdcorflags%  adp_connectasadministrator.exe
%cmdcorflags%  adp_exportgamdata.exe
%cmdcorflags%  adp_getappbyrepository.exe
%cmdcorflags%  adp_getgamversion.exe
%cmdcorflags%  adp_getrepositories.exe
%cmdcorflags%  adp_gettreeroles.exe
%cmdcorflags%  adp_importgamdata.exe
%cmdcorflags%  adp_initializegamdata.exe
%cmdcorflags%  adp_wwconnectionfile.exe
%cmdcorflags%  agamdeploytool.exe
%cmdcorflags%  agamgetversion.exe
%cmdcorflags%  agaminitdb.exe
%cmdcorflags%  agammigra400to401.exe
%cmdcorflags%  agam_gxdevenvapi.exe
%cmdcorflags%  Reor.exe


REM -- ACTUALIZA PROGRAMAS DE GAM PARA QUE PUEDAN CORRERSE EN 32BITS. 
set GAMLibraryPath=%gxdir%\Library\GAM\Platforms\NetOracle
cd %GAMLibraryPath% 
%cmdcorflags%  adp_connectasadministrator.exe
%cmdcorflags%  adp_exportgamdata.exe
%cmdcorflags%  adp_getappbyrepository.exe
%cmdcorflags%  adp_getgamversion.exe
%cmdcorflags%  adp_getrepositories.exe
%cmdcorflags%  adp_gettreeroles.exe
%cmdcorflags%  adp_importgamdata.exe
%cmdcorflags%  adp_initializegamdata.exe
%cmdcorflags%  adp_wwconnectionfile.exe
%cmdcorflags%  agamdeploytool.exe
%cmdcorflags%  agamgetversion.exe
%cmdcorflags%  agaminitdb.exe
%cmdcorflags%  agammigra400to401.exe
%cmdcorflags%  agam_gxdevenvapi.exe
%cmdcorflags%  Reor.exe


REM -- ACTUALIZA PROGRAMAS DE WORKFLOW PARA QUE SE PUEDAN CORRER EN 32BITS. 
set GXFLOWPath=%gxdir%\Packages\Gxpm\Platforms\NetOracle9to11g
CD %GXFLOWPath%
%cmdcorflags%  apwfexportgamroles.exe
%cmdcorflags%  apwfgenuserdataxml.exe
%cmdcorflags%  apwfgetversion.exe
%cmdcorflags%  apwfidynamicformsprovidergetform.exe
%cmdcorflags%  apwfidynamicformsprovidergetforms.exe
%cmdcorflags%  apwfimpact.exe
%cmdcorflags%  apwfimportgamroles.exe
%cmdcorflags%  apwfinitializegam.exe
%cmdcorflags%  apwfloaduserdataxml.exe
%cmdcorflags%  apwfmigrateuserstogam.exe
%cmdcorflags%  apwfwinloaddataxml.exe
%cmdcorflags%  apwfxe3r0.exe
%cmdcorflags%  apwfxe3r3.exe
%cmdcorflags%  apwfxe3r3b.exe
%cmdcorflags%  apwfxer0.exe
%cmdcorflags%  apwfxr0.exe
%cmdcorflags%  apwfxr1.exe
%cmdcorflags%  apwfxr3.exe
%cmdcorflags%  apwfxr90.exe
%cmdcorflags%  Reor.exe
%cmdcorflags%  Reorgs\16\Reor.exe

REM -- ACTUALIZA PROGRAMAS DE WORKFLOW PARA QUE SE PUEDAN CORRER EN 32BITS. 
set GXFLOWPath=%gxdir%\Packages\Gxpm\Platforms\NetOracle
CD %GXFLOWPath%
%cmdcorflags%  apwfexportgamroles.exe
%cmdcorflags%  apwfgenuserdataxml.exe
%cmdcorflags%  apwfgetversion.exe
%cmdcorflags%  apwfidynamicformsprovidergetform.exe
%cmdcorflags%  apwfidynamicformsprovidergetforms.exe
%cmdcorflags%  apwfimpact.exe
%cmdcorflags%  apwfimportgamroles.exe
%cmdcorflags%  apwfinitializegam.exe
%cmdcorflags%  apwfloaduserdataxml.exe
%cmdcorflags%  apwfmigrateuserstogam.exe
%cmdcorflags%  apwfwinloaddataxml.exe
%cmdcorflags%  apwfxe3r0.exe
%cmdcorflags%  apwfxe3r3.exe
%cmdcorflags%  apwfxe3r3b.exe
%cmdcorflags%  apwfxer0.exe
%cmdcorflags%  apwfxr0.exe
%cmdcorflags%  apwfxr1.exe
%cmdcorflags%  apwfxr3.exe
%cmdcorflags%  apwfxr90.exe
%cmdcorflags%  Reor.exe
%cmdcorflags%  Reorgs\16\Reor.exe

pause


