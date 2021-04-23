Summary
-------
This is the README file for OPatch 12.2.0.1.15, the Oracle Interim One-off
Patch Installer.

This patch (6880880) installs the "OPatch" utility. OPatch is used for patching
Oracle software. If you have an older version of opatch it is strongly
recommended to back it up before upgrading to the new OPatch.

OPatch is Oracle's only supported method of installing interim patches. It updates
the central and per-product inventories with the details of the patch.

OPatch 12.2.0.1.15 can only be used for OUI based Oracle Homes. The OUI version
must be 12.*. OPatch has been updated to work with both OUI 12.1 and 12.2 homes.

How to install the utility:
---------------------------

To install this patch, Please extract the file "zipped file" using unzip or winzip,
depending upon the platform. You should extract the zip file directly under the
ORACLE_HOME. Please follow the following steps for extracting the zip file of OPatch.

(1)  Please take a backup of ORACLE_HOME/OPatch into a dedicated backup
location.
(2) Please make sure no directory ORACLE_HOME/OPatch exist.
(3) Please unzip the OPatch downloaded zip into ORACLE_HOME directory.

To check the version of the opatch utility installed in the above step,
go to the OPatch directory and run "opatch version".

How to run the utility:
-----------------------

OPatch tool requires JDK (or) JRE to be present in the Oracle Home. 
It requires JDK/JRE version of 1.5.0 or higher to function properly.

It can be invoked directly using

    <path to OPatch>/opatch [<patch command>] [options]

You can use the following command format to view help information:

    <path to OPatch>/opatch [<patch command>] -help

OPatch can be manually invoked using Perl:

    <path to Perl>/perl <path to OPatch>/opatch.pl <patch command> [options]

You can use the following command format to view help information:

    <path to Perl>/perl <path to OPatch>/opatch.pl  [<patch command>] -help

There is a User's Guide in the 'docs' subdirectory that has full
details on running the tool. There is FAQ file in the same directory
that answers many of the common questions.

If you don't have Perl, you can download Perl from Metalink
(http://myoraclesupport.oracle.com) using Bug 2417872. Source code for perl
is also available from http://www.cpan.org (the Comprehensive Perl
Archive Network). Links to binary versions of perl for supported
operating systems is also provided on the CPAN web site.

You can download the required version of JDK/JRE from 
http://www.oracle.com/technetwork/java/index.html

Special Instructions:
---------------------
Windows:
--------
  1) If your "Central Inventory" is not under
       C:\Program Files\oracle\inventory, please set env. var. INVENTORY_LOC
            to the value of the registry key
                 \\HKEY_LOCAL_MACHINE\Software\Oracle\inst_loc

  2) Make sure you have java.exe in your PATH

========================================================================

