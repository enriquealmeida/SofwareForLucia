// Copyright (c) 2008, 2017, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrChMsg.msg
//
// DESCRIPTION
//    Message file for home implementation
//
// NOTES
//
//     MODIFIED      (MM/DD/YY)
//     vinavish     06/19/17 - fix bug 26256790
//     jesusfer     05/11/17 - fix bug 25978509, modify action contents of msg
//     epineda      01/19/15 - Project 47408
//     vgunredd     07/15/14 - Fix bug 18539323
//     ocordova     05/12/14 - Fix bug 18231837
//     satg         11/14/12 - Fix bug 14730028
//     yizhang      05/29/09 - fix messages
//     spavan       05/28/09 - bug7562166 - add cvu resource
//     ksviswan     11/12/08 - Added DiskGroup messages
//     rwessman     05/01/08 - Added GNS messages.
//     ksviswan     03/21/08 - Add Cause and Action
//     ksviswan     03/12/08 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, HOME_ORACLE_STOP_FAILED, "Failed to stop resources running from Oracle home {0}"
//  *Cause: An attempt to stop one or more resources in the specified Oracle home failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to stop, check the cause and
// action for the individual resource stop failure and perform the steps for each resource that failed to stop.
/
1001, HOME_ORACLE_START_FAILED, "Failed to start resources in Oracle home {0}"
//  *Cause: An attempt to start one or more resources in the specified Oracle home failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to start, check the cause and
// action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1002, HOME_CRS_STOP_FAILED, "Failed  to stop resources running from CRS home {0}"
//  *Cause: An attempt to stop one or more resources in the specified CRS home failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to stop, check the cause and
// action for the individual resource stop failure, and perform the steps for each resource that failed to stop.
/
1003, HOME_CRS_START_FAILED, "Failed to start resources in CRS home {0}"
//  *Cause: An attempt to start one or more resources in the specified CRS home failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to start, check the cause and
// action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1004, HOME_SERVICE_STOP_FAILED, "Failed to stop service"
//  *Cause: An attempt to stop a service resource failed.
// *Action: Review the accompanying error messages for possible reasons and if needed, use the command
// 'srvctl stop service -db <db_unique_name>' to stop the service.
/
1005, HOME_DB_STOP_FAILED, "Failed to stop database"
//  *Cause: An attempt to stop the database resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop database -db <db_unique_name>' to stop the database.
/
1006, HOME_LSNR_STOP_FAILED, "Failed to stop Listener"
//  *Cause: An attempt to stop the listener resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop listener' to stop the listener.
/
1007, HOME_CLSNR_STOP_FAILED, "Failed to stop Listener"
//  *Cause: An attempt to stop the listener resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop listener' to stop the listener.
/
1008, HOME_SERVICE_START_FAILED, "Failed to start service"
//  *Cause: An attempt to start a service resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start service -db <db_unique_name>' to start the service.
/
1009, HOME_DB_START_FAILED, "Failed to start database"
//  *Cause: An attempt to start the database resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start database -db <db_unique_name>' to start the database.
/
1010, HOME_LSNR_START_FAILED, "Failed to start Listener" 
//  *Cause: An attempt to start the listener resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start listener' to start the listener.
/
1011, HOME_CLSNR_START_FAILED, "Failed to start Listener"
//  *Cause: An attempt to start the listener resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start listener' to start the listener.
/
1012, HOME_EONS_STOP_FAILED, "Failed to stop EONS"
//  *Cause: An attempt to stop the EONS resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop nodeapps' to stop the EONS resource.
/
1013, HOME_EONS_START_FAILED, "Failed to start EONS" 
//  *Cause: An attempt to start the EONS resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start nodeapps' to start the EONS resource.
/
1014, HOME_ONS_STOP_FAILED, "Failed to stop ONS"
//  *Cause: An attempt to stop the ONS resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop nodeapps' to stop the ONS resource.
/
1015, HOME_ONS_START_FAILED, "Failed to start ONS"
//  *Cause: An attempt to start the ONS resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start nodeapps' to start the ONS resource.
/
1016, HOME_GSD_STOP_FAILED, "Failed to stop GSD resource"
//  *Cause: An attempt to stop the GSD resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop nodeapps' to stop the GSD resource.
/
1017, HOME_GSD_START_FAILED, "Failed to start GSD resource"
//  *Cause: An attempt to start the GSD resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start nodeapps' to start the GSD resource.
/
1018, HOME_VIP_STOP_FAILED, "Failed to stop VIP resource"
//  *Cause: An attempt to stop the VIP resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop vip -node <node_name>' to stop the VIP resource.
/
1019, HOME_VIP_START_FAILED, "Failed to start VIP resource"
//  *Cause: An attempt to start the VIP resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start vip -node <node_name>' to start the VIP resource.
/
1020, HOME_NET_STOP_FAILED, "Failed to stop Network resource"
//  *Cause: An attempt to stop the Network resource failed.
// *Action: Review the error messages for possible reasons, correct the error and use the command
// 'srvctl stop nodeapps' to stop the Network resource.
/
1021, HOME_NET_START_FAILED, "Failed to start Network resource"
//  *Cause: An attempt to start the Network resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start nodeapps' to start the Network resource.
/
1022, HOME_SCANVIP_STOP_FAILED, "Failed to stop SCAN VIP resource"
//  *Cause: An attempt to stop the SCAN VIP resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop scan' to stop the SCAN VIP resource.
/
1023, HOME_SCANVIP_START_FAILED, "Failed to start SCAN VIP resource"
//  *Cause: An attempt to start the SCAN VIP resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start scan' to start the SCAN VIP resource.
/
1024, HOME_SCANLSNR_STOP_FAILED, "Failed to stop SCAN Listener resource"
//  *Cause: An attempt to stop the SCAN listener resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop scan_listener' to stop the SCAN listener resource.
/
1025, HOME_SCANLSNR_START_FAILED, "Failed to start SCAN Listener"
//  *Cause: An attempt to start the SCAN listener resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start scan_listener' to start the SCAN listener resource.
/
1026, HOME_ASM_STOP_FAILED, "Failed to stop ASM"
//  *Cause: An attempt to stop the ASM resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop asm' to stop the ASM resource.
/
1027, HOME_ASM_START_FAILED, "Failed to start ASM"
//  *Cause: An attempt to start the ASM resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start asm' to start the ASM resource.
/
1028, HOME_ORACLE_START_FAIL1, "One or more resources failed to start: {0}"
//  *Cause: An attempt to start one or more resources failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to start, check the cause and
// action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1029, HOME_ORACLE_STOP_FAIL1, "One or more resources failed to stop: {0}"
//  *Cause: An attempt to stop one or more resources failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to stop, check the cause and
//action for the individual resource stop failure and perform the steps for each resource that failed to stop.
/
1030, HOME_CRS_STOP_FAIL1, "One or more resources failed to stop: {0}"
//  *Cause: An attempt to stop one or more resources failed.
// *Action: Review the accompanying resource error messages and their documentation, and correct the problems indicated.
/
1031, HOME_CRS_START_FAIL1, "One or more resources failed to start: {0}"
//  *Cause: An attempt to start one or more resources failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to start, check the cause and
//action for the individual resource start failure and perform the steps for each resource that failed to start.
/
1032, HOME_GNS_STOP_FAILED, "Failed to stop GNS resource"
//  *Cause: An attempt to stop the GNS resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop gns' to stop the GNS resource.
/
1033, HOME_GNS_START_FAILED, "Failed to start GNS resource"
//  *Cause: An attempt to start the GNS resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start gns' to start the GNS resource.
/
1034, HOME_DG_STOP_FAILED, "Failed to stop diskgroup resource"
//  *Cause: An attempt to stop the diskgroup resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop diskgroup -diskgroup <dg_name>' to stop the diskgroup resource.
/
1035, HOME_DG_START_FAILED, "Failed to start diskgroup resource"
//  *Cause: An attempt to start the diskgroup resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start diskgroup -diskgroup <dg_name>' to start the diskgroup resource.
/
1036, HOME_FILE_NOT_FOUND, "The state file \"{0}\" does not exist" 
//  *Cause: The state file required for the current operation was not found.
// *Action: Make sure the named file exists in the file system.
/
1037, HOME_NOT_A_FILE, "The filesystem object \"{0}\" is not a file" 
//  *Cause: The content that was expected to be a file which turned out not to be a file.
// *Action: Retry the 'srvctl stop home' to generate this file. If the problem still exists, contact Oracle Support Services.
/
1038, HOME_CANNOT_READ_FILE, "\"{0}\" is a non-readable file" 
//  *Cause: The user does not have read permissions to open the file.
// *Action: Modify the file permissions so that the file becomes readable or execute the command
// from an OS userid with the required privileges.
/
1039, HOME_CVU_STOP_FAILED, "Failed to stop CVU resource"
//  *Cause: An attempt to stop the CVU resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl stop cvu' to stop the CVU resource.
/
1040, HOME_CVU_START_FAILED, "Failed to start CVU resource"
//  *Cause: An attempt to start the CVU resource failed.
//  *Action: Review the accompanying error messages for possible reasons, correct the error and use the command
// 'srvctl start cvu' to start the CVU resource.
/
1041, FAILED_WHILE_CHECKING_SERVICE_STATUS, "Failed while checking status of service \"{0}\""
//  *Cause: An attempt to check the status of the listed service failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1042, FAILED_WHILE_CHECKING_DATABASE_STATUS, "Failed while checking status of database \"{0}\""
//  *Cause: An attempt to check the status of the listed database failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1043, FAILED_WHILE_CHECKING_DB_INSTANCE_STATUS, "Failed while checking status of database instance \"{0}\""
//  *Cause: An attempt to check the status of the listed database instance failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1044, FAILED_WHILE_CHECKING_LISTENER_STATUS, "Failed while checking status of listener \"{0}\""
//  *Cause: An attempt to check the status of the listed listener failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1045, FAILED_WHILE_CHECKING_VIP_STATUS, "Failed while checking status of VIP \"{0}\""
//  *Cause: An attempt to check the status of the listed VIP failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1046, FAILED_WHILE_CHECKING_SCAN_VIP_STATUS, "Failed while checking status of SCAN VIP \"{0}\""
//  *Cause: An attempt to check the status of the listed SCAN VIP failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1047, FAILED_WHILE_CHECKING_SCAN_LISTENER_STATUS, "Failed while checking status of SCAN Listener \"{0}\""
//  *Cause: An attempt to check the status of the listed SCAN listener failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1048, FAILED_WHILE_CHECKING_CVU_RESOURCE_STATUS, "Failed while checking status of CVU resource \"{0}\""
//  *Cause: An attempt to check the status of the listed CVU resource failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1049, FAILED_WHILE_CHECKING_DISK_GROUP_STATUS, "Failed while checking status of disk group \"{0}\""
//  *Cause: An attempt to check the status of the listed disk group failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1050, FAILED_WHILE_CHECKING_ASM_STATUS, "Failed while checking status of ASM \"{0}\""
//  *Cause: An attempt to check the status of the listed ASM failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1051, FAILED_WHILE_CHECKING_GNS_STATUS, "Failed while checking status of GNS \"{0}\""
//  *Cause: An attempt to check the status of the listed GNS failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1052, FAILED_WHILE_CHECKING_GSD_STATUS, "Failed while checking status of GSD \"{0}\""
//  *Cause: An attempt to check the status of the listed GSD failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1053, FAILED_WHILE_CHECKING_NETWORK_STATUS, "Failed while checking status of Network \"{0}\""
//  *Cause: An attempt to check the status of the listed network failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1054, FAILED_WHILE_CHECKING_ONS_STATUS, "Failed while checking status of ONS \"{0}\""
//  *Cause: An attempt to check the status of the listed ONS failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1055, CANNOT_CREATE_OR_OPEN_FILE, "Failed to create or open file \"{0}\""
//  *Cause: State file processing failed because:
//    the file specified is a directory rather than a file,
//    the file did not exist but could not be created, or
//    the file exists but could not be opened.
// *Action: Enable state file processing by:
//    not specifying a directory name,
//    ensuring the the directory is writable, or
//    ensuring that an existing state file can be overwritten.
/
1056, CANNOT_WRITE_TO_FILE, "Failed to write to file \"{0}\""
//  *Cause: An attempt to write to the given file failed.
// *Action: If the state file already exists, then make sure that it is writable. Otherwise,
// make sure that parent directory of the state file path is writable.
/
1057, DB_RESOURCE_DOES_NOT_EXIST, "The Clusterware resource for database \"{0}\" does not exist."
//  *Cause: The Oracle Clusterware resource for the database with the given name did not exist.
// *Action: Make sure that Oracle Clusterware resource for the database with the given name exists.
/
1058, FAILED_WHILE_CHECKING_CRS_HOME_STATUS, "Failed while checking status of CRS home {0}"
//  *Cause: An attempt to check the status of the CRS home failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1059, FAILED_WHILE_CHECKING_ORACLE_HOME_STATUS, "Failed while checking status of Oracle home {0}"
//  *Cause: An attempt to check the status of the Oracle home failed.
// *Action: Review the accompanying error messages for possible reasons, correct the error and retry.
/
1060, HOME_ORACLE_STATUS_FAIL1, "Status check for one or more resources failed: {0}"
//  *Cause: An attempt to check the status for one or more resources failed.
// *Action: Review the underlying error messages that provide the details of which resources failed
// to query their status, check the cause and action for the individual resource start failure and perform
// the steps for each resource that failed to start.
/
1061, HOME_ORACLEDB_START_FAILED, "The following resources specified in the state file do not exist: {0}"
//  *Cause: An attempt to start one or more resources in the specified state file failed because they do not exist.
// *Action: Ensure that the correct state file was supplied.  If necessary, regenerate the file, or edit it to remove obsolete resources.
/
1062, HOME_UNKNOWN_VERSION, "unable to identify the version of Oracle home {0}"
//  *Cause: An attempt to retrieve the version of the specified Oracle home was unsuccessful either because the command 'srvctl -V' failed to execute or the version of the Oracle home is greater than the current software version.
// *Action: Examine the accompanying error messages for details. If applicable, specify an Oracle home whose version is less than or equal to the current software version and retry the operation.
/
1063, INVALID_HOME_TYPE, "The home type {0} is invalid."
//  *Cause: An attempt to set an Oracle home type failed because the specified home type was invalid.
// *Action: Specify a valid home type (ADMIN or POLICY).
/
1064, UNSUPPORTED_NODELIST_POLICY, "unable to set or modify the node list for a POLICY type Oracle home resource"
//  *Cause: An attempt to set or modify the node list where the Oracle home will be available failed because setting or modifying the node list operation is not supported for POLICY type Oracle home resources.
// *Action: Specify an Oracle home resource of ADMIN type.
/
1065, OHOME_NAME_ALREADY_IN_USE, "An Oracle home resource already exists with the name {0}."
//  *Cause: The Oracle home resource was already created for the specified name.
// *Action: Supply a different name or delete the previous resource.
/
1066, OHOME_INVALID_LEAF_NODE, "invalid Leaf Node {0}"
//  *Cause: An attempt to set or modify the node list where the Oracle home will be available failed because one or more of the specified nodes were Leaf Nodes, which is not supported for ADMIN type Oracle homes.
// *Action: Specify a node list without Leaf Nodes.
/
1067, OHOME_EMPTY_NODELIST_ADMIN, "invalid empty node list for ADMIN type Oracle home"
//  *Cause: An attempt to set or modify the node list where the Oracle home will be available failed because a node list was not specified, which is required for ADMIN type Oracle homes.
// *Action: Specify a node list.
/
1068, OHOME_INVALID_NODELIST_POLICY, "invalid node list for POLICY type Oracle home"
//  *Cause: An attempt to create or modify a POLICY type Oracle home failed because a node list was specified, which is not supported for POLICY type Oracle homes.
// *Action: Repeat the operation without specifying a node list.
/
1069, OHOME_MODIFY_RUNNING, "failed to modify the Oracle home resource because it is running"
// *Cause: An attempt to modify the configuration of the specified Oracle home resource failed because the resource was running. 
// *Action: Stop the specified Oracle home resource and retry the operation.
/
1070, OHOME_UNSUPPORTED_SIHA_NODES, "invalid node operation option for Oracle Restart environment"
//  *Cause: An attempt to create or modify an Oracle home failed because one or more optional node inputs (node list, -addnode or -deletenode) was specified, which is not supported for an Oracle Restart environment.
// *Action: Repeat the operation without specifying a node list, -addnode or -deletenode option.
/
1071, OHOME_UNSUPPORTED_SIHA_TYPE, "invalid Oracle home type for Oracle Restart environment"
//  *Cause: An attempt to create or modify an Oracle home failed because a home type was specified.
// *Action: Repeat the operation without specifying a home type.
/
1072, OHOME_NODE_ALREADY_IN_LIST, "Node {0} is already registered in the Oracle home node list."
//  *Cause: An attempt to add a node to the node list where the Oracle home will be available failed because the specified node was already registered in the list.
// *Action: Repeat the operation specifying a different node.
/
1073, OHOME_EMPTY_NODELIST, "Node list is empty."
//  *Cause: An attempt to remove a node from the node list where the Oracle home will be available failed because the node list was empty.
// *Action: None.
/
1074, OHOME_NODE_NOT_IN_LIST, "Node {0} is not registered in the node list."
//  *Cause: An attempt to remove a node from the node list where the Oracle home will be available failed because the specified node was not registered in the node list.
// *Action: Repeat the operation specifying a node registered in the node list.
/
1075, OHOME_MOUNTPOINT_CONFLICT, "Oracle home path conflict in node {0}"
//  *Cause: An attempt to create a server category for the Oracle home failed because one or more Oracle Automatic Storage Management Cluster File System (Oracle ACFS) file systems share the specified Oracle home path mount point across one or more nodes.
// *Action: Verify Oracle ACFS file system configurations to avoid redundant nodes.
/
1076, OHOME_RES_NOT_FOUND, "Oracle home resources are not registered in Oracle Clusterware."
//  *Cause: Oracle home resources were not registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add oraclehome' to create an Oracle home resource.
/
1077, NOT_UNIQUE_OHOME, "multiple Oracle home resources found for path \"{0}\""
//  *Cause: An attempt to add a new Oracle home resource failed because the indicated path contained an Oracle home resource.
// *Action: Retry the operation specifying the correct Oracle home path.
/
1078, NO_OHOME_FOUND_FOR_PATH, "Oracle home resource does not exist for path \"{0}\"."
//  *Cause: The Oracle home resource with the specified path was not registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add oraclehome' to create an Oracle home resource.
/
1079, OHOME_UNSUPPORTED_DELETE_OPERATION, "invalid operation to delete last node from nodelist"
//  *Cause: An attempt to modify an Oracle home failed because the node specified is the last remaining node.
// *Action: Do not modify the last node from the Oracle home resource.
/
