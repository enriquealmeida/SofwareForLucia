// Copyright (c) 2011, 2017, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCeMsg.msg
//
// DESCRIPTION
//    Message file for HANFS resources
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     jorgepe    08/23/17 - Fix bug 26655240
//     pevilla    01/26/17 - Project 67521, support transport vip
//     epineda    03/31/14 - Bugfix 15977353
//     ocordova   02/17/14 - Fix lrg 6922374
//     ocordova   01/24/14 - Fix Bug 14515100
//     ocordova   07/18/13 - Fix Bug 17158645
//     pevilla    04/24/13 - Fix bug 15983325, add HAVIP_START_ERROR
//     ocordova   02/28/13 - Fix Bug 16286698
//     pevilla    02/27/13 - Add HAVIP_ADDRESS_NOT_EXISTS
//     ocordova   02/21/13 - Fix bug 13890424
//     satg       11/14/12 - Fix bug 14730028
//     pevilla    08/27/12 - Add error messages for havip. Bug 13450275
//     pevilla    08/14/12 - Add HAVIP_DESCRIPTION_MAX_LENGTH_EXCEEDED
//     ocordova   07/10/12 - Adding EXPORTFS_PATH_EXISTS
//     ksviswan   03/07/12 - add message for invalid export path. Bug 13429445
//     sowong     09/23/11 - add message for havip
//     ksviswan   08/09/11 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1000, EXPORTFS_CREATE_FAILED, "Failed to create export file system resource {0}"
//  *Cause: The export file system resource for the specified export path
//          could not be created.
//          Possible causes:
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the export path that the user requested the resource to use.
// *Action:
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. (srvctl status asm)
//       3) Verify that the user is running with administrative access.
//       4) Verify that the export path given to the create resource command exists.
/
1001, EXPORTFS_ALREADY_EXISTS, "export file system resource {0} already exists"
//  *Cause: An attempt to create the export file system resource for the specified path found that  one already exists..
//  *Action: Supply a different export path or remove the previous resource and retry.
/
1002, EXPORTFS_RES_ADD_FAILED, "Unable to add the export file system resource {0}"
//  *Cause: The export file system resource for the specified export path
//          could not be added.
//          Possible causes:
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the export path that the user requested the resource to use.
// *Action:
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
//       4) Verify that the export path given to the create resource command exists.
/
1003, GET_EXPORTPATH_FAILED, "Unable to retrieve the export path for export file system resource {0}"
//  *Cause: The export path for the specified export file system resource
//          could not be retrieved.
//          Possible causes:
//                  1) CRS stack was not available.
//                  2) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action:
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that the user is running with administrative access.
/
1004, EXPORTFS_REMOVE_FAILED,"Failed to remove export file system configuration for export file system resource {0}"
//  *Cause: Cannot remove the export file system configuration for the specified disk group and volume.
// *Action:
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that the user is running with administrative access.
/
1005, ACFS_NOT_EXIST,  "ACFS file system resource does not exist for export path {0}"
//  *Cause: The ACFS file system resource with the specified export path was not registered with the Oracle Clusterware.
// *Action: Use the command 'srvctl add filesystem' to create an ACFS file system resource.
/
1006, HAVIP_RES_NOT_EXIST, "HA VIP resource does not exist in Oracle Clusterware"
//  *Cause: No HA VIP resource was registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add havip' to create a HA VIP resource.
/
1007, SET_EXPORTPATH_FAILED, "Failed to update the export path to {0} for export file system {1}"
//  *Cause: An attempt to update the export path for the export file system failed.
// *Action: Examine the accompanying error messages for details.
/
1008, SET_EXPORTOPTIONS_FAILED, "Failed to update the export options to {0} for export file system {1}"
//  *Cause: An attempt to update the export options for the export file system failed.
// *Action: Examine the accompanying error messages for details.
/
1009, SET_EXPORTCLIENTS_FAILED, "Failed to update the export clients to {0} for export file system {1}"
//  *Cause: An attempt to update the export clients for the export file system failed.
// *Action: Examine the accompanying error messages for details.
/
1010, GET_EXPORTOPTIONS_FAILED, "Failed to retrieve the export options for export file system {0}"
//  *Cause: An attempt to get the export options for the export file system failed.
// *Action: Examine the accompanying error messages for details.
/
1011, GET_EXPORTCLIENTS_FAILED, "Failed to retrieve the export clients for export file system {0}"
//  *Cause: An attempt to get the export clients for the export file system failed.
// *Action: Examine the accompanying error messages for details.
/
1012, EXPORTFS_RES_NOT_EXIST, "export file system resource does not exist in Oracle Clusterware"
//  *Cause: No export file system resource was registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add exportfs' to create an export file system resource.
/
1013, INVALID_EXPORT_PATH, "export path \"{0}\" is not an absolute path"
//  *Cause: The export path value was not an absolute path.
// *Action: Specify an absolute path in the '-path' argument.
/
1014, GET_EXPORTFS_HAVIP_FAILED, "Failed to retrieve export file system resources for HAVIP {0}"
//  *Cause: An attempt to get export file system resources for the specified HAVIP failed.
// *Action: Examine the accompanying error messages for details.
/
1015, EXPORTFS_RES_HAVIP_NOT_EXIST, "No export file system resource exists for HAVIP {0} in Oracle Clusterware"
//  *Cause: No export file system resource for the specified HAVIP was registered with Oracle Clusterware. 
// *Action: Use the command 'srvctl add exportfs' to create an export file system resource with the specified HAVIP.
/
1016, EXPORTFS_PATH_CONFIGURED, "Path \"{0}\" already configured without export clients for export file system {1}"
//  *Cause: The export file system path was already configured with no export clients provided.
// *Action: If you are adding a new client, modify the export file system and add the new client.
/
1017, EXPORTFS_PATH_CONFIGURED_OPTIONS, "Path \"{0}\" already configured with the export client \"{1}\" for export file system {2}"
//  *Cause: The export file system path was already configured with the export client provided.
// *Action: If you are adding a new client, modify the export file system and add the new client.
/
1018, HAVIP_DESCRIPTION_MAX_LENGTH_EXCEEDED, "Maximum character length ({0}) exceeded for HAVIP description: {1}"
//  *Cause: The user entered more characters than the maximum length permitted for HAVIP description. 
// *Action: Provide a value with no more characters than the maximum limit.
/
1019, HAVIP_SUBNET_VALIDATION_ERROR, "HAVIP address {0} is not in the subnet {1} of the network resource {2}"
//  *Cause: The subnet of the high availability virtual IP (HAVIP) did not match the subnet of the network resource.
// *Action: Retry SRVCTL command with a combination of VIP address and network whose subnet matches.
/
1020, HAVIP_INVALID_VIPADDRESS, "VIP address cannot be null"
//  *Cause: A null value was supplied as Virtual Internet Protocol (VIP) address parameter to this API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1021, HAVIP_INVALID_NETWORK, "Network cannot be null"
//  *Cause: A null value was supplied as network parameter to this API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1022, HAVIP_INVALID_DESCRIPTION, "Description cannot be null"
//  *Cause: A null value was supplied as description parameter to this API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1023, EXPORTFS_INVALID_ACFS, "Export path \"{0}\" cannot be a single-node ACFS file system resource"
//  *Cause: An attempt to add an export file system failed because the path provided is a single-node ACFS file system resource.
// *Action: Provide a path of a clusterwide ACFS file system resource.
/
1024, HAVIP_ADDRESS_NOT_EXIST, "HA VIP resource for given address or VIP name \"{0}\" does not exist in Oracle Clusterware"
//  *Cause: No HA VIP resource with the given address or VIP name was found in the Oracle Clusterware.
// *Action: Use the command 'srvctl config havip' to obtain a list of registered HA VIPs.
/
1025, HAVIP_HOSTNAME_DOES_NOT_RESOLVE_TO_BOTH, "The specified VIP name \"{0}\" does not resolve to IPv4 and IPv6 addresses which coincide with the network \"{1}\" IPv4 and IPv6 subnets"
//  *Cause: The specified VIP name did not resolve to both IPv4 and IPv6 addresses that match the IPv4 and IPv6 subnets of the network resource.
// *Action: Ensure that the specifed VIP name resolves to both IPv4 and IPv6 addresses that match the subnets of the network resource. Use 'nslookup <vipname>' to display the addresses to which the VIP name resolves. Use the command 'srvctl config network' to display the subnets of the network resource.
/
1026, HAVIP_START_ERROR, "Cannot start HAVIP resource without an Export FS resource."
//  *Cause: The specified HAVIP resource could not be started because there was no Export FS registered in the Oracle Clusterware.
// *Action: Add an Export FS using the 'srvctl add exportfs' command.
/
1027, EXPORTFS_PATH_CONFIGURED_HAVIP, "Validation for export file system {0} failed. The export path \"{1}\" is already configured in the export file system {2} which uses the HAVIP {3} with the same export client and home node."
//  *Cause: Another export file system was already configured with the same export client, path and HAVIP home node.
// *Action: Modify the export file system or the home node of the HAVIP.
/
1028, INVALID_CANONICAL_PATH, "An attempt to get the canonical path of the path \"{0}\" failed."
// *Cause: An attempt to get the canonical path of the path provided failed, this typically involves removing redundant names such as "." and ".." from the pathname, resolving symbolic links (on UNIX platforms), and converting drive letters to a standard case (on Microsoft Windows platforms).
// *Action: Examine the accompanying error messages for details.
/
1029, EXPORTFS_NESTED, "The export path \"{0}\" specifies a subdirectory of the exported file system {1}."
// *Cause: An attempt to export a file system using the indicated path name was rejected because the target of the path name was a subdirectory of the file system that was already being exported.
// *Action: Provide an export path that is not a subdirectory of an exported path or use the export file system already configured. 
/
1030, EXPORTFS_PARENT, "The export path \"{0}\" specifies a parent directory of the exported file system {1}."
// *Cause: An attempt to export a file system using the indicated path name was rejected because the target of the path name was a parent directory of the file system that was already being exported.
// *Action: Provide an export path that is not a parent directory of an exported path or modify the export file system already configured. 
/
1031, MOUNTFS_MODIFY_RUNNING, "failed to modify the Network Attached Storage (NAS) resource while it is running"
// *Cause: An attempt to modify the configuration of the specified Network Attached Storage (NAS) failed because the resource was running.
// *Action: Stop the specified Network Attached Storage (NAS) resource and retry the operation.
/
1032, HAVIP_ID_EXIST, "HA VIP already exists for id {0}"
//  *Cause: An attempt to add a HA VIP failed because there was a resource
//          configured for the given id.
// *Action: Retry the operation, specifying a different id.
/
1033, TRANSPORT_VIP_RES_NOT_EXIST, "Transport VIP resource does not exist in Oracle Clusterware."
//  *Cause: An attempt to execute a command requiring a transport VIP was 
//          rejected because no transport VIP resource was registered with 
//          Oracle Clusterware.
// *Action: Create a transport VIP resource using the 'advmutil' command, and
//          then retry the operation.
/