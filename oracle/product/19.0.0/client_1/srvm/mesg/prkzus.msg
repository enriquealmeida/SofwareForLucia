// Copyright (c) 2008, 2019, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrkzMsg.msg
//
// DESCRIPTION
//    Message file for havip and exportfs resources
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//    apfwkr      02/01/19 - Backport mpradeep_bug-28860208 from main
//    mpradeep    10/31/18 - Backport mpradeep_bug-28628776 from main
//    apfwkr      10/17/18 - Backport mpradeep_bug-28698499 from main
//    mpradeep    01/14/19 - 28876039 - Make start/stop asmnetwork changes
//    mpradeep    10/04/18 - 28698499 - Fix start/stop asmnetwork usage
//    mpradeep    09/21/18 - Add asmnetwork number display
//    mpradeep    06/29/18 - 28147329 leaf desupport
//    mpradeep    06/27/18 - 28252133 Fix typo
//    mpradeep    05/25/18 - 28072000 - Add a new option -failback
//    mpradeep    04/09/18 - 27430290 - Support for modify
//    mpradeep    04/04/18 - 26991264 Add a new resource attribute for temp
                  location
//    mpradeep    03/09/18 - 27657264 - Add start/stop for asmnetwork
//    rakebhat    01/23/18 - fix bug 27427831
//    aaniyeri    09/26/17 - fix bug 25238128
//    jorgepe     09/08/17 - Fix bug 26771035
//    jorgepe     08/22/17 - Fix bug 26655240
//    jesusfer    07/26/17 - fix bug 22893630
//    ocordova    05/26/17 - Adding HTTP TLS
//    ccharits    04/26/17 - Added messages for TFA status
//    rakebhat    04/12/17 - message update for bug 25394507
//    ccharits    04/05/17 - Added -port_range for use in ghs
//    vinavish    03/31/17 - fix bug 23059880
//    rakebhat    03/21/17 - fix bug 25394507
//    rdesale     11/22/16 - fix bug 22593058
//    rakebhat    11/09/16 - fix bug 24755458
//    vinavish    10/03/16 - fix bug 24492032
//    vinavish    08/29/16 - fix bug 23523528
//    ocordova    01/21/16 - Enable TLS support
//    epineda     02/02/16 - 22581023,21899871
//    pevilla     11/16/15 - Reader Farm support
//    epineda     11/05/15 - Fix 21918483: CIFS to SMB rename
//    pevilla     10/23/15 - HA NFS Locking support
//    epineda     10/13/15 - Bugfix 21893280
//    mpradeep    10/06/15 - 18516379 - Check if the hostname/address is valid
//    pevilla     06/17/15 - Modify usage for listener
//    ocordova    06/09/15 - Add mgmtdb credential info
//    spavan      03/31/15 - fix bug20633431 - add message for modify destloc
//    pevilla     11/18/14 - Fix bug 17786986, add SCAN_DYNAMIC_CONFIG and
//                           SCAN_STATIC_CONFIG
//    epineda     11/14/14 - CIFS: start/stop support
//    ocordova    10/13/14 - Fix bug 18956364
//    epineda     07/24/14 - Add CIFS support
//    ksviswan    05/16/14 - XbranchMerge ksviswan_bug-18707931 from
//                           st_has_12.1
//    marbharg    04/30/14 - Backport marbharg_bug-18555668 from main
//    marbharg    04/17/14 - Bug Fix - 18555668
//    epineda     04/15/14 - Backport epineda_bug-15977353 from main
//    epineda     03/28/14 - Bugfix 15977353: add support for mountfs
//    pevilla     01/23/14 - Fix bug 18080563, add DEFINE_SKIP_VIP_ONS
//    ccharits    08/09/13 - Fixed bug 17245464
//    ccharits    08/02/13 - Added message
//                           ADD_NETWORK_SUBNET_WITH_MIXED_NETTYPE_ERROR
//    ccharits    08/01/13 - Added messages VIP_NAME_DOES_NOT_RESOLVE and
//                           VIP_NAME_RESOLVES_TO_UNKNOWN_ADDRESS
//    pevilla     07/01/13 - add DEFINE_PING_TARGET
//    ocordova    06/26/13 - HANFS 12.1.0.1 ODA changes
//    pevilla     06/13/13 - Fix bug 16931995, change
//                           MODIFY_NODEAPPS_NETTYPE_ERROR message
//    pevilla     05/21/13 - Fix bug 16619871, add VIP_NETNUM_ERROR
//    ccharits    04/25/13 - Added message INVALID_INVITED_SUBNETS_SYNTAX
//    pevilla     04/19/13 - Fix bug 15866191, Change message
//                           AMBIGUOUS_NETTYPE_MODIFICATION
//    fmaring     04/17/13 - fixbug 7507578
//    yifyang     04/17/13 - bug-16196459
//    yizhang     03/14/13 - Define UNSUPPORTED_NOUN_CLIENT_CLUSTER
//    rwessman    11/19/12 - Bug 15892385 - Changed GNS to return null instead
//                           of an error number if the subdomain is not set.
//    rwessman    11/16/12 - Added message to indicate that GNS is not serving
//                           a domain.
//    satg        11/14/12 - Fix bug 14730028
//    ccharits    11/13/12 - Added -messages DEFINE_LSNR_INVITED_NODES
//                           and DEFINE_LSNR_INVITED_SUBNETS
//    pevilla     10/29/12 - Fix bug 13968141, Add leaf option
//    vobulapu    10/10/12 - Fix bug 14111747
//    pevilla     10/02/12 - Fix bug 13776656
//    pevilla     09/03/12 - Fix bug 13450275
//    satg        08/08/12 - fix bug 14353184
//    ccharits    08/02/12 - Fixed bug 13530003
//    pevilla     08/02/12 - Update usage for HAVIP, fix bugs 13962051,
//                           13474844
//    ocordova    07/30/12 - Clients argument to export_clients in ADD_EXPORTFS
//    ccharits    07/30/12 - Added message DEFINE_ALL_VOLUME_RUNNING_NODES
//    pevilla     07/05/12 - Fix bug 13962030
//    epineda     04/19/12 - Corrected usage for add havip
//    ccharits    04/03/12 - Added message MODIFY_ADDRESS_TYPE_TO_BOTH_ERROR
//    ksviswan    04/02/12 - added message for bug 13109375
//    ccharits    03/27/12 - Added messages INVALID_SUBNET_STRING and
//                           INVALID_NETMASK_STRING
//    ksviswan    03/22/12 - correct modify exportfs syntax
//    ksviswan    03/12/12 - update exportfs grouping syntax
//    ccharits    02/02/12 - Added message AMBIGUOUS_NETTYPE_MODIFICATION
//    ksviswan    01/05/12 - added messages for config exportfs
//    xesquive     12/16/11  - Added message when there not exists the havip
//    ccharits     10/20/11  - Added usage messages for network, vip, nodeapps
//    ksviswan     10/18/11  - message corrections for havip
//    ksviswan     09/26/11  - additional file for srvctl messages.
// PACKAGE=package oracle.ops.opsctl.resources;
// MSGIDTYPE=interface
1000, ADD_EXPORTFS_PURPOSE, "\nAdds the export file system configuration to the Oracle Clusterware\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1001, ADD_HAVIP_PURPOSE, "\nAdds a HAVIP configuration to the Oracle Clusterware\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1002, REMOVE_HAVIP_PURPOSE, "\nRemoves the specified HAVIP configuration\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1003, REMOVE_EXPORTFS_PURPOSE, "\nRemoves the specified export file system configuration\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1004, START_HAVIP_PURPOSE, "\nStarts the specified HAVIP\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1005, START_EXPORTFS_PURPOSE, "\nStarts the specified export file system\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1006, STOP_HAVIP_PURPOSE, "\nStops the specified HAVIP\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1007, STOP_EXPORTFS_PURPOSE, "\nStops the specified export file system\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1008, CONFIG_HAVIP_PURPOSE, "\nDisplays the configuration information for the specified HAVIP\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1009, CONFIG_EXPORTFS_PURPOSE, "\nDisplays the configuration information for the specified export file system\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1010, STATUS_HAVIP_PURPOSE, "\nDisplays the current state of the specified HAVIP\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1011, STATUS_EXPORTFS_PURPOSE, "\nDisplays the current state of the export file system\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1012, ENABLE_HAVIP_PURPOSE, "\nEnable HAVIP for Oracle Clusterware management\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1013, ENABLE_EXPORTFS_PURPOSE, "\nEnable export file system for Oracle Clusterware management\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1014, DISABLE_HAVIP_PURPOSE, "\nDisable HAVIP for Oracle Clusterware management\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1015, DISABLE_EXPORTFS_PURPOSE, "\nDisable export file system for Oracle Clusterware management\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1016, HAVIP_RUNNING_NODE, "HAVIP {0} is running on nodes {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1017, HAVIP_NOT_RUNNING, "HAVIP {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1018, HAVIP_STATUS_ENABLED, "HAVIP {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1019, HAVIP_STATUS_DISABLED, "HAVIP {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1020, EXPORTFS_RUNNING_NODE, "export file system {0} is exported on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1021, EXPORTFS_NOT_RUNNING, "export file system {0} is not exported"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1022, EXPORTFS_STATUS_ENABLED, "export file system {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1023, EXPORTFS_STATUS_DISABLED, "export file system {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1024, HAVIP_EXIST, "HAVIP exists: {0} network number {1}"
//  *Document:No 
//  *Cause: Status message
// *Action: Not an error
/
/
1025, EXPORT_CONFIG_EXIST, "export file system {0} is configured"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1026, HAVIP_VIPNAME_NOT_EXIST, "HAVIP {0} does not exist"
//  *Document:No
//  *Cause: Status message
// *Action: Not an error
/
1027, HAVIP_RES_NOT_EXIST, "HAVIP does not exist"
//  *Document:No
//  *Cause: Status message
// *Action: Not an error
/
1028, EXPORT_PATH, "Exported path: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1029, HAVIP_RES_ALREADY_DISABLED, "HAVIP {0} is already disabled"
//  *Cause: The 'disable havip' command failed because HAVIP was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then HAVIP can be enabled by 'srvctl enable havip' command.
/
1030, EXPORTFS_RES_ALREADY_DISABLED, "export file system {0} is already disabled"
//  *Cause: The 'disable exportfs' command failed  because it was already disabled.
// *Action: If this is the expected state then this is not an error. If it is not then it can be enabled by 'srvctl enable exportfs' command.
/
1031, HAVIP_RES_ALREADY_ENABLED, "HAVIP {0} is already enabled"
//  *Cause: The 'enable havip' failed because HAVIP was already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then HAVIP can be disabled by 'srvctl disable havip' command.
/
1032, EXPORTFS_RES_ALREADY_ENABLED, "export file system {0} is already enabled"
//  *Cause: The 'enable  exportfs' command failed  because it was already enabled.
// *Action: If this is the expected state then this is not an error. If it is not then it can be disabled by 'srvctl disable exportfs' command.
/
1033, EXPORT_OPTIONS, "Export Options: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1034, EXPORT_CLIENTS, "Configured Clients: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1035, HAVIP_RELOCATE_SUCCESS, "HAVIP was relocated successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1036, MODIFY_HAVIP_PURPOSE, "\nModifies a HAVIP configuration in the Oracle Clusterware\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1037, MODIFY_EXPORTFS_PURPOSE, "\nModifies an export file system  configuration in the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1038, RELOCATE_HAVIP_PURPOSE, "Relocate HAVIP from its current node to another node of the cluster\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1039, USAGE_ADD_HAVIP, "Usage: srvctl add havip -id <id> -address {<name>|<ip>} [-netnum <network_number>] [-description <text>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1040, USAGE_RELOCATE_HAVIP, "Usage: srvctl relocate havip -id <id> [-node <node_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1041, USAGE_CONFIG_HAVIP, "Usage: srvctl config havip [-id <id> | -transport]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1042, USAGE_ENABLE_HAVIP, "Usage: srvctl enable havip {-id <id> [-node <node_name>] | -transport}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1043, USAGE_DISABLE_HAVIP, "Usage: srvctl disable havip {-id <id> [-node <node_name>] | -transport}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1044, USAGE_START_HAVIP, "Usage: srvctl start havip {-id <id> [-node <node_name>] | -transport}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1045, USAGE_STOP_HAVIP, "Usage: srvctl stop havip {-id <id> [-node <node_name>] | -transport} [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1046, USAGE_STAT_HAVIP, "Usage: srvctl status havip [-id <id> | -transport]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1047, USAGE_REMOVE_HAVIP, "Usage: srvctl remove havip -id <id> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1048, USAGE_MODIFY_HAVIP, "Usage: srvctl modify havip -id <id> [-address {<name>|<ip>} [-netnum <network_number>]] [-description <text>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1049, USAGE_ADD_EXPORTFS, "Usage: srvctl add exportfs -name <expfs_name>  -id <id> -path <export_path> [-clients <export_clients>] [-options <export_options>] [-type {0}]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1050, USAGE_CONFIG_EXPORTFS, "Usage: srvctl config exportfs [-name <expfs_name> | -id <havip_id>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1051, USAGE_ENABLE_EXPORTFS, "Usage: srvctl enable exportfs -name <expfs_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1052, USAGE_DISABLE_EXPORTFS, "Usage: srvctl disable exportfs -name <expfs_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1053, USAGE_START_EXPORTFS, "Usage: srvctl start exportfs {-name <expfs_name> | -id <havip_id>}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1054, USAGE_STOP_EXPORTFS, "Usage: srvctl stop exportfs {-name <expfs_name> | -id <havip_id> [-type {0}]} [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1055, USAGE_STAT_EXPORTFS, "Usage: srvctl status exportfs [-name <expfs_name> |-id <havip_id>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1056, USAGE_REMOVE_EXPORTFS, "Usage: srvctl remove exportfs -name <expfs_name> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1057, USAGE_MODIFY_EXPORTFS, "Usage: srvctl modify exportfs -name <expfs_name> [-path <exportpath>] [-clients <export_clients>] [-options <export_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1058, HAVIP_ALREADY_EXISTS, "HAVIP exists for address {0}"
//  *Cause: An attempt to add a HAVIP found that it already exists
// *Action: Check the input and if HAVIP needs to be modified use the command 'srvctl modify havip'.
/
1059, HAVIP_NOT_EXISTS, "HAVIP with ID {0} does not exist"
//  *Cause: The 'add exportfs' failed because the HAVIP with the specified ID does not exist.
// *Action: Specify the ID of an HAVIP that exists, or create the HAVIP for the specified ID using the command 'srvctl add havip -id <id> -address <vip>'.
/
1060, EXPORTFS_EXPNAME_NOT_EXIST, "Export file system {0} does not exist"
//  *Cause: The export file system resource with the specified name does not exist.
// *Action: Check the name and retry with the export file system name that is already configured.
/
1061, EXPORTFS_RES_NOT_EXIST, "Export file system does not exist"
//  *Document:No
//  *Cause: Status message
// *Action: Not an error
/
1062, AMBIGUOUS_NETTYPE_MODIFICATION, "Cannot determine which subnet to modify to network type \"{0}\". The network resource has two subnets configured with network type \"{1}\"."
//  *Cause: The command 'srvctl modify network -nettype' failed because the network had both IPv4 and IPv6 subnets, thus the subnet to modify could not be determined.
// *Action: Specify the '-subnet' option with the command 'srvctl modify network -nettype' to indicate whether to change type for IPv4 or IPv6 subnet.
/
1063, HAVIP_STATUS_ENABLED_NODE, "HAVIP {0} is individually enabled on nodes {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1064, HAVIP_STATUS_DISABLED_NODE, "HAVIP {0} is individually disabled on nodes {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1065, EXPORTFS_INVALID_OPT_COMBINATION, "Invalid combination of options specified"
//  *Cause: The '-name' and '-id' options cannot be combined together.
// *Action: Issue the command with either '-name' or '-id' option.
/
1066, INVALID_SUBNET_STRING, "Invalid subnet string: \"{0}\""
//  *Cause: The given subnet string was not a valid IPv4 or IPv6 subnet number in dotted-decimal format.
// *Action: Make sure that the subnet string is a valid IPv4 or IPv6 subnet number in dotted-decimal format.
/
1067, INVALID_NETMASK_STRING, "Invalid subnet mask string: \"{0}\""
//  *Cause: The given subnet mask string was not a valid IPv4 subnet mask in dotted-decimal format or IPv6 prefix length.
// *Action: Make sure that the subnet mask string is a valid IPv4 subnet mask in dotted-decimal format or IPv6 prefix length.
/
1068, UNSUPPORTED_NOUN_WINDOWS, "{0} object is not supported on Windows Operating System"
//  *Cause: The <object> specified on the command line was not a valid object on Windows Operating System.
// *Action: Objects rhpserver|rhpclient|havip|exportfs are not valid on Windows Operating System. Use a valid object.
/
1069, MODIFY_ADDRESS_TYPE_TO_BOTH_ERROR, "\"srvctl modify network -iptype both\" cannot include the {0} option"
//  *Cause: The command 'srvctl modify network -iptype both' request included conflicting options.
// *Action: Issue the command 'srvctl modify network -iptype both' separate from other network changes.
/
1070, MODIFY_NODEAPPS_NETTYPE_ERROR, "Changing network type from {0} to {1} requires new VIP addresses"
//  *Cause: The command 'srvctl modify nodeapps -nettype mixed' was issued without specifying the VIP address when the IPv4 or IPv6 network type was dynamic. 
// *Action: Issue the command 'srvctl modify nodeapps -nettype mixed -address' to specify the new VIP address.
/
1071, MODIFY_HAVIP_NETNUM_ERROR, "'-netnum' option cannot be supplied without '-address' option"
//  *Cause: The commande 'srvctl modify havip -netnum' was issued without specifying a VIP address that matches the new network Subnet.
// *Action: Retry the command 'srvctl modify havip' using '-address' option along with '-netnum' option to specify a new address for the HAVIP resource.
/
1072, SCAN_NAME_IN_USE_ERROR, "SCAN name \"{0}\" is already registered on network {1}"
//  *Cause: The command 'srvctl add scan -scanname' was issued for a Single Client Access Name (SCAN) name that was already registered on the specified network.
// *Action: Use a distinct SCAN name.
/
1073, NETTYPE_MIXED_MODIFICATION_FAILED, "Cannot modify network type to 'mixed' because GNS is not configured."
//  *Cause: An attempt to modify the network type to 'mixed' failed because Grid Naming Service (GNS) was not configured.
// *Action: Configure Grid Naming Service (GNS) and retry 'srvctl modify network' command.
/
1074, SUBNET_DOES_NOT_MATCH_EXISTING, "Failed to modify network type because the specified subnet \"{0}\" does not match any configured subnet."
//  *Cause: The specified subnet did not match any configured subnet in the network resource. 
// *Action: Specify a configured subnet to modify its network type.
/
1075, MODIFY_NETWORK_IPTYPE_ERROR, "'-iptype' option cannot be given along with '-subnet'"
//  *Cause: A command attempted to modify both the network IP type and its subnet.
// *Action: Use 'srvctl modify network' with '-subnet' or '-iptype', not both.
/
1076, MIXED_NETWORK_ERROR, "Cannot modify network with network type 'mixed'"
//  *Cause: An attempt to modify the subnet or IP type of a network resource with network type 'mixed' was issued.
// *Action: Use 'srvctl modify network -nettype' to modify the network type to STATIC, DHCP or AUTOCONFIG, before making any other change.
/
1077, GNS_NO_DOMAIN_SERVED, "No domain is being forwarded."
// *Document: NO
//  *Cause:
// *Action:
/
1078, UNSUPPORTED_NOUN_CLIENT_CLUSTER, "Object {0} is not supported on an ASM client cluster."
//  *Cause: The <object> specified on the command line was not a valid object for an ASM client cluster.
// *Action: Objects ASM, DISKGROUP, and VOLUME are not supported on an ASM client cluster. Use a valid object.
/
1079, INVALID_INVITED_SUBNETS_SYNTAX, "Invalid subnet value {0} for '-invitedsubnets' option"
//  *Cause: The command was rejected because the invited subnets value was specified using incorrect syntax.
// *Action: Reissue the command specifying the invited subnets using either Classless Inter-Domain Routing (CIDR) syntax (e.g. 192.196.16.0/24) or wild cards.
/
1080, VIP_NETNUM_ERROR, "'-netnum' and '-vip' options conflict."
//  *Cause: The 'srvctl start|stop vip' command was rejected because the '-netnum' option was specified along with the '-vip' option.
// *Action: Use the command 'srvctl start|stop vip' with either '-netnum' or '-vip', not both.
/
1081, HOME_NODE, "Home Node: {0}"
//  *Document:No 
//  *Cause: Status message
// *Action: Not an error
/
1082, VIP_NAME_DOES_NOT_RESOLVE, "The VIP name \"{0}\" cannot be resolved."
//  *Cause: An unresolvable VIP name was specified.
// *Action: Make sure that the VIP name resolves to an IP address.
/
1083, VIP_NAME_RESOLVES_TO_UNKNOWN_ADDRESS, "The VIP name \"{0}\" resolves to \"{1}\" which cannot be found in any VIP."
//  *Cause: An attempt to find a VIP with one of the specified addresses to which the VIP name resolved failed."
// *Action: Specify a VIP name that resolves to an address that is found in a VIP resource.
/
1084, ADD_NETWORK_SUBNET_WITH_MIXED_NETTYPE_ERROR, "The network type for the specified subnet ({0}) that is added cannot be set to 'mixed'."
//  *Cause: An attempt was made to add an IPv4 or IPv6 subnet and set its network type directly to 'mixed'.
// *Action: Reissue the command and use a different value than 'mixed' for the -nettype option.
/
1085, UNEXPECTED_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
1086, ADD_MOUNTFS_PURPOSE, "\nAdds the Network Attached Storage (NAS) configuration to Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1087, MODIFY_MOUNTFS_PURPOSE, "\nModifies a Network Attached Storage (NAS) configuration in the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1088, REMOVE_MOUNTFS_PURPOSE, "\nRemoves the specified Network Attached Storage (NAS) configuration.\n"
//  *Document: No 
//  *Cause: Status message 
// *Action: Not an error
/
1089, START_MOUNTFS_PURPOSE, "\nMounts the specified Network Attached Storage (NAS).\n"
//  *Document: No
//  *Cause: Status message 
// *Action: Not an error
/
1090, STOP_MOUNTFS_PURPOSE, "\nUnmounts the specified Network Attached Storage (NAS).\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1091, CONFIG_MOUNTFS_PURPOSE, "\nDisplays the configuration information for the specified Network Attached Storage (NAS).\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1092, STATUS_MOUNTFS_PURPOSE, "\nDisplays the current state of the specified Network Attached Storage (NAS).\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1093, ENABLE_MOUNTFS_PURPOSE, "\nEnables the specified Network Attached Storage (NAS) for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1094, DISABLE_MOUNTFS_PURPOSE, "\nDisables the specified Network Attached Storage (NAS) for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1095, USAGE_ADD_MOUNTFS, "Usage: srvctl add mountfs -name <mountfs_name> -path <mount_path> -exportserver <server_name> -exportpath <path> [-mountoptions <mount_options>] [-user <user>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1096, USAGE_MODIFY_MOUNTFS, "Usage: srvctl modify mountfs -name <mountfs_name> [-path <mount_path>] [-exportserver <server_name>] [-exportpath <path>] [-mountoptions <mount_options>] [-user <user>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1097, USAGE_REMOVE_MOUNTFS, "Usage: srvctl remove mountfs -name <mountfs_name> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1098, USAGE_CONFIG_MOUNTFS, "Usage: srvctl config mountfs [-name <mountfs_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1099, USAGE_START_MOUNTFS, "Usage: srvctl start mountfs -name <mountfs_name> [-node <node_list>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1100, USAGE_STOP_MOUNTFS, "Usage: srvctl stop mountfs -name <mountfs_name> [-node <node_list>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1101, USAGE_STATUS_MOUNTFS, "Usage: srvctl status mountfs -name <mountfs_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1102, USAGE_ENABLE_MOUNTFS, "Usage: srvctl enable mountfs -name <mountfs_name> [-node <node_list>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1103, USAGE_DISABLE_MOUNTFS, "Usage: srvctl disable mountfs -name <mountfs_name> [-node <node_list>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1104, MOUNTFS_RUNNING_NODE, "Network Attached Storage {0} is mounted on nodes: {1}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1105, MOUNTFS_NOT_RUNNING, "Network Attached Storage {0} is not mounted."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1106, MOUNTFS_STATUS_ENABLED, "Network Attached Storage {0} is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1107, MOUNTFS_STATUS_DISABLED, "Network Attached Storage {0} is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1108, MOUNTFS_NAME, "Name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1109, MOUNTFS_MOUNTPATH, "Mount point path: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1110, MOUNTFS_MOUNTOPTS, "Mount options: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1111, MOUNTFS_EXPORT_SERVER, "Export server: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1112, MOUNTFS_EXPORT_PATH, "Export path: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1113, MOUNTFS_MOUNT_TYPE, "Type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1114, MOUNTFS_USER, "User: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1115, MOUNTFS_ENABLED_NODE, "Network Attached Storage is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1116, MOUNTFS_DISABLED_NODE, "Network Attached Storage is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1117, EXPORT_TYPE, "Export Type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1118, EVAL_RES_START_NODES_OPT, "Resource {0} can be started on one of nodes {1}."
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
1119, NOTHING_TO_MODIFY, "nothing to modify"
//  *Cause: No options were specified to modify.
// *Action: Specify at least one option with the 'modify' command.
/
1120, CVU_CONFIG_DESTLOC_EXISTS, "CVU is configured to run once every {0} minutes and the CVU work directory is '{1}'."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1121, GIMR_SERVER_NAME, "GIMR Server SCAN name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1122, GIMR_SERVER_PORT, "GIMR Server port: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1123, GIMR_SERVICE_NAME, "GIMR Service name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1124, GIMR_SERVER_CLUSTER_NAME, "GIMR Server cluster name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1125, GIMR_NOT_CONFIGURED, "Oracle Grid Infrastructure Management Repository (GIMR) client is not configured."
//  *Cause: An attempt to retrieve GIMR client information failed because GIMR client did not exist.
// *Action: Add the GIMR client and try again. 
/
1126, NETSTORAGESRV_ALREADY_DISABLED, "The network storage service is already disabled."
//  *Cause: The network storage server resource could not be disabled because it was already disabled.
// *Action: None.
/
1127, NETSTORAGESRV_ALREADY_ENABLED, "The network storage service is already enabled."
//  *Cause: The network storage server resource could not be enabled because it was already enabled.
// *Action: None.
/
1128, ONS_REMOTE_SERVER_UNREACHABLE ,"Host {0} is not reachable."
//  *Cause: The command 'srvctl modify nodeapps -remoteservers <hostname>' specified a hostname that was not reachable.
// *Action: Ensure the host is up and reachable on the network and reissue the command.
/
1129, ONS_REMOTE_SERVER_UNKNOWN ,"Host {0} is unknown."
//  *Cause: The command 'srvctl modify nodeapps -remoteservers <hostname>' specified the indicated hostname, but that host  was unknown.
// *Action: Reissue the command with a host name that is known to be correct.
/
1130, INVALID_ONS_PORT ,"Port {0} is invalid."
//  *Cause: The command 'srvctl modify nodeapps -remoteservers <hostname>:<port>' specified the indicated port, which was not a valid port .
// *Action: Reissue the command with a port that is known to be correct.
/
1131, UNSUPPORTED_NOUN_ASM_CLUSTER, "{0} is only supported on an ASM client cluster."
//  *Cause: An attempt to execute a command using the specified object
//    was rejected because the specified object was not supported 
//    for a ASM client cluster.
// *Action: Use valid objects ASM, disk group or volume.
/
1132, QOSMSERVER_CONFIG_TLSENABLED, "QoS Management Server has security enabled: {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1133, INVALID_STATUS_REQUEST_MC, "invalid query of management repository status on member cluster"
//  *Cause: A request to query the management database from a member cluster was rejected because the management database status can only be queried on the domain services cluster. 
//  *Action: Check the documentation on commands related to the management database and execute commands from the appropriate cluster.
/
1134, USAGE_CONFIG_RHPPLSNR, "Usage: srvctl config rhpplsnr"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1135, USAGE_ADD_RHPPLSNR, "Usage: srvctl add rhpplsnr -storage <base_path> -diskgroup <dg_name> [-email <email_address> -mailserver <mail_server_address> -mailserverport <mail_server_port>] [-pl_port <RHP_progress_listener_port>] [-enableTLS {YES|NO}] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1136, USAGE_DISABLE_RHPPLSNR, "Usage: srvctl disable rhpplsnr [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1137, USAGE_ENABLE_RHPPLSNR, "Usage: srvctl enable rhpplsnr [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1138, USAGE_REMOVE_RHPPLSNR, "Usage: srvctl remove rhpplsnr [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1139, USAGE_MODIFY_RHPPLSNR, "Usage: srvctl modify rhpplsnr [-pl_port <RHP_progress_listener_port>] [-use '{YES|NO}'] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1140, USAGE_STOP_RHPPLSNR, "Usage: srvctl stop rhpplsnr"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1141, USAGE_STAT_RHPPLSNR, "Usage: srvctl status rhpplsnr"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1142, USAGE_START_RHPPLSNR, "Usage: srvctl start rhpplsnr [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1143, SERV_DB_NOT_PERMITTED, "cannot decommission database {0} because it is enabled"
// *Cause:  An attempt to mark the indicated database as 'Decommissioned' was rejected because the database was currently enabled.
// *Action: Disable the database using the command 'srvctl disable database' and retry the command.
/
1200, CDP_ENABLED, "CDP {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1201, CDP_DISABLED, "CDP {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1202, CDP_RUNNING, "CDP {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1203, CDP_NOT_RUNNING, "CDP {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1204, CDP_STOPPING, "CDP is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1205, FORCE_REMOVE_GNS_VIP_REACHABLE, "removing the GNS VIP resource with the force option results in the GNS VIP address {0} continuing to be reachable on node {1}"
//  *Cause: Status message
// *Action: Not an error
/
1206, TFA_ENABLED, "TFA is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1207, TFA_DISABLED, "TFA is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1208, TFA_RUNNING, "TFA is running on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1209, TFA_NOT_RUNNING, "TFA is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1210, EVAL_LOCAL_RES_START_NODES_OPT, "Resource {0} can be started on nodes {1}."
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
1211, QOSMSERVER_CONFIG_HTTPSENABLED, "QoS Management Server has HTTP Secure enabled: {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1213, VIP_TRANSPORT_RES_NOT_EXIST, "VIP transport does not exist"
//  *Document:No
//  *Cause: Status message
// *Action: Not an error
/
1214, SERV_DIS_OJVM_PATCHING, "Service cannot be enabled while patching is in progress because the service {0} has been identified as a Java service."
//  *Cause: An attempt to enable a Java-based service was rejected because patching of the Oracle Java Virtual Machine (OJVM) was in progress, and Java services must remain disabled during OJVM patching.
// *Action: Complete the patching process on all database instances.
/
1215, SRV_CFG_JAVA_SERVICE_YES, "Service uses Java: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1216, SRV_CFG_JAVA_SERVICE_NO, "Service uses Java: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1217, ASMNETWORK_NOT_EXIST, "ASM network resource does not exist."
//  *Cause: The ASM network resource to be operated on did not exist.
// *Action: The ASM network resource can be created using the command 'srvctl add asmnetwork'.
/
1218, ASMNET_RES_ALREADY_STARTED, "The ASM network resource is already started on nodes: {0}"
//  *Cause: The start asmnetwork command failed because ASM network resource is already started.
// *Action: None.
/
1219, ASMNET_RES_ALREADY_STOPPED, "ASM network resource is already stopped on nodes: {0}"
//  *Cause: The stop asmnetwork command failed because ASM network resource is already stopped.
// *Action: None.
/
1220, USAGE_START_ASMNETWORK, "Usage: srvctl start asmnetwork [-netnum <asmnet_num>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1221, START_ASMNETWORK_PURPOSE, "\nStarts an ASM network resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1222, STOP_ASMNETWORK_PURPOSE, "\nStops an ASM network resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1223, USAGE_STOP_ASMNETWORK, "Usage: srvctl stop asmnetwork [-netnum <asmnet_num>] [-force] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1224, USAGE_CONFIG_ASMNETWORK, "Usage: srvctl config asmnetwork [-netnum <asmnet_num>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1225, CONFIG_ASMNETWORK_PURPOSE, "\nDisplays the configuration information for the specified ASM network\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1226, ASM_NETWORK_NOT_RUNNING, "ASM network {0} is not running."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1227, ASM_NETWORK_RUNNING_NODES, "ASM network is running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1228, USAGE_STATUS_ASMNETWORK, "Usage: srvctl status asmnetwork [-netnum <asmnet_num>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1229, STATUS_ASMNETWORK_PURPOSE, "\nDisplays the status information for the specified ASM network\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1230, ASMNETWORK_MODIFY_SUCCESS, "The ASM network resource was successfully modified."
//  *Document: No
//  *Cause: Status Message
//  *Action: Not an error
/
1231, USAGE_MODIFY_ASMNETWORK, "Usage: srvctl modify asmnetwork {-deptype <dep_type>} [-netnum <asmnet_num>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1232, MODIFY_ASMNETWORK_PURPOSE, "\n Modifies the specified ASM network configuration\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
1233, SERV_ADD_FAILBACK_OPTION, "Database {0} is not administrator-managed and does not support the failback option."
//  *Cause: An attempt to add or modify  a service using '-failback' option was rejected
//          because this option can be used with  administrator-managed databases only.
// *Action: Reissue the command without the '-failback' option.
/
1234, SRV_FAILBACK,  "Failback :  {0}  "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1235, ASMNETWORK_NETNUM_EXISTS, "ASM network {0} exists"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_001, DEFINE_VERBOSE_NETWORK, "    -{0}                                   Verbose output"
//  *Document: No
//  *Cause: Status message for -verbose(v)
// *Action: Not an error
/
_002, DEFINE_HELP_NETWORK, "    -{0}                                      Print usage"
//  *Document: No
//  *Cause: Status message for -help(h)
// *Action: Not an error
/
_003, DEFINE_FORCE_REMOVE_NETWORK, "    -{0}                                     Force remove (ignore dependencies)"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_004, DEFINE_FORCE_STOP_NETWORK, "    -{0}                                     Force stop"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_005, DEFINE_VERBOSE_VIP, "    -{0}                                         Verbose output"
//  *Document: No
//  *Cause: Status message for -verbose(v)
// *Action: Not an error
/
_006, DEFINE_HELP_VIP, "    -{0}                                            Print usage"
//  *Document: No
//  *Cause: Status message for -help(h)
// *Action: Not an error
/
_007, DEFINE_NODE_VIP, "    -{0}     <node_name>                            Node name"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_008, DEFINE_NET_NUM_VIP, "    -{0}   <network_number>                              Network number (default number is 1)"
//  *Document: No
//  *Cause: Status message for -netnum(k)
// *Action: Not an error
/
_009, DEFINE_FORCE_REMOVE_VIP, "    -{0}                                           Force remove (ignore dependencies)"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_010, DEFINE_FORCE_STOP_VIP, "    -{0}                                           Force stop"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_011, DEFINE_SUPPRESS_PROMPT_VIP, "    -{0}                                        To suppress prompt"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_012, DEFINE_ENV_NAMES_VIP, "    -{0}     <name_list>                            Names of environment variables"
//  *Document: No
//  *Cause: Status message for -envs(t)
// *Action: Not an error
/
_013, DEFINE_ENV_NAMEVAL_VIP, "    -{0}     <name>=<val>,...                       Names and values of environment variables"
//  *Document: No
//  *Cause: Status message for -envs(t)
// *Action: Not an error
/
_014, DEFINE_ENV_NAMEVAL_S_VIP, "    -{0}      <name>=<val>                           Name and value of a single environment variable"
//  *Document: No
//  *Cause: Status message for -env(T)
// *Action: Not an error
/
_015, DEFINE_ALL_VOLUME_RUNNING_NODES, "    -{0}                                 Display all nodes where volume is running"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
_016, DEFINE_ALL_SCANS, "    -{0}                     SCAN VIPs for all networks"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
_017, DEFINE_ALL_SCAN_LISTENERS, "    -{0}                     SCAN listeners for all networks"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
_018, DEFINE_NET_NUM_SCAN, "    -{0}  <network_number>                         Network number of the SCAN to modify"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_019, DEFINE_NET_NUM_SCAN_LISTENER, "    -{0}  <network_number>                         Network number of the SCAN listener to modify"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
// Do not reuse message _020
_020, DEFINE_LEAF_NETWORK, ""
//  *Document: No
//  *Cause: Status message for -leaf
// *Action: Not an error
/
_021, DEFINE_SKIP_VIP_CHECK, "    -{0}                                 Skip reachability check of VIP address"
//  *Document: No
//  *Cause: Status message for -skip(s)
// *Action: Not an error
/
_022, DEFINE_SKIP_ADDRESS_CHECK, "    -{0}                                 Skip reachability check for IP address"
//  *Document: No
//  *Cause: Status message for -skip(s)
// *Action: Not an error
/
_023, DEFINE_LSNR_INVITED_NODES, "    -invitednodes <node_list>            Comma separated list of node names allowed to register with Listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_024, DEFINE_LSNR_INVITED_SUBNETS, "    -invitedsubnets <subnet_list>        Comma separated list of subnets allowed to register with Listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_025, DEFINE_CLIENTDATA, "    -clientdata <file>          file with wallet to import to use SSL to secure ONS communication"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_026, DEFINE_CLIENTDATA_MODIFY, "    -clientdata <file>          file with wallet to import, or empty string to delete wallet used for SSL to secure ONS communication"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_027, DEFINE_ONSONLY_START, "    -{0}                Start ONS only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_028, DEFINE_ONSONLY_STOP, "    -{0}                 Stop ONS only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_029, ONS_BAD_START_OPTIONS, "you can only specify one of -adminhelper,-onsonly"
//  *Document: No
//  *Cause: you specified more than one of the mutually exclusive options: adminhelper, onsonly
// *Action: run the command 'srvctl start nodeapps' again specifying only one of [-adminhelper | -onsonly]
/
_030, ONS_BAD_STOP_OPTIONS, "you can only specify one of -adminhelper,-onsonly,-relocate"
//  *Document: No
//  *Cause: you specified more than one of the mutually exclusive options: adminhelper, onsonly, relocate
// *Action: run the command 'srvctl stop nodeapps' again specifying only one of [-adminhelper | -onsonly | -relocate]
/
_031, DEFINE_HOMENODE, "    -{0} <node_name>          Preferred node or empty string to clear the home node"
// *Document: No
// *Cause: Status message for -homenode
// *Action: Not an error
/
_032, DEFINE_PING_TARGET, "    -{0} \"<pingtarget_list>\"                  Comma-separated list of IPs or host names to ping"
//  *Document: No
//  *Cause: Status message for -pingtarget
// *Action: Not an error
/
_033, DEFINE_SKIP_VIP_ONS, "    -{0}                                 Skip reachability check of VIP address and port validation for ONS"
//  *Document: No
//  *Cause: Status message for -skip(s)
// *Action: Not an error
/
_034, DEFINE_MOUNTFS_NAME, "    -{0}     <mountfs_name>                            unique name for the Network Attached Storage"
//  *Document: No
//  *Cause: Status message for -name
// *Action: Not an error
/
_035, DEFINE_MOUNTFS_PATH, "    -{0}     <mount_path>                              mount path of the Network Attached Storage"
//  *Document: No
//  *Cause: Status message for -path
// *Action: Not an error
/
_036, DEFINE_MOUNTFS_EXPORTSERVER, "    -{0}     <server_name>                     export server name"
//  *Document: No
//  *Cause: Status message for -exportserver
// *Action: Not an error
/
_037, DEFINE_MOUNTFS_EXPORTPATH, "    -{0}     <path>                              export file path"
//  *Document: No
//  *Cause: Status message for -exportpath
// *Action: Not an error
/
_038, DEFINE_MOUNTFS_MOUNTOPTS, "    -{0}     <mount_options>                      mount options of the Network Attached Storage"
//  *Document: No
//  *Cause: Status message for -mountoptions
// *Action: Not an error
/
_039, DEFINE_MOUNTFS_USER, "    -{0}     <user>                                    user authorized to mount and dismount the Network Attached Storage"
//  *Document: No
//  *Cause: Status message for -user
// *Action: Not an error
/
_040, DEFINE_MOUNTFS_FORCE_REMOVE, "    -{0}                                   ignore resource dependencies while removing the Network Attached Storage"
//  *Document: No
//  *Cause: Status message for -force
// *Action: Not an error
/
_041, DEFINE_MOUNTFS_FORCE_STOP, "    -{0}                                    ignore resource dependencies while stopping the Network Attached Storage"
//  *Document: No
//  *Cause: Status message for -force
// *Action: Not an error
/
_042, DEFINE_MOUNTFS_NODE_START, "    -{0}     <node_list>                          comma-separated list of nodes on which the Network Attached Storage will be mounted"
//  *Document: No
//  *Cause: Status message for -node
// *Action: Not an error
/
_043, DEFINE_MOUNTFS_NODE_STOP, "    -{0}     <node_list>                          comma-separated list of nodes on which the Network Attached Storage will be unmounted"
//  *Document: No
//  *Cause: Status message for -node
// *Action: Not an error
/
_044, DEFINE_MOUNTFS_NODE_ENABLE, "    -{0}     <node_list>                          comma-separated list of nodes on which the Network Attached Storage will be enabled individually"
//  *Document: No
//  *Cause: Status message for -node
// *Action: Not an error
/
_045, DEFINE_MOUNTFS_NODE_DISABLE, "    -{0}     <node_list>                          comma-separated list of nodes on which the Network Attached Storage will be disabled individually"
//  *Document: No
//  *Cause: Status message for -node
// *Action: Not an error
/
_046, DEFINE_EXPTYPE_ADD, "    -{0}     {1}                               export type, default is NFS for UNIX, SMB for Windows"
//  *Document: No
//  *Cause: Status message for -type
// *Action: Not an error
/
_047, DEFINE_EXPTYPE_START, "Dummy message. Not used"
//  *Document: No
//  *Cause:
// *Action:
/
_048, DEFINE_EXPTYPE_STOP, "    -{0}     {1}                              stop all shares of the specified type using the provided ID, default is NFS"
//  *Document: No
//  *Cause: Status message for -type
// *Action: Not an error
/
_049, DEFINE_EXPORT_CLIENTS_ADD, "    -{0} <export_clients>  Comma separated list of clients (<hostname>|<IP address>|<subnet>) for the 'exportfs' file system. Subnet can include a wildcard in any field. Clients must be defined in the export options for SMB."
//  *Document: No
//  *Cause: Status message for -clients
// *Action: Not an error
/
_050, SCAN_STATIC_CONFIG, "Static SCAN name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_051, SCAN_DYNAMIC_CONFIG, "Dynamic SCAN name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
_052, DEFINE_CVU_CV_DESTLOC, "    -{0} <path>         Directory for copying and executing CVU files"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
/
_053, DEFINE_LSNR_PORT_LIST2, "    -{0} \"[TCP:]<port>[, ...][:FIREWALL={ON|OFF}][/IPC:<key>][/NMP:<pipe_name>][/{TCPS|SDP|EXADIRECT}<port>[:FIREWALL={ON|OFF}]]\"       Comma separated TCP ports or listener endpoints"
//  *Document: No
//  *Cause: Status message for -endpoints(p) for node listener
// *Action: Not an error
/
_054, DEFINE_LSNR_GROUP, "    -{0}     <group>                                    Group for the secure endpoint"
//  *Document: No
//  *Cause: Status message for -group
// *Action: Not an error
/
_055, LISTENER_GROUP_CONFIG, "Group: {0}"
//  *Document: No
//  *Cause: Status message for group.
// *Action: Not an error
/
_056,NETSTORAGESRV_CONFIG_EXIST, "network storage service {0} is configured"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_057, NETSTORAGESRV_STABLE_STORAGE, "Stable storage: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_058, NETSTORAGESRV_RUNNING_NODE, "Network Storage Service {0} is running on nodes: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_059, NETSTORAGESRV_NOT_RUNNING, "Network Storage Service {0} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_060, NETSTORAGESRV_STATUS_ENABLED, "Network Storage Service {0} is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_061, NETSTORAGESRV_STATUS_DISABLED, "Network Storage Service {0} is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_062, NETSTORAGESRV_STATUS_ENABLED_NODE, "Network Storage Service resource is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_063, NETSTORAGESRV_STATUS_DISABLED_NODE, "Network Storage Service resource is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
// Do not reuse _064
_064, DEFINE_EXTEND_TO_LEAF, ""
//  *Document: No
//  *Cause: Status message for -extendtoleaf
// *Action: Not an error
/
_065, DEFINE_TLS_ENABLED, "    -{0} '{YES|NO}'       QoS Management Server security enabled."
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
_067, DEFINE_PROXY, "    -proxy       To modify the ADVM proxy instance configuration    "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_068, ENABLE_RHPPLSNR_PURPOSE, "\nEnable Rapid Home Provisioning progress listener for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_069, DISABLE_RHPPLSNR_PURPOSE, "\nDisable the Rapid Home Provisioning progress listener from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_070, START_RHPPLSNR_PURPOSE, "\nStart the Rapid Home Provisioning progress listener on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_071, STOP_RHPPLSNR_PURPOSE, "\nStop the Rapid Home Provisioning progress listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_072, STATUS_RHPPLSNR_PURPOSE, "\nDisplays the current state of the Rapid Home Provisioning progress listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_073, MODIFY_RHPPLSNR_PURPOSE, "\nModifies the configuration of Rapid Home Provisioning progress listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_074, CONFIG_RHPPLSNR_PURPOSE, "\nDisplays configuration information for the Rapid Home Provisioning progress listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_075, ADD_RHPPLSNR_PURPOSE, "\nAdds a Rapid Home Provisioning progress listener to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_076, REMOVE_RHPPLSNR_PURPOSE, "\nRemoves the Rapid Home Provisioning progress listener for the cluster and all of the data in its repository.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_077, DEFINE_PL_PORT, "    -pl_port <RHP_progress_listener_port>     RHP progress listener port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_078, RHPPLSNR_STATUS_ENABLED, "Rapid Home Provisioning progress listener is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_079, RHPPLSNR_STATUS_DISABLED, "Rapid Home Provisioning progress listener is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_080, RHPPLSNR_NOT_RUNNING, "Rapid Home Provisioning progress listener is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_081, RHPPLSNR_RUNNING_NODE, "Rapid Home Provisioning progress listener is running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_082, RHPPLSNR_ENABLED_NODES, "Rapid Home Provisioning progress listener is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_083, RHPPLSNR_DISABLED_NODES, "Rapid Home Provisioning progress listener is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_084, DEFINE_USE_FLAG, "    -use '{YES|NO}'                use Rapid Home Provisioning progress listener or not."
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
_085, DEFINE_VIPLESS, "    -{0}                   Adds a network without node VIP addresses"
//  *Document: No
//  *Cause: Status message for -vipless
// *Action: Not an error
/
_086, DEFINE_PORT_RANGE, "    -port_range <low_val-high_val>  The lower and upper port values for the ports to use for file transfer"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
/
_087, DEFINE_HAVIP_TRANSPORT, "    -{0}  Display information for transport VIP resources only"
//  *Document: No
//  *Cause: Status message for -transport
// *Action: Not an error
/
_088, DEFINE_START_TRANSPORT, "    -{0}  Start all transport VIP resources"
//  *Document: No
//  *Cause: Status message for -transport
// *Action: Not an error
/
_089, DEFINE_STOP_TRANSPORT, "    -{0}  Stop all transport VIP resources"
//  *Document: No
//  *Cause: Status message for -transport
// *Action: Not an error
/
_090, DEFINE_ENABLE_TRANSPORT, "    -{0}  Enable all transport VIP resources"
//  *Document: No
//  *Cause: Status message for -transport
// *Action: Not an error
/
_091, DEFINE_DISABLE_TRANSPORT, "    -{0}  Disable all transport VIP resources"
//  *Document: No
//  *Cause: Status message for -transport
// *Action: Not an error
/
_092, DEFINE_CL_PORT, "    -clport <RHP_copy_listener_port> Port number for RHP copy listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_093, DEFINE_TEMP_LOC, "    -tmploc  Temporary location for installation processing"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_094, DEFINE_FAILBACK, "    -failback (YES|NO) Failback to a preferred instance for a administrator-managed database "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_095, DEFINE_ASMNET_NUM, "    -{0}          <asmnet_num>                         ASM Network number (default number is 1)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
