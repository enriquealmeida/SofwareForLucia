// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCnMsg.msg
//
// DESCRIPTION
//    Message file related to network resource
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     yizhang     02/06/18 - fix bug 27488919
//     yizhang     01/18/18 - Support asm network
//     kamramas    08/13/17 - add listener port error
//     pevilla     08/01/17 - Fix bug 26538337, add error for scan client
//                            clusters
//     pevilla     07/31/17 - Fix bug 26271931, Add port per-address message
//     ocordova    05/22/17 - Adding HTTP TLS
//     rdesale     03/23/17 - fix bug 25595115
//     rdesale     11/23/16 - fix b22593058
//     ccharits    04/29/16 - Added messages ERROR_DETECTING_OPC and
//                            ERROR_DETECTING_ODA
//     pevilla     04/01/16 - Fix bug 22971927, add GNS VIP transition error
//                            message
//     ocordova    12/02/15 - Enabling TLS support
//     iestrada    01/12/16 - Fix bug 22367570, add message for OC4J
//                            not supported command.        
//     ocordova    01/06/16 - Fix bug 22201988
//     ocordova    11/25/15 - Fix bug 21967163
//     pevilla     11/23/15 - Fix bug 20742293, add messages for Network
//                            transition
//     pevilla     07/01/15 - Bug 21212304, add
//                            UNABLE_TO_REMOVE_GNS_VIP_ADDRESS_PART
//     pevilla     06/16/15 - FIREWALL error messages
//     spavan      04/02/15 - fix bug20633431 - add messages for destloc
//     vgunredd    03/25/15 - Fix bug 20716122
//     ccharits    05/17/14 - Added messages NO_DNS_SERVER_HOST_FOUND
//     pevilla     05/12/14 - Add NETCONFIG_MERGE_ERROR
//     yizhang     05/09/14 - fix bug 18683100
//     ocordova    04/09/14 - Fix Bug 18309444
//     pevilla     01/31/14 - Bug 17367083, add ASM_LISTENER_SUBNET_ERROR
//     ccharits    12/10/13 - Added messages
//                           SETTING_ADDR_TYPE_TO_IPV4_NOT_ALLOWED,
//                           SETTING_ADDR_TYPE_TO_IPV6_NOT_ALLOWED and
//                           NOT_ALLOWED_DHCP_SERVER_TYPE_MODIFICATION
//     epineda     12/05/13 - Bugfix 17849170
//     pevilla     11/20/13 - Bug 17794795, add NETWORK_SUBNET_MIXED_ERROR
//     epineda     11/04/13 - Bugfix 17701480
//     lureyes     10/18/13 - Fix bug 17578221
//     epineda     10/09/13 - Bugfix 14140897
//     pevilla     08/28/13 - Fix bug 17337614, add
//                            NETWORK_DUPLICATED_PING_TARGET
//     pevilla     07/03/13 - Bug 17019319, add PING_TARGET
//     ocordova    07/18/13 - Fix Bug 17158645
//     ccharits    11/22/12 - Fixed bug 13649020
//     satg        11/14/12 - Fix bug 14730028
//     epineda     11/06/12 - Bugfix 14827635
//     pevilla     10/25/12 - Fix bug 13968141, Add messages for leaf category
//     spavan      10/17/12 - fix bug9966385 - add messages for crshome space
//                            alert mode
//     epineda     10/10/12 - Bugfix 1426379
//     ccharits    10/15/12 - Added messages INVALID_NETWORK_TYPE_FOR_IPV4_NETWORK
//                            and INVALID_NETWORK_TYPE_FOR_IPV6_NETWORK
//     rtamezd     09/11/12 - Remove RIM_ASM_LSNR_NOT_EXIST
//     spavan      09/07/12 - fix bug14218734 - modify attribute name
//     satg        09/05/12 - fix bug 14347014
//     ccharits    08/02/12 - Added message NETNUM_RETRIEVAL_ERROR
//     ccharits    06/06/12 - Changed
//                            CANNOT_CHANGE_NETWORK_ADDR_TYPE_TO_BOTH_MISSING_SUBNET
//     ccharits    04/05/12 - Changed message UNABLE_TO_DETERMINE_NETTYPE
//     ccharits    04/03/12 - Added message
//                            VIP_NAME_RESOLVES_TO_NON_EXISTING_ADDRESS_TYPE
//     ccharits    03/15/12 - Added message
//                            CANNOT_CHANGE_NETWORK_ADDR_TYPE_TO_BOTH
//     ccharits    03/14/12 - Added messages
//                            LISTENER_INTERFACE_TYPE_VALIDATION_ERROR
//     smadabhu    02/09/12 - Fix bug 13105065
//     ccharits    02/13/12 - Added message NO_NETWORK_SUBNET
//     ccharits    02/07/12 - Added messages SUBNET_ALREADY_IN_USE and
//                            UNABLE_TO_VERIFY_SUBNET_UNIQUENESS
//     xesquive    02/07/12 - Bug fix 13566257
//     ccharits    01/26/12 - Added messages VIP_LIST_RETRIEVAL_ERROR
//     ccharits    01/24/12 - Added message INVALID_NETMASK
//     ccharits    01/20/12 - Added messages UNABLE_TO_DETERMINE_NETTYPE and
//                            NON_STATIC_NETTYPE
//     ccharits    01/18/12 - Added messages UNEXPECTED_INTERNAL_ERROR,
//                            UNABLE_TO_RETRIEVE_NETWORK_SUBNET_INFO,
//                            VIP_NETMASK_MISMATCH and VIP_PREFIX_LENGTH_MISMATCH
//     epineda     11/09/11 - Bugfix 13093810: changed  VALIDATE_NETWORK_FAILED
//     yizhang     07/10/11 - Define CLUSTER_ASM_LSNR_NOT_EXIST and
//                            RIM_ASM_LSNR_NOT_EXIST
//     yizhang     06/16/11 - Define INVALID_LISTENERTYPE
//     ccharits    02/24/11 - IPv6 support changes
//     abhisbg     01/28/11 - add new msg when add listener is run from
//                            differnt srvm home
//     mimili      07/23/10 - bug 9477133: ADD ONS log/debug related messages
//     yizhang     06/11/10 - Define NETWORK_INTERFACE_DIF message
//     yizhang     06/10/10 - Add LISTENER_ALREADY_CREATED
//     yizhang     03/16/10 - Add NO_NET_RES_EXIST,FAILED_UNREGISTER_EONS_TYPE
//     ccharits    02/02/10 - Added messages for IPMI check API
//     yizhang     01/27/10 - Define FAILED_REMOVE_EONS_IN_UPGRADE
//     yizhang     01/25/10 - add SET_USE_EVM_FAILED, 
//                            FAILED_GET_EONS_PORT_IN_UPGRADE
//     ccharits    12/17/09 - Added message PORTS_OUT_OF_RANGE
//     yizhang     11/19/09 - fix bug 8789355
//     yizhang     10/16/09 - Define VALIDATE_NETWORK_FAILED
//     spavan      05/27/09 - add cvu resource messages
//     yizhang     05/26/09 - fix messages
//     yizhang     04/29/09 - fix messages with unwanted trailing characters
//     ccharits    04/02/09 - Added messages CHECK_PORT_AVAILABILITY_FAILURE
//                            and UNABLE_TO_RETRIEVE_LIST_OF_NODES
//     yizhang     04/02/09 - Add message SCAN_LSNR_TYPE
//     yizhang     12/19/08 - Fix message PORT_NOT_AVAILABLE
//                          - Add PORTS_NOT_AVAILABLE
//     yizhang     11/14/08 - Add MULTIPLE_VIPS_FOR_NAME
//     spavan      09/23/08 - fix bug6523972,bug7394870
//     spavan      09/16/08 - fix bug7330842
//     yizhang     09/10/08 - Add LSNR_CREATE_FAILED
//     spavan      04/11/08 - Fix cause/action field
//     spavan      04/08/08 - Fix cause/action field
//     yizhang     04/08/08 - Fix message NETWORK_CONFLICT_SUBNET
//     yizhang     03/21/08 - Defind INVALID_LSNR_PROTOCOLTYPE
//     sravindh    03/18/08 - Transfer cause and action strings from Java
//                            source file PrCnMsg.java
//     rxkumar     02/16/08 - add SET_PORT_FAILED
//     spavan      01/11/08 - Add message for network and ONS modify
//     rxkumar     12/12/07 - add GET_DHCP_SERVER_TYPE_FAILED
//     yizhang     09/10/07 - Add VIP_EXISTS, NETWORK_CONFLICT_NETNUM/SUBNET
//                            VIP_CONFLICT_VIPNAME/NETNUM_OR_NODE
//     yizhang     08/23/07 - Add NETMASK_NOT_EXIST
//     sowong      06/04/07 - add messages
//     rxkumar     06/06/07 - move Tier msgs to SCResMsg.
//     rxkumar     05/31/07 - add GET/SET_PROPS_FAILED msg
//     rxkumar     05/17/07 - add NOT_GOSSIPSERVER_DISC_METHOD
//     rxkumar     02/20/07 - add EONS messages
//     rxkumar     01/30/07 - add ORAHOME
//     rxkumar     01/08/07 - add GET_PORT_FAILED
//     rxkumar     12/19/06 - add NOT_PRIV_USER
//     rxkumar     12/05/06 - add PORT_NOT_AVAILABLE msg
//     rxkumar     12/04/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
2018, NOT_PRIV_USER, "Current user {0} is not a privileged user"
//  *Cause: Current user did not have sufficient privileges to perform this operation.
// *Action: Make sure that the user has root privileges on Linux/Unix's and Administrator on Windows.
/
2030, SUBNET_NOT_EXISTS, "Subnet does not exist for resource {0}"
//  *Cause: An attempt was made to query subnet for a network resource configured with Oracle clusterware and it was not found.
// *Action: Internal error. Contact Oracle Support.
/
2031, UNKNOWN_DHCP_SERVER, "Unknown DHCP server name {0} found for resource {1}"
//  *Cause: The DHCP server type obtained for the network resource is not a valid server type.
// *Action: Internal error. Contact Oracle Support.
/
2032, GET_DHCP_SERVER_TYPE_FAILED, "Failed to retrieve DHCP server type {0}"
//  *Cause: An attempt to query the DHCP server type for the network resource failed because its value could not be retrieved from the Oracle clusterware resource attributes.
// *Action: make sure Oracle clusterware is up and running. and also look at the help for the accompanying CRS error message. 
/
2033, SET_DHCP_SERVER_TYPE_FAILED, "Failed to update DHCP server type to {0} \n{1}"
//  *Cause: An attempt to update the DHCP server type for the network resource failed because its value could not be updated in the Oracle Clusterware resource attribute.
// *Action: Make sure that the Clusterware stack is up. Make sure that the user has enough permission to modify node applications. Examine the accompanying message for additional details.
/
2034, DEP_RES_NOT_FOUND, "Could not find dependent resource {0} for resource {1}: {2}"
//  *Cause: Could not get the resource associated with a given resource. Could not get the ASM resource associated with a given ASM disk group resource. 
// *Action: Make sure that clusterware stack is up. Make sure that the network resource associated with this resource has not been removed. Make sure that the user has permission to perform this operation.
/
2035, PORT_NOT_AVAILABLE, "Port {0} is not available on node(s) or virtual host(s): {1}"
//  *Cause: The port specified is already being used by some other applications on the nodes or virtual hosts given.
// *Action: Stop the applications that are using these ports or specify a different port and try the command again.
/
2036, GET_PORT_FAILED, "Failed to retrieve port number(s) for {0}"
//  *Cause: An attempt to retrieve the port number(s) for the cluster resource failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the resource you are querying has been configured. Also take a look at the help for the accompanying error message(s).
/
2037, GET_ORAHOME_FAILED, "Failed to retrieve Oracle home for {0}"
//  *Cause: An attempt to retrieve Oracle home value for the listener resource failed. 
// *Action: Make sure that the clusterware stack is up. Make sure that listener is configured. If node name is being specified in the command line make sure that the node name is a valid node name. Also look at help for the accompanying error message(s).
/
2038, SET_ORAHOME_FAILED, "Failed to update Oracle home {0} for listener {1}"
//  *Cause: An attempt to update the Oracle home value for the listener resource failed. 
// *Action: Make sure that the clusterware stack is up. Make sure that the listener is configured. If node name is being specified in the command line make sure that the node name is a valid node name. Make sure that user is a owner or has write permissions to modify the listener resource. Also look at the help for other errors listed in error stack.
/
2039, GET_PERX_ORAHOME_FAILED, "Failed to retrieve Oracle home for {0} on node {1}"
//  *Cause: An attempt to retrieve Oracle home value for the listener resource on a the specified node failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the listener is configured on the node. Make sure that the node name being passed in the command line is a valid node name. Also look at the help for the accompanying error message(s).
/
2040, SET_PERX_ORAHOME_FAILED, "Failed to update Oracle home {0} for {1} on node {2}"
//  *Cause: Attempt to update value of attribute Oracle home for listener resource on the specified node failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the listener is configured on the node. Make sure that the user has enough permission to modify the listener. Make sure that the node name being passed in the command line is a valid node name. Also look at the help for other errors listed in error stack.
/
2041, GET_PROPS_FAILED, "Failed to retrieve properties of {0}"
//  *Cause: Failed to retrieve properties of the given entity.
// *Action: Make sure that user has permission to read resource attribute.
/
2042, SET_PROPS_FAILED, "Failed to set properties {0} of {1}"
//  *Cause: Failed to update properties of the given entity.
// *Action: Make sure that user has permission to update resource attribute.
/
2043, MULTIPLE_NET_RES_EXIST, "Multiple network resources {0} exist on the cluster"
//  *Cause: More than one network resource has been configured and the one to be used for creating this resource has not been specified.
// *Action: Use the '-netnum <net_num>' option to specify the network to be used and retry the command again.  
/
2044, LSNR_NOT_EXIST, "No listener exists"
//  *Cause: No listener has been configured.
// *Action: Use netca or srvctl to add/configure a listener.
/
2045, NETWORK_NOT_EXIST, "No network exists"
//  *Cause: No network has been configured.
// *Action: Use 'srvctl add nodeapps' to add/configure network resource.
/
2046, NETMASK_NOT_EXISTS, "Netmask does not exist for resource {0}"
//  *Cause: An attempt to retrieve the subnet information for the network resource resulted in not finding subnet mask.
// *Action: Internal error. Contact Oracle Support.
/
2047, VIP_EXISTS, "VIP {0} exists"
//  *Cause: The VIP with specified name has been registered in CRS.
// *Action: Remove the existing VIP before registering it again.
/
2048, NETWORK_CONFLICT_NETNUM, "The network number {0} is already registered for subnet ''{3}'' and adapters ''{4}''. Can not add network number {0} for the specified subnet ''{1}'' and adapters ''{2}''."
//  *Cause: The network number is taken by a registered network resource.
// *Action: Use a different network number to add a new network resource with the specified subnet and adapters, or modify existing network using the command 'srvctl modify nodeapps'.
/
2049, NETWORK_CONFLICT_SUBNET, "The network attributes specified (network number: {0}, subnet: {1}, adapters: {2}) conflict with an already registered network (network number: {3}, subnet: {4}, adapters: {5})"
//  *Cause: The network resource is registered with different network number
// *Action: Use the registered network resource with the registered network number or provide different subnet or adapters.
/
2050, VIP_CONFLICT_VIPNAME, "The requested VIP (nodename: {0}, VIP name: {1}, network number: {2}) has the same VIP name but different network number or preferred node than the registered VIP (nodename: {3}, VIP name: {4}, network number: {5})."
//  *Cause: One VIP name (and IP address) can only be used by one VIP with the same network number on the same node.
// *Action: Use a different VIP name or IP address.
/
2051, VIP_CONFLICT_NETNUM_OR_NODE, "The requested VIP (nodename: {0}, VIP name: {1}, network number: {2}) has the same network number and the same preferred node but different VIP name with the registered VIP (nodename: {3}, VIP name: {4}, network number: {5})."
//  *Cause: One network resource on one preferred node can have only one cluster VIP.
// *Action: Use different network number or preferred node to register different VIP.
/
2052, MODIFY_NETWORK_FAILED, "Failed to modify network number {0} to use subnet \"{1}\" with subnet mask \"{2}\", adapters \"{3}\" and address type \"{4}\""
//  *Cause: CRS was unable to modify the network resource to use new subnet/netmask/interface/address type.
// *Action: Check accompanying error message(s) for details, then ensure that:
//          - The clusterware stack is up.
//          - The subnet, netmask, address type and adapters values are correct.
//          - The network interface referred to is running.
//          - The user trying to modify the network resource has root privileges.
/
2053, SET_LOCAL_PORT_FAILED, "Failed to modify ONS listening port for local client connections to {0}"
//  *Cause: CRS unable to modify the ONS listening port for local connections
// *Action: Make sure that clusterware stack is up. If the port is in use by another application, try using a different port.
/
2054, SET_REMOTE_PORT_FAILED, "Failed to modify ONS listening port for remote client connections to {0}"
//  *Cause: CRS unable to modify the ONS listening port for remote client connections
// *Action: Make sure that clusterware stack is up. If the port is in use by another application, try using a different port.
/
2055, SET_PORT_FAILED, "Failed to update port number(s) to {0} for {1}"
//  *Cause: An attempt to update the listener port failed for the nodes of the cluster.
// *Action: The port could be in use. Try using different port. If node name was specified in the command line make sure that the node name is a valid node name. Also look at the help for the accompanying error message(s).
/
2056, INVALID_LSNR_PROTOCOLTYPE, "Invalid listener protocol type {0}"
//  *Cause: The specified listener protocol type is invalid.
// *Action: Provide a valid listener protocol type. It can be TCP, TCPS, IPC, NMP, or SDP.
/
2057, INVALID_LSNR_PROTOCOLVALUE, "Invalid listener protocol value {0}"
//  *Cause: The specified listener protocol value is invalid.
// *Action: Provide a valid listener protocol value. It cannot contain special characters ':,/'
/
2058, INVALID_LSNR_ENDPOINTS, "Invalid listener protocol ENDPOINTS {0}. Delimiter is \"{1}\", invalid part is \"{2}\"."
//  *Cause: The specified listener ENDPOINTS are invalid.
// *Action: Provide valid listener protocol ENDPOINTS. It cannot contain invalid part.
/
2059, INVALID_LSNR_PORT, "Invalid listener port number {0}"
//  *Cause: The specified listener port number is invalid.
// *Action: Provide a valid listener port number.
/
2060, DUPLICATED_LSNR_PROTOCOLVALUE, "Duplicated listener protocol value {0}"
//  *Cause: The specified listener protocol value is a duplication of another one.
// *Action: Remove duplicated listener protocol value.
/
2061, LSNR_CREATE_FAILED, "Failed to add listener {0}"
//  *Cause: An attempt to add listener failed because endpoints were not specified correctly or other reasons. 
// *Action: Review the underlying error messages that provide the details of which resources failed to create. Check the cause and action for the individual resource creation failure. If the endpoints were not specified correctly, correct endpoints.
/
2062, UNKNOWN_HOST, "The specified hostname or address {0} cannot be resolved."
//  *Cause: An invalid IP address or unresolvable hostname was specified.
// *Action: If IP address is specified then make sure that it is of legal length. If a host name is specified than make sure that the host name resolves to an IP address.
/
2063, SET_OC4J_PORT_FAILED, "Failed to modify OC4J listening port to {0}"
//  *Cause: CRS unable to modify the OC4J instances listening port.
// *Action: Make sure that clusterware stack is up. If the port is in use by another application, try using a different port.
/
2064, MULTIPLE_VIPS_FOR_NAME, "Found {0} VIPs for {1}"
//  *Cause: A conflict was found in VIP resource definition: either more than one VIP is using the same name or address, or a VIP is using the same name or address as a real host.
// *Action: Ensure that each VIP is defined with a distinct name and address relative to other VIPs and hosts in the network.
/
2065, PORTS_NOT_AVAILABLE, "Ports {0} are not available on the nodes given"
//  *Cause: The ports specified are already being used by some other applications in one or more of the specified nodes.
// *Action: Stop the applications that are using these ports or specify different ports.
/
2066, SCAN_LSNR_TYPE, "Failed to retrieve cluster listener for {0} because it has the type of Single Client Access Name Listener"
//  *Cause: Failed to use cluster listener APIs or srvctl commands for specified listener.
// *Action: Use Single Client Access Name Listener (SCAN listener) APIs or srvctl commands (srvctl <verb> scan_listener) for specified listener name. 
/
2067, PORT_NOT_AVAILABLE_ACROSS_NODES, "Port {0} is not available on nodes: {1}"
//  *Cause: The port specified is already being used by other application.
// *Action: Stop the application that is using this port or specify a different port.
/
2068, CHECK_PORT_AVAILABILITY_FAILURE, "Failed to check the port availability"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
2069, UNABLE_TO_RETRIEVE_LIST_OF_NODES, "Unable to retrieve the list of nodes"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
2070, VALIDATE_NETWORK_FAILED, "Failed to validate network. No interface matches required network (subnet: {0}, netmask: {1} adapters: {2})."
//  *Cause: No intefaces were found that match the specified network.
// *Action: Specify a subnet that exists on all nodes, or reconfigure the nodes to ensure that the specified subnet exists on all nodes.
/
2071, SET_USE_EVM_FAILED, "Failed to update attribute USE_EVM to {0}"
//  *Cause: An attempt to update the attribute value of USE_EVM for ONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
2072, FAILED_GET_EM_PORT_IN_UPGRADE, "Failed to get multicast port for events from EONS"
//  *Cause: An attempt to get multicast port for events from EONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
2073, FAILED_REMOVE_EONS_IN_UPGRADE, "Failed to remove EONS"
//  *Cause: An attempt to remove EONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
2074, BELOW_MIN_CVU_CHECK_INTERVAL, "Specified check interval of {0} minutes is below the minimum check interval {1} minutes"
//  *Cause: The CVU resource check interval specified was less than the minimum check interval.
// *Action: Retry the operation with a interval greater than or equal to the minimum check interval.
/
2075, SET_CVU_CHECK_INTERVAL_FAILED, "Failed to modify the CVU RUN_INTERVAL attribute to {0}"
//  *Cause: CRS was unable to modify the CVU RUN_INTERVAL attribute.
// *Action: Make sure that the Clusterware stack is up. Make sure that the user is an owner or has write permissions to modify the CVU resource. Check for and respond to any accompanying error messages.
/
2076, GET_CVU_CHECK_INTERVAL_FAILED, "failed to retrieve the CVU RUN_INTERVAL attribute for resource \"{0}\""
//  *Cause: An attempt to retrieve the RUN_INTERVAL attribute for the Cluster Verification Utility cluster resource failed.
// *Action: Make sure that the Clusterware stack is up. Make sure that the CVU resource has been configured. Check for and respond to any accompanying error messages.
/
2077, SET_CVU_CHECK_RESULTS_FAILED, "Failed to modify the CVU CHECK_RESULTS attribute to \"{0}\""
//  *Cause: CRS was unable to modify the CVU CHECK_RESULTS attribute.
// *Action: Make sure that Clusterware stack is up. Make sure that the CVU resource has been configured. Check for and respond to any accompanying error messages.
/
2078, GET_CVU_CHECK_RESULTS_FAILED, "Failed to retrieve the CVU CHECK_RESULTS for \"{0}\""
//  *Cause: An attempt to retrieve the CHECK_RESULTS attribute for the CVU cluster resource failed.
// *Action: Make sure that the Clusterware stack is up. Make sure that the CVU resource has been configured. Check for and respond to any accompanying error messages.
/
2079, PORT_OUT_OF_RANGE, "Port {0} is out of the valid range, between 1 and 65535 and cannot be used on any of the nodes given"
//  *Cause: The port number that was provided was either less than 1 or greater than 65535.
// *Action: Make sure the port provided has a value between 1 and 65535.
/
2080, ADDRESS_TYPE_NOT_EXISTS, "Address type does not exist for resource {0}"
//  *Cause: An attempt was made to query address type for a network resource configured with Oracle clusterware and it was not found.
// *Action: Contact Oracle Support Services.
/
2081, MODIFY_NETWORK_FAILED_IPV6, "Failed to modify network number {0} to use subnet \"{1}\" with prefix length \"{2}\", adapters \"{3}\" and address type \"{4}\""
//  *Cause: CRS was unable to modify the network resource to use new subnet/prefix length/interface/address type.
// *Action: Check accompanying error message(s) for details, then ensure that:
//          - The clusterware stack is up.
//          - The subnet, prefix legth, address type and adapters values are correct.
//          - The network interface referred to is running.
//          - The user trying to modify the network resource has root privileges.
/
2082, INVALID_DHCP_SERVER_TYPE_FOR_SPECIFIED_NETWORK, "Setting the server type to \"{0}\" is not allowed for an {1} network" 
//   *Cause: An attempt was made to set the IPv4 network server type to 'autoconfig' or to set the IPv6 network server type to 'static' .
//   *Action: Make sure that the network is IPv4 or IPv6 when trying to set the server type to 'dchp' or 'autoconfig' respectively.
/
2083, NOT_ALLOWED_DHCP_SERVER_TYPE_MODIFICATION, "Modifying the server type from \"{0}\" to \"{1}\" directly is not allowed" 
//   *Cause: An attempt was made to change the network server type from 'static' to a dynamic type (or the reverse) without the required intermediate setting of 'mixed'.
//   *Action: First change the server type to 'mixed', then retry the command.
/
2084, SET_DHCP_SERVER_TYPE_FAILED_FOR_SPECIFIED_ADDR_TYPE, "Failed to update the {0} server type to \"{1}\" \n{2}"
//  *Cause: An attempt to update the server type for the network resource failed because its value could not be updated in the Oracle Clusterware resource attribute.
// *Action: Make sure that the Clusterware stack is up. Make sure that the user has enough permission to modify node applications. Examine the accompanying message for additional details.
/
2085, LINK_LOCAL_IPV6_ADDRESS_CONFLICT, "There exists already another network (\"{0}\") with the same IPv6 link-local subnet"
//  *Cause: Already registered another nework with the same IPv6 link-local subnet.
// *Action: Make sure that the IPv6 link-local subnet is unique among the existing networks.
/
2086, SET_CRSHOME_SPACE_ALERT_STATE_FAILED, "Failed to modify the CRSHOME_SPACE_ALERT_MODE attribute of the CVU resource to \"{0}\""
//  *Cause: Cluster Ready Service (CRS) was unable to modify the CRSHOME_SPACE_ALERT_MODE
//          attribute of the Cluster Verification Utility (CVU) CRS resource.
// *Action: Make sure that the Oracle Clusterware stack is up. Make sure that the CVU 
//          resource has been configured. Examine and respond to any accompanying error messages.
/
2087, GET_CRSHOME_SPACE_ALERT_STATE_FAILED, "Failed to retrieve the CRSHOME_SPACE_ALERT_MODE attribute of the CVU resource" 
//  *Cause: An attempt to retrieve the CRSHOME_SPACE_ALERT_MODE attribute of 
//          the Cluster Verificiation Utility (CVU) cluster resource failed.
// *Action: Make sure that the Oracle Clusterware stack is up. Make sure that the CVU 
//          resource has been configured. Examine and respond to any accompanying error messages.
/
2088, DEST_LOC_NOT_ABSOLUTE_PATH, "The value specified \"{0}\" for command line option \"{1}\" is not an absolute directory path."
//  *Cause: The specified value for command line option '-destloc' was not 
//          an absolute directory path. 
// *Action: Make sure that the path specified is an absolute directory path 
//          that either exists or can be created.
/
2089, DEST_LOC_IS_FILE, "The value specified \"{0}\" for command line option \"{1}\" is not a directory."
//  *Cause: The specified value for command line option '-destloc' was not a
//          directory.
// *Action: Make sure that the path specified is an absolute directory path 
//          that either exists or can be created.
/
2090, DEST_LOC_NOT_CREATED, "Directory \"{0}\" could not be created on nodes \"{1}\"."
//  *Cause: The specified directory could not be created on the nodes specified.
// *Action: Examine the accompanying error message for details.
/
2091, SET_CV_DESTLOC_FAILED, "failed to modify the CV_DESTLOC attribute of the CVU resource to \"{0}\""
//  *Cause: Cluster Ready Services (CRS) was unable to modify the CV_DESTLOC
//          attribute of the Cluster Verification Utility (CVU) CRS resource.
// *Action: Make sure that the Oracle Clusterware stack is up. Make sure that
//          the CVU resource has been configured using the command 
//          'srvctl config cvu'. Examine and respond to any accompanying 
//          error messages.
/
2092, GET_CV_DESTLOC_FAILED, "failed to retrieve the CV_DESTLOC attribute of the CVU resource" 
//  *Cause: An attempt to retrieve the CV_DESTLOC attribute of the Cluster 
//          Verification Utility (CVU) cluster resource failed.
// *Action: Make sure that the Oracle Clusterware stack is up. Make sure that
//          the CVU resource has been configured using the command 'srvctl 
//          config cvu'. Examine and respond to any accompanying error messages.
/
2093, DEST_LOC_IS_SHARED, "Directory \"{0}\" specified for command line option \"{1}\" is on a shared file system path."
//  *Cause: The directory specified for command line option '-destloc' was on a
//          shared file system path.
// *Action: Make sure that the path specified is not on a shared file system
//          path.
/
2094, DEST_LOC_NO_PERMISSION, "Directory \"{0}\" specified for command line option \"{1}\" is not writable."
//  *Cause: The directory specified for command line option '-destloc' was not
//           writable.
// *Action: Make sure that the path specified is writable by the current user.
/
3000, IPMI_FAILED_ON_ALL_NODES, "The IPMI configuration failed on all nodes"
// *Cause: The node names were invalid or were valid but had no IPMI device present. 
// *Action: Make sure that all nodes are reachable and the IPMI device exists on those nodes.
/
3001, IPMI_FAILED_ON_ONE_OR_MORE_NODES, "The IPMI configuration failed on one or more nodes"
// *Cause: There was at least one node with invalid name or with no IPMI device. 
// *Action: Make sure that all nodes are reachable and the IPMI device exists on those nodes.
/
3002, NO_NET_RES_EXIST, "There is no network resource configured for the cluster"
//  *Cause: A request to add a listener was rejected due to the lack of a network resource.
// *Action: Use the command 'srvctl add network' to configure the network first, then retry the command.  
/
3003, FAILED_UNREGISTER_EONS_TYPE, "Failed to unregister EONS resource type"
//  *Cause: A request to unregister the EONS resource type failed because of the reason provided by an accompanying exception message.
// *Action:  Examine the accompanying error message for details. 
/
3004, LISTENER_ALREADY_CREATED, "Listener {0} already exists"
//  *Cause: The specified listener was already created.
// *Action: Use the command 'srvctl modify listener' to modify attributes if needed.
/
3005, NETWORK_INTERFACE_DIF, "Failed to add or use registered network {0} with network interfaces ''{1}'' because the network was already registered for network interfaces ''{2}''" 
//  *Cause: The network resource was already registered with different interfaces. 
// *Action: Use the same network interfaces as the one registered with network resource. 
/
3006, NETWORK_INTERFACE_NON, "Failed to add or use registered network {0} with network interfaces ''{1}'' because the network was already registered with no interface specified" 
//  *Cause: The network resource was already registered with no user specified interface. 
// *Action: Do not specify network interface as the system decides the network interface. 
/ 
3007, NETWORK_NETMASK_DIF, "Failed to add or use registered network {0} with network mask ''{1}'' because the network was already registered for network mask ''{2}''" 
//  *Cause: The network resource was already registered with a different network mask. 
// *Action: Use the same network mask as the one registered with network resource. 
/ 
3008, NETWORK_SUBNET_DIF, "Failed to add or use registered network {0} with network subnet ''{1}'' because the network was already registered for network subnet ''{2}''" 
//  *Cause: The network resource was already registered with a different network subnet. 
// *Action: Use the same network subnet as the one registered with network resource. 
/
3009, GET_LOG_FILE_FAILED, "Failed to retrieve log file attribute for {0} resource"
//  *Cause: An attempt to retrieve the log file attribute for the cluster resource failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the resource you are querying has been configured. Refer also to any accompanying error messages for details.
/
3010, GET_LOG_COMP_FAILED, "Failed to retrieve log component attribute for {0} resource"
//  *Cause: An attempt to retrieve the log component attribute for the cluster resource failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the resource you are querying has been configured. Refer also to any accompanying error messages for details. 
/
3011, GET_DEBUG_FILE_FAILED, "Failed to retrieve debug file attribute for {0} resource"
//  *Cause: An attempt to retrieve the debug file attribute for the cluster resource failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the resource you are querying has been configured. Refer also to any accompanying error messages for details. 
/
3012, GET_DEBUG_COMP_FAILED, "Failed to retrieve debug component attribute for {0} resource"
//  *Cause: An attempt to retrieve the debug component attribute for the cluster resource failed.
// *Action: Make sure that the clusterware stack is up. Make sure that the resource you are querying has been configured. Refer also to any accompanying error messages for details.
/
3013, SET_LOG_FILE_FAILED, "Failed to update log file attribute of {0} resource"
//  *Cause: An attempt to update the attribute value of LOG_FILE for ONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
3014, SET_LOG_COMP_FAILED, "Failed to update log component attribute of {0} resource"
//  *Cause: An attempt to update the attribute value of LOG_COMP for ONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
3015, SET_DEBUG_FILE_FAILED, "Failed to update debug file attribute of {0} resource"
//  *Cause: An attempt to update the attribute value of DEBUG_FILE for ONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
3016, SET_DEBUG_COMP_FAILED, "Failed to update debug component attribute of {0} resource"
//  *Cause: An attempt to update the attribute value of DEBUG_COMP for ONS failed.
// *Action: Examine the accompanying error message(s) and respond accordingly.
/
3017, ABOVE_MAX_CVU_CHECK_INTERVAL, "Specified check interval of {0} minutes exceeds the maximum check interval {1} minutes"
//	*Cause: The CVU resource check interval specified was more than the maximum check interval.
// *Action: Retry the operation with an interval smaller than or equal to the maximum check interval.
/
3018, SRVM_LISTENER_VERSION_MISMATCH, "Addition of listener version {0} is not allowed using srvctl version {1}" 
//   *Cause: The versions of srvctl used and listener to be created did not match.
//   *Action: Use the same version of srvctl as listener.
/
3019, INVALID_ADDRESS_TYPE_MODIFICATION, "Not allowed to modify the network address type from {0} to {1}" 
//   *Cause: An attempt was made to change the network address type directly from "IPv4" to "IPv6" or vice versa.
//   *Action: Ensure that transitions between IPv4 and IPv6 first set an intermediate address type of 'both'. 
/
3020, INVALID_LISTENERTYPE, "Invalid LISTENER type {0}"
//  *Cause: The LISTENER type supplied is not valid.
// *Action: This is an internal error; contact Oracle Support Services.
/
3021, CLUSTER_ASM_LSNR_NOT_EXIST, "No ASM listener exists"
//  *Cause: No ASM listener was configured for cluster ASM.
// *Action: Use the command 'srvctl add listener -asm' to configure an ASM listener.
/
3022, RIM_ASM_LSNR_NOT_EXIST, "Leaf ASM listener does not exist"
//  *Cause: Leaf ASM listener was not configured for leaf ASM.
// *Action: Use the command 'srvctl add listener -leaf' to configure an ASM listener.
/
3023, UNABLE_TO_RETRIEVE_NETMASK_INFO, "Unable to retrieve information about the network subnet mask"
//  *Cause: An error occurred while obtaining information about the network subnet mask.
// *Action: Examine the accompanying error messages for details.
/
3024, VIP_NETMASK_MISMATCH, "Mismatch between the subnet mask of the VIP ({0}) and that of the associated network ({1})"
//  *Cause: The subnet mask of the VIP address did not match the one of the associated network resource. 
// *Action: Make sure the VIP address has the same subnet mask as the network it belongs to.
/
3025, VIP_PREFIX_LENGTH_MISMATCH, "Mismatch between the prefix length of the VIP ({0}) and that of the associated network ({1})"
//  *Cause: The prefix length of VIP address did not match the one of the associated network resource. 
// *Action: Make sure the VIP address has the same prefix length as the network it belongs to.
/
3026, INVALID_NETMASK, "\"{0}\" is not a valid IPv4 network mask or IPv6 prefix length"
//  *Cause: The provided string was neither a valid IPv4 network mask nor a valid IPv6 prefix length.
// *Action: Contact Oracle Support.
/
3027, UNABLE_TO_DETERMINE_NETTYPE, "Unable to determine the network type"
//  *Cause: An error occured while retrieving the USR_ORA_AUTO network attribute value.
// *Action: Examine the accompanying error messages for details.
/
3028, DYNAMIC_NETTYPE, "VIP {0} address modification is not allowed because the network type is \"{1}\""
//  *Cause: An attempt was made to change the USR_ORA_VIP value for a VIP on an IPv4 network with 'dhcp' network type or on an IPv6 network with 'autoconfig' network type.
// *Action: Make sure that the network type is either 'static' or 'mixed' for the IPv4 or IPv6 type of the VIP address that you try to modify.
/
3029, TRANSITION_TO_MIXED_NETWORK_ERROR, "Transition for a network that contains both IPv4 and IPv6 addresses to an {0} network of network type 'mixed' is not allowed"
//  *Cause: An attempt was made to transiton from a network with both IPv4 and IPv6 addresses to a network that has only one type of addresses and is of network type 'mixed'.
// *Action: Finish the transition from 'DHCP' or 'autoconfig' to 'static' or vice versa and retry.
/
3030, VIP_LIST_RETRIEVAL_ERROR, "Unable to retrieve the list of VIPs for network with number {0}"
//  *Cause: An error occurred while obtaining information about the VIPs that depend on the given network.
// *Action: Examine the accompanying error messages for details.
/
3031, UNABLE_TO_RETRIEVE_VIP_ADDRESS, "Unable to retrieve information about the address of VIP resource \"{0}\""
//  *Cause: An error occurred while obtaining information about the address of the given VIP resource.
// *Action: Examine the accompanying error messages for details.
/
3032, VIP_DOES_NOT_CONTAIN_ADDRESS_TYPE, "The VIP for hosting node \"{0}\" on network number {1} does not contain an {2} address or a VIP name that resolves to an {2} address"
//  *Cause: The given VIP did not contain an IP address or a VIP name that resovled to an IP address of the displayed address type.
// *Action: Make sure that the VIP contains an IP address or a VIP name that resolves to an IP address of the displayed address type.
/
3033, SCAN_NAME_RETRIEVAL_ERROR, "Unable to retrieve the SCAN name for network {0}"
//  *Cause: An error occurred while obtaining the Single Client Access Name (SCAN) name for the specified network.
// *Action: Examine the accompanying error messages for details.
/
3034, SCAN_NAME_RESOLVES_TO_ADDRESSES_OF_WRONG_IPTYPE, "SCAN name \"{0}\" resolves to one or more {1} addresses"
//  *Cause: The given SCAN name resolved to the given type (IPv4 or IPv6) of addresses.
// *Action: Make sure that the SCAN name does not resolve to addresses of the given address type.
/
3035, SCAN_NAME_RESOLVES_TO_WRONG_NUMBER_OF_ADDRESSES, "SCAN name \"{0}\" resolves to {1} addresses instead of {2}"
//  *Cause: The given SCAN name resolved to a wrong number of addresses.
// *Action: Make sure that the SCAN name resolves to the same number of addresses as the existing SCAN VIPs by using the 'srvctl modfiy scan -scanname <scan_name>' command.
/
3036, SCAN_VIP_LIST_RETRIEVAL_ERROR, "Unable to retrieve the list of SCAN VIPs that depend on network with network number {0}"
//  *Cause: An error occurred while obtaining information about the SCAN VIPs that depend on the given network.
// *Action: Examine the accompanying error messages for details.
/
3037, UNABLE_TO_RETRIEVE_SCAN_VIP_ADDRESS, "Unable to retrieve information about the address of SCAN VIP resource \"{0}\""
//  *Cause: An error occurred while obtaining information about the address of the given SCAN VIP resource.
// *Action: Examine the accompanying error messages for details.
/
3038, SCAN_NAME_RESOLVES_TO_DIFFERENT_ADDRESSES_THAN_EXISTING_SCAN_VIPS, "SCAN name \"{0}\" resolves to different addresses than those of the existing SCAN VIPs"
//  *Cause: While attempting to change the network address type, it was found that the given SCAN name resolved to a set of addresses that are different from the ones of the existing SCAN VIPs.
// *Action: Make sure that the SCAN name resolves to the same addresses as those of the existing SCAN VIPs by using the command 'srvctl modifiy scan -scanname <scan_name>'.
/
3039, UNABLE_TO_REMOVE_VIP_ADDRESS_PART, "Unable to remove the {0} address from the VIP resource \"{1}\""
//  *Cause: An error occurred while trying to remove either the IPv4 or the IPv6 address from all the VIPs on the network.
// *Action: Examine the accompanying error messages for details.
/
3040, UNABLE_TO_REMOVE_SCAN_VIP_ADDRESS_PART, "Unable to remove the {0} address from the SCAN VIP resource \"{1}\""
//  *Cause: An error occurred while trying to remove either the IPv4 or the IPv6 address from all the SCAN VIPs on the network.
// *Action: Examine the accompanying error messages for details.
/
3041, MODIFY_NETWORK_ADDRESS_TYPE_FAILED, "Failed to modify the network address type"
//  *Cause: An error occurred while trying to modify the network address type.
// *Action: Examine the accompanying error messages for details.
/
3042, SUBNET_ALREADY_IN_USE, "Subnet \"{0}\" is already in use by a network on the cluster"
//  *Cause: The specified subnet was already registered with another network on the cluster.
// *Action: Use a unique subnet and retry the operation.
/
3043, UNABLE_TO_VERIFY_SUBNET_UNIQUENESS, "Failed to verify the uniqueness of subnet \"{0}\" among the networks of the cluster"
//  *Cause: An error occurred while trying to verify the uniqueness of the subnet.
// *Action: Examine the accompanying error messages for details.
/
3044, NO_NETWORK_SUBNET, "There is no {0} subnet for network with number {1}"
//  *Cause: No subnet of the given address type was found for the specified network.
// *Action: Modify the network to include a subnet of the specified address type and retry.
/
3045, MGMTLSNR_NOT_RUNNING, "Management listener is not running in the cluster"
//  *Cause: An attempt to retrieve the IP address failed because the management listener was not running.
// *Action: Start the management listener using the command 'srvctl start mgmtlsnr'.
/
3046, STATE_DETAILS_EMPTY, "Failed to retrieve the IP address of the management listener"
//  *Cause: An attempt to retrieve the IP address of the management listener failed in querying the management listener resource.
// *Action: Stop and restart the management listener using the commands 'srvctl stop mgmtlsnr' and 'srvctl start mgmtlsnr', then retry the command. If the problem persists, contact Oracle Support Services.
/
3047, SET_GET_SUBNET_NOT_VALID, "Failed to set or get the subnet of the listener resource"
//  *Cause: An attempt to set or retrieve the subnet of the listener failed because the operation is not allowed for this resource.
// *Action: Use the 'srvctl' commands on the underlying network resource to set or get the subnet value or create a different listener.
/
3048, LISTENER_INTERFACE_TYPE_VALIDATION_ERROR, "Listener subnet \"{0}\" is not a subnet classified {1}"
//  *Cause: While adding a management listener, the specified subnet was not classified as a subnet of the required type.
// *Action: Specify a subnet that is classified as required as reported by using the command 'oifcfg getif', or change the subnet classification to the required type using the command 'oifcfg setif'.
/
3049, CANNOT_CHANGE_NETWORK_ADDR_TYPE_TO_BOTH_MISSING_SUBNET, "Cannot change the network subnet address type to 'both' because it has only an {0} subnet address"
//  *Cause: An attempt to modify the network address type failed because the network had only one type of subnet address instead of both IPv4 and IPv6 subnet addresses.
// *Action: Make sure that the network has been configured with both IPv4 and IPv6 subnets using the command 'srvctl modify network -subnet'.
/
3050, SCAN_NAME_RESOLVES_TO_UNEQUAL_NUMBER_OF_IPV4_IPV6_ADDRESSES, "SCAN name \"{0}\" resolves to different number of IPv4 ({1}) and IPv6 ({2}) addresses"
//  *Cause: An attempt to change subnet address type to 'both' was rejected because the given SCAN name
//          resolved to a different number of IPv4 and IPv6 addresses.
// *Action: Make sure that the SCAN name resolves to the same number of IPv4 and IPv6 addresses.
/
3051, UNABLE_TO_RETRIEVE_HUB_NODES, "Unable to retrieve a list of the hub nodes"
//  *Cause: While attempting to change the subnet address type, an error occured while retrieveing a list of the hub nodes.
// *Action: Examine the accompanying message for details.
/
3052, NODES_WITHOUT_CONFIGURED_VIPS, "The following nodes do not have VIPs configured for network: {0}"
//  *Cause: While attempting to change the subnet, some nodes were found to be missing VIP addresses.
// *Action: Configure VIP addresses for the given nodes using the command 'srvctl add VIP'.
/
3053, NODES_WITHOUT_IPV4_VIPS, "The following nodes do not have configured VIPs with IPv4 addresses on network {0}: {1}"
//  *Cause: A request to change the subnet address type was rejected because the specified nodes had VIPs
//          which did not have any configured IPv4 address or a name that resolved to an IPv4 address.
// *Action: Make sure that the given nodes have configured VIPs with IPv4 address or name that resolved to an IPv4 address.
/
3054, NODES_WITHOUT_IPV6_VIPS, "The following nodes do not have configured VIPs with IPv6 addresses on network {0}: {1}"
//  *Cause: A request to change the subnet address type was rejected because the specified nodes had VIPs
//          which did not have any configured IPv6 address or a name that resolved to an IPv6 address.
// *Action: Make sure that the given nodes have configured VIPs with IPv6 address or name that resolved to an IPv6 address.
/
3055, CANNOT_CHANGE_NETWORK_ADDR_TYPE_TO_BOTH_MISSING_VIPS, "Cannot change the network subnet address type to 'both' for the following VIP related issues: {0}"
//  *Cause: An attempt to modify the network address type was rejected because the network either had no VIPs on one or more nodes or the VIPs did not have the expected address type.
// *Action: Examine the accompanying message for details.
/
3056, VIP_ADDRESS_OF_DIFFERENT_TYPE_THAN_NETWORK, "The VIP address \"{0}\" is an {1} address, while network {2} has no {3} subnet"
//  *Cause: The VIP with the given address had a different address type than the network subnet address type.
// *Action: Either modify the network via the command 'srvctl modify network -subnet' to include the missing type or make sure that the VIP address type matches the address type of the network subnet.
/
3057, VIP_RESOLVES_TO_ADDRESS_OF_DIFFERENT_TYPE_THAN_NETWORK, "The VIP name \"{0}\" resolves to one or more {1} addresses (\"{2}\"), while network {3} has no {1} subnet"
//  *Cause: The VIP name mapped to an address with different address type than the network subnet address type.
// *Action: Either modify the network via the command 'srvctl modify network -subnet' to include the missing type or make sure that the VIP name resolves to addresses that matche the address type of the network subnet.
/
3058, INVALID_ASM_UPDATE_LSNR, "Cannot update listener that is not an ASM listener"
// *Cause: An attempt was made to update a non-ASM listener.
// *Action: Specify the name of an ASM listener on the command line. Use the command 'srvctl config listener -asmlistener' to display ASM listener names.
/
3059, NETNUM_RETRIEVAL_ERROR, "Unable to retrieve the network number"
//  *Cause: An error occurred while attempting to retrieve the network number.
// *Action: Examine the accompanying error messages for details.
/
3060, NETWORK_LIST_RETRIEVAL_ERROR, "Unable to retrieve the list of configured networks on the cluster"
//  *Cause: An error occurred while attempting to retrieve the set of configured network resources 'ora.net*.network'.
// *Action: Examine the accompanying error messages for details.
/
3061, INVALID_NETWORK_TYPE_FOR_IPV4_NETWORK, "The specified network server type \"{0}\" is invalid for an \"IPv4\" network."
//  *Cause: The network server type was specified as 'autoconfig' which is not valid for an IPv4 network.
// *Action: The network server type must be 'static' or 'dhcp' or 'mixed'.
/
3062, INVALID_NETWORK_TYPE_FOR_IPV6_NETWORK, "The specified network server type \"{0}\" is invalid for an \"IPv6\" network."
//  *Cause: The network server type was specified as 'dhcp' which is not valid for an IPv6 network.
// *Action: The network server type must be 'static' or 'autoconfig' or 'mixed'.
/
3063, NO_DEFAULT_PORT_AVAILABLE_IN_CLUSTER, "Failed to find an available port in the default TCP port range {0} - {1} among nodes: {2}"
//  *Cause: An attempt to find an available default TCP port failed because all default TCP ports were used by some other applications in at least one node in the cluster.
// *Action: Specify a port to be used outside the default TCP port range using 'srvctl add listener -endpoints'
/
3064, INVALID_USER, "The user \"{0}\" could not be found on the cluster"
//  *Cause: The user specified as the listener owner was not a known OS user name.
// *Action: Enter the name of an existing OS user as the owner of the specified listener.
/
3065, LEAF_DEFAULT_NETWORK_ERROR, "Cannot configure the default network as leaf."
//  *Cause: An attempt was made to configure the default network with the leaf category.
// *Action: Provide a non-default network when using SRVCTL to add a network resource with the '-leaf' flag.
/
3066, LEAF_BIG_CLUSTER_ERROR, "Cannot configure network resource as leaf because cluster is not configured as Flex Cluster."
//  *Cause: An attempt was made to add a network resource with the leaf category in a cluster not configured as Flex Cluster.
// *Action: Use SRVCTL without the '-leaf' flag when adding a network resource in a non-Flex Cluster system. Or, convert the cluster to a Flex Cluster before doing this operation.
/
3067, LSNR_INVALID_MOD_USER, "Unable to modify the owner for an ASM or leaf listener."
//  *Cause: An attempt was made to modify the owner of a ASM or leaf listener resource.
// *Action: Repeat the operation specifying a node listener.
/
3068, UNABLE_TO_DETERMINE_IF_VIP_BELONGS_TO_NETWORK, "Unable to determine whether the VIP address \"{0}\" belongs to network with number {1}"
//  *Cause: An error occurred while trying to determine whether the VIP address matches the network subnet.
// *Action: Examine the accompanying error messages for details.
/
3069, UNABLE_TO_DETERMINE_IF_VIP_BELONGS_TO_NETWORK_INCL_SUBNET_INFO, "Unable to determine whether the VIP address \"{0}\" belongs to network with number {1} and subnet number {2}"
//  *Cause: An error occurred while trying to determine whether the VIP address matches the network subnet.
// *Action: Examine the accompanying error messages for details.
/
3070, VIP_DOES_NOT_BELONG_TO_NETWORK, "The VIP address \"{0}\" does not belong to network with number {1} and subnet number {2}"
//  *Cause: The VIP address did not match the subnet of the specified network.
// *Action: Make sure that the VIP address or the address the VIP name resolves to matches the network subnet.
/
3071, NETWORK_INVALID_PING_TARGET, "Invalid address or unknown host \"{0}\""
//  *Cause: An attempt was made to configure a network resource with an invalid address or host name.
// *Action: Specify a resolvable host name or an IP address of legal length.
/
3072, HAVIP_INVALID_HOMENODE, "Unable to modify the home node of the HAVIP."
//  *Cause: An attempt to modify the home node of the HAVIP failed because there was an export file system registered with the same path, export options and HAVIP home node.
// *Action: Provide a different home node or examine the accompanying error messages for details.
/
3073, HAVIP_INVALID_HOMENODE_SYNTAX, "Invalid node name: {0}"
//  *Cause: The home node name was invalid. The home node name must contain alphanumeric characters and hyphens only. It cannot be a fully qualified domain name.
// *Action: Check the home node name and try again.
/
3074, NETWORK_DUPLICATED_PING_TARGET, "The specified ping target list contains duplicate addresses."
//  *Cause: The specified ping target list was invalid. It contained duplicate IP addresses or host names that resolve to duplicate IP addresses.
// *Action: Reissue the command without elements that are or resolve to the same
addresses.
/
3075, ASM_MGMT_PORT_UNAVAILABLE, "The specified TCP ports ({0}) are configured for another ASM or management listener."
//  *Cause: An attempt to add an ASM or management listener failed because one or more of the specified ports were already configured for another ASM or management listener.
// *Action: Retry the command specifying a port not in use by another ASM or management listener.
/
3076, NO_DEFAULT_PORT_AVAILABLE, "Unable to find an available port in the default TCP port range {0} - {1}"
//  *Cause: An attempt to find an available default TCP port failed because all default TCP ports were configured for other ASM or management listeners.
// *Action: Retry the command specifying a port outside the default TCP port range.
/
3077, INVALID_PORT_PRIVILEGED, "The specified ports {0} are in the privileged ports range."
//  *Cause: The specified ports were in the privileged ports range (0-1023) which can only be used by daemons running as user 'root'.
// *Action: Specify port numbers greater than 1023.
/
3078, SETTING_ADDR_TYPE_TO_IPV4_NOT_ALLOWED, "Setting the address type to \"ipv4\" is not allowed because the existing network address type is \"ipv6\"."
//  *Cause: An attempt to change the address type from 'ipv6' to 'ipv4' directly was rejected because the address type must first be changed to 'both' then to 'ipv4'.
// *Action: Use the command 'srvctl modify network' to change the network type to 'both' by adding an IPv4 subnet and retry the command.
/
3079, SETTING_ADDR_TYPE_TO_IPV6_NOT_ALLOWED, "Setting the address type to \"ipv6\" is not allowed because the existing network address type is \"ipv4\"."
//  *Cause: An attempt to change the address type from 'ipv4' to 'ipv6' directly was rejected because the address type must first be changed to 'both' then to 'ipv6'.
// *Action: Use the command 'srvctl modify network' to change the network type to 'both' by adding an IPv6 subnet and then retry the command.
/
3080, NETWORK_SUBNET_MIXED_ERROR, "The network configuration cannot be modified when the network type is 'mixed'."
//  *Cause: An attempt to modify a network configuration was rejected because either the IPv4 or IPv6 subnet is configured with 'mixed' network type.
//  *Action: Change the network type to 'static' or 'dhcp' or 'autoconfig' before proceeding with the configuration change.
/
3081, ASM_LISTENER_SUBNET_ERROR, "The specified subnet ({0}) is already configured for ASM listener \"{1}\"."
//  *Cause: An attempt to add or modify an ASM listener was rejected because the specified subnet was already used for another ASM listener.
//  *Action: Retry the command specifying a subnet that is not in use by another ASM listener.
/
3082, OC4J_ALREADY_RUNNING, "An attempt to modify the OC4J port failed because OC4J is running. Use -force to force stop and restart of OC4J."
//   *Cause: A request to modify the port number of OC4J was rejected because such modification requires OC4J to be stopped and restarted.
//   *Action: Use '-force' option to force restart of OC4J.
/
3083, OC4J_MODIFY_PORTS_SAME_NUMBER, "failed to modify OC4J when trying to set the HTTP port and Remote Method Invocation (RMI) port to the same number {0}"
//  *Cause: A request to modify the OC4J port numbers was rejected because the HTTP port number was the same as the Remote Method Invocation (RMI) port number.  
// *Action: Choose a different port that is not in use.
/
3084, OC4J_MODIFY_RMIPORT_CONFLICT_LISTENER, "failed to modify RMI port for OC4J to use the port number {0} that is used by the listener {1}"
//  *Cause: A request to modify the OC4J Remote Method Invocation (RMI) port number was rejected because the specified port was already used by a node listener.
// *Action: Choose a different port number that is not used as an HTTP port or a node listener port.
/
3085, OC4J_MODIFY_HTTPPORT_CONFLICT_LISTENER, "failed to modify HTTP port for OC4J to use the port number {0} that is used by the listener {1}"
//  *Cause: A request to modify the OC4J HTTP port number was rejected because the specified port was already used by a node listener.
// *Action: Choose a different port number that is not used as an RMI port or a node listener port.
/
3086, NETCONFIG_MERGE_ERROR, "failed to merge files \"{0}\" and \"{1}\""
//   *Cause: An attempt to merge the two indicated network configuration files failed.
//   *Action: Examine the accompanying error messages for details, resolve issues and retry.
/
3087, NO_DNS_SERVER_HOST_FOUND, "An attempt to extract the DNS name server IP address from file \"{0}\" failed."
//   *Cause: No DNS name server IP address was specified in the specified file.
//   *Action: Make sure that there is a line in the specified file that starts with 'nameserver' followed by the GNS name server IP address.
/
3088, SET_QOSMSERVER_PORT_FAILED, "failed to modify the listening port of the QoS Management Server to {0}"
//  *Cause: An attempt to modify the listening port of the QoS Management Server failed.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors.
/
3089, QOSMSERVER_ALREADY_RUNNING, "An attempt to modify the QoS Management Server port failed because the QoS Management Server is running. Use '-force' to force stop and restart of the QoS Management Server."
//   *Cause: A request to modify the port number of the QoS Management Server was rejected because such modification requires the QoS Management Server to be stopped and restarted.
//   *Action: Use '-force' option to force restart of the QoS Management Server.
/
3090, QOSMSERVER_MODIFY_PORTS_SAME_NUMBER, "failed to modify the QoS Management Server when trying to set the HTTP port and Remote Method Invocation (RMI) port to the same number {0}"
//  *Cause: A request to modify the QoS Management Server port numbers was rejected because the HTTP port number was the same as the Remote Method Invocation (RMI) port number.  
// *Action: Choose a different port that is not in use.
/
3091, QOSMSERVER_MODIFY_RMIPORT_CONFLICT_LISTENER, "failed to modify RMI port for the QoS Management Server to use port number {0} that is used by listener {1}"
//  *Cause: A request to modify the QoS Management Server Remote Method Invocation (RMI) port number was rejected because the specified port was already used by a node listener.
// *Action: Choose a different port number that is not used as an HTTP port or a node listener port.
/
3092, QOSMSERVER_MODIFY_HTTPPORT_CONFLICT_LISTENER, "failed to modify HTTP port for the QoS Management Server to use port number {0} that is used by listener {1}"
//  *Cause: A request to modify the QoS Management Server HTTP port number was rejected because the specified port was already used by a node listener.
// *Action: Choose a different port number that is not used as a Remote Method Invocation (RMI) port or a node listener port.
/
3093, UNABLE_TO_REMOVE_GNS_VIP_ADDRESS_PART, "failed to remove the {0} address from the GNS VIP resource"
//  *Cause: An error occurred while trying to remove either the IPv4 or the IPv6 address from the Grid Naming Service (GNS) virtual IP (VIP) resource.
//  *Action: Examine the accompanying error messages for details.
/
3094, FIREWALL_ENDPOINT_ERROR, "The FIREWALL endpoint parameter cannot be set for protocol {0}."
//  *Cause: The FIREWALL parameter was specified for a listener endpoint protocol that does not support it.
// *Action: Specify the FIREWALL parameter only with TCP, TCPS, SDP, or EXADIRECT protocols.
/
3095, FIREWALL_LISTENER_ERROR, "The FIREWALL endpoint parameter cannot be set for listener {0}."
//  *Cause: The FIREWALL parameter was specified for a listener type that does not support it.
// *Action: Specify the FIREWALL parameter only for a node listener.
/
3096, FIREWALL_INVALID_VALUE, "The value \"{0}\" is invalid for the FIREWALL endpoint parameter."
//  *Cause: The specified FIREWALL parameter value is invalid.
// *Action: Specify the FIREWALL parameter with the values ON or OFF only.
/
3097, LISTENER_GROUP_ERROR, "invalid specification of group for an endpoint without the FIREWALL parameter specified"
//  *Cause: A request to set the group for the LISTENER resource was rejected because the endpoint provided did not contain the FIREWALL parameter.
// *Action: Specify the FIREWALL parameter with the values ON or OFF on TCP, TCPS, SDP or EXADIRECT protocols.
/
3098, NETTYPE_MIXED_MODIFICATION_FAILED, "failed to modify network type to 'mixed' because GNS is not configured"
//  *Cause: An attempt to modify the network type to 'mixed' failed because Grid Naming Service (GNS) was not configured.
// *Action: Configure Grid Naming Service (GNS) and retry the 'srvctl modify network' command.
/
3099, NETTYPE_MIXED_GNS_SUBDOMAIN_ERROR, "failed to modify network type to 'mixed' because GNS resource does not have a subdomain configured"
//  *Cause: An attempt to modify the network type to 'mixed' failed because Grid Naming Service (GNS) did not have a subdomain configured.
// *Action: Add a Grid Naming Service (GNS) with a subdomain and retry the command 'srvctl modify network'.
/
3100, NETWORK_CONFLICT_DATABASE, "failed to remove network {0} because it is registered as the default network for database services of database {1}"
//  *Cause: An attempt to remove the indicated network resource failed because it was registered as the default network for database services of the indicated database.
// *Action: Specify a new default network for the database services in the database before removing the network resource using 'srvctl modify database -db <database_name> -defaultnetnum <netnum>'.
/
3101, REMOVE_ASMLSNR_FAILED, "ASM listener \"{0}\" can not be removed with the -force option"
//  *Cause: A request to remove the ASM listener with the -force option was rejected because ASM listeners cannot be removed by the command 'srvctl remove listener -listener <lsnr_name> -force'.
// *Action: Use the command 'srvctl update listener -listener <lsnr_name> -asm -remove' instead. 
/
3102, OC4J_ADD_NOT_SUPPORTED, "Command 'srvctl add oc4j' is not supported"
//  *Cause: An unsupported command was specified.
// *Action: Use the 'srvctl add qosmserver' command instead.
/
3103, GET_TLS_ENABLED_FAILED, "failed to determine whether security is enabled for resource {0}"
//  *Cause: An attempt to determine whether security was enabled for the cluster resource failed.
// *Action: Ensure that the resource you are querying has been configured. Also, consult the help for the accompanying error messages.
/
3104, GNS_VIP_DOES_NOT_CONTAIN_ADDRESS_TYPE, "The GNS VIP does not have an address of type {0}."
//  *Cause: The given GNS virtual IP address did not have an 
//          IP address of the displayed address type (IPv4 or IPv6).
// *Action: Ensure that the GNS virtual ip address has an 
//          IP address of the displayed address type (IPv4 or IPv6).
/
3105, ADD_VIP_FAILED, "Failed to add the VIP resource"
//  *Cause: An error occurred while trying to add the VIP resource.
// *Action: Examine the accompanying error messages for details.
/
3106, GET_NEWTORK_FAILED, "Failed to obtain the network resource"
//  *Cause:  An error occurred while trying to obtain the network resource
// *Action: Examine the accompanying error messages for details.
/
3107, SET_RHPPLSNR_PORT_FAILED, "Failed to modify the Rapid Home Provisioning progress listener port to {0}."
//  *Cause: An attempt to modify the listening port of the Rapid Home
//          Provisioning listener to the indicated value failed.
// *Action: Ensure that the Oracle Clusterware stack is up and that the
//          specified listener port is not in use by another program and retry.

