// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrkcMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     jorgepe     07/26/18 - Fix bug 21571406
//     ptare       07/03/18 - Add messages for user and group retrieval
//     jorgepe     05/25/18 - Parallelized fileExists API
//     jorgepe     05/02/18 - Fix bug 27882925
//     jorgepe     04/21/18 - Fix bug 21393839
//     jesusfer    11/16/17 - fix bug 27101622, permission exception message
//     yizhang     10/14/17 - fix bug 26817825
//     rdesale     01/25/17 - Message for Oracle Restart+ configuration
//     nidietri    05/31/16 - Add message for bug 21696378
//     rdesale     03/30/16 - Fix Bug 22996572
//     rdesale     02/22/16 - Fix bug 16631445
//     iestrada    11/06/15 - Fix bug 20635130
//     spavan      06/10/15 - fix bug20961760 - nls messages for directory
//                            creation
//     pevilla     03/04/15 - Add file read/write permissions msgs
//     kamramas    02/16/15 - Add message for ER-20543446
//     kamramas    02/05/15 - Correct PARTIALLY_SHARED_CFS
//     kamramas    01/19/15 - Add USER_EQUIV_CHECK_FAILED and PING_FAILED
//     kamramas    01/14/15 - Add PARTIALLY_SHARED_CFS
//     chchatte    10/27/14 - Added invalid param messages
//     chchatte    09/17/14 - Fix enhancement 19614882
//     smadabhu    03/27/14 - Bug 18418208
//     vobulapu    12/09/13 - Fix bug 17712381
//     satg        11/20/13 - Fix bug 17634505
//     ocordova    03/19/13 - Fix Bug 13389334
//     ccharits    07/10/12 - Added message PINGABILITY_VERIFICATION_ERROR
//     ccharits    03/21/12 - Added message
//                            VIPNAME_DOES_NOT_RESOLVE_TO_ADDRESS_OF_GIVEN_TYPE
//     xesquive    02/07/12 - Bug fix 13566257
//     ccharits    02/01/12 - Added messages for
//                            IPAddressUtil.applyNetmaskOrPrefixLength()
//     ptare       07/14/11 - Update message 1141
//     ccharits    02/25/11 - Added message INVALID_IP_OR_UNKNOWN_HOST
//     ptare       02/24/11 - Add resolve path messages
//     ccharits    12/03/10 - Added message PARTIAL_SHAREDNESS
//     agorla      06/09/10 - bug#9785411 - add messages for RemoteExecCommand
//     shmubeen    03/02/10 - add error message for checkOCRStorageType
//     ccharits    02/16/10 - Fixed bug 8579094
//     agorla      02/12/10 - add get windows domain error
//     ptare       11/20/09 - Add message ERROR_READ_ENV_VARIABLE
//     ccharits    10/12/09 - Fixed bug 8940226
//     yizhang     05/27/09 - fix messages
//     sravindh    03/13/09 - Add TRIVIAL_NODE_LIST mesg
//     sravindh    01/06/09 - Add messages for path assert
//     jgrout      03/11/09 - Add message for SIHA software version failure
//     sravindh    01/06/09 - Add ,essages for path assert
//     sravindh    12/29/08 - Add message for drive letters failure
//     sravindh    07/25/08 - Messages for OCR locations retrieval failure
//     rxkumar     06/05/08 - add GET_LOCAL_HOSTNAME_FAILED
//     sravindh    12/06/07 - Review comments(DS)
//     sravindh    12/03/07 - New message for group from UnixSystem class
//     agridnev    09/10/07 - fixed typo
//     agridnev    08/23/07 - added message for umask and permissions
//     nvira       03/26/07 - add message for file not found
//     sowong      03/12/07 - add messages for new createservice
//     nvira       12/14/06 - add messages for olr & ocr config read errors
//     bkannike    06/29/06 - Adding unable to find version message 
//     bkannike    06/16/06 - Add Version not found message 
//     sowong      05/11/06 - add new message for bug4244888 
//     sowong      03/09/05 - fix bug 4229562 
//     rxkumar     12/08/04 - fix bug4055008 
//     sowong      11/16/04 - add NULL_DEPENDENCY_LIST 
//     rxkumar     07/26/04 - add SET_PERMS_FAILED 
//     rxkumar     10/07/04 - add NULL_VERSION 
//     khsingh     09/30/04 - add INVALID_IF_PARAM_TYPE (bug 3351186)
//     rxkumar     10/05/04 - fix bug3892547
//     rxkumar     10/03/04 - fix bug3896992
//     rxkumar     09/22/04 - fix er bug3906335
//     rxkumar     09/15/04 - add REMOVE_FILE_FAILED, bug3892710
//     sowong      08/25/04 - add msg for failing to get css home
//     sowong      07/28/04 - add message for bug 3757074
//     khsingh     08/06/04 - add PORT_ALREADY_IN_USE
//     khsingh     08/03/04 - add NULL_IPADDRESSES
//     sowong      08/03/04 - add FAIL_TO_CREATE_NEWLIST
//     sowong      08/02/04 - add ERROR_REGISTER_OCX and ERROR_REBOOT_NODE
//     khsingh     07/26/04 - add GET_CRS_ACTIVE_VERSION_FAIL (3700947)
//     khsingh     07/30/04 - add specific messages for transfer APIs
//     rxkumar     07/29/04 - add ERROR_UPDATE_ENV
//     khsingh     07/26/04 - add EMPTY_INCL_FILE
//     khsingh     07/21/04 - add FAILED_TO_LIST_FILES_FOR_TRANSFER
//     rxkumar     07/21/04 - add UNKNOWN_PATH_TYPE
//     khsingh     07/20/04 - add GET_NODE_VIP_FAIL
//     rxkumar     07/19/04 - add GET_PRIVATE_NODE_NAME_FAIL
//     khsingh     07/12/04 - add TRANSFER_LISTED_DIRS_FATAL_ERROR
//     khsingh     06/28/04 - add NULL_ORACLE_HOME
//     sowong      06/28/04 - add new messages for transferfile apis
//     rxkumar     06/15/04 - add NO_USER_EQUIVALENCE msg
//     khsingh     06/07/04 - add add TRANSFER_DIR_TO_NODES_FAILED
//     khsingh     06/03/04 - add message for remote file op exception
//     rxkumar     06/08/04 - update ENVIRONMENT_FAIL msg
//     rxkumar     06/01/04 - add NODE_LIVENESS msg
//     rxkumar     05/19/04 - add ERROR_GET_SUBKEY
//     rxkumar     05/07/04 - add GET_PRIV_HOSTNAME_FAIL
//     rxkumar     04/26/04 - add NULL_FILE_NAME
//     rxkumar     04/28/04 - add GET_NODE_NUMBER_FAIL
//     rxkumar     03/31/04 - add NODE_LIST msgs
//     rxkumar     03/30/04 - add DIR_LIST_ERROR
//     rxkumar     07/14/03 - add CLUSTER_MISCONFIGURED
//     rdasari     06/05/03 - add HOSTNAME_KEY_NULL mesg
//     khsingh     05/21/03 - add msg
//     khsingh     05/19/03 - add msg INVALID_DATA_FOR_REGISTRY_KEY
//     khsingh     05/13/03 - add message
//     surchatt    05/23/03 - adding message for node not accessible
//     rdasari     05/14/03 - add GET_HOSTNAME_FAIL msg
//     rxkumar     02/05/03 - change text for CRS service
//     rxkumar     02/03/03 - add CRS services related messages
//     dsaggi      11/26/02 - add messages
//     surchatt    11/15/02 - changing message
//     surchatt    11/13/02 - adding new messages
//     dsaggi      10/13/02 - add messages
//     jtellez     08/16/02 - cshea edits
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     rdasari     08/22/02 - add FILE_CREATE_FAIL message
//     dliu        09/07/01 - new mesg.
//     surchatt    02/08/01 -
//     surchatt    02/08/01 - changing for OPS to ORAC name change
//     rxkumar     09/07/00 - add NO_SUCH_NODE
//     surchatt    07/28/00 - adding messages
//     surchatt    06/08/00 - Adding messages related to daemon restart
//     surchatt    06/05/00 - adding failure strings for link and getEnvironment A
//     surchatt    05/15/00 - Messages for cluster component
//     surchatt    05/15/00 - Creation
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrkcMsg.msg /main/48 2018/07/30 07:18:04 jorgepe Exp $
//  *  @author  surchatt
//  *  @since   release specific (what release of product did this appear in)
//  */
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1000, NO_CLUSTER, "No active nodes detected in the cluster"
//  *Cause: The active node list of the cluster could not be retrieved. This could occur if the operating system dependent clusterware was not functioning properly in one or more nodes in the cluster, or because there was no clusterware installed on the system.
// *Action: Check the state of the cluster by running 'lsnodes' binary from your ORACLE_HOME/bin and see if it prints the node list correctly.
/
1001, NO_SUBMIT, "Error submitting commands in the buffer"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1002, PARTIAL_SUCCESS, "Not all the submitted commands completed successfully."
//  *Cause: Some of the submitted commands failed to complete on the nodes specified either because the node in question failed or because communication between the nodes was disrupted.
// *Action: Check that all the specified nodes are up and running or check the details of the failures on the given nodes.
/
1003, INTERRUPTED, "Interrupted while blocked"
//  *Cause: 
// *Action: 
/
1004, COPY_FAIL, "Problem in copying file to nodes"
//  *Cause: Attempted file copy operation(s) from the local node to one or more nodes in the cluster and one or multiple of those copy file operations failed. Possible causes:
//         1) One or more file copy operations to nodes in the cluster failed.
//         2) The destination directory did not have write permission for the user on one or more of the nodes .the source file did not exist.
//         3) The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: 
//         1) Check that the source file exists. 
//         2) Check that all nodes in the cluster are up. 
//         3) Check that destination directory has write permission for the user. 
//         4) On UNIX based platforms check that user can do 'rcp' to all the nodes.
/
1005, REMOVE_FAIL, "Problem in removing file from nodes"
//  *Cause: Attempted file remove operation(s) from the local node to one or more nodes in the cluster and one or multiple of those file remove operations failed. Possible causes:
//         1) One or more nodes failed during the operation.
//         2) The destination directory did not have write permission for the user on one or more of the nodes.
//         3) The source file did not exist.
//         4) The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: Check the accompanying error messages for details.
/
1006, MOVE_FAIL, "Problem in moving file to nodes"
//  *Cause: Attempted file move operation(s) from the local node to one or more nodes in the cluster and one or multiple of those move file operations failed. Possible causes:
//         1)  One or more nodes failed during the operation.
//         2)  The destination directory did not have write permission for the user on one or more of the nodes.
//         3)  The source file did not exist.
//         4)  The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: Check the accompanying error messages for details.
/
1007, DIR_CREATE_FAIL, "Problem in creating directories on the nodes"
//  *Cause:  Attempted directory create operation(s) from the local node to one or more nodes in the cluster and one or multiple of those directory create operations failed. Possible causes:
//         1) One or more nodes failed during the operation.
//         2) The destination directory did not have write permission for the user on one or more of the nodes.
//         3)  The 'rcp' command to one or more nodes failed on UNIX platforms.
// *Action: Check the accompanying error messages for details. 
/
1008, DIR_REMOVE_FAIL, "Problem in removing directories from the nodes"
//  *Cause: 
// *Action: 
/
1009, START_SERVICE, "Failed to start the service on all nodes"
//  *Cause: The service failed to start on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up and look in the clusterware alert log. 
/
1010, STOP_SERVICE, "Failed to stop the service on all nodes"
//  *Cause: The service failed to stop on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up and service is still up on failed nodes. Look in the clusterware alert log.
/
1011, DELETE_SERVICE, "Failed to delete the service from all nodes"
//  *Cause: The service failed to be deleted on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up and service is still registered. Look in the clusterware alert log.
/
1012, CREATE_SERVICE, "Failed to create the service on all nodes"
//  *Cause: The service failed to be created on one or more nodes of the cluster.
// *Action: Check if all the nodes in cluster are up. Look in the clusterware alert log.
/
1013, PREPARE_PHASE, "Prepare phase of transaction failed...transaction rolled back"
//  *Cause: 
// *Action: 
/
1014, SECOND_PHASE, "Second phase of transaction failed...use manual procedures to clean up"
//  *Cause: 
// *Action: 
/
1015, LINK_FAIL, "Problem in creating symbolic links between files"
//  *Cause: 
// *Action: 
/
1016, ENVIRONMENT_FAIL, "Failed to retrieve value of the environment variable \"{0}\", {1}"
//  *Cause: A required environment variable was not defined.
// *Action: Define the environment variable.
/
1017, NO_RESTART, "Problem restarting GSD"
//  *Cause: GSD (Global Services Daemon) could not be started on the local node. This could occur if the operating system dependent clusterware was not functioning properly or there is already a running GSD.
// *Action: Check the state of your clusterware by running 'lsnodes' from ORACLE_HOME/bin. It should list the nodes in the cluster. Try 'gsdctl stop' and then 'gsdctl start' again.
/
1018, NO_COORDINATOR, "Error getting coordinator node"
//  *Cause: This could occur if the operating system dependent clusterware was not functioning properly.
// *Action: Use 'gsdctl stop' on each node to stop the GSDs. Use 'gsdctl start' on each node in the cluster.
/
1019, NO_DAEMON_HANDLE, "Error creating handle to GSD daemon on the node {0}"
//  *Cause: Global Services Daemon was not running on the node.
// *Action: Use 'gsdctl stat' to check the status of the daemon. Use 'gsdctl start' to start it.
/
1020, REMOTE_EXCEPTION, "Exception while executing the operation on the remote node {0}"
//  *Cause: Attempted to execute an operation on the remote node when the Global Services Daemon was not up on the remote node {0}.
// *Action: Start the Global Services Daemon on the remote node using 'gsdctl start'.
/
1021, SKGXN_PROBLEM, "Problem in the clusterware"
//  *Cause: The operating system dependent clusterware could not be contacted. This could occur because the operating system dependent clusterware was not functioning properly.
// *Action: Check the state of the operating system dependent clusterware.
/
1022, NO_SUCH_NODE, "Could not get node name for node {0} in {1}"
//  *Cause: The operating system dependent clusterware could not be contacted. This could occur because the operating system dependent clusterware was not functioning properly.
// *Action:  Check the state of the operating system dependent clusterware using 'lsnodes -n'.
/
1023, INVALID_IP, "Invalid IP address format: {0}"
//  *Cause: The provided IP address was neither an IPv4 nor an IPv6 valid address.
// *Action: Make sure that the IP address is a valid IPv4 or IPv6 address.
/
1024, INVALID_NETMASK, "Invalid netmask: {0}"
//  *Cause: 
// *Action: 
/
1025, FILE_CREATE_FAIL, "Failed to create a file under the filepath {0} because the filepath is not executable or writable"
//  *Cause: The directory of the specified filepath did not have execute or write permission. So the temporary file could not be created to test whether the filepath was shared among nodes.
// *Action: Make the directory of the specified filepath executable and writable.
/
1026, FILE_IO_FAIL, "Failed doing I/O to file {0}"
//  *Cause: 
// *Action: 
/
1027, FILE_EXISTS_FAIL, "Error checking existence of file {0} on {1}"
//  *Cause: 
// *Action: 
/
1028, DIR_WRITABLE_FAIL, "Error checking write permission for directory {0} on  {1}"
//  *Cause: 
// *Action: 
/
1029, MODIFICATION_TIME_FAIL, "Failed to get modification time for file {0} on node {1}, [{2}]"
//  *Cause: 
// *Action: 
/
1030, NODE_ACCESSIBLE_FAIL, "Error checking  accessibility for node {0}, {1}"
//  *Cause: 
// *Action: 
/
1031, FREE_SPACE_FAIL, "Error checking free space for {0} on {1}"
//  *Cause: 
// *Action: 
/
1032, NO_SUCH_DIRECTORY, "Directory {0} does not exist"
//  *Cause: 
// *Action: 
/
1033, NO_SUCH_EXECUTABLE, "Executable {0} does not exist"
//  *Cause: 
// *Action: 
/
1034, NO_LOCAL_NODE_NAME, "No local node name found for host {0}"
//  *Cause: 
// *Action: 
/
1035, NO_NODE_NAMES, "Node names for this cluster could not be retrieved"
//  *Cause: 
// *Action: 
/
1036, NULL_CRSHOME_NAME, "CRS_HOME name passed to the method was null"
//  *Cause: 
// *Action: 
/
1037, LISTED_FILE_REMOVE_FAIL, "Error removing files listed in {0} from node {1}"
//  *Cause: 
// *Action: 
/
1038, LISTED_FILE_COPY_FAIL, "Error copying files listed in {0} to node {1}"
//  *Cause: 
// *Action: 
/
1039, LISTED_DIR_CREATE_FAIL, "Error creating directories listed in {0} on node {1}"
//  *Cause: 
// *Action: 
/
1040, UNKNOWN_REMOTE_SHELL, "Remote Shell is not known yet."
//  *Cause: 
// *Action: 
/
1041, UNKNOWN_REMOTE_COPY, "Remote Copy command is not known yet."
//  *Cause: 
// *Action: 
/
1042, INVALID_REMOTE_SHELL, "The Remote Shell {0} requested by client is not secure and therefore is no longer supported."
//  *Cause: An attempt to configure remote command execution to use the indicated shell was rejected because that shell is insecure and is no longer supported.
// *Action: Retry configuration of remote shell execution using SSH.
/
1043, INVALID_REMOTE_COPY, "The Remote Copy command {0} requested by client is not secure and therefore is no longer supported."
//  *Cause: An attempt to configure remote copy command execution to use the indicated command was rejected because that command is insecure and is no longer supported.
// *Action: Retry configuration of remote copy execution using SCP.
/
1044, REMOTE_SETUP_CHK_FAIL, "Remote command execution setup check for node {0} using shells {1} and {2} failed."
//  *Cause: An attempt to verify the configuration for remote command execution to the indicated node failed because passwordless Secure Shell (SSH) and Remote Shell (RSH) was not set up properly.
// *Action: Ensure that SSH or RSH is configured properly and that it does not prompt for a password or a key, or print extra messages.
/
1045, NULL_NODE_NAME, "Node name is null"
//  *Cause: 
// *Action: 
/
1046, NULL_FILE_LIST, "The file list passed to the method was null"
//  *Cause: 
// *Action: 
/
1047, NULL_DIR_LIST, "The directory list passed to the method was null"
//  *Cause: 
// *Action: 
/
1048, NO_SUPPORT_ON_WINDOWS, "{0} is not supported on Windows platform"
//  *Cause: 
// *Action: 
/
1049, CRS_NOT_SUPPORTED, "CRS is not supported in version {0}. It is supported from version {1} onwards"
//  *Cause: 
// *Action: 
/
1050, EVM_NOT_SUPPORTED, "EVM is not supported in version {0}. It is supported from version {1} onwards"
//  *Cause: 
// *Action: 
/
1051, INVALID_DATA_FOR_REGISTRY_KEY, "Invalid data to set for registry key {0}."
//  *Cause: 
// *Action: 
/
1052, UNKNOWN_REGISTRY_KEY_DATA_TYPE, "Invalid data type for registry key {0}."
//  *Cause: 
// *Action: 
/
1053, ERROR_RETURNED_FROM_NODE, "Error returned from node {0} is \"{1}\""
//  *Cause: 
// *Action: 
/
1054, NODE_NOT_ACCESSIBLE, "Node {0} is not accessible"
//  *Cause: 
// *Action: 
/
1055, NULL_DIR_NAME, "Directory name passed was null"
//  *Cause: 
// *Action: 
/
1056, GET_HOSTNAME_FAIL, "Failed to get the hostname for node {0}"
//  *Cause: 
// *Action: 
/
1057, COMPUTERNAME_MISMATCH, "The computername and hostname do not match for node {0}. Make sure that they match."
//  *Cause: 
// *Action: 
/
1058, HOSTNAME_KEY_NULL, "The hostname registry key {0} has an empty value on node {1}"
//  *Cause: 
// *Action: 
/
1059, COMPUTERNAME_KEY_NULL, "The computername registry key {0} has an empty value on node {1}"
//  *Cause: 
// *Action: 
/
1060, CLUSTER_MISCONFIGURED, "Cluster misconfigured on node \"{0}\", \"{1}\" property in {2} does not match with configured data in Oracle Cluster Registry"
//  *Cause: 
// *Action: 
/
1061, DIR_LIST_ERROR, "Failed to list contents of the directory {0}"
//  *Cause: 
// *Action: 
/
1062, NULL_NODE_LIST, "Node list is null"
//  *Cause: 
// *Action: 
/
1063, INVALID_NODE_LIST, "Node list {0} contained {1} nodes, minimum number of nodes required is {2}"
//  *Cause: 
// *Action: 
/
1064, NODE_LIST_GT_CLUSTER_LIST, "Node list {0} contained {1} nodes whereas the cluster has {2} nodes"
//  *Cause: 
// *Action: 
/
1065, NON_CLUSTER_NODES, "Nodes {0} do not belong to this cluster"
//  *Cause: 
// *Action: 
/
1066, GET_NODE_NUMBER_FAIL, "Failed to retrieve node number for node \"{0}\""
//  *Cause: 
// *Action: 
/
1067, NULL_FILE_NAME, "File name is null"
//  *Cause: 
// *Action: 
/
1068, GET_PRIV_HOSTNAME_FAIL, "Failed to get private interconnect node name for node {0}, {1}"
//  *Cause: 
// *Action: 
/
1069, ERROR_GET_SUBKEY, "Failed to get sub keys of \"{0}\" registry key, {1}"
//  *Cause: 
// *Action: 
/
1070, ERROR_GET_SUBKEY_ON_NODE, "Failed to get sub keys of \"{0}\" registry key on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1071, ERROR_NODE_LIVENESS, "Nodes \"{0}\" did not respond to ping in \"{1}\" seconds, {2}"
//  *Cause: 
// *Action: 
/
1072, NO_SUCH_NODE_FOR_OPERATION, "Invalid node \"{0}\" specified for checking the result of operation."
//  *Cause: 
// *Action: 
/
1073, TRANSFER_DIR_FATAL_ERROR, "Failed to transfer directory \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1074, ERROR_MSG_ON_NODE, "Error on node {0}:{1}"
//  *Cause: 
// *Action: 
/
1075, NO_USER_EQUIVALENCE, "User equivalence does not exist with nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1076, NULL_ORACLE_HOME, "Oracle Home is null"
//  *Cause: 
// *Action: 
/
1077, INVALID_FILES_SPECIFIED, "List file {0} has the following invalid files:{1}"
//  *Cause: 
// *Action: 
/
1078, TRANSFER_LISTED_DIRS_FATAL_ERROR, "Failed to transfer directories listed in \"{0}\" to any of the given nodes \"{1}\": {2}"
//  *Cause: 
// *Action: 
/
1079, NOT_SUBSET_OF_ORACLE_HOME, "{0} is not contained within an Oracle Home"
//  *Cause: 
// *Action: 
/
1080, TRANSFER_FILE_FATAL_ERROR, "Failed to transfer file \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1081, TRANSFER_LISTEDFILE_FATAL_ERROR, "Failed to transfer listed files in \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1082, CREATE_LISTED_DIR_FATAL_ERROR, "Failed to create listed directory in \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1083, REMOVE_LISTED_DIR_FATAL_ERROR, "Failed to remove listed directory in \"{0}\" to any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1084, CREATE_PATH_ERROR, "Failed to create path \"{0}\" in any of the given nodes \"{1}\". {2}"
//  *Cause: 
// *Action: 
/
1085, GET_PRIVATE_NODE_NAME_FAIL, "Failed to retrieve Oracle private name for node \"{0}\""
//  *Cause: 
// *Action: 
/
1086, UNKNOWN_PATH_TYPE, "Unknown path type \"{0}\" specified for path \"{1}\" existence check"
//  *Cause: 
// *Action: 
/
1087, GET_NODE_VIP_FAIL, "Failed to retrieve virtual IP for node \"{0}\""
//  *Cause: 
// *Action: 
/
1088, FAILED_TO_LIST_FILES_FOR_TRANSFER, "Failed to recursively list files from the directories specified in file: {0}"
//  *Cause: 
// *Action: 
/
1089, EMPTY_INCL_FILE, "List file {0} is empty."
//  *Cause: 
// *Action: 
/
1090, ERROR_UPDATE_ENV, "Failed to update environment on nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1091, NULL_INCL_LIST_FILE, "The include list file passed is null"
//  *Cause: 
// *Action: 
/
1092, GET_CSS_VOTEDISKS_FAIL, "Failed to retrieve the location of votedisks: {0}"
//  *Cause: 
// *Action: 
/
1093, GET_CRS_SOFTWARE_VERSION_FAIL, "Failed to retrieve the version of crs software on node \"{0}\" : {1}"
//  *Cause: 
// *Action: 
/
1094, GET_CRS_ACTIVE_VERSION_FAIL, "Failed to retrieve the active version of crs: {0}"
//  *Cause: 
// *Action: 
/
1095, ERROR_REGISTER_OCX, "OLE initialization or OCX load error while registering OCX library on nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1096, ERROR_REBOOT_NODE, "Failed to do node reboot on nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1097, NOT_OCX_FILE, "The file, \"{0}\" is not an OCX"
//  *Cause: 
// *Action: 
/
1098, FAIL_TO_CREATE_NEWLIST, "Failed to create new listfile with proper UNC path from the path specified in file: {0}"
//  *Cause: 
// *Action: 
/
1099, NULL_IPADDRESSES, "The host names or IP addresses passed as an argument are null."
//  *Cause: 
// *Action: 
/
1100, PORT_ALREADY_IN_USE, "The network port {0} is already in use."
//  *Cause: 
// *Action: 
/
1101, PORT_NOT_AVAILABLE, "The network port {0} is not available for use."
//  *Cause: 
// *Action: 
/
1102, NOT_LOCAL_CSS_ERROR, "CSS is not configured with local-only OCR on node \"{0}\""
//  *Cause: 
// *Action: 
/
1103, CHECK_CSS_STATUS_FATAL_ERROR, "Failed to check CSS status for any of the given nodes \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1104, PROP_NOT_FOUND_IN_FILE_ERROR, "Property, \"{0}\" is not found in file \"{1}\""
//  *Cause: 
// *Action: 
/
1105, LOCAL_CSS_HOME_FAIL, "Failed to retrieve the local CSS home for node \"{0}\""
//  *Cause: 
// *Action: 
/
1106, REMOVE_FILE_FAILED, "Failed to remove file \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1107, LINK_FILE_FAILED, "Failed to create symbolic link from file \"{0}\" to \"{1}\" on node \"{2}\", {3}"
//  *Cause: 
// *Action: 
/
1108, COPY_FILE_FAILED, "Failed to copy file \"{0}\" on node \"{1}\" to file \"{2}\" on node \"{3}\", {4}"
//  *Cause: 
// *Action: 
/
1109, MOVE_FILE_FAILED, "Failed to move file \"{0}\" to file \"{1}\" on node \"{2}\", {3}"
//  *Cause: 
// *Action: 
/
1110, CREATE_DIR_FAILED, "Failed to create directory \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1111, REMOVE_DIR_FAILED, "Failed to remove directory \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1112, LIST_DIR_FAILED, "Failed to list contents of directory \"{0}\" on node \"{1}\", {2}"
//  *Cause: 
// *Action: 
/
1113, NO_SUCH_DIR_ON_NODE, "Directory \"{0}\" does not exist on node \"{1}\""
//  *Cause: 
// *Action: 
/
1114, NULL_REG_KEY_NAME, "Registry key name is null"
//  *Cause: 
// *Action: 
/
1115, NULL_REG_SUBKEY_NAME, "Registry subkey name is null"
//  *Cause: 
// *Action: 
/
1116, REG_CREATE_KEY_FAILED, "Failed to create registry subkey \"{0}\" under key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1117, REG_DELETE_KEY_FAILED, "Failed to delete registry subkey \"{0}\" under key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1118, REG_EXIST_KEY_FAILED, "Failed to check existence of registry key \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1119, SET_REG_DATA_FAILED, "Failed to set data for value \"{0}\" of registry key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1120, GET_REG_DATA_FAILED, "Failed to retrieve data for value \"{0}\" of registry key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1121, DELETE_REG_VALUE_FAILED, "Failed to delete value \"{0}\" of registry key \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1122, NULL_SVC_NAME, "Service name is null"
//  *Cause: 
// *Action: 
/
1123, CREATE_SVC_FAILED, "Failed to create service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1124, CREATE_SVC_DEP_FAILED, "Failed to create service dependency between services \"{0}\" and \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1125, START_SVC_FAILED, "Failed to start service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1126, STOP_SVC_FAILED, "Failed to stop service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1127, DELETE_SVC_FAILED, "Failed to delete service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1128, INVALID_IF_PARAM_TYPE, "Invalid Interface type {0} is specified as an argument."
//  *Cause: 
// *Action: 
/
1129, INVALID_IP_PARAM_TYPE, "Invalid IP address type {0} is specified as an argument."
//  *Cause: 
// *Action: 
/
1130, NULL_VERSION, "Version argument is null."
//  *Cause: 
// *Action: 
/
1131, SET_USER_PERMS_FAILED, "Failed to set user permissions on path {0} on nodes {1}, [{2}]"
//  *Cause: 
// *Action: 
/
1132, SET_ADMIN_PERMS_FAILED, "Failed to set administrator permissions on path {0} on nodes {1}, [{2}]"
//  *Cause: 
// *Action: 
/
1133, NULL_DEPENDENCY_LIST, "The list of services, on which the service \"{0}\" is dependent, is null."
//  *Cause: 
// *Action: 
/
1134, REMOVE_SVC_DEP_FAILED, "Failed to remove service dependency between services \"{0}\" and \"{1}\" on node \"{2}\", [{3}]"
//  *Cause: 
// *Action: 
/
1135, INVALID_REG_KEY_NAME, "Registry key name {0} is not valid, it must be fully defined registry key path"
//  *Cause: 
// *Action: 
/
1136, UNABLE_TO_FIND_DBVERSION, "Unable to find version for database with name  {0} "
//  *Cause: 
// *Action: 
/
1137, UNABLE_TO_FIND_VERSION, "Unable to find Version object with string value {0} "
//  *Cause: 
// *Action: 
/
1138, CHECK_SVC_FAILED, "Failed to check the state of service \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: 
// *Action: 
/
1139, CHECK_OCR_CONFIGURED_FAILED, "Failed to check the state of ocr configuration on node \"{0}\""
//  *Cause: 
// *Action: 
/
1140, CHECK_OLR_CONFIGURED_FAILED, "Failed to check the state of olr configuration on node \"{0}\""
//  *Cause: 
// *Action: 
/
1141, SI_HA_NOT_SUPPORTED, "Oracle Restart is not supported in version {0}. It is supported from version {1} onwards"
// *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1142, NULL_USER_NAME, "User name is null"
//  *Cause: 
// *Action: 
/
1143, NULL_DOMAIN_NAME, "Domain name is null"
//  *Cause: 
// *Action: 
/
1144, FILE_NOT_FOUND, "File \"{0}\" not found."
//  *Cause: The file was not found in the file system.
// *Action: Make sure that the file exists in the file system.
/
1145, UMASK_FAILED, "Failed to execute umask: {0}"
//  *Cause: 
// *Action: 
/
1146, INVALID_PERMISSION, "Invalid permissions"
//  *Cause: 
// *Action: 
/
1147, INVALID_GROUP_REQUESTED, "Request to fetch an invalid group type \"{0}\" "
//  *Cause: 
// *Action: 
/
1148, GET_LOCAL_HOSTNAME_FAILED, "Failed to get host name for the local computer"
// *Cause: An error occurred while attempting to retrieve the TCP/IP host name
           via an Operating System interface. Additional messages describing 
           this error will also appear.
// *Action: Correct the problem indicated by the accompanying error messages.
/
1149, GET_OCR_LOCATIONS_FAILED, "Failed to get OCR locations"
// *Cause: An error occurred while attempting to retrieve the OCR locations, possibly due to missing or incorrrect OCR locations file, or incomplete OCR configuration, or due to missing or incorrect SRVM shared libraries.
// *Action: Verify that the Clusterware has been correctly installed and configured. Verify that the ocr.loc file is present and readable in the appropriate location for your platform.
/
1150, ERROR_GET_DRIVE_LETTERS, "Failed to get drive letters used on following nodes: \"{0}\" "
// *Cause: An error occurred while attempting to retrieve used drive letters on one or more nodes.
// *Action: Look at the accompanying messages and fix the error(s). The messages typically relate to a node not being reachable, or the remote execution service not running on the node, or some permissions issue when attempting to use the remote execution service on the remote node.
/
1151, PATH_DOES_NOT_EXIST, "The given path \"{0}\" does not exist"
// *Cause: The specified path may not have been created or an incorrect path has been specified.
// *Action: Make sure that the given path exists by specifying a correct existing path.
/
1152, PATH_NOT_DIRECTORY, "The specified path \"{0}\" is not a directory"
// *Cause: The specified path may be a file, not a directory, or an incorrect path may have been specified.
// *Action: Make sure to specify a path that is a valid directory path.
/
1153, REMOTE_EXEC_DIR_NOT_AVAIL, "No directory is available on the remote node \"{0}\" to copy the binary RemoteExecService.exe"
// *Cause: Either the path defined by value of registry key HKEY_LOCAL_MACHINE/System/CurrentControlSet/Services/OracleRemExecService is not available on the remote node, or the c:/temp/ directory is not available or not accessible on the specified remote node. 
// *Action: Make sure that the required path is available on the remote node.
/
1154, GET_SIHA_SOFTWARE_VERSION_FAIL, "Failed to retrieve the version of siha software on node \"{0}\" : {1}"
//  *Cause: 
// *Action: 
/
1155, TRIVIAL_NODE_LIST, "The node list provided had only one entry or had multiple entries that were duplicates of a single nodename entry"
//  *Cause: The list of nodes provided for the shared path check was either only one node, or the list included entries that were duplicates of the same single node.
// *Action: Please provide the correct nodelist for the cluster on which the check is being called, making sure that there are at least two distinct entries.
/
1156, RAW_DEVICE_VALIDATION_FAIL, "Failed to validate raw device \"{0}\" -- Details: {1}"
//  *Cause: The raw device was not an existing device that could be opened and recognized by the OS as a "raw/character" device type.
// *Action: Make sure the supplied value identifies a valid raw device that can be opened as a "raw/character" device type.
/
1157, RAW_DEVICE_VALIDATION_FAIL_NESTED_EXCEPTION, "Failed to validate raw device \"{0}\""
//  *Cause: The raw device was not an existing device that could be opened and recognized by the OS as a "raw/character" device type.
// *Action: Make sure the supplied value identifies a valid raw device that can be opened as a "raw/character" device type.
/
1158, DEVICE_VALIDATION_FAIL, "Failed to validate raw device \"{0}\" -- Details: {1}"
//  *Cause: The device was not an existing device that could be opened and recognized by the OS as either "raw/character" or a "block" device type.
// *Action: Make sure the supplied value identifies a valid device that can be opened as a "raw/character" or "block" device type.
/
1159, DEVICE_VALIDATION_FAIL_NESTED_EXCEPTION, "Failed to validate device \"{0}\""
//  *Cause: The device was not an existing device that could be opened and recognized by the OS as either "raw/character" or a "block" device type.
// *Action: Make sure the supplied value identifies a valid device that can be opened as a "raw/character" or "block" device type.
/
1160, ERROR_READ_ENV_VARIABLE, "Failed to retrieve the value of environment variable \"{0}\" on following nodes: \"{1}\", [{2}]"
// *Cause: An error occurred while attempting to retrieve value of environment variable on one or more nodes due to the node not being reachable, or the remote execution service not running on the node,
//         or some permissions issue when attempting to use the remote execution service on the remote node.
// *Action: Look at the accompanying messages and respond accordingly. 
/
1161, GET_WIN_DOMAIN_FAILED, "Failed to retrieve the Windows domain on following nodes: \"{0}\""
// *Cause: An error occurred while attempting to retrieve the Windows domain on one or more nodes. The possible causes include:"
//         - A node is not reachable.
//         - Remote execution service is not running on the node.
//         - Permissions problems prevented use of remote execution service on a node.
// *Action: Look at the accompanying messages and respond accordingly. 
/
1162, NOT_A_FILE, "\"{0}\" is not a file" 
//  *Cause: The indicated object was expected to be a file, but it was not.
// *Action: Make sure that the indicated object is a file and not a directory.
/
1163, NO_STORAGE_TYPE, "{0} Exception occurred while determining validity of storage type." 
//  *Cause: An error occurred while getting storage type of the given path. Null arguments might have been passed.
// *Action: Make sure that the native api is passing non null arguments.
/
1164, INVALID_REMOTEEXEC_COMMAND, "invalid command or arguments"
// *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1165, ERROR_REMOTEEXEC_SETUP, "Failed to set up Windows service OracleRemoteExecService on node '{0}'"
//  *Cause: An error occurred while setting up OracleRemoteExecService on the specified nodes."
// *Action: Look at the accompanying messages and respond accordingly. 
/
1166, PARTIAL_SHAREDNESS, "Storage is partially shared. Details: {0}"
//  *Cause: A subset of the nodes provided shared the given filesystem path with the local node.
// *Action: Mount the NFS filesystem on the node(s) that do not share the filesystem path.
/
1167, ERROR_RESOLVE_PATH, "Failed to resolve the specified path \"{0}\" to its physical path on following nodes: \"{1}\", [{2}]"
// *Cause: An error occurred while attempting to resolve the path on one or more nodes due to the node not being reachable, the remote execution service not running on the node,
//         or some permissions issue when attempting to use the remote execution service on the remote node.
// *Action: Look at the accompanying messages and respond accordingly.
/
1168, INVALID_IP_OR_UNKNOWN_HOST, "The supplied IP address \"{0}\" is invalid or specifies an unknown host name"
//  *Cause: The provided string had an invalid IP address format or could not be resolved to a known host name.
// *Action: Make sure that the IP address has a valid IPv4 or IPv6 address format or that it resolves to a known host name. 
/
1169, INVALID_IPV6_ADDRESS, "The supplied IPv6 address \"{0}\" is invalid"
//  *Cause: The provided string had not the correct IPv6 address format.
// *Action: Make sure that the IP address has a valid IPv6 address format. 
/
1170, IPV6_PREFIX_LENGTH_OUT_OF_RANGE, "The IPv6 prefix length \"{0}\" is out of the allowed range of 0 to 128"
//  *Cause:The specified IPv6 prefix length was out of the allowed range.
// *Action: Make sure that the IPv6 prefix length is an integer from 0 to 128. 
/
1171, UNEXPECTED_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1172, PREFIX_LENGTH_IS_NOT_AN_INTEGER, "The supplied IPv6 prefix length \"{0}\" is not an integer"
//  *Cause: The provided string for the IPv6 prefix length was not an integer.
// *Action: Make sure that the IPv6 prefix length is an integer from 0 to 128.
/
1173, VIPNAME_DOES_NOT_RESOLVE_TO_ADDRESS_OF_GIVEN_TYPE, "VIP name \"{0}\" does not resolve to an {1} address matching the netmask or prefix length {2}"
//  *Cause: The VIP name did not resolve to the IP address type specified by the netmask or prefix lengths.
// *Action: Make sure that the VIP name resolves to the IP address type which is indirectly specified by the netmask or prefix length.
/
1174, PINGABILITY_VERIFICATION_ERROR, "Failed to verify whether the following IP addresses are reachable or not: {0}"
// *Cause: A network error occurred while attempting to reach the specified IP addresses.
// *Action: Use an Operating System command such as 'ping' or 'traceroute' to determine accessibility of the IP address.
/
1175, COPY_DIR_FAIL, "Failed to copy directories \"{0}\" to one or more nodes"
//  *Cause:  An attempt to copy file system directories from the local node to one or more nodes in the cluster failed. Possible causes:
//         1) One or more nodes failed during the copy operation.
//         2) The user does not have write permission for a given destination directory on one or more of the nodes.
//         3) The user does not have read access to files or directories being copied.
//         4) On UNIX or Linux platforms, the 'scp' command failed.
// *Action: Check the accompanying error messages for details. 
/
1176, DIR_LIST_FAILED, "Failed to list contents of directory \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to list the contents of the indicated directory failed. Possible causes: 
//         -  The specified directory does not exist.
//         -  One or more nodes failed during the operation.
// *Action: Check the accompanying error messages for details.
/
1177, INVALID_VERSION, "The format of the specified version \"{0}\" is invalid."
//  *Cause: An attempt to compare the target version against the software version failed because the specified version was not valid.
// *Action: Specify a version number that is one to five sequences of decimal digits separated by periods.
/
1178, FAILED_COMMAND_EXECUTION, "failed to execute the command \"{0}\" due to the following error:\n{1}"
//  *Cause: An attempt to execute the command failed due to the indicated error.
// *Action: Examine the error text displayed in this message and act accordingly.
/
1179, INVALID_PARAM_VALUE, "Parameter {0} value is not valid."
//  *Cause: This is an internal error. The value for the specified parameter was invalid, null or an empty string.
// *Action: Contact Oracle Support Services.
/
1180, PARTIALLY_SHARED_CFS, "unable to validate whether the path is shared on some nodes"
//  *Cause: An attempt to write or list the contents from the specified path failed because one or more nodes did not share the file system path. Possible causes are:
//         -  The specified directory did not exist.
//         -  The user does not have write permission for the given file system path on one or more nodes.
//         -  One or more nodes failed during the operation.
// *Action: Ensure that the file system is mounted on all nodes. Check the accompanying error messages for details and retry the operation. 
/
1181, USER_EQUIV_CHECK_FAILED, "User equivalence check failed on all nodes."
//  *Cause: An attempt to connect to nodes in order to execute the shell command using RSH or SSH failed.
// *Action: Ensure the following:
//          - That all nodes are reachable.
//          - That SSH or RSH is configured properly on the target node.
//          - That the SSH daemon on the target node is alive.
/
1182, PING_FAILED, "failed to verify whether the nodes are accessible on the network and running"
// *Cause: A network error occurred while attempting to reach the nodes.
// *Action: Make sure that all nodes are running normally and reachable on the network. 
/
1183, SHAREDPATH_CLEANUP_REQUIRED, "Warning: failed to remove the per-node temporary file created under the shared path in some of the nodes"
// *Cause: An attempt to delete the temporary file from the shared path failed.
// *Action: Check the accompanying error message for the affected nodes and remove the associated files as indicated.
/
1184, CANNOT_READ_FILE, "File \"{0}\" is a non-readable file" 
// *Cause: The user did not have read permissions to open the file.
// *Action: Modify the file permissions so that the file becomes readable or 
//  execute the command from an operating system user ID with the required 
//  privileges.
/
1185, CANNOT_WRITE_TO_FILE, "failed to write to file \"{0}\""
// *Cause: An attempt to write to the given file failed.
// *Action: Modify the file permissions so that the file becomes writable or 
//  execute the command from an operating system user ID with the required 
//  privileges.
/
1186, TRANSFER_DIR_FAILED, "failed to transfer directory \"{0}\""
// *Cause: An error occurred while executing the transfer directory command.
// *Action: Check the accompanying error messages and proceed as indicated.
/
1187, REGEX_ERROR, "The regular expression \"{0}\" is not supported."
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1188, NOT_ABSOLUTE_PATH, "Directory \"{0}\" is not an absolute path name."
// *Cause: The indicated directory could not be created because it was not an 
//         absolute path.
// *Action: Ensure that the directory specified is an absolute path. It should
//          either be a Universal Naming Convention (UNC) path or begin with a
//          drive letter specification.
/
1189, DIR_ALREADY_EXISTS, "Directory \"{0}\" already exists on node \"{1}\"."
// *Cause: The indicated directory could not be created on the indicated node
//         because it already existed.
// *Action: Make sure that the indicated directory path does not exist on the
//          indicated node. 
/
1190, DIR_CHANGE_MODE_FAIL, "failed to change permissions of directories on the nodes: {0}"
//  *Cause:  An attempt to change permissions of one or more directories on one or more remote cluster nodes did not complete correctly. Possible causes:
//         1) One or more nodes failed during the operation.
//         2) The 'chmod' command to one or more nodes failed.
// *Action: Examine the accompanying error message for details, resolve the issues raised and retry the command.
/
1191, SSH_REMOTE_SETUP_CHK_FAIL, "Remote command execution setup check for node {0} using shell {1} failed."
//  *Cause: An attempt to verify the configuration for remote command execution to the indicated node failed because passwordless Secure Shell (SSH) was not set up properly.
// *Action: Ensure that SSH is configured properly and that it does not prompt for a password or a key, or print extra messages.
/
1192, NO_IP_PART_OF_SUBNET, "cannot find a local IP address on network {0}"
// *Cause: An attempt to select an IP address failed because there were no locally configured IP addresses on the indicated network.
// *Action: Ensure the networks selected in the installation are correctly configured.
/
1193, CHECK_OR_PLUS_CONFIGURED_FAILED, "failure encountered while checking the configuration of the Oracle Restart on node \"{0}\""
// *Cause: An error occurred while retrieving the Oracle Restart configuration, 
//         possibly due to one of the following:
//         - A missing or incorrect Oracle Local Registry configuration file.
//         - An incomplete configuration.
//         - Incorrectly installed Grid Infrastructure.
// *Action: Verify that Oracle Grid Infrastructure is correctly installed and 
//          configured. Verify that the olr.loc file is present and readable 
//          in the appropriate location for your platform.
/
1194, FAILED_COMPARE_RU, "illegal release update version comparison attempted: version {0} to version {1}"
// *Cause: An attempt to compare the release update versions of the indicated
//         composite versions was rejected because the major versions were
//         different. This was an internal error.  
//*Action: Contact Oracle Support Services.
/
1195, FAILED_COMPARE_RUR_DIFMAJ, "illegal release update revision version comparison attempted: version {0} to version {1}"
// *Cause: An attempt to compare the release update revision versions of the
//         indicated composite versions was rejected because the major versions
//         were different. This was an internal error.  
//*Action: Contact Oracle Support Services.
/
1196, FAILED_COMPARE_RUR_DIFRU, "illegal release update revision version comparison attempted: version {0} to version {1}"
// *Cause: An attempt to compare the release update revision versions of the
//         indicated composite versions was rejected because the release update
//         versions were different. This was an internal error.  
//*Action: Contact Oracle Support Services.
/
1197, PERMISSION_DENIED_OLSNODES, "Failed to retrieve cluster nodes because user is missing read, write or execute permissions for the configured Oracle base directory."
// *Cause: An attempt to execute the 'olsnodes' binary failed because the user 
//         did not have read, write and execute permissions for the
//         Oracle base directory.
//*Action: Set read, write and execute permissions for the user on the Oracle
//         base directory, and then retry 
//         the operation.
/
1198, IS_PATHONACFS_FAIL, "Error checking whether path {0} is on ACFS on nodes {1}"
// *Cause:  An attempt to determine if the specified path is on ACFS failed.
//     This can occur because:
//     1. The Clusterware stack is down on the specified nodes.
//     2. ASM is down 
//     3. A diskgroup associated with the path is not online.
//     4. The path is not mounted.
// *Action: Perform checks corresponding to the above causes:
//     1. Ensure the Clusterware stack is running on the specified nodes.
//     2. Ensure that ASM is running.
//     3. Ensure that the diskgroup associated with the path is online.
//     4. Ensure that the file system is mounted on the nodes.
/
1199, FILE_EXISTS_FAILED, "failed to check whether the file \"{0}\" exists on nodes \"{1}\""
//  *Cause: An attempt to check whether the specified file existed failed.
//          One or more nodes might have failed during the operation.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation. Ensure that the 
//          indicated file exists on the indicated nodes.
/
1200, DIRECTORY_IS_EMPTY_FAILED, "failed to check whether the directory \"{0}\" is empty on nodes \"{1}\""
//  *Cause: An attempt to check whether the specified directory was empty
//          failed. 
//          One or more nodes might have failed during the operation.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation. Ensure that the 
//          indicated directory is empty on the indicated nodes.
/
1201, DIRECTORY_IS_WRITABLE_FAILED, "failed to check whether the directory \"{0}\" is writable on nodes \"{1}\""
//  *Cause: An attempt to check whether the specified directory was writable
//          failed. 
//          One or more nodes might have failed during the operation.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation. Ensure that the 
//          indicated directory is empty on the indicated nodes.
/
1210, PATH_INFO_FAILED_NODE, "failed to retrieve the details for path \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve the ownership and permissions for the
//          indicated path failed on the indicated node. 
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation. Ensure that the 
//          indicated path exists on the indicated node.
/
1211, USER_INFO_FAILED_NODE, "failed to retrieve the details for user \"{0}\" on node \"{1}\""
//  *Cause: An attempt to check whether the indicated user exists on the 
//          indicated node failed.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation.
/
1212, USER_ID_INFO_FAILED_NODE, "failed to retrieve the details for user with UID \"{0}\" on node \"{1}\""
//  *Cause: An attempt to check whether the indicated user ID exists on the 
//          indicated node failed.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation.
/
1213, GROUP_INFO_FAILED_NODE, "failed to retrieve the details for group \"{0}\" on node \"{1}\""
//  *Cause: An attempt to check whether the indicated group exists on the 
//          indicated node failed.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation.
/
1214, GROUP_ID_INFO_FAILED_NODE, "failed to retrieve the group name with GID \"{0}\" on node \"{1}\""
//  *Cause: An attempt to check whether the indicated group ID exists on the 
//          indicated node failed.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation.
/
1215, CHECK_LXC_MEMORY_FAILED_NC, "failed to retrieve the memory allocated because the local node is not a container"   
//  *Cause: An attempt to retrieve the allocated memory for the local node 
//          failed because the operation is only supported on Linux Containers.
// *Action: Retry the operation in a Linux Container.
/
1216, CHECK_LXC_MEMORY_FAILED, "failed to retrieve the memory allocated for local Linux Container"
//  *Cause: An attempt to retrieve the allocated memory for the local node 
//          failed.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation.
/
1217, CHECK_IS_LXC_FAILED, "failed to check whether local node is a Linux Container"
//  *Cause: An attempt to check whether the local node is a Linux Container 
//          failed.
// *Action: Check the accompanying error messages for details, resolve the 
//          reported problems, and retry the operation.
/