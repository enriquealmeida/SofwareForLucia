package module::CommandOptions;

use warnings;
use strict;

use Exporter qw(import);

our @EXPORT_OK = qw(processArgs processOpts processSwitch addOpt addOptAtBeginning removeOpt removeAllOpt getArgumentCnt getArguments getOptValue optExists isDescSession isActionSession isApplySession isRollbackSession isResumeSession isQuerySession isValidArguments isReportSession);
our %commandOpts= ();
my @commandList=("-jre","-analyze","-binary","-oh","-oui","-invPtrLoc","-wallet","-logLevel","-log","-session","-container","-ocmrf","-systemsnapshotfilepath","-phBaseDir",
                 "-help","-h","-nonrolling","-generatesteps","-topology","-host","-port","-sid","-remote","-sdb","-sidbonly","-dg","-shardgroup","-shardspace","-norestart",
                 "-parentid","-database","-inplace","-prepare-clone","-switch-clone","-outofplace","-rhp","-create-image","-apply-image","-working-copy","-path","-id","-switch","-loglevel","-type","-format","-output","-bootStrapCompleted","-force_conflict","-skip_conflict","-no_relink");
our @commandOptsArray= ();
my $argumentSize=$#ARGV;
my @orginalArgs=@ARGV;

 sub addOptAtBeginning{
    my $key = $_[0];
    my $value = $_[1];
    $commandOpts{$key}=$value;
    unshift @commandOptsArray, $key;
 }

 sub addOpt{
    my $index=getArgumentCnt();
    my $key = $_[0];
    my $value = $_[1];
    $commandOpts{$key}=$value;
    $commandOptsArray[$index]=$key;
  }
  
  sub removeOpt{
   my $key = $_[0];
   if(exists $commandOpts{$key}){
    delete($commandOpts{$key});
    my $index = 0;
    $index++ until $commandOptsArray[$index] eq $key;{splice( @commandOptsArray, $index, 1 );}
    return 1; 
   }
   
   return 0;
 }
 
  sub removeAllOpt{
   %commandOpts = ();
   @commandOptsArray = ();
   return 0;
 }
  
  sub getArgumentCnt(){
    my @keys = keys %commandOpts;
    my $mysize = @keys;
    return $mysize;
  }
  
  #This will return value only for option not for switch/values.
  sub getOptValue{
    my $key = $_[0];
    return $commandOpts{$key}
  }
  
  #This will 1 if the key is available Otherwise return 0.
   sub optExists{
    my $key = $_[0];
    my $exist=exists($commandOpts{$key})?1:0;
    return $exist;
  }
  
 sub isDescSession{
  my $_scriptDir=$0;
  return optExists('help')==1 || optExists('version')==1 || optExists('lsphases')==1 || optExists('lsplans')==1;
 }
 
 sub isActionSession{
  return optExists('action');
 }
 
 sub isApplySession{
  return optExists('apply');
 }
 
 
 sub isRollbackSession{
  return optExists('rollback');
 }
  
 sub isResumeSession{
  return optExists('resume');
 }
 
 sub isReportSession{
  return optExists('report');
 }
 
 sub isQuerySession{
  return optExists('query');
 }
   
 sub processArgs{
     addOpt($_[0],"arg");
 }
   
  sub processOpts{
  	addOpt($_[0],$_[1]);
  }
  
  sub processSwitch{
    addOpt($_[0],"switch");
  }
 
 sub getArguments{
   my $value="";
   my $arguments="";
   foreach my $key (@commandOptsArray) { 
    $value=$commandOpts{$key};
    if($value eq "arg"){
       $arguments=$arguments.' '.$key;
    } elsif( $value eq "switch"){
       $arguments=$arguments.' -'.$key;
    } else{
       $arguments=$arguments.' -'.$key.' '.$value;
    }
  } 
  $arguments =~ s/^\s+|\s+$//g;
  return $arguments;
}

 sub isValidArguments{
   my $value="";
   foreach my $key (@commandOptsArray) {
      $value=$commandOpts{$key};
      if (($value ne "arg") && ($value ne "switch")) {
         if ( grep( /^$value$/, @commandList)) {
            print("\nInvalid value \"$value\" specified for argument: $key\n");
            return 0;
         }
      }
   }
   return 1;
 }

1;