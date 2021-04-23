BEGIN{
 my @modules=('Sys::Hostname',' File::Basename','Cwd','File::Find','File::Copy','File::Path','Getopt::Long','File::stat','Pod::Usage');
  foreach my $moduleName (@modules) {
    my $moduleDefined=eval "use $moduleName; 1" ?1:0;
    if($moduleDefined==0){
       print("\n$moduleName  module not present/module is not accessible\n");
       exit(2);
    }
  }
  
  use Cwd  qw(abs_path);
  use File::Basename qw(dirname basename);
  use POSIX qw(uname);
  my @uname = uname();
  my $PLATFORM="$uname[0]";
  if($PLATFORM eq 'AIX'){
	push @INC, dirname(abs_path($0));
  }

}

#Stick to perl version v5.x.x
use v5.8.8;
use Sys::Hostname;
use lib dirname(abs_path($0));
use strict;
use warnings;

use module::CommandOptions qw(isDescSession isApplySession isRollbackSession isResumeSession optExists);
use module::DBUtilServices qw(readPropertiesFile removeFile removeDirectory);
use module::OPatchAutoCommandOptions qw();

if(isApplySession()==1 || isRollbackSession()==1 || isResumeSession()==1){ 

my $binaryFromDB=0;
if(defined $ENV{'OPATCHAUTO_PERL_PATH'} && optExists('binary')==1) {
 $binaryFromDB=1;
}
 if(isDescSession()==0 && $binaryFromDB==0) {
	
	my $_debugMode=0;
	if(defined $ENV{'OPATCH_DEBUG'} && ($ENV{'OPATCH_DEBUG'} eq 'true' || $ENV{'OPATCH_DEBUG'} eq 'TRUE')){
	   $_debugMode=1;
	}
 
    my $host = hostname();
    $host = (split('\.', $host))[0];

    my $scriptDir=dirname(abs_path($0));
    my $opatchAutoDBDir=dirname($scriptDir);
    my $opatchAutoDir=dirname($opatchAutoDBDir);
    my $patchinfoLocation=$opatchAutoDir."/dbtmp/patchinginfo_$host.properties";

    my $PATCHWORK="";
	if( -e $patchinfoLocation) { 
		my %hash=readPropertiesFile($patchinfoLocation);
		if(exists $hash{'PATCHWORK_DIR'}){
		   $PATCHWORK=$hash{'PATCHWORK_DIR'};
		}

		my $bootstrapfile=$PATCHWORK."/bootstrap.properties";
		if( -e $bootstrapfile) { 
			%hash=readPropertiesFile($PATCHWORK."/bootstrap.properties");
			if(exists $hash{'IS_PERL_PATCH'}) {
			   my $IS_PERL_PATCH=$hash{'IS_PERL_PATCH'};
			   if("true" eq $IS_PERL_PATCH) {		
				if(exists $hash{'PERL_PATH'}) {
				   my $fullperlpath=$hash{'PERL_PATH'};
				   my $perlbinpath=dirname($fullperlpath);
				   my $perlfolderpath=dirname($perlbinpath);
					
				   if($_debugMode==1){
					   print("\nRemoving copied perl directory ".$perlfolderpath."\n");
				   }	
				   removeDirectory($perlfolderpath);
				}
			   }
			}  
		}
		removeFile($opatchAutoDir."/dbtmp/patchinginfo_$host.properties");
	}
    
 } 
}

