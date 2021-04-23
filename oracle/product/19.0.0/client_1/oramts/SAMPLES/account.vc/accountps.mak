MACHINE=I386
!IF "$(WIN64BLD)" == "1"
MACHINE=IA64
!ENDIF

!IF "$(AMD64BLD)" == "1"
MACHINE=AMD64
!ENDIF

Accountps.dll: dlldata.obj Account_p.obj Account_i.obj
	link /dll /out:Accountps.dll /def:Accountps.def /entry:DllMain dlldata.obj Account_p.obj Account_i.obj kernel32.lib rpcndr.lib rpcns4.lib rpcrt4.lib uuid.lib ole32.lib /machine:$(MACHINE)

.c.obj:
!IF "$(WIN64BLD)" == "1"
	cl /c /Ox /Wp64  /DWIN64 /D_WIN64 /D /DWIN32 /D_WIN32_WINNT=0x501 /DREGISTER_PROXY_DLL $<
!ELSE
	cl /c /Ox /DWIN32 /D_WIN32_WINNT=0x501 /DREGISTER_PROXY_DLL $<
!ENDIF

clean:
	@del Accountps.dll
	@del Accountps.lib
	@del Accountps.exp
	@del dlldata.obj
	@del Account_p.obj
	@del Account_i.obj
