#!$ORACLE_HOME/perl/bin/perl
# 
# $Header: nlsrtl3/admin/nlsdata/old/cr9idata.pl /main/5 2017/10/27 14:10:26 qma Exp $
#
# cr9idata.pl
# 
# Copyright (c) 2004, 2017, Oracle and/or its affiliates. All rights reserved.
#
#    NAME
#      cr9idata.pl - A perl script to assist creating 9idata/ under
#                    $ORACLE_HOME/nls/data/. After successfully run
#                    the script, please set $ORA_NLS10 to 
#                    $ORACLE_HOME/nls/data/9idata
#    PARAMETERS
#      The script takes one optional argument,
#         cr9idata.pl [-silent]
#      Specifying '-silent' suppresses all non-error messages
#
#    DESCRIPTION
#      The script copies every nlb files under $ORACLE_HOME/nls/data and 
#      $ORACLE_HOME/nls/data/old to directory $ORACLE_HOME/nls/data/9idata
#      for customer needs to revert back to 9i locale behavior.
#
#    NOTES
#      To execute this file, type: 
#      % perl cr9idata.pl
#
#      To suppress non-error messages, use:
#      % perl cr9idata.pl -silent
#
#    MODIFIED   (MM/DD/YY)
#    qma         10/27/17 - Bug 26584705: use perl from ORACLE_HOME
#    qma         12/02/15 - Bug 22291453: remove deprecated Perl functions
#    qma         07/23/10 - Fix bug 9893631
#    chaowang    03/24/04 - Creation
# 
use English;         
use strict;          

# Bug 22291453: Remove deprecated and unused Perl functions:
#
#   File:CheckTree is deprecated
#   File::Path is not used
#
use File::Spec;
use File::Copy;

     my $silent = 0;
     my $Oracle_Home = "";

     if ($ARGV[0])
     {
         if ($ARGV[0] eq '-silent')
         {
             $silent = 1;
         }
         else
         {
             print "Unrecognized option specified.\n";
             print "Usage: perl $0 [-silent]\n";
             exit 1;
         }
     } 

     $Oracle_Home = $ENV{ORACLE_HOME} || "";

# If $Oracle_Home is not set, raise an error. 
     if ( ! $Oracle_Home ) {
	 print "\$ORACLE_HOME is not set. Can't proceed.\n";
	 exit 0;
     }  


# If $Oracle_Home isn't a directory raise an error.
     if ( ! -d $Oracle_Home || ! -e $Oracle_Home ) 
     {
	 print "\$ORACLE_HOME $Oracle_Home doesn't exist or is not a directory.\n";
	 exit 0;
     }

