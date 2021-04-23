# detecthas.pl
#
##    DESCRIPTION
#      detecthas.pl -  Script to detect Oracle Clusterware/SIHA home and invoke java.
#
#       srukumar   05/09/12  - Creation
#
#
################ Documentation ################

# The SYNOPSIS section is printed out as usage when incorrect parameters
# are passed

=head1 NAME

  detecthas.pl -  Script to detect Oracle Clusterware/SIHA home and invoke java.
  
=head1 SYNOPSIS

  detecthas.pl <-oh  <oracle home location>>

  Options:
  
 -oh         Any valid oracle home location

=head1 DESCRIPTION


  This script detects the grid home on the localhost and using the libraries of the 
  grid home it invokes a program to collect more information about the grid/siha home.  

=cut

################ End Documentation ################ 
  
use strict;
use English;
use File::Spec::Functions;
use Getopt::Long;
use Pod::Usage;

use constant SUCCESS               =>  "1";
use constant FAILED                =>  "0";
use constant TRUE                  =>  "1";
use constant FALSE                 =>  "0";
use constant ERROR                 =>  "-1";

my $grid_home;
my $oracle_home;
my $findhas;
my $walletloc;
my $hostname;
my $java;

my $OS = `uname`;
chomp $OS;

my $olrloc;
my $isHelp;

GetOptions('oh=s'           => \$oracle_home,
		   'FINDHAS'  		=> \$findhas,
		   'walletloc=s'	=> \$walletloc,
		   'hostname=s'		=> \$hostname,
           'help!'          => \$isHelp) or pod2usage(1);


# Check validity of args
pod2usage(-msg => "Invalid extra options passed: @ARGV",
          -exitval => 2) if (@ARGV);
		  		  
 
##### Subroutines

sub parseOptions
{
   if ( ! $oracle_home )
   {
      print "ERROR: oracle home has not been provided.\n";
      pod2usage(3);
   }
   if ( ! -d $oracle_home )
   {
      print "ERROR: Specified oracle home is not a valid directory.\n";
      pod2usage(3);
   }
}

sub readGridHome
{
	my $grid_olr;
	my $key="crs_home";
	open (OLRFL, "<$olrloc") or die "ERROR: Unable to open $olrloc\n";
	
	while (<OLRFL>) {
      if (/^$key=(\S+)/) {
         $grid_olr = $1;
         last;
      }
    }
    close (OLRFL);
    return $grid_olr;
}

sub setEnvPaths
{
    my $home = shift;
	
	if ( $OS eq "Linux")
    {
		$ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH};
        # Linux ( ppc64 || s390x ) => LD_LIBRARY_PATH lib32
        my $arch = `uname -m`;
        if ( ($arch eq "ppc64") || ($arch eq "s390x") )
		{
		  $ENV{LD_LIBRARY_PATH} = "$home/lib32:$home/srvm/lib32:" . $ENV{LD_LIBRARY_PATH};
		}
		if ($arch =~ /x86_64/)
		{
		  $ENV{LD_LIBRARY_PATH} = "$home/oui/lib/linux64:" . $ENV{LD_LIBRARY_PATH};
		}
    }
    elsif ($OS eq "HP-UX")
    {
	    $ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH};
		$ENV{SHLIB_PATH} = "";
    }
    elsif ($OS eq "AIX" )
    {
	    $ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LIBPATH};
		$ENV{LIBPATH} = "$home/lib:$home/srvm/lib:" . $ENV{LIBPATH};
        $ENV{OBJECT_MODE} = "32_64";
    }
    elsif ( $OS eq "SunOS" )
    {
	    $ENV{LD_LIBRARY_PATH_64} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH_64};
		$ENV{LD_LIBRARY_PATH} = "$home/lib:$home/srvm/lib:" . $ENV{LD_LIBRARY_PATH};
    }
	
	$ENV{ORACLE_HOME} = $home;
}

sub getJava
{
    my $home = shift;
    my $java_loc = "$home/OPatch/jre/bin/java";
	my $version;
	
	my $located = FALSE;
	my $req_version = FALSE;
	
	if ( -e $java_loc)
	{
	  $located = TRUE;
	  $version = `$java_loc -version 2>&1 | head -n 1 | cut -d'"' -f2`;
	  if ($version =~ /1\.8/) 
	  {
	    return $java_loc;
	  }
	}
	
	#Now, look outside OPatch
	$java_loc = "$home/jdk/bin/java";
	if ( -e $java_loc)
	{
	  $located = TRUE;
	  $version = `$java_loc -version 2>&1 | head -n 1 | cut -d'"' -f2`;
	  if ($version =~ /1\.8/) 
	  {
	    return $java_loc;
	  }
	}
	
	if ( ! $located )
	{
	  print ("JAVA could not be located in the home $home\n");
	}
	else
	{
	  print ("JAVA required version not found in the home $home\n");
	}
	
	return "";
}

sub getClassPaths
{
  my $home = shift;
  
  my $classpath = getGenericDependencyCP($home) . ":" . getSRVMCP($home) . ":" . getOUICP($home)
                    . ":" . getOPatchAutoCoreCP($home) . ":" . getOpatchCoreCP($home) . ":" . getOPatchAutoDBCP($home) ;
  return $classpath;
}

sub getGenericDependencyCP
{
  my $home = shift;
  my $cpath = catfile($home, 'OPatch', 'modules', "thirdparty",
                "features" , "commons-compress.jar");
  $cpath .=  ":" . catfile($home, 'OPatch', 'modules', "features", "orapki.lib.jar");
  $cpath .=  ":" . catfile($home, 'jlib', 'netcfg.jar');
  
  return $cpath;
}

