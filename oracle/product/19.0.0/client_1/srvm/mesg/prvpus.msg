// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrvpMsg.msg
//
// DESCRIPTION
//    Message file for oracle.ops.verification.framework.param package
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     ptare       08/02/18 - Fix Bug#28445295 handle null input for -time_out
//     shhirema    03/12/18 - Bug 27230576: changes for pre, post patch checks
//     shhirema    09/27/16 - Bug 22695106: add message for -allnodes option
//     maboddu     04/11/16 - Fix bug#22900458 - add error msg for failure
//                            group disk mismatch
//     shhirema    03/28/16 - Bug 22978113: add description for -afdconfig
//     maboddu     11/06/15 - Fix bug#19457720 - add error message for invalid
//                            -asm and -t combination
//     nvira       05/20/15 - add description for reference baseline option
//     nvira       09/09/15 - update Application Cluster to Oracle Clusterware
//                            Application Cluster
//     dsaggi      06/26/15 - Error out coexistence of -asm and -s options
//     iestrada    06/04/15 - Fix bug 20300358. Modify -d option usage
//     nvira       03/23/15 - add message for invalid db name and collection
//                            type combination
//     jgagarci    04/09/15 - Fix BUG#19645955 - add invalid variable value
//                            message
//     shhirema    03/19/15 - Add messages for destination service user
//     maboddu     02/09/15 - Fix bug 20379924 - Add description for osoper
//                            group
//     iestrada    02/04/15 - add messages for application cluster stage
//     jgagarci    11/26/14 - add DSC_RESPONSE_FILE message content
//     shhirema    11/21/14 - add healthcheck asm option
//     xesquive    08/14/14 - Fix bug19376248 change release number
//     prajm       04/28/14 - Fix for bug #18669841 - Typo in patchset
//     prajm       04/09/14 - Fix Bug#6507538 Update message text for storage
//                            id list
//     iestrada    03/25/14 - Fix bug 18456847, change DSC_BASELINE_SAVEDIR message
//     nvira       03/18/14 - bug fix 18386491, fix typo in -baseline
//                            description
//     maboddu     02/27/14 - Fix bug#18311299
//     nvira       12/30/13 - review comments
//     nvira       12/23/13 - review comments
//     nvira       12/16/13 - bug fix 17823729, add message for -d combined
//                            with -collect cluster
//     iestrada    12/15/13 - Fix bug 17712790 'cluvfy comp clu' deprecated
//     nvira       12/04/13 - add message for -savedir mandatory
//     xesquive    11/20/13 - gns help usage bug17778517
//     spavan      10/31/13 - fix bug16076001 - add messages for retry
//     kfgriffi    10/25/13 - Fix bug 17631033 - modify 'eth' usage
//     spavan      10/22/13 - fix bug16655828
//     iestrada    10/07/13 - Fix bug 16386876
//     dsaggi      09/18/13 - Incorporate review comments
//     dsaggi      09/10/13 - XbranchMerge dsaggi_bug-16552441 from
//                            st_has_11.2.0
//     shshrini    06/13/13 - Fixing the bug 16798558
//     ptare       05/30/13 - Add DSC_ASMDBAGRP
//     lureyes     03/13/13 - Change ERROR_MULTI_ORAHOME id number
//     xesquive    01/24/13 - add msg in gns check
//     nvira       11/19/12 - add arguments for root script and resource
//     ptare       10/10/12 - Add message for duplicates in node list
//     spavan      10/05/12 - fix bug9966385 - update help message
//     rtamezd     09/11/12 - Fix bug 14115195
//     kfgriffi    09/20/12 - Add nodeadd specific messages
//     dsaggi      07/16/12 - Add farmcheck component
//     nvira       08/23/12 - add message for conflicting/missing arguments to
//                            command line
//     kfgriffi    08/21/12 - Add nodeadd/nodedel nodelist descriptions
//     dsaggi      08/16/12 - fix 13639888 : validate OSBACKUP, OSDG, OSKM groups
//     spavan      08/08/12 - fix bug14458807 error if DHCP port is less than
//                            1024 and root user not specified
//     ptare       07/24/12 - Fix Bug#14313428 Usage text for comp health check
//     xesquive    07/04/12 - replace 'Windows service user' for 'Oracle home
//                            user' bug 14004313
//     ptare       05/22/12 - Add message for fixup no execution option
//     spavan      04/26/12 - fix bug13648588
//     nvira       04/12/12 - add message "See usage for detail
//     nvira       12/15/11 - add messages for comp ssa 12c cli changes
//     nvira       04/10/12 - add message for -sshonly
//     dsaggi      03/08/12 - support nodelist for OLR component check
//     xesquive    02/08/12 - add the message INVALID_OPTION_WITH_VERSION
//     xesquive    02/07/12 - Bug fix 13566257
//     ptare       01/26/12 - Update for sudo/pbrun location message
//     ptare       12/19/11 - Update DSC_ASMADMGRP
//     spavan      11/15/11 - allow subnet specification in dhcp commands
//     spavan      10/21/11 - allow comps to run as root
//     agorla      10/11/11 - add networks option for nodecon
//     ptare       09/23/11 - Fixup argument mode and user messages
//     nvira       08/01/11 - add message for valid version
//     spavan      07/25/11 - add credential file for client cluster
//     ptare       07/11/11 - Fixup Proj
//     spavan      05/25/11 - add messages for project 19732 - winsecurity
//     nvira       04/20/11 - add messages for -upgrade
//     agorla      03/28/11 - bug#11872591 - fix
//     dsaggi      02/10/11 - fix bug 11699212
//     nvira       01/24/11 - change description for comp ssa
//     narbalas    01/20/11 - comp freespace
//     spavan      01/15/11 - fix bug10281529
//     spavan      01/12/11 - fix bug10124817
//     kfgriffi    12/13/10 - Fix bug 10376499
//     agorla      12/09/10 - add -network option for '-pre crsinst'
//     nvira       10/14/10 - add message for invalid symbol
//     nvira       09/10/10 - add messages for comp best practice
//     agorla      05/31/10 - bug#6974080 - add -file description
//     nvira       04/13/10 - add description for VIP
//     nvira       04/26/10 - add message for -noctss
//     spavan      04/15/10 - fix bug9498093
//     spavan      11/13/09 - add comp gns messages
//     kfgriffi    11/10/09 - Update Voting Disk descriptions
//     nvira       11/03/09 - add messages for new cl syntax parser
//     nvira       06/08/09 - add message for comp software
//     nvira       06/08/09 - add message for comp software description
//     shmubeen    06/04/09 - modify DESC_STAGE_PRE_CRSINST
//     shmubeen    03/09/09 - bug# 8309339 , rename USM to ACFS(ASM Cluster
//                            File System).
//     nvira       12/03/08 - add description for oracle file type CLI flag
//     shmubeen    11/18/08 - bug 4467063 - change messages for
//                            DSC_VOTINGDISK,DSC_OCRLOCATION
//     sravindh    07/31/08 - Add vdisk component text
//     sravindh    05/08/08 - Review comments
//     kfgriffi    05/01/08 - Add DSC_STAGE_POST_NODEDEL
//     dsaggi      03/20/08 - add -fixup option
//     sravindh    04/02/08 - CTSS component
//     dsaggi      02/28/08 - add ohasd check
//     sravindh    02/22/08 - Fix dummy message lines
//     kfgriffi    12/16/07 - Add SCAN component
//     dsaggi      12/05/07 - add messages for gpnp and gns components
//     sravindh    12/06/07 - Fix ASM diskgroup message
//     sravindh    11/12/07 - Addituions for ASM checks
//     sravindh    10/19/07 - Additions for USM checks
//     nvira       10/08/07 - review comments
//     nvira       09/28/07 - add messages for software distribution comp
//     kfgriffi    07/27/07 - Add node add/delete messages
//     kfgriffi    01/16/07 - Add SIHA descriptions
//     mnijasur    02/17/06 - fix 4358826 - change error message
//     smishra     04/21/05 - message modified(testing->verification)
//     smishra     04/15/05 - multi product error added 
//     smishra     03/02/05 - admprv msg changed 
//     smishra     12/27/04 - nodeapp desc modified to add nodelist 
//     smishra     12/17/04 - default messages added 
//     smishra     11/18/04 - stage usage text modified 
//     smishra     09/28/04 - nodeapp msg added 
//     dsaggi      06/04/04 - dsaggi_fix_nls
//     dsaggi      06/03/04 - modify based on review comments 
//     smishra     05/26/04 - Initial messages added
//     dsaggi      05/25/04 - Creation
//  */
// 
// PACKAGE=package oracle.ops.verification.resources;
// MSGIDTYPE=interface
1000, ERROR_UNINITIALIZED_PM, "Parameter manager has not been initialized"
//  *Cause: 
// *Action: 
/
1001, ERROR_INVALID_SYNTAX, "Invalid command line syntax."
//  *Cause: The command was rejected because the specified syntax was incorrect.
// *Action: Look at the usage provided for this command and use the correct syntax.
/
1002, ERROR_NO_NODELIST, "A nodelist must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1003, ERROR_NO_STORAGEIDLIST, "A storage ID list must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1004, ERROR_NO_FILESYSTEM, "A filesystem must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1005, ERROR_NO_CRSHOME, "CRS Home must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1006, ERROR_NO_ORAHOME, "Oracle Home must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1007, ERROR_NO_PRODUCT, "A product must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1008, ERROR_IF_OR_IP, "Either an interface list or an IP address list must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1009, ERROR_NUM_IP_MISMATCH, "The number of nodes provided does not match the number of IP addresses provided. Please provide matching number of IP-addresses."
//  *Cause: 
// *Action: 
/
1010, ERROR_NO_STORAGELOC, "A storage location must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1011, ERROR_NO_DISKSPACE, "Disk space must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1012, ERROR_NO_OPERATION, "An operation must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1013, ERROR_MULTI_REFNODE, "Reference node cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1014, ERROR_MULTI_STORAGELOC, "Storage location cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1015, ERROR_MULTI_OSDBAGRP, "Osdba must be a single group name. See usage for detail."
//  *Cause: 
// *Action: 
/
1016, ERROR_MULTI_ORAINVGRP, "Oracle inventory group must be a single group name. See usage for detail."
//  *Cause: 
// *Action: 
/
1017, ERROR_MULTI_SRCNODE, "Source node cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1018, ERROR_MULTI_OPERATION, "Operation cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1019, ERROR_INVALID_OPERATION, "Invalid operation. Please provide a valid operation. See usage for detail."
//  *Cause: 
// *Action: 
/
1020, ERROR_MULTI_FILESYSTEM, "Filesystem cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
// *Note:  MESSAGE# 1021 IS UNUSED IN 11.2 . IT HAS BEEN  USED FOR 11.1 AND EARLIER RELEASES. 
1021, ERROR_MULTI_OCRLOC, "OCR location cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
// *Note:  MESSAGE# 1022 IS UNUSED IN 11.2 . IT HAS BEEN USED FOR 11.1 AND EARLIER RELEASES.
1022, ERROR_MULTI_VOTINGDISK, "Voting disk must be a single location. See usage for detail."
//  *Cause: 
// *Action: 
/
1023, ERROR_MULTI_CRSHOME, "A single CRS home must be specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1024, ERROR_INVALID_PORTNUM, "Invalid port numbers were specified; provide valid port numbers. See usage for detail."
//  *Cause: 
// *Action: 
/
1025, ERROR_MULTI_DBNAME, "DB name cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1026, ERROR_INVALID_DISKSPACE, "Invalid disk space specification syntax. See usage for detail."
//  *Cause: 
// *Action: 
/
1027, ERROR_INVALID_PRODUCT, "Invalid product. Please provide a valid product name. See usage for detail."
//  *Cause: 
// *Action: 
/
1028, ERROR_IP_AND_ALL, "IP address list can not be specified with 'all' option for the nodelist. See usage for detail."
//  *Cause: 
// *Action: 
/
1029, ERROR_DISKSPACE_MAXLIMIT, "Can not handle given disk space size."
//  *Cause: 
// *Action: 
/
1030, ERROR_NUMERIC_NODELIST, "An IP address can not be used as the nodename. See usage for detail."
//  *Cause: 
// *Action: 
/
1031, ERROR_MULTI_PRODUCT, "Product cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1032, ERROR_MULTI_ORAHOME, "Oracle Home cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1033, ERROR_NO_ASMFLAG, "The \"-asm\" flag is required with the \"-asmgrp\" or \"-asmdev\" options."
//  *Cause: 
// *Action: 
/
1034, ERROR_SERVICE_OR_PROFILE, "Either -service or -profile option should be specified."
//  *Cause: 
// *Action: 
/
1035, ERROR_MULTI_FIXUPDIR, "Fixup directory cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1036, ERROR_NO_FIXUPFLAG, "\"-prompt\" option must follow a \"-fixup\" flag."
//  *Cause: 
// *Action: 
/
1037, ERROR_MISSING_OPTION_VAL, "The value of \"{0}\" option is missing. See usage for detail."
//  *Cause: 
// *Action: 
/
1038, ERROR_MULTI_ASMGRP, "asmgrp must be a single group name. See usage for detail."
//  *Cause: 
// *Action: 
1039, ERROR_STORAGE_FILE_TYPE, "Invalid storage file type specified. See usage for detail."
//  *Cause: 
// *Action: 
/
1040, ERROR_NO_CLUSTERNAME, "-clustername option should be specified"
// *Document: NO
//  *Cause:
// *Action:
/
1041, ERROR_PORT_NOT_NUMERIC, "value specified \"{0}\" for command line option '-port' is not a number"
//  *Cause: A non-numeric value was specified for command line option '-port'.
// *Action: Specify a numeric value for the command line option '-port'.
/
1042, ERROR_GNS_VIP_ADDRESS, "GNS virtual IP address should be in the format {<IP_name>|<IP_address>}/<net_mask>/<interface_name>. IP_name is a name, which resolves to an IP. IP_address is an IP address. net_mask is the subnet mask for the IP. interface_name is the interface on which to start the IP."
// *Document: NO
//  *Cause:
// *Action:
/
1043, ERROR_NO_NODELIST_OR_CONFFILE, "Either -n or -file or -upgrade command line option must be specified"
// *Document: NO
//  *Cause:
// *Action:
/
1044, ERROR_CONFFILE_OPEN, "Error occurred while opening configuration file \"{0}\""
//  *Cause: Configuration file could not be opened. It either does not exist or you are not allowed read access.
// *Action: Provide a usable configuration file.
/
1045, ERROR_MULTI_SAVEDIR, "Save directory cannot contain multiple values. See usage for detail."
//  *Cause: 
// *Action: 
/
1046, ERROR_NO_SAVEFLAG, "\"-savedir\" option must follow a \"-save\" flag."
//  *Cause: 
// *Action: 
/
1047, ERROR_CLUSTER_DBNAME_COMBINATION, "\"-db <db_unique_name>\" cannot be specified along with \"-collect cluster\"."
//  *Cause: 
// *Action: 
/
1048, ENTER_SERVICE_PWD, "Specify password for Windows user \"{0}\":"
// *Document: NO
//  *Cause:
// *Action:
/
1049, PASSWORD_READ_FAILED_ROOT, "Failed to read the root user password from standard input"
//  *Cause: An attempt to read the password for the root user from standard input failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1050, PASSWORD_READ_FAILED_SUDO, "Failed to read the password for 'sudo' user \"{1}\" from standard input"
//  *Cause: An attempt to read the password for specified 'sudo' user from standard input failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1051, PASSWORD_READ_FAILED_PBRUN, "Failed to read the password for 'pbrun' user \"{1}\" from standard input"
//  *Cause: An attempt to read the password for specified 'pbrun' user for from standard input failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1052, USER_INSUFFICIENT_PERMISSION_NON_ROOT, "Command line option -method required when -dhcpport is less than 1024. The DHCP port value used is \"{0}\"."
//  *Cause: An attempt to check DHCP was rejected because the user did not have 
//          sufficient authority to listen on the specified DHCP port.
// *Action: DHCP checks when command line option -dhcpport is less than 1024 can
//          be run only as root user.  When command line option -dhcpport is not
//          specified the default value of DHCP port used is 67. Make sure that 
//          required credentials are supplied using the command line option -method.
/
1053, ERROR_MULTI_ASMDBAGRP, "-asmdbagrp must be a single group name. See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
1055, ERROR_CLUSTER_DBHOME_COMBINATION, "'-d <oracle_home>' cannot be specified in combination with '-collect cluster' option."
//  *Cause: The specified command was rejected because it specified '-d <oracle_home>' with an incompatible '-collect' option.  The option '-d <oracle_home>' can only be specified with '-collect database' or '-collect all'.
// *Action: Remove the '-d <oracle_home>' specification or change the '-collect' specification.
/
1056, ERROR_COLLECT_DBNAME_COMBINATION, "'-db <db_unique_name>' cannot be combined with the specified '-collect' option."
//  *Cause: The specified command was rejected because it specified '-db <db_unique_name>' with an incompatible '-collect' option.  The option '-db <db_unique_name>' can only be specified with '-collect database' or '-collect all'.
// *Action: Remove the '-db <db_unique_name>' specification or change the '-collect' specification.
/
1057, ERROR_COLLECT_DBHOME_COMBINATION, "'-d <oracle_home>' cannot be combined with the specified '-collect' option."
//  *Cause: The specified command was rejected because it specified '-d <oracle_home>' with an incompatible '-collect' option.  The option '-d <oracle_home>' can only be specified with '-collect database' or '-collect all'.
// *Action: Remove the '-d <oracle_home>' specification or change the '-collect' specification.
/
1058, ERROR_ASM_S_COMBINATION, "invalid combination of '-asm' option with '-s' option."
//  *Cause: A submitted command was rejected because it specified the '-asm' option with the '-s' option. The options '-asm' and '-s' are mutually exclusive.
// *Action: Retry the command without specifying the '-asm' or '-s' option or by specifying either the '-asm' or '-s' option, but not both.
/
1059, ERROR_ASM_T_COMBINATION, "invalid combination of '-asm' option with '-t software' option"
//  *Cause: A submitted command was rejected because it specified the '-asm' 
//          option with the '-t software' option. The ASM disks are not 
//          suitable for storing Oracle RAC database software executables.
// *Action: Retry the command specifying the '-asm' option without 
//          the '-t software' option.
/
1060, WARNING_DUPLICATE_NODES_IN_NODELIST, "Ignoring multiple specification of nodes \"{0}\". Checks will be performed on nodes \"{1}\""
// *Document: NO
//  *Cause: 
// *Action: 
/
1061, WARNING_FQDN_NODES_IN_NODELIST, "Ignoring domains for the following node names specified with domain \"{0}\". Verification will proceed with nodes \"{1}\""
//  *Cause:  Node names were specified with domain names, and the domain names were ignored. 
// *Action:  Make sure that node names are specified without domain names.
/
1062, ERROR_ATLEAST_ONE_MUST_BE_SPECIFIED, "One of '{0}' options must be specified. See usage for detail."
//  *Cause:  The specified command was rejected because none of the options from the indicated list was specified. One or more options from the indicated list must be specified.
// *Action:  Retry the command specifying the missing option. 
/
2000, DSC_NODELIST, "is the comma-separated list of non-domain qualified node names on which the test should be conducted."
// *Document: NO
//  *Cause: 
// *Action: 
/
2001, DSC_NODELIST_ALL, "If \"all\" is specified, then all the nodes in the cluster will be used for verification."
//  *Cause: 
// *Action: 
/
2002, DSC_REFNODE, "is the node which will be used as reference."
//  *Cause: 
// *Action: 
/
2003, DSC_SRCNODE, "is the node from which the reachability test will be performed."
//  *Cause: 
// *Action: 
/
2004, DSC_CFS_OH, "indicates oracle home is on a shared filesystem."
//  *Cause: 
// *Action: 
/
2005, DSC_STORAGELIST, "is the comma-separated list of storage paths."
//  *Cause: 
// *Action: 
/
2006, DSC_STORAGELOCATION, "is the storage path."
//  *Cause: 
// *Action: 
/
2007, DSC_DISKSPACE, "is the required disk space, in units of bytes(B),kilobytes(K),megabytes(M) or gigabytes(G)."
//  *Cause: 
// *Action: 
/
2008, DSC_VOTINGDISK, "is the list of comma-separated paths for voting disks."
//  *Cause: 
// *Action: 
/
2009, DSC_OCRLOCATION, "is the list of comma-separated paths for OCR locations or files."
//  *Cause: 
// *Action: 
/
2010, DSC_CRSHOME, "is the location of CRS home."
//  *Cause: 
// *Action: 
/
2011, DSC_PROD_CRS, "for Oracle Clusterware product"
//  *Cause: 
// *Action: 
/
2012, DSC_PROD_DATABASE, "for Oracle Real Application Cluster product"
//  *Cause: 
// *Action: 
/
2013, DSC_RELEASE, "is the release number of the product."
//  *Cause: 
// *Action: 
/
2014, DSC_ORAHOME, "is the location of the oracle home."
//  *Cause: 
// *Action: 
/
2015, DSC_OSDBAGRP, "is the name of the OSDBA group. The default is \"dba\"."
//  *Cause: 
// *Action: 
/
2016, DSC_ORAINVGRP, "is the name of the Oracle inventory group. The default is \"oinstall\"."
//  *Cause: 
// *Action: 
/
2017, DSC_INTERFACELIST, "is the comma-separated list of interface names."
//  *Cause: 
// *Action: 
/
2018, DSC_IPADDRESSLIST, "is the comma-separated list of IP addresses. The option 'all' for nodelist can not be specified with IP address list option."
//  *Cause: 
// *Action: 
/
2019, DSC_FILESYSTEM, "is the name of the file system."
//  *Cause: 
// *Action: 
/
2020, DSC_OPERATION_UE, "checks user equivalence between the nodes."
//  *Cause: 
// *Action: 
/
2021, DSC_OPERATION_CI, "checks administrative privileges for installing CRS."
//  *Cause: 
// *Action: 
/
2022, DSC_OPERATION_DI, "checks administrative privileges for installing RAC database."
//  *Cause: 
// *Action: 
/
2023, DSC_OPERATION_DC, "checks administrative privileges for configuring database."
//  *Cause: 
// *Action: 
/
2024, DSC_STAGE_POST_HWOS, "post-check for hardware and operating system"
//  *Cause: 
// *Action: 
/
2025, DSC_STAGE_PRE_CFS, "pre-check for CFS setup"
//  *Cause: 
// *Action: 
/
2026, DSC_STAGE_POST_CFS, "post-check for CFS setup"
//  *Cause: 
// *Action: 
/
2027, DSC_STAGE_PRE_CLUSVC, "pre-check for CRS installation"
//  *Cause: 
// *Action: 
/
2028, DSC_STAGE_POST_CLUSVC, "post-check for CRS installation"
//  *Cause: 
// *Action: 
/
2029, DSC_STAGE_PRE_DBINST, "pre-check for database installation"
//  *Cause: 
// *Action: 
/
2030, DSC_STAGE_PRE_NODEAPP, "pre-check for node application creation"
//  *Cause: 
// *Action: 
/
2031, DSC_STAGE_PRE_DBCFG, "pre-check for database configuration"
//  *Cause: 
// *Action: 
/
2032, DSC_STAGE_PRE_NODEADD, "pre-check for node addition."
//  *Cause: 
// *Action: 
/
2033, DSC_STAGE_POST_NODEADD, "post-check for node addition."
//  *Cause: 
// *Action: 
/
2034, DSC_STAGE_POST_STORADD, "post-check for storage addition."
//  *Cause: 
// *Action: 
/
2035, DSC_STAGE_POST_NETMOD, "post-check for network modification."
//  *Cause: 
// *Action: 
/
2036, TXT_VALID_STAGES, "Valid stage options and stage names are:"
//  *Cause: 
// *Action: 
/
2037, TXT_VALID_COMPS, "Valid components are:"
//  *Cause: 
// *Action: 
/
2038, DSC_COMP_NODEREACH, "checks reachability between nodes"
//  *Cause: 
// *Action: 
/
2039, DSC_COMP_NODECON, "checks node connectivity "
//  *Cause: 
// *Action: 
/
2040, DSC_COMP_CFS, "checks CFS integrity"
//  *Cause: 
// *Action: 
/
2041, DSC_COMP_SSA, "checks shared storage accessibility"
//  *Cause: 
// *Action: 
/
2042, DSC_COMP_SPACE, "checks space availability"
//  *Cause: 
// *Action: 
/
2043, DSC_COMP_SYS, "checks minimum system requirements"
//  *Cause: 
// *Action: 
/
2044, DSC_COMP_CLU, "checks cluster integrity"
//  *Cause: 
// *Action: 
/
2045, DSC_COMP_CLUMGR, "checks cluster manager integrity"
//  *Cause: 
// *Action: 
/
2046, DSC_COMP_OCR, "checks OCR integrity"
//  *Cause: 
// *Action: 
/
2047, DSC_COMP_CRS, "checks CRS integrity"
//  *Cause: 
// *Action: 
/
2048, DSC_COMP_ADMPRV, "checks administrative privileges"
//  *Cause: 
// *Action: 
/
2049, DSC_COMP_PEER, "compares properties with peers"
//  *Cause: 
// *Action: 
/
2050, DSC_COMP_NODEAPP, "checks node applications existence"
//  *Cause: 
// *Action: 
/
2051, ERROR_REFNODE_VS_REFNODE, "Reference node cannot be compared against itself. Provide a nodelist excluding the reference node."
//  *Cause: 
// *Action: 
/
2052, DSC_COMP_OLR, "checks OLR integrity"
//  *Cause: 
// *Action: 
/
2053, DSC_COMP_HA, "checks HA integrity"
//  *Cause: 
// *Action: 
/
2054, DSC_STAGE_PRE_HACONFIG, "pre-check for HA configuration"
//  *Cause: 
// *Action: 
/
2055, DSC_STAGE_POST_HACONFIG, "post-check for HA configuration"
//  *Cause: 
// *Action: 
/
2056, DSC_PROD_HA, "for Oracle High Availability product"
//  *Cause: 
// *Action: 
/
2057, DSC_COMP_SOFT, "checks software distribution"
//  *Cause: 
// *Action: 
/
2058, DSC_COMP_USM, "checks ACFS integrity"
//  *Cause: 
// *Action: 
/
2059, DSC_ASMADMGRP, "is the name of the OSASM group. The default is \"asmadmin\"."
//  *Cause: 
// *Action: 
/
2060, DSC_ASMDEVLIST, "is the list of devices planned to be used by ASM."
//  *Cause: 
// *Action: 
/
2061, DSC_ASMDISKGRP, "is a comma-separated list of ASM diskgroup(s) to be verified."
//  *Cause: 
// *Action: 
/
2062, DSC_SSH_ONLY, "checks user equivalence using SSH only, without falling back to RSH."
//  *Cause: 
// *Action: 
/
2063, DSC_ASMDBAGRP, "is the name of the ASMDBA group. The default is \"asmdba\"."
// *Document: NO
//  *Cause: 
// *Action: 
/
2064, DSC_ASMOPERGRP, "is the name of the ASMOPER group."
// *Document: NO
//  *Cause:
// *Action:
/
2067, DSC_STAGE_PRE_USMCFG, "pre-check for ACFS Configuration."
//  *Cause: 
// *Action: 
/
2068, DSC_STAGE_POST_USMCFG, "post-check for ACFS Configuration."
//  *Cause: 
// *Action: 
/
2069, DSC_COMP_ASM, "checks ASM integrity"
//  *Cause: 
// *Action: 
/
2070, DSC_GPNP_SRV, "checks whether GPnP Service is up and running."
//  *Cause: 
// *Action: 
/
2071, DSC_GPNP_PRF, "checks the validity of GPnP profile."
//  *Cause: 
// *Action: 
/
2072, DSC_COMP_GPNP, "checks GPnP integrity"
//  *Cause: 
// *Action: 
/
2073, DSC_GNS_SRV, "checks whether all GNS responders are healthy."
//  *Cause: 
// *Action: 
/
2074, DSC_GNS_PRF, "checks the validity of GNS profile."
//  *Cause: 
// *Action: 
/
2075, DSC_COMP_GNS, "checks GNS integrity"
//  *Cause: 
// *Action: 
/
2076, DSC_COMP_SCAN, "checks SCAN configuration"
//  *Cause: 
// *Action: 
/
2077, DSC_COMP_OHASD, "checks OHASD integrity"
//  *Cause: 
// *Action: 
/
2078, DSC_COMP_CTSS, "checks Clock Synchronization"
//  *Cause:
// *Action:
/
2079, DSC_FIXUPDIR, "is the directory where fixup instructions will be generated. The default is CVU's work directory."
//  *Cause: 
// *Action: 
/
2080, DSC_STAGE_POST_NODEDEL, "post-check for node deletion."
// *Document: NO
//  *Cause: 
// *Action: 
/
2081, DSC_NOCTSS, "does not check Oracle Cluster Synch service, but checks only the platforms native clock synch service(such as NTP)"
// *Document: NO
//  *Cause:
// *Action:
/
2082, DSC_COMP_VDISK, "checks Voting Disk configuration and UDEV settings"
// *Document: NO
//  *Cause:
// *Action:
/
2083, DSC_ORACLE_FILE_TYPE, "is the type of oracle files that will be stored on the storage device."
//  *Cause: 
// *Action: 
/
2084, DSC_COMP_DNS, "checks DNS configuration"
// *Document: NO
//  *Cause:
// *Action:
/
2085, DSC_COMP_DHCP, "checks DHCP configuration"
// *Document: NO
//  *Cause:
// *Action:
/
2086, DSC_COMP_FREE_SPACE, "checks free space in CRS Home"
// *Document: NO
//  *Cause:
// *Action:
/
2087, DSC_ASM_ALL_DEVICE_LIST, "discover all storage suitable for use by ASM"
// *Document: NO
//  *Cause:
// *Action:
/
// NOTE : The following message is a help description for the parameter <asm_dev_list> 
//        The parameter <asm_dev_list> precedes this message on CLI
2088, DSC_SSA_ASMDEVLIST, "is the comma-separated list of ASM devices or discovery string planned to be used by ASM. If the discovery string contains shell metacharacters, then enclose it in double quotation marks."
// *Document: NO
//  *Cause:
// *Action:
/
2089, DSC_STAGE_PRE_PATCH, "pre-check for patch application"
// *Document: NO
//  *Cause:
// *Action:
/
2090, DESC_STAGE_PRE_PATCH, "Performs the appropriate pre-stage checks for patch application on all nodes. By default, checks are performed for patching in rolling mode."
// *Document: NO
//  *Cause: 
// *Action:
/
2091, DSC_STAGE_POST_PATCH, "post-check for patch application"
// *Document: NO
//  *Cause:
// *Action:
/
2092, DESC_STAGE_POST_PATCH, "Performs the appropriate post-stage checks for patch application on all nodes."
// *Document: NO
//  *Cause: 
// *Action:
/
2093, DSC_PATCH_NON_ROLLING, "The patch mode is non-rolling."
// *Document: NO
//  *Cause:
// *Action:
/
2100, DESC_COMP_NODEREACH, "Checks the reachability from the source node to the nodes specified in the nodelist. Source node is specified through the '-srcnode' option. If no source node is given, the local node is used as the source node."
//  *Cause: 
// *Action: 
/
2101, DESC_COMP_NODECON, "Checks the connectivity among the nodes specified in the nodelist. If -networks option is provided, the connectivity is checked using the given network interfaces. If -networks is not provided, available interfaces are discovered and connectivity is checked using each of them."
//  *Cause: 
// *Action: 
/
2102, DESC_COMP_CFS, "Checks the integrity of OCFS file system provided by the '-f' option. The sharing of the file system is checked from the nodes in the nodelist. If no '-n' option is given, sharing is checked from the local node."
//  *Cause: 
// *Action: 
/
2103, DESC_COMP_SSA, "Checks the sharing of the locations specified in the '-s' option. If no '-s' option is given, supported storage types are discovered and sharing for each of them is checked. Sharing is checked from the nodes in the nodelist. If no '-t' option is given, the discovery or check is performed for 'data' type. If no '-n' option is given, sharing is checked from the local node. "
//  *Cause: 
// *Action: 
/
2104, DESC_COMP_SPACE, "Checks for free disk space at the location provided by '-l' option on all the nodes in the nodelist. If no '-n' option is given, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2105, DESC_COMP_SYS, "Checks the minimum system requirement for the product given by the '-p' option on all the nodes in the nodelist. If no '-n' option is given, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2106, DESC_COMP_CLU, "This command has been deprecated. Checks the integrity of the cluster on all the nodes."
// *Document: NO
//  *Cause: 
// *Action: 
/
2107, DESC_COMP_CLUMGR, "Checks the integrity of the Oracle Cluster Synchronization Services(CSS) on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check."
//  *Cause: 
// *Action: 
/
2108, DESC_COMP_NODEAPP, "Checks the existence of the node applications on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2109, DESC_COMP_OCR, "Checks the integrity of Oracle Cluster Registry(OCR) on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2110, DESC_COMP_CRS, "Checks the integrity of Oracle Cluster Ready Services(CRS) on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check."
//  *Cause: 
// *Action: 
/
2111, DESC_COMP_ADMPRV, "Checks the required administrative privileges for the operation specified by '-o' option on all the nodes specified in the nodelist. The operations are mutually exclusive and only one operation can be specified at a time. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2112, DESC_COMP_PEER, "Checks the compatibility of the nodes in the nodelist against the reference node specified by '-refnode' option. If no '-refnode' is given, values for all the nodes in the nodelist are reported. "
//  *Cause: 
// *Action: 
/
2113, DESC_COMP_OLR, "Checks the integrity of Local Oracle Registry (OLR) on all the nodes in the node list. If no '-n' option is provided, only the local node is checked. "
//  *Cause: 
// *Action: 
/
2114, DESC_COMP_HA, "Checks the integrity of High Availability on the local node. "
//  *Cause: 
// *Action: 
/
2115, DESC_COMP_SOFT, "Checks the attributes of the files installed during the installation of Oracle Software."
// *Document: NO
//  *Cause: 
// *Action: 
/
2116, DESC_COMP_USM, "Checks the integrity of Oracle ASM Cluster File System(ACFS) on all nodes in the nodelist. If no '-n' is specified, local node is used for this check."
//  *Cause: 
// *Action: 
/
2117, DESC_COMP_ASM, "Checks the integrity of Automatic Storage Manager(ASM) on all nodes in the nodelist. If no '-n' is specified, local node is used for this check."
//  *Cause: 
// *Action: 
/
2118, DESC_COMP_GPNP, "Checks the integrity of GPnP on all the nodes in the nodelist. If no '-n' option is provided, the check is performed on the local node."
//  *Cause: 
// *Action: 
/
2119, DESC_COMP_GNS_POST, "Checks the integrity of GNS on all the nodes in the cluster."
// *Document: NO 
//  *Cause: 
// *Action: 
/
2120, DESC_COMP_SCAN, "Checks the Single Client Access Name configuration. "
//  *Cause: 
// *Action: 
/
2121, DESC_COMP_OHASD, "Checks the integrity of OHASD on all the nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause: 
// *Action: 
/
2123, DESC_COMP_CTSS, "Checks Oracle Cluster Time Synchronization Service(CTSS) on all nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause:
// *Action:
/
2124, DESC_COMP_VDISK, "Checks Oracle Clusterware Voting Disks configuration and UDEV settings on all nodes in the nodelist. If no '-n' option is provided, local node is used for this check. "
//  *Cause:
// *Action:
/
2125, DESC_CLUSTER_NAME_DHCP, "Name of the cluster"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2126, DESC_APP_VIP_RES_DESCRIPTION, "Comma separated list of application VIP names"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2127, DESC_DHCP_PORT_DESCRIPTION, "The port on which the DHCP packets will be sent. Default value for this port is 67."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2128, DESC_DOMAINNAME_GNS, "GNS subdomain name"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2129, DESC_GNSVIP_GNS, "GNS VIP address"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2130, DSC_DNS_PORT_DESCRIPTION, "Port on which the test DNS server should listen. Default value for this port is 53."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2131, DESC_DNS_SERVER, "CVU starts the GNS VIP and a test DNS server and waits for client connection"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2132, DESC_DNS_CLIENT, "CVU will act as client and connect to CVU server instance started on another node to verify GNS subdomain delegation"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2133, DESC_POST_GNS, "Check GNS setup after Clusterware install"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2134, DESC_PRE_GNS, "Check GNS setup before Clusterware install"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2135, DESC_COMP_DNS, "Checks if GNS subdomain delegation has been properly setup in the DNS server. Start 'cluvfy comp dns -server' on one node of the cluster. On each node of the cluster run 'cluvfy comp dns -client' to verify DNS server setup for the cluster. On the last node specify '-last' option to terminate 'cluvfy comp dns -server' instance. If port is less than 1024 CVU needs to be run as root. This check must not be done while GNS CRS resource is online."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2136, DSC_DNS_SERVER, "Start a test DNS server for GNS subdomain"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2137, DSC_DNS_CLIENT, "Validate connectivity to a test DNS server started on specified address"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2138, DSC_GNS_LAST_CLIENT_DESCRIPTION, "Validate connectivity to test DNS server started on specified address and terminate once all validations are done"
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2139, DESC_COMP_DHCP, "Checks if DHCP server exists on the network and is capable of providing required number of IP addresses. This check also verifies the response time for the DHCP server. The checks are all done on the local node. For port values less than 1024 CVU needs to be run as root user. If -networks is specified and it contains a PUBLIC network then DHCP packets are sent on the public network. By default the network on which the host IP is specified is used. This check must not be done while default network CRS resource configured to use DHCP provided IP address is online."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2140, DSC_GNS_VIP_ADDRESS, "GNS virtual IP address in the form {<IP_name>|<IP_address>}/<net_mask>/<interface_name>. IP_name is a name, which resolves to an IP. IP_address is an IP address. net_mask is the subnet mask for the IP. interface_name is the interface on which to start the IP."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2141, DESC_COMP_GNS, "Checks the integrity of GNS on all the nodes in the nodelist. If no '-n' option is provided, the check is performed on the local node."
// *Document: NO
//  *Cause:
// *Action:
/
2142, DESC_NO_CTSS, "If the \"-noctss\" option is specified, then Oracle CTSS check is not performed, instead the platforms native Time Synchronization is checked."
// *Document: NO
//  *Cause:
// *Action:
/
2143, DSC_GNS_VIP_DESCRIPTION, "GNS virtual IP address: either a name that resolves to an IP address, or a dotted decimal numeric IP address."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2150, DSC_VIPLIST_DESCRIPTION, "is the comma-separated list of virtual IP addresses."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
2151, DESC_COMP_HEALTH_CHECK, "Checks that the mandatory requirements and/or best practice recommendations are met for successful operation of Oracle Clusterware, ASM and the database(s) configured on the system. The checks related to Oracle Clusterware range from the operating system-specific software requirements to networking or storage system configurations to the Oracle Clusterware specific components like OCR, CRS, and SCAN to name a few. The scope of validation is specified through the combination of command line options -cluster, -database, -asm, -bestpractice, and -mandatory. If the request has been made to perform validations for the databases but no database has been explicitly specified in the command line, then all the databases configured on the system are discovered and validations are performed for each discovered database. The results of the validation can be displayed as text or as HTML (if feasible). The detailed report of results can be requested to be saved for a future reference."
// *Document: NO
//  *Cause:
// *Action:
/
2152, DSC_COMP_HEALTH_CHECK, "checks mandatory requirements and/or best practice recommendations"
// *Document: NO
//  *Cause:
// *Action:
/
2153, DSC_HEALTH_CHECK_DB_DESCRIPTION, "specifies that the database checks will be performed against the specific database whose unique name is specified as <db_unique_name>. If this option is missing then all the cluster databases configured in the system will be discovered and the best practice checks will be performed against each of those."
// *Document: NO
//  *Cause:
// *Action:
/
2154, DSC_HEALTH_CHECK_DEVIATIONS, "specifies that the user wants only the deviations from best practice recommendations and/or mandatory requirements (depending on the use of -bestpractice and -mandatory options) to be reported."
// *Document: NO
//  *Cause:
// *Action:
/
2155, DSC_HEALTH_CHECK_HTML_DESCRIPTION, "specifies that the user wants the detailed report to be output in a html format. If a browser recognized by CVU is available on the system, the results will be reported using that browser. Otherwise, the use will have to use -save option to get a copy of the report in html format which can be viewed by the user using a browser of his/her choice. If -html option is missing then the detailed report is output in text."
// *Document: NO
//  *Cause:
// *Action:
/
2156, DSC_HEALTH_CHECK_SAVE, "specifies that the user wants the reports of validations (in both the textual and html format) to be saved for future reference. The reports( named as cvucheckreport_<timestamp>.txt and cvucheckreport_<timestamp>.htm) are saved in the location of user's choice if specified using -savedir option. If -savedir option has not been specified then the reports are saved in the default location <CV-HOME>/cv/report."
// *Document: NO
//  *Cause:
// *Action:
/
2157, DSC_HEALTH_CHECK_COLLECT, "-collect specifies that the user wants to perform the checks explicitly related to either Oracle Clusterware or databases or ASM. The absence of the -collect option specifies that the user wants Oracle Clusterware, database and ASM related checks to be performed. The use of the term 'cluster' with the -collect option specifies that the user wants only Oracle Clusterware related checks to be performed. The use of the term 'database' with the -collect option specifies that the user wants only database related checks to be performed. The use of the term 'asm' with the -collect option specifies that the user wants only ASM related checks to be performed."
// *Document: NO
//  *Cause:
// *Action:
/
2158, DSC_HEALTH_CHECK_MANDATORY, "specifies that the user wants only mandatory requirements to be validated. The options -bestpractice and -mandatory are mutually exclusive. The absence of both these options specifies that the user wants both best practice recommendations and mandatory requirements to be validated."
// *Document: NO
//  *Cause:
// *Action:
/
2159, DSC_HEALTH_CHECK_BESTPRACTICE, "specifies that the user wants only best practice recommendations to be validate."
// *Document: NO
//  *Cause:
// *Action:
/
2160,DESC_COMP_FREE_SPACE, "Checks the free space for the file system on which Grid Infrastructure home is installed and reports an error if free space is below either 5 GB or 5 percent of total file system size, whichever is higher."
// *Document: NO
//  *Cause:
// *Action:
/
2165, DESC_COMP_HEALTH, "Checks the mandatory requirements for successful operation of clusterware."
// *Document: NO
//  *Cause:
// *Action:
/
2200, DESC_STAGE_POST_HWOS, "Performs the appropriate network and storage checks on all the nodes in the nodelist. If '-s' option is given, then the sharing of the given storage locations are checked for supported storage types. If no '-s' option is provided, supported storage types are discovered and sharing for each of them is checked."
//  *Cause: 
// *Action: 
/
2201, DESC_STAGE_PRE_CFS, "Performs the appropriate checks on all the nodes in the nodelist before setting up Oracle Cluster File System(OCFS). "
//  *Cause: 
// *Action: 
/
2202, DESC_STAGE_POST_CFS, "Performs the appropriate checks after setting up Oracle Cluster File System(OCFS). This check is done on all the nodes in the nodelist for the file system given by the '-f' option. "
//  *Cause: 
// *Action: 
/
2203, DESC_STAGE_PRE_CRSINST, "Performs the appropriate checks on all the nodes in the nodelist before setting up Cluster Ready Services(CRS) for a fresh install as well as when upgrading from an existing installation. For performing checks for a fresh install, either -n or -file option must be specified, use -upgrade for performing checks for upgrade. Performs additional checks if the optional -c and -q options are specified. If a value for -asmgrp is not specified, then the same group as the Oracle inventory group is used. If a value for -asmdev is not specified, then an internal operating system dependent value is used. If the option -afdconfig is specified, then ASM Filter Driver configuration pre-requisite checks will be performed."
//  *Cause: 
// *Action: 
/
2204, DESC_STAGE_POST_CRSINST, "Performs the appropriate checks on all the nodes in the node list after setting up Cluster Ready Services (CRS)."
//  *Cause: 
// *Action: 
/
2205, DESC_STAGE_PRE_DBINST, "Performs the appropriate checks on all the nodes in the nodelist before setting up a RAC database. "
//  *Cause: 
// *Action: 
/
2206, DESC_STAGE_PRE_DBCFG, "Performs the appropriate checks on all the nodes in the nodelist before configuring a RAC database. "
//  *Cause: 
// *Action: 
/
2207, DESC_STAGE_PRE_HACONFIG, "Performs the appropriate checks on the local node before setting up a High Availability(HA) installation. "
//  *Cause: 
// *Action: 
/
2208, DESC_STAGE_POST_HACONFIG, "Performs the appropriate checks on the local node after setting up a high availability installation. "
//  *Cause: 
// *Action: 
/
2209, DESC_STAGE_PRE_NODEADD, "Performs the appropriate checks on the nodes to be added to the existing cluster, and verifies the integrity of the cluster before the nodes can be added. "
//  *Cause: 
// *Action: 
/
2210, DESC_STAGE_PRE_NODEDEL, "Performs the appropriate checks on the nodes to be removed from the existing cluster, and verifies the integrity of the cluster before the nodes can be removed. "
//  *Cause: 
// *Action: 
/
2211, DESC_STAGE_POST_NODEADD, "Performs the appropriate checks on the existing cluster to verify the integrity of the cluster after the nodes have been added. "
//  *Cause: 
// *Action: 
/
2212, DESC_STAGE_POST_NODEDEL, "Performs the appropriate checks on the existing cluster to verify the integrity of the cluster after the nodes have been removed. "
//  *Cause: 
// *Action: 
/
2213, DESC_STAGE_PRE_USMCFG, "Performs the appropriate checks on the existing cluster before proceeding with ASM Cluster File System configuration."
//  *Cause: 
// *Action: 
/
2214, DESC_STAGE_POST_USMCFG, "Performs the appropriate checks on the existing cluster following completion of ASM Cluster File System configuration."
//  *Cause: 
// *Action: 
/
2215, DESC_COMP_GNS_PRECRSINST, "Performs checks on Grid Naming Service (GNS) domain name and GNS virtual IP address before clusterware installation"
// *Document: NO
//  *Cause:
// *Action:
/
2216, DESC_GNS_DOMAIN_DESCRIPTION, "GNS subdomain name"
// *Document: NO
//  *Cause:
// *Action:
/
2217, DESC_GNS_VIP_DESCRIPTION, "GNS virtual IP address"
// *Document: NO
//  *Cause:
// *Action:
/
2218, DESC_SERVICE_PWD, "Oracle home user's password will be read from standard input"
// *Document: NO
//  *Cause:
// *Action:
/
2219, DESC_SERVICE_USER, "Oracle home user"
// *Document: NO
//  *Cause:
// *Action:
/
2220, DESC_ASM_CREDENTIAL_FILE, "Path to ASM client credential file"
// *Document: NO
//  *Cause:
// *Action:
/
2221, DESC_PRESENCE, "Specify the ASM presence on this clusterware installation. The allowed values are LOCAL and FLEX."
// *Document: NO
//  *Cause:
// *Action:
/
2222, DESC_DEST_SERVICE_USER, "Destination Oracle home user"
// *Document: NO
//  *Cause:
// *Action:
/
/
2223, DESC_DEST_SERVICE_PWD, "Destination Oracle home user's password will be read from standard input."
// *Document: NO
//  *Cause:
// *Action:
/
2224, DSC_AFDCONFIG, "Verify ASM Filter Driver configuration pre-requisites."
// *Document: NO
//  *Cause:
// *Action:
/
3000, USAGE_TEXT, "USAGE:"
//  *Cause: 
// *Action: 
/
3001, DESCRIPTION_TEXT, "DESCRIPTION:"
//  *Cause: 
// *Action: 
/
3002, DESC_ROOT_USER, "is the user name to access all the nodes with root privileges."
// *Document: NO
//  *Cause: 
// *Action: 
/
3003, DESC_CONFIG_METHOD, "is the privilege delegation method, 'sudo' or 'root', to be used for root user access."
// *Document: NO
//  *Cause: 
// *Action: 
/
3004, DESC_SUDO_PBRUN_LOC, "is the full file system path for the 'sudo' executable."
// *Document: NO
//  *Cause: 
// *Action: 
/
3005, DESC_GNS_CLIENTDATA, "File from which GNS credentials data will be read"
// *Document: NO
//  *Cause:
// *Action:
/
3100, DESC_COMMON_ORAINV, "If 'Oracle Inventory' group is not specified, 'oinstall' is used as the inventory group. "
//  *Cause: 
// *Action: 
/
3101, DESC_COMMON_OSDBA, "If OSDBA group is not specified, 'dba' is used as the OSDBA group. "
//  *Cause: 
// *Action: 
/
3102, DESC_FIXUP_GEN, "If '-fixup' option is specified, on verification failure, fix up operations are performed if feasible. "
//  *Cause: 
// *Action: 
/
3103, DESC_CRS_HOME, "If the -crshome option is specified, the supplied file system location is checked for sufficient free space for a Clusterware installation. "
// *Document: NO
//  *Cause: 
// *Action: 
/
3104, DESC_ORA_HOME, "If the -d option is specified, the supplied file system location is checked for sufficient free space for a database installation. "
// *Document: NO
//  *Cause: 
// *Action: 
/
3105, DSC_PROD, "is the Oracle product, 'crs' for Cluster, 'database' for Real Application Cluster and 'ha' for High Availability product"
// *Document: NO
//  *Cause: 
// *Action: 
/
3106, DSC_NODELIST_DESCRIPTION, "is the comma-separated list of non-domain qualified node names on which the test should be conducted. '-n all' option is deprecated. Use '-allnodes' option to specify all the nodes in the cluster for verification instead of '-n all' option."
// *Document: NO
//  *Cause: 
// *Action: 
/
3107, DSC_DHCP_NODELIST, "is the comma-separated list of non-domain qualified node names for which VIP will be requested from DHCP server"
// *Document: NO
//  *Cause: 
// *Action: 
/
3108, DSC_CONFIGURATION_FILE, "is the root script configuration file containing Oracle install variables."
// *Document: NO
//  *Cause:
// *Action:
/
3109, DSC_NODELIST_NOALL_DESCRIPTION, "is the comma-separated list of non-domain qualified node names on which the test should be conducted."
// *Document: NO
//  *Cause: 
// *Action: 
/
3110, DESC_DHCP_DESC, "Checks if DHCP server exists on the network and is capable of providing required number of IP addresses."
// *Document: NO
//  *Cause: 
// *Action: 
/
3111, DESC_FIXUP_NO_EXEC, "If '-fixupnoexec' option is specified, on verification failure, the fix up data will be generated and the instruction for manual execution of the generated fix ups will be displayed."
//  *Cause: 
// *Action: 
/
3112, DSC_PRENODEADD_NODELIST_NOALL_DESCRIPTION, "is the comma-separated list of non-domain qualified node names which will be added to the cluster."
// *Document: NO
//  *Cause: 
// *Action: 
/
3113, DSC_POSTNODEADD_NODELIST_NOALL_DESCRIPTION, "is the comma-separated list of non-domain qualified node names which have been added to the cluster."
// *Document: NO
//  *Cause: 
// *Action: 
/
3114, DSC_NODEDEL_NODELIST_NOALL_DESCRIPTION, "is the comma-separated list of non-domain qualified node names which have been removed from the cluster."
// *Document: NO
//  *Cause: 
// *Action: 
/
3200, DSC_AUTOLIST_DESCRIPTION, "is the comma-separated list of auto node names on which the test should be conducted."
// *Document: NO
//  *Cause: 
// *Action: 
/
3201, DSC_HUBLIST_DESCRIPTION, "is the comma-separated list of Hub node names on which the test should be conducted."
// *Document: NO
//  *Cause: 
// *Action: 
/
3202, DSC_RIMLIST_DESCRIPTION, "is the comma-separated list of Leaf node names on which the test should be conducted."
// *Document: NO
//  *Cause: 
// *Action: 
/
3203, DSC_TARGET_HUB_SIZE_DESCRIPTION, "is the target hub size."
// *Document: NO
//  *Cause: 
// *Action: 
/
3204, DSC_BC_DESCRIPTION, "for Flex Cluster node specification."
// *Document: NO
//  *Cause: 
// *Action: 
/
3205, DSC_PRENODEADD_HUBLIST_DESCRIPTION, "is the comma-separated list of non-domain qualified node names which will be added to the cluster as Hub nodes."
// *Document: NO
//  *Cause: 
// *Action: 
/
3206, DSC_PRENODEADD_RIMLIST_DESCRIPTION, "is the comma-separated list of non-domain qualified node names which will be added to the cluster as Leaf nodes."
// *Document: NO
//  *Cause: 
// *Action: 
/
3207, DSC_PRENODEADD_VIPLIST_DESCRIPTION, "is the comma-separated list of virtual IP addresses that will be applied to the comma-separated list of non-domain qualified node names entered."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
3208, DSC_PRENODEADD_AUTOLIST_DESCRIPTION, "is the comma-separated list of non-domain qualified node names which will be added to the cluster as Auto nodes."
// *Document: NO
//  *Cause: 
// *Action: 
/
3209, DSC_RESPONSE_FILE, "is the response file in the format created by the Oracle Universal Installer containing Oracle install variables to perform installation."
// *Document: NO
//  *Cause:
// *Action:
/
3210, DSC_NODELIST_ALL_FLAG, "All the nodes in the cluster will be used for verification."
// *Document: NO
//  *Cause:
// *Action:
/
3500, TXT_VALID_COMMANDS, "Valid {0} are:"
// *Document: NO
//  *Cause: 
// *Action: 
/
3501, TXT_SYNTAX_FOR, "SYNTAX (for {0}):"
// *Document: NO
//  *Cause: 
// *Action: 
/
3502, ERROR_UNRECOGNIZED_SYMBOL, "Unrecognized symbol \"{0}\". See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3503, ERROR_INVALID_OPTION_VALUE, "\"{0}\" is not a valid value for \"{1}\". See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3504, ERROR_REQUIRED_OPTION_MISSING, "\"{0}\" is required for \"{1}\". See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3505, ERROR_REQUIRED_VALUE_MISSING, "A value is required for \"{0}\". See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3506, ERROR_MULTIPLE_OPTION_VALUES, "\"{0}\" cannot contain multiple values. See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3507, ERROR_CONTAINS_IP_ADDRESS, "\"{0}\" cannot contain IP address. See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3508, ERROR_VALUE_NOT_NUMERIC, "Value \"{0}\" specified for \"{1}\" is not a number. See usage for detail."
//  *Cause:
// *Action:
/
3509, ERROR_UNEXPECTED_SYMBOL, "Unexpected symbol \"{0}\". See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3510, ERROR_MISSING_REQUIRED_OPTION, "Missing required option for \"{0}\". See usage for detail."
// *Document: NO
//  *Cause:
// *Action:
/
3511, ERROR_MISSING_PARENT_OPTION, "\"{0}\" can only be used with \"{1}\". See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3512, ERROR_CANNOT_COMBINE_CHOICE_OPTIONS, "\"{0}\" cannot be combined. See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3513, ERROR_CONFLICTING_MISSING_ARGUMENTS, "Conflicting or missing arguments. See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3514, ERROR_NO_SAVEDIR_OPTION, "-savedir flag not specified."
//  *Cause: The -savedir flag was not specified while running the baseline collection command through 'runcluvfy'.
// *Action: Specify a valid value for -savedir flag.
/
3520, DSC_NETWORKLIST, "is the '/' separated list of networks. Each network can be specified in the format \"<if_name>\"[:<subnet_id>[:<if_type>[,<if_type>...]]]. if_name can have \"*\" as in \"eth*\" to match interfaces like eth1, eth02 etc. subnet_id is subnet number of network interface. if_type is comma-separated list of interface types {CLUSTER_INTERCONNECT | PUBLIC | ASM}"
//  *Cause: 
// *Action: 
/
3521, DSC_NETWORKLIST_GNS, "is the '/' separated list of networks. Each network can be specified in the format \"<if_name>\"[:<subnet_id>]. if_name can have \"*\" as in \"eth*\" to match interfaces like eth1, eth02 etc. subnet_id is subnet number of network interface. The GNS integrity check is only applied to public networks."
// *Document: NO
//  *Cause: 
// *Action: 
/
3550, DSC_SRC_CRSHOME, "is the location of the source CRS home."
// *Document: NO
//  *Cause: 
// *Action: 
/
3551, DSC_DEST_CRSHOME, "is the location of the destination CRS home."
// *Document: NO
//  *Cause: 
// *Action: 
/
3552, DSC_CRSINST_ROLLING, "if the upgrade is a rolling upgrade"
// *Document: NO
//  *Cause: 
// *Action: 
/
3553, DSC_CRS_VERSION, "is the version being upgraded to, including any patchset. For example, 11.2.0.1.0, 11.2.0.2.0 etc."
// *Document: NO
//  *Cause: 
// *Action: 
/
3554, ERROR_MULTI_VERSION, "A single version must be specified. See usage for detail."
// *Document: NO
//  *Cause: 
// *Action: 
/
3555, DSC_UPGRADE, "to verify upgrade prerequisites"
// *Document: NO
//  *Cause: 
// *Action: 
/
3556, DSC_DB_VERSION, "is the version being upgraded to, including any patchset. For example, 11.2.0.1.0, 11.2.0.2.0 etc."
// *Document: NO
//  *Cause: 
// *Action: 
/
3557, DSC_SRC_DBHOME, "is the location of the source database home being upgraded from."
// *Document: NO
//  *Cause: 
// *Action: 
/
3558, DSC_DEST_DBHOME, "is the location of the destination database home being upgraded to."
// *Document: NO
//  *Cause: 
// *Action: 
/
3559, DSC_DBNAME, "is the list of unique name of the databases being upgraded."
// *Document: NO
//  *Cause: 
// *Action: 
/
3560, ERROR_NO_NODELIST_OR_UPGRADE, "Either -n or -upgrade command line option must be specified"
// *Document: NO
//  *Cause:
// *Action:
/
3561, ERROR_INVALID_VERSION, "Specified version string \"{0}\" is invalid. Specify the version in the form 11.2.0.1.0"
// *Document: NO
//  *Cause: 
// *Action: 
/
3562, IF_AND_NETWORKS, "Options '-i' and '-networks' cannot be combined."
// *Document: NO
//  *Cause: 
// *Action: 
/
3563, INVALID_OPTION_WITH_VERSION, "Invalid command line option specified. The option '-serviceuser' is not valid with version \"{0}\"."
//  *Cause: Command line option '-serviceuser' was specified with release version earlier than 12c.
// *Action: Use '-serviceuser' option with 12c or later release.
/
3564, INVALID_OPTION_WITH_VERSION2, "Invalid command line option specified. The option '-serviceuser' is not valid with version \"{0}\"."
//  *Cause: Command line option '-serviceuser' was specified with pre-check for database 12c installation.
// *Action: Omit the '-serviceuser' option.
/
3600, DSC_COMP_BASELINE, "collect and compare baselines"
// *Document: NO
//  *Cause: 
// *Action: 
/
3601, DESC_COMP_BASELINE, "Collect and compare baselines. Use -collect to collect baseline. Use -compare to compare baselines. When using -compare to compare the baselines, if only a single baseline is specified, the results of the collections are displayed. If multiple baselines are specified, the values from the baselines will be compared against each other. -collect options -bestpractice and -mandatory are mutually exclusive; the absence of both these options specifies that the user wants both best practice recommendations and mandatory requirements to be collected. When collecting database baseline, if <oracle_home> is specified, baseline will be collected for all the databases running from the home. If <db_unique_name> is specified, database baseline  will only be collected for the specified database. If neither <oracle_home> nor <db_unique_name> is specifed, all the cluster databases configured in the system will be discovered and the collection will be performed against each of those."
// *Document: NO
//  *Cause: 
// *Action: 
/

