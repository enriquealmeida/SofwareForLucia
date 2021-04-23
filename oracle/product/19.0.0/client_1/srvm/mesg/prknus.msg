// Copyright (c) 2008, 2017, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrknMsg.msg
//
// DESCRIPTION
//    Message file for oracle.ops.mgmt.nativesystem package
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     10/09/17 - Fix bug 26817825
//     vinavish    08/27/17 - fix bug 25497082
//     rdesale     04/24/16 - add Unknown Host Exception error message
//     kamramas    12/09/14 - Add sharedness check error
//     ptare       03/23/13 - Add message for failure in current user name
//                            retrieval.
//     spavan      11/09/12 - fix bug13464164 - display better error message
//                            for dir create/remove failure
//     dsaggi      03/07/12 - Add message related to equivalence check
//     xesquive    02/07/12 - Bug fix 13566257
//     yizhang     05/26/11 - Define NONE_EMPTY_OUTPUT
//     ccharits    12/03/10 - Added message PARTIAL_SHAREDNESS_WITH_LOCALNODE
//     spavan      11/24/10 - add new message for unknown host
//     agorla      10/11/10 - read from console error
//     dsaggi      10/27/06 - add UNKNOWN_LOCAL_HOST_NAME
//     dsaggi      05/17/05 - correct upgrade/downgrade text
//     dsaggi      05/13/05 - error getting release version 
//     rxkumar     01/11/05 - add UNKNOWN_LIBRARY 
//     rxkumar     01/26/05 - fix bug4046190 
//     rxkumar     01/20/05 - fix bug4130989 
//     bhamadan    01/10/05 - adding FILE_NOT_FOUND_IN_DIRS 
//     bhamadan    11/03/04 - adding markServiceDelete related msgs 
//     sowong      11/01/04 - add error message for query service dependency 
//     rxkumar     10/22/04 - fix bug3960238 
//     bhamadan    09/08/04 - adding DIR_CREATE_ERR 
//     sowong      08/06/04 - add API_NOT_SUPPORTED_ON_LOCALNODE 
//     bhamadan    07/08/04 - adding REMEXEC_ERR, CPY_ERR,SERVICE_CREATE/START_ERR
//     rxkumar     06/04/04 - add ERROR_ENV msg 
//     rxkumar     05/17/04 - add API_NOT_SUPPORTED 
//     rxkumar     07/28/03 - add GET_REGKEY_DATA_FAILED
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     jtellez     07/17/02 - add NotAClusterException
//     jtellez     05/24/02 - load lib change
//     jtellez     05/23/02 - add internal error
//     jtellez     05/17/02 - Add load library failure
//     rdasari     08/08/01 - Merged rdasari_nativecode_changes
//     rdasari     07/30/01 - Adding generic error messages for clusterware errors and native OS errors.
//     rdasari     07/19/01 - Adding more messages,.
//     rdasari     06/26/01 - adding more messages.
//     rdasari     06/26/01 - Creation
//  */
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/resources/PrknMsg.msg /main/14 2017/10/19 21:31:32 yizhang Exp $
//  *  @author  rdasari 
//  *  @since   release specific (what release of product did this appear in)
//  */
// 
// PACKAGE=package oracle.ops.mgmt.resources;
// MSGIDTYPE=interface
1001, BIG_GRPNAME, "Groupname cannot exceed 12 characters"
//  *Cause: 
// *Action: 
/
1002, REG_CW_FAIL, "Could not register with the clusterware"
//  *Cause: 
// *Action: 
/
1003, INIT_CW_FAIL, "Unable to initialize with the clusterware"
//  *Cause: 
// *Action: 
/
1004, OUT_OF_MEM, "Cannot allocate memory"
//  *Cause: 
// *Action: 
/
1005, BIG_DATA, "Too big private or public member data"
//  *Cause: 
// *Action: 
/
1006, CW_ERR, "Error from the Clusterware layer"
//  *Cause: 
// *Action: 
/
1007, OS_ERR, "Error from the Operating System layer"
//  *Cause: 
// *Action: 
/
1008, FAILURE_LOADING_SHARED_LIB, "Unable to load the shared library \"{0}\"\n  or a dependent library, from\n  {1}=\"{2}\"\n  [{3}]"
//  *Cause: 
// *Action: 
/
1009, NATIVE_INTERNAL_ERROR, "Native System Internal Error"
//  *Cause: 
// *Action: 
/
1010, NOT_A_CLUSTER, "This system is not properly configured as a cluster."
//  *Cause: 
// *Action: 
/
1011, GET_REGKEY_DATA_FAILED, "Failed to retrieve value for \"{0}\" under registry key \"{1}\" on node \"{2}\", {3}"
//  *Cause: 
// *Action: 
/
1012, API_NOT_SUPPORTED, "\"{0}\" API is not supported on \"{1}\" platform"
//  *Cause: 
// *Action: 
/
1013, ERROR_ENV, "Failed to locate \"{0}\", set \"{1}\" environment variable to installed path of {2}"
//  *Cause: 
// *Action: 
/
1014, REMEXEC_ERR, "Failed to execute remote command \"{1}\" on node \"{0}\"."
//  *Cause: 
// *Action: 
/
1015, CPY_ERR, "Failed to copy file \"{0}\" to destination \"{1}\" on node \"{2}\", Error: \"{3}\". "
//  *Cause: 
// *Action: 
/
1016, SERVICE_CREATE_ERR, "Failed to create service \"{0}\" on node \"{1}\", Error: \"{2}\"."
//  *Cause: 
// *Action: 
/
1017, SERVICE_START_ERR, "Failed to start service \"{0}\" on node \"{1}\", Error: \"{2}\" ."
//  *Cause: 
// *Action: 
/
1018, API_NOT_SUPPORTED_ON_LOCALNODE, "\"{0}\" API is not supported on the local node"
//  *Cause: 
// *Action: 
/
1019, DIR_CREATE_ERR, "Failed to create directory \"{0}\" on node \"{1}\", Error: \"{2}\" ."
//  *Cause: 
// *Action: 
/
1020, LIB_VERSION_MISMATCH, "The library \"{0}\" version \"{1}\" does not match the expected version \"{2}\""
//  *Cause: 
// *Action: 
/
1021, SERVICE_MARK_DELETE_ERR, "Failed to mark service \"{0}\" for deletion on node \"{1}\", Error: \"{2}\" ."
//  *Cause: 
// *Action: 
/
1022, QUERY_SERVICE_DEPENDENY_FAILED, "Failed to retrieve the dependencies for service \"{0}\" on node \"{1}\". Error: \"{2}\". "
//  *Cause: 
// *Action: 
/
1023, UNKNOWN_DEPENDENCIES, "Some of dependencies specified in the dependency list \"{0}\" are not dependent on the service \"{1}\" on node \"{2}\"."
//  *Cause: 
// *Action: 
/
1024, FILE_NOT_FOUND_IN_DIRS, "Could not find file(s) \"{0}\" in following location(s) \"{1}\"."
//  *Cause: 
// *Action: 
/
1025, FILE_NOT_EXISTS, "File \"{0}\" does not exist on node \"{1}\""
//  *Cause: 
// *Action: 
/
1026, UNKNOWN_HOST_NAME, "Failed to retrieve IP address of unknown host \"{0}\", {1}"
//  *Cause: 
// *Action: 
/
1027, UNKNOWN_LIBRARY, "Cannot load unrecognized library \"{0}\""
//  *Cause: 
// *Action: 
/
1028, GET_RELVER_FAIL, "Failed to retrieve database release version"
//  *Cause: 
// *Action: 
/
1029, UTIL_UPGRADE, "	-upgrade -dbname <database> -orahome <oracle_home_path> upgrade the database configuration to Oracle Database 10.2"
//  *Cause: 
// *Action: 
/
1030, UTIL_DOWNGRADE, "	-downgrade -dbname <database> -orahome <oracle_home_path> -version <versionstring> downgrade the database configuration to Oracle Database 10.0 or 9.2 based on value of versionstring"
//  *Cause: 
// *Action: 
/
1031, UNKNOWN_LOCAL_HOST_NAME, "Failed to retrieve local host name"
//  *Cause: An attempt to retrieve the local host name using Java network functions failed.
// *Action: Ensure that the 'localhost' entry exists in the hosts configuration file.
/
1032, ERROR_READ_FROM_CONSOLE, "error occurred while reading input from user's terminal session."
//  *Cause: An attempt to read input from the standard input failed.
// *Action: Use an operating system command line to run the proper command.
/
1033, PARTIAL_SHAREDNESS_WITH_LOCALNODE, "The following nodes do not share the filesystem path \"{0}\" with node {1}: {2}" 
//  *Cause: A subset of the nodes provided shared the given filesystem path with the local node.
// *Action: Mount the NFS filesystem on the node(s) that do not share the filesystem path.
/
1034, HOST_NAME_UNKNOWN, "Failed to retrieve IP address of host \"{0}\""
//  *Cause: An attempt to retrieve IP address for the host specified failed.
// *Action: Run 'nslookup' on the host name and make sure the name is resolved or add the host name to OS hosts file.
/
1035, HOST_NAME_UNREACHABLE, "Host \"{0}\" is unreachable"
//  *Cause: An attempt to reach the specified host via IP failed.
// *Action: Make sure that the host is up and there are no firewalls blocking connectivity between local node and remote host.
/
1036, REG_KEY_NOT_FOUND, "Windows registry key \"{0}\" not found on node \"{1}\""
//  *Cause: Could not find the specified Windows registry key on the identified node.
// *Action: Contact Oracle Support Services.
/
1037, NONE_EMPTY_OUTPUT, "Unexpected command output on node {0}: \"{1}\""
// *Cause: A remotely-executed command produced output when none was expected.
// *Action: Ensure that ssh or rsh is configured properly on the target node. If it is, contact Oracle Support Services for assistance.
/
1038, UNEXPECTED_CMD_OUTPUT, "The command \"{0}\" run on node \"{1}\" gave an unexpected output: \"{2}\""
// *Cause: A remote-shell command produced an output when none was expected.
// *Action: Ensure that ssh or rsh is configured properly on the specified nodes. If it is, contact Oracle Support Services for assistance.
/
1039, DIR_CREATE_FAILED, "Failed to create directory \"{0}\" on node \"{1}\""
//  *Cause: The specified directory could not be created on the specified node.
// *Action: Ensure that the user is an administrator on the specified node, 
//          that the specified drive has default share configured on it, and
//          that there is enough space in the specified location. Look at
//          accompanying error messages and respond accordingly.
/
1040, DIR_REMOVE_FAILED, "Failed to remove directory \"{0}\" on node \"{1}\""
//  *Cause: The specified directory could not be removed on the specified node.
// *Action: Ensure that the user is an administrator on the specified node, 
//          that the specified drive has default share configured on it. Look
//          at accompanying error messages and respond accordingly.
/
1041, ERROR_GET_CURRENT_USER, "Failed to retrieve the current Windows user name: {0}"
//  *Cause: An attempt to retrieve the current Windows user name failed with the error cited in the message.
// *Action: Ensure that the Windows Domain Server is reachable; log in to the OS as a domain user.  
/
1042, SHAREDNESS_CHECK_FAILED, "Failed to execute sharedness check on remote nodes"
//  *Cause: An attempt to perform sharedness check on given path failed to execute on remote nodes.
// *Action: 
/
1043, UNKNOWN_HOST_EXCEPTION, "unknown host exception for host \"{0}\""
//  *Cause: An invalid IP address or unresolvable host name was specified.
// *Action: If an IP address is specified, then ensure that it is of 
//          legal length and format, and retry the operation. 
//          If a host name is specified, then ensure that the host name 
//          resolves to an IP address, and retry the operation.
/
1044, FAILED_TO_UNLOAD_DLL, "failed to unload DLL {0}\n{1}"
//  *Cause: An attempt to unload the indicated DLL failed. The accompanying
//          error message describes the reason for the failure.
// *Action: Examine the accompanying error messages, correct issues  
//          raised and retry the operation.  
/
1045, GET_COMPOSITE_VER_FAIL, "failed to retrieve composite release version"
//  *Cause: An attempt to retrieve the composite release version failed.
//          The accompanying messages provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the issues identified, 
//          and then retry the operation. 
/