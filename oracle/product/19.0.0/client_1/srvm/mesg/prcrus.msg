// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCrMsg.msg
//
// DESCRIPTION
//    Message file related to CRS resources
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     05/03/18 - fix bug 27393307
//     yizhang     07/31/17 - fix bug 26504411
//     rdesale     07/26/17 - fix bug 26482553
//     yizhang     01/10/17 - fix bug 20773941
//     yizhang     10/20/16 - fix bug 24654593
//     yifyang     03/28/16 - 22975528
//     kamramas    10/13/15 - service already stopped
//     kamramas    08/13/15 - Bug 20873549
//     chchatte    06/30/15 - bug 21140398
//     vgunredd    06/10/15 - Fix bug 20992626
//     marbharg    03/23/15 - Changes related to marbharg_proj_47205_txn_2
//     ksviswan    03/12/15 - add OOP patching support for gihome
//     kamramas    12/09/14 - Fix 14067975
//     smadabhu    11/11/14 - Proj 51778 - Add
//                            CRS_JNI_RESOURCES_RELOCATE_FAILED
//     chchatte    07/01/14 - Fix bug 18871287
//     vgunredd    06/27/14 - Fix bug 14168393
//     vgunredd    03/27/14 - Fix bug 18426979
//     chchatte    03/19/14 - Add VM resource (Add enable/disable for
//                            cardinality ID)
//     sejlim      12/06/13 - bug 17847109
//     pevilla     11/26/13 - Fix bug 17822427, add GNS_VIPNAME_ERROR
//     lureyes     10/18/13 - Fix bug 17578221
//     sparial     09/15/13 - bug 17459754
//     sejlim      07/12/13 - bug 17005290
//     sejlim      05/28/13 - add message for action callback error 
//     ocordova    06/10/13 - Fix Bug 16778295
//     sejlim      05/02/13 - java_action_framework
//     satg        11/14/12 - Fix bug 14730028
//     abhisbg     10/30/12 - fix admin helper
//     abhisbg     10/18/12 - add No response msg
//     abhisbg     06/05/12 - bug 14085045
//     abhisbg     05/23/12 - fix bug 14039085
//     sravindh    04/20/12 - Review comments
//     sravindh    04/12/12 - Bug 13892154
//     abhisbg     04/09/12 - fix bug 13938192
//     abhisbg     04/08/12 - fixed typo
//     abhisbg     03/26/12 - Add message for res lookup failed for type
//     yizhang     03/06/12 - fix bug 13529492
//     ccharits    01/23/12 - Fixed bug 13597084
//     ccharits    07/29/11 - Added message MISMATCH_BETWEEN_ATTR_NAMES_AND_VALUES
//     vobulapu    07/05/11 - Add the messages for Logger
//     agridnev    06/29/11 - more snapshot messages
//     agridnev    06/03/11 - added support support for active version
//                            exception
//     abhisbg     06/24/11 - Add message for WhatIf
//     agridnev    05/18/11 - extra messages for snapshots
//     agridnev    03/15/11 - new message(s) for snapshot errors
//     agridnev    02/21/11 - added extra support for snapshot
//     agridnev    02/08/11 - added messages for snapshot
//     agridnev    10/26/10 - added Snapshot support
//     agridnev    04/02/10 - added messages to fix bug-9470751
//     agridnev    03/16/10 - amended CRS_JNI_UNREGISTER_ENT_FAILED to reflect
//                            fix for bug-9476990
//     yizhang     01/26/10 - add FAILED_UPGRADE_TYPE_RESOURCE
//     sowong      06/23/09 - add PURGE_NODE_PERX_NOT_EXISTS
//     sravindh    12/13/09 - Bug 9197337
//     rxkumar     11/23/09 - add PURGE_PERX_NOT_EXISTS
//     yizhang     11/13/09 - fix bug 8612042
//     sravindh    10/09/09 - Bug 8931922
//     agridnev    10/08/09 - minor Cause changes for CRS_RTYPE_NAME_UPDATE_FAIL
//     agridnev    10/05/09 - added CRS_JNI_RESOURCE_CHECK_FAILED
//     agridnev    09/25/09 - added CRS_RTYPE_NOT_FOUND & CRS_RTYPE_NAME_UPDATE_FAIL
//     yizhang     06/23/09 - fix bug 8620355
//     yizhang     06/04/09 - Add cause and action for messages
//     yizhang     05/26/09 - fix messages
//     agridnev    06/01/09 - fixed bug-8512560
//     agridnev    05/18/09 - fixed bug 8517905
//     sravindh    05/18/09 - Add message for ResourceName
//     yizhang     05/08/09 - fix bug 8488622
//     agridnev    05/08/09 - fixed bug-8492752
//     sravindh    05/02/09 - Adding dummy messages that have been removed to
//                            prevent lang files compile break
//     yizhang     04/22/09 - fix bugs of unwanted trailing characters
//     yizhang     04/15/09 - fix bug 8325167
//     yizhang     04/02/09 - Fix bug 8329666
//     dpham       03/17/09 - Fix "registered" typo
//     sowong      03/05/09 - fix bug7605771
//     agridnev    01/13/09 - added message for stopResources()
//     agridnev    12/19/08 - added message for evaluateRegisterEntity()
//     yizhang     10/13/08 - Fix bug 7373704
//     rxkumar     10/27/08 - add messages for ER bug-7520072
//     rxkumar     08/28/08 - add CRS_RELOCATE_SERVERS_FAILED
//     yizhang     08/21/08 - Fix RES_RELOCATE_FAILED
//     agridnev    08/20/08 - amended "cause" for 10101 per JC request
//     agridnev    08/19/08 - added message for bug-7323859
//     agridnev    08/06/08 - fixed bug-6470856: updated CRSNative related
//                            messages
//     rxkumar     07/22/08 - fix bug7142054
//     rsirigan    05/14/08 - fix bug7030393 
//     spavan      04/29/08 - 
//     rxkumar     05/08/08 - rm INVALID_RELOCATE_OPTION
//     yizhang     04/25/08 - Update RES_REMOVE_FAILED
//     spavan      04/08/08 - Fix cause/actions
//     agridnev    03/18/08 - added message to support getSeqNumber()
//     agridnev    03/12/08 - added messages to support getProcessedStat()
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCrMsg.java
//     yizhang     02/29/08 - Fix message RES_NOT_EXISTS
//     agridnev    02/21/08 - added messages for purgePerX
//     spavan      02/21/08 - add spavan_nappbugs msgs
//     agridnev    02/11/08 - added msg for relocate options
//     agridnev    01/24/08 - updated start(count)/stop(count) messages
//     agridnev    01/18/08 - added msg for hasAdminRole()
//     agridnev    01/15/08 - adde msg for start(count)
//     rxkumar     01/02/08 - add GET/SET_RES_DEP_RES_FAILED
//     agridnev    12/20/07 - added msg for CRSAttributeNotFoundException
//     spavan      12/28/07 - Fixup message properly
//     spavan      12/21/07 - Add rolling upgrade messages
//     rxkumar     11/01/07 - fix  CRS_RI_GET_FAILED msg
//     agridnev    10/04/07 - new messages for bug-6410594's fix
//     yizhang     10/23/07 - Add RES_ALREADY_ENABLED/DISABLED_ON_NODES messages
//     agridnev    10/04/07 - neww messages for bug-6410594's fix
//     agridnev    08/14/07 - more relocate related messages
//     agridnev    07/16/07 - fix for bug-6158429
//     rxkumar     05/11/07 - add msg for CLU_MBR_CHECK_FAILED
//     rxkumar     05/04/07 - add RES_TYPE_ADD_FAILED
//     agridnev    05/01/07 - added msg for UnsupportedCRSOperationException
//     agridnev    04/02/07 - start(node/list) support
//     rxkumar     03/14/07 - add GET_SET_CARD
//     rsirigan    03/08/07 - fix bug5912308
//     agridnev    03/05/07 - added support for status
//     agridnev    02/09/07 - updated based on Raj's review
//     agridnev    02/07/07 - clean up
//     rxkumar     02/01/07 - add NOT_ORCL_CLUSTER
//     agridnev    01/29/07 - added type strings for CRSEntities
//     agridnev    01/19/07 - added server support
//     rxkumar     01/08/07 - add RES_REMOVE_PERX_FAILED
//     agridnev    01/04/07 - added filter support
//     rxkumar     01/02/07 - add RES_ATTR_NAME_INVALID
//     agridnev    12/27/06 - added unregister support
//     agridnev    12/20/06 - updates related to JC review
//     agridnev    12/12/06 - added CRSNative messages
//     rxkumar     12/08/06 - add RES_GETVERSION_FAILED
//     rxkumar     12/06/06 - add RES_STATE_INVALID
//     rxkumar     12/01/06 - INVALID_ATTR_VALUE
//     agridnev    11/29/06 - updated facility
//     agridnev    11/28/06 - review based updates
//     agridnev    11/26/06 - added OracleCM and Vendor Cluster support
//     rxkumar     11/22/06 - add RES_GET_PERM_FAILED
//     rxkumar     11/16/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, RES_ALREADY_EXISTS, "Resource {0} already exists"
//  *Cause: An attempt was made to create a resource that already exists.
// *Action: Check the resource using the command 'srvctl config <object>' and if the resource should not exist then remove it using the command 'srvctl remove <object>'.
/
1001, RES_NOT_EXISTS, "Resource {0} does not exist"
//  *Cause: An attempt was made to operate on a resource that does not exist.
// *Action: Check the resource using the command 'srvctl config <object>' and if the resource does not exist, then create it using the command 'srvctl add <object>'.
/
1002, RES_ALREADY_ENABLED, "Resource {0} is already enabled"
//  *Cause: An attempt was made to enable a resource that is already enabled.
// *Action: If the resource is already enabled then no action is needed. Use the command 'srvctl status <object>' to determine whether it is enabled.
/
1003, RES_ALREADY_DISABLED, "Resource {0} is already disabled"
//  *Cause: An attempt was made to disable a resource that is already disabled.
// *Action: If the resource is already disabled then no action is needed. Use the command 'srvctl status <object>' to determine whether it is disabled.
/
1004, RES_ALREADY_RUNNING, "Resource {0} is already running"
//  *Cause: An attempt was made to start a resource that is already running.
// *Action: If the resource is already running then no action is needed. Use the command 'srvctl status <object>' to determine whether it is running.
/
1005, RES_ALREADY_STOPPED, "Resource {0} is already stopped"
//  *Cause: An attempt was made to stop a resource that is already stopped.
// *Action: If the resource is already stopped then no action is needed. Use the command 'srvctl status <object>' to determine whether it is stopped.
/
1006, RES_ADD_FAILED, "Failed to add resource {0} for {1}"
//  *Cause: An attempt to add the specified resource failed.
// *Action: Examine the accompanying error messages for details.
/
1007, RES_STAT_FAILED, "Failed to check status of resource {0}"
//  *Cause: An attempt to check status of specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1008, RES_GETVERSION_FAILED, "Failed to retrieve version of resource {0}"
//  *Cause: An attempt to  retrieve version of the specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1009, RES_GETPERM_FAILED, "Failed to retrieve permissions of resource {0}, ACL {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1010, RES_SETPERM_FAILED, "Failed to update permissions of resource {0}"
//  *Cause: An attempt to update permissions of specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1011, RES_ENABLE_FAILED, "Failed to enable resource {0}"
//  *Cause: An attempt to enable specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1012, RES_DISABLE_FAILED, "Failed to disable resource {0}"
//  *Cause: An attempt to disable specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1013, RES_START_FAILED, "Failed to start resource {0}"
//  *Cause: An attempt to start specified resource on several nodes failed.
// *Action: Check the help for the underlying exception.
/
1014, RES_STOP_FAILED, "Failed to stop resource {0}"
//  *Cause: An attempt to stop specified resource on several nodes failed.
// *Action: Check the help for the underlying exception.
/
1015, RES_RELOCATE_FAILED, "Failed to relocate resource {0}"
//  *Cause:An attempt to relocate specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1016, RES_MODIFY_FAILED, "Failed to modify resource {0}"
//  *Cause: An attempt to modify specified resource has failed.
// *Action: Check the help for the underlying exception.
/
1017, RES_STAT_PERX_FAILED, "Dummy message: Failed to check status of resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1018, RES_ENABLE_PERX_FAILED, "Dummy message: Failed to enable resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1019, RES_DISABLE_PERX_FAILED, "Dummy message: Failed to disable resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1020, RES_START_PERX_FAILED, "Dummy message: Failed to start resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1021, RES_STOP_PERX_FAILED, "Dummy message: Failed to stop resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1022, RES_MODIFY_PERX_FAILED, "Dummy message: Failed to modify resource {0} on nodes {1}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1023, RES_RELOCATE_PERX_FAILED, "Dummy message: Failed to relocate resource {0} from node {1} to node {2}"
// *Document: NO
//  *Cause: Dummy message line
// *Action: 
/
1024, RES_REMOVE_PERX_FAILED, "Failed to remove resource {0} on nodes {1}"
//  *Cause: An attempt to remove the resource on the specified nodes failed.
// *Action: Check the accompanying error messages for details. 
/
1025, RES_STILL_RUNNING, "Resource {0} is still running"
//  *Cause: The specified resource is not stopped.
// *Action: Check the accompanying error messages to decide whether to stop the specified resource.
/
1026, RES_NOT_RUNNING, "Resource {0} is not running"
//  *Cause: The specified resource is not started.
// *Action: Check the accompanying error messages to decide whether to start the specified resource.
/
1027, RES_PERX_NOT_RUNNING, "Dummy message: Resource {0} instance on node {1} is not running"
//  *Document: No
//  *Cause: Dummy message line
// *Action: 
/
1028, RES_REMOVE_FAILED, "Failed to remove resource {0}"
//  *Cause: An attempt to remove specified resource failed.
// *Action: Check the help for the underlying CRSException.
/
1029, RES_ATTR_NOT_EXISTS, "Attribute {0} does not exist in resource {1} definition"
//  *Cause: An attempt was made to get an attribute which is not defined for that resource type.
// *Action: Make sure that the attribute exists in the resource definition.
/
1030, RES_ATTR_NAME_INVALID, "Resource attribute name {0} is not valid"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1031, RES_ATTR_VALUE_INVALID, "Resource attribute {0} value {1} is not valid"
//  *Cause: Specified resource attribute value is not valid.
// *Action: Try recreating the resource attribute value using srvm APIs or recreating the resource using srvctl commands.
/
1032, RES_STATE_INVALID, "Current state of resource {0} is not valid"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1033, RES_TYPE_NOT_EXISTS, "Resource type {0} does not exist"
//  *Cause: An attempt to retrieve the type has failed.
// *Action: Make sure that the type exists.
/
1034, RES_TYPE_ADD_FAILED, "Dummy message: Failed to add resource type {0}"
//  *Document: No
//  *Cause: Dummy message line
// *Action: 
/
1035, RES_LOOKUP_FAILED, "Failed to look up CRS resource {0} for {1}"
//  *Cause: An attempt to access the specified resource failed because it did not exist.
// *Action: Check that the specified name and resource type are correct.
/
1036, RES_GET_CARD_FAILED, "Failed to retrieve cardinality of the resource {0}"
//  *Cause: An attempt to retrieve cardinality of resource has failed.
// *Action: Examine the accompanying error messages to determine how to respond.
/
1037, RES_SET_CARD_FAILED, "Failed to update cardinality of the resource {0} to {1}"
//  *Cause: An attempt to set cardinality of the resource has failed.
// *Action: Examine the accompanying error messages to determine how to respond.
/
1038, RES_UNSUPPORTED_OP, "Dummy message: {0} is not supported for resource {1}"
//  *Document: No
//  *Cause: Dummy message line
// *Action: 
/
1039, SERVER_POOL_NOT_EXISTS, "Server pool {0} does not exist"
//  *Cause: An attempt was made to retrieve the server pool which does not exists.
// *Action: Make sure that requested server pool exists.
/
1040, RES_ALREADY_ENABLED_ON_NODES, "Resource {0} is already enabled on node(s) {1}"
//  *Cause: An attempt was made to enable a resource that is already enable on nodes.
// *Action: The status of a resource can be checked by using the command 'srvctl status <object>'.
/
1041, RES_ALREADY_DISABLED_ON_NODES, "Resource {0} is already disabled on node(s) {1}"
//  *Cause: An attempt was made to disable a resource that is already disabled on nodes.
// *Action: The status of a resource can be checked by using the command 'srvctl status <object>'.
/
1042, RES_GET_DEP_RES_FAILED, "Failed to get dependent resources {0} of resource {1}: {2}"
//  *Cause: Failed to retrieve dependent resources of the given resource.
// *Action: Examine the accompanying error messages to determine how to respond. 
/
1043, RES_SET_DEP_RES_FAILED, "Failed to update dependent resources {0} of resource {1} to resource {2}"
//  *Cause: Failed to update dependent resources of the given resource.
// *Action: Examine the accompanying error messages to determine how to respond. 
/
1050, NOT_ORCL_CLUSTER, "Resource {0} is not configured in Oracle cluster environment"
//  *Cause: The environment for the specified resource is not Oracle Clusterware. 
// *Action: The specified commands or APIs can only be used when Oracle Clusterware is running. If the environment is configured as Oracle Restart, use the correspond commands and APIs for Oracle Restart.
/
1051, CLU_ORACM_NOT_FOUND, "OracleCM Cluster is not found on node {0}"
//  *Cause: The OracleCM Cluster was not found on the specified node because the library for OracleCM Cluster was not found.
// *Action: Install OracleCM Cluster on the specified node.
/
1052, CLU_ORACM_LIB_CHECK_FAILED, "Failed to find OracleCM Cluster library on node {0}"
//  *Cause: Failed to check OracleCM Cluster because of the error in executingthe command to find the file /etc/ORCLcluster/oracm/lib/libskgxn2.so.
// *Action: Make sure that the caller has the read and execute permission for the library file.
/
1053, CLU_VENDOR_NOT_FOUND, "Vendor Cluster is not found on node {0}"
//  *Cause: The Vendor Cluster was not installed and configured on the specified node.
// *Action: Install and configure the Vendor Cluster on the specified node.
/
1054, CLU_VENDOR_LIB_CHECK_FAILED, "Failed to find Vendor Cluster library on node {0}"
//  *Cause: Failed to check OracleCM Cluster because of the error in executing the command to find the file /etc/ORCLcluster/lib/libskgxn2.so.
// *Action: Make sure that the caller has the read and execute permission for the library file.
/
1055, CLU_MBR_CHECK_FAILED, "Cluster membership check failed for node {0}"
//  *Cause: The specified node does not belong to the cluster.
// *Action: Check whether the node name is correct. 
/
1061, CRS_JNI_PERMISSIONS_FAILURE, "User permissions are insufficient"
//  *Cause: User permissions are insufficient to register resource/type.
// *Action: Make sure the user is crs-user or root.
/
1062, CRS_JNI_RESOURCE_GET_ATTRS_FAILED, "Failed to retrieve attributes of resource {0} on node {1}"
//  *Cause: An attempt to retrieve attributes of the resource has failed.
// *Action: Make sure that resource exists.
/
1063, CRS_JNI_CREATE_CTX_FAILED, "Failed to create context"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1064, CRS_JNI_RESOURCE_START_FAILED, "Failed to start resource {0} on node {1}"
//  *Cause: An attempt to start the resource has failed.
// *Action: Make sure that resource is ready to start on the node before starting it.
/
1065, CRS_JNI_RESOURCE_STOP_FAILED, "Failed to stop resource {0}"
//  *Cause: An attempt to stop the resource failed because the resource wasn't running or the running resource had dependent resources also running. 
// *Action:  Check the accompanying messages to identify dependent resources and stop them. Make sure that resource is running before stopping it. 
/
1067, CRS_FILTER_CREATE_FAILED, "Failed to create a filter"
//  *Cause: An attempt to create a filter has failed.
// *Action: Check the help for the underlying exception.
/
1068, CRS_JNI_QUERY_RESOURCES_FAILED, "Failed to query resources"
//  *Cause: An attempt to query the resource failed.
// *Action: Check the help for the underlying exception.
/
1069, CRS_JNI_ATTR_NOT_FOUND, "Attribute {0} of {1} {2} not found"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1070, CRS_JNI_IS_ENT_REGISTERED_FAILED, "Failed to check if {0} {1} is registered"
//  *Cause: Failed to check if resource is registered.
// *Action: Check the help for the underlying exception.
/
1071, CRS_JNI_REGISTER_ENT_FAILED, "Failed to register or update {0} {1}"
//  *Cause: An attempt to register or update the resource failed.
// *Action: Check the help for the underlying exception.
/
1072, CRS_JNI_UNREGISTER_ENT_FAILED, "Failed to unregister {0} {1}"
//  *Cause: An attempt to unregister specified Oracle clusterware entity failed.
// *Action: Check the help for the underlying exception. 
/
1074, CRS_JNI_ENT_STAT_FAILED, "Failed to retrieve attributes for {0} {1}"
//  *Cause: Failed to retrieve attributes for specified resource.
// *Action: Check the help for the underlying exception.
/
1075, CRS_JNI_STATUS_FAILED, "Failed to retrieve status for resource {0}"
//  *Cause: Failed to retrieve status for specified resource.
// *Action: Check the help for the underlying exception.
/
1076, CRS_JNI_STATUS_FIELD_MISSED, "Failed to retrieve status for resource {0}: {1} is missed"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1077, CRS_JNI_STATUS_UNKNOWN, "Failed to calculate status for resource {0}: {1}/{2}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1078, CRS_JNI_RESOURCE_GET_ATTRS_FAILED_NO_HOST, "Failed to retrieve attributes of resource {0}"
//  *Cause: An attempt to retrieve attributes of the resource has failed.
// *Action: Make sure that resource exists.
/
1079, CRS_JNI_RESOURCE_START_FAILED_NO_HOST, "Failed to start resource {0}"
//  *Cause: An attempt to start the resource has failed.
// *Action: Make sure that resource is ready to start before starting it.
/
1080, CRS_ENT_RESOURCE, "resource"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1081, CRS_ENT_RESOURCE_TYPE, "resource type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1082, CRS_ENT_SERVER_POOL, "server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1083, CRS_ENT_SERVER, "server"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1084, CRS_ENT_RESOURCE_INSTANCE, "resource instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1085, CRS_ENT_UNKNOWN_TYPESTRING, "Unknown typeAsString: {0}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1086, CRS_ENT_ALREADY_REGISTERED, "{0} {1} is already registered"
//  *Cause: An attempt to register specified resource failed.
// *Action: Make sure that a resource is not registered before register it.
/
1087, CRS_RI_GET_FAILED, "Failed to retrieve resource {0} instances"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1088, CRS_RI_STOP_FAILED, "Failed to stop resource {0}: it was not started on node {1}"
//  *Cause: The resource was not started on the node..
// *Action: Make sure that resource was started before stopping it.
/
1089, CRS_RELOCATE_FAILED, "Failed to relocate resource {0}."
//  *Cause: An attempt to relocate specified resource failed.
// *Action: Check the help for the underlying exception.
/
1090, CRS_RELOCATE_NOT_RUNNING, "Failed to relocate resource {0}. It is not running."
//  *Cause: The resource was not started.
// *Action: Make sure that resource was started before relocating it.
/
1091, CRS_RELOCATE_NOT_RUNNING_ON_NODE, "Failed to relocate resource {0}. It is not running on node {1}."
//  *Cause: The resource was not started on the node.
// *Action: Make sure that resource was started before relocating it.
/
1092, CRS_RELOCATE_NOT_SINGLETON, "Failed to relocate resource {0}. It is running on more than one node"
//  *Cause: The resource was started on more than one node.
// *Action: Make sure that resource is running on one node only before relocating it.
/
1093, CRS_RELOCATE_SAME_NODE, "Failed to relocate resource {0}. It is already running on node {1}"
//  *Cause: The resource is running that node.
// *Action: Make sure that resource is not running on a node before relocating it.
/
1094, CRS_START_FAILED_FILTER, "Failed to start resources on node {0}: {1}"
//  *Cause: Resources defined by filter cannot be started on the node.
// *Action: Make sure that resources are not running and ready to run before starting them. Make sure that the node is online.
/
1095, CRS_START_FAILED_FILTER_NOHOST, "Failed to start resources using filter {0}"
//  *Cause: Resources defined by filter cannot be started.
// *Action: Make sure that resources are not running and ready to run before starting them.
/
1096, CRS_JNI_FILTER_IS_NULL, "Filter cannot be null"
//  *Cause: An attempt to use filter has failed.
// *Action: Make sure that a filter is provided.
/
1097, CRS_ATTRIBUTE_NOT_FOUND, "Resource attribute not found: {0}"
//  *Cause: Requested resource attribute not found.
// *Action: Make sure that resource has requested attribute.
/
1098, UPGRADE_MODE_FAILED, "Could not set rolling upgrade mode {0}"
//  *Cause: An attempt to start the resource in rolling upgrade mode has failed.
// *Action: Make sure that the correct LD_LIBRARY_PATH is set and all shared libraries are present.
/
1099, CRS_JNI_START_COUNT_FAILED, "Cannot start resource {0} on {1} additional nodes because it would exceed the resource cardinality {2}. Resource is already running on {3} nodes "
//  *Cause: Resource cannot be started because of its cardinality restriction.
// *Action: Make sure that number of additional nodes does not exceed the resource cardinality.
/
1100, CRS_JNI_START_COUNT_FAILED_CARD, "Cannot start resource {0} on {1} nodes because it would exceed the resource cardinality {2}"
//  *Cause: Resource cannot be started because of its cardinality restriction.
// *Action: Make sure that number of nodes does not exceed the resource cardinality.
/
1101, CRS_JNI_STOP_COUNT_FAILED, "Cannot stop resource {0} on {1} nodes, it is running on {2} nodes."
//  *Cause: The resource does not have enough running instances to stop.
// *Action: Make sure that resource has enough running instances to stop.
/
1102, CRS_JNI_CRS_ADMIN_FAILED, "Failed to verify if user {0} has CRS administrator role"
//  *Cause: Failed to verify if the user has CRS administrator role.
// *Action: Resolve the reported error message and retry.
/
1104, UNSUPPORTED_RELOCATE_OPTION, "Unsupported relocate option {0}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1105, RES_RELOCATE_FAILED_NODE, "Failed to relocate resource {0} to node {1}"
//  *Cause: An attempt to relocate the resource to the specified node has failed.
// *Action: Examine accompanying message(s) that provide details of the error, and respond accordingly.
/
1106, RES_RELOCATE_FAILED_NODE_NODE, "Failed to relocate resource {0} from node {1} to node {2}"
//  *Cause: An attempt to relocate the resource from the specified node to another has failed.
// *Action: Check the help for the underlying exception.
/
1107, DEP_RES_ATTR_ERR, "Error while trying to set default network as dependent resource for {0}"
//  *Cause: An attempt to set default network dependency for the specified resource failed.
// *Action: Examine the accompanying error message(s) for details.
/
1108,ONS_NETWORK_RES_NOT_EXISTS, "ONS cannot be created because default network is not configured."
//  *Cause: An attempt was made to create ONS resource with out creating the dependent default network resource.
// *Action: Network resource can be created using the command 'srvctl add nodeapps'. Create the network resource and try this command again.
/
1109, PURGE_PERX_FAILED, "Failed to remove attributes \"{1}\" from resource {0}"
//  *Cause:  Possible reasons: Oracle Clusterware stack might not be active, CRS resource may not exist, or the CRS resource may not have given attributes set.
// *Action:  Make sure that Oracle Clusterware is active, the CRS resource exists and has given attributes set.
/
1110, CRS_JNI_PROCESSED_ATTRS_FAILED, "Failed to retrieve processed attributes of resource {0} for node {1}"
//  *Cause: Oracle Clusterware stack was not active or CRS resource did not not exist.
// *Action: Make sure that Oracle Clusterware is active, the CRS resource exists.
/
1111, CRS_JNI_PROCESSED_ATTRS_NO_RI, "Failed to retrieve processed attributes of resource {0} for node {1}"
//  *Cause: requested CRS resource did not exist.
// *Action: Make sure that the CRS resource exists.
/
1112, CRS_JNI_GET_SEQN_FAILED, "Failed to retrieve current event sequence number"
//  *Cause: Oracle Clusterware stack was not active.
//  *Action: Make sure that Oracle Clusterware is active.
/
1113, CRS_JNI_NO_MESSAGE, "Failed to create detailed error message, rc = {0}"
//  *Cause: Internal error
//  *Action: Contact Oracle Support Services.
/
1114, CRS_RELOCATE_SERVERS_FAILED, "Failed to relocate servers {0} into server pool {1}"
//  *Cause: Failed to relocate servers into the given server pool. This message may be accompanied by others providing additional details. A likely cause is violation of defined configuration attributes such as pool MIN_SIZE, SERVER_NAMES etc. 
// *Action: If the problem stems from violating configuration attributes, either modify the attributes or reformulate the request. Otherwise, contact Oracle Support Services.
/
1115, CRS_ENTITIES_GET_FAILED, "Failed to find entities of type {0} that match filters {1} and contain attributes {2}"
//  *Cause: Failed to look up entitites of given type that match given filters. This message may be accompanied by others providing additional details. A likely cause is that current user does not have permissions to read attributes of entities of given type. 
// *Action: If lack of permissions is the cause of this failure, then use the command 'srvctl config <object> -a' to find the current owner of the entity and retry the query as that owner user. Otherwise, contact Oracle Support Services.
/
1116, CRS_JNI_EVAL_REGISTER_FAILED, "{0} {1} cannot be created and registered now"
//  *Cause:  Oracle Clusterware stack could not create and register an object.
// *Action: Check the help for the underlying exception.
/
1117, CRS_JNI_STOP_RESOURCES_FAILED, "Failed to stop resources using filter {0}"
// *Cause: An attempt to stop resources using specified filter failed.
// *Action: Respond based on the accompanying exception message.
/
1118, CREATE_RESOURCE_PERM_FAILED, "Failed to generate resource permissions for the resource"
//  *Cause: Creation of the Access Control List (permission) structures for the resource failed. This message is accompanied by others providing details of the error.
// *Action: Respond based on the accompanying exception message(s).
/
1119, RESTYPE_LOOKUP_FAILED, "Failed to look up CRS resources of {0} type"
//  *Cause: An attempt to find the resource for the specified resource type failed because it did not exist.
// *Action: Create a resource of the type.
/
1120, RESOURCES_ALREADY_RUNNING, "Resources are already running. {0}"
//   *Cause: An attempt to start resources failed because they are already running. For detailed information about resources review the accompanying error messages.
//  *Action: None.
/
1121, INVALID_PARAM_VALUE, "Value of parameter \"{0}\" cannot be null or empty"
//  *Cause: An attempt to construct ACFS resource name failed due to null or empty value for the indicated parameter.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1122, CRS_RTYPE_NOT_FOUND, "Resource type {0} is not registered with Oracle Clusterware"
//  *Cause: Given resource type was not registered.
// *Action: Make sure that required resource type is registered.
/
1123, CRS_RTYPE_NAME_UPDATE_FAIL, "Failed to rename resource type {0}"
//  *Cause: An attempt was made to change name of the given resource type. Resource types cannot be renamed.
// *Action: None.
/
1124, CRS_JNI_RESOURCE_CHECK_FAILED, "Failed to check resource {0}"
//  *Cause: An attempt to check the resource failed.
// *Action: Correct any problems reported in accompanying messages. Make sure that resource is registered with Oracle Clusterware.
/
1125, CRS_JNI_RESOURCE_CHECK_FAILED2, "Failed to check resource {0} on node {1}"
//  *Cause: An attempt to check the resource on specified node failed.
// *Action: Correct any problems reported in accompanying messages. Make sure that resource is registered with Oracle Clusterware.
/
1126, RES_RELOCATE_FAILED_FROM_NODE, "Failed to relocate resource {0} from node {1}"
//  *Cause: An attempt to relocate the resource from the specified node has failed.
// *Action: Examine the accompanying error messages and respond accordingly.
/
1127, PURGE_PERX_NOT_EXISTS, "Resource {0} does not have attributes {1} on per node basis"
//  *Cause: An attempt to remove given attributes failed because these attributes do not exist on per node basis.
// *Action: Retry after supplying attributes that exist on per node basis.
/
1128, PURGE_NODE_PERX_NOT_EXISTS, "Resource {0} does not have attributes {1} on node {2}"
//  *Cause: An attempt to remove given attributes failed because these attributes do not exist on the given node.
// *Action: Retry after supplying attributes that exist on the node.
/
1129, FAILED_UPGRADE_TYPE, "Failed to upgrade resource type {0}"
//  *Cause: An attempt to upgrade specified resource type failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
1130, FAILED_GET_TYPE_NAME, "Failed to get the name for resource type {0} from resource type enum class"
//  *Cause: An attempt to get the name of the resource type for the given resource type enum class.
// *Action: Ensure that the resource type enum class contains the proper resource type name.
/
1131,CVU_NETWORK_RES_NOT_EXISTS, "CVU resource cannot be created because default network is not configured."
//  *Cause: An attempt was made to create CVU resource without creating the dependent default network resource.
// *Action: Network resource can be created using the command 'srvctl add nodeapps'. Create the network resource and try this command again.
/
1132, CRS_JNI_RESOURCES_STOP_FAILED, "Failed to stop resources using a filter"
//  *Cause: An attempt to stop resources failed because resources were not running or running resources had dependent resources also running.
// *Action:  Check the accompanying messages to identify dependent resources and stop them. Make sure that resources are running before stopping them.
/
1133, DB_AND_SERV_STOP_FAILED, "Failed to stop database {0} and its running services"
//  *Cause: An attempt to stop given database and its running services failed.
// *Action:  Correct any problems reported in accompanying messages.
/
1134, DB_AND_SERV_STOP_ON_NODE_FAILED, "Failed to stop database {0} and its running services on nodes {1}"
//  *Cause: An attempt to stop the given database and its running services failed on the specified nodes.
// *Action:  Correct any problems reported in accompanying messages.
/
1135, NODE_NUM0_CHECK_FAILED, "Failed to check if node with node number 0 exists"
//  *Cause: An attempt failed to determine whether a node numbered 0 exists.
// *Action: Follow action specified for accompanying message.
/
1136, SNAPSHOT_ACTION_REQ, "Action {0} is not allowed for snapshot entities"
//   *Cause: Internal error.
//  *Action: Contact Oracle Support Services.
/
1137, LOCALOBJ_ACTION_REQ, "Action {0} is not allowed for CRS local entities"
//   *Cause: Internal error.
//  *Action: Contact Oracle Support Services.
/
1138, CACHEOBJ_STAT_HOST, "Failed to get cached attributes for entity {0} on node {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1139, SNAPSHOT_NOT_READY_CACHE, "Cache is not ready to generate a snapshot"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1140, SNAPSHOT_WRONG_SEQNUMBER, "Wrong sequence number {0}, expected {1} or more"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1141, LOCALOBJ_ATTR_NOTSET, "Attribute {0} is not set for local entity {1}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1142, SNAPSHOT_BUILD_FAILED, "Failed to build a snapshot"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1143, SNAP_DB_NOT_EXISTS, "Snapshot does not have information about database {0}"
//  *Cause: Internal Error: An attempt was made to operate on a database that does not exist in a snapshot.
// *Action: Contact Oracle Support Services.
/
1144, WHATIF_FAILED, "failed to evaluate the effects of the proposed request on the following entities: {0}"
// *Cause: An error occurred during processing of the proposed request.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1145, WHATIF_RETURNED_ERROR, "The proposed operation being evaluated would result in an error \n{0}"
// *Cause: The effect of the proposed WhatIf request resulted in an error.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/

1146, WRONG_ACTIVE_VERSION, "The cluster active version doesn't allow the requested action"
//  *Cause: CRS failed to perform a request because the cluster upgrade is not completed.
// *Action: Complete the cluster upgrade and retry the request.
/
1147, SNAP_INTERRUPTED, "Snapshot support was interrupted"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1148, CRS_ENT_SERVER_CATEGORY, "server category"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1149, SNAP_INIT_FAILED, "Failed to initialize snapshot subsystem"
//  *Cause: An attempt to initialize snapshot subsystem failed.
// *Action: Check the accompanying messages. Make sure that Oracle Clusterware is active.
/
1150, SNAP_NOT_RUNNING, "Snapshot subsystem was not initialized"
//  *Cause: An attempt was made to create a snapshot but snapshot subsystem is not initialized.
// *Action: Check the accompanying messages. Make sure that Oracle Clusterware is active.
/
1151, SNAP_SERVER_NOT_EXISTS, "Snapshot does not have information about server {0}"
//  *Cause: An attempt was made to operate on a server that does not exist in a snapshot. Either the server name was misspelled or the server has not been registered at the time of snapshot creation.
// *Action: Make sure that the server name spelling is correct. Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1152, CRSCACHE_WRONG_MODE, "Invalid CRS cache mode: {0}"
//  *Cause: CRS cache does not support requested mode.
// *Action: Retry after supplying correct value for CRS Cache mode.
/
1153, SNAP_INTERNAL_ERROR, "Snapshot internal error: {0}"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1154, FILEOUTPUT_CREATION_FAILED_IOERROR, "failed to create file output stream file name with {0} due to an I/O exception ({1})"
//  *Cause: An attempt to create file output failed because of the indicated
//          problem in the underlying I/O system. This is an internal error.
//  *Action: Contact Oracle Support Services.
/
1155, FILEOUTPUT_CREATION_FAILED_SECURITYERROR, "Failed to create file output stream with file name: {0} due to security manager does not allowed to permit the operation"
//  *Cause: An attempt to create file output failed due to security manager does not allowed to permit the operation.
//  *Action: Run as different user or modify the security permissions or controls.
/
1156, FILEOUTPUT_CREATION_FAILED_ILLEGALARGUMENT, "Failed to create file output stream with file name: {0} because 'count' or 'limit' is invalid"
//  *Cause: An attempt to create file output failed because of illegal arguments 'count' < 1 or 'limit' < 0.
//  *Action: Retry with proper arguments 'limit' >= 0 or 'count' >= 1.
/
1157, FILEOUTPUT_CLOSE_FAILED, "Failed to close the file output stream with file name: {0} due to security manager does not allow to close"
//  *Cause: An attempt to create file output failed due to security manager does not permit the operation.
//  *Action: Run as different user or modify the security permissions or controls.
/
1158, DIRECTORY_NOT_EXIST, "Directory {0} in file path does not exist"
//  *Cause: An attempt was made to operate on a directory that does not exist.
//  *Action: Retry with valid directory.
/
1159, FILENAME_EMPTY, "Failed to create file output stream because of empty file name"
//  *Cause: An attempt to create file output stream failed because of empty file name.
//  *Action: Specify valid file name.
/
1160, OUTPUTSTREAM_NOT_EXIST, "Output stream does not exist"
//  *Cause: An attempt was made to operate on an output stream that does not exist.
//  *Action: Contact Oracle Support Services.
/
1161, WRITE_FAILURE, "Failed to write to output stream"
//  *Cause: An attempt to write to an output stream failed.
//  *Action: Check if file system runs out of space otherwise contact Oracle Support Services.
/
1162, FORMAT_FAILURE, "Failed to format a message"
//  *Cause: An attempt to format a log message failed.
//  *Action: Contact Oracle Support Services.
/
1163, OPEN_FAILURE, "Failed to open or create the output stream with file name: {0}"
//  *Cause: An attempt to open or create an output file failed.
//  *Action: Check if file system runs out of space otherwise contact Oracle Support Services.
/
1164, FLUSH_FAILURE, "Failed to flush an output stream"
//  *Cause: An attempt to flush a log output stream failed.
//  *Action: Contact Oracle Support Services.
/
1165, CLOSE_FAILURE, "Failed to close the output stream"
//  *Cause: An attempt to close a log file failed.
//  *Action: Contact Oracle Support Services.
/
1166, GENERIC_FAILURE, "An operation on output stream failed"
//  *Cause: An operation on output stream failed.
//  *Action: Contact Oracle Support Services.
/
1167, CRS_ENT_CONFIG_POLICY, "Configuration Policy"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
1168, CRS_ENT_CONFIG_POLICY_SET, "Configuration Policy Set"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
1169, MISMATCH_BETWEEN_ATTR_NAMES_AND_VALUES, "Mismatch between the number of attribute names ({0}) and the number of the corresponding attribute values ({1})"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1170, RESOURCE_ADD_FAILED, "Failed to add resource {0}"
//  *Cause: An attempt to add the specified resource failed.
// *Action: Examine the accompanying error messages for details.
/
1171, HELPER_INSUFFICIENT_ARGUMENTS, "Insufficient number of arguments while executing \"{0}\""
//  *Cause: An attempt was made to execute the specified script with insufficient number of arguments.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1172, SRVMHELPER_EXECUTION_FAILED, "Failed to execute \"srvmhelper\" for {0}"
//  *Cause: Failed to execute srvmhelper for the specified API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1173, RES_LOOKUP_FAILED_TYPE, "Failed to look up CRS resource for type {0}"
//  *Cause: An attempt to search for resource of the specified type failed.
// *Action: Check that at least one of the specified type exists. Examine the accompanying error messages for details.
/
1174, CRS_RES_NOT_RUNNING_NODE, "Resource {0} is not running on nodes: {1}."
//  *Cause: The specified resource was not started or not running on the specified nodes.
// *Action: Specify nodes on which the resource is running.
/
1175, DEPENDENCY_RES_NOT_EXISTS, "Failed to add ASM Listener \"{0}\" because a dependent resource does not exist."
//  *Cause: During creation of an ASM listener resource, internal updates to associated ASM or IOServer resources could not be made because the resource(s) did not exist.
// *Action: Review the accompanying messages for more details.
/
1176, SOFTWARE_EXCEPTION, "A software exception has occurred."
//  *Cause: An internal exception occurred while attempting to update resource dependencies during creation of an ASM Listener configuration.
// *Action: Contact Oracle Support Services.
/
1177, DEPENDENCY_UPDATE_FAILED, "Failed to update dependency on related resources when adding ASM listener \"{0}\" "
// *Cause: During creation of an ASM listener resource, updates to associated ASM or IOServer resources failed.
// *Action: Review the accompanying messages for more details.
/
1178, EXEC_ROOTCMD_FAILED, "Execution of command failed on one or more nodes"
// *Cause: Execution of a command through the administrator helper resource failed.
// *Action: Examine the accompanying error messages that provide the details of why and where command execution failed . Resolve the reported problem and retry. 
/
1179, GET_NODES_ADMIN_DB_FAILED, "Failed to retrieve nodes suitable for configuring an administrator-managed database"
// *Cause: An attempt to execute the command 'olsnodes -a' has failed.
// *Action: Ensure that the clusterware stack is up. If it is, and the errors reported by olsnodes cannot be resolved, contact Oracle Support Services.
/
1180, NO_RESPONSE, "No response received"
// *Cause: A response was not received while executing the command through the administrator helper resource.
// *Action: Ensure that the node specified is reachable and responsive. If the problem persists, Contact Oracle Support Services.
/
1181, CRS_JNI_RESOURCE_REQUEST_ACTION_FAILED, "Failed to request action {0} on resource {1}"
//  *Cause: An attempt to request the action on the resource failed. 
// *Action:  Make sure that the resource is running. 
/
1182, CRS_JNI_RESOURCE_REQUEST_ACTION_FAILED_ON_NODES, "Failed to request action {0} on resource {1} on nodes {2}"
//  *Cause: An attempt to request the action on the resource failed on the specified nodes. 
// *Action:  Make sure that the resource is running on the specified nodes. 
/
1183, CRS_JNI_RESOURCE_REQUEST_ACTION_FAILED_ON_MULTIPLE_RESOURCES, "Failed to request action {0} on multiple resources"
//  *Cause: An attempt to request the action on multiple resources failed. 
// *Action:  Make sure that the resources are running. 
/
1184, CRS_JNI_RESOURCE_REQUEST_ACTION_CALLBACK_ERROR, "Response from the resource on which the action was requested was not in the correct format"
//  *Cause: An internal error occurred. The callback message for the requested action was not in the correct format during an attempt to request the action.
// *Action:  Contact Oracle Support Services.
/
1185, SRVMHELPER_EXECUTION_FAILED_EXCEPTION, "failed to execute \"srvmhelper\" for command \"{0}\" with the following errors:\n{1}"
//  *Cause: An attempt to execute the command has failed.
// *Action: Examine the accompanying error messages that provide the details of why and where command execution failed. 
//          Resolve the reported problem and retry.
/
1186, CRS_JNI_RESOURCE_REQUEST_ACTION_MULTIPLE_FINAL_MSGS, "Multiple final messages for the requested action were received for node {0}"
//  *Cause: An internal error occurred. Multiple final messages for the requested action were received during an attempt to request the action.
// *Action:  Contact Oracle Support Services.
/
1187, CRS_JNI_RESOURCE_REQUEST_ACTION_NO_FINAL_MSG, "No final message for the requested action was received."
//  *Cause: An internal error occurred. No final message for the requested action was received during an attempt to request the action.
// *Action:  Contact Oracle Support Services.
/
1188, CRS_JNI_RESOURCE_REQUEST_ACTION_NO_RES_AVAIL, "The requested action cannot be executed because there is no resource instance."
//  *Cause: The resource has no instance on the specified nodes or, if nodes were not specified, in the cluster.
// *Action: Make sure that at least one resource instance exists on the specified nodes or, if nodes were not specified, in the cluster.
/
1189, INSUFFICIENT_USER_PRIVILEGE_ERROR_ON_ACFS, "The user {1} does not have read and execute permissions for the ACFS file system resource associated with path {0}."
//  *Cause: A check on the permissions for the ACFS file system resource associated with the indicated path failed because the user indicated in the message did not have read and execute permissions for the resource. 
//  *Action: Verify that the specified user has read and execute permissions on the ACFS file system resource using 'srvctl config filesystem'. To change permissions use 'srvctl modify filesystem'.
/
1190, GNS_VIPNAME_ERROR, "The specified VIP name {0} resolves to multiple {1} addresses." 
//  *Cause: The specified VIP name did not resolve to a single IPv4 or IPv6 address. 
// *Action: Specify a numeric GNS VIP address or ensure that the specifed VIP name resolves to a single IPv4 or IPv6 address. Use 'nslookup <vipname>' to display the addresses to which the VIP name resolves.
/
1191, CRS_NO_RES_RUNNING_ON_NODE, "The stop request failed because the resource is not running on nodes {0}."
//  *Cause: A request to stop a resource was rejected because the resource did not have a running instance on the specified nodes.
// *Action: Specify nodes where the resource is running.
/
1192, RES_NOT_HOSTED_BY_SRVPOOL, "Resource {0} is not hosted by server pool {1}."
//  *Cause: An attempt to start or stop the specified resource on the specified server pool failed because the resource is not hosted by the server pool.
// *Action: Specify a server pool on which the resource is hosted and retry.
/
1193, RES_ALREADY_ENABLED_PERX, "The specified instance on cardinality ID {0} of resource {1} is already enabled."
//  *Cause: An attempt to enable the specified resource instance was rejected because the resource instance was already enabled.
// *Action: None
/
1194, RES_ALREADY_DISABLED_PERX, "The specified instance on cardinality ID {0} of resource {1} is already disabled."
//  *Cause: An attempt to disable the specified resource instance was rejected because the resource instance was already disabled.
// *Action: No action is needed.
/
1195, PURGE_CARDINALITY_PERX_NOT_EXISTS, "Resource {0} does not have attributes {1} on cardinality ID {2}."
//  *Cause: An attempt to remove the specified attributes failed because these attributes did not exist on the specified cardinality.
// *Action: Retry after specifying attributes that exist on the cardinality ID.
/
1196, RES_ALREADY_ENABLED_ALL_PERX, "The specified instances of resource {0} are already enabled."
//  *Cause: An attempt to enable the resource instances was rejected because the resource instances were already enabled.
// *Action: No action is needed.
/
1197, RES_ALREADY_DISABLED_ALL_PERX, "The specified instances of resource {0} are already disabled."
//  *Cause: An attempt to disable the resource instances was rejected because the resource instances were already disabled.
// *Action: No action is needed.
/
1198, CRS_JNI_RESOURCES_RELOCATE_FAILED, "failed to relocate resources using a filter"
// *Cause: An attempt to relocate resources using the filter shown in the message failed.
// *Action: Respond based on the accompanying exception message.
/
1199, EXECUTION_TIMEDOUT_EXCEPTION, "timed out waiting for the spawned process to complete"
//  *Cause: An attempt to move the Oracle Grid Infrastructure home failed because the detached process timed out. The accompanying error messages provide details of the error.
// *Action: Examine the accompanying error messages that provide the details of why and where the command execution failed. Resolve the reported problem and retry.
/
1200, EXECUTION_FAILED_EXCEPTION, "failed to execute the detached process"
//  *Cause: An attempt to move the Oracle Grid Infrastructure home failed because the detached process failed with an error. The accompanying error messages provide details of the error.
// *Action: Examine the accompanying error messages that provide the details of why and where the command execution failed. Resolve the reported problem and retry.
/
1201, NO_CLUSTER, "The specified node \"{0}\" is not part of a cluster."
// *Cause: An attempt to obtain the Oracle Grid Infrastructure home was rejected because the specified node was not part of the cluster.
// *Action: Reissue the command by specifying a node that is part of a version 11.2.0.4 Oracle Grid Infrastructure cluster.
/
1202, INVALID_CSS_CRITICAL_OPT, "Value \"{0}\" is invalid for the CSS_CRITICAL resource attribute."
//  *Cause: An attempt was made to set a value other than 'yes' or 'no' for the CSS_CRITICAL resource attribute. The indicated resource attribute can be set to either 'yes' or 'no' only.
// *Action: Specify a valid value and retry.
/
1203, SRVMHELPER_COPYDIR_FAILED, "failed to copy the directory contents for directory \"{0}\""
// *Cause: An attempt to copy the directory contents for the specified directory failed.
//*Action: Examine the accompanying error messages and address the issues as described.
/
1204, SRVMHELPER_EXEC_FAILED_DETAILS, "Failed to execute \"srvmhelper\" binary on node \"{0}\". Detailed error:\n{1}"
// *Cause: An attempt to execute srvmhelper failed on the specified node.
//*Action: Examine the accompanying error details and address the issues as described.
/
1205, SRVMHELPER_EXEC_FAILED, "failed to execute \"srvmhelper\" binary on node \"{0}\""
// *Cause: An attempt to execute srvmhelper failed on the specified node.
//*Action: Examine the accompanying error messages and address the issues as described.
/
1206, SRVMHELPER_COPYDIR_INVALID, "failed to copy the directory contents for directory \"{0}\" because it is the same as the destination directory and the local node \"{1}\" was included in the list of nodes where the copy has to occur"
// *Cause: An attempt to copy the directory contents was rejected because the destination directory path and source directory path were the same and the local node was part of the list of nodes where the copy had to occur.
//*Action: Retry the operation after removing the local node from the list of remote nodes where the copy has to occur.
/
1207, RESOURCES_ALREADY_STOPPED, "The resources were already stopped."
//   *Cause: An attempt to stop the resources failed because they were already stopped. For detailed information about the resources, review the accompanying error messages.
//  *Action: None.
/
1208, EMPTY_FILE, "File \"{0}\" on node \"{1}\" was empty."
//  *Cause: The indicated file, which was expected to contain information about
//          the Cluster Ready Services (CRS) configuration, was empty. This
//          is an internal error.
// *Action: Contact Oracle Support Services.
/
1209, FAILED_UPGRADE_DEPENDENCIES, "failed to upgrade the dependencies for resource {0}"
//  *Cause: An attempt to upgrade the dependencies for the specified resource failed. Accompanying error messages provide detailed error information.
// *Action: Examine the accompanying error messages and respond accordingly.
/
1210, CRS_ENT_RESOURCEGROUP, "resourcegroup"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1211, CRS_ENT_RESOURCEGROUP_TYPE, "resourcegroup type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1212, CRS_ENT_RESOURCEGROUP_INSTANCE, "resourcegroup instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1213, RESGRP_NOT_EXISTS, "Resource group {0} does not exist."
//  *Cause: An attempt was made to operate on a resource group that did not 
//          exist.
// *Action: Check the resource group using the command 'srvctl config <object>'
//          and if the resource group does not exist, then create it using the
//          command 'srvctl add <object>'.
/
1214, CRS_JNI_RESGRP_STOP_FAILED, "failed to stop resource group {0}"
//  *Cause: An attempt to stop the indicated resource group failed because 
//          the resource group was not running or the resource group was 
//          running and had dependent resource groups also running. 
// *Action: Check the accompanying messages to identify dependent resource 
//          groups and stop them before retrying or retry using the '-force'
//          option. Ensure that the resource group is running before
//          attempting to stop it. 
/
1215, RESGRP_ALREADY_STOPPED, "The resource group was not running."
//   *Cause: An attempt to stop a resource group was rejected because the group
//           was not running. For detailed information about the resource 
//           group, review the accompanying error messages.
//  *Action: None.
/
1216, CRS_NO_RESGRP_RUNNING_ON_NODE, "The stop request failed because the resource group is not running on nodes {0}."
//  *Cause: A request to stop a resource group was rejected because the 
//          resource group did not have a running instance on the specified 
//          nodes.
// *Action: Specify nodes where the resource group is running.
/
1217, RESGRP_RELOCATE_FAILED, "Failed to relocate resource group {0}"
//  *Cause: An attempt to relocate the specified resource group failed.
// *Action: Examine the accompanying error messages, resolve the reported 
//          problems and retry the command.
/
1218, RESGRP_RELOCATE_FAILED_FROM_NODE, "Failed to relocate resource group {0} from node {1}"
//  *Cause: An attempt to relocate the resource group from the specified node 
//          failed.
// *Action: Examine the accompanying error messages, resolve the reported 
//          problems and respond accordingly.
/
1219, RESGRP_RELOCATE_FAILED_NODE_NODE, "Failed to relocate resource group {0} from node {1} to node {2}"
//  *Cause: An attempt to relocate the resource group from the specified node 
//          to another failed.
// *Action: Examine the accompanying error messages, resolve the reported 
//          problems and respond accordingly.
/
1220, RESGRP_RELOCATE_FAILED_NODE, "Failed to relocate resource group {0} to node {1}"
//  *Cause: An attempt to relocate the resource group to the specified node
//          failed.
// *Action: Examine the accompanying error messages, resolve the reported 
//          problems and respond accordingly.
/
