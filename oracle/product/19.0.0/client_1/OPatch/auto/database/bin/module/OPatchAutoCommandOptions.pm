package module::OPatchAutoCommandOptions;

use warnings;
use strict;

use Exporter qw(import);
use Getopt::Long qw(GetOptions);
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));
use module::CommandOptions qw(processArgs processOpts  processSwitch addOpt removeOpt removeAllOpt getArgumentCnt getArguments getOptValue optExists isDescSession isActionSession isApplySession isRollbackSession);
Getopt::Long::Configure(qw{no_auto_abbrev no_ignore_case_always pass_through});

GetOptions(
   '<>'      => \&processArgs,
   'jre=s'   => \&processOpts,
   'analyze' => \&processSwitch,
   'binary'  => \&processSwitch,
   'oh=s'    => \&processOpts,
   'oui=s'    => \&processOpts,
   'invPtrLoc=s'    => \&processOpts,
   'wallet=s' => \&processOpts,
   'logLevel=s' => \&processOpts,
   'loglevel=s' => \&processOpts,
   'log=s' => \&processOpts,
   'session=s' => \&processOpts,
   'container=s' => \&processOpts,
   'ocmrf=s' => \&processOpts,
   'systemsnapshotfilepath=s' => \&processOpts,
   'phBaseDir=s' => \&processOpts,
   'help|h'  => \&processSwitch,
   'nonrolling'  => \&processSwitch,
   'generatesteps'  => \&processSwitch,
   'topology=s' => \&processOpts,
   'host=s' => \&processOpts,
   'port=s' => \&processOpts,
   'sid=s' => \&processOpts,
   'remote'  => \&processSwitch,
   'sdb'  => \&processSwitch,
   'sidbonly'  => \&processSwitch,
   'dg'  => \&processSwitch,
   'shardgroup=s'  => \&processOpts,
   'shardspace=s'  => \&processOpts,
   'norestart'  => \&processSwitch,
   'parentid=s' => \&processOpts,
   'database=s'  => \&processOpts,
   'inplace'  => \&processSwitch,
   'prepare-clone'  => \&processSwitch,
   'switch-clone'  => \&processSwitch,
   'outofplace'  => \&processSwitch,
   'sidb'   => \&processSwitch,
   'rhp'  => \&processSwitch,
   'create-image'  => \&processSwitch,
   'apply-image'  => \&processSwitch,
   'working-copy=s'  => \&processOpts,
   'path=s'  => \&processOpts,
   'id=s'  => \&processOpts,
   'type=s'    => \&processOpts,
   'output=s'  => \&processOpts,
   'format=s'  => \&processOpts,
   'switch'  => \&processSwitch,
   'bootStrapCompleted'  => \&processSwitch,
   'force_conflict'  => \&processSwitch,
   'skip_conflict'  => \&processSwitch,
   'no_relink'  => \&processSwitch
  );
