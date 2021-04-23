// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCsMsg.msg
//
// DESCRIPTION
//    Message file related to server, serverpool and scan resources.
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     lmortime    04/18/18 - Bug 27883625 - CDP expansion rename
//     rakebhat    04/03/18 - fix bug 26713733
//     pevilla     02/22/18 - Fix bug 26437166, validate clustername on client
//     pevilla     02/15/18 - Fix bug 26475784, add msgs for invited subnets
//     pevilla     01/16/18 - ER 26094690, add GNS cluster management error msgs
//     kfgriffi    12/04/17 - Update CDP modify error message
//     kfgriffi    07/28/17 - Add modify cdp message
//     kfgriffi    05/18/17 - Fix bug 25965220 - make sure CDP is stopped
//                            before remove
//     kfgriffi    04/28/17 - Fix bug 25577936 - Add cdp proxy messages
//     ccharits    04/25/17 - Added messages for TFA
//     kfgriffi    03/17/17 - Fix bug 25471348 - fix messages
//     ccharits    02/14/17 - Added message CDP_NOT_EXISTS
//     kfgriffi    01/23/17 - Project 67726 - Add CDP messages
//     maboddu     11/28/16 - Fix bug#25138709 - correct message
//                            GNS_FQDN_UNRESOLVED
//     pevilla     11/23/16 - Add messages for Shared SCAN
//     pevilla     11/16/16 - Add GNS VIP error messages
//     kfgriffi    09/20/16 - Bug 23102210 Add support for hubsvc
//     pevilla     06/22/16 - Fix bug 23524327, add reachability errors for
//                            SCAN
//     alcerda     05/02/16 - fix bug 23135904
//     xesquive    04/06/16 - Fix bug23001457 improve msg 1121 and 1122
//     yizhang     03/17/16 - fix bug 22861836
//     epineda     12/15/15 - Bugfix 22348719,22348871,22348735
//     epineda     11/16/15 - Reader farm support
//     epineda     09/01/15 - Bugfix 21624720
//     yizhang     08/19/15 - fix bug 21632406
//     xesquive    07/27/15 - Fix bug21314542 check for iptype
//     pevilla     03/24/15 - Project 47157, HA GNS
//     ksviswan    05/16/14 - XbranchMerge ksviswan_bug-18707931 from
//                            st_has_12.1
//     ksviswan    05/12/14 - Name Change.
//     satg        12/17/13 - Fix bug 14183829
//     xesquive    11/20/13 - resolve gnsvip to a unique ip bug17822470
//     lureyes     10/18/13 - Fix bug 17578221
//     lureyes     08/16/13 - Fix bug 17289609
//     rtamezd     07/19/13 - Fix bug 16866171
//     vobulapu    06/12/13 - Fix bug 16842872
//     ccharits    04/25/13 - Added message SCAN_VIP_ADDRESS_DOES_NOT_BELONG_TO_NETWORK
//     lureyes     03/21/13 - Change UNASSIGNED_SERVER id number
//     ocordova    01/03/13 - Fix Bug 14492484
//     mpradeep    12/19/12 - 13798847 - Support multiple scan ports
//     vobulapu    11/26/12 - Fix bug 15866259
//     ccharits    11/16/12 - Added message
//                            MODIFY_SCANNAME_NOT_ALLOWED_IN_DYNAMIC_NETTYPE
//     satg        11/14/12 - Fix bug 14730028
//     ccharits    11/08/12 - Added message SCAN_NAME_DOES_NOT_RESOLVE_TO_BOTH
//     pevilla     10/29/12 - Fix bug 13968141
//     smadabhu    10/26/12 - Fix build failure due to message changes in txn
//                            smadabhu_bug-14266148
//     smadabhu    09/27/12 - Bug 14266148
//     rtamezd     09/11/12 - Fix bug 14115195
//     vobulapu    08/26/12 - Fix bug 14408740
//     smadabhu    08/07/12 - Bugs 14225450,14116904,14333630
//     yizhang     08/03/12 - Define PQ_SERVICE_REQUIRE_RIM_POOL
//     ccharits    08/02/12 - Added message SCAN_VIPS_NOT_FOUND_ON_NETWORK
//     sravindh    07/20/12 - Fix format
//     smadabhu    06/12/12 - Add SERVERS_CATEGORY_CONFLICT
//     yizhang     06/06/12 - fix bug 14161786
//     yizhang     06/06/12 - Add message SERVERPOOL_MISSING_CATEGORY and
//                            PRIMARY_SERVICE_REQUIRE_HUB_POOL
//     yizhang     06/01/12 - Define SC_GET_FAILED
//     vobulapu    05/16/12 - Fix bug 14078421
//     xesquive    05/08/12 - Fix bug 12901704
//     ccharits    03/27/12 - Added message
//                            SCAN_NAME_RESOLVES_TO_NON_EXISTING_ADDRESS_TYPE
//     vobulapu    03/12/12 - Fix bug 13615796
//     ksrangal    02/27/12 - Fix bug 13538789
//     xesquive    02/07/12 - Bug fix 13566257
//     ccharits    06/15/11 - Added message IPV4_IPV6_SIZE_MISMATCH
//     yizhang     06/03/11 - define INVALID_BUILTIN_CATEGORY
//     vobulapu    05/20/11 - Added message SET_INVITEDNODES_FAILED
//     ccharits    07/14/10 - Added message INVALID_TRACE_LEVEL
//     yizhang     05/03/10 - Add SCAN_VIP_DIF_SUBNET
//     ccharits    03/29/10 - Fixed bug 9503512
//     spavan      03/17/10 - fix bug9405859
//     rxkumar     01/26/10 - update SPNAME_CREATE_FAILED
//     rxkumar     01/12/10 - fix bug7700844
//     spavan      11/09/09 - fix bug8981021 - add messages for GNSUtils
//     rxkumar     10/19/09 - add SERVER_NOT_EXISTS
//     agridnev    10/02/09 - added SP_GET_ONLINE_DB_INSTS_FAILED
//     yizhang     08/24/09 - fix bug 8603920
//     yizhang     06/04/09 - Add Action and Cause for messages
//     yizhang     05/26/09 - fix messages
//     agridnev    06/03/09 - fixed EVAL_SRVGRP_CREATION_FAILED message
//     agridnev    05/28/09 - added message for evaluateServerGroupCreation
//     yizhang     04/30/09 - fix bugs to delete unwanted trailing characters
//     yizhang     04/27/09 - fix bug 8448135
//     yizhang     04/22/09 - fix bugs for unwanted trailing characters
//     rwessman    03/13/09 - Added GNS_NOT_EXIST.
//     rxkumar     01/16/09 - fix bug7674918
//     agridnev    01/02/09 - performed review based changes
//     rxkumar     12/31/08 - fix bug7677051
//     agridnev    12/23/08 - added message for evaluateServerPoolCreation()
//     rxkumar     11/05/08 - fix bug-7534439
//     rxkumar     10/10/08 - add SP_GET_RUNNING_DB_INSTS_FAILED, ER bug-7520072
//     rxkumar     09/15/08 - fix bug7394683
//     rxkumar     08/27/08 - add RELOCATE_SERVERS_FAILED, bug7356633
//     rxkumar     08/04/08 - add SP_GET_CHILDREN_FAILED
//     rwessman    08/08/08 - 
//     rxkumar     07/22/08 - fix bug7142054: sg->sp
//     rwessman    06/20/08 - Added GNS internal errors.
//     yizhang     04/25/08 - Add SCAN_VIP_ALREADY_CREATED, remove
//                            SCAN_NAME_MISMATCH, SCAN_VIP_NET_MISMATCH,
//                            SCAN_VIP_NUM_MISMATCH
//     rxkumar     04/17/08 - move out msgs to PrCcMsg
//     spavan      04/10/08 - Fix cause/action field
//     yizhang     03/21/08 - Define SCAN_LSNR_ONE_TCP_PORT
//     rxkumar     03/25/08 - add ServerPool & ServerGroup specific msgs
//     rxkumar     03/19/08 - add NO_CRS_ADMIN_ROLE
//     rxkumar     03/18/08 - add SG_NOT_HOST_DB
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCsMsg.java
//     rwessman    03/21/08 - Added GNS messages.
//     yizhang     03/04/08 - Change INVALID_SG_TYPE to INVALID_BUILTIN_SG
//     yizhang     02/26/08 - Fix bug 6834900
//     rxkumar     02/06/08 - add SVIP_FOR_SLSNR_NOT_FOUND
//     rxkumar     02/04/08 - add SCAN_LSNR_MODIFY_FAILED
//     yizhang     01/10/08 - Add SCAN_MODIFY_FAILED
//     yizhang     12/24/07 - Add SCAN_LSNR_NAME_MISMATCH, SCAN_LSNR_PORT_MISMATCH
//     rxkumar     12/13/07 - use SCAN
//     sowong      11/15/07 - add SP_NOT_EXISTS_CLUSTER
//     yizhang     10/19/07 - Add messages for SCAN VIP and SCAN Listener
//     rxkumar     04/12/07 - msgs for bug5981762
//     rxkumar     02/13/07 - add SP_LOOKUP_FAILED
//     rxkumar     12/26/06 - add SCAN msgs
//     rxkumar     12/11/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
1000, GET_ENABLED_FAILED, "Failed to get enabled status of {0}"
//  *Cause: An attempt to check whether a server is enabled failed.
// *Action: Examine the accompanying error messages for details.
/
1001, ENABLE_FAILED, "Failed to enable {0}"
//  *Cause: An attempt to enable the specified server failed.
// *Action: Examine the accompanying error messages for details.
/
1002, DISABLE_FAILED, "Failed to disable {0}"
//  *Cause: An attempt to disable the specified server failed.
// *Action: Examine the accompanying error messages for details.
/
1005, SVR_CREATE_FAILED, "Failed to create server {0} "
//  *Cause: An attempt to create the specified server failed.
// *Action: Examine the accompanying error messages for details.
/
1006, SVR_GET_FAILED, "Failed to get server for node {0} "
//  *Cause: An attempt to get server for the specified node failed.
// *Action: Examine the accompanying error messages for details.
/
1007, SP_ALREADY_EXISTS, "Server pool {0} already exists"
//  *Cause: The specified server pool already exists.
// *Action: Examine the accompanying error messages for details.
/
1008, SP_NOT_EXISTS, "Server pool {0} does not exist"
//  *Cause: The specified server pool does not exist.
// *Action: Use the srvctl command to create server pool.
/
1009, SP_CREATE_FAILED, "Failed to create server pool {0} "
//  *Cause: An attempt to create specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1010, SP_GET_FAILED, "Failed to get {0} of server pool {1}"
//  *Cause: An attempt to get the attribute value of the specified server pool failed. 
// *Action: Examine the accompanying error messages for details.
/
1011, SP_MODIFY_FAILED, "Failed to modify server pool {0}"
//  *Cause: An attempt to modify the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1012, SP_REMOVE_FAILED, "Failed to remove server pool {0}"
//  *Cause: Failed to unregister server pool. This message is followed by the reason for failure.
// *Action: Retry after resolving the issue reported in the failure message.
/
1013, SP_LOOKUP_FAILED, "Failed to look up server pool {0}"
//  *Cause: An attempt to get the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1014, SERVER_EXISTS_IN_SP, "Server {0} is already part of server pool {1}"
//  *Cause: An attempt to add the server as a candidate for the specified server pool failed because the server is already in the pool's SERVER_NAME attribute.
// *Action: No action is needed.
/
1015, SERVER_NOT_EXISTS_IN_SP, "Server {0} is not part of server pool {1}"
//  *Cause: An attempt to remove the server from the SERVER_NAMES attribute of the server pool failed because the specified server is not in the pool's SERVER_NAME attribute.
// *Action: Add the server to the server pool.
/
1016, SCAN_LOOKUP_FAILED, "Failed to resolve Single Client Access Name {0}"
//  *Cause: An attempt to resolve specified Single Client Access Name to a list of IP addresses failed because Single Client Access Name could not be resolved in DNS using nslookup or using other lookup methods.
// *Action: Check whether the specified Single Client Access Name is correct. Review the underlying error messages that provide the details of which resource failed to resolve. Check the cause and action for the individual error. If Single Client Access Name should be resolved in DNS, check the configuration of Single Client Access Name in DNS.
/
1017, SCAN_CREATE_FAILED, "Failed to configure Single Client Access Name {0}"
//  *Cause: An attempt to add cluster configuration for Single Client Access Name failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to create. Check the cause and action for the individual resource creation failure.
/
1018, SCAN_LSNR_CREATE_FAILED, "Failed to add cluster configuration for Single Client Access Name listener {0}"
//  *Cause: An attempt to configure Single Client Access Name listener failed because endpoints were not specified correctly or other reasons. 
// *Action: Review the underlying error messages that provide the details of which resources failed to create. Check the cause and action for the individual resource creation failure. If the endpoints were not specified correctly, correct endpoints. 
/
1019, SCAN_LSNR_REMOVE_FAILED, "Failed to remove the configuration for Single Client Access Name listener {0}"
//  *Cause: An attempt to remove the configuration of Single Client Access Name listener failed because other resources depended on it or other reasons.
// *Action: Review the underlying error messages that provide the details of which resources failed to remove. Stop Single Client Access Name listener resource before removing it. Can consider using force flag to remove Single Client Access Name listener resources if no other resources depend on it.
/
1020, SCAN_ENABLE_FAILED, "Failed to enable Single Client Access Name resources {0}"
//  *Cause: An attempt to enable Single Client Access Name resources failed.
// *Action: Review the underlying error messages that provide the details of which resources failed to enable. Check the cause and action for the individual resource creation failure.
/
1021, SCAN_DISABLE_FAILED, "Failed to disable Single Client Access Name resources {0}"
//  *Cause: An attempt to disable Single Client Access Name resources failed because current user did not have sufficient privileges to perform this operation or other reasons.
// *Action: Review the underlying error messages that provide the details of which resources failed to disable. Check the cause and action for the individual resource failure. Make sure that the user has root privileges on Linux/Unix's and Administrator on Windows.
/
1022, SCAN_START_FAILED, "Failed to start Single Client Access Name resources {0}"
//  *Cause: An attempt to start Single Client Access Name resources failed.
// *Action: Review the underlying error messages that provides the details of which resources failed to start. 
/
1023, SCAN_STOP_FAILED, "Failed to stop Single Client Access Name resources {0}"
//  *Cause: An attempt to stop Single Client Access Name resources failed because Single Client Access Name listeners were not stopped/relocated or other reasons.
// *Action: Review the underlying error messages that provides the details of which resources failed to stop. Check the cause and action for the individual resource creation failure. Stop Single Client Access Name listeners first or use force flag to stop Single Client Access Name Virtual Internet Protocol(VIP) resources if no other resources depend on them.
/
1024, SCAN_REMOVE_FAILED, "Failed to remove Single Client Access Name Virtual Internet Protocol(VIP) resources {0}"
//  *Cause: Could not remove Single Client Access Name Virtual Internet Protocol(VIP) resources because the resources are running or Single Client Access Name listeners depend on or other reasons.
// *Action: Review the underlying error messages that provides the details of which resources failed to remove. Stop the Single Client Access Name VIPs and Single Client Access Name listeners, then remove Single Client Access Name listeners. Or use force flag to remove Single Client Access Name Virtual Internet Protocol(VIP) resources if no other resources depend on them.
/
1025, SCAN_VIPS_NOT_FOUND, "Could not find any Single Client Access Name (SCAN) Virtual Internet Protocol (VIP) resources using filter {0}"
//  *Cause: An attempt to retrieve the SCAN VIP resources failed.
// *Action: Ensure that the resource name supplied is correct. Examine the accompanying error messages for additional details.
/
1026, SCAN_LSNRS_NOT_FOUND, "Could not find any Single Client Access Name (SCAN) listener resources using filter {0}"
//  *Cause: An attempt to retrieve the SCAN listener resources failed.
// *Action: Ensure that the resource name supplied is correct. Examine the accompanying error messages for additional details. 
/
1027, SCAN_LSNR_NOT_FOUND, "Could not find any Single Client Access Name listener with ordinal number {0}"
//  *Cause: Could not find the Single Client Access Name listener for specified ordinal number.
// *Action: Use the command 'srvctl config scan_listener' to check available ordinal number.  
/
1028, SCAN_LSNR_ALREADY_CREATED, "Single Client Access Name (SCAN) listener resources already exist on network {0}"
//  *Cause: Single Client Access Name listeners were already created on the specified network.
// *Action: Use the command 'srvctl modify scan_listener' to modify attributes if needed.
/
1031, SCAN_LSNR_MODIFY_FAILED, "Failed to modify Single Client Access Name listeners using endpoints {0}"
//  *Cause: An attempt to modify Single Client Access Name listeners failed.
// *Action: Check if the endpoints specified are valid.
/
1032, NO_SP_FOUND, "No server pool was found that matches the query {0}"
//  *Cause: An attempt to find server pools that match the given query found no matching server pool. 
// *Action: Either configure a server pool via the command 'srvctl add srvpool' or modify existing a server pool via the command 'srvctl modify srvpool' to match the query and retry the request.
/
1034, SCAN_MODIFY_FAILED, "Failed to modify Single Client Access Name {0}"
//  *Cause: Failed to modify the configuration of Single Client Access Name because the endpoints were not specified correctly or extra Single Client Access Name VIPs could not be removed or other reasons. 
// *Action: Review the underlying error messages that provides the details of which resources failed to modify. Resolve the reported problem and retry. If to modify the endpoints, specify correct endpoints. If to update the number of Single Client Access Name VIPs, stop the Single Client Access Name listeners that depend on.
/
1035, SCAN_LSNR_ONE_TCP_PORT, "Invalid number of TCP ports ({0}) for SCAN Listener"
//  *Cause: Either no port was specified, or more than one port was specified.
// *Action: Specify only one port number for TCP protocol for SCAN listener.
/
1037, SCAN_VIP_ALREADY_CREATED, "Single Client Access Name (SCAN) Virtual Internet Protocol (VIP) resources already exist on network {0}"
//  *Cause: An attempt was made to add SCAN VIPs when SCAN VIPs were already configured. Only one SCAN per cluster network can be configured.
// *Action: Remove the existing SCAN on the given network and add a new SCAN. Or, modify the SCAN to use a new SCAN name or have the existing SCAN name map to different SCAN VIPs.
/
1038, SVIP_FOR_SLSNR_NOT_FOUND, "Failed to find Single Client Access Name Virtual Internet Protocol(VIP) associated with listener {0}"
//  *Cause: Cannot find Single Client Access Name Virtual Internet Protocol(VIP) associated with the given listener. 
// *Action: Examine the accompanying error messages to determine how to respond.
/
1039, SLSNR_FOR_SVIP_NOT_FOUND, "Failed to find Single Client Access Name listener associated with the given Virtual Internet Protocol(VIP) {0}"
//  *Cause: Cannot find Single Client Access Name listener associated with the given Virtual Internet Protocol(VIP).
// *Action: Examine the accompanying error messages to determine how to respond.
1040, NO_CRS_ADMIN_ROLE, "User {0} does not have CRS administrator role"
//  *Cause: The specified user did not have CRS administrator role.
// *Action: Grant CRS administrator role to the user by using the command 'crsctl add crs administrator -u <user_name>' and retry.
/
1041, INVALID_BUILTIN_SP, "Invalid builtin server pool name {0}"
//  *Cause: The specified builtin server pool name is invalid.
// *Action: Provide a valid builtin server pool name. It can be Generic or Free.
/
1042, SP_NOT_HOSTING_DB, "Server pool {0} is not hosting any database currently"
// *Cause: A database could not be found referencing the given server pool. 
// *Action: Create the database configuration using the command 'srvctl add database ... -serverpool <server_pool>' and retry.
/
1043, SP_NOT_HOSTING_SVC, "Server pool {0} is not hosting any database service currently"
// *Cause: A service could not be found referencing the given server pool. 
// *Action: Create the service configuration using the command 'srvctl add service ... -serverpool <server_pool>' and retry.
/
1046, INVALID_NAME, "Name {0} is not valid"
// *Cause: Specified name was not valid.
// *Action: Specify a valid string name, and retry.
/
1047, INVALID_MIN_SIZE, "Minimum size of {0} is not valid"
// *Cause: Specified minimum size was not valid.
// *Action: Specify minimum size to be an integer equal to or greater than zero and less than the maximum size (other than -1), and retry.
/
1048, INVALID_MAX_SIZE, "Maximum size of {0} is not valid"
// *Cause: Specified maximum size was not valid.
// *Action: Specify maximum size to be an integer greater than or equal to -1 and retry.
/
1049, INVALID_IMPORTANCE, "Importance of {0} is not valid"
// *Cause: Specified importance was not valid.
// *Action: Specify importance value to be an integer greater than or equal to 0 and retry.
/
1050, GNS_VIP_NAME_MISMATCH, "Could not add GNS VIP {0} because another one with name {1} already exists"
//  *Cause: The name of the GNS VIP to be added matches one that already existed.
// *Action: Specify another name.
/
1051, GNS_VIP_NET_MISMATCH, "Could not add GNS VIP using network {0} because registered another one using network {1} already exists"
//  *Cause: The network specified for the GNS VIP to be added matches one that already existed.
// *Action: Specify another network.
/
1053, GNS_LOOKUP_FAILED, "failed to resolve address for Grid Naming Service VIP {0}:\n{1}"
//  *Cause: The address specified for the GNS VIP could not be resolved.
// *Action: Specify a valid address.
/
1054, GNS_CREATE_FAILED, "Failed to configure VIP for Grid Naming Service VIP {0}"
//  *Cause: The creation of the GNS VIP failed.
// *Action: Examine the accompanying error message for details.
/
1055, GNS_MODIFY_FAILED, "Failed to modify Grid Naming Service VIP {0}"
//  *Cause: The modification of the GNS VIP failed.
// *Action: Examine the accompanying error message for details.
/
1056, GNS_VIP_NOT_FOUND, "Could not find resources for Grid Naming Service Virtual Internet Protocol(VIP) {0}"
//  *Cause: The specified GNS VIP did not exist.
// *Action: Specify a valid GNS VIP name.
/
1057, GNS_INTERNAL_ERROR_NO_ATTRIBUTES, "INTERNAL ERROR: no attributes specified."
// *Cause: No attributes to modify GNS with were passed to a method.
// *Action: This is an internal error. Please contact Oracle Customer Support.
/
1058, GNS_INTERNAL_ERROR_BAD_QUERY_TYPE, "INTERNAL ERROR: unsupported query type: \"${0}\""
// *Cause: The type of query to be made to GNS is unrecognized.
// *Action: This is an internal error and should not be visible. Please contact
//          Oracle Customer Support.
/
1059, SP_GET_CHILDREN_FAILED, "Failed to get sub-server pools of server pool {0}"
//  *Cause: Failed to look up PARENT_POOLS attribute of server pools containing the given server pool name. Ensure that current user has read permissions on the given server pool and its sub-server pools.
// *Action: Grant read permissions on the given server pool and its sub-server pools.
/
1060, SP_RELOCATE_SERVERS_FAILED, "Failed to relocate servers {0} into server pool {1}"
//  *Cause:  Failed to relocate servers into the given server pool. This message may be accompanied by others providing additional details. A likely cause is violation of defined configuration attributes such as pool MIN_SIZE, SERVER_NAMES etc.
// *Action: If the problem stems from violating configuration attributes, either modify the attributes or reformulate the request. Otherwise, contact Oracle Support Services. 
/
/
1061, SP_GET_RUNNING_DB_INSTS_FAILED, "Failed to find running database instances hosted by server pool {0}"
//  *Cause:  Failed to find running database instances hosted by the servers in the given server pool. This message is accompanied by others providing additional details. A likely cause is that current user may not have permissions to query profiles of databases hosted by the given server pool. 
// *Action: If lack of permissions is the cause of this failure, then use the command 'srvctl config <object> -a' to find the current owner of entity and retry the query as that owner user. Otherwise, contact Oracle Support Services. 
/
1062, IS_SP_CHECK_FAILED, "Failed to determine whether server pool {0} has any parents or children"
//  *Cause:  Failed to find parents or children of the given server pool. A likely cause is that current user may not have permissions to query profile of given server pool or profiles of other server pools whose PARENT_POOLS attribute contains this server pool name.
// *Action: If lack of permissions is the cause of this failure, then use the command 'srvctl config serverpool <serverpool> -a' to find the current owner of the server pool and retry the query as that owner user. Otherwise, contact Oracle Support Services. 
/
1063, EVAL_SRVPOOL_CREATION_FAILED, "Server pool {0} with minimum size {1}, maximum size {2}, importance {3} and server list ({4}) can not be created"
//  *Cause: Specified server pool cannot be created because of the reason provided by an accompanying exception message.
// *Action: Respond based on the accompanying exception message.
/
1064, SP_LOOKUP_VIA_FILTER_FAILED, "Failed to find server pools using filter {0}"
//  *Cause: Attempt to look up server pool entitites using given filter failed. A likely cause is that current user does not have permissions to query server pool entities
// *Action: If lack of permissions is the cause of this failure, then use the command 'srvctl config serverpool -a' to find the current owner of the server pools and retry the query as that owner user. Otherwise, contact Oracle Support Services.
/
1065, GNS_NOT_EXIST, "GNS server is not configured in this cluster."
// *Cause: A command that applies only to a GNS server cluster was rejected because this cluster has not been configured as a GNS server.
// *Action: If GNS server is to run in this cluster, use the 'srvctl add gns' command to configure it.
/
1066, EVAL_SRVGRP_CREATION_FAILED, "Server group {0} with  server list ({1}) can not be created"
//  *Cause: Specified server group cannot be created because of the reason provided by an accompanying exception message.
// *Action: Respond based on the accompanying exception message.
/
1067, SP_GET_ONLINE_DB_INSTS_FAILED, "Failed to find online database instances hosted by server pool {0}"
//  *Cause:  Failed to find online database instances hosted by the servers in the given server pool. This message is accompanied by others providing additional details. A likely cause is that current user may not have permissions to query profiles of databases hosted by the given server pool.
// *Action: If lack of permissions is the cause of this failure, then use the command 'srvctl config <object> -a' to find the current owner of the entity and retry the query as that owner user. Otherwise, contact Oracle Support Services.
/
1068, SERVER_NOT_EXISTS, "Oracle Clusterware server entity for node {0} does not exist"
// *Cause: The server entity for the specified node does not exist.
// *Action: Start Oracle Clusterware on the given node and retry.
/
1069, GNS_DOMAIN_NAME_CHECK_FAILED, "Label {0} in GNS domain name {1} does not follow RFC-1035 convention"
//  *Cause: The specified portion of the GNS domain name does not follow RFC-1035 label conventions.
// *Action: Specify a domain name that follows RFC-1035 conventions. According to RFC-1035 conventions, the domain name consists of a set of labels separated by ".". A label must begin with an alphabetic character and can contain only alphanumerics and "-" (dash or minus character), end with an alphanumeric, and be no more than 63 characters long.
/
1070, GNS_DOMAIN_LABEL_TOO_LONG, "Label {0} part of GNS domain name {1} is too long"
//  *Cause: The specified portion of the GNS domain name does not follow RFC-1035 label conventions, as it is longer than 63 characters.
// *Action: Specify a domain name that follows RFC-1035 conventions. The domain name consists of a set of labels separated by ".". Label must begin with an alphabetic character and can contain only alphanumeric characters and "-" (dash or minus character), end with an alphanumeric and be no more than 63 characters long.
/
1071, GNS_FQDN_UNRESOLVED, "An error occurred while trying to look up IP address for \"{0}\"."
//  *Cause: A requested operation failed because an error occurred when it 
//          attempted to resolve the indicated fully qualified domain name 
//          (FQDN) for the GNS server.
// *Action: Ensure that the local node has name servers properly configured. 
//          If the domain in the FQDN is a GNS domain name, ensure that DNS has 
//          been set up to forward requests to GNS and that the GNS resource is 
//          online. Ensure that there are no firewalls between the local node 
//          and the name servers.
/
1072, SPNAME_CREATE_FAILED, "Failed to create server pool with reserved name {0}"
//  *Cause: Request to create the specified server pool was rejected because specified server pool name is the name of builtin server pool of Oracle Clusterware. 
// *Action: Supply a server pool name other than the builtin server pool name (Generic or Free) of Oracle Clusterware and retry.
/
1073, GNS_MIN_LOG_LEVEL_VIOLATION, "The specified GNS logging level {0} was outside the expected range of {1} to {2}"
//  *Cause: The 'log_level' value in the 'srvctl start gns -loglevel <log_level>' command was less than the minimum limit.
// *Action: Ensure that the 'log_level' value is within the valid range. 
/
1074, GNS_MAX_LOG_LEVEL_VIOLATION, "The specified GNS logging level {0} was outside the expected range of {1} to {2}"
//  *Cause: The 'log_level' value in the 'srvctl start gns -loglevel <log_level>' command was greater than the maximum limit.
// *Action: Ensure that the 'log_level' value is within the valid range. 
/
1075, GNS_DOMAIN_INVALID_END_CHAR, "GNS Domain name {0} ends with invalid character {1}"
//  *Cause: The specified GNS domain name ends with an invalid character and does not follow RFC-1035 label conventions.
// *Action: Specify a domain name that follows RFC-1035 conventions. According to RFC-1035 conventions, the domain name consists of a set of labels separated by ".". A label must begin with an alphabetic character and can contain only alphanumeric characters or "-" (dash or minus character), end with an alphanumeric, and be no more than 63 characters long.
/
1076, SCAN_VIP_DIF_SUBNET, "Invalid Single Client Access Name {0}. The subnet {1} of SCAN VIP {2} differs from the subnet {3} of network {4}"
//  *Cause: The SCAN VIPs resolved from the specified Single Client Access Name are in a subnet that differs from the network's subnet. 
// *Action: Use the SCAN name that can be resolved to the SCAN VIPs in the same subnet of network resource.
/
1077, INVALID_TRACE_LEVEL, "The specified trace level {0} was outside the expected range of {1} to {2}"
//  *Cause: The trace level value was less than the minimum limit or greater than the maximum limit.
// *Action: Ensure that the trace level value is within the valid range. 
/
1078, SET_INVITEDNODES_FAILED, "Failed to update the invited nodes {0} for service registration with Scan Listener {1}"
//  *Cause: An attempt to update the invited nodes attribute failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the SCAN listener resource has been configured, and the user has update permission on the SCAN listener resource.
/
1079, GET_INVITEDNODES_FAILED, "Failed to retrieve the invited nodes for service registration with Scan Listener {0}"
//  *Cause: An attempt to retrieve the invited nodes attribute value of scan listener failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the SCAN listener resource has been configured, and the user has update permission on the SCAN listener resource.
/
1080, SET_INVITEDSUBNETS_FAILED, "Failed to update the invited subnets {0} for service registration with Scan Listener {1}"
//  *Cause: An attempt to update the invited subnets attribute of scan listener failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the SCAN listener resource has been configured, and the user has update permission on the SCAN listener resource.
/
1081, GET_INVITEDSUBNETS_FAILED, "Failed to retrieve the invited subnets for service registration with Scan Listener {0}"
//  *Cause: An attempt to retrieve the invited subnets attribute of scan listener failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the SCAN listener resource has been configured, and the user has update permission on the SCAN listener resource.
/
1082, INVALID_BUILTIN_CATEGORY, "Invalid built-in server category name {0}"
//  *Cause: The specified category name was invalid.
// *Action: Provide a valid category name. It can be ora.hub.category or ora.leaf.category.
/
1083, SC_NOT_EXISTS, "There is no server category {0} registered in CRS"
//  *Cause: The server category did not exist.
// *Action: Add the server category using the command 'crsctl add category <category_name>' or use the command 'crsctl status category' to get a list of server categories already registered in CRS.
/
1084, SC_LOOKUP_VIA_FILTER_FAILED, "Failed to find server categories using filter {0}"
//  *Cause: An attempt to look up server category entitites using the given filter failed.
// *Action: See the accompanying error messages for further details.
/
1085, SC_ALREADY_EXISTS, "Server category {0} already exists"
//  *Cause: A server category that already exists was specified.
// *Action: Examine the accompanying error messages for details.
/
1086, SC_CREATE_FAILED, "Failed to create category {0} "
//  *Cause: An attempt to create the specified server category failed.
// *Action: Examine the accompanying error messages for details.
/
1087, NO_IPV4_OR_IPV6_FOR_SCAN_NAME, "SCAN name \"{0}\" does not resolve to an IPv4 or IPv6 address"
//  *Cause: The SCAN name did not resolve to an IP address (either IPv4 or IPv6).
// *Action: Ensure that the SCAN name resolves to an IP address.
/
1088, IPV4_IPV6_SIZE_MISMATCH, "SCAN name \"{0}\" resolves to a different number of IPv4 ({1}) and IPv6 ({2}) addresses"
//  *Cause: The number of IPv4 and IPv6 addresses that the SCAN name resolved to were not equal.
// *Action: Ensure that the SCAN name resolves to an equal number of IPv4 and IPv6 addresses.
/
1089, GNS_DOMAIN_REQUIRED, "Domain must be supplied because network \"{0}\" has type \"{1}\"."
//  *Cause: An attempt to add GNS on a non-static network was rejected because a domain was not supplied.
// *Action: Ensure that a domain is forwarded from DNS, and supply the domain using the command 'srvctl add gns -vip <address> -domain <domain>'.
/
1090, GET_SUBDOMAIN_FAILED, "Failed to retrieve the sub-domain configured for GNS"
//  *Cause: An attempt to retrieve the sub-domain attribute of the specified Grid Naming Service (GNS) failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the GNS resource has been configured, and the user has read permission on the GNS resource.
/
1091, SCAN_NAME_RESOLVES_TO_NON_EXISTING_ADDRESS_TYPE, "The scan name \"{0}\" resolves to {1} addresses such as \"{2}\", while network {3} has only {4} subnet"
//  *Cause: The given scan name resolved to a type of addresses that the network did not have.
// *Action: Either modify the network via the command 'srvctl modify network -subnet' to include the missing type or make sure that the scan name resolves only to the addresses of the same type as the network.
/
1092, SC_GET_FAILED, "Failed to get the value for the attribute {0} of server category {1}"
//  *Cause: An attempt to get the attribute value of the specified server category failed. 
// *Action: Examine the accompanying error messages for details.
/
1093, SERVERPOOL_MISSING_CATEGORY, "Server pool {0} does not have a server category defined"
//  *Cause: The server pool did not have the server category defined as required for policy-managed databases in a an Oracle Flex Cluster.
// *Action: Modify the server pool using the command 'srvctl modify srvpool -serverpool <serverpool> -category <category> -servers ""'.
/
1094, PRIMARY_SERVICE_REQUIRE_HUB_POOL, "Server category {0} of server pool {1} has the following non-hub active CSS role: {2}"
//  *Cause: The server category of the server pool did not have ACTIVE_CSS_ROLE=HUB as required for policy-managed databases in a Flex Cluster.
// *Action: Modify the server pool to use a server category that has the hub active CSS role or modify the server category to use ACTIVE_CSS_ROLE=HUB.
/
1095, SERVERS_CATEGORY_CONFLICT, "Conflicting specification of 'servers' and 'category' arguments for the serverpool {0}"
//  *Cause: Both 'servers' and 'category' arguments were specified on the command.
// *Action: Retry the request with either 'servers' or 'category' argument.
/
1096, SERVER_NAMES_ALREADY_EXISTS, "The serverpool {0} already contains the server names"
//  *Cause: The command 'srvctl modify srvpool' specified 'category' option, but the server pool already has a server names attribute.
// *Action: Remove the server names attribute by issuing the command 'srvctl modify srvpool -serverpool <pool_name> -servers ""'
/
1097, SERVER_CATEGORY_ALREADY_EXISTS, "The serverpool {0} already contains the server category"
//  *Cause: A 'srvctl modify srvpool' command specified 'servers' but the server pool already has a server category attribute.
// *Action: Remove the server category attribute by issuing the command 'srvctl modify srvpool -serverpool <pool_name> -category ""'
/
1098, CATEGORY_MISSING_CSS_ROLE, "Active CSS role of the server category {0} of PQ server pool {1} is not set"
//  *Cause: The server category of the server pool did not specify ACTIVE_CSS_ROLE.
// *Action: Modify the PQ server pool to use a server category that has a valid active CSS role or modify the server category to set ACTIVE_CSS_ROLE.
/
1099, NON_CORE_MAIN_SGRP, "Nodes {0} of the server pool {1} do not have HUB active CSS roles"
//  *Cause: The server pool did not have nodes with ACTIVE_CSS_ROLE=HUB as required for policy-managed databases in a Flex Cluster.
// *Action: Modify the server pool to use nodes that have HUB active CSS roles.
/
1100, NON_LEAF_PQ_SGRP, "Nodes {0} of the PQ server pool {1} do not have LEAF active CSS roles"
//  *Cause: The server pool did not have nodes with ACTIVE_CSS_ROLE=LEAF as required for policy-managed databases in a Flex Cluster.
// *Action: Modify the server pool to use nodes that have LEAF active CSS roles.
/
1101, GNS_ALREADY_EXISTS, "Unable to create GNS resource because it already exists."
// *Cause: An attempt was made to add the GNS resource but the resource already exists.
// *Action: Either remove the GNS resource and then add it, or avoid adding an already existing resource.
/
1102, SCAN_VIPS_NOT_FOUND_ON_NETWORK, "Could not find any Single Client Access Name (SCAN) Virtual Internet Protocol (VIP) resources using filter {0} on network {1}"
//  *Cause: An attempt to retrieve the SCAN VIP resources on the indicated network failed.
// *Action: Ensure that the resource name supplied is correct. Examine the accompanying error messages for additional details. 
/
1103, SCAN_LSNRS_NOT_FOUND_ON_NETWORK, "Could not find any Single Client Access Name (SCAN) listener resources using filter {0} on network {1}"
//  *Cause: An attempt to retrieve the SCAN listener resources on the indicated network failed.
// *Action: Ensure that the resource name supplied is correct. Examine the accompanying error messages for additional details.
/
1104, SCAN_LSNR_NOT_FOUND_ON_NETWORK, "Could not find the Single Client Access Name (SCAN) listener with ordinal number {0} on network {1}"
//  *Cause: An attempt to find the SCAN listener for the specified ordinal number and network failed.
// *Action: Use the command 'srvctl config scan_listener -netnum' to check the available ordinal numbers on the given network.
/
1105, PQ_SERVICE_REQUIRE_RIM_POOL, "Server category {0} of Parallel Query server pool {1} has the following non-leaf active CSS role: {2}"
//  *Cause: The server category of the server pool did not have ACTIVE_CSS_ROLE=LEAF as required for the parallel query helper service of the policy-managed databases in a Flex Cluster.
// *Action: Modify the Parallel Query server pool to use a server category that has the leaf active CSS role or modify the server category to use ACTIVE_CSS_ROLE=LEAF.
/
1106, NON_PROCESSING_PQ_SGRP, "Nodes {0} of the Parallel Query server pool {1} do not have the leaf active CSS role"
//  *Cause: The server pool did not have nodes with ACTIVE_CSS_ROLE=LEAF as required for policy-managed databases in a Flex Cluster.
// *Action: Modify the server pool to use nodes that have the leaf active CSS role.
/
1107, ADD_RESOURCE_ON_LEAF_NETWORK_ERROR, "Cannot add resource on network {0}, which is configured as leaf."
//  *Cause: An attempt to add a resource using a network configured as 'leaf' was made.
// *Action: Add the resource on a network not configured as 'leaf'.
/
1108, MODIFY_RESOURCE_ON_LEAF_NETWORK_ERROR, "Cannot modify resource to use network {0}, which is configured as leaf."
//  *Cause: An attempt to modify a resource using a network configured as 'leaf' was made.
// *Action: Provide a network not configured as 'leaf'.
/
/ 1109 Unused
1109, MODIFY_SCANNAME_NOT_ALLOWED_IN_DYNAMIC_NETTYPE, ""
// *Document: NO
//  *Cause:
// *Action:
/
1110, SCAN_NAME_DOES_NOT_RESOLVE_TO_BOTH, "Single Client Access Name (SCAN) {0} does not resolve to {1} addresses although it should resolve to both IPv4 and IPv6 addresses"
//  *Cause: An attempt to modify the SCAN name while the network type was 'BOTH' was rejected because the specified SCAN name did not resolve to both IPv4 and IPv6 addresses required by the network.
// *Action: Make sure that the specified SCAN name resolves to both IPv4 and IPv6 addresses.
/
1111, GNS_VIP_NET_IP_MISMATCH, "Could not modify GNS VIP because registered type and IP address type are different"
//  *Cause: The IP address type specified for the GNS VIP to be added differed from the registered network type.
// *Action: Specify an IP address of the type that is registered.
/
1112, UNASSIGNED_SERVER, "Server {0} is not assigned to any server pool."
//  *Cause: The given server was not yet recognized by Oracle Clusterware and therefore was not active in any server pool. 
// *Action: Check the state of the server using the command 'crsctl status server <server> -f'.
/
1113, SCAN_VIP_ADDRESS_DOES_NOT_BELONG_TO_NETWORK, "The Single Client Access Name (SCAN) VIP address \"{0}\" does not belong to network {1} which has only an {2} subnet."
//  *Cause: The network modification failed because the type of the specified SCAN VIP address was incompatible with the subnet of the specified network.
// *Action: Either modify the network via the command 'srvctl modify network -subnet' to include the missing type or make sure that the SCAN VIP is an address of the same type as the network.
/
1114, GET_GHS_HOSTPORT_FAILED, ""
// *Document: NO
//  *Cause: 
// *Action: 
/
1115, GET_HOSTPORT_FAILED, "An attempt to retrieve the Rapid Home Provisioning Server host name and port number failed with the following error:\n{0}"
//  *Cause: While looking up Rapid Home Provisioning Server (RHPS) connection details in Grid Naming Service (GNS), an attempt to retrieve the host name and port number failed.
// *Action: Examine the accompanying error message. Make sure that both the GNS and the Rapid Home Provisioning Server are running on the RHPS cluster.
/
1116, NO_SRV_RECORD_FOR_SERVICE, "no SRV record for service {0} found in the Grid Naming Service (GNS)"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1117, INVALID_SRV_FORMAT, "invalid format for SRV record {0} returned from the Grid Naming Service (GNS)"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1118, GNS_RESOLVED_MULTIPLE_IP, "The supplied GNS VIP name \"{0}\" resolves to multiple IP addresses \"{1}\"."
//  *Cause: Install prerequisite checking determined that the indicated GNS VIP
//          name entered was resolved to the multiple IP addresses shown.
// *Action: Repeat the install interview supplying a GNS VIP name that resolves
//          to exactly one address, or a numeric GNS VIP address. Alternatively,
//          modify the name service address mapping to associate only one
//          address with the name and rerun the prerequisite check.
/
1119, GNS_MODIFY_ROLE_CLIENT_ERROR, "illegal attempt to modify the Grid Naming Service instance role to client"
//  *Cause: An attempt to modify the Grid Naming Service (GNS) role to client was made.
// *Action: Valid GNS roles are PRIMARY and SECONDARY. Specify one of them and reissue the command.
/
1120, GNS_RESOLVED_MULTIPLE_IP_MIXED, "The supplied GNS VIP name \"{0}\" resolves to multiple addresses \"{1}\" of types IPv4 or IPv6."
//  *Cause: More than one IP address of either type IPv4 or type IPv6 were found
//          when resolving the specified Grid Naming Service (GNS) VIP name.
// *Action: Supply a GNS VIP name that resolves to exactly two addresses, one
//          of type IPv4 and one of type IPv6.
/
1121, GNS_RESOLVED_MULTIPLE_IP_A, "The supplied GNS VIP name \"{0}\" resolves to multiple addresses \"{1}\" of type IPv4."
//  *Cause: More than one IP address of type IPv4 was found when resolving the
//          specified Grid Naming Service (GNS) VIP name.
// *Action: Supply a GNS VIP name that resolves to exactly one IPv4 address, or
//          supply a numeric GNS VIP address.
/
1122, GNS_RESOLVED_MULTIPLE_IP_AAAA, "The supplied GNS VIP name \"{0}\" resolves to multiple addresses \"{1}\" of type IPv6."
//  *Cause: More than one IP address of type IPv6 was found when resolving the
//          specified Grid Naming Service (GNS) VIP name.
// *Action: Supply a GNS VIP name that resolves to exactly one IPv6 address, or
//          supply a numeric GNS VIP address.
/
1123, FAILED_GET_EXTENDED_CONF, "failed to get the extended cluster configuration information"
// *Cause: An attempt to get the extended cluster configuration information failed.
// *Action: Examine the accompanying error messages for details and retry the command, making sure that the CRS stack is running.
/
1124, FAILED_GET_CLUSTER_SITES, "failed to get Oracle Clusterware sites"
// *Cause: An attempt to get Oracle Clusterware sites failed.
// *Action: Examine the accompanying error messages for details and retry the command, making sure that the CRS stack is running.
/
1125, FAILED_GET_NODE_SITE, "failed to get Oracle Clusterware site for node {0}"
// *Cause: An attempt to retrieve Oracle Clusterware site for specified node failed.
// *Action: Examine the accompanying error messages for details and retry the command, making sure that the CRS stack is running.
/
1126, NO_STATIC_IPV4_ADDRESSES, "SCAN {0} has no static IPv4 addresses configured for Single Client Access Name (SCAN) Virtual IPs (VIP)."
//  *Cause: An attempt to modify the network type of the indicated SCAN to 'static' was rejected because the SCAN did not have SCAN VIPs configured with static IPv4 addresses.
// *Action: Use the command 'srvctl modify scan' to configure the indicated SCAN with SCAN VIPs whose addresses resolve to static IPv4 addresses.
/
1127, NO_STATIC_IPV6_ADDRESSES, "SCAN {0} has no static IPv6 addresses configured for Single Client Access Name (SCAN) Virtual IPs (VIP)."
//  *Cause: An attempt to modify the network type of the indicated SCAN to 'static' was rejected because the SCAN did not have SCAN VIPs configured with static IPv6 addresses.
// *Action: Use the command 'srvctl modify scan' to configure the indicated SCAN with SCAN VIPs whose addresses resolve to static IPv6 addresses.
/
1128, NO_STATIC_IPV4_6_ADDRESSES, "SCAN {0} does not have static IP addresses of both types IPv4 and IPv6 configured for Single Client Access Name (SCAN) Virtual IPs (VIP)."
//  *Cause: An attempt to modify the network type of the indicated SCAN to 'static' was rejected because the SCAN did not have SCAN VIPs configured with static addresses of each of the types IPv4 and IPv6.
// *Action: Use the command 'srvctl modify scan' to configure the indicated SCAN with SCAN VIPs whose addresses resolve to static IPv4 and IPv6 addresses.
/
1129, NON_LEAF_RF_SGRP, "nodes {0} of the reader farm server pool {1} do not have LEAF active CSS roles"
//  *Cause: An attempt to add or modify a service was rejected because the specified server pool did not have nodes with ACTIVE_CSS_ROLE=LEAF as required for the policy-managed databases using reader farm services.
// *Action: Modify the server pool to use nodes that have LEAF active Oracle Cluster Synchronization Services (CSS) roles using 'srvctl modify serverpool -category' and retry the operation.
/
1130, ADD_RF_SVC_UNPROPAGATED_NW, "failed to add reader farm service because network {0} is not extended to work on Leaf Nodes"
//  *Cause: An attempt to add a reader farm service was rejected because the provided network was not extended to Leaf Nodes.
// *Action: Specify a network that is extended to work on Leaf Nodes, or run 'srvctl modify network -extendtoleaf' and repeat the operation.
/
1131, MOD_RF_SVC_CONVERT_ERROR, "unable to convert a reader farm service to another service type"
//  *Cause: An attempt to modify a reader farm service configuration was rejected because service type conversion is not supported.
// *Action: Create a new service of the required service type.
/
1132, DB_SERVICE_TYPE_PQ_ERROR, "Database {0} is configured to use parallel query services."
//  *Cause: An attempt to add a reader farm service configuration was rejected because the specified database was already configured to use parallel query services.
// *Action: Specify a different database or remove the parallel query services using  the command 'srvctl remove service' and add the reader farm service using the command 'srvctl add service'.
/
1133, DB_SERVICE_TYPE_RF_ERROR, "Database {0} is configured to use reader farm services."
//  *Cause: An attempt to add a parallel query service configuration was rejected because the specified database was already configured to use reader farm services.
// *Action: Specify a different database or remove the reader farm services using the command 'srvctl remove service' and add the parallel query service using the command 'srvctl add service'.
/
1134, RF_HUB_POOL_ERROR, "Server category {0} of server pool {1} has the following non-LEAF CSS role: {2}"
//  *Cause: An attempt to add or modify a reader farm service was rejected because the server category of the specified server pool did not have ACTIVE_CSS_ROLE=LEAF as required for reader farm services.
// *Action: Modify the server pool to use a server category that has the LEAF active CSS role or modify the server category to use ACTIVE_CSS_ROLE=LEAF and retry the operation.
/
1135, MOD_SVC_TO_RF_CONVERT_ERROR, "unable to convert non-reader farm service {0} to reader farm service type"
//  *Cause: An attempt to modify a non-reader farm service configuration was rejected because service type conversion is not supported.
// *Action: Create a new reader farm service using the command 'srvctl add service -rfpool'.
/
1136, SERVERS_HAVE_MULTI_CSSROLES, "unable to set the candidate server list for a server pool to a list of servers with mixed CSS roles."
//  *Cause: An attempt to set the candidate server list for a server pool was 
//   rejected because the specified servers were not all Hub Nodes or all Leaf
//   Nodes.
// *Action: Retry the operation specifying a list of servers that all have
//   ACTIVE_CSS_ROLE set to 'hub' or that all have ACTIVE_CSS_ROLE set to 
//   'leaf'.
/
1137, GNS_EXPORT_VERSION_INVALID, "The release specified must be 12.1.0.2 or later."
//  *Cause: An attempt to export the Grid Naming Service (GNS) credentials with
//          the -version option failed because the specified release was earlier
//          than 12.1.0.2
// *Action: Reissue the command, specifying release 12.1.0.2 or later.
/
1138, SCAN_ADDRESSES_REACHABILITY_ERROR, "invalid VIP addresses \"{0}\" because the specified IP addresses are reachable"
//  *Cause: The specified command was rejected because the Virtual Internet 
//          Protocol (VIP) address was reachable.
// *Action: Configure VIPs to use IP addresses that are not active on any host 
//          system and cannot be reached using 'ping'.
/
1139, ADD_RF_HUB_SVC_ERROR, "failed to add reader farm service"
//  *Cause: An attempt to add a reader farm service was rejected because the 
//          hub service was either not provided or was invalid.
// *Action: Specify a hub service that exists and services the pluggable
//          database to which the reader farm service can connect.
/
1140, GNSVIP_SUBNET_VALIDATION_ERROR, "invalid GNS VIP address {0} because the specified IP address is not in the subnet {1} of the network resource {2}"
//  *Cause: The subnet of the Grid Naming Service Virtual Internet Protocol 
//          (GNS VIP) did not match the subnet of the network resource.
// *Action: Retry SRVCTL command with a combination of GNS VIP address and 
//          network whose subnet matches.
/
1141, GNSVIP_NET_IP_TYPE_MISMATCH, "invalid GNS VIP address {0} because the specified IP address is not of type {1} of the network resource {2}"
//  *Cause: The IP address type specified for the GNS VIP to be added differed from the registered network type.
// *Action: Specify an IP address of the type that is registered.
/
1142, CDP_ALREADY_EXISTS, "Unable to create CDP resource because it already exists."
// *Cause: An attempt to add the Cross-cluster Dependency Proxies (CDP) resource was
//         rejected because the resource already existed.
// *Action: None.
/
1143, CDP_CREATE_FAILED, "failure to configure Cross-cluster Dependency Proxies resource"
//  *Cause: An attempt to add a cluster configuration for a Cross-cluster
//          Dependency Proxies (CDP) resource failed. The accompanying
//          messages provide detailed failure information.
// *Action: Review the accompanying error messages that provide the details of
//          which resources failed to be created. Check the Cause and Action
//          for the individual resource creation failures.
/
1144, CDP_SCRIPT_EXECUTION_ERROR, "Error executing the config script for CDP. Details: {0}"
//  *Cause: An error occurred while executing the configuration script for the 
//          Cross-cluster Dependency Proxies (CDP) resource.
//          Specific failure data is displayed following the message.
// *Action: Examine the accompanying messages, resolve the identified problems,
//          and then retry the operation.
/
1145, SCAN_LSNRS_NOT_FOUND_FOR_CLIENT, "Single Client Access Name (SCAN) listener resources not found for client cluster {0}."
//  *Cause: An attempt to retrieve the SCAN listener resources for the 
//          indicated client failed. The accompanying error messages provide 
//          detailed failure information.
// *Action: Examine the accompanying error messages, resolve the indicated 
//          issues,and then retry the operation, ensuring that the supplied 
//          cluster name is correct.
/
1146, SCAN_LSNR_ALREADY_CREATED_FOR_CLIENT, "Single Client Access Name (SCAN) listener resources already exist for client cluster {0}."
//  *Cause: An attempt to create Single Client Access Name (SCAN) listeners
//          was rejected because resources were already created for the
//          specified client cluster.
// *Action: Retry the operation, specifying a different client cluster name.
/
1147, ONS_NOT_FOUND_FOR_CLIENT, "unable to find any Oracle Notification Service (ONS) resources for client cluster {0}"
//  *Cause: An attempt to retrieve the ONS resources for the 
//          indicated client failed. The accompanying error messages provide
//          detailed failure information.
// *Action: Examine the accompanying error messages, resolve the indicated 
//          issues, and then retry the operation, ensuring that the supplied 
//          resource name is correct.
/
1148, ONS_ALREADY_CREATED_FOR_CLIENT, "An ONS resource already exists for client cluster {0}."
//  *Cause: An attempt to create an Oracle Notification Service (ONS) resource
//          was rejected because a resource already existed for the indicated
//          client cluster.
// *Action: Retry the operation, specifying a different cluster name.
/
1149, ONS_NOT_FOUND, "unable to find resource for ONS {0}"
//  *Cause: An attempt to query resources failed because the indicated
//          Oracle Notification Service (ONS) resource did not exist.
// *Action: Retry the operation, specifying a valid ONS name.
/
1150, ONS_ALREADY_CREATED, "The ONS resource already exists."
//  *Cause: An attempt to create a resource was rejected because the Oracle
//          Notification Service (ONS) resource already existed.
// *Action: None.
/
1151, ONS_NOT_CLIENT_ERROR, "The specified ONS resource is not configured for a client cluster."
//  *Cause: An attempt to export client data for an Oracle Notification 
//          Service (ONS) resource was rejected because the specified ONS 
//          resource was not configured to serve a client cluster.
// *Action: Retry the operation, specifying an ONS resource that is configured
//          to serve a client cluster.
/
1152, SCAN_LISTENER_INVITED_NODES_ERROR, "The invited nodes cannot be modified for a SCAN listener on a client cluster."
//  *Cause: An attempt to modify the invited nodes for a SCAN listener was 
//          rejected because the resource was configured for a client cluster.
// *Action: Retry the operation, specifying a SCAN listener on a server cluster.
/
1153, SCAN_LISTENER_INVITED_SUBNET_ERROR, "The invited subnet cannot be modified for a SCAN listener on a client cluster."
//  *Cause: An attempt to modify the invited subnet for a SCAN listener was 
//          rejected because the resource was configured for a client cluster.
// *Action: Retry the operation, specifying a SCAN listener on a server cluster.
/
1154, SCAN_LISTENER_NOT_CLIENT_ERROR, "The specified SCAN listener resource is not configured for a client cluster."
//  *Cause: An attempt to export client data for a SCAN listener resource was 
//          rejected because the specified SCAN listener resource was not 
//          configured to serve a client cluster.
// *Action: Retry the operation, specifying a SCAN listener resource that
//          serves a client cluster.
/
1155, MISSING_WRAP_PROPERTIES, "missing properties {0}"
//  *Cause: An attempt to get XML properties from the indicated data file 
//          failed because the required XML property attributes did not exist.
// *Action: Retry the operation, supplying a valid client data file.
/
1156, RF_POOL_ALREADY_SAME, "Service {0} is already configured in server pool {1}."
//  *Cause: An attempt to modify the reader farm service pool for the specified
//          server pool failed because the service is already
//          part of the server pool.
// *Action: No action is needed.
/
1157, CDP_NOT_EXISTS, "The CDP resource does not exist."
// *Cause: An attempt to retrieve the Cross-cluster Dependency Proxies
//         (CDP) resource failed because the resource could not be found.
// *Action: Create the CDP resource using the command 'srvctl add cdp', then
//          retry the operation.
/
1158, TFA_NOT_EXISTS, "The TFA resource does not exist."
// *Cause: An attempt to retrieve the Trace File Analyzer (TFA) failed because
//         the resource could not be found.
// *Action: Create the TFA resource using the command 'srvctl add tfa', then
//          retry the operation.
/
1159, TFA_ALREADY_EXISTS, "Unable to create the TFA resource because it already exists."
// *Cause: An attempt to add the Trace File Analyzer (TFA) resource was
//         rejected because the resource already existed.
// *Action: None.
/
1160, CDP_PROXY_NOT_EXISTS, "The CDP proxy resource does not exist."
// *Cause: An attempt was made to retrieve the Cross-cluster
//         Dependency Proxies (CDP) proxy resource but the CDP proxy
//         resource was not found. 
// *Action: Create the CDP proxy resource using the command
//          'srvctl add cdpproxy', then retry the operation.
/
1161, CDP_PROXY_ALREADY_EXISTS, "Unable to create CDP proxy resource because it already exists."
// *Cause: An attempt was made to add the Cross-cluster Dependency
//         Proxies (CDP) proxy resource but the resource already existed.
// *Action: None.
/
1162, CDP_UNKNOWN_PROXY_TYPE, "Cannot create CDP proxy using unsupported type \"{0}\"."
// *Cause: An attempt was made to add the Cross-cluster Dependency
//         Proxies (CDP) proxy resource using an unknown, or unsupported, proxy type.
// *Action: Retry the operation, supplying a valid supported proxy type.
/
1163, CDP_REMOVE_FAILED, "failed to remove the CDP resource {0}"
//  *Cause: An attempt to remove the Cross-cluster Dependency Proxies
//          (CDP) resource failed because the resource was running or
//          other resources depended on it.
// *Action: Check status for the identified CDP resource and stop the CDP
//          resource before removing it. The force flag could be used to
//          remove the CDP resource if CDP proxies depend on it.
/
1164, CDP_MODIFY_FAILED, "could not modify CDP resources because the following CDP resources were running: {0}"
//  *Cause: An attempt to modify one or more Cross-cluster Dependency
//          Proxies (CDP) resources was rejected because the indicated
//          resources were running. 
// *Action: Ensure that the indicated CDP resources are stopped and then
//          retry the operation.
/
1165, GNS_CLUSTER_NOT_FOUND_NAME, "cluster {0} not registered with GNS"
//  *Cause: An attempt to retrieve information about the indicated cluster from
//          the Grid Naming Service (GNS) found that the cluster was not
//          registered.
// *Action: Ensure that the indicated cluster name is registered with GNS, and 
//          then retry the operation.
/
1166, GNS_CLUSTER_NOT_FOUND_GUID, "cluster GUID {0} not registered with GNS"
//  *Cause: An attempt to retrieve information about the indicated cluster from
//          the Grid Naming Service (GNS) found that the cluster was not
//          registered.
// *Action: Ensure that the indicated cluster GUID is registered with GNS, and 
//          then retry the operation.
/
1167, GNS_CLUSTER_NOT_FOUND, "no clusters registered with GNS"
//  *Cause: An attempt to retrieve the list of registered clusters from the 
//          Grid Naming Service (GNS) detected that no clusters were registered.
// *Action: Ensure that there is at least one cluster registered with GNS, and
//          then retry the operation.
/
1168, SCAN_CLIENT_XML_CLUSTERNAME_MISMATCH, "The cluster name \"{0}\" stored in the client data file is not the same as the configured cluster name \"{1}\"."
//  *Cause: An attempt to configure a Single Client Access Name (SCAN) resource
//          on a client cluster was rejected because the client data file
//          contained information for a different cluster name.
// *Action: Ensure that the client data file was exported for this cluster name
//          and retry the operation.
/
1169, INVALID_INVITED_SUBNETS, "invalid invited subnets value {0}"
//  *Cause: An attempt to change the invited subnets value was rejected because 
//          the invited subnets value was specified using incorrect syntax.
// *Action: Ensure that the invited subnets value is using either Classless 
//          Inter-Domain Routing (CIDR) syntax (e.g. 192.196.16.0/24) or
//          wild cards (e.g. 192.196.16.*).
/
1170, INVALID_SCANL_NODENAMES, "invalid node names value {0}"
//  *Cause: An attempt to add a Single Client Access Name (SCAN) was rejected
//          because the node names value contained invalid active nodes.
// *Action: Ensure that the node names are active and unique, then retry the 
//          operation.
/
1171, SC_DELETE_FAILED, "failed to delete category {0} "
//  *Cause: An attempt to delete the specified server category failed.
// *Action: Examine the accompanying messages, resolve the identified
//          problems, and then retry the operation.
/
1172, SC_UPDATE_FAILED, "failed to update category {0} "
//  *Cause: An attempt to update the specified server category failed.
// *Action: Examine the accompanying messages, resolve the identified 
//          problems, and then retry the operation.
/

