// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCaMsg.msg
//
// DESCRIPTION
//    Message file to report failures due to invalid or unauthenticated parameters supplied during
//    SRVM resource operations.
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     jorgepe     06/03/18 - Fix bug 28106665: ACFS formula
//     jorgepe     05/04/18 - Fix bug 27882925
//     yizhang     05/01/18 - fix bug 27399761
//     jorgepe     03/05/18 - Fix bug 27256866: Minimum size check for ACFS
//     jorgepe     09/05/17 - Fix bug 26735194
//     yizhang     04/21/17 - fix bug 25692046
//     yizhang     12/22/16 - fix bug 20773941
//     yizhang     06/15/16 - fix bug 23201370
//     yizhang     05/10/16 - fix bug 23106956
//     epineda     04/20/16 - Bugfix 23004351
//     iestrada    03/17/16 - Fix bug 22901189
//     pevilla     03/17/16 - Add upgrade error messages for HAVIP
//     epineda     02/03/16 - Bugfix 21899871
//     yizhang     01/12/16 - fix bug 21625291
//     epineda     10/20/15 - ER 21842803
//     epineda     09/23/15 - Bugfix 17527013
//     epineda     06/16/15 - Bugfix 19691769: mountusers support
//     epineda     05/05/15 - ER 20992474
//     epineda     05/26/15 - Bugfix 20900795
//     epineda     04/24/15 - ER 20473733: ACFSInfo API
//     agorla      02/24/15 - combine CCM & CCB into one
//     yizhang     11/10/14 - Implement project 53568
//     epineda     11/10/14 - ER 19989683: Add CCM/CCB Messages
//     epineda     04/15/14 - Backport epineda_bug-15977353 from main
//     epineda     03/31/14 - Bugfix 15977353: Rename NFS resource to NAS
//     chchatte    03/17/14 - Add VM resource
//     ocordova    03/14/14 - Fix bug 18295408
//     yizhang     02/07/14 - fix bug 17990656
//     lureyes     11/15/13 - delete comments
//     epineda     11/11/13 - Bugfix 17587441
//     sejlim      10/16/13 - add comments
//     epineda     10/07/13 - Bugfix 17532130
//     epineda     08/16/13 - Bugfix 17317142
//     yifyang     08/09/13 - Add GET_FS_USERS_FAILED Error
//     epineda     06/20/13 - Add DB Accelerator msgs
//     epineda     06/12/13 - Bugfix 16812256
//     lureyes     05/24/13 - Fix bug 15982660
//     yizhang     05/08/13 - fix bug 16512913
//     epineda     04/01/13 - Bugfix 14573313
//     epineda     03/12/13 - Bugfix 16186612
//     satg        11/14/12 - Fix bug 14730028
//     rtamezd     09/11/12 - Fix bug 14115195
//     epineda     08/13/12 - Bugfix 14247540
//     epineda     07/27/12 - Addes NFS resource messages
//     sravindh    07/22/12 - Bug 14208937
//     sravindh    05/31/12 - Bug 14123452
//     ccharits    03/26/12 - Added messages
//                            UNABLE_TO_VALIDATE_SERVER_CATEGORY_FOR_SERVER_POOL
//                            and INVALID_SERVER_CATEGORY_FOR_SERVER_POOL
//     ccharits    02/23/12 - Added messages SERVERPOOL_NOT_EXISTS and
//                            UNABLE_TO_OBTAIN_SERVERPPOOL_INFO
//     epineda     02/20/12 - Added message for bugfix 13350599
//     ccharits    12/21/11 - Added message GET_FS_DESCRIPTION_FAILED
//     sravindh    09/14/11 - Bug 12968923
//     abhisbg     09/14/11 - add invalid asmMode message
//     ccharits    07/18/11 - Added message NOT_SINGLE_VOLUME_ERROR
//     yizhang     07/08/11 - Define IOSERVER_CREATE_FAILED
//     yizhang     06/30/11 - Define IOSERVER_CREATE_FAILED
//     yizhang     06/08/11 - Define INVALID_ASMTYPE
//     sowong      05/05/11 - fix bug12414299
//     vobulapu    05/04/11 - add support for shared password file on ASM
//                            Diskgroup
//     yizhang     04/07/11 - Define VOLUME_RES_NOT_EXIST
//     sowong      03/16/11 - fix bug11787535
//     smadabhu    01/18/11 - Fix for bug 10024521
//     sowong      01/20/11 - fix bug9904129
//     sowong      12/23/10 - fix bug9948257
//     sowong      12/16/10 - fix bug10377077
//     sowong      05/05/10 - fix bug8652683
//     yizhang     05/29/09 - fix messages
//     yizhang     05/07/09 - fix bug 8481969
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     rxkumar     05/04/09 - update 1019 message
//     sowong      03/13/09 - fix bug8317368
//     agraves     02/20/09 - Change some messages for USM resources.
//     agraves     01/17/09 - Change ASMFS to ACFS.
//     sowong      01/16/09 - add messages for bug7522237
//     sowong      10/30/08 - add messages for bug7480289
//     sowong      09/17/08 - add message for bug7111226
//     sowong      09/02/08 - add messages for ASM filesystem non-existence
//     rxkumar     08/21/08 - fix bug7309465: add ASM_LSNR_NOT_EXIST
//     rxkumar     06/27/08 - fix cause of GET_DG_FOR_FS_FAILED
//     sowong      06/18/08 - add messages for FS-DG dependencies
//     rxkumar     04/21/08 - add ASM<->Listener association
//     sowong      03/10/08 - add messages for asm filesystem
//     sowong      03/06/08 - add asm instance messages
//     rxkumar     04/12/07 - update DG_RES_NOT_EXISTS msg
//     rxkumar     01/10/07 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
1000, DG_NOT_EXIST, "ASM Disk Group {0} does not exist"
//  *Cause: An attempt failed to retrieve an ASM disk group that was not configured.
// *Action: Create the diskgroup using sqlplus if the specified diskgroup does not exist. Mount the diskgroup in ASM which registers the diskgroup with CRS.
/
1001, DG_RES_NOT_EXIST, "ASM Disk Group resource does not exist"
//  *Cause: There was no disk group resource registered with CRS.
// *Action: Create the diskgroup using sqlplus and mount the diskgroup in ASM which registers the diskgroup with CRS.
/
1002, DG_REMOVE_FAILED, "Failed to remove CRS resource {0} for ASM Disk Group {1}"
//  *Cause: An attempt to remove the CRS resource for the specified ASM Disk Group failed. 
// *Action: Examine the accompanying error messages for details.
/
1003, ASM_CREATE_FAILED, "Failed to create ASM {0} resource {1}"
//  *Cause: An attempt to add the CRS resource for ASM failed. 
// *Action: Ensure that the CRS stack is running, the user running srvctl add asm is also the owner of the CRS home, and examine the accompanying error message for details.
/
1004, SPFILE_NOT_EXISTS, "Dummy message: ASM {0} is not using server parameter file"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1005, GET_SPFILE_FAILED, "Failed to retrieve server parameter file of ASM {0}"
//  *Cause: Cannot retrieve ASM server parameter file.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has read permission on the ASM resource.
/
1006, SET_SPFILE_FAILED, "Failed to update server parameter file {0} of ASM {1}"
//  *Cause: Unable to update the ASM server parameter file.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has update permission on the ASM resource.
/
1007, PARAMS_NOT_USED, "ASM {0} is not using initialization parameters: {1}"
//  *Cause: The specified ASM instance does not use the initialization parameters shown.
// *Action: Examine the accompanying error messages for details.
/
1008, GET_PARAMS_FAILED, "Dummy message: Failed to retrieve initialization parameters of ASM {0}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1009, SET_PARAMS_FAILED, "Dummy message: Failed to update initialization parameters {0} of ASM {1}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1010, SPFILE_USED, "Dummy message: ASM {0} is using server parameter file"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1011, PARAMS_USED, "Dummy message: ASM {0} is using initialization parameters"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1012, ASM_START_FAILED, "Dummy message: Failed to start ASM"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1013, ASM_STOP_FAILED, "Dummy message: Failed to stop ASM"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1014, ASM_START_PERX_FAILED, "Dummy message: Failed to start ASM on nodes {0}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1015, ASM_STOP_PERX_FAILED, "Dummy message: Failed to stop ASM on nodes {0}"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1016, ASM_REMOVE_FAILED, "Failed to remove ASM resource {0} for ASM instance {1}"
//  *Cause: An attempt to remove the specified ASM configuration failed.
// *Action: Examine the accompanying error message for details.
/
1017, ASM_NOT_EXISTS, "ASM {0} does not exist"
//  *Cause: ASM is not configured yet.
// *Action: Configure ASM and then retry.
/
1018, GET_ASMINSTANCE_LIST_FAILED, "Failed to retrieve ASM instance list for ASM {0}"
//  *Cause: Failed to retrieve the list of ASM instances.
// *Action: Make sure that the crs stack is up and the ASM resource has been configured.
/
1019, NO_RUNNING_ASMINSTANCE, "ASM {0} is not running"
//  *Cause: The ASM resource does not have any running instances.
// *Action: Use 'srvctl start asm' command to start the asm resource.
/
1020, ACFS_CREATE_FAILED, "Unable to create ACFS file system resource {0} for the volume device {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not be created.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the mount point that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. (srvctl status asm)
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point given to the create resource command exists.
/
1021, GET_ACFS_FAILED, "Unable to retrieve ACFS file system for the volume device {0}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the mount point that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. (srvctl status asm)
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point given to the create resource command exists.
/
1022, ACFS_ALREADY_EXISTS, "ACFS file system resource already exists for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource had already been created for the specified disk group and volume names.
// *Action: Take one of the following actions:
//      1) Supply a different volume device path to the 'srvctl add filesystem' command to create a different ACFS file system resource.
//      -or-
//      2) Delete the previous resource ('srvctl remove filesystem -device <volume_device>') and run the command again.
/
1023, ACFS_RES_ADD_FAILED, "Unable to add ACFS file system resource {0} for disk group {1} and volume {2}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not be added.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to identify the mount point that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point given to the create resource command exists.
/
1024, GET_VOLUME_DEVICE_FAILED, "Unable to retrieve the volume for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1025, GET_MOUNTPOINT_FAILED, "Unable to retrieve the mountpoint path for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1026, SET_ACFS_USER_FAILED, "Unable to set the user of the ACFS file system for disk group {0} and volume {1}"
//  *Cause: The user of the ACFS file system resource for the specified disk group and volume was unable to be modified.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1027, ACFS_REMOVE_FAILED, "Failed to remove ACFS file system configuration for disk group {0} and volume {1}"
//  *Cause: Cannot remove the ACFS file system configuration for the specified disk group and volume.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1028, GET_ASM_LSNR_FAILED, "Failed to retrieve listener associated with ASM {0} "
//  *Cause: Failed to retrieve listener associated with ASM.
// *Action: Ensure that user has read permissions on ASM resource and then retry. Also, ensure that listener specified in ASM resource's start dependencies exists.
/
1029, SET_ASM_LSNR_FAILED, "Failed to associate listener {0} with ASM {1}"
//  *Cause: Failed to associate given listener with ASM.
// *Action: Ensure that user has update permissions on ASM resource and then retry.
/
1030, GET_DG_FOR_FS_FAILED, "Failed to retrieve the diskgroup associated with the volume device {0}"
//  *Cause: Unable to retrieve the diskgroup associated with the given volume device using \"asmcmd volinfo -g <volume_name>\" command.
// *Action: Make sure that the asm instance is running; the asmcmd utility exists and the underlying ofs devices are accessible.
/
1031, CHECK_DG_EXIST_FOR_FS_FAILED, "Unable to retrieve the diskgroup {0} associated with the volume device {1}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Disk group is not mounted.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
//       4) Verify that the disk group is mounted.
/
1032, ASM_LSNR_NOT_EXIST, "ASM listener {0} does not exist"
//  *Cause: The ASM listener was not registered with Oracle Clusterware.
// *Action: Add the listener with the 'srvctl add listener -listener <lsnr_name> -asmlistener' command or specify a listener name that is already registered.
/
1033, ACFS_RES_NOT_EXIST, "ACFS file system resource does not exist for volume device {0}"
//  *Cause: The ACFS file system resource with the specified volume device was not registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add filesystem' to create an ACFS file system resource.
/
1034, ACFS_RES_NOT_EXIST_CLUSTER, "ACFS file system resource does not exist in Oracle Clusterware"
//  *Cause: No ACFS file system resource was registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add filesystem' to create an ACFS file system resource.
/
1035, GET_DG_DATABASES_FAILED, "Unable to determine the databases that use the disk group {0}"
//  *Cause: Unable to retrieve databases that have dependencies on the disk group.
// *Action: Make sure that the crs stack is up; the user has read permissions on database CRS resources and then retry.
/
1036, API_NOT_SUPPORTED_CLUSTER, "An Oracle Restart environment-specific API was invoked in an Oracle Clusterware environment."
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1037, GET_DISKSTRING_FAILED, "Failed to retrieve the diskgroup discovery string of ASM {0}"
//  *Cause: An attempt to retrieve the diskgroup discovery string for ASM failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has read permission on ASM resource.
/
1038, SET_DISKSTRING_FAILED, "Failed to update the diskgroup discovery string {0} of ASM {1}"
//  *Cause: An attempt to update the diskgroup discovery string for ASM failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has update permission on ASM resource.
/
1039, VOLDEVICE_NOT_EXIST, "Volume device {0} does not exist"
//  *Cause: The supplied volume device does not exist.
// *Action: Use asmca to create the volume device and then run 'srvctl add filesystem' command again.
/
1040, VOLDEVICE_CHECK_FAILED, "Failed to check the existence of volume device {0}"
//  *Cause: Failed to execute acfsutil command to check for the existence of the supplied volume device.
// *Action: Review the underlying error messages that provide the details of why acfsutil execution failed. Resolve the reported problem and retry the command.
/
1041, DG_CHECK_FAILED, "Failed to validate disk group {0} of volume device {1}"
//  *Cause: Failed to execute acfsutil command to validate the disk group of the volume device.
// *Action: Review the underlying error messages that provide the details of why acfsutil execution failed. Resolve the reported problem and retry 'srvctl add filesystem' command.
/
1042, INVALID_DISKGROUP, "Diskgroup {0} is not valid for volume device {1}"
//  *Cause: The supplied diskgroup does not match the underlying diskgroup created for the supplied volume device.
// *Action: Execute 'srvctl add filesystem' command with the correct disk group value.
/
1043, VOLUME_CHECK_FAILED, "Failed to validate volume {0} of volume device {1}"
//  *Cause: Failed to execute acfsutil command to validate the volume of the volume device.
// *Action: Review the underlying error messages that provide the details of why acfsutil execution failed. Resolve the reported problem and retry 'srvctl add filesystem' command.
/
1044, INVALID_VOLUME, "Volume {0} is not valid for volume device {1}"
//  *Cause: The supplied volume does not match the underlying volume created for the supplied volume device.
// *Action: Execute 'srvctl add filesystem' command with the correct volume value.
/
1045, ACFS_NOT_SUPPORTED_MSG, "ACFS is not supported on this platform"
//  *Cause: A filesystem operation was requested on an unsupported platform.
// *Action: Run srvctl filesystem command on a supported platform.
/
1046, FILESYSTEM_IN_ACFS_REG, "File system for volume device {0} exists in the ACFS registry"
//  *Cause: File system for the specified volume device was registered in the ACFS registry. File system can either be in the ACFS registry or registered as a CRS resource, but not both.
// *Action: Either run the command 'acfsutil registry -d' to delete the volume device from the ACFS registry or run the command 'srvctl add filesystem' with a different volume device.
/
1047, GET_ACFS_FAILED_CANONICAL_ERR, "Unable to find ACFS file system resource for volume device {0} because of inability to get the canonical form of the volume device"
//  *Cause: An internally-issued 'advmutil canonical' command failed and the volume device recorded in the ACFS file system resource did not match the specified volume device.
// *Action: Review the underlying error messages that provide the details of why advmutil execution failed. Resolve the reported problem and retry.
/
1048, INVALID_MTPT_PATH_WINDOWS, "Invalid mount point path {0} because specified mount point path was a remote path"
//  *Cause: The specified mount point path was a remote path.
// *Action: Make sure that the mount point path was not a remote path.
/
1049, INVALID_USER, "The user \"{0}\" could not be found on the cluster"
//  *Cause: The user specified as the file system owner/user could not be found.
// *Action: Enter the name of an existing user or the owner of the specified file system.
/
1050, GET_CANONICAL_VOL_DEVICE_FAILED, "Unable to retrieve the canonical form of the volume device for disk group {0} and volume {1}"
//  *Cause: The ACFS file system resource for the specified canonical form of the volume device path was not retrieved.
// *Action:  
//       1) Make sure that the CRS stack is available. ( 'crsctl check crs' )
//       2) Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1051, VOLUME_RES_NOT_EXIST, "No volume resource registered with CRS for specified diskgroup or volume name or volume device"
//  *Cause: There was no volume resource registered with CRS for specified diskgroup and volume name.
// *Action: Create the volume using sqlplus which registers the volumes with CRS.
/
1052, VOLUME_ALREADY_EXISTS, "When attempting to create a volume resource in CRS, volume resource already exists for disk group {0} and volume {1}"
//  *Cause: The volume resource was already created for the specified disk group and volume names.
// *Action: Supply different volume name or diskgroup name to create a different volume resource.
/
1053, VOLUME_RES_ADD_FAILED, "Failed to add volume resource {0} for disk group {1} and volume {2}"
//  *Cause: The volume resource for the specified volume device path could not be added.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1054, VOLUME_REMOVE_FAILED, "Failed to remove volume configuration for disk group {0} and volume {1}"
//  *Cause: Cannot remove the volume configuration for the specified disk group and volume.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1055, GET_VOLUME_USAGE_FAILED, "Failed to retrieve the volume file system type for disk group {0} and volume {1}"
//  *Cause: The usage of the specified volume was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1056, ACFS_UPGRADE_FAILED, "Unable to upgrade ACFS from version {0} to version {1}"
//  *Cause: Failed to upgrade ACFS from one version to another version.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1057, GET_PWFILE_FAILED, "Failed to retrieve the password file location used by ASM {0}"
//  *Cause: An attempt to retrieve the password file attribute of the specified ASM failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has read permission on the ASM resource.
/
1058, SET_PWFILE_FAILED, "Failed to update password file location {0} used by ASM {1}"
//  *Cause: An attempt to update the password file attribute of the specified ASM failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has update permission on the ASM resource.
/
1059, INVALID_ASMTYPE, "Invalid ASM type {0}"
//  *Cause: The ASM type supplied is not valid.
// *Action: Supply a valid ASM type.
/
1060, INVALID_ASMPRESENCE, "Invalid ASM presence {0}"
//  *Cause: The ASM presence supplied is not valid.
// *Action: Supply a valid ASM presence (legacy or remote).
/
1061, IOSERVER_CREATE_FAILED, "Failed to create ASM I/O Server resource {0}"
//  *Cause: An attempt to add the CRS resource for ASM I/O Server failed. 
// *Action: Ensure that the CRS stack is running, the user running 'srvctl add asm' is also the owner of the CRS home, and examine the accompanying error message for details.
/
1062, CLUSTERASM_CREATE_FAILED, "Failed to create cluster ASM resource {0}"
//  *Cause: An attempt to add the CRS resource for cluster ASM failed. 
// *Action: Ensure that the CRS stack is running, the user running 'srvctl add asm' is also the owner of the CRS home, and examine the accompanying error message for details.
/
1063, PROXYASM_CREATE_FAILED, "Failed to create ADVM proxy resource {0}"
//  *Cause: An attempt to add the CRS resource for ADVM proxy failed. 
// *Action: Ensure that the CRS stack is running, the user running 'srvctl add asm' is also the owner of the CRS home, and examine the accompanying error message for details.
/
1064, RIMASM_CREATE_FAILED, "Failed to create leaf ASM resource {0}"
//  *Cause: An attempt to add the CRS resource for leaf ASM failed. 
// *Action: Ensure that the CRS stack is running, the user running command 'srvctl add asm' is also the owner of the CRS home, and examine the accompanying error message for details.
/
1065, FILESYSTEM_RES_NOT_FOUND, "No file system resource found in Oracle Clusterware"
//  *Cause: No ACFS or non-ACFS file system resource was registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add filesystem' to create a file system resource.
/
1066, FS_ALREADY_EXISTS, "File system resource already exists for disk group {0} and volume {1}"
//  *Cause: The file system resource was already created for the specified disk group and volume names.
// *Action: Take one of the following actions:
//      1) Supply a different volume device path to the 'srvctl add filesystem' command to create a different file system resource.
//      -or-
//      2) Delete the existing resource ('srvctl remove filesystem -device <volume_device>') and run the command again.
/
1067, FS_RES_ADD_FAILED, "Unable to add file system resource {0} for disk group {1} and volume {2}"
//  *Cause: The file system resource for the specified volume device path
//          could not be added.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
//                  4) Was unable to resolve the mount point path that the user requested the resource to use.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
//       4) Verify that the mount point path given to the create resource command exists.
/
1068, FS_REMOVE_FAILED, "Failed to remove file system resource for disk group {0} and volume {1}"
//  *Cause: Failed to remove the file system resource for the specified disk group and volume.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1069, SET_FS_USER_FAILED, "Unable to set the user of the file system configuration for disk group {0} and volume {1}"
//  *Cause: The user of the FS file system resource for the specified disk group and volume was unable to be modified.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1070, NO_FILESYSTEM_FOUND_FOR_VOLUME_DEVICE, "File system resource does not exist for volume device \"{0}\""
//  *Cause: The file system resource with the specified volume device was not registered with Oracle Clusterware.
// *Action: Use the command 'srvctl add filesystem' to create a file system resource.
/
1071, NOT_UNIQUE_FILESYSTEM_FOR_GIVEN_VOLUME_DEVICE, "Multiple file system resources found for volume device \"{0}\""
//  *Cause: More than one file system resources with the specified volume device were found.
// *Action: Internal error. Contact Oracle Support Services.
/
1072, NOT_SINGLE_VOLUME_ERROR, "Either zero or multiple volume resources found for diskgroup \"{0}\" and volume \"{1}\""
//  *Cause: A single volume was expected to be found for the specified parameters.
// *Action: Internal error. Contact Oracle Support Services.
/
1073, APPID_RES_FSTYPE_CONFLICT, "A resource for application with ID \"{0}\" that uses a different file system than \"{1}\" already exists"
//  *Cause: A resource with the same application ID was registered for a different file system type.
// *Action: Make sure that the file system being added uses the same type as the existing resource for the given application ID.
/
1074, MODIFY_FILESYSTEM_FAILED, "Unable to modify the file system resource {0} for disk group {1} and volume {2}"
//  *Cause: The ACFS file system resource for the specified volume device path
//          could not modified.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1075, MODIFY_HOSTING_MEMBERS_ERROR, "The file system resource is running on nodes (e.g. node \"{0}\") which are not included in the node list"
//  *Cause: The attempt to modify the node list failed as the file system resource was running on one or more nodes of the existing node list that were not included in the new node list.
// *Action: Either stop the resource that is running and retry or add the node where the resource is running to the new node list.
/
1076, MODIFY_SERVER_POOLS_ERROR, "The file system resource is running on server pools (e.g. server pool \"{0}\") which are not included in the server pool list"
//  *Cause: The attempt to modify the node list failed as the file system resource was running on one or more server pools of the existing server pool list that were not included in the new server pool list.
// *Action: Either stop the resource that is running and retry.
/
1077, GET_FS_TYPE_FAILED, "Unable to retrieve the file system type for disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1078, GET_FS_OPTIONS_FAILED, "Unable to retrieve the file system mount options for disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1079, GET_HOSTING_MEMBERS_FAILED, "Unable to retrieve the file system node names for disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1080, GET_SERVER_POOLS_FAILED, "Unable to retrieve the file system server pools for disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1081, GET_APPLICATION_ID_FAILED, "Unable to retrieve the application ID for disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1082, GET_TYPE_FAILED, "Unable to retrieve the value for attribute 'TYPE' for the file system resource with disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
//                  3) User was not running with an account with administrative access.  (root, Administrator, etc)
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
//       3) Verify that the user is running with administrative access.
/
1083, INVALID_ASMMODE, "Invalid ASM mode {0}"
//  *Cause: The specified ASM mode was not valid.
// *Action: Specify a valid ASM mode LEGACY, REMOTE or CLIENT.
/
1084, GET_ASM_MODE_FAILED, "Failed to retrieve ASM Mode"
//  *Cause: An attempt to retrieve the configured ASM mode from the ASM resource failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the ASM resource has been configured, and the user has read permission on the ASM resource.
/
1085, CLUSTERASM_OCRONASM_CHECK_FAIL, "Failed to check if OCR is on ASM, when attempting to create resource {0}"
//  *Cause: An attempt to retrieve the OCR locations and check if any of the locations is on ASM failed.
//  *Action: Ensure that the CRS stack is running, the user running command 'srvctl add asm' is also the owner of the CRS home, and examine the accompanying error message for details.
/
1086, GET_FS_DESCRIPTION_FAILED, "Unable to retrieve the file system description for disk group {0} and volume {1}"
//  *Cause: The file system resource for the specified volume device path
//          was unable to be retrieved. Possible cause: The CRS stack was not available.
// *Action: Verify that the CRS stack is available. ( 'crsctl check crs' )
/
1087, SERVERPOOL_NOT_EXISTS, "Server pool \"{0}\" does not exist"
//  *Cause: No servepool was found for the specified server pool name.
// *Action: Make sure that the serverpool exists and retry.
/
1088, UNABLE_TO_OBTAIN_SERVERPPOOL_INFO, "Unable to retrieve information about server pool \"{0}\""
//  *Cause: An error occurred while trying to retrieve information about the specified server pool.
// *Action: Examine the accompanying error messages for details.
/
1089, GET_VOL_DG_FROM_DEVICE_FAILED, "Unable to retrieve volume and disk group for volume device path {0}"
//  *Cause: The volume and disk group resources for the specified volume device path
//          could not be retrieved. 
//          Possible causes: 
//                  1) The CRS stack was not available.
//                  2) The volume device path does not exist.
// *Action: 
//       1) Verify that the CRS stack is running. ( 'crsctl check crs' ) 
//       2) Verify that the volume device path was previously created.
/
1090, UNABLE_TO_VALIDATE_SERVER_CATEGORY_FOR_SERVER_POOL, "Unable to retrieve information about the server category for server pool \"{0}\""
//  *Cause: An error occurred while trying to retrieve information about the server category for the specified server pool.
// *Action: Examine the accompanying error messages for details.
/
1091, INVALID_SERVER_CATEGORY_FOR_SERVER_POOL, "The server category for server pool \"{0}\" is not \"{1}\""
//  *Cause: The server category for the specified server pool had not the indicated expected value.
// *Action: Execute the command 'srvctl modify srvpool' to set the server category for the specified server pool to the indicated value and retry.
/
1092, ASM_CLIENT_CLUSTER, "Cannot retrieve ASM resource information on an ASM client cluster"
//  *Cause: An attempt was made to get reference to an ASM resource on an ASM client cluster, which is not allowed.
//  *Action: Perform this action only on an ASM cluster in either the Standard mode or in the Remote mode.
/
1093, NO_RUNNING_IOSINSTANCE, "ASM I/O Server {0} is not running"
//  *Cause: The ASM I/O Server resource did not have any running instances.
// *Action: Use the command 'srvctl start ioserver' to start the ASM I/O Server resource.
/
1094, GET_IOSINSTANCE_LIST_FAILED, "Failed to retrieve ASM I/O Server instance list for ASM I/O Server {0}"
//  *Cause: Failed to retrieve the list of ASM I/O Server instances.
// *Action: Make sure that the Clusterware stack is up and the ASM I/O Server resource has been configured.
/
1095, ASM_ALREADY_EXISTS, "Unable to create ASM resource because it already exists."
// *Cause: An attempt was made to add the ASM resource but the resource already exists.
// *Action: Either remove the ASM resource and then add it, or avoid adding an already existing resource.
/
1096, NFS_CREATE_FAILED, "failed to create the Network Attached Storage (NAS) resource {0} for mount point path {1}"
//  *Cause: An attempt to create a Network Attached Storage (NAS) resource failed for the specified mount point path.
// *Action: Examine the accompanying error messages for details.
/
1097, GET_NFS_FAILED, "failed to retrieve the Network Attached Storage (NAS) resource for the mount point path {0}"
//  *Cause: An attempt to retrieve the Network Attached Storage (NAS) resource failed for the specified mount point path.
// *Action: Examine the accompanying error messages for details.
/
1098, NFS_ALREADY_EXISTS, "A Network Attached Storage (NAS) resource already exists for mount point path {0}."
//  *Cause: An attempt to create a Network Attached Storage (NAS) resource failed because a NAS resource already exists for the specified mount point path.
// *Action: Do one of the following:
//      - Supply a different mount point path.
//      - Delete the previous resource.
/
1099, SET_NFS_USER_FAILED, "failed to set the user of the Network Attached Storage (NAS) for mount point path {0}"
//  *Cause: An attempt to modify the user for the Network Attached Storage (NAS) failed for the specified mount point path.
// *Action: Examine the accompanying error messages for details.
/
1100, NFS_RES_NOT_EXIST, "The Network Attached Storage (NAS) resource does not exist for mount point path {0}."
//  *Cause: The Network Attached Storage (NAS) resource with the specified mount point path was not registered with Oracle Clusterware.
// *Action: Create a Network Attached Storage (NAS) resource with the specified mount point path.
/
1101, NFS_MODIFY_FAILED, "failed to modify the Network Attached Storage (NAS) resource for mount point path {0}" 
//  *Cause: An attempt to modify the Network Attached Storage (NAS) resource failed for the specified mount point path.
// *Action: Examine the accompanying error messages for details.
/
1102, NFS_MOUNTPOINT_IN_USE, "Mount point path {0} is in use by another file system resource."
//  *Cause: The supplied mount point path was already used by an existing file system resource.
// *Action: Specify a mount point path not in use by ACFS and not in use by Network Attached Storage (NAS) resources.
/
1103, EXPORTSERVER_CHECK_FAILED, "Failed to validate export server {0}"
//  *Cause: An attempt to resolve the export server name failed because the specified server name does not exist in DNS.
// *Action: Specify a valid IP address or hostname.
/
1104, NFS_REMOVE_FAILED, "failed to remove Network Attached Storage (NAS) resource for mount point path {0}"
//  *Cause: An attempt to remove the Network Attached Storage (NAS) resource failed for the specified mount point path.
// *Action: Examine the accompanying error messages for details.
/
1105, NFS_INVALID_MTPOINT, "The mount point path must be specified when adding a Network Attached Storage (NAS) resource."
//  *Cause: An attempt to create a Network Attached Storage (NAS) resource failed because a value was not specified for the mount point path.
// *Action: Specify a valid mount point path.
/
1106, FS_MOUNTPOINT_IN_USE, "Mount point path {0} is in use by another file system resource"
//  *Cause: The supplied mount point path was already used by an existing file system resource.
// *Action: Specify a mount point path that is not in use by a file system resource.
/
1107, NFS_NAME_ALREADY_IN_USE, "A Network Attached Storage (NAS) resource already exists with the name {0}."
//  *Cause: The Network Attached Storage (NAS) resource was already created for the specified name.
// *Action: Supply a different name or delete the previous resource.
/
1108, INVALID_RELOCATE_FS, "The file system resource is not node local."
//  *Cause: The attempt to relocate the specified file system failed because the resource is not node local.
// *Action: Specify a node local file system resource.
/
1109, VOLUME_DG_VOLNAME_NOT_EXIST, "The volume for the specified disk group {0} and volume name {1} is not registered with CRS."
//  *Cause: There was no volume resource registered with CRS for the specified disk group and volume name.
// *Action: Create the volume for the specified disk group and volume name using SQL*Plus which registers the volumes with CRS.
/
1110, VOLUME_DEVICE_NOT_EXIST, "The volume for the specified device path {0} is not registered with CRS."
//  *Cause: There was no volume resource registered with CRS for the specified device path.
// *Action: Create the volume for the specified device path using SQL*Plus which registers the volumes with CRS.
/
1111, NOT_UNIQUE_VOLUME_DEVICE, "Multiple volume resources were found for volume device \"{0}\"."
//  *Cause: This is an internal error. More than one volume resource with the specified volume device were found.
// *Action: Contact Oracle Support Services.
/
1112, FS_MOUNTPOINT_IN_USE_ON_NODE, "Mount point path {0} is in use by another file system resource on node {1}"
//  *Cause: An attempt to add a file system resource was rejected because the specified mount point path was already used by an existing file system resource on one of the specified nodes.
// *Action: Specify a mount point path not in use by a file system resource on any of the supplied nodes.
/
1113, VOLUME_UPGRADE_FAILED, "Unable to upgrade volume resources from version {0} to version {1}"
//  *Cause: An attempt to upgrade volume resources from one version to another version failed.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1114, EXPORTFS_UPGRADE_FAILED, "Unable to upgrade export file system resources from version {0} to version {1}"
//  *Cause: An attempt to upgrade export file system resources from one version to another version failed.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1115, PRIMARY_VOLUME_IN_AUX_LIST, "Volume device {0} is specified as both a primary and an accelerator volume"
//  *Cause: An attempt to add a file system resource was rejected because the specified accelerator volume devices included a volume device specified as a primary volume.
// *Action: Specify accelerator volume devices that are not also specified as a primary volume device.
/
1116, INVALID_LOCAL_AUX_VOL, "Unable to define accelerator volumes for non-ACFS file systems"
//  *Cause: An attempt to add a file system resource was rejected because accelerator volume devices were specified for a non-ACFS file system resource.
// *Action: Specify accelerator volumes for an ACFS file system.
/
1117, GET_AUXILIARY_VOLUMES_FAILED, "Unable to retrieve the accelerator volumes for file system resource {0}"
//  *Cause: An attempt to retrieve the accelerator volumes for the specified file system resource failed.
//          Possible causes: 
//                  1) CRS stack was not available.
//                  2) ASM instance was not running.
// *Action: 
//       1) Verify that the CRS stack is available. ( 'crsctl check crs' )
//       2) Verify that ASM is running. ( 'srvctl status asm' )
/
1118, UNSUPPORTED_MULTI_AUX_VOLS, "Multiple accelerator volumes are not supported."
//  *Cause: An attempt to add a file system resource was rejected because multiple accelerator volume devices were specified for a file system resource.
// *Action: Specify only one accelerator volume.
/
1119, GET_FS_USERS_FAILED, "Unable to get the users of the file system configuration for disk group {0} and volume {1}"
//  *Cause: 
//       1) CRS stack was not running.
//       2) User was not running with an account with administrative access.  (root or administrator)
// *Action: 
//       1) Verify that the CRS stack is running. ( 'crsctl check crs' )
//       2) Verify that the user is running with administrative access.
/
1120, FS_REMOVE_APPEND_USER_LIST, "Unable to use add (/+) or remove (/-) prefix with a list of operating system users for the file system."
//  *Cause: The modify operation failed because a list of operating system users was specified using the add or remove prefix.
// *Action: Specify a single operating system user with the add or remove prefix, or specify a list of operating system users without any prefix to replace it entirely. 
/
1121, UNSUPPORTED_PLATFORM_FS_TYPE, "The file system type {0} is not supported for the current operating system platform."
//  *Cause: An attempt to add a file system resource was rejected because the specified file system type is not supported for the current operating system platform.
// *Action: Specify a valid file system type for the operating system platform in use.
/
1122, FS_RUNNING_MOD_MTPT, "unable to modify the mount point path of a running file system resource"
//  *Cause: An attempt to modify the mount point path of the specified file system was rejected because the file system was mounted.
// *Action: Stop the file system resource and retry the operation.
/
1123, TOO_SMALL_COUNT_FOR_ASM, "The specified ASM cardinality {0} is less than the minimum cardinality of 2."
//  *Cause: An attempt to set ASM cardinality was rejected because the specified cardinality was less than 2.
// *Action: Specify a number that is equal to or larger than 2 for the '-count' option.
/
1124, TOO_LARGE_COUNT_FOR_ASM, "The specified ASM cardinality {0} is larger than the maximum cardinality of 1024."
//  *Cause: An attempt to set ASM cardinality was rejected because the specified cardinality was larger than 1024.
// *Action: Specify a number that is equal to or less than 1024 for the '-count' option.
/
1125, UNSUPPORTED_PLATFORM_AUXVOLS, "The accelerator volumes are not supported on this operating system."
//  *Cause: An attempt to add a file system resource was rejected because accelerator volumes are not supported for the current operating system.
// *Action: Do not specify accelerator volumes.
/
1126, UNABLE_TO_OBTAIN_SERVERCATEGORY_INFO, "failed to retrieve information about server category \"{0}\""
//  *Cause: An error occurred while trying to retrieve information about the specified server category.
// *Action: Examine the accompanying error messages for details.
/
1127, NO_RUNNING_DB_INSTANCE_ON_NODES, "failed to find instances for database {0} that were running on nodes {1}"
//  *Cause: There were no running database instances on the specified nodes when the request to update the target instance was issued.
// *Action: Specify the nodes where database instances are running.
/
1128, CCMB_CREATE_FAILED, "failed to create Oracle ACFS client cluster node membership and barrier resource {0}"
//  *Cause: An attempt to add the Cluster Ready Services (CRS) resource for an Oracle Automatic Storage Management Cluster File System (Oracle ACFS) client cluster node membership and barrier failed, possibly because the CRS stack was not running or the user running 'srvctl add ccmb' was not the owner of the CRS home.
// *Action: Examine the accompanying error messages for details and retry the command making sure that the CRS stack is running and the user running 'srvctl add ccmb' is the owner of the CRS home.
/
1129, NONACFS_UNSUPPORTED_DOMU, "unable to create a non-ACFS file system in an ACFS-Remote environment"
//  *Cause: An attempt to create a file system in an ACFS-Remote environment 
//   was rejected because the requested file system was not Oracle Automatic 
//   Storage Management Cluster File System (Oracle ACFS). 
//   Only Oracle ACFS file systems are supported in clusters using ACFS-Remote.
// *Action: Retry specifying Oracle ACFS as the file system type.
/
1130, VOLNAME_UNSUPPORTED_DOMU, "volume name specification not permitted when creating a file system in a client cluster environment"
//  *Cause: An attempt to create a file system was rejected because it specified a volume name, which is not supported in a client cluster environment.
// *Action: Create an Oracle ACFS file system without specifying a volume name.
/
1131, DGNAME_UNSUPPORTED_DOMU, "disk group name specification not permitted when creating a file system in a client cluster environment"
//  *Cause: An attempt to create a file system was rejected because it specified a disk group name, which is not supported in a client cluster environment.
// *Action: Create an Oracle ACFS file system without specifying a disk group name.
/
1132, DB_INSTANCES_NOT_RUNNING, "Instance names {0} are not active instances of database {1}."
//  *Cause: A request to update database instances specified one or more that were not running.
// *Action: Specify instances of the database that are running.
/
1133, ERROR_UPDATE_DB_TARGET_INSTANCE, "Error updating the target instance for database {0}. Error: \n{1}"
//  *Cause: A request to update target instance for the list of database instances failed with the error shown.
// *Action: Review the accompanying error messages for more details.
/
1134, ERROR_UPDATE_IOS_TARGET_INSTANCE, "Error updating the target instance for IOServer instances. Error: \n{0}"
//  *Cause: A request to update target instance for the list of IOServer instances failed with the error shown.
// *Action: Review the accompanying error messages for more details.
/
1135, IOS_INSTANCES_NOT_RUNNING, "Instance names {0} are not active instances of IOServer."
//  *Cause: A request to update IOServer instances specified one or more that were not running.
// *Action: Specify instances of the IOServer that are running.
/
1136, NO_RUNNING_IOS_INSTANCE_ON_NODES, "failed to find instances for IOServer that were running on nodes {0}"
//  *Cause: There were no running IOServer instances on the specified nodes when the request to update the target instance was issued.
// *Action: Specify nodes where IOServer instances are running.
/
1137, ACFSINFO_INVALID_MOUNTPOINT, "Oracle ACFS is not configured for mount point path {0}."
//  *Cause: An attempt to query an Oracle Automatic Storage Management Cluster File System (Oracle ACFS) information attribute failed because Oracle ACFS was not configured for the specified mount point path (shown in the message).
// *Action: Retry, specifying a valid mount point path.
/
1138, START_FILESYSTEMS_FAIL, "failed to start one or more file system resources:\n{0}"
//   *Cause: An attempt to start one or more file system resources failed because one or more file system resources were already running or disabled.
//  *Action: Review accompanying messages and make sure that the file system resources are enabled and not running before starting them.
/
1139, UNMATCHING_VOLDG_NAME, "number of volume names and disk group names unequal"
//  *Cause: An attempt to start a list of file system resources failed because the number of volume names and disk group names differed.
// *Action: Retry 'srvctl start filesystem' specifying the same number of volume and disk group names.
/
1140, MOUNT_OWNER_IN_USERS, "Mount point path owner {0} is contained in the mount point user list."
//  *Cause: An attempt to configure or modify the list of mount point users was rejected because the indicated mount point path owner was contained in the specified mount point users list.
// *Action: Remove the mount point path owner from the mount point users list.
/
1141, INVALID_MOUNT_OWNER_MODIFY, "User {0} is the mount point path owner."
//  *Cause: An attempt to add or remove a user from the list of mount point users failed because the specified user was configured as the mount point path owner.
// *Action: Specify the new mount point path owner in the '-mountowner' option in the command 'srvctl modify filesystem'.
/
1142, AUXILIARY_VOLUME_IS_PRIMARY, "Volume device {0} is already configured as a primary volume device."
//  *Cause: An attempt to add a file system resource was rejected because one or more of the specified volume devices were already configured as a primary volume device.
// *Action: Specify accelerator volume devices that are not configured as primary volume devices.
/
1143, AUXILIARY_VOLUME_NOT_FORMATTED, "Volume device {0} is not formatted as an accelerator volume device for primary volume device {1}."
//  *Cause: An attempt to add a file system resource was rejected because one or more of the specified volume devices were not formatted as accelerator volume devices for the specified primary volume device.
// *Action: Format the specified accelerator volume devices using the 'mkfs' command and retry the operation.
/
1144, FS_NOT_MOUNTED, "Mount point path {0} is not mounted."
//  *Cause: An attempt to query file system information from the specified mount point path was rejected because the mentioned mount point path was not mounted in any node in the cluster.
// *Action: Specify a mount point path that is mounted or start the file system resource using the 'srvctl start filesystem' command.
/
1145, ERROR_GET_ASM_TARGET_STATUS, "error getting the client connection list for the ASM instances \n{0}"
//  *Cause: A request to get the client connection list for the ASM instances failed with the error shown.
// *Action: Review the accompanying error messages for more details. Address issues raised and retry.
/
1146, ERROR_GET_IOS_TARGET_STATUS, "error getting the client connection list for the I/O Server instances \n{0}"
//  *Cause: A request to get the client connection list for the I/O Server instances failed with the error shown.
// *Action: Review the accompanying error messages for more details. Address issues raised and retry.
/
1147, UNSUPPORTED_CCMB_ASM_CLUSTER, "CCMB is not supported on a cluster where an ASM instance is configured."
//  *Cause: An attempt to create an Oracle ACFS Client Cluster Node Membership
//  and Barrier (CCMB) resource was rejected because it is not supported 
//  for a cluster with configured ASM instances.
// *Action: Use the currently configured ASM instances 
//  and disk groups for this cluster.
/
1148, HAVIP_UPGRADE_FAILED, "unable to upgrade HAVIP resources from version {0} to version {1}"
//  *Cause: An attempt to upgrade high availability virtual IP resources from 
//          one version to another version failed. The accompanying error 
//          messages provide detailed information about the failure.
// *Action: Review the accompanying error messages for details about the 
//          failure. Retry after resolving those issues.
/
1149, CREATE_ACFS_FAILED, "failure to create the Oracle Automatic Storage Management Cluster File System"
// *Cause: An attempt to create an Oracle Automatic Storage Management Cluster
//         File System (Oracle ACFS) failed.
//         The accompanying error messages provide detailed failure 
//         information.
// *Action: Examine the accompanying error messages, address the issues
//          raised, and retry.
/
1150, PWFILE_NOT_ON_ASM, "failure to set ASM cardinality to a value other than ALL because the password file \"{0}\" is not on an ASM disk group"
//  *Cause: An attempt to update the ASM cardinality to a value other than ALL 
//          was rejected because the password file was not on an ASM disk 
//          group.
// *Action: Retry the request after moving the password file to an ASM disk 
//          group.
/
1151, GET_PWFILE_BACKUP_FAILED, "failed to retrieve the backup password file location used by ASM {0}"
//  *Cause: An attempt to retrieve the backup password file attribute of 
//          the specified ASM instance failed. The accompanying messages 
//          provide detailed failure information.
// *Action: Examine the accompanying messages and resolve the issues 
//          identified. Ensure that the CRS stack is running, the ASM 
//          resource has been configured, that the user has permission 
//          to read the ASM resource, and then retry the operation.
/
1152, ASMGROUP_CREATE_FAILED, "failed to create ASM resource group {0}"
//  *Cause: An attempt to add the Cluster Ready Services (CRS) resource group 
//          for an ASM Group failed. The accompanying messages provide detailed
//          failure information.
// *Action: Examine the accompanying messages and resolve any issues indicated
//          there. Ensure that the CRS stack is running, and then retry the
//          command 'srvctl add asm' as the user that owns the CRS home.  
/
1153, TOO_SMALL_COUNT_FOR_ASM_GROUP, "The specified ASM Group cardinality {0} is less than the minimum cardinality of 2."
//  *Cause: An attempt to set ASM Group cardinality was rejected because the 
//          specified cardinality was less than 2.
// *Action: Retry the operation, specifying a number that is equal to or 
//          larger than 2 for the '-count' option.
/
1154, TOO_LARGE_COUNT_FOR_ASM_GROUP, "The specified ASM Group cardinality {0} is larger than the maximum cardinality of 1024."
//  *Cause: An attempt to set ASM Group cardinality was rejected because the 
//          specified cardinality was larger than 1024.
// *Action: Retry the operation, specifying a number that is equal to or less 
//          than 1024 for the '-count' option.
/
1155, ASMGROUP_ALREADY_EXISTS, "Unable to create ASM resource group because it already exists."
//  *Cause: An attempt to add an ASM resource group was rejected because the
//          resource group already existed.
// *Action: None.
/
1156, SET_PWFILEBACKUP_FAILED, "failed to update backup password file location {0} used by ASM"
//  *Cause: An attempt to update the backup password file attribute of ASM
//          failed, possibly because the Cluster Ready Services (CRS) stack
//          was not running, the ASM resource was not configured, or the
//          user does not have update permission on the ASM resource.
//          The accompanying messages provide detailed failure information.
// *Action: Examine the accompanying messages and resolve the issues 
//          identified. Retry the request after ensuring that the Cluster 
//          Ready Services (CRS) stack is running, the ASM resource has been 
//          configured, and the user has update permission on the ASM resource.
/
1157, INVALID_MOUNTPERM_VALUE, "The specified mount permissions value \"{0}\" is not valid."
//  *Cause: An attempt to set mount permissions was rejected because the 
//          indicated value was not a valid permission specification.
// *Action: Retry the operation, specifying a valid permission specification.
/
1158, INVALID_MOUNTGROUP, "The specified mount group \"{0}\" is not valid."
//  *Cause: An attempt to set a mount group was rejected because the indicated 
//          group did not exist.
// *Action: Retry the operation, specifying a valid mount group.
/
1159, SMALL_VOLUME_SIZE_FOR_ACFS, "The size of the specified volume \"{0}\" is less than the minimum size required of {1} MB to create the Oracle ACFS."
//  *Cause: An attempt to add an Oracle Automatic Storage Management Cluster
//          File System (Oracle ACFS) was rejected because the size of the 
//          specified volume was less than the minimum required value.
// *Action: Retry the operation, specifying a volume with a minimum size of
//          (162 MB * number of cluster nodes) + (144 MB * number of cluster).
/
1160, INVALID_NODES_FOR_ACFS, "The size of the specified volume \"{0}\" does not support more than two nodes."
//  *Cause: An attempt to add an Oracle Automatic Storage Management Cluster
//          File System (Oracle ACFS) was rejected because the size of the 
//          indicated volume did not support more than two nodes.
// *Action: Retry the operation, specifying a volume with a minimum size of
//          312 MB multiplied by the number of nodes in the cluster.
//          For 512 MB volume size, retry the operation in a two-node cluster.
/
1161, FAILED_RELOCATE_IOS_IN_ASMGRP, "failed to relocate I/O Server in ASM resource group"
//  *Cause: An error occurred while attempting to relocate the I/O Server
//          because the I/O Server is a part of the ASM resource group.
// *Action: Use the 'srvctl relocate asm' command to relocate all resources
//          in the ASM resource group including I/O Server. 
/
1162, ACFS_RES_NOT_EXIST_MTPNT, "ACFS file system resource does not exist for mountpoint {0}"
//  *Cause: The ACFS file system resource with the mountpoint was not registered 
//          with Oracle Clusterware.
// *Action: Use the command 'srvctl add filesystem' to create an ACFS file 
//          system resource.
/
