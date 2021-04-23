package module::ClassPathLib;

use strict;
use warnings;

use Exporter qw(import);
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));

our @EXPORT_OK = qw(setBaseDir setDetectOH setCP setSrvmLibPath getLibPathForBootStrapping getBootStrapCP getTopologyCreatorCP getOpatchAutoCP getOPatchAutoBinaryCP getLibPathForDriver getOPatchautoRHPCP getThirdpartyJarsCP);

our $BASEDIR="";
our $OPATCHAUTO_DIR="";
our $OPATCHAUTO_CORE_DIR="";
our $OPATCHAUTODB_DIR="";
our $DETECT_OH="";
our $CP="";
our $SRVM_JLIB="";
our $SRVM_HAS_JLIB="";
our $SRVM_ASM_JLIB="";
our $windows=$^O eq 'MSWin32';

sub setBaseDir{
 $BASEDIR=$_[0];
 $OPATCHAUTO_DIR=$BASEDIR."/auto";
 $OPATCHAUTO_CORE_DIR=$OPATCHAUTO_DIR."/core";
 $OPATCHAUTODB_DIR=$OPATCHAUTO_DIR."/database";
 if(length $windows == 0){
   $windows=0;
 }
}

sub setDetectOH{
 $DETECT_OH=$_[0];
}

sub setCP{
 $CP=$_[0];
}

sub setSrvmLibPath{
 $SRVM_JLIB=$_[0];
 $SRVM_HAS_JLIB=$_[1];
 $SRVM_ASM_JLIB=$_[2];
}


sub getLibPathForBootStrapping{
 my $CLASSPATH= $BASEDIR."/modules/thirdparty/features/commons-compress.jar:"
                .$BASEDIR."/modules/features/orapki.lib.jar:"
                .$OPATCHAUTO_CORE_DIR."/modules/features/oracle.glcm.opatchauto.core.classpath.jar:"
                .$OPATCHAUTO_CORE_DIR."/modules/features/oracle.glcm.opatchauto.core.binary.classpath.jar:"
                .$BASEDIR."/plugins/opatchauto/modules/oracle.glcm.opatchauto.db.actions.classpath.jar:"
                .$OPATCHAUTO_CORE_DIR."/modules/legacyoui/legacyoui.classpath.jar:"
                .$OPATCHAUTODB_DIR."/modules/oracle.glcm.opatchauto.db.systemmodel.classpath.jar:"
                .$OPATCHAUTODB_DIR."/modules/oracle.glcm.opatchauto.db.helper.classpath.jar:"
                .$BASEDIR."/modules/features/oracle.glcm.opatch.common.api.classpath.jar:"
                .$SRVM_JLIB."/srvm.jar:"
                .$SRVM_ASM_JLIB."/srvmasm.jar:"
                .$SRVM_HAS_JLIB."/srvmhas.jar:"
                .$DETECT_OH."/jlib/netcfg.jar:"
                .$CP."/OraInstaller.jar:"
                .$CP."/OraPrereq.jar:"
                .$CP."/share.jar:"
                .$CP."/orai18n-mapping.jar:"
                .$CP."/xmlparserv2.jar:"
                .$CP."/emCfg.jar:"
                .$CP."/ojmisc.jar:"
                .$BASEDIR."/jlib/oracle.opatch.classpath.jar:";
 $CLASSPATH=$CLASSPATH.getThirdPartyJarsCP();
 if($windows){
	$CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getBootStrapCP{
 my $CLASSPATH=$OPATCHAUTODB_DIR."/modules/oracle.glcm.opatchauto.db.utils.classpath.jar:";
 $CLASSPATH=$CLASSPATH.getLibPathForBootStrapping();
 if($windows){
  $CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getOPatchautoRHPCP{
 my $CLASSPATH=$OPATCHAUTODB_DIR."/modules/oracle.glcm.opatchauto.rhp.classpath.jar:".$BASEDIR."/modules/internal/features/lib_jaxb_2.3.0.jar:";
 $CLASSPATH=$CLASSPATH.getLibPathForBootStrapping();
 if($windows){
  $CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getTopologyCreatorCP{
 my $CLASSPATH=$DETECT_OH."/sqldeveloper/jdbc/lib/*:";
 $CLASSPATH=$CLASSPATH.getLibPathForBootStrapping();
 if($windows){
  $CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getOpatchAutoCP{
 my $CLASSPATH=$DETECT_OH."/sqldeveloper/jdbc/lib/*:"
				.$BASEDIR."/modules/internal/features/lib_jaxb_2.3.0.jar:";
 $CLASSPATH=$CLASSPATH.getLibPathForBootStrapping();
 if($windows){
  $CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getLibPathForDriver{
 my $CLASSPATH= $OPATCHAUTO_CORE_DIR."/modules/legacyoui/legacyoui.classpath.jar:"
                .$OPATCHAUTODB_DIR."/modules/oracle.glcm.opatchauto.db.systemmodel.classpath.jar:"
                .$OPATCHAUTODB_DIR."/modules/oracle.glcm.opatchauto.db.helper.classpath.jar:"
                .$CP."/OraInstaller.jar:"
				.$CP."/srvm.jar:"
				.$CP."/srvmasm.jar:"
				.$CP."/srvmhas.jar:"
                .$CP."/share.jar:"
                .$CP."/xmlparserv2.jar:"
                .$CP."/ojmisc.jar:";
 $CLASSPATH=$CLASSPATH.getThirdPartyJarsCP().":";
 if($windows){
	$CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getOPatchAutoBinaryCP{
 my $CLASSPATH= $BASEDIR."/modules/thirdparty/features/commons-compress.jar:".
                $OPATCHAUTO_CORE_DIR."/modules/features/oracle.glcm.opatchauto.core.binary.classpath.jar:".
                $OPATCHAUTO_CORE_DIR."/modules/legacyoui/legacyoui.classpath.jar:".
                $BASEDIR."/modules/features/oracle.glcm.opatch.common.api.classpath.jar:".
				$BASEDIR."/modules/internal/features/lib_jaxb_2.3.0.jar:".
                $CP."/OraInstaller.jar:".
                $CP."/OraPrereq.jar:".
                $CP."/share.jar:".
                $CP."/orai18n-mapping.jar:".
                $CP."/xmlparserv2.jar:".
                $CP."/emCfg.jar:".
                $CP."/ojmisc.jar:".
                $BASEDIR."/jlib/oracle.opatch.classpath.jar:";
 $CLASSPATH=$CLASSPATH.getThirdPartyJarsCP();
 if($windows){
	$CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

sub getThirdPartyJarsCP{
 my $CLASSPATH= $BASEDIR."/modules/thirdparty/features/jackson-annotations.jar:"
                .$BASEDIR."/modules/thirdparty/features/jackson-core.jar:"
                .$BASEDIR."/modules/thirdparty/features/jackson-databind.jar:"
                .$BASEDIR."/modules/thirdparty/features/jackson-module-jaxb-annotations.jar:"
				.$BASEDIR."/modules/thirdparty/features/xercesimpl.jar";
 if($windows){
	$CLASSPATH =~ s/:/;/g;
 }
 return $CLASSPATH;
}

1;