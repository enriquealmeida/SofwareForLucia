@echo off
if not .%1.==.. goto SavePdbs
echo Error: must specify build descriptor
echo example: SavePdbs CTP3
goto end

:SavePdbs
set ZipUtil=\\builder\gxver\utils\zip\zip
set ZipOptions=-uoX9
set ZipFile=\\fsartech\developmentSH\RochaPDBs\Pdbs%1.zip

echo Creating or updating %ZipFile%
%ZipUtil% %ZipOptions% %ZipFile% *.exe Artech*.dll Connector.dll CtpMt*.dll Genexus*.dll gx*.dll Magic*.dll udm*.dll xmlreader.dll *.pdb Packages\*.pdb Packages\*.dll

:SaveSDKBin
set SDKBinFolder=SDK\SDKBase\BIN
set SavedSDKBinFolder=\\fsartech\developmentSH\RochaSDKBin\%1

echo Saving %SDKBinFolder% to %SavedSDKBinFolder%
if not exist %SavedSDKBinFolder% md %SavedSDKBinFolder%
if exist %SavedSDKBinFolder% goto DoSaveSDKBin

echo Error: could not save %SDKBinFolder% to %SavedSDKBinFolder%
goto end

:DoSaveSDKBin
xcopy %SDKBinFolder%\*.* %SavedSDKBinFolder%\*.* /d /y


:end
