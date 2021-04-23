// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCtMsg.msg
//
// DESCRIPTION
//    Message file which displays errors during the execution of cluster commands.
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      12/03/18 - Backport jorgepe_bug-28968922 from main
//     jorgepe     11/27/18 - Fix bug 28968922: Oraversion -baseVersion
//     pevilla     08/17/18 - Fix lrg 21341429, add SCAN name network mismatch
//     jorgepe     02/02/18 - Fix bug 27346116: Fwd merge bug 27177551
//     yizhang     11/06/17 - fix bug 27046294
//     vinavish    10/12/17 - fix bug 26917437
//     yizhang     10/02/17 - fix bug 26817825
//     rtamezd     09/08/17 - ASMCMD_CP_FAIL & msgs for SQLPLUSUtil.getDirPath()
//     jorgepe     09/04/17 - Fix bug 26735194
//     pevilla     08/17/17 - Fix bug 26585734, add messages for wallet
//     vinavish    07/27/17 - fix bug 26325815
//     ohuerta     05/09/17 - fix bug 25956601
//     pevilla     05/08/17 - Fix bug 26000351, add isVipless
//     ccharits    01/26/17 - Added messages for DHCP Proxy and TFTP
//     maboddu     10/27/16 - Fix bug#24656084 - add
//                            GET_CRS_UPGRADE_STATE_FAIL
//     jorgepe     08/29/16 - bug 22901719
//     ocordova    07/05/16 - Add CRSKeyTool functionality
//     rtamezd     05/05/16 - Bug 23218524: Add ASMCMD_RM_FAIL
//     mavohra     04/28/16 - Fix for bug 22963166
//     yizhang     04/26/16 - fix bug 23120256
//     vgunredd    04/25/16 - non-rolling check
//     ocordova    04/04/16 - Fix bug 23026390
//     iestrada    03/17/16 - Fix bug 22901189
//     pevilla     02/23/16 - Fix bug 22758752, add getScanName messages
//     rtamezd     12/24/15 - Fix bug 20916833: Add ASMCMD_MKDIR_FAIL
//     rdesale     12/11/15 - Fix bug 21535522
//     yizhang     11/18/15 - fix message for bug 21635253
//     epineda     11/11/15 - ER 21842803
//     vgunredd    11/06/15 - fix bug 21881875
//     mavohra     10/13/15 - Adding OSDBAGRP_COMMAD_FAIL_NODE
//     mavohra     10/15/15 - Fix for bug 21130018
//     rtamezd     10/06/15 - Fix bug 20773869: Add 1484, 1485 & 1486
//     epineda     09/29/15 - Bugfix 17527013
//     rdesale     10/07/15 - Fix bug 21821892
//     vgunredd    09/14/15 - Fix bug 21226456
//     iestrada    09/09/15 - Fix bug 20722136
//     rtamezd     08/13/15 - Fix bug 20241436
//     chchatte    07/14/15 - bug 21337731
//     ocordova    07/08/15 - Add mgmtdb credential info
//     yizhang     06/30/15 - fix bug 20409698
//     kamramas    06/26/15 - ER 21229732 getserverpools err
//     epineda     04/28/15 - ER 20473733: ACFSInfo API
//     vgunredd    04/09/15 - Proj 47205 - move SIDBs b/w standalone WCs
//     shhirema    03/18/15 - add error messages for getDGAttribute
//     yizhang     03/16/15 - Implement project 47208
//     epineda     03/02/15 - Project 47408: oradnfs
//     smadabhu    02/05/15 - ER 20475113
//     maboddu     12/09/14 - Fix bug#20078140 - Add error messages for ASM
//                            password file location
//     sparial     12/09/14 - bug 20020815
//     yizhang     08/08/14 - fix bug 18349475
//     rtamezd     05/29/14 - Bug 13944171
//     ksviswan    05/16/14 - XbranchMerge ksviswan_bug-18707931 from
//                            st_has_12.1
//     ptare       04/28/14 - Add error message for ASM SP File retrieval
//                            command failure
//     yizhang     04/15/14 - fix bug 18317489
//     lureyes     02/19/14 - Fix bug 18150000
//     chchatte    01/14/14 - Fix bug 18062322
//     ksviswan    10/31/13 - add sqlplus command tool messages
//     rtamezd     11/26/13 - Fix bug 17771763
//     yizhang     10/22/13 - Add SRVMHELPER_SCRIPT_NOT_FOUND
//     lureyes     10/18/13 - Fix bug 17578221
//     vgunredd    09/24/13 - Fix bug 17327525
//     lureyes     07/29/13 - Fix bug 17167933
//     lureyes     06/11/13 - Fix bug 16822826
//     pevilla     05/06/13 - Fix bug 16214764, add VIPNAME_RESOLVES_TO_IPV4_NETWORK_ERROR
//     sowong      05/02/13 - fix bug15983769
//     pevilla     04/17/13 - Bug 16533505, Add VIP_DOES_NOT_RESOLVE_TO_IPV4
//                            and VIP_DOES_NOT_RESOLVE_TO_IPV6 messages
//     yifyang     04/03/13 - bug-14369286
//     lureyes     03/21/13 - Change OFSUTIL_SNAP_EXIST id number
//     pevilla     02/19/13 - Modify HAVIP_HOSTNAME message
//     ocordova    01/30/13 - Fix Bug 1301932
//     epineda     01/25/13 - Bugfix 14657623
//     satg        01/15/13 - Fix Bug 16044835
//     sowong      11/15/12 - fix bug13879779
//     satg        11/14/12 - Fix bug 14730028
//     maboddu     10/15/12 - Fix bug14373486-Correcting Messages
//     sidshank    10/01/12 - fix bug 14581389.
//     pevilla     08/28/12 - Modify HAVIP_HOSTNAME messages to generic ones
//     maboddu     08/28/12 - Fix bug14373486
//     epineda     08/03/12 - added SRVMHELPER_ADDNFS_FAIL message
//     pevilla     07/26/12 - Add messages for bug 13574713
//     sowong      07/25/12 - fix bug13948332
//     ccharits    06/07/12 - Fixed typo in messages 1421, 1422
//     ccharits    05/10/12 - Added message
//                            VIP_NETWORK_SUBNET_INFO_RETRIEVAL_ERROR
//     ccharits    05/01/12 - Added message VIPNAME_DOES_NOT_RESOLVE_TO_BOTH
//     ccharits    03/16/12 - Added message UNABLE_TO_VALIDATE_INTERFACE_TYPE
//     spavan      02/12/12 - fix bug13491420
//     xesquive    02/07/12 - Bug fix 13566257
//     sowong      01/09/12 - added new message as a result of Sam's review
//                            comment for bug12594616
//     spavan      11/03/11 - message for kfod get disks
//     smadabhu    08/19/11 - Add CLONE_COMMAND_LOCAL_FAILED
//     smadabhu    08/22/11 - Add OLSNODES_GET_ACTIVE_ROLE
//     spavan      07/29/11 - add remote asm support
//     ptare       07/19/11 - Add message for null version assert
//     sravindh    04/28/11 - Fix acfsutil path for Unix and Windows
//     nvira       04/28/11 - add message for checking ASM rolling migration
//     ptare       04/21/11 - Add private IP failure message
//     yizhang     03/17/11 - Define INVALID_HOME_NO_SRVCTL
//     ccharits    02/12/11 - Added message INVALID_IPV6_SUBNET_MASK
//     abhisbg     01/24/11 - Add 1402, SRVCTL_VERSION_FAILED msg
//     sowong      12/02/10 - add new messages for bug9948257
//     ptare       06/07/10 - Add message for empty results in case of
//                            clustername retrieval
//     sowong      05/05/10 - fix bug8652683
//     sravindh    04/21/10 - Bug 9608711
//     sowong      11/23/09 - XbranchMerge sowong_bug-8277348 from
//                            st_has_11.2.0.1.0
//     ksviswan    11/30/09 - Merge changes from st_has_11.2.0.1.0_gen branch
//     sowong      11/13/09 - add UNEXPECTED_INTERNAL_ERROR message
//     rxkumar     07/20/09 - fix bug8344651
//     yizhang     06/08/09 - Add cause and action for messages
//     yizhang     05/26/09 - fix messages
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     ccharits    04/03/09 - add message to validate the number of fields
//                            returned by the oifcfg command
//     sowong      01/13/09 - add messages for bug7522237
//     ccharits    11/07/08 - Add message for getcrshome
//     yizhang     07/10/08 - Add cause and action for
//                            FAILED_TO_GET_LOCAL_NODE_NAME
//     sowong      08/20/08 - add messages for bug7321167
//     spavan      08/21/08 - Add failure message for startRemoteExecServer
//     ccharits    07/28/08 - Add messages for oifcfg
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCsMsg.java
//     sowong      03/17/08 - add messages for asmcmd
//     ksviswan    01/09/08 - addnl messages for olsnodes
//     ksviswan    11/20/07 - add messages for olsnodesutil
//     sravindh    08/30/07 - Add messages for ofsutil
//     sowong      04/10/07 - rename PrktMsg to PrCtMsg
//     nvira       03/21/07 - fix missing resource exception remove
//     nvira       02/27/07 - fix bug5867248
//     nvira       01/12/07 - add message for failure in getting database name
//                            from datbase resource name
//     nvira       01/08/07 - add message for crsctl failure
//     nvira       12/13/06 - Move from oracle/cluster/cmdtools/resources to oracle/cluster/resources
//     rxkumar     11/15/06 - use Enums
//     sowong      10/04/06 - Creation
//  */
//
// /**
//  *  @version $Header: opsm/jsrc/oracle/cluster/resources/PrCtMsg.msg /st_has_19/1 2018/12/05 07:46:01 jorgepe Exp $
//  *  @author  sowong
//  *  @since   release specific (what release of product did this appear in)
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, NULL_FILE_PATH, "File path is null"
//  *Cause: The supplied path is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services..
/
1001, NULL_NODE_NAME, "Node name is null"
//  *Cause: The supplied node name is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1002, COMMAND_TOOL_EXCEPTION, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1003, COMMAND_TOOL_FAIL, "failed to run \"{0}\" on node \"{1}\""
//  *Cause: An attempt to execute the specified command failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details and either retry or contact Oracle Support Services.
/
1004, NULL_DIR_NAME, "Directory name passed was null"
//  *Cause: The supplied directory name is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1005, NO_SUCH_DIRECTORY, "Directory {0} does not exist"
//  *Cause: The supplied directory path does not exist.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1006, FAILED_TO_GET_CLUSTER_NAME, "Failed to retrieve cluster name from node \"{0}\""
//  *Cause: Failed to get the cluster name using the command 'olsnodes -c' from the specified node.
// *Action: Execute the command 'olsnodes -c' from the specified node and check the output of the command. Fix the problem according to the error message given in the command output.
/
1007, FAILED_TO_GET_LOCAL_NODE_NAME, "Failed to retrieve local node name"
//  *Cause: Underlying call failed to get the local hostname.
// *Action: Please check the accompanying error message.
/
1008, FAILED_TO_GET_NODE_NAMES, "Failed to retrieve node names"
//  *Cause: Failed to get the node names using the command 'olsnodes'.
// *Action: Execute the command 'olsnodes' and check the output of the command. Fix the problem according to the error message given in the command output.
/
1009, CRSCTL_FAIL, "crsctl execution failed. Detailed error:\n{0}"
//  *Cause: Failed to execute crsctl command.
// *Action: Examine the accompanying error message for details. 
/
1010, CRSCTL_NODE_FAIL, "crsctl execution failed on node {0}. Detailed error:\n{1}"
//  *Cause: Failed to execute crsctl command on the specified node.
// *Action: Examine the accompanying error message for details.
/
1011, COMMAND_TOOL_LOCAL_NODE_FAIL, "Failed to run \"{0}\". Detailed error: {1}"
//  *Cause: Failed to execute the specified command on the local node.
// *Action: Execute the specified command from the console and check the result. Fix the problem according to the error message given in the command output.
/
1012, INVALID_FILE_PATH, "Invalid file path {0}"
//  *Cause: The supplied path does not exist.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1013, REMOTEEXECSERVER_FAILED_ON_LOCAL_NODE, "failed to start remote execution server on local node"
//  *Cause: An attempt to start the required remote execution server on the local node failed. Detailed failure information is supplied by the accompanying messages.
//  *Action: Correct the problem indicated by the accompanying error messages.  On Windows systems, ensure that the current user has the authority to remove and create directories and files in the 'C:\\Windows\\Temp' directory and to create and delete registry entries.
/
1014, UNEXPECTED_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1015, NULL_VERSION, "Version supplied is null"
//  *Cause: The supplied version was set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1050, KFOD_PARSE_OUTPUT_FAIL, "Failed to parse output returned by kfod when executing kfod at location {0}"
//  *Cause: Failed to parse the output returned by executing kfod because the output string is null or has fewer rows than expected
// *Action: This is an internal error. Contact Oracle Support Services.
/
1051, KFOD_PARSE_OUTPUT_NODE_FAIL, "Failed to parse the output returned by kfod for node {0} when executing kfod at location {1}"
//  *Cause: Failed to parse the output returned by executing kfod on the specified node because the output string is null or has fewer rows than expected.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1052, KFOD_PARSE_VALUE_FAIL, "Failed to parse output {0} returned by kfod when executing kfod at location {1}"
//  *Cause: Failed to parse the output returned by executing kfod because the output has fewer columns than expected.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1053, KFOD_PARSE_VALUE_NODE_FAIL, "Failed to parse output {0} returned by kfod for node {1} when executing kfod at location {2}"
//  *Cause: Failed to parse the output returned by executing kfod on the specified node because the output has fewer columns than expected.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1054, ASM_ACTIVE_VERSION_FAIL, "Fail to retrieve ASM active version for local node"
//  *Cause: Failed to get the active version of ASM by executing 'kfod nohdr=true op=version hostlist=<hostlist>'.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1055, KFOD_ASM_ACTIVE_VERSION_NODE_FAIL, "Fail to retrieve ASM active version for node {0}. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to get the active version of ASM by executing 'kfod nohdr=true op=version hostlist=<hostlist>' on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1056, KFOD_ASM_INSTANCE_TYPE_FAIL, "Fail to retrieve ASM instance type. kfod execution failed at location {0}. Detailed error:\n{1}"
//  *Cause: Failed to get the instance type for ASM instance by executing 'kfod nohdr=true op=version'.
// *Action: Examine the accompanying error messages for details.
/
1057, KFOD_WRONG_ASM_INST_TYPE_OUTPUT, "The value of ASM instance type {0} is not correct"
//  *Cause: The value of ASM instance type is invalid.
// *Action: The instance type of ASM can only be YES or NO.
/
1058, KFOD_CHECK_ASM_RUNNING_FAIL, "Fail to check if ASM is running on node {0}. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to check whether ASM is running by executing 'kfod nohdr=true op=insts hostlist=<hostlist>'.
// *Action: Examine the accompanying error messages for details.
/
1059, KFOD_GET_DISKGROUP_NAMES_FAIL, "Fail to retrieve list of disk group names for node {0}. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to get the diskgroup names by executing 'kfod nohdr=true op=groups hostlist=<hostlist>'.
// *Action: Examine the accompanying error messages for details.
/
1060, KFOD_CHECK_RM_FAIL, "Fail to check if ASM is in rolling migration. kfod execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to check whether ASM is in rolling migration by executing 'kfod nohdr=true op=rm'.
// *Action: Examine the accompanying error messages for details.
/
1061, KFOD_VERIFY_WRAP_FAIL_PRE_CRSINST, "Failed to verify ASM client credentials file \"{0}\"\n{1}"
//  *Cause: An attempt to verify that the ASM client credentials file specified is a valid credentials file failed.
// *Action: Examine the accompanying error messages for details.
/
1062, KFOD_VERIFY_WRAP_FAIL_POST_CRSINST, "Failed to verify ASM client credentials.\n{0}"
//  *Cause: An attempt to verify the ASM credentials for this client cluster failed.
// *Action: Examine the accompanying error messages for details.
/
1063, KFOD_GET_ASM_DISKS_FAIL, "Failed to get list of disks managed by ASM on node \"{0}\"\n{1}"
//  *Cause: An attempt to obtain the list of disks that are managed by ASM on the specified node failed.
// *Action: Examine the accompanying error messages for details.
/
1064, KFOD_GET_ASM_DEFAULT_DISKSTR_FAIL, "Failed to get ASM default disk discovery string \n {0}"
//  *Cause: An attempt to obtain the ASM default disk string failed.
// *Action: Examine the accompanying error messages for details.
/
1065, KFOD_GET_MISSIZED_ASM_DISKS_FAIL, "Failed to verify the size consistency of ASM disks on node \"{0}\". kfod execution failed at location \"{1}\". Detailed error:\n{2}"
//  *Cause: An attempt to verify the consistency of ASM disk sizes failed on the identified node with the indicated error message.
// *Action: Examine the accompanying error messages for details.
/
1100, OFS_ACTIVE_VERSION_FAIL, "Failed to retrieve ACFS active version for local node"
//  *Cause: Failed to execute acfsutil to retrieve the ACFS active version on the local node.
// *Action: Review the accompanying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1101, OFS_ACTIVE_VERSION_NODE_FAIL, "Failed to retrieve ACFS active version for node {0}. acfsutil execution failed at file location {1}. Detailed error:\n{2}"
//  *Cause: Failed to execute acfsutil to retrieve the ACFS active version on the supplied node.
// *Action: Review the accompanying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1102, OFS_PARSE_OUTPUT_FAIL, "Failed to parse output when executing acfsutil at file location {0}"
//  *Cause: Unable to parse output returned by acfsutil.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1103, OFS_PARSE_OUTPUT_NODE_FAIL, "Failed to parse the output for node {0} when executing acfsutil at file location {1}"
//  *Cause: Unable to parse output returned by acfsutil on the supplied node.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1104, OFS_PARSE_VALUE_FAIL, "Failed to parse output {0} when executing acfsutil at file location {1}"
//  *Cause: Unable to parse output returned by acfsutil at specified location.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1105, OFS_PARSE_VALUE_NODE_FAIL, "Failed to parse output {0} for node {1} when executing acfsutil at file location {2}"
//  *Cause: Unable to parse output returned by acfsutil at specified location on the supplied node.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1106, OFSUTIL_INVALID_LOCATION, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1107, OFSUTIL_NODE_FAIL, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1108, OFSUTIL_INVALID_NODE, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1109, OFSUTIL_PARSE_DISKGROUPNAMES_FAIL, "Failed to get diskgroup names for node {0}"
//  *Cause: Unable to parse disgkroup names returned by acfsutil on the supplied node.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1110, OFSUTIL_EMPTY_RESULT, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1111, OFSUTIL_EMPTY_RESULT1, "Received empty result while getting ACFS Mount Points on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1112, OFSUTIL_COMMAND_FAIL, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1113, OFSUTIL_NULL_LOCATION, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1114, OFSUTIL_COMMAND_FAIL_WITH_PATH, "Execution of acfsutil command failed on node {0} for location {1}"
//  *Cause: Failed to execute acfsutil on the supplied node at the specified location.
// *Action: Review the accompanying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1115, OFSUTIL_NODE_FAIL_WITH_MSG, "Execution of acfsutil failed on node {0} with result {1}"
//  *Cause: Failed to execute acfsutil on the supplied node.
// *Action: Review the accompanying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1116, OFSUTIL_INVALID_LOCATION_NODE, "Invalid partition path {0} specified to acfsutil on node {1}"
//  *Cause: The supplied path did not exist.
// *Action: Supply a valid partition path and retry.
/
1117, OFSUTIL_EMPTY_RESULT2, "Received empty result while getting ACFS Disk Groups on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1118, OFSUTIL_EMPTY_RESULT3, "Received empty result while getting total space at file location {0} on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1119, OFSUTIL_EMPTY_RESULT4, "Received empty result while getting free space at file location {0} on node {1}"
//  *Cause: The output returned by acfsutil is empty.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1120, OFSUTIL_NULL_LOCATION_NODE, "A NULL path has been specified for the location on node {0}"
//  *Cause: A null path was provided for the location.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1121, OFSUTIL_FAIL_WITH_MSG, "Execution of acfsutil failed on local node with result {0}"
//  *Cause: Execution of acfsutil failed on the local node.
// *Action: Review the accompanying error messages that provides the details of why acfsutil execution failed. Resolve the reported problem and retry.
/
1122, OFSUTIL_EMPTY_RESULT_MTPOINT, "Received empty result while getting mountpoint for path {0} on the local node"
//  *Cause: acfsutil returned an empty value when querying for the mountpoint of a specified path.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1123, OFSUTIL_INVALID_MTPOINT, "The mountpoint is either set to null or empty"
//  *Cause: The supplied mountpoint is either an empty string or is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1124, OFSUTIL_EMPTY_RESULT_VOLDEVICE, "Received empty result while getting volume device for mountpoint {0} on the local node"
//  *Cause: acfsutil returned an empty value when querying for the volume device of a specified mountpoint.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1125, INVALID_VOLDEVICE, "The volume device is either set to null or empty"
//  *Cause: The supplied volume device is either an empty string or is set to null.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1126, ACFSUTIL_DEV_EMPTY_RESULT_MTPOINT, "Received empty result while getting mountpoint for volume device {0} on the local node"
//  *Cause: acfsutil returned an empty value when querying for the volume device of a specified mountpoint.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1127, ACFSUTIL_EMPTY_RESULT_VOLDEVICES, "Received empty result while getting all volume devices on the local node"
//  *Cause: No ACFS volume devices has been created.
// *Action: Use usmca to create ACFS volume devices.
/
1128, ACFS_NOT_SUPPORTED, "ACFS is not supported on this operating system"
//  *Cause: ACFS is not supported on the accompanying operating system.
// *Action: Run srvctl filesystem command on a supported operating system.
/
1129, USM_DRIVER_FAIL_WITH_MSG, "Execution of ACFS driver state check failed on local node with result {0}"
//  *Cause: Execution of ACFS driver state check failed on the local node
// *Action: Review the accompanying error messages that provides the details of why ACFS driver state check execution failed. Resolve the reported problem and retry.
/
1130, ADVMUTIL_FAIL_WITH_MSG, "Execution of advmutil failed on local node with result {0}"
//  *Cause: Execution of advmutil failed on the local node
// *Action: Review the accompanying error messages that provides the details of why advmutil execution failed. Resolve the reported problem and retry.
/
1131, ACFSUTIL_GET_MOUNTPOINT_FAILED, "Failed to retrieve mount point for volume device {0}"
//  *Cause: No ACFS filesystem was mounted for the specified volume device.
// *Action: Mount the filesystem and retry.
/
1132, ACFS_DRIVER_NO_OUTPUT, "ACFS driver state check with \"{0}\" option on local node failed to display any output"
//  *Cause: No output was captured when executing ACFS driver state check with the specified option on the local node.
// *Action: Internal error. Contact Oracle Support Services.
/
1133, ACFS_DRIVER_NO_OUTPUT_NODE, "ACFS driver state check with \"{0}\" option on node {1} failed to display any output"
//  *Cause: No output was captured when executing ACFS driver state check with the specified option on the specified node.
// *Action: Internal error. Contact Oracle Support Services.
/
1134, ACFS_DRIVER_FAIL_WITH_MSG_NODE, "Execution of ACFS driver state check failed on node {0} with result {1}"
//  *Cause: Execution of ACFS driver state check failed on the specified node.
// *Action: Review the accompanying error messages that provides the details of why ACFS driver state check execution failed. Resolve the reported problem and retry.
/
1135, OFS_NO_DEFAULT_LOCATION, "This platform does not support a default location for \"{0}\" "
// *Cause: An attempt to run the 'acfsutil' command did not provide a location of this binary
// *Action: Internal error. Contact Oracle Support Services.
/
1136, OFS_INVALID_MOUNTPT, "Invalid mount point"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1137, OFSUTIL_SNAP_NOT_EXIST, "acfsutil command failed as the Snapshot {0} does not exist"
// *Cause: The acfsutil command to delete the snapshot with the specified name failed  as it does not exist.
// *Action:Create the snapshot with the specified name and retry the operation.
/
1138, OFSUTIL_SNAP_EXIST, "acfsutil command failed as the snapshot {0} already exists"
// *Cause: The acfsutil command to create a snapshot failed because the snapshot with the specified name already existed.
// *Action: Retry the operation with a different snapshot name.
/
1149, OLSNODES_EMPTY_RESULT_ORCL_CLUSTER_NAME, "Failed to retrieve cluster name"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1150, FAILED_TO_GET_ORCL_CLUSTER_NAME, "Failed to retrieve cluster name"
//  *Cause: Clusterware is not running.
// *Action: Make sure the clusterware is running.
/
1151, FAILED_TO_GET_NODE_STATUS, "Failed to retrieve cluster nodes status"
//  *Cause: Clusterware is not running.
// *Action: Make sure the clusterware is running.
/
1152, OLSNODES_EMPTY_RESULT, "Received empty result while getting cluster nodes Status Map"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1153, OLSNODES_EMPTY_RESULT1, "Received empty result while getting a list of pinned and unpinned nodes in the cluster"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1154, OLSNODES_FAILED_GET_PRIVATE_HOSTNAME, "Failed to retrieve private host name for all cluster nodes. Detailed error:\n{0}"
//  *Cause: Clusterware is not running.
// *Action: Make sure the clusterware is running.
/
1155, OLSNODES_EMPTY_RESULT2, "Received empty result while getting the private interconnect for nodes in the cluster"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1200, ASMCMD_GET_DG_FAIL, "Failed to retrieve disk group name for volume device {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Unable to retrieve the disk group name for the specified volume device
// *Action: Check that ASM instance is running on the local node.
/
1201, ASMCMD_GET_VOL_NAME_FAIL, "Failed to retrieve volume name for volume device {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Unable to retrieve the volume name for the specified volume device
// *Action: Check that ASM instance is running on the local node.
/
1202, ASMCMD_PARSE_OUTPUT_FAIL, "Failed to parse output returned by asmcmd when executing asmcmd at location {0}"
//  *Cause: Unable to parse output returned by asmcmd.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1203, ASMCMD_PARSE_OUTPUT_NODE_FAIL, "Failed to parse the output returned by asmcmd for node {0} when executing asmcmd at location {1}"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1204, ASMCMD_VOL_DEVICE_NOT_EXIST, "Failed to find volume device {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Volume device does not exist.
// *Action: Create the volume device using asm tools.
/
1205, ASMCMD_PARSE_VALUE_FAIL, "Failed to parse output {0} returned by asmcmd when executing asmcmd at location {1}"
//  *Cause: Unable to parse the specified output returned by asmcmd.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1206, ASMCMD_PARSE_VALUE_NODE_FAIL, "Failed to parse output {0} returned by asmcmd for node {1} when executing asmcmd at location {2}"
//  *Cause: Unable to parse the specified output returned by asmcmd on specified node.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1207, ASMCMD_ORACLE_SID_FAIL, "Failed to set the ORACLE_SID for running asmcmd from CRS home location {0}"
//  *Cause: Unable to retrieve the ASM instance name on the local node to generate the ORACLE_SID value.
// *Action: Use crsctl to make sure that the CRS stack is up; use the command 'srvctl status asm' to make sure that the ASM resource is running on the local node.
/
1208, ASMCMD_CR_VOL_FAIL, "Failed to create volume {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute asmcmd to create the volume device for the specified volume name failed.
// *Action: Review the accompanying error messages that provide the details of why asmcmd execution failed. Resolve the reported problem and retry.
/
1209, ASMCMD_DG_NO_SPACE, "Diskgroup {0} does not have enough space. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: Failed to execute asmcmd because the diskgroup does not have enough space for the specified operation.
// *Action: Add more disks to the diskgroup and re-try the operation.
/
1210, ASMCMD_DG_NOT_EXIST, "Disk group {0} does not exist. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute asmcmd to perform an operation with the disk group failed.
// *Action: Review the accompanying error messages that provide the details of why asmcmd execution failed. Resolve the reported problem and retry.
/
1211, ASMCMD_VOL_IN_USE, "Volume {0} is in use. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute asmcmd to create a volume with the specified volume name failed because this name is already being used by another volume.
// *Action: Retry the operation with a different volume name.
/
/
1212, ASMCMD_DEL_VOL_FAIL, "Failed to delete volume device {0}.asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute asmcmd to delete the volume device for the specified volume name failed.
// *Action: Review the accompanying error messages that provide the details of why asmcmd execution failed. Resolve the reported problem and retry.
/
1213, ASMCMD_GET_VOL_DEV_FAIL, "Failed to get volume device for volume {0}.asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute asmcmd to get the volume device for the specified volume name failed.
// *Action: Review the accompanying error messages that provide the details of why asmcmd execution failed. Resolve the reported problem and retry.
/
1214, ASMCMD_GET_DISCOVERY_STRING_FAIL, "Command 'asmcmd' could not be executed from directory {1}. Failed to retrieve discovery string for ASM instance. Detailed error:\n{2}"
//  *Cause: An attempt to retrieve the discovery string used by ASM instance failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
1215, ASMCMD_LSDSK_FAIL, "Command 'asmcmd' could not be executed from directory {1}. Failed to retrieve the list of disks from ASM instance. Detailed error:\n{2}"
//  *Cause: An attempt to retrieve the list of disks from ASM instance failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
/ 1216 Unused
1216, ASMCMD_PARSE_DISCOVERY_STRING_FAIL, ""
// *Cause:
// *Action:
/
1217, ASMCMD_RESIZE_VOL_FAIL, "Command 'asmcmd' could not be executed from directory {0}. Failed to resize volume {1}. Detailed error:\n{2}"
//  *Cause: An attempt to resize the volume failed.
// *Action: Review the accompanying error messages that provide the details of the failure. Resolve the reported problem and retry.
/
1218, ASMCMD_LSDG_FAIL, "Command 'asmcmd' could not be executed from directory {1}. Failed to retrieve information of disk groups from ASM instance. Detailed error:\n{2}"
//  *Cause: An attempt to retrieve the list of disk groups from ASM instance failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
1219, ASMCMD_GET_SPFILE_LOCATION_FAIL, "Command 'asmcmd spget' could not be executed from directory {0}. Failed to retrieve the ASM SPFILE location for ASM instance. Detailed error:\n{1}"
//  *Cause: An attempt to retrieve the SPFILE used by an ASM instance failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
1220, ASMCMD_GET_SPFILE_LOCATION_EMPTY, "Received empty result while getting the ASM SPFILE location for ASM instances using command 'asmcmd spget' from directory {0}"
//  *Cause: The indicated ASMCMD command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1221, ASMCMD_GET_PWDFILE_LOCATION_FAIL, "failed to retrieve the ASM password file location for an ASM instance using command 'asmcmd pwget --asm' \n{0}"
//  *Cause: An attempt to retrieve the password file location for an ASM instance failed.
// *Action: Examine the accompanying messages and respond accordingly.
/
1222, ASMCMD_GET_PWDFILE_LOCATION_EMPTY, "Received empty result while getting the ASM password file location for an ASM instance using command 'asmcmd pwget --asm'"
//  *Cause: The asmcmd command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1223, ASMCMD_LS_LOCATION_FAIL, "failed to check whether the file \"{0}\" is on an ASM disk group \n{1}"
//  *Cause: An attempt to check whether the indicated file is on an ASM disk 
//          group failed.
// *Action: Examine the accompanying messages and respond accordingly.
/
1300, OIFCFG_FAIL, "oifcfg execution failed. Detailed error:\n{0}"
//  *Cause: Failed to execute the oifcfg command for the local node. See the accompanying error message for further details.
// *Action: Try to execute the oifcfg command manually.
/
1301, OIFCFG_NODE_FAIL, "oifcfg execution failed on node {0}. Detailed error:\n{1}"
//  *Cause: Failed to execute the oifcfg command for the remote node. See the accompanying error message for further details.
// *Action: Try to execute the oifcfg command manually.
/
1302, INVALID_IPADDR_FORMAT, "The specified address \"{0}\" has an invalid IP address format"
//  *Cause: The format of the subnet number and/or the subnet mask was an invalid IP address format.
// *Action: Make sure that both the subnet number and the subnet mask have a valid IP address format.
/
1303, NOT_ENOUGH_OIFCFG_RESULT_FIELDS, "The oifcfg command returned as result the line \"{0}\" that has less than 4 fields"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1304, INVALID_IPV6_PREFIX_LENGTH, "The specified IPv6 prefix length \"{0}\" is not between 0 and 128"
//  *Cause: The IPv6 prefix length was either not an integer or was out of the allowed range.
// *Action: Make sure that the IPv6 prefix length is an integer from 0 to 128.
/
1305, INVALID_INTERFACE_NAME, "The specified interface name \"{0}\" does not match the existing network interface name \"{1}\""
//  *Cause: The interface name did not match the existing network interface name.
// *Action: Either omit the interface name or make sure it is the same as the existing one for this network.
/
1306, SETTING_ADDR_TYPE_TO_IPV4_NOT_ALLOWED, "Setting the address type to \"ipv4\" is an not allowed because the existing network address type is \"ipv6\""
//  *Cause: An attempt to change the address type from 'ipv6' to 'ipv4' directly was rejected, because the address type must first be changed to 'both', then to 'ipv4'.
// *Action: Use the command 'srvctl modify network' to change the network type to 'both' by adding an IPv4 subnet, then retry the command.
/
1307, SETTING_ADDR_TYPE_TO_IPV6_NOT_ALLOWED, "Setting the address type to \"ipv6\" is an not allowed because the existing network address type is \"ipv4\""
//  *Cause: An attempt to change the address type from 'ipv4' to 'ipv6' directly was rejected, because the address type must first be changed to 'both', then to 'ipv6'.
// *Action: Use the command 'srvctl modify network' to change the network type to 'both' by adding an IPv6 subnet, then retry the command.
/
1308, AMBIGUOUS_MODIFY_OPERATION, "Modifying the VIP is not allowed because the VIP name \"{0}\" resolved to both IPv4 and IPv6 addresses"
//  *Cause: The existing VIP name maps to both IPv4 and IPv6 addresses and the user tried to modify one of them.
// *Action: Remove the VIP resource, issue the command 'srvctl add vip' providing either the IPv4 or IPv6 address the VIP name resolves to and then rerun the 'srvctl modify vip' command.
/
1309, UNEXPECTED_USR_ORA_AUTO_VALUE, "The USR_ORA_AUTO_VALUE attribute value \"{0}\" does not include both an IPv4 and an IPv6 value"
//  *Cause: Expected both an IPv4 value and an IPv6 value to coexist.
// *Action: Internal error. Contact Oracle Support Services.
/
1400, GETCRSHOME_FAIL, "getcrshome execution failed. Detailed error:\n{0}"
//  *Cause: Failed to execute the getcrshome command. See the accompanying error message for further details.
// *Action: Try to execute the getcrshome command manually.
/
1401, GETCRSHOME_NODE_FAIL, "getcrshome execution failed on node {0}. Detailed error:\n{1}"
//  *Cause: Failed to execute the getcrshome command. See the accompanying error message for further details.
// *Action: Try to execute the getcrshome command manually.
/
1402, SRVCTL_VERSION_FAILED, "Attempt to retrieve version of SRVCTL from Oracle Home {0} failed.\n{1}"
//  *Cause: Failed to execute the 'srvctl -V' command. See the accompanying error message for further details.
// *Action: Verify that the 'bin' directory under the indicated oracle home contains the 'srvctl' binary, and verify execution of the command 'srvctl -V' manually on that oracle home.
/
1403, SRVCTL_GET_VERSION_PARSE_OUTPUT_FAIL, "Failed to parse output returned by srvctl -V when executing command at Oracle home {0}"
//  *Cause: Failed to parse the output returned by executing the command 'srvctl -V' because the output string is null or has unexpected result
// *Action: Verify execution of the command 'srvctl -V' manually at oracle home or Contact Oracle Support Services.
/
1404, SRVCTL_VERSION_FAILED_NODE, "Attempt to retrieve version of SRVCTL on node {0} from Oracle Home {1} failed. Detailed error: \n {2}"
//  *Cause: Failed to execute the command 'srvctl -V' command. See the accompanying error message for further details.
// *Action: Verify that the 'bin' directory in specified node under the indicated oracle home contains the 'srvctl' binary, and verify execution of the command 'srvctl -V' manually on that oracle home.
/
1405, SRVCTL_GET_VERSION_PARSE_OUTPUT_FAIL_NODE, "Failed to parse output returned by srvctl -V when executing command at node {0} and Oracle home {1}"
//  *Cause: Failed to parse the output returned by executing the command 'srvctl -V'  at specified node and because the output string is null or has unexpected result
// *Action: Verify execution of the command 'srvctl -V' manually at given node and oracle home or Contact Oracle Support Services.
/
1406, INVALID_HOME_NO_SRVCTL, "Oracle Home location: {0} does not contain {1}"
//  *Cause: The current Oracle Home directory does not contain the specified utility.
// *Action: Provide the correct Oracle Home directory.
/
1407, OLSNODES_GET_ACTIVE_NODE_ROLE_FAILED, "failed to execute the olsnodes command to retrieve active node roles. Detailed error:\n{0}"
//  *Cause: An attempt to execute the command 'olsnodes -a' failed.
// *Action: Check the accompanying error messages.
/
1408, OLSNODES_EXECUTION_FAILED, "Encountered unexpected output during the olsnodes command execution to retrieve active node roles"
//  *Cause: An attempt to execute olsnodes -a command failed.
// *Action: Check the accompanying error messages.
/
1409, OLSNODES_EMPTY_RESULT3, "Received empty result while getting the active node roles for nodes in the cluster"
//  *Cause: The olsnodes command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1410, CRSCTL_CLUSTER_CONFIG_NODE_ROLES_FAILED, "Failed to execute the crsctl command to retrieve configured node roles. Detailed error:\n{0}"
//  *Cause: An attempt to execute crsctl get node role config -all command failed.
// *Action: Check the accompanying error messages.
/
1411, CRSCTL_EXECUTION_FAILED, "Encountered unexpected output during the crsctl command execution to retrieve configured node roles"
//  *Cause: An attempt to execute crsctl get node role config -all command failed.
// *Action: Check the accompanying error messages.
/
1412, CRSCTL_EMPTY_RESULT, "Received empty result while getting the configured node roles for nodes in the cluster"
//  *Cause: The crsctl command executed successfully, but there was no output.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1413, CRSCTL_CONFIG_NODE_ROLE_FAILED, "Failed to retrieve the configured node role of the node {0}"
//  *Cause: An attempt to execute crsctl get node role config -node command failed.
// *Action: Check the accompanying error messages.
/
1414, CLONE_COMMAND_LOCAL_FAILED, "Execution of the command {0} on the local node failed"
//  *Cause: An attempt to clone an Oracle Home using the given command failed.
// *Action: Check the accompanying error messages.
/
1415, CRSCTL_MULTI_ACFS_FOR_MTPT, "More than one ACFS resource was found for the mount point path {0}"
//  *Cause: When looking up the ACFS resource for a mount point, more than one resource was found.
// *Action: Remove all but one of the ACFS resources that contains the duplicate mount point path.
/
1416, UNABLE_TO_VALIDATE_INTERFACE_TYPE, "Unable to validate the interface type for subnet \"{0}\""
//  *Cause: An attempt to validate the interface type for the given subnet failed.
// *Action: Check the accompanying error messages.
/
1417, OSDBAGRP_COMMAND_FAIL, "Failed to retrieve administrator groups. 'osdbagrp' execution failed at location {0}. Detailed error:\n{1}"
//  *Cause: During retrieval of administrator group, execution of the 'osdbagrp' command to retrieve administrator OS group names failed.
// *Action: Examine the accompanying error messages for details.
/
1418, VIPNAME_DOES_NOT_RESOLVE_TO_BOTH, "Failed to modify the VIP for node {0} because the specified VIP name \"{1}\" does not resolve to both an IPv4 and IPv6 address, which is required by the network, because it has both IPv4 and IPv6 subnets"
//  *Cause: Both IPv4 and IPv6 configured VIP addresses existed, but the specified VIP name did not resolve to both IPv4 and IPv6 addresses.
// *Action: Ensure that the specifed VIP name resolves to both IPv4 and IPv6 addresses.
/
1419, VIPNAME_DOES_NOT_RESOLVE_TO_IPV4, "Failed to modify the VIP for node {0} as the specified VIP name \"{1}\" does not resolved to an IPv4 address"
//  *Cause: An IPv4 configured VIP address existed, but the specified VIP name did not resolve to an IPv4 address.
// *Action: Make sure that the specified VIP name resolves to an IPv4 address.
/
1420, VIPNAME_DOES_NOT_RESOLVE_TO_IPV6, "Failed to modify the VIP for node {0} as the specified VIP name \"{1}\" does not resolved to an IPv6 address"
//  *Cause: An IPv6 configured VIP address existed, but the specified VIP name did not resolve to an IPv6 address.
// *Action: Make sure that the specified VIP name resolves to an IPv6 address.
/
1421, VIPNAME_RESOLVES_TO_IPV4_WHILE_NEW_VALUE_DOES_NOT, "Failed to modify the VIP for node {0} because the specified VIP name or address \"{1}\" does not resolve to an IPv4 address"
//  *Cause: The configured VIP name resolved to an IPv4 address, but the specified VIP name or IP address did not resolve to an IPv4 address.
// *Action: Make sure that the specified VIP name or address resolves to an IPv4 address.
/
1422, VIPNAME_RESOLVES_TO_IPV6_WHILE_NEW_VALUE_DOES_NOT, "Failed to modify the VIP for node {0} because the specified VIP name or address \"{1}\" does not resolve to an IPv6 address"
//  *Cause: The configured VIP name resolved to an IPv6 address, but the specified VIP name or IP address did not resolve to an IPv6 address.
// *Action: Make sure that the specified VIP name or address resolves to an IPv6 address.
/
1423, SRVMHELPER_COPYDIR_FAIL, "Failed to copy the directory contents from {0} to {1} on node {2}. Detailed error:\n{2}"
//  *Cause: An attempt to execute srvmhelper to copy the directory contents failed.
// *Action: Examine the accompanying error messages.
/
1424, MGMTCA_FAIL, "Rapid Home Provisioning credentials creation failed while executing the Management Database configuration assistant on node {0}."
//  *Cause: An attempt to execute the Management Database configuration assistant to create the Rapid Home Provisioning credentials failed.
// *Action: Examine the accompanying error messages for details.
/
1425, HAVIP_HOSTNAME_DOES_NOT_RESOLVE_TO_IPV4, "The specified VIP name \"{0}\" does not resolve to an IPv4 address"
//  *Cause: The configured VIP name resolved to an IPv4 address, but the specified VIP name did not resolve to a single IPv4 address.
// *Action: Specify a VIP name that resolves to a single IPv4 address. Use 'nslookup <vipname>' to display the addresses to which the VIP name resolves.
/
1426, HAVIP_HOSTNAME_RESOLVES_MORE_THAN_ONE_IPV4_ADDRESS, "The specified VIP name \"{0}\" resolves to multiple addresses"
//  *Cause: The specified VIP name resolved to more than one IPv4 or IPv6 address.
// *Action: Specify a VIP name that resolves to one address. Use 'nslookup <vipname>' to display the addresses to which the VIP name resolves.
/
1427, SRVMHELPER_ADDNFS_FAIL, "Failed to create the NFS resource on mount path \"{0}\". Detailed error:\n{1}"
//  *Cause: An attempt to create the NFS resource failed.
// *Action: Examine the accompanying error messages.
/
1428, SRVMHELPER_RUNMGMTCA_FAIL, "Failed to execute Management Database configuration assistant for user \"{0}\" on node \"{1}\". Detailed error:\n{2}"
//  *Cause: An attempt to run Management Database configuration assistant failed.
// *Action: Examine the accompanying error messages.
/
1429, SRVMHELPER_CREATEGHWALLET_FAIL, "Failed to create wallet for Rapid Home Provisioning for user \"{0}\". Detailed error:\n{1}"
//  *Cause: An attempt to create the wallet for Rapid Home Provisioning failed.
// *Action: Examine the accompanying error messages.
/
1430, ASMCMD_ADVM_COMP_FAIL, "Failed to retrieve the Oracle ASM Dynamic Volume Manager compatibility attribute for disk group {0}. asmcmd execution failed at location {1}. Detailed error:\n{2}"
//  *Cause: An attempt to retrieve the 'compatible.advm' attribute for the specified disk group failed.
// *Action: Examine the accompanying error messages for details and take appropiate corrective action.
/
1431, ASMCMD_ADVM_COMP_NOT_SET, "The Oracle ASM Dynamic Volume Manager compatibility attribute is not set for disk group {0}."
//  *Cause: An attempt to execute 'asmcmd' against the specified disk group failed because the command requires the retrieval of the 'compatible.advm' attribute which has not been set for that disk group.
// *Action: Set the 'compatible.advm' attribute for the specified disk group to a version above 11.2.0.3 with the ASM Configuration Assistant (ASMCA) and retry adding a Rapid Home Provisioning Server using the 'srvctl add rhpserver' command.
/
1432, VIP_DOES_NOT_RESOLVE_TO_IPV4, "Failed to modify the VIP for node {0} because the specified VIP address \"{1}\" is not an IPv4 address"
//  *Cause: An attempt to modify a node VIP failed because the specified address was not of type IPv4 as required by the configured VIP.
// *Action: Retry the command making sure that the specified VIP address is an IPv4 address.
/
1433, VIP_DOES_NOT_RESOLVE_TO_IPV6, "Failed to modify the VIP for node {0} because the specified VIP address \"{1}\" is not an IPv6 address"
//  *Cause: An attempt to modify a node VIP failed because the specified address was not of type IPv6 as required by the configured VIP.
// *Action: Retry the command making sure that the specified VIP address is an IPv6 address.
/
1434, VIPNAME_RESOLVES_TO_IPV4_NETWORK_ERROR, "Failed to modify the VIP because the specified VIP name \"{0}\" does not resolve to an IPv4 address as required by network {1}"
//  *Cause: The configured network had an IPv4 subnet, but the specified VIP name or IP address did not resolve to an IPv4 address.
// *Action: Make sure that the specified VIP name or address resolves to an IPv4 address.
/
1435, VIPNAME_RESOLVES_TO_IPV6_NETWORK_ERROR, "Failed to modify the VIP because the specified VIP name \"{0}\" does not resolve to an IPv6 address as required by network {1}"
//  *Cause: The configured network had an IPv6 subnet, but the specified VIP name or IP address did not resolve to an IPv6 address.
// *Action: Make sure that the specified VIP name or address resolves to an IPv6 address.
/
1436, ASMCMD_VOLUME_NOT_EXIST, "Volume {0} does not exist for disk group {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute 'asmcmd' to delete the volume for the disk group failed.
// *Action: Review the accompanying error messages that provide the details of why ASMCMD execution failed. Resolve the reported problem and retry.
/
1437, OPATCH_LSPATCHES_FAIL_WITH_MSG, "Execution of the 'opatch lspatches -oh' command failed on local node with result {0}"
//  *Cause: Execution of the 'opatch lspatches -oh' failed on the local node.
// *Action: Review the accompanying error messages that provide the details of why the 'opatch lspatches -oh' execution failed. Resolve the reported problem and retry.
/
1438, SRVMHELPER_GET_DELTA_PATCHES_FAIL, "Failed to get the difference between the patches installed in {0} and {1} Oracle homes. Detailed error:\n{2}"
//  *Cause: An attempt to get the difference between the patches installed in the Oracle homes failed.
// *Action: Examine the accompanying error messages.
/
1439, SRVMHELPER_MAKE_DIR_FAIL, "Failed to create the directory {0} in nodes {1}. Detailed error:\n{2}"
//  *Cause: An attempt to execute srvmhelper to create the directory failed. Specifics of failure shown in appended error message.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry. 
/
1440, SRVMHELPER_IS_ADMIN_MANAGED_FAIL, "Failed to determine if database is administrator-managed\n{1}"
//  *Cause: An attempt to execute an internal command to determine if the database is administrator-managed failed. Specifics of the failure are shown in the appended error message.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1441, SRVMHELPER_GET_ADMINDB_CONFIG_NODES_FAIL, "Failed to retrieve configured nodes for an administrator-managed database\n{1}"
//  *Cause: An attempt to execute an internal command to retrieve configured nodes for an administrator-managed database failed. Specifics of the failure are shown in the appended error message.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1442, SRVMHELPER_SCRIPT_NOT_FOUND, "Failed to execute srvmhelper command because command {0} does not exist"
//  *Cause: The srvmhelper script did not exist or was not accessible to the invoking user.
// *Action: Check whether the specified srvmhelper script exists. Also, check whether the user has execute permission on the srvmhelper script.
/
1443, MGMTCA_SETPWD_FAIL, "Setting of password for the Rapid Home Provisioning (RHP) user failed while executing the Management Database configuration assistant on node {0}.\n{1}"
//  *Cause: An attempt to execute the Management Database configuration assistant to set the RHP user's password failed.
//  *Action: Correct the problem indicated by the accompanying error messages and then retry.
/
1444, SQLPLUS_VERSION_FAILED, "Attempt to retrieve version of SQL*Plus from Oracle home {0} failed. Detailed error: \n {1}"
//  *Cause: An attempt to execute the 'sqlplus -V' command failed. See the accompanying error message for further details.
// *Action: Verify that the 'bin' directory under the indicated Oracle home contains the 'sqlplus' binary, and verify execution of the command 'sqlplus -V' manually on that Oracle home.
/
1445, SQLPLUS_GET_VERSION_PARSE_OUTPUT_FAIL, "Failed to parse output returned by sqlplus -V when executing command at Oracle home {0}. Detailed error: \n {1}"
//  *Cause: An attempt to parse the output returned by executing the command 'sqlplus -V' failed because the output string is null or has unexpected results.
// *Action: Verify execution of the command 'sqlplus -V' manually at the Oracle home or contact Oracle Support Services.
/
1446, SQLPLUS_VERSION_FAILED_NODE, "Attempt to retrieve version of SQL*Plus on node {0} from Oracle home {1} failed. Detailed error: \n {2}"
//  *Cause: An attempt to execute the 'sqlplus -V' command failed. See the accompanying error message for further details.
// *Action: Verify that the 'bin' directory in the specified node under the indicated Oracle home contains the 'sqlplus' binary, and verify execution of the command 'sqlplus -V' manually on that Oracle home.
/
1447, SQLPLUS_GET_VERSION_PARSE_OUTPUT_FAIL_NODE, "Failed to parse output returned by sqlplus -V when executing command at node {0} and Oracle home {1}. Detailed error: \n {2}"
//  *Cause: An attempt to parse the output returned by executing the command 'sqlplus -V'  at specified node failed because the output string is null or has unexpected results.
// *Action: Verify execution of the command 'sqlplus -V' manually at the given node and Oracle home or contact Oracle Support Services.
/
1448, INVALID_HOME_NO_SQLPLUS, "Oracle home location: {0} does not contain {1}"
//  *Cause: The current Oracle home directory did not contain the specified utility.
// *Action: Provide the correct Oracle home directory.
/
1449, ORABASE_FAIL, "Execution of command 'orabase' failed. Detailed error:\n{0}"
// *Cause: Execution of the 'orabase' command failed. See the accompanying error message for further details.
// *Action: Correct the problem indicated by the accompanying message. 
/
1450, ORACLE_BASE_KEY_NULL, "The ORACLE_BASE registry key {0} has an empty value on node {1}."
// *Cause: The ORACLE_BASE registry key did not exist or its value was null.
// *Action: Clone the existing ORACLE_HOME to re-create the registry entries using the command 'clone.pl'.
/
1451, ORACLE_KEY_READ_FAIL, "Error accessing file 'oracle.key'"
//  *Cause: An attempt to access the 'oracle.key' file to determine the location of registry containing ORACLE_BASE failed.
//  *Action: Clone the existing ORACLE_HOME to re-create the 'oracle.key' file using the command 'clone.pl'.
/
1452, OPATCH_LSINVENTORY_FAIL_WITH_MSG, "Execution of the command 'opatch lsinventory -patch -oh' failed on local node with result {0}."
//  *Cause: Execution of the command 'opatch lsinventory -patch -oh' failed on the local node. Details reported in accompanying messages.
// *Action: Review the accompanying error messages that provide the details of why the 'opatch lsinventory -patch -oh' execution failed. Resolve the reported problem and retry executing the command.
/
1453, KFOD_GET_ASM_PROPERTY_FAIL, "failed to get ASM properties from ASM client data file {0} \n{1}"
//  *Cause: An attempt to execute 'kfod op=credverify wrap=<ASM client data file>' to obtain the ASM properties failed.
// *Action: Examine the accompanying error messages for details.
/
1454, MGMTCA_RESETREPOS_FAIL, "Resetting of the Rapid Home Provisioning repository failed while executing the Management Database configuration assistant on node {0}.\n{1}"
//  *Cause: An attempt to execute the Management Database configuration assistant to delete the repository contents failed.
//  *Action: Correct the problem indicated by the accompanying error messages and then retry.
/
1456, ASMCMD_GET_CLIENT_CLUSTERS_FAIL, "failed to execute 'asmcmd' command to obtain the client clusters"
//  *Cause: An attempt to execute the command 'asmcmd lscc --suppressheader' to obtain the client clusters failed.
// *Action: Examine the accompanying error messages for details.
/
1457, CRSCTL_GET_CLUSTER_GUID_FAIL, "failed to retrieve cluster GUID for this cluster"
//  *Cause: An attempt to execute the command 'crsctl get css cluster guid' to obtain the GUID of this cluster failed.
//  *Action: Examine the accompanying error messages for details. Retry after restarting the clusterware stack.
/
1458, SRVCTL_MGMTDB_FAILED, "failed to get the disk group of management database \n{0}"
//  *Cause: An attempt to retrieve the disk group failed because execution of 'crsctl stat res ora.mgmtdb -p' completed with errors.
//  *Action: Examine the accompanying error messages for details, resolve reported issues and retry.
/
1459, UNSUPPORTED_VERSION, "Request is unsupported for version {0}."
//  *Cause: An attempt to retrieve disk group failed because the version is earlier than 12.1.
//  *Action: Issue the request when the CRS version is higher than 12.1.
/
1460, ORADNFS_ISPATHENABLED_FAIL, "failed to execute command 'oradnfs isdnfsenabled' on the local node, detailed error:\n{0}"
//  *Cause: An attempt to verify that DNFS is enabled failed on the local node. See the accompanying error messages for further details.
// *Action: Review the accompanying error messages that provide the details of why oradnfs execution failed. Resolve the reported problem and retry.
/
1461, ASMCMD_ATTRIBUTE_FAIL, "Failed to retrieve the value of attribute {1} for ASM disk group {0}. Execution of command '{2}' failed. Detailed error:\n{3}"
//  *Cause: An attempt to retrieve the value of the indicated attribute for 
//          the specified disk group failed.
// *Action: Examine the accompanying error messages for details.
/
1462, ASMCMD_ATTRIBUTE_LIST_FAIL, "Failed to retrieve the attribute values for ASM disk group {0}. Execution of command '{1}' failed. Detailed error:\n{2}"
//  *Cause: An attempt to retrieve the attribute values for the
//          specified disk group failed.
// *Action: Examine the accompanying error messages for details.
/
1463, ASMCMD_GET_VOLS_FAIL, "Failed to execute command {0} to obtain the volume information. Detailed error: \n{1}"
//  *Cause:  A requested operation that required obtaining volume information failed in the execution of the command 'asmcmd --nocp volinfo --all'. The accompanying message provides further details.
// *Action: Examine the accompanying error messages for details, resolve reported issues and retry.
/
1464, ASMCMD_NO_VOLUME, "No volume device information retrieved by executing command {0}."
//  *Cause: A requested operation attempted to obtain volume information using the command 'asmcmd --nocp volinfo --all' and found no existing volumes.
// *Action: Volume devices can be created using the ASM tools.
/
1465, OFSUTIL_NO_ACFS_MOUNTED, "There are no Oracle ACFS file systems mounted."
// *Cause: An attempt to retrieve the Oracle Automatic Storage Management Cluster File System (Oracle ACFS) information for a specific mount point failed because there were no Oracle ACFS file systems mounted in the current cluster environment.
// *Action: If an Oracle ACFS file system is desired at the specified mount point, create it with the command 'srvctl add filesystem'.
/
1466, SRVMHELPER_IS_LEAFNODE_ALLOWED_FAIL, "Failed to determine if the cluster is configured to support leaf nodes. Detailed error:\n{0}"
//  *Cause: An attempt to run an internal command to determine if the cluster was configured to support leaf nodes failed. Specifics of the failure are shown in the following error message.
// *Action: Examine the accompanying error messages for details. Resolve the reported problems and retry.
/
1467, SERVERPOOL_ATTRIBUTE_LIST_FAIL, "failed to retrieve the attribute values for server pools\n{0}"
//  *Cause: An attempt to retrieve the attribute values for the server pools failed.
// *Action: Examine the accompanying error messages for details, resolve reported issues and retry.
/
1468, MGMTDB_GETCRED_INFO_SERVER, "invalid request for Oracle Grid Infrastructure Management Repository (GIMR) server"
// *Cause: An attempt to retrieve GIMR client properties failed because it was executed on a GIMR server.
// *Action: Try the request again on a GIMR client.
/
1469, COMMAND_TOOL_WARN, "Execution of command {0} completed successfully with warnings."
//  *Cause: The indicated command completed with warnings. The accompanying messages provide more details.
// *Action: Examine the accompanying messages for details, resolve the reported issues as necessary, and retry if desired.
/
1470, SRVMHELPER_RESETREPOS_FAIL, "failed to reset the Rapid Home Provisioning (RHP) repository\n{0}"
//  *Cause: An attempt to reset the RHP repository failed. The accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages, address issues reported, and retry.
/
1471, SRVMHELPER_GET_ADMIN_DBS_FAIL, "failed to identify administrator-managed databases running on node \"{0}\""
//  *Cause: An attempt to execute an internal command to identify administrator-managed databases running on the indicated node failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1472, OFSUTIL_VOLUME_DEVICE_NOT_FOUND, "Volume device {0} does not exist."
//  *Cause: An attempt to check if the specified volume device path was configured as an accelerator volume failed because the specified volume device path did not exist.
// *Action: Specify a valid volume device path and retry the operation.
/
1473, OFSUTIL_AUXILIARY_VOLUME_NOT_ACFS, "Volume device {0} is not formatted as an Oracle ACFS."
//  *Cause: An attempt to check if the specified volume device path was configured as an accelerator volume was rejected because the specified volume device was not formatted as Oracle Automatic Storage Management Cluster File Systems (Oracle ACFS).
// *Action: Format the specified volume device using the 'mkfs' command and retry the operation.
/
1474, COMMAND_TOOL_FAIL_ERROR, "failed to run \'{0}\' on node {1}.\n{2}"
//  *Cause: An attempt to execute the specified command failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details, address issues reported, and retry.
/
1475, AFD_DRIVER_NOT_FOUND, "utility {1} not found in Oracle home path {0}"
//  *Cause: The install operation could not complete because it could not invoke the indicated utility in the Oracle home displayed in the message.
// *Action: Ensure that the utility is located in the specified home path and retry the install operation.
/
1476, AFD_DRIVER_NO_OUTPUT, "Oracle ASM Filter Driver (ASMFD) driver state check with '{0}' option on the local node failed to display any output."
//  *Cause: No output was captured when executing the Oracle ASM Filter Driver (ASMFD) driver state check with the indicated option on the local node. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1477, AFD_DRIVER_NO_OUTPUT_NODE, "Oracle ASM Filter Driver (ASMFD) driver state check with option '{0}' on node {1} failed to display any output."
//  *Cause: No output was captured when executing an Oracle ASM Filter Driver (ASMFD) driver state check with the indicated option on the specified node. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1478, SRVMHELPER_GET_ACTIVE_SERVERS_FAIL, "failed to retrieve the active servers in server pool {0}\n{1}"
//  *Cause:  An attempt to retrieve the active servers from the specified server pool failed. Accompanying messages provide detailed failure information.
// *Action: Examine the accompanying error messages, address the issues reported, and retry.
/
1479, OSDBAGRP_COMMAND_FAIL_NODE, "failed to retrieve administrator groups on node \"{0}\"\n{1}"
//  *Cause: The execution of the 'osdbagrp' command to retrieve the administrator operating system group names failed. Accompanying messages provide detailed failure information.
// *Action: Correct the problem indicated by the accompanying error messages and then retry.
/
1480, KFOD_GET_DISKGROUP_NAMES_FAIL2, "failed to retrieve list of disk group names by executing 'kfod' on host {0}\n{1}"
//  *Cause: An attempt to retrieve the list of disk group names by executing 'kfod disks=all op=disks dscvgroup=TRUE asm_diskstring=<discovery_string>' failed. Accompanying error messages provide failure details.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1481, SRVMHELPER_GET_ACFS_NODES_FAIL_DG, "failed to retrieve the running nodes for the ACFS associated to disk group {0} and volume name {1}"
//  *Cause: An attempt to execute an internal command to retrieve the running nodes for an ACFS associated to the specified disk group and volume name failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1482, SRVMHELPER_GET_ACFS_NODES_FAIL_DEV, "failed to retrieve the running nodes for the ACFS associated to volume device {0}"
//  *Cause: An attempt to execute an internal command to retrieve the running nodes for an ACFS associated to the specified volume device failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1483, SRVMHELPER_IS_ACFS_NODELOCAL_FAIL, "failed to check if the ACFS associated to volume device {0} is node-local configured"
//  *Cause: An attempt to execute an internal command to check if the ACFS associated to the specified volume device was node-local configured failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1484, REMOTEEXECSERVER_FAILED, "failed to start remote execution server on node {0}"
//  *Cause: An attempt to start the required remote execution server on the indicated node failed. Detailed failure information is supplied by the accompanying messages.
//  *Action: Correct the problem indicated by the accompanying error messages.  On Windows systems, ensure that the current user has the authority to remove and create directories and files in the 'C:\\Windows\\Temp' directory and to create and delete registry entries.
/
1485, DATAPMP_FAILED, "Execution of a Data Pump tool failed.\n{0}"
//  *Cause: An attempt to execute the 'expdp' or 'impdp' tool to export or import a schema failed. Accompanying messages provide detailed failure information.
//  *Action: Correct the problem indicated by the accompanying error messages and then retry.
/
1486, SRVCTL_CMD_FAILED, "Execution of command \'{0}\' from Oracle Home {1} failed.\n{2}"
//  *Cause: An attempt to execute the specified SRVCTL command failed. Accompanying messages provide detailed failure information.
// *Action: Correct the problem indicated by the accompanying error messages and then retry.
/
1487, FAILED_TO_GET_HISTORICAL_NODE_LIST, "failed to retrieve historical node list from Oracle Clusterware"
//  *Cause: An attempt to include historical Leaf Nodes with the command 'olsnodes -f' failed because the historical Leaf Nodes could not be retrieved from Oracle Clusterware.
// *Action: Ensure that Oracle Clusterware is running and retry the command.
/
1488, ASMCMD_MKDIR_FAIL, "failed to create directory {0}\n{1}"
//  *Cause: An attempt to create the specified directory failed. Accompanying messages provide detailed failure information.
//  *Action: Correct the problem indicated by the accompanying error messages and then retry.
/
1489, SRVMHELPER_GET_SCAN_NAME_FAIL, "failure to retrieve the cluster Single Client Access Name for network {0}\n{1}"
//  *Cause: An attempt to execute an internal command to retrieve the cluster
//          Single Client Access Name failed. Specifics of the failure are 
//          shown in the appended error message.
// *Action: Correct the problem indicated by the accompanying error messages 
//          and then retry.
/
1490, SRVMHELPER_IS_RHP_CONFIGURED_FAIL, "check that Rapid Home Provisioning (RHP) was configured failed"
//  *Cause: An attempt to execute an internal command to check whether RHP was configured failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details. Resolve the problems reported and retry.
/
1491, KFOD_GET_ALL_DISKGROUP_NAMES_FAIL, "Unable to retrieve list of disk group names. Execution failure in kfod at location {1}.\n{2}"
//  *Cause: An attempt to retrieve the disk group names by executing
//          'kfod nohdr=true op=groups' failed. The accompanying error messages 
//          provide detailed failure information.
// *Action: Examine the accompanying error messages, correct the problem indicated and retry.
/
1492, SEGMENTATION_FAULT_ERROR, "error signal \"{0}\" received, indicating segmentation fault (core dumped)"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1493, OPATCH_ISROLLINGPATCH_FAIL_WITH_MSG, "Execution of 'opatch query -is_rolling_patch' command failed.\n{0}"
//  *Cause: An attempt to determine if a patch was a rolling patch by executing
//          'opatch query -is_rolling_patch' failed. The accompanying messages
//          provide detailed failure information.
// *Action: Review the accompanying messages, resolve the problems identified,
//          and then retry the operation.
/
1494, ASMCMD_RM_FAIL, "failed to remove {0}\n{1}"
//  *Cause: An attempt to remove the specified file or directory failed.
//          Accompanying messages provide detailed failure information.
// *Action: Correct the problem indicated by the accompanying error messages
//          and then retry.
/
1495, SRVMHELPER_ADD_TRUSTED_FAIL, "failed to add cluster certificate to the trust store"
//  *Cause: An attempt to add an rhpclient failed because an error occurred 
//          while adding the cluster certificate to the trust store. 
//          The accompanying messages provide detailed failure information.
// *Action: Review the accompanying messages, resolve the identified problems,
//          and then retry the operation.
/
1496, GET_CRS_UPGRADE_STATE_FAIL, "failed to retrieve the cluster upgrade state"
//  *Cause: An attempt to retrieve the cluster upgrade state failed on the 
//          local node. The accompanying messages
//          provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the identified issues,
//          and then retry the operation.
/
1497, GET_CRS_ACTIVE_PATCH_LEVEL_FAIL, "failed to retrieve the cluster active patch level"
//  *Cause: An attempt to retrieve the cluster active patch level failed on the
//          local node. The accompanying messages provide detailed
//          failure information.
// *Action: Examine the accompanying messages, resolve the identified issues,
//          and then retry the operation.
/
1498, GET_CRS_SOFTWARE_PATCH_LEVEL_FAIL_NODE, "failed to retrieve the cluster software patch level on node \"{0}\""
//  *Cause: An attempt to retrieve the cluster software patch level of the
//          indicated node failed. The accompanying messages provide detailed
//          failure information.
// *Action: Examine the accompanying messages, resolve the identified issues,
//          and then retry the operation.
/
1499, DHCPPROXY_CREATE_FAILED, "failed to create a DHCP proxy server resource"
//  *Cause: An attempt to configure the cluster to add a DHCP proxy server
//          failed. The accompanying messages provide detailed 
//          failure information.
// *Action: Examine the accompanying messages, resolve the identified issues,
//          and then retry the operation.
/
1500, OFSUTIL_NO_ACFS_MOUNTED_ONE_ARG, "There are no Oracle ACFS file systems on mount point {0}."
//  *Cause: An attempt to retrieve the Oracle Automatic Storage Management 
//          Cluster File System (Oracle ACFS) information for the specified
//          mount point failed because there was no Oracle ACFS file system
//          mounted on the specified mount point.
// *Action: Verify that an Oracle ACFS is mounted at the specified mount point 
//          or create the file system using the command 'srvctl add filesystem'.
/
1501, OFSUTIL_NO_ACFS_MOUNTED_TWO_ARGS, "There are no Oracle ACFS file systems on mount point {0} in node {1}."
//  *Cause: An attempt to retrieve the Oracle Automatic Storage Management 
//          Cluster File System (Oracle ACFS) information for the specified 
//          mount point on the specified node failed because there was no 
//          Oracle ACFS file system mounted there.
// *Action: Verify that an Oracle ACFS is mounted at the specified mount point 
//          or create the file system using the command 'srvctl add filesystem'.
/
1502, SRVMHELPER_GET_ACFS_VOLDEVICE, "Failed to retrieve the volume device for mountpoint {0}"
//  *Cause: An attempt to execute an internal command to retrieve the volume 
//          device for a mountpoint failed. The accompanying error messages 
//          provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation. 
/
1503, SRVMHELPER_VIPLESS_FAIL, "failed to verify that a VIP can be configured for network {0}\n{1}"
//  *Cause: An attempt to execute an internal command to validate whether a 
//          virtual IP address can be configured for the specified network 
//          resource failed. Specifics of the failure are shown in the 
//          accompanying error messages.
// *Action: Correct the problem indicated by the accompanying error messages 
//          and then retry.
/
1504, INVALID_PATH, "invalid file path {0}"
//  *Cause: A requested operation was rejected because the indicated path did
//          not exist.
// *Action: Retry the command supplying a valid file path.
/
1505, SRVMHELPER_POST_GIMR_UPGRADE_FAIL, "Failed to start resource after GIMR upgrade. Details:\n{0}"
//  *Cause: An attempt to execute an internal command to start the indicated
//          resource failed after a Grid Infrastructure Management Repository 
//          (GIMR) upgrade. The accompanying messages provide detailed failure 
//          information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
1506, SRVMHELPER_CREATE_ALWALLET_FAIL, "Failed to create a wallet for user \"{0}\" on path \"{1}\". Details:\n{2}"
//  *Cause: An attempt to execute an internal command to create a wallet file
//          failed. The accompanying messages provide detailed failure 
//          information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
1507, SRVMHELPER_ADD_CERT_WALLET_FAIL, "Failed to add a certificate for a wallet using user \"{0}\" on path \"{1}\". Details:\n{2}"
//  *Cause: An attempt to execute an internal command to add a certificate
//          in a wallet failed. The accompanying messages provide detailed 
//          failure information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
1508, SRVMHELPER_IS_GROUP_VALID_FAIL, "Check whether group \"{0}\" exists failed."
//  *Cause: An attempted operation failed because it required a check on the
//          existence of the indicated group, and the internal command to
//          perform the check failed. The accompanying error messages provide
//          more details.
// *Action: Examine the accompanying error messages for details. 
//          Resolve the problems reported and retry.
/
1509, SQLPLUS_GET_DIR_PATH_FAIL, "failed to get the path of directory {0} from pluggable database {2} of container database {1}\n{3}"
//  *Cause: An attempted operation failed because it required retrieving the
//          indicated directory's path, and the internal command to retrieve the
//          path failed. The accompanying error messages provide more details.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
1510, SQLPLUS_GET_DIR_PATH_PARSE_FAIL, "failed to parse the output returned by sqlplus to get the path of directory {0} from pluggable database {2} of container database {1}\n{3}"
//  *Cause: An attempted operation failed because it required retrieving the
//          indicated directory's path, and the internal command to retrieve the
//          path failed while parsing the output because it was null or had
//          unexpected results. The accompanying error messages provide more
//          details.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
1511, ASMCMD_CP_FAIL, "failed to copy file {0} to destination {1}\n{2}"
//  *Cause: An attempted operation failed because it required copying the
//          indicated file to the indicated destination, and the internal
//          command to copy the file failed. The accompanying messages provide
//          detailed failure information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
1512, FAILED_TO_GET_COMPOSITE_VERSION, "failed to retrieve composite version from node \"{0}\""
//  *Cause: An attempt to retrieve the composite version using the command 
//          'oraversion -compositeVersion' failed. The accompanying messages  
//          provide detailed failure information.
// *Action: Execute the command 'oraversion -compositeVersion' from the 
//          indicated node and check the output of the command. Resolve the 
//          problems indicated in the command output, and then retry the 
//          operation.
/
1513, ASMCMD_GET_RES_DISK_USAGE_FAIL, "Execution of command {0} to obtain disk usage information failed. \n{1}"
//  *Cause: An attempt to retrieve the disk usage for a resource failed.
//          The accompanying error messages provide more details.
// *Action: Examine the accompanying error messages for details. 
//          Resolve the reported problems and retry.
/
1514, ASMCMD_DG_NO_SPACE_FOR_SIZE, "Disk group {0} does not have enough space to resize the volume to {1}GB. Execution of asmcmd at location {2} failed. Detailed error:\n{3}"
//  *Cause: An attempt to resize the specified volume was rejected because
//          the indicated disk group was too small.
// *Action: Add more disks to the disk group and then retry the operation.
/
1515, ORADNFS_MKDIR_FAIL, "failed to execute the command 'oradnfs mkdir' on the local node"
//  *Cause: An attempt to create an Oracle Direct NFS (dNFS) directory on the 
//          local node failed. The accompanying message provides detailed 
//          failure information.
// *Action: Review the accompanying message, resolve the indicated problems, 
//          and then retry the operation.
/
1516, DNFS_INVALID_PLATFORM, "The dNFS operation '{0}' is not supported on this platform."
//  *Cause: An attempt to execute an Oracle Direct NFS (dNFS) operation was 
//          rejected because the indicated command was not supported for the 
//          current operating system platform.
// *Action: None.
/
1517, HOST_SHARED_SCAN_TYPE_ERROR, "failed to create a network resource for the SCAN \"{0}\" because the node name \"{1}\" does not resolve to any addresses of type {2}"
//  *Cause: The indicated node name address did not match the IP address type 
//          of the Single Client Access Name (SCAN) contained in the 
//          credentials file.
// *Action: Configure an IP address for the indicated node name with the same 
//          address type as the SCAN in the credentials file and retry.
/
1518, FAILED_TO_GET_BASE_VERSION, "failed to retrieve base version from node \"{0}\""
//  *Cause: An attempt to retrieve the base version using the command 
//          'oraversion -baseVersion' failed. The accompanying messages provide 
//          detailed failure information.
// *Action: Execute the command 'oraversion -baseVersion' from the indicated 
//          node and check the output of the command. Resolve the problems 
//          indicated in the command output, and then retry the operation.
/
