@echo off

md %1\webapps\%2
md %1\webapps\%2\static
md %1\webapps\%2\Metadata
md %1\webapps\%2\Metadata\TableAccess
md %1\webapps\%2\WEB-INF
md %1\webapps\%2\META-INF
md %1\webapps\%2\WEB-INF\classes
md %1\webapps\%2\WEB-INF\lib
md %1\webapps\%2\static\devmenu
md %1\webapps\%2\static\bootstrap
md %1\webapps\%2\%7
md %1\webapps\%2\themes
md %1\webapps\%2\WEB-INF\gxusercontrols

if %3 == "5.5" goto copyFiles
md %1\conf\catalina\localhost
md %1\webapps\%2\WEB-INF\classes\dummy

if NOT %3 == "7.0" goto copyContextScanFilter
copy /Y contextGXJarScanner.xml context.xml
xcopy GXScanner.jar %1\lib /Y /D
goto :copyFiles

:copyContextScanFilter
copy /Y contextScanFilter.xml context.xml

:copyFiles
if %6 == "false" goto no_push_support
xcopy commons-lang-2.4.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy bcprov-jdk15-146.jar %1\webapps\%2\WEB-INF\lib /Y /D

:no_push_support
if %5 == "true" goto native_soap_support
if exist %1\webapps\%2\WEB-INF\web_native_ws.xml del %1\webapps\%2\WEB-INF\web*.xml
xcopy web.xml %1\webapps\%2\WEB-INF /Y /D
goto :ENDnative_soap_support

:native_soap_support
xcopy wss4j-1.6.19.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy xalan-2.7.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy serializer-2.7.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
if exist %1\webapps\%2\WEB-INF\web_native_ws.xml goto native_soap_support_exist
if exist %1\webapps\%2\WEB-INF\web.xml del %1\webapps\%2\WEB-INF\web.xml
copy web.xml web_native_ws.xml
copy web_native_ws.xml %1\webapps\%2\WEB-INF
copy web_native_ws.xml %1\webapps\%2\WEB-INF\web.xml
xcopy sun-jaxws.xml %1\webapps\%2\WEB-INF /Y /D
goto :ENDnative_soap_support

:native_soap_support_exist
xcopy web_native_ws.xml %1\webapps\%2\WEB-INF\web.xml /Y /D
xcopy sun-jaxws.xml %1\webapps\%2\WEB-INF /Y /D

:ENDnative_soap_support
if %8 == "6" goto copy_files_java6
if exist %1\webapps\%2\WEB-INF\lib\log4j-api-2.3.jar del %1\webapps\%2\WEB-INF\lib\log4j-api-2.3.jar
if exist %1\webapps\%2\WEB-INF\lib\log4j-core-2.3.jar del %1\webapps\%2\WEB-INF\lib\log4j-core-2.3.jar
if exist %1\webapps\%2\WEB-INF\lib\log4j-api-2.11.2.jar del %1\webapps\%2\WEB-INF\lib\log4j-api-2.11.2.jar
if exist %1\webapps\%2\WEB-INF\lib\log4j-core-2.11.2.jar del %1\webapps\%2\WEB-INF\lib\log4j-core-2.11.2.jar
if exist %1\webapps\%2\WEB-INF\lib\mail.jar del %1\webapps\%2\WEB-INF\lib\mail.jar
xcopy log4j-api-2.13.3.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy log4j-core-2.13.3.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javax.mail-1.6.2.jar %1\webapps\%2\WEB-INF\lib /Y /D

if %9 == "false" goto :copy_files
xcopy jaxb-api-2.3.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javax.jws-3.1.2.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jaxws-api-2.2.1.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javax.annotation-api-1.3.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
goto :copy_files

:copy_files_java6
if exist %1\webapps\%2\WEB-INF\lib\log4j-api-2.11.2.jar del %1\webapps\%2\WEB-INF\lib\log4j-api-2.11.2.jar
if exist %1\webapps\%2\WEB-INF\lib\log4j-core-2.11.2.jar del %1\webapps\%2\WEB-INF\lib\log4j-core-2.11.2.jar
if exist %1\webapps\%2\WEB-INF\lib\log4j-api-2.3.jar del %1\webapps\%2\WEB-INF\lib\log4j-api-2.3.jar
if exist %1\webapps\%2\WEB-INF\lib\log4j-core-2.3.jar del %1\webapps\%2\WEB-INF\lib\log4j-core-2.3.jar
if exist %1\webapps\%2\WEB-INF\lib\javax.mail-1.6.2.jar del %1\webapps\%2\WEB-INF\lib\javax.mail-1.6.2.jar
xcopy log4j-api-2.13.3.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy log4j-core-2.13.3.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy mail.jar %1\webapps\%2\WEB-INF\lib /Y /D