3108, SET_RHPPLSNR_HOST_FAILED, "Failed to modify the Rapid Home Provisioning progress listener host to {0}."
//  *Cause: An attempt to modify the host of the Rapid Home Provisioning 
//          listener to the indicated host name failed.
// *Action: Ensure that the Oracle Clusterware stack is up and that the 
//          specified listener host is valid and retry.
/
3109, GET_HOST_FAILED, "Failed to retrieve host for {0}."
//  *Cause: An attempt to retrieve the host for the indicated cluster resource 
//          failed.
// *Action: Ensure that the clusterware stack is up and that the resource 
//          being queried is configured and retry.
/
3110, GET_ISLOCAL_RHPS_FAILED, "failed to determine whether local attribute is enabled for resource {0}"
//  *Cause: An attempt to determine whether the local attribute was enabled for
//          the indicated cluster resource failed.
// *Action: Ensure that the Oracle Clusterware stack is up and that the queried 
//          resource is configured, and then retry the operation.
/
3111, GET_HTTPS_ENABLED_FAILED, "failed to determine whether HTTP security is enabled for resource {0}"
//  *Cause: An attempt to determine whether HTTP security was enabled for the 
//          cluster resource failed. The accompanying messages provide detailed 
//          failure information.
// *Action: Ensure that the indicated resource has been configured. Examine the
//          accompanying messages, resolve the indicated problems, and then
//          retry the operation.
/
3112, MODIFY_SCAN_CLIENT_ERROR, "failed to modify SCAN because it is registered on a SCAN client cluster"
//  *Cause: An attempt to modify a Single Client Access Name (SCAN) resource 
//          was rejected because it was configured on a client cluster.
// *Action: SCAN client resources cannot be modified. Remove and add the 
//          resource again with the updated client data configuration.
/
3113, PORT_NOT_AVAILABLE_ADDRESS, "Port {0} is not available for addresses: {1}"
//  *Cause: An attempt to check that the indicated port could be reached failed 
//          because the port was already in use by another application.
// *Action: Retry the operation, specifying a port that is not in use by
//          another application.
/
3114, TRANSFER_PORT_NOT_AVAILABLE, "no port available for use in specified port range {0} to {1} on node {2}"
//  *Cause: An attempt to obtain a free port in the indicated port range
//          failed because all ports in the range were already in use.
// *Action: Set the transfer port range on a Rapid Home
//          Provisioning (RHP) Server to a range that has additional ports
//          available for use, and then retry the operation.
/
3115, INVALID_DEPTYPE, "invalid ASM Network dependency type {0}"
//  *Cause: An attempt to modify or add an ASM network was rejected because 
//          the specified network dependency type was neither 'optional' 
//          nor 'mandatory'.
// *Action: Retry the add or modify operation specifying a valid ASM network
//          dependency type of either 'optional' or 'mandatory'.
/
3116, ASM_LISTENER_NO_ASMNETWORK, "There is no ASM network resource configured for ASM listener {0} on subnet {1}."
//  *Cause: An attempt to retrieve the ASM network configuration or to add
//          an ASM listener for the indicated subnet was rejected because 
//          there was no ASM network resource configured for the indicated 
//          subnet.
// *Action: Use the commands 'srvctl add asmnetwork -netnum <network_number> 
//          -subnet <subnet>' and 'srvctl modify listener -l <asmlistener> 
//          -netnum <network_number>' to configure the ASM network and ASM 
//          listener, then retry the command.  
/