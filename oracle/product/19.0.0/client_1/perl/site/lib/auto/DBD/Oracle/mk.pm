$dbd_oracle_mm_opts = {
                        'NAME' => 'DBD::Oracle',
                        'META_MERGE' => {
                                          'build_requires' => {
                                                                'ExtUtils::MakeMaker' => 0,
                                                                'DBI' => '1.51'
                                                              },
                                          'configure_requires' => {
                                                                    'DBI' => '1.51'
                                                                  }
                                        },
                        'INC' => '-IC:c:\app\oracle\product\19.0.0\client_1/OCI/include -IC:c:\app\oracle\product\19.0.0\client_1/rdbms/demo -Ic:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib\\auto\\DBI',
                        'LIBS' => [
                                    '-LC:c:\app\oracle\product\19.0.0\client_1/OCI/LIB/MSVC OCI'
                                  ],
                        'AUTHOR' => 'Tim Bunce (dbi-users@perl.org)',
                        'DIR' => [],
                        'DEFINE' => ' -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112',
                        'dist' => {
                                    'DIST_DEFAULT' => 'clean distcheck disttest tardist',
                                    'COMPRESS' => 'gzip -v9',
                                    'PREOP' => '$(MAKE) -f Makefile.old distdir',
                                    'SUFFIX' => 'gz'
                                  },
                        'OBJECT' => '$(O_FILES)',
                        'clean' => {
                                     'FILES' => 'xstmp.c Oracle.xsi dll.base dll.exp sqlnet.log libOracle.def ora_explain mk.pm DBD_ORA_OBJ.*'
                                   },
                        'EXE_FILES' => [
                                         'ora_explain'
                                       ],
                        'ABSTRACT_FROM' => 'Oracle.pm',
                        'VERSION_FROM' => 'Oracle.pm',
                        'LICENSE' => 'perl',
                        'PREREQ_PM' => {
                                         'DBI' => '1.51'
                                       }
                      };
$dbd_oracle_mm_self = bless( {
                               'MM_Win32_VERSION' => '6.57_05',
                               'BSLOADLIBS' => '',
                               'ECHO_N' => '$(ABSPERLRUN)  -e "print qq{@ARGV}" --',
                               'BOOTDEP' => '',
                               'INSTALLSITESCRIPT' => '$(INSTALLSCRIPT)',
                               'CCDLFLAGS' => ' ',
                               'LDDLFLAGS' => '-dll -nologo -nodefaultlib -debug -opt:ref,icf  -libpath:"c:\app\oracle\product\19.0.0\client_1\\perl\\lib\\CORE"  -machine:x86 "/manifestdependency:type=\'Win32\' name=\'Microsoft.Windows.Common-Controls\' version=\'6.0.0.0\' processorArchitecture=\'*\' publicKeyToken=\'6595b64144ccf1df\' language=\'*\'"',
                               'DESTINSTALLVENDORMAN3DIR' => '$(DESTDIR)$(INSTALLVENDORMAN3DIR)',
                               'LDLOADLIBS' => 'c:\app\oracle\product\19.0.0\client_1\\OCI\\LIB\\MSVC\\OCI.lib "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\oldnames.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\kernel32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\user32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\gdi32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\winspool.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\comdlg32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\advapi32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\shell32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\ole32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\oleaut32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\netapi32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\uuid.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\ws2_32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\mpr.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\winmm.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\version.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\odbc32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\odbccp32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\comctl32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\bufferoverflowU.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\msvcrt.lib"',
                               'PREOP' => '$(NOECHO) $(NOOP)',
                               'MACROSTART' => '',
                               'XS_VERSION' => '1.28',
                               'MAKEMAKER' => 'c:\app\oracle\product\19.0.0\client_1/perl/lib/ExtUtils/MakeMaker.pm',
                               'USEMAKEFILE' => '-f',
                               'RM_RF' => '$(ABSPERLRUN) -MExtUtils::Command -e "rm_rf" --',
                               'PMLIBDIRS' => [
                                                'lib'
                                              ],
                               'INST_LIBDIR' => '$(INST_LIB)\\DBD',
                               'SITEARCHEXP' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib',
                               'ABSTRACT' => 'Oracle database driver for the DBI module',
                               'INST_MAN1DIR' => 'blib\\man1',
                               'MAN3EXT' => '3',
                               'XS' => {
                                         'Oracle.xs' => 'Oracle.c'
                                       },
                               'MAKE' => 'nmake',
                               'FULL_AR' => '',
                               'TRUE' => '$(ABSPERLRUN)  -e "exit 0" --',
                               'FULLPERL' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\bin\\perl.exe',
                               'DIR' => $dbd_oracle_mm_opts->{'DIR'},
                               'CONFIG' => [
                                             'ar',
                                             'cc',
                                             'cccdlflags',
                                             'ccdlflags',
                                             'dlext',
                                             'dlsrc',
                                             'exe_ext',
                                             'full_ar',
                                             'ld',
                                             'lddlflags',
                                             'ldflags',
                                             'libc',
                                             'lib_ext',
                                             'obj_ext',
                                             'osname',
                                             'osvers',
                                             'ranlib',
                                             'sitelibexp',
                                             'sitearchexp',
                                             'so',
                                             'vendorarchexp',
                                             'vendorlibexp'
                                           ],
                               'DESTDIR' => '',
                               'MAN1PODS' => {
                                               'ora_explain' => '$(INST_MAN1DIR)\\ora_explain.$(MAN1EXT)'
                                             },
                               'INSTALLSITEBIN' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\bin',
                               'CHMOD' => '$(ABSPERLRUN) -MExtUtils::Command -e "chmod" --',
                               'DESTINSTALLVENDORLIB' => '$(DESTDIR)$(INSTALLVENDORLIB)',
                               'OBJ_EXT' => '.obj',
                               'C' => [
                                        'Oracle.c',
                                        'dbdimp.c',
                                        'oci8.c'
                                      ],
                               'EXE_FILES' => $dbd_oracle_mm_opts->{'EXE_FILES'},
                               'TARFLAGS' => 'cvf',
                               'PERL_INC' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\lib\\CORE',
                               'HAS_LINK_CODE' => 1,
                               'INSTALLPRIVLIB' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\lib',
                               'SITELIBEXP' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib',
                               'DESTINSTALLPRIVLIB' => '$(DESTDIR)$(INSTALLPRIVLIB)',
                               'VENDORLIBEXP' => '',
                               'DEFINE' => ' -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112',
                               'FULLEXT' => 'DBD\\Oracle',
                               'MAKEFILE' => 'Makefile',
                               'PL_FILES' => {
                                               'ora_explain.PL' => 'ora_explain'
                                             },
                               'VENDORARCHEXP' => '',
                               'MM_VERSION' => '6.57_05',
                               'INSTALLSCRIPT' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\bin',
                               'CC' => 'cl',
                               'LIBS' => $dbd_oracle_mm_opts->{'LIBS'},
                               'DLEXT' => 'dll',
                               'EQUALIZE_TIMESTAMP' => '$(ABSPERLRUN) -MExtUtils::Command -e "eqtime" --',
                               'XS_VERSION_MACRO' => 'XS_VERSION',
                               'VERBINST' => 0,
                               'TAR' => 'tar',
                               'ABSPERL' => '$(PERL)',
                               'FALSE' => '$(ABSPERLRUN)  -e "exit 1" --',
                               'DESTINSTALLARCHLIB' => '$(DESTDIR)$(INSTALLARCHLIB)',
                               'INST_STATIC' => '$(INST_ARCHAUTODIR)\\$(BASEEXT)$(LIB_EXT)',
                               'DISTVNAME' => 'DBD-Oracle-1.28',
                               'ABSTRACT_FROM' => 'Oracle.pm',
                               'DESTINSTALLSCRIPT' => '$(DESTDIR)$(INSTALLSCRIPT)',
                               'INST_AUTODIR' => '$(INST_LIB)\\auto\\$(FULLEXT)',
                               'RESULT' => [
                                             '# This Makefile is for the DBD::Oracle extension to perl.
#
# It was generated automatically by MakeMaker version
# 6.57_05 (Revision: 65705) from the contents of
# Makefile.PL. Don\'t edit this file, edit Makefile.PL instead.
#
#       ANY CHANGES MADE HERE WILL BE LOST!
#
#   MakeMaker ARGV: ()
#
',
                                             '#   MakeMaker Parameters:
',
                                             '#     ABSTRACT_FROM => q[Oracle.pm]',
                                             '#     AUTHOR => [q[Tim Bunce (dbi-users@perl.org)]]',
                                             '#     BUILD_REQUIRES => {  }',
                                             '#     DEFINE => q[ -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112]',
                                             '#     DIR => []',
                                             '#     EXE_FILES => [q[ora_explain]]',
                                             '#     INC => q[-IC:c:\app\oracle\product\19.0.0\client_1/OCI/include -IC:c:\app\oracle\product\19.0.0\client_1/rdbms/demo -Ic:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib\\auto\\DBI]',
                                             '#     LIBS => [q[-LC:c:\app\oracle\product\19.0.0\client_1/OCI/LIB/MSVC OCI]]',
                                             '#     LICENSE => q[perl]',
                                             '#     META_MERGE => { build_requires=>{ ExtUtils::MakeMaker=>q[0], DBI=>q[1.51] }, configure_requires=>{ DBI=>q[1.51] } }',
                                             '#     NAME => q[DBD::Oracle]',
                                             '#     OBJECT => q[$(O_FILES)]',
                                             '#     PREREQ_PM => { DBI=>q[1.51] }',
                                             '#     VERSION_FROM => q[Oracle.pm]',
                                             '#     clean => { FILES=>q[xstmp.c Oracle.xsi dll.base dll.exp sqlnet.log libOracle.def ora_explain mk.pm DBD_ORA_OBJ.*] }',
                                             '#     dist => { DIST_DEFAULT=>q[clean distcheck disttest tardist], COMPRESS=>q[gzip -v9], PREOP=>q[$(MAKE) -f Makefile.old distdir], SUFFIX=>q[gz] }',
                                             '
# --- MakeMaker post_initialize section:'
                                           ],
                               'FULLPERLRUNINST' => '$(FULLPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'MAP_TARGET' => 'perl',
                               'INSTALLMAN3DIR' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\man\\man3',
                               'PERLPREFIX' => 'c:\app\oracle\product\19.0.0\client_1\\perl',
                               'AUTHOR' => [
                                             'Tim Bunce (dbi-users@perl.org)'
                                           ],
                               'INC' => '-IC:c:\app\oracle\product\19.0.0\client_1/OCI/include -IC:c:\app\oracle\product\19.0.0\client_1/rdbms/demo -Ic:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib\\auto\\DBI',
                               'LDFLAGS' => '-nologo -nodefaultlib -debug -opt:ref,icf  -libpath:"c:\app\oracle\product\19.0.0\client_1\\perl\\lib\\CORE"  -machine:x86 "/manifestdependency:type=\'Win32\' name=\'Microsoft.Windows.Common-Controls\' version=\'6.0.0.0\' processorArchitecture=\'*\' publicKeyToken=\'6595b64144ccf1df\' language=\'*\'"',
                               'dist' => $dbd_oracle_mm_opts->{'dist'},
                               'INSTALLVENDORMAN1DIR' => '',
                               'MAKEFILE_OLD' => 'Makefile.old',
                               'H' => [
                                        'Oracle.h',
                                        'dbdimp.h',
                                        'dbivport.h',
                                        'ocitrace.h'
                                      ],
                               'PERLRUNINST' => '$(PERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'CI' => 'ci -u',
                               'DESTINSTALLBIN' => '$(DESTDIR)$(INSTALLBIN)',
                               'DESTINSTALLVENDORMAN1DIR' => '$(DESTDIR)$(INSTALLVENDORMAN1DIR)',
                               'INST_ARCHLIBDIR' => '$(INST_ARCHLIB)\\DBD',
                               'OBJECT' => '$(O_FILES)',
                               'BUILD_REQUIRES' => {},
                               'NAME_SYM' => 'DBD_Oracle',
                               'RANLIB' => 'rem',
                               'DIRFILESEP' => '^\\',
                               'POSTOP' => '$(NOECHO) $(NOOP)',
                               'INSTALLVENDORBIN' => '',
                               'COMPRESS' => 'gzip --best',
                               'SUFFIX' => '.gz',
                               'MAN1EXT' => '1',
                               'PERL_LIB' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\lib',
                               'ECHO' => '$(ABSPERLRUN) -l -e "print qq{@ARGV}" --',
                               'EXPORT_LIST' => '$(BASEEXT).def',
                               'INST_BOOT' => '$(INST_ARCHAUTODIR)\\$(BASEEXT).bs',
                               'MV' => '$(ABSPERLRUN) -MExtUtils::Command -e "mv" --',
                               'OSVERS' => '5.2',
                               'LD_RUN_PATH' => '',
                               'MKPATH' => '$(ABSPERLRUN) -MExtUtils::Command -e "mkpath" --',
                               'DESTINSTALLMAN1DIR' => '$(DESTDIR)$(INSTALLMAN1DIR)',
                               'OSNAME' => 'MSWin32',
                               'AR' => 'lib',
                               'O_FILES' => [
                                              'Oracle.obj',
                                              'dbdimp.obj',
                                              'oci8.obj'
                                            ],
                               'FIXIN' => 'pl2bat.bat',
                               'DIST_DEFAULT' => 'tardist',
                               'SKIPHASH' => {},
                               'NOOP' => 'rem',
                               'PERL_ARCHLIB' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\lib',
                               'VERSION_SYM' => '1_28',
                               'VERSION_MACRO' => 'VERSION',
                               'WARN_IF_OLD_PACKLIST' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e "warn_if_old_packlist" --',
                               'MM_REVISION' => 65705,
                               'RM_F' => '$(ABSPERLRUN) -MExtUtils::Command -e "rm_f" --',
                               'LIBC' => 'msvcrt.lib',
                               'UNINST' => 0,
                               'PERLRUN' => '$(PERL)',
                               'LINKTYPE' => 'dynamic',
                               'INSTALLVENDORLIB' => '',
                               'DEV_NULL' => '> NUL',
                               'DLSRC' => 'dl_win32.xs',
                               'INST_ARCHAUTODIR' => '$(INST_ARCHLIB)\\auto\\$(FULLEXT)',
                               'DESTINSTALLSITEBIN' => '$(DESTDIR)$(INSTALLSITEBIN)',
                               'MACROEND' => '',
                               'ARGS' => {
                                           'NAME' => 'DBD::Oracle',
                                           'META_MERGE' => $dbd_oracle_mm_opts->{'META_MERGE'},
                                           'INC' => '-IC:c:\app\oracle\product\19.0.0\client_1/OCI/include -IC:c:\app\oracle\product\19.0.0\client_1/rdbms/demo -Ic:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib\\auto\\DBI',
                                           'LIBS' => $dbd_oracle_mm_opts->{'LIBS'},
                                           'AUTHOR' => $dbd_oracle_mm_self->{'AUTHOR'},
                                           'DIR' => $dbd_oracle_mm_opts->{'DIR'},
                                           'DEFINE' => ' -DUTF8_SUPPORT -DORA_OCI_VERSION=\\"11.2.0.3\\" -DORA_OCI_102 -DORA_OCI_112',
                                           'dist' => $dbd_oracle_mm_opts->{'dist'},
                                           'OBJECT' => '$(O_FILES)',
                                           'clean' => $dbd_oracle_mm_opts->{'clean'},
                                           'EXE_FILES' => $dbd_oracle_mm_opts->{'EXE_FILES'},
                                           'ABSTRACT_FROM' => 'Oracle.pm',
                                           'VERSION_FROM' => 'Oracle.pm',
                                           'LICENSE' => 'perl',
                                           'PREREQ_PM' => $dbd_oracle_mm_opts->{'PREREQ_PM'}
                                         },
                               'CP' => '$(ABSPERLRUN) -MExtUtils::Command -e "cp" --',
                               'DEFINE_VERSION' => '-D$(VERSION_MACRO)=\\"$(VERSION)\\"',
                               'PREREQ_PM' => $dbd_oracle_mm_opts->{'PREREQ_PM'},
                               'DESTINSTALLSITELIB' => '$(DESTDIR)$(INSTALLSITELIB)',
                               'INST_LIB' => 'blib\\lib',
                               'INST_DYNAMIC' => '$(INST_ARCHAUTODIR)\\$(DLBASE).$(DLEXT)',
                               'FULLPERLRUN' => '$(FULLPERL)',
                               'META_MERGE' => $dbd_oracle_mm_opts->{'META_MERGE'},
                               'INSTALLSITEMAN1DIR' => '$(INSTALLMAN1DIR)',
                               'DESTINSTALLSITEMAN3DIR' => '$(DESTDIR)$(INSTALLSITEMAN3DIR)',
                               'MOD_INSTALL' => '$(ABSPERLRUN) -MExtUtils::Install -e "install([ from_to => {@ARGV}, verbose => \'$(VERBINST)\', uninstall_shadows => \'$(UNINST)\', dir_mode => \'$(PERM_DIR)\' ]);" --',
                               'DLBASE' => '$(BASEEXT)',
                               'INST_MAN3DIR' => 'blib\\man3',
                               'CCCDLFLAGS' => ' ',
                               'INSTALLSITEARCH' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib',
                               'PMLIBPARENTDIRS' => [
                                                      'lib'
                                                    ],
                               'XS_DEFINE_VERSION' => '-D$(XS_VERSION_MACRO)=\\"$(XS_VERSION)\\"',
                               'DESTINSTALLSITESCRIPT' => '$(DESTDIR)$(INSTALLSITESCRIPT)',
                               'SHAR' => 'shar',
                               'PERLMAINCC' => '$(CC)',
                               'RCS_LABEL' => 'rcs -Nv$(VERSION_SYM): -q',
                               'NAME' => 'DBD::Oracle',
                               'PARENT_NAME' => 'DBD',
                               'INSTALLSITELIB' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\site\\lib',
                               'MAKE_APERL_FILE' => 'Makefile.aperl',
                               'ZIP' => 'zip',
                               'VERSION_FROM' => 'Oracle.pm',
                               'LICENSE' => 'perl',
                               'SITEPREFIX' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\site',
                               'INSTALLVENDORSCRIPT' => '',
                               'TO_UNIX' => '$(NOECHO) $(NOOP)',
                               'PERL' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\bin\\perl.exe',
                               'DESTINSTALLVENDORARCH' => '$(DESTDIR)$(INSTALLVENDORARCH)',
                               'NOECHO' => '@',
                               'DESTINSTALLVENDORBIN' => '$(DESTDIR)$(INSTALLVENDORBIN)',
                               'PERM_RW' => 644,
                               'UMASK_NULL' => 'umask 0',
                               'DOC_INSTALL' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e "perllocal_install" --',
                               'TOUCH' => '$(ABSPERLRUN) -MExtUtils::Command -e "touch" --',
                               'LD' => 'link',
                               'PERL_SRC' => undef,
                               'DESTINSTALLMAN3DIR' => '$(DESTDIR)$(INSTALLMAN3DIR)',
                               'ZIPFLAGS' => '-r',
                               'PERM_DIR' => 755,
                               'DISTNAME' => 'DBD-Oracle',
                               'INST_BIN' => 'blib\\bin',
                               'FIRST_MAKEFILE' => 'Makefile',
                               'VENDORPREFIX' => '',
                               'LDFROM' => '$(OBJECT)',
                               'clean' => $dbd_oracle_mm_opts->{'clean'},
                               'PREFIX' => '$(SITEPREFIX)',
                               'INSTALLDIRS' => 'site',
                               'INST_ARCHLIB' => 'blib\\arch',
                               'PERL_ARCHIVE' => '$(PERL_INC)\\perl514.lib',
                               'INSTALLVENDORARCH' => '',
                               'INSTALLBIN' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\bin',
                               'DESTINSTALLSITEMAN1DIR' => '$(DESTDIR)$(INSTALLSITEMAN1DIR)',
                               'INSTALLSITEMAN3DIR' => '$(INSTALLMAN3DIR)',
                               'PERL_ARCHIVE_AFTER' => '',
                               'MAN3PODS' => {
                                               'Oracle.pm' => '$(INST_MAN3DIR)\\DBD\\Oracle.$(MAN3EXT)',
                                               'Oraperl.pm' => '$(INST_MAN3DIR)\\DBD\\Oraperl.$(MAN3EXT)'
                                             },
                               'LIBPERL_A' => 'libperl.lib',
                               'INSTALLARCHLIB' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\lib',
                               'LIB_EXT' => '.lib',
                               'AR_STATIC_ARGS' => 'cr',
                               'INSTALLVENDORMAN3DIR' => '',
                               'EXE_EXT' => '.exe',
                               'EXTRALIBS' => 'c:\app\oracle\product\19.0.0\client_1\\OCI\\LIB\\MSVC\\OCI.lib "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\oldnames.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\kernel32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\user32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\gdi32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\winspool.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\comdlg32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\advapi32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\shell32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\ole32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\oleaut32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\netapi32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\uuid.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\ws2_32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\mpr.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\winmm.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\version.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\odbc32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\odbccp32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\comctl32.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\PlatformSDK\\lib\\bufferoverflowU.lib" "c:\\Program Files\\Microsoft Visual Studio 8\\VC\\LIB\\msvcrt.lib"',
                               'PERM_RWX' => 755,
                               'DESTINSTALLSITEARCH' => '$(DESTDIR)$(INSTALLSITEARCH)',
                               'ABSPERLRUN' => '$(ABSPERL)',
                               'DESTINSTALLVENDORSCRIPT' => '$(DESTDIR)$(INSTALLVENDORSCRIPT)',
                               'BASEEXT' => 'Oracle',
                               'TEST_F' => '$(ABSPERLRUN) -MExtUtils::Command -e "test_f" --',
                               'PM' => {
                                         'Oracle.pm' => '$(INST_LIB)\\DBD\\Oracle.pm',
                                         'oraperl.ph' => '$(INST_LIB)/oraperl.ph',
                                         'lib/DBD/Oracle/Object.pm' => 'blib\\lib\\DBD\\Oracle\\Object.pm',
                                         'Oraperl.pm' => '$(INST_LIB)/Oraperl.pm',
                                         'lib/DBD/Oracle/GetInfo.pm' => 'blib\\lib\\DBD\\Oracle\\GetInfo.pm',
                                         'mk.pm' => '$(INST_LIB)\\DBD\\mk.pm'
                                       },
                               'ABSPERLRUNINST' => '$(ABSPERLRUN) "-I$(INST_ARCHLIB)" "-I$(INST_LIB)"',
                               'PERL_CORE' => 0,
                               'INSTALLMAN1DIR' => 'c:\app\oracle\product\19.0.0\client_1\\perl\\man\\man1',
                               'SO' => 'dll',
                               'VERSION' => '1.28',
                               'DIST_CP' => 'best',
                               'INST_SCRIPT' => 'blib\\script',
                               'UNINSTALL' => '$(ABSPERLRUN) -MExtUtils::Command::MM -e "uninstall" --'
                             }, 'PACK001' );