# If $Oracle_Home is in MicroSoft OS, lowercase the string.
     if ( $OSNAME =~ m#Win32# ) {
	     $Oracle_Home = lc ( $Oracle_Home );
     } else {
	  # If $Oracle_Home is a symbolic link, convert it to the real path
	 my $is_link = is_symbolic_link ( $Oracle_Home );
	 if ( $is_link == 1 ) {
	     my $real_OH = resolve_symbolic_link ($Oracle_Home);
	     $Oracle_Home = $real_OH;
	 }
    }
    
    # If there is an $Oracle_Home strip any trailing "/" or "\" from it.
    # This upsets the OUI APIs for some reason.
    if ( $Oracle_Home =~ m#[\\/]$# ) {
        ( $Oracle_Home ) = ( $Oracle_Home =~ m#(.+)[\\/]\s?$# );
    }

# Now creat a new directory at $ORACLE_HOME/nls/data/9idata
	 my @dir9i = "";
	 my $data_path = "";
	 my $data9i_path = "";
	 my $olddata_path = "";

 	 push(@dir9i, $Oracle_Home);
	 push(@dir9i, "nls");
	 push(@dir9i, "data");

# compose $ORACLE_HOME/nls/data
    $data_path = File::Spec->catdir( @dir9i );  

	 push (@dir9i, "9idata");

# compose $ORACLE_HOME/nls/data/9idata
	 $data9i_path = File::Spec->catdir( @dir9i );  
	 
# compose $ORACLE_HOME/nls/data/old
	 pop (@dir9i);
	 push (@dir9i, "old");

	 $olddata_path = File::Spec->catdir( @dir9i );  

# If $Oracle_Home is in MicroSoft OS, path separator needs to be replace with UNIX 
# convention in order to use -e and -d testing.
     if ( $OSNAME =~ m#Win32# ) {
	$data_path = $Oracle_Home."/nls/data";
	$data9i_path = $Oracle_Home."/nls/data/9idata";
	$olddata_path = $Oracle_Home."/nls/data/old";

     }
     

# Check if the 9idata directory is already existed
	 if (-e $data9i_path) {
	     print "Directory $data9i_path already exist. Overwriting...\n";
	 }
	 elsif (!-e $data_path) {
	     print "Directory $data_path doesn't exist. Can't proceed.\n";
             exit 0;
	 }
	 else {
             if (!$silent)
             {
	         print "Creating directory $data9i_path ...\n";
             }
	     my $success = mkdir($data9i_path, 0777);

	     if (!$success)
	     {
	       print "Can't mkdir $data9i_path.\n";
	       exit 0;
	     }
	 }


         if (-d $data9i_path) {
             if (!$silent)
             {
		 print "Copying files to $data9i_path...\n";
             }
	 }
	 else {
		 print "Existing $data9i_path is not a directory. Can't perform copy. \n";
		 exit 0;
	 }	
    

# Now copy nls/data/* to nls/data/9idata/. and nls/data/old/* to nls/data/9idata/.

	 chdir ($data_path);
	 my @nlbfiles = "";
	 my $source = "";
	 my $dest = "";
	 my $nlbfile = "";
	 @nlbfiles = glob("*.nlb");
	 foreach $nlbfile (@nlbfiles) {
	     $source = File::Spec->catfile($data_path, $nlbfile);
	     $dest = File::Spec->catfile($data9i_path, $nlbfile);
	     
	     copy($source, $dest) || die "can't copy to $dest\n";
	 }
	 if (!-e $olddata_path)
	     
	 {
	     print "Directory $olddata_path doesn't exist. Can't proceed.\n";
	     exit 0;
	 }
	 chdir ($olddata_path);
	 @nlbfiles = glob("*.nlb");
	 foreach $nlbfile (@nlbfiles) {
	     $source = File::Spec->catfile($olddata_path, $nlbfile);
	     $dest = File::Spec->catfile($data9i_path, $nlbfile);
	     
	     copy($source, $dest) || die "can't copy to $dest\n";
	 }
         if (!$silent)
         {
	     print ("Copy finished. \nPlease reset environment variable ORA_NLS10 to $data9i_path!\n");
         }
	 

sub is_symbolic_link {

    my $this_class = @ARG;
    my $directory_to_check = $ARG[0];
    my $ret_value = 0;

    if ( ! -e $directory_to_check ) {
       $ret_value = -1;
    }

    # Try to expand directory_to_check with the link. If the expanded
    # directory is different from the original directory, the original
    # directory is a symbolic link
    chomp $directory_to_check;
    my @directory_bits = split (//, $directory_to_check);
    # components of the directory
    my @directory_components = split (/\//, $directory_to_check);

    # Directory passed to this subroutine to process, could be an
    # absolute path, where it starts with '/', then the processing
    # will be different from a path that is not absolute
    my $absolute_path = "";
    my $resolved_path = "";
    if ($directory_bits[0] eq "\/")
    {
        $absolute_path = "/";
        $resolved_path = "/";
        shift (@directory_components);
    }

    # Take each component at a time and expand it using readlink()
    my $directory = "";
    my $real_path = "";
    foreach $directory (@directory_components)
    {
        $absolute_path .= $directory;
    $! = "";
        $real_path = readlink ( $absolute_path);
        if ( $real_path eq "" ) {
            $real_path = $absolute_path;
            $resolved_path .= $directory . "/";
        }
        else {
            my @real_path_bits = split (//, $real_path);
            if ($real_path_bits[0] eq "\/")
            {
                if ( pop(@real_path_bits) eq "/" ) {
                $resolved_path = $real_path;
                }
                else {
                $resolved_path = $real_path . "/";
                }
                $absolute_path = $real_path;
            }
            else
            {
                $resolved_path .= $real_path . "/";
            }
        }
        $absolute_path .= "/";
    }

    # If the directory passed as argument ends with a '/' we want
    # to end resolved_path with a '/'. And if the directory passed
    # does not end with '/', resolved_path does not end with '/'
    my @resolved_path_bits = split (//, $resolved_path);
    if ($directory_bits[scalar(@directory_bits) - 1] eq "\/") {
        if ($resolved_path_bits[scalar(@resolved_path_bits) - 1] ne "\/") {
            $resolved_path .= "\/";
        }
    }
    else {
        if ($resolved_path_bits[scalar(@resolved_path_bits) - 1] eq "\/") {
            $resolved_path =~ s#\/$##;
        }
    }

    # if resolved_path, matches with $directory_to_check, this is not
    # a symbolic link, otherwise is a symbolic link
    if ( $resolved_path ne $directory_to_check ) {
       $ret_value = 1;
       return $ret_value;
    }

    return $ret_value;
}

sub resolve_symbolic_link {

    my $this_class = @ARG;
    my $directory_to_check = $ARG[0];

    if ( ! -e $directory_to_check || ! -d $directory_to_check )
    {
         return "";
    }

    # First check if this is a symbolic link. Normally this is not
    # required as user calls is_symbolic_link before making a call
    # to resolve_symbolic_link
    my $result = is_symbolic_link ( $directory_to_check );
    if ( $result == 1 )
    { # Is a symbolic link, so try to resolve
        chomp $directory_to_check;
        # Get each element of the directory string into an array
        my @directory_bits = split (//, $directory_to_check);
        # Get component of the directory string into an array
        my @directory_components = split (/[\/ ]+/, $directory_to_check);

        my $absolute_path = "";
       my $resolved_path = "";
        if ($directory_bits[0] eq "\/")
        {
            $absolute_path = "/";
            $resolved_path = "/";
            # if directory_to_check starts with a '/' then the first
            # element of @directory_components is a NULL string.
            # Following command solves the problem
            shift (@directory_components);
        }

        # Now the real processing starts. Take one component at a time
        # and try to expand the link.
        my $directory = "";
        my $real_path = "";
        my @resolved_path_bits = split (//, $resolved_path);
        foreach $directory (@directory_components)
        {
            $absolute_path .= $directory;
            $! = "";
            $real_path = readlink ( $absolute_path);
            if ( $real_path eq "" )
            {
                $real_path = $absolute_path;
                $resolved_path .= $directory . "/";
            }
            else
            {
                my @real_path_bits = split (//, $real_path);
                if ($real_path_bits[0] eq "\/")
                {
                    if ( pop(@real_path_bits) eq "/" )
                    {
                        $resolved_path = $real_path;
                    }
                    else
                    {
                        $resolved_path = $real_path . "/";
                    }
                    $absolute_path = $real_path;
                }
                else
                {
                    $resolved_path .= $real_path . "/";
                }
            }
            $absolute_path .= "/";
        }

        # If the directory passed as argument ends with a '/' we want
        # to end resolved_path with a '/'. And if the directory passed
        # does not end with '/', resolved_path does not end with '/'
        my @resolved_path_bits = split (//, $resolved_path);
        if ($directory_bits[scalar(@directory_bits) - 1] eq "\/")
        {
            if ($resolved_path_bits[scalar(@resolved_path_bits) - 1] ne "\/")
            {
                $resolved_path .= "\/";
            }
        }
        else
        {
            if ($resolved_path_bits[scalar(@resolved_path_bits) - 1] eq "\/")
            {
                $resolved_path =~ s#\/$##;
            }
	 }

        # Newly resolved symbolic link can be a symbolic link inturn.
        # Resolve that case now
        my $new_result = is_symbolic_link ( $resolved_path );
        if ($new_result == 1)
        {
            return ( resolve_symbolic_link ($resolved_path));
       }
        else
        {
       return $resolved_path;
        }

    }
    else
    {
       return $directory_to_check;
    }
}

# End of subroutine resolve_symbolic_link()
