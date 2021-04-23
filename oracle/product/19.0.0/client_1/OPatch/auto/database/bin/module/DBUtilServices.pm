package module::DBUtilServices;
use warnings;
use strict;

use Exporter qw(import);
use POSIX qw(uname);
use File::stat;
use File::Copy;
use File::Path qw(mkpath rmtree);
use File::Find;
use File::Basename qw(dirname basename);

use Cwd  qw(abs_path getcwd);
use lib dirname(abs_path($0));

our @EXPORT_OK = qw(getActiveUser getFileOwner getFileOwnerGroup changeFileOwner changeFilePermission getJavaHomePath getJreMemoryOptions copyRecursively createDirectory removeDirectory openFile closeFile writeFile readFile removeFile findFilePattern formatDuration readPropertiesFile copyFileEndsWith touchFile writePropertiesFile);
use module::CommandOptions qw(getOptValue optExists);

#Getting current executing user
sub getActiveUser{
 my @_userDetails=getpwuid($<);
 return $_userDetails[0];
}

#Getting file owner name
sub getFileOwner{
 my $file = $_[0];
 my $userName = getpwuid(stat($file)->uid);
 return $userName;
}

#Getting file owner name
sub getFileOwnerGroup{
 my $file = $_[0];
 my $grpName = getgrgid(stat($file)->gid);
 return $grpName;
}

sub isWindows{
  my $windows=0;
  my $osname = $^O;
  if( $osname eq 'MSWin32' ){
	$windows = 1;
  }
  
  return $windows
}

sub getJavaHomePath{
  my $currentHome=$_[0];
  my $OPT_JRE=$_[1];  
  
  my $JAVA="";
  my $JAVA_HOME="";
  my $JAVA_REL_PATH="/bin/";
  
  if(isWindows){
   $JAVA_REL_PATH=$JAVA_REL_PATH."java.exe";
  }else{
	$JAVA_REL_PATH=$JAVA_REL_PATH."java";
  }
  
  if(length($OPT_JRE) > 0){
     $OPT_JRE=~ s!/*$!!g;
     if(! -e $OPT_JRE){
     	 print("\n$OPT_JRE does not exist!Please provide a proper -jre option.\n");
    	 print("opatchauto returns with error code = 2\n");
    	 exit(2);
     }
     
     if(! -d $OPT_JRE) {
      	 print("\n$OPT_JRE is not a directory!Please provide a proper -jre option.\n");
    	 print("opatchauto returns with error code = 2\n");
    	 exit(2);
     }
     
     $JAVA=$OPT_JRE.$JAVA_REL_PATH;
     my $retVal=validateJavaHome($JAVA);
     if($retVal==2) {
     	print("\n$OPT_JRE is invalid!Please provide a proper -jre option.\n");
     	print("opatchauto returns with error code = 2\n");
       	exit(2);
     }    
     return $OPT_JRE;
  }  
  
  $JAVA_HOME=$currentHome."/OPatch/jre";
  $JAVA=$JAVA_HOME.$JAVA_REL_PATH;
 
  if(! -e $JAVA){
   $JAVA_HOME=$currentHome."/jdk";
   $JAVA=$JAVA_HOME.$JAVA_REL_PATH;
   if(! -e $JAVA){
     print("\nJava could not be located. opatchauto cannot proceed!\n");
     print("opatchauto returns with error code = 2\n");
     exit(2);
   }
  }
   my $retVal=validateJavaHome($JAVA);
     if($retVal==2) {
        print("\nNo valid java found for patching.opatchauto cannot proceed!\n");
     	print("opatchauto returns with error code = 2\n");
       	exit(2);
   }    
  return $JAVA_HOME;
}

sub validateJavaHome {
   my $JAVA=$_[0];
   my $retVal=1;
   if(! -x $JAVA){
    	print("\n$JAVA is not a valid executable for this platform.\n");
    	$retVal=2;
   }
   my $checkJavaVerResult=checkJavaVer($JAVA);
   if($checkJavaVerResult==1){
   		my $javaVerStr=`$JAVA -version 2>&1`;
    	$javaVerStr =~ m/java version \"(.{3})/s;
    	$javaVerStr=$1;
    	print("\nUnsupported Java version $javaVerStr.\nJava version should be 1.7 or higher.\n");
    	$retVal=2;
   }
   elsif($checkJavaVerResult==2){
    	print("\nCould not detect Java version from $JAVA. Please check if it is a valid executable for this platform.\n");
    	$retVal=2;
   }
   
   return $retVal;
}

#Get supplied jre version
sub getJreVersion{
  my $retVal=1;
  my $javaVerStr=`$_[0] -version 2>&1`;
  my $javaVer="";
 if ($javaVerStr =~ m/java version \"(.{3})/s ) {
   $javaVer=$1;
   $javaVer=~s/\.//;
 }
  return $javaVer;
}

#Checking java version is greater than 1.7
sub checkJavaVer{
  my $javaVersion=getJreVersion($_[0]);
  my $retVal=0;
  if ($javaVersion eq "") {
  	$retVal=2;
  }
  elsif ($javaVersion < 17 ) {
    $retVal=1;
  }
   return $retVal;
}

sub getJreMemoryOptions{
  my $oraParamIniFile=$_[0];
  my $jreMemoryOpts=$_[1];
  if(length $jreMemoryOpts <= 0){
      $jreMemoryOpts=extractJreMemoryOpts($oraParamIniFile);
	  $jreMemoryOpts=setDefaultHeap($jreMemoryOpts);
      $jreMemoryOpts=updateJreMemoryOptsForJRockit($jreMemoryOpts);
   }else{
    $jreMemoryOpts=setDefaultHeap($jreMemoryOpts);
	if(index($jreMemoryOpts, "-d64") == -1){
       my $tmpVal=extractJreMemoryOpts($oraParamIniFile);
       if($tmpVal =~ m/ \-d64/){
         $jreMemoryOpts=$jreMemoryOpts." -d64";
       }
    }
   }
   
   my $JAVA=$_[2];
   my $jreVersion=getJreVersion($JAVA);
   
   if($jreVersion >= 18){
    $jreMemoryOpts=~s/MaxPermSize/MaxMetaspaceSize/g;
   }
   return $jreMemoryOpts;
}

sub setDefaultHeap{
   # Set default memory to 3GB only in case of 64 bit Linux architecture and when CAS is in use.
   # When default heap setting is overwritten by OPATCH_JRE_MEMORY_OPTIONS, then do not modify value of heap setting.
   my $JRE_MEMORY_OPTIONS=$_[0];
   my @uname = uname();
   my $PLATFORM="$uname[0]";
   my $unameSize=@uname;
   my $ARCH=$uname[$unameSize-1];
   my $DEFAULT_HEAP="-Xmx768m";
   if($PLATFORM eq "Linux" && $ARCH eq "x86_64"){
      $DEFAULT_HEAP="-Xmx3072m"
   } else{
      $DEFAULT_HEAP="-Xmx1536m" 
   }
   if(length $JRE_MEMORY_OPTIONS > 0){
     if($JRE_MEMORY_OPTIONS =~ m/ \-X*mx[0-9][0-9]*m*G*/){
       $JRE_MEMORY_OPTIONS =~ s/ \-X*mx[0-9][0-9]*m*G*/ $DEFAULT_HEAP/;
     }else{
	   $JRE_MEMORY_OPTIONS=" ".$JRE_MEMORY_OPTIONS." ".$DEFAULT_HEAP;
     }
   }else{
     $JRE_MEMORY_OPTIONS=" ".$DEFAULT_HEAP;
   }
   if($PLATFORM eq 'HP-UX'){
      $JRE_MEMORY_OPTIONS=addXMpasOptionForHPUX($JRE_MEMORY_OPTIONS);
   }
   return $JRE_MEMORY_OPTIONS;
}

sub addXMpasOptionForHPUX{
   my $JRE_MEMORY_OPTIONS=$_[0];
   my $XMAPS_OPTION="-Xmpas:on";
   if(index($JRE_MEMORY_OPTIONS, $XMAPS_OPTION) == -1){
      $JRE_MEMORY_OPTIONS=$JRE_MEMORY_OPTIONS." ".$XMAPS_OPTION;
   }
   return $JRE_MEMORY_OPTIONS;
}

sub extractJreMemoryOpts{
  my $oraParamIniFile=$_[0];
  my $jreMemoryOpts="";
 if (-e $oraParamIniFile){
   open my $fh, '<', $oraParamIniFile or die "Could not open '$oraParamIniFile' $!\n";
    while (my $line = <$fh>){
     if($line=~s/JRE_MEMORY_OPTIONS=//){
        $jreMemoryOpts=$line;
        $jreMemoryOpts=~s/"//g;
        last;
     }
    }
    close $fh;
 }
 chomp $jreMemoryOpts;
 return $jreMemoryOpts;
}


sub updateJreMemoryOptsForJRockit{
 my $jreMemoryOpts=$_[0];
 if(defined $ENV{'JDK'}){
     my $JDK=$ENV{'JDK'};
     if($JDK =~ m/jrockit/){
       $jreMemoryOpts=~s/XX:MaxPermSize=/ms/;
     }
  }
  return $jreMemoryOpts;
}

sub changeFileOwner{
  my $userName=$_[0];
  my $grpName=$_[1];
  my $path=$_[2];
  my $uid=getpwnam($userName);
  my $gid=getgrnam($grpName);
 if (-d $path) {
   my $pwd = getcwd();
   chdir($path);
   find(sub{chown($uid, $gid,$_)}, $path);
   chdir($pwd);
  }else{
    chown($uid, $gid, "$path");
  }
  return 1;
}

