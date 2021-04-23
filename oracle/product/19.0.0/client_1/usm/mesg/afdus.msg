/
/* Copyright (c) 2009, 2017, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   afdus.msg
/ DESCRIPTION
/   Message file for ASM Filter Driver (AFD)
/ NOTES
/   If any message is modified, please update the corresponding message
/   in files usm/src/cmds/*afd* .
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   ssprasad       06/19/17  - 26286799: Add 9552
/   ssprasad       05/23/17  - #26035896: Fix a few msgs after TGIP changes
/   mnollen        03/30/17  - Add msg 104 and 9294
/   ssprasad       02/15/16  - Add 654
/   gayavenk       09/02/15  - new mesgs for windows afd driver
/   ssprasad       07/14/15  - Update msg 651
/   ssprasad       06/22/15  - Add 9213
/   lcarvall       06/17/15  - Fix Bug 20952520 - AFD does not support LXC env
/   jorhuert       03/03/15  - Update messages 9118 and 9119
/   jochoa         03/02/15  - bug/20430869: rootupgrade diagnostics for
/                              an acfs error
/   ssprasad       10/21/14  - bug/19863885: Add 9205/9206/9212
/   siyarlag       07/15/14  - bug/18900953: elaborate messages
/   ssprasad       02/24/14  - add afdinstall.exe messages for Windows
/   shmubeen       10/21/13  - Add 9350, 9390
/   ssprasad       10/15/13  - AFD Logging Support
/   shmubeen       09/16/13  - bug# 17447313
/   shmubeen       07/18/13  - change 603 message
/   shmubeen       06/03/13  - Add 9156 and 9121
/   argardu        08/31/12  - Deleted 646. Added 651
/   shmubeen       05/04/12  - Created
/
///////////////////////////////////////////////////////////
//         ALL ERROR CODES MUST BE 5 CHARACTERS          //
///////////////////////////////////////////////////////////
/ MSG GROUP                ERROR CODE RANGE
/ ---------                ----------------
/ unused                   00000-00600
/ afdroot, afdload         00601-00999
/
//

/ 00100-00499 are words, phrases, fragments to be translated and used
/             without MsgId to display state information using, e.g. the
/             OFSMSG_TFRAG macro.
/
/             THESE MAY NOT BE COMBINED TO BUILD OTHER SENTENCES
00116, 0, "Internal error."
// *Cause:  An Oracle internal error occurred.
// *Action: Contact Oracle Support Services.

/
/ ASM Filter Driver Messages
/
00601, 0, " afdroot install: Install AFD components."
//* Document: NO
00602, 0, " %s [-h] [-s | -v] [-l <directory>]"
//* Document: NO
00603, 0, "        [-h]             - print help/usage information"
//* Document: NO
00604, 0, "        [-s]             - silent mode (error messages only)"
//* Document: NO
00605, 0, "        [-v]             - verbose mode"
//* Document: NO
00606, 0, "        [-l <directory>] - location of AFD install files directory"
//* Document: NO
00607, 0, " afdroot uninstall: Uninstall AFD components."
//* Document: NO
00608, 0, " Usage: afdroot uninstall [-h] [-s | -v]"
//* Document: NO
00609, 0, "        [-p]             - preserve tunable parameters"
//* Document: NO
00610, 0, " afdroot version_check: Check AFD version."
//* Document: NO
00611, 0, " Usage: afdroot version_check [-h]"
//* Document: NO
00615, 0, " For more information, use afdroot <command> -h"
//* Document: NO
00616, 0, "Valid AFD distribution media detected at: '%s'"
//* Document: NO
00617, 0, "No AFD distribution media detected at location: '%s'"
//* Document: NO
00618, 0, "AFD is not supported on this operating system: '%s'"
// *Cause:  An afdroot or afdload or afddriverstate command was issued on 
//          an operating system to which AFD device drivers have not been ported.
// *Action: None. 
00619, 0, "The '%s' machine architecture is not supported."
// *Cause:  An afdroot or afdload or afddriverstate command was issued on 
//          an operating system or an architecture to which AFD device drivers
//          have not been ported.
// *Action: Contact Oracle Support Services to determine if an updated driver 
//          is available for this operating system and architecture, or install AFD on a 
//          supported architecture and operating system.
00620, 0, "AFD is not supported on this operating system version: '%s'"
// *Cause:  An afdroot or afdload or afddriverstate command was issued on 
//          an operating system to which version AFD device drivers
//          have not been ported.
// *Action: None. 
00621, 0, "The user executing this command does not have permission to execute Perl in '%s'."
// *Cause:  An afdroot or afdload command was issued by a user who is not the owner of perl binary.
//          Perl permissions are read/write/execute owner (0700). 
// *Action: Enter the db home as an argument to -orahome.  Ensure that
//          the user executing the command has execute permission on the
//          perl binary in that db home.
00622, 0, "usage: %s {installed | loaded | version | supported} [-s]"
00623, 0, "Root access required"
// *Cause:  An afdroot or afdload coommand was issued that requires higher operating system
//          privileges that those of the issuing user.
// *Action: Run afdroot or afdload command as a user with root privileges.
00625, 0, "AFD installation cannot proceed:"
//* Document: NO
00626, 0, "AFD driver media location is '%s'"
//* Document: NO
00627, 0, "AFD distribution files found."
//* Document: NO
00628, 0, "AFD installation cannot proceed:"
// *Cause:  Previous errors have caused the installation to reach a point where
//          it cannot continue.
// *Action: Resolve the issues reporting in preceding messages, 
//          then restart the installation.
00629, 0, "Failed to unload AFD drivers. A system reboot is recommended."
// *Cause:  An unexpected condition has been detected for which a system
//          reboot is the best course of action.
// *Action: Reboot the system.
00630, 0, "Installation cannot proceed: Failed to unload AFD drivers."
// *Cause:  The installation found that one or more applications is using the drivers.
// *Action: Terminate applications that may be using the drivers,
//          and retry the installation.
00632, 0, "Existing AFD installation detected."
//* Document: NO
00633, 0, "No AFD installation detected."
//* Document: NO
00634, 0, "Removing previous AFD installation."
//* Document: NO
00635, 0, "Previous AFD components successfully removed."
//* Document: NO
00636, 0, "Installing requested AFD software."
//* Document: NO
00637, 0, "Loading installed AFD drivers."
//* Document: NO
00638, 0, "AFD installation correctness verified."
//* Document: NO
00639, 0, "AFD installation failed."
//* Document: NO
00640, 0, "Failed to install AFD files."
//* Document: NO
00641, 0, "Checking for existing AFD installation."
//* Document: NO
00642, 0, "AFD not installed"
// *Cause:  No AFD drivers or commands were found on the system.  
// *Action: Install components using 'afdroot install <options>'.
00643, 0, "Validating AFD installation files for operating system."
//* Document: NO
00644, 0, "AFD drivers not correct for this operating system - cannot load."
// *Cause:  The device drivers installed are not compatible with the 
//          operating system
// *Action: Run 'afdroot install <options>' to install the correct drivers.
00645, 0, "Not all AFD drivers have been loaded."
// *Cause:  AFD device drivers have been started but not all
//          of them are detected as running. 
// *Action: Issue command 'afdload stop' followed by 'afdload start'.   
//          If that does not start all drivers, contact Oracle Support 
//          Services.
00647, 0,  "The AFD drivers are supported but have not been verified on this operating system version."
// *Cause: The drivers have not been explicitly tested on this operating system
//         version but are expected to work properly. 
// *Action: This message is informational.
00648, 0, "Issuing command 'afdroot install' to install compatible AFD drivers."
//* Document: NO
00649, 0, "Verifying AFD devices."
//* Document: NO
00650, 0, "Failed to load AFD drivers. A system reboot is recommended."
// *Cause:  An unexpected condition has been detected for which a system
//          reboot is the best course of action.
// *Action: Reboot the system.
00651, 0, "Usage: %s [-h] [-orahome <home_path>] {installed | loaded | version | supported} [-s]"
// *Cause:  An 'afd' command was issued with invalid arguments or
//          with the '-h' option.
// *Action: Use syntax as specified in the 'Usage' message.
00652, 0, "Manual loading is not permitted for driver %s on this operating system"
// *Cause:  An attempt to load the indicated driver was rejected because manual  
//          loading of the driver was not supported on the current operating system.
// *Action: None.
00653, 0, "Waiting for driver %s to unload."
// *Cause:  Unload of indicated driver was failing due to system activity
//          on one or more disks accessed through the ASM Filter Driver.
// *Action: If the unload does not complete, take the disks offline or reboot the node.
00654, 0, "AFD is not supported on Exadata systems"
// *Cause:  An Automatic Storage Management Filter Driver (AFD) command was
//          issued on an Exadata system, where AFD is not supported.
// *Action: None. 

/
/ Message from acfsus.msg
/
09109, 0, "%s driver failed to load."
// *Cause:  The driver failed to load.
// *Action: View the system specific operating system kernel log
//          (for instance, /var/log/messages on Linux, Event Log on Windows).
//          If the drivers have not previously been unloaded
//          ('crsctl stop crs', 'afdload stop', 'afdroot uninstall'), it is
//          not possible to reload them.
//          If a specific error has occurred, than clear the error condition
//          and try again.  If the operating system and/or architecture is not
//          supported by the drivers, then contact
//          Oracle Support Services for an updated driver package.
09115, 0, "The command '%s' returned an unexpected value."
// *Cause:  An internal error occurred during the installation process.
// *Action: Restart the installation process.
09118, 0, "Driver %s in use - cannot unload."
// *Cause:  This may be seen during 'crsctl stop crs', 'afdload stop', or
//          'afdroot uninstall'. It was found that one more applications is 
//          using the drivers.
// *Action: Terminate applications that may be using the driver
//          and retry.
09119, 0, "Driver %s failed to unload."
// *Cause:  An unknown error occurred when trying to unload the driver.
// *Action: Check system specific logs (/var/adm/messages on Linux,
//          Event Log on Windows) and clear any error conditions that are
//          preventing the unload.
09120, 0, "The '%s' machine architecture is not supported."
// *Cause:  The AFD device driver has not yet been ported to this architecture
//          or operating system.  This occurs when the customer manually 
//          tries to load the driver on an architecture or operating system 
//          type on which AFD is not supported.
// *Action: Contact Oracle Support Services to determine if AFD support
//          is available for this operating system and architecture, 
//          or install AFD on a supported architecture and operating system.
09121, 0, "failed to detect control device '%s'"
// *Cause:  The command 'afdload start' failed to create a control device.
// *Action: Issue the commands 'afdload stop' followed by 'afdload start'.
//          If the issue persists, contact Oracle Support Services.
09122, 0, "Device '%s' is not a character device."
// *Cause:  AFD device drivers were started but the device
//          was not the expected type.
// *Action: Contact Oracle Support Services.
09125, 0, "AFD is not supported on this operating system: '%s'."
// *Cause:  A check for AFD support for this operating system failed.
// *Action: Contact Oracle Support Services to determine if an updated driver 
//          is available for this operating system and architecture, 
//          or install AFD on a supported architecture and operating system.
09127, 0, "AFD has not been loaded."
// *Cause:  AFD device driver has been started but it was not
//          detected as running. 
// *Action: Issue the commands 'afdload stop' followed by 'afdload start'.
//          If the issue persists, contact Oracle Support Services.
09128, 0, "unknown query type '%s'"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Support Services.
09130, 0, "Root access required"
// *Cause:  The user executing this command does not have sufficient
//          privileges to run the command.
// *Action: Run this command as a user with root access.
09140, 0,  "unable to determine the correct drivers for this version of Windows: ID: %s Major: %s Minor: %s Product Type: %s"
// *Cause: AFD is not supported on this version of Windows.
// *Action: Report this message to Oracle Support Services to determine
//          if an update to AFD is available.
09154, 0, "Loading '%s' driver."
// *Cause:  This message is informational only.
// *Action: None.
09155, 0, "Checking for existing '%s' driver installation."
// *Cause:  This message is informational only.
// *Action: None.
09156, 0, "Detecting control device '%s'." 
// *Cause:  This message is informational only.
// *Action: None.
09157, 0, "detecting driver '%s'"
// *Cause:  Informational.
// *Action: None.
09158, 0, "Configuration file '%s' in the /boot directory does not exist."
// *Cause:  A populated /boot directory, which contains static files required
//          to install kernel modules, was not detected on the system.
// *Action: After restoring the /boot directory and the kernel configuration
//          files, re-run 'afdroot install'.
09160, 0, "Cannot use the silent and verbose options at the same time."
// *Cause:  The -s and -v options were used in the command. These options are
//          mutually exclusive.
// *Action: Re-execute the command with one of the options or neither.
09176, 0, "Entering '%s'"
// *Cause:  This message is informational only.
// *Action: None.
09177, 0, "Return from '%s'"
// *Cause:  This message is informational only.
// *Action: None.
09178, 0, "Return code = %s"
// *Cause:  This message is informational only.
// *Action: None.
09190, 0, "User group '%s' does not exist."
// *Cause:  The group name is required to create ASM Filter Driver devices with
//          the correct attributes. The group name could not be found in the
//          /etc/group file nor in the various remote services like
//          LDAP, AD, NIS/Yellow Pages, DNS, etc. 
// *Action: Ensure that the required group exists, then rerun the command.
09200, 0, "Supported"
// *Cause:  AFD device drivers have been ported
//          to this operating system or CPU type.
// *Action: None - Informational.
09201, 0, "Not Supported"
// *Cause:  AFD device drivers have not yet been ported
//          to this operating system or CPU type.
// *Action: None.
09202, 0, "AFD can not be installed/loaded because ASMLib is installed."
// *Cause:  This message is informational only.
// *Action: None.
09203, 0, "AFD device driver installed status: 'true'"
// *Cause:  AFD device drivers were installed.
// *Action: None.
09204, 0, "AFD device driver installed status: 'false'"
// *Cause:  AFD device drivers were not installed.
// *Action: None.
09205, 0, "AFD device driver loaded status: 'true'"
// *Cause:  AFD device drivers were loaded.
// *Action: None.
09206, 0, "AFD device driver loaded status: 'false'"
// *Cause:  AFD device drivers were not loaded.
// *Action: None.
09212, 0, "    Driver build version = %s."
// *Cause:  Informational.
// *Action: None.
09213, 0, "Configuration file '%s' in the /boot directory does not exist or cannot be read."
// *Cause:  An attempt to check for compatible kernel was unable to read required /boot 
//          configuration data.
// *Action: Verify user permissions, that the configuration file is accessible,
//          and then retry the command.
09225, 0, "Failed to start AFD logging."
// *Cause:  The drivers were successfully loaded but AFD logging failed to start.
// *Action: Run 'afdtool -log -d <GridHome>' to perform a manual start.
09226, 0, "AFD drivers not correct for this OS - cannot load."
// *Cause:  The device drivers installed are not compatible with the
//          currently running operating system.
// *Action: run 'afdroot install <options>' to install the correct drivers.
09228, 0, "usage: %s {start|stop} [-s]"
// *Document: NO
09291, 0, "Waiting for the Windows 'sc stop %s' command to complete." 
// *Cause:  System activity is preventing the driver from stopping. 
// *Action: If the operation does not complete, a node reboot may be necessary.
09294, 0, "updating file %s"
09295, 0, "failed to open file %s"
// *Cause:  A requested action failed to complete because the indicated 
//          file could not be opened.
// *Action: Verify the file exists and is accessible by the current user,
//          examine previous error messages, address issues, and retry 
//          the command.
09303, 0, "No installation files found for operating system kernel version %s."
// *Cause:  Distribution location could be invalid.
// *Action: Choose a proper distribution location version.
09306, 0, "Failed to uninstall previous installation."
// *Cause:  Deletion process of AFD commands and/or drivers failed during uninstall.
// *Action: Commands and/or drivers are likely in use. Wait for operations to
//          finish, unload the drivers, and retry the installation.
09312, 0, "Existing AFD installation detected."
// *Cause:  Informational.
// *Action: None.
09319, 0, "Unknown operating system kernel version '%s' detected."
// *Cause:  This is an internal error.
// *Action: Contact Oracle Support Services.
09320, 0, "Missing file: '%s'."
// *Cause:  A required command or driver was not found on the
//          installation media (pre install) or system (post install).
// *Action: If post install, try running afdroot again. Otherwise,
//          contact Oracle Support Services.
09321, 0, "Creating udev for AFD."
// *Cause:  This message is informational only.
// *Action: None.
09322, 0, "completed"
// *Cause:  This message is informational only.
// *Action: None.
09323, 0, "Creating module dependencies - this may take some time."
// *Cause:  This message is informational only.
// *Action: None.
09324, 0, "Alternate drivers installed."
// *Cause:  This message is informational only.
// *Action: None.
09325, 0, "    Driver OS kernel version = %s."
// *Document: NO
09326, 0, "    Driver build number = %s."
// *Document: NO
09327, 0, "Verifying AFD devices."
// *Cause:  This message is informational only.
// *Action: None.
09329, 0, "failed to uninstall driver '%s'"
// *Cause:  An 'afdinstall' command failed to uninstall the driver.
//          This may be because the driver was in use.
// *Action: Correct previously reported errors and retry the command.
//          If the issue persists, contact Oracle Support Services.
09330, 0, "executable '%s' not installed"
// *Cause:  A component that should have been installed was not installed. 
// *Action: Rerun 'afdroot install'.
09340, 0, "failed to install driver '%s'"
// *Cause:  An 'afdinstall' command failed to install the driver.
// *Action: Correct previously reported errors and retry the command.
//          If the issue persists, contact Oracle Support Services.
09341, 0, "executable '%s' not found"
// *Cause:  One of the executables that make up the AFD package was missing.
// *Action: Reinstall the AFD package and retry the operation.
09343, 0, "Unable to retrieve operating system kernel version from module %s."
// *Cause:  Running modinfo against the AFD driver failed.
// *Action: None - the current operating system kernel version will be used instead.
09344, 0, "Missing directory: '%s'."
// *Cause: A required directory was not found on the system.
// *Action: Contact Oracle Support Services.
09345, 0, "Unable to create directory: '%s'."
// *Cause: Creation of a required directory failed.
// *Action:  Contact Oracle Support Services.
09346, 0, "Unable to install file: '%s'."
// *Cause: Copying to the given destination failed.
// *Action: Correct the error indicated by the accompanying messages and 
//          rerun 'afdroot install'.
09347, 0, "Unable to set permissions (octal %s) on: '%s'."
// *Cause: Setting the given permission bits failed while installing.
// *Action: Manually set the permissions to the required level and
//          rerun 'afdroot install'.
09348, 0, "Unable to remove '%s'."
// *Cause: A previously installed file could not be removed.
// *Action: Attempt to manually remove the file and rerun 
//          'afdroot'.
09349, 0, "Unable to configure driver '%s'."
// *Cause: A driver was installed but 'add_drv' failed to write a configuration
//         file.
// *Action: Correct the error indicated by the accompanying messages and
//          rerun 'afdroot install'.
09350, 0, "Failed to create a symbolic link from '%s' to '%s'."
// *Cause: Creating a symbolic link failed.
// *Action: Correct the error indicated by the accompanying 
//          operating system message, then rerun the 'afdroot' command.
09351, 0, "Unable to remove default device table file entry for '%s'."
// *Cause: An entry for the driver was found in /etc/devlink.tab but it was
//         not possible to remove the entry.
// *Action: Manually remove the entry from /etc/devlink.tab
//          and rerun 'afdroot uninstall'.
09352, 0, "Unable to write to file '%s'."
// *Cause: A file required modifications but it was not possible to write to it.
// *Action: Ensure that the file ownership and permissions allow you to write 
//          to the file.
09365, 0, "The directory '%s' is not being removed."
// *Cause: The directory was scheduled to be uninstalled, but it contained
//         files that were not installed by afdroot.
// *Action: Manually remove the directory.
09384, 0, "Invalid operating system kernel variation '%s'."
// *Cause:  The command found an operating system kernel variation (e.g., "el5", etc.)
//          that it did not recognize as a valid AFD supported kernel.
// *Action: Boot a supported kernel.
09388, 0, "An absolute path name must be specified for the alternate location."
// *Cause:  A relative path name to the distribution files was specified.
// *Action: Enter the absolute path name instead.
09389, 0, "ORACLE_HOME is not set to the location of the Grid Infrastructure home."
// *Cause:  The ORACLE_HOME environment variable was not set correctly.
// *Action: Make sure that the ORACLE_HOME environment variable is set to the
//          location of the Grid Infrastructure home and that it is properly
//          exported.
09390, 0, "The command '%s' returned unexpected output that may be important for system configuration:"
// *Cause:  One of the operating system commands used to configure the system 
//          returned an unexpected error. This message is accompanied by other 
//          message(s) providing details of the error.
// *Action: See the operating system documentation for the specific command 
//          for more information on this error.
09393, 0, "Verifying ASM administrator setup."
// *Cause:  This message is informational only.
// *Action: None.
09399, 0, "Calling 'afdroot install' to install compatible AFD drivers."
// *Document: NO
/

/
/
/ afdinstall.exe messages (NT only)
/
09400, 0,  "An attempt to open the Windows Service Control Manager failed with error '%s'."
// *Cause:  During 'afdinstall' command execution, an attempt to open the 
//          Windows Service Control Manager failed with the given error.
// *Action: Log onto a user account with administrator privileges and retry.
09401, 0,  "failed to install the AFD driver"
// *Cause:  An 'afdinstall /i' command failed to install the AFD driver.
// *Action: Correct previously reported errors and retry the command.
//          If the issue persists, contact Oracle Support Services.
09402, 0,  "The file path specified is too long."
// *Cause:  The path specified exceeded the allowed maximum path length.
// *Action: Verify the path was entered correctly, or use a different path.
09403, 0,  "conflicting command options '/i' and '/u'"
// *Cause:  Both '/i' (install)  and '/u' (uninstall) were 
//          specified on an 'afdinstall' command.
// *Action: Use either /i to install or /u to uninstall the driver.
09404, 0,  "missing '/i' (install) or '/u' (uninstall) option"
// *Cause:  An 'afdisntall' command did not specify either '/i' or '/u'.
// *Action: Specify one or the other option.
09407, 0,  "unable to find file '%s'"
// *Cause:  The indicated file was not found.
// *Action: Provide the correct driver path name and retry.
09409, 0,  "Windows service %s already exists"
// *Cause:  During 'afdinstall /i' command execution, an attempt to 
//          create a Windows service failed because a service with that name 
//          was already defined.
// *Action: Remove the existing Windows service definition using 
//          the command 'afdinstall /u' and retry the operation.
09410, 0,  "Windows service %s creation failed"
// *Cause:  During 'afdinstall /i' command execution, an attempt to 
//          create a Windows service failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09411, 0,  "Windows service %s creation succeeded."
// *Cause:  Informational.
// *Action: None.
09412, 0,  "The AFD driver was installed successfully."
// *Cause:  Informational.
// *Action: None.
09413, 0,  "Windows registry key %s creation failed"
// *Cause:  During 'afdinstall /i' command execution, an attempt to 
//          create a Windows registry key failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09414, 0,  "failed to set the data and type for %s under Windows registry key %s"
// *Cause:  During 'afdinstall /i' command execution, an attempt to
//          set the data and type of a specified value under a registry key 
//          failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09416, 0,  "failed to open Windows service %s"
// *Cause:  During 'afdinstall /i' command execution, an attempt to
//          open the AFD Windows service failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09417, 0,  "The AFD driver started successfully."
// *Cause:  Informational.
// *Action: None.
09418, 0,  "The Windows service %s is already started."
// *Cause:  Informational.
// *Action: None.
09419, 0,  "failed to start Windows service %s"
// *Cause:  During 'afdinstall /i' command execution, an attempt to
//          start the AFD Windows service failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09420, 0,  "The AFD driver is not installed on this node."
// *Cause:  An attempt to uninstall the AFD driver found that
//          the driver was not installed.
// *Action: None.
09421, 0,  "The AFD driver is already installed on this node."
// *Cause:  An attempt to install the AFD driver found that
//          the driver was already installed.
// *Action: None.
09422, 0,  "The AFD driver was removed successfully."
// *Cause:  Informational.
// *Action: None.
09423, 0,  "failed to delete Windows service %s"
// *Cause:  During 'afdinstall /u' command execution, an attempt to
//          delete the AFD Windows service failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09424, 0,  "The AFD driver was stopped successfully."
// *Cause:  Informational.
// *Action: None.
09425, 0,  "failed to stop Windows service %s"
// *Cause:  During 'afdinstall /u' command execution, an attempt to
//          stop the AFD Windows service failed.
// *Action: Correct the problem indicated by the accompanying error message
//          and retry the operation.
09426, 0,  "unable to set the file attributes for file '%s'"
// *Cause:  The file attributes for the oject file could not be set.
// *Action: Reset the attributes with "attrib -r <file_name>"
//          and then retry the operation.
09430, 0, "AFD is not supported on this OS configuration: '%s'" 
// *Cause:  Attempting to install or configure AFD failed because 
//          AFD device drivers have not been ported to this OS configuration.
// *Action: None.
/09431 - 09439 AVAILABLE
09440, 0,  "Usage:  %s {/i [<path>]| /u}"
// *Document: NO
09441, 0,  "/i      Install the driver"
// *Document: NO
09442, 0,  "/u      Uninstall the driver"
// *Document: NO
09443, 0,  "/i      <path> File system path to the driver files. Defaults to the current working directory."
// *Document: NO
/ 9444 - 9449 - AVAILABLE
09450, 0, "Examples:"
// *Document: NO
09451, 0, "%s /i  (Install AFD driver files from the current working directory.)"
// *Document: NO
09452, 0, "%s /u  (Uninstall AFD.)"
// *Document: NO
09453, 0, "%s /i  c:\drivers  (Install AFD using the specified directory.)"
// *Document: NO
09454, 0,  "An attempt to delete driver file %s after stopping the driver failed with error '%s'."
// *Cause:  During 'afdinstall /u' command execution, an attempt to delete the driver file failed.
// *Action: Manually delete the specified driver file using Windows Explorer.
//  	    If you were installing the driver please retry after deletion.
09455, 0,  "Unable to copy driver file '%s' to path '%s'."
// *Cause:  During 'afdinstall /i' command execution, an attempt to copy the driver file 
//          to the specified directory failed.
// *Action: Manually delete any previous driver file from the specified
//          directory using Windows Explorer and retry the command.
09456, 0,  "An attempt to stop driver %s failed." 
// *Cause:  During 'afdinstall /u' command execution, an attempt to stop the driver failed.
// *Action: Reboot the system and retry the command.
09457, 0,  "The driver file does not match the driver chosen to install."
// *Cause:  During 'afdinstall /i <path>' command execution, path to oracleafd.sys was not specified.
// *Action: Retry the 'afdinstall /i' command with the correct path to file oracleafd.sys.
09458, 0,  "The Windows service %s is in an invalid state. The new driver cannot be installed." 
// *Cause:  An attempt to install the new driver failed because the existing
//          service could not be stopped properly. 
// *Action: Reboot system and then retry the command.
/
09503, 0,  "AFD media location is '%s'"
// *Cause:  Informational.
// *Action: None.
09504, 0,  "Copying file '%s' to the path '%s'"
// *Document: NO
09506, 0,  "The files '%s' and '%s' are the same, not copying."
// *Cause:  Informational.  The file was not copied because the target and
//          source point to the same file.
// *Action: None.
09508, 0,  "AFD installation aborted (component %s)."
// *Cause:  Installation was aborted due to an error.
// *Action: See preceding error message for more information.
09545, 0, "Verification error: kernel module '%(1)s' is incompatible with the installed kernel version '%(3)s'. It is compatible with kernel version '%(2)s'."
// *Cause:  An attempted command failed because of kernel module
//          incompatibility. The version of the indicated kernel
//          module is not compatible with the installed kernel.
// *Action: Revert any manual modifications to the usm install directories,
//          and then retry the operation. If a problem is still reported,
//          re-install any applied patches or the base software.
09547, 0, "    Driver available build number = %s."
// *Document: NO
09548, 0, "    Driver available build version = %s."
// *Document: NO
09552, 0, "Command '/sbin/weak-modules' returned a potential compatibility issue. For more details execute the command '%s'."
// *Cause:  The command '/sbin/weak-modules' found incompatibilities between the
//          running kernel and the Oracle ASMFD driver.
// *Action: Run the indicated command for details. Contact Oracle Support
//          Services to determine whether an updated Oracle ASMFD driver is
//          available for the current operating system and architecture.
10285, 0,  "Pathname '%s' does not exist."
// *Cause:  Specified path name was not found.
// *Action: Specify a valid path name.
/