3602, DSC_BASELINE_CHECK_SAVE, "specifies that the user wants the reports of validations (in both the text and HTML format) to be saved for future reference. The reports  (named as cvucheckreport_<timestamp>.txt and cvucheckreport_<timestamp>.htm) are saved in the location of user's choice if specified using the -savedir option. If the -savedir option has not been specified then the reports are saved in the default location <CV-HOME>/cv/report."
// *Document: NO
//  *Cause:
// *Action:
/
3603, DSC_BASELINE_COLLECT, "collect baseline related to clusterware or databases or both"
// *Document: NO
//  *Cause:
// *Action:
/
3604, DSC_BASELINE_MANDATORY, "collect baseline for only mandatory requirements"
// *Document: NO
//  *Cause:
// *Action:
/
3605, DSC_BASELINE_BESTPRACTICE, "collect baseline for only best practice recommendations"
// *Document: NO
//  *Cause:
// *Action:
/
3606, DSC_BASELINE_DB_DESCRIPTION, "database unique name"
// *Document: NO
//  *Cause:
// *Action:
/
3607, DSC_BASELINE_COMPARE, "one or more baselines to compare"
// *Document: NO
//  *Cause:
// *Action:
/
3608, DSC_BASELINE_REPORT_NAME, "baseline report name"
// *Document: NO
//  *Cause:
// *Action:
/
3609, DSC_BASELINE_COLLECT_BIN_LIB_FILES, "collect only files in bin/, lib/ and jlib/ subdirectories of the software home"
// *Document: NO
//  *Cause:
// *Action:
/
3610, DSC_BASELINE_SAVEDIR, "file system directory where validation reports are saved"
// *Document: NO
//  *Cause: 
// *Action: 
/
3611, DSC_BASELINE_DBHOME_DESCRIPTION, "database home"
// *Document: NO
//  *Cause:
// *Action:
/
3612, DSC_BASELINE_CROSS_COMPARE_FLAG, "compare baselines across cluster or across cluster nodes and databases"
// *Document: NO
//  *Cause:
// *Action:
/
3613, DESC_BASELINE_CROSS_COMPARE_FLAG, "By default, baseline comparison is performed between values from the same nodes and databases from different points in time. Use the '-cross_compare' option to compare baselines across clusters or across cluster nodes and databases. When the '-cross_compare' option is used, the node based collections in the baseline will be compared with the node based collections from the first node in the reference baseline and the database collections in the baseline will be compared with the database collections from the first database in the reference baseline."
// *Document: NO
//  *Cause:
// *Action:
/
3750, DSC_COMP_FARM_CHECK, "checks requirements for the farm systems"
// *Document: NO
//  *Cause:
// *Action:
/
3751, DESC_COMP_FARM_CHECK, "Checks that the requirements are met for successful operation of a Clusterware and database installation on the specified farm system."
// *Document: NO
//  *Cause:
// *Action:
/
3752, DESC_SUMMARY, "If the '-summary' option is specified then only the summary of results of verification checks is displayed."
// *Document: NO
//  *Cause:
// *Action:
/
3753, DSC_FARM_CONFIGURATION_FILE, "is the configuration file containing variables that define the specific system details"
// *Document: NO
//  *Cause:
// *Action:
/
3754, DSC_COMP_CLUSTERWARE, "performs diagnostic checks"
// *Document: NO
//  *Cause:
// *Action:
/
3755, DESC_COMP_CLUSTERWARE, "Performs diagnostics and reports potential issues that cause Oracle Cluster Ready Services (CRS) startup failures. If -time_out is not specified, then a default value of 60 seconds is considered as the time out for the command execution."
// *Document: NO
//  *Cause:
// *Action:
/
3756, ERROR_INVALID_TIME_OUT_VALUE, "value specified \"{0}\" for command line option '-time_out' is not a number."
//  *Cause: A non-numeric value was specified for command line option '-time_out'.
// *Action: Specify a numeric value for the command line option '-time_out'.
/
5000, DSC_OSBACKUPGRP, "is the name of the OSBACKUP group."
//  *Cause: 
// *Action: 
/
5001, ERROR_MULTI_OSBACKUPGRP, "OSBACKUP must be a single group name. See usage for details."
//  *Cause: 
// *Action: 
/
5002, DSC_OSDGGRP, "is the name of the OSDG group."
//  *Cause: 
// *Action: 
/
5003, ERROR_MULTI_OSDGGRP, "OSDG must be a single group name. See usage for details."
//  *Cause: 
// *Action: 
/
5004, DSC_OSKMGRP, "is the name of the OSKM group."
//  *Cause: 
// *Action: 
/
5005, ERROR_MULTI_OSKMGRP, "OSKM must be a single group name. See usage for details."
//  *Cause: 
// *Action: 
/
5006, DSC_SW_ALL_FILES_DESCRIPTION, "If this option is specified the attributes of all files of the specified home will be checked. If this option is omitted, the attributes of the files 'lib', 'jlib' and 'bin' under the specified home will be checked."
// *DOCUMENT: NO
//  *Cause:
// *Action:
/
5007, DSC_NODELIST_DESC_COMP_SOFT, "is the comma-separated list of non-domain qualified node names on which the test should be conducted. If the 'all' option is specified, then all the nodes in the cluster will be used for verification. If the '-n' option is omitted, the check is performed on the local node."
// *Document: NO
//  *Cause: 
// *Action: 
/
5008, DSC_ORAHOME_COMP_SOFT, "is the location of an Oracle database home to be verified. Omit this argument to verify the Oracle Clusterware home."
// *Document: NO
//  *Cause: 
// *Action: 
/
5050, DSC_OSOPERGRP, "is the name of the OSOPER group."
// *Document: NO
//  *Cause:
// *Action:
/
5051, ERROR_MULTI_OSOPERGRP, "-osoper must be a single group name. Use the -help argument to view details."
// *Document: NO
//  *Cause:
// *Action:
/
5052, ERROR_MULTI_ASMOPERGRP, "-asmopergrp must be a single group name. Use the -help argument to view details."
// *Document: NO
//  *Cause:
// *Action:
/
5100, DSC_STAGE_POST_APPCLUSTER, "post-check for Oracle Clusterware Application Cluster Installation"
// *Document: NO
//  *Cause: 
// *Action: 
/
5101, DESC_STAGE_POST_APPCLUSTER, "Performs the appropriate post stage checks for Oracle Clusterware Application Cluster Installation on all the nodes."
// *Document: NO
//  *Cause: 
// *Action:
/
5102, DSC_STAGE_PRE_APPCLUSTER, "pre-check for Oracle Clusterware Application Cluster Installation"
// *Document: NO
//  *Cause: 
// *Action: 
/
5103, DESC_STAGE_PRE_APPCLUSTER, "Performs the appropriate pre stage checks for Oracle Clusterware Application Cluster Installation on all the nodes."
// *Document: NO
//  *Cause: 
// *Action:
/
5104, ERROR_CONFFILE_INVALIDVARVALUE, "Invalid value \"{0}\" found for the variable name \"{1}\" while parsing file \"{2}\"."
//  *Cause: An invalid value was found for the given variable while parsing the specified file.
// *Action: Verify that the variable exists in the specified file and has a valid value.
/
5105, ERROR_CONFFILE_EMPTYVARVALUE, "No value was found for the variable name \"{0}\" while parsing file \"{1}\"."
//  *Cause: An empty value was found for the given variable or the variable was not defined in the specified file.
// *Action: Verify that the variable exists in the specified file and has a valid value.
/
5106, ERROR_CONFFILE_DISK_FAILURE_GROUP_SIZE_MISMATCH, "Failure group list size does not match the disk list size for the variable name \"{0}\" while parsing file \"{1}\"."
//  *Cause: Disks and their associated failure group names were not defined 
//          correctly for the indicated variable in the indicated file.
// *Action: Ensure that each disk has an associated failure group defined 
//          or that no failure group is defined for all the disks for the 
//          indicated variable in the indicated file.
/
5107, ERROR_CONFFILE_DISKLIST_FAILUREGROUPLIST_SIZE_MISMATCH, "Size of failure group list specified in variable \"{0}\" is not equal to size of disk list specified in variable \"{1}\" while parsing file \"{2}\"."
//  *Cause: The size of the failure group list and the size of the disk list
//          defined for the indicated variable were not equal in the indicated
//          file.
// *Action: Ensure that the size of the failure group list is equal to the
//          size of the disk list defined for the indicated variable in the
//          indicated file, and retry the operation.
/
5200, ERROR_VERSION_NOT_VALID, "Specified version string '{0}' for option '{1}' is not valid. Specify the version in the form 0.0.0.0.0. See usage for detail."
//  *Cause: The specified command was rejected because the value for the indicated option is not in the format indicated.
// *Action: Retry the command specifying the version string for the indicated option in the correct format.
/
5201, CRS_NOT_CONFIGURED, "Cluster Ready Services configuration is not detected. See usage for detail."
//  *Cause: An attempted check for Cluster Ready Services failed because Cluster Ready Services were not configured. The check is valid only when Cluster Ready Services are configured.
// *Action: Ensure that the Cluster Ready Services have been correctly installed and configured before attempting the check. 
/
5202, SIHA_NOT_CONFIGURED, "Oracle Restart configuration is not detected. See usage for detail."
//  *Cause: An attempted check for Oracle Restart failed because Oracle Restart was not configured. The configuration check is valid only when Oracle Restart is configured.
// *Action: Ensure that the Oracle Restart has been correctly installed and configured before attempting the check. 
/
5203, ERROR_VIP_ADDRESS, "Specified virtual ip address '{0}' for option '{1}' is not valid. Virtual IP address should be in the format {<IP_name>|<IP_address>}/<net_mask>/<interface_name>. See usage for detail."
//  *Cause: The specified command was rejected because the value for the indicated option was not in the format indicated.
// *Action: Retry the command specifying the virtual IP address for the indicated option in the correct format.
/