sub findFilePattern{
 my $sourcedir=$_[0];
 my $filePattern=$_[1];
 my @filelist;
 my $pwd = getcwd();
 if (-d $sourcedir){
   chdir($sourcedir);
 } 
 find(sub { push @filelist, $File::Find::name }, $sourcedir);
 foreach my $filepath (@filelist){
     if ( $filepath =~ /$filePattern/){
	   chdir($pwd);
       return 1;
     }
 }
 chdir($pwd);
 return 0;
}

sub changeFilePermission{
  my $path=$_[0];
  my $permission=$_[1];
  if (-d $path) {
   my $pwd = getcwd();
   chdir($path);
   find(sub{chmod(oct($permission),$_)}, $path);
   chdir($pwd);
  }else{
    chmod($permission, "$path");
  }
  return 0;
}

sub copyRecursively{
  my $sourcedir = $_[0];
  my $destdir   = $_[1];
   my $filepath;
   my $filename;
   my @filelist;
   my $destfilepath;
   my $dirpath;
   my $pwd = getcwd();
   if (-d $sourcedir){
     chdir($sourcedir);
   }
   find(sub { push @filelist, $File::Find::name }, $sourcedir);
   chdir($pwd);
   
   foreach $filepath (@filelist)
   {
     if ( -f $filepath)
     {
        $filename = basename($filepath);
        $dirpath = dirname($filepath);
        $dirpath =~ s/$sourcedir/$destdir/g;
        if( !-e $dirpath){
         createDirectory($dirpath);
        }
        $destfilepath = "$dirpath/$filename";
        copy($filepath, $destfilepath);
     }
   }
}
sub copyFileEndsWith{
  my $sourcedir = $_[0];
  my $destdir   = $_[1];
  my $pattern   = $_[2];
  my @files;
  my $file;
  opendir(DIR, $sourcedir);
  @files = grep(/$pattern$/,readdir(DIR));
  closedir(DIR);
  foreach $file (@files) {
    my $sourcefile = "$sourcedir/$file";
    my $destfile =  "$destdir/$file";
    copy($sourcefile, $destfile);
  }
}



sub createDirectory{
  my $dir=$_[0];
  if(!-e $dir){
    eval { mkpath($dir) };
    if ($@) {
      print "Couldn't create $dir: $@";
      return 1;
    }
  }
  return 0;
}

sub removeDirectory{
  my $dir=$_[0];
  if(-e $dir){
    eval { rmtree($dir) };
    if ($@) {
      print "Couldn't remove $dir: $@";
      return 0;
    }
  }
  return 1;
}

sub removeFile{
 my $file = $_[0];
 if(-e $file) {
  unlink $file;
 }
 
 return 1;
}

sub openFile{
 my $mode=$_[1];
 my $file=$_[0];
 my $FileHandler;
 if($mode == 1){
   # Use the open() function to create the file.
   if(!open $FileHandler, ">".$file){
    print("\n perl say $! \n");
   }
}else{
   # Use the open() function to create the file.
  open $FileHandler,$file;
}
  return $FileHandler;
}


sub closeFile{
 my $FileHandler=$_[0];
 # close the file.
 close $FileHandler;
}

sub writeFile{
 my $fh=$_[0];
 my $content= $_[1];
 # Write some text to the file.
 print $fh "$content\n";
}

sub readFile{
 my $fh=$_[0];
 # Read the file one line at a time.
 my $line = <$fh>;
 return $line; 
}

sub readPropertiesFile{
 my $propertiesfile=$_[0];
 my %properties=();
 if( -e $propertiesfile){
    my $fh=openFile($propertiesfile,0);
    while (<$fh>) {    
		chomp;    
		my ($key, $val) = split /=/;    
		if($val) {
		    $properties{$key} = $val; 
		}
	}
	closeFile($fh);
 }
 return %properties; 
}

sub writePropertiesFile{
 my %properties=%{$_[0]};
 my $propertiesfile=$_[1];
 my $fh=openFile($propertiesfile,1);
 for my $key ( sort keys %properties ) {
	print $fh "$key=$properties{$key}\n";
 }
 closeFile($fh);
}

sub formatDuration{
 my $DUR = $_[0];
 my $MINVAL = int($DUR/60);
 my $SECVAL = $DUR%60;
 my $MINSTR = "minute";
 my $SECSTR = "second";
 if($MINVAL > 1) {
   $MINSTR = "minutes";
 }
 if($SECVAL > 1) {
   $SECSTR = "seconds";
 }
 return $MINVAL." ".$MINSTR.", ".$SECVAL." ".$SECSTR;
}

sub touchFile{ 
 my $file = $_[0];
 my $folder = $_[1];
 open ( my $TOUCH,">>",$file ) || die "\nThe current user does not have permission to write in the folder: '$folder'. Check owner and permission of this folder.";
 close $TOUCH; 
}