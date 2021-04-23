// Copyright (c) 2008, 2019, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrkfMsg.msg
//
// DESCRIPTION
//    Message file for srvctl
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      02/01/19 - Backport mpradeep_bug-28860208 from main
//     apfwkr      01/31/19 - Backport jesusfer_lrg-21823463 from main
//     jesusfer    01/21/19 - rti 21823463, rhp gi home validation
//     apfwkr      01/20/19 - Backport rakebhat_bug-28881848 from main
//     mpradeep    01/14/19 - 28876039 - Make start/stop asmnetwork changes
//     rakebhat    11/16/18 - fix bug 28881848
//     rakebhat    08/24/18 - fix bug 28493852
//     mpradeep    07/18/18 - Leaf backout 28147329
//     jorgepe     06/28/18 - Fix bug 28254853: Remove verbose for ONS
//     jesusfer    05/18/18 - fix bug 27803672, validate GI home RHP
//     pevilla     05/03/18 - Fix bug 26560478, add message for SCAN Listener
//                            on netnum
//     rakebhat    04/17/18 - fix bug 27835129
//     kfgriffi    04/10/18 - Add I/O Server listerners: message
//     jorgepe     04/09/18 - Fix bug 27827323
//     kfgriffi    03/14/18 - Fix bug 27673903 - remove force from modify cdp
//     rakebhat    03/05/18 - fix bug 26997860
//     jorgepe     02/23/18 - Fix bug 27589989
//     yizhang     02/06/18 - fix bug 27398793
//     kfgriffi    02/01/18 - Fix bug 27468984 - add force
//     yizhang     01/20/18 - Support asm network
//     pevilla     01/15/18 - ER 26094690, support for gns cluster management
//     kfgriffi    01/12/18 - Fix bug 26965925 - show resource type supported
//     ccharits    10/26/17 - Added GH_TRANSFER_PORT_RANGE
//     yizhang     10/25/17 - fix bug 26817825
//     kamramas    10/24/17 - revert colon rmi port
//     yizhang     10/12/17 - fix bug 26817826
//     kamramas    09/20/17 - add jmx server port
//     jorgepe     09/05/17 - Fix bug 26735194
//     yizhang     08/03/17 - fix bug 26549551
//     kfgriffi    07/28/17 - Fix bug 26542896 - add force to modify cdp usage
//     nvira       07/10/17 - bug fix 26370337
//     samjo       07/07/17 - XbranchMerge samjo_bug-24357370 from
//                            st_has_12.2.0.1.0
//     kfgriffi    06/28/17 - Remove force from modify cdp
//     rakebhat    06/28/17 - fix bug 26351042
//     ptare       06/26/17 - Add messages for config all
//     kfgriffi    06/12/17 - Fix bug 26256692 - output message if no proxies
//                            found
//     nvira       05/30/17 - fix string DYNAMIC -> DHCP
//     rtamezd     06/23/17 - Add RESET_RHPS_EXT_DB
//     kfgriffi    06/08/17 - Fix CDP messages
//     kfgriffi    06/06/17 - Fix bug 26187100 - add force option for relocate
//     pevilla     06/05/17 - Bug 25949937, add error message for vipless
//     rakebhat    05/29/17 - fix bug 26152669
//     ocordova    05/22/17 - Adding HTTP TLS
//     kfgriffi    05/18/17 - Fix bug 25965220 - make sure CDP is stopped
//                            before remove
//     jesusfer    05/11/17 - fix bug 26042157, correct cdp messages
//     jesusfer    05/04/17 - fix bug 25958191, clear msg for usage add ons
//     yizhang     05/01/17 - fix bug 25692046
//     ccharits    04/26/17 - Added TFA messages
//     ocordova    04/17/17 - Fix bug 25776323
//     kfgriffi    04/06/17 - Fix bug 25577936 - add cdpproxy messages
//     vinavish    04/06/17 - fix bug 25236340
//     ccharits    04/05/17 - Added message INVALID_PORT_RANGE
//     rakebhat    03/26/17 - fix bug 25394507
//     kfgriffi    03/20/17 - Fix bug 25602408 - fix command/message syntax
//     jorgepe     03/16/17 - Fix bug 22270906
//     rdesale     02/22/17 - Oracle Restart+ support
//     ccharits    02/10/17 - Added message CDP_CONFIG_HEADER
//     ccharits    01/23/17 - CDP Support
//     jorgepe     01/20/17 - ACFS Remote
//     pevilla     01/19/17 - Project 67521, support transport vip
//     rakebhat    12/19/16 - fix bug 24951104
//     rdesale     12/07/16 - fix bug 22593058
//     vinavish    11/14/16 - fix bug 23095903
//     rakebhat    11/09/16 - fix bug 24755458
//     vinavish    11/04/16 - fix bug 24555154
//     jorgepe     11/04/16 - Fix bug 25028358
//     jorgepe     09/28/16 - ER 24459535
//     ccharits    10/07/16 - RHP node on fire support
//     pevilla     09/26/16 - Shared SCAN project
//     kfgriffi    09/12/16 - Add support for RF -hubsvc option
//     ocordova    08/05/16 - Output for rhp and rhpc with secure
//     vgunredd    06/16/16 - fix bug 23595540
//     yizhang     06/15/16 - fix bug 23201370
//     alcerda     04/29/16 - fix bug 23135904 Add DEFINE_EXPORT_GNS_VERSION
//     yizhang     03/25/16 - fix bug 22958868
//     yizhang     03/21/16 - Fix message INST_NOT_CONNECT_TO_IOS
//     rdesale     03/17/16 - fix bug 22906391
//     iestrada    03/15/16 - fix bug 22896991
//     iestrada    03/15/16 - fix bug 22901189 add message for 
//                            acceleratorvols option
//     alcerda     03/14/16 - fix bug 22305258
//     yizhang     02/09/16 - fix bug 22691567
//     alcerda     02/03/16 - fix bug 22635691
//     yizhang     02/03/16 - fix bug 22445946
//     epineda     02/02/16 - 22581023,21899871
//     iestrada    01/29/16 - fix bug 22615452
//     yizhang     01/12/16 - fix bug 21625291
//     ocordova    12/02/15 - Enabling TLS support
//     ocordova    10/19/15 - Fix bug 21967163
//     epineda     11/12/15 - Reader farm support
//     pevilla     10/21/15 - HA NFS Locking support
//     alcerda     10/08/15 - fix bug 19608733
//     alcerda     09/21/15 - fix bug 21800384
//     alcerda     08/24/15 - fix bug 21469721
//     vgunredd    08/13/15 - Fix bug 20992656
//     rdesale     08/04/15 - Adding msg to fix 21317789
//     yizhang     07/26/15 - fix bug 21102385
//     yizhang     07/15/15 - fix bug 18506011
//     alcerda     07/14/15 - fix bug 21354042
//     pevilla     07/10/15 - Fixed 20517812, add SCAN_VIP_CONFIG_INACTIVE
//     alcerda     07/06/15 - fix bug 21120442
//     pevilla     06/21/15 - Bug 21090081, move INVALID_GNS_ROLE message
//     epineda     06/12/15 - Bugfix 19691769: mountusers support
//     vgunredd    06/11/15 - Fix bug 20992626
//     vgunredd    05/27/15 - Fix bug 20847320
//     chchatte    05/14/15 - bug 20842493
//     lcarvall    05/05/15 - Fix bug 19799821
//     epineda     05/05/15 - ER 20992474
//     yizhang     04/29/15 - fix bug 20977591
//     smadabhu    04/20/15 - Bug 20861685
//     chchatte    04/10/15 - bug 19500810
//     smadabhu    03/30/15 - Modify usage for 'srvctl status service'
//     vgunredd    03/25/15 - Fix bug 20716122
//     sravindh    03/22/15 - Bug 20610737
//     pevilla     03/10/15 - Project 47157, HA GNS
//     agorla      02/24/15 - combine CCM & CCB into one
//     rtamezd     02/12/15 - Fix 20241436
//     epineda     01/22/15 - Project 47408: oracle home resource
//     chchatte    01/09/15 - fix bug 19804036
//     pevilla     12/02/14 - EXADIRECT support for listeners
//     smadabhu    11/26/14 - Proj 51778 - Add DEFINE_WAIT
//     yizhang     11/20/14 - Implement project 53568
//     epineda     11/10/14 - ER 19989683: Add CCM/CCB Resources
//     vgunredd    10/29/14 - Fix bug 19598058
//     vobulapu    10/17/14 - Add Email notification support for GHS/GHC
//     sparial     10/16/14 - bug 19819628
//     smadabhu    10/13/14 - Proj 51778 - Add DEFINE_DRAIN_TIMEOUT
//     smadabhu    09/09/14 - Bug 19393246 - Add ADMIN_DB_UNSUPPORTED
//     ksrangal    08/22/14 - Bug 16695125 - Add GNS_IMPORT_INVALID_FILE.
//     vgunredd    07/10/14 - Fix bug 19138899
//     chchatte    07/08/14 - Fix bug 19134098
//     chchatte    06/27/14 - Fix bug 18899171
//     vgunredd    06/03/14 - Fix bug 14168393
//     chchatte    05/29/14 - Fix bug 18849522
//     chchatte    05/21/14 - Second VM transaction
//     rtamezd     05/29/14 - Bug 13944171
//     ksviswan    05/16/14 - XbranchMerge ksviswan_bug-18707931 from
//                            st_has_12.1
//     ksviswan    05/12/14 - Name Change
//     sejlim      05/12/14 - bug 18723446
//     sejlim      05/09/14 - ovmm second txn
//     marbharg    04/30/14 - Backport marbharg_bug-18555668 from main
//     marbharg    04/10/14 - Backport marbharg_bug-18335072 from main
//     apfwkr      04/10/14 - Backport vgunredd_bug-18413436 from main
//     smadabhu    04/08/14 - Backport smadabhu_bug-18447190 from main
//     vgunredd    04/01/14 - Backport vgunredd_bug-18426979 from main
//     sejlim      03/31/14 - ovmm
//     smadabhu    03/28/14 - Backport smadabhu_bug-18407094 from main
//     marbharg    04/17/14 - Bug fix - 18555668
//     marbharg    04/30/14 - Backport marbharg_bug-18555668 from main
//     marbharg    04/17/14 - Bug fix - 18555668
//     marbharg    04/10/14 - Backport marbharg_bug-18335072 from main
//     apfwkr      04/10/14 - Backport vgunredd_bug-18413436 from main
//     smadabhu    04/08/14 - Backport smadabhu_bug-18447190 from main
//     vgunredd    04/01/14 - Backport vgunredd_bug-18426979 from main
//     sejlim      03/31/14 - ovmm
//     smadabhu    03/28/14 - Backport smadabhu_bug-18407094 from main
//     vgunredd    04/02/14 - Fix bug 18413436
//     smadabhu    03/30/14 - Bug 18455085
//     ocordova    03/27/14 - Fix Bug 18309444
//     vgunredd    03/24/14 - Fix bug 18426979
//     smadabhu    03/17/14 - Bug 18407094
//     ocordova    03/14/14 - Fix bug 18295408
//     vobulapu    03/12/14 - Fix bug 14554345
//     chchatte    03/07/14 - Add VM resource
//     vgunredd    03/05/14 - Replace SIDB_NODE_NAME message
//     marbharg    03/04/14 - Bug Fix - 18335072
//     vgunredd    03/04/14 - Fix bug 9830629
//     vgunredd    02/27/14 - Fix bug 18309736
//     vgunredd    01/17/14 - Fix bug 9892886
//     chchatte    01/13/14 - Fix bug 18052668
//     smadabhu    12/30/13 - Bug 17671929
//     sidshank    12/19/13 - fix bug 17940353.
//     yizhang     12/18/13 - Fix STATIC_VIP_MISSING_ADDR
//     yizhang     12/10/13 - Define STATIC_VIP_MISSING_ADDR
//     smadabhu    11/27/13 - Add DEFINE_ADD_DBROLE - Bug 17663595
//     satg        11/26/13 - Fix bug 17815533
//     vgunredd    11/18/13 - Fix bug 14137667
//     sejlim      10/15/13 - bug 17554863
//     sejlim      10/11/13 - bug 17554570
//     yizhang     10/22/13 - fix bug 17593747
//     vgunredd    10/10/13 - Fix bug 8430767
//     sejlim      10/07/13 - bug 17211006
//     epineda     10/07/13 - Bugfix 17532130
//     marbharg    10/04/13 - Bug Fix 17473973
//     sejlim      10/03/13 - cha_ochad_3
//     epineda     08/30/13 - Bugfix 17242840
//     sejlim      08/28/13 - cha srvpool label
//     satg        08/27/13 - add serverpool support for cha
//     epineda     08/16/13 - Bugfix 17317142
//     satg        08/04/13 - Fix Bug 17188722
//     fmaring     07/25/13 - fixbug 16937640
//     yizhang     07/16/13 - fix bug 17083525
//     pevilla     07/01/13 - Bug 17019319, add -pingtarget for nodeapps
//     samjo       07/12/13 - Uppercase Service for 1134-1137
//     ksrangal    07/11/13 - Bug 17033553
//     smadabhu    07/02/13 - ER 15986311
//     smadabhu    06/30/13 - ER 16636740
//     yifyang     06/28/13 - bug-16093798, 16215760
//     epineda     06/25/13 - Add LABEL_ACFS_AUX_VOLS and auxvolumes
//     ocordova    06/24/13 - HANFS 12.1.0.1 ODA changes
//     satg        07/23/13 - Fix bug 16859978
//     sejlim      05/22/13 - cha_status
//     sejlim      05/20/13 - cha_monitor
//     smadabhu    05/19/13 - XbranchMerge smadabhu_bug16801843 from
//                            st_has_12.1.0.1
//     sowong      05/07/13 - fix bug16698319
//     sidshank    05/06/13 - fix bug 14579939 .
//     yizhang     05/10/13 - fix bug 16512913
//     satg        04/28/13 - Fix bug 16708920
//     sidshank    04/22/13 - fix bug 16504718.
//     fmaring     04/17/13 - fixbug 7507578
//     vobulapu    04/16/13 - Fix bug 16611135
//     epineda     04/04/13 - Bugfix 14573313
//     satg        02/27/13 - Add support for cha
//     ocordova    02/14/13 - Fix Bug 14492484
//     smadabhu    02/07/13 - Bug 14462921
//     fmaring     02/08/13 - fixbug 14709022
//     ksviswan    01/28/13 - Fix bug 16019665
//     vobulapu    01/07/13 - Fix bug 14554461
//     satg        11/15/12 - Fix bug 14704231
//     satg        11/14/12 - Fix bug 14730028
//     vobulapu    11/12/12 - Fix bug 14111747
//     vobulapu    10/30/12 - Fix bug 14810292
//     smadabhu    10/05/12 - Add DEFINE_PQ
//     vobulapu    10/10/12 - Added GNS_CLEINT_ALREADY_ADDED
//     smadabhu    10/04/12 - Bug 14266148
//     vobulapu    09/18/12 - Fix bug 14498594
//     rtamezd     09/11/12 - Fix bug 14115195
//     yizhang     09/11/12 - fix bug 13928246
//     smadabhu    09/11/12 - Remove -node for status mgmtlsnr
//     satg        09/05/12 - fix bug 14347014
//     satg        08/27/12 - fix bug 14459829
//     yizhang     08/23/12 - fix bug 14368536
//     yizhang     08/15/12 - fix bug 14368509
//     smadabhu    08/13/12 - Fix bug 14353196
//     epineda     08/06/12 - Bugfix 14371995
//     pevilla     08/02/12 - Add HAVIP description for bugs 13962051, 13474844
//     ksrangal    07/31/12 - Bug 14390984
//     smadabhu    07/30/12 - Fix bug 14339843
//     yizhang     07/21/12 - fix bug 14327753
//     yizhang     07/19/12 - Add DEFINE_START/STOP_CONCURRENCY
//     ksrangal    07/27/12 - Bug 14368223
//     vobulapu    07/23/12 - Fix bug 13864972
//     vobulapu    07/17/12 - Fix bug 14149266
//     smadabhu    07/13/12 - Fix bug 14155637
//     epineda     07/06/12 - Added message LSNR_INVALID_OPT_COMB_USER
//     epineda     07/03/12 - Bugfix 14239749
//     rtamezd     06/29/12 - Add GHC_NAME
//     sparial     06/18/12 - bug 13790756
//     ccharits    06/05/12 - Added NETWORK_ADDRESS_TYPE
//     yizhang     05/30/12 - fix bug 13994878
//     smadabhu    05/07/12 - Fix DEFINE_GLOBAL_OVERRIDE_REMOVE
//     yizhang     05/01/12 - fix bug 13972881
//     smadabhu    04/27/12 - Remove subnet option for mgmtlsnr
//     ccharits    04/27/12 - Added message
//                            MODIFY_FILESYSTEM_AS_CLUSTERWIDE_WHEN_NODELOCAL_ERROR
//     ksrangal    04/24/12 - Fix bug 13867230
//     abhisbg     04/24/12 - fix bug 13989992(Numbering on Msgs)
//     epineda     04/24/12 - Bugfix 13963292
//     epineda     04/23/12 - Bugfix 13985276
//     smadabhu    04/17/12 - Add USAGE_RELOCATE_MGMTDB
//     abhisbg     04/16/12 - fix bug 13934615
//     sowong      04/12/12 - fix bug13910935
//     epineda     04/10/12 - Bugfix 13535159
//     epineda     04/09/12 - Bugfix 13468087
//     ccharits    04/09/12 - Fixed bug 13858995
//     epineda     04/02/12 - Bugfix 13417461
//     ccharits    04/02/12 - Added message VIP_INFO_LINE_INACTIVE
//     sowong      03/29/12 - fix bug13900721
//     epineda     03/28/12 - Add msg LSNR_INVALID_OPTION_COMBINATION
//     sowong      03/27/12 - Usage indentation
//     smadabhu    03/21/12 - Add DEFINE_GLOBAL_OVERRIDE_REMOVE
//     yizhang     03/22/12 - Add category option
//     smadabhu    03/19/12 - Fix add mgmtdb usage
//     vobulapu    03/05/12 - Added -clientdata option in srvctl modify gns
//     smadabhu    03/14/12 - Fix add mgmtlsnr usage
//     ccharits    03/13/12 - Modified USAGE_ADD_MGMTLSNR and
//                            DEFINE_SUBNET_MGMTLSNR
//     epineda     03/12/12 - Bugfix 13531572
//     vobulapu    03/07/12 - Fix bug 13820266
//     smadabhu    03/05/12 - Fix bug 13808227
//     smadabhu    02/29/12 - Add -node description for modify instance
//     abhisbg     02/27/12 - fix bug 13541578
//     smadabhu    02/02/12 - Fix bug 13105065
//     yizhang     02/23/12 - fix bug 13743030
//     abhisbg     02/20/12 - add meesages for bug fix 13574238
//     ksrangal    02/13/12 - added GNS_VALIDATE_SUCCESS 
//     vobulapu    02/12/12 - Fix bug 13615796
//     yizhang     02/02/12 - fix bug 13626888
//     vobulapu    02/01/12 - Fix bug 13615796
//     ccharits    01/11/12 - Added message NETWORK_NUM_EXISTS
//     rwessman    01/08/12 - Bug 13516020
//     smadabhu    01/04/12 - Fix bug 13550925
//     smadabhu    12/30/11 - Fix bug 13427693
//     vobulapu    12/28/11 - Fix bug 13418730
//     ccharits    12/21/11 - Added message LABEL_FS_DESCRIPTION
//     vobulapu    12/14/11 - Fix bug 13499765
//     ccharits    12/09/11 - Fixed bug 13468841
//     smadabhu    12/07/11 - Fix bug 13435620
//     sowong      11/01/11 - fix bug12830536
//     ccharits    10/19/11  - Added usage messages for filesystem
//     ccharits    09/09/11 - Creation
//
// 
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/opsctl/resources/PrkfMsg.msg /st_has_19/3 2019/02/13 16:58:02 mpradeep Exp $
//  *  @author  ccharits  
//  *  @since   release 12.1
//  */
// PACKAGE=package oracle.ops.opsctl.resources;
// MSGIDTYPE=interface
1000, EMPTY_CMD_OPTION, "Empty value for command line option {0} for command {1}"
//  *Cause: An empty value was specified for this command line option.
// *Action: Provide a value following the specific command line option.
/
1001, MAX_STR_LENGTH_EXCEEDED, "Maximum character length ({0}) exceeded for command line option {1} "
//  *Cause: The user entered more characters than the maximum length for this command line option value.
// *Action: Provide a value with no more characters than the maximum limit.
/
1002, LABEL_FS_TYPE, "Type: {0}"
//  *Cause: Mount options
// *Action: None.
/
1003, LABEL_FS_OPTIONS, "Mount options: {0}"
//  *Cause: Mount options
// *Action: None.
/
1004, LABEL_NODE_LIST, "Nodes: {0}"
//  *Cause: Node list
// *Action: None.
/
1005, LABEL_SERVERPOOL_LIST, "Server pools: {0}"
//  *Cause: Serverpool list
// *Action: None.
/
1006, LABEL_APPLICATION_ID, "Application ID: {0}"
//  *Cause: Application ID
// *Action: None.
/
1007, FS_ENABLED, "File system is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1008, FS_DISABLED, "File system is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1009, FS_RUNNING, "File system {0} is mounted on nodes {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1010, FS_NOT_RUNNING, "File system {0} is not mounted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1011, INVALID_FS_TYPE, "Invalid file system type \"{0}\""
//  *Cause: An invalid file system type was specified for the file system resource.
// *Action: The file system type must be either 'ACFS', 'NTFS', 'ZFS', 'JFS', 'EXT3' or 'EXT4'
/
1012, INVALID_AUTOSTART_VALUE, "Invalid 'autostart' option value \"{0}\""
//  *Cause: An invalid value was specified for the command option 'autostart'.
// *Action: The 'autostart' option value must be either 'always', 'never' or 'restore'
/
1013, OPTION_COEXISTENCE_ERROR, "Options \"{0}\" and \"{1}\" are in conflict"
//  *Cause: The specified options were set although mutually exclusive.
// *Action: Make sure that only one of the options is set.
/
1014, APPID_ALLOWED_ONLY_FOR_NODELOCAL_FILESYSTEMS, "An application ID is allowed only for node-local file systems. \"{0}\" is valid only if \"{1}\" or \"{2}\" is present."
//  *Cause: An application ID was provided for a node-local file system.
// *Action: Make sure that use the application ID option only for non node-local file systems.
/
1015, OPTION_REQUIRED_ERROR, "Either option \"{0}\" or \"{1}\" is required to be specified for file system \"{2}\""
//  *Cause: For non-ACFS file systems, the user did not provide a nodelist or a server pool list.
// *Action: For non-ACFS file systems, make sure that either a nodelist or a server pool list is provided.
/
1016, EMPTY_NODE_IN_NODE_LIST, "One or more nodes in the list of nodes (\"{0}\") is empty"
//  *Cause: A list of nodes included an empty node name.
// *Action: Make sure that no empty string is provided as part of the node list.
/
1017, VOLUME_DEVICE_PATH_USED_CLUSTERWIDE, "The file system found for volume device \"{0}\" is added for all nodes"
//  *Cause: The file system with the given volume device path was configured as a global file system.
// *Action: Either change the volume device path or do not use the '-nodes' and '-serverpools' options as part of the command 'srvctl modify filesystem'.
//          To specify placement for an existing global file system, remove it and re-create it.
/
1018, GHS_ALREADY_RUNNING, "An attempt to modify the port of the Rapid Home Provisioning Server failed because the Rapid Home Provisioning Server is running. Use -force to force stop and restart of Rapid Home Provisioning Server."
//   *Cause: A request to modify the port number of Rapid Home Provisioning Server was rejected because such modification requires Rapid Home Provisioning Server to be stopped and restarted.
//   *Action: Use '-force' option to force restart of Rapid Home Provisioning Server.
/
1019, GHC_ALREADY_RUNNING, "An attempt to modify the Rapid Home Provisioning Client failed because the Rapid Home Provisioning Client is running."
//   *Cause: A request to modify the Rapid Home Provisioning Client was rejected because such modification requires the Rapid Home Provisioning Client to be stopped and restarted.
//   *Action: Stop the Rapid Home Provisioning Client with the 'srvctl stop rhpclient' command, reissue the 'srvctl modify rhpclient' and restart with the 'srvctl start rhpclient' command.
/
1020, GNS_ADD_ONLY_CLIENT_ALLOWED, "No other option is allowed when the '-clientdata' option is specified."
// *Cause:  During the command 'srvctl add gns','-clientdata' option was specified along with other options which are not allowed with '-clientdata'.
// *Action: Only specify the '-clientdata' option.
/
1021, LABEL_FS_DESCRIPTION, "Description: {0}"
//  *Document: No
//  *Cause: File system description
// *Action: None.
/
1022, GNS_UPDATE_EITHER_OPTION_NOT_SPECIFIED, "The \"-{0}\" option requires one of the options \"-{1}\", \"-{2}\", \"-{3}\" or \"-{4}\"."
//  *Cause: An option was specified that required one of the other
//          possible options to be specified at the same time.
// *Action: Specify only one of the possible options.
/
1023, GNS_UPDATE_BOTH_OPTIONS_NOT_ALLOWED, "Cannot specify both of the \"-{0}\" and \"-{1}\" options."
//  *Cause: An invalid combination of options was specified.
// *Action: Specify only one of the indicated options.
/
1024, GNS_UPDATE_ONLY_CREATESRV_ALLOWED, "The \"-{0}\" option is not allowed when the \"-weight\", \"-priority\", \"-port\" or \"-instance\" options are specified."
// *Cause:  The '-createsrv' option was not specified with '-weight', '-priority', '-port' or '-instance' options.
// *Action: Only specify the '-createsrv', '-target' and '-protocol' options with the '-weight', '-priority', '-port' or '-instance' options.
/
1025, GNS_UPDATE_ONLY_CREATESRV_ALLOWED_PROTOCOL, "Only \"-createsrv\" or \"-deletesrv\" options are allowed when the \"-{0}\" option is specified."
// *Cause:  An option other than '-createsrv' or '-deletesrv' was specified.
// *Action: Only specify the '-createsrv' or '-deletesrv' options with the '-protocol' option.
/
1026, GNS_UPDATE_TIMETOLIVE_DELETE_NOTALLOWED, "The \"-{0}\" option cannot be specified with the \"-timetolive\" option."
// *Cause:  An invalid combination of options were specified with the '-timetolive' option.
// *Action: Specify only valid combination of options with the '-timetolive' option.
/
1027, GNS_UPDATE_ONLY_CREATETXTPTR_ALLOWED_NAMETTL, "Only \"-createtxt\" or \"-createptr\" command options are allowed when the \"-namettl\" option is specified."
// *Cause:  A command option other than '-createtxt' or '-createptr' was specified with the '-namettl' option.
// *Action: Only specify the '-createtxt' or '-createptr' command options with the '-namettl' option.
/
1028, SERV_MGMTDB_NOT_PERMITTED, "This action is not permitted on the management database"
// *Cause:  An attempt to perform the requested action on the management database was rejected.
// *Action: Try the action on a non-management database or use the commands 'srvctl <verb> mgmtdb'.
/
1029, NETWORK_NETNUM_EXISTS, "Network {0} exists"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1030, NETWORK_SUBNET_INFO_LINE, "Subnet {0}: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1031, VIP_NAME, "VIP Name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1032, VIP_INFO_LINE_ACTIVE, "VIP {0} Address: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1033, INVALID_OPTION_FOR_LEGACY_ASM, "Invalid command option {0} specified for Standard ASM"
//  *Cause: An option was specified that only can be used with Flex ASM, but Standard ASM is currently configured.
// *Action: Retry the command omitting the specified invalid option.
/
1034, GHC_GHS_CLUSTER, "Rapid Home Provisioning Server (RHPS): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1035, GH_GNS_DISCOVERY_STRING, "Rapid Home Provisioning Server discovery string: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1036,EVAL_ADMIN_DB_NO_G,"Option '-eval' cannot be used to evaluate modifications of a administrator-managed database without the '-srvpool' option"
//  *Cause: The command 'srvctl modify database -db <db_name> -eval' request was issued without the '-srvpool' option.The only '-eval' option modification that can be
//         evaluated for an administrator-managed database is the conversion of that database to a policy-managed database, which is what is requested with the '-srvpool' option.
// *Action: To evaluate effects of modifications on administrator-managed database provide '-srvpool' option.
/
1037, RIMASM_ENABLED, "Leaf ASM is enabled"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1038, RIMASM_DISABLED, "Leaf ASM is disabled"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1039, RIMASM_ENABLED_NODE, "Leaf ASM is enabled on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1040, RIMASM_RUNNING, "Leaf ASM is running"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1041, RIMASM_NOT_RUNNING, "Leaf ASM is not running"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1042, RIMASM_RUNNING_NODE, "Leaf ASM is running on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1043, RIMASM_NOT_RUNNING_NODE, "Leaf ASM is not running on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1044, RIMASM_INSTAT_START, "Leaf ASM is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1045, RIMASM_INSTAT_STOP, "Leaf ASM is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1046, RIMASM_INSTAT_CLEAN, "Leaf ASM is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1047, RIMASM_INSTAT_VALUE, "Leaf ASM has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1048, RIMASM_DISABLED_NODE, "Leaf ASM is disabled on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1049, RIMASM_STOPPING, "Leaf ASM is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1050, PROXYASM_ENABLED, "ADVM proxy is enabled"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1051, PROXYASM_DISABLED, "ADVM proxy is disabled"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1052, PROXYASM_ENABLED_NODE, "ADVM proxy is enabled on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1053, PROXYASM_RUNNING, "ADVM proxy is running"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1054, PROXYASM_NOT_RUNNING, "ADVM proxy is not running"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1055, PROXYASM_RUNNING_NODE, "ADVM proxy is running on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1056, PROXYASM_NOT_RUNNING_NODE, "ADVM proxy is not running on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1057, PROXYASM_INSTAT_START, "ADVM proxy is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1058, PROXYASM_INSTAT_STOP, "ADVM proxy is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1059, PROXYASM_INSTAT_CLEAN, "ADVM proxy is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1060, PROXYASM_INSTAT_VALUE, "ADVM proxy has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1061, PROXYASM_DISABLED_NODE, "ADVM proxy is disabled on node: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1062, PROXYASM_STOPPING, "ADVM proxy is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1063, LSNR_CONFIG_OWNER, "Owner: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1064, LSNR_CONFIG_SUBNET, "Subnet: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1065, OMOTION_DB_EVAL_NO_N, "Option '-eval' cannot be used to evaluate relocation of a database without the '-node' option"
// *Cause:  The command 'srvctl relocate database -db <db_name> -eval' request was issued without the '-node' option.
// *Action: To evaluate effects of database relocation, specify the '-node' option.
/
1066, GNS_EXPORT_SUBDOMAIN_REQUIRED, "Cannot export server data because GNS is not configured with a domain"
//  *Cause: An attempt to export server data failed becuase Grid Naming Service (GNS) was not configured with a domain.
// *Action: Add GNS using the command 'srvctl add gns -domain' and retry the command.
/
1067, GNS_UPDATE_DELETE_ADDRESS, "Option \"-delete\" can be specified only with a non-mandatory \"-address\" option"
// *Cause:  An invalid combination of options was specified with the '-delete' option.
// *Action: Specify only '-address' option with the '-delete' option and retry the command.
/
1068, CONFLICTING_OPTIONS, "Command line options ''{0}'' and ''{1}'' cannot be used together"
//  *Cause: Conflicting options were specified on a srvctl command.
// *Action: Reissue the command with the correct options.
/
1069, SRVPOOL_CATEGORY, "Category: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1070, GNS_MODIFY_ALREADY_EXISTS, "Modify client data operation is not allowed because GNS is configured"
// *Cause: An attempt to modify client data failed because GNS was configured. Client data can only be modified on a GNS client cluster.
// *Action: Remove the GNS configuration and retry the command.
/
1071, ADD_GHS_DG_NOT_EXIST, "Unable to add Rapid Home Provisioning Server because the resource for disk group {0} could not be found. {1}"
//  *Cause: The resource for the specified disk group was not found. Either the disk group name was misspelled or the disk group has not been mounted.
// *Action: Correct the disk group spelling or use SQL*Plus or ASMCA to create the disk group.
/
1072, FILE_NOT_EXISTS_OR_NON_READABLE, "The '-file' option value \"{0}\" does not exist or cannot be read"
//  *Cause: The '-file' option value specified a nonexistent or non-readable file pathname.
// *Action: Ensure that the '-file' option value corresponds to an existing readable file pathname.
/
1073, EMPTY_SERVERPOOL_IN_SERVERPOOL_LIST, "One or more server pool names in the list of server pools (\"{0}\") is  empty"
//  *Cause: While adding a filesystem, the specified list of server pools included an empty server pool name.
// *Action: Make sure that no empty string is provided as part of the server pool list.
/
1074, LSNR_INVALID_OPTION_COMBINATION, "Invalid command line options. \"-subnet\" option must be specified with either \"-asmlistener\" or \"-leaflistener\"."
//  *Cause: An invalid combination of options  was specified.
// *Action: If issuing the command with the '-subnet' option, include either '-asmlistener' or '-leaflistener' option.
/
1075, SERV_MOD_I_AV_MISSED, "Missing required option '-available'"
//  *Cause: The '-toprefer' option was specified on the command 'srvctl modify service' request without required '-available' option.
// *Action: Make sure that the required option is provided.
/
1076, SERV_ADD_EVAL_OPTION, "Option '-eval' cannot be used to evaluate effects of addition of service {0} with an administrator-managed database {1}"
//  *Cause: The '-eval' option was specified on the command 'srvctl add service' request with an administrator-managed database.
// *Action: Specify a policy-managed database.
/
1077, MODIFY_FS_ERROR_AS_LOCAL_RESOURCE_FOUND, "Server pool or node list cannot be modified because the file system for volume device {0} is a cluster-wide file system"
//  *Cause: An attempt to modify the server pool or node list attributes of a cluster file system was rejected because the filesystem resource was a local resource.  Placement attributes like server pools or node names apply only to cluster resources.
// *Action: Do not specify node names and server pools, or remove the local resource and add a cluster resource using the command 'srvctl add filesystem {-serverpools <serverpool_list>|-nodes <node_list>}'
/
1078, SERV_MOD_EVAL_OPTION, "Option '-eval' cannot be used to evaluate effects of modification of service {0} with an administrator-managed database {1}"
//  *Cause: The '-eval' option was specified on the command 'srvctl modify service' request with an administrator-managed database.
// *Action: Specify a policy-managed database.
/
1079, SERV_START_EVAL_OPTION, "Option '-eval' cannot be used to evaluate effects of starting service {0} with an administrator-managed database {1}"
//  *Cause: The '-eval' option was specified on the command 'srvctl start service' request with an administrator-managed database.
// *Action: Specify a policy-managed database.
/
1080, SERV_STOP_EVAL_OPTION, "Option '-eval' cannot be used to evaluate effects of stopping service {0} with an administrator-managed database {1}."
//  *Cause: The '-eval' option was specified on the command 'srvctl stop service' request with an administrator-managed database.
// *Action: Specify a policy-managed database.
/
1081, GNS_VALIDATE_SUCCESS, "The name \"{0}\" is advertised through GNS."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1082, GH_PORT_NUMBER, "Port number: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1083, ONS_PORT_ALREADY_IN_USE, "Port \"{0}\" is already configured for use as a local, remote or Enterprise Manager by the ONS daemon"
//  *Cause: The specified port was already in use by an ONS daemon.
// *Action: Specify a port that is not already configured.
/
1084, ONS_REPEATED_PORT, "Port \"{0}\" is used in multiple ONS ports"
//  *Cause: The specified port was provided as two or more ONS ports.
// *Action: Ensure that the specified port is different from the local ONS, remote ONS and Enterprise Manager ports.
/
1085, UNSUPPORTED_VERB_NOUN_COMB, "Command ''{0}'' is not supported for object ''{1}''"
//  *Cause: An unsupported command and object combination was specified.
// *Action: Re-issue the command using one of the supported usages.
/
1086, EXCLUSIVE_OPTIONS, "Command option {0} and {1} cannot be used together"
//  *Cause: Conflicting command line options were supplied.
// *Action: Check the command line options entered and make sure that all the required options in one set are specified.
/
1087, MISSING_REQUIRED_OPTION, "Missing required option {0} when {1} was specified" 
//  *Cause: The specified command option is missing. 
// *Action: Use the command 'srvctl' with the '-help' option to display option details for the command and make sure that all the required options are specified. 
/
1088, ADMIN_DB_ADD_SVC_PQ_FAIL, "Failed to add PQ service {0} using PQ server pool {1}. Administrator-managed database {2} does not support PQ services"
//  *Cause:An attempt to add a PQ service to the specified database was rejected because only policy-managed databases support PQ services.
// *Action: Do not add PQ services to administrator-managed databases.
/
1089, INVALID_OPTION_NON_BIG_CLUSTER, "Specified command option {0} can only be used in Flex Cluster"
//  *Cause: The cluster was configured as a regular cluster. The specified command option is only valid for Flex Cluster.
// *Action: Do not specify options that are only valid in Flex Cluster mode when the cluster is configured as a regular cluster. 
/
1090, EXISTING_SERVICE_NOT_FOR_PQ, "Existing service {0} cannot be registered as the parallel query helper of the primary service {1}"
//  *Cause: An attempt to register a parallel query service specified a service that already exists.
// *Action: Use a different parallel query service name.
/
1091, NO_SERVICES2START_ON_SERVERPOOL, "Failed to start service {0} of database {1} on server pool {2} that was not configured for service"
//  *Cause: The service was not configured to run on the specified serverpool.
// *Action: Start the services on already configured serverpool or modify the service to run on the specified serverpool.
/
1092, USE_MAIN_SERVICE_FOR_PQ, "The parallel query service name {0} was specified when the primary service name {1} is required"
//  *Cause: An attempt was made to operate on a database service via its parallel query helper service name rather than the primary service name.
// *Action: Specify the primary service name.
/
1093, NO_SERVICES2STOP_ON_SERVERPOOL, "Failed to stop service {0} of database {1} on server pool {2} that was not configured for service"
//  *Cause: The service was not running on the specified serverpool.
// *Action: Stop the service on the serverpool on which it is running.
/
1094, FAILED_MODIFY_PQPOOL_NO_PQSERVICE, "Failed to set the parallel query pool {0} because the parallel query helper service does not exist"
//  *Cause: An attempt was made to set a parallel query pool for the service that does not have a parallel query helper service configured or whose configured parallel query helper service would be removed by the '-pqservice' argument.
// *Action:  Issue the command "srvctl modify service -db <database_name> -service <primary_service_name> -pqservice <pq_service_name> -pqpool <pq_pool_name>" to configure parallel query service for the specified parallel query server pool.
/
1095, VIP_INFO_LINE_INACTIVE, "VIP {0} Address: {1} (inactive)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1096, NETWORK_SUBNET_INFO_LINE_INACTIVE, "Subnet {0}: {1} (inactive)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1097, GNSCLIENT_INVALID_OPTION, "Invalid command line option -{0} for ''srvctl config gns'' command on GNS client cluster"
//  *Cause: An invalid command line option was specified for 'srvctl config gns' command on Grid Naming Service (GNS) client cluster.
// *Action: Re-issue the command using one of the supported options.
/
1098, GHS_GHC_NOTHING_MODIFIED, "Nothing to modify"
//  *Cause: No options were specified to modify.
// *Action: Specify at least one option with the modify command.
/
1099, GHC_NAME, "Cluster name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1100, START_CONCURRENCY, "Start concurrency: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1101, STOP_CONCURRENCY, "Stop concurrency: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1102, ASM_NOT_SUPPORTED_IN_ASM_CLIENT_CLUSTER, "Cannot issue \" srvctl {0} asm \" in ASM Client Cluster"
//  *Cause: A srvctl command that operates on ASM was issued in an ASM Client Cluster.
// *Action: Issue the specified command in the cluster that ASM Client Cluster connects to.
/
1103, GNS_EXPORT_NOT_ALLOWED, "Export of client data is not allowed on client cluster."
// *Cause: The command 'srvctl export gns' request was issued while the cluster was configured as Client.
// *Action: Rerun the command on the Grid Naming Service (GNS) Server Cluster.
/
1104, GNS_IMPORT_FILE_NOT_FOUND, "Import file \"{0}\" does not exist"
//  *Cause: An attempt to import a GNS instance failed because the import file could not be found.
// *Action: Provide the name of an existing file to import.
/
1105, SERV_PQSERV_SAME, "Failed to add PQ service {0} because it has the same name as the core service {1}"
//  *Cause: An attempt to add PQ service was rejected because it has the same name as that of core service.
// *Action: Issue the command using a different PQ service name.
/
1106, LSNR_INVALID_OPT_COMB_USER, "Invalid command line options. \"-user\" option cannot be specified with \"-asmlistener\" or \"-leaflistener\"."
//  *Cause: An invalid combination of options  was specified.
// *Action: If issuing the command with the '-user' option, do not include '-asmlistener' or '-leaflistener options.
/
1107, GNS_ALREADY_ADDED, "GNS server already configured"
//  *Cause: An attempt to add a GNS server failed because a GNS server was already configured.
// *Action: Remove GNS server using the command 'srvctl remove gns' and retry the command.
/
1108, INVALID_OPTION_ADMIN_MANAGED_DB, "Database {0} is an administrator-managed database, and therefore cannot accept only \"-pqpool\" option without \"-serverpool\" option for the conversion to a policy-managed database"
//  *Cause: An option was specified that only can be used on a policy-managed database. The '-pqpool' option alone is not sufficient to convert an administrator-managed database to a policy-managed database.
// *Action: Retry the command omitting the '-pqpool' option or convert the database to a policy-managed database by specifying one or more hub serverpools with the '-serverpool' option also in addition to the '-pqpool' option specified on the command line.
/
1109, INVALID_UPDATE_OPTION, "Missing -asm or -remove option to remove ASM listener" 
//  *Cause: An invalid combination of options was specified. Either '-asm' or '-remove' option was missing.
// *Action: Issue the command with both '-asm' and '-remove' options.
/
1110, GNS_CLIENT_SERVER_NOT_EXIST, "Neither GNS server nor GNS client is configured on this cluster"
//  *Cause: The specified GNS command failed because neither GNS server nor GNS client was configured on this cluster.
// *Action: Configure either GNS server using the command 'srvctl add gns -vip {<vip_name> | <ip>} [-domain <domain>]' or GNS client using the command 'srvctl add gns -clientdata <filename>' in this cluster and retry the command.
/
1111, GNS_CLIENT_ALREADY_ADDED, "GNS client already configured"
//  *Cause: An attempt to add a secondary Grid Naming Service (GNS) server cluster or GNS client cluster failed because a GNS client was already configured.
// *Action: Remove the GNS client using the command 'srvctl remove gns' and retry the command.
/
1112, PQ_INST_NOT_SUPPORTED, "Option -pq conflicts with -instance for service {0} of database {1}"
//  *Cause: An attempt to start or stop a parallel query helper service was rejected because -pq cannot be specified with -instance.
// *Action: Issue the command without the -pq option or without the -instance option.
/
1113, SERVERPOOL_INVALID, "Server pool {0} is not valid for services {1} of the database {2}"
//  *Cause: An attempt to start or stop services on the server pool was rejected because the specified server pool was not one of the server pools of the specified services.
// *Action: Examine the server pools for the specified services using 'srvctl config service' and issue the command specifying a server pool of the service.
/
1114, GNS_NOT_RUNNING_EXPORT, "Unable to export client data: GNS is not running"
// *Cause: An attempt was made to export GNS client data when Grid Naming Service (GNS) was not running.
// *Action: Start GNS with 'srvctl start gns' and reissue the request.
/
1115, GNS_IMPORT_NOT_ALLOWED, "Import of instance is not allowed on client cluster."
// *Cause: The command 'srvctl import gns' request was issued while the cluster was configured as Client.
// *Action: Rerun the command on the Grid Naming Service (GNS) Server Cluster.
/
1116, GNS_CLIENT_COMMAND_INVALID, "This command cannot be executed on a GNS client cluster."
// *Cause:  An attempt to execute a command supported only on GNS server clusters failed because this cluster is configured as a GNS client.
// *Action: Execute this command on the GNS server cluster.
/
1117, GNS_NOT_EXIST, "GNS server is not configured in this cluster."
// *Cause: A command that applies only to a GNS server cluster was rejected because this cluster has not been configured as a GNS server.
// *Action: If GNS server is to run in this cluster, use the 'srvctl add gns' command to configure it.
/
1118, CHA_ENABLED, "Oracle Cluster Health Analysis Service is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1119, CHA_DISABLED, "Oracle Cluster Health Analysis Service is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1120, CHA_RUNNING, "Oracle Cluster Health Analysis Service is running on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1121, CHA_NOT_RUNNING, "Oracle Cluster Health Analysis Service is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1122, CHA_ENABLED_NODE, "Oracle Cluster Health Analysis Service is enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1123, CHA_DISABLED_NODE, "Oracle Cluster Health Analysis Service is disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1124, FS_RELOCATE_SUCCESS, "The file system was relocated successfully."
// *Document: NO
//  *Cause:
// *Action:
/
1125, INVALID_VAL_NUMS, "multiple values specified for the single value option \"{0}\": "
//  *Cause: Multiple values were specified for an option which accepts only a single value. 
// *Action: Check the values printed following the message and reissue the command specifying a single value for the indicated option.
/
1126, LABEL_DG_NAME, "Diskgroup name: {0}"
//  *Document: No
//  *Cause: Volume diskgroup label
// *Action: None.
/
1127, GHS_DISABLED_ON_NODE, "Rapid Home Provisioning Server is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1128, INVALID_GETENVSTR, "Environment variable {0} is not defined."
//  *Cause: The command specified an environment variable which had no value defined.
// *Action: None. 
/
1129, INVALID_OPTION_WIN, "Specified option \"{0}\" is not supported on Windows"
//  *Cause: An option was provided which is not supported on Windows.
// *Action: Reissue the command after removing the indicated option.
/
1130, CHA_MONITOR_DB_FAILED, ""
// *Document: No
// *Cause:
// *Action:
/
1131, CHA_UNMONITOR_DB_FAILED, ""
// *Document: No
// *Cause:
// *Action:
/
1132, CHA_MONITOR_HOST_FAILED, ""
// *Document: No
// *Cause:
// *Action:
/
1133, CHA_UNMONITOR_HOST_FAILED, ""
// *Document: No
// *Cause:
// *Action:
/
1134, CHA_RUNNING_MONITORING_HOST, "Oracle Cluster Health Analysis Service is running on node {0} and is monitoring host {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1135, CHA_RUNNING_MONITORING_DB, "Oracle Cluster Health Analysis Service is running on node {0} and is monitoring cluster database instances {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1136, CHA_RUNNING_MONITORING_HOST_DB, "Oracle Cluster Health Analysis Service is running on node {0} and is monitoring host {1} and cluster database instances {2}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1137, CHA_STATUS_FAILED, "Failed to retrieve the status for Oracle Cluster Health Analysis Service" 
// *Cause: An attempt to retrieve the status for Oracle Cluster Health Analysis Service failed.
// *Action: Examine the accompanying error messages for details.
/
1138, DISKGROUP, "Disk group: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1139, LSNR_CONFIG_TYPE, "Type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1140, SRV_GSM_FLAGS, "GSM Flags: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1141, LABEL_ACFS_AUX_VOLS, "Accelerator volume devices: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1142, SUBDOMAIN_NOT_MATCH, "The GNS subdomain {0} inside the instance file {1} does not match with configured GNS subdomain {2}."
//  *Cause: An attempt to import a GNS instance file into a Grid Naming Service (GNS) instance failed because the subdomain of the destination instance did not match the subdomain in the file.
// *Action: Configure GNS with a subdomain name that matches the instance file subdomain and attempt the import again.
/
1143, UNSUPPORTED_OPTION_CLIENT_CLUSTER, "Command option {0} is not supported on an ASM client cluster."
//  *Cause: The command option specified on the command line was not valid for an ASM client cluster.
// *Action: Command options for ASM Listener, ASM, DISKGROUP, VOLUME, and ACFS are not supported on an ASM client cluster. Remove the invalid option and retry the command.
/
1144, NETWORK_PING_TARGETS, "Ping Targets: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1145, CHA_MONITORING, "\nOracle Cluster Health Analysis Service is monitoring:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1147, CHA_MONITORING_HOST_MODEL, "Oracle Cluster Health Analysis Service is monitoring host {0} using model {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1149, CHA_MONITORING_INST_MODEL, "Oracle Cluster Health Analysis Service is monitoring database instance {0} using model {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1150, CHA_ERROR, "\nOracle Cluster Health Analysis Service got errors:\n{0}"
//  *Cause: An attempt to get the status of Oracle Cluster Health Analysis Service failed.
//  *Action: Examine the accompanying error messages for details.
/
1151, CHA_NOT_RUNNING_NODE, "Oracle Cluster Health Analysis Service is not running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1152, CHA_POLICY_MANAGED_CLUSTER, "The specified option combination, -node with -model, is not permitted when server pools are configured." 
//  *Cause: An attempt to start monitoring the target was rejected since the specified option combination, -node with -model, is not permitted when server pools are configured. 
// *Action: Check the specified option combination. 
/
1153, CHA_ADMIN_MANAGED_CLUSTER, "The specified option, -serverpool, is not permitted when server pools are not configured."
//  *Cause: An attempt to start or stop monitoring the target was rejected since the specified option, -serverpool, is not permitted when server pools are not configured. 
// *Action: Check the specified option. 
/
1154, CVU_CFG_ENABLED, "CVU is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1155, ACFS_ENABLED_NODES, "ACFS file system is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1156, ACFS_DISABLED_NODES, "ACFS file system is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1157, FS_ENABLED_NODES, "File system is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1158, FS_DISABLED_NODES, "File system is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1159, VOL_ENABLED_NODES, "Volume is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1160, VOL_DISABLED_NODES, "Volume is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1161, GNS_ENABLED_NODES, "GNS is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1162, GNS_DISABLED_NODES, "GNS is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1163, CVU_ENABLED_NODES, "CVU is individually enabled on nodes: {0}" 
//  *Document: No 
//  *Cause: Status message
// *Action: Not an error
/
1164, CVU_DISABLED_NODES, "CVU is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1165, OC4J_ENABLED_NODES, "OC4J is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1166, OC4J_DISABLED_NODES, "OC4J is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1167, GHC_ENABLED_NODES, "Rapid Home Provisioning Client is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1168, GHC_DISABLED_NODES, "Rapid Home Provisioning Client is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1169, EXPORT_ENABLED_NODES, "Export file system is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1170, EXPORT_DISABLED_NODES, "Export file system is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1171, VIP_ENABLED_NODES, "VIP is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1172, VIP_DISABLED_NODES, "VIP is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1173, HAVIP_ENABLED_NODES, "HAVIP is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1174, HAVIP_DISABLED_NODES, "HAVIP is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1175, GHS_ENABLED_NODES, "Rapid Home Provisioning Server is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1176, GHS_DISABLED_NODES, "Rapid Home Provisioning Server is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1177, SCANLSNR_ENABLED_NODES, ""
// NOT TO BE REUSED
//  *Document: No
//  *Cause: 
// *Action: 
/
1178, SCANLSNR_DISABLED_NODES, ""
// NOT TO BE REUSED
//  *Document: No
//  *Cause:
// *Action:
/
1179, SCANVIP_ENABLED_NODES, ""
// NOT TO BE REUSED
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1180, SCANVIP_DISABLED_NODES, ""
// NOT TO BE REUSED
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1181, LSNR_ENABLED_NODES, "Listener is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1182, LSNR_DISABLED_NODES, "Listener is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1183, IOSERVER_ENABLED_NODES, "ASM I/O server is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1184, IOSERVER_DISABLED_NODES, "ASM I/O server is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1185, ONS_ENABLED_NODES, "ONS is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1186, ONS_DISABLED_NODES, "ONS is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1187, ADMHELPER_ENABLED_NODES, "Adminhelper is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1188, ADMHELPER_DISABLED_NODES, "Adminhelper is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1189, NETWORK_ENABLED_NODES, "Network is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1190, NETWORK_DISABLED_NODES, "Network is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1191, DB_ENABLED_NODES, "Database is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1192, DB_DISABLED_NODES, "Database is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1193, MGMTDB_ENABLED_NODES, "Management database is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1194, MGMTDB_DISABLED_NODES, "Management database is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1195, MGMTLSNR_ENABLED_NODES, "Management listener is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1196, MGMTLSNR_DISABLED_NODES, "Management listener is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1197, VOLUME_CFG_ENABLED, "Volume is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1198, VOLUME_CFG_DISABLED, "Volume is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1199, EXPORT_CFG_ENABLED, "Export file system is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1200, EXPORT_CFG_DISABLED, "Export file system is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1201, VIP_CFG_ENABLED, "VIP is enabled." 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1202, VIP_CFG_DISABLED, "VIP is disabled." 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1203, HAVIP_CFG_ENABLED, "HAVIP is enabled." 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1204, HAVIP_CFG_DISABLED, "HAVIP is disabled." 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1205, SCANLSNR_CFG_ENABLED, "SCAN Listener is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1206, SCANLSNR_CFG_DISABLED, "SCAN Listener is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1207, SCANVIP_CFG_ENABLED, "SCAN VIP is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1208, SCANVIP_CFG_DISABLED, "SCAN VIP is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1209, LSNR_CFG_ENABLED, "Listener is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1210, LSNR_CFG_DISABLED, "Listener is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1211, MGMTDB_CFG_ENABLED, "Management database is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1212, MGMTDB_CFG_DISABLED, "Management database is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1213, MGMTLSNR_CFG_ENABLED, "Management listener is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1214, MGMTLSNR_CFG_DISABLED, "Management listener is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1215, GNS_MODIFY_NOT_ALLOWED, "Command option -{0} is not supported on GNS client cluster."
// *Cause: The command option specified on the command line was not valid for GNS client cluster.
// *Action: Remove the invalid option and retry the command.
/
1216, CHA_CONFIG_BAD_OPTION, "Option '-node' cannot be used with option '-db' or '-serverpool'."
//  *Cause: A 'srvctl config cha' command specified conflicting options.
// *Action: Reissue the command with the correct options.
/
1217, CHA_INVALID_NODE, "Failed to retrieve Oracle Cluster Health Analysis Service configuration for the specifed node {0}."
//  *Cause: An attempt to retrieve Oracle Cluster Health Analysis Service configuration for the specified node failed.
// *Action: Examine the accompanying error messages for details.
/
1218, CHA_NODE_SRVPOOL_FAIL, "Failed to retrieve server pool configuration for node {0}."
// *Cause: An attempt to retrieve server pool configuration from the Oracle Cluster Health Analysis Service for the given node failed.
// *Action: Examine the accompanying error messages for details.
/
1219, CHA_DB_SRVPOOL_FAIL, "Failed to retrieve server pool {0} configuration for the database {1}."
// *Cause: An attempt to retrieve Oracle Cluster Health Analysis Service configuration for the specified database on the server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1220, CHA_DB_FAIL, "Failed to retrieve Oracle Cluster Health Analysis Service configuration for the specified database {0}."
// *Cause: An attempt to retrieve Oracle Cluster Health Analysis Service configuration for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1221, CHA_SRVPOOL_FAIL, "Failed to retrieve Oracle Cluster Health Analysis Service configuration for the specified server pool {0}."
// *Cause: An attempt to retrieve Oracle Cluster Health Analysis Service configuraiton details for the specified serverpool failed.
// *Action: Examine the accompanying error messages for details.
/
1222, CHA_CLUSTER_FAIL, "Failed to retrieve cluster configuration for Oracle Cluster Health Analysis Service."
// *Cause: An attempt to retrieve cluster configuration for Oracle Cluster Health Analysis Service failed.
// *Action: Examine the accompanying error messages for details.
/
1223, CHA_SQL_FAIL, "An SQL error occurred while retrieving information from Grid Information Management Repository." 
// *Cause: An SQL error occurred while connecting to or reading from Grid Information Management Repository.
// *Action: Examine the accompanying error messages for details.
/
1224, STATUS_SRVPOOL_FAILED, "failed to retrieve server pool status"
// *Cause: An attempt to retrieve the status of server pools failed.
// *Action: Examine the accompanying error messages for details.
/
1225, STATUS_SRVPOOL_FAILED_G, "failed to retrieve the status of server pool {0}"
// *Cause: An attempt to retrieve the status of the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1226, PROXYASM_ENABLED_NODES, "ADVM proxy is individually enabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1227, PROXYASM_DISABLED_NODES, "ADVM proxy is individually disabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1228, CHA_ENABLED_ONE_NODE, "Oracle Cluster Health Analysis Service is enabled on node {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1229, CHA_DISABLED_ONE_NODE, "Oracle Cluster Health Analysis Service is disabled on node {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1230, CHA_RUNNING_ONE_NODE, "Oracle Cluster Health Analysis Service is running on node {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1231, SERVER_POOL_REMOVED, "Process cancelled by user."
// *Cause: A 'srvctl add service' request was interrupted before completion by Ctl-C or a similar mechanism. The operation has been cancelled.
// *Action: None
/ 
1232, STATIC_VIP_MISSING_ADDR, "required '-address' option missing for static network type"
//  *Cause: An attempt to add a VIP resource for a static network type was rejected because no address was specified with the -address option.
// *Action: Retry the command with '-address' option.
/
1233, INVALID_FIXED_OPT, "Invalid option '-fixed' supplied while adding a non-single-instance database."
//  *Cause: The '-fixed' option can be supplied only when adding a single-instance database.
// *Action: Reissue the command without the '-fixed' option.
/
1234, DEFINE_FIXED, "    -{0}                         Sets the HOSTING_MEMBERS attribute instead of the SERVER_POOLS attribute for a Single-Instance database(SIDB)."
//  *Document: No
//  *Cause: Status message for -fixed
// *Action: Not an error
/
1235, MODIFY_DB_INVALID_OPT_X, "Option '-node' is invalid for database {0} of type {1}"
//  *Cause: An attempt to modify the node of a non-single-instance database was rejected because '-node' can be specified only for a single-instance database.
// *Action: Reissue the command again without the '-node' option.
/
1236, SIDB_EXCL_FIXED_OPT, "Options '-fixed' and '-serverpool' cannot be used together."
//  *Cause: An attempt to create a policy-managed single-instance database with the '-fixed' option was rejected because '-fixed' can be specified only for an non-policy-managed single-instance database.
// *Action: Reissue the command again without the '-fixed' option.
/
1237, MODIFY_DB_INVALID_OPT_GN, "Options '-serverpool' and '-node' are invalid for single-instance fixed database {0}"
//  *Cause: An attempt to modify the SERVER_POOLS or HOSTING_MEMBERS attributes of a fixed single-instance database was rejected because a fixed single-instance database is not hosted on a serverpool and the HOSTING_MEMBERS attributes cannot be modified.
// *Action: Reissue the command again without the '-serverpool' and '-node' options.
/
1238, UPDATE_DB_INVALID_OPT_ON, "Option '-node' cannot be specified without '-startoption'."
//  *Cause: An invalid combination of options was specified.
// *Action: Reissue the command again with the '-startoption' option.
/
1239, MISSING_MAND_OPT, "One of the mandatory options {0} or {1} should be supplied."
//  *Cause: An attempt to execute a 'srvctl' command failed because none of the mandatory options was specified.
// *Action: Reissue the command with the mandatory options.
/
1240, INVALID_OPT_COMB, "Options {0} and {1} cannot be specified together."
//  *Cause: An attempt to execute a 'srvctl' command failed because an invalid option combination was specified.
// *Action: Reissue the command with valid options.
/
1241, START_SIDB_INVALID_OPT_N, "invalid use of '-node' option on start of single-instance database {0}"
//  *Cause: The '-node' option was specified to start a single-instance database, but this option is only applicable to a RAC One Node database.
// *Action: Reissue the command without the '-node' option.
/
1242, UNSUPPORTED_OPTION_AUXVOLUMES, "The command option '-auxvolumes' is not supported on this operating system." 
//  *Cause: The option '-auxvolumes' was specified for an unsupported 
//          operating system. 
// *Action: Reissue the command without the '-auxvolumes' option.
/
1243, GNS_VIP_ADDRESSES, "GNS VIP addresses: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
1244, OC4J_CONFIG_HTTPPORT, "OC4J is configured to listen on HTTP port number {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1245, OC4J_MODIFY_HTTPPORT_FAILED, "OC4J HTTP port could not be modified"
//  *Cause: An error occurred while trying to modify the OC4J HTTP port. 
// *Action: Examine the accompanying error messages for details.
/
1246, RESET_RHPS_RUNNING, "Rapid Home Provisioning (RHP) server is running. Can't clean RHP repository."
//  *Cause: A request to clean the RHP repository was rejected because the RHP server was running.
// *Action: Use the command 'srvctl stop rhpserver' or, if necessary, use the command 'srvctl stop rhpserver -force' to stop the Rapid Home Provisioning Server and then retry resetting the Rapid Home Provisioning repository.
/
1247, ERR_INST_N_OPTION, "An instance name was specified with multiple node names."
//  *Cause: Option '-instance' cannot be used when multiple nodes are specified using the '-node' option.
// *Action: Specify either instance(s) or node(s).
/
1248, INVALID_OPT_COMB_I_N, "Both '-instance' and '-node' options were specified with multiple values."
//  *Cause: Options '-instance' and '-node' cannot be used together when multiple values are specified for each of them.
// *Action: Use either '-instance' or '-node'.
/
1249, UPDATE_DB_INVALID_OPT_SP, "Option '-serverpool' cannot be specified without '-startoption'."
//  *Cause: An invalid combination of options was specified.
// *Action: Reissue the command with the '-startoption' option.
/
1250, SIDB_INVALID_SERVERPOOL_OPT, "option '-serverpool' specified for starting, stopping, or changing the start mode of database {0} which is neither Oracle RAC nor Oracle RAC One Node"
// *Cause: An attempt to start, stop, or change the start mode on a server pool specified a database that is neither Oracle RAC nor Oracle RAC One Node.
// *Action: Reissue the command without the '-serverpool' option.
/
1251, ADD_VM_FAILED_ALREADY_REGISTERED, "Adding a VM resource failed because the virtual machine \"{0}\" specified is already configured in a different VM resource."
//  *Cause: The VM resource was not added because the virtual machine name or ID specified was already registered in a different resource.
//  *Action: Retry the 'add' command specifying virtual machine names or IDs that are not already registered.
/
1252, VM_STATUS_ERROR, "failed to query the status of VM resource {0} due to errors:\n{1}"
//  *Cause: An attempt to query the status of the specified VM resource failed.
//  *Action: Examine the accompanying error messages for details. 
/
1253, PROMPT_OVMM_PASSWORD, "Enter the Oracle VM Manager password:"
// *Document: NO
//  *Cause:
// *Action:
/
1254, OVMM_PORT_INVALID, "Oracle VM Manager port \"{0}\" is not valid."
//  *Cause: The specified Oracle VM Manager port was not valid. A valid Oracle VM Manager port is a nonnegative number.
// *Action: Specify a valid Oracle VM Manager port number.
/
1255, OVMM_NOTHING_MODIFIED, "nothing to modify"
//  *Cause: No options were specified to modify.
// *Action: Specify at least one option with the 'modify' command.
/
1256, OVMM_PASSWORD_INVALID, "Oracle VM Manager password is empty."
//  *Cause: The command failed because the length of the password should be at least one character.
// *Action: Specify a valid Oracle VM Manager password.
/
1257, OVMM_ADD_FAILED_ALREADY_EXISTS, "Oracle VM Manager is already configured."
// *Cause: An attempt to add Oracle VM Manager failed because it was already configured.
// *Action: None. 
/
1258, OVMM_MODIFY_FAILED_NOT_EXISTS, "failed to modify Oracle VM Manager information because Oracle VM Manager is not configured"
// *Cause: An attempt to modify Oracle VM Manager information failed because it was not configured.
// *Action: Configure Oracle VM Manager in the cluster.
/
1259, PASSWORD_PROMPT_FAILED, "failed to read password from console"
//  *Cause: An error occurred during an attempt to read a password from the console or input device.
// *Action: Examine the accompanying error messages for details.
/
1260, OVMM_REMOVE_FAILED, "failed to remove Oracle VM Manager"
//  *Cause: An attempt to remove Oracle VM Manager failed.
// *Action: Examine the accompanying error messages for details.
/
1261, OVMM_REMOVE_FAILED_NOT_EXIST, "Oracle VM Manager does not exist."
//  *Cause: An attempt to remove Oracle VM Manager failed because it did not exist. It was either not added or already removed.
// *Action: None.
/
1262, OVMM_CREATE_FAILED_INVALID_WALLET, "failed to add Oracle VM Manager configuration because a wallet did not exist at the specified path {0}" 
// *Cause: An error occurred while creating the Oracle VM Manager configuration because the specified path did not contain a wallet.
// *Action: Retry the command specifying the path of an existing wallet file.
/
1263, VM_CONFIG_FAILED, "failed to retrieve the configuration details for VM resource"
//  *Cause: An attempt to retrieve the configuration of the VM resource failed.
//  *Action: Examine the accompanying error messages for details.
/
1264, VM_MODIFY_FAILED, "failed to modify the configuration of VM resource \"{0}\""
//  *Cause: An attempt to modify the configuration of the VM resource failed.
//  *Action: Examine the accompanying error messages for details.
/
1265, VM_ADD_FAILED, "failed to add VM resource \"{0}\""
//  *Cause: An attempt to add the VM resource failed.
//  *Action: Examine the accompanying error messages for details.
/
1266, VM_STATUS_NOT_FOUND, "virtual machine \"{0}\" not found in VM resource \"{1}\""
//  *Cause: An attempt to retrieve the status of the specified virtual machine failed because it was not found in the configuration of the VM resource.
//  *Action: Retry the command, making sure to specify a virtual machine that is part of the VM resource. The virtual machines that are in the VM resource
//           can be listed using the 'srvctl config' command.
/
1267, GNS_IMPORT_INVALID_FILE, "invalid import file \"{0}\""
//  *Cause: An attempt to import a Grid Naming Service instance failed because the indicated file was not found, was of the wrong type or had zero length.
// *Action: Reissue the command specifying a valid import file. 
/
1268, ADMIN_DB_UNSUPPORTED, "Option {0} is not supported for the administrator-managed database {1}."
//  *Cause: An attempt to start or stop the services of administrator-managed database was rejected because a server pool was specified and server pools are not compatible with administrator-managed databases.
//  *Action: Consult the documentation and reissue the command with the correct options.
/
1269, NO_SERV_SRVPOOL, "No services are configured on server pool {0}."
// *Document: No
// *Cause: Warning message
// *Action: Not an error
/
1270, NO_SERV_DB_SRVPOOL, "No services are configured on server pool {0} for database {1}."
// *Document: No
// *Cause: Warning message
// *Action: Not an error
/
1271, NO_DBS_SRVPOOL, "No databases are hosted by server pool {0}."
// *Document: No
// *Cause: Warning message
// *Action: Not an error
/
1272, SERV_REL_EVAL_OPTION_DB, "Option '-eval' was specified to evaluate the effects of service relocation of administrator-managed database {0}."
//  *Cause: An attempt to evaluate the effect of service relocation for an administrator-managed database was rejected because the '-eval' option can only be used to evaluate the relocation of services for policy-managed databases.
// *Action: Retry the request specifying a service of a policy managed database.
/
1273, SERV_RELOC_OPT_IT_DB, "Options '-oldinst' and '-newinst' were specified with the services of policy-managed database {0}."
//  *Cause: An attempt to relocate a service of a policy-managed database was rejected because '-oldinst' and '-newinst' options were specified, which can only be used for administrator-managed databases.
// *Action: Use options '-currentnode' and '-targetnode' to relocate a service in a policy-managed database.
/
1274, SERV_RELOC_OPT_CN_DB, "Options '-currentnode' and '-targetnode' cannot be used with the services of administrator-managed database {0}."
//  *Cause: An attempt to relocate an administrator-managed database was rejected because '-currentnode' and '-targetnode' options were specified, which can only be used for policy-managed databases.
// *Action: Use options '-oldinst' and '-newinst' to relocate a service in an administrator-managed database.
/
1275, GH_EMAIL_ADDRESS, "Email address: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1276, GH_MAIL_SERVER_ADDRESS, "Mail server address: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1277, GH_MAIL_SERVER_PORT, "Mail server port: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1278, PROMPT_GH_NOTIFICATION_PASSWORD, "Enter the mail server login password:"
// *Document: NO
//  *Cause:
// *Action:
/
1279, GH_NOTIFICATION_PASSWORD_INVALID, "Mail server login password is empty."
//  *Cause: The command failed because the supplied password was empty.
// *Action: Specify a valid mail server login password.
/
1280, VM_LIST_EMPTY, "Virtual machine list is incompletely specified."
//  *Cause: The command failed because the virtual machine list was not specified or had missing values.
// *Action: Retry the command making sure that the virtual machine list is completely specified including all required values.
/
1283, CCMB_RUNNING, "Oracle ACFS client cluster node membership and barrier resource is running on nodes {0}."
//  *Document: No
//  *Cause:
// *Action:
/
1284, CCMB_NOT_RUNNING, "Oracle ACFS client cluster node membership and barrier resource is not running."
//  *Document: No
//  *Cause:
// *Action:
/
1287, CCMB_ENABLED_NODES, "Oracle ACFS client cluster node membership and barrier resource is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1288, CCMB_DISABLED_NODES, "Oracle ACFS client cluster node membership and barrier resource is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1291, CCMB_CFG_ENABLED, "Oracle ACFS client cluster node membership and barrier resource is enabled." 
//  *Document: No
//  *Cause:
// *Action:
/
1292, CCMB_CFG_DISABLED, "Oracle ACFS client cluster node membership and barrier resource is disabled." 
//  *Document: No
//  *Cause:
// *Action:
/
1293, QOSMSERVER_STATUS_DISABLED, "QoS Management Server is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1294, QOSMSERVER_ADDED, "QoS Management Server successfully created"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1295, QOSMSERVER_ALREADY_EXISTS, "QoS Management Server already exists."
//  *Cause: An attempt to create the QoS Management Server was rejected because it already exists.
// *Action: None.
/
1296, QOSMSERVER_CREATION_FAILED, "QoS Management Server creation failed."
//  *Cause: QoS Management Server could not be added because of an exception.
// *Action: Resolve the exception and retry.
/
1297, QOSMSERVER_CONFIG_EXISTS, "QoS Management Server is configured to run on port number {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1298, QOSMSERVER_CONFIG_NOT_EXISTS, "QoS Management Server is not configured."
//  *Cause: An attempt to retrieve the configuration of the QoS Management Server failed because the QoS Management Server was not configured on the cluster. 
// *Action: Check the exception printed with this message. If the QoS Management Server is not configured, then it can be created using the command 'srvctl add qosmserver'. If there are other errors shown with this error, then check the cause and action messages of underlying exception.
/
1299, QOSMSERVER_REMOVE_SUCCESS, "QoS Management Server removed successfully."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1300, QOSMSERVER_STILL_RUNNING, "QoS Management Server is still running. It must be stopped before removing."
//  *Cause: A 'srvctl remove qosmserver' command was issued while the QoS Management Server was running.
// *Action: Stop the QoS Management Server using the command 'srvctl stop qosmserver' and then try removing.
/
1301, QOSMSERVER_REMOVE_FAILED, "QoS Management Server could not be removed."
//  *Cause: An attempt to remove the QoS Management Server failed. The accompanying error messages provide more details.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors.
/
1302, QOSMSERVER_MODIFY_PORT_SUCCESS, "QoS Management Server modified to run on port {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1303, QOSMSERVER_MODIFY_PORT_FAILED, "QoS Management Server RMI port could not be modified."
//  *Cause: An error occurred while trying to modify the QoS Management Server Java Remote Method Invocation (RMI) port. 
// *Action: Examine the accompanying error messages for details.
/
1304, QOSMSERVER_START_SUCCESS, "QoS Management Server has been started."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1305, QOSMSERVER_START_FAILED, "QoS Management Server could not be started."
//  *Cause: An attempt to start the QoS Management Server failed. The accompanying error messages provide more details.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors. 
/
1306, QOSMSERVER_STOP_SUCCESS, "QoS Management Server has been stopped."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1307, QOSMSERVER_STOP_FAILED, "QoS Management Server failed to stop."
//  *Cause: An attempt to stop the QoS Management Server failed. The accompanying error messages provide more details.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors.
/
1308, QOSMSERVER_NOT_RUNNING, "QoS Management Server is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1309, QOSMSERVER_RUNNING_NODE, "QoS Management Server is running on node {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1310, QOSMSERVER_NOT_RUNNING_NODE, "QoS Management Server is not running on node {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1311, QOSMSERVER_ENABLED, "QoS Management Server was enabled successfully."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1312, QOSMSERVER_NOT_ENABLED, "QoS Management Server could not be enabled."
//  *Cause: An attempt to enable the QoS Management Server failed. The accompanying error messages provide more details.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors.
/
1313, QOSMSERVER_ENABLED_NODE, "QoS Management Server enabled successfully on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1314, QOSMSERVER_DISABLED, "QoS Management Server disabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1315, QOSMSERVER_NOT_DISABLED, "QoS Management Server could not be disabled."
//  *Cause: An attempt to disable the QoS Management Server has failed. The accompanying error messages provide more details.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors.
/
1316, QOSMSERVER_DISABLED_NODE, "QoS Management Server disabled successfully on node {0}"
//  *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
1317, QOSMSERVER_RELOCATED, "QoS Management Server relocated successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1318, QOSMSERVER_NOT_RELOCATED, "QoS Management Server could not be relocated."
//  *Cause: An attempt to relocate the QoS Management Server failed. The accompanying error messages provide more details.
// *Action: Review the accompanying error messages and retry after resolving the underlying errors.
/
1319, QOSMSERVER_RELOCATED_NODE, "QoS Management Server relocated successfully to node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1320, QOSMSERVER_ALREADY_DISABLED, "QoS Management Server is already disabled."
//  *Cause: QoS Management Server could not be disabled because it was already disabled.
// *Action: None required.
/
1321, QOSMSERVER_ALREADY_ENABLED, "QoS Management Server is already enabled."
//  *Cause: QoS Management Server could not be enabled because it was already enabled.
// *Action: None required.
/
1322, QOSMSERVER_INSTAT_START, "QoS Management Server is being started on node {0}."
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1323, QOSMSERVER_INSTAT_STOP, "QoS Management Server is being stopped on node {0}."
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1324, QOSMSERVER_INSTAT_CLEAN, "QoS Management Server is being cleaned on node {0}."
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1325, QOSMSERVER_INSTAT_VALUE, "QoS Management Server has internal state {0} on node {1}."
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1326, QOSMSERVER_STOPPING, "QoS Management Server is being stopped on node {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1327, QOSMSERVER_ALREADY_RUNNING, "An attempt to modify the port of the QoS Management Server failed because it is running. Use '-force' to force stop and restart the QoS Management Server."
//   *Cause: A request to modify the port number of the QoS Management Server was rejected because such modification requires the QoS Management Server to be stopped and restarted.
//   *Action: Use '-force' option to force restart of the QoS Management Server.
/
1328, QOSMSERVER_STATUS_ENABLED, "QoS Management Server is enabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1329, QOSMSERVER_ENABLED_NODES, "QoS Management Server is individually enabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1330, QOSMSERVER_DISABLED_NODES, "QoS Management Server is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1331, QOSMSERVER_CONFIG_HTTPPORT, "QoS Management Server is configured to listen on HTTP port number {0}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1332, QOSMSERVER_MODIFY_HTTPPORT_FAILED, "QoS Management Server HTTP port could not be modified."
//  *Cause: An error occurred while trying to modify the QoS Management Server HTTP port. 
// *Action: Examine the accompanying error messages for details.
/
1333, NO_DG_CLIENT, "unable to add a database resource with a disk group dependency on an ASM client cluster"
//  *Cause: An attempt to add a database was rejected because the -diskgroup option was specified on the command line on an ASM client cluster. The database to be added cannot cannot have a dependency on the disk group because there is no disk group resource on an ASM client cluster.
//  *Action: To add a database on a client cluster, reissue the command without the -diskgroup option.
/
1334, ASMMODE_FAILED, "failed to retrieve the ASM mode"
//  *Cause: Failed to retrieve the mode of ASM on this cluster when attempting to validate the '-diskgroup' option.
//  *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command.
/
1335, OHOME_INVALID_OPTION_COMBINATION, "Invalid command line options. Neither -addnode nor -deletenode can be specified with -node." 
//  *Cause: An attempt to modify the configuration of the specified Oracle home resource failed because an invalid combination of options was specified. Option '-node' was specified to replace the current node list configuration and '-addnode' or '-deletenode' options were specified to append or remove nodes from the current node configuration.
// *Action: Reissue the command without the '-node' option if either '-addnode' or '-deletenode' are specified.
/
1336, INVALID_GNS_ROLE, "invalid Grid Naming Service role \"{0}\""
//  *Cause: An invalid value was specified for the Grid Naming Service (GNS) role.
// *Action:  Reissue the command specifying a valid GNS role.
/
1337,  NOTHING_TO_UPDATE, "nothing to update"
//  *Cause: No options were specified to update.
// *Action: Specify at least one option with the 'srvctl update instance' command.
/
1338, GNS_REMOVE_FAILED_LEAF_NODE_PRESENT, "GNS cannot be removed because one or more leaf nodes are present."
// *Cause:    Removing GNS failed because one or more leaf nodes were still running in the cluster.
// *Action:   Delete the leaf nodes or change them to hub role, then retry the GNS remove operation.
/
1339, RESET_RHPS_IMG, "cannot clean RHP repository when server has images registered"
//  *Cause: A request to clean the Rapid Home Provisioning (RHP) repository was
//          rejected because the RHP server had one or more images registered.
// *Action: Use 'rhpctl reset server' to delete all images and then retry the
//          command.
/
1340, CLIENT_CONNECTED, "Number of connected clients: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1341, CLIENT_NAMES, "Client names: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1342, ASM_INSTANCE_RUNNING_NODE, "ASM instance {0} is running on node {1}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1343, IOSERVER_INSTANCE_RUNNING_NODE, "ASM I/O server instance {0} running on node {1} is connected to ASM instance {2}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1344, INST_CONNECT_TO_ASM, "Instance {0} is connected to ASM instance {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1345, INST_CONNECT_TO_IOS, "Instance {0} is connected to ASM I/O server instance {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1346, INST_NOT_CONNECT_TO_ASM, "Instance {0} is not connected to an ASM instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1347, INST_NOT_CONNECT_TO_IOS, "Instance {0} is not connected to an ASM I/O server instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1348, INVALID_COUNT_FOR_PRE121DB, "failure to set the ASM cardinality to a number {0} other than ALL with configured pre-12.1 databases {1}"
//  *Cause: An attempt to set the ASM cardinality to the specified number was
//   rejected because the indicated databases were of versions older than 12.1.
//   These databases required the ASM cardinality to be set to ALL.
// *Action: Keep the ASM cardinality set to ALL until all of the databases are 
//   upgraded to release 12.1 or later. 
/
1349, PWFILE_BACKUP, "Backup of Password file: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1350, IOS_NOT_SUPPORTED_PLATFORM, "failure to add ASM I/O server on an unsupported operating system {0}"
//  *Cause: An attempt to add the ASM I/O server on the indicated operating 
//          system was rejected because it was not one of the supported 
//          platforms. The ASM I/O server is only supported on Linux and 
//          Solaris.
// *Action: Choose a server running one of the supported operating systems
//          on which to run the ASM I/O server. 
/
1351, RHP_CONFIG_TLSDISABLED, "Transport Level Security disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1352, SERV_MOD_I_OPT_MC_MISSED, "Missing option '-preferred' was required by supplying '-modifyconfig'."
//  *Cause: An attempt to modify the resource configuration was rejected because the option '-modifyconfig' was specified without '-preferred'.
//  *Action: Retry the command ensuring that the -preferred option is provided when the -modifyconfig option is specified.
/
1353, INVALID_VALUE_SERVER_SECURITY, "invalid value specified while modifying QoS management server resource for '-secure' option" 
//  *Cause: An attempt to modify a resource was rejected beacuse an invalid value
//   was specified for the '-secure' option.
// *Action: Retry the command operation, specifying either YES or NO for the 
//  '-secure' option.
/
1354, CPU_COUNT_INVALID, "Invalid 'cpucount' option value \"{0}\""
//  *Cause: The specified value for 'cpucount' was not valid. A valid 
//          'cpucount' is a nonnegative number.
// *Action: Retry the operation specifying a non-negative value for the 
//          'cpucount' option.
/
1355, RHPPLSNR_NOTHING_MODIFIED, "nothing to modify"
//  *Cause: An attempt to modify the RHP progress listener was rejected 
//          because no options were specified to the modify command.
// *Action: Retry specifying at least one option with the modify command.
/
1356, RHPPLSNR_ALREADY_RUNNING, "can't modify port of running RHP listener."
//   *Cause: A request to modify the port number of the Rapid Home Provisioning
//           progress listener was rejected because the RHP progress listener 
//           was already running, and the modification would require that it be 
//           stopped and restarted.
//  *Action: To modify the RHP progress listener while it is running,
//           specify the '-force' option to stop and restart the process.
/
1357, RHPPLSNR_DISABLED_ON_NODE, "Rapid Home Provisioning progress listener is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1358, RHPPLSNR_HOST, "Rapid Home Provisioning progress listener host: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1359, RHPPLSNR_PORT, "Rapid Home Provisioning progress listener port: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1360, INVALID_DHCPPROXY_NETWORK_TYPE, "invalid network server type \"{0}\""
//  *Cause: An attempt to add or modify the dhcpproxy resource was rejected 
//          because the specified network server type was invalid.
// *Action: Reissue the command specifying a network server type
//          of 'static' or 'dhcp'.
/
1361, NON_STATIC_NETWORK_TYPE_FOR_MAPPING, "non-static network server type for MAC-to-IP address mapping"
//  *Cause: An attempt to add or modify the dhcpproxy resource was rejected 
//          because 'static' was not specified for the network server type.
// *Action: Reissue the command specifying a network server type of 'static'.
/
1362, STATIC_NETWORK_TYPE_WITHOUT_MAPPING, "static network server type without MAC-to-IP address mapping"
//  *Cause: An attempt to add or modify the dhcpproxy resource was rejected 
//          because 'static' was specified for the network server type,
//          but no MAC-to-IP address mapping was provided.
// *Action: Reissue the command specifying a MAC-to-IP address mapping.
/
1363, INVALID_MAC_TO_IP_MAPPING, "invalid MAC-to-IP address mapping: \"{0}\""
//  *Cause: An attempt to add or modify the dhcpproxy resource was rejected
//          because the MAC-to-IP address mapping had invalid syntax, or
//          the IP address format was invalid.
// *Action: Retry the operation ensuring that the MAC address is separated
//          from the IP address and the IP address is in a valid format.
/
1364, INVALID_TFTPROOT_PATH, "invalid root directory for the DNSMASQ TFTP service: \"{0}\""
//  *Cause: An attempt to add or modify the TFTP resource was rejected because 
//          the format of the path for the root directory was invalid.
// *Action: Retry the operation specifying a valid root directory path.
/
1365, INVALID_TFTP_SERVER_IP, "Invalid TFTP server ip \"{0}\""
//  *Cause: An attempt to add or modify the TFTP resource was rejected because 
//          the specified IP address for the TFTP server was invalid.
// *Action: Retry the operation specifying a valid TFTP server IP address.
/  
1366, ACFSREMOTE_RUNNING, "Oracle ACFS acfsremote resource is running on nodes {0}."
//  *Document: No
//  *Cause:
// *Action:
/
1367, ACFSREMOTE_NOT_RUNNING, "Oracle ACFS acfsremote resource is not running."
//  *Document: No
//  *Cause:
// *Action:
/
1368, ACFSREMOTE_ENABLED_NODES, "Oracle ACFS acfsremote resource is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1369, ACFSREMOTE_DISABLED_NODES, "Oracle ACFS acfsremote resource is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1370, ACFSREMOTE_CFG_ENABLED, "Oracle ACFS acfsremote resource is enabled." 
//  *Document: No
//  *Cause:
// *Action:
/
1371, ACFSREMOTE_CFG_DISABLED, "Oracle ACFS acfsremote resource is disabled." 
//  *Document: No
//  *Cause:
// *Action:
/
1372, ACFSRM_RUNNING, "Oracle ACFS rolling migration resource is running on nodes {0}."
//  *Document: No
//  *Cause:
// *Action:
/
1373, ACFSRM_NOT_RUNNING, "Oracle ACFS rolling migration resource is not running."
//  *Document: No
//  *Cause:
// *Action:
/
1374, ACFSRM_ENABLED_NODES, "Oracle ACFS rolling migration resource is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1375, ACFSRM_DISABLED_NODES, "Oracle ACFS rolling migration resource is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
1376, ACFSRM_CFG_ENABLED, "Oracle ACFS rolling migration resource is enabled." 
//  *Document: No
//  *Cause:
// *Action:
/
1377, ACFSRM_CFG_DISABLED, "Oracle ACFS rolling migration resource is disabled." 
//  *Document: No
//  *Cause:
// *Action:
/
1378, SCAN_LISTENER_CLIENT_INVITED_ERROR, "The '-invitedsubnets' or  '-invitednodes' options are not allowed when the '-scanclient' option is specified."
// *Cause:  An attempt to set either invited subnets or invited nodes was
//          rejected because this operation is not supported for a SCAN
//          listener configured for a client cluster.
// *Action: Retry the operation, specifying only the '-scanclient' option.
/
1379, INVALID_CDPNUMBER_VALUE, "invalid 'cdpnumber' option value \"{0}\""
//  *Cause: An invalid value was specified for the command option 'cdpnumber'.
// *Action: Retry the operation, specifying a 'cdpnumber' option value that
//          identifies a registered Cross-Domain Protocol (CDP) resource.
/
1380, RESTART_DB_SERVERPOOL_NOT_SUPPORTED, "A 'srvctl add database' command specified the '-serverpool' option for an Oracle Restart fixed single-instance database"
// *Cause:  An attempt to add an Oracle Restart fixed single-instance database
//          was rejected because the '-serverpool' option was specified.
// *Action: Retry the operation, without specifying the '-serverpool' option.            
/
1381, RESTART_DBTYPE_NOT_SUPPORTED, "A 'srvctl add database' command specified the RAC database type for an Oracle Restart fixed single-instance database"
//  *Cause: An attempt to add an Oracle Restart fixed single-instance database
//          was rejected because the option '-dbtype RAC' was specified.
// *Action: Retry the operation either without the '-dbtype' option, or
//          specifying '-dbtype SINGLE'.
/
1382, INVALID_ENABLETLS_OPT, "The value \"{0}\" is invalid for the enableTLS command line option."
//  *Cause: An attempt to add or modify a Rapid Home Provisioning Server or 
//          Client was rejected because a value other than 'YES' or 'NO' was
//          supplied for the enableTLS command line option.
// *Action: Retry the command specifying either YES or NO for the enableTLS 
//          option.
/
1383, WALLET_PASSWORD_PROMPT, "Specify password for the protected wallet:"
// *Document: NO
//  *Cause:
// *Action:
/
1384, INVALID_WALLET_FILE, "invalid wallet file {0}"
//  *Cause: An attempt to import a wallet failed because the format of the 
//          file was incorrect.
// *Action: Retry the command supplying a password protected or an autologin
//          wallet.
/
1385, INVALID_CDPPROXY_VALUES, "invalid option value for 'client_type' \"{0}\" or 'client_name' \"{1}\""
//  *Cause: A requested operation failed because an invalid value was
//          specified as shown for either the client_type or client_name
//          with the result that no matching Cross-Domain Protocol proxy
//          was found.
// *Action: Retry the operation, specifying valid client_type and client_name 
//          values that identify a registered Cross-Domain Protocol (CDP)
//          proxy resource.
/
1390, CDP_PROXY_CONFIG, "CDP proxy: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1391, CDP_PROXY_REMOTE_START, "remote start: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1392, CDP_PROXY_CLIENT_RES, "client resource: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1393, NODEAPPS_EXCL_VIPLESS_ADDR, "Command line options '-vipless' and '-address' cannot be used together."
//  *Cause: Conflicting options were specified on a 'srvctl add nodeapps' 
//          command.
// *Action: Reissue the command with the correct options.
/
1394, CDP_PROXY_NOT_FOUND, "CDP proxy resource was not found."
//  *Cause: A requested Cross-Domain Protocol (CDP) operation failed because
//          the CDP proxy did not match either the client_type or client_name,
//          or the CDP proxy was not configured on the system.
// *Action: Retry the operation, specifying valid client_type and client_name 
//          values that identify a registered CDP proxy resource that is
//          configured on the system.
/
1395, INVALID_ENABLEHTTPS_OPT, "The value \"{0}\" is invalid for the enableHTTPS command line option."
//  *Cause: An attempt to add or modify a Rapid Home Provisioning Server or 
//          Client was rejected because a value other than 'YES' or 'NO' was
//          supplied for the enableHTTPS command line option.
// *Action: Retry the command specifying either YES or NO for the enableHTTPS 
//          option.
/
1396, RHP_CONFIG_HTTPSENABLED, "HTTP Secure is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1397, RHP_CONFIG_HTTPSDISABLED, "HTTP Secure is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1398, INVALID_VALUE_HTTPS, "invalid value specified while modifying QoS management server resource for '-enableHTTPS' option" 
//  *Cause: An attempt to modify the QoS management server resource was rejected 
//          because an invalid value was specified for the '-enableHTTPS' 
//          option.
// *Action: Retry the operation, specifying either YES or NO for the 
//          '-enableHTTPS' option.
/
1400, DHCPPROXY_CONFIG_NOT_EXISTS, "The DHCP proxy resource is not configured"
//  *Cause: The DHCP proxy resource was not configured on the cluster or an
//          unexpected error occurred while querying Clusterware for the DHCP
//          proxy resource. The accompanying messages provide detailed failure 
//          information.
// *Action: Ensure that the DHCP proxy resource is configured. The command
//          'srvctl add dhcpproxy' can be used to create a new DHCP proxy
//          resource. Examine the accompanying messages, resolve the indicated
//          problems, and then retry the operation.
/ 
1401, DHCPPROXY_CFG_ENABLED, "DHCP proxy is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1402, DHCPPROXY_ALREADY_DISABLED, "DHCP proxy is already disabled"
//  *Cause: An attempt to disable the DHCP proxy resource was rejected because
//          the resource was already disabled.
// *Action: None required.
/
1403, DHCPPROXY_ALREADY_ENABLED, "DHCP proxy is already enabled"
//  *Cause: An attempt to enable the DHCP proxy resource was rejected because
//          the resource was already enabled.
// *Action: None required.
/
1404, DHCPPROXY_RUNNING_NODE, "DHCP proxy is enabled and running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1405, DHCPPROXY_NOT_RUNNING, "DHCP proxy is enabled but is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1406, DHCPPROXY_STATUS_DISABLED, "DHCP proxy is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1407, DHCPPROXY_STILL_RUNNING, "DHCP proxy resource must be stopped before removing"
//  *Cause: The command 'srvctl remove dhcpproxy' was rejected because the DHCP
//          proxy instance was running.
// *Action: Stop the DHCP proxy resource using the command 'srvctl stop dhcpproxy',
//          and then retry the remove operation. 
/
1408, DHCPPROXY_ENABLED_NODES, "DHCP proxy is individually enabled on nodes: {0}" 
//  *Document: No 
//  *Cause: Status message
// *Action: Not an error
/
1409, DHCPPROXY_DISABLED_NODES, "DHCP proxy is individually disabled on nodes: {0}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1410, INVALID_PORT_RANGE, "Invalid port range: {0}"
//  *Cause: A port range was provided for the data transfers which had an
//          invalid format.
// *Action: Retry the operation, ensuring that the range contains both a lower
//          value and an upper value, the values are both integers, and the
//          lower value comes first.
/
1411, RHP_CONFIG_TLSENABLED, "Transport Level Security enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1412, RESET_RHPS_EXT_DB, "cannot clean RHP repository stored in external database"
//  *Cause: A request to clean the Rapid Home Provisioning (RHP) repository was
//          rejected because the repository was stored in an external database.
// *Action: Use 'srvctl remove rhpserver -resource' to remove only the resource.
//          To clear the repository, re-create the schema in the external
//          database.
/
1413, INVALID_OPT, "Specified option {0} is invalid."
//  *Cause: An attempt to execute a 'srvctl' command was rejected because the
//          indicated option was invalid.
// *Action: Reissue the command with valid options.
/
1414, FULL_VERSION, "srvctl full version: "
//*Document: No
//   *Cause: Status message
//  *Action: Not an error
/
1415, GH_TRANSFER_PORT_RANGE, "Transfer port range: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1416, INVALID_COUNT_IOSERVER_IN_ASMGROUP, "The ASM I/O server cardinality cannot be set to {0}, which is different from the cardinality of the ASM resource group."
//  *Cause: An attempt to set the cardinality of the ASM I/O server to the
//          indicated number was rejected because the ASM I/O server was a
//          resource in the ASM resource group, which had a different
//          cardinality.  
// *Action: Issue the command 'srvctl modify asm -count <count>' to modify 
//          the ASM resource group cardinality and the cardinalities of the 
//          resources in the group.
/
1417, IOSERVER_LISTENERS, "I/O Server listeners: {0}."
//   *Document: No
//  *Cause: I/O Server listener list
// *Action: Not an error
/
1418, RHP_NON_GI_HOME_COMMAND, "commands on object '{0}' are only allowed to be executed from the active Grid Infrastructure home"
//  *Cause: The specified command was not executed from a Grid Infrastructure 
//          home.
// *Action: Reexecute the command from a valid Grid Infrastructure home.
/
1419, UNSUPPORTED_LEAF_OPTION, "Option {0} is no longer supported."
//  *Cause: An attempt to execute a command using the specified option
//    was rejected because the specified option was not supported.
// *Action: Use a valid option.
/
1420, SERV_ADD_BAD_LENGTH_OPTS, "Service name {0} exceeds the maximum length of 64 characters."
//  *Cause: An attempt to add a service was rejected because the service name 
//          was longer than the maximum length of 64 characters.
// *Action: Reissue the command with a service name less than 64 characters.
/
_000, DEFINE_SERVERPOOL_LIST, "    -{0}     <serverpool_list>              Comma separated list of server pool names"
//  *Document: No
//  *Cause: Status message for -serverpools(g)
// *Action: Not an error
/
_001, DEFINE_FSTYPE, "    -{0}          {1}          File system type"
//  *Document: No
//  *Cause: Status message for -fstype
// *Action: Not an error
/
_002, DEFINE_FSOPTION_LIST, "    -{0}       <fs_options>                   Comma separated list of file system mount options"
//  *Document: No
//  *Cause: Status message for -fsoptions
// *Action: Not an error
/
_003, DEFINE_DESCRIPTION, "    -{0}     <description>                  File system description"
//  *Document: No
//  *Cause: Status message for -description
// *Action: Not an error
/
_004, DEFINE_APPLICATION_ID, "    -{0}           <application_id>               File system application/group ID"
//  *Document: No
//  *Cause: Status message for -appid
// *Action: Not an error
/
_005, DEFINE_AUTOSTART, "    -{0}       '{ALWAYS|NEVER|RESTORE}'         File system autostart policy"
//  *Document: No
//  *Cause: Status message for -autostart
// *Action: Not an error
/
_006, DEFINE_HELP, "    -{0}                                           Print usage"
//  *Document: No
//  *Cause: Status message for -help(h)
// *Action: Not an error
/
_007, DEFINE_NODE, "    -{0}            <node_name>                    Node name"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_008, DEFINE_VERBOSE, "    -{0}                                        Verbose output"
//  *Document: No
//  *Cause: Status message for -verbose(v)
// *Action: Not an error
/
_009, DEFINE_FORCE_REMOVE, "    -{0}                                          Force remove (ignore dependencies)"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_010, DEFINE_FORCE_STOP, "    -{0}                                          Force stop"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_011, DEFINE_FORCE_FLAG, "    -force                      This option stops and restarts the resource to effect a change."
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
/ UNUSED :Message _012 is no longer used.  Do not reuse MsgId
_012, DEFINE_RMI_PORT, ""
//  *Document: No
//  *Cause: ""
// *Action: ""
/
_013, DEFINE_STOP_ADMINHELP_ONLY, "    -adminhelper                Stop Administrator helper only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_014, DEFINE_ENABLE_ADMINHELP_ONLY, "    -adminhelper                Enable Administrator helper only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_015, DEFINE_DISABLE_ADMINHELP_ONLY, "    -adminhelper                Disable Administrator helper only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_016, DEFINE_PROXY, "    -{0} ADVM proxy"
//  *Document: No
//  *Cause: Status message for -proxy
// *Action: Not an error
/
_017, DEFINE_RIM, "    -{0}                       Leaf ASM resource"
//  *Document: No
//  *Cause: Status message for -leaf
// *Action: Not an error
/
_018, DEFINE_SUBNET_MGMTLSNR, "    -{0}  <subnet>[/if1[|if2...]] Private subnet specification for management listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_019, DEFINE_NODE_MODIFY_INSTANCE, "    -{0}       Node name. Can be set to \"\" only for a policy-managed database"
//  *Document: No
//  *Cause: Status message for -node option of 'srvctl modify instance'
// *Action: Not an error
/
_020, DEFINE_UPDATE_GNS_NAMETTL, "    -{0} <name_ttl>                Time to live for the name (in seconds)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_021, DEFINE_UPDATE_GNS_INSTANCE, "    -{0} <instance_name>                Instance name of service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_022, DEFINE_CATEGORY, "    -{0} \"<server_category>\"       Server category (or \"\" for empty category value)"
//  *Document: No
//  *Cause: Status message for -category <server_category>
// *Action: Not an error
/
_023, DEFINE_GNS_MODIFY_CLIENTDATA, "    -{0} <filename> Modifies the GNS client data with client data in the specified file."
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
_024, DEFINE_GLOBAL_OVERRIDE_REMOVE, "    -{0}         Override value to operate on a global service.Ignored for a non-global service"
//  *Document: No
//  *Cause: Status message for -global_override
// *Action: Not an error
/
_025, DEFINE_SVC_FORCE_MODIFY, "    -{0}                   Force the modify operation, stopping the service on some nodes as necessary"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_026, DEFINE_ADD_ASMLSNR, "    -{0}                               ASM listener type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
//Do not reuse _027
_027, DEFINE_ADD_RIMLSNR, ""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_028, DEFINE_ADD_SUBNET_LSNR, "    -{0} <subnet>            Subnet for ASM listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_029, DEFINE_IOSERV_SRCN, "    -{0} <current_node>        Node name to relocate IOServer from"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_030, DEFINE_IOSERV_TRGN, "    -{0} <target_node>         Node name to relocate IOServer to"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_031, DEFINE_ASM_SRCN, "    -{0} <current_node>        Node name to relocate Flex ASM instance from"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_032, DEFINE_ASM_TRGN, "    -{0} <target_node>         Node name to relocate Flex ASM instance to"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_033, DEFINE_SETENV_VIP, "    -{0}                 Set environment for VIP"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_034, DEFINE_SETENV_ONS, "    -{0}                 Set environment for ONS daemon"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_035, DEFINE_UNSETENV_VIP, "    -{0}                 Unset environment for VIP"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_036, DEFINE_UNSETENV_ONS, "    -{0}                 Unset environment for ONS daemon"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_037, DEFINE_START_CONCURRENCY, "    -{0} <start_concurrency>         Number of instances to be started simultaneously (or 0 for empty start_concurrency value)"
//  *Document: No
//  *Cause: Status message for -start_concurrency
// *Action: Not an error
/
_038, DEFINE_STOP_CONCURRENCY, "    -{0} <stop_concurrency>         Number of instances to be stopped simultaneously (or 0 for empty stop_concurrency value )"
//  *Document: No
//  *Cause: Status message for -stop_concurrency
// *Action: Not an error
/
_039, DEFINE_FORCE_MODIFY, "    -{0}                                          Force modification (ignore dependencies)"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_040, DEFINE_PQ_POOL, "    -{0} <pq_pool>   Parallel query server pool name"
//  *Document: No
//  *Cause: Status message for -pqpool
// *Action: Not an error
/
_041, DEFINE_COUNT_IOSERVER, "    -{0} <number_of_ioserver_instances>  The number of IO Server instances"
//  *Document: No
//  *Cause: Status message for -count of ioserver
// *Action: Not an error
/
_042, GNS_RECORD_TTL, "TTL: {0} Creation: {1} Expiration: {2}"
// *Document: NO
// *Cause:
// *Action:
/
_043, GNS_NAME_LEASE, "Lease: {0} Creation: {1} Expiration: {2}"
// *Document: NO
// *Cause:
// *Action:
/
_044, GNS_RECORD_UNIQUE, "Unique"
// *Document: NO
// *Cause:
// *Action:
/
_045, GNS_RECORD_FLAGS, "Flags: 0x{0}"
// *Document: NO
// *Cause:
// *Action:
/
_046, GNS_RECORD_SRV, "Target: {0} Protocol: {1} Port: {2} Weight: {3} Priority: {4}"
// *Document: NO
// *Cause:
// *Action:
/
_047, DEFINE_MODIFY_PQ_SERVICE, "    -{0} <pq_service>   Parallel query service name (or \"\" to remove parallel query service name)"
//  *Document: No
//  *Cause: Status message for -pqservice
// *Action: Not an error
/
_048, DEFINE_PQ, "    -pq      To perform the action on parallel query service"
//  *Document: No
//  *Cause: Status message for -pq
// *Action: Not an error
/
_049, DEFINE_CANONICAL_VOLUME_DEVICE, "    -{0} <canonical_volume_device>    Canonical volume device path"
//  *Document: No
//  *Cause: Status message for -device(d)
// *Action: Not an error
/
_057, DEFINE_HAVIP_DESCRIPTION, "    -{0} \"<text>\"          HAVIP description"
// *Document: No
// *Cause: Status message for -description
// *Action: Not an error
/
_070, DEFINE_LSNR_UPDATE_ASM, "    -asm                     ASM listener type"
//  *Document: No
//  *Cause: Status message for -asm
// *Action: Not an error
/
_071, DEFINE_LSNR_UPDATE_REMOVE, "    -remove                     Remove ASM listener only"
//  *Document: No
//  *Cause: Status message for -remove
// *Action: Not an error
/
_072, DEFINE_SESSION_NOREPLAY, "     -noreplay              Disable session replay during disconnection"
//  *Document: No
//  *Cause: Status message for -noreplay
// *Action: Not an error
/
_073, DEFINE_FSOPTION_LIST_WIN, "    -{0}       <fs_options>                   Not supported on windows"
//  *Document: No
//  *Cause: Status message for -fsoptions
// *Action: Not an error
/
_074, DB_CONFIG_ORACLE_HOME_ON_NODE, "  {0} on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_075, DEFINE_GHC_STORAGE, "    -storage <base_path>       A location which is available on every cluster node and is not necessarily shared. This location does not need to exist during adding of Rapid Home Provisioning Client. All images will be mounted on \"<base_path>/images\" for all local ACFS storage."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_076, DEFINE_GSM_FLAGS, "    -{0} <gsm_flags>       Set locality and region failover values"
//  *Document: No
//  *Cause: Status message 
// *Action: Not an error
/
_077, DEFINE_AUX_VOLUMES, "    -{0}    <volume_device>     Accelerator volume device"
//  *Document: No
//  *Cause: Status message for -acceleratorvols
// *Action: Not an error
/
_078, DEFINE_IOSERVER_COUNT, "    -{0} <number_of_ioserver_instances>  The number of ioserver instances"
//  *Document: No
//  *Cause: Status message for -count
// *Action: Not an error
/
_079, DEFINE_DETAIL_LSNR_INFO, "    -{0} Print detailed configuration information for Grid Infrastructure listeners"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
_080, DEFINE_STOPOPT_OMOTION, "    -{0} <stop_option> Override default shutdown option for running instance (only NORMAL allowed)"
//  *Document: No
//  *Cause: Status message 
// *Action: Not an error
/
_081, CHA_DB_MONITOR_WITH_CALIB, "Cluster database {0} on host {1} is monitored and is using a model calibrated on {2} with data from {3} to {4}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_082, CHA_DB_NOT_MONITOR_WITH_CALIB, "Cluster database {0} on host {1} is not monitored and is using a model calibrated on {2} with data from {3} to {4}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_083, CHA_HOST_MONITOR, "Host {0} is monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_084, CHA_DB_NOT_MONITOR, "Cluster database {0} on host {1} is not monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_085, CHA_DB_MONITOR, "Cluster database {0} on host {1} is monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_086, CHA_HOST_NOT_MONITOR, "Host {0} is not monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_087, CHA_HOST_MONITOR_WITH_CALIB, "Host {0} is monitored and is using a model calibrated on {1} with data from {2} to {3}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_088, DEFINE_MODIFY_USER, "    -{0} <user>|<user_list> Add (/+) or remove (/-) a single user, or replace the entire set of users (with a comma-separated list) authorized to mount and unmount the file system"
//  *Document: No
//  *Cause: Status message for -user(u).
// *Action: Not an error.
/
_089, DEFINE_ALL, "    -{0}                     All nodes"
//  *Document: No
//  *Cause: Status message for -all
// *Action: Not an error
/
_090, DEFINE_MODEL, "    -{0} <model>              Model name"
//  *Document: No
//  *Cause: Status message for -model
// *Action: Not an error
/
_091, CHA_CLUSTER_MONITOR, "The cluster is monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_092, CHA_CLUSTER_NOT_MONITOR, "The cluster is not monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_093, CHA_CLUSTER_HOST_MONITOR, "The cluster is monitored on hosts: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_094, CHA_CLUSTER_HOST_NOT_MONITOR, "The cluster is not monitored on hosts: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_095, CHA_CLUSTER_SERVER_POOL_MONITOR, "The cluster is monitored on server pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_096, CHA_CLUSTER_SERVER_POOL_NOT_MONITOR, "The cluster is not monitored on server pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_097, CHA_CLUSTER_DB_MONITOR, "The database {0} is monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_098, CHA_CLUSTER_DB_NOT_MONITOR, "The database {0} is not monitored."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_099, CHA_CLUSTER_DB_HOST_MONITOR, "Database {0} is monitored on hosts: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_100, CHA_CLUSTER_DB_HOST_NOT_MONITOR, "Database {0} is not monitored on hosts: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_101, CHA_DB_SRVPOOL_MONITOR, "Database {0} is monitored on server pools: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_102, CHA_DB_SRVPOOL_NOT_MONITOR, "Database {0} is not monitored on server pools: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_103, CHA_HOST_HAS_MODEL, "Host {0} has the model {1} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_104, CHA_HOST_USE_MODEL, "Host {0} is using the model {1} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_105, CHA_CLUSTER_SRVPOOL_USE_MODEL, "Cluster server pool {0} is using the model {1} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_106, CHA_CLUSTER_SRVPOOL_HAS_MODEL, "Cluster server pool {0} has the model {1} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_107, CHA_DB_HOST_USE_MODEL, "Database {0} on host {1} is using the model {2} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_108, CHA_DB_HOST_HAS_MODEL, "Database {0} on host {1} has model {2} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_109, CHA_DB_SRVPOOL_USE_MODEL, "Database {0} on server pool {1} is using model {2} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_110, CHA_DB_SRVPOOL_HAS_MODEL, "Database {0} on server pool {1} has model {2} with the following attributes:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_111, DEFINE_PROXY_CONF, "    -{0} Display ADVM proxy configuration information"
//  *Document: No
//  *Cause: Status message for -proxy
// *Action: Not an error
/
_112, DBNAME_NOT_RUNNING, "Database {0} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_113, INST_DB_RUN, "Instance {0} of database {1} is running on node {2}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_114, DBNAME_DISABLED, "Database {0} is disabled."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_115, SERV_DB_DISABLED, "Service {0} of database {1} is disabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_116, SERV_DB_NOT_RUN, "Service {0} of database {1} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_117, SERV_DB_RUN_NODES, "Service {0} of database {1} is running on nodes: {2}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_118, SERV_DB_RUN, "Service {0} of database {1} is running on instances {2}."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
_119, DB_NOT_RUNNING_SPOOL, "Database {0} is not running on serverpool {1}."
//  *Document: NO 
//  *Cause: Status message
// *Action: Not an error
/
_120, DEFINE_HTTP_PORT, "    -{0} <http_port>       HTTP port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_121, DEFINE_OVMM_USERNAME, "    -{0} <username>          User name of the manager. When this is specified, the command will prompt for the password."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_122, DEFINE_OVMM_WALLET, "    -{0} <wallet_path>          Path to the wallet containing a certificate"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_123, DEFINE_OVMM_OVMMHOST, "    -{0} <host_or_IP>          host name or IP address of the host to be designated as Oracle VM Manager"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_124, DEFINE_OVMM_OVMMPORT, "    -{0} <port>          Port used by Oracle VM Manager"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_125, OVMM_HOST, "Oracle VM Manager Host: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_126, OVMM_PORT, "Oracle VM Manager Port: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_127, OVMM_USERNAME, "Oracle VM Manager Username: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_128, DEFINE_SPOOL_SERVICE, "  -{0}     Starts or stops all the services of the database configured on this server pool"
//  *Document: No 
//  *Cause: Informational message
// *Action: Not an error
/
_129, SRV_DRAIN_TIMEOUT, "Drain timeout: {0} seconds"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_130, SRV_DRAIN_TIMEOUT_EMPTY, "Drain timeout: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_131, SRV_STOP_OPTION, "Stop option: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_132, DEFINE_WAIT, "   -{0} <wait_option>  Wait until the service draining is completed (e.g. YES or NO)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_133, DEFINE_TARGETINSTANCE, " -{0} <instance_name> The target ASM or IOServer instance (\"\" for default target instance)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_139, DEFINE_CCMB_FORCE_REMOVE, "    -{0}                                   Ignore resource dependencies while removing the Oracle ACFS Remote resources "
//  *Document: No
//  *Cause:
// *Action:
/
_140, DEFINE_CCMB_FORCE_STOP, "    -{0}                                    Ignore resource dependencies while stopping the Oracle ACFS Remote resources "
//  *Document: No
//  *Cause:
// *Action:
/
_141, DEFINE_CCMB_NODE_START, "    -{0}     <node_list>                          Comma-separated list of nodes on which the Oracle ACFS Remote resources will be started"
//  *Document: No
//  *Cause:
// *Action:
/
_142, DEFINE_CCMB_NODE_STOP, "    -{0}     <node_list>                          Comma-separated list of nodes on which the Oracle ACFS Remote resources will be stopped"
//  *Document: No
//  *Cause:
// *Action:
/
_143, DEFINE_CCMB_NODE_ENABLE, "    -{0}     <node_list>                          Comma-separated list of nodes on which the Oracle ACFS Remote resources will be enabled individually"
//  *Document: No
//  *Cause:
// *Action:
/
_144, DEFINE_CCMB_NODE_DISABLE, "    -{0}     <node_list>                          Comma-separated list of nodes on which the Oracle ACFS Remote resources will be disabled individually"
//  *Document: No
//  *Cause:
// *Action:
/
_145, DEFINE_OHOME_PATH, "  -{0}  <path>      Oracle home path"
//  *Document: No 
//  *Cause:
// *Action:
/
_146, DEFINE_OHOME_NAME, "  -{0}  <home_name>      Identifier for the Oracle home resource"
//  *Document: No 
//  *Cause:
// *Action:
/
_147, DEFINE_OHOME_TYPE, "  -{0}  '{ADMIN|POLICY}'      Type of the specified Oracle home. Default is POLICY."
//  *Document: No 
//  *Cause:
// *Action:
/
_148, DEFINE_OHOME_NODE, "  -{0}  <node_list>      Comma-separated list of nodes in which the Oracle home will be available"
//  *Document: No 
//  *Cause:
// *Action:
/
_149, DEFINE_OHOME_NODE_MODIFY, "  -{0}  <node_list>      Replace the existing node list in which the Oracle home is available with the specified comma-separated list of nodes."
//  *Document: No 
//  *Cause:
// *Action:
/
_150, DEFINE_OHOME_ADDNODE, "  -{0}  <node_name>      Add a node to the existing list nodes where the Oracle home is available."
//  *Document: No 
//  *Cause:
// *Action:
/
_151, DEFINE_OHOME_DELETENODE, "  -{0}  <node_name>      Remove a node from the existing list of nodes where the Oracle home is available"
//  *Document: No 
//  *Cause:
// *Action:
/
_152, DEFINE_OHOME_FORCE_REMOVE, "  -{0}          Ignore resource dependencies in the remove operation."
//  *Document: No 
//  *Cause:
// *Action:
/
_153, DEFINE_OHOME_FORCE_STOP, "  -{0}          Ignore resource dependencies in the stop operation."
//  *Document: No 
//  *Cause:
// *Action:
/
_154, DEFINE_OHOME_NODE_START, "  -{0}  <node_list>      Comma-separated list of nodes on which the Oracle home resource will be started"
//  *Document: No 
//  *Cause:
// *Action:
/
_155, DEFINE_OHOME_NODE_STOP, "  -{0}  <node_list>      Comma-separated list of nodes on which the Oracle home resource will be stopped"
//  *Document: No 
//  *Cause:
// *Action:
/
_156, DEFINE_OHOME_NODE_ENABLE, "  -{0}  <node_name>      Node on which the Oracle home resource will be enabled"
//  *Document: No 
//  *Cause:
// *Action:
/
_157, DEFINE_OHOME_NODE_DISABLE, "  -{0}  <node_name>      Node on which the Oracle home resource will be disabled"
//  *Document: No 
//  *Cause:
// *Action:
/
_158, DEFINE_VOLUME_DEVICE_LIST, "    -{0} <volume_device_list>  List of volume device paths"
//  *Document: No
//  *Cause: Status message for -device(d)
// *Action: Not an error
/
_159, DEFINE_IOS_INST, "    -{0} \"<inst,...>\"   Comma separated IOServer instance names"
//  *Document: No
//  *Cause: Status message for -instance
// *Action: Not an error
/
_160, DEFINE_DB_INST, "    -{0} \"<inst,...>\"   Comma separated database instance names"
//  *Document: No
//  *Cause: Status message for -instance
// *Action: Not an error
/
_161, DEFINE_ASM_TARGETINSTANCE, " -{0} <instance_name> The target ASM instance to connect to (\"\" for default target instance)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_162, DEFINE_VOLUME_NAME_LIST, "    -{0} <volume_name_list>  Comma-separated list of volume names"
//  *Document: No
//  *Cause: Status message for -volume(v)
// *Action: Not an error
/
_163, DEFINE_DISKGROUP_NAME_LIST, "    -{0} <dg_name_list>  Comma-separated list of disk group names"
//  *Document: No
//  *Cause: Status message for -diskgroup(g)
// *Action: Not an error
/
_164, DEFINE_GNS_CONFIG_ROLE, "    -{0}                       Display the role of the GNS instance"
// *Document: No
// *Cause:    Status message for -role
// *Action:   Not an error
/
_165, GNS_INSTANCE_ROLE, "GNS instance role: {0}"
// *Document: No
//  *Cause: Status message for -role
// *Action: Not an error
/
_166, MOUNT_OWNER, "Mount point owner: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_167, MOUNT_USER, "Mount users: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_168, DEFINE_EXPORT_GNS_VERSION, "    -{0}     <version>                  Version for which the client data will be generated"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_169, DEFINE_GNS_CONFIG_SERIAL_NUMBER, "    -{0}                       Display the GNS zone serial number"
// *Document: No
// *Cause:    Status message for -serialnumber
// *Action:   Not an error
/
_170, GNS_SERIAL_NUMBER, "GNS zone serial number: {0}"
// *Document: No
// *Cause: Status message for -serialnumber
// *Action: Not an error
/
_171, DEFINE_HAVIP_TRANSPORT, "    -{0}              Adds a transport VIP"
// *Document: No
// *Cause: Status message for -description
// *Action: Not an error
/
_172, SCAN_LSNR_CLIENT_CLUSTER, "Client cluster: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_173, MOUNT_GROUP, "Mount point group: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_174, DEFINE_PWFILEBACKUP, "    -pwfilebackup <backup_password_file_path> Backup password file path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_175, MOUNT_PERMS, "Mount permissions: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_176, DEFINE_RMI_PORT1, "     -port <rmi_port>            RMI port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_177, DEFINE_DEP_TYPE, "    -{0} {optional|mandatory} ASM network dependency type (default optional)"
//  *Document: No
//  *Cause:
// *Action:
/
_178, GNS_CLUSTER_NAME_GUID, "Cluster name: {0}, Cluster GUID: {1}"
// *Document: No
// *Cause: Status message for querycluster
// *Action: Not an error
/
_179, SCAN_LSNR_BY_NETNUM, "SCAN Listeners for network {0}:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_180, SCAN_LSNR_ENDPOINTS, "Endpoints: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_181, SCAN_LSNR_CONFIG, "SCAN Listener {0} exists"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__000, USAGE_ADD_MGMTDB, "Usage: srvctl add mgmtdb [-domain <domain_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__001, USAGE_MODIFY_MGMTDB, "Usage: srvctl modify mgmtdb [-pwfile <password_file_path>] [-spfile <server_parameter_file>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__002, USAGE_CONFIG_MGMTDB, "Usage: srvctl config mgmtdb [-verbose] [-all]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__003, USAGE_START_MGMTDB, "Usage: srvctl start mgmtdb [-startoption <start_option>] [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__004, USAGE_STOP_MGMTDB, "Usage: srvctl stop mgmtdb [-stopoption <stop_option>] [-force]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__005, USAGE_STATUS_MGMTDB, "Usage: srvctl status mgmtdb [-verbose]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__006, USAGE_ENABLE_MGMTDB, "Usage: srvctl enable mgmtdb [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__007, USAGE_DISABLE_MGMTDB, "Usage: srvctl disable mgmtdb [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__008, USAGE_SETENV_MGMTDB, "Usage: srvctl setenv mgmtdb {-envs \"<name>=<value>[,...]\" | -env \"<name=value>\"}"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__009, USAGE_GETENV_MGMTDB, "Usage: srvctl getenv mgmtdb [-envs \"<name>[,...]\"]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__010, USAGE_UNSETENV_MGMTDB, "Usage: srvctl unsetenv mgmtdb -envs \"<name>[,..]\""
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__011, USAGE_REMOVE_MGMTDB, "Usage: srvctl remove mgmtdb [-force] [-noprompt] [-verbose]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__012, USAGE_ADD_MGMTLSNR, "Usage: srvctl add mgmtlsnr [-endpoints \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]\"] [-skip]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__013, USAGE_MODIFY_MGMTLSNR, "Usage: srvctl modify mgmtlsnr -endpoints \"[TCP:]<port>[,...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]\""
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__014, USAGE_CONFIG_MGMTLSNR, "Usage: srvctl config mgmtlsnr [-all]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__015, USAGE_START_MGMTLSNR, "Usage: srvctl start mgmtlsnr [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__016, USAGE_STOP_MGMTLSNR, "Usage: srvctl stop mgmtlsnr [-node <node_name>] [-force]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__017, USAGE_STATUS_MGMTLSNR, "Usage: srvctl status mgmtlsnr [-verbose]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__019, USAGE_ENABLE_MGMTLSNR, "Usage: srvctl enable mgmtlsnr [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__020, USAGE_DISABLE_MGMTLSNR, "Usage: srvctl disable mgmtlsnr [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__021, USAGE_SETENV_MGMTLSNR, "Usage: srvctl setenv mgmtlsnr { -envs \"<name>=<val>[,...]\" | -env \"<name>=<value>\"}"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__022, USAGE_GETENV_MGMTLSNR, "Usage: srvctl getenv mgmtlsnr [ -envs \"<name>[,...]\"]" 
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__023, USAGE_UNSETENV_MGMTLSNR, "Usage: srvctl unsetenv mgmtlsnr -envs \"<name>[,...]\""
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__024, USAGE_REMOVE_MGMTLSNR, "Usage: srvctl remove mgmtlsnr [-force]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__025, ADD_MGMTDB_PURPOSE, "\nAdds a management database configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__026, CONFIG_MGMTDB_PURPOSE, "\nDisplays the configuration for the management database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__027, START_MGMTDB_PURPOSE, "\nStarts the management database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__028, STOP_MGMTDB_PURPOSE, "\nStops the management database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error 
/
__029, STATUS_MGMTDB_PURPOSE, "\nDisplays the current state of the management database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__030, ENABLE_MGMTDB_PURPOSE, "\nEnables the management database for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__031, DISABLE_MGMTDB_PURPOSE, "\nDisables the management database for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__032, MODIFY_MGMTDB_PURPOSE, "\nModifies the configuration for the management database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__033, REMOVE_MGMTDB_PURPOSE, "\nRemoves the management database from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__034, GETENV_MGMTDB_PURPOSE, "\nGets the management database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__035, SETENV_MGMTDB_PURPOSE, "\nSets the management database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__036, UNSETENV_MGMTDB_PURPOSE, "\nUnsets the management database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__037, ADD_MGMTLSNR_PURPOSE, "\nAdds a management listener configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__038, CONFIG_MGMTLSNR_PURPOSE, "\nDisplays the configuration for the management listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__039, START_MGMTLSNR_PURPOSE, "\nStarts the management listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__040, STOP_MGMTLSNR_PURPOSE, "\nStops the management listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__041, ENABLE_MGMTLSNR_PURPOSE, "\nEnables the management listener for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__042, DISABLE_MGMTLSNR_PURPOSE, "\nDisables the management listener for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__043, MODIFY_MGMTLSNR_PURPOSE, "\nModifies the configuration for the management listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__044, REMOVE_MGMTLSNR_PURPOSE, "\nRemoves the management listener from Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__047, GETENV_MGMTLSNR_PURPOSE, "\nGets the management listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__048, SETENV_MGMTLSNR_PURPOSE, "\nSets the management listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__049, UNSETENV_MGMTLSNR_PURPOSE, "\nUnsets the management listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__050, STATUS_MGMTLSNR_PURPOSE, "\nDisplays the current state of the management listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__051, RELOCATE_MGMTDB_PURPOSE, "\nRelocates the management database instance from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__052, USAGE_RELOCATE_MGMTDB, "Usage: srvctl relocate mgmtdb [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__053, USAGE_RELOCATE_IOSERVER, "Usage: srvctl relocate ioserver -currentnode <current_node> [-targetnode <target_node>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__054, RELOCATE_IOSERVER_PURPOSE, "\nRelocate the IOServer instance from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__055, USAGE_RELOCATE_ASM, "Usage: srvctl relocate asm -currentnode <current_node> [-targetnode <target_node>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__056, RELOCATE_ASM_PURPOSE, "\nRelocate the Flex ASM instance from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/

__058, USAGE_BACKWARD_COMPATABILITY_CONFIG, "Usage (for backward compatibility): srvctl config"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__059, USAGE_BACKWARD_COMPATABILITY_CONFIG_DB, "Usage (for backward compatibility): srvctl config -p <dbname> -n <node>"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__060, USAGE_BACKWARD_COMPATABILITY_CONFIG_VERSION, "Usage (for backward compatibility): srvctl config -V"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__061, USAGE_ADD_NODEAPPS, "Usage: srvctl add nodeapps { { -node <node_name> -address {<vip_name>|<ip>}/<netmask>[/if1[|if2...]] [-skip]} | { -subnet <subnet>/<netmask>[/if1[|if2...]] } } [-emport <em_port>] [-onslocalport <ons_local_port>]  [-onsremoteport <ons_remote_port>] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-clientdata <file> [-scanclient]] [-pingtarget \"<pingtarget_list>\"] [-vipless] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__062, USAGE_MODIFY_NODEAPPS, "Usage: srvctl modify nodeapps {[-node <node_name> -address {<vip_name>|<ip>}/<netmask>[/if1[|if2...]] [-skip]] | [-subnet <subnet>/<netmask>[/if1[|if2|...]]]} [-nettype {STATIC|DHCP|AUTOCONFIG|MIXED}] [-emport <em_port>] [ -onslocalport <ons_local_port> ] [-onsremoteport <ons_remote_port> ] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-clientdata <file>] [-pingtarget \"<pingtarget_list>\"] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__063, USAGE_ADD_VIP, "Usage: srvctl add vip -node <node_name> -netnum <network_number> -address {<name>|<ip>}/<netmask>[/if1[|if2...]] [-skip] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__064, USAGE_MODIFY_VIP, "Usage: srvctl modify vip -node <node_name> -address {<name>|<ip>}/<netmask>[/if1[|if2...]] [-netnum <network_number>] [-skip] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__065, USAGE_MODIFY_GNS, "Usage: srvctl modify gns {-loglevel <log_level> | [-resolve <name>] [-verify <name>] [-parameter <name>:<value>[,<name>:<value>...]] [-vip {<vip_name> | <ip>} [-skip]] [-clientdata <filename>] [-role {PRIMARY} [-force]] [-verbose]}"
// *Document: NO
//  *Cause: 
// *Action: 
/
__066, USAGE_ADD_GNS, "Usage: srvctl add gns {-vip {<vip_name> | <ip>} [-skip] [-domain <domain>] [-clientdata <filename>] [-verbose] | -clientdata <filename>}"
// *Document: NO
//  *Cause:
// *Action:
/
__067, USAGE_ADD_HAVIP, "Usage: srvctl add havip -id <id> -address {<ip>|<name>} [-netnum <network_number>] [-description <text>] [-skip] [-homenode <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__068, USAGE_MODIFY_HAVIP, "Usage: srvctl modify havip -id <id> [-address {<name>|<ip>} [-netnum <network_number>] [-skip]] [-description <text>] [-homenode <node_name>]" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__069, USAGE_SI_UPDATE_LISTENER, "Usage: srvctl update listener"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__074, USAGE_ENABLE_CHA, "Usage: srvctl enable cha [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__075, USAGE_DISABLE_CHA, "Usage: srvctl disable cha [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__076, USAGE_ADD_CHA, "Usage: srvctl add cha"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__077, USAGE_START_CHA, "Usage: srvctl start cha [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__078, USAGE_STOP_CHA, "Usage: srvctl stop cha [-node <node_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__079, USAGE_CONFIG_CHA, "Usage: srvctl config cha"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__080, USAGE_REMOVE_CHA, "Usage: srvctl remove cha [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__081, USAGE_SETENV_CHA, "Usage: srvctl setenv cha -envs \"<name>=<val>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__082, USAGE_UNSETENV_CHA, "Usage: srvctl unsetenv cha -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__083, USAGE_GETENV_CHA, "Usage: srvctl getenv cha [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__084, USAGE_STATUS_CHA, "Usage: srvctl status cha [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__085, ENABLE_CHA_PURPOSE, "\nEnables Oracle Cluster Health Analysis Service for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__086, DISABLE_CHA_PURPOSE, "\nDisables Oracle Cluster Health Analysis Service for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__087, ADD_CHA_PURPOSE, "\nAdds an Oracle Cluster Health Analysis Service configuration to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__088, START_CHA_PURPOSE, "\nStarts Oracle Cluster Health Analysis Service.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__089, STOP_CHA_PURPOSE, "\nStops Oracle Cluster Health Analysis Service.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__090, CONFIG_CHA_PURPOSE, "\nDisplays the configuration for Oracle Cluster Health Analysis Service.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__091, REMOVE_CHA_PURPOSE, "\nRemoves Oracle Cluster Health Analysis Service from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__092, SETENV_CHA_PURPOSE, "\nSets environment variables for Oracle Cluster Health Analysis Service.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__093, UNSETENV_CHA_PURPOSE, "\nUnsets environment variables for Oracle Cluster Health Analysis Service.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__094, GETENV_CHA_PURPOSE, "\nGets environment variables for Oracle Cluster Health Analysis Service.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__095, STATUS_CHA_PURPOSE, "\nDisplays the running status of Oracle Cluster Health Analysis Service on Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__096, USAGE_MONITOR_DB, "Usage: srvctl monitor database -db <db_unique_name> [-node <node_name>|-serverpool <pool_name>] [-model <model_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__097, USAGE_UNMONITOR_DB, "Usage: srvctl unmonitor database -db <db_unique_name> [-node <node_name>|-serverpool <pool_name>]" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__098, USAGE_MONITOR_HOST, "Usage: srvctl monitor host {-node <node_name>|-all|-serverpool <pool_name>} [-model <model_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__099, USAGE_UNMONITOR_HOST, "Usage: srvctl unmonitor host {-node <node_name>|-all|-serverpool <pool_name>}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__100, MONITOR_DB_PURPOSE, "\nStarts Oracle Cluster Health Analysis Service monitoring for a database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__101, UNMONITOR_DB_PURPOSE, "\nStops Oracle Cluster Health Analysis Service monitoring for a database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__102, MONITOR_HOST_PURPOSE, "\nStarts Oracle Cluster Health Analysis Service monitoring for the host OS.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__103, UNMONITOR_HOST_PURPOSE, "\nStops Oracle Cluster Health Analysis Service monitoring for the host OS.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__104, VERB_MONITOR_DESCRIPTION, "\nThe SRVCTL monitor command starts Oracle Cluster Health Analysis Service monitoring of the specified object.\n" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__105, VERB_UNMONITOR_DESCRIPTION, "\nThe SRVCTL unmonitor command stops Oracle Cluster Health Analysis Service monitoring of the specified object.\n" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__106, USAGE_RELOCATE_FS, "Usage: srvctl relocate filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>} [-node <node_name>] [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__107, RELOCATE_FS_PURPOSE, "\nRelocate a node local file system instance from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__108, SYSDBA, "OSDBA group: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__109, SYSOPER, "OSOPER group: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__110, DEFINE_NODE_STAT_CHA, "    -{0} <node_name>              Node name for which to show running status"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
__111, DEFINE_SERV_POOL_STAT_CHA, "    -{0} <pool_name>        Server pool name for which to show monitoring target status"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__112, ADMIN_DB_NODES, "Configured nodes: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__113, DEFINE_ADD_DBROLE, "    -{0} <role>                   Role of the database (PRIMARY, PHYSICAL_STANDBY, LOGICAL_STANDBY, SNAPSHOT_STANDBY, FAR_SYNC)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__114, DB_RUNNING_STAT, "Database {0} is running. Instance status: {1}."
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
__115, DB_NAME_RUNNING, "Database {0} is running."
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
__116, DB_RUN_WITH_SERV_STAT, "Database {0} is running with online services {1}. Instance status: {2}."
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
__117, UPDATE_INSTANCE_PURPOSE, "\nChange the open mode or the target instance of the database instances.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__118, USAGE_UPDATE_INSTANCE, "Usage: srvctl update instance -db <db_unique_name> [-instance \"<instance_name_list>\" | -node \"<node_list>\"] [-startoption <start_options>] [-targetinstance <instance_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__119, UPDATE_SI_DATABASE_PURPOSE, "\nChange the open mode of the database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__120, USAGE_SI_UPDATE_DATABASE, "Usage: srvctl update database -db <db_unique_name> -startoption <start_options>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__121, UPDATE_MGMTDB_PURPOSE, "\nChange the open mode of the management database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__122, USAGE_UPDATE_MGMTDB, "Usage: srvctl update mgmtdb -startoption <start_options>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__123, DEFINE_SRVPOOL_NAME, "    -{0} <pool_name>        Display information on nodes within server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__124, USAGE_SI_CONFIG_SERV, "Usage: srvctl config service -db <db_unique_name> [-service <service_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__125, USAGE_SI_STAT_SERV, "Usage: srvctl status service -db <db_unique_name> [-service  \"<service_name_list>\" | -pdb <pluggable_database>] [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__126, DEFINE_THISVERSION_STAT, "    -{0}                   Display status of databases that are of the same Oracle product version as 'srvctl.'"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__127, STAT_DB_VERSION, "Status of databases of version {0}:\n"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__128, DEFINE_THISHOME_STAT, "    -{0}                      Display status of databases that are configured in this Oracle Home."
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__129, DEFINE_FAILOVER_STOP_INST, "    -{0}                      Allow the running services to fail over to another instance"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__130, PDBNAME, "PDB name: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__131, PDBSVC, "PDB service: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__132, DEFINE_ONLYREPOS, "    -{0}                      Reset the Rapid Home Provisioning repository"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__133, USAGE_ADD_VM, "Usage: srvctl add vm -name <unique_name> -vm \"<vm_list>\" [-serverpool <pool_name> | -category <server_category> | -node \"<node_list>\"] [-stoptimeout <timeout>] [-checkinterval <interval>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__134, USAGE_CONFIG_VM, "Usage: srvctl config vm [-name <unique_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__135, USAGE_DISABLE_VM, "Usage: srvctl disable vm -name <unique_name> [-vm <name_or_id> | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__136, USAGE_ENABLE_VM, "Usage: srvctl enable vm -name <unique_name> [-vm <name_or_id> | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__137, USAGE_MODIFY_VM, "Usage: srvctl modify vm -name <unique_name> [-addvm \"<vm_list>\" | -removevm \"<vm_list>\"] [-serverpool <server_pool> | -category <server_category> | -node \"<node_list>\"] [-stoptimeout <timeout>] [-checkinterval <interval>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__138, USAGE_RELOCATE_VM, "Usage: srvctl relocate vm -name <unique_name> {-vm <name_or_id> | -srcnode <source_node>} -node <destination_node>"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__139, USAGE_REMOVE_VM, "Usage: srvctl remove vm -name <unique_name> [-force]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__140, USAGE_START_VM, "Usage: srvctl start vm -name <unique_name> [-vm <name_or_id> -node <node_name> | -vm <name_or_id> | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__141, USAGE_STOP_VM, "Usage: srvctl stop vm -name <unique_name> [-vm <name_or_id> | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__142, USAGE_STATUS_VM, "Usage: srvctl status vm -name <unique_name> [-vm <name_or_id> | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__143, ADD_VM_PURPOSE, "\nAdds a resource for Oracle Virtual Machines to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__144, CONFIG_VM_PURPOSE, "\nDisplays the configuration for the Oracle Virtual Machine resource.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__145, DISABLE_VM_PURPOSE, "\nDisables the Oracle Virtual Machine resource for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__146, ENABLE_VM_PURPOSE, "\nEnables the Oracle Virtual Machine resource for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__147, MODIFY_VM_PURPOSE, "\nModifies the resource for Oracle Virtual Machines in Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__148, RELOCATE_VM_PURPOSE, "\nRelocates the Oracle Virtual Machine in Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__149, REMOVE_VM_PURPOSE, "\nRemoves the Oracle Virtual Machine resource from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__150, START_VM_PURPOSE, "\nStarts the Oracle Virtual Machine resource.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__151, STOP_VM_PURPOSE, "\nStops the Oracle Virtual Machine resource.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__152, STATUS_VM_PURPOSE, "\nDisplays the status of the Oracle Virtual Machine resource.\n"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__153, DEFINE_VM_NAME, "    -{0} <unique_name>            Unique name for the Oracle Virtual Machine resource"
//  *Document: No
//  *Cause: Status message for -name
// *Action: Not an error
/
__154, DEFINE_VM, "    -{0} <name_or_id>               VM name or GUID of the virtual machine"
//  *Document: No
//  *Cause: Status message for -vm
// *Action: Not an error
/
__155, DEFINE_VM_LIST, "    -{0} \"<vm_list>\"                Comma-separated list of VM names or GUIDs of virtual machines"
//  *Document: No
//  *Cause: Status message for -vm
// *Action: Not an error
/
__156, DEFINE_ADDVM_LIST, "    -{0} \"<vm_list>\"             Comma-separated list of VM names or GUIDs of virtual machines to be added"
//  *Document: No
//  *Cause: Status message for -addvm
// *Action: Not an error
/
__157, DEFINE_REMOVEVM_LIST, "    -{0} \"<vm_list>\"          Comma-separated list of VM names or GUIDs of virtual machines to be removed"
//  *Document: No
//  *Cause: Status message for -removevm
// *Action: Not an error
/
__158, DEFINE_SRC_NODE, "    -{0} <source_node>         Source node name"
//  *Document: No
//  *Cause: Status message for -srcnode(n)
// *Action: Not an error
/
__159, DEFINE_VM_CHECK_INTERVAL, "    -{0} <interval>      Interval between checks in seconds"
//  *Document: No
//  *Cause: Status message for -checkinterval
// *Action: Not an error
/
__160, DEFINE_VM_STOP_TIMEOUT, "    -{0} <timeout>         Stop timeout in seconds"
//  *Document: No
//  *Cause: Status message for -stoptimeout
// *Action: Not an error
/
__161, DEFINE_NODE_LIST, "    -{0} \"<node_list>\"            Comma-separated list of node names"
//  *Document: No
//  *Cause: Status message for -node
// *Action: Not an error
/
__162, STATUS_VM_RUNNING_ON_NODE, "Virtual machine \"{0}\" of VM resource \"{1}\" is running on node {2}."
//  *Document: No
//  *Cause: Status message for "srvctl status vm ..."
//  *Action: Not an error
/
__163, STATUS_VM_RES_NOT_RUNNING_ON_NODE, "VM resource \"{0}\" is not running on node {1}."
//  *Document: No
//  *Cause: Status message for "srvctl status vm ..."
//  *Action: Not an error
/
__164, STATUS_VM_NOT_RUNNING, "Virtual machine \"{0}\" of VM resource \"{1}\" is not running."
//  *Document: No
//  *Cause: Status message for "srvctl status vm ..."
//  *Action: Not an error
/
__165, STATUS_VM, "virtual machine status"
//  *Document: No
//  *Cause: Not being used
//  *Action: Not being used
/
__166, VM_RESOURCE_NAME, "VM resource name: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__167, CONFIG_VM_LIST, "Configured virtual machines: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__168, OVMM_VM_ID_LIST, "VM IDs: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__169, OVMM_VM_NAME_LIST, "VM names: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__170, VM_SERVERPOOL, "Server pool: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/ 
__171, VM_SERVERCATEGORY, "Server category: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__172, VM_NODE, "Nodes: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__173, VM_STOP_TIMEOUT, "Stop timeout: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__174, VM_CHECK_INTERVAL, "Check interval: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__175, VM_RESOURCE_ENABLED, "VM resource \"{0}\" is enabled."
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__176, VM_RESOURCE_DISABLED, "VM resource \"{0}\" is disabled."
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__177, VM_ENABLED_NODES, "VM resource is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__178, VM_DISABLED_NODES, "VM resource is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__179, VM_DISABLED_VMS, "VM resource is individually disabled for virtual machines: {0}"
//  *Document: No
//  *Cause: Status message for "srvctl config vm ..."
//  *Action: Not an error
/
__180, USAGE_ADD_OVMM, "Usage: srvctl add ovmm -username <username> -wallet <wallet_path> -ovmmhost <host_or_IP> -ovmmport <port>"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__181, USAGE_MODIFY_OVMM, "Usage: srvctl modify ovmm [-username <username>] [-wallet <wallet_path>] [-ovmmhost <host_or_IP>] [-ovmmport <port>]"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__182, USAGE_CONFIG_OVMM, "Usage: srvctl config ovmm"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__183, USAGE_REMOVE_OVMM, "Usage: srvctl remove ovmm"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__184, ADD_OVMM_PURPOSE, "\nAdds Oracle VM Manager configuration.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__185, MODIFY_OVMM_PURPOSE, "\nModifies Oracle VM Manager configuration.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__186, CONFIG_OVMM_PURPOSE, "\nDisplays Oracle VM Manager configuration information.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__187, REMOVE_OVMM_PURPOSE, "\nRemoves Oracle VM Manager configuration.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__188, DEFINE_DEST_NODE, "    -{0} <destination_node>       Destination node name"
//  *Document: No
//  *Cause: Status message for -node for relocate vm
// *Action: Not an error
/
__189, USAGE_DISABLE_VM_NEW, "Usage: srvctl disable vm -name <unique_name> [-vm \"<vm_list>\" | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__190, USAGE_ENABLE_VM_NEW, "Usage: srvctl enable vm -name <unique_name> [-vm \"<vm_list>\" | -node <node_name>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__191, USAGE_MODIFY_VM_NEW, "Usage: srvctl modify vm -name <unique_name> [-addvm \"<vm_list>\"] [-removevm \"<vm_list>\"] [-serverpool <pool_name> | -category <server_category> | -node \"<node_list>\"] [-stoptimeout <timeout>] [-checkinterval <interval>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__192, USAGE_RELOCATE_VM_NEW, "Usage: srvctl relocate vm -name <unique_name> {-vm <name_or_id> | -srcnode <source_node>} [-node <destination_node>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__193, DEFINE_HOME4CONFIGDB, "    -{0}                          Prints Oracle Home and version along with the unique name of all configured databases on the cluster"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__194, DEFINE_HOME4STATUSDB, "    -{0}                          Displays Oracle home of specified database"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__195, DEFINE_SID, "    -{0}                           Displays the SID of the Oracle instance running on this node"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__196, DEFINE_DRAIN_TIMEOUT, "    -{0} <drain_timeout> Service drain timeout specified in seconds"
//  *Document: No
//  *Cause: Status message for -drain_timeout
//  *Action: Not an error
/
__197, DEFINE_STOP_OPTIONS_SERV, "    -{0} <stop_options>     Options to stop service (e.g. TRANSACTIONAL or IMMEDIATE)"
//  *Document: No
//  *Cause: Status message for -stopoption(o)
// *Action: Not an error
/
__198, DEFINE_EMAIL_ADDRESS, "    -email <email_address>       Email address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__199, DEFINE_MAIL_SERVER_ADDRESS, "    -mailserver <mail_server_address>       Mail server address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__200, DEFINE_MAIL_SERVER_PORT, "    -mailserverport <mail_server_port>       Mail server port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__201, UPDATE_IOSERVER_PURPOSE, "\nChange the target ASM instance that the IOServer instances connect to.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__202, USAGE_UPDATE_IOSERVER, "Usage: srvctl update ioserver [-instance \"<instance_name_list>\" | -node \"<node_list>\"] [-targetinstance <instance_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__217, ADD_CCMB_PURPOSE, "\nAdd Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__218, USAGE_ADD_CCMB, "Usage: srvctl add acfsrapps"
//  *Document: No
//  *Cause:
//  *Action:
/
__219, CONFIG_CCMB_PURPOSE, "\nDisplay the configuration of Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__220, USAGE_CONFIG_CCMB, "Usage: srvctl config acfsrapps"
//  *Document: No
//  *Cause:
//  *Action:
/
__221, REMOVE_CCMB_PURPOSE, "\nRemove the configuration for Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__222, USAGE_REMOVE_CCMB, "Usage: srvctl remove acfsrapps [-force]"
//  *Document: No
//  *Cause:
//  *Action:
/
__223, START_CCMB_PURPOSE, "\nStart Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__224, USAGE_START_CCMB, "Usage: srvctl start acfsrapps [-node <node_list>]"
//  *Document: No
//  *Cause:
//  *Action:
/
__225, STOP_CCMB_PURPOSE, "\nStop Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__226, USAGE_STOP_CCMB, "Usage: srvctl stop acfsrapps [-node <node_list>] [-force]"
//  *Document: No
//  *Cause:
//  *Action:
/
__227, STATUS_CCMB_PURPOSE, "\nDisplay the current state of the Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__228, USAGE_STATUS_CCMB, "Usage: srvctl status acfsrapps"
//  *Document: No
//  *Cause:
//  *Action:
/
__229, ENABLE_CCMB_PURPOSE, "\nEnable Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__230, USAGE_ENABLE_CCMB, "Usage: srvctl enable acfsrapps [-node <node_list>]"
//  *Document: No
//  *Cause:
//  *Action:
/
__231, DISABLE_CCMB_PURPOSE, "\nDisable Oracle ACFS Remote resources.\n"
// *Document: No
// *Cause:
// *Action:
/
__232, USAGE_DISABLE_CCMB, "Usage: srvctl disable acfsrapps [-node <node_list>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__233, DEFINE_CLIENTCLUSTER, "    -{0}        Option to specify that the environment is a client cluster"
//  *Document: No
//  *Cause:
// *Action:
/
/
__234, ONS_STARTED, "Successfully started ONS daemon."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__235, DEFINE_QOSMSERVER_PORT, "    -{0} <qosmserver_rmi_port>       QoS Management Server RMI port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__236, ENABLE_QOSMSERVER_PURPOSE, "\nEnable the QoS Management Server for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__237, DISABLE_QOSMSERVER_PURPOSE, "\nDisable the QoS Management Server from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__238, START_QOSMSERVER_PURPOSE, "\nStarts the QoS Management Server on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__239, STOP_QOSMSERVER_PURPOSE, "\nStop the QoS Management Server in running or starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__240, RELOCATE_QOSMSERVER_PURPOSE, "\nTemporarily relocate the QoS Management Server from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__241, STATUS_QOSMSERVER_PURPOSE, "\nDisplays the current state of the QoS Management Server.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__242, ADD_QOSMSERVER_PURPOSE, "\nAdds QoS Management Server to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__243, REMOVE_QOSMSERVER_PURPOSE, "\nRemoves the QoS Management Server configured for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__244, MODIFY_QOSMSERVER_PURPOSE, "\nModifies the configuration of RMI port for the QoS Management Server.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__245, CONFIG_QOSMSERVER_PURPOSE, "\nDisplays configuration information for the QoS Management Server.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__246, PREDICT_QOSMSERVER_PURPOSE, "\nPredicts the consequences of QoS Management Server failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__247, USAGE_CONFIG_QOSMSERVER, "Usage: srvctl config qosmserver"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__248, USAGE_START_QOSMSERVER, "Usage: srvctl start qosmserver [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__249, USAGE_STOP_QOSMSERVER, "Usage: srvctl stop qosmserver [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__250, USAGE_STAT_QOSMSERVER, "Usage: srvctl status qosmserver [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__251, USAGE_ADD_QOSMSERVER, "Usage: srvctl add qosmserver [-secure '{YES|NO}'] [-enableHTTPS '{YES|NO}'] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__252, USAGE_REMOVE_QOSMSERVER, "Usage: srvctl remove qosmserver [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__253, USAGE_ENABLE_QOSMSERVER, "Usage: srvctl enable qosmserver [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__254, USAGE_DISABLE_QOSMSERVER, "Usage: srvctl disable qosmserver [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__255, USAGE_MODIFY_QOSMSERVER, "Usage: srvctl modify qosmserver [-rmiport <qosmserver_rmi_port>] [-httpport <qosmserver_http_port>] [-secure '{YES|NO}'] [-enableHTTPS '{YES|NO}'] [-verbose] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__256, USAGE_RELOCATE_QOSMSERVER, "Usage: srvctl relocate qosmserver [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__257, USAGE_PREDICT_QOSMSERVER, "Usage: srvctl predict qosmserver [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__258, USAGE_ADD_OHOME, "Usage: srvctl add oraclehome -name <home_name> -path <path> [-type {ADMIN|POLICY}] [-node <node_list>]"
//  *Document: No
//  *Cause:
// *Action:
/
__259, ADD_OHOME_PURPOSE, "\nAdds the Oracle home resource to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__260, USAGE_MODIFY_OHOME, "Usage: srvctl modify oraclehome -name <home_name> [-path <path>] [-type {ADMIN|POLICY}] [-node <node_list> | [-addnode <node_name>] [-deletenode <node_name>]]"
//  *Document: No
//  *Cause:
// *Action:
/
__261, MODIFY_OHOME_PURPOSE, "\nModifies the configuration of the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__262, USAGE_REMOVE_OHOME, "Usage: srvctl remove oraclehome -name <home_name> [-force]"
//  *Document: No
//  *Cause:
// *Action:
/
__263, REMOVE_OHOME_PURPOSE, "\nRemoves the Oracle home resource from the Oracle Clusterware.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__264, USAGE_CONFIG_OHOME, "Usage: srvctl config oraclehome [-name <home_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__265, CONFIG_OHOME_PURPOSE, "\nDisplays the configuration of the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__266, USAGE_START_OHOME, "Usage: srvctl start oraclehome -name <home_name> [-node <node_list>]"
//  *Document: No
//  *Cause:
// *Action:
/
__267, START_OHOME_PURPOSE, "\nStarts the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__268, USAGE_STOP_OHOME, "Usage: srvctl stop oraclehome -name <home_name> [-node <node_list>] [-force]"
//  *Document: No
//  *Cause:
// *Action:
/
__269, STOP_OHOME_PURPOSE, "\nStops the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__270, USAGE_STATUS_OHOME, "Usage: srvctl status oraclehome -name <home_name>"
//  *Document: No
//  *Cause:
// *Action:
/
__271, STATUS_OHOME_PURPOSE, "\nDisplays the current state of the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__272, USAGE_ENABLE_OHOME, "Usage: srvctl enable oraclehome -name <home_name> [-node <node_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__273, ENABLE_OHOME_PURPOSE, "\nEnables the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__274, USAGE_DISABLE_OHOME, "Usage: srvctl disable oraclehome -name <home_name> [-node <node_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__275, DISABLE_OHOME_PURPOSE, "\nDisables the Oracle home resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__276, OHOME_RUNNING_NODE, "Oracle home {0} is available on nodes: {1}."
//  *Document: No
//  *Cause:
// *Action:
/
__277, OHOME_NOT_RUNNING, "Oracle home {0} is not available."
//  *Document: No
//  *Cause:
// *Action:
/
__278, OHOME_STATUS_ENABLED, "Oracle home {0} is enabled."
//  *Document: No
//  *Cause:
// *Action:
/
__279, OHOME_STATUS_DISABLED, "Oracle home {0} is disabled."
//  *Document: No
//  *Cause:
// *Action:
/
__280, OHOME_NAME, "Oracle home name: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__281, OHOME_PATH, "Oracle home path: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__282, OHOME_TYPE, "Oracle home type: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__283, OHOME_NODELIST, "Node list: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__284, OHOME_SHARED_TRUE, "Shared: TRUE"
//  *Document: No
//  *Cause:
// *Action:
/
__285, OHOME_SHARED_FALSE, "Shared: FALSE"
//  *Document: No
//  *Cause:
// *Action:
/
__286, OHOME_OBASE, "Oracle base: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__287, OHOME_DATABASES, "Databases configured: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__288, OHOME_LISTENERS, "Listeners configured: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__289, OHOME_ENABLED_NODE, "Oracle home resource is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__290, OHOME_DISABLED_NODE, "Oracle home resource is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause:
// *Action:
/
__291, USAGE_SI_ADD_OHOME, "Usage: srvctl add oraclehome -name <home_name> -path <path>"
//  *Document: No
//  *Cause:
// *Action:
/
__292, USAGE_SI_MODIFY_OHOME, "Usage: srvctl modify oraclehome -name <home_name> -path <path>"
//  *Document: No
//  *Cause:
// *Action:
/
__293, USAGE_SI_START_OHOME, "Usage: srvctl start oraclehome -name <home_name>"
//  *Document: No
//  *Cause:
// *Action:
/
__294, USAGE_SI_STOP_OHOME, "Usage: srvctl stop oraclehome -name <home_name> [-force]"
//  *Document: No
//  *Cause:
// *Action:
/
__295, USAGE_SI_ENABLE_OHOME, "Usage: srvctl enable oraclehome -name <home_name>"
//  *Document: No
//  *Cause:
// *Action:
/
__296, USAGE_SI_DISABLE_OHOME, "Usage: srvctl disable oraclehome -name <home_name>"
//  *Document: No
//  *Cause:
// *Action:
/
__297, OHOME_SI_RUNNING, "Oracle home {0} is available."
//  *Document: No
//  *Cause:
// *Action:
/
__298, DEFINE_CONFIG_GNS_INSTANCES, "    -{0}                     Display the instance list."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__299, DEFINE_MODIFY_GNS_ROLE, "    -{0} {PRIMARY}                Convert a secondary GNS instance to primary."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__300, DEFINE_MODIFY_GNS_FORCE, "    -{0}                         Forcefully convert the secondary GNS instance."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__301, DEFINE_EXPORT_GNS_ROLE, "    -{0} {CLIENT|SECONDARY}       Role for which the client data will be exported"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__302, GNS_CONFIG_INSTANCES, "GNS instances: {0}"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__303, DEFINE_FAILOVER_RESTORE, "    -{0} <failover_restore>  Option to restore parameters after TAF failover (e.g. NONE or LEVEL1)"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__304, SRV_CFG_FRESTORE, "Failover restore: {0}"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__305, SCAN_VIP_CONFIG_INACTIVE, "SCAN {0} {1} VIP: {2} (inactive)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__306, DEFINE_CSS_CRITICAL, "    -{0} {YES | NO}          Define whether the database or service is CSS critical"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__307, CSS_CRITICAL, "CSS critical: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__308, USAGE_MODIFY_ASM_2, "Usage: srvctl modify asm -proxy -spfile <spfile_path> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__309, USAGE_ADD_ASM_2, "Usage: srvctl add asm -proxy [-spfile <spfile>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
/
__310, DEFINE_ADD_MOUNTOWNER, "    -{0} <user_name>        Mount point path owner"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__311, DEFINE_MODIFY_MOUNTOWNER, "    -{0} <user_name>        Replace the mount point path owner"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__312, DEFINE_RESOURCE, "    -{0}                  Remove the Rapid Home Provisioning Server resource only, leaving its repository unaffected"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
__313, DEFINE_CPU_COUNT, "    -{0} <cpu_count>          Number of workload CPUs"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__314, CPU_COUNT, "CPU count: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__315, DEFINE_CPU_CAP, "    -{0} <cpu_cap>          Integer percentage that indicates the maximum utilization of workload CPUs"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__316, CPU_CAP, "CPU cap: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__317, DEFINE_MEMORY_TARGET, "    -{0} <memory_target>          Target memory, in MB, used by the resource"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__318, MEMORY_TARGET, "Memory target: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__319, DEFINE_MAX_MEMORY, "    -{0} <max_memory>          Maximum memory, in MB, used by the resource"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__320, MAX_MEMORY, "Maximum memory: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__321, USAGE_ADD_NETSTORAGESRV, "Usage: srvctl add netstorageservice -device <volume_device>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__322, USAGE_CONFIG_NETSTORAGESRV, "Usage: srvctl config netstorageservice"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__323, USAGE_ENABLE_NETSTORAGESRV, "Usage: srvctl enable netstorageservice [-node <node>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__324, USAGE_DISABLE_NETSTORAGESRV, "Usage: srvctl disable netstorageservice [-node <node>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__325, USAGE_REMOVE_NETSTORAGESRV, "Usage: srvctl remove netstorageservice"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__326, USAGE_START_NETSTORAGESRV, "Usage: srvctl start netstorageservice [-node <node>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__327, USAGE_STATUS_NETSTORAGESRV, "Usage: srvctl status netstorageservice"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__328, USAGE_STOP_NETSTORAGESRV, "Usage: srvctl stop netstorageservice [-node <node>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__329, ADD_NETSTORAGESRV_PURPOSE, "\nAdds a network storage service configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__330, CONFIG_NETSTORAGESRV_PURPOSE, "\nDisplays the configuration for the network storage service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__331, ENABLE_NETSTORAGESRV_PURPOSE, "\nEnables the network storage service for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__332, DISABLE_NETSTORAGESRV_PURPOSE, "\nDisables the network storage service for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__333, REMOVE_NETSTORAGESRV_PURPOSE, "\nRemoves the network storage service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__334, START_NETSTORAGESRV_PURPOSE, "\nStarts the network storage service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__335, STATUS_NETSTORAGESRV_PURPOSE, "\nDisplays the current state of the network storage service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__336, STOP_NETSTORAGESRV_PURPOSE, "\nStops the network storage service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__337, DEFINE_RF_POOL, "    -{0} <pool_name>            Reader farm server pool name"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__338, RFSERVICE, "Reader Farm Service: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__339, DEFINE_DEFAULT_NETNUM, "    -{0} <network_number> Default network number for database services"
//  *Document: No
//  *Cause: Status message for -netnum(k)
// *Action: Not an error
/
__340, DEFAULT_NETNUM, "Default network number for database services: {0}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__341, UNSUPPORTED_OPTION_ACCELERATORVOLS, "The command option '-acceleratorvols' is not supported on this operating system." 
//  *Cause: An attempt to execute the command 'srvctl add filesystem' with the
//          '-acceleratorvols' option was rejected because that option was not
//          supported by the operating system.
// *Action: Reissue the command without the '-acceleratorvols' option.	
/
__342, DEFINE_FAILOVER_RESTORE2, "    -{0} <failover_restore>  Option to restore initial environment for Application Continuity and TAF (NONE or LEVEL1)"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__343, DEFINE_RHP_TLS_ENABLED, "    -{0} {YES|NO}       Rapid Home Provisioning Transport Level Security enabled"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__344, DEFINE_HUB_SERVICE, "    -{0} <hub_service>            Hub service used by Reader Farm service"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__345, SRV_HUB_SERVICE, "Hub service: {0}"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__346, DEFINE_OVERRIDE_POOL_LIST, "    -{0} \"<overridepool_list>\"   Comma separated list of override pool names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__347, USAGE_ADD_DHCPPROXY, "Usage: srvctl add dhcpproxy -nettype {STATIC|DHCP} [-macipmapping <mac1>/<ip1>[,<mac2>/<ip2>...]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__348, ADD_DHCPPROXY_PURPOSE, "\nAdds a DHCP proxy server resource to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__349, USAGE_ADD_TFTP, "Usage: srvctl add tftp [-tftproot <path>] [-serverip <ip address>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__350, ADD_TFTP_PURPOSE, "\nAdds a TFTP server resource to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__351, USAGE_MODIFY_DHCPPROXY, "Usage: srvctl modify dhcpproxy -nettype {STATIC|DHCP} [-macipmapping <mac1>/<ip1>[,<mac2>/<ip2>...]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__352, MODIFY_DHCPPROXY_PURPOSE, "\nModifies the DHCP proxy server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__353, USAGE_MODIFY_TFTP, "Usage: srvctl modify tftp [-tftproot <path>] [-serverip <ip address>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__354, MODIFY_TFTP_PURPOSE, "\nModifies the TFTP server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__355, USAGE_START_DHCPPROXY, "Usage: srvctl start dhcpproxy [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__356, START_DHCPPROXY_PURPOSE, "\nStarts the DHCP proxy server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__357, USAGE_START_TFTP, "Usage: srvctl start tftp"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__358, START_TFTP_PURPOSE, "\nStarts the TFTP server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__359, USAGE_STOP_DHCPPROXY, "Usage: srvctl stop dhcpproxy [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__360, STOP_DHCPPROXY_PURPOSE, "\nStops the DHCP proxy server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__361, USAGE_STOP_TFTP, "Usage: srvctl stop tftp"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__362, STOP_TFTP_PURPOSE, "\nStops the TFTP server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__363, USAGE_ENABLE_DHCPPROXY, "Usage: srvctl enable dhcpproxy [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__364, ENABLE_DHCPPROXY_PURPOSE, "\nEnables the DHCP proxy server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__365, USAGE_ENABLE_TFTP, "Usage: srvctl enable tftp"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__366, ENABLE_TFTP_PURPOSE, "\nEnables the TFTP server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__367, USAGE_DISABLE_DHCPPROXY, "Usage: srvctl disable dhcpproxy [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__368, DISABLE_DHCPPROXY_PURPOSE, "\nDisables the DHCP proxy server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__369, USAGE_DISABLE_TFTP, "Usage: srvctl disable tftp"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__370, DISABLE_TFTP_PURPOSE, "\nDisables the TFTP server resource in the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__371, DEFINE_NETTYPE, "    -nettype          '{STATIC|DHCP}'                 Network address type for assigned IP address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__372, DEFINE_MAC_IP_MAPPING, "    -macipmapping     <mac1>/<ip1>[,<mac2>/<ip2>...]     MAC-to-IP address mapping for static network type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__373, DEFINE_TFTP_ROOT_PATH, "    -tftproot         <path>                             Root directory for the DNSMASQ TFTP service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__374, DEFINE_TFTP_SERVER_IP, "    -serverip         <ip address>                       Server IP address for the TFTP service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__375, USAGE_ADD_CDP, "Usage: srvctl add cdp [-port <port_number>] [-passfile_admin <afile>] [-passfile_readonly <rfile>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__376, ADD_CDP_PURPOSE, "\nAdds CDP resource to the cluster's first public network.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__377, USAGE_REMOVE_CDP, "Usage: srvctl remove cdp [-force]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__378, REMOVE_CDP_PURPOSE, "\nRemoves the CDP cluster resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__379, USAGE_MODIFY_CDP, "Usage: srvctl modify cdp [-port <port_number>] [-passfile_admin <afile>] [-passfile_readonly <rfile>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__380, MODIFY_CDP_PURPOSE, "\nModifies the configuration for the CDP cluster resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__381, USAGE_CONFIG_CDP, "Usage: srvctl config cdp [-cdpnumber <cdp_ordinal_number>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__382, CONFIG_CDP_PURPOSE, "\nDisplays the configuration for the CDP cluster resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__383, USAGE_START_CDP, "Usage: srvctl start cdp [-cdpnumber <cdp_ordinal_number>] [-node <node_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__384, START_CDP_PURPOSE, "\nStarts the CDP resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__385, USAGE_STOP_CDP, "Usage: srvctl stop cdp [-cdpnumber <cdp_ordinal_number>]"
//  *Document: No
//  *Cause:
// *Action:
/
__386, STOP_CDP_PURPOSE, "\nStops the CDP resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__387, USAGE_STATUS_CDP, "Usage: srvctl status cdp [-cdpnumber <cdp_ordinal_number>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__388, STATUS_CDP_PURPOSE, "\nDisplays the current state of the CDP cluster resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__389, USAGE_ENABLE_CDP, "Usage: srvctl enable cdp [-cdpnumber <cdp_ordinal_number>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__390, ENABLE_CDP_PURPOSE, "\nEnables the CDP cluster resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__391, USAGE_DISABLE_CDP, "Usage: srvctl disable cdp [-cdpnumber <cdp_ordinal_number>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__392, DISABLE_CDP_PURPOSE, "\nDisables the CDP cluster resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__393, USAGE_RELOCATE_CDP, "Usage: srvctl relocate cdp -cdpnumber <cdp_ordinal_number> [-node <node_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__394, RELOCATE_CDP_PURPOSE, "\nRelocates the CDP resource from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__395, DEFINE_CDP_ORD_NUMBER, "    -{0} <cdp_ordinal_number>   Ordinal number of CDP resource"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__396, DEFINE_CDP_NODE_NAME, "    -{0} <node_name>        CDP node name"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
__397, DEFINE_CDP_PORT, "    -{0} <port_number>                Port used to connect to service (Range 0 - 65535)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__398, DEFINE_PASSFILE_ADMIN, "    -{0} <afile>                 The file with the password for the 'admin' CDP user"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__399, DEFINE_PASSFILE_READONLY, "    -{0} <rfile>                 The file with the password for the 'readonly' CDP user"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__400, USAGE_ADD_CLUSTER_ONS, "Usage: srvctl add ons [-emport <em_port>] [-onslocalport <ons_local_port>]  [-onsremoteport <ons_remote_port>] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-clientcluster <cluster_name> | -clientdata <filename>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__401, USAGE_CONFIG_CLUSTER_ONS, "Usage: srvctl config ons [-all] [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__402, USAGE_ENABLE_CLUSTER_ONS, "Usage: srvctl enable ons [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__403, USAGE_DISABLE_CLUSTER_ONS, "Usage: srvctl disable ons [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__404, USAGE_MODIFY_CLUSTER_ONS, "Usage: srvctl modify ons [-emport <em_port>] [-onslocalport <ons_local_port>]  [-onsremoteport <ons_remote_port>] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__405, USAGE_REMOVE_CLUSTER_ONS, "Usage: srvctl remove ons [-clientcluster <cluster_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__406, USAGE_START_CLUSTER_ONS, "Usage: srvctl start ons [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__407, USAGE_STATUS_CLUSTER_ONS, "Usage: srvctl status ons [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__408, USAGE_STOP_CLUSTER_ONS, "Usage: srvctl stop ons [-clientcluster <cluster_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__409, USAGE_EXPORT_CLUSTER_ONS, "Usage: srvctl export ons -clientcluster <cluster_name> -clientdata <filename>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__410, ADD_CLUSTER_ONS_PURPOSE, "\nAdds an ONS configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__411, CONFIG_CLUSTER_ONS_PURPOSE, "\nDisplays the configuration for the ONS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__412, ENABLE_CLUSTER_ONS_PURPOSE, "\nEnables the ONS for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__413, DISABLE_CLUSTER_ONS_PURPOSE, "\nDisables the ONS for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__414, MODIFY_CLUSTER_ONS_PURPOSE, "\nModifies the configuration for the ONS resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__415, REMOVE_CLUSTER_ONS_PURPOSE, "\nRemoves the ONS from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__416, START_CLUSTER_ONS_PURPOSE, "\nStarts the ONS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__417, STATUS_CLUSTER_ONS_PURPOSE, "\nDisplays the current state of the ONS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__418, STOP_CLUSTER_ONS_PURPOSE, "\nStops the ONS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__419, EXPORT_CLUSTER_ONS_PURPOSE, "\nExports ONS server information into a file.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__420, DEFINE_CLUSTER_NAME, "    -{0} <cluster_name>        Cluster name"
//  *Document: No
//  *Cause: Status message for -clientcluster
// *Action: Not an error
/
__421, DEFINE_SCAN_CLIENT, "    -{0}        SCAN client cluster"
//  *Document: No
//  *Cause: Status message for -scanclient
// *Action: Not an error
/
__422, DEFINE_ONS_EXPORT_SCANCLIENTDATA, "    -{0} <filename>    File to which credentials data will be written"
//  *Document: No
//  *Cause: Status message for -clientdata
// *Action: Not an error
/
__423, DEFINE_ALL_ONS, "    -{0}                All ONS resources"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
__424, ONS_RUNNING, "ONS {0} is running."
//  *Document: No
//  *Cause:
// *Action:
/
__425, ONS_NOT_RUNNING, "ONS {0} is not running."
//  *Document: No
//  *Cause:
// *Action:
/
__426, ONS_STATUS_ENABLED, "ONS {0} is enabled."
//  *Document: No
//  *Cause:
// *Action:
/
__427, ONS_STATUS_DISABLED, "ONS {0} is disabled."
//  *Document: No
//  *Cause:
// *Action:
/
__428, USAGE_EXPORT_SCAN_LISTENER, "Usage: srvctl export scan_listener -clientcluster <cluster_name> -clientdata <filename>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__429, EXPORT_SCAN_LISTENER_PURPOSE, "\nExports SCAN Listener information into a file.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__430, CDP_CONFIG_HEADER, "CDP Name                           port"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__431, DEFINE_DISABLED_REASON, "    -{0} <reason_disabled>    Reason database was disabled (DECOMMISSIONED)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/

__432, DEFINE_ADD_MOUNTGROUP, "    -{0} <group_name>       Group for the mount point path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__433, DEFINE_MODIFY_MOUNTGROUP, "    -{0} <group_name>       Replace group for the mount point path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__434, DEFINE_ADD_MOUNTPERM, "    -{0} <octal_permission>  Octal number for the permissions of user, group, and others"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__435, DEFINE_MODIFY_MOUNTPERM, "    -{0} <octal_permission>  Modify the permissions of user, group, and others"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__436, USAGE_ADD_TFA, "Usage: srvctl add tfa -diskgroup <dg_name>"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__437, ADD_TFA_PURPOSE, "\nAdds the TFA resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__438, USAGE_REMOVE_TFA, "Usage: srvctl remove tfa [-force]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__439, REMOVE_TFA_PURPOSE, "\nRemoves the TFA resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__440, USAGE_CONFIG_TFA, "Usage: srvctl config tfa"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__441, CONFIG_TFA_PURPOSE, "\nDisplays the configuration for the TFA resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__442, USAGE_START_TFA, "Usage: srvctl start tfa [-node <node_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__443, START_TFA_PURPOSE, "\nStarts the TFA resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__444, USAGE_STOP_TFA, "Usage: srvctl stop tfa [-node <node_name>] [-force]"
//  *Document: No
//  *Cause:
// *Action:
/
__445, STOP_TFA_PURPOSE, "\nStops the TFA resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__446, USAGE_STATUS_TFA, "Usage: srvctl status tfa"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__447, STATUS_TFA_PURPOSE, "\nDisplays the current state of the TFA cluster resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__448, USAGE_ENABLE_TFA, "Usage: srvctl enable tfa [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__449, ENABLE_TFA_PURPOSE, "\nEnables the TFA resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__450, USAGE_DISABLE_TFA, "Usage: srvctl disable tfa [-node <node_name>]"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__451, DISABLE_TFA_PURPOSE, "\nDisables the TFA resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__452, TFA_CONFIGURED, "\nThe TFA resource is configured.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__453, TFA_NOT_CONFIGURED, "\nThe TFA resource is not configured.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/

__460, USAGE_ADD_CDPPROXY, "Usage: srvctl add cdpproxy -clienttype <client_type> -clientname <client_name> [-remotestart {YES|NO}]"
// *Document: NO
// *Cause: Usage message
// *Action: Not an error
/
__461, ADD_CDPPROXY_PURPOSE, "\nAdds CDPPROXY resource to monitor a shared cluster resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__462, USAGE_REMOVE_CDPPROXY, "Usage: srvctl remove cdpproxy -clienttype <client_type> [-clientname <client_name>] [-force]"
// *Document: NO
// *Cause: Usage message
// *Action: Not an error
/
__463, REMOVE_CDPPROXY_PURPOSE, "\nRemoves the CDPPROXY resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__464, USAGE_MODIFY_CDPPROXY, "Usage: srvctl modify cdpproxy -clienttype <client_type> -clientname <client_name> [-remotestart {YES|NO}]"
// *Document: NO
// *Cause: Usage message
// *Action: Not an error
/
__465, MODIFY_CDPPROXY_PURPOSE, "\nModifies the configuration for the CDPPROXY resource.\n"
// *Document: No
// *Cause:
// *Action:
/
__466, USAGE_CONFIG_CDPPROXY, "Usage: srvctl config cdpproxy -clienttype <client_type> [-clientname <client_name>]"
// *Document: NO
// *Cause:
// *Action:
/
__467, CONFIG_CDPPROXY_PURPOSE, "\nDisplays the configuration for the CDPPROXY resource.\n"
// *Document: No
// *Cause:
// *Action:
/
__468, USAGE_START_CDPPROXY, "Usage: srvctl start cdpproxy -clienttype <client_type> -clientname <client_name> [-node <node_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__469, START_CDPPROXY_PURPOSE, "\nStarts the CDPPROXY resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__470, USAGE_STOP_CDPPROXY, "Usage: srvctl stop cdpproxy -clienttype <client_type> -clientname <client_name> [-node <node_name>]"
//  *Document: No
//  *Cause:
// *Action:
/
__471, STOP_CDPPROXY_PURPOSE, "\nStops the CDPPROXY resource.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__472, USAGE_STATUS_CDPPROXY, "Usage: srvctl status cdpproxy -clienttype <client_type> -clientname <client_name>"
// *Document: NO
// *Cause:
// *Action:
/
__473, STATUS_CDPPROXY_PURPOSE, "\nDisplays the current state of the CDPPROXY resource.\n"
// *Document: No
// *Cause:
// *Action:
/
__474, USAGE_ENABLE_CDPPROXY, "Usage: srvctl enable cdpproxy -clienttype <client_type> -clientname <client_name>"
// *Document: NO
// *Cause:
// *Action:
/
__475, ENABLE_CDPPROXY_PURPOSE, "\nEnables the CDPPROXY resource.\n"
// *Document: No
// *Cause:
// *Action:
/
__476, USAGE_DISABLE_CDPPROXY, "Usage: srvctl disable cdpproxy -clienttype <client_type> -clientname <client_name>"
// *Document: NO
// *Cause:
// *Action:
/
__477, DISABLE_CDPPROXY_PURPOSE, "\nDisables the CDPPROXY resource.\n"
// *Document: No
// *Cause:
// *Action:
/
__478, USAGE_RELOCATE_CDPPROXY, "Usage: srvctl relocate cdpproxy -clienttype <client_type> -clientname <client_name> [-node <node_name>] [-force]"
//  *Document: No
//  *Cause:
// *Action:
/
__479, RELOCATE_CDPPROXY_PURPOSE, "\nRelocates the CDPPROXY resource from one node of the cluster to another.\n"
//  *Document: No
//  *Cause:
// *Action:
/
__480, DEFINE_CDPPROXY_CLIENTNAME, "    -{0} <client_name>   The user assigned name of the cluster resource to be proxied"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__481, DEFINE_CDPPROXY_CLIENTTYPE, "    -{0} <client_type>   The cluster resource type to be proxied. The only resource type currently supported is \'diskgroup\'"
//  *Document: No
//  *Cause:
// *Action:
/
__482, CDP_PROXY_CONFIG_HEADER, "CDP Proxy Type    Remote Start    Client Resource"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__483, DEFINE_CDPPROXY_REMOTESTART, "    -{0} <YES|NO>   Start the proxied resource remotely or not"
//  *Document: No
//  *Cause:
// *Action:
/
__484, USAGE_REMOVE_DHCPPROXY, "Usage: srvctl remove dhcpproxy [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__485, REMOVE_DHCPPROXY_PURPOSE, "\nRemoves the DHCP Proxy resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__486, USAGE_STATUS_DHCPPROXY, "Usage: srvctl status dhcpproxy"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__487, STATUS_DHCPPROXY_PURPOSE, "\nDisplays the current state of the DHCP Proxy resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__488, USAGE_CONFIG_DHCPPROXY, "Usage: srvctl config dhcpproxy"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__489, CONFIG_DHCPPROXY_PURPOSE, "\nDisplays the configuration for the DHCP Proxy resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__490, DEFINE_RHP_HTTPS_ENABLED, "    -{0} {YES|NO}       Rapid Home Provisioning Transport Layer Security for HTTP enabled"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__491, DEFINE_QOSMSERVER_HTTPS_ENABLED, "    -{0} '{YES|NO}'       QoS Management Server Transport Layer Security for HTTP enabled"
// *Document: NO
// *Cause: Status message
// *Action: Not an error
/
__500, USAGE_CONFIG_ALL, "Usage: srvctl config all"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__501, CONFIG_ALL_PURPOSE, "\nDisplays the configuration details of the cluster and database components.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__502, USAGE_VERSION, "Usage: srvctl {-version | -version -fullversion | -fullversion}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__503, USAGE_ADD_ASMNETWORK, "Usage: srvctl add asmnetwork [-netnum <asmnet_num>] -subnet <subnet>/<netmask>[/if1[|if2...]] [-deptype <dep_type>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__504, ADD_ASMNETWORK_PURPOSE, "\nAdds asm network resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__505, USAGE_REMOVE_ASMNETWORK, "Usage: srvctl remove asmnetwork [-netnum <asmnet_num>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__506, REMOVE_ASMNETWORK_PURPOSE, "\nRemoves the asm network resource.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__507, DEFINE_CONFIG_GNS_QUERYCLUSTER, "    -{0}                  Display the registered clusters"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__508, DEFINE_CONFIG_GNS_QUERY_NAME, "    -{0} <clustername>            Display the registered cluster by name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__509, DEFINE_REMOVE_GNS_NAME, "    -{0} <name>            Delete entries for the cluster name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__510, DEFINE_REMOVE_GNS_GUID, "    -{0} <guid>            Delete entries for the cluster GUID"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_511, DEFINE_START_SERVICE_ROLE, "    -{0}                Start services for the local database role"
//  *Document: No
//  *Cause: Status message for -role
// *Action: Not an error
/
_512, SRV_TABLE_FAMILY_ID, "Table Family Id: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_513, DEFINE_TABLE_FAMILY_ID, "    -{0} <table_family_id>  Set table family ID for a given service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_514, DEFINE_RF, "    -rf      To perform the action on reader farm service"
//  *Document: No
//  *Cause: Status message for -rf
// *Action: Not an error
/