sub getSRVMCP
{
  my $home = shift;
  my $srvm_jlib = catfile($home, 'jlib');
  
  my $cpath = catfile($srvm_jlib, 'srvm.jar');
  $cpath .=  ":" . catfile($srvm_jlib, 'srvmasm.jar');
  $cpath .=  ":" . catfile($srvm_jlib, 'srvmhas.jar');
  
  return $cpath;
}

sub getOpatchCoreCP
{
  my $home = shift;
  my $opatch_jlib = catfile($home, 'OPatch', 'jlib');
  
  my $cpath = catfile($opatch_jlib, 'opatch.jar');
  $cpath .=  ":" . catfile($opatch_jlib, 'opatchsdk.jar');
  
  return $cpath;
}

sub getOUICP
{
  my $home = shift;
  my $oui_jlib = catfile($home, 'oui', 'jlib');
  
  my $cpath = catfile($oui_jlib, 'OraInstaller.jar');
  $cpath .=  ":" . catfile($oui_jlib, 'OraPrereq.jar');
  $cpath .=  ":" . catfile($oui_jlib, 'share.jar');
  $cpath .=  ":" . catfile($oui_jlib, 'orai18n-mapping.jar');
  $cpath .=  ":" . catfile($oui_jlib, 'xmlparserv2.jar');
  $cpath .=  ":" . catfile($oui_jlib, 'emCfg.jar');
  $cpath .=  ":" . catfile($oui_jlib, 'ojmisc.jar');
  
  return $cpath;
}

sub getOPatchAutoCoreCP
{
  my $home = shift;
  my $opatchautocore = catfile($home, 'OPatch', 'auto', 'core');
  my $features = catfile( $opatchautocore, 'modules', 'features');
  
  my $cpath = catfile($features, 'oracle.glcm.opatchauto.core.classpath.jar');
  $cpath .=  ":" . catfile($features, 'oracle.glcm.oplan.core.classpath.jar');
  $cpath .=  ":" . catfile($features, 'oracle.glcm.osys.core.classpath.jar');
  $cpath .=  ":" . catfile($opatchautocore, 'modules', 'legacyoui', 'legacyoui.classpath.jar');
  $cpath .=  ":" . catfile($home, 'OPatch', 'modules', 'features', 'oracle.glcm.opatch.common.api.classpath.jar');
  
  return $cpath;
}

sub getOPatchAutoDBCP
{
  my $home = shift;
  my $opatchautodb = catfile($home, 'OPatch', 'auto', 'database');
  
  my $cpath = catfile($opatchautodb, 'modules', 'oracle.glcm.opatchauto.db.systemmodel.classpath.jar');
  $cpath .=  ":" . catfile($opatchautodb, 'modules', 'oracle.glcm.opatchauto.db.utils.classpath.jar');
  $cpath .=  ":" . catfile($opatchautodb, 'modules', 'oracle.glcm.opatchauto.db.helper.classpath.jar');
  $cpath .=  ":" . catfile($home, 'OPatch', 'plugins', 'opatchauto', 
                 'modules', 'oracle.glcm.opatchauto.db.actions.classpath.jar');
  
  return $cpath;
}

#### MAIN BODY	

#Parse the cmd line options.
parseOptions();

#Figure out the olr.loc location
if ( $OS eq "Linux")
{
	$olrloc = "/etc/oracle/olr.loc";
}
elsif ($OS eq "HP-UX")
{
	$olrloc = "/var/opt/oracle/olr.loc";
}
elsif ($OS eq "AIX" )
{
	$olrloc = "/etc/oracle/olr.loc";
}
elsif ( $OS eq "SunOS" )
{
	$olrloc = "/var/opt/oracle/olr.loc";
}
else
{
  die "ERROR: $OS is not a supported Operating System\n";
}

#We cannot proceed without the olr.loc file
if ( ! -e $olrloc )
{
  die "ERROR: $olrloc does not exist.\n";
}

#Detect grid home from olr.loc
$grid_home = readGridHome();
if ( ! -d $grid_home )
{
  die "ERROR: CRS home not found in $olrloc\n";
}
if ($findhas)
{
	print("CRSHOME:".$grid_home);
	exit(0);
}

# Set the env variables like LD_LIBRARY_PATH
setEnvPaths( $grid_home );

#Detect the correct java
$java = getJava( $grid_home );

if ( -x $java)
{
  print "Using JAVA from $java\n";

}else
{
  die "JAVA does not have executable permissions : $java \n";
}

#Run the java session to read grid information
my $command = "$java -cp " 
                 . getClassPaths($grid_home) 
				 . " -DOPatch.ORACLE_HOME=\"$grid_home\" " 
                 . " -DOPatchAuto.HOME=$grid_home -DOPatch.OUI_LOCATION=\"$grid_home/oui\" "
                 . " com.oracle.glcm.patch.auto.db.util.RemoteHostReader "
                 . " -oh $oracle_home -walletloc $walletloc -hostname $hostname";

#print "\n LD_LIBRARY_PATH: $ENV{LD_LIBRARY_PATH}\n";

#print "\n ORACLE_HOME: $ENV{ORACLE_HOME}\n";

#print "\nUsing the command: $command \n\n";

my $result = system($command);

if ( $result == 0)
{
  print "Successfully detected grid features.\n";
}
else
{
  print "Failed to collect grid details\n";
}

exit $result;