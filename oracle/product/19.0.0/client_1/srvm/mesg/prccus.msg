// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCcMsg.msg
//
// DESCRIPTION
//    Message file to report failures due to invalid or unauthenticated parameters supplied during SRVM resource operations.
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      11/09/18 - Backport akhaladk_bug-28719114 from st_has_19
//     akhaladk    10/19/18 - bug 28719114. Add exception for Java api
//                            clssec_isRdsTcpEnv
//     jorgepe     04/25/18 - Fix bug 27927750: Upgrade state
//     rdesale     07/27/17 - fix bug 25472299
//     jesusfer    06/26/17 - fix bug 25970250, add INVALID_CLUSTER_CLASS
//     pevilla     02/21/17 - Fix bug 25425590, add INVALID_CLUSTERNAME
//     pevilla     12/16/16 - Add vipless messages
//     rdesale     10/06/16 - Fix bug 22593058
//     ekucukog    06/16/16 - Fix bug 23592351
//     chchatte    05/06/16 - fix bug 23240392
//     yizhang     02/02/16 - fix bug 22445946
//     pevilla     11/16/15 - Reader Farm support
//     epineda     11/05/15 - Fix 21918483: CIFS to SMB rename
//     pevilla     10/23/15 - HA NFS Locking support
//     epineda     10/06/15 - ER 21843722
//     chchatte    07/01/15 - bug 21140398
//     alcerda     05/27/15 - fix bug 20253727
//     ekucukog    11/10/14 - add helper name to CREATE_ADMHELPER_FAILED
//     vgunredd    09/17/14 - Add messages for snapshot cloning
//     epineda     07/24/14 - Add CIFS error messages
//     yizhang     05/02/14 - fix bug 1837489
//     yifyang     08/09/13 - Add USER_NOT_PRESENT Error
//     satg        11/14/12 - Fix bug 14730028
//     abhisbg     10/30/12 - fix admin helper
//     smadabhu    10/04/12 - Bug 14642750
//     yizhang     07/31/12 - add INVALID_VALUE_FOR_PARAM
//     vobulapu    07/10/12 - Fix bug 14111747
//     spavan      03/01/12 - fix bug13695778
//     ccharits    12/10/11 - Fixed bug 13468629
//     ccharits    11/30/11 - Added message NODE_VALIDATION_ERROR
//     ccharits    11/29/11 - Added message INVALID_MOUNTPOINT_PATH
//     smadabhu    10/18/11 - Add MGMTDB_TYPE_NOT_ALLOWED
//     ksviswan    08/26/11 - add adminhelper messages
//     ccharits    07/22/11 - Added message
//     spavan      03/09/11 - move execution failed message from PrCz
//     sowong      01/09/10 - add message for bug9271490
//     yizhang     06/04/09 - Add cause and action for messages
//     yizhang     05/29/09 - fix messages
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     lmortime    03/25/09 - Adding GET_PRIVATE_NODE_ADDRESS_FAIL
//     rxkumar     04/17/08 - add start/stop/enable/disable msgs
//     rxkumar     03/25/08 - rm INVALID_SG_MAX_VALUE
//     yizhang     03/03/08 - Fix message INVALID_SG_MAX_VALUE
//     sravindh    02/19/08 - Add message INVALID_SG_MAX_VALUE(transaction
//                            yizhang_srvctlsvgp_4)
//     agridnev    11/15/07 - added PARAM_CANNOT_BE_NULL
//     sowong      03/16/07 - add new messages
//     agridnev    03/21/07 - added message for enum error
//     sowong      01/22/07 - add PATH_IS_NOT_ABSOLUTE
//     rxkumar     12/18/06 - add NO_SUCH_IDENTIFIER
//     rxkumar     12/08/06 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1000, INVALID_PARAM_VALUE, "Parameter {0} value is not valid"
//  *Cause: This is an internal error. The value for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
1001, GET_INSTALL_GROUP_FAILED, "Failed to retrieve install group: {0}"
//  *Cause: An attempt to retrieve the install group failed.
// *Action: Examine the accompanying error messages for details.
/
1002, SET_INSTALL_GROUP_FAILED, "Failed to update install group: {0}"
//  *Cause: An attempt to set the install group failed.
// *Action: Examine the accompanying error messages for details.
/
1003, VERSION_NOT_AVAILABLE, "Version for module {0} is not available"
//  *Cause: An attempt to retrieve the version information for specified module failed.
// *Action: Examine the accompanying error messages for details.
/
1004, NO_SUCH_IDENTIFIER, "Unknown identifier {0} specified for checking result of operation"
//  *Cause: Failed to retrieve the result from the exception data using the specified identifier because the exception did not have the specified identifier.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1005, PATH_IS_NOT_ABSOLUTE, "Parameter {0} is not an absolute path"
//  *Cause: The specified parameter is not an absolute directory path.
// *Action: Provide an absolute directory path.
/
1006, PATH_IS_NOT_DIR, "Path {0} is not a directory"
//  *Cause: The specified path is not a directory.
// *Action: Provide a directory path.
/
1007, PATH_NOT_EXISTS, "Path {0} does not exist"
//  *Cause: The specified path did not exist.
// *Action: Provide an existing directory path.
/
1008, ENUM_NO_MEMBER_FOUND, "Enumerated type {0} does not have a member with corresponding value of {1}"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1009, PARAM_CANNOT_BE_NULL, "Parameter {0} cannot have null as a value"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1010, ALREADY_ENABLED, "{0} was already enabled"
//  *Cause: Given entity was already enabled.
// *Action: No action needed. To re-enable the entity, first disable it and then retry.
/
1011, ALREADY_ENABLED_PERX, "{0} was already enabled on {1}"
//  *Cause: Given entity was already enabled on given nodes.
// *Action: No action needed. To re-enable the entity on given nodes, first disable it on these nodes and then retry.
/
1012, ALREADY_DISABLED, "{0} was already disabled"
//  *Cause: Given entity was already disabled.
// *Action: No action needed. To re-disable the entity, first enable it and then retry.
/
1013, ALREADY_DISABLED_PERX, "{0} was already disabled on {1}"
//  *Cause: Given entity was already disabled on given nodes.
// *Action: No action needed. 
/
1014, ALREADY_RUNNING, "{0} was already running"
//  *Cause: Given entity is already running.
// *Action: No action needed. To re-start the entity, first stop it and then retry.
/
1015, ALREADY_RUNNING_PERX, "{0} was already running on {1}"
//  *Cause: Given entity was already running on given nodes.
// *Action: No action needed. To re-start the entity on given nodes, first stop it on these nodes and then retry.
/
1016, ALREADY_STOPPED, "{0} was already stopped"
//  *Cause: Given entity was already stopped.
// *Action: No action needed. To re-stop the entity, first start it and then retry.
/
1017, ALREADY_STOPPED_PERX, "{0} was already stopped on {1}"
//  *Cause: Given entity was already stopped on given nodes.
// *Action: No action needed. To re-stop the entity on given nodes, first start it on these nodes and then retry.
/
1018, GET_PRIVATE_NODE_ADDRESS_FAIL, "A request to retrieve private network addresses for node {0} found no addresses"
//  *Cause: A request to retrieve private network addresses by executing the command 'olsnodes -p' returned no private IP addresses.
// *Action: Check the command 'oifcfg getif' for cluster_interconnect networks and ensure this node has an IP address on the cluster_interconnect networks.
/
1019, INVALID_NULL_PARAM, "Parameter \"{0}\" value is not valid"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1020, INVALID_VERSION, "Version {0} cannot be used to administer resource configuration of version {1} or later"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1021, EXECUTION_FAILED, "One or more of the submitted commands did not execute successfully."
//  *Cause: Either a node failed in the middle of a manageability operation, or the communication between nodes was disrupted.
// *Action: Examine the accompanying error messages for details.
/
1022, FSTYPE_MUST_BE_ACFS, "The file system type must be ACFS and not {0}"
//  *Cause: Expected ACFS file system while the file system provided in the argument list was non-ACFS.
// *Action: Make sure that the file system type provided in the argument list is ACFS.
/
1023, FSTYPE_MUST_BE_NON_ACFS, "The file system type must be non-ACFS"
//  *Cause: Expected non-ACFS file system while the file system provided in the argument list was ACFS.
// *Action: Make sure that the file system type provided in the argument list is non-ACFS.
/
1024, CANNOT_CREATE_NON_ACFS_LOCAL_RESOURCE, "Creation of non-ACFS file system local resource is not supported"
//  *Cause: Attempted to create a file system local resource while the file system type was non-ACFS.
// *Action: Either specify a node or serverpool list to create a cluster resource for the file system or make sure that the file system type is ACFS to create a local resource.
/
1025, EXECUTION_TIMEDOUT, "Command submitted on node {0} timed out after {1} seconds."
//  *Cause: A command submitted on the node specified did not finish within the specified interval.
// *Action: Ensure that the node specified is reachable and not overloaded. Contact Oracle Support Services.
/
1026, EXECUTION_TIMEDOUT_CMD, "Command \"{0}\" submitted on node {1} timed out after {2} seconds."
//  *Cause: The command submitted on the node specified did not finish within 
//          the specified interval.
// *Action: Ensure that the node specified is reachable and not overloaded. 
//          Contact Oracle Support Services.
/
1100, CREATE_ADMHELPER_FAILED, "Failed to create administrator helper resource \"{0}\" configuration"
//  *Cause: An attempt to create configuration for the administrator helper resource failed. Either the request was not issued by an account with administrative access (root, Administrator and so on) or a problem was detected inside Oracle Clusterware.
// *Action: Examine the accompanying error messages for details. Make sure that the user has administrative privileges.
/
1101, MGMTDB_TYPE_NOT_ALLOWED, "The database type cannot be MGMTDB."
//  *Cause: An attempt to create the database of the wrong database type has failed.
// *Action: Contact Oracle Support Services.
/
1102, INVALID_MOUNTPOINT_PATH, "Mount point path \"{0}\" is not an absolute path"
//  *Cause: The mount point path value was not an absolute path.
// *Action: Specify an absolute path in the '-mountpoint' argument.
/
1103, FAILED_TO_VERIFY_MEMBERSHIP, "Failed to verify node membership"
//  *Cause: An error occurred while querying the clusterware to obtain information about the cluster membership.
// *Action: Examine the accompanying error messages for details.
/
1104, NODE_VALIDATION_ERROR, "Specified node {0} is not a configured cluster node"
//  *Cause: Found a node in the node list that was not configured in the cluster. 
// *Action: Make sure that all the nodes in the specified node list are configured cluster nodes. Check the cluster membership with 'olsnodes'.
/
1105, MODIFY_FS_ERROR_AS_LOCAL_RESOURCE_FOUND, "Server pool or node list cannot be modified because the file system for volume device {0} is a cluster-wide cluster file system"
//  *Cause: An attempt to modify the server pool or node list attributes of a cluster file system was rejected because the filesystem resource was a local resource.  Placement attributes like server pools or node names apply only to cluster resources.
// *Action: Do not specify node names and server pools, or remove the local resource and add a cluster resource with the command 'srvctl add filesystem {-serverpools <serverpool_list>|-nodes <node_list>}'.
/
1106, INVALID_VALUE_FOR_PARAM, "Parameter {0} value {1} is not valid"
//  *Cause: This is an internal error. The value for the specified parameter is not valid.
// *Action: Contact Oracle Support Services.
/
1107, SET_OHASD_DEP_FAILED, "Failed to set the OHASD resource dependencies for ASM"
//  *Cause: An attempt to set the OHASD dependencies on all nodes failed. 
// *Action: Examine the accompanying error messages for details.
/
1108, VIP_ADDRESS_REACHABILITY_ERROR, "Invalid VIP address {0} because the specified IP address is reachable"
//  *Cause: The submitted command was rejected because the Virtual Internet Protocol (VIP) address was reachable.
// *Action: Configure VIPs to use IP addresses that are not active on any host system and cannot be reached using 'ping'.
/
1109, USER_NOT_PRESENT, "User {0} is not present on the Access Control List."
//  *Cause: A request to remove a user from an Access Control List specified a user name not in the Access Control List.
// *Action: Specify a user who is on the Access Control List.
/
1110, USER_ALREADY_ADDED, "User {0} is already added to the Access Control List."
//  *Cause: A request to add a user to an Access Control List specified a user name already on the Access Control List.
// *Action: Specify a user who is not on the Access Control List.
/
1111, MISSING_ASM_PROPERTIES, "missing ASM properties {0}"
//  *Cause: An attempt to get ASM properties from the ASM client data file failed because the required ASM property attributes do not exist.
// *Action: Ensure that a valid ASM client data file is supplied.
/
1112, INVALID_EXPORT_TYPE, "The export type {0} is invalid."
//  *Cause: An attempt to set an export file system type failed because the specified export type was invalid.
// *Action: Specify a valid export type (NFS or SMB).
/
1113, UNSUPPORTED_EXPORT_TYPE, "Export type {0} is not supported on this operating system."
//  *Cause: An attempt to add an export file system failed because the specified export type is not supported on this system. 
// *Action: Specify a supported export type.
/
1114, UNSUPPORTED_CLIENTS_CIFS, "Export clients option is not supported for export type SMB."
//  *Cause: The submitted command failed because export clients were specified for an export file system of type SMB. 
// *Action: Specify the clients in the export -options argument instead of -clients.
/
1115, INVALID_PLATFORM_ENUM, "Platform {0} is invalid."
//  *Cause: An attempt to retrieve the supported export types for a platform failed because the specified platform was invalid. 
// *Action: Specify a valid platform (UNIX or WINDOWS).
/
1116, SNAPCLONE_FAILED, "failed to clone snapshot {0} from source mount point {1} to destination mount point {2}"
//  *Cause: An attempt to clone a snapshot from an Oracle ACFS file system to another Oracle ACFS file system failed. The accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details and retry after resolving the problems.
/
1117, CLONE_LSNR_INIT_FAILED, "failed to create a clone listener"
//  *Cause: An attempt to create a clone listener failed. The accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details and retry after resolving the problems.
/
1118, CLONE_LSNR_CLOSE_FAILED, "failed to close the clone listener"
//  *Cause: An attempt to close the clone listener failed. The accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details and retry after resolving the problems.
/
1119, CMD_HANGED, "Command \"{0}\" did not complete."
//  *Cause: An attempt to execute the indicated command failed because command execution stalled and was forcibly terminated.
// *Action: Retry the operation and contact Oracle Support Services if problem persists.
/
1120, CLONE_CONN_FAILED, "Connection between client and clone listener ended abnormally."
//  *Cause: An attempt by the clone listener to execute the client's requests failed. The accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details and retry after resolving the problems.
/
1121, SNAP_NOT_EXISTS, "snapshot {0} does not exist at mount point {1}"
//  *Cause: The clone operation failed because the Oracle ACFS file system at the indicated mount point did not contain the indicated snapshot.
// *Action: Specify a valid snapshot and retry.
/
1122, INVALID_MOUNT_POINT, "Mount point {0} does not exist."
//  *Cause: The 'acfsutil' command failed to execute because the specified mount point did not exist.
// *Action: Specify a valid mount point and retry.
/
1123, CLONE_CLIENT_REQ_FAILED, "Clone listener failed to execute the client's request. Details: {0}"
//  *Cause: An attempt by the clone listener to execute the client's requests failed. The accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details and retry after resolving the problems.
/
1124, SNAP_ALREADY_EXISTS, "Snapshot {0} already exists on the destination Oracle ACFS file system at mount point {1}."
//  *Cause: An attempt to create a clone with the indicated name failed because the destination Oracle ACFS file system already contained a snapshot with that name.
// *Action: Specify a different name for the clone to be created.
/
1125, GH_EMAIL_AUTHENTICATION_FAILED, "failed to authenticate the email address with the specified details"
// *Cause: An attempt to authenticate the email account failed during validation of email particulars.
// *Action: Reissue the command with valid email account information.
/
1126, GH_FAILED_EMAIL_SERVER_CONNECTION, "failed to create a connection to the specified email server address"
// *Cause: An attempt to connect to an email server failed with the specified details.
// *Action: Make sure the data entered is correct and the email server is available.
/
1127, INVALID_GIMR_COMPONENT, "The GIMR component {0} is unknown."
//  *Cause: An attempt to query an Grid Infrastructure Management Repository (GIMR) component was rejected because the specified GIMR component was unknown.
// *Action: Contact Oracle Support Services.
/
1128, GIMR_COMPONENT_NOT_FOUND, "The GIMR component {0} has no credentials for cluster {1}."
//  *Cause: An attempt to query an Grid Infrastructure Management Repository (GIMR) component was rejected because the specified GIMR component was not found in the specified client or server cluster.
// *Action: Contact Oracle Support Services.
/
1129, GIMR_INVALID_CLIENT_CLUSTER_QUERY, "GIMR client cluster name {0} is not the current cluster."
//  *Cause: An attempt to query a Grid Infrastructure Management Repository (GIMR) component was rejected because the specified client cluster name did not match the current GIMR client cluster name.
// *Action: In a GIMR client cluster environment, specify the same cluster name as the current client cluster.
/
1130, INVALID_NETSTORAGESRV_TYPE, "The network storage service type {0} is invalid. Valid types are {1}"
//  *Cause: An attempt to set a network storage service type failed because the specified type was invalid.
// *Action: Specify a valid network storage service type.
/
1131, VIP_EXTENDED_ERROR, "failed to create the Virtual IP (VIP) resource on node {0} because network {1} is not extended to work on Leaf Nodes"
//  *Cause: An attempt to create a VIP resource on the indicated Leaf Node failed because the indicated network resource was not extended to Leaf Nodes.
// *Action: Extend the network resource using the command 'srvctl modify network'.
/
1146, ERROR_GET_TARGET_STATUS, "error getting the client connection list for resource {0} \n{1}"
//  *Cause: A request to get the client connection list for the specified resource failed.
// *Action: Review the accompanying error messages for more details. Address the issues raised and retry.
/
1147, NOT_IN_CLUSTER_OR_WRONG_PASSWORD, "Either the specified node \"{0}\" is not part of a cluster, or the provided password is incorrect."
// *Cause: An attempt to obtain the Cluster Ready Services (CRS) home of an
//         Oracle Grid Infrastructure cluster failed because either the 
//         indicated node was not part of the cluster or the password was 
//         incorrect.
// *Action: Reissue the command specifying a node that is part of an Oracle 
//         Grid Infrastructure cluster and ensuring that the password is 
/          correct.
/
1148, UNSUPPORTED_GNS_CLIENT_OPTION, "Command option {0} is not supported on GNS client clusters."
//  *Cause: The specified command option was not valid for a GNS client cluster.
// *Action: Re-issue the command using only supported options.
/
1149, CREATE_RHPPROGRESSLSNR_FAILED, "Failed to create RHP progress listener resource \"{0}\" configuration."
//  *Cause: An attempt to create a configuration for the Rapid Home Provisioning (RHP) 
//          progress listener resource failed.
//          Either the request was not issued by an account with administrative access
//          (root, Administrator, and so on) or a problem was detected inside 
//          Oracle Clusterware.
// *Action: Examine the accompanying error messages for details, resolve issues 
//          raised, and retry, ensuring that the user has administrative 
//          privileges.
/
1150, VIPLESS_REACHABILITY_ERROR, "invalid VIP address {0} because the specified IP address is not reachable"
//  *Cause: The submitted command was rejected because the Virtual Internet 
//          Protocol (VIP) address was not reachable.
// *Action: Configure VIPs using the host address, and then retry the operation.
/
1151, INVALID_CLUSTERNAME, "Cluster name {0} contains these invalid characters \"{1}\"."
//  *Cause: The indicated cluster name contained the indicated invalid 
//          characters.
// *Action: Retry the operation, supplying a valid cluster name. A cluster name 
//          may include only characters from the set "(a-z, A-Z, 0-9, -)".
/
1152, INVALID_CLUSTER_CLASS_MEMBER, "The cluster is not of class member cluster."
//  *Cause: An attempt to execute a command was rejected because the cluster
//          was not a member cluster.
// *Action: Retry the operation on a member cluster.
/
1153, INVALID_CLUSTER_CLASS_DOMAIN, "The cluster is not of class domain cluster."
//  *Cause: An attempt to execute a command was rejected because the cluster
//          was not a domain cluster.
// *Action: Retry the operation on a domain cluster.
/
1154, GET_PRIVATE_IP_ADDRESS_FAIL, "Request to retrieve a private IP address needed for rhpctl progress communication failed with error \"{0}\"."
//  *Cause: An attempt to execute an rhpctl command failed because the indicated
//          error occurred in retrieving a private IP address needed for rhpctl
//          progress communication configured on the local node.
//          Accompanying messages provide failure details.
// *Action: Examine the accompanying error messages, resolve the reported 
//          problems and retry the command.
/
1155, FAILED_TO_GET_ODA_TYPE, "failed to get ODA type \n{0}"
//  *Cause: An error occurred while attempting to retrieve the Oracle Database
//          Appliance (ODA) type possibly because of a missing Oracle Appliance
//          Kit (OAK) library.
// *Action: Examine the accompanying error messages, resolve the reported
//          problems and retry the command.
/
1156, FAILED_TO_GET_UPGRADE_STATE, "failed to get the state of cluster upgrade \n{0}"
//  *Cause: An error occurred while attempting to retrieve the state of the 
//          cluster upgrade.
// *Action: Examine the accompanying error messages, resolve the reported
//          problems and retry the command.
/
1157, FAILED_TO_GET_RDSTCP_ENV, "Failed to determine whether RDS over TCP/IP should be enabled for instance to instance communication. Assuming FALSE \n{0}."
//  *Cause: An error occurred while attempting to discover whether
//          Reliable Datagram Socket (RDS) over TCP/IP can be enabled. 
// *Action: Examine the accompanying error messages, resolve the
//          reported problems, and retry the command.
/