:copy_files
xcopy CloudServices.config %1\webapps\%2\WEB-INF /Y /D
xcopy GXCF_Chatbots.config %1\webapps\%2\WEB-INF /Y /D
if exist PDFReport.template xcopy PDFReport.template %1\webapps\%2\WEB-INF /Y /D
xcopy .\services\*.* %1\webapps\%2\WEB-INF\lib /Y /D
xcopy .\modules\*.* %1\webapps\%2\WEB-INF\lib /Y /D
xcopy .\datasources\*.* %1\webapps\%2\WEB-INF\lib /Y /D
xcopy context.xml %1\webapps\%2\META-INF /Y /D
xcopy .\drivers\*.* %1\webapps\%2\WEB-INF\lib /Y /D
xcopy itext-2.1.7.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy iTextAsian.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy lucene-core-2.2.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy Tidy.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy lucene-highlighter-2.2.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy lucene-spellchecker-2.2.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy poi-4.1.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-collections4-4.1.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy joda-time-2.10.4.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy poi-ooxml-4.1.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy poi-ooxml-schemas-4.1.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-compress-1.19.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-math3-3.6.1.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy curvesapi-1.06.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy SparseBitSet-1.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy xmlbeans-3.1.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy poi-scratchpad-4.1.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy printingappletsigned.jar %1\webapps\%2 /Y /D
xcopy rbuildj.dll %1\webapps\%2 /Y /D
xcopy GXDIB32.DLL %1\webapps\%2 /Y /D
xcopy developermenu.html %1\webapps\%2\static /Y /D
xcopy .\%7\*.rpt %1\webapps\%2\%7 /Y /D
if exist .\private\Interfaces md %1\webapps\%2\WEB-INF\private\Interfaces & xcopy .\private\Interfaces\*.* %1\webapps\%2\WEB-INF\private\Interfaces /Y /D
xcopy .\Metadata\TableAccess\*.* %1\webapps\%2\Metadata\TableAccess /Y /D
xcopy .\devmenu\*.* %1\webapps\%2\static\devmenu /Y /D
xcopy .\bootstrap\*.* %1\webapps\%2\static\bootstrap /Y /D /S
xcopy annotations-api.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy hk2-api-2.4.0-b34.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy hk2-locator-2.4.0-b34.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy hk2-utils-2.4.0-b34.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jackson-annotations-2.9.9.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jackson-core-2.9.9.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jackson-databind-2.9.10.4.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jackson-jaxrs-base-2.9.9.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jackson-jaxrs-json-provider-2.9.9.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jackson-module-jaxb-annotations-2.9.9.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javax.inject-2.4.0-b34.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javax.ws.rs-api-2.0.1.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javax.jms-3.1.2.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-client.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-common.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-container-servlet-core.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-entity-filtering-2.22.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-guava-2.22.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-media-json-jackson-2.22.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jersey-server.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy validation-api-1.1.0.Final.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy spatial4j-0.6.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy GeographicLib-Java-1.49.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jts-1.14.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jtsio-1.14.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy noggit-0.5.jar  %1\webapps\%2\WEB-INF\lib /Y /D
xcopy simple-xml-2.7.1.jar  %1\webapps\%2\WEB-INF\lib /Y /D
xcopy asm-3.1.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy bcprov-jdk15on-1.64.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy bcpkix-jdk15on-1.64.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy jdom-2.0.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-logging-1.0.4.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-io-2.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-net-3.3.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-fileupload-1.3.3.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy commons-codec-1.9.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy xmlsec-2.1.4.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy xml-apis-1.4.01.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy xercesImpl-2.12.0.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy activation-1.1.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy slf4j-api-1.7.7.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy slf4j-nop-1.7.7.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy .\themes\*.* %1\webapps\%2\themes /Y /D
xcopy .\gxusercontrols\*.* %1\webapps\%2\WEB-INF\gxusercontrols /Y /D
xcopy compiler-0.8.18.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy guava-26.0-jre.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxgeospatial.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxexternalproviders.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy encoder-1.2.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy encoder-jsp-1.2.2.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy ..\..\CSSLibraries  %1\webapps\%2\static\ /Y /D /S
xcopy manifest.json %1\webapps\%2\static /Y /D
xcopy service-worker.js %1\webapps\%2\static /Y /D
xcopy *.manifest.json %1\webapps\%2\static /Y /D
xcopy *.service-worker.js %1\webapps\%2\static /Y /D

if exist .\GAM_Backend xcopy .\GAM_Backend\static %1\webapps\%2\static /Y /D /S
if exist .\GAM_Backend xcopy .\GAM_Backend\themes\CarmineGAM.json %1\webapps\%2\themes /Y /D
if exist .\GAM_Backend xcopy .\GAM_Backend\WEB-INF\classes %1\webapps\%2\WEB-INF\classes /Y /D /S

if exist .\blackberry md %1\webapps\%2\blackberry
if exist .\blackberry xcopy .\blackberry\*.* %1\webapps\%2\blackberry /Y /D


if exist %1\webapps\%2\WEB-INF\lib\gxclassR.jar del %1\webapps\%2\WEB-INF\lib\gxclassR.jar
if exist %1\webapps\%2\WEB-INF\lib\gxcommon.jar del %1\webapps\%2\WEB-INF\lib\gxcommon.jar
xcopy gxclassR.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxcommon.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxcryptocommon.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxmail.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy javapns.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxsearch.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxoffice.jar %1\webapps\%2\WEB-INF\lib /Y /D
xcopy gxmaps.jar %1\webapps\%2\WEB-INF\lib /Y /D

if %3 == "5.5" goto end
if exist %1\conf\catalina\localhost\%2.xml goto xcopyCONTEXT
copy  context.xml %1\conf\catalina\localhost\%2.xml
goto :ENDxcopyCONTEXT

:xcopyCONTEXT
xcopy  context.xml %1\conf\catalina\localhost\%2.xml /Y /D
:ENDxcopyCONTEXT

if exist .\private\notifications.json md %1\webapps\%2\WEB-INF\private
if exist .\private\notifications.json xcopy .\private\*.* %1\webapps\%2\WEB-INF\private /Y /D

if exist .\default.yaml xcopy .\default.yaml %1\webapps\%2\static /Y /D
:end