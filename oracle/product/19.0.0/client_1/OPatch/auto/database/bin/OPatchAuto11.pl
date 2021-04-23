=head1 NAME

  OPatchAuto11.pl - Auto patching tool for Oracle Clusterware/RAC home.

=head1 SYNOPSIS

  opatch auto <patch directory>
              [-oh  <oracle home location>]
              [-och <crs home location>]
              [-rollback]
              [-ocmrf <ocm response file location>]
              [-norestart]
              [-olderver]

  Options:

   patch_directory

             Default is the current directory.
             This is the top level directory path where the patch is 
             unzipped. 
            
             Always unzip the gipsu/gi one-off in a empty directory
             where there are no other directory/files existing.  
            
             If the directory under which the patch is unzipped is /tmp/patchdir 

             Example:
             opatch auto /tmp/patchdir

            
 -rollback  

             The patch will be rolled back, not applied
             This option requires patch_directory to be passed

             Example:
             opatch auto /tmp/patchdir -rollback

 -oh         Database/Clusterware home locations    

             comma_delimited_list_of_oralcehomes_to_patch
             The default is all applicable Oracle Homes including
             the clusterware home .Use this option  to patch RDBMS homes where
             no database is registered or any specific database home or
             clusterware home.

             Example:
             opatch auto /tmp/patchdir -oh <oracle_home1_path,oracle_home2_path>

 -och        Grid infrastructure home location
             absolute path of crs home location. This is only used
             to patch Clusterware home when the clusterware stack is down
         
             Example:
             opatch auto /tmp/patchdir -och <oracle_gridhome_path>

 -ocmrf      OCM response file location

             Absolute path of the OCM response file. This is required for
	     silent mode patching

 -norestart  
	     The clusterware stack and database home resources will not be 
	     started after patching. 


 -olderver
             This parameter must be passed when the clusterware stack is down, along 
             with the -och parameter. It must only be used if the Grid Home version is 
             11.2.0.2 or older and not for newer versions of the Grid.

             Example:
             opatch auto /tmp/patchdir -och <oracle_home> -olderver 


  To patch a shared Clusterware or Database home, 
  Refer to Section "Patching installation to RAC database and/or the GI home" in the 
  Patch Readme document and follow the steps.

                                          
=head1 DESCRIPTION


  This script automates the complete patching process for a Clusterware
  or RAC database home. This script must be run as root user and needs Opatch version
  10.2.0.3.3 or above. 
  Case 1 -  On each node of the CRS cluster in case of Non Shared CRS Home.
  Case 2 -  On any one node of the CRS cluster is case of Shared CRS home.          

=cut

#Stick to perl version v5.x.x
use v5.8.8;
use strict;
use warnings;

use File::Basename qw(dirname basename);
use File::Find;
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));
use module::CommandOptions qw(addOptAtBeginning removeOpt getArguments getOptValue isRollbackSession processArgs optExists);
use module::OPatchAuto11CommandOptions qw();

print("\n Note: opatch auto is deprecated and opatchauto is available as replacement. Please use opatchauto -help for more details.");

my $scriptDir=dirname(abs_path($0));
my $rollbackSession= isRollbackSession();
my $operation="apply";
if($rollbackSession==1){
 removeOpt('rollback');
 $operation="rollback";
}
if(optExists('patchLoc')==1){
 my $patchLocation=getOptValue('patchLoc');
 removeOpt('patchLoc');
 addOptAtBeginning($patchLocation,"arg");
}
addOptAtBeginning($operation,"arg");

$ENV{'OPATCH_SPACE_AUTO'}="true";
my $args=getArguments();

my $opatchAutoInvocation=$scriptDir."/../../../../perl/bin/perl ".$scriptDir."/OPatchAutoDB.pl ".$args;
my $result=system($opatchAutoInvocation);
$result= $result >> 8;
exit($result);