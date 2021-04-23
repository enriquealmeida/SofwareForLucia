package module::DBValidationUtil;
use v5.8.8;
use strict;
use warnings;

use Cwd  qw(abs_path);
use Exporter qw(import);
use File::Basename qw(dirname basename);
use Cwd  qw(abs_path);
use lib dirname(abs_path($0));
use module::CommandOptions qw(getOptValue optExists  isApplySession isRollbackSession isResumeSession);

our @EXPORT_OK = qw(validateUserLocalSession validateUserRemoteSession validateOPatchIsTriggeredFromOneOfOH isDirectoryExists);


#Check whether current user executing is either root/home owner.
sub validateUserLocalSession{
  my $currentUser = $_[0];
  my $homeOwner = $_[1];
  if(!($currentUser eq 'root' ||  $currentUser eq $homeOwner)){
   	return 1;
  }
}

sub validateUserRemoteSession{
   my $currentUser = $_[0];
   my $homeOwner = $_[1];
  
   if(!($currentUser eq $homeOwner)){
     return 1;
   }
  
   return 0
}

sub validateOPatchIsTriggeredFromOneOfOH{
    my $identifiedHome=$_[0];
    $identifiedHome=~ s!/*$!!g;
    my $foundMatch=0;
    my $oh=$_[1];
    my @ohList = split(/,/, $oh);
    foreach my $home (@ohList) {
      $home=~ s!/*$!!g;
      $home= abs_path($home);
      if($home eq $identifiedHome){
        $foundMatch=1;
        last;
      }
    }
   return $foundMatch==1?0:1;
}

sub isDirectoryExists{
   my $directory =$_[0];
   my $foundMatch=0;
   if(-e $directory){
      $foundMatch=1;
   }
   return $foundMatch;
}