package module::BootStrapCommandOptions;

use strict;
use warnings;

use Getopt::Long qw(GetOptions);
use Exporter qw(import);
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));
Getopt::Long::Configure("pass_through");
use module::CommandOptions qw(processOpts processSwitch processArgs);
our @EXPORT_OK = qw();

GetOptions(
     '<>'      => \&processArgs,
   'DEBUGVAL:s'   => \&processOpts,
   'detect_oh=s'   => \&processOpts,
   'java=s'   => \&processOpts,
   'java_vm_option:s'   => \&processOpts,
   'jre_memory_options=s'   => \&processOpts,
   'cp=s'   => \&processOpts,
   'base=s'   => \&processOpts,
   'operationtype:s'   => \&processOpts,
   'ld_library_path:s'   => \&processOpts,
   'patch_path=s'   => \&processOpts,
   'oh=s'   => \&processOpts,
   'isActionSession=s'   => \&processOpts,
   'oracleocmservice:s'   => \&processOpts,
   'bootclasspath:s'  => \&processOpts,
   'ARGS'   => \&processSwitch,
   'jre=s'   => \&processOpts,
   'analyze' => \&processSwitch,
   'binary'  => \&processSwitch,
   'ocmrf=s' => \&processOpts,
   'systemsnapshotfilepath=s' => \&processOpts,
   'phBaseDir=s' => \&processOpts,
   'container=s' => \&processOpts,
   'parentid=s' => \&processOpts,
   'topology=s' => \&processOpts,
   'host=s' => \&processOpts,
   'port=s' => \&processOpts,
   'norestart'  => \&processSwitch,
   'sidbonly'  => \&processSwitch,
   'sid=s' => \&processOpts,
   'oh=s'    => \&processOpts,
   'oui=s'    => \&processOpts,
   'invPtrLoc=s'    => \&processOpts,
   'wallet=s' => \&processOpts,
   'logLevel=s' => \&processOpts,
   'log=s' => \&processOpts,
   'session=s' => \&processOpts,
   'help|h'  => \&processSwitch,
   'generateSteps'  => \&processSwitch,
   'remote'  => \&processSwitch,
   'nonrolling'  => \&processSwitch,
   'database=s'  => \&processOpts,
   'prepare-clone'  => \&processSwitch,
   'switch-clone'  => \&processSwitch,
   'sidb'   => \&processSwitch
  );
  
