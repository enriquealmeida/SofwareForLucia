// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCiMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      10/17/18 - Backport vinavish_bug-28601654 from main
//     vinavish    08/20/18 - fix bug 27412638
//     apfwkr      10/26/18 - Backport vinavish_bug-28797417 from main
//     vinavish    10/22/18 - fix bug 28797417
//     jorgepe     07/20/18 - Fix bug 21571406: Added LXC API
//     pevilla     05/08/17 - Fix bug 26000351, add isViplessNet
//     rdesale     05/12/16 - bug fix 23271581
//     ccharits    04/27/16 - Fixed bug 23049292
//     pevilla     02/23/16 - Fix bug 22758752, add getScanName messages
//     rdesale     01/26/16 - bug fix 22458195
//     rdesale     12/09/15 - bug fix 21535522
//     ccharits    05/11/15 - Added message OPC_ENV_CHECK_FAILED
//     epineda     08/20/14 - Bugfix 13399240
//     yizhang     04/17/14 - Define GET_ALL_NODES_FAILED
//     sidshank    10/28/13 - bug 17466951.
//     xesquive    10/08/13 - fix bug16911527
//     vgunredd    09/24/13 - Fix bug 17327525
//     lureyes     03/21/13 - Change HA_CONFIGURED_NO_HOME_CHECK_FAILED id
//                            number
//     sowong      11/26/12 - fix bug15882617
//     smadabhu    11/06/12 - Add GET_MGMTDB_SIZE_FAILED
//     sidshank    11/05/12 - add message for failure to get node name when
//                            mgmt db is not running.
//     xesquive    08/17/12 - bug fix 14375577
//     sidshank    07/20/11 - Adding messages for Root command Automation
//     sravindh    04/03/11 - Bug 11839922
//     rdasari     03/22/11 - add root automation project mesgs
//     agorla      10/28/10 - read from console error
//     sowong      04/21/10 - fix bug9597274
//     yizhang     06/04/09 - Add cause and action for messages
//     yizhang     05/29/09 - fix messages
//     sravindh    05/13/09 - Add messages for ACFS check API
//     sravindh    05/05/09 - Review comments
//     sravindh    05/03/09 - Bug 8416623
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     ccharits    08/07/08 - add messages for length mismatch between the IP address and the subnet mask
//                            and for invalid format of the result after applying the mask to the IP address
//     ksviswan    06/03/08 - add message for getClustername failure
//     nvira       04/17/08 - add message for isHAConfig failure without HAhome
//     nvira       02/29/08 - add method for active version in a non cluster
//                            env error
//     sowong      02/27/08 - add messages for bug6660902
//     ksviswan    01/08/08 - add message for dynamic VIP check
//     nvira       03/27/07 - change id() to name()
//     sowong      03/23/07 - add message for install failures
//     nvira       01/12/07 - review comments
//     nvira       01/02/07 - add message for null db name
//     nvira       12/15/06 - Message file for ClusterwareInfo
//     nvira       12/15/06 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1000, GET_INSTALL_INFO_FAILED, "Failed to retrieve install information on local node using OUI location {0}"
//  *Cause: An attempt to retrieve install information on the local node from the specified location failed.
// *Action: Examine the accompanying error messages for details.
/
1001, GET_REMOTE_INSTALL_INFO_FAILED, "Failed to retrieve install information on remote node {0} using OUI location {1}"
//  *Cause: An attempt to retrieve install information on a remote node from the specified location failed.
// *Action: Examine the accompanying error messages for details.
/
1100, GET_VENDOR_CLUSTER_FAILED, "Failed to get Vendor Cluster for CRS home {0}"
//  *Cause: Unable to locate vendor cluster library or execute lsnodes.
// *Action: Install Vendor Clusterware. Then try to run lsnodes again.
/
1101, GET_VENDOR_CLUSTER_NODE_FAILED, "Failed to get Vendor Cluster for CRS home {0} on node {1}"
//  *Cause: Unable to locate vendor cluster library or execute lsnodes on the specified node.
// *Action: Install Vendor Clusterware on the specified node. Then try to run lsnodes again.
/
1102, GET_ORACLECM_CLUSTER_FAILED, "Failed to get OracleCM Cluster for CRS home {0}"
//  *Cause: Failed to get OracleCM Cluster for the local node using CRS home provided.
// *Action: Install Oracle 9i and make sure that /etc/ORCLcluster exists.
/
1103, GET_ORACLECM_CLUSTER_NODE_FAILED, "Failed to get OracleCM Cluster for CRS home {0} on node {1}"
//  *Cause: Failed to get OracleCM Cluster for the specified node using CRS home provided.
// *Action: Examine the accompanying error messages for details.
/
1104, HA_RUNNING_CHECK_FAILED, "Failed to check Oracle Restart running state for Oracle Restart home {0}"
//  *Cause: Failed to check whether Oracle Restart is running from the specified home on the local node.
// *Action: Examine the accompanying error messages for details.
/
1105, HA_RUNNING_NODE_CHECK_FAILED, "Failed to check Oracle Restart running state for Oracle Restart home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Restart is running from the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1106, HA_CONFIGURED_NODE_CHECK_FAILED, "Failed to check Oracle Restart configuration state for Oracle Restart home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Restart is configured for the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1107, CRS_RUNNING_CHECK_FAILED, "Failed to check CRS running state for CRS home {0}"
//  *Cause: Failed to check whether Oracle Clusterware is running from the specified home on the local node.
// *Action: Examine the accompanying error messages for details.
/
1108, CRS_RUNNING_NODE_CHECK_FAILED, "Failed to check CRS running state for CRS home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Clusterware is running from the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1109, CRS_CONFIGURED_CHECK_FAILED, "Failed to check CRS configuration state for CRS home {0}"
//  *Cause: Failed to check whether Oracle Clusterware is configured for the specified home on the specified node.
// *Action: Examine the accompanying error messages for details.
/
1110, CRS_CONFIGURED_NODE_CHECK_FAILED, "Failed to check CRS configuration state for CRS home {0} on node {1}"
//  *Cause: Failed to check whether Oracle Clusterware is configured for the specified home on the local node.
// *Action: Examine the accompanying error messages for details.
/
1111, NULL_FILE_PATH, "File path is null"
//  *Cause: The specified file is null or an empty string.
// *Action: Provide a valid file path that is not null. 
/
1112, NULL_DIR_NAME, "Directory name passed was null"
//  *Cause: The specified directory name is null or an empty string.
// *Action: Provide a valid directory name that is not null.
/
1113, NO_SUCH_DIRECTORY, "Directory {0} does not exist"
//  *Cause: Could not find the specified directory or it was a file instead of a directory.
// *Action: Provide an existing directory name.
/
1114, NULL_NODE_NAME, "Node name is null"
//  *Cause: The specified node name is null or an empty string.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1115, NULL_DB_NAME, "argument passed is null"
//  *Cause: The specified database name is null or an empty string.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1116, DB_EXISTS_CHECK_FAILED, "Failed to check if a database named {0} exists"
//  *Cause: Failed to execute the command 'crsctl stat resource <database_resource_name>' to decide whether the specified database exists or not.
// *Action: Examine the accompanying error messages for details.
/
1117, GET_HA_MANAGED_DB_FAILED, "Failed to retrieve list of databases under high availability management"
//  *Cause: Failed to execute the command 'crsctl stat resource -w TYPE=ora.database.type <filter>' in order to get the list of databases managed by Oracle Restart.
// *Action: Examine the accompanying error messages for details.
/
1118, ASM_DEPENDENCY_CHECK_FAILED, "Failed to determine if database {0} depends on Automatic Storage Management"
//  *Cause: Failed to execute crsctl command to decide whether the specified database depended on Automatic Storage Management (ASM).
// *Action: Examine the accompanying error messages for details.
/
1119, DB_EXISTS_CHECK_NODE_FAILED, "Failed to determine if database {0} is configured on node {1}"
//  *Cause: An attempt to determine the nodes on which a database is configured failed. Either the specified node name is invalid or an internal request failed.  
// *Action: Examine the accompanying error messages for details.
/
1120, GET_HA_MANAGED_DB_NODE_FAILED, "Failed to retrieve list of databases under high availability management for node {0}"
//  *Cause: Failed to get the list of database managed by Oracle Restart on the specified node because the specified node is null or an invalid node or crsctl command execution failed. 
// *Action: Examine the accompanying error messages for details.
/
1121, ASM_DEPENDENCY_CHECK_NODE_FAILED, "Failed to determine if database {0} depends on Automatic Storage Management on node {1}"
//  *Cause: Failed to execute crsctl command to decide whether the specified database depended on Automatic Storage Management (ASM) on the specified node because the specified node is null or an invalid node or crsctl command execution failed. 
// *Action: Examine the accompanying error messages for details.
/
1122, VIP_DHCP_CHECK_FAILED, "Failed to determine if the public network is using dynamic address assignment (DHCP)"
//  *Cause: An attempt to determine whether the public network is using dynamic address assignment (DHCP) failed.
// *Action: Examine the accompanying error messages for details.
/
1123, CRS_NOT_EXIST, "CRS home does not exist on the local node"
//  *Cause: CRS home is not installed on the local node.
// *Action: Install a CRS home using the Oracle Universal Installer.
/
1124, HA_NOT_EXIST, "Oracle Restart home does not exist on the local node"
//  *Cause: Oracle Restart home is not installed.
// *Action: Install an Oracle Restart home using the Oracle Universal Installer.
/
1125, CRS_NOT_EXIST_NODE, "CRS home does not exist on node {0}"
//  *Cause: CRS home is not installed on the specified node.
// *Action: Install a CRS home using the Oracle Universal Installer.
/
1126, HA_NOT_EXIST_NODE, "Oracle Restart home does not exist on node {0}"
//  *Cause: Oracle Restart home is not installed on the specified node.
// *Action: Install an Oracle Restart home using the Oracle Universal Installer.
/
1127, GET_ACTV_VRSN_FAILED_CRS_NOT_CONFIG, "CRS active version cannot be queried in a non-cluster environment"
//  *Cause: Clusterware is not configured.
// *Action: Ensure that Clusterware is configured.
/
1128, HA_CONFIGURED_CHECK_FAILED, "Failed to check Oracle Restart configuration state for Oracle Restart home {0}"
//  *Cause: Oracle Restart may not be configured
// *Action: Ensure that Oracle Restart is installed and configured
/
1129, HA_CONFIGURED_NODE_NO_HOME_CHECK_FAILED, "Failed to check Oracle Restart configuration state on node {1}"
//  *Cause: Oracle Restart may not be configured
// *Action: Ensure that Oracle Restart is installed and configured
/
1130, CRS_CONFIGURED_NO_HOME_CHECK_FAILED, "Failed to check CRS configuration state"
//  *Cause: Clusterware CRS may not be configured
// *Action: Ensure that Clusterware CRS is installed and configured
/
1131, CRS_CONFIGURED_NODE_NO_HOME_CHECK_FAILED, "Failed to check CRS configuration state on node {1}"
//  *Cause: Clusterware CRS may not be configured
// *Action:  Ensure that Clusterware CRS is installed and configured
/
1132, GET_CLUSTERNAME_FAILED, "Failed to get clustername for CRS home {0} and version {1}"
//  *Cause: Clusterware is not configured and CRS stack is not up
// *Action:  Ensure that Clusterware CRS is installed and configured and the stack is up.
/
1133, IPADDR_SUBNETMASK_LENGTH_MISMATCH, "The IP address {0} does not have the same number of fields with the subnet mask {1}"
//  *Cause: IP address is in IPv4 address format while the subnet mask is in IPv6 address format or the other way around. 
// *Action:  Ensure that both the IP address and the subnet mask use the same representation (the longer required among IPv4 and IPv6).
/
1134, INVALID_RESULTING_SUBNET_FORMAT, "Applying subnet mask {0} to IP address {1} resulted in an invalid IP address format"
//  *Cause: This won't ever happen. Message added just in case.  
// *Action: N/A
/
1135, ISPATHONACFS_CHECK_FAILED, "Failed to check if path {0} on node {1} is on ACFS"
// *Cause:  An attempt to determine if the specified path is on ACFS failed.
//     This can occur because:
//     1. The Clusterware stack is down on the specified node.
//     2. ASM is down on the specified node.
//     3. A diskgroup associated with the path is not online.
//     4. The path is not mounted.
// *Action: Perform checks corresponding to the above causes:
//     1. Ensure the Clusterware stack is running on the specified node.
//     2. Ensure that ASM is running on the specified node.
//     3. Ensure that the diskgroup associated with the path is online.
//     4. Ensure that the file system is mounted on the node.
/
1136, PATH_NOT_ON_ACFS, "The specified path {0} is not on Oracle Automatic Storage Manager Cluster File System (ACFS)"
// *Cause: The specified path is not on ACFS.
// *Action: Specify a path that is on ACFS. This check will only accept paths on ACFS.
/
1137, ISGIVENPATHONACFS_CHECK_FAILED, "Failed to check if path {0} is on ACFS"
// *Cause:  An attempt to determine if the specified path is on ACFS failed.
//     This can occur because:
//     1. The Clusterware stack is down on the specified node.
//     2. ASM is down on the specified node.
//     3. A diskgroup associated with the path is not online.
//     4. The path is not mounted.
// *Action: Perform checks corresponding to the above causes:
//     1. Ensure the Clusterware stack is running on the specified node.
//     2. Ensure that ASM is running on the specified node.
//     3. Ensure that the diskgroup associated with the path is online.
//     4. Ensure that the file system is mounted on the node.
/
1138, HA_CONFIGURED_NO_HOME_CHECK_FAILED, "Failed to check Oracle Restart configuration state"
//  *Cause: Oracle Restart was not configured.
// *Action: Ensure that Oracle Restart is installed and configured.
/
1140, ERROR_READ_FROM_CONSOLE, "Error occurred while reading input from console"
//  *Cause: An attempt to read input from console failed
// *Action: Make sure that the process running this program has a valid standard input (stdin).
/
1141, GETVOLUMEDEVICE_FAILED, "Failed to get volume device for path {0} "
// *Cause:  An attempt to retrieve the volume device for the given ACFS path failed.
//     This can occur because:
//     1. The Clusterware stack is down on the node.
//     2. ASM is down on the node.
//     3. A diskgroup associated with the path is not online.
//     4. The path is not mounted.
// *Action: Perform checks corresponding to the above causes:
//     1. Ensure the Clusterware stack is running on the node.
//     2. Ensure that ASM is running on the node.
//     3. Ensure that the diskgroup associated with the path is mounted.
//     4. Ensure that the file system is mounted on the node.
/
1142, GETVOLUMEDEVICE_NODE_FAILED, "Failed to get volume device for path {0} on node {1} "
// *Cause:  An attempt to retrieve the volume device for the given ACFS path failed.
//     This can occur because:
//     1. The Clusterware stack is down on the specified node.
//     2. ASM is down on the specified node.
//     3. A diskgroup associated with the path is not online.
//     4. The path is not mounted.
// *Action: Perform checks corresponding to the above causes:
//     1. Ensure the Clusterware stack is running on the specified node.
//     2. Ensure that ASM is running on the specified node.
//     3. Ensure that the diskgroup associated with the path is mounted.
//     4. Ensure that the file system is mounted on the specified node.
/
1143, REMOTE_EXECUTION_FAILED, "Error executing the script {0} on nodes {1}"
// *Cause: An error occurred in executing the script on the list of nodes mentioned.
//         This message is accompanied by others providing details of the error.
// *Action: Correct the problem indicated by the accompanying messages and retry.
/
1144, GET_CRS_HOME_FAILED, "Failed to retrieve Oracle Grid Infrastructure home path"
//  *Cause: An attempt to read Grid Infrastructure home path from OLR configuration file or registry entry failed.
// *Action: Examine the accompanying error messages for details.
//     1. Make sure Grid Infrastructure is configured as either Oracle Clusterware or Oracle Restart,and that the invoking user is able to read the configuration. 
//     2. Issue the command '<GI home>/srvm/admin/getcrshome' and examine the resulting output.
/
1145, GET_CRS_HOME_NODE_FAILED, "Failed to retrieve Oracle Grid Infrastructure home path on node {0}"
//  *Cause: An attempt to read Grid Infrastructure home path from OLR configuration file or registry entry on specified node failed.
// *Action: Examine the accompanying error messages for details.
//     1. Make sure Grid Infrastructure is configured as either Oracle Clusterware or Oracle Restart,and that the invoking user is able to read the configuration. 
//     2. Issue the command '<GI home>/srvm/admin/getcrshome' and examine the resulting output.
/
1146, NULL_PARAM , "invalid {0} argument passed"
// *Cause: The argument provided was null.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1147, EXCEPTION_FIRSTNODE , "root script operation failed on the first node {0}"
// *Cause: The root configuration or upgrade failed on the first node.
//         This message is accompanied by other messages providing details of the error.
// *Action: Correct the problem indicated by the accompanying messages and retry.
/
1148, EXCEPTION_LASTNODE , "root script operation failed on the last node {0}"
// *Cause: The root configuration or upgrade failed on the last node.
//         This message is accompanied by other messages providing details of the error.
// *Action: Correct the problem indicated by the accompanying messages and retry.
/
1149, GET_CLUSTER_ACTIVE_ROLES_FAILED , "olsnodes utility failed to get the cluster node active roles"
// *Cause: An attempt to execute olsnodes -a has failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1150, GET_ACTIVE_NODE_ROLE_FAILED, "failed to retrieve the active node role of the node {0}"
// *Cause: An attempt to retrieve the active node role of an invalid node of the cluster has failed.
// *Action: Enter a valid node of the cluster.
/
1151, GET_CLUSTER_CONFIG_ROLES_FAILED, "crsctl utility failed to get the cluster node configured roles"
// *Cause: The argument provided was null.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1152, GET_CONFIG_NODE_ROLE_FAILED, "failed to retrieve the configured node role of the node {0}"
// *Cause: An attempt to retrieve the configured node role of an invalid node of the cluster has failed.
// *Action: Enter a valid node of the cluster.
/
1153, EXEC_MSG , "executing root operation on node {0}"
// *Document: NO
// *Cause:
// *Action:
/
1154, CMPLT_MSG , "Successfully configured node {0}"
// *Document: NO
// *Cause:
// *Action:
/
1155, FAIL_MSG , "Failed to configure node {0}"
// *Document: NO
// *Cause:
// *Action:
/
1156, IPADDR_SUBNETMASK_MISMATCH, "The GNS VIP {0} does not match any of the available subnets {1}."
// *Cause: The provided Grid Naming Service (GNS) virtual internet protocol (VIP) did not belong to an available subnet.
// *Action: Ensure that GNS VIP belongs to one of subnets connected to the node.
/
1157, GET_MGMT_DB_NODE_FAILED, "Failed to retrieve the node name on which the management database is running." 
// *Cause: An attempt to retrieve the management database node was made when the management database was not running. 
// *Action: Use the 'srvctl start mgmtdb' command to start the management database and retry.
/
1158, GET_MGMTDB_SIZE_FAILED, "Failed to retrieve the size of management database"
// *Cause: An attempt to retrieve the management database size failed because of underlying errors.
// *Action: Examine the accompanying error messages for details.
/
1159, PATH_NOT_ACFS_FILESYSTEM, "Path {0} is not on an ACFS file system"
// *Cause: The supplied path was not on an ACFS filesystem.
// *Action: Supply a path that is on ACFS.
/
1160, DB_ADMIN_CHECK_FAILED, "Failed to determine if database {0} is administrator-managed"
// *Cause: An internal command to determine management status of the specified database failed.
// *Action: Examine the accompanying error message for details.
/
1161, DB_RETRIEVE_ADMIN_NODES_FAILED, "Failed to retrieve nodes on which database {0} is configured"
// *Cause: An internal command to determine the nodes configured for the specified database failed.
// *Action: Examine the accompanying error message for details.
/
1162, IPADDR_SUBNET_NOT_EXISTS_PRE, "The specified subnets {0} do not match with any of the subnets {1} present in the node {2}."
// *Cause: An attempt to check whether the specified subnets were present in the current node failed.
// *Action: Ensure that the provided subnets match with the subnets present in the current node.
/
1163, IPADDR_SUBNET_NOT_EXISTS_POS, "The public subnets {0} do not match with any of subnets {1} present in the node {2}."
// *Cause: An attempt to check whether the VIP belongs to a public subnet failed.
// *Action: Ensure that the VIP address belongs to a public subnet. The public subnets are displayed by the command 'oifcfg getif'.
/
1164, NO_SUCH_FILE, "File \"{0}\" does not exist."
// *Cause: The specified file could not be found.
// *Action: Reissue the command specifying the name of an existing file.
/
1165, XSD_RESOURCE_NULL, "XSD resource \"{0}\" could not be located."
//  *Cause: The XML Schema Definition file was not found at the designated location. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1166, INVALID_CREDENTIALS_FILE, "Credential file \"{0}\" is invalid."
// *Cause: The provided credentials file was invalid.
// *Action: Reissue the command specifying a valid credentials file.
/
1167, GET_PROPERTIES_FAILED, "failed to extract atttributes from the specified file \"{0}\""
// *Cause: An attempt to extract attributes for the specified credentials file failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1168, GET_ALL_NODES_FAILED , "The OCRDUMP utility failed to get all cluster nodes."
// *Cause: An attempt to execute "ocrdump -noheader -stdout -keyname SYSTEM.version.hostnames" failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1169, GET_ACFS_MTPT_FAILED, "failed to retrieve the mount point for path {0}"
// *Cause: An internal command to retrieve the mount point for the specified path failed.
// *Action: Examine the accompanying error messages for details.
/
1170, OPC_ENV_CHECK_FAILED, "check whether cluster is an Oracle Database Appliance Lite environment failed"
//  *Cause: An attempt to check whether the cluster was configured in Oracle Public Cloud failed.
// *Action: Examine the accompanying error messages for details, resolve issues and retry the original request.
/
1171, GET_CLUSTER_NODE_ROLES_FAILED , "olsnodes utility failed to get the cluster node roles"
// *Cause: An attempt to execute olsnodes -a has failed.
// *Action: Examine the accompanying error messages for details, address the issues raised, and retry.
/
1172, BAD_XML_FILE, "The specified XML file {0} does not conform to XML standards."
// *Cause: The indicated XML file was invalid.
// *Action: Reissue the command specifying a valid XML file.
/
1173, INVALID_NETNUM, "The specified network number {0} is invalid."
// *Cause: An attempt to query a network resource was rejected because the 
//         specified network number was not a positive integer.
// *Action: Reissue the command specifying a valid network number.
/
1174, GET_SCANNAME_FAILED, "failure to get the cluster Single Client Access Name"
// *Cause: An attempt to query the Single Client Access Name (SCAN) failed. 
//         The accompanying error messages provide detailed failure 
//         information.
// *Action: Examine the accompanying error messages, address the issues 
//          raised, and retry.
/
1175, ODA_LITE_ENV_CHECK_FAILED, "check whether cluster is an Oracle Database Appliance Lite environment failed"
//  *Cause: An attempt to check whether the cluster was configured as Oracle Database Appliance Lite failed.
// *Action: Examine the accompanying error messages for details, resolve issues and retry the original request.
/
1176, ODA_SIP_ENV_CHECK_FAILED, "check whether cluster is an Oracle Database Appliance Single IP environment failed"
//  *Cause: An attempt to check whether the cluster was configured as Oracle Database Appliance Single IP failed.
// *Action: Examine the accompanying error messages for details, resolve issues and retry the original request.
/
1177, INVALID_MEMBER_CLUSTER_NUM, "invalid parameter value \"{0}\" for number of member clusters"
// *Cause: An attempt to retrieve the disk group size was rejected because
//         the specified number of member clusters was not greater than zero.
// *Action: Retry the operation specifying a value greater than zero for
//          the number of member clusters.
/
1178, GET_GIMR_SIZE_FAILED, "failed to retrieve the minimum disk space requirement for Grid Infrastructure Management Repository"
// *Cause: An attempt to retrieve the disk space for Grid Infrastructure 
//         Management Repository failed. The accompanying messages provide 
//         detailed failure information.
// *Action: Examine the accompanying messages, resolve the problems identified,
//          and retry the operation.
/
1179, GET_INCR_GIMR_SIZE_FAILED, "failed to retrieve the minimum disk space required for adding a new repository for a member cluster"
// *Cause: An attempt to retrieve the minimum disk space required to add a new 
//         repository for a member cluster failed. The accompanying messages 
//         provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the problems identified,
//          and retry the operation.
/
1180, GET_VIPLESS_FAILED, "failure to verify that a VIP can be configured for network {0}"
// *Cause: An attempt to query an attribute for the indicated network to 
//         determine whether a virtual IP address can be configured failed. 
//         The accompanying error messages provide detailed failure 
//         information.
// *Action: Examine the accompanying error messages, address the issues,
//          and retry.
/
1181, CHECK_LXC_MEMORY_FAILED_NC, "failed to retrieve the memory allocated because the local node is not a container"
//  *Cause: An attempt to retrieve the allocated memory for the local node 
//          failed because the operation is only supported on Linux Containers.
// *Action: Retry the operation in a Linux Container.
/
1182, NO_SUPPORT_ON_WINDOWS, "{0} is not supported on Windows platform"
//  *Cause: 
// *Action: 
/
1183, INVALID_DISKGROUP_SPECIFIED, "invalid disk group specified for creating Grid Infrastructure Management Repository"
//  *Cause: An attempt to create Grid Infrastructure Management Repository was 
//          rejected because the disk group was used by Oracle Cluster Registry.
// *Action: Retry the operation specifying a different disk group.
/
1184, SPECIFIED_DISKGROUP_NOT_EXISTS, "specified disk group does not exist for creating Grid Infrastructure Management Repository"
//  *Cause: An attempt to create Grid Infrastructure Management Repository
//          was rejected because the specified disk group did not exist.
// *Action: Retry the operation specifying a different disk group.
/
1185, INVALID_PATH_FOR_GIMR_CREATION, "invalid disk group specified for creating Grid Infrastructure Management Repository because OCR is not in an ASM disk group"
//  *Cause: An attempt to create Grid Infrastructure Management Repository
//          was rejected because Oracle Cluster Registry (OCR) was not in ASM
//          and a disk group was specified for creation of GIMR.
// *Action: Retry the operation without specifying a disk group.
/
1186, FAILED_TO_GET_REQD_SIZE_FOR_UPGRAGE, "failed to get additional required space for upgrade {0}"
// *Cause: An attempt to get the additional required space for upgrade failed. 
//         The accompanying error messages provide detailed failure 
//         information.
// *Action: Examine the accompanying error messages, address the issues,
//          and retry.
/
