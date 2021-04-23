// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrveMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     ptare       10/23/18 - Backport ptare_bug-28052995 from main
//     shhirema    09/04/18 - Bug 28276254: update error message
//     ptare       08/15/18 - Fix Bug#28265581 check soft memlock limits too
//     ptare       05/22/18 - Bug#28052995 Add messages for DEFAULTTASKSMAX
//                            parameter check
//     maboddu     04/03/18 - Fix bug#27434412 - add message for MTU mismatch
//                            for bond interfaces
//     shhirema    09/05/17 - Bug 26628236: add messages for ec check
//     ptare       05/05/17 - Bug#24459291 Introduce a check for minimum SRU
//                            version on Solaris
//     maboddu     05/02/17 - Fix bug#25908676 - add error messages for
//                            ZEROCONF param check
//     maboddu     04/10/17 - Fix bug#24758548 - add messages for checking ACLs
//                            for system files/directories
//     shhirema    12/11/16 - Bug 16740599: add nfs export options check
//                            messages
//     shhirema    10/07/16 - Bug 16655679: add messages for diskgroup disk
//                            size check
//     maboddu     08/10/16 - Fix bug#24376365 - add cause and action to error
//                            3073
//     shhirema    06/23/16 - Bug 23630338: fix AFD check message
//     shhirema    05/05/16 - Bug 23223774: add error message for afd check
//     xesquive    03/18/16 - Fix bug22905932 add cause/action in msg id 273
//     spavan      03/07/16 - fix bug22762065 - fix NTP messages and formatting
//                            issues
//     ptare       01/26/16 - Add a message to report the memlock entry missing
//                            inside limits file
//     ptare       01/25/16 - Fix Bug#22586981 Add message to report non
//                            applicability of the reverse path filter check on
//                            the node
//     shhirema    01/21/16 - Bug 20722208: add message for afd checks
//     jolascua    01/13/16 - Bug 22116467: message for /dev/shm in containers
//     shhirema    01/11/16 - Bug 22488591: escape single quotes
//     shhirema    12/16/15 - Bug 22369449: add ASM header messages for all
//                            result key types
//     dsaggi      12/09/15 - Fix 19498573 -- Mark the literals that should not
//                            be translated within Cause and Action
//     shhirema    12/08/15 - Bug 22310850: add messages for new ASM check
//     maboddu     12/04/15 - Fix bug#22275121 - Add error messages for
//                            checking logind IPC parameter
//     shhirema    11/05/15 - Fix Bug 22117782: ASM rebalance ops check
//                            messages
//     maboddu     10/26/15 - Fix bug#22071678 - Add file system path as
//                            argument to message
//     maboddu     10/06/15 - Fix bug#20135364 - report the correct limits.conf
//                            file path for memlock check
//     shhirema    09/17/15 - Fix bug 21847393:fix the more details message
//     nvira       09/17/15 - add message for failure in writing xml report
//     kfgriffi    09/08/15 - Fix bug 21787064 - add warning messages
//     nvira       08/25/15 - add messages for application healthcheck
//     ptare       07/23/15 - Fix Bug#20438532 correct upper case message for
//                            translation
//     ptare       06/24/15 - Add element and description for ENABLED_AMM
//     dsaggi      06/10/15 - Modify wordings of SUCC_ASM_INCORRECT_DISKSTRING
//     ptare       05/26/15 - Correct message new line
//     shhirema    05/10/15 - add messages for ASM DG attribute checks
//     shhirema    04/22/15 - Add ASM spare param check messages
//     spavan      04/15/15 - fix bug20474814 - add messages
//     shhirema    04/15/15 - add messages for ASM failure group checks
//     spavan      03/17/15 - fix bug20682847 - add message for best practice
//                            checks not available
//     nvira       01/16/15 - bug fix 20321917
//     shhirema    01/08/15 - add ASM check msgs
//     nvira       12/12/14 - add message for os collections
//     shhirema    11/26/14 - Add messages for rebalance operations check
//     shhirema    11/20/14 - add ASM error messages
//     kfgriffi    11/13/14 - Reporting output redesign
//     maboddu     09/02/14 - Fix bug#9664096 - Add messages for pluggable task
//                            checkFSMountOptions
//     ptare       08/14/14 - Add enhancement messages for RP_FILTERS check
//     jgagarci    07/17/14 - fixbug 19232809 - change message
//     ptare       06/06/14 - Bug#18912532 Add separate message for SUSE linux
//                            for zeroconf check
//     shshrini    05/28/14 - Fix bug 14746135 - Add error messages for
//                            /dev/shm/ mount options mismatch
//     ptare       05/22/14 - Fix bug#17276570 Add messages related to the
//                            memlock check
//     jgagarci    05/14/14 - fix bug 14607661 - check english locale is
//                            installed in the system
//     ptare       03/21/14 - Fix Bug#18432257 check for the berkeley packet
//                            filter devices on AIX
//     kfgriffi    03/18/14 - Add ACFS device file messages
//     maboddu     02/20/14 - Fix bug#18029051 - Add message for IOCP device
//                            status
//     nvira       02/19/14 - add message for nothing to collect
//     ptare       02/07/14 - Add messages for CI network Bonding pluggable task
//     ptare       12/17/13 - Fix Bug#17800647 add message for huge pages not
//                            supported
//     dsaggi      11/21/13 - Add MACRO for CAUSE & ACTION translation
//     nvira       11/01/13 - add skipped
//     xesquive    10/22/13 - support unknown interfaces bug13531839
//     maboddu     10/09/13 - Fix bug#17494773 - add messages for pluggable
//                            task checkGSDResource
//     maboddu     08/13/13 - Fix bug#16611185 - add message for
//                            shutdown_hwclock
//     maboddu     07/22/13 - Fix bug#16953470 - Add messages for pluggable
//                            task IP_HOSTMODEL
//     nvira       05/23/13 - XbranchMerge nvira_bug-16784496 from
//                            st_has_11.2.0
//     maboddu     04/24/13 - Add messages for FILESYSTEMIO_OPTIONS
//     ptare       12/03/12 - Add messages for privileged group check using RAC
//                            home
//     nvira       11/26/12 - add message for verified
//     nvira       10/10/12 - bug fix 14364702
//     ptare       10/24/12 - Add message for failure in retrieval of
//                            configured osdba group
//     ptare       10/04/12 - Add osdba group consistency related messages
//     nvira       09/25/12 - bug fix 11849901, improve message
//     agorla      09/24/12 - bug#14669295 - add context for not checks warning
//                            mesg
//     kfgriffi    09/21/12 - Add syslog messages
//     ptare       09/04/12 - Add message for failure in retrieval of size of
//                            /dev/shm on linux
//     ptare       08/29/12 - Fix Bug#14177769 messages for /dev/shm check on
//                            linux
//     ptare       05/13/12 - Add report text close
//     agorla      04/11/12 - bug#12875709 - msgs of task multiuser service
//                            check
//     xesquive    02/07/12 - Bug fix 13566257
//     dsaggi      11/29/11 - Add ELEMENT_NAME_FAKE_INTEGRITY
//     dsaggi      11/28/11 - Fix 13347851
//     ptare       07/20/11 - Fix Empty DB task list Msg for healthcheck
//                            component
//     ptare       06/27/11 - Add message for empty task list
//     agorla      05/09/11 - bug#9968337 - add messages
//     agorla      04/28/11 - add -pre dbinst -upgrade messages
//     ptare       04/27/11 - Add messages for rp_filter check on LINUX
//     agorla      04/13/11 - bug#11849901 - add messages
//     dsaggi      04/01/11 - fix 11903546
//     nvira       09/28/10 - add messages for db checks
//     narbalas    09/09/10 - Fix 9913816
//     nvira       08/11/10 - add messages for darwin pluggable tasks
//     ptare       09/13/10 - Add XML & HTML reporting tool messages
//     kfgriffi    04/26/10 - Add SSHD messages.
//     narbalas    04/22/10 - bug 8792932
//     kfgriffi    03/18/10 - Add Core File messages.
//     shmubeen    02/12/10 - Add Huge Page messages.
//     shmubeen    10/07/09 - Creation.
//
//
//Note: First 300 messages have been reserved for the pluggable framework only
//
// PACKAGE=package oracle.ops.verification.resources;
// MSGIDTYPE=interface
// IMPORT=/* let comments through */
/* NLS_TRANSLATE_CAUSE_ACTION_START */
0001, PLUGGABLE_TASK_START, "Starting check for {0} ..."
// *Document: NO
//  *Cause:
// *Action:
/
0002, PLUGGABLE_TASK_PASSED, "Check for {0} passed"
// *Document: NO
//  *Cause:
// *Action:
/
0003, PLUGGABLE_TASK_FAILED, "Check for {0} failed"
// *Document: NO
//  *Cause:
// *Action:
/
0004, INVALID_OPERATOR, "The given operator is not supported."
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/
0005, INVALID_NUMERIC_STRING, "The string does not represent a numeric value."
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/
0006, DIR_CREATION_FAILED, "Failed to create directory \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0007, EXECUTABLE_NOT_FOUND, "Could not find executable \"{0}\""
// *Document: NO
//  *Cause: 
// *Action: 
/
0008, EXEC_NAME_NOT_FOUND, "Could not find command name in description of executable"
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/
0009, VARIABLE_NOT_RESOLVED, "Failed to resolve variable \"{0}\""
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/
0010, RESULT_TAG_UNAVAILABLE, "Properly formatted RESULT tags are not found in the command output: \"{0}\"."
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/
0011, EMPTY_COLLECTED_VALUE, "Properly formatted COLLECTED tags are not found in the command output."
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/
0012, VERIFICATION_EXEC_FAILED, "Execution of verification executable failed."
//  *Cause: An error was encountered while executing verification executable.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
0013, ANALYZER_EXEC_FAILED, "Execution of analyzer failed."
//  *Cause: An error was encountered while executing analyzer.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
0014, UNKNOWN_HOST, "Could not get local host name."
// *Document: NO
//  *Cause: 
// *Action: 
/
0015, ERR_MESSAGE_BUNDLE, "Could not get message bundle for facility \"{0}\"."
// *Document: NO
//  *Cause: 
// *Action: 
/
0016, UNABLE_WRITE_FILE, "Unable to write data to file \"{0}\"."
//  *Cause: The path specified is not writeable.
// *Action: Ensure that write access exists for the specified path.
/ 
0017, COMPARISION_FAILURE, "The value collected from the system did not meet the requirement.[Expected = \"{0}\"; Collected = \"{1}\"]"
// *Document: NO
//  *Cause: 
// *Action: 
/ 
0018, NULL_EXEC_ARG, "Encountered a NULL executable argument."
//  *Cause: This is an internal error. 
// *Action: Please contact Oracle Support.
/ 
0019,ELEMENT_NAME_ENABLED_HUGE_PAGE , "HugePages Existence"
// *Document: NO
//  *Cause:
// *Action:
/
0020, DESC_ENABLED_HUGE_PAGE, "Checks HugePages existence"
// *Document: NO
//  *Cause:
// *Action:
/
0021, NO_HUGE_PAGE_ENABLED, "HugePages feature is not enabled on nodes \"{0}\""
//  *Cause: Available memory is greater than 4GB, but OS HugePages feature is not enabled.
// *Action: If available memory is greater than 4GB, Oracle recommends configuring HugePages. Refer to OS documentation to configure HugePages.
/
0022, ERROR_PHYSICAL_MEMORY, "Could not get available memory on node \"{0}\""
//  *Cause: An error occurred accessing /proc/meminfo to determine available system memory. 
// *Action: Ensure that the OS /proc virtual file system is functioning correctly and that /proc/meminfo is accessible.  
/
0023, WARNING_HUGE_PAGES_NOT_SUPPORTED, "HugePages feature is not supported on node \"{0}\""
//  *Cause: HugePages feature of Linux operating system was not found supported on the indicated node. 
// *Action: Oracle recommends enabling the database automatic memory management feature on database instances that run on a Linux operating system that does not support HugePages.   
/
0024, WARNING_TRANSPARENT_HUGE_PAGES_ENABLED, "Transparent HugePages feature is enabled on node \"{0}\""
//  *Cause: Transparent HugePages feature was found always enabled on the indicated node. 
// *Action: Oracle recommends disabling Transparent HugePages on all servers running Oracle databases. To disable the Transparent HugePages feature add "transparent_hugepage=never" to the kernel boot line in the "/etc/grub.conf" file of the indicated node and reboot the node to make the changes effective.    
/
0025, ELEMENT_NAME_HWCLOCK_SHUTDOWN_SYNC , "Hardware Clock synchronization at shutdown"
// *Document: NO
//  *Cause:
// *Action:
/
0026, DESC_HWCLOCK_SHUTDOWN_SYNC , "Checks whether Hardware Clock is synchronized with the system clock during system shutdown"
// *Document: NO
//  *Cause:
// *Action:
/
0027, HWCLOCK_SYNC_UNCLEAR , "Hardware clock synchronization could not be determined on node \"{0}\""
//  *Cause: The hwclock command is used in the shutdown script, but it is not possible to establish that the --systohc option is enabled.
// *Action: Check the shutdown/halt script and verify manually whether this script executes the command 'hwclock --systohc'.
/
0028, HWCLOCK_SHUTDOWNSCRIPT_MISSING , "Hardware clock synchronization could not be established as halt script does not exist on node  \"{0}\""
//  *Cause: The shutdown or halt script /etc/rc.d/init.d/halt does not exist or is missing.
// *Action: Check for the existence of the shutdown or halt script and ensure this script executes the command 'hwclock --systohc'.
/
0029, HWCLOCK_SHUTDOWNSCRIPT_OTHERERROR , "Hardware clock synchronization check could not run on node \"{0}\""
//  *Cause: The shutdown or halt script may not be accessible or a command may have failed.
// *Action: Contact Oracle Support.
/
0030, ELEMENT_NAME_CORE_FILE_SETTING , "Core file creation setting"
// *Document: NO
//  *Cause:
// *Action:
/
0031, DESC_CORE_FILE_SETTING , "Checks if core files are enabled on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0032, CORE_FILE_SETTING_PASS , "Core files are enabled on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0033, CORE_FILE_SETTING_FAIL , "Core files are not enabled on node \"{0}\""
//  *Cause: The core file setting currently prevents the creation of a core file for process aborts and exceptions.
// *Action: Oracle recommends enabling core file creation.
/
0034, CORE_FILE_SETTING_ERROR , "Error encountered while trying to obtain the core file setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the core file setting.
// *Action: Oracle recommends enabling core file creation.
/
0035, ELEMENT_NAME_SSHD_SETTING , "The SSH LoginGraceTime setting"
// *Document: NO
//  *Cause:
// *Action:
/
0036, DESC_SSHD_SETTING, "Checks the SSH LoginGraceTime setting, which controls how long the SSH server allows for a successful login."
// *Document: NO
//  *Cause:
// *Action:
/
0037, SSHD_SETTING_PASS , "LoginGraceTime setting passed on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0038, SSHD_SETTING_FAIL , "The SSH LoginGraceTime setting on node \"{0}\" may result in users being disconnected before login is completed"
//  *Cause: The LoginGraceTime timeout value is too low which is causing users to be disconnected before their login completes.
// *Action: Oracle recommends setting the LoginGraceTime to a value of zero (unlimited), Restart the SSH daemon on the identified node to make the changes effective.
/
0039, SSHD_SETTING_ERROR , "Error encountered while trying to obtain the LoginGraceTime setting on node \"{0}\""
//  *Cause: An error occurred while attempting to obtain the LoginGraceTime setting.
// *Action: Oracle recommends setting the LoginGraceTime to a value of zero (unlimited).
/
0040, ELEMENT_NAME_MAX_LOCKED_MEM, "Maximum locked memory when automatic memory management is enabled"
// *Document: NO
//  *Cause: 
// *Action: 
/ 
0041, DESC_MAX_LOCKED_MEM, "Check maximum locked memory when automatic memory management is enabled"
// *Document: NO
//  *Cause:
// *Action:
/
0042, MEMLOCK_OUTSIDE_LIMIT, "Maximum locked memory \"{0}\" limit when automatic memory management is enabled is less than the recommended value in the file \"{1}\" [Expected = \"{2}\", Retrieved=\"{3}\"]  on node \"{4}\""
//  *Cause: The value of maximum locked memory is less than the recommended 
//          value for automatic memory management.
// *Action: Increase the value of locked memory in the indicated file. Refer 
//          to your operating system documentation for details.
/
0043, MEMLOCK_CMD_ERR, "Error encountered when checking maximum locked memory limit on node \"{0}\""
//  *Cause: An error was encountered when retrieving the value of maximum locked memory.
// *Action: Modify the value of max locked memory. Refer your operating system documentation for details.
/
0044, MEMLOCK_NO_ENTRY, "No entry in configuration file when checking locked memory limit on node \"{0}\""
//  *Cause: No entry for maximum locked memory limit was found in /etc/security/limits.conf.
// *Action: Specify or correct the value of locked memory by modifying /etc/security/limits.conf. Refer your operating system documentation for details.
/
0045, ELEMENT_NAME_PORT_AVAILABILITY, "availability of port 8888"
// *Document: NO
//  *Cause:
// *Action:
/
0046, DESC_PORT_AVAILABILITY, "availability of port 8888"
// *Document: NO
//  *Cause:
// *Action:
/
0047, PORT_AVAILABILITY_CMD_FAIL, "Error when checking IP port availability"
//  *Cause: Command failed when checking port availability.
// *Action: Contact Oracle Support Services.
/
0048, PORT_AVAILABILITY_FAIL, "Check for IP port \"{0}\" availability failed"
//  *Cause: IP Port 8888 not available. 
// *Action: Stop any applications listening on port 8888 as it is needed for oc4j.
/
0049, ELEMENT_NAME_SYSLOG_SETTING , "The syslog.conf log file sync setting"
// *Document: NO
//  *Cause:
// *Action:
/
0050, DESC_SYSLOG_SETTING, "Checks the log file sync specification which controls how log file messages are written."
// *Document: NO
//  *Cause:
// *Action:
/
0051, SYSLOG_SETTING_PASS , "The syslog.conf log file sync setting passed on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0052, SYSLOG_SETTING_FAIL , "The syslog.conf log file sync setting on node \"{0}\" may result in users being disconnected before logins are completed"
//  *Cause: Not all log file specifications in /etc/syslog.conf are prefixed by the '-' character which will cause log messages being written to disk before control is released. This may cause users to be disconnected before their login completes.
// *Action: Oracle recommends prefixing all log file specifications in /etc/syslog.conf with the '-' character which result in the log messages being written to system cache and flushed to disk later. 
/
0053, SYSLOG_SETTING_ERROR , "Error encountered while trying to obtain the syslog.conf log file sync settings on node \"{0}\""
//  *Cause: An error occurred while attempting to read the log file sync settings specified in file: /etc/syslog.conf.
// *Action: Verify read access to file '/etc/syslog.conf'. Oracle recommends prefixing all log file specifications in /etc/syslog.conf with the '-' character which will result in the log messages being written to system cache and flushed to disk later. 
/
0054, SYSLOG_SETTING_NOT_FOUND_ERROR, "File '/etc/syslog.conf' not found on node \"{0}\""
//  *Cause: An error occurred while attempting to read the log file sync settings specified in file: '/etc/syslog.conf'. The file '/etc/syslog.conf' was not found on the system.
// *Action: Please verify that the file '/etc/syslog.conf' exists on the system.
/
0055, SYSLOG_SETTING_READ_ERROR, "Cannot read the file '/etc/syslog.conf' on node \"{0}\""
//  *Cause: The user did not have permissions to read the '/etc/syslog.conf' file on the system.
// *Action: Please verify that the current user has read access to the file.
/
0056, REPORT_PARAM_SET, "Parameter {0} is set."
// *Document: NO
//  *Cause:
// *Action:
/
0057, REPORT_PARAMETER_NOT_SET, "Parameter {0} is not set."
// *Document: NO
//  *Cause:
// *Action:
/
0059, MEMLOCK_ENTRY_MISSING, "no default entry or entry specific to user \"{0}\" was found in the configuration file \"{1}\" when checking the maximum locked memory \"{2}\" limit on node \"{3}\""
//  *Cause: There was no default or user-specific entry for maximum locked
//          memory limit found in the indicated configuration file.
// *Action: Specify or correct the value of the maximum locked memory by 
//          modifying the indicated configuration file. Refer to your
//          operating system documentation for details.
/
0060, HWCLOCK_SHUTDOWNSCRIPT_ACCESS_ERROR , "Cannot read the shutdown script file \"{0}\""
//  *Cause: The current user did not have read access to the indicated file.
// *Action: Ensure that the current user has read access to the indicated file.
/
0065, ELEMENT_NAME_MEMLOCK_LIMIT, "Maximum locked memory check"
// *Document: NO
//  *Cause: 
// *Action: 
/ 
0066, DESC_MEMLOCK_LIMIT, "Check maximum locked memory setting on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0067, MEMLOCK_LIMIT_OUTSIDE, "Maximum locked memory \"{0}\" limit setting is less than the recommended value in the file \"{1}\" [Expected = \"{2}\", Actual=\"{3}\"] on node \"{4}\"."
//  *Cause: A check of maximum locked memory settings determined that the  
//          value of maximum locked memory was less than the recommended
//          value of 3 GB in the indicated file for the current user.
// *Action: Oracle recommends that the maximum locked memory limit should be at 
//          least 3GB. Increase the value of maximum locked memory specified 
//          in the indicated file of the identified node.
//          Refer to the operating system documentation or issue 
//          the command 'man limits.conf' for details.
/
0068, MEMLOCK_LIMIT_OUTSIDE_HUGE_PAGES, "Maximum locked memory \"{0}\" limit setting is less than the recommended value in the file \"{1}\" [Expected = \"{2}\", Actual=\"{3}\"] when huge pages are enabled on node \"{4}\"."
//  *Cause: A check of maximum locked memory settings determined that the
//          value of maximum locked memory specified for the current user  
//          in the indicated file was less than the recommended
//          value of maximum locked memory when huge pages are enabled 
//          on the indicated node.
// *Action: Oracle recommends that the maximum locked memory be at least 90
//          percent of the installed physical memory when huge pages are enabled.
//          Increase the value of maximum locked memory specified in 
//          the indicated file of the identified node.
//          Refer to the operating system documentation or issue 
//          the command 'man limits.conf' for details.
/
0070, REPORT_TRANSPARENT_HUGEPAGES_ENABLED, "Transparent HugePages enabled"
// *Document: NO
//  *Cause: 
// *Action:
/
0071, REPORT_TRANSPARENT_HUGEPAGES_DISABLED, "Transparent HugePages disabled"
// *Document: NO
//  *Cause: 
// *Action:
/
0075, CHECK_OFSCTL_ERROR, "The verification for device special file '/dev/ofsctl' failed, the file is not present on node \"{0}\"."
// *Cause: The device special file '/dev/ofsctl' was expected to be present on the node indicated as the ACFS drivers are installed and the file was missing.
// *Action: Verify that the ACFS installation completed successfully and ensure that the device special file '/dev/ofsctl' is created.
/
0076, ELEMENT_NAME_CHECK_OFSCTL, "ACFS device special file"
// *Document: NO
// *Cause: 
// *Action:
/
0077, DESC_CHECK_OFSCTL, "checks the attributes for the ACFS device special file"
// *DOCUMENT: NO
// *Cause:
// *Action:
/
0078, CHECK_OFSCTL_DETAILS, "The device special file attributes for '/dev/ofsctl' must be set correctly in order for the ASM instance to function correctly."
// *Document: NO
//  *Cause: 
// *Action:
/
0079, OFSCTL_UDEV_RULE_ERROR, "The UDEV rule for \"ofsctl\" was not found in the rule file '55-usm.rules' on node \"{0}\"."
// *Cause: The ACFS verification found that the UDEV rule specification 'KERNEL==\"ofsctl\"' was not found in the rule file '55-usm.rules'.
// *Action: Verify that the ACFS installation completed successfully and ensure that the UDEV rule is created in the '55-usm.rules' file.
/
0080, OFSCTL_OSDBAGRP_ERROR, "failed to execute the command 'osdbagrp -a' successfully on node \"{0}\""
// *Cause: The ACFS verification encountered a problem in attempting to execute the command '$CRS_HOME/bin/osdbagrp -a' to obtain the ASM admin group name.
// *Action: Verify that the image 'osdbagrp' is available in the '<CRS home>' location and the command execution can be performed successfully. 
/
0082, OFSCTL_ATTRIBUTES_ERROR, "The device special file attributes did not meet the expected requirements on node \"{0}\".\n[permissions: Expected=\"{1}\"; Found=\"{2}\"] [owner: Expected=\"{3}\"; Found=\"{4}\"] [group: Expected=\"{5}\"; Found=\"{6}\"]"
// *Cause: The file attributes for the device special file '/dev/ofsctl' did not match the expected values.
// *Action: Verify that the ACFS installation completed successfully and check the file attributes defined for '/dev/ofsctl'.
/
0083, OFSCTL_UDEV_ERROR, "The UDEV rule specified in the '55-usm.rules' file does not meet the expected requirements on node \"{0}\".\n[group: Expected=\"{1}\"; Found=\"{2}\"] [mode: Expected=\"{3}\"; Found=\"{4}\"]"
// *Cause: The ACFS verification encountered the problem that the UDEV rule defined in the rule file for \"ofsctl\" did not match the expected values.
// *Action: Verify that the ACFS installation completed successfully and check the UDEV rule defined for \"ofsctl\".
/
0084, DEV_SHM_MOUNT_OPTIONS_MISSING, "Current '/dev/shm/' mount options do not contain one or more required options.  [ Found: \"{0}\"; Missing: \"{1}\" ]."
//  *Cause: Required '/dev/shm' mount options were missing.
// *Action: Ensure that current mount options on the node for '/dev/shm/'
//          satisfy the requirements expressed in the error.
/
0085, DEV_SHM_CONF_MOUNT_OPTIONS_MISSING, "Configured '/dev/shm/' mount options do not contain one or more required options.  [ Found: \"{0}\"; Missing: \"{1}\" ]."
//  *Cause: Required '/dev/shm' mount options were missing.
// *Action: Ensure that configured mount options in fstab on the node for
//          '/dev/shm/' satisfy the requirements expressed in the error.
/
0086, DEV_SHM_MOUNT_OPTIONS_INVALID, "Current '/dev/shm/' mount options include one or more invalid options.  [ Found: \"{0}\"; Invalid: \"{1}\" ]."
//  *Cause: One or more invalid '/dev/shm' mount options were found.
// *Action: Ensure that current mount options on the node for '/dev/shm/'
//          satisfy the requirements expressed in the error.
/
0087, DEV_SHM_CONF_MOUNT_OPTIONS_INVALID, "Configured '/dev/shm/' mount options include one or more invalid options.  [ Found: \"{0}\"; Invalid: \"{1}\" ]."
//  *Cause: One or more invalid '/dev/shm' mount options were found.
// *Action: Ensure that configured mount options in fstab on the node for
//          '/dev/shm/' satisfy the requirements expressed in the error.
/
0088, DEV_SHM_MOUNT_OPTIONS_ERRORS, "'/dev/shm/' mount options did not satisfy the requirements on node \"{0}\"."
//  *Cause: '/dev/shm/' mount options mismatch found. The reasons for the
//          mismatch could be the following:
//          1. One or more required mount options were missing in current and
//             configured mount options
//          2. One or more invalid mount options were found in current and
//             configured mount options
// *Action: Check the accompanying error messages for the expected mount 
//          options.  Configure '/dev/shm' mount options accordingly.
/
0089, REPORT_PARAMETER_NOT_CONF_FILE, "Parameter \"{0}\" is not configured in file \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0090, ELEMENT_NAME_CHECK_DEFAULTTASKSMAX, "DefaultTasksMax parameter"
// *Document: NO
// *Cause: 
// *Action:
/
0091, DESC_CHECK_DEFAULTTASKSMAX, "checks the value of DefaultTasksMax parameter in system.conf file"
// *DOCUMENT: NO
// *Cause:
// *Action:
/
0092, CHECK_DEFAULTTASKSMAX_DETAILS, "If the DefaultTasksMax parameter is set in file '/etc/systemd/system.conf', its value must be set to a value greater than or equal to 65535."
// *Document: NO
//  *Cause: 
// *Action:
/
0093, CHECK_DEFAULTTASKSMAX_FAIL, "The 'DefaultTasksMax' parameter is set to an incorrect value in file '/etc/systemd/system.conf' on node \"{0}\".  [ Found: \"{1}\"; Expected: \"{2}\" ]."
//  *Cause: The DefaultTasksMax parameter was set to an incorrect value in
//          /etc/systemd/system.conf file on the specified node.
// *Action: Ensure that the DefaultTasksMax parameter is correctly set in file
//          /etc/systemd/system.conf.
/
0094, CHECK_DEFAULTTASKSMAX_PASS, "The 'DefaultTasksMax' parameter is correctly set in file '/etc/systemd/system.conf' on node \"{0}\"."  
// *DOCUMENT: NO
// *Cause:
// *Action:
/
0201, ELEMENT_NAME_FAKE_INTEGRITY, "Fake Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
0202, DESC_FAKE_INTEGRITY, "Checks the integrity of fake element"
// *Document: NO
//  *Cause:
// *Action:
/
0207, ELEMENT_NAME_ENABLED_AMM, "Automatic Memory Management"
// *Document: NO
//  *Cause:
// *Action:
/
0208, DESC_ENABLED_AMM, "Checks whether the automatic memory management is enabled"
// *Document: NO
//  *Cause:
// *Action:
/
0230, ELEMENT_NAME_HANGCHECK_TIMER, "hangcheck_timer loading"
// *Document: NO
//  *Cause:
// *Action:
/
0231, DESC_HANGCHECK_TIMER, "Checks if the hangcheck_timer module is loaded on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0232, SUCC_HANGCHECK_TIMER, "hangcheck_timer module loaded on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0233, VFAIL_HANGCHECK_TIMER, "hangcheck_timer module not loaded on node \"{0}\""
//  *Cause: 
// *Action:
/
0234, EFAIL_HANGCHECK_TIMER, "Error encountered while trying to obtain the hangcheck_timer setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the hangcheck_timer setting.
// *Action:
/
0235, HANGCHECK_TIMER_DETAILS, "The hangcheck_timer module is required to run a supported configuration in Linux.  hangcheck_timer module should be loaded and enabled. 2.4 kernel hangcheck_reboot default is 1 (enabled); 2.6 kernel hangcheck_reboot default is 0 (disabled). In either case, hangcheck_reboot=1 is the proper setting when running Oracle Clusterware.  This applies to 9i, 10g and 11gR1, hangcheck_timer is not required for 11gR2 and forward. Recommended settings: 9i  (with default oracm misscount of 220): hangcheck_reboot =1 (enabled); hangcheck_tick=30 (seconds); hangcheck_margin=180 (seconds). 10g/11g  (with 'css misscount' of 30 to 60): hangcheck_reboot=1;hangcheck_tick=1;hangcheck_margin=10"
// *Document: NO
//  *Cause:
// *Action:
/
0240, ELEMENT_NAME_CSS_DIAGWAIT, "CSS diagwait parameter"
// *Document: NO
//  *Cause:
// *Action:
/
0241, DESC_CSS_DIAGWAIT, "Checks if the CSS diagwait is set correctly on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0242, SUCC_CSS_DIAGWAIT, "CSS diagwait is set to recommended value of 13 on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0243, VFAIL_CSS_DIAGWAIT, "CSS diagwait is not set to recommended value of 13 on node \"{0}\""
//  *Cause: CSS diagwait does not meet the recommendation
// *Action: Set the diagwait to the recommended setting using the '$CRS_HOME/bin/crsctl set css diagwait' command.
/
0244, EFAIL_CSS_DIAGWAIT, "Error encountered while trying to obtain the CSS diagwait setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the CSS diagwait setting.
// *Action:
/
0245, CSS_DIAGWAIT_DETAILS, "Setting CSS diagwait to recommended value of 13 will allow time to capture first failure diagnostics in case of node eviction which will assist support in analyzing the problem."
//  *Cause: 
// *Action:
/
0250, ELEMENT_NAME_CSS_MISSCOUNT, "CSS misscount parameter"
// *Document: NO
//  *Cause:
// *Action:
/
0251, DESC_CSS_MISSCOUNT, "Checks if the CSS misscount is set correctly on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0252, SUCC_CSS_MISSCOUNT, "CSS misscount is set to the recommended value on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0253, VFAIL_CSS_MISSCOUNT, "CSS misscount is not set to recommended on node \"{0}\""
//  *Cause: CSS misscount does not meet the requirement
// *Action: Set the misscount to the recommended setting using the '$CRS_HOME/bin/crsctl set css misscount' command.
/
0254, EFAIL_CSS_MISSCOUNT, "Error encountered while trying to obtain the CSS misscount setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the CSS misscount setting.
// *Action:
/
0255, CSS_MISSCOUNT_DETAILS, "The CSS misscount parameter represents the maximum time, in seconds, that a network heartbeat can be missed before entering into a cluster reconfiguration to evict the node"
// *Document: NO
//  *Cause:
// *Action:
/
0260, ELEMENT_NAME_CSS_REBOOTTIME, "CSS reboottime parameter"
// *Document: NO
//  *Cause:
// *Action:
/
0261, DESC_CSS_REBOOTTIME, "Checks if the CSS reboottime is set correctly on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0262, SUCC_CSS_REBOOTTIME, "CSS reboottime is set to recommended value of 3 seconds on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0263, VFAIL_CSS_REBOOTTIME, "CSS reboottime is not set to recommended value of 3 seconds on node \"{0}\""
//  *Cause: CSS reboottime does not meet the requirement
// *Action: Set the reboottime to the recommended setting using the '$CRS_HOME/bin/crsctl set css reboottime' command.
/
0264, EFAIL_CSS_REBOOTTIME, "Error encountered while trying to obtain the CSS reboottime setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the CSS reboottime setting.
// *Action:
/
0265, CSS_REBOOTTIME_DETAILS, "reboottime (default 3 seconds) is the amount of time allowed for a node to complete a reboot after the CSS daemon has been evicted."
//  *Cause: 
// *Action:
/
0270, ELEMENT_NAME_NETWORK_PARAMETER, "Network parameter - {0}"
// *Document: NO
//  *Cause:
// *Action:
/
0271, DESC_NETWORK_PARAMETER, "Checks if the network parameter is set correctly on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0272, SUCC_NETWORK_PARAMETER, "The value of network parameter \"{0}\" is set to the expected value \"{1}\" on node \"{2}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0273, VFAIL_NETWORK_PARAMETER, "The value of network parameter \"{0}\" for interface \"{4}\" is not configured to the expected value on node \"{1}\".[Expected=\"{2}\"; Found=\"{3}\"]"
//  *Cause: The indicated parameter of the indicated interface on the indicated
//          node was not configured to the expected value.
// *Action: Correct the configuration of the indicated parameter to the
//          indicated expected value.
/
0274, EFAIL_NETWORK_PARAMETER, "Error encountered while trying to obtain the network parameter setting on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve network parameter setting.
// *Action:
/
0275, VFAIL_UNKNOWN_NETWORK_PARAMETER, "The command line network parameter \"{0}\" did not specify a cluster interconnect."
// *Document: NO
//  *Cause: 
// *Action:
/
0280, ELEMENT_NAME_VMM_PARAMETER, "Virtual memory parameter"
// *Document: NO
//  *Cause:
// *Action:
/
0281, DESC_VMM_PARAMETER, "Checks if the virtual memory parameter is set correctly on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0282, SUCC_VMM_PARAMETER, "The value of virtual memory parameter \"{0}\" is set to the expected value \"{1}\" on node \"{2}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0283, VFAIL_VMM_PARAMETER, "The value of virtual memory parameter \"{0}\" is not set to the expected value on node \"{1}\".[Expected=\"{2}\"; Found=\"{3}\"]"
//  *Cause: 
// *Action:
/
0284, EFAIL_VMM_PARAMETER, "Error encountered while trying to obtain the virtual memory parameter setting on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve virtual memory parameter setting.
// *Action:
/
0290, ELEMENT_NAME_JUMBO_FRAMES, "Ethernet Jumbo Frames"
// *Document: NO
//  *Cause:
// *Action:
/
0291, DESC_JUMBO_FRAMES, "Checks if Jumbo Frames are configured on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0292, SUCC_JUMBO_FRAMES, "Jumbo Frames or mini Jumbo Frames are configured for interconnect on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0293, VFAIL_JUMBO_FRAMES, "Jumbo Frames are not configured for interconnects \"{3}\" on node \"{0}\". [Expected=\"{1}\"; Found=\"{2}\"]"
//  *Cause: 
// *Action:
/
0294, EFAIL_JUMBO_FRAMES, "Error trying to obtain the MTU setting on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve MTU setting.
// *Action:
/
0295, JUMBO_FRAMES_DETAILS, "A performance improvement can be seen with Jumbo Frames, check with your system and network administrator first and if possible, configure Jumbo Frames on interconnect. See reference for more detail specific to platform."
//  *Cause: 
// *Action:
/
0296, CLUSTER_INTERFACES_EFAIL, "Error retrieving cluster interfaces on node \"{0}\""
//  *Cause: Cluster interfaces could not be retrieved on the specified node using 'oifcfg getif'.
// *Action: Ensure that the Oracle Clusterware is configured and that the Oracle Clusterware stack is running.
/
0300, ELEMENT_NAME_E1000_FLOW_CONTROL, "E1000 flow control"
// *Document: NO
//  *Cause:
// *Action:
/
0301, DESC_E1000_FLOW_CONTROL, "Checks the E1000 flow control settings"
// *Document: NO
//  *Cause:
// *Action:
/
0302, SUCC_E1000_FLOW_CONTROL, "E1000 flow control settings configured correctly on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0303, VFAIL_E1000_FLOW_CONTROL, "Potential problem with E1000 NIC exists on node \"{0}\"."
//  *Cause: 
// *Action:
/
0304, EFAIL_E1000_FLOW_CONTROL, "Error while checking flow control settings in the E1000 on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve E1000 flow control settings.
// *Action:
/
0305, E1000_FLOW_CONTROL_DETAILS, "The number of \"packet reassembles failed\" correlates with the number of global cache blocks lost for some of the 2.6 kernel configurations. 2.6 kernel defaults RX flow control to off, which means it ignores the  pause frames from the switch and overloads it. Turning on RX flow control on 2.6 stops the drops. Commands to check for these settings and possible diagnostics: 'ethtool eth1', for checking speed, MTU size. 'ethtool -S eth1' for example to check for physical failures. Note that eth1 is an example in this case"
// *Document: NO
//  *Cause:
// *Action:
/
0310, ELEMENT_NAME_DEFAULT_GATEWAY_VIP_SUBNET, "VIP Default Gateway Subnet"
// *Document: NO
//  *Cause:
// *Action:
/
0311, DESC_DEFAULT_GATEWAY_VIP_SUBNET, "Checks that the default gateway is on the same subnet as VIP"
// *Document: NO
//  *Cause:
// *Action:
/
0312, SUCC_DEFAULT_GATEWAY_VIP_SUBNET, "VIP and default gateway are on the same subnet \"{0}\" on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0313, VFAIL_DEFAULT_GATEWAY_VIP_SUBNET, "VIP (\"{0}\") and default gateway (\"{1}\") are on different subnet on node \"{2}\"."
//  *Cause: 
// *Action:
/
0314, EFAIL_DEFAULT_GATEWAY_SUBNET, "Error while checking default gateway subnet on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve subnet of default gateway.
// *Action:
/
0315, EFAIL_DEFAULT_VIP_SUBNET, "Error while checking VIP subnet on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve subnet of VIP.
// *Action:
/
0316, DEFAULT_GATEWAY_VIP_SUBNET_DETAILS, "By default, the server's default gateway is used as a ping target during the Oracle RAC VIP status check action. Upon a ping failure, Oracle will decide that the current interface where the VIP is running has failed, and will initiate an interface / internode VIP failover."
// *Document: NO
//  *Cause:
// *Action:
/
0320, ELEMENT_NAME_VIP_RESTART, "VIP restart attempts"
// *Document: NO
//  *Cause:
// *Action:
/
0321, DESC_VIP_RESTART, "Checks the VIP restart configuration"
// *Document: NO
//  *Cause:
// *Action:
/
0322, SUCC_VIP_RESTART, "VIP restart_attempt ({0}) = 0 on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0323, VFAIL_VIP_RESTART, "VIP restart_attempt ({0}) > 0 on node \"{1}\"."
//  *Cause: 
// *Action:
/
0324, EFAIL_VIP_RESTART, "Error while checking VIP restart configuration on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve VIP restart configuration.
// *Action:
/
0325, VIP_RESTART_DETAILS, "If VIP restart_attempt is nonzero, CRS attempt as many times as restart_attempt before failing over to healthy cluster member which leads to more network failover time."
//  *Cause: 
// *Action:
/
0330, ELEMENT_NAME_TCP_RETRANSMISSIONS, "TCP packet re-transmit"
// *Document: NO
//  *Cause:
// *Action:
/
0331, DESC_TCP_RETRANSMISSIONS, "Checks the TCP retransmissions"
// *Document: NO
//  *Cause:
// *Action:
/
0332, SUCC_TCP_RETRANSMISSIONS, "TCP retransmissions ({0}) is less than 30% on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0333, VFAIL_TCP_RETRANSMISSIONS, "TCP retransmissions ({0}) is greater than 30% on node \"{1}\"."
//  *Cause: 
// *Action:
/
0334, EFAIL_TCP_RETRANSMISSIONS, "Error while checking TCP packet re-transmit rate on node \"{0}\""
//  *Cause: An error occurred while attempting to retrieve TCP packet re-transmit rate.
// *Action:
/
0335, TCP_RETRANSMISSIONS_DETAILS, "A TCP retransmissions rate above 30% indicates network reliability may be too low for Oracle Clusterware purposes."
// *Document: NO
//  *Cause:
// *Action:
/
0340, ELEMENT_NAME_NETWORK_PACKET_REASSEMBLY, "Network packet reassembly"
// *Document: NO
//  *Cause:
// *Action:
/
0341, DESC_NETWORK_PACKET_REASSEMBLY, "Checks whether the network packets are being reassembled"
// *Document: NO
//  *Cause:
// *Action:
/
0342, SUCC_NETWORK_PACKET_REASSEMBLY, "Network packet reassembly not occurring on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0343, VFAIL_NETWORK_PACKET_REASSEMBLY, "Network packet reassembly occurring on node \"{1}\"."
//  *Cause: A possible cause is the difference in the MTU size across network
// *Action: Ensure that the MTU size is same across network
/
0344, EFAIL_NETWORK_PACKET_REASSEMBLY, "Error while checking network packet reassembly on node \"{0}\""
//  *Cause: An error occurred while attempting to check network packet reassembly.
// *Action:
/
0350, ELEMENT_NAME_CSS_DISKTIMEOUT, "CSS disktimeout parameter"
// *Document: NO
//  *Cause:
// *Action:
/
0351, DESC_CSS_DISKTIMEOUT, "Checks if the CSS disktimeout is set correctly on the system"
// *Document: NO
//  *Cause:
// *Action:
/
0352, SUCC_CSS_DISKTIMEOUT, "CSS disktimeout is set to recommended value of {0} seconds"
// *Document: NO
//  *Cause:
// *Action:
/
0353, VFAIL_CSS_DISKTIMEOUT, "CSS disktimeout is not set to recommended value of {0} seconds"
//  *Cause: 
// *Action:
/
0354, EFAIL_CSS_DISKTIMEOUT, "Error encountered while trying to obtain the CSS disktimeout setting"
//  *Cause: An error occurred while attempting to determine the CSS disktimeout setting.
// *Action:
/
0355, CSS_DISKTIMEOUT_DETAILS, "The maximum amount of time allowed for a voting file I/O to complete; if this time is exceeded the voting disk will be marked as offline.  Note that this is also the amount of time that will be required for initial cluster formation, i.e. when no nodes have previously been up and in a cluster."
// *Document: NO
//  *Cause:
// *Action:
/

0360, ELEMENT_NAME_DISK_ASYNCH_IO_LINKING, "Oracle linking with asynchronous IO libraries"
// *Document: NO
//  *Cause:
// *Action:
/
0361, DESC_DISK_ASYNCH_IO_LINKING, "Checks if Oracle is linked with asynchronous IO libraries"
// *Document: NO
//  *Cause:
// *Action:
/
0362, SUCC_DISK_ASYNCH_IO_LINKING, "Oracle is linked with asynchronous IO libraries on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0363, VFAIL_DISK_ASYNCH_IO_LINKING, "Oracle is not linked with asynchronous IO libraries on node \"{0}\""
//  *Cause: 
// *Action:
/
0364, EFAIL_DISK_ASYNCH_IO_LINKING, "Error while checking asynchronous IO linking on node \"{0}\""
//  *Cause: 
// *Action:
/

0370, ELEMENT_NAME_NON_ROUTABLE_NETWORK_INTERCONNECT, "Non-routable network for interconnect"
// *Document: NO
//  *Cause:
// *Action:
/
0371, DESC_NON_ROUTABLE_NETWORK_INTERCONNECT, "Checks if the interconnect is configured on routable network addresses"
// *Document: NO
//  *Cause:
// *Action:
/
0372, SUCC_NON_ROUTABLE_NETWORK_INTERCONNECT, "Interconnect is configured on non-routable network addresses on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0373, VFAIL_NON_ROUTABLE_NETWORK_INTERCONNECT, "Interconnect should not be configured on routable network addresses on node \"{0}\""
//  *Cause: 
// *Action:
/
0374, EFAIL_NON_ROUTABLE_NETWORK_INTERCONNECT, "Error while checking network for interconnect on node \"{0}\""
//  *Cause: 
// *Action:
/
0375, NON_ROUTABLE_NETWORK_INTERCONNECT_DETAILS, "Interconnect should be configured on non-routable private LAN. Interconnect IP should not be accessible outside LAN."
//  *Cause: 
// *Action:
/


0380, ELEMENT_NAME_HANGCHECK_REBOOT, "Hangcheck reboot"
// *Document: NO
//  *Cause:
// *Action:
/
0381, DESC_HANGCHECK_REBOOT, "Checks if the hangcheck reboot is configured properly"
// *Document: NO
//  *Cause:
// *Action:
/
0382, SUCC_HANGCHECK_REBOOT, "Hangcheck reboot is configured properly on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0383, VFAIL_HANGCHECK_REBOOT, "Hangcheck reboot is not configured properly on node \"{0}\""
//  *Cause: 
// *Action:
/
0384, EFAIL_HANGCHECK_REBOOT, "Error encountered while trying to obtain the hangcheck reboot setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the hangcheck reboot setting.
// *Action:
/
0385, HANGCHECK_REBOOT_DETAILS, "The hangcheck_reboot parameter determines if the hangcheck-timer restarts the node if the kernel fails to respond within the sum of the hangcheck_tick and hangcheck_margin parameter values. If the value of hangcheck_reboot is equal to or greater than 1, then the hangcheck-timer module restarts the system when a hang is detected. If the hangcheck_reboot parameter is set to zero, then the hangcheck-timer module does not restart the node when a hang is detected."
// *Document: NO
//  *Cause:
// *Action:
/

0390, ELEMENT_NAME_HANGCHECK_TICK, "Hangcheck tick"
// *Document: NO
//  *Cause:
// *Action:
/
0391, DESC_HANGCHECK_TICK, "Checks if the hangcheck tick is configured properly"
// *Document: NO
//  *Cause:
// *Action:
/
0392, SUCC_HANGCHECK_TICK, "Hangcheck tick is configured properly on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0393, VFAIL_HANGCHECK_TICK, "Hangcheck tick is not configured properly on node \"{0}\""
//  *Cause: 
// *Action:
/
0394, EFAIL_HANGCHECK_TICK, "Error encountered while trying to obtain the hangcheck tick setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the hangcheck tick setting.
// *Action:
/
0395, HANGCHECK_TICK_DETAILS, "hangcheck_tick parameter: This parameter defines how often, in seconds, the hangcheck-timer checks the node for hangs. The default value is 60 seconds. Oracle recommends that you change the value of hangcheck_tick to 1."
// *Document: NO
//  *Cause:
// *Action:
/

0400, ELEMENT_NAME_HANGCHECK_MARGIN, "Hangcheck margin"
// *Document: NO
//  *Cause:
// *Action:
/
0401, DESC_HANGCHECK_MARGIN, "Checks if the hangcheck margin is configured properly"
// *Document: NO
//  *Cause:
// *Action:
/
0402, SUCC_HANGCHECK_MARGIN, "Hangcheck timer margin is configured properly on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0403, VFAIL_HANGCHECK_MARGIN, "Hangcheck timer margin is not configured properly on node \"{0}\""
//  *Cause: 
// *Action:
/
0404, EFAIL_HANGCHECK_MARGIN, "Error encountered while trying to obtain the hangcheck margin setting on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the hangcheck margin setting.
// *Action:
/
0405, HANGCHECK_MARGIN_DETAILS, "The hangcheck_timer module is required to run a supported configuration in Linux.  Hangcheck-timer module should be loaded and enabled. 2.4 kernel hangcheck_reboot default is 1 (enabled); 2.6 kernel hangcheck_reboot default is 0 (disabled). In either case, hangcheck_reboot=1 is the proper setting when running Oracle Clusterware.  This applies to 9i, 10g and 11gR1, hangcheck timer is not required for 11gR2 and forward. Recommended settings: 9i  (with default oracm misscount of 220): hangcheck_reboot =1 (enabled); hangcheck_tick=30 (seconds); hangcheck_margin=180 (seconds). 10g/11g  (with css misscount of 30 to 60): hangcheck_reboot=1;hangcheck_tick=1;hangcheck_margin=10"
// *Document: NO
//  *Cause:
// *Action:
/
0410, ELEMENT_NAME_LISTENER_NAMING_CONVENTION, "Listener naming convention"
// *Document: NO
//  *Cause:
// *Action:
/
0411, DESC_LISTENER_NAMING_CONVENTION, "Checks if the listener naming convention is followed"
// *Document: NO
//  *Cause:
// *Action:
/
0412, SUCC_LISTENER_NAMING_CONVENTION, "Correct naming convention followed for listener name on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0413, VFAIL_LISTENER_NAMING_CONVENTION, "Wrong naming convention followed for listener name on node \"{0}\""
//  *Cause: 
// *Action:
/
0414, EFAIL_LISTENER_NAMING_CONVENTION, "Error encountered while trying to obtain the listener name on node \"{0}\""
//  *Cause: An error occurred while attempting to determine the listener name.
// *Action:
/
0415, LISTENER_NAMING_CONVENTION_DETAILS, "Listener name must have a suffix of hostname. If not, DBUA may fail while upgrading the database."
// *Document: NO
//  *Cause:
// *Action:
/
0420, DEV_SHM_FAILED , "/dev/shm is not found mounted on node \"{0}\""
//  *Cause: During database installation it is recommended to have /dev/shm mounted as a RAM file system.
// *Action: Mount /dev/shm as RAM file system with appropriate size.
/
0421, SHMEM_NOFSTAB, "No entry exists in /etc/fstab for mounting /dev/shm"
//  *Cause: The file /etc/fstab did not have an entry specifying /dev/shm and its size to be mounted. 
// *Action: Modify /etc/fstab to mount /dev/shm with appropriate size.
/
0422, SHMEM_DIFF, "The size of in-memory file system mounted at /dev/shm is \"{0}\" megabytes which does not match the size in /etc/fstab as \"{1}\" megabytes"
//  *Cause: The size of the mounted RAM file system did not equal the value configured for system startup.
// *Action: Modify /etc/fstab to mount /dev/shm with appropriate size.
/
0423, DEV_SHM_FSTAB_NOTEXIST, "The file /etc/fstab does not exist on node \"{0}\""
//  *Cause: The file /etc/fstab should exist on the node.
// *Action: Recreate or retrieve the /etc/fstab file.
/
0424, ELEMENT_NAME_DEV_SHM_MOUNT, "/dev/shm mounted as temporary file system"
// *Document: NO
//  *Cause:
// *Action:
/
0425, DESC_DEV_SHM_MOUNT, "Checks whether /dev/shm is mounted correctly as temporary file system"
// *Document: NO
//  *Cause:
// *Action:
/
0426, DEV_SHM_MOUNT_SIZE_LESS, "The size of in-memory file system mounted as /dev/shm is \"{0}\" megabytes which is less than the required size of \"{1}\" megabytes on node \"{2}\""
//  *Cause: The in-memory file system was found mounted a smaller size than required size on the identified node.
// *Action: Ensure that /dev/shm is correctly mounted with greater than or equal to the required size.
/
0427, DEV_SHM_MOUNT_SIZE_FAIL, "Failed to retrieve the size of in-memory file system mounted as /dev/shm on node \"{0}\""
//  *Cause: An attempt to retrieve the in-memory file system size failed on the identified node.
// *Action: Ensure that /dev/shm is correctly mounted and that the current user has the permissions required to access the /dev/shm mount information.
/
0428, DEV_SHM_NOPROCMOUNTS_LXC, "No entry exists in /proc/mounts for temporary file system /dev/shm."
//  *Cause: A CVU pre-install check for Linux containers failed because it
//          determined that the file /proc/mounts did not have an entry for the
//          temporary file system /dev/shm.
// *Action: Ensure that /dev/shm is correctly mounted. Verify that rc.sysinit 
//          is correctly configured to mount /dev/shm. 
/
0435, ELEMENT_NAME_SOLARIS_SRU_VERSION, "Oracle Solaris Support Repository Updates (SRU) version."
// *Document: NO
//  *Cause:
// *Action:
/
0436, DESC_SOLARIS_SRU_VERSION, "Checks whether the compatible Oracle Solaris Support Repository Updates version is installed."
// *Document: NO
//  *Cause:
// *Action:
/
0437, SUCC_SOLARIS_SRU_VERSION, "Oracle Solaris Support Repository Updates version was found to be up to date on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0438, FAIL_SOLARIS_SRU_VERSION, "Oracle Solaris Support Repository Updates version \"{0}\" is older than minimum supported version \"{1}\" on node \"{2}\"."
//  *Cause: A CVU pre-install check found that the indicated version of Oracle 
//          Solaris Support Repository Updates was older than the minimum 
//          supported version as indicated on the identified node.
// *Action: Ensure that the Oracle Solaris Support Repository Updates version on
//          the identified node is updated to the minimum supported version as 
//          indicated.
/
0439, EFAIL_SOLARIS_SRU_VERSION, "Command \"{0}\" issued on node \"{1}\" to retrieve the operating system version failed with error \"{2}\"."
//  *Cause: A CVU check for minimum SRU version could not complete because an 
//          error orccurred while attempting to determine the current operating
//          system version on the indicated node using the indicated command. 
// *Action: Examine the accompanying Operating System error message and respond
//          accordingly.
/
0440, SOLARIS_SRU_VERSION_DETAILS, "Determines whether the Oracle Solaris Support Repository Updates (SRU) version must be updated in order to match to the minimum compatible version required for Oracle Clusterware."
// *Document: NO
//  *Cause:
// *Action:
/
0450, ELEMENT_NAME_REVERSE_PATH_FILTER, "Reverse path filter setting"
// *Document: NO
//  *Cause:
// *Action:
/
0451, DESC_REVERSE_PATH_FILTER, "Checks if reverse path filter setting for all private interconnect network interfaces is correct"
// *Document: NO
//  *Cause:
// *Action:
/
0452, SUCC_REVERSE_PATH_FILTER, "Reverse path filter setting is correct for all private interconnect network interfaces on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0453, VFAIL_REVERSE_PATH_FILTER, "Reverse path filter parameter \"rp_filter\" for private interconnect network interfaces \"{0}\" is not set to 0 or 2 on node \"{1}\"."
//  *Cause: Reverse path filter parameter 'rp_filter' was not set to 0 or 2 for identified private interconnect network interfaces on specified node. 
// *Action: Ensure that the 'rp_filter' parameter is correctly set to the value of 0 or 2 for each of the interface used in the private interconnect classification,
//          This will disable or relax the filtering and allow Oracle Clusterware to function correctly. Use 'sysctl' command to modify the value of this parameter.
/
0454, EFAIL_REVERSE_PATH_FILTER, "Error encountered while trying to retrieve the value of \"rp_filter\" parameter of \"{0}\" network interfaces on node \"{1}\""
//  *Cause: An error occurred while attempting to retrieve reverse path filter parameter 'rp_filter' value on specified node.
// *Action:
/
0455, REVERSE_PATH_FILTER_DETAILS, "Reverse path filter parameter \"rp_filter\" must be set to the value of 0 or 2 for all the private interconnect network interfaces, this will disable or relax the filtering and allow Oracle Clusterware to function correctly"
// *Document: NO
//  *Cause: 
// *Action:
/
0456, VFAIL_REVERSE_PATH_FILTER_CONFIG, "Reverse path filter parameter \"rp_filter\" for private interconnect network interfaces \"{0}\" is not configured to the value of 0 or 2 in file /etc/sysctl.conf on node \"{1}\"."
//  *Cause: Reverse path filter parameter 'rp_filter' was not configured to the
//          value 0 or 2 for identified private interconnect network interfaces
//          on the specified node.
// *Action: Ensure that the 'rp_filter' parameter is correctly configured to the
//          value of 0 or 2 inside the /etc/sysctl.conf file for all the interface
//          used in the private interconnect classification. This will disable 
//          or relax the filtering and allow Oracle Clusterware to function 
//          correctly. Configuring this value correctly inside the /etc/sysctl.conf
//          file ensures the persistent setting of this value on reboots.
/
0457, REVERSE_PATH_FILTER_NOT_APPLICABLE_NODE, "Reverse path filter check is not applicable on node \"{0}\", which has only one private interconnect network interface."
// *Document: NO
//  *Cause:
// *Action:
/
0460, ELEMENT_NAME_CI_BONDING, "Network interface bonding status of private interconnect network interfaces"
// *Document: NO
//  *Cause:
// *Action:
/
0461, DESC_CI_BONDING, "Checks if the network bonding feature, if used for private interconnect network interfaces, is configured using correct bonding mode"
// *Document: NO
//  *Cause:
// *Action:
/
0462, CI_BONDING_INFO_NODE, "Network bonding mode \"{0}\" is used for private interconnect interfaces \"{1}\" on node \"{2}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0463, VFAIL_CI_BONDING_NODE, "Network bonding feature is enabled on node \"{0}\" with bonding mode \"{1}\" which is not an allowed value of 0 \"balance-rr\" or 1 \"active-backup\" for private interconnect network interfaces \"{2}\""
//  *Cause: The bonding mode specified for the network interfaces used as private cluster interconnect was not an allowed value.
// *Action: Configure network bonding mode 0 or 1 on interfaces used for private cluster interconnect.  
/
0464, VFAIL_CI_BONDING, "Network bonding feature is enabled on nodes \"{0}\" with a bonding mode that conflicts with cluster private interconnect usage."
//  *Cause: An incorrect bonding mode was used for the network bonds in 
//          which private interconnect network interfaces participate on the indicated nodes.
// *Action: Ensure that the network bonding mode is set to the allowed value of 0 or 1 
//          for all the network bonds in which private interconnect network interfaces participate.  
/
0465, VFAIL_CI_BONDING_INCONSISTENT_MODE, "Network bonding mode used on interfaces classified for private cluster interconnect on nodes \"{0}\" is inconsistent.\nNetwork bonding details are as follows:\n{1}"
//  *Cause: An inconsistent network bonding mode was used for the network 
//          bonds in which cluster interconnect interfaces participate on the indicated nodes.
// *Action: Ensure that the network bonding mode used for all the network bonds 
//          in which cluster interconnect interfaces participate is consistent across all the nodes.
/
0466, VFAIL_CI_BONDING_NO_PVT_NIC_INFO, "Private interconnect network interface list for current network configuration was not available"
//  *Cause: An attempt to retrieve cluster private network classifications failed.
// *Action: Ensure that the configuration of public and private network classifications was done correctly during the installation process.
//          If Oracle Clusterware is already configured then issue 'oifcfg getif' command to list the current network configuration.
/
0467, CI_BONDING_DETAILS, "Network interface bonding, if enabled for private interconnect network interfaces, must use bonding mode of either 0 \"balance-rr\" or 1 \"active-backup\"."
// *Document: NO
//  *Cause: 
// *Action:
/
0468, VFAIL_CI_BONDING_NIC_MTU_MISMATCH, "Different MTU values \"{0}\" configured for the network interfaces \"{1}\" participate in the network bonding with mode \"{2}\" on node \"{3}\"."
//  *Cause: The Cluster Verification Utility (CVU) determined that the 
//          indicated network interfaces were not configured with the same
//          maximum transmission units (MTU) value on the indicated node.
// *Action: Ensure that all of the indicated network interfaces participate 
//          in the network bonding configured with the same MTU value on the 
//          indicated node.
/
0470, ELEMENT_NAME_BPF_DEVICES, "Berkeley Packet Filter devices /dev/bpf* existence and validation check"
// *Document: NO
//  *Cause:
// *Action:
/
0471, DESC_BPF_DEVICES, "Checks if the Berkeley Packet Filter devices are created under /dev directory. validates the major and minor number of the bpf devices to ensure they do not duplicate those of other defined devices."
// *Document: NO
//  *Cause:
// *Action:
/
0472, BPF_DEVICES_INFO_NODE, "Berkeley Packet Filter devices \"{0}\" exist on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0473, VFAIL_BPF_DEVICES_DUPLICATE_MAJOR_NUMBER, "Berkeley Packet Filter device \"{0}\" is created with major number \"{1}\" which is already in use by devices \"{2}\" on node \"{3}\"."
//  *Cause: The indicated Berkeley Packet Filter device was found to be using
//          a major number which is also in use by the indicated devices 
// *Action: Ensure that the major number of the indicated Berkeley Packet Filter
//          device is not in use by any other device on the indicated node.
/
0474, VFAIL_BPF_DEVICES_ABSENT, "Berkeley Packet Filter devices do not exist under directory /dev on nodes \"{0}\"."
//  *Cause: Berkeley Packet Filter devices /dev/bpf* were not found 
//          under the /dev directory on the indicated nodes.
// *Action: Create the Berkeley Packet Filter devices using the 'mknod' command
//          on the indicated nodes and ensure that the devices are created using
//          unique major and minor numbers.  
/
0475, VFAIL_BPF_DEVICES_INCONSISTENT_NODE, "Berkeley Packet Filter devices \"{0}\" are using same major number \"{1}\" and minor number \"{2}\" on node \"{3}\""
//  *Cause: The indicated devices were found using same major and minor number on
//          the identified node. 
// *Action: Ensure that the minor number of each Berkeley Packet Filter device
//          is unique on the identified node. 
/
0476, EFAIL_READ_DEVICE_INFO_NODE, "Failed to list the devices under directory /dev on node \"{0}\""
//  *Cause: An attempt to read the attributes of all the devices under /dev
//          directory failed on the identified node. 
// *Action: Ensure that the current user has permission to list and
//          read the attributes of devices listed under directory /dev on the
//          identified node.  
/
0477, BPF_DEVICES_DETAILS, "Berkeley Packet Filter devices are required for HAIP configuration. If BPF devices are created, they must use a major number which is not in use by another device and the minor number of the bpf devices must be unique amongst them."
// *Document: NO
//  *Cause: 
// *Action:
/
2500, ELEMENT_NAME_FAST_START_MTTR_TARGET, "FAST_START_MTTR_TARGET"
// *Document: NO
//  *Cause:
// *Action:
/
2501, DESC_FAST_START_MTTR_TARGET, "Checks FAST_START_MTTR_TARGET"
// *Document: NO
//  *Cause:
// *Action:
/
2502, SUCC_FAST_START_MTTR_TARGET, "FAST_START_MTTR_TARGET configured correctly."
// *Document: NO
//  *Cause:
// *Action:
/
2503, VFAIL_FAST_START_MTTR_TARGET, "FAST_START_MTTR_TARGET should be 0 when _FAST_START_INSTANCE_RECOVERY_TARGET > 0 on rac."
//  *Cause: FAST_START_MTTR_TARGET > 0, when _FAST_START_INSTANCE_RECOVERY_TARGET > 0
// *Action: set FAST_START_MTTR_TARGET to 0 when _FAST_START_INSTANCE_RECOVERY_TARGET > 0
/
2504, EFAIL_FAST_START_MTTR_TARGET, "Error while checking FAST_START_MTTR_TARGET"
//  *Cause: An error occurred while attempting to retrieve FAST_START_MTTR_TARGET.
// *Action:
/
2505, FAST_START_MTTR_TARGET_DETAILS, ""
// *Document: NO
//  *Cause:
// *Action:
/
2510, ELEMENT_NAME_PRE_PAGE_SGA, "PRE_PAGE_SGA"
// *Document: NO
//  *Cause:
// *Action:
/
2511, DESC_PRE_PAGE_SGA, "Checks PRE_PAGE_SGA setting"
// *Document: NO
//  *Cause:
// *Action:
/
2512, SUCC_PRE_PAGE_SGA, "PRE_PAGE_SGA = false."
// *Document: NO
//  *Cause:
// *Action:
/
2513, VFAIL_PRE_PAGE_SGA, "PRE_PAGE_SGA = true."
//  *Cause: 
// *Action:
/
2514, EFAIL_PRE_PAGE_SGA, "Error while checking PRE_PAGE_SGA"
//  *Cause: 
// *Action:
/
2515, PRE_PAGE_SGA_DETAILS, "PRE_PAGE_SGA=true can significantly increase the time required to establish database connections. In cases where the connections to the database are very slow, check the configuration of this parameter and set this parameter to false, it avoids mapping the entire SGA and process startup and consuming time."
// *Document: NO
//  *Cause:
// *Action:
/
2520, ELEMENT_NAME_PARALLEL_EXECUTION_MESSAGE_SIZE, "PARALLEL_EXECUTION_MESSAGE_SIZE"
// *Document: NO
//  *Cause:
// *Action:
/
2521, DESC_PARALLEL_EXECUTION_MESSAGE_SIZE, "Checks PARALLEL_EXECUTION_MESSAGE_SIZE setting"
// *Document: NO
//  *Cause:
// *Action:
/
2522, SUCC_PARALLEL_EXECUTION_MESSAGE_SIZE, "PARALLEL_EXECUTION_MESSAGE_SIZE >= 4096."
// *Document: NO
//  *Cause:
// *Action:
/
2523, VFAIL_PARALLEL_EXECUTION_MESSAGE_SIZE, "PARALLEL_EXECUTION_MESSAGE_SIZE < 4096."
//  *Cause: 
// *Action:
/
2524, EFAIL_PARALLEL_EXECUTION_MESSAGE_SIZE, "Error while checking PARALLEL_EXECUTION_MESSAGE_SIZE"
//  *Cause: 
// *Action:
/
2525, PARALLEL_EXECUTION_MESSAGE_SIZE_DETAILS, "Increase init.ora PARALLEL_EXECUTION_MESSAGE_SIZE from default (normallly 2048) to 8192. Speed up parallel executions, including instance recovery, but use more memory. Has helped in most parallel execution environments and configurations we have worked with.  This can be set higher for datawarehousing based systems where there is a lot of data transferred through PQ."
// *Document: NO
//  *Cause:
// *Action:
/
2530, ELEMENT_NAME_OPTIMIZER_DYNAMIC_SAMPLING, "OPTIMIZER_DYNAMIC_SAMPLING"
// *Document: NO
//  *Cause:
// *Action:
/
2531, DESC_OPTIMIZER_DYNAMIC_SAMPLING, "Checks OPTIMIZER_DYNAMIC_SAMPLING setting"
// *Document: NO
//  *Cause:
// *Action:
/
2532, SUCC_OPTIMIZER_DYNAMIC_SAMPLING, "OPTIMIZER_DYNAMIC_SAMPLING is set to the recommended value of 2"
// *Document: NO
//  *Cause:
// *Action:
/
2533, VFAIL_OPTIMIZER_DYNAMIC_SAMPLING, "OPTIMIZER_DYNAMIC_SAMPLING is not set to the recommended value of 2"
//  *Cause: 
// *Action:
/
2534, EFAIL_OPTIMIZER_DYNAMIC_SAMPLING, "Error while checking OPTIMIZER_DYNAMIC_SAMPLING"
//  *Cause: 
// *Action:
/
2535, OPTIMIZER_DYNAMIC_SAMPLING_DETAILS, "Not having OPTIMIZER_DYNAMIC_SAMPLING set to the default value of 2 can have an adverse impact on cost based optimizer performance.  This is a required setting for EBS and PeopleSoft applications."
// *Document: NO
//  *Cause:
// *Action:
/
2540, ELEMENT_NAME_DB_WRITER_PROCESSES, "DB_WRITER_PROCESSES"
// *Document: NO
//  *Cause:
// *Action:
/
2541, DESC_DB_WRITER_PROCESSES, "Checks DB_WRITER_PROCESSES setting"
// *Document: NO
//  *Cause:
// *Action:
/
2542, SUCC_DB_WRITER_PROCESSES, "Single DBWR when oracle linked with asynchronous IO libraries"
// *Document: NO
//  *Cause:
// *Action:
/
2543, VFAIL_DB_WRITER_PROCESSES, "More than one DBWR processes when oracle linked with asynchronous IO libraries"
//  *Cause: 
// *Action:
/
2544, EFAIL_DB_WRITER_PROCESSES, "Error while checking DB_WRITER_PROCESSES"
//  *Cause: 
// *Action:
/
2545, DB_WRITER_PROCESSES_DETAILS, "If asynchronous IO is enabled and database workload is not write intensive, generally having DBWR_IO_SLAVES set helps to gain performance."
// *Document: NO
//  *Cause:
// *Action:
/
2550, ELEMENT_NAME_MAX_COMMIT_PROPAGATION_DELAY, "MAX_COMMIT_PROPAGATION_DELAY"
// *Document: NO
//  *Cause:
// *Action:
/
2551, DESC_MAX_COMMIT_PROPAGATION_DELAY, "Checks MAX_COMMIT_PROPAGATION_DELAY setting"
// *Document: NO
//  *Cause:
// *Action:
/
2552, SUCC_MAX_COMMIT_PROPAGATION_DELAY, "MAX_COMMIT_PROPAGATION_DELAY is set to default value 0"
// *Document: NO
//  *Cause:
// *Action:
/
2553, VFAIL_MAX_COMMIT_PROPAGATION_DELAY, "MAX_COMMIT_PROPAGATION_DELAY is not set to default value 0"
//  *Cause: 
// *Action:
/
2554, EFAIL_MAX_COMMIT_PROPAGATION_DELAY, "Error while checking MAX_COMMIT_PROPAGATION_DELAY"
//  *Cause: 
// *Action:
/
2555, MAX_COMMIT_PROPAGATION_DELAY_DETAILS, "MAX_COMMIT_PROPAGATION_DELAY  should not be changed from its default value except under a limited set of circumstances."
// *Document: NO
//  *Cause:
// *Action:
/
2560, ELEMENT_NAME_INVALID_APPLICATION_OBJECTS, "INVALID objects in the application related schemas"
// *Document: NO
//  *Cause:
// *Action:
/
2561, DESC_INVALID_APPLICATION_OBJECTS, "Checks for the presence of INVALID objects in the application related schemas (non SYS and SYSTEM)"
// *Document: NO
//  *Cause:
// *Action:
/
2562, SUCC_INVALID_APPLICATION_OBJECTS, "No application objects were found to be invalid"
// *Document: NO
//  *Cause:
// *Action:
/
2563, VFAIL_INVALID_APPLICATION_OBJECTS, "Application objects were found to be invalid"
//  *Cause: 
// *Action:
/
2564, EFAIL_INVALID_APPLICATION_OBJECTS, "Error while checking presence of any invalid application objects"
//  *Cause: 
// *Action:
/
2565, INVALID_APPLICATION_OBJECTS_DETAILS, "Investigate invalid objects in the application related schemas (non SYS and SYSTEM)."
// *Document: NO
//  *Cause:
// *Action:
/
2570, ELEMENT_NAME_INVALID_JAVA_OBJ, "Invalid Java Objects"
// *Document: NO
//  *Cause:
// *Action:
/
2571, DESC_INVALID_JAVA_OBJ, "Checks invalid java objects"
// *Document: NO
//  *Cause:
// *Action:
/
2572, SUCC_INVALID_JAVA_OBJ, "There are no invalid objects for the Java VM"
// *Document: NO
//  *Cause:
// *Action:
/
2573, VFAIL_INVALID_JAVA_OBJ, "Objects which make up the Java VM are invalid"
//  *Cause: 
// *Action:
/
2574, EFAIL_INVALID_JAVA_OBJ, "Error while checking invalid java objects"
//  *Cause: 
// *Action:
/
2580, ELEMENT_NAME_DBWR_IO_SLAVES, "DBWR_IO_SLAVES"
// *Document: NO
//  *Cause:
// *Action:
/
2581, DESC_DBWR_IO_SLAVES, "Checks DBWR_IO_SLAVES setting"
// *Document: NO
//  *Cause:
// *Action:
/
2582, SUCC_DBWR_IO_SLAVES, "Multiple DBWR IO slaves are configured"
// *Document: NO
//  *Cause:
// *Action:
/
2583, VFAIL_DBWR_IO_SLAVES, "Multiple DBWR IO slaves are not configured"
//  *Cause: 
// *Action:
/
2584, EFAIL_DBWR_IO_SLAVES, "Error while checking DBWR_IO_SLAVES"
//  *Cause: 
// *Action:
/
2585, DBWR_IO_SLAVES_DETAILS, "When Oracle is linked with asynchronous IO libraries and DISK_ASYNC_IO = TRUE, it is recommended that multiple DBWR IO slaves be configured."
// *Document: NO
//  *Cause:
// *Action:
/
2590, ELEMENT_NAME_SYSAUX_TS, "SYSAUX tablespace existence"
// *Document: NO
//  *Cause:
// *Action:
/
2591, DESC_SYSAUX_TS, "Checks existence of SYSAUX tablespace"
// *Document: NO
//  *Cause:
// *Action:
/
2592, SUCC_SYSAUX_TS, "SYSAUX Tablespace already exists"
// *Document: NO
//  *Cause:
// *Action:
/
2593, VFAIL_SYSAUX_TS, "SYSAUX Tablespace does not exist"
//  *Cause: 
// *Action:
/
2594, EFAIL_SYSAUX_TS, "Error while checking SYSAUX tablespace existence"
//  *Cause: 
// *Action:
/
2595, SYSAUX_TS_DETAILS, "The SYSAUX tablespace is required for versions 10 and above.  Refer to the Upgrade Companion for your target version for more details."
// *Document: NO
//  *Cause:
// *Action:
/
2600, ELEMENT_NAME_JVM_CONFIGURATION, "JVM configuration for database"
// *Document: NO
//  *Cause:
// *Action:
/
2601, DESC_JVM_CONFIGURATION, "Checks JVM configuration for database"
// *Document: NO
//  *Cause:
// *Action:
/
2602, SUCC_JVM_CONFIGURATION, "JVM appears to be working"
// *Document: NO
//  *Cause:
// *Action:
/
2603, VFAIL_JVM_CONFIGURATION, "JVM is not working correctly"
//  *Cause: 
// *Action:
/
2604, EFAIL_JVM_CONFIGURATION, "Error while checking database JVM configuration"
//  *Cause: 
// *Action:
/
2605, JVM_CONFIGURATION_DETAILS, "The query 'select dbms_java.longname('true') \"JAVAVM TESTING\" from dual;' should return \"true\" if the JVM is working correctly"
// *Document: NO
//  *Cause:
// *Action:
/
2610, ELEMENT_NAME_JAVA_BASED_USERS, "Java based user in database"
// *Document: NO
//  *Cause:
// *Action:
/
2611, DESC_JAVA_BASED_USERS, "Checks presence of any Java based user in database"
// *Document: NO
//  *Cause:
// *Action:
/
2612, SUCC_JAVA_BASED_USERS, "There are no Java-based users in the database"
// *Document: NO
//  *Cause:
// *Action:
/
2613, VFAIL_JAVA_BASED_USERS, "There should be NO Java-based users in the database version 9.0.1 abd above"
//  *Cause: 
// *Action:
/
2614, EFAIL_JAVA_BASED_USERS, "Error while checking Java based users"
//  *Cause: 
// *Action:
/
2615, JAVA_BASED_USERS_DETAILS, "There should not be any Java Based users for database version 9.0.1 and above."
// *Document: NO
//  *Cause:
// *Action:
/
2620, ELEMENT_NAME_JAVA_ROLE_COUNT, "Java Role Count"
// *Document: NO
//  *Cause:
// *Action:
/
2621, DESC_JAVA_ROLE_COUNT, "Checks JVM roles"
// *Document: NO
//  *Cause:
// *Action:
/
2622, SUCC_JAVA_ROLE_COUNT, "The JVM roles appear to be consistent"
// *Document: NO
//  *Cause:
// *Action:
/
2623, VFAIL_JAVA_ROLE_COUNT, "The JVM roles appear to be inconsistent"
//  *Cause: 
// *Action:
/
2624, EFAIL_JAVA_ROLE_COUNT, "Error while checking JVM roles"
//  *Cause: 
// *Action:
/
2625, JAVA_ROLE_COUNT_DETAILS, "A healthy JVM should contain six roles. If there are more or less than six roles, the JVM is inconsistent."
// *Document: NO
//  *Cause:
// *Action:
/
2630, ELEMENT_NAME_INVALID_SYSTEM_OBJECTS, "Invalid SYS or SYSTEM Schema Objects"
// *Document: NO
//  *Cause:
// *Action:
/
2631, DESC_INVALID_SYSTEM_OBJECTS, "Checks presence of any invalid SYS or SYSTEM schema objects"
// *Document: NO
//  *Cause:
// *Action:
/
2632, SUCC_INVALID_SYSTEM_OBJECTS, "No SYS or SYSTEM schema objects were found to be invalid"
// *Document: NO
//  *Cause:
// *Action:
/
2633, VFAIL_INVALID_SYSTEM_OBJECTS, "SYS or SYSTEM schema objects were found to be invalid"
//  *Cause: 
// *Action:
/
2634, EFAIL_INVALID_SYSTEM_OBJECTS, "Error while checking SYS or SYSTEM schema objects"
//  *Cause: 
// *Action:
/
2635, INVALID_SYSTEM_OBJECTS_DETAILS, "There should not be any invalid SYS or SYSTEM schema objects. Investigate invalid objects in the SYS and SYSTEM schemas."
// *Document: NO
//  *Cause:
// *Action:
/
2640, ELEMENT_NAME_SPFILE, "SPFILE"
// *Document: NO
//  *Cause:
// *Action:
/
2641, DESC_SPFILE, "Checks that the instances are using SPFILE"
// *Document: NO
//  *Cause:
// *Action:
/
2642, SUCC_SPFILE, "Instance is using SPFILE"
// *Document: NO
//  *Cause:
// *Action:
/
2643, VFAIL_SPFILE, "Instance is not using SPFILE"
//  *Cause: 
// *Action:
/
2644, EFAIL_SPFILE, "Error while checking SPFILE usage by instances"
//  *Cause: 
// *Action:
/
2645, SPFILE_DETAILS, "Using one and the same SPFILE for all instances in clustered database is recommended."
// *Document: NO
//  *Cause:
// *Action:
/
2650, ELEMENT_NAME_DATABASE_WORDSIZE, "Database word size(bits)"
// *Document: NO
//  *Cause:
// *Action:
/
2651, DESC_DATABASE_WORDSIZE, "Checks that the database is created with 64-bit word size"
// *Document: NO
//  *Cause:
// *Action:
/
2652, SUCC_DATABASE_WORDSIZE, "Database was created with 64-bit which avoids a known issue"
// *Document: NO
//  *Cause:
// *Action:
/
2653, VFAIL_DATABASE_WORDSIZE, "Database created with 32-bit word size, it is recommended to use 64-bit word size."
//  *Cause: 
// *Action:
/
2654, EFAIL_DATABASE_WORDSIZE, "Error while checking database word size"
//  *Cause: 
// *Action:
/
2655, DATABASE_WORDSIZE_DETAILS, "When database is created with 32-bit word size and upgrading database to 10.2.0.3.0  (64-bit)  there are known issues."
// *Document: NO
//  *Cause:
// *Action:
/
2660, ELEMENT_NAME_DUPLICATE_SYSTEM_OBJECTS, "Duplicate SYS or SYSTEM Schema Objects"
// *Document: NO
//  *Cause:
// *Action:
/
2661, DESC_DUPLICATE_SYSTEM_OBJECTS, "Checks for duplicate SYS or SYSTEM schema objects"
// *Document: NO
//  *Cause:
// *Action:
/
2662, SUCC_DUPLICATE_SYSTEM_OBJECTS, "No Duplicate objects were found in the SYS or SYSTEM schemas"
// *Document: NO
//  *Cause:
// *Action:
/
2663, VFAIL_DUPLICATE_SYSTEM_OBJECTS, "Duplicate objects were found in the SYS or SYSTEM schemas"
//  *Cause: 
// *Action:
/
2664, EFAIL_DUPLICATE_SYSTEM_OBJECTS, "Error while checking duplicate SYS or SYSTEM schema objects"
//  *Cause: 
// *Action:
/
2665, DUPLICATE_SYSTEM_OBJECTS_DETAILS, "If any duplicate objects were found in the SYS and SYSTEM schemas, refer to articles in the references section. Read the exceptions carefully before taking action."
// *Document: NO
//  *Cause:
// *Action:
/
2670, ELEMENT_NAME_ASM_POWER_LIMIT, "ASM_POWER_LIMIT"
// *Document: NO
//  *Cause:
// *Action:
/
2671, DESC_ASM_POWER_LIMIT, "Checks the setting of ASM_POWER_LIMIT"
// *Document: NO
//  *Cause:
// *Action:
/
2672, SUCC_ASM_POWER_LIMIT, "ASM_POWER_LIMIT is set to recommended value of 1"
// *Document: NO
//  *Cause:
// *Action:
/
2673, VFAIL_ASM_POWER_LIMIT, "ASM_POWER_LIMIT is not set to recommended value of 1"
//  *Cause: 
// *Action:
/
2674, EFAIL_ASM_POWER_LIMIT, "Error while checking asm_power_limit"
//  *Cause: 
// *Action:
/
2675, ASM_POWER_LIMIT_DETAILS, "ASM_POWER_LIMIT specifies the maximum power on an Automatic Storage Management instance for disk rebalancing. The higher the limit, the faster rebalancing will complete. Lower values will take longer, but consume fewer processing and I/O resources."
// *Document: NO
//  *Cause:
// *Action:
/
2680, ELEMENT_NAME_ENABLE_NUMA_OPTIMIZATION, "_ENABLE_NUMA_OPTIMIZATION"
// *Document: NO
//  *Cause:
// *Action:
/
2681, DESC_ENABLE_NUMA_OPTIMIZATION, "Checks the setting of _ENABLE_NUMA_OPTIMIZATION"
// *Document: NO
//  *Cause:
// *Action:
/
2682, SUCC_ENABLE_NUMA_OPTIMIZATION, "NUMA (Non-Uniform Memory Access) is not enabled for database instances"
// *Document: NO
//  *Cause:
// *Action:
/
2683, VFAIL_ENABLE_NUMA_OPTIMIZATION, "NUMA (Non-Uniform Memory Access) is enabled for database instance which can cause instance hang"
//  *Cause: 
// *Action:
/
2684, EFAIL_ENABLE_NUMA_OPTIMIZATION, "Error while checking _ENABLE_NUMA_OPTIMIZATION"
//  *Cause: 
// *Action:
/
2685, ENABLE_NUMA_OPTIMIZATION_DETAILS, "Ensure the NUMA ( Non Uniform Memory Architecture) feature is turned OFF either in the OS or in the Oracle database configuration. With NUMA enabled there are many performance and operational issues reported.  Hence advised from RAC development team to disable NUMA. To disable NUMA support in Oracle database: _ENABLE_NUMA_OPTIMIZATION=FALSE; _db_block_numa=1"
// *Document: NO
//  *Cause:
// *Action:
/
2690, ELEMENT_NAME_MAX_DUMP_FILE_SIZE, "MAX_DUMP_FILE_SIZE"
// *Document: NO
//  *Cause:
// *Action:
/
2691, DESC_MAX_DUMP_FILE_SIZE, "Checks the setting of MAX_DUMP_FILE_SIZE"
// *Document: NO
//  *Cause:
// *Action:
/
2692, SUCC_MAX_DUMP_FILE_SIZE, "Initialization parameter MAX_DUMP_FILE_SIZE is set to recommended value of 'unlimited'"
// *Document: NO
//  *Cause:
// *Action:
/
2693, VFAIL_MAX_DUMP_FILE_SIZE, "Initialization parameter  MAX_DUMP_FILE_SIZE is not set to recommended value of 'unlimited'"
//  *Cause: 
// *Action:
/
2694, EFAIL_MAX_DUMP_FILE_SIZE, "Error while checking MAX_DUMP_FILE_SIZE"
//  *Cause: 
// *Action:
/
2695, MAX_DUMP_FILE_SIZE_DETAILS, "Initialization parameter MAX_DUMP_FILE_SIZE should be set to 'unlimited' to avoid limiting the capture of failure and hang diagnostic data. See MOS note 30762.1 for more information."
// *Document: NO
//  *Cause:
// *Action:
/
2700, ELEMENT_NAME_REMOTE_LISTENER, "REMOTE_LISTENER"
// *Document: NO
//  *Cause:
// *Action:
/
2701, DESC_REMOTE_LISTENER, "Checks that the REMOTE_LISTENER parameter is set"
// *Document: NO
//  *Cause:
// *Action:
/
2702, SUCC_REMOTE_LISTENER, "REMOTE_LISTENER parameter is set to achieve load balancing and failover"
// *Document: NO
//  *Cause:
// *Action:
/
2703, VFAIL_REMOTE_LISTENER, "REMOTE_LISTENER parameter is not set to achieve load balancing and failover"
//  *Cause: 
// *Action:
/
2704, EFAIL_REMOTE_LISTENER, "Error while checking REMOTE_LISTENER"
//  *Cause: 
// *Action:
/
2705, REMOTE_LISTENER_DETAILS, "Setting the database REMOTE_LISTENER parameter makes it possible to use listener-based load balancing and failover features."
// *Document: NO
//  *Cause:
// *Action:
/
2710, ELEMENT_NAME_FILES_IN_BACKUP, "Database Datafiles in Backup Mode"
// *Document: NO
//  *Cause:
// *Action:
/
2711, DESC_FILES_IN_BACKUP, "Checks if there are any database datafiles in backup mode"
// *Document: NO
//  *Cause:
// *Action:
/
2712, SUCC_FILES_IN_BACKUP, "No database datafiles are in backup mode"
// *Document: NO
//  *Cause:
// *Action:
/
2713, VFAIL_FILES_IN_BACKUP, "One or more database datafiles are in backup mode"
//  *Cause: 
// *Action:
/
2714, EFAIL_FILES_IN_BACKUP, "Error while checking database datafiles in backup mode"
//  *Cause: 
// *Action:
/
2720, ELEMENT_NAME_MEDIA_RECOVERY_FILES, "Files Needing Media Recovery"
// *Document: NO
//  *Cause:
// *Action:
/
2721, DESC_MEDIA_RECOVERY_FILES, "Checks if there are any files needing media recovery"
// *Document: NO
//  *Cause:
// *Action:
/
2722, SUCC_MEDIA_RECOVERY_FILES, "No files are in need of media recovery"
// *Document: NO
//  *Cause:
// *Action:
/
2723, VFAIL_MEDIA_RECOVERY_FILES, "One or more files need media recovery"
//  *Cause: 
// *Action:
/
2724, EFAIL_MEDIA_RECOVERY_FILES, "Error while checking files needing media recovery"
//  *Cause: 
// *Action:
/
2730, ELEMENT_NAME_FAST_START_INSTANCE_RECOVERY_TARGET, "_FAST_START_INSTANCE_RECOVERY_TARGET"
// *Document: NO
//  *Cause:
// *Action:
/
2731, DESC_FAST_START_INSTANCE_RECOVERY_TARGET, "Checks _FAST_START_INSTANCE_RECOVERY_TARGET"
// *Document: NO
//  *Cause:
// *Action:
/
2732, SUCC_FAST_START_INSTANCE_RECOVERY_TARGET, "_FAST_START_INSTANCE_RECOVERY_TARGET >= 5"
// *Document: NO
//  *Cause:
// *Action:
/
2733, VFAIL_FAST_START_INSTANCE_RECOVERY_TARGET, "_FAST_START_INSTANCE_RECOVERY_TARGET should be 5 seconds or more for rac."
//  *Cause: 
// *Action:
/
2734, EFAIL_FAST_START_INSTANCE_RECOVERY_TARGET, "Error while checking _FAST_START_INSTANCE_RECOVERY_TARGET"
//  *Cause: An error occurred while attempting to retrieve _FAST_START_INSTANCE_RECOVERY_TARGET.
// *Action:
/
2735, FAST_START_INSTANCE_RECOVERY_TARGET_DETAILS, "Consider the usage of _FAST_START_INSTANCE_RECOVERY_TARGET: _FAST_START_INSTANCE_RECOVERY_TARGET works in the same fashion as FAST_START_MTTR_TARGET, but it attempts to only bind the 1st pass scan and recovery claiming during instance recovery. It also gives the DBA a better handle on the target recovery time since the time can be expressed in seconds that instance recovery should take; unlike FAST_START_MTTR_TARGET, which includes the instance startup time. Note that this parameter is instance-specific, i.e. the mechanism only considers a single-instance failure in a cluster. If multiple failures occur, e.g. 2 out of 8 instances fail, and then instance recovery time will be higher than the set target. Setting _FAST_START_INSTANCE_RECOVERY_TARGET to a non-zero value has a several advantages as discussed in the chapters about recovery and buffer cache. Values less than 5 seconds may be too aggressive in terms of I/O; another side effect of it, commit cleanouts may suffer from it, i.e. Oracle cannot perform a commit cleanout if the block is already on disk. In a RAC environment, the recommendation is to use _FAST_START_INSTANCE_RECOVERY_TARGET, and not FAST_START_MTTR_TARGET; and do not use both parameters at the same time."
// *Document: NO
//  *Cause:
// *Action:
/
2740, ELEMENT_NAME_INDOUBT_DIST_TRANS, "In-doubt Distributed Transactions"
// *Document: NO
//  *Cause:
// *Action:
/
2741, DESC_INDOUBT_DIST_TRANS, "Checks if there are any in-doubt distributed transactions"
// *Document: NO
//  *Cause:
// *Action:
/
2742, SUCC_INDOUBT_DIST_TRANS, "There are NO in-doubt distributed transactions"
// *Document: NO
//  *Cause:
// *Action:
/
2743, VFAIL_INDOUBT_DIST_TRANS, "One or more in-doubt distributed transactions"
//  *Cause: 
// *Action:
/
2744, EFAIL_INDOUBT_DIST_TRANS, "Error while checking files needing media recovery"
//  *Cause: 
// *Action:
/
2745, INDOUBT_DIST_TRANS_DETAILS, "Indoubt distributed transactions need to be investigated before attempting any database upgrade.  Refer the notes in the reference section for more details."
// *Document: NO
//  *Cause:
// *Action:
/
2750, ELEMENT_NAME_ORPHAN_DICTIONARY_ROWS, "Orphaned Dictionary Rows"
// *Document: NO
//  *Cause:
// *Action:
/
2751, DESC_ORPHAN_DICTIONARY_ROWS, "Checks if there are any orphaned dictionary rows"
// *Document: NO
//  *Cause:
// *Action:
/
2752, SUCC_ORPHAN_DICTIONARY_ROWS, "No orphaned dictionary rows were found"
// *Document: NO
//  *Cause:
// *Action:
/
2753, VFAIL_ORPHAN_DICTIONARY_ROWS, "Orphaned dictionary rows were found - resolve before upgrade"
//  *Cause: 
// *Action:
/
2754, EFAIL_ORPHAN_DICTIONARY_ROWS, "Error while checking orphaned dictionary rows"
//  *Cause: 
// *Action:
/
2755, ORPHAN_DICTIONARY_ROWS_DETAILS, "Refer the reference section before proceeding with any upgrade."
// *Document: NO
//  *Cause:
// *Action:
/
2760, ELEMENT_NAME_TIME_ZONE_FILE_VERSION, "Database Time Zone File Version"
// *Document: NO
//  *Cause:
// *Action:
/
2761, DESC_TIME_ZONE_FILE_VERSION, "Checks the version of the time zone file"
// *Document: NO
//  *Cause:
// *Action:
/
2762, SUCC_TIME_ZONE_FILE_VERSION, "Time zone file is current"
// *Document: NO
//  *Cause:
// *Action:
/
2763, VFAIL_TIME_ZONE_FILE_VERSION, "Time zone patch upgrade should be performed"
//  *Cause: 
// *Action:
/
2764, EFAIL_TIME_ZONE_FILE_VERSION, "Error while checking the version of time zone file"
//  *Cause: 
// *Action:
/
2770, ELEMENT_NAME_SYS_OBJ_TABLES, "SYS-Owned Object Tables Check"
// *Document: NO
//  *Cause:
// *Action:
/
2771, DESC_SYS_OBJ_TABLES, "Checks for the presence of any SYS-owned object tables"
// *Document: NO
//  *Cause:
// *Action:
/
2772, SUCC_SYS_OBJ_TABLES, "No SYS-owned object tables found"
// *Document: NO
//  *Cause:
// *Action:
/
2773, VFAIL_SYS_OBJ_TABLES, "SYS-owned object tables were found"
//  *Cause: 
// *Action:
/
2774, EFAIL_SYS_OBJ_TABLES, "Error while checking SYS owned object tables"
//  *Cause: 
// *Action:
/
2775, SYS_OBJ_TABLES_DETAILS, "Refer the reference section before proceeding with any upgrade."
// *Document: NO
//  *Cause:
// *Action:
/
2780, ELEMENT_NAME_CONNECT_ROLE_GRANTEES, "Users Granted CONNECT Role"
// *Document: NO
//  *Cause:
// *Action:
/
2781, DESC_CONNECT_ROLE_GRANTEES, "Checks for the presence of any users with CONNECT role"
// *Document: NO
//  *Cause:
// *Action:
/
2782, SUCC_CONNECT_ROLE_GRANTEES, "No CONNECT role granted users found"
// *Document: NO
//  *Cause:
// *Action:
/
2783, VFAIL_CONNECT_ROLE_GRANTEES, "CONNECT role granted users found"
//  *Cause: 
// *Action:
/
2784, EFAIL_CONNECT_ROLE_GRANTEES, "Error while checking users with CONNECT role"
//  *Cause: 
// *Action:
/
2790, ELEMENT_NAME_INVALID_REGISTRY_COMP, "Invalid Objects in dba_registry"
// *Document: NO
//  *Cause:
// *Action:
/
2791, DESC_INVALID_REGISTRY_COMP, "Checks for the presence of any invalid objects in dba_registry"
// *Document: NO
//  *Cause:
// *Action:
/
2792, SUCC_INVALID_REGISTRY_COMP, "No invalid objects found in dba_registry"
// *Document: NO
//  *Cause:
// *Action:
/
2793, VFAIL_INVALID_REGISTRY_COMP, "Invalid objects found in dba_registry"
//  *Cause: 
// *Action:
/
2794, EFAIL_INVALID_REGISTRY_COMP, "Error while checking dba_registry"
//  *Cause: 
// *Action:
/
2795, INVALID_REGISTRY_COMP_DETAILS, "Checking for invalid components and objects before upgrade. There should not be any invalid objects in the database before upgrade. Prior to upgrade, resolving invalid objects under SYS and SYSTEM is mandatory. Run $ORACLE_HOME/rdbms/admin/utlrp.sql to validate the invalid objects in the database and then re-execute multiple times, until there is no change in the number of invalid objects."
// *Document: NO
//  *Cause:
// *Action:
/
2800, ELEMENT_NAME_AUDIT_TABLESPACE, "Audit Tablespace"
// *Document: NO
//  *Cause:
// *Action:
/
2801, DESC_AUDIT_TABLESPACE, "Checks that the AUD$ is in the system tablespace when auditing is enabled."
// *Document: NO
//  *Cause:
// *Action:
/
2802, SUCC_AUDIT_TABLESPACE, "Auditing table (AUD$) is in SYSTEM tablespace"
// *Document: NO
//  *Cause:
// *Action:
/
2803, VFAIL_AUDIT_TABLESPACE, "Auditing table (AUD$) is not in SYSTEM tablespace"
//  *Cause: 
// *Action:
/
2804, EFAIL_AUDIT_TABLESPACE, "Error while checking audit tablespace"
//  *Cause: 
// *Action:
/
2805, AUDIT_TABLESPACE_DETAILS, "Ensure that the AUD$ is in the SYSTEM tablespace when auditing is enabled."
// *Document: NO
//  *Cause:
// *Action:
/
2810, ELEMENT_NAME_EXT_SSL_AUTHENTICATED_USERS, "SSL Authenticated Database Users"
// *Document: NO
//  *Cause:
// *Action:
/
2811, DESC_EXT_SSL_AUTHENTICATED_USERS, "Checks for SSL authenticated database users"
// *Document: NO
//  *Cause:
// *Action:
/
2812, SUCC_EXT_SSL_AUTHENTICATED_USERS, "There are NO externally authenticated SSL users"
// *Document: NO
//  *Cause:
// *Action:
/
2813, VFAIL_EXT_SSL_AUTHENTICATED_USERS, "There are externally authenticated SSL users"
//  *Cause: 
// *Action:
/
2814, EFAIL_EXT_SSL_AUTHENTICATED_USERS, "Error while checking for SSL authenticated users"
//  *Cause: 
// *Action:
/
2815, EXT_SSL_AUTHENTICATED_USERS_DETAILS, "Check whether database has any externally authenticated SSL users. Refer the reference section after upgrade when there are SSL authenticated database users."
// *Document: NO
//  *Cause:
// *Action:
/
2820, ELEMENT_NAME_MV_GROUP_REFRESH_JOBS, "Materialized View Group Refresh Jobs"
// *Document: NO
//  *Cause:
// *Action:
/
2821, DESC_MV_GROUP_REFRESH_JOBS, "Checks if there are any materialized view group refresh in progress"
// *Document: NO
//  *Cause:
// *Action:
/
2822, SUCC_MV_GROUP_REFRESH_JOBS, "No materialized view refresh groups in progress"
// *Document: NO
//  *Cause:
// *Action:
/
2823, VFAIL_MV_GROUP_REFRESH_JOBS, "One or more job based materialized view group refresh is in progress"
//  *Cause: 
// *Action:
/
2824, EFAIL_MV_GROUP_REFRESH_JOBS, "Error while checking for materialized view group refresh"
//  *Cause: 
// *Action:
/
2825, MV_GROUP_REFRESH_JOBS_DETAILS, "Before proceeding with an upgrade ensure that all snapshot refreshes are successfully completed, and that replication is stopped."
// *Document: NO
//  *Cause:
// *Action:
/
2830, ELEMENT_NAME_MV_GROUP_MANUAL_REFRESH, "Materialized View Manual Group Refresh"
// *Document: NO
//  *Cause:
// *Action:
/
2831, DESC_MV_GROUP_MANUAL_REFRESH, "Checks if there are any materialized view group refresh in progress"
// *Document: NO
//  *Cause:
// *Action:
/
2832, SUCC_MV_GROUP_MANUAL_REFRESH, "No materialized view refresh groups in progress manually"
// *Document: NO
//  *Cause:
// *Action:
/
2833, VFAIL_MV_GROUP_MANUAL_REFRESH, "One or more materialized view refresh groups is being manually refreshed"
//  *Cause: 
// *Action:
/
2834, EFAIL_MV_GROUP_MANUAL_REFRESH, "Error while checking for materialized view group refresh"
//  *Cause: 
// *Action:
/
2835, MV_GROUP_MANUAL_REFRESH_DETAILS, "Before proceeding with an upgrade ensure that all snapshot refreshes are successfully completed, and that replication is stopped."
// *Document: NO
//  *Cause:
// *Action:
/
2840, ELEMENT_NAME_SHARED_POOL_SIZE, "ASM SHARED_POOL_SIZE parameter"
// *Document: NO
//  *Cause:
// *Action:
/
2841, DESC_SHARED_POOL_SIZE, "Checks if the ASM SHARED_POOL_SIZE meets the recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
2842, SUCC_SHARED_POOL_SIZE, "ASM SHARED_POOL_SIZE is set to recommended value"
// *Document: NO
//  *Cause:
// *Action:
/
2843, VFAIL_SHARED_POOL_SIZE, "ASM SHARED_POOL_SIZE is not set to recommended value"
//  *Cause: 
// *Action:
/
2844, EFAIL_SHARED_POOL_SIZE, "Error while checking ASM SHARED_POOL_SIZE"
//  *Cause: 
// *Action:
/
2845, SHARED_POOL_SIZE_DETAILS, "The SHARED_POOL_SIZE value for 64-bit environments is required to be 88MB for an ASM instance, 150MB is the recommended value."
// *Document: NO
//  *Cause:
// *Action:
/
2850, ELEMENT_NAME_REDO_LOG_SIZE, "Redo Log Size (MB)"
// *Document: NO
//  *Cause:
// *Action:
/
2851, DESC_REDO_LOG_SIZE, "Checks if the redo log size is sufficient"
// *Document: NO
//  *Cause:
// *Action:
/
2852, SUCC_REDO_LOG_SIZE, "Redo logs are large enough"
// *Document: NO
//  *Cause:
// *Action:
/
2853, VFAIL_REDO_LOG_SIZE, "Redo log file size is recommended to be 4MB or greater"
//  *Cause: 
// *Action:
/
2854, EFAIL_REDO_LOG_SIZE, "Error while checking redo log size"
//  *Cause: 
// *Action:
/
2855, REDO_LOG_SIZE_DETAILS, "Ensure that the redo logfile size is greater than 4MB when upgrading to 11g"
// *Document: NO
//  *Cause:
// *Action:
/
2860, ELEMENT_NAME_DB_LOG_MODE, "DB Log Mode"
// *Document: NO
//  *Cause:
// *Action:
/
2861, DESC_DB_LOG_MODE, "Checks the database log archiving mode"
// *Document: NO
//  *Cause:
// *Action:
/
2862, SUCC_DB_LOG_MODE, "NOARCHIVELOG mode is recommended when upgrading"
// *Document: NO
//  *Cause:
// *Action:
/
2863, VFAIL_DB_LOG_MODE, "NOARCHIVELOG mode is recommended when upgrading"
//  *Cause: 
// *Action:
/
2864, EFAIL_DB_LOG_MODE, "Error while checking database archivelog mode"
//  *Cause: 
// *Action:
/
2865, DB_LOG_MODE_DETAILS, "If the database is in log archiving mode, then it is always desirable and advisable to upgrade the database in noarchivelog mode as that will reduce the time taken to upgrade the database. After the upgrade, the database can be reverted to the archivelog mode."
// *Document: NO
//  *Cause:
// *Action:
/
2868, ELEMENT_NAME_CORE_DUMP_DEST2, "Core files destination"
// *Document: NO
//  *Cause:
// *Action:
/
2869, DESC_CORE_DUMP_DEST2, "Checks core files destination"
// *Document: NO
//  *Cause:
// *Action:
/
2870, ELEMENT_NAME_CORE_DUMP_DEST, "Core files destination"
// *Document: NO
//  *Cause:
// *Action:
/
2871, DESC_CORE_DUMP_DEST, "Checks core files destination"
// *Document: NO
//  *Cause: 
// *Action:
/
2872, SUCC_CORE_DUMP_DEST, "Core files destination \"{5}\" on node \"{0}\" does not have too many old core dump files."
// *Document: NO
//  *Cause: 
// *Action:
/
2873, VFAIL_CORE_DUMP_DEST, "Core files older than \"{2}\" days found in the core files destination \"{5}\" on node \"{0}\". [Expected = \"{4}\" ; Found = \"{3}\"]"
//  *Cause: Too many old core files found in the database core files destination.
// *Action: Move the old core files out of the database core files destination.
/
2874, EFAIL_CORE_DUMP_DEST, "An error occured while checking core files destination on node \"{0}\"."
//  *Cause: The check to verify the existence of old core files failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
2875, CORE_DUMP_DEST_DETAILS, "Old core files from core files destination should be archived regularly outside of database core files destination otherwise the file system will run out of space and diagnostic information will not be collected when a failure occurs."
// *Document: NO
//  *Cause:
// *Action:
/
2878, ELEMENT_NAME_ORA_00600_ERRORS2, "Alert log messages indicating internal errors ORA-00600 errors"
// *Document: NO
//  *Cause:
// *Action:
/
2879, DESC_ORA_00600_ERRORS2, "Checks for ORA-00600 errors in the alert log"
// *Document: NO
//  *Cause:
// *Action:
/
2880, ELEMENT_NAME_ORA_00600_ERRORS, "Alert log messages indicating internal errors ORA-00600 errors"
// *Document: NO
//  *Cause:
// *Action:
/
2881, DESC_ORA_00600_ERRORS, "Checks the alert log messages for ORA-00600 errors"
// *Document: NO
//  *Cause: 
// *Action:
/
2882, SUCC_ORA_00600_ERRORS, "No ORA-00600 errors found in the alert log destination \"{4}\" on node \"{0}\"."
// *Document: NO
//  *Cause: 
// *Action:
/
2883, VFAIL_ORA_00600_ERRORS, "ORA-00600 errors found in the alert log in alert log destination \"{4}\" on node \"{0}\"."
//  *Cause: ORA-00600 errors were found in the alert log.
// *Action: See the alert log for more information. Contact Oracle Support Services if the errors persists.
/
2884, EFAIL_ORA_00600_ERRORS, "An error occured while checking for ORA-00600 errors in the alert log."
//  *Cause: The check to verify the existence of ORA-00600 errors in the alert log failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
2885, ORA_00600_ERRORS_DETAILS, "Recurring ORA-00600 errors may lead to database block corruption or some serious issue. See the trace file for more information next to ORA-00600 error in the alert log. If the problem persists, contact Oracle Support Services."
// *Document: NO
//  *Cause:
// *Action:
/
2888, ELEMENT_NAME_ALERT_LOG_FILE_SIZE2, "Database alert log file size"
// *Document: NO
//  *Cause:
// *Action:
/
2889, DESC_ALERT_LOG_FILE_SIZE2, "Checks the size of the database alert log file is not too big"
// *Document: NO
//  *Cause:
// *Action:
/
2890, ELEMENT_NAME_ALERT_LOG_FILE_SIZE, "Database alert log file size"
// *Document: NO
//  *Cause:
// *Action:
/
2891, DESC_ALERT_LOG_FILE_SIZE, "Checks the size of the database alert log file is not too big"
// *Document: NO
//  *Cause: 
// *Action:
/
2892, SUCC_ALERT_LOG_FILE_SIZE, "No alert log greater than \"{2}\" found in the alert log destination \"{5}\" on node \"{0}\"."
// *Document: NO
//  *Cause: 
// *Action:
/
2893, VFAIL_ALERT_LOG_FILE_SIZE, "Alert log files greater than \"{2}\" found in the alert log destination \"{5}\" on node \"{0}\". [Expected = \"{4}\" ; Found = \"{3}\"]"
//  *Cause: Alert log files greater than the indicated size found in the alert log destination.
// *Action: Rollover alert log to a new file and backup the old file.
/
2894, EFAIL_ALERT_LOG_FILE_SIZE, "Error while checking the size of alert log file"
//  *Cause: The check to verify presence of large alert logs in the alert log destination failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
2895, ALERT_LOG_FILE_SIZE_DETAILS, "If alert log file is larger than 50 MB, it should be rolled over to new file and old file should be backed up."
// *Document: NO
//  *Cause:
// *Action:
/

2900, ELEMENT_NAME_DISK_ASYNCH_IO, "DISK_ASYNCH_IO"
// *Document: NO
//  *Cause:
// *Action:
/
2901, DESC_DISK_ASYNCH_IO, "Checks DISK_ASYNCH_IO setting"
// *Document: NO
//  *Cause:
// *Action:
/
2902, SUCC_DISK_ASYNCH_IO, "Oracle not linked with asynchronous I/O libraries and DISK_ASYNCH_IO = FALSE"
// *Document: NO
//  *Cause:
// *Action:
/
2903, VFAIL_DISK_ASYNCH_IO, "Oracle not linked with asynchronous I/O libraries but DISK_ASYNCH_IO = TRUE"
//  *Cause: 
// *Action:
/
2904, EFAIL_DISK_ASYNCH_IO, "Error while checking DISK_ASYNCH_IO"
//  *Cause: 
// *Action:
/


2908, ELEMENT_NAME_BACKGROUND_DUMP_DESTINATION2, "Old trace files in background dump destination"
// *Document: NO
//  *Cause:
// *Action:
/
2909, DESC_BACKGROUND_DUMP_DESTINATION2, "Checks the background dump destination for old trace files"
// *Document: NO
//  *Cause:
// *Action:
/
2910, ELEMENT_NAME_BACKGROUND_DUMP_DESTINATION, "Old trace files in background dump destination"
// *Document: NO
//  *Cause:
// *Action:
/
2911, DESC_BACKGROUND_DUMP_DESTINATION, "Checks the background dump destination for old trace files"
// *Document: NO
//  *Cause: 
// *Action:
/
2912, SUCC_BACKGROUND_DUMP_DESTINATION, "Background dump destination \"{5}\" on node \"{0}\" does not have too many old trace files."
// *Document: NO
//  *Cause: 
// *Action:
/
2913, VFAIL_BACKGROUND_DUMP_DESTINATION, "Trace files older than \"{2}\" days found in the background dump destination \"{5}\" on node \"{0}\". [Expected = \"{4}\" ; Found = \"{3}\"]"
//  *Cause: Too many old trace files found in the background dump destination.
// *Action: Move the old trace files out of the background dump destination.
/
2914, EFAIL_BACKGROUND_DUMP_DESTINATION, "Error while checking trace files in background dump destination"
//  *Cause: The check to verify the existence of old trace files failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
2915, BACKGROUND_DUMP_DESTINATION_DETAILS, "Old trace files from background dump destination should regularly be archived outside ORACLE_BASE, otherwise ORACLE_BASE file system will run out of space and will not be able to collect diagnostic information when failure occurs."
// *Document: NO
//  *Cause:
// *Action:
/


2918, ELEMENT_NAME_ORA_07445_ERRORS2, "Alert log messages indicating internal errors ORA-07445 errors"
// *Document: NO
//  *Cause:
// *Action:
/
2919, DESC_ORA_07445_ERRORS2, "Checks for ORA-07445 errors in alert log"
// *Document: NO
//  *Cause:
// *Action:
/
2920, ELEMENT_NAME_ORA_07445_ERRORS, "Alert log messages indicating internal errors ORA-07445 errors"
// *Document: NO
//  *Cause:
// *Action:
/
2921, DESC_ORA_07445_ERRORS, "Checks for ORA-07445 errors in alert log"
// *Document: NO
//  *Cause: 
// *Action:
/
2922, SUCC_ORA_07445_ERRORS, "No ORA-07445 errors found in the alert log destination \"{4}\" on node \"{0}\"."
// *Document: NO
//  *Cause: 
// *Action:
/
2923, VFAIL_ORA_07445_ERRORS, "ORA-07445 errors found in the alert log in alert log destination \"{4}\" on node \"{0}\"."
//  *Cause: ORA-07445 errors were found in the alert log.
// *Action: See the alert log for more information. Contact Oracle Support Services if the errors persists.
/
2924, EFAIL_ORA_07445_ERRORS, "An error occured while checking for ORA-07445 errors in the alert log."
//  *Cause: The check to verify the existence of ORA-07445 errors in the alert log failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
2925, ORA_07445_ERRORS_DETAILS, "Recurring ORA-07445 errors may lead to database block corruption or some serious issue. See the trace file for more information next to ORA-07445 error in alert log. If the problem persists, contact Oracle Support Services."
// *Document: NO
//  *Cause:
// *Action:
/
3000, ELEMENT_NAME_NO_OF_DICTIONARY_MANAGED_TS, "All tablespaces are locally managed"
// *Document: NO
//  *Cause:
// *Action:
/
3001, DESC_NO_OF_DICTIONARY_MANAGED_TS, "Checks that all tablespaces are locally managed"
// *Document: NO
//  *Cause:
// *Action:
/
3002, SUCC_NO_OF_DICTIONARY_MANAGED_TS, "All tablespaces are locally managed"
// *Document: NO
//  *Cause:
// *Action:
/
3003, VFAIL_NO_OF_DICTIONARY_MANAGED_TS, "Database has one or more dictionary managed tablespace"
// *Document: NO
//  *Cause:
// *Action:
/
3004, EFAIL_NO_OF_DICTIONARY_MANAGED_TS, "Error while checking locally managed tablespaces"
// *Document: NO
//  *Cause:
// *Action:
/
3005, NO_OF_DICTIONARY_MANAGED_TS_DETAILS, "In order to reduce contention to the data dictionary, rollback data, and reduce the amount of generated redo, locally managed tablespaces should be used rather than dictionary managed tablespaces."
// *Document: NO
//  *Cause:
// *Action:
/
3010, ELEMENT_NAME_UNIFORM_ALLOCATION_TYPE_TS, "Tablespace allocation type"
// *Document: NO
//  *Cause:
// *Action:
/
3011, DESC_UNIFORM_ALLOCATION_TYPE_TS, "Checks if the tablespace allocation type is UNIFORM for all tablespaces"
// *Document: NO
//  *Cause:
// *Action:
/
3012, SUCC_UNIFORM_ALLOCATION_TYPE_TS, "Tablespace allocation type is UNIFORM for all tablespaces"
// *Document: NO
//  *Cause:
// *Action:
/
3013, VFAIL_UNIFORM_ALLOCATION_TYPE_TS, "Some tablespaces do not have allocation type as UNIFORM"
// *Document: NO
//  *Cause:
// *Action:
/
3014, EFAIL_UNIFORM_ALLOCATION_TYPE_TS, "Error while checking tablespace allocation type"
// *Document: NO
//  *Cause:
// *Action:
/
3015, UNIFORM_ALLOCATION_TYPE_TS_DETAILS, "It is recommended that for all locally managed tablespaces that the allocation type specified be SYSTEM to allow Oracle to automatically determine extent size based on the data profile."
// *Document: NO
//  *Cause:
// *Action:
/
3020, ELEMENT_NAME_AUTO_SEGMENT_SPACE_MGMT, "Automatic segment storage management"
// *Document: NO
//  *Cause:
// *Action:
/
3021, DESC_AUTO_SEGMENT_SPACE_MGMT, "Checks all tablespaces are using automatic segment storage management"
// *Document: NO
//  *Cause:
// *Action:
/
3022, SUCC_AUTO_SEGMENT_SPACE_MGMT, "All tablespaces are using automatic segment storage management"
// *Document: NO
//  *Cause:
// *Action:
/
3023, VFAIL_AUTO_SEGMENT_SPACE_MGMT, "Some tablespaces are not using automatic segment storage management"
// *Document: NO
//  *Cause:
// *Action:
/
3024, EFAIL_AUTO_SEGMENT_SPACE_MGMT, "Error while checking automatic segment storage management"
// *Document: NO
//  *Cause:
// *Action:
/
3025, EFAIL_AUTO_SEGMENT_SPACE_MGMT_DETAILS, "Starting with Oracle 9i, automatic segment space management (ASSM) can be used by specifying the SEGMENT SPACE MANAGEMENT clause, set to AUTO in the CREATE TABLESPACE statement. Implementing the ASSM feature allows Oracle to use bitmaps to manage the free space within segments. The bitmap describes the status of each data block within a segment, with respect to the amount of space in the block available for inserting rows. The current status of the space available in a data block is reflected in the bitmap allowing for Oracle to manage free space automatically with ASSM. ASSM tablespaces automate freelist management and remove the requirement/ability to specify PCTUSED, FREELISTS, and FREELIST GROUPS storage parameters for individual tables and indexes created in these tablespaces."
// *Document: NO
//  *Cause:
// *Action:
/
3030, ELEMENT_NAME_AVG_GC_CR_BLOCK_RECV_TIME, "Average GC CR Block Receive Time"
// *Document: NO
//  *Cause:
// *Action:
/
3031, DESC_AVG_GC_CR_BLOCK_RECV_TIME, "Check Avg GC CR Block Receive Time"
// *Document: NO
//  *Cause:
// *Action:
/
3032, SUCC_AVG_GC_CR_BLOCK_RECV_TIME, "Avg GC CR Block Receive Time Within Acceptable Range"
// *Document: NO
//  *Cause:
// *Action:
/
3033, VFAIL_AVG_GC_CR_BLOCK_RECV_TIME, "Avg GC CR Block Receive Time Outside Acceptable Range"
// *Document: NO
//  *Cause:
// *Action:
/
3034, EFAIL_AVG_GC_CR_BLOCK_RECV_TIME, "Error occurred while checking Avg GC CR Block Receive Time"
// *Document: NO
//  *Cause:
// *Action:
/
3035, AVG_GC_CR_BLOCK_RECV_TIME_DETAILS, "The average gc cr block receive time should typically be less than 15 milliseconds depending on your system configuration and volume.  This is the average latency of a consistent-read request round-trip from the requesting instance to the holding instance and back to the requesting instance."
// *Document: NO
//  *Cause:
// *Action:
/
3040, ELEMENT_NAME_AVG_GC_CURRENT_BLOCK_RECV_TIME, "Average GC Current Block Receive Time"
// *Document: NO
//  *Cause:
// *Action:
/
3041, DESC_AVG_GC_CURRENT_BLOCK_RECV_TIME, "Check Avg GC Current Block Receive Time"
// *Document: NO
//  *Cause:
// *Action:
/
3042, SUCC_AVG_GC_CURRENT_BLOCK_RECV_TIME, "Avg GC CURRENT Block Receive Time Within Acceptable Range"
// *Document: NO
//  *Cause:
// *Action:
/
3043, VFAIL_AVG_GC_CURRENT_BLOCK_RECV_TIME, "Avg GC CURRENT Block Receive Time Outside Acceptable Range"
// *Document: NO
//  *Cause:
// *Action:
/
3044, EFAIL_AVG_GC_CURRENT_BLOCK_RECV_TIME, "Error occurred while checking Avg GC Current Block Receive Time"
// *Document: NO
//  *Cause:
// *Action:
3045, AVG_GC_CURRENT_BLOCK_RECV_TIME_DETAILS, "The average global cache current block receive time should typically be less than 15 milliseconds depending on your system configuration and volume.  This is the average latency of a current request round-trip from the requesting instance to the holding instance and back to the requesting instance."
// *Document: NO
//  *Cause:
// *Action:
/
3050, ELEMENT_NAME_AUTO_UNDO_MGMT, "Automatic Undo Management"
// *Document: NO
//  *Cause:
// *Action:
/
3051, DESC_AUTO_UNDO_MGMT, "Check automatic undo management"
// *Document: NO
//  *Cause:
// *Action:
/
3052, SUCC_AUTO_UNDO_MGMT, "Instance is using automatic undo management"
// *Document: NO
//  *Cause:
// *Action:
/
3053, VFAIL_AUTO_UNDO_MGMT, "Instance is not using automatic undo management"
// *Document: NO
//  *Cause:
// *Action:
/
3054, EFAIL_AUTO_UNDO_MGMT, "Error occurred while checking automatic undo management"
// *Document: NO
//  *Cause:
// *Action:
/
3055, AUTO_UNDO_MGMT_DETAILS, "Oracle provides a fully automated mechanism, referred to as automatic undo management, for managing undo information and space. In this management mode, you create an undo tablespace, and the server automatically manages undo segments and space among the various active sessions.You should set the UNDO_MANAGEMENT initialization parameter to AUTO to enable automatic undo management."
// *Document: NO
//  *Cause:
// *Action:
/
3060, ELEMENT_NAME_CLUSTER_INTERCONNECTS, "Cluster Interconnects"
// *Document: NO
//  *Cause:
// *Action:
/
3061, DESC_CLUSTER_INTERCONNECTS, "Check Cluster Interconnects"
// *Document: NO
//  *Cause:
// *Action:
/
3062, SUCC_CLUSTER_INTERCONNECTS, "Instance has Cluster Interconnects"
// *Document: NO
//  *Cause:
// *Action:
/
3063, VFAIL_CLUSTER_INTERCONNECTS, "Instance does not have Cluster Interconnects"
// *Document: NO
//  *Cause:
// *Action:
/
3064, EFAIL_CLUSTER_INTERCONNECTS, "Error occurred while checking Cluster Interconnects"
// *Document: NO
//  *Cause:
// *Action:
/
3070, ELEMENT_NAME_ASM_DISKS_WITHOUT_GROUPS, "Disks without disk_group"
// *Document: NO
//  *Cause:
// *Action:
/
3071, DESC_ASM_DISKS_WITHOUT_GROUPS, "Check disks without disk group"
// *Document: NO
//  *Cause:
// *Action:
/
3072, SUCC_ASM_DISKS_WITHOUT_GROUPS, "No disks found which are not part of any disk group"
// *Document: NO
//  *Cause:
// *Action:
/
3073, VFAIL_ASM_DISKS_WITHOUT_GROUPS, "Disks \"{1}\" are not part of any disk group."
//  *Cause: The indicated disks were found not to be part of any disk group.
// *Action: Create one or more disk groups from the indicated disks or add the 
//          indicated disks to any existing disk groups.
/
3074, EFAIL_ASM_DISKS_WITHOUT_GROUPS, "Error occurred while checking disks without disk group"
// *Document: NO
//  *Cause:
// *Action:
/
3075, ASM_DISKS_WITHOUT_GROUPS_DETAILS, "The GROUP_NUMBER and DISK_NUMBER columns in V$ASM_DISK will only be valid if the disk is part of a disk group which is currently mounted by the instance. Otherwise, GROUP_NUMBER will be 0, and DISK_NUMBER will be a unique value with respect to the other disks that also have a group number of 0."
// *Document: NO
//  *Cause:
// *Action:
/
3080, ELEMENT_NAME_ASM_DISK_IO_ERRORS, "ASM disk I/O error"
// *Document: NO
//  *Cause:
// *Action:
/
3081, DESC_ASM_DISK_IO_ERRORS, "Check ASM disk I/O errors"
// *Document: NO
//  *Cause:
// *Action:
/
3082, SUCC_ASM_DISK_IO_ERRORS, "No I/O errors found for ASM disks"
// *Document: NO
//  *Cause:
// *Action:
/
3083, VFAIL_ASM_DISK_IO_ERRORS, "One or more I/O errors found for ASM disks"
// *Document: NO
//  *Cause:
// *Action:
/
3084, EFAIL_ASM_DISK_IO_ERRORS, "Error occurred while checking ASM disk I/O errors"
// *Document: NO
//  *Cause:
// *Action:
/
3085, ASM_DISK_IO_ERRORS_DETAILS, "Read errors can be the result of a loss of access to the entire disk or media corruptions on an otherwise a healthy disk. ASM tries to recover from read errors on corrupted sectors on a disk. When a read error by the database or ASM triggers the ASM instance to attempt bad block remapping, ASM reads a good copy of the extent and copies it to the disk that had the read error.\n\nIf the write to the same location succeeds, then the underlying allocation unit (sector) is deemed healthy. This might be because the underlying disk did its own bad block reallocation.\n\nIf the write fails, ASM attempts to write the extent to a new allocation unit on the same disk.If this write succeeds, the original allocation unit is marked as unusable.If the write fails, the disk is taken offline.\n\nOne unique benefit on ASM-based mirroring is that the database instance is aware of the mirroring. For many types of logical corruptions such as a bad checksum or incorrect System Change Number (SCN), the database instance proceeds through the mirror side looking for valid content and proceeds without errors.If the process in the database that encountered the read is in a position to obtain the appropriate locks to ensure data consistency, it writes the correct data to all mirror sides.\n\nWhen encountering a write error, a database instance sends the ASM instance a disk offline message.\n\nIf database can successfully complete a write to at least one extent copy and receive acknowledgment of the offline disk from ASM, the write is considered successful.\n\nIf the write to all mirror side fails, database takes the appropriate actions in response to a write error such as taking the tablespace offline.\n\nWhen the ASM instance receives a write error message from an database instance or when an ASM instance encounters a write error itself, ASM instance attempts to take the disk offline. ASM consults the Partner Status Table (PST) to see whether any of the disk''s partners are offline. If too many partners are already offline, ASM forces the dismounting of the disk group. Otherwise, ASM takes the disk offline.\n\nThe ASMCMD remap command was introduced to address situations where a range of bad sectors exists on a disk and must be corrected before ASM or database I/O"
// *Document: NO
//  *Cause:
// *Action:
/
3090, ELEMENT_NAME_AUDSES$_SEQUENCE_CACHE_SIZE, "AUDSES$ sequence cache size"
// *Document: NO
//  *Cause:
// *Action:
/
3091, DESC_AUDSES$_SEQUENCE_CACHE_SIZE, "Check AUDSES$ sequence cache size"
// *Document: NO
//  *Cause:
// *Action:
/
3092, SUCC_AUDSES$_SEQUENCE_CACHE_SIZE, "SYS.AUDSES1$ sequence cache size >= 10,000"
// *Document: NO
//  *Cause:
// *Action:
/
3093, VFAIL_AUDSES$_SEQUENCE_CACHE_SIZE, "SYS.AUDSES1$ sequence cache size < 10,000"
// *Document: NO
//  *Cause:
// *Action:
/
3094, EFAIL_AUDSES$_SEQUENCE_CACHE_SIZE, "Error occurred while checking AUDSES$ sequence cache size"
// *Document: NO
//  *Cause:
// *Action:
/
3095, AUDSES$_SEQUENCE_CACHE_SIZE_DETAILS, "Use large cache value of maybe 10,000 or more. NOORDER most effective, but impact on strict ordering. Performance. Might not get strict time ordering of sequence numbers. There are problems reported with Audses$ and ora_tq_base$ which are both internal sequences  . Also particularly if the order of the application sequence is not important or this is used during the login process and hence can be involved in a login storm then this needs to be taken care of. Some sequences need to be presented in a particular order and hence caching those is not a good idea but in the interest of performance if order does not matter then this could be cached and presented. This also manifests itself as waits in \"rowcache\" for \"dc_sequences\" which is a rowcache type for sequences. For Applications this can cause significant issues especially with Transactional Sequences."
// *Document: NO
//  *Cause:
// *Action:
/

3100, ELEMENT_NAME_ACTIVE_INSTANCE_COUNT, "ACTIVE_INSTANCE_COUNT"
// *Document: NO
//  *Cause:
// *Action:
/
3101, DESC_ACTIVE_INSTANCE_COUNT, "Check ACTIVE_INSTANCE_COUNT is not set"
// *Document: NO
//  *Cause:
// *Action:
/
3102, SUCC_ACTIVE_INSTANCE_COUNT, "ACTIVE_INSTANCE_COUNT not set"
// *Document: NO
//  *Cause:
// *Action:
/
3103, VFAIL_ACTIVE_INSTANCE_COUNT, "ACTIVE_INSTANCE_COUNT should not be set in 10g and above"
// *Document: NO
//  *Cause:
// *Action:
/
3104, EFAIL_ACTIVE_INSTANCE_COUNT, "Error occurred while checking ACTIVE_INSTANCE_COUNT"
// *Document: NO
//  *Cause:
// *Action:
/
3105, ACTIVE_INSTANCE_COUNT_DETAILS, "In 10g and 11g databases, init parameter ACTIVE_INSTANCE_COUNT should no longer be set.  This is because the RACG layer doesn't work take this parameter into account.  As an alternative, you should create a service with one preferred instance. Negative Consequences for setting ACTIVE_INSTANCE_COUNT: 1. Cluster Managed Services, if defined using EM or \"srvctl add service\", do not know that the second instance can't be used.  They could fail over to the secondary instance or be relocated there due to planned maintenance, but users would not be able to log on to the secondary instance. 2. EM Agent cannot manage or monitor the database through the secondary instance. 3. Data Guard CRS integration when performing failover/switchover will not respect the secondary instance. 4. RLB and FAN may direct user connections to the secondary instance even though they cannot do any work there. "
// *Document: NO
//  *Cause:
// *Action:
/

3110, ELEMENT_NAME_JAVA_VM_VERSION, "Java VM version"
// *Document: NO
//  *Cause:
// *Action:
/
3111, DESC_JAVA_VM_VERSION, "Checks Java VM version"
// *Document: NO
//  *Cause:
// *Action:
/
3112, SUCC_JAVA_VM_VERSION, "Java VM version meets or exceeds recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
3113, VFAIL_JAVA_VM_VERSION, "Java VM version does not meet the recommendation"
//  *Cause: 
// *Action:
/
3114, EFAIL_JAVA_VM_VERSION, "Error while checking Java VM version"
//  *Cause: 
// *Action:
/
3115, JAVA_VM_VERSION_DETAILS, "Investigate and correct these problems."
// *Document: NO
//  *Cause:
// *Action:
/
3120, ELEMENT_NAME_IDGEN$_SEQUENCE_CACHE_SIZE, "IDGEN$ sequence cache size"
// *Document: NO
//  *Cause:
// *Action:
/
3121, DESC_IDGEN$_SEQUENCE_CACHE_SIZE, "Check IDGEN$ sequence cache size"
// *Document: NO
//  *Cause:
// *Action:
/
3122, SUCC_IDGEN$_SEQUENCE_CACHE_SIZE, "SYS.IDGEN1$ sequence cache size >= 1,000"
// *Document: NO
//  *Cause:
// *Action:
/
3123, VFAIL_IDGEN$_SEQUENCE_CACHE_SIZE, "SYS.IDGEN1$ sequence cache size < 1,000"
// *Document: NO
//  *Cause:
// *Action:
/
3124, EFAIL_IDGEN$_SEQUENCE_CACHE_SIZE, "Error occurred while checking IDGEN$ sequence cache size"
// *Document: NO
//  *Cause:
// *Action:
/
3125, IDGEN$_SEQUENCE_CACHE_SIZE_DETAILS, "Sequence contention (SQ enqueue) can occur if SYS.IDGEN1$ sequence is not cached to 1000.  This condition can lead to performance issues in RAC.  1000 is the default starting in version 11.2.0.1."
// *Document: NO
//  *Cause:
// *Action:
/
3130, REPORT_EMPTY_TASK_LIST, "Verification checks are not available for version \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
3131, REPORT_EMPTY_DB_TASK_LIST, "Database mandatory verification checks are not applicable"
// *Document: NO
//  *Cause: 
// *Action:
/
3132, REPORT_EMPTY_DB_TASK_LIST_BESTPRACTICE, "Database Best Practices verification checks are not applicable"
// *Document: NO
//  *Cause: 
// *Action:
/
3133, REPORT_EMPTY_TASK_LIST_CLUSTERWARE_MANDATORY, "Clusterware mandatory verification checks are not available for Oracle Grid Infrastructure version \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
3134, REPORT_EMPTY_TASK_LIST_CLUSTERWARE_BEST_PRACTICE, "Clusterware Best Practice checks are not available for Oracle Grid Infrastructure version \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
3135, REPORT_EMPTY_TASK_LIST_OS_MANDATORY, "OS mandatory verification checks are not available for Oracle Grid Infrastructure version \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
3136, REPORT_EMPTY_TASK_LIST_OS_BEST_PRACTICE, "OS Best Practice checks are not available for Oracle Grid Infrastructure version \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
3137, REPORT_EMPTY_ASM_TASK_LIST, "ASM mandatory verification checks are not applicable."
// *Document: NO
//  *Cause:
// *Action:
/
3138, REPORT_EMPTY_ASM_TASK_LIST_BESTPRACTICE, "ASM best practices verification checks are not applicable."
// *Document: NO
//  *Cause:
// *Action:
/
3139, ELEMENT_NAME_ASM_REBAL_OPS_IN_WAIT, "ASM disk rebalance operations in WAIT status"
// *Document: NO
//  *Cause:
// *Action:
/
3140, DESC_ASM_REBAL_OPS_IN_WAIT, "Check ASM disk rebalance operations in WAIT status"
// *Document: NO
//  *Cause:
// *Action:
/
3141, SUCC_ASM_REBAL_OPS_IN_WAIT, "No ASM disk rebalance operations found which are in WAIT status"
// *Document: NO
//  *Cause:
// *Action:
/
3142, VFAIL_ASM_REBAL_OPS_IN_WAIT, "One or more ASM disk rebalance operations found in WAIT status"
//  *Cause: A query on V$ASM_OPERATION showed one or more ASM disk rebalance operations in WAIT status.
// *Action: Identify the ASM rebalance operations in WAIT status by running the
//          query \"SELECT * FROM V$ASM_OPERATION WHERE OPERATION LIKE 'REBAL' 
//          AND STATE LIKE 'WAIT'\" and resume the operations by altering 
//          rebalance power to a non-zero value for the related ASM disk groups.
/
3143, EFAIL_ASM_REBAL_OPS_IN_WAIT, "Error occurred while checking ASM disk rebalance operations in WAIT status"
//  *Cause: An ASM query to obtain details of the ASM disk rebalance
//          operations failed. Accompanying error messages provide
//          detailed failure information.
// *Action: Examine the accompanying error message for details, resolve
//          problems identified and retry.
/
3144, ASM_REBAL_OPS_IN_WAIT_DETAILS, "The query \"SELECT * FROM V$ASM_OPERATION WHERE OPERATION LIKE ''REBAL'' AND STATE LIKE ''WAIT''\" returns the ASM disk rebalance operations currently in WAIT. The rebalance power can be manually altered using the statement \"ALTER DISKGROUP <diskgroup_name> REBALANCE POWER <power_value>\", where <diskgroup_name> is the name of the disk group related to the operation and <power_value> is a non-zero value to turn on ASM disk rebalancing."
// *Document: NO
//  *Cause:
// *Action:
/
3145, REPORT_EMPTY_TASK_LIST_OS_COLLECTION, "OS collections are not available for Oracle Grid Infrastructure version \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
3146, ELEMENT_NAME_ASM_INCORRECT_FILE_OWNER, "correctness of ASM disk group files ownership"
// *Document: NO
//  *Cause:
// *Action:
/
3147, DESC_ASM_INCORRECT_FILE_OWNER, "Check correctness of ASM disk group files ownership"
// *Document: NO
//  *Cause:
// *Action:
/
3148, SUCC_ASM_INCORRECT_FILE_OWNER, "All ASM disk group files have correct ownership"
// *Document: NO
//  *Cause:
// *Action:
/
3149, VFAIL_ASM_INCORRECT_FILE_OWNER, "ASM disk group files \"{2}\" are incorrectly owned by users \"{3}\" respectively."
//  *Cause: A query showed that the indicated ASM disk group files were not
//          owned by the Grid user.
// *Action: Refer to MOS Note 1959446.1 to take corrective action.
/
3150, EFAIL_ASM_INCORRECT_FILE_OWNER, "error occurred while checking for the correctness of ASM disk group files ownership"
//  *Cause: An ASM query failed unexpectedly.
// *Action: Examine the accompanying error messages for details.
/
3151, ASM_INCORRECT_FILE_OWNER_DETAILS, "The query \"{0}\" provides the details of incorrect file ownership in ASM disk groups. Refer to MOS Note 1959446.1 for more information."
// *Document: NO
//  *Cause:
// *Action:
/
3152, ELEMENT_NAME_ASM_INCORRECT_DISKSTRING, "selectivity of ASM discovery string"
// *Document: NO
//  *Cause:
// *Action:
/
3153, DESC_ASM_INCORRECT_DISKSTRING, "Check selectivity of ASM discovery string"
// *Document: NO
//  *Cause:
// *Action:
/
3154, SUCC_ASM_INCORRECT_DISKSTRING, "ASM discovery string is not set to a value that matches TTY devices."
// *Document: NO
//  *Cause:
// *Action:
/
3155, VFAIL_ASM_INCORRECT_DISKSTRING, "ASM discovery string is set to the value \"{1}\" that matches TTY devices."
//  *Cause: The ASM discovery string parameter ASM_DISKSTRING was set to a 
//          value that matches TTY devices.
// *Action: Ensure that the parameter ASM_DISKSTRING is altered to a
//          restrictive value that does not match TTY devices using the 
//          command 'asmcmd dsset --normal <discovery string>' in ASM 11.2 
//          or later. If SPFILE is in use for 11.1 or earlier ASM, then 
//          use the command 'ALTER SYSTEM SET ASM_DISKSTRING=<discovery string>
//          SCOPE=SPFILE;'. Otherwise, update the value of parameter 
//          ASM_DISKSTRING in the PFILE of each ASM instance.
/
3156, EFAIL_ASM_INCORRECT_DISKSTRING, "error occurred while checking for the selectivity of ASM discovery string"
//  *Cause: An ASM query failed unexpectedly.
// *Action: Examine the accompanying error messages for details.
/
3157, ASM_INCORRECT_DISKSTRING_DETAILS, "The query \"{0}\" provides the value of ASM_DISKSTRING parameter. Ensure that the parameter is not set to a value that matches TTY devices."
// *Document: NO
//  *Cause:
// *Action:
/
3158, REPORT_EMPTY_TASK_LIST_APPCLUSTER_BEST_PRACTICE, "Oracle Clusterware Application Cluster best practice checks are not available for version \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
3159, REPORT_EMPTY_TASK_LIST_OS_BEST_PRACTICE_APPCLUSTER, "Operating system best practice checks are not available for Oracle Clusterware Application Cluster version \"{0}\"."
// *Document: NO
//  *Cause: 
// *Action:
/
3160, ELEMENT_NAME_ASM_FAILGROUP_EXADATA, "ASM failure groups"
// *Document: NO
//  *Cause:
// *Action:
/
3161, DESC_ASM_FAILGROUP_EXADATA, "Check for Exadata cell nodes with multiple ASM failure groups"
// *Document: NO
//  *Cause:
// *Action:
/
3162, SUCC_ASM_FAILGROUP_EXADATA, "Each Exadata cell node contains only one ASM failure group."
// *Document: NO
//  *Cause:
// *Action:
/
3163, VFAIL_ASM_FAILGROUP_EXADATA, "Exadata cell nodes \"{2}\" contain more than one ASM failure group."
//  *Cause: A query showed that the indicated Exadata cell nodes contain more 
//          than one ASM failure group.
// *Action: It is advisable to have a single ASM failure group assigned to an
//          Exadata cell node. Ensure that the indicated Exadata cell nodes
//          contain only one ASM failure group.
/
3164, EFAIL_ASM_FAILGROUP_EXADATA, "error occurred while checking the Exadata cell nodes for multiple ASM failure groups"
//  *Cause: An ASM query failed unexpectedly.
// *Action: Examine the accompanying error messages for details.
/
3165, ASM_FAILGROUP_EXADATA_DETAILS, "The query \"SELECT DISTINCT REGEXP_SUBSTR(PATH,'[^/]+',2) AS CELL, FAILGROUP FROM V$ASM_DISK\" provides information about the Exadata cell nodes with multiple ASM failure groups. Ensure that the Exadata cell nodes contain only one ASM failure group."
// *Document: NO
//  *Cause:
// *Action:
/
3167, ELEMENT_NAME_ASM_SPARE_PARAMETERS, "ASM spare parameters"
// *Document: NO
//  *Cause:
// *Action:
/
3168, DESC_ASM_SPARE_PARAMETERS, "Check for ASM spare parameters"
// *Document: NO
//  *Cause:
// *Action:
/
3169, SUCC_ASM_SPARE_PARAMETERS, "All ASM spare parameters have default values."
// *Document: NO
//  *Cause:
// *Action:
/
3170, VFAIL_ASM_SPARE_PARAMETERS, "ASM spare parameters \"{2}\" are set to values different from their default values."
//  *Cause: A query showed that values of the indicated ASM spare parameters
//          had been changed.
// *Action: Review and reset the values of the indicated ASM spare parameters
//          before upgrade. If unable to resolve the issue, contact
//          Oracle Support Services.
/
3171, EFAIL_ASM_SPARE_PARAMETERS, "An error occurred while checking ASM spare parameters."
//  *Cause: An ASM query to obtain details of the spare parameters before 
//          upgrade failed unexpectedly. Accompanying error messages provide
//          detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve
//          problems identified and retry.
/
3172, ELEMENT_NAME_COMPATIBLE_ASM_DG_ATTRIBUTE, "Disk group ASM compatibility setting"
// *Document: NO
//  *Cause:
// *Action:
/
3173, DESC_COMPATIBLE_ASM_DG_ATTRIBUTE, "Check for disk group ASM compatibility setting"
// *Document: NO
//  *Cause:
// *Action:
/
3174, SUCC_COMPATIBLE_ASM_DG_ATTRIBUTE, "ASM compatibility setting check passed for the ASM disk group \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
3175, VFAIL_COMPATIBLE_ASM_DG_ATTRIBUTE, "ASM compatibility for ASM disk group \"{1}\" is set to \"{2}\", which is less than the minimum supported value \"{3}\"."
//  *Cause: A query showed that the ASM disk group attribute "compatible.asm"
//          for the indicated disk group was set to a value less than the
//          minimum supported value. 
// *Action: Ensure that the ASM compatibility of the indicated disk group is
//          set to a value greater than or equal to the indicated minimum 
//          supported value by running the command 'asmcmd setattr -G 
//          <diskgroup> compatible.asm <value>'.
/
3176, EFAIL_COMPATIBLE_ASM_DG_ATTRIBUTE, "An error occurred while checking ASM disk group compatibility attribute."
//  *Cause: An ASM query to obtain details of the ASM compatibility disk group
//          attribute failed. Accompanying error messages provide detailed
//          failure information.
// *Action: Examine the accompanying error messages for details, resolve
//          problems identified and retry.
/
3177, ELEMENT_NAME_COMPATIBLE_RDBMS_DG_ATTRIBUTE, "Disk group RDBMS compatibility setting"
// *Document: NO
//  *Cause:
// *Action:
/
3178, DESC_COMPATIBLE_RDBMS_DG_ATTRIBUTE, "Check for disk group RDBMS compatibility setting"
// *Document: NO
//  *Cause:
// *Action:
/
3179, SUCC_COMPATIBLE_RDBMS_DG_ATTRIBUTE, "RDBMS compatibility setting check passed for ASM disk group \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
3180, VFAIL_COMPATIBLE_RDBMS_DG_ATTRIBUTE, "RDBMS compatibility for ASM disk group \"{1}\" is set to \"{2}\", which is less than the minimum supported value \"{3}\"."
//  *Cause: A query showed that the ASM disk group attribute "compatible.rdbms"
//          for the indicated disk group was set to a value less than the
//          minimum supported value. 
// *Action: Ensure that the RDBMS compatibility of the indicated disk group is 
//          set to a value greater than or equal to the indicated minimum 
//          supported value by running the command 'asmcmd setattr -G 
//          <diskgroup> compatible.rdbms <value>'. 
/
3181, EFAIL_COMPATIBLE_RDBMS_DG_ATTRIBUTE, "An error occurred while checking ASM disk group RDBMS compatibility attribute."
//  *Cause: An ASM query to obtain details of the RDBMS compatibility disk 
//          group attribute failed. Accompanying error messages provide 
//          detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve
//          problems identified and retry.
/
3182, ELEMENT_NAME_ASM_REBAL_OPS_IN_WAIT_POST_12, "ASM disk rebalance operations in WAIT status"
// *Document: NO
//  *Cause:
// *Action:
/
3183, DESC_ASM_REBAL_OPS_IN_WAIT_POST_12, "Check ASM disk rebalance operations in WAIT status"
// *Document: NO
//  *Cause:
// *Action:
/
3184, SUCC_ASM_REBAL_OPS_IN_WAIT_POST_12, "No ASM disk rebalance operations found which are in WAIT status"
// *Document: NO
//  *Cause:
// *Action:
/
3185, VFAIL_ASM_REBAL_OPS_IN_WAIT_POST_12, "One or more ASM disk rebalance operations found in WAIT status"
//  *Cause: A query on V$ASM_OPERATION showed one or more ASM disk rebalance operations in WAIT status.
// *Action: Identify the ASM rebalance operations in WAIT status by running the
//          query \"SELECT * FROM V$ASM_OPERATION WHERE PASS LIKE 'REBALANCE' 
//          AND STATE LIKE 'WAIT'\" and resume the operations by altering 
//          rebalance power to a non-zero value for the related ASM disk groups.
/
3186, EFAIL_ASM_REBAL_OPS_IN_WAIT_POST_12, "Error occurred while checking ASM disk rebalance operations in WAIT status"
//  *Cause: An ASM query to obtain details of the ASM disk rebalance 
//          operations failed. Accompanying error messages provide 
//          detailed failure information.
// *Action: Examine the accompanying error message for details, resolve
//          problems identified and retry.
/
3187, ASM_REBAL_OPS_IN_WAIT_POST_12_DETAILS, "The query \"SELECT * FROM V$ASM_OPERATION WHERE PASS LIKE ''REBALANCE'' AND STATE LIKE ''WAIT''\" returns the ASM disk rebalance operations currently in WAIT. The rebalance power can be manually altered using the statement \"ALTER DISKGROUP <diskgroup_name> REBALANCE POWER <power_value>\", where <diskgroup_name> is the name of the disk group related to the operation and <power_value> is a non-zero value to turn on ASM disk rebalancing."
// *Document: NO
//  *Cause:
// *Action:
/
3188, ELEMENT_NAME_ASM_DISKGROUP_FREE_SPACE, "ASM disk group free space"
// *Document: NO
//  *Cause:
// *Action:
/
3189, DESC_ASM_DISKGROUP_FREE_SPACE, "Check ASM disk group free space"
// *Document: NO
//  *Cause:
// *Action:
/
3190, SUCC_ASM_DISKGROUP_FREE_SPACE, "ASM disk group free space check passed."
// *Document: NO
//  *Cause:
// *Action:
/
3191, VFAIL_ASM_DISKGROUP_FREE_SPACE, "Free space on one or more ASM diskgroups is below the reccommended value of {3}."
//  *Cause: A query on V$ASM_DISKGROUP showed that free space on one or more 
//          ASM disk groups is below the indicated value.
// *Action: Refer to MOS Note 473271.1 to take corrective action
/
3192, EFAIL_ASM_DISKGROUP_FREE_SPACE, "Error occurred while checking ASM disk group free space."
//  *Cause: An ASM query to obtain details of the ASM disk group failed.
//          Accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error message for details, resolve
//          problems identified and retry.
/
3193, ASM_DISKGROUP_FREE_SPACE_DETAILS, "The query '{0}'  provides information about free space on ASM disk groups. Refer to MOS Note 473271.1 for more information."
// *Document: NO
//  *Cause:
// *Action:
/

3200, ELEMENT_NAME_CHECK_DAX_ACCESS, "check 'dax_access' privilege"
// *Document: NO
// *Cause:
// *Action:
/
3201, DESC_CHECK_DAX_ACCESS, "checks whether the database user has the operating system privilege 'dax_access' if Direct Access (DAX) device is mounted"
// *Document: NO
// *Cause:
// *Action:
/
3202, DAX_ACCESS_NOT_AVAILABLE, "User \"{0}\" does not have the operating system privilege \"{1}\" on node \"{2}\""
//  *Cause: A Direct Access (DAX) device '/dev/dax' was mounted on the node 
//          indicated  but the Oracle user does not have the required operating
//          system privilege to access this device.
// *Action: Ensure that the Oracle user has the indicated privilege. The
//          privilege to access DAX device can be granted by running the 
//          command 
//          'usermod -S files -K defaultpriv+=basic,dax_access <Oracle user>'
//          as root.
/
3203, ELEMENT_NAME_ASM_DISKGROUP_DISK_SIZE, "ASM disk size consistency"
// *Document: NO
//  *Cause:
// *Action:
/
3204, DESC_ASM_DISKGROUP_DISK_SIZE, "Check ASM disk groups for disk size consistency"
// *Document: NO
//  *Cause:
// *Action:
/
3205, SUCC_ASM_DISKGROUP_DISK_SIZE, "ASM disk size consistency check passed."
// *Document: NO
//  *Cause:
// *Action:
/
3206, VFAIL_ASM_DISKGROUP_DISK_SIZE, "The disks in the ASM disk group \"{1}\" have different sizes."
//  *Cause: The Cluster Verification Utility (CVU) found that disk size was not
//          consistent across the disks in the indicated ASM disk group. 
// *Action: Use the query "SELECT D.PATH,D.OS_MB,G.NAME FROM V$ASM_DISK D, 
//          V$ASM_DISKGROUP G WHERE G.GROUP_NUMBER=D.GROUP_NUMBER" to retrieve
//          the details of ASM disk sizes in the indicated ASM disk group.
//          Ensure that disk size is consistent across the indicated ASM disk
//          group and retry the operation. 
/
3207, EFAIL_ASM_DISKGROUP_DISK_SIZE, "Error occurred while checking ASM disk size consistency."
//  *Cause: An ASM query to obtain details of the ASM disk group failed.
//          Accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error message for details, resolve
//          problems identified and retry the operation.
/
9900, SUMMARY_CVU_OPERATION, "CVU operation performed: "
// *Document: NO
//  *Cause:
// *Action:
/
9901, SUMMARY_CVU_DATE, "Date: "
// *Document: NO
//  *Cause:
// *Action:
/
9902, SUMMARY_CVU_HOME, "CVU home: "
// *Document: NO
//  *Cause:
// *Action:
/
9903, SUMMARY_CVU_OPERATIONS_PERFORMED, "CVU operations performed: "
// *Document: NO
//  *Cause:
// *Action:
/
9904, REPORT_TEXT_DAEMON, "Daemon '{0}'"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: The insertion string in this message is a portion of the command-line syntax.
9905, REPORT_TEXT_FAIL_SUMMARY, "Failures were encountered during execution of CVU verification request \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
9906, REPORT_TXT_ERRORS, "Errors: "
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: The insertion string in this message is a portion of the command-line syntax.
9907, REPORT_TEXT_WARN_SUMMARY, "Warnings were encountered during execution of CVU verification request \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
9999, REPORT_TEXT_USER, "User"
// *Document: NO
//  *Cause:
// *Action:
/
10000, REPORT_TEXT_CLOSE, "Close"
// *Document: NO
//  *Cause:
// *Action:
/
10001, BEST_PRACTICE_HEADING, "Detailed report for Best Practices checks"
// *Document: NO
//  *Cause:
// *Action:
/
10002, SUMMARY_CLUSTER_ENV, "Summary of environment"
// *Document: NO
//  *Cause:
// *Action:
/
10003, SUMMARY_ELEMENT_NAME, "Name"
// *Document: NO
//  *Cause:
// *Action:
/
10004, SUMMARY_ELEMENT_VALUE, "Value"
// *Document: NO
//  *Cause:
// *Action:
/
10005, SUMMARY_CLUSTER_NAME, "Cluster name"
// *Document: NO
//  *Cause:
// *Action:
/
10006, SUMMARY_DATABASE_NAME, "Database name"
// *Document: NO
//  *Cause:
// *Action:
/
10007, SUMMARY_DATABASE, "Database{0}"
// *Document: NO
//  *Cause:
// *Action:
/
10008, SUMMARY_DATABASE_VERSION, "Database version"
// *Document: NO
//  *Cause:
// *Action:
/
10009, SUMMARY_DATABASE_HOME, "Database home"
// *Document: NO
//  *Cause:
// *Action:
/
10010, SUMMARY_DATE, "Date (mm/dd/yyyy)"
// *Document: NO
//  *Cause:
// *Action:
/
10011, SUMMARY_TIME, "Time (hh:mm:ss)"
// *Document: NO
//  *Cause:
// *Action:
/
10012, REPORT_CLUSTER_SYSREQ_CHECKS, "System requirements"
// *Document: NO
//  *Cause:
// *Action:
/
10013, REPORT_CLUSTER_SYSRECO_CHECKS, "System recommendations"
// *Document: NO
//  *Cause:
// *Action:
/
10014, REPORT_CLUSTERWARE_REQ_CHECKS, "Clusterware requirements"
// *Document: NO
//  *Cause:
// *Action:
/
10015, REPORT_CLUSTERWARE_RECO_CHECKS, "Clusterware recommendations"
// *Document: NO
//  *Cause:
// *Action:
/
10016, REPORT_DATABASE_REQ_CHECKS, "Database requirement checks for \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
10017, REPORT_DATABASE_RECO_CHECKS, "Database recommendation checks for \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
10018, REPORT_NETWORK_CHECKS, "Network checks"
// *Document: NO
//  *Cause:
// *Action:
/
10019, REPORT_TABLE_DESC_CHECK, "Verification Check"
// *Document: NO
//  *Cause:
// *Action:
/
10020, REPORT_TABLE_DESC_RESULT, "Verification Result"
// *Document: NO
//  *Cause:
// *Action:
/
10021, REPORT_TABLE_DESC_DESCRIPTION, "Verification Description"
// *Document: NO
//  *Cause: 
// *Action:
/
10022, REPORT_TEXT_DATABASE_INSTANCE, "Database(Instance)"
// *Document: NO
//  *Cause:
// *Action:
/
10023, REPORT_TABLE_DESC_MORE_DETAILS, "Additional Details"
// *Document: NO
//  *Cause:
// *Action:
/
10024, REPORT_EXPECTED_VALUE, "Expected Value"
// *Document: NO
//  *Cause:
// *Action:
/
10025, REPORT_ACTUAL_VALUE, "Actual Value"
// *Document: NO
//  *Cause: 
// *Action:
/
10026, REPORT_STR_NOT_APPLICABLE, "not applicable"
// *Document: NO
//  *Cause:
// *Action:
/
10027, REPORT_STR_NOT_AVAILABLE, "not available"
// *Document: NO
//  *Cause: 
// *Action:
/
10028, REPORT_SAVED_FILE_DETAIL_MSG, "Complete report of this execution is saved in file \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
10029, HTML_HEADING_SUBJECT, "Following components are checked as part of this report (Click on each component listed below to navigate)"
// *Document: NO
//  *Cause:
// *Action:
/
10030, REPORT_STR_PASSED, "PASSED"
// *Document: NO
//  *Cause:
// *Action:
/
10031, REPORT_STR_FAILED, "FAILED"
// *Document: NO
//  *Cause:
// *Action:
/
10032, REPORT_STR_WARNING, "WARNING"
// *Document: NO
//  *Cause: 
// *Action:
/
10033, REPORT_STR_ERROR, "ERROR"
// *Document: NO
//  *Cause: 
// *Action:
/
10034, REPORT_STR_MET, "MET"
// *Document: NO
//  *Cause: 
// *Action:
/
10035, REPORT_STR_NOTMET, "NOT MET"
// *Document: NO
//  *Cause: 
// *Action:
/
10036, REPORT_STR_ERROR_DETAILS, "Error details"
// *Document: NO
//  *Cause:
// *Action:
/
10037, REPORT_CRS_HOME, "Grid home"
// *Document: NO
//  *Cause:
// *Action:
/
10038, REPORT_CRS_USER, "Grid User"
// *Document: NO
//  *Cause: 
// *Action:
/
10039, REPORT_NODE_WISE_DETAILS, "Error details for node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
10040, REPORT_MORE_DETAILS_HEADING, "More details for check : {0}"
// *Document: NO
//  *Cause:
// *Action:
/
10041, REPORT_MOUSEOVER_CLICK_MOREDETAILS, "Click for more details"
// *Document: NO
//  *Cause:
// *Action:
/
10042, REPORT_MOUSEOVER_CLICK_NODEDETAILS, "Click to view details"
// *Document: NO
//  *Cause:
// *Action:
/
10043, REPORT_MOUSEOVER_CLICK_DETAILS_MAIN, "Click to go to main index"
// *Document: NO
//  *Cause: 
// *Action:
/
10044, REPORT_NO_TARGET_IN_XML_EXCEPTION, "Could not find targets in the xml file"
// *Document: NO
//  *Cause: 
// *Action:
/
10045, REPORT_HTML_TABLE_ROW_EXCEPTION, "Could not add the row as the number of columns in row mismatch with the number of column in table"
// *Document: NO
//  *Cause:
// *Action:
/
10046, REPORT_HTML_POPUP_TITLE, "Details for \"{0}\" check"
// *Document: NO
//  *Cause:
// *Action:
/
10047, REPORT_TEXT_SUMMARY, "Verification Summary"
// *Document: NO
//  *Cause: 
// *Action:
/
10048, REPORT_TEXT_REFERENCES, "References (URLs/Notes)"
// *Document: NO
//  *Cause:
// *Action:
/
10049, REPORT_TEXT_CLUSTERWARE_RELEASE, "Clusterware version"
// *Document: NO
//  *Cause:
// *Action:
/
10050, REPORT_TEXT_OS_PLATFORM, "Operating system"
// *Document: NO
//  *Cause:
// *Action:
/
10051, REPORT_NULL_PARAM_VALUE_EXCEPTION, "Parameter \"{0}\" cannot be null"
// *Document: NO
//  *Cause: 
// *Action:
/
10052, REPORT_STR_NODE, "Node"
// *Document: NO
//  *Cause:
// *Action:
/
10053, REPORT_TABLE_DESC_DETAILS, "details"
// *Document: NO
//  *Cause:
// *Action:
/
10054, REPORT_TEXT_NONE, "None"
// *Document: NO
//  *Cause:
// *Action:
/
10055, REPORT_TEXT_TOP, "Top"
// *Document: NO
//  *Cause:
// *Action:
/
10056, REPORT_STR_STATUS, "Status"
// *Document: NO
//  *Cause:
// *Action:
/
10057, REPORT_STATUS_UNKNOWN, "Unknown"
// *Document: NO
//  *Cause:
// *Action:
/
10058, REPORT_INCORRECT_FILE_DIR_PATH_EXCEPTION, "Incorrect value of file or directory path provided"
// *Document: NO
//  *Cause: 
// *Action:
/
10059, REPORT_FAILED_TO_CREATE_FILE_EXCEPTION, "Could not create the file at path \"{0}\" failed with error : {1}"
// *Document: NO
//  *Cause: 
// *Action:
/
10060, REPORT_FAILED_TO_DELETE_FILE_EXCEPTION, "Could not delete the file at path \"{0}\" failed with error : {1}"
// *Document: NO
//  *Cause: 
// *Action:
/
10061, REPORT_HTML_BROWSER_INVALID_EXCEPTION, "Could not find file \"{0}\" or execute permission denied"
// *Document: NO
//  *Cause: 
// *Action:
/
10062, REPORT_HTML_BROWSER_NOT_FOUND_EXCEPTION, "Could not find any html browser installed"
// *Document: NO
//  *Cause: 
// *Action:
/
10063, REPORT_HTML_BROWSER_FAILED_EXCEPTION, "Failed to open the html file \"{0}\" using browser \"{1}\" Error : {2}"
// *Document: NO
//  *Cause: 
// *Action:
/
10064, REPORT_GLOBAL_ERROR_DETAILS_MSG, "Cluster-wide error details"
// *Document: NO
//  *Cause: 
// *Action:
/
10065, REPORT_ERROR_MSG_HEADER, "Error"
// *Document: NO
//  *Cause: 
// *Action:
/
10066, REPORT_ERROR_CAUSE_HEADER, "Cause"
// *Document: NO
//  *Cause: 
// *Action:
/
10067, REPORT_ERROR_ACTION_HEADER, "Action"
// *Document: NO
//  *Cause: 
// *Action:
/
10068, REPORT_XML_HEADER_ABSENT, "Header details not added to the xml report, ensure that basic details header is added"
// *Document: NO
//  *Cause: 
// *Action:
/
10069, REPORT_STR_NOTVERIFIED, "not verified"
// *Document: NO
//  *Cause:
// *Action:
/
10070,ELEMENT_NAME_CHECK_BOOT_MOUNTED, "/boot mount"
// *Document: NO
//  *Cause:
// *Action:
/
10071, DESC_CHECK_BOOT_MOUNTED, "Checks /boot is mounted"
// *Document: NO
//  *Cause:
// *Action:
/
10072, CHECK_SYMVERS_PASS, "/boot is mounted on node \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
10073, CHECK_SYMVERS_FAIL, "Required /boot data is not available on node \"{0}\""
//  *Cause: The file '/boot/symvers-<kernel_release>.gz', required for proper driver installation, was not found on the indicated node. 
// *Action: Ensure that /boot is mounted and /boot/symvers-<kernel_release>.gz is available on the node.
/
10075,ELEMENT_NAME_CHECK_ZEROCONF, "zeroconf check"
// *Document: NO
//  *Cause:
// *Action:
/
10076, DESC_CHECK_ZEROCONF, "Checks that OS network parameter NOZEROCONF is set to 'yes' or the parameter LINKLOCAL_INTERFACES is not set in case of SUSE Linux."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'yes'
10077, CHECK_ZEROCONF_FAIL, "NOZEROCONF parameter was not  specified or was not set to 'yes' in file \"/etc/sysconfig/network\" on node \"{0}\""
//  *Cause: During NOZEROCONF check, it was determined that NOZEROCONF parameter was not specified or was not set to 'yes' in /etc/sysconfig/network file.
// *Action: Ensure NOZEROCONF is set to 'yes' in /etc/sysconfig/network to disable 169.254/16 being added to the routing table.
/
10078, CHECK_ZEROCONF_FAIL_SUSE, "LINKLOCAL_INTERFACES network parameter was defined in the file \"/etc/sysconfig/network/config\" on node \"{0}\"."
//  *Cause: During LINKLOCAL_INTERFACES parameter check, it was determined that
//          the LINKLOCAL_INTERFACES network parameter was defined in the
//          /etc/sysconfig/network/config file.
// *Action: Ensure that the LINKLOCAL_INTERFACES network parameter is not 
//          defined in the /etc/sysconfig/network/config file to avoid having
//          the link local addresses 169.254/16 added to the routing table.
/
10079, CHECK_ZEROCONF_ERROR, "Parameter \"{0}\" value in the file \"{1}\" cannot be verified on node \"{2}\"."
//  *Cause: An error occurred while verifying the indicated parameter value in
//          the indicated file on the indicated node. The accompanying messages 
//          provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
10080, ELEMENT_NAME_DB_JAVA_OBJ_INST_CHECK, "JAVAVM installation check in database"
// *Document: NO
//  *Cause:
// *Action:
/
10081, DESC_DB_JAVA_OBJ_INST_CHECK, "Checks the installation of Java Virtual Machine in the database"
// *Document: NO
//  *Cause:
// *Action:
/
10082, SUCC_DB_JAVA_OBJ_INST_CHECK, "Java Virtual Machine installed properly"
// *Document: NO
//  *Cause:
// *Action:
/
10083, VFAIL_DB_JAVA_OBJ_INST_CHECK, "Java Virtual Machine is not installed properly"
//  *Cause: There were not enough JAVA objects in DBA_OBJECTS table.
// *Action: Refer to MOS note 397770.1 to take corrective action
/
10084, EFAIL_DB_JAVA_OBJ_INST_CHECK, "Error while checking JAVAVM installation in the database"
//  *Cause: An error occurred while performing the check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
10090, ELEMENT_NAME_DB_TIMEZONE_VER, "Time zone file check"
// *Document: NO
//  *Cause:
// *Action:
/
10091, DESC_DB_TIMEZONE_VER, "Checks the version of the time zone file"
// *Document: NO
//  *Cause:
// *Action:
/
10092, SUCC_DB_TIMEZONE_VER, "Time zone file is current"
// *Document: NO
//  *Cause:
// *Action:
/
10093, VFAIL_DB_TIMEZONE_VER, "Time zone patch upgrade should be performed"
// *Document: NO
//  *Cause:
// *Action:
/
10094, EFAIL_DB_TIMEZONE_VER, "Error while checking Time Zone file"
//  *Cause: An error occurred while performing the check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
10095, DB_TIMEZONE_VER_DETAILS, "The time zone files that are supplied with Oracle Database 11g Release 1 (11.1) have been updated from version 2 to version 4 to reflect changes in transition rules for some time zone regions. The changes might affect existing database data of TIMESTAMP WITH TIME ZONE data type. If you have not already updated your existing databases to time zone file version 4, you must do so prior to upgrading to Oracle Database 11g Release 1 (11.1). Refer to MOS note. 556477.1 for more information."
// *Document: NO
//  *Cause:
// *Action:
/
10100, ELEMENT_NAME_DB_STANDBY_DBS, "Standby database check" 
// *Document: NO
//  *Cause:
// *Action:
/
10101, DESC_DB_STANDBY_DBS, "Checks standby database existence"
// *Document: NO
//  *Cause:
// *Action:
/
10102, SUCC_DB_STANDBY_DBS, "Standby databases exist"
// *Document: NO
//  *Cause:
// *Action:
/
10103, VFAIL_DB_STANDBY_DBS, "No standby databases were found"
// *Document: NO
//  *Cause:
// *Action:
/
10104, EFAIL_DB_STANDBY_DBS, "Error while checking standby databases"
//  *Cause: An error occurred while checking standby databases.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
10105, DB_STANDBY_DBS_DETAILS, "At least one standby database must exist."
// *Document: NO
//  *Cause:
// *Action:
/
10110, ELEMENT_NAME_MULTIUSER_SVC, "Multiuser services check" 
// *Document: NO
//  *Cause:
// *Action:
/
10111, DESC_MULTIUSER_SVC, "Checks Multiuser services are \"online\""
// *Document: NO
//  *Cause:
// *Action:
/
10112, SUCC_MULTIUSER_SVC, "Multiuser services are \"online\" on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
10113, VFAIL_MULTIUSER_SVR_SVC, "\"multi-user-server\" service is \"{0}\" on node \"{1}\""
//  *Cause: The 'svcs svc:/milestone/multi-user-server' command reported that the multi-user-server was not online on the specified node.
// *Action: Consult the OS documentation/System Administrator to bring up multi-user-server service.
/
10114, VFAIL_MULTIUSER_SVC, "\"multi-user\" service is \"{0}\" on node \"{1}\""
//  *Cause: The 'svcs svc:/milestone/multi-user' command reported that the multi-user was not online on the specified node.
// *Action: Consult the OS documentation/System Administrator to bring up multi-user service.
/
10115, EFAIL_MULTIUSER_SVC, "Error while checking multiuser service"
//  *Cause: An error occurred while checking multiuser service
// *Action: Look at the accompanying messages for details on the cause of failure.
/
10120, ELEMENT_NAME_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY, "Privileged group consistency for upgrade" 
// *Document: NO
//  *Cause:
// *Action:
/
10121, DESC_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY, "Checks consistency of privileged group selection for upgrade"
// *Document: NO
//  *Cause:
// *Action:
/
10122, SUCC_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY, "Privileged group selection was found consistent"
// *Document: NO
//  *Cause:
// *Action:
/
10123, VFAIL_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY, "Selected \"{0}\" group \"{1}\" is not same as the currently configured group \"{2}\" for existing Oracle Clusterware home \"{3}\""
//  *Cause: An attempt to upgrade the database was rejected because the selected group was not the group configured for the existing Oracle Clusterware installation.
// *Action: Select the same groups as the currently configured groups of the existing Oracle Clusterware installation.
/
10124, VFAIL_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY_CURRENT_ABSENT, "Current selection of the \"{0}\" group could not be retrieved"
//  *Cause: The indicated group was not found selected or set to any valid operating system group name.
// *Action: Ensure that the indicated group is selected and set to some valid operating system group name.
/
10125, EFAIL_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY, "Error while checking privileged groups consistency. \nError: {0}"
//  *Cause: An error occurred while checking privileged groups consistency.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
10126, EFAIL_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY_CONFIG_ABSENT, "Configured \"{0}\" group for Oracle Clusterware home \"{1}\" could not be retrieved"
//  *Cause: The indicated group could not be retrieved using the 'osdbagrp' utility from the identified Oracle Clusterware home.
// *Action: Ensure that the indicated group is configured correctly and that the 'osdbagrp' utility reports it correctly from the identified Oracle Clusterware home.
/
10127, REPORT_STR_VERIFIED, "verified"
// *Document: NO
//  *Cause:
// *Action:
/
10128, VFAIL_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY_RAC_HOME, "Selected \"{0}\" group \"{1}\" is not same as the currently configured group \"{2}\" for existing database home \"{3}\""
//  *Cause: An attempt to upgrade the database was rejected because the selected group was not the group configured for the existing database installation.
// *Action: Select the same groups as the currently configured groups of the existing database installation.
/
10129, EFAIL_PRIVILEGED_GROUP_UPGRADE_CONSISTENCY_CONFIG_ABSENT_RAC_HOME, "Configured \"{0}\" group for database home \"{1}\" could not be retrieved"
//  *Cause: The indicated group could not be retrieved using the 'osdbagrp' utility from the identified database home.
// *Action: Ensure that the indicated group is configured correctly and that the 'osdbagrp' utility reports it correctly from the identified database home.
/
10130, REPORT_STR_SKIPPED, "skipped"
// *Document: NO
//  *Cause:
// *Action:
/
10131, REPORT_STR_COLLECTED, "collected"
// *Document: NO
//  *Cause:
// *Action:
/
10132, REPORT_STR_NOTHING_TO_COLLECT, "nothing to collect"
// *Document: NO
//  *Cause:
// *Action:
/

10135, ELEMENT_NAME_DB_FILESYSTEMIO_OPTIONS, "FILESYSTEMIO_OPTIONS"
// *Document: NO
//  *Cause:
// *Action:
/
10136, DESC_DB_FILESYSTEMIO_OPTIONS, "Checks FILESYSTEMIO_OPTIONS parameter"
// *Document: NO
//  *Cause:
// *Action:
/
10137, SUCC_DB_FILESYSTEMIO_OPTIONS, "FILESYSTEMIO_OPTIONS = setall"
// *Document: NO
//  *Cause:
// *Action:
/
10138, VFAIL_DB_FILESYSTEMIO_OPTIONS, "FILESYSTEMIO_OPTIONS is not set to the recommended value of setall"
//  *Cause: An attempt to match the value of parameter FILESYSTEMIO_OPTIONS with the recommended value failed.
// *Action: Set the FILESYSTEMIO_OPTIONS to the recommended value using SQL statement 'alter system set'. 
/
10139, EFAIL_DB_FILESYSTEMIO_OPTIONS, "Error while checking FIELSYSTEMIO_OPTIONS"
//  *Cause: An attempt to check the value of the parameter FILESYSTEMIO_OPTIONS failed because the database was not configured correctly.
// *Action: Ensure that the database is configured correctly and retry the operation.  
/
10140, DB_FILESYSTEMIO_OPTIONS_DETAILS, "FILESYSTEMIO_OPTIONS=setall supports both direct I/O and asynchronus I/O which helps to achieve optimal performance with database data files"
// *Document: NO
//  *Cause: 
// *Action:
/
10148, ELEMENT_NAME_IP_HOSTMODEL, "IP hostmodel"
// *Document: NO
//  *Cause:
// *Action:
/
10149, DESC_IP_HOSTMODEL, "Checks the current IP hostmodel configuration" 
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'strong' 'weak'
10150, IP_HOSTMODEL_IPV4_AND_IPV6_FAILED, "The current IP hostmodel configuration for both IPV4 and IPV6 protocols does not match the required configuration on node \"{0}\". [Expected = \"{1}\" ; Found = \"{2}\"]"
//  *Cause: The IP hostmodel configuration on the indicated node for the specified protocols was 'strong' and should have been 'weak'. 
// *Action: Modify the IP hostmodel configuration to meet the required configuration. Use command 'ipadm set-prop -p hostmodel=weak [ipv4|ipv6]' to modify the IP hostmodel configuration.
/
// Translator: do not translate 'strong' 'weak'
10151, IP_HOSTMODEL_FAILED, "The current IP hostmodel configuration for \"{0}\" protocol does not match the required configuration on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: The IP hostmodel configuration on the indicated node for the specified protocol was 'strong' and should have been 'weak'.
// *Action: Modify the IP hostmodel configuration to meet the required configuration. Use command 'ipadm set-prop -p hostmodel=weak [ipv4|ipv6]' to modify the IP hostmodel configuration.
/
10153, ELEMENT_NAME_CHECK_GSD_RESOURCE, "GSD resource status"
// *Document: NO
//  *Cause:
// *Action:
/
10154, DESC_CHECK_GSD_RESOURCE, "Checks the GSD resource status"
// *Document: NO
//  *Cause:
// *Action:
/
10155, GSD_RESOURCE_ONLINE_ENABLED, "GSD resource is running and enabled on node \"{0}\"."
//  *Cause: GSD was found to be running and enabled on the indicated node.
// *Action: Stop and disable GSD using the commands 'srvctl stop nodeapps -g' and 'srvctl disable nodeapps -g' respectively.
/
10156, GSD_RESOURCE_ENABLED, "GSD resource is enabled on node \"{0}\"."
//  *Cause: GSD was found to be enabled on the indicated node.
// *Action: Disable GSD using the command 'srvctl disable nodeapps -g'.
/
10165,ELEMENT_NAME_CHECK_IOCP_STATUS, "I/O Completion Ports (IOCP) device status"
// *Document: NO
//  *Cause:
// *Action:
/
10166, DESC_CHECK_IOCP_STATUS, "Checks the I/O Completion Ports (IOCP) device status"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'Available'
10167, IOCP_DEVICE_STATUS_NOT_AVAILABLE, "I/O Completion Ports (IOCP) device status did not match the required value on node \"{0}\". [Expected = \"Available\"; Found = \"{1}\"]"
//  *Cause: IOCP device status was not 'Available' on the indicated node. The IOCP device status must be 'Available' in order to list the candidate disks when creating ASM disk group. 
// *Action: Login as the root user and change the IOCP device status to 'Available' using the command '/bin/smitty iocp' and reboot the node for the changes to take effect.
/
10168, ERROR_IOCP_DEVICE_STATUS, "Failed to obtain the I/O Completion Ports (IOCP) device status using command \"{0}\" on node \"{1}\""
//  *Cause: An attempt to obtain the status of IOCP device failed on the indicated node.
// *Action: Ensure that the identified command exists and the current user has read/execute permissions for it. 
/
10169, TASK_CHECK_EN_LOCALE_SOL10_NOT_INSTALLED_VFAIL, "North America region (nam) is not installed on node \"{0}\"."
//  *Cause: The command 'localeadm -q nam' reported that the North America region (nam) was not installed on the specified node.
// *Action: North America region (nam) must be installed, in order to install it use 'localeadm -a nam -d <packages_path>', where <packages_path> is the full path to a directory where the Solaris packages are available like '/cdrom/cdrom0/s0/Solaris_10/Product' if using a Solaris Compact Disc.
/
10170, TASK_CHECK_EN_LOCALE_SOL10_UNDETERMINED_VFAIL, "an error ocurred when trying to determine if North America region (nam) is installed on node \"{0}\"."
//  *Cause: An error ocurred while executing the command 'localeadm -q nam' and failed to determine whether North America region (nam) was installed on the specified node.
// *Action: North America region (nam) must be installed. Consult the OS documentation/System Administrator to diagnose and fix the issue with the command 'localeadm -q nam' and install the region using the command 'localeadm -a nam -d <packages_path>', where <packages_path> is the full path to a directory where the Solaris packages are available like '/cdrom/cdrom0/s0/Solaris_10/Product' if using a Solaris Compact Disc.
/
10171, TASK_CHECK_EN_LOCALE_SOL11_NOT_INSTALLED_VFAIL, "English locale is not installed on node \"{0}\"."
//  *Cause: The command 'pkg facet -H *locale.en*' reported that the English locale was not installed on the specified node.
// *Action: The English locale must be installed. Issue 'pkg change-facet locale.en_US=true' to install it.
/
10172, TASK_CHECK_EN_LOCALE_SOL11_UNDETERMINED_VFAIL, "An error occurred when trying to determine if English locale is installed on node \"{0}\"."
//  *Cause: An error ocurred while executing the command 'pkg facet -H *locale.en*'. Installation of English locale on the node could not be verified.
// *Action: English locale must be installed. Consult the OS documentation or System Administrator to diagnose and fix the issue with the command 'pkg facet -H *locale.en*' and install the locale using the command 'pkg change-facet locale.en_US=true'.
/
10173, TASK_CHECK_EN_LOCALE_INSTALLED_SUCC, "North America region (nam) or English locale is installed on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
10174, ELEMENT_NAME_CHECK_EN_LOCALE, "English locale installed"
// *Document: NO
//  *Cause:
// *Action:
/
10175, DESC_CHECK_EN_LOCALE, "Checks that the English locale is installed"
// *Document: NO
//  *Cause:
// *Action:
/
10180, ELEMENT_NAME_CHECK_MOUNT_OPTIONS, "File system mount options for path {0}"
// *Document: NO
//  *Cause:
// *Action:
/
10181, DESC_CHECK_MOUNT_OPTIONS, "Checks the file system mount options"
// *Document: NO
//  *Cause:
// *Action:
/
10182, CHECK_MOUNT_OPTIONS_PASSED, "Check for file system mount options passed for path \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
10183, FS_MOUNT_OPTION_WITH_NOSUID, "File system path \"{0}\" is mounted with 'nosuid' option on node \"{1}\"."
//  *Cause: The identified file system path is mounted with the 'nosuid' option 
//          on the indicated node. This mount option creates permission problems 
//          in the cluster.
// *Action: Ensure that the identified file system path is not mounted with 'nosuid' option.
/
10184, FAIL_GET_FILE_SYSTEM, "Could not find file system for the path \"{0}\" using command \"{1}\" on node \"{2}\""
//  *Cause: An error occurred while determining the file system for the identified path on the indicated node.
// *Action: Make sure that the identified path is a valid absolute path on the indicated node.
/
10185, REPORT_TEXT_ASM_INSTANCE, "ASM(Instance)"
// *Document: NO
//  *Cause:
// *Action:
/
10186, REPORT_ASM_REQ_CHECKS, "ASM requirements"
// *Document: NO
//  *Cause:
// *Action:
/
10187, REPORT_ASM_RECO_CHECKS, "ASM recommendations"
// *Document: NO
//  *Cause:
// *Action:
/
10200, REPORT_APPLICATION_CLUSTER_REQ_CHECKS, "Oracle Clusterware Application Cluster requirements"
// *Document: NO
//  *Cause:
// *Action:
/
10201, REPORT_EMPTY_TASK_LIST_APPLICATION_CLUSTER_REQ, "Oracle Clusterware Application Cluster manadatory checks are not available for version \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
10210, ERROR_XML_REPORT_WRITING_FILE, "error writing to the output file \"{0}\" for verification type \"{1}\": \"{2}\""
//  *Cause: An error was encountered while writing the indicated output file.
// *Action: Correct the problem indicated in the accompanying messages, then reissue the original command.
/
10211, ERROR_XML_REPORT_WRITING, "An error occurred while writing the report."
//  *Cause: An error was encountered while writing one or more output files.
// *Action: Correct the problem indicated in the accompanying messages, then reissue the original command.
/
10212, REPORT_TEXT_ASM_DISKGROUP, "ASM disk group"
// *Document: NO
//  *Cause:
// *Action:
/
10213, REPORT_TEXT_ASM_DISK, "ASM disk"
// *Document: NO
//  *Cause:
// *Action:
/
10214, REPORT_TEXT_ASM_CHECK, "ASM check"
// *Document: NO
//  *Cause:
// *Action:
/
10230, ELEMENT_NAME_CHECK_SYSTEMD_LOGIN_IPC_PARAM, "Systemd login manager IPC parameter"
// *Document: NO
//  *Cause:
// *Action:
/
10231, DESC_CHECK_SYSTEMD_LOGIN_IPC_PARAM, "Checks systemd login manager parameter 'RemoveIPC' is disabled"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'RemoveIPC' 'no'
10232, CHECK_SYSTEMD_LOGIN_IPC_SETTINGS_ENABLED, "Systemd login manager parameter 'RemoveIPC' is enabled in the configuration file \"{0}\" on node \"{1}\". [Expected=\"no\"; Found=\"{2}\"]"
//  *Cause: The 'RemoveIPC' systemd login manager parameter was found to be 
//          enabled on the indicated node. Enabling this parameter causes
//          termination of Automatic Storage Management (ASM) instances when 
//          the last oracle/grid user session logs out.
// *Action: Set the 'RemoveIPC' systemd login manager parameter to 'no' in the
//          identified configuration file on the indicated node.
/
// Translator: do not translate 'RemoveIPC' 'RemoveIPC=no'
10233, CHECK_SYSTEMD_LOGIN_IPC_SETTINGS_FAILED, "Systemd login manager parameter 'RemoveIPC' entry does not exist or is commented out in the configuration file \"{0}\" on node \"{1}\". [Expected=\"no\"]"
//  *Cause: The 'RemoveIPC' systemd login manager parameter entry was not found
//          or was commented out in the identified configuration file on the 
//          indicated node. By default this parameter is enabled and it causes
//          termination of Automatic Storage Management (ASM) instances when 
//          the last oracle/grid user session logs out.
// *Action: Add the entry 'RemoveIPC=no' to the identified configuration file  
//          on the indicated node.
/
10234,ELEMENT_NAME_CHECK_AFD_CONFIG , "ASM Filter Driver configuration"
// *Document: NO
//  *Cause:
// *Action:
/
10235, DESC_CHECK_AFD_CONFIG, "Checks ASM Filter Driver configuration"
// *Document: NO
//  *Cause:
// *Action:
/
10236, AFD_CONFIG_CHECK_PASSED, "ASM Filter Driver configuration check passed on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
10237, AFD_CONFIG_FOUND_PREINSTALL, "Existence of files \"{1}\" is not expected on node \"{0}\" before Clusterware installation or upgrade."
//  *Cause: The indicated files were found on the specified node.
// *Action: Remove the indicated files and retry.  
/
10238, EFAIL_ASM_CONFIG_CHECK, "Error occurred while running commands \"{1}\" on node \"{0}\" to check for ASM Filter Driver configuration"
//  *Cause: An attempt to check for ASM Filter Driver configuration by running
//          the indicated commands failed. 
// *Action: Ensure that the identified commands exist on the indicated node 
//          and that the current user has read/execute permissions and retry.
/
10239, AFD_DRIVER_FOUND_PREINSTALL, "ASM Filter Driver \"{1}\" is not expected to be loaded on node \"{0}\" before Clusterware installation or upgrade."
//  *Cause: An attempt to install or upgrade Clusterware on the indicated node
//          was rejected because the indicated ASM Filter Driver was already
//          loaded.
// *Action: Refer to OS documentation to remove the indicated driver and 
//          retry the operation.
/
10240,ELEMENT_NAME_CHECK_NFSSERVER_OPTIONS , "NFS server export options"
// *Document: NO
//  *Cause:
// *Action:
/
10241, DESC_CHECK_NFSSERVER_OPTIONS, "Checks NFS server export options"
// *Document: NO
//  *Cause:
// *Action:
/
10242, NFSSERVER_OPTIONS_CHECK_PASSED, "NFS server export options check passed on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
10243, VFAIL_NFSSERVER_OPTIONS_CHECK, "Failed to mount \"{0}\" at location \"{1}\" with NFS mount options \"{2}\"."
//  *Cause: An attempt to mount the indicated file system at the indicated 
//          location with the indicated mount options failed because the 
//          'insecure' NFS export option was not used. The 'insecure' option 
//          was required for Oracle Direct NFS to make connections using a 
//          non-privileged source port.
// *Action: Ensure that the indicated network file system is exported with the
//          "insecure" option and retry the operation. If the retry fails, 
//          examine the accompanying error message, resolve the problems
//          indicated there, and then retry the operation again. 
/
10248, FILE_NOT_EXIST_OR_NOT_ACCESSIBLE, "The file \"{0}\" either does not exist or is not accessible on node \"{1}\". "
//  *Cause: A Cluster Verification Utility (CVU) operation could not complete, 
//          because the indicated file was not accessible on the node shown.
// *Action: Ensure that the indicated file exists and can be accessed
//          on the indicated node.
/
10250, ELEMENT_NAME_CHECK_PATH_ACL_ATTRIBUTES, "Access control attributes for {0}"
// *Document: NO
//  *Cause:
// *Action:
/
10251, DESC_CHECK_PATH_ACL_ATTRIBUTES, "This check verifies that the permissions, owner and group requirements are met for the given path"
// *Document: NO
//  *Cause:
// *Action:
/
10252, CHECK_PATH_ACL_ATTRIBUTES_PASSED, "Access control attributes check for path \"{0}\" passed."
// *Document: NO
//  *Cause:
// *Action:
/
10253, CHECK_PATH_ACL_ATTRIBUTES_ERROR, "The path \"{0}\" either does not exist or is not accessible on node \"{1}\". "
//  *Cause: The Cluster Verification Utility (CVU) determined that the
//          indicated path was not accessible.
// *Action: Ensure that the indicated path exists and can be accessed
//          by the current user on the indicated node.
/
10254, CHECK_PATH_ACL_ATTRIBUTES_NO_READ_PERMISSION, "The path \"{0}\" does not have read permission for the current user on node \"{1}\"."
//  *Cause: A check for access control attributes found that the indicated 
//          path did not have read permission for the current user on the 
//          indicated node.
// *Action: Ensure that the current user has read permission for the indicated
//          path on the indicated node, and then retry the operation.
/
10255, CHECK_PATH_ACL_ATTRIBUTES_NO_WRITE_PERMISSION, "The path \"{0}\" does not have write permission for the current user on node \"{1}\"."
//  *Cause: A check for access control attributes found that the indicated
//          path did not have write permission for the current user on the 
//          indicated node.
// *Action: Ensure that the current user has write permission for the 
//          indicated path on the indicated node, and then retry the operation.
/
10256, CHECK_PATH_ACL_ATTRIBUTES_NO_EXECUTE_PERMISSION, "The path \"{0}\" does not have execute permission for the current user on node \"{1}\"."
//  *Cause: A check for access control attributes found that the indicated
//          path did not have execute permission for the current user on the 
//          indicated node.
// *Action: Ensure that the current user has execute permission for the 
//          indicated path on the indicated node, and then retry the operation.
/
10257, CHECK_PATH_ACL_ATTRIBUTES_PERMS_FAILED, "The path \"{0}\" permissions did not match the expected octal value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for access control attributes found that the permissions of 
//          the indicated path on the indicated node were different from the 
//          required permissions.
// *Action: Change the permissions of the indicated path to match the required 
//          permissions.
/
10258, CHECK_PATH_ACL_ATTRIBUTES_OWNER_PERMS_FAILED,"The path \"{0}\" permissions for owner did not match the expected octal value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for access control attributes found that the owner 
//          permissions of the indicated path on the indicated node were 
//          different from the required permissions.
// *Action: Change the owner permissions of the indicated path to match the 
//          required permissions.
/
10259, CHECK_PATH_ACL_ATTRIBUTES_GROUP_PERMS_FAILED,"The path \"{0}\" permissions for group did not match the expected octal value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for access control attributes found that the group 
//          permissions of the indicated path on the indicated node were 
//          different from the required permissions.
// *Action: Change the group permissions of the indicated path to match the 
//          required permissions.
/
10260, CHECK_PATH_ACL_ATTRIBUTES_OTHER_PERMS_FAILED,"The path \"{0}\" permissions for others did not match the expected octal value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for access control attributes found that the others 
//          permissions of the indicated path on the indicated node were 
//          different from the required permissions.
// *Action: Change the others permissions of the indicated path to match the 
//          required permissions.
/
10261, CHECK_PATH_ACL_ATTRIBUTES_OWNER_FAILED, "The path \"{0}\" owner did not match the expected value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for access control attributes found that the owner of the 
//          indicated path on the indicated node was different from the 
//          required owner.
// *Action: Change the owner of the indicated path to match the required owner.
/
10262, CHECK_PATH_ACL_ATTRIBUTES_GROUP_FAILED, "The path \"{0}\" group did not match the expected value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for access control attributes found that the group of the 
//          indicated path on the indicated node was different from the 
//          required group.
// *Action: Change the group of the indicated path to match the required group.
/
10263,ELEMENT_NAME_CHECK_ENTITLED_CAPACITY , "Logical partition capacity entitlement check"
// *Document: NO
//  *Cause:
// *Action:
/
10264, DESC_CHECK_ENTITLED_CAPACITY, "Checks logical partition capacity entitlement"
// *Document: NO
//  *Cause:
// *Action:
/
10265, CHECK_ENTITLED_CAPACITY_PASSED, "Logical partition capacity entitlement check passed on node \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
10266, EFAIL_CHECK_ENTITLED_CAPACITY, "Error occurred while running command \"{1}\" on node \"{0}\" to check for logical partition capacity entitlement."
//  *Cause: An attempt to check for logical partition entitled capacity by
//          running the indicated command failed. The accompanying messages
//          provide detailed failure information. 
// *Action: Examine the accompanying messages, resolve the identified issues,
//          and then retry the operation after ensuring that the identified
//          command exists on the indicated node and that the current user
//          has permission to execute the command. 
/
10269, VFAIL_CHECK_ENTITLED_CAPACITY, "Logical partition entitled processing capacity is configured with a value less than expected on node \"{0}\".[Expected = \"{2}\" ; Found = \"{1}\"]"
//  *Cause: A check for capacity entitlement on the indicated node found that 
//          the entitled processing capacity is less than the expected value.
// *Action: Refer to OS documentation to configure capacity entitlement of the
//          logical partition to more than the indicated expected value, and 
//          then retry the operation.        
/
