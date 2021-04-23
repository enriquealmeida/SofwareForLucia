// Copyright (c) 2008, 2019, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrkoMsg.msg
//
// DESCRIPTION
//    Message file for srvctl
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      01/20/19 - Backport rakebhat_bug-28881848 from main
//     apfwkr      10/17/18 - Backport jesusfer_bug-28628030 from main
//     rakebhat    11/16/18 - fix bug 28881848
//     jesusfer    10/01/18 - fix bug 28628030, rhps support nas
//     lhurtado    07/04/18 - Bug No. 28252668 - Unmatched left '<' issue
//     mpradeep    06/29/18 - 28147329 leaf desupport
//     mpradeep    06/13/18 - 28072000 Fix Usage
//     pevilla     06/08/18 - Bug 26560478, organize SCAN output
//     rakebhat    04/18/18 - fix bug 27835129
//     mpradeep    04/04/18 - 26991264 -Add a new resource attribute for temp
//                            location
//     mpradeep    03/20/18 - 27430290 - Modify output messages
//     rakebhat    03/05/18 - fix bug 26997860
//     jorgepe     02/23/18 - Fix bug 27588164
//     rakebhat    01/17/18 - Fix bug 27141883
//     pevilla     01/15/18 - ER 26094690, support for cluster management
//     rdesale     10/23/17 - fix RTI 20657592
//     yizhang     10/18/17 - fix bug 26817825
//     jorgepe     09/26/17 - Fix bug 26809249
//     rakebhat    09/04/17 - fix bug 26734942
//     jorgepe     07/24/17 - Fix bug 26516638
//     vinavish    07/03/17 - fix bug 26381667
//     rakebhat    06/28/17 - fix bug 26351042
//     vinavish    06/28/17 - fix bug 25147892
//     kfgriffi    06/15/17 - Add cdp/cdpproxy objects
//     rakebhat    05/29/17 - fix bug 26152669
//     yizhang     05/01/17 - fix bug 25692046
//     pevilla     04/19/17 - ER 25882607, support status for SS Listener
//     rakebhat    04/18/17 - fix bug 25782560
//     kfgriffi    04/17/17 - Fix bug 25753886 - remove TAF designations
//     rakebhat    04/13/17 - fix bug 23705699
//     vinavish    04/06/17 - fix bug 25236340
//     ccharits    04/05/17 - Added -port_range in rhpserver usage
//     rakebhat    03/30/17 - fix bug 25747261
//     rakebhat    03/21/17 - fix bug 25394507
//     pevilla     03/03/17 - Fix bug 25657558, change usage for add scan
//     rakebhat    02/28/17 - fix bug 23643685
//     jorgepe     01/25/17 - ACFS Remote
//     rakebhat    01/06/17 - fix bug 23852560
//     rakebhat    01/03/17 - fix bug 25343643
//     rakebhat    12/19/16 - fix bug 24951104
//     kfgriffi    12/01/16 - Add -hubsvc usage
//     pevilla     11/24/16 - Shared SCAN changes
//     rakebhat    11/09/16 - fix bug 24755458
//     vinavish    11/03/16 - fix bug 24555154 and 24593664
//     rakebhat    10/27/16 - fix bug 24675897
//     jorgepe     09/28/16 - ER 24459535
//     vinavish    08/29/16 - fix bug 23523528
//     ocordova    08/08/16 - Output for rhp and rhpc with secure
//     alcerda     04/29/16 - fix bug 23135904 add -version to export gns
//     iestrada    13/15/16 - Fix bug 22901189
//     rdesale     04/04/16 - fix Bug 22924162
//     alcerda     03/14/16 - fix bug 22305258
//     vgunredd    02/23/16 - fix modify inst for rac1
//     yizhang     02/19/16 - fix ioserver usage
//     yizhang     02/04/16 - fix bug 22445946
//     epineda     02/02/16 - 22581023,21899871
//     iestrada    11/16/15 - Fix bug 22367570
//     pevilla     11/16/15 - Reader Farm support
//     epineda     11/12/15 - Reader farm support
//     vgunredd    11/04/15 - remove -cpucap option for database
//     ocordova    11/10/15 - Fix bug 21967163
//     alcerda     09/25/15 - fix bug 19608733
//     kamramas    09/21/15 - Fix Bug 21867849
//     kamramas    09/09/15 - Fix Bug 21266975
//     vgunredd    08/13/15 - Fix bug 20992656
//     yizhang     07/24/15 - fix bug 14395701
//     alcerda     07/03/15 - fix bug 21120442
//     yizhang     06/22/15 - fix bug 18506011
//     pevilla     06/17/15 - Modify usage for listener
//     epineda     06/12/15 - Bugfix 19691769: mountusers support
//     vgunredd    06/11/15 - Fix bug 20992626
//     vgunredd    05/27/15 - Fix bug 20847320
//     epineda     04/30/15 - ER 20992474
//     smadabhu    04/22/15 - ER 20861685
//     vgunredd    03/25/15 - Fix bug 20716122
//     spavan      03/24/15 - fix bug20633431 - add option for destloc
//     yizhang     03/17/15 - Implement project 47208
//     pevilla     03/10/15 - Project 47157, HA GNS
//     agorla      02/23/15 - combine CCB & CCM into one
//     rtamezd     02/12/15 - Fix 20241436
//     epineda     02/04/15 - Project 47408: home resource
//     smadabhu    01/27/15 - ER 20194578
//     smadabhu    01/21/15 - Bug 20342077
//     smadabhu    01/08/15 - ER 20230560 - Change usage for start/status
//                            service
//     smadabhu    11/26/14 - Proj 51778 - Add -wait in 'srvctl stop service'
//     pevilla     11/20/14 - Fix bug 19412231, add EXADIRECT to listener
//     epineda     11/12/14 - ER 19989683: Add -clientcluster to add filesystem
//     vgunredd    10/29/14 - Fix bug 19598058
//     vobulapu    10/17/14 - Add Email notification support for GHS/GHC
//     smadabhu    10/01/14 - Proj 51778 - Support for drain timeout
//     mpradeep    09/22/14 - 18971217 : Remove -i option from srvctl remove
//                            service
//     smadabhu    09/17/14 - Bug 19393246
//     smadabhu    09/08/14 - Proj 51778
//     marbharg    08/26/14 - Bug Fix - 14408730
//     smadabhu    08/22/14 - Bug 19393415
//     vgunredd    07/07/14 - Fix bug 19138899
//     vgunredd    05/30/14 - Fix bug 14168393
//     ksviswan    05/16/14 - XbranchMerge ksviswan_bug-18707931 from
//                            st_has_12.1
//     rtamezd     05/29/14 - Bug 13944171
//     marbharg    04/30/14 - Backport marbharg_bug-18555668 from main
//     sejlim      04/22/14 - ovmm
//     marbharg    04/17/14 - Bug Fix - 18555668
//     epineda     04/15/14 - Backport epineda_bug-15977353 from main
//     marbharg    04/10/14 - Backport marbharg_bug-18335072 from main
//     smadabhu    04/08/14 - Backport smadabhu_bug-18447190 from main
//     ocordova    04/03/14 - Fix Bug 18309444
//     ksviswan    05/12/14 - Name Change
//     marbharg    04/30/14 - Backport marbharg_bug-18555668 from main
//     sejlim      04/22/14 - ovmm
//     marbharg    04/17/14 - Bug Fix - 18555668
//     epineda     04/15/14 - Backport epineda_bug-15977353 from main
//     marbharg    04/10/14 - Backport marbharg_bug-18335072 from main
//     smadabhu    04/08/14 - Backport smadabhu_bug-18447190 from main
//     vgunredd    04/01/14 - Backport vgunredd_bug-18426979 from main
//     smadabhu    03/30/14 - Bug 18447190
//     epineda     03/28/14 - Bugfix 15977353: add support for mountfs
//     vgunredd    03/24/14 - Fix bug 18426979
//     chchatte    03/07/14 - Add VM resource
//     marbharg    03/04/14 - Bug - Fix 18335072
//     vgunredd    02/13/14 - Fix bug 9830629
//     ocordova    02/05/14 - Fix bug 14515100
//     epineda     01/17/14 - ER 18079932
//     smadabhu    12/27/13 - Bug 17671929
//     sidshank    12/22/13 - fix bug 17940353.
//     vgunredd    12/18/13 - Fix bug 9892886
//     yizhang     12/10/13 - fix bug 17756805
//     smadabhu    11/27/13 - Add FAR_SYNC - Bug 17663595
//     vgunredd    11/18/13 - Fix bug 14137667
//     yizhang     11/18/13 - fix bug 17756805
//     yizhang     11/15/13 - fix bug 17756138
//     yifyang     10/25/13 - bug-17600566
//     epineda     10/08/13 - Bugfix 17532130
//     ocordova    09/30/13 - Fix Bug 17376463
//     pevilla     09/19/13 - Fix INVALID_NETWORK_TYPE Action
//     smadabhu    09/11/13 - Bug 17435673
//     epineda     08/16/13 - Bugfix 17317142
//     smadabhu    07/24/13 - Bug 17206332
//     pevilla     07/03/13 - Bug 17019319, add pingtarget to network
//     smadabhu    07/02/13 - ER 15986311
//     smadabhu    06/27/13 - ER 16636740
//     epineda     06/25/13 - DB Accelerator changes
//     yizhang     06/25/13 - fix bug 16974765
//     lureyes     05/30/13 - Fix bug 16785372
//     sidshank    05/09/13 - fix bug 14579939
//     yizhang     05/08/13 - fix bug 16512913
//     pevilla     05/02/13 - Fix bug 14760483, change VIP_VIPNAME_NOT_EXIST
//                            message
//     sidshank    04/25/13 - fix bug 16485904.
//     lureyes     04/24/13 - Fix bug 16706337
//     fmaring     04/17/13 - fixbug 7507578
//     yifyang     04/17/13 - bug-16196459
//     vobulapu    04/14/13 - Fix bug 16611135
//     sowong      04/05/13 - support of local copying for workingcopy on GHC
//     yifyang     04/01/13 - bug-14369286
//     lureyes     03/13/13 - Change VIP_INSTAT_CLEAN and VIP_INSTAT_VALUE id
//                            number
//     satg        02/27/13 - Add support for cha
//     smadabhu    02/07/13 - Bug 14462921
//     ksviswan    01/30/13 - Fix Bug 16019665
//     pevilla     01/24/13 - Fix bug 16013581, Modify SCAN messages
//     mpradeep    01/24/13 - 14605184 - include instance option for PRKO-2147
//     abhisbg     12/17/12 - bug 15947403
//     pevilla     12/04/12 - Fix bug 14560589, modify VIP_ALREADY_STARTED
//     satg        11/14/12 - Fix bug 14730028
//     ccharits    11/13/12 - Added -invitednodes and -invitedsubnets to
//                            'srvctl add listener'
//     pevilla     10/29/12 - Fix bug 13968141, add leaf to network usage
//     rtamezd     10/22/12 - Fix bug 14790023
//     yizhang     10/08/12 - fix bug 14597440
//     smadabhu    10/05/12 - Bug 14588888
//     smadabhu    09/30/12 - Bug 14266148
//     smadabhu    09/13/12 - Bug 14227362
//     rtamezd     09/11/12 - Fix bug 14115195
//     yizhang     09/05/12 - fix bug 14528810
//     satg        09/04/12 - fix bug 14347014
//     satg        08/27/12 - fix bug 13950005
//     mpradeep    08/16/12 - 14167691: Change help message for srvctl command
//     yizhang     08/15/12 - fix bug 14368509
//     satg        08/08/12 - fix bug 14353184
//     ccharits    08/07/12 - Fixed bug 13530003
//     epineda     08/06/12 - Bugfix 14405149,14371995,14405149
//     yizhang     07/19/12 - Support start/stop concurrency for database
//     ccharits    07/30/12 - Fixed bug 13968719
//     smadabhu    07/24/12 - Fix bug 14364199
//     abhisbg     07/23/12 - bug 14358251
//     yizhang     07/19/12 - Support start/stop concurrency for database
//     epineda     07/18/12 - Bugfix 13843222
//     smadabhu    07/17/12 - Fix bug 14333733
//     vobulapu    07/17/12 - Fix bug 14149266
//     yizhang     07/09/12 - fix bug 14207487
//     smadabhu    07/03/12 - Fix bug 14218963
//     epineda     07/02/12 - Bugfix 14239749
//     yizhang     05/30/12 - fix bug 13949960
//     smadabhu    05/23/12 - Fix bug 14103978
//     epineda     05/17/12 - Bugfix 14002257
//     smadabhu    05/07/12 - Add -global_override to enable, disable and start
//                            service commands
//     yizhang     05/15/12 - fix bug 13990535
//     vobulapu    05/16/12 - Fix bug 14069268
//     epineda     05/02/12 - Bug 13851416 - GSD code removal
//     rtamezd     04/30/12 - Fix bug 14009590
//     epineda     04/27/12 - Bugfix 14010080
//     yizhang     04/24/12 - fix bug 13768305
//     abhisbg     04/27/12 - fix description force modify database
//     ccharits    04/27/12 - Added -mountpoint as option to
//                            'srvctl modify filesystem'
//                             as option
//     yizhang     04/24/12 - fix bug 13768305
//     ksrangal    04/24/12 - Fix bug 13867230
//     smadabhu    04/19/12 - Fix usage for relocate GHS
//     abhisbg     04/16/12 - fix bug 13934615
//     epineda     04/11/12 - Bugfix 13552269,13535159
//     epineda     03/30/12 - Bugfix 13900470
//     ccharits    03/29/12 - Fixed bugs 13826406 and 13889039
//     sowong      03/27/12 - fix bug13890185
//     ccharits    03/26/12 - Fixed bug 13416334
//     sowong      03/22/12 - fix bug13858628
//     yizhang     03/22/12 - Add category option to add/modify serverpool
//     epineda     03/21/12 - Bugfix 13580403
//     smadabhu    03/21/12 - Fix bug 13390629
//     vobulapu    03/21/12 - Fix bug 13862814
//     vobulapu    03/15/12 - Fix bug 13820266
//     epineda     03/13/12 - Bugfix 13813827
//     smadabhu    03/09/12 - Fix bug 13812571
//     sowong      03/06/12 - fix bug13813486
//     vobulapu    03/05/12 - Added -clientdata option in srvctl modify gns
//     smadabhu    02/27/12 - Fix bug 13368094
//     abhisbg     02/27/12 - fix bug 13541578
//     yizhang     02/23/12 - fix bug 13742581
//     yizhang     02/15/12 - fix bug 13101770
//     smadabhu    02/17/12 - Fix bug 12979189
//     epineda     02/16/12 - Bugfix 13531572
//     yizhang     02/15/12 - fix bug 13101770
//     epineda     02/15/12 - Bugfix 13350599
//     kfgriffi    02/08/12 - Fix bug 13565426 - spelling/grammar
//     xesquive    02/07/12 - Bug fix 13566257
//     vobulapu    02/03/12 - Fix bug 13613284
//     epineda     02/03/12 - Bugfix 13499771
//     yizhang     02/02/12 - fix bug 13626888
//     epineda     01/25/12 - Bugfix 13505947
//     epineda     01/19/12 - Bugfix 13531572
//     ccharits    01/16/12 - Modified message SCAN_VIP_CONFIG
//     vobulapu    01/12/12 - Fix bug 12981121
//     smadabhu    01/06/12 - Fix bugs 13556747,13560948
//     smadabhu    01/02/12 - Fix bug 13241054
//     vobulapu    12/29/11 - Fix bug 13418730
//     smadabhu    12/19/11 - Fix bug 13435567
//     vobulapu    12/13/11 - Fix bug 13251240
//     yizhang     12/12/11 - fix bug 13489580
//     smadabhu    11/22/11 - Fix bug 12626805
//     ccharits    11/28/11 - Fixed bug 13115955
//     smadabhu    11/15/11 - Fix bug 12900791,12713369
//     yizhang     11/22/11 - add restype option to upgrade model usage
//     vobulapu    11/08/11 - fix bug 12743966
//     yizhang     10/26/11 - add ioserver noun
//     yizhang     10/22/11 - Define add volume usage
//     sowong      11/01/11 - fix bug12830536
//     yizhang     11/01/11 - Use keyword for -l <listener_name>
//     vobulapu    10/18/11 - Added the DEFINE_GNS_EXPORT_CLIENTDATA
//     smadabhu    10/16/11 - Update usage messages
//     ccharits    10/13/11 - Fixed IPv6 related messages
//     abhisbg     10/13/11 - Fix bug 13018290,13030159
//     vobulapu    10/12/11 - fix bug 12423900
//     yizhang     08/27/11 - Modify messages to support PQ
//     vobulapu    09/11/11 - Removed credential option for GNS imprt/exprt
//     epineda     09/09/11 - Bugfix 12580837: added INVALID_SYNTAX_OR_MAND_VOL
//     ccharits    09/08/11 - Modified usage messages for 'srvctl filesystem'
//     xesquive    08/31/11 - Add force description while removing volume
//     ksviswan    08/25/11 - add admin helper
//     epineda     08/24/11 - Bugfix 12909780: corrected enable service purpose
//                            message
//     ksviswan    08/14/11 - add havip and exportfs
//     abhisbg     07/24/11 - change help messages to support whatif
//     abhisbg     07/21/11 - add message for WhatIf
//     rwessman    07/25/11 - Fixed GNS modify and update usage messages.
//     vobulapu    07/12/11 - Add GNS related msgs for 12c
//     yizhang     07/06/11 - Add messages for ioserver
//     sowong      06/28/11 - fix bug10429223
//     yizhang     06/05/11 - Add options for big cluster and remote ASM
//     smadabhu    05/06/11 - Support new service attributes in Application
//                            Continuity
//     yizhang     06/06/11 - fix bug 12585747
//     vobulapu    05/24/11 - Add the SCAN_LSNR_INVITED_NODES,
//                            SCAN_LSNR_INVITED_SUBNETS
//     yizhang     05/26/11 - fix bug 12580748
//     smadabhu    05/13/11 - Add SRV_TRANSLATION_PROFILE
//     vobulapu    05/20/11 - Added Error message related to shared password
//                            file on ASM DiskGroup
//     smadabhu    05/03/11 - Fix bug 12398978
//     smadabhu    04/27/11 - Add SRV_MAX_LAG_TIME
//     smadabhu    04/26/11 - Update usage message of add/modify service with
//                            pluggable database
//     yizhang     04/15/11 - Define volume messages
//     sowong      04/13/11 - add GHS and GHC
//     smadabhu    04/13/11 - Fix help messages for keyword options in service
//                            commands
//     agridnev    04/11/11 - fixed bug-11729755
//     smadabhu    03/29/11 - Add message for Pluggable Database
//     rwessman    03/24/11 - Added GNS_CLUSTER_TYPE.
//     sowong      03/23/11 - fix bug11787535
//     yizhang     02/23/11 - Implement keyword help messages
//     yizhang     02/11/11 - Fix DEFINE_GNS_LOG_LEVEL
//     yizhang     02/03/11 - fix bug 11653734
//     vobulapu    02/02/11 - fix bug 8544884
//     yizhang     01/27/11 - Add messages for using ANTLR parser
//     rwessman    01/26/11 - Deleted obsolete "-X" option from
//                            USAGE_MODIFY_GNS.
//     ccharits    01/24/11 - Fixed bug 11668799
//     rwessman    01/18/11 - Added GNS messages.
//     rxkumar     01/10/11 - fix bug10403922
//     rxkumar     12/06/10 - fix bug10179512
//     rxkumar     11/09/10 - fix bug10257087
//     rxkumar     11/03/10 - fix bug10162632
//     rxkumar     10/15/10 - fix bug10074857
//     rxkumar     09/29/10 - fix bug10156491
//     rxkumar     09/13/10 - fix bug9892846, 10077741, 10077486
//     yizhang     08/30/10 - define INVALID_PORT_NUMBER
//     rxkumar     08/30/10 - fix bug10070114
//     rxkumar     08/23/10 - fix bug9507067
//     sowong      06/14/10 - fix bug9812779
//     rxkumar     06/01/10 - rename omotion to online relocation
//     agridnev    05/14/10 - fixed error introduce by agridnev_bug-9700941
//     yizhang     05/11/10 - fix bug 9665987
//     agridnev    05/13/10 - fixed bug-9700941
//     sowong      05/05/10 - to change -f usage for stop instance
//     rxkumar     05/04/10 - fix bug9647375
//     rxkumar     04/19/10 - fix bug9572244
//     sravindh    04/12/10 - Bug 9574849
//     ccharits    04/01/10 - Fixed bug 9503512
//     sowong      03/30/10 - fix bug9480609
//     sowong      03/28/10 - fix bug9499045
//     sowong      03/19/10 - fix bug9485113 & bug9485105
//     sowong      03/12/10 - add support for upgrade & downgrade of database
//     sowong      03/11/10 - fix bug9444882
//     yizhang     03/04/10 - fix bug 9445461
//     sowong      03/04/10 - fix bug9445021
//     sowong      02/26/10 - fix bug9393211 & bug9401682
//     yizhang     02/24/10 - fix bug 9401890
//     agridnev    02/23/10 - fixed bug-9401530
//     sowong      02/23/10 - add messages for bug8715357
//     agridnev    02/22/10 - fixed bug-9398947
//     agridnev    02/16/10 - fixed bug-9360668
//     sowong      02/16/10 - add messages for database downgrade
//     yizhang     02/17/10 - Define INVALID_UPGRADE_PHASE
//     sowong      02/11/10 - fix bug8791374
//     agridnev    02/11/10 - added message for bug-8712906
//     yizhang     02/05/10 - fix bug 8620119
//     sowong      01/27/10 - fix bug9268093
//     yizhang     01/20/10 - Define UNSUPPORTED_VERSION_FOR_UPGRADE
//     agridnev    12/30/09 - new messages for bug 9212636
//     agorla      01/21/10 - bug 8659528 - log range in start gns help
//     rwessman    01/14/10 - Bug 8999025
//     agorla      01/14/10 - bug 8648293 - deprecate -a opt in config service
//     rxkumar     01/08/10 - fix bug8968662
//     sowong      01/06/10 - fix bug9251008
//     sowong      12/31/09 - add new message for timeout validation
//     agorla      12/30/09 - Bug 9225529 - Fix error nos.
//     agorla      01/04/10 - Bug 8545365 - force stop message
//     yizhang     12/31/09 - Add SCAN_NAME_NOT_START_LETTER
//     rxkumar     12/29/09 - fix bug9233702
//     agridnev    12/17/09 - disallowed a creation of PRECONNECT services for
//                            single instance db
//     sowong      12/16/09 - add message for bug9150327
//     rxkumar     12/10/09 - fix bug9169476
//     sowong      12/02/09 - fix bug9136209
//     rxkumar     11/30/09 - add CONVERT_RACONE2RAC_BAD_OPTS_W
//     yizhang     11/28/09 - fix bug 8438696
//     agridnev    11/25/09 - added messages to print detailed status for
//                            instances
//     yizhang     11/18/09 - fix bug 8438786
//     sowong      11/16/09 - move omotion messages to SRVM
//     rxkumar     11/16/09 - add CONVERT_DB_BAD_POLICY_OPTS_I
//     yizhang     11/12/09 - Add start/stop GSD support
//     sowong      11/10/09 - fix rac one node
//     yizhang     11/09/09 - Support edition attribute for service
//     sowong      10/27/09 - add support for RAC one node
//     yizhang     10/21/09 - fix bug 8317507
//     sowong      10/21/09 - fix bug8791771
//     agridnev    10/15/09 - fixed bug-8756568
//     rwessman    10/12/09 - Bug 8982940
//     rwessman    09/29/09 - Bug 8972167
//     rwessman    09/28/09 - Bug 8946963
//     rwessman    09/21/09 - Bug 8934484
//     yizhang     09/23/09 - fix bug 8922533
//     yizhang     09/29/09 - fix bug 8969469
//     agridnev    08/05/09 - fixed bug-6653587
//     agridnev    07/07/09 - fixed bug 8538570
//     yizhang     07/24/09 - fix bug 8702519
//     agridnev    07/06/09 - fixed bug 8592872
//     agridnev    06/30/09 - fixed bug 8622707
//     rwessman    06/25/09 - Bug 8290209 - deleted obsolete
//                            GNS_MODIFY_NO_OPTION_BESIDES_D.
//     rwessman    06/24/09 - Bug 8578494
//     rwessman    06/19/09 - Bug 8573693
//     agridnev    06/04/09 - added some action/cause lines.
//     yizhang     06/03/09 - Add POLICY_DB_START_INST_BOTH_OPT as a dummy 
//                            to not break lang files compiles
//     agridnev    06/01/09 - fixed bug 8563698
//     spavan      05/27/09 - add CVU resource
//     yizhang     05/26/09 - fix messages
//     yizhang     05/27/09 - fix bug 8509302
//     yizhang     05/08/09 - fix bug 8426888
//     rxkumar     05/06/09 - fix bug8473108
//     yizhang     05/07/09 - fix NET_RES_ENABLED_SUCC and
//                            NET_RES_DISABLED_SUCC
//     agridnev    05/06/09 - fixed for bug 8474459
//     rxkumar     04/29/09 - fix bug8437203
//     sravindh    05/02/09 - Add DB_START_INST_NO_OPT as a dummy to not break
//                            lang files compiles
//     sravindh    04/29/09 - Bug 8448433
//     yizhang     05/01/09 - Add message LISTENER_INVALID_OPTION_COMBINATION
//     rxkumar     04/16/09 - fix bug8417812
//     agridnev    04/28/09 - updated msg 3148 based on Bill's comments
//     rxkumar     04/28/09 - uppercase mgmt policy
//     yizhang     04/23/09 - fix bug 8428271
//     rxkumar     04/16/09 - fix bug8417812
//     agridnev    04/22/09 - fixed bug 8289440
//     yizhang     04/20/09 - fix bug 8325150
//     sowong      04/24/09 - fix bug8324523
//     sowong      04/17/09 - fix bug7697658
//     sowong      04/15/09 - fix bug7190209
//     yizhang     04/14/09 - Fix bug 8305145
//     yizhang     04/07/09 - fix bug 8397864
//     agridnev    04/13/09 - fixed bug-8417254
//     rxkumar     04/08/09 - fix bug8357685
//     rwessman    04/07/09 - Added -f option to USAGE_MODIFY_GNS.
//     agridnev    04/07/09 - fixed bug-8396419
//     agridnev    04/01/09 - fixed bug bug-8338015
//     rwessman    03/13/09 - Added GNS_NAME_RESOLVED to fix bug 8258169.
//     yizhang     03/05/09 - fix bug 8305019
//     agridnev    03/12/09 - added message for bug-8327913 fix
//     rxkumar     03/04/09 - fix bug8234241
//     agridnev    03/03/09 - fixed bug 7685872
//     agridnev    03/02/09 - adde new message to support fix for bug 7654049
//     rwessman    03/03/09 - Added GNS_MODIFY_ONLY_L_ALLOWED
//     rwessman    03/02/09 - Bug 8289899
//     yizhang     02/13/09 - Fix bug 8250080
//     rxkumar     02/24/09 - fix bug8266117
//     agraves     02/20/09 - Cleanup some messages for srvctl usm resources.
//     sowong      02/19/09 - fix bug8241374
//     rwessman    02/16/09 - Added -f option to USAGE_RELOCATE_GNS.
//     agridnev    02/11/09 - fixed bug 7157614
//     rwessman    02/11/09 - Bug 7597238.
//     rwessman    02/11/09 - Deleted GNS_IS_RUNNING. It is no longer used due
//                            to bug 7833540.
//     agridnev    02/18/09 - fixed bug 8252688
//     sowong      02/06/09 - fix INVALID_NODE message
//     rwessman    02/05/09 - Added GNS_MODIFY_REQ_EITHER_OPTION_NOT_SPECIFIED.
//     agridnev    02/05/09 - fixed bug-8210922
//     yizhang     01/21/09 - Add message INVALID_SYNTAX_MISSING_OPTION
//     agraves     01/17/09 - Change ASMFS to ACFS.
//     rxkumar     01/15/09 - add DEFINE_SRVR_NAME_STATE
//     yizhang     01/12/09 - Fix bug 7665426
//     sowong      01/09/09 - fix bug6872172
//     sowong      12/23/08 - fix bug7257323
//     agridnev    12/19/08 - added some missed ending periods
//     agridnev    12/17/08 - added "-f" flag to add/modify pool
//     sowong      12/09/08 - add message for bug7479267
//     sowong      12/05/08 - fix bug7379740
//     yizhang     11/11/08 - Fix bug 7531512
//     yizhang     11/20/08 - Remove OC4J_RUNNING
//     yizhang     11/11/08 - Fix bug 7531512
//     rwessman    11/06/08 - Corrected usage message for "srvctl modify gns".
//     rwessman    11/03/08 - Bug 7498399.
//     sowong      10/30/08 - fix bug7480289
//     yizhang     10/28/08 - Fix bug 7509133
//     rxkumar     10/23/08 - add msg for bug7377939 fix
//     rwessman    10/16/08 - Review comments from rxkumar.
//     rwessman    10/15/08 - Bug 7479534.
//     rwessman    10/14/08 - Bug 7479266.
//     rxkumar     10/06/08 - fix bug5724590
//     ksviswan    09/24/08 - update home cli usage
//     spavan      09/23/08 - fix bug7421260,7421246
//     sowong      09/19/08 - add msgs for bug6874976 & bug6874966
//     spavan      09/16/08 - fix bug6858693
//     yizhang     09/11/08 - Fix numberformatexception bugs
//     yizhang     09/12/08 - Define LSNR_CONFIG_ORACLE_HOME_ON_NODE
//     yizhang     09/10/08 - Fix bug 7360687
//     rwessman    09/08/08 - Improved GNS error messages.
//     sowong      09/02/08 - change usage for add filesystem
//     spavan      08/29/08 - fix bug7113890
//     rwessman    08/26/08 - Incorporated review comments from rxkumar.
//     spavan      08/11/08 - VIP noun cannot act on default network
//     rxkumar     08/07/08 - fix bug7142054
//     rxkumar     07/29/08 - add SRV_PREF_INSTS & SRV_AVAIL_INSTS
//     rsirigan    07/29/08 - remove getenv/setenv usage for scan and scan_listener 
//     rxkumar     07/22/08 - fix bug7142054
//     agridnev    07/21/08 - added message INVALID_VALUE_4_OPTION
//     yizhang     07/21/08 - Define LSNR_CONFIG_NETWORK_AND_OWNER
//     yizhang     07/17/08 - Fix USAGE_MODIFY_LISTENER
//     agridnev    07/07/08 - removed SERV_MUST_BE_OFFLINE
//     yizhang     07/07/08 - Fix INVALID_SETENVSTR
//     sowong      07/01/08 - fix bug6976533
//     rxkumar     07/01/08 - fix bug7193159
//     rsirigan    06/30/08 - fix USAGE_ADD_DB
//     rsirigan    06/17/08 - fix bug7188139 
//     agridnev    06/17/08 - fixed bug 7172071
//     rwessman    06/20/08 - Incorporated review comments from rxkumar.
//     sowong      06/04/08 - add messages for bug6644945
//     rsirigan    06/04/08 - add ONS and eONS to USAGE_SRVCTL_NOUN_SIHA and 
//                            fix USAGE_SI_SETENV_LISTENER, 
//                            fix USAGE_SI_UNSETENV_LISTENER
//     rwessman    05/28/08 - Added more GNS messages.
//     agridnev    06/02/08 - fix for bug 6953664
//     spavan      05/27/08 - fix bug6821677
//     rsirigan    05/26/08 - fix bug7126726 
//     yizhang     05/22/08 - Define ORDINAL_NUMBER_NOT_NUMERIC
//     agridnev    05/21/08 - added new messages for srvctl config service
//     rxkumar     05/20/08 - fix bug7040273
//     rxkumar     05/15/08 - fix bug7029476
//     rsirigan    05/15/08 - fix SERV_RUN message 
//     spavan      05/14/08 - Implement EONS and ONS for SIHA
//     rxkumar     05/07/08 - update -j default
//     spavan      05/12/08 - remove USAGE_SI_CONFIG_DB_ONE
//     spavan      05/09/08 - add cause and action
//     sowong      05/07/08 - modify messages for bug6953297
//     rsirigan    05/06/08 - fix bug 7021977 
//     yizhang     04/23/08 - Fix bug 6981656
//     sowong      04/23/08 - revert DISKGROUPS label for database back to old
//                            label
//     rxkumar     04/22/08 - update ASM CLI
//     rxkumar     04/15/08 - add diskgroup noun
//     sowong      04/11/08 - add messages for siha database
//     yizhang     04/01/08 - Define PORT_NOT_NUMERIC, NETWORK_NOT_NUMBER
//     yizhang     03/26/08 - Fix bug 6845868
//     rxkumar     03/26/08 - add srvpool support
//     sowong      03/26/08 - add database related msgs
//     agridnev    03/24/08 - fixed "add service" usage
//     rwessman    03/18/08 - Added support for GNS.
//     yizhang     03/13/08 - Fix bug 6845868
//     sowong      03/10/08 - add messages for asm filesystem
//     ksviswan    03/03/08 - update usage syntax for HOME cli
//     yizhang     02/29/08 - Fix SIHA listener usage
//     sowong      02/21/08 - add messages for environment variables
//     spavan      02/21/08 - add spavan_nappbugs messages
//     sravindh    02/19/08 - Pull in changes from transaction
//                            yizhang_srvctlsvgp_4
//     agridnev    02/06/08 - fixed bug 6764099
//     spavan      02/04/08 - Add deprecated message for -n remove
//     yizhang     01/30/08 - Update the usage for srvctl add scan
//     agridnev    01/28/08 - removed SRV_CFG_DOMAIN
//     sowong      01/27/08 - add database remove message
//     yizhang     01/08/08 - Update help message for modify scan/scan_listener
//     sowong      01/10/08 - modify DB_CENTRIC and SERVICE_CENTRIC msgs
//     spavan      01/10/08 - fix VIP_EXISTS message
//     agridnev    01/09/08 - promoted DTP to Distributed Transaction Processing
//     agridnev    01/04/08 - config service support
//     agridnev    01/03/08 - changed some flags for services
//     agridnev    01/03/08 - added support for service failover method
//     yizhang     01/03/08 - fix NODEAPPS_STOP_SUCC message
//     spavan      12/24/07 - Add modify nodeapps messages
//     agridnev    12/17/07 - added new msgs for services
//     ksviswan    12/09/07 - Patching CLI support
//     agridnev    12/04/07 - disable service support updated
//     agridnev    11/30/07 - add/modify service support updated
//     agridnev    11/21/07 - new message(s) for service support
//     agridnev    11/20/07 - amended service support
//     yizhang     11/26/07 - Add messages for config srvgrp
//     spavan      11/14/07 - add oc4j to noun
//     spavan      11/13/07 - Add cli's for OC4J
//     yizhang     11/13/07 - Use 11.2 srvctl commands for listener
//     yizhang     10/25/07 - fix CLIs for Scan
//     yizhang     10/19/07 - Add scan vip and scan listener messages
//     yizhang     10/08/07 - Use 11.2 syntax for srvctl <verb> srvgrp
//     yizhang     10/03/07 - Add -y for "srvctl remove vip" usage.
//     yizhang     10/01/07 - Add message PROMPT_REMOVE_VIP,CANNCEL_RM_VIP
//     sowong      09/27/07 - second phase of rac database implementation
//     yizhang     09/27/07 - add SCAN_NAME_CONFLICT_CLUSTER_NODE
//     yizhang     09/10/07 - Add messages for nodeapps 
//     sowong      08/17/07 - add messages for rac database implementation
//     yizhang     08/22/07 - Add error message NET_NUM_INVALID_FOR_VIP
//     yizhang     08/10/07 - Add messages for VIP commands
//     rsirigan    08/02/07 - fix bug6318383 
//     sowong      06/25/07 - add messages for asm implementation
//     rajkris     12/18/06 - Add messages for SCAN commands
//     smurala     09/21/06 - Msg fixes from 11.1 
//     bkannike    04/21/06 - 4666042 fix 
//     rxkumar     04/13/06 - fix bug5163409 
//     bkannike    04/03/06 - Modifying message for srvctl add nodeapps 
//     bkannike    04/10/06 - Fix srvctl config nodeapps usage 
//     rxkumar     01/03/06 - fix bug4623630 
//     rxkumar     08/02/05 - fix bug4531124 
//     rxkumar     05/23/05 - fix bug4379254 
//     bkannike    03/29/05 - Srvctl policy message changes 
//     bkannike    03/24/05 - adding usage messages for policy 
//     bkannike    03/23/05 - Policy Messages added to usage 
//     rxkumar     02/11/05 - fix bug4100762, add listener support 
//     dliu        10/20/04 - change syntax for status serv 
//     dliu        10/07/04 - remove mesg
//     dliu        09/09/04 - add MISMATCH_OUSER 
//     dliu        05/19/04 - 3437262
//     dliu        04/19/04 - 3366156 
//     dliu        03/31/04 - mesg fix 
//     dliu        03/22/04 - add asm 
//     dliu        03/23/04 - fix lsnr not running mesg 
//     dliu        03/09/04 - double quotes around list argument 
//     dliu        08/12/03 - -A mandatory in add nodeapps 
//     dliu        08/19/03 - start/stop service -a 
//     dliu        08/07/03 - mesg for internal service 
//     dliu        07/31/03 - force remove asm
//     dliu        08/05/03 - add ERR_CHK_ENABLE_ASM 
//     dliu        07/30/03 - ASM_DISABLED
//     dliu        07/28/03 - enable/disable asm
//     dliu        07/16/03 - remove nodeapps accepts multiple nodes
//     dliu        07/08/03 - 
//     dliu        06/27/03 - asm syntax help
//     dliu        06/09/03 - asm support
//     dliu        05/13/03 - 
//     dliu        05/13/03 - verb/noun -> command/object
//     dliu        04/22/03 - -f option for stop/relocate/modify service
//     dliu        04/21/03 - 
//     dliu        04/16/03 - add -T to setenv cmds
//     dliu        04/08/03 - db unique name
//     dliu        03/17/03 - add NO_ROOT
//     dliu        03/06/03 - fixing typos
//     dliu        02/18/03 - ONS mesg
//     dliu        02/17/03 - 
//     dliu        02/20/03 - minor changes
//     dliu        01/22/03 - 
//     dliu        01/14/03 - add serv inst
//     dliu        01/21/03 - add -q to start/stop
//     dliu        12/09/02 - add -S to config/status service
//     dliu        12/05/02 - fix typo in nodeapps help text
//     dliu        12/03/02 - use TAF values "NONE/BASIC/PRECONNECT
//     dliu        12/18/02 - help text for modify nodeapps
//     rdasari     10/21/02 - modify add database message
//     dliu        10/16/02 - give detail address string format
//     dliu        10/16/02 - add syntax mesgs for modify service,
//     dliu        08/16/02 - change "OEM Agent" to "EM Agent
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     dliu        07/15/02 - add db: change -s to -p
//     dliu        07/03/02 - add NODEAPPS_REMOVE_FAIL
//     dliu        06/28/02 - add periods to complete sentences
//     rdasari     06/17/02 - add SERV_NOT_EXIST
//     dliu        06/21/02 - remove VRANGE_FREE and VRANGE_ALLOCATED
//     dliu        03/26/02 - mesg for modify service.
//     dliu        03/19/02 - add SERV_AVAIL_LIST_EMPTY.
//     dliu        12/10/01 - change mesg contents for 9.2
//     dliu        11/19/01 - change INST_RUN.
//     dliu        11/14/01 - change usage text
//     dliu        11/01/01 - fix inst stat mesg.
//     dliu        10/30/01 - add existence mesgs.
//     dliu        10/25/01 - add vrange stuff.
//     dliu        10/24/01 - add NO_VRANGE.
//     dliu        09/18/01 - mesgs for new srvctl syntax.
//     dliu        08/15/01 - new messages.
//     dliu        08/07/01 - 902 changes.
//     dliu        02/06/01 - name change.
//     dliu        01/17/01 - modify usage openlines
//     dliu        01/11/01 - add support for pseudo cmds
//     dliu        01/11/01 - remove OPENLINE_REN_OPS
//     dliu        01/11/01 - add version mesg
//     dliu        11/15/00 - add INVALID_DBGLVL
//     dliu        11/08/00 - add -V to config command
//     dliu        10/23/00 - remove ERR_GET_ENV_VAL
//     dliu        10/23/00 - make -o mandatory for add ops
//     dliu        10/05/00 - fix messages
//     dliu        09/06/00 - fix a typo in mesg
//     dliu        08/31/00 - add command get env
//     dliu        08/29/00 - add INVALID_SETENVSTR
//     dliu        08/24/00 - remove OPT_P_MUSTWITH_OPT_N
//     dliu        08/24/00 - add mesg for invalid node
//     dliu        08/07/00 - cleanup code
//     dsaggi      07/11/00 -
//     dsaggi      07/11/00 - Creation
//  */
// 
// 
// /**
//  *  @version $Header: opsm/jsrc/oracle/ops/opsctl/resources/PrkoMsg.msg /st_has_19/2 2019/01/22 23:43:00 rakebhat Exp $
//  *  @author  dsaggi  
//  *  @since   release 8.2.0.0.0
//  */
// PACKAGE=package oracle.ops.opsctl.resources;
// MSGIDTYPE=interface
2000, INVALID_SI_SYNTAX, "Invalid command line syntax for a single instance database"
//  *Cause: user specified invalid command line syntax.
// *Action: Look at the usage provided for this command and specify all mandatory options.
/
2001, INVALID_SYNTAX, "Invalid command line syntax"
//  *Cause: The syntax of the command is incorrect. 
// *Action: Look at the usage provided for this command and use the correct syntax.
/
2002, INVALID_OPTION, "Invalid command line option: {0}"
//  *Cause: Invalid command line option was specified.
// *Action: Check the value printed along with the exception and specify the correct value.
/
2003, INVALID_OPTION_VAL, "Invalid command line option value: "
//  *Cause: Invalid command line option was specified.
// *Action: Check the value printed along with the exception and specify the correct value.
/
2004, REPEATED_OPTION, "Repetition of command line option: -{0}"
//  *Cause: The command line option printed along with the exception was repeated. 
// *Action: Delete the repeated command line option and try the command again.
/
2005, NO_CONFIGURATION, "Failure in getting Cluster Database Configuration for: "
//  *Cause: The specified database does not exist.
// *Action: Check the specified database name and try again.
/
2006, INVALID_NODE, "Invalid node name: {0}"
//  *Cause: Unable to get the hostname for the given node/machine name.
// *Action: Check the node name and try again.
/
2007, INVALID_INST_NAME, "Invalid instance name: {0}"
//  *Cause: Unable to obtain the node name on which the instance name specified was running.
// *Action: Check the instance name specified and try again.
/
2008, INVALID_CONNSTR, "Invalid connect string: "
//  *Cause: The connect string specified was not in the format username/password [as {SYSDBA|SYSOPER}]
// *Action: Check the connect string and try again.
/
2009, INVALID_SETENVSTR, "Invalid name/value string: {0}"
//  *Cause: The name value string should be of the form name = value
// *Action: check the input name/value pair and try again.
/
2010, USAGE_VERB_ERROR, "Invalid command specified on command line: {0}"
//  *Cause: The <command> specified on the command line was not recognized.
// *Action: Valid commands are enable|disable|start|stop|relocate|status|add|remove|modify|getenv|setenv|unsetenv|config|monitor|unmonitor. Usage of srvctl is printed with this error. Check the usage and specify a valid command.
/
2011, USAGE_NOUN_ERROR, "Invalid object specified on command line: {0}"
//  *Cause: The <object> specified on the command line was not recognized.
// *Action: Valid objects are database|instance|service|nodeapps|vip|network|asm|diskgroup|listener|srvpool|scan|scan_listener|oc4j|qosmserver|home|filesystem|gns|cvu|havip|exportfs|volume|mgmtdb|mgmtlsnr|rhpserver|rhpclient|cha|host. Usage for the 'srvctl' command is displayed with this exception. Check the usage printed with this error and use a valid object.
/
2012, UNSUPPORTED_NOUN_SIHA, "{0} object is not supported in Oracle Restart"
//  *Cause: The <object> specified on the command line was not a valid object for the Oracle Restart mode.
// *Action: Valid objects for Oracle Restart mode are 
//          database|service|asm|diskgroup|listener|home|ons. SRVCTL 
//          usage is printed along with this exception. Check the usage 
//          printed with this error and use a valid object.
/
2013, UNSUPPORTED_NOUN_CLUSTERWARE, "{0} object is not supported in Oracle Clusterware"
//  *Cause: The <object> specified on the command line was not a valid object for the Oracle Clusterware mode.
// *Action: Valid objects for Oracle Clusterware are
//          database|instance|service|nodeapps|vip|network|asm|diskgroup|listener|
//          srvpool|scan|scan_listener|oc4j|qosmserver|home|filesystem|gns|cvu|havip|exportfs|volume|mgmtdb|mgmtlsnr. Srvctl usage 
//          is printed along with this exception. Check the usage printed with 
//          this error and use a valid object.
/
2014, MISSING_CONFIG_DB_PARAM, "The -all option must be specified with '-db <db_unique_name>' for 'srvctl config database' command"
//  *Cause: The '-all' option was specified without the required '-db' option specifying for which database to retrieve configuration.
// *Action: To retrieve the full configuration of the database, specify both '-db' and '-all' option with the command 'srvctl config database'.
/
2015, ERR_CHK_COND_INST, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
2016, DB_NO_SERVICES, "Database {0} has no services configured"
//  *Cause: 'srvctl config database' request found no services configured for the database.
// *Action: Use the command 'srvctl add service' to configure services for the database and then retry.
/
2017, SERV_NOT_EXIST, "Service {0} does not exist for database {1}."
//  *Cause: The service being updated was not defined for the given database.
//  *Action: Specify a service that is defined for the database, or create the service if appropriate.
/
2018, CONFIG_NO_DB, "No databases are configured"
//  *Cause: No databases were configured.
// *Action: Use the command 'srvctl add database' to configure databases.
/
2027, SRVPOOL_CONFIG_NOT_EXISTS, "Dummy message. Not used"
// *Document: NO 
//  *Cause: 
// *Action: 
/
2040, SCAN_LSNR_NOT_RUNNING, "SCAN listener {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2046, SCAN_LSNR_RUNNING, "SCAN listener {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2047, SCAN_LSNR_CONFIG, ""
// NOT TO BE REUSED
//  *Document: No
//  *Cause: 
// *Action:
/
2049, INVALID_NAME_VALUE_STR, "Invalid name-value string: {0}"
//  *Cause: The name=value string specified is not in valid format.
// *Action: The format for the string should be name=value. Check input and correct the error.
/
2050, ERR_CHK_ENABLE_ASM_NODE, "Error in enabling ASM instance on node {0}. {1}"
//  *Cause: ASM could not be enabled.
// *Action: Make sure that the node name is correct and that ASM exists on the specified node and it is not already enabled on the node. The current state of the ASM can be found using the command 'srvctl status asm'. To check if ASM is configured or not, use the command 'srvctl config asm'.
/
2051, ERR_CHK_CONFIG_ASM, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
2052, ERR_CHK_CONFIG_ASM_NODE, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
2053, ERR_CHK_DISABLE_ASM_NODE, "Error in disabling ASM instance on node {0}. {1}"
//  *Cause: ASM could not be disabled.
// *Action: Make sure that the node name is correct and that ASM exists on the specified node and it is not already disabled on the node. The current state of the ASM can be found using the command 'srvctl status asm'. To check if ASM is configured or not, use the command 'srvctl config asm'.
/
2054, INVALID_SYNTAX_OR_MAND, "Invalid command line syntax, mandatory options are either {0} or {1}, but not both."
//  *Cause: The command requires exactly one set of mandatory command line options. But either some options in one set were missing or the options from both sets were specified. 
// *Action: Check the command line options entered and make sure that all the mandatory options in one set are specified.
/
2055, NETWORK_EXIST, "Network exists: {0}, type {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2056, NETWORK_REMOVE_EXCEPTION, "Error occurred while checking dependent resources on network {0}. Network was not removed."
//  *Cause: An attempt to check if any resources are dependent on the given network failed.
// *Action: Make sure that the network is up. Make sure that the user has sufficient permission to remove network. If force flag was not specified in the remove command then specify force flag and try the command again.
/
2058, SCAN_NAME_CONFLICT_NODE, "Scan name {0} cannot be the same as a cluster node name: {1}"
//  *Cause: Scan name is same as a cluster node name.
// *Action: Choose a different scan name and issue the command.
/
2059, SCAN_VIP_ENABLED, "SCAN VIP {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2060, SCAN_VIP_DISABLED, "SCAN VIP {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2061, SCAN_VIP_RUNNING, "SCAN VIP {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2062, SCAN_VIP_NOT_RUNNING, "SCAN VIP {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2063, SCAN_LSNR_ENABLED, "SCAN Listener {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2064, SCAN_LSNR_DISABLED, "SCAN Listener {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2065, INVALID_SG_FOR_SI_DB, "Only one server pool should be provided for a single instance database on a cluster"
//  *Cause: An attempt to create a single instance database failed because more than one server pool was specified.
// *Action: Provide only one server pool while creating the single instance database.
/
2066, OC4J_STATUS_DISABLED, "OC4J is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2067, INVALID_SG_SIZE_FOR_SI_DB, "The size of server pool should be one for single instance database"
//  *Cause: An attempt to create a single instance database failed because a server pool with more than one server was specified.
// *Action: Provide a server pool with only one server while creating a single instance database.
/
2068, OC4J_ADDED, "OC4J successfully created"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2069, OC4J_ALREADY_EXISTS, "OC4J could not be created as it already exists"
//  *Cause: A new OC4J instance could not be created, as there is an existing instance of OC4J.
// *Action: Only one instance of OC4J can exists at any given time.
/
2070, OC4J_CREATION_FAILED, "OC4J creation failed"
//  *Cause: A new OC4J instance could not be added because of OC4J exception.
// *Action: Resolve the OC4J exception and then try the OC4J addition again.
/
2071, OC4J_CONFIG_EXISTS, "OC4J is configured to run on port number {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2072, OC4J_CONFIG_NOT_EXISTS, "OC4J is not configured"
//  *Cause: OC4J is not configured on the cluster. 
// *Action: Check the exception printed with this message. If OC4J is not configured then OC4J instance can be created using the command 'srvctl add oc4j'. If there are other errors shown with this error then check the cause/action messages of underlying exception.
/
2073, OC4J_REMOVE_SUCCESS, "OC4J removed successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2074, OC4J_STILL_RUNNING, "OC4J is still running. It must be stopped before removing."
//  *Cause: 'srvctl remove oc4j' command was issued while OC4J instance was running.
// *Action: Stop the oc4j instance using the command 'srvctl stop oc4j' and then try removing.
/
2075, OC4J_REMOVE_FAILED, "OC4J could not be removed"
//  *Cause: OC4J instance could not be removed because it does not exist.
// *Action: The current OC4J configuration can be checked using the command 'srvctl config oc4j'. Make sure that OC4J instance is running on that port. If there are other underlying messages printed then check the cause/action for the underlying errors shown with this.
/
2076, OC4J_MODIFY_PORT_SUCCESS, "OC4J modified to run on port {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2077, OC4J_MODIFY_PORT_FAILED, "OC4J RMI port could not be modified"
//  *Cause: An error occurred while trying to modify the OC4J Java Remote Method Invocation (RMI) port. 
// *Action: Examine the accompanying error messages for details.
/
2078, OC4J_START_SUCCESS, "OC4J has been started"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2079, OC4J_START_FAILED, "OC4J could not be started"
//  *Cause: The start of OC4J instance failed.
// *Action: Make sure that OC4J instance exists and is not already started. 
/
2080, OC4J_STOP_SUCCESS, "OC4J has been stopped"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2081, OC4J_STOP_FAILED, "OC4J failed to stop"
//  *Cause: The OC4J instance could not be stopped.
// *Action: Make sure that OC4J instance exists and are not already stopped.
/
2082, MISSING_MANDATORY_OPTION, "Missing mandatory option {0}" 
//  *Cause: The specified mandatory command option is missing. 
// *Action: Use srvctl with the -help option to display option details for the command and make sure that all the mandatory options are specified. 
/ 
2083, OC4J_NOT_RUNNING, "OC4J is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2084, OC4J_RUNNING_NODE, "OC4J is running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2085, OC4J_NOT_RUNNING_NODE, "OC4J is not running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2086, OC4J_ENABLED, "OC4J enabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2087, OC4J_NOT_ENABLED, "OC4J could not be enabled"
//  *Cause: OC4J instance could not be enabled.
// *Action: Make sure that node name is correct and that OC4J instance exists and is not already enabled. The current state of the OC4J instance can be found using the command 'srvctl status oc4j' command. To check if OC4J instance is configured or not use 'srvctl config oc4j' command.
/
2088, OC4J_ENABLED_NODE, "OC4J enabled successfully on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2089, OC4J_DISABLED, "OC4J disabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2090, OC4J_NOT_DISABLED, "OC4J could not be disabled"
//  *Cause: OC4J instance could not be disabled.
// *Action: Make sure that Node name is correct and that OC4J instance exists and is not already disabled. The current state of the OC4J instance can be found using the command 'srvctl status oc4j'. To check if OC4J instance is configured or not use the command 'srvctl config oc4j'.
/
2091, OC4J_DISABLED_NODE, "OC4J disabled successfully on node {0}"
//  *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2092, OC4J_RELOCATED, "OC4J relocated successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2093, OC4J_NOT_RELOCATED, "OC4J could not be relocated"
//  *Cause: OC4J instance could not be relocated to given node.
// *Action: If the node name was passed in the command line make sure that the node name is valid. Also make sure that 0C4J instance exists on the cluster and is running. 
/
2094, OC4J_RELOCATED_NODE, "OC4J relocated successfully to node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2095, SRVPOOL_CONFIG_NAME, "Server pool name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2096, SRVPOOL_CONFIG_NUMBERS, "Importance: {0}, Min: {1}, Max: {2}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2097, SRVPOOL_CANDIDATE_SERVERS, "Candidate server names: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2098, SRVPOOL_ACTIVE_SERVERS_COUNT, "Active servers count: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2099, SRVPOOL_ACTIVE_SERVERS, "Active server names: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2100, SERV_U_FAILED_CARD_DB, "Cannot update service {0} because database {1} is not administrator-managed"
//  *Cause: An attempt to update the service using '-update' option failed because this option can be used with administrator-managed databases only.
// *Action: Make sure that you provide correct options for the command 'srvctl add service'.
/
2101, SERV_DBINST_NOT_FOUND, "Failed to find database instances {0}"
//  *Cause: 
// *Action: 
/
2102, SG_FAILED_TO_CREATE, "Failed to create server pool {0}: {1}"
//  *Cause: An attempt to create the specified server pool failed because of the reason provided by the accompanying error.
// *Action: Examine the accompanying error messages for details.
/
2103, SERV_U_FAILED_AR, "The '-available' and '-preferred' options cannot both be supplied with '-update'"
//  *Cause: Command 'srvctl add service' with  '-update' option failed because both options '-available' and '-preferred' were provided.
// *Action: Reissue the command with the correct options.
/
2104, SERV_U_FAILED_NO_AR, "Option '-available' or '-preferred' must be supplied with '-update'"
//  *Cause: Command 'srvctl add service' with  option '-update' failed because it requires option '-available' or '-preferred' to be  provided.
// *Action: Reissue the command with the correct options.
/
2105, SERV_G_FAILED_BAD_OPTION, "Option '-serverpool' cannot be used with option '-preferred','-available' or '-tafpolicy'"
//  *Cause: A 'srvctl add service' command specified conflicting options.
// *Action: Reissue the command with the correct options.
/
2106, SERV_DB_HAS_NO_SG, "There is no server pool associated with database {0}"
//  *Cause: Command 'srvctl add service' failed because the given database doesn't have an associated server pool.
// *Action: Oracle internal error. Contact customer support.
/
2107, SERV_INST_NOT_FOUND, "Failed to find an instance {1} for database {0}"
//  *Cause: 
// *Action: 
/
2108, SERV_EXCL_I_N, "Command line options '-instance' and '-node' cannot be used together"
//  *Cause: Conflicting options were specified on a 'srvctl add service' command.
// *Action: Reissue the command with the correct options.
/
2109, RACONE_C_FAILED_EIW, "Options '-server', '-instance', or '-timeout' can only be supplied with option '-dbtype'"
//  *Cause: Incorrect usage of '-server', '-instance' and '-timeout' options.
// *Action: Reissue the command with the correct options.
/
2110, SERV_EXCL_C, "The '-cardinality' option is not supported on a 'add service' request for administrator-managed database {0}."
//  *Cause: An attempt to add a service for the indicated database using the '-cardinality' option was rejected because that option was not supported for administrator-managed databases.
// *Action: Reissue the command using the '-preferred' and '-available' options to specify service placement.
/
2111, INVALID_NUMBER_4_OPTION, "Invalid number {0} for command line option {1}"
//  *Cause: Invalid value was specified for the command line option that requires a number in a certain range.
// *Action: Check the value printed and specify a number within the required range.
/
2112, RACONE_CREATE_EXCL_XY, "Options '-node' and '-policy' were specified to create RAC One Node database {0}"
//  *Cause: Incorrect usage of '-node' and '-policy' options.
// *Action: Remove '-node' and '-policy' options and issue command again.
/
2113, SCAN_VIP_CONFIG, "SCAN {0} {1} VIP: {2}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2114, SCAN_CONFIG, "SCAN name: {0}, Network: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2115, OC4J_ALREADY_DISABLED, "OC4J is already disabled"
//  *Cause: OC4J instance could not be disabled because it is already disabled.
// *Action: None required.
/
2116, OC4J_ALREADY_ENABLED, "OC4J is already enabled"
//  *Cause: OC4J instance could not be enabled because it is already enabled.
// *Action: None required.
/
2117, RACONE_EXCL_G_E, "Options '-serverpool' and '-server' cannot be used together"
//  *Cause: Options '-serverpool' and '-server' were used incorrectly.
// *Action: Correct options and issue command again.
/
2118, RACONE_EXCL_G_I, "Options '-serverpool' and '-instance' were specified together"
//  *Cause: Incorrect usage of '-serverpool' and '-instance' options.
// *Action: Correct options and issue command again.
/
/ 2119 Unused
2119, RACONE_SRVPOOL_SIZE, ""
// *Document: NO
//  *Cause: 
// *Action: 
/
2120, RACONE_MODIFY_EXCL_XY, "Options '-node' and '-policy' cannot be used to modify RAC One Node database"
//  *Cause: Options '-node' and '-policy' were used incorrectly.
// *Action: Remove '-node' and '-policy' options and issue command again.
/
2121, NONRACONE_MODIFY_EXCL_EW, "Options '-server' and '-timeout' cannot be used to modify a database that is not RAC One Node"
//  *Cause: Options '-server' and '-timeout' were used incorrectly.
// *Action: Remove '-server' and '-timeout' options and issue command again.
/
2122, CONVERT_DB_EXCL, "Database type can only be 'RAC' or 'RACONENODE"
//  *Cause: Incorrect database type was specified for the command 'srvctl convert database'.
// *Action: Specify 'RAC' or 'RACONENODE' when running the command 'srvctl convert database'.
/
2123, OMOTION_TIMEOUT, "Online relocation timeout: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2124, INSTNAME_PREFIX, "Instance name prefix: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2125, CAND_SERVERS, "Candidate servers: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2126, OMOTION_DB_EXCL_NW_AR, "Options '-node', '-timeout' and '-stopoption' cannot be used with options '-abort' and '-revert'"
//  *Cause: Options '-node' or '-timeout' or '-stopoption' could not be used with '-abort' or '-revert'.
// *Action: Remove the options that are not required and issue the command again.
/
2127, RACONE_ADD_FAIL_NO_EG, "Either option '-server' or '-serverpool' must be supplied for adding RAC One Node database"
//  *Cause: Options '-server' and '-serverpool' were not specified when adding an Oracle RAC One Node database.
// *Action: Use the command 'srvctl add database' with either '-server' or '-serverpool' option.
/
2128, RACONE_ADD_SVC_UNIFORM_FAIL, "Specified cardinality {0} is not valid for policy-managed RAC One Node service {1}"
//  *Cause: Given cardinality was not applicable to an Oracle RAC One Node service.
// *Action: Use the 'srvctl add service' without the '-cardinality' option or specify SINGLETON value for the '-cardinality' option.
/
2129, INVALID_OMOTION_TIMEOUT, "Online relocation timeout value {0} is not within the range of {1} and {2}"
//  *Cause: Online relocation timeout value was not within the required range.
// *Action: Supply a value within the required range.
/
2130, RACONEDB_START_ADMIN_SERVER, "Supplied node {0} must be in the candidate list of the administrator-managed database {1}"
//  *Cause: The supplied node name was not in the candidate list of the administrator-managed database.
// *Action: Supply a node in the candidate list of the database and rerun the command 'srvctl start database'.
/
2131, RACONEDB_START_POLICY_SERVER, "Supplied node {0} must be in the server pool of the policy-managed database {1}"
//  *Cause: The supplied node name was not in the server pool of the policy-managed database.
// *Action: Supply a node from the server pool of the database and rerun the command 'srvctl start database'.
/
2132, SERV_ADD_BAD_RACONE_OPTS, "Options '-serverpool', '-preferred' and '-available' cannot be used to add services for RAC One Node database {0}"
//  *Cause: Failed to add specified service because provided options cannot be used to add a service for an Oracle RAC One Node database.
// *Action: Use the command 'srvctl add service' without options '-serverpool', '-preferred' or '-available'.
/
2133, SERV_MODIFY_BAD_RACONE_OPTS, "Options '-serverpool', '-preferred' and '-available' cannot be used to modify services for RAC One Node database {0}"
//  *Cause: Failed to modify specified service because provided options cannot be used to modify a service for an Oracle RAC One Node database.
// *Action: Use the command 'srvctl modify service' without options '-serverpool', '-preferred' or '-available'.
/
2134, ADD_INST_NOT_SUPPORTED_RACONE, "'srvctl add instance' command is not supported with RAC One Node databases"
//  *Cause: The specified database does not support 'srvctl add instance' command.
// *Action: Convert the Oracle RAC One Node database to an Oracle RAC database by using the command 'srvctl convert database' and then rerun using the command 'srvctl add instance'.
/
2135, REMOVE_INST_NOT_SUPPORTED_RACONE, "'srvctl remove instance' command is not supported with RAC One Node databases"
//  *Cause: The one instance of the Oracle RAC One Node database cannot be removed by using the command 'srvctl remove instance'.
// *Action: Run the command 'srvctl remove database'.
/
2136, INST_CMDS_NOT_SUPPORTED_RACONE, "'srvctl start/stop/enable/disable/status/setenv/getenv/unsetenv instance' commands are not supported with Oracle RAC One Node databases"
//  *Cause: The supplied instance command is not supported with an Oracle RAC One Node database.
// *Action: For an Oracle RAC One Node database, perform srvctl operations using the 'database' noun instead of the 'instance' noun.
/
2137, CONVERT_DB_BAD_POLICY_OPTS_N, "Option '-node' must not be supplied to convert policy-managed RAC One Node database to RAC database"
//  *Cause: Failed to convert database because provided option cannot be used to convert policy-managed Oracle RAC One Node database.
// *Action: Use the command 'srvctl convert database' without '-node' option.
/
2138, CONVERT_DB_NOT_RIGHT_TYPE, "Database {0} is not of RAC One Node database type"
//  *Cause: The supplied database was not an Oracle RAC One Node database.
// *Action: Run the command 'srvctl convert database' with database of type Oracle RAC One Node.
/
2139, DB_BAD_CAND_NODE, "Supplied nodes {0} should contain node {1} where database {1} is already running on"
//  *Cause: Supplied nodes did not include the node that the database was running on.
// *Action: Make sure given nodes include the node that the database is running on.
/
2140, ADD_SIDB_NO_X_OPT, "Option '-node' must be supplied when adding single instance database"
//  *Cause: Option '-node' was not supplied when adding single instance database.
// *Action: Supply '-node' option and issue command again.
/
2141, OMOTION_DB_R_FAILED_NO_A, "Option '-revert' requires option '-abort'"
//  *Cause: Command 'srvctl relocate database' with  option '-revert' failed because it requires option '-abort' to be  provided.
// *Action: Correct options and issue command again.
/
2142, START_FAILED_OMOTION_ACTIVE, "Cannot start RAC One Node database when an online relocation request for the database is already active"
//  *Cause: Unable to start the supplied Oracle RAC One Node database because it already has an active online relocation request.
// *Action: Specify another database to start.
/
2143, STOP_FAILED_OMOTION_ACTIVE, "Cannot stop RAC One Node database when an online relocation request for the database is already active"
//  *Cause: Unable to stop the supplied Oracle RAC One Node database because it already has an active online relocation request.
// *Action: Either wait for the online relocation request to complete or specify another database to stop.
/
2144, MODIFY_POLICY_DB_OPT_E, "Option '-server' cannot be used with RAC One Node policy-managed database {0}"
//  *Cause: The '-server' option was specified to modify the candidate server list for an Oracle RAC One Node policy-managed database.
// *Action: Either use the command 'srvctl modify srvpool' to modify the candidate server list or specify '-serverpool' option  with the command 'srvctl modify database' to modify the server pool.
/
2145, REMOVE_INST_NOT_SUPPORTED_SINGLE, "'srvctl remove instance' command is not supported with single instance databases"
//  *Cause: The single instance database cannot be removed by the 'srvctl remove instance' command.
// *Action: Run the command 'srvctl remove database'.
/
2147, NONRACONE_TYPE_EXCL_OPT, "A 'srvctl add database' command specified the '-server', '-instance' or '-timeout' option for a database that is not Oracle RAC One Node"
//  *Cause: A 'srvctl add database' command was issued that included either the  '-server', '-instance', or '-timeout' option but did not include a '-dbtype' option specifying that the database being added was Oracle RAC One Node.  These options are permitted only for  Oracle RAC One Node databases.
// *Action: Either remove the '-server', '-instance' or '-timeout' option or specify the '-dbtype' option with type Oracle RAC One Node.
/
2148, OMOTION_ADMIN_FAILED_NO_N, "Option '-node' must be supplied when running 'srvctl relocate database' for administrator-managed RAC One Node database"
//  *Cause: Option '-node' was not specified when executing relocate on administrator-managed Oracle RAC One Node database.
// *Action: Use the command 'srvctl relocate database' with '-node' option.
/
2149, RAC_MODIFY_DB_I, "A 'srvctl modify database' command specified  the '-instance' option for a RAC database"
//  *Cause: Option '-instance' in "srvctl modify database" command can be used to modify the instance name of a single instance database or instance name prefix of a Oracle RAC One Node database.
// *Action: Try 'srvctl modify instance' command to modify the instance name of the Oracle RAC database.
/
2150, OMOTION_OUTPUT, "Online relocation: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2154, OMOTION_SOURCE_INST, "Source instance: {0} on {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2155, OMOTION_DEST_INST, "Destination instance: {0} on {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2156, RACONE_INVALID_INST, "Instance name {0} is not valid"
//  *Cause: The supplied instance name is not the correct format for Oracle RAC One Node database.
// *Action: Make sure that the instance name is of the format <instance_name_prefix>_1 or <instance_name_prefix>_2. Use the command 'crsctl modify resource' to correct the instance name.
/
2157, CONVERT_DB_BAD_POLICY_OPTS_I, "Option '-instance' must not specified to convert policy-managed RAC database to RAC One Node database"
//  *Cause: Failed to convert database because the provided option can not be used to convert policy-managed Oracle RAC database to an Oracle RAC One Node database.
// *Action: Use the command 'srvctl convert database' without '-instance' option.
/
2158, CONVERT_RAC2RACONE_BAD_OPTS_N, "Option '-node' must not be specified to convert a RAC database to RAC One Node database"
//  *Cause: Failed to convert database because the provided option '-node' should not be supplied to convert an Oracle RAC database to an Oracle RAC One Node database.
// *Action: Use the command 'srvctl convert database' without '-node' option.
/
2159, CONVERT_RAC2RACONE_ADMIN_NO_OPTS_I, "Option '-instance' must be specified to convert an administrator-managed RAC database to its equivalent RAC One Node database configuration"
//  *Cause: Failed to convert database because the option '-instance' was not specified to convert administrator-managed Oracle RAC database to its equivalent Oracle RAC One Node database configuration.
// *Action: Use the command 'srvctl convert database' with '-instance' option.
/
2160, CONVERT_RACONE2RAC_BAD_OPTS_W, "Option '-timeout' must not be specified to convert a RAC One Node database to its equivalent RAC database configuration"
//  *Cause: Failed to convert database because option '-timeout' was specified to convert an Oracle RAC One Node database to its equivalent Oracle RAC database configuration.
// *Action: Use the command 'srvctl convert database' without '-timeout' option.
/
2161, INST_DISABLED, "Instance is disabled: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2162, SERV_NOT_ON_INST, "Service {0} is not supported on instance {1}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error: 
/
2163, SERV_AVAIL_LIST_EMPTY, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
2164, ERR_CHK_COND_SERV, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
2165, ERR_CHK_COND_VIP, "VIP does not exist on node(s) : {0}"
//  *Cause: VIP was not configured on the nodes.
// *Action: Add VIP using the command 'srvctl add nodeapps' or 'srvctl add vip' and try this command again.
/
2166, ERR_CHK_COND_GSD, "GSD does not exist on node(s): {0}"
//  *Cause: GSD was not configured on the nodes
// *Action: Add GSD using the command 'srvctl add nodeapps' and try this command again.
/
2167, ERR_CHK_COND_VIP_VIPNAME, "VIP {0} does not exist."
//  *Cause: VIP with the specified name was not configured.
// *Action: Add VIP using the command 'srvctl add nodeapps' or 'srvctl add vip' and try this command again.
/
2168, NODEAPPS_STILL_RUN, "Node applications are still running on node: "
//  *Cause: Node applications are still running on node when a remove was attempted.
// *Action: Stop the node applications before removing them or use force flag when attempting removal.
/
2172, NODEAPPS_REMOVE_FAIL, "Some or all node applications are not removed successfully on node: "
//  *Cause: Not all node applications were removed on the node.
// *Action: Make sure that all resources that depend on node applications are stopped before attempting to remove node applications. Also if force flag was not specified, reissue this command with the force flag specified.
/
2173, INST_ALREADY_PREF, "Instance {0} is already a preferred instance for service {1}."
//  *Cause: Given instance is already a preferred instance for the service.
// *Action: Specify an instance other than the preferred instances of this service.
/
2174, INST_ALREADY_AVAIL, "Instance {0} is already an available instance for service {1}."
//  *Cause: Given instance is already an available instance for the service.
// *Action: Specify an instance other than the available instances of this service.
/
2175, RM_LAST_RAC1SVC_FAILED, "Failed to remove service {0} because this is the last service of RAC One Node database {1}"
//  *Cause: An attempt was made to remove the last service of an Oracle RAC One Node
database. A Oracle RAC One Node database must have at least one service.
// *Action: Add another service, for example by using the command 'srvctl add service', before removing the given service. Otherwise, if you are trying to deconfigure database, then remove the database directly, for example by using the command 'srvctl remove database'.
/
2176, ERR_CHK_COND_ONS, "ONS daemon does not exist on node(s): {0}"
//  *Cause: ONS was not configured on the nodes.
// *Action: Add ONS using the command 'srvctl add nodeapps' and try this command again.
/
2182, ERR_CHK_COND_EONS, "eONS daemon does not exist on node(s): {0}"
//  *Cause: eONS was not configured on the nodes.
// *Action: Add eONS using the command 'srvctl add nodeapps' and try this command again.
/
2183, NODEAPPS_MODIFY_VIP_NETMASK_NOT_SAME, "Node applications run on default network only. The netmask given {0} doesn't match default networks netmask {1}"
//  *Cause: The netmask given in the modify command doesn't match with default network's netmask.
// *Action: Modify the default network first using the command 'srvctl modify nodeapps -subnet <options>' and then try modifying the VIP.
/
2184, NODEAPPS_MODIFY_VIP_INTERFACE_NOT_SAME, "Node applications run on default network only. The interface given {0} doesn't match default networks interface {1}"
//  *Cause: The interface specified in the modify command doesn't match with default network's interface.
// *Action: Modify the default network's interface using the command 'srvctl modify nodeapps -subnet <options>' and then try modifying the VIP.
/
2185, NODEAPPS_MODIFY_VIP_NOTHING_TO_MODIFY, "The new VIP address given is same as the current VIP address"
//  *Cause: The VIP address given for modification is same as the current VIP. So there is nothing to modify.
// *Action: Check the VIP address you want to modify and specify the correct value.
/
2186, NODEAPPS_MODIFY_ONS_HOSTPORT_LIST_ERROR, "The command line parameter host port list should be in the form <host>[:<port>][,<host>:[<port>]...]"
//  *Cause: The command line parameter -remoteservers <host_port_list> was not in the format <host>[:<port>][,<host>:[<port>]...]  with port being numeric.
// *Action: Check the input and correct any error and try the command again.
/
2187, SUBNET_MODIFY_SUCCESSFUL, "The network resource has been modified successfully. VIP and other resources that depend on it might not start up unless they are modified"
//  *Cause: When underlying network resource has been modified the VIP should be updated to the new network resource. This is not a error and is just a status message.
// *Action: Use the command 'srvctl modify nodeapps -address <options>' to update the VIP to the new network.
/
2188, ALL_NODEAPPS_ALREADY_EXISTS, "All the node applications already exist. They were not recreated."
//  *Cause: The command 'srvctl add nodeapps' was attempted when all the node applications already existed.
// *Action: If you want to modify node applications you should use the command 'srvctl modify nodeapps'.
/
2189, NODEAPPS_MODIFY_SUCCESS, "The node applications were successfully modified."
//  *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2190, VIP_ALREADY_EXISTS, "VIP exists for node {0}, VIP name {1}"
//  *Cause: The VIP being added already exists.
// *Action: Check the input and if VIP needs to be modified use 'srvctl modify VIP' command.
/
2191, VIP_MODIFY_SUCCESS, "The VIP resource was successfully modified."
//  *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2192, SCAN_CONFIG_SUBNET_IPV4, "Subnet IPv4: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2193, SCAN_CONFIG_SUBNET_IPV6, "Subnet IPv6: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2199, INVALID_ADDR_STR, "Invalid address string: "
//  *Cause: VIP address being passed on the command line is not a valid address string.
// *Action: Address string should be of the format {<name>|<ip>}/<netmask>/[if1[|if2...]]. Check the usage and correct the address format.
/
2200, INVALID_INTERFACE_STR, "Invalid interface specified on command line: {0}"
//  *Cause: VIP address specification '-address {<name>|<ip>}/<netmask>[/if1[|if2|...]]' or the network address specification '-subnet <subnet>/<netmask>[/if1[|if2|...]]'  on the command line contained interfaces names, none of which exist on current node.
// *Action: Check the interfaces listed in the address string and make sure that they are enabled and are up. Use network interface names on the command line if there is more than one interfaces that connect to the same network.
/
2201, VERSION, "srvctl version: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2202, INST_RUN, "Instance {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2204, INST_NOT_RUN, "Instance {0} is not running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2205, LSNR_NOT_RUN, "Listener {0} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2206, ASM_HOME, "ASM home: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2207, DEPRECATED_OPTION, "Warning:-{0} option has been deprecated and will be ignored."
//  *Cause: Deprecated option has been used in the command line. The option will be ignored.
// *Action: Check the documentation for the new syntax of the command.
/
2208, DEPRECATED_COMMAND, "{0} command has been deprecated and will be ignored."
//  *Cause: The command being executed has been deprecated and will not do any action.
// *Action: Check the documentation for the commands supported by srvctl.
/
2209, UNSUPP_SRV_CENTRIC_CMD, "{0} command is not supported for configuration using server pool."
//  *Cause: The given command failed because it isn't applicable to instances of policy managed-databases.
// *Action: Check the documentation on the commands that are applicable to policy-managed databases.
/
2210, ASM_LSNR, "ASM listener: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2211, ASM_LSNR_NOT_FOUND, "ASM listener was not found"
//  *Cause: ASM listener does not exist.
// *Action: Use the command 'srvctl modify asm -listener <lsnr_name>' to set the listener that ASM should register with.
/
2212, PROMPT_MODIFY_DB, "The management policy of services {0} will be modified to MANUAL. Modify the management policy of the database {1}?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2213, CANCEL_MODIFY_DB, "Modification of the database's management policy will be cancelled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2214, NO_SERVER_FOR_SI_DB, "Specified server pool {0} cannot be used to host single instance database {1}"
//  *Cause: An attempt to create a single instance database failed because the specified server pool had no configured candidate server.
// *Action: Use the command 'srvctl modify srvpool' with '-servers' option to configure a candidate server for the server pool. Make sure that the candidate server name specified with the '-servers' option matches that of the '-node' option in the command 'srvctl add database'.
/
2215, TOO_MANY_SERVERS_FOR_SI_DB, "Specified server pool {0} has more than one candidate server"
//  *Cause: An attempt to create a single instance database failed because a server pool with more than one candidate server was specified.
// *Action: Provide a server pool with only one candidate server when creating a single instance database.
/
2301, SERV_RUN, "Service {0} is running on instance(s) {1}"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2302, SERV_NOT_RUN, "Service {0} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2303, VIP_RUN, "VIP is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2304, VIP_NOT_RUN, "VIP is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2305, GSD_RUN, "GSD is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2306, GSD_NOT_RUN, "GSD is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2309, VIP_EXIST, "VIP exists: network number {0}, hosting node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2310, VIP_NOT_EXIST, "VIP does not exist on node {0}."
//  *Cause: VIP was not configured on that node on which modification was attempted. 
// *Action: VIP must be added using the command 'srvctl add nodeapps', before it can be modified.
/
2311, GSD_EXIST, "GSD exists"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2312, GSD_NOT_EXIST, "GSD does not exist."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2313, VIP_VIPNAME_NOT_EXIST, "A VIP named {0} does not exist."
//  *Cause: An attempt was made to operate on a VIP with the specified VIP name. No such VIP was configured on the cluster.
// *Action: Check the status of VIPs using the command 'srvctl status vip'. VIP must be added using the command 'srvctl add vip' before any operation on it. 
/
2317, INST_RUN_WITH_SERV, "Instance {0} is running on node {1} with online services {2}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2318, TARGET_INST_FOR_SERV, "Target instance {0} already supports service {1}."
//  *Cause: Given database instance already provides the given service. 
// *Action: Specify an instance that is not a preferred or available instance for this service.
/
2320, PROMPT_REMOVE_DB, "Remove the database {0}?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2323, CANNCEL_RM_DB, "Database removal cancelled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2324, CANNCEL_RM_INST, "Instance removal cancelled."
// *Document: No
//  *Cause: Status Message
// *Action: Not an error
/
2326, SERV_DISABLED, "Service {0} is disabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2327, PROMPT_REMOVE_NA_CLUSTER, "Please confirm that you intend to remove node-level applications on all nodes of the cluster"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2328, PROMPT_REMOVE_NA, "Please confirm that you intend to remove node-level applications on node {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2329, CANNCEL_RM_NA, "Node-level applications on node {0} are not removed."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2330, ONS_EXIST, "ONS exists: Local port {0}, remote port {1}, EM port {2}, Uses SSL {3}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2331, ONS_NOT_EXIST, "ONS daemon does not exist."
//  *Cause: ONS daemon was not configured on this cluster.
// *Action: ONS daemon can be configured using the 'srvctl add nodeapps' command.
/
2332, ONS_RUN, "ONS daemon is running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2333, ONS_NOT_RUN, "ONS daemon is not running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2334, ASM_RUN, "ASM instance {0} is running on node {1}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2335, ASM_NOT_RUN, "ASM instance {0} is not running on node {1}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2336, ASM_DISABLED_NODE, "ASM is disabled on node {0}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2337, PROMPT_REMOVE_SERV_INST, "Remove service {0} from the instance {1}?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
2338, EONS_EXIST, "eONS daemon exists. Multicast port {0}, multicast IP address {1}, listening port {2}" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2339, EONS_NOT_EXIST, "eONS daemon does not exist."
//  *Cause: eONS daemon was not configured on this cluster.
// *Action: eONS daemon can be configured using the command 'srvctl add nodeapps'.
/
2340, EONS_RUN, "eONS daemon is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2341, EONS_NOT_RUN, "eONS daemon is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2342, VIP_ENV_LIST, "VIP environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2343, GSD_ENV_LIST, "GSD environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2344, ONS_ENV_LIST, "ONS environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2345, EONS_ENV_LIST, "eONS environment variables:"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2346, PROMPT_REMOVE_SCAN, "Remove the scan?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2347, PROMPT_REMOVE_SCAN_LSNR, "Remove scan listener?"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2348, PROMPT_REMOVE_SCAN_NO, " Remove scan cancelled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2349, PROMPT_REMOVE_SCAN_LSNR_NO, "Remove scan listener cancelled"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2351, ASM_ENABLED, "ASM is enabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2352, ASM_DISABLED, "ASM is disabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2353, ASM_ENABLED_NODE, "ASM is enabled on node {0}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2355, ASM_RUNNING, "ASM is running."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2356, ASM_NOT_RUNNING, "ASM is not running."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2357, ASM_RUNNING_NODE, "ASM is running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2358, ASM_NOT_RUNNING_NODE, "ASM is not running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2359, ASM_SPFILE_OR_PARA, "ASM spfile/parameters: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2360, LSNR_ENABLED, "Listener {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2361, LSNR_DISABLED, "Listener {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2362, VIP_RUNNING, "VIP {0} is running on node: {1}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2363, VIP_NOT_RUNNING, "VIP {0} is not running"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2364, NETWORK_RUN, "Network is running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2365, NETWORK_NOT_RUN, "Network is not running on node: "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2366, GSD_RES_ENABLED_SUCC, "GSD is enabled successfully on node(s): {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2367, GSD_RES_DISABLED_SUCC, "GSD is disabled successfully on node(s): {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2372, NODEAPPS_ADD_SUCC, "Successfully added node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2373, NODEAPPS_REMOVE_SUCC, "Successfully removed node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2374, NODEAPPS_START_SUCC, "Successfully started node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2375, NODEAPPS_STOP_SUCC, "Successfully stopped node applications. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2376, ONLY_VIP_REMOVED_SUCC, "Successfully removed VIP from the node(s). All other node applications will be removed when node applications are removed on last node."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2377, LOCAL_PORT_NOTHING_TO_MODIFY, "eONS already uses {0} as listening port. Nothing to modify."
//  *Cause: The listening port specified in this command is already in use by eONS.
// *Action: Check the input and if the listening port needs to be changed then specify a different port.
/
2378, PROMPT_REMOVE_VIP, "Please confirm that you intend to remove the VIPs {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2379, CANNCEL_RM_VIP, "VIPs {0} are not removed."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2380, VIP_STILL_RUN, "VIP {0} is still running on node: {1}"
//  *Cause: VIP to be removed is still running on a node.
// *Action: Stop the VIP before attempting to remove it or retry the command with force flag.
/
2381, VIP_REMOVE_FAIL, "VIP {0} is not removed successfully:  "
//  *Cause: VIP remove action failed because VIP was running and force flag was not specified  or an exception occurred  during the removal.
// *Action: Make sure that any applications, like for example listener, that depend on VIP are down. Try using -force option to remove the VIP. If you use force option to remove VIP then any application that depends on this VIP will stop working. Look at the help message for the accompanying exception.
/
2382, VIP_REMOVE_SUCC, "Successfully removed VIP {0}. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2383, NETWORK_REMOVE_FAIL, "Network {0} is not removed successfully: "
//  *Cause: Since there were no VIPs hosted on the network an attempt was made to remove the network and network removal failed.
// *Action: Make sure that all other applications that depend on default network are stopped. If force flag was not specified then specify force flag and try the command again. 
/
2384, NETWORK_REMOVE_SUCC, "Successfully removed network {0}. "
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2385, UNKNOWN_HOST, "The specified hostname or address {0} cannot be resolved."
//  *Cause: An invalid IP address or irresolvable hostname was specified.
// *Action: If IP address is specified then make sure that it is of legal length. If a host name is specified then make sure that the host name resolves to an IP address.
/
2386, NETMASK_MISSING_VIP_ADDR, "Netmask is missing in address string: "
//  *Cause: NETMASK is missing in the VIP address that was passed in the command string.
// *Action: VIP address is of form <ip_or_name>/<netmask>[/<interface1>[|<interface2>...]]. Specify the netmask.
/
2387, NODEAPPS_NODE_NAME_DEPRECATED, "-node <node_name> option has been deprecated."
//  *Cause: '-node <node_name>' option has been deprecated in this release.
// *Action: Remove the usage of '-node <node_name>' option in the command.
/
2388, VALUED_OPTION_VALUE_MISSING, "Command line option {0} should be followed by a value."
//  *Cause: The value needs to be specified by the command line option.
// *Action: Look at the usage and of the command and specify an appropriate value.
/
2389, NODEAPPS_INVALID_OPTION_COMBINATION, "Invalid command line options. Neither -address nor -node can be specified with -subnet."
//  *Cause: Invalid combination of options specified for add/modify node application command. Option '-address' is node-specific and has to be used with '-node' option. '-subnet' option is a global option and it cannot be used with '-address' or '-node' option.
// *Action: Issue the command using either '-address' and '-node' options together or '-subnet' option without '-address' or '-node' option.
/
2390, NODEAPPS_NODE_NAME_DEPRECATED_IGNORED, "-node <node_name> option has been deprecated and is ignored."
//  *Cause: '-node <node_name>' option has been deprecated and is ignored from this release. It has no effect on the command.
// *Action: Remove the usage of '-node <node_name>' from the command line.
/
2391, NETWORK_NOTHING_TO_MODIFY, "Network resource {0},{1} already exists. Nothing to modify"
//  *Cause: The subnet specified is already the default subnet.
// *Action: Check the input and if the subnet needs to be modified then specify a different subnet.
/
2392, MULTICAST_NOTHING_TO_MODIFY, "eONS already uses {0} as Multicast address. Nothing to modify."
//  *Cause: The Multicast address specified in this command is already in use by eONS. 
// *Action: Check the input and if the Multicast address needs to be changed then specify a different address.
/
2393, MULTICAST_PORT_NOTHING_TO_MODIFY, "eONS already uses {0} as Multicast port. Nothing to modify."
//  *Cause: The Multicast port specified in this command is already in use by eONS.
// *Action: Check the input and if the Multicast port needs to be changed then specify a different port.
/
2394, ONS_LOCAL_PORT_NOTHING_TO_MODIFY, "ONS already uses {0} as port for local connections. Nothing to modify."
//  *Cause: The modify node applications command failed because the ONS port for local connections is already used by ONS for local connections.
// *Action: Check the input and if the port used by ONS for local connections need to be modified specify a different address.
/
2395, ONS_REMOTE_PORT_NOTHING_TO_MODIFY, "ONS already uses {0} as port for remote connections. Nothing to modify."
//  *Cause: The modify node applications command failed because the ONS port for remote connections is already used by ONS for remote connections.
// *Action: Check the input and if the port used by ONS for remote connections need to be modified specify a different address.
/
2396, ONS_REMOTE_HOSTPORT_NOTHING_TO_MODIFY, "The list of remote host/port ONS pairs matches the current list : {0}. Nothing to modify."
//  *Cause: The modify node applications command failed because the remote host/port ONS pairs matches the current list.
// *Action: Check the input and if the remote host/port pairs need to be modified and specify a different host/port list.
/
2397, VIP_RES_ENABLED_SUCC, "VIP is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2398, NET_RES_ENABLED_SUCC, "Network is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2399, ONS_RES_ENABLED_SUCC, "ONS is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2400, EONS_RES_ENABLED_SUCC, "eONS is enabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2401, VIP_RES_DISABLED_SUCC, "VIP is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2402, NET_RES_DISABLED_SUCC, "Network is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2403, ONS_RES_DISABLED_SUCC, "ONS is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2404, EONS_RES_DISABLED_SUCC, "eONS is disabled successfully on node(s): {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2405, ERR_CHK_COND_NET, "Network resource does not exist on the cluster nodes."
//  *Cause: Network resource does not exist on the cluster nodes.
// *Action: Node applications can be added by using the command 'srvctl add nodeapps'.
/
2406, VIP_START_SUCC, "Successfully started VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2407, VIP_ADD_SUCC, "Successfully added VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2408, VIP_DISABLED_SUCC, "Successfully disabled VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2409, GSD_RES_ALREADY_DISABLED, "GSD is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because GSD was already disabled.
// *Action: None required.
/
2410, VIP_RES_ALREADY_DISABLED, "VIP is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because VIP was already disabled.
// *Action: None required. 
/
2411, NET_RES_ALREADY_DISABLED, "Network resource is already disabled."
//  *Cause: The disable node applications command failed because Network resource was already disabled.
// *Action: None required.
/
2412, ONS_RES_ALREADY_DISABLED, "ONS is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because ONS was already disabled.
// *Action: None required.
/
2413, EONS_RES_ALREADY_DISABLED, "eONS is already disabled on node(s): {0}"
//  *Cause: The disable node applications command failed because eONS was already disabled.
// *Action: None required.
/
2414, GSD_RES_ALREADY_ENABLED, "GSD is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because GSD is already enabled.
// *Action: None required.
/
2415, VIP_RES_ALREADY_ENABLED, "VIP is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because VIP is already enabled.
// *Action: None required.
/
2416, NET_RES_ALREADY_ENABLED, "Network resource is already enabled."
//  *Cause: The enable node applications command failed because Network resource is already enabled.
// *Action: None required. 
/
2417, ONS_RES_ALREADY_ENABLED, "ONS is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because ONS is already enabled.
// *Action: None required.
/
2418, EONS_RES_ALREADY_ENABLED, "eONS is already enabled on node(s): {0}"
//  *Cause: The enable node applications command failed because eONS is already enabled.
// *Action: None required.
/
2419, GSD_RES_ALREADY_STARTED, "GSD is already started on node(s): {0}"
//  *Cause: The start node applications command failed because GSD is already started.
// *Action: None required.
/
2420, VIP_RES_ALREADY_STARTED, "VIP {0} is already started on nodes: {1}"
//  *Cause: The start node applications command failed because VIP was already started.
// *Action: None required.
/
2421, NET_RES_ALREADY_STARTED, "Network resource is already started on node(s): {0}"
//  *Cause: The start node applications command failed because Network resource is already started.
// *Action: None required.
/
2422, ONS_RES_ALREADY_STARTED, "ONS is already started on node(s): {0}"
//  *Cause: The start node applications command failed because ONS is already started.
// *Action: None required. 
/
2423, EONS_RES_ALREADY_STARTED, "eONS is already started on node(s): {0}"
//  *Cause: The start node applications command failed because eONS is already started.
// *Action: None required.
/
2424, GSD_RES_ALREADY_STOPPED, "GSD is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because GSD is already stopped.
// *Action: None required.
/
2425, VIP_RES_ALREADY_STOPPED, "VIP is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because VIP is already stopped.
// *Action: None required.
/
2426, ONS_RES_ALREADY_STOPPED, "ONS is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because ONS is already stopped.
// *Action: None required.
/
2427, EONS_RES_ALREADY_STOPPED, "eONS is already stopped on node(s): {0}"
//  *Cause: The stop node applications command failed because eONS is already stopped.
// *Action: None required.
/
2428, VIP_ALREADY_RUNNING, "VIP is running on the node {0} and cannot be modified."
//  *Cause: Modify nodeapps command failed because VIP being modified is running on a node.
// *Action: Stop the node application by issuing the command 'srvctl stop nodeapps' and retry the modify again.
/
2429, MISSING_MODIFY_VIP_PARAM, "-node <node_name> should be specified with -address {<name>|<ip>}/netmask[/if1[|if2]] for modifying VIP."
//  *Cause: If '-node <node_name>' option is specified then '-address' option must also be specified for modifying VIP.
// *Action: If you want to modify the VIP then specify both the '-node' and '-address' options. Otherwise remove the '-node <node_name>' option.
/
2430, MISSING_NODE_NAME_IN_MODIFY_VIP, "Missing required '-node' option for 'srvctl modify nodeapps -address' VIP modification."
//  *Cause: '-address <options>' was specified for the 'modify nodeapps' command without specifying which node VIP needs to be modified.
// *Action: Specify the node whose VIP needs to be modified by using '-node' option.
/
2431, NODEAPPS_NODE_NAME_LIST_DEPRECATED, "Warning: the -node option is obsolescent; 'srvctl remove vip' is preferred for removing per-node VIP resource"
//  *Cause: The command 'srvctl remove nodeapps' was issued with the '-node' option specifying one or more nodes. Support for this option will be removed in a future release, at which time you must use the preferred command 'srvctl remove vip -vip <vip_list>'.
// *Action: The command is processed normally and attempts to remove VIP resources for the specified node(s). This message is displayed only to alert you to a future change. Use the command 'srvctl remove nodeapps' to remove all node applications from the last node of the cluster.
/
2432, VIP_ENABLED_SUCC, "VIP was enabled successfully"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2433, NODEAPPS_SETENV_SUCC, "Successfully set environment for node applications."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2434, VIP_SETENV_SUCC, "Successfully set environment for VIP."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2435, VIP_STOP_SUCC, "Successfully stopped VIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2436, NODEAPPS_UNSETENV_SUCC, "Successfully unset environment for  node applications."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2437, VIP_UNSETENV_SUCC, "Successfully unset environment for VIP."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2438, NETWORK_NOT_EXIST, "Network resource does not exist."
//  *Cause: Network resource to be started/stopped/modified/enabled/disabled does not exist.
// *Action: Network resource can be created using the command 'srvctl add nodeapps'.
/
2439, VIP_RES_NOT_EXIST, "VIP does not exist."
//  *Cause: VIP to be started/stopped/modified/enabled/disabled does not exist.
// *Action: VIP can be created using the command 'srvctl add nodeapps'.
/
2440, NETWORK_RES_ALREADY_STOPPED, "Network resource is already stopped."
//  *Cause: The stop node applications command failed because network resource was already stopped.
// *Action: None required.
/
2450, SIHA_ONS_CREATION_SUCCESS, "Successfully created ONS. It was disabled after creation. ONS needs to be enabled before it can be started."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2451, SIHA_EONS_CREATION_SUCCESS, "Successfully created eONS. It was disabled after creation. eONS needs to be enabled before it can be started."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2452, SIHA_ONS_ALREADY_EXISTS, "ONS already exists"
//  *Cause: A new instance of ONS daemon could not be created, as there is an existing instance of ONS. 
// *Action: None required.
/
2453, SIHA_EONS_ALREADY_EXISTS, "eONS already exists"
//  *Cause: A new instance of eONS daemon could not be created, as there is an existing instance of eONS.
// *Action: None required.
/
2454, SIHA_ONS_ENABLED, "ONS is enabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2455, SIHA_ONS_DISABLED, "ONS is disabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2456, SIHA_ONS_RUN, "ONS daemon is running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2457, SIHA_ONS_NOT_RUN, "ONS daemon is not running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2458, ERR_CHK_COND_SIHA_ONS, "ONS does not exist"
//  *Cause: ONS daemon was not configured on this instance of Oracle Restart.
// *Action: Add ONS daemon using the command 'srvctl add ons' and try this command again.
/
2459, SIHA_EONS_ENABLED, "eONS is enabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2460, SIHA_EONS_DISABLED, "eONS is disabled"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2461, SIHA_EONS_RUN, "eONS daemon is running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2462, SIHA_EONS_NOT_RUN, "eONS daemon is not running"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2463, ERR_CHK_COND_SIHA_EONS, "eONS does not exist"
//  *Cause: eONS daemon was not configured on this instance of Oracle Restart.
// *Action: Add eONS daemon using the command 'srvctl add eons' and try this command again.
/
2464, SIHA_ONS_EXIST, "ONS exists: Local port {0}, remote port {1}, EM port {2}, Uses SSL: {3}"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2465, SIHA_ONS_NOT_EXIST, "ONS does not exist."
//  *Cause: ONS daemon was not configured on this instance of Oracle Restart.
// *Action: ONS daemon can be configured using the command 'srvctl add ons'.
/
2466, ADDRESS_CANNOT_COEXIST_WITH_ADDR_TYPE_IN_MODIFY_VIP, "Both '-address' and '-iptype' options cannot be specified when modifying VIP"
//  *Cause: Both '-address' and '-iptype' options were specified in the modify VIP command.
// *Action: Specify either '-address' or '-iptype' but not both in the modify VIP command.
/
2467, ADMHELPER_NOT_EXIST, "adminhelper does not exist"
//  *Cause: adminhelper was not configured on this cluster.
// *Action: Configure the adminhelper with the 'srvctl add rhpserver' or 'srvctl add rhpclient' command.
/
2468, ADMHELPER_ALREADY_STARTED, "adminhelper is already started on nodes: {0}" 
//  *Cause: The adminhelper start command failed because adminhelper is already started.
// *Action: None required.
/
/
2469, ADMHELPER_ALREADY_STOPPED, "adminhelper is already stopped on nodes: {0}"
//  *Cause: The  command to stop adminhelper failed because adminehelper is already stopped.
// *Action: None required.
/
2470, ADMHELPER_ALREADY_ENABLED, "adminhelper is already enabled on nodes: {0}"
//  *Cause: The adminhelper enable command failed because adminhelper is already enabled.
// *Action: None required.
/
2471, ADMHELPER_ALREADY_DISABLED, "adminhelper is already disabled on nodes: {0}"
//  *Cause: The adminhelper disable command failed because adminhelper is already enabled.
// *Action: None required.
/
2472, ADMHELPER_EXIST, "adminhelper exists"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2473, ADMHELPER_ENABLED, "adminhelper is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2474, ADMHELPER_DISABLED, "adminhelper is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2475, ADMHELPER_RUN, "adminhelper is running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2476, ADMHELPER_NOT_RUN, "adminhelper is not running on node: "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2566, SIHA_EONS_EXIST, "eONS daemon exists. Multicast port {0}, multicast IP address {1}, listening port {2}"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2567, SIHA_EONS_NOT_EXIST, "eONS daemon does not exist."
//  *Cause: eONS daemon was not configured on this instance of Oracle Restart.
// *Action: eONS daemon can be configured using the command 'srvctl add eons'.
/
2568, SIHA_ONS_STARTED, "Successfully started ONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2569, SIHA_ONS_RES_ALREADY_STARTED, "ONS is already started."
//  *Cause: The command 'srvctl start ons' failed because the ONS daemon was already started.
// *Action: None required.
/
2570, SIHA_EONS_STARTED, "Successfully started eONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2571, SIHA_EONS_RES_ALREADY_STARTED, "eONS is already started."
//  *Cause: The command 'srvctl start eons' failed because the eONS daemon was already started.
// *Action: None required.
/
2572, SIHA_ONS_STOPPED, "Successfully stopped ONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2573, SIHA_ONS_RES_ALREADY_STOPPED, "ONS daemon is already stopped."
//  *Cause: The command 'srvctl stop ons' failed because the ONS daemon was already stopped.
// *Action: None required.
/
2574, SIHA_EONS_STOPPED, "Successfully stopped eONS daemon."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2575, SIHA_EONS_RES_ALREADY_STOPPED, "eONS daemon is already stopped."
//  *Cause: The command 'srvctl stop eons' failed because the eONS daemon was already stopped.
// *Action: None required.
/
2576, SIHA_ONS_RES_ALREADY_ENABLED, "ONS is already enabled."
//  *Cause: The command 'srvctl enable ons' failed because the ONS was already enabled.
// *Action: None required.
/
2577, SIHA_ONS_RES_ENABLED_SUCC, "Successfully enabled ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2578, SIHA_EONS_RES_ENABLED_SUCC, "Successfully enabled eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2579, SIHA_EONS_RES_ALREADY_ENABLED, "eONS is already enabled."
//  *Cause: The command 'srvctl enable eons' failed because the eONS was already enabled.
// *Action: None required.
/
2580, SIHA_ONS_RES_DISABLED_SUCC, "Successfully disabled ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2581, SIHA_ONS_RES_ALREADY_DISABLED, "ONS is already disabled."
//  *Cause: The command 'srvctl disable ons' failed because the ONS was already disabled.
// *Action: None required.
/
2582, SIHA_EONS_RES_DISABLED_SUCC, "Successfully disabled eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2583, SIHA_EONS_RES_ALREADY_DISABLED, "eONS is already disabled."
//  *Cause: The command 'srvctl disable eons' failed because the eONS was already disabled.
// *Action: None required.
/
2584, SIHA_ONS_MODIFY_SUCCESS, "Successfully modified ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2585, SIHA_EONS_MODIFY_SUCCESS, "Successfully modified eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2586, SIHA_ONS_REMOVED, "Successfully removed ONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2587, SIHA_EONS_REMOVED, "Successfully removed eONS."
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
2588, SIHA_ONS_ALREADY_RUNNING, "ONS daemon could not be removed because it is still running."
//  *Cause: The command 'srvctl remove ons' failed because ONS daemon was still running.
// *Action: Stop the ons daemon by using the command 'srvctl stop ons' and then attempt to remove it. You can also use the '-force' option to remove a running ons daemon.
/
2589, SIHA_EONS_ALREADY_RUNNING, "eONS daemon could not be removed because it is still running."
//  *Cause: The command 'srvctl remove eons' failed because eONS daemon was still running.
// *Action: Stop the ons daemon by using the command 'srvctl stop eons' and then attempt to remove it. You can also use the '-force' option to remove a running eons daemon.
/
2590, SIHA_ONS_NOTHING_MODIFIED, "None of the ONS daemon parameters were modified."
//  *Cause: The configuration of the ONS daemon has remained the same after the 'srvctl modify ons' command.
// *Action: Make sure that at least one of the optional modification parameters was specified on the command line. The current values of parameters of the ONS daemon can be found by using 'srvctl config ons' command. Specify at least one value different then current value while issuing the 'srvctl modify ons' command.
/
2591, SIHA_EONS_NOTHING_MODIFIED, "None of the eONS daemon parameters were modified."
//  *Cause: The configuration of the eONS daemon has remained the same after the 'srvctl modify eons' command.
// *Action: Make sure that at least one of the optional modification parameters was specified on the command line. The current values of parameters of the eONS daemon can be found by using the command 'srvctl config eons'. Specify at least one value different then current value while issuing the command 'srvctl modify eons'.
/ 
2592, GNS_CONFIG_SUCCESS, "GNS was configured successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2593, GNS_ENABLE_FAILED, "enable of GNS failed."
//  *Cause: Enabling the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2594, GNS_MODIFY_SUCCESS, "GNS was modified successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2595, GNS_MODIFY_FAILED, "modify of GNS failed."
//  *Cause: Modification the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2596, GNS_DISABLE_SUCCESS, "GNS disabled successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2597, GNS_DISABLE_FAILED, "disable of GNS failed."
//  *Cause: Disabling the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2598, GNS_RELOCATE_SUCCESS, "GNS was relocated successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2599, GNS_RELOCATE_FAILED, "relocation of GNS failed."
//  *Cause: Relocation of the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2600, GNS_REMOVE_SUCCESS, "GNS was removed successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2601, GNS_REMOVE_FAILED, "removal of GNS failed."
//  *Cause: Removal of the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2602, GNS_ADD_SUCCESS, "GNS was successfully added."
// *Document: NO
//  *Cause:
// *Action:
/
2603, GNS_ADD_FAILED, "addition of GNS failed."
//  *Cause: The addition of the GNS server failed.
// *Action: Examine the accompanying exception for details.
/
2604, GNS_ALREADY_EXISTS, "Add client data operation is not allowed because GNS is configured"
//  *Cause: An attempt to add client data failed because the Grid Naming Service (GNS) was configured in this cluster. Client data can only be added on a GNS client cluster or a secondary GNS server cluster.
// *Action: Remove the GNS configuration and retry the command.
/
2605, GNS_DOMAIN_SERVED, "Domain served by GNS: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2606, GNS_BRIDGE_PORT, "GNS is listening for DNS server requests on port {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2607, GNS_STATUS, "GNS status: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2608, GNS_VERSION, "GNS version: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2609, GNS_VIP_NETWORK, "GNS VIP network: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2610, GNS_MULTICAST_PORT, "GNS is using port {0} to connect to mDNS"
// *Document: NO
//  *Cause:
// *Action:
/
2611, GNS_VIP_NOT_EXIST, "GNS VIP does not exist. Specify the {0} option to create one."
// *Cause:  The attempt to add GNS failed because the VIP associated with it does not exist.
// *Action: Create the VIP.
/
2612, ASM_ENABLED_NODES, "ASM is individually enabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2613, ASM_DISABLED_NODES, "ASM is individually disabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2614, GNS_NAME_RESOLVED, "The name {0} resolves to the following addresses: {1}"
// *Document: NO
//  *Cause:
// *Action:
/
2615, GNS_ENABLE_SUCCESS, "GNS was successfully enabled."
// *Document: NO
//  *Cause:
// *Action:
/
2616, GNS_START_SUCCESS, "GNS was successfully started."
// *Document: NO
//  *Cause:
// *Action:
/
2617, GNS_STOP_SUCCESS, "GNS was successfully stopped."
// *Document: NO
//  *Cause:
// *Action:
/
2618, GNS_RECORD_NAME, "Name"
// *Document: NO
// *Cause:
// *Action:
/
2619, GNS_RECORD_TYPE, "Type"
// *Document: NO
// *Cause:
// *Action:
/
2620, GNS_RECORD_VALUE, "Value"
// *Document: NO
// *Cause:
// *Action:
/
2621, RAC_CREATE_EXCL_X, "The '-node <node>' option cannot be used to create RAC database {0}"
//  *Cause: The '-node' option was supplied to create a single-instance database, along with '-dbtype RAC' requesting a Oracle RAC database.
// *Action: Specify '-dbtype SINGLE' with '-node <node> or omit '-node' option and reissue the command.'
/
2622, VIP_RELOCATE_SUCCESS, "VIP was relocated successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2623, GNS_CLUSTER_GUID, "Globally unique identifier of the cluster where GNS is running: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2624, GNS_CLUSTER_NAME, "Name of the cluster where GNS is running: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
2625, GNS_LOG_LEVEL, "GNS log level: {0}."
// *Document: NO
//  *Cause:
// *Action:
/
2626, GNS_LISTENING_ADDRESSES, "GNS listening addresses: {0}."
// *Document: NO
//  *Cause:
// *Action:
/
2627, GNS_CLUSTER_TYPE, "Cluster type: {0}."
// *Document: NO
//  *Cause:
// *Action:
/
2700, CVU_CONFIG_NOT_EXISTS, "The CVU resource is not configured"
//  *Cause: The CVU resource was not configured on the cluster or an unexpected error occurred while querying Clusterware for the CVU resource.
// *Action: If the CVU resource was not configured then a new resource can be created using the command 'srvctl add cvu'. If the resource was configured, look at any accompanying error messages.
/ 
2701, CVU_CONFIG_EXISTS, "CVU is configured to run once every {0} minutes"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2702, CVU_ALREADY_DISABLED, "CVU is already disabled"
//  *Cause: CVU resource could not be disabled because it is already disabled.
// *Action: None required.
/
2703, CVU_ALREADY_ENABLED, "CVU is already enabled"
//  *Cause: CVU resource could not be enabled because it is already enabled.
// *Action: None required.
/
2704, CVU_RUNNING_NODE, "CVU is enabled and running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2705, CVU_NOT_RUNNING, "CVU is enabled but is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2706, CVU_STATUS_DISABLED, "CVU is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2707, CVU_STILL_RUNNING, "CVU resource must be stopped before removing"
//  *Cause: The command 'srvctl remove cvu' was issued while CVU instance was running.
// *Action: Stop the CVU resource using the command 'srvctl stop cvu' and then try removing.
/
2708, CONVERT_FAILED_OMO_ACTIVE, "Unable to convert RAC One Node database because it has an active online relocation request"
//  *Cause: Failed to convert an Oracle RAC One Node database to an Oracle RAC database because there was an active online relocation request for the database.
// *Action: Wait for the online relocation request to complete and then run the command 'srvctl convert database'.
/
2709, CONVERT_FAILED_OMO_FAILED, "Unable to convert RAC One Node database because it has a failed online relocation request"
//  *Cause: An attempt to convert an Oracle RAC One Node database to an Oracle RAC database failed because there was a failed online relocation request for the database.
// *Action: Use the command 'srvctl status database' to show the target node of the failed online relocation request process. Run the command 'srvctl relocate database' with either the '-abort' option or with '-node' option with the correct target node. Then run the command 'srvctl convert database'.
/
2710, START_RACDB_OPT_N, "Option '-node' cannot be used to start RAC database {0}"
//  *Cause: The '-node' option was specified to start an Oracle RAC database, but '-node' option is only applicable to an Oracle RAC One Node databases.
// *Action: Either use the command 'srvctl start instance' to start an Oracle RAC database instance on the given node or use the command 'srvctl start database' without '-node' option to start the Oracle RAC database. 
/
2711, GNS_UPDATE_SUCCESS, "GNS was updated successfully."
// *Document: NO
//  *Cause:
// *Action:
/
2712,ADMIN_DB_NOT_SUPPORTED, "Administrator-managed database {0} is not supported with -eval option"
// *Cause: A request with the '-eval' option specified an administrator-managed database. 
// *Action: Specify a policy-managed database when using the '-eval' option.            
/
2713,RESTART_DB_NOT_SUPPORTED, "Oracle Restart database {0} is not supported with -eval option"
// *Cause: A request with the '-eval' option specified an oracle restart database. 
// *Action: Specify a policy-managed database when using the '-eval' option.            
/
2800, HAVIP_ADD_SUCC, "Successfully added HAVIP. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3001, DB_UNIQUE_NAME, "Database unique name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3002, DB_NAME, "Database name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3003, ORACLE_HOME, "Oracle home: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3004, ORACLE_USER, "Oracle user: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3005, SPFILE, "Spfile: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3006, DOMAIN, "Domain: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3007, DB_ROLE, "Database role: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3008, START_OPTIONS, "Start options: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3009, STOP_OPTIONS, "Stop options: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3010, MGMT_POLICY, "Management policy: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3011, SERVERPOOLS, "Server pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3012, DB_INSTANCES, "Database instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3013, DISKGROUPS, "Disk Groups: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3014, SERVICES, "Services: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3015, DB_ENABLED, "Database is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3016, DB_DISABLED, "Database is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3017, DB_RUNNING, "Database is running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3018, DB_NOT_RUNNING, "Database is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3019, DB_RUN_WITH_SERV, "Database {0} is running with online services {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3020, DB_NOT_RUNNING_ON_NODE, "Database {0} is not running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3021, DB_EXISTS, "Database exists."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3022, DB_TYPE, "Type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3023, DB_CENTRIC, "Database is administrator managed"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3024, SERVICE_CENTRIC, "Database is policy managed"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3025, PROMPT_REMOVE_DB_INST, "Remove instance from the database {0}?"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3026, ERR_INST_I_OPTION, "Only one instance can be listed in -instance <inst_name_list> when -node option is specified"
//  *Cause: More than one instance was specified for '-instance' option when both '-instance' and '-node' options were used.
// *Action: Supply one instance name for '-instance' option when using both '-instance' and '-node' option.
/
3027, DB_INST_DISABLED, "Instance {0} is disabled on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3028, DB_INST_RUN_WITH_SERV, "Database instance {0} is running with online services {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3029, DB_INST_RUNNING, "Database instance {0} is running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3030, DB_INST_NOT_RUNNING, "Database instance {0} is not running."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3031, SRVPOOL_EXISTS, "Server pool {0} already exists"
//  *Cause: The command 'srvctl add serverpool' failed because the given server pool already exists.
// *Action: Make sure that the name of server pool is correct and a server pool with the given name doesn't exist.
/
3032, INVALID_DB_INST_NAMES, "Invalid instance name(s): {0}"
//  *Cause: Some of the supplied instance names do not exist in the database configuration.
// *Action: Please supply valid instance names and retry.
/
3033, VIP_ENABLED, "VIP {0} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3034, NETWORK_ENABLED, "Network is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3035, ONS_ENABLED, "ONS is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3036, EONS_ENABLED, "eONS is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3037, GSD_ENABLED, "GSD is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3038, VIP_DISABLED, "VIP {0} is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3039, NETWORK_DISABLED, "Network is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3040, ONS_DISABLED, "ONS is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3041, EONS_DISABLED, "eONS is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3042, GSD_DISABLED, "GSD is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3043, LSNR_CONFIG_NAME, "Name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3044, LSNR_CONFIG_NETWORK_AND_OWNER, "Network: {0}, Owner: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3045, LSNR_CONFIG_ORACLE_HOME, "Home: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3046, LSNR_CONFIG_ENDPOINTS, "End points: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3047, LSNR_ENABLED_ON_NODE, "Listener {0} is enabled on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3048, LSNR_DISABLED_ON_NODE, "Listener {0} is disabled on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3049, LSNR_RUN_ON_NODE, "Listener {0} is running on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3050, LSNR_NOT_RUN_ON_NODE, "Listener {0} is not running on node(s): {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3051, SRV_CFG_NAME, "Service name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3052, SRV_CFG_DISABLE, "Service is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3053, SRV_CFG_ENABLE, "Service is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3054, SRV_CFG_SG, "Server pool: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3055, SRV_CFG_CARD, "Cardinality: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3057, SRV_CFG_NETWORK, "Network: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3058, SRV_CFG_DISC_YES, "Disconnect: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3059, SRV_CFG_DISC_NO, "Disconnect: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3060, SRV_CFG_ROLE, "Service role: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3061, SRV_CFG_M_POLICY, "Management policy: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3062, SRV_CFG_DTP_YES, "DTP transaction: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3063, SRV_CFG_DTP_NO, "DTP transaction: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3064, SRV_CFG_AQHA_YES, "AQ HA notifications: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3065, SRV_CFG_AQHA_NO, "AQ HA notifications: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3066, SRV_CFG_FTYPE, "Failover type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3067, SRV_CFG_FMETHOD, "Failover method: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3068, SRV_CFG_FRETR, "Failover retries: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3069, SRV_CFG_FDELAY, "Failover delay: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3070, SRV_CFG_CLB_GOAL, "Connection Load Balancing Goal: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3071, SRV_CFG_RLB_GOAL, "Runtime Load Balancing Goal: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3072, SRV_CFG_TAF_POLICY, "TAF policy specification: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3073, SRV_CFG_ENABLED_ON, "Service is individually enabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3074, SRV_CFG_DISABLED_ON, "Service is individually disabled on nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3075, DB_INST_CANNOT_ENABLED, "Dummy message line"
//  *Document: No
//  *Cause: Dummy message line
// *Action: Not an error
/
3076, DB_INST_CANNOT_DISABLED, "Dummy message line"
//  *Document: No
//  *Cause: Dummy message line
// *Action: Not an error
/
3077, DB_REMOVE_FAIL, "Failed to remove database {0}: "
//  *Cause: Failed to remove the database.
// *Action: Examine the accompanying message(s) for details of the error, and respond accordingly.
/
3078, DB_REMOVE_SUCC, "Successfully removed database and its dependent services."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3079, DB_REMOVE_SG_FAIL, "Server pool {0} which is used to manage database {1} is not removed successfully: "
//  *Cause: 
// *Action: 
/
3080, DB_REMOVE_SG_SUCC, "Successfully removed server pool {0} which is used to manage database {1}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3081, ENV_NOT_EXIST, "No such environment variable setting: {0}"
//  *Cause: The environment variable(s) does not exist for the specified resource. 
// *Action: Supply a valid environment variable.
/
3082, DB_IS_RUNNING, "Database {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3083, SERV_IS_RUNNING, "Service {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3084, LSNR_IS_RUNNING, "Listener {0} is running on node {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3085, LABEL_VOL_DEVICE, "Volume device: {0}"
//  *Cause: Volume device label
// *Action: None.
/
3086, LABEL_MOUNTPOINT, "Mountpoint path: {0}"
//  *Cause: Mountpoint path label
// *Action: None.
/
3087, LABEL_USER, "User: {0}"
//  *Cause: User label
// *Action: None.
/
3088, ACFS_ENABLED, "ACFS file system is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3089, ACFS_DISABLED, "ACFS file system is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3090, ACFS_RUNNING, "ACFS file system {0} is mounted on nodes {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3091, ACFS_NOT_RUNNING, "ACFS file system {0} is not mounted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3092, DISKGROUP_RUNNING_ON_NODE, "Disk Group {0} is running on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3093, DISKGROUP_NOT_RUNNING_ON_NODE, "Disk Group {0} is not running on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3094, DISKGROUP_NOT_RUNNING, "Disk Group {0} is not running"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3095, DISKGROUP_ENABLED, "Disk Group {0} is enabled"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3096, DISKGROUP_ENABLED_ON_NODE, "Disk Group {0} is enabled on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3097, DISKGROUP_DISABLED, "Disk Group {0} is disabled"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3098, DISKGROUP_DISABLED_ON_NODE, "Disk Group {0} is disabled on {1}"
//  *Document: No
//  *Cause: Output message
// *Action: None.
/
3099, GNS_ENABLED, "GNS is enabled."
// *Document: NO
//  *Cause: 
// *Action: 
/
3100, GNS_DISABLED, "GNS is disabled."
// *Document: NO
//  *Cause: 
// *Action: 
/
3101, PROMPT_REMOVE_GNS, "Remove GNS?"
// *Document: NO
//  *Cause: 
// *Action: 
/
3102, PROMPT_REMOVE_GNS_NO, " GNS removal canceled."
// *Document: NO
//  *Cause: 
// *Action: 
/
3103, available_for_message, "OBSOLETE - DO NOT REUSE"
// *Document: NO
//  *Cause: 
// *Action: 
/
3104, GNS_IS_NOT_RUNNING, "GNS is not running."
// *Document: NO
//  *Cause: 
// *Action: 
/
3105, GNS_ENABLED_ON_NODE, "GNS is enabled on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3106, GNS_DISABLED_ON_NODE, "GNS is disabled on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3107, GNS_IS_RUNNING_ON_NODE, "GNS is running on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3108, GNS_IS_NOT_RUNNING_ON_NODE, "GNS is not running on node {0}."
// *Document: NO
//  *Cause: 
// *Action: 
/
3109, SRV_CFG_ENABLED_ON_INST, "Service is individually enabled on instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3110, SRV_CFG_DISABLED_ON_INST, "Service is individually disabled on instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3111, SERV_RUN_NODES, "Service {0} is running on nodes: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3112, SERV_RUN_SIHA, "Service {0} is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3113, ADMIN_MANAGED_DB_POLICY_MANAGED_SERVICE, "Administrator-managed database {1} can not support policy-managed service {0}."
//  *Cause: The specified database does not support policy-managed services.
// *Action: Provide a database which supports policy-managed services.
/
3114, POLICY_MANAGED_DB_ADMIN_MANAGED_SERVICE, "Policy-managed database {1} can not support administrator-managed service {0}."
//  *Cause: The specified database does not support administrator-managed services.
// *Action: Provide a database which supports administrator-managed services.
/
3115, POLICY_MANAGED_SERVICE_P_OPT, "-tafpolicy option cannot be used with policy-managed service {0}."
//  *Cause: The '-tafpolicy' option was specified for a policy-managed service.
// *Action: Use the '-failovermethod' option to specify failover processing for a policy-managed service.
/
3116, SERVICE_NO_R_G, "'-serverpool' or '-preferred' option must be provided"
//   *Cause: An add service command was issued with neither '-serverpool' nor '-preferred'.
//   *Action: Make sure that one of specified options is included on the command line.
/
3117, SERVICE_EXISTS, "Service {0} already exists in database {1}"
//   *Cause: The service being added already exists.
//   *Action: If the service needs to be modified use the command 'srvctl modify service'.
/
3118, SERVICE_CHECK_FAILED, "Failed to check if service {0} exists: {1}"
//   *Cause: Failed to get the service data.
//   *Action: Make sure that Oracle Clusterware is active.
/
3119, DB_START_NO_CONFIG_INST, "Database {0} cannot be started since it has no configured instances."
//  *Cause: The specified database is an administrator-managed database and it cannot be started because no instances were configured.
// *Action: Use the command 'srvctl add instance' to configure the instance and then retry.
/
3120, DB_STOP_NO_CONFIG_INST, "Database {0} cannot be stopped since it has no configured instances."
//  *Cause: The specified database is an administrator-managed database and it could not be stopped because no instances were configured.
// *Action: Use the command 'srvctl add instance' to configure the instance and then retry.
/
3121, ADMIN_DB_START_INST_NO_OPT, "-instance option or -node option is required for starting an instance on the administrator-managed database {0}."
//  *Cause: The specified database is an administrator-managed database and the srvctl start instance command requires the instance name or nodename to be specified.
// *Action: Use the commane 'srvctl start instance' with either the '-instance' or '-node' option to start the instance.
/
3122, DB_STOP_INST_NO_OPT, "-instance option or -node option is required for stopping an instance of database {0}"
//  *Cause: Neither the instance name nor the nodename was provided during the command 'srvctl stop instance' invocation.
// *Action: Use the command 'srvctl stop instance' with either the '-instance' or '-node' option to specify which instance to stop.
/
3123, SRV_CFG_PREF_INSTS, "Preferred instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3124, SRV_CFG_AVAIL_INSTS, "Available instances: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3125, INVALID_VALUE_4_OPTION, "Invalid value {0} for command line option {1}"
//  *Cause: Invalid value was specified for the command line option.
// *Action: Check the value printed and specify the correct value.
/
3126, GNS_INVALID_LOG_LEVEL, "Invalid GNS logging level: \"{0}\""
//  *Cause: The level of logging specified was not a positive integer.
// *Action: Specify a positive integer.
/
3127, LSNR_CONFIG_ORACLE_HOME_ON_NODE, "  {0} on node(s) {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3128, ADD_DB_DG_NOT_EXIST, "Unable to add database because the resource for diskgroup {0} could not be found. {1}"
//  *Cause: The resource for the specified disk group could not be found. Either the diskgroup name was misspelled or the diskgroup has not been mounted.
// *Action: Correct the diskgroup spelling or use sqlplus to create the diskgroup.
/
3129, MODIFY_DB_DG_NOT_EXIST, "Unable to modify database because the resource for diskgroup {0} could not be found. {1}"
//  *Cause: The resource for the specified disk group could not be found. Either the diskgroup name was misspelled or the diskgroup has not been mounted.
// *Action: Correct the diskgroup spelling or use sqlplus to create the diskgroup.
/
3130, CANNOT_MODIFY_ADMIN_MNGD_SP, "Server pool {0} is internally managed as part of administrator-managed database configuration and therefore cannot be modified directly via srvpool object." 
//  *Cause: An attempt was made to alter configuration of an internally managed server pool that is hosting an administrator-managed configuration. 
// *Action: Do not modify this server pool via srvpool object directly. Instead use the command 'srvctl add/remove instance' or use the command 'srvctl modify database/service' to alter this server pool's configuration.
/
3131, ASM_DISKSTRING, "ASM diskgroup discovery string: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3132, DB_STATUS_INST_NO_OPT, "-instance option or -node option is required for checking the status of an instance of database {0}"
//  *Cause: Neither the instance name nor the nodename was provided during 'srvctl status instance' command invocation.
// *Action: Use the command 'srvctl status instance' with either the '-instance' or '-node' option to check the status of the instance.
/
3133, INVALID_NODE_FOR_DB_INST, "Database {0} has no instance on node {1}"
//  *Cause: The indicated database did not have an instance configured on the indicated node.
// *Action: Either the command 'srvctl add instance' or the command 'srvctl modify instance' can be used to change instance-node mapping in administrator-managed databases. For a policy-managed database, either use the command 'srvctl start instance' with the '-node' option to start the instance on the specified node or use the command 'srvctl modify instance' to configure an instance for that node.
/
3134, DB_MODIFY_INST_NO_OPT, "-node option cannot be specified with -nonode option"
//  *Cause: '-node' and '-nonode' options were both provided during 'srvctl modify instance' command invocation.
// *Action: Use the command 'srvctl modify instance' with either the '-node' or '-nonode' option to modify the node instance mapping of the database instance.
/
3135, DB_MOD_INST_Z_OPT, "-node option cannot be empty when used with administrator-managed database {0}"
//  *Cause: The '-node' option was specified as an empty string in an attempt to remove node to instance mapping of administrator-managed database.
// *Action: Use the command 'srvctl remove instance' to remove node instance mapping of an administrator-managed database.
/
3136, DB_MOD_SERV_C_OPT, "Option '-cardinality' cannot be used with administrator-managed service {0}"
//  *Cause: The '-cardinality' option was specified for administrator-managed service.
// *Action: Reissue the command without the '-cardinality' option.
/
3137, POLICY_MANAGED_SERVICE_PRE_OPT, "Dummy message. Not used"
// *Document: NO
//  *Cause: 
// *Action: 
/
3138, SERV_NODE_NOT_IN_POOL, "Node {0} does not belong to server pool {1} which defines nodes for service {2}"
//  *Cause: Node doesn't belong to the server pool which defines nodes which can be used to run the specified service.
// *Action: Supply a node  which belongs to specified server pool.
/
3139, SERV_RELOC_OPT_IT, "Options '-oldinst' and '-newinst' cannot be used with policy-managed service {0}"
//  *Cause: The '-oldinst' and '-newinst' options were specified to relocate a policy-managed service.
// *Action: Use options '-currentnode' and '-targetnode' to relocate a policy-managed service.
/
3140, SERV_RELOC_OPT_CN, "Options '-currentnode' and '-targetnode' cannot be used with administrator-managed service {0}"
//  *Cause: The '-currentnode' and '-targetnode' options were specified to relocate an administrator-managed service.
// *Action: Use options '-oldinst' and '-newinst' to relocate a administrator-managed service.
/
3141, DB_REMOVE_RUNNING_DB, "Database {0} could not be removed because it was running"
//  *Cause: The command 'srvctl remove database' failed because the database was running.
// *Action: Stop the database by using the command 'srvctl stop database' and then attempt to remove it. You can also use the '-force' option to remove the running database.
/
3142, SERV_EN_DIS_OPT_I, "Option '-instance' cannot be used to enable or disable services for policy-managed database {0}"
//  *Cause: An attempt to enable or disable a policy-managed database service specified the '-instance' option.
// *Action: Use the '-node <node>' option to specify nodes on which to enable or disable services for this policy-managed database.
/
3143, SERV_MOD_ITRNA_OPTIONS, "Options '-preferred', '-toprefer', '-modifyconfig' and '-available' were specified to modify policy-managed service {0}"
//  *Cause: Options '-preferred', '-toprefer', '-modifyconfig' and '-available' can be used to modify administrator-managed service only.
// *Action: Make sure that the service you are going to modify is an administrator-managed service.
/
3144, SERV_MOD_A_OPT, "Missing option '-modifyconfig' or '-preferred' was required by supplying '-available'."
//  *Cause: An attempt to modify a resource configuration was rejected because option '-available  was specified without options '-modifyconfig' or '-preferred'.
//  *Action:  Retry the command ensuring that the -modifyconfig or -preferred  option is provided when the -available option is specified.
/
3145, SERV_MOD_I_OPT, "Option '-preferred' requires '-modifyconfig' option to be specified"
//  *Cause: Option '-preferred' was specified without required '-modifyconfig' option.
// *Action: Make sure that required option is provided according to the command 'srvctl modify service' syntax.
/
3146, SERV_MOD_I_OPT_MISSED, "Missing required '-preferred' option"
//  *Cause: Options '-available' or '-modifyconfig' were specified without required option '-preferred'.
// *Action: Make sure that required option is provided according to command 'srvctl modify service' syntax.
/
3147, REMOVE_PREF_INSTANCE, "Instance {0} cannot be removed because it is the only preferred instance for service(s) {1} for database {2}"
//   *Cause: An attempt was made to remove the instance which is the only preferred instance for specified services.
//  *Action: Make sure that specified services have more than one preferred instance or modify services to not have the instance as a preferred instance.
/
3148, TARGET_INST_FOR_SERV_AR, "Instance {0} does not support service {1}."
//  *Cause: The given database instance is not defined as a preferred or available instance for the given service.
// *Action: Specify an instance that is defined as preferred or available instance for the given service.
/
3149, ADD_SIDB_SERVER_MISMATCH, "The candidate server {0} of server pool {1} is different from the server {2} specified with the '-node' option"
//   *Cause: Specified server must be the candidate server of the specified server pool.
//  *Action: Make sure that the server specified with '-node' option is the same as the candidate server of the given server pool.
/
3150, DB_ADD_SG_OPT, "The server pools {0} specified with the '-serverpool' cannot be used to add an administrator-managed database"
//  *Cause: A request to add an administrator-managed database specified the '-serverpool' option.
// *Action: Use the command 'srvctl add database' without the '-serverpool' option to add an administrator-managed database.
/
3151, DB_CONVERT_SG_OPT, "Option '-serverpool' cannot have more than one specified server pool when converting an administrator-managed database to a policy-managed database"
//  *Cause: An attempt was made to convert an administrator-managed database to a policy-managed database by specifying more than one server pool.
// *Action: Make sure to specify only one server pool with the '-serverpool' option when converting an administrator-managed database to a policy-managed database.
/
3152, DB_MODIFY_SG_OPT, "The server pools {0} specified with the '-serverpool' option are subpools of Generic and therefore cannot be used to modify the server pool value of a policy-managed database"
//  *Cause: The supplied server pools are meant for managing administrator-managed databases because they are subpools of Generic.
// *Action: Make sure that none of the supplied server pools are meant for managing administrator-managed database. Only supply server pools meant for managing policy-managed databases to the '-serverpool' option of the command 'srvctl modify database'. Use the command 'srvctl config srvpool' to list the qualified server pools meant for managing policy managed databases. 
/
3153, POLICY_DB_START_INST_NO_OPT, "-instance option or -node option is required for starting an instance on the policy-managed database {0}."
//  *Cause: The specified database is a policy-managed database and the command 'srvctl start instance' requires the instance name or nodename to be specified.
// *Action: Use the command 'srvctl start instance' with either the '-instance' or '-node' option or both '-instance' and '-node' options to start the instance.
/
3154, ADMIN_DB_START_INST_BOTH_OPT, "Both -instance and -node options are specified for starting an instance on the administrator-managed database {0}."
//  *Cause: The specified database is an administrator-managed database and the command 'srvctl start instance' requires either the instance name or nodename to be specified but not both.
// *Action: Use the command 'srvctl start instance' with either the '-instance' or '-node' option to start the instance.
/
3155, POLICY_DB_FAILED_START_INST_ON_NODE, "Can not start the instance {0} on the specified node {1} because the node is assigned to another user configured instance {2}"
//  *Cause: The database specified on the command 'srvctl start instance' was policy managed and had another instance already configured on the node name specified with the '-node' option.
// *Action: Either reformulate the command 'srvctl start instance' so that there is no conflict with configured instances' nodes, or use the command 'srvctl modify instance' to change configured instances' nodes.
/
3156, DEFINE_SERVER_NAME, "Server name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3157, DEFINE_SERVER_STATE, "Server state: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3158, DEFINE_SERVER_ACTIVE_IN_POOLS, "Server active pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3159, DEFINE_SERVER_STATE_DETAILS, "Server state details: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3160, CANNOT_STAT_ADMIN_MNGD_SP, "Server pool {0} is internally managed as part of administrator-managed database configuration and therefore cannot be queried directly via srvpool object." 
//  *Cause: An attempt was made to query configuration of an internally managed server pool that is hosting an administrator-managed configuration. 
// *Action: Do not query this server pool via srvpool object directly. Instead use srvctl config/status database/service command to query servers that are part of this pool's configuration.
/
3161, CANNOT_REMOVE_ADMIN_MNGD_SP, "Server pool {0} is internally managed as part of administrator-managed database configuration and therefore cannot be removed directly via srvpool object." 
//  *Cause: An attempt was made to remove configuration of an internally managed server pool that is hosting an administrator-managed configuration. 
// *Action: Do not remove this server pool via srvpool object directly. Instead use the command 'srvctl remove service/database' to remove this server pool and any service/database hosted by the server pool.
/
3162, UNSUPPORTED_ACTION_FOR_SCANLSNR, "The actions setenv, getenv, and unsetenv are not suppported for Single Client Access Name listener {0}"
//  *Cause: Failed to use the command 'srvctl setenv, getenv, and unsetenv listener' for specified Single Client Access Name Listener. The environment variables for Single Client Access Name Listener cannot be changed.
// *Action: Do not set, get, and unset environment variables for Single Client Access Name Listener.
/
3163, SERV_ADD_BAD_SI_OPTS, "Options '-update', '-preferred', '-available', '-serverpool' and '-cardinality' cannot be used to add service {0} for single instance database {1}"
//  *Cause: Failed to add specified service because provided options can not be used to add a service for single instance database.
// *Action: use the command 'srvctl add service' without options '-update', '-preferred', '-available', '-serverpool' or '-cardinality'.
/
3164, SERV_MOD_BAD_SI_OPTS, "Options '-toprefer', '-force', '-modifyconfig', '-instance', '-edition', '-available', '-cardinality' and '-dtp' cannot be used to modify service {0} for single instance database {1}"
//  *Cause: Failed to modify specified service because provided options can not be used to modify a service for single instance database.
// *Action: Use the command 'srvctl modify service' without options '-toprefer', '-force', '-modifyconfig', '-instance', '-edition', '-available', '-cardinality' or '-dtp'.
/
3165, SERV_REL_SI, "Service {0} is defined for single instance database {1} and therefore cannot be relocated"
//  *Cause: Failed to relocate specified service because provided options can not be used to relocate a service for single instance database.
// *Action: Make sure that you issue the command 'srvctl relocate service' for the service which is not defined for a single instance database.
/
3166, GNS_INVALID_PARAMETER, "Invalid GNS parameter: \"{0}\""
// *Cause: An invalid parameter value was specified.
// *Action: A parameter value must have the following format: <name>:<value>. The name may not contain a colon (":"). The value may not contain a comma (",").
/
3167, DEPRECATED_EONS_NOUN, "EONS has been deprecated and ONS should be used to set and modify the local port for Enterprise Manager."
//  *Cause: The command being executed has been deprecated and will not do any action.
// *Action: Use the command 'srvctl -help' for online help or check the documentation for the commands supported by srvctl.
/
3168, INST_RUN_STAT, "Instance {0} is running on node {1}. Instance status: {2}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error 
/
3169, INST_RUN_WITH_SERV_STAT, "Instance {0} is running on node {1} with online services {2}. Instance status: {3}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3170, INST_INTSTATE_STARTING, "Instance {0} is being started"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3171, INST_INTSTATE_STOPPING, "Instance {0} is being stopped"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3172, INST_INTSTATE_CLEANING, "Instance {0} is being cleaned up"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3173, INST_INTSTATE_ASIS, "Instance {0} internal state is: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3174, RACONE_SERV_RELOC_VERB, "'srvctl relocate service' command is not supported on RAC One Node database service {0}"
//  *Cause: An attempt was made to relocate a Oracle RAC One Node database service using the command 'srvctl relocate service'.
// *Action: Use the command 'srvctl relocate database' to relocate the RAC One Node database and its services to the target server.
/
3175, PRECONNECT_4_SIDB, "TAF policy 'PRECONNECT' cannot be used to add a service for single instance database {0}"
//  *Cause: Failed to add specified service because provided TAF specification can not be used with a single instance database.
// *Action: Use the command 'srvctl add service' without 'PRECONNECT' TAF policy.
/
3176, DB_MOD_SERV_G_OPT, "Option '-serverpool' cannot be used with administrator-managed service {0}"
//  *Cause: An attempt to change the server pool of service was rejected because the '-serverpool' option cannot be used with administrator-managed service.
// *Action: Change the preferred and available instances of the service via the command 'srvctl modify service' to manage placement of administrator-managed service.
/
3177,RES_STATUS_ON_NODE, "Detailed state on node {1}: {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3178, RES_INSTAT_START, "Resource {0} is being started on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3179, RES_INSTAT_STOP, "Resource {0} is being stopped on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3180, RES_INSTAT_CLEAN, "Resource {0} is being cleaned on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3181, RES_INSTAT_VALUE, "Resource {0} has internal state {1} on node {2}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3182, DG_INSTAT_START, "Disk group is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3183, DG_INSTAT_STOP, "Disk group is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3184, DG_INSTAT_CLEAN, "Disk group is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3185, DG_INSTAT_VALUE, "Disk group has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3186, FS_INSTAT_START, "File system is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3187, FS_INSTAT_STOP, "Disk group is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3188, FS_INSTAT_CLEAN, "Disk group is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3189, FS_INSTAT_VALUE, "Disk group has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3190, GNS_INSTAT_START, "GNS is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3191, GNS_INSTAT_STOP, "GNS is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3192, GNS_INSTAT_CLEAN, "GNS is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3193, GNS_INSTAT_VALUE, "GNS has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3194, LSN_INSTAT_START, "Listener is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3195, LSN_INSTAT_STOP, "Listener is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3196, LSN_INSTAT_CLEAN, "Listener is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3197, LSN_INSTAT_VALUE, "Listener has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3198, OC4J_INSTAT_START, "OC4J is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3199, OC4J_INSTAT_STOP, "OC4J is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3200, OC4J_INSTAT_CLEAN, "OC4J is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3201, OC4J_INSTAT_VALUE, "OC4J has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3202, SCAN_INSTAT_START, "SCAN is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3203, SCAN_INSTAT_STOP, "SCAN is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3204, SCAN_INSTAT_CLEAN, "SCAN is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3205, SCAN_INSTAT_VALUE, "SCAN has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3206, SCANL_INSTAT_START, "SCAN listener is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3207, SCANL_INSTAT_STOP, "SCAN listener is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3208, SCANL_INSTAT_CLEAN, "SCAN listener is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3209, SCANL_INSTAT_VALUE, "SCAN listener has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3210, VIP_INSTAT_START, "VIP is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3211, VIP_INSTAT_STOP, "VIP is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3212, ONS_INSTAT_START, "ONS is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3213, ONS_INSTAT_STOP, "ONS is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3214, ASM_INSTAT_START, "ASM is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3215, ASM_INSTAT_STOP, "ASM is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3216, ASM_INSTAT_CLEAN, "ASM is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3217, ASM_INSTAT_VALUE, "ASM has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3218, SRVC_INSTAT_START, "Service is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3219, SRVC_INSTAT_STOP, "Service is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3220, SRVC_INSTAT_CLEAN, "Service is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3221, SRVC_INSTAT_VALUE, "Service has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3224, ONS_INSTAT_CLEAN, "ONS is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3225, ONS_INSTAT_VALUE, "ONS has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3226, UNSUPPORTED_VERSION_FOR_UPGRADE, "Upgrade from version {0} to version {1} using 'srvctl upgrade model' command of version {2} is not supported"
//  *Cause: The command 'srvctl upgrade model' was issued for a version change that is other than an increase in patch set level.
// *Action: Check that the versions provided are correct. 
/
3227, NO_SERVICES2START, "Database {0} does not have services to start"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3228, NO_SERVICES2STOP, "Database {0} does not have services"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3229, SERV_DIS_EN_SI, "Option '-instance' cannot be used to enable or disable services {0} for single instance database {1}"
//  *Cause: Failed to enable/disable specified service because its database is a single instance database.
// *Action: Make sure that you issue the command 'srvctl enable/disable service' without option '-instance'.
/
3230, NO_SERVICES2STAT, "Database {0} does not have services"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3231, SERV_STOPPING_NODES, "Service is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3232, INST_STOPPING, "Instance is being stopped on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3233, SERV_STOPPING_INST, "Service is being stopped on instances {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3234, DG_STOPPING, "Disk group is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3235, LSN_STOPPING, "Listener is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3236, OC4J_STOPPING, "OC4J is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3237, SCAN_STOPPING, "SCAN is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3238, SCANL_STOPPING, "SCAN listener is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3239, VIP_STOPPING, "VIP is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3240, ASM_STOPPING, "ASM is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3241, INVALID_ORACLE_HOME_ARG_VALUE, "The '-oraclehome <oracle_home>' option value \"{0}\" corresponds to a pathname that does not exist or is not a directory"
//  *Cause: The '-oraclehome <oracle_home>' option value did not resolve to an existing directory pathname.
// *Action: Ensure that the '-oraclehome <oracle_home>' option value correponds to an existing directory pathname.
/
3242, STATE_FILE_IS_A_DIRECTORY, "The '-statfile <state_file>' option value \"{0}\" is a directory"
//  *Cause: The '-statfile <state_file>' option value resolved to an existing directory pathname instead of a file pathname.
// *Action: Ensure that the '-statfile <state_file>' option value correponds to file.
/
3243, STATE_FILE_IS_NON_WRITABLE, "The '-statfile <state_file>' option value \"{0}\" is a file under a non-writable directory"
//  *Cause: The '-statfile <state_file>' option value resolved to a non-writable pathname.
// *Action: Ensure that the state file parent directory has write permissions.
/
3244, STATE_FILE_ALREADY_EXISTS, "The '-statfile <state_file>' option value \"{0}\" already exists"
//  *Cause: The '-statfile <state_file>' option value resolved to an existing file pathname.
// *Action: Ensure that the '-statfile <state_file>' option value corresponds to a non-existing file pathname.
/
3245, CANNOT_DETERMINE_CANONICAL_PATH, "Cannot determine the canonical path to the state file \"{0}\""
//  *Cause: The '-statfile <state_file>' option value specified a pathname for which the canonical path cannot be retrieved.
// *Action: Provide the absolute pathname for '-statfile <state_file>' option value.
/
3246, STATE_FILE_NOT_EXISTS_OR_NON_READABLE, "The '-statfile <state_file>' option value \"{0}\" does not exist or cannot be read"
//  *Cause: The '-statfile <state_file>' option value mapped to a non-existing or non-readable file pathname.
// *Action: Ensure that the '-statfile <state_file>' option value corresponds to an existing readable file pathname.
/
3247, ACFS_MTPOINTS, "Mount point paths: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3248, DB_INSTANCE, "Database instance: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3249, ADD_SVC_PRECONNECT_FAIL, "Failed to add service {0} with PRECONNECT TAF policy because PRECONNECT TAF policy requires at least one available instance"
//  *Cause: An attempt to add a service with the PRECONNECT TAF policy was rejected because an available instance was not specified.
// *Action: Specify at least one available instance with the '-available' option using the command 'srvctl add service' if the service TAF policy is to be PRECONNECT.
/
3250, NO_VIP_RUNNING_ON_NODE, "Failed to stop VIPs on node {0} because no VIP was running on the given node"
//  *Cause: An attempt to stop VIPs on a given node was rejected because VIP was not running on the given node.
// *Action: Check the status of VIPs running on the given node using the command 'srvctl status vip' and issue the command 'srvctl stop vip' only if there are VIPs running on the given node.
/
3251, VERB_NOT_SUPPORTED_IN_ORACLE_RESTART, "Failed to relocate as relocation is not supported in Oracle Restart mode"
//  *Cause: An attempt to relocate failed because relocation was not supported in Oracle Restart.
// *Action: Ensure you are in a cluster environment to relocate managed entities.
/ 
3252, CONVERT_NOT_SUPPORTED_IN_ORACLE_RESTART, "Failed to convert as convert action is not supported in Oracle Restart Mode"
//  *Cause: An attempt to convert failed because conversion is not supported in Oracle Restart.
// *Action: Ensure you are in a cluster environment to convert managed entities.
/
3253, OC4J_ALREADY_RUNNING, "An attempt to modify the OC4J port failed because OC4J is running. Use -force to force stop/restart of OC4J."
//   *Cause: A request to modify the port number of OC4J was rejected because such modification requires OC4J to be stopped and restarted.
//   *Action: Use '-force' option to force restart of OC4J.
/
3254, LABEL_CAN_VOL_DEVICE, "Canonical volume device: {0}"
//  *Document: No
//  *Cause: Canonical volume device label
// *Action: None.
/
3255, VOLUME_RUNNING, "Volume {0} of diskgroup {1} for device {2} is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3256, VOLUME_NOT_RUNNING, "Volume {0} of diskgroup {1} for device {2} is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3257, LABEL_VOL_NAME, "Volume name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3258, LABEL_VOL_USAGE, "Volume filesystem type: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3259, VOLUME_RUNNING_ON_NODE, "Volume {0} of diskgroup {1} for device {2} is running on nodes: {3}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3260, VOLUME_ENABLED, "Volume {0} of diskgroup {1} for device {2} is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3261, VOLUME_NOT_ENABLED, "Volume Device {0} of diskgroup {1} for device {2} is not enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3262, VOLUME_NOT_RUNNING_ON_NODE, "Volume Device {0} of diskgroup {1} for device {2} is not running on node(s): {3}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3263, VOLUME_INSTAT_START, "Volume is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3264, VOLUME_INSTAT_STOP, "Volume is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3265, VOLUME_INSTAT_CLEAN, "Volume is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3266, VOLUME_INSTAT_VALUE, "Volume has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3267, PWFILE, "Password file: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3268, ADD_ASM_DG_NOT_EXIST, "Unable to add ASM because the resource for diskgroup {0} could not be found. {1}"
//  *Cause: An attempt to add ASM has failed because the specified disk group could not be found. Either the diskgroup name was misspelled or the diskgroup has not been mounted.
// *Action: Correct the diskgroup spelling or use sqlplus to create the diskgroup.
/
3269, MODIFY_ASM_DG_NOT_EXIST, "Unable to modify ASM because the resource for diskgroup {0} could not be found. {1}"
//  *Cause: An attempt to add ASM has failed because the specified disk group could not be found. Either the diskgroup name was misspelled or the diskgroup has not been mounted.
// *Action: Correct the diskgroup spelling or use sqlplus to create the diskgroup.
/
3270, INVALID_PWFILE_OPTION_VALUE, "The specified password file {0} does not conform to an ASM path syntax"
//  *Cause: When adding or modifying a database or an ASM, a password file that was not ASM syntax was supplied.
// *Action: Specify a password file in ASM syntax. 
/
3271, SCAN_LSNR_INVITED_NODES, "Registration invited nodes: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3272, SCAN_LSNR_INVITED_SUBNETS, "Registration invited subnets: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3273, STORAGE_PATH, "Storage base path: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3274, GHC_CONFIG_EXISTS, "Rapid Home Provisioning Client is configured"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3275, GHS_STATUS_ENABLED, "Rapid Home Provisioning Server is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3276, GHS_STATUS_DISABLED, "Rapid Home Provisioning Server is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3277, GHC_STATUS_ENABLED, "Rapid Home Provisioning Client is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3278, GHC_STATUS_DISABLED, "Rapid Home Provisioning Client is disabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3279, GHS_NOT_RUNNING, "Rapid Home Provisioning Server is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3280, GHS_RUNNING_NODE, "Rapid Home Provisioning Server is running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3281, GHC_NOT_RUNNING, "Rapid Home Provisioning Client is not running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3282, GHC_RUNNING_NODE, "Rapid Home Provisioning Client is running on node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3283, CLUSTER_ASM_INSTANCE_COUNT, "ASM instance count: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3284, RIM_ASM_LSNR, "Leaf ASM listener: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3285, RIM_ASM_LSNR_NOT_FOUND, "Leaf listener was not found"
//  *Cause: No leaf listener was found registered during the operation.
// *Action: Resolve the issue reported by the included error message and then retry the command. If the leaf listener does not exist, use 'srvctl add listener -leaflistener' to register it.
/
3286, CLUSTER_ASM_LSNR, "Cluster ASM listener: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3287, CLUSTER_ASM_LSNR_NOT_FOUND, "Cluster ASM listener was not found"
//  *Cause: Check the reported message, cluster ASM listener may not exist.
// *Action: Use the command 'srvctl add listener -asmlistener' to register the ASM listener.
/
3288, IOSERVER_INSTANCE_COUNT, "ASM I/O Server instance count: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3289, IOSERVER_RUNNING_NODE, "ASM I/O Server is running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3290, IOSERVER_NOT_RUNNING_NODE, "ASM I/O Server is not running on {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3291, IOSERVER_INSTAT_START, "ASM I/O Server is being started on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3292, IOSERVER_INSTAT_STOP, "ASM I/O Server is being stopped on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3293, IOSERVER_INSTAT_CLEAN, "ASM I/O Server is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3294, IOSERVER_INSTAT_VALUE, "ASM I/O Server has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3295, IOSERVER_STOPPING, "ASM I/O Server is being stopped on nodes {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3296, IOSERVER_NOT_RUNNING, "ASM I/O Server is not running."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3297, IOSERVER_ENABLED, "ASM I/O Server is enabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3298, IOSERVER_DISABLED, "ASM I/O Server is disabled."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3299, IOSERVER_ENABLED_NODES, "ASM I/O server is individually enabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3300, IOSERVER_DISABLED_NODES, "ASM I/O server is individually disabled on nodes: {0}"
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3301, IOSERVER_ENABLED_NODE, "ASM I/O Server is enabled on node {0}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3302, IOSERVER_DISABLED_NODE, "ASM I/O Server is disabled on node {0}."
// *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3303, SERV_MOD_EVAL_OPTION, "Option '-eval' cannot be used to evaluate effects of modifications on administrator-managed service {0}"
//  *Cause: The '-eval' option can be used to evaluate modification on policy-managed service only.
// *Action: Make sure that the service you are going to evaluate modification is a policy-managed service.
/
3304, SERV_REL_EVAL_OPTION, "Option '-eval' cannot be used to evaluate effects of relocation of administrator-managed service {0}"
//  *Cause: The '-eval' option can be used to evaluate relocation of policy-managed service only.
// *Action: Make sure that the service you are going to evaluate relocation is a policy-managed service.
/
3305, EVAL_NO_OPTION_S, "Option '-eval' cannot be used without '-service' option"
//  *Cause: The '-eval' option can be used to evaluate only for one service.
// *Action: Supply a valid '-service' argument.
/
3306, EVAL_HAPPY_MSG, "No Action will be performed as a result of specified evaluation"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3307, EVAL_RES_START, "Resource {0} will be started"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3308, EVAL_RES_START_NODE, "Resource {0} will be started on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3309, EVAL_RES_START_NODES, "Resource {0} will be started on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3310, EVAL_RES_STOP, "Resource {0} will be stopped"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3311, EVAL_RES_STOP_NODE, "Resource {0} will be stopped on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3312, EVAL_RES_STOP_NODES, "Resource {0} will be stopped on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3313, EVAL_SRVR_MOVE_TO, "Server {0} will be moved to pool {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3314, EVAL_SRVR_MOVE_FROM, "Server {0} will be moved from pool {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3315, EVAL_SRVR_MOVE_FROM_TO, "Server {0} will be moved from pool {1} to pool {2}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3316, EVAL_DB_START, "Database {0} will be started"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3317, EVAL_DB_START_NODE, "Database {0} will be started on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3318, EVAL_DB_START_NODES, "Database {0} will be started on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3319, EVAL_DB_STOP, "Database {0} will be stopped"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3320, EVAL_DB_STOP_NODE, "Database {0} will be stopped on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3321, EVAL_DB_STOP_NODES, "Database {0} will be stopped on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3322, EVAL_SVC_START, "Service {0} will be started"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3323, EVAL_SVC_START_NODE, "Service {0} will be started on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3324, EVAL_SVC_START_NODES, "Service {0} will be started on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3325, EVAL_SVC_STOP, "Service {0} will be stopped"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3326, EVAL_SVC_STOP_NODE, "Service {0} will be stopped on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3327, EVAL_SVC_STOP_NODES, "Service {0} will be stopped on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3328, EVAL_LSNR_START, "Listener {0} will be started"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3329, EVAL_LSNR_START_NODE, "Listener {0} will be started on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3330, EVAL_LSNR_START_NODES, "Listener {0} will be started on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3331, EVAL_LSNR_STOP, "Listener {0} will be stopped"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3332, EVAL_LSNR_STOP_NODE, "Listener {0} will be stopped on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3333, EVAL_LSNR_STOP_NODES, "Listener {0} will be stopped on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3334, EVAL_VIP_START, "VIP {0} will be started"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3335, EVAL_VIP_START_NODE, "VIP {0} will be started on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3336, EVAL_VIP_START_NODES, "VIP {0} will be started on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3337, EVAL_VIP_STOP, "VIP {0} will be stopped"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3338, EVAL_VIP_STOP_NODE, "VIP {0} will be stopped on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3339, EVAL_VIP_STOP_NODES, "VIP {0} will be stopped on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3340, EVAL_NW_START, "Network number {0} will be started"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3341, EVAL_NW_START_NODE, "Network number {0} will be started on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3342, EVAL_NW_START_NODES, "Network number {0} will be started on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3343, EVAL_NW_STOP, "Network number {0} will be stopped"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3344, EVAL_NW_STOP_NODE, "Network number {0} will be stopped on node {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3345, EVAL_NW_STOP_NODES, "Network number {0} will be stopped on nodes {1}"
// *Document: No
//  *Cause: Output message
// *Action: Not an error
/
3346, GNS_MUST_NOT_RUNNING_EXPORT, "Unable to export instance: GNS is running"
// *Cause: The command 'srvctl export gns' request was issued while Grid Naming Service (GNS) was running.
// *Action: Stop GNS by using the command 'srvctl stop gns' and reissue the request.
/
3347, GNS_MUST_NOT_RUNNING_IMPORT, "Unable to import instance: GNS is running"
// *Cause: The command 'srvctl import gns' request was issued while Grid Naming Service (GNS) was running.
// *Action: Stop GNS by using the 'srvctl stop gns' and reissue the request.
/
3348, SRV_CFG_PQ_SERVICE, "PQ Helper Service: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3349, SRV_CFG_PQ_POOLS, "PQ Helper Server Pools: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3350, SERV_EXCL_MI_N, "'-node' option conflicts with multiple instance names {0} specified for '-instance <instance_list>'"
//  *Cause: Conflicting options were specified on a 'srvctl start service' or 'srvctl stop service' command. Can't start or stop multiple instances on one node.
// *Action: Reissue the command for one instance or without '-node' option.
/
3351, GNS_ALREADY_EXISTS_CLIENT, "Failed to add GNS with -client option because this cluster running as a GNS server "
//  *Cause: The command 'srvctl add gns -client <filename>' request was issued on the cluster where the GNS server is running.
// *Action: Remove GNS by using the command 'srvctl remove gns' and reissue the request.
/
3352, VIP_INSTAT_CLEAN, "VIP is being cleaned on node {0}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
3353, VIP_INSTAT_VALUE, "VIP has internal state {0} on node {1}"
//   *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9004, EMPTY_STAGE_LIST, "Dummy message. Not used"
//  *Document: No
//  *Cause:
// *Action:
/
9013, SUCC_ADD_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9015, SUCC_REMOVE_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action:   
/
9016, ERR_RENAME_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9017, SUCC_RENAME_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9019, SUCC_MOVE_INST, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9021, SUCC_SET_ENV, "Env successfully set: "
//  *Cause: 
// *Action: 
/
9023, SUCC_UNSET_ENV, "Env successfully unset: "
//  *Cause: 
// *Action: 
/
9025, INVALID_STAGENAME, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9026, DUPLICATE_STAGENAME, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9029, INST_ALREADY_RUN, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9031, INST_SHTDWN_FAIL, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9033, INST_SHTDWN_SUCC, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9035, INST_ALREADY_STOP, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9037, INST_START_FAIL, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9039, INST_START_SUCC, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9040, LSNR_START_SUCC, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9052, NULL_VAL_OPTION, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9053, GET_LOCAL_ENV, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9054, ERR_CREATE_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9055, ERR_DELETE_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9056, SUCC_ADD_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9057, SUCC_DEL_OPS, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9058, INVALID_DBGLVL, "Dummy message. Not used"
//  *Document: No
//  *Cause: 
// *Action: 
/
9059, LISTENER_INVALID_OPTION_COMBINATION, "Invalid command line options for listener. '-all' cannot be specified with '-listener'."
//  *Cause: Invalid combination of options specified for listener command. 
// *Action: Issue the command using either '-listener <listener_name>' or '-all' option.
/
9060, POLICY_DB_START_INST_BOTH_OPT, "Dummy message line"
//  *Document: No
//  *Cause: Dummy message line
// *Action: Not an error
/
9061, SRV_EDITION, "Edition: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9062, OC4J_STATUS_ENABLED, "OC4J is enabled"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9063, SCAN_NAME_NOT_START_LETTER, "Single Client Access Name must start with a letter unless it is an IP address"
//  *Cause: A SCAN was supplied which did not begin with a letter, however SCAN names must begin with a letter.
// *Action: Supply a SCAN name that begins with a letter.
/
9064, NETWORK_ADD_SUCC, "Successfully added Network. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9065, NETWORK_MODIFY_SUCC, "Successfully modified Network. "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9066, INVALID_UPGRADE_PHASE, "Invalid upgrade phase ''{0}'' for upgrade model command"
//  *Cause: An invalid value was specified for upgrade phase.
// *Action: Upgrade phase must be either 'first' or 'last'.
/
9067, INVALID_NETWORK_TYPE, "Invalid network server type \"{0}\""
//  *Cause: An invalid value was specified for network server type.
// *Action:  Reissue the command specifying a network server type of 'static','mixed', 'dhcp', or 'autoconfig'.
/
9068, INVALID_PORT_NUMBER, "Invalid port number {0}"
//  *Cause: A supplied port number was not in the valid, non-privileged range 1024-65535.
// *Action: Specify a port number that is bigger than 1023.
/
9069, SRV_PLUGGABLE_DATABASE, "Pluggable database name: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9070, INVALID_ADDRESS_TYPE, "Invalid address type \"{0}\""
//  *Cause: An invalid address type was specified for network or the VIP resource.
// *Action: The address type must be either 'IPv4' or 'IPv6'.
/
9071, INVALID_NETWORK_TYPE_FOR_IPV4_NETWORK, "The specified network server type \"{0}\" is invalid for an \"IPv4\" network"
//  *Cause: An invalid value was specified for network server type.
// *Action: Network server type must be 'static' or 'dhcp' or 'mixed'.
/
9072, INVALID_NETWORK_TYPE_FOR_IPV6_NETWORK, "The specified network server type \"{0}\" is invalid for an \"IPv6\" network"
//  *Cause: An invalid value was specified for network server type.
// *Action: Network server type must be 'static' or 'autoconfig' or 'mixed'.
/
9073, SRV_MAX_LAG_TIME, "Maximum lag time: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9074, SRV_CFG_GLOBAL_YES, "Global: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9075, SRV_CFG_GLOBAL_NO, "Global: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9076, SRV_TRANSLATION_PROFILE, "SQL Translation Profile: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9077, SRV_CFG_COMMIT_OUTCOME_YES, "Commit Outcome: true"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9078, SRV_CFG_COMMIT_OUTCOME_NO, "Commit Outcome: false"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9079, SRV_RETENTION, "Retention: {0} seconds"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9080, SRV_REPLAY_INITIATION_TIME, "Replay Initiation Time: {0} seconds"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9081, SRV_SESSION_STATE, "Session State Consistency: {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
9082, ORACLE_HOME_NOT_SET, "Oracle Home is not set"
//  *Cause: Command failed to execute because Oracle Home was not set.
// *Action: Set the ORACLE_HOME environment variable to the Grid Infrastructure home directory path and retry.
/
9083, INVALID_IMPORT_FILE, "Invalid content in file: {0}"
//  *Cause: An attempt to import a GNS instance failed because the supplied import file contains invalid content.
// *Action: Provide a correct import file as generated by using the command 'srvctl export gns'.
/
9084, INVALID_GNS_VERSION, "Invalid GNS version found in import file: {0}"
//  *Cause: An attempt to import a GNS instance failed because an invalid GNS version was found in import file.
// *Action: GNS import is supported on 12.1.0.0.0 or later.
/
9085, INVALID_IMPORT_FILE_KEY, "Invalid key name in import file: {0}"
//  *Cause: An attempt to import a GNS instance failed because an OCR key other than GNS was found in the supplied import file.
// *Action: Provide a correct import file as generated by using the 'srvctl export gns'.
/
9086, GNS_IMPORT_FAILED, "Failed to import GNS instance from file: {0}"
//  *Cause: An attempt to import a GNS instance failed due to an internal error.
// *Action: Contact Oracle Support Services.
/
9087, GNS_EXPORT_FAILED, "Failed to export GNS instance to file: {0}."
//  *Cause: An attempt to export a GNS instance was failed due to an internal error.
// *Action: Contact Oracle Support Services.
/
9088, INVALID_SYNTAX_OR_MAND_VOL, "Invalid command options; either {0} must be supplied or both {1} and {2} must be supplied"
//  *Cause: Incomplete or conflicting command line options were supplied.
// *Action: Check the command line options entered and make sure that all the mandatory options in one set are specified.
/
9089, GLOBAL_OVERRIDE_NOT_SUPPORTED, "The '-global_override' option was not specified for global services {0}."
//  *Cause: The command 'srvctl modify/enable/disable/start/stop/remove service' request for a global service did not specify the '-global_override' option.
// *Action: Reissue the command with '-global_override' option.
/
_053, DEFINE_VERSION, "    -{0}                       Show version"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_054, DEFINE_HELP, "    -{0}                    Print usage"
//  *Document: No
//  *Cause: Status message for -help(h)
// *Action: Not an error
/
_055, DEFINE_DB, "    -{0} <db_unique_name>              Unique name for the database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_056, DEFINE_INST, "    -{0} \"<inst,...>\"   Comma separated instance names"
//  *Document: No
//  *Cause: Status message for -instance
// *Action: Not an error
/
_057, DEFINE_INST_SINGLE, "    -{0} <inst_name>                Instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_058, DEFINE_INST_OLD, "    -{0} <old_inst>            Old instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_059, DEFINE_INST_NEW, "    -{0} <new_inst>            New instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_060, DEFINE_SERV, "    -{0} \"<serv,...>\"        Comma separated service names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_061, DEFINE_SERV_SINGLE, "    -{0} <service>             Service name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_062, DEFINE_NODE, "    -{0} <node_name>        Node name"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_063, DEFINE_START_OPTIONS, "    -{0} <start_options>       Options to startup command (e.g. OPEN, MOUNT, or \"READ ONLY\")" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_064, DEFINE_STOP_OPTIONS, "    -{0} <stop_options>        Options to shutdown command (e.g. NORMAL, TRANSACTIONAL, IMMEDIATE, or ABORT)"
//  *Document: No
//  *Cause: Status message for -stopoption(o)
// *Action: Not an error
/
_065, DEFINE_EONS_LOCAL_PORT, "    -{0} <em_port>             Local listen port for Enterprise Manager (Default port number is 2016)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_066, DEFINE_FORCE_STAT, "    -{0}                       Include disabled applications"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_067, DEFINE_FORCE_REMOVE, "    -{0}                   Force remove (ignore dependencies)"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_068, DEFINE_VERBOSE, "    -{0}                 Verbose output"
//  *Document: No
//  *Cause: Status message for -verbose(v)
// *Action: Not an error
/
_069, DEFINE_ORACLE_HOME, "    -{0} <path>       Oracle home path"
//  *Document: No
//  *Cause: Status message for -oraclehome(o)
// *Action: Not an error
/
_070, DEFINE_DOMAIN, "    -{0} <domain_name>              Domain for database. Must be set if database has DB_DOMAIN set."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_071, DEFINE_SPFILE, "    -{0} <spfile>              Server parameter file path"
//  *Document: No
//  *Cause: Status message for -spfile(p)
// *Action: Not an error
/
_073, DEFINE_ADDR_NODE, "    -{0} <addr_str>            Node level Virtual IP address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_075, DEFINE_PREF_LIST, "    -{0} \"<preferred_list>\"    Comma separated list of preferred instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_076, DEFINE_AVAIL_LIST, "    -{0} \"<available_list>\"    Comma separated list of available instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_078, DEFINE_ENV_NAMEVAL, "    -{0} \"<name>=<val>[,...]\"  Names and values of environment variables"
//  *Document: No
//  *Cause: Status message for -envs(t)
// *Action: Not an error
/
_079, DEFINE_ENV_NAMES, "    -{0} \"<name>[,...]\"      Names of environment variables"
//  *Document: No
//  *Cause: Status message for -envs(t)
// *Action: Not an error
/
_080, DEFINE_ASM_START_OPTIONS, "    -{0} <start_options>       Options to instance STARTUP command (e.g. OPEN, MOUNT, or NOMOUNT)" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_081, DEFINE_VIP, "    -{0}                 Display VIP configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_082, DEFINE_GSD, "    -{0}                 Display GSD configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_083, DEFINE_AGENT, "    -{0}                       Display EM agent configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_086, DEFINE_DBNAME, "    -{0} <db_name>             Database name (DB_NAME), if different from the unique name given by the -db option"
//  *Document: No
//  *Cause: Status message for -dbname(n)
// *Action: Not an error
/
_087, DEFINE_DBROLE, "    -{0} <role>                Role of the database (PRIMARY, PHYSICAL_STANDBY, LOGICAL_STANDBY, SNAPSHOT_STANDBY)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_088, DEFINE_STARTOPTIONS, "    -{0} <start_options>       Startup options for the database. Examples of startup options are OPEN, MOUNT, or \"READ ONLY\"."
//  *Document: No
//  *Cause: Status message for -startoption(s)
// *Action: Not an error
/
_090, DEFINE_SERV_MEMBER_UPGRADE, "    -{0}                       Upgrade instance to preferred"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_091, DEFINE_SERV_U, "    -{0}                       Add a new instance to service configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_092, DEFINE_PREF_SINGLE, "    -{0} <new_pref_inst>       Name of new preferred instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_093, DEFINE_AVAIL_SINGLE, "    -{0} <new_avail_inst>      Name of new available instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_095, DEFINE_ONS, "    -{0}                 Display ONS daemon configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_096, DEFINE_ENV_NAMEVAL_S, "    -{0} \"<name>=<val>\"      Name and value of a single environment variable"
//  *Document: No
//  *Cause: Status message for -env(T)
// *Action: Not an error
/
_097, DEFINE_STOP_SERV_DISC, "    -force                       Disconnect all sessions during stop or relocate service operations"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_098, DEFINE_INST_ASM, "    -{0} <asm_inst_name>       ASM instance name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_099, DEFINE_MOD_ASM_ADD, "    -{0} <asm_inst_name>       Create dependency on ASM instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_100, DEFINE_MOD_ASM_RM, "    -{0}                       Remove dependency on ASM instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_101, DEFINE_NODES, "    -{0} \"<node_list>\"                    Comma separated node names"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_102, DEFINE_GEN_MOD_SERV, "    -{0}                       Modify service configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_103, DEFINE_LSNR, "    -{0} \"<lsnr_list>\"            Comma separated listener names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_104, DEFINE_DBPOLICY, "    -{0} <dbpolicy>            Management policy for the database (AUTOMATIC, MANUAL, NORESTART or USERONLY)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_105, DEFINE_VIP_RELOCATE, "    -{0}                                        Relocate VIP and possibly dependent services"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_106, DEFINE_PREF_INST_LIST, "    -{0} \"<preferred_list>\"    Comma separated list of preferred instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_107, DEFINE_SCAN_NAME, "    -{0} <scan_name>          SCAN name, domain qualified for static networks"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_114, DEFINE_SCAN_NODE_NAME, "    -{0} <node_name>        SCAN VIP node name"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_115, DEFINE_SCAN_PORT, "    -{0} [TCP:]<port>[/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]           SCAN Listener endpoints"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_116, DEFINE_SCAN_LSNR_NAME_PREFIX, "    -{0} <lsnr_prefix>         SCAN listener name prefix"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_121, DEFINE_SERV_CARDNL, "    -{0} (UNIFORM | SINGLETON) Service runs on every active server in the server pool hosting this service (UNIFORM) or just one server (SINGLETON)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_122, DEFINE_SERV_POLICY, "    -{0} (NONE | BASIC | PRECONNECT)        TAF policy specification"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_128, DEFINE_SRVR_NAME_STATE, "NAME={0} STATE={1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_129, DEFINE_SRVPOOL_GROUP_NAME, "    -{0} <pool_name>           Server pool name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_130, DEFINE_SRVPOOL_IMPORTANCE, "    -{0} <importance>          Importance of the server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_131, DEFINE_SRVPOOL_MIN_CRDNL, "    -{0} <min>                 Minimum size of the server pool"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_132, DEFINE_SRVPOOL_MAX_CRDNL, "    -{0} <max>                 Maximum size of the server pool, -1 for unlimited maximum size"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_133, DEFINE_SRVPOOL_SRV_LIST, "    -{0} \"<server_list>\"       Comma separated list of candidate server names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_134, DEFINE_DETAIL_STATUS_INFO, "    -{0}                       Print detailed status information"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_136, DEFINE_SCAN_LSNR_NAME, "    -{0} <SCAN lsnr_name>      SCAN listener name"
//  *Document: No
//  *Cause: Status message for -listener <SCAN lsnr_name> 
// *Action: Not an error
/
_138, DEFINE_FORCE_STOP, "    -{0}                   Force stop"
//  *Document: No
//  *Cause: Status message for -force(f)
// *Action: Not an error
/
_139, DEFINE_LSNR_NAME, "    -{0} <lsnr_name>    Listener name"
//  *Document: No
//  *Cause: Status message for -listener(l)
// *Action: Not an error
/
_140, DEFINE_FORCE_RELOCATE, "    -{0}                                           Force relocation"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_141, DEFINE_LSNR_PORT_LIST, "    -{0} \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]\"       Comma separated TCP ports or listener endpoints"
//  *Document: No
//  *Cause: Status message for -endpoints(p)
// *Action: Not an error
/
_143, DEFINE_DETAIL_INFO, "    -{0}                     Print detailed configuration information"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
_145, DEFINE_VIP_NET_NUM, "    -{0} <network_number>             VIP network number (default number is 1)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_146, DEFINE_EONS, "    -{0}                Display eONS daemon configuration"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_147, DEFINE_VIP_ENV, "    -{0}                 Display VIP env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_148, DEFINE_GSD_ENV, "    -{0}                 Display GSD env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_149, DEFINE_ONS_ENV, "    -{0}                 Display ONS env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_150, DEFINE_EONS_ENV, "    -{0}                       Display eONS env variables"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_151, DEFINE_SCAN_ORD_NUMBER, "    -{0} <scan_ordinal_number> Ordinal number of IP address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_152, DEFINE_VIP_ADDRESS_SPEC, "    -{0}  <vip_name|ip>/<netmask>[/if1[|if2...]] VIP address specification for node applications"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_153, DEFINE_INITPARAM_NAMEVAL, "    -{0} \"<name>=<val>,..\"     Names and values of initialization parameters"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_154, DEFINE_MOD_ASM_INST_RM, "    -{0}                       Remove ASM instance names and use default instance names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_155, DEFINE_ORACLE_USER, "    -{0} <oracle_user>      Oracle user"
//  *Document: No
//  *Cause: Status message for -user(u)
// *Action: Not an error
/
_156, DEFINE_VIP_NAME, "    -{0} <vip_name>                             VIP name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_157, DEFINE_VIP_NAMES, "    -{0} \"<vip_name_list>\"                        VIP name list"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_158, DEFINE_DB_NODENAME, "    -{0} <node_name>           Node name (for single-instance databases)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_159, DEFINE_STOPOPTIONS, "    -{0} <stop_options>        Stop options for the database. Examples of shutdown options are NORMAL, TRANSACTIONAL, IMMEDIATE, or ABORT."
//  *Document: No
//  *Cause: Status message for -stopoption(o)
// *Action: Not an error
/
_160, DEFINE_DB_DISKGP_LIST, "    -{0} \"<diskgroup_list>\"    Comma separated list of disk group names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_161, DEFINE_DB_REM_DISKGP, "    -{0}                       To remove database's dependency upon disk groups"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_162, DEFINE_SUPPRESS_PROMPT, "    -{0}                To suppress prompt"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_163, DEFINE_AVAIL_INST, "    -{0} <avail_inst_name>     Name of available instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_164, DEFINE_SERV_POOL, "    -{0} <pool_name>           Server pool name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_165, DEFINE_DB_SERV_GPLIST, "    -{0} \"<serverpool_list>\"   Comma separated list of database server pool names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_167, DEFINE_NET_ADDRESS_SPEC, "    -{0}  <subnet>/<netmask>[/if1[|if2...]] NET address specification for network"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_168, DEFINE_SERVICE_ROLE, "    -{0} <role>                Role of the service (primary, physical_standby, logical_standby, snapshot_standby)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_169, DEFINE_SERVICE_POLICY, "    -{0} <policy>              Management policy for the service (AUTOMATIC or MANUAL)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_170, DEFINE_AQHA_NOTIF, "    -{0} (TRUE | FALSE)  Enable Fast Application Notification (FAN) for OCI connections"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_171, DIFINE_CLB_GOAL, "    -{0} (SHORT | LONG)                   Connection Load Balancing Goal. Default is LONG."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_172, DEFINE_RLB_GOAL, "    -{0} (SERVICE_TIME | THROUGHPUT | NONE)     Runtime Load Balancing Goal"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_173, DEFINE_DTP_FLAG, "    -{0} (TRUE | FALSE)  Distributed Transaction Processing"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_174, DEFINE_FAILOVER_TYPE, "    -{0} (NONE | SESSION | SELECT | TRANSACTION | AUTO)      Failover type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_175, DEFINE_FAILOVER_RETR, "    -{0} <failover_retries>          Number of attempts to retry connection"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_176, DEFINE_FAILOVER_DELAY, "    -{0} <failover_delay>            Failover delay (in seconds)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_177, DEFINE_OC4J_PORT, "    -{0} <oc4j_rmi_port>       OC4J RMI port number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_178, DEFINE_FAILOVER_METHOD, "    -{0} (NONE | BASIC)     Failover method"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_179, DEFINE_ONS_LOCAL_PORT, "    -{0}  <ons_local_port>      ONS listening port for local client connections"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_180, DEFINE_ONS_REMOTE_PORT, "    -{0} <ons_remote_port>     ONS listening port for connections from remote hosts"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_181, DEFINE_ONS_REMOTE_HOST_PORTLIST, "    -{0} <host>[:<port>][,<host>[:<port>]...]  List of remote host/port pairs for ONS daemons outside this cluster"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_182, DEFINE_MULTICAST_IP_ADDRESS, "    -{0} <multicast_ip_address>   The multicast IP address for eONS"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_183, DEFINE_MULTICAST_PORTNUM, "    -{0} <multicast_port_num>    The port number for eONS"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_184, DEFINE_SCAN_LSNR_UPDATE, "    -{0}                       Update SCAN listeners to match the number of SCAN VIPs"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_185, DEFINE_USER, "    -{0} \"<user_list>\"                       Comma-separated list of users authorized to mount and unmount the file system (defaults to invoking user)"
//  *Document: No
//  *Cause: Status message for -user(u).
// *Action: Not an error.
/
_186, DEFINE_VOLUME_DEVICE, "    -{0} <volume_device>                Volume device path"
//  *Document: No
//  *Cause: Status message for -device(d)
// *Action: Not an error
/
_187, DEFINE_MTPOINT_PATH, "    -{0} <mountpoint_path>              Mountpoint path"
//  *Document: No
//  *Cause: Status message for -mountpointpath(m)
// *Action: Not an error
/
_188, DEFINE_DISKGROUP_NAME, "    -{0} <dg_name>                      Diskgroup name"
//  *Document: No
//  *Cause: Status message for -diskgroup(g)
// *Action: Not an error
/
_189, DEFINE_GNS_IP_ADDRESS, "    -{0} <vip_name|ip>          VIP name or address on which GNS is to listen"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_190, DEFINE_GNS_DOMAIN, "    -{0} <domain>              Subdomain which GNS is to service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_191, DEFINE_GNS_ADVERTISE, "    -{0} <name> -{0} <address> Advertise a name through GNS using the given address."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_192, DEFINE_GNS_CREATE_ALIAS, "    -{0} <name> -{0} <alias>      Create an alias. The alias is specified through the -alias option."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_193, DEFINE_GNS_UNALIAS, "    -{0} <alias>               Delete an alias."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_194, DEFINE_GNS_RESOLVE_ADDRESS, "    -{0} <name>             Resolve the specified name through GNS."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_195, DEFINE_GNS_VALIDATE, "    -{0} <name>                Check to see if the specified name is advertised through GNS."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_196, DEFINE_GNS_FORWARDED_DOMAINS, "    -{0} <domain>[,<domain> ...]    Specify the list of domains that GNS will forward."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_197, DEFINE_GNS_REFUSED_DOMAINS, "    -{0} <domain>[,<domain> ...]   Specify the list of domains that GNS will not forward."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
// NOTE: This message is obsolete because the option is no longer supported.
//       However, it cannot be deleted from this until it is deleted from the
//       translated messages.
_198, DEFINE_GNS_EXCLUDED_INTERFACES, "    -{0} <interface>[,<interface>] Specify the interfaces that GNS will not listen on."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_199, DEFINE_GNS_LOG_LEVEL, "    -{0} <log_level>           Specify the GNS diagnostic logging level (1-6)."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_200, DEFINE_VOLUME_NAME,   "    -{0} <volume_name>                  Volume name"
//  *Document: No
//  *Cause: Status message for -volume
// *Action: Not an error
/
_201, DEFINE_SKIP_PORTS_CHECK, "    -{0}                    Skip the checking of ports"
//  *Document: No
//  *Cause: Status message for -skip(s)
// *Action: Not an error
/
_202, DEFINE_STATE_FILE_STOP, "    -{0} <state_file>   Specify a file path for the 'srvctl stop home' command to store the state of the resources"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_203, DEFINE_STATE_FILE_START, "    -{0} <state_file>   Specify the file path of the state_file created by the previous 'srvctl stop home' command"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_204, DEFINE_ASM_DISKSTRING, "    -{0} <asm_diskstring>      ASM diskgroup discovery string"
//  *Document: No
//  *Cause: Status message for -diskstring(d) <asm_diskstring>
// *Action: Not an error.
/ 
_205, DEFINE_SRVPOOL_FORCE_FLAG, "    -{0}                   Force the operation even though some resources will be stopped"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_206, DEFINE_MODINST_REM_SVC_INST, "    -{0}                  To remove existing node instance mapping for policy-managed database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_207, DEFINE_SERV_SRCN, "    -{0} <current_node>        Node name to relocate service from"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_208, DEFINE_SERV_TRGN, "    -{0} <target_node>         Node name to relocate service to"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_209, DEFINE_FORCE_ADD, "    -force                       Force the add operation even though some resource(s) will be stopped"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_210, DEFINE_SRC_SERVER_LIST, "    -{0} \"<server_list>\"       Comma separated list of server names to relocate"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_211, DEFINE_TGT_SRVPOOL_NAME, "    -{0} <pool_name>           Target server pool name into which to relocate servers"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_212, DEFINE_LSNR_ORACLE_HOME, "    -{0} <path> Oracle home path (default value is CRS_HOME)"
//  *Document: No
//  *Cause: Status message for -oraclehome(o)
// *Action: Not an error
/
_213, DEFINE_LSNR_NAME_IN_ADD, "    -{0} <lsnr_name>    Listener name (default name is LISTENER)"
//  *Document: No
//  *Cause: Status message for -listener(l)
// *Action: Not an error
/
_214, DEFINE_SRVPOOL_IMPORTANCE_IN_ADD, "    -{0} <importance>          Importance of the server pool (Default value is 0)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_215, DEFINE_SRVPOOL_MIN_CRDNL_IN_ADD, "    -{0} <min>                 Minimum size of the server pool (Default value is 0)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_216, DEFINE_SRVPOOL_MAX_CRDNL_IN_ADD, "    -{0} <max>                 Maximum size of the server pool (Default value is -1 for unlimited maximum size)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_217, DEFINE_SERVER_LIST, "    -{0} \"<server_list>\"       Comma separated list of server names"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_218, DEFINE_ALL_LSNRS, "    -{0}                     All listeners"
//  *Document: No
//  *Cause: Status message for -all(a)
// *Action: Not an error
/
_219, DEFINE_SIDB_NODENAME_IN_SP, "    -{0} <node_name>           Node name in specified server pool on which to run single-instance database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_220, DEFINE_FORCE_ADD_SERVICE, "    -{0}                       Force the add operation even though a listener is not configured for a network"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_221, DEFINE_NET_TYPE, "    -{0} '{STATIC|DHCP|AUTOCONFIG|MIXED}'    The network server type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_222, DEFINE_GNS_PARAMETER_SET, "    -{0} [<name>:<value>][,[<name>:<value>]...] Set the value of a configuration parameter."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_223, DEFINE_MODIFY_SERV_POLICY, "    -{0} (NONE | BASIC)        TAF policy specification"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_224, DEFINE_DB_FORCE_MODIFY, "    -force                       Force the modify operation to stop database and service resources on some nodes as necessary, or to change management policy of all service to match new database management policy"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/ 
_225, DEFINE_DB_TYPE, "    -{0} <type>              Type of database: RAC One Node, RAC, or Single Instance"
//  *Document: No
//  *Cause: Status message for -dbtype(c)
// *Action: Not an error
/
_226, DEFINE_RACONE_SERVER_LIST, "    -{0} \"<server_list>\"         Candidate server list for RAC One Node database"
//  *Document: No
//  *Cause: Status message for -servers
// *Action: Not an error
/
_227, DEFINE_RACONE_INSTNAME, "    -{0} <inst_name>           Instance name prefix for administrator-managed RAC One Node database (default first 12 characters of <db_unique_name>)"
//  *Document: No
//  *Cause: Status message for -instance
// *Action: Not an error
/
_228, DEFINE_RACONE_TIMEOUT, "    -{0} <timeout>       Online relocation timeout in minutes"
//  *Document: No
//  *Cause: Status message for -timeout(w)
// *Action: Not an error
/
_229, DEFINE_RACONE_DB, "    -{0} <db_unique_name>     Unique name of database to convert"
//  *Document: No
//  *Cause: Status message for -db(d)
// *Action: Not an error
/
_230, DEFINE_DB_CONVERT_TYPE_RAC, "    -{0} <type>           Type of database to which to convert: RAC"
//  *Document: No
//  *Cause: Status message for -dbtype(c)
// *Action: Not an error
/
_231, DEFINE_DB_CONVERT_TYPE_RACONENODE, "    -{0} <type>           Type of database to which to convert: RACONENODE"
//  *Document: No
//  *Cause: Status message for -dbtype(c)
// *Action: Not an error
/
_232, DEFINE_RACONE_NODE, "    -{0} <node>             Candidate server for administrator-managed RAC database to run on"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_233, DEFINE_RACONE_OMOTION_DB, "    -{0} <db_unique_name>      Unique name of database to relocate"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_234, DEFINE_TARGET, "    -{0} <target>              Target node to which to relocate database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_235, DEFINE_ABORT_OMOTION, "    -{0}                       Abort failed online relocation"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_236, DEFINE_OMOTION_TIMEOUT, "    -{0} <timeout>             Online relocation timeout in minutes"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_237, DEFINE_RACONE_NODE_START, "    -{0} <node>                Node on which to start the database (only for RAC One Node databases)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_238, DEFINE_EDITION, "    -{0} <edition>             Edition (or \"\" for empty edition value)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_239, DEFINE_START_GSD_ONLY, "    -{0}                 Start GSD only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_240, DEFINE_STOP_GSD_ONLY, "    -{0}                 Stop GSD only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_241, DEFINE_ENABLE_GSD_ONLY, "    -{0}                 Enable GSD only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_242, DEFINE_DISABLE_GSD_ONLY, "    -{0}                 Disable GSD only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_243, DEFINE_SOURCE_VERSION, "    -{0} <source_version>      Version from which to upgrade"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_244, DEFINE_DEST_VERSION, "    -{0} <destination_version> Version to which to upgrade"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_245, DEFINE_PHASE, "    -{0} <phase>          Whether the command is called from the first upgraded node or the last upgraded node (FIRST, LAST)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_246, DEFINE_NAME_VALUE_PAIRS, "    -{0} <name>=<value>[,<name>=<value>, ...] Additional name value pairs for upgrade"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_247, DEFINE_REMOVE_TARGET, "    -{0}                       Remove target node of failed online relocation request from the candidate server list of administrator-managed RAC One Node database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_248, DEFINE_CVU_CHECK_INTERVAL_IN_MINUTES, "    -{0} <check_interval_in_minutes>   Interval in minutes between checks"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_249, DEFINE_NET_NUM, "    -{0}  <network_number>                         Network number (default number is 1)"
//  *Document: No
//  *Cause: Status message for -netnum(k)
// *Action: Not an error
/
_250, DEFINE_NETWORK_TYPE, "    -{0} '{STATIC|DHCP|AUTOCONFIG|MIXED}'    Network type"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_251, DEFINE_ALL_NETWORKS, "    -{0}                                       All networks"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_252, DEFINE_NET_NUM_NO_DEFAULT, "    -{0}  <network_number>                         Network number"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_253, DEFINE_TO_VERSION, "    -{0} <to_version>          Version to which to downgrade"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_254, DEFINE_RACONE_INSTNAME_NO_DEFAULT, "    -{0} <inst_name>    Instance name prefix; required for administrator-managed RAC One Node database"
//  *Document: No
//  *Cause: Status message for -instance
// *Action: Not an error
/
_255, DEFINE_DB_ACFS_LIST, "    -{0} \"<acfs_path_list>\"    Comma separated list of ACFS paths where database's dependency will be set"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_256, DEFINE_INST_NAME, "    -{0} <inst_name>           Instance name"
//  *Document: No
//  *Cause: Status message for -instance
// *Action: Not an error
/
_257, DEFINE_TARGET_NODE, "    -{0} <node_name>                            Target node name to which to relocate"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_258, DEFINE_STOP_VIP_NAME, "    -{0} <vip_name>                             VIP name or address to stop"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_259, DEFINE_STOP_VIP_NODE, "    -{0} <node_name>                            Node name on which to stop all VIPs"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_260, DEFINE_STOP_INST_OPTIONS, "    -{0} <stop_options>        Options to instance shutdown command (e.g. NORMAL, \"TRANSACTIONAL LOCAL\", IMMEDIATE, or ABORT)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_261, DEFINE_STATE_FILE_STATUS, "    -{0} <state_file>   Specify a file path for the 'srvctl status home' command to store the state of the resources"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_262, DEFINE_PLUGGABLE_DATABASE, "    -{0} <pluggable_database>        Pluggable database name"
//  *Document: No
//  *Cause: Status message for -pdb
// *Action: Not an error
/
_263, DEFINE_GLOBAL, "    -{0} <global>        Global attribute (TRUE or FALSE)"
//  *Document: No
//  *Cause: Status message for -global
// *Action: Not an error
/
_264, DEFINE_MAX_LAG_TIME, "    -{0} <max_lag_time>        Maximum replication lag time in seconds (Non-negative integer, default value is 'ANY')"
//  *Document: No
//  *Cause: Status message for -maxlag
// *Action: Not an error
/
_265, DEFINE_GLOBAL_OVERRIDE, "    -{0} <global_override>        Override value to modify the global service attributes. Used with -role, -policy, -notification, -failovertype, -failovermethod, -failoverdelay, -failoverretry, -failover_restore, -edition, -maxlag and -gsmflags. Ignored for a non-global service."
//  *Document: No
//  *Cause: Status message for -global_override
// *Action: Not an error
/
_266, DEFINE_PWFILE, "    -pwfile <password_file_path>       Password file path"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_267, DEFINE_SCAN_LSNR_INVITED_NODES, "    -invitednodes \"<node_list>\"            Comma separated list of host names allowed to register with SCAN Listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_268, DEFINE_SCAN_LSNR_INVITED_SUBNETS, "    -invitedsubnets \"<subnet_list>\"        Comma separated list of subnets allowed to register with SCAN Listener"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_269, DEFINE_SQL_TRANSLATION_PROFILE, "    -{0} <sql_translation_profile>     Specify a database object for SQL translation profile"
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_270, DEFINE_COMMIT_OUTCOME, "    -{0} (TRUE | FALSE)          Commit outcome"
//  *Document: No
//  *Cause: Status message for -commit_outcome
// *Action: Not an error
/
_271, DEFINE_RETENTION, "    -{0} <retention>        Specifies the number of seconds the commit outcome is retained"
//  *Document: No
//  *Cause: Status message for -retention
// *Action: Not an error
/
_272, DEFINE_REPLAY_INIT_TIME, "    -{0} <replay_initiation_time>        Seconds after which replay will not be initiated"
//  *Document: No
//  *Cause: Status message for -replay_init_time
// *Action: Not an error
/
_273, DEFINE_SESSION_STATE, "    -{0} <session_state>        Session state consistency (STATIC or DYNAMIC)"
//  *Document: No
//  *Cause: Status message for -session_state
// *Action: Not an error
/
_274, DEFINE_STORAGE, "    -storage <base_path>       A location which is available on every cluster node and is not necessarily shared. This location does not need to exist during adding of Rapid Home Provisioning Server. All images will be mounted on \"<base_path>/images\"."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_275, DEFINE_GH_DISKGROUP, "    -diskgroup <dg_name>  A disk group from which to create the ACFS file systems for image storage."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_276, DEFINE_CLIENTDATA, "    -clientdata <file>          file containing client data"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_277, DEFINE_CLIENTDATA_DEST, "    -clientdata <file>          file containing client data to be updated"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_278, DEFINE_NODE_LONG, "    -node <node_name>        Node name"
//  *Document: No
//  *Cause: Status message for -node(n)
// *Action: Not an error
/
_279, DEFINE_COUNT, "    -{0} <number_of_instances>|ALL  The number of instances or ALL to have instances on all nodes"
//  *Document: No
//  *Cause: Status message for -count
// *Action: Not an error
/
_280, DEFINE_REMOTE, "    -{0}                    Flex ASM"
//  *Document: No
//  *Cause: Status message for -flex
// *Action: Not an error
/
_281, DEFINE_IPTYPE, "    -{0}  '{IPV4|IPV6|BOTH}'                   Network address type"
//  *Document: No
//  *Cause: Status message for -iptype
// *Action: Not an error
/
_282, DEFINE_EVAL, "    -{0}                 Evaluates the effects of event without making any changes to the system"
//  *Document: No
//  *Cause: Status message for -eval
// *Action: Not an error
/
_283, DEFINE_PREDICT_OFFLINE, "    -{0}                 Predicts the effect when resource goes OFFLINE unexpectedly"
//  *Document: No
//  *Cause: Status message for -offline
// *Action: Not an error
/
_284, DEFINE_FORCE_REMOVE_VOLUME, "    -force                      Remove volume resource even if it is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_285, DEFINE_PQ_POOLS, "    -{0} \"<pq_pool_list>\"   Comma separated list of parallel query server pool names"
//  *Document: No
//  *Cause: Status message for -pqpool
// *Action: Not an error
/
_286, DEFINE_PQ_SERVICE, "    -{0} <pq_service>   Parallel query service name"
//  *Document: No
//  *Cause: Status message for -pqservice
// *Action: Not an error
/
_287, DEFINE_EXPORT_PATH, "    -{0} <export_path>  ACFS file system path to be exported"
//  *Document: No
//  *Cause: Status message for -path
// *Action: Not an error
/
_288, DEFINE_EXPORTFS_NAME, "    -{0} <expfs_name>  unique name for the export file system"
//  *Document: No
//  *Cause: Status message for -name
// *Action: Not an error
/
_289, DEFINE_HAVIP_ID, "    -{0} <id>  unique ID for 'havip'"
//  *Document: No
//  *Cause: Status message for -id
// *Action: Not an error
/
_290, DEFINE_EXPORT_OPTIONS, "    -{0} <export_options>  export options for the 'exportfs' file system"
//  *Document: No
//  *Cause: Status message for -options
// *Action: Not an error
/
_291, DEFINE_EXPORT_CLIENTS, "    -{0} <export_clients>  comma separated list of clients (<hostname>|<IP address>|<subnet>) for the 'exportfs' file system. Subnet can include a wildcard in any field."
//  *Document: No
//  *Cause: Status message for -clients
// *Action: Not an error
/
_292, DEFINE_HAVIP_ADDRESS, "     -{0} <ip|name>   IP address or host name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_293, DEFINE_START_ADMINHELP_ONLY, "    -adminhelper                Start Administrator helper only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_294, DEFINE_GNS_EXPORT_CLIENTDATA, "    -{0} <filename>    File to which GNS credentials data will be written"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_295, DEFINE_GNS_IMPORT_CLIENT, "    -{0} <filename>    File from which GNS credentials data will be read"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/ 
_296, DEFINE_RESTYPE, "    -restype     Create or upgrade resource types"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_390, DEFINE_GNS_CONFIG_SUBDOMAIN, "    -{0}                       Display subdomain served by GNS"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_391, DEFINE_GNS_CONFIG_NETWORK, "    -{0}                       Display network on which GNS is listening"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_392, DEFINE_GNS_CONFIG_MULTICAST_PORT, "    -{0}                       Display the port on which the GNS daemon is listening for multicast requests"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_393, DEFINE_GNS_CONFIG_NODE_NAME, "    -{0} <node_name>        Display the configuration information for GNS on the specified node."
// *Document: No
// *Cause:    Status message for -node(n)
// *Action:   Not an error
/
_394, DEFINE_GNS_CONFIG_BRIDGE_PORT, "    -{0}                       Display the port which the GNS daemon uses to communicate with the DNS server."
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_395, DEFINE_GNS_CONFIG_STATUS, "    -{0}                       Display the status of GNS"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_396, DEFINE_GNS_CONFIG_VERSION, "    -{0}                       Display the version of GNS"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_397, DEFINE_GNS_REMOVE_ADVERTISEMENT, "    -D <name> -A <address> Remove the advertisement of a name and its address from GNS."
//  *Document: No
//  *Cause: Status message.
// *Action: Not an error.
/
_398, DEFINE_GNS_CONFIG_QUERY_NAME_RECORDS, "    -{0} <name>                Query GNS for the records belonging to a name."
// *Document: No
// *Cause: Status message.
// *Action: Not an error.
/
_399, DEFINE_GNS_CONFIG_QUERY_ALL_RECORDS, "    -{0}                       List all records in GNS."
// *Document: No
// *Cause: Status message.
// *Action: Not an error.
/
_670, DEFINE_FORCE_STOP_DB, "    -force                       Force stop, will stop database and any associated services and any dependent resources"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_671, DEFINE_FORCE_STOP_INST, "    -force                       Forcibly stop the instance and any running services."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_708, DEFINE_OC4J_FORCE_FLAG, "    -force                      This option stops and restarts the resource to effect a change"
//   *Document: No
//   *Cause:  Status message
//   *Action: Not an error
/
_791, DEFINE_GNS_IMPORT_INST_FILENAME, "    -instance <filename>     File containing exported GNS instance data."
//  *Document: No
//  *Cause: 
// *Action: 
/
_795, DEFINE_GNS_EXPORT_INST_FILENAME, "    -instance <filename>     File to which GNS instance data will be written."
//  *Document: No
//  *Cause: 
// *Action: 
/
_796, DEFINE_UPDATE_GNS_ADVERTISE, "    -{0} <name>      Name to be advertised"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_800, DEFINE_UPDATE_GNS_ADDRESS, "    -{0} <ip_address>   IP address"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_801, DEFINE_UPDATE_GNS_DELETE, "    -{0} <name>      Name of the record"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_802, DEFINE_UPDATE_GNS_CREATESRV, "    -{0} <service>      Service described by the record"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_803, DEFINE_UPDATE_GNS_TARGET, "    -{0} <target>      Name which is associated with the service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_804, DEFINE_UPDATE_GNS_PROTOCOL, "    -{0} <protocol>      Protocol used to connect to service"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_805, DEFINE_UPDATE_GNS_DELETESRV, "    -{0} <service_name>      Name of the service record to be deleted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_806, DEFINE_UPDATE_GNS_CREATETXT, "    -{0} <name>      Name of the TXT record to be added"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_807, DEFINE_UPDATE_GNS_DELETETXT, "    -{0} <name>      Name of the TXT record to be deleted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_808, DEFINE_UPDATE_GNS_CREATEPTR, "    -{0} <name>      Name of the PTR record to be created"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_809, DEFINE_UPDATE_GNS_DELETEPTR, "    -{0} <name>      Name of the PTR record to be deleted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_810, DEFINE_UPDATE_GNS_VALUE, "    -{0} <record_value>      Value of the record being added"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_811, DEFINE_UPDATE_GNS_WEIGHT, "    -{0} <weight>      Weight of the record"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_812, DEFINE_UPDATE_GNS_PRIORITY, "    -{0} <priority>      Priority of the record (Range 0 - 65535)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_813, DEFINE_CONFIG_GNS_CLUSTERGUID, "    -clusterguid             Display the globally unique identifier of the cluster where GNS is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_814, DEFINE_CONFIG_GNS_CLUSTERNAME, "    -{0}         Display the name of the cluster where GNS is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_815, DEFINE_CONFIG_GNS_LOGLEVEL, "    -{0}                Print the log level of the GNS"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_816, DEFINE_UPDATE_GNS_ALIAS, "    -{0} <alias>                Alias for the name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_817, DEFINE_UPDATE_GNS_NAME, "    -{0} <name>                Name of the alias"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_818, DEFINE_UPDATE_GNS_PORT, "    -{0} <port_number>                Port used to connect to service (Range 0 - 65535)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_819, DEFINE_UPDATE_GNS_TIMETOLIVE, "    -{0} <time_to_live>                Time to live for the record (in seconds)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_820, DEFINE_CONFIG_GNS_CLUSTERTYPE, "    -{0}             Display the type of configuration of GNS on this cluster"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_852, DEFINE_UPDATE_GNS_DELETEALIAS, "    -{0} <alias>      Name of the alias record to be deleted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__000, USAGE_SRVCTL, "Usage: srvctl <command> <object> [<options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__001, USAGE_SRVCTL_VERB_CLUSTER, "    commands: enable|disable|export|import|start|stop|relocate|status|add|remove|modify|getenv|setenv|unsetenv|config|convert|update|upgrade|downgrade|predict"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__002, USAGE_SRVCTL_NOUN_CLUSTER, "    objects: database|instance|service|nodeapps|vip|network|asm|asmnetwork|diskgroup|listener|srvpool|server|scan|scan_listener|qosmserver|home|filesystem|gns|cvu|havip|exportfs|rhpserver|rhpclient|mgmtdb|mgmtlsnr|volume|cha|mountfs|vm|ovmm|acfsrapps|oraclehome|rhpplsnr|cdp|cdpproxy|tfa|ioserver|ons|netstorageservice"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__003, USAGE_SRVCTL_DETAIL, "For detailed help on each command and object and its options use:"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__004, USAGE_SRVCTL_HELPER, "  srvctl <command> <object> -help [-compatible]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__005, USAGE_SIMPLE, "Usage: srvctl {-version | -version -fullversion | -fullversion}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__006, USAGE_ENABLE_DB, "Usage: srvctl enable database -db <db_unique_name> [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__007, USAGE_ENABLE_INST, "Usage: srvctl enable instance -db <db_unique_name> -instance \"<inst_name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__008, USAGE_ENABLE_SERV, "Usage: srvctl enable service -db <db_unique_name> -service  \"<service_name_list>\" [-instance <inst_name> | -node <node_name>] [-global_override]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__009, USAGE_DISABLE_DB, "Usage: srvctl disable database -db <db_unique_name> [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__010, USAGE_DISABLE_INST, "Usage: srvctl disable instance -db <db_unique_name> -instance \"<inst_name_list>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__011, USAGE_DISABLE_SERV, "Usage: srvctl disable service -db <db_unique_name> -service  \"<service_name_list>\" [-instance <inst_name> | -node <node_name>] [-global_override]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__012, USAGE_START_DB, "Usage: srvctl start database -db <db_unique_name> [-startoption <start_options>] [-startconcurrency <start_concurrency>] [-node <node> | -serverpool \"<serverpool_list>\"] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__013, USAGE_START_INST, "Usage: srvctl start instance {-node \"<node_list>\" | -db <db_unique_name> {-node <node_name> [-instance <inst_name>] | -node \"<node_list>\" | -instance \"<inst_name_list>\"}} [-startoption <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__014, USAGE_START_SERV, "Usage: srvctl start service { -node <node_name> | -db <db_unique_name>  [-node <node_name> | -instance <inst_name>] [-service  \"<service_name_list>\" [-pq] [-rf] |  -pdb <pluggable_database> | -serverpool <pool_name>]  [-global_override] [-role] [-startoption <start_options>] [-eval]} [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__015, USAGE_START_NODEAPPS, "Usage: srvctl start nodeapps [-node <node_name>] [-adminhelper | -onsonly] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__016, USAGE_STOP_DB, "Usage: srvctl stop database -db <db_unique_name> [-stopoption <stop_options>] [-stopconcurrency <stop_concurrency>] [-serverpool \"<serverpool_list>\"] [-drain_timeout <timeout>] [-force] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__017, USAGE_STOP_INST, "Usage: srvctl stop instance {-node \"<node_list>\" | -db <db_unique_name> {-node \"<node_list>\" | -instance \"<inst_name_list>\"}} [-stopoption <stop_options>] [-drain_timeout <timeout>] [-force] [-failover] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__018, USAGE_STOP_SERV, "Usage: srvctl stop service {-node <node_name> | -db <db_unique_name> [-pq] [-rf] [-pdb <pluggable_database> | -service \"<service_name_list>\" [-eval]] [-node <node_name> | -instance <inst_name> | -serverpool <pool_name>]} [-stopoption <stop_option>] [-drain_timeout <timeout>] [-wait {YES | NO}] [-force [-noreplay]] [-global_override] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__019, USAGE_STOP_NODEAPPS, "Usage: srvctl stop nodeapps [-node <node_name>] [-adminhelper | -onsonly | -relocate] [-force] [-verbose]"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__020, USAGE_RELOCATE_SERV, "Usage: srvctl relocate service -db <db_unique_name> [-service <service_name> | -pdb <pluggable_database>] {-oldinst <old_inst_name> [-newinst <new_inst_name>] | -currentnode <current_node> [-targetnode <target_node>]} [-drain_timeout <timeout>] [-wait <wait_option>] [-pq] [-force [-noreplay] [-stopoption <stop_option>]] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__021, USAGE_STAT_DB, "Usage: srvctl status database {-db <db_unique_name> {[-serverpool <serverpool_name>] | [-sid] [-home]}  | -serverpool <serverpool_name> | -thisversion | -thishome} [-force] [-detail] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__022, USAGE_STAT_INST, "Usage: srvctl status instance -db <db_unique_name> {-node <node_list> | -instance <inst_name_list>} [-force] [-detail] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__023, USAGE_STAT_SERV, "Usage: srvctl status service {-db <db_unique_name> [-service  \"<service_name_list>\" | -pdb <pluggable_database>] | -serverpool <serverpool_name> [-db <db_unique_name>]} [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__024, USAGE_STAT_NODEAPPS, "Usage: srvctl status nodeapps [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__025, USAGE_ADD_DB, "Usage: srvctl add database -db <db_unique_name> -oraclehome <oracle_home> [-dbtype {RACONENODE | RAC | SINGLE} [-server \"<server_list>\"] [-instance <inst_name>] [-timeout <timeout>]] [-domain <domain_name>] [-spfile <spfile>] [-pwfile <password_file_path>] [-role {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY | FAR_SYNC}] [-startoption <start_options>] [-stopoption <stop_options>] [-startconcurrency <start_concurrency>] [-stopconcurrency <stop_concurrency>] [-dbname <db_name>] [-policy {AUTOMATIC | MANUAL | NORESTART | USERONLY}] [-serverpool \"<serverpool_list>\" [-pqpool <pq_server_pools>]] [-node <node_name>] [-diskgroup \"<diskgroup_list>\"] [-acfspath \"<acfs_path_list>\"] [-eval] [-fixed] [-css_critical {YES | NO}] [-cpucount <cpu_count>] [-memorytarget <memory_target>] [-maxmemory <max_memory>] [-defaultnetnum <network_number>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__026, USAGE_ADD_INST, "Usage: srvctl add instance -db <db_unique_name> -instance <inst_name> -node <node_name> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__027, USAGE_ADD_SERV, "Usage: srvctl add service -db <db_unique_name> -service \"<service_name_list>\" \n       {-preferred \"<preferred_list>\" [-available \"<available_list>\"] [-tafpolicy {BASIC | NONE | PRECONNECT}] | -serverpool <pool_name> [-cardinality {UNIFORM | SINGLETON}] } \n       [-netnum <network_number>] [-role \"[PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]\"] [-policy {AUTOMATIC | MANUAL}] \n       [-notification {TRUE | FALSE}] [-dtp {TRUE | FALSE}] [-clbgoal {SHORT | LONG}] [-rlbgoal {NONE | SERVICE_TIME | THROUGHPUT}] \n       [-failovertype {NONE | SESSION | SELECT | TRANSACTION | AUTO}] [-failovermethod {NONE | BASIC}] [-failoverretry <failover_retries>] [-failoverdelay <failover_delay>] [-failover_restore {NONE | LEVEL1}] [-failback {YES | NO}] \n       [-edition <edition>] [-pdb <pluggable_database>] [-global {TRUE | FALSE}] [-maxlag <max_lag_time>] [-sql_translation_profile <sql_translation_profile>] \n       [-commit_outcome {TRUE | FALSE}] [-retention <retention>] [-replay_init_time <replay_initiation_time>] [-session_state {STATIC | DYNAMIC}] \n       [-pqservice <pq_service>] [-pqpool \"<pq_pool_list>\"] [-gsmflags <gsm_flags>] [-tablefamilyid <table_family_id>] [-drain_timeout <drain_timeout>] [-stopoption <stop_option>] [-css_critical {YES | NO}] [-rfpool <pool_name> -hubsvc <hub_service>]\n       [-force] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__028, USAGE_ADD_NODEAPPS, "Usage: srvctl add nodeapps { { -node <node_name> -address {<vip_name>|<ip>}/<netmask>[/if1[|if2...]] } | { -subnet <subnet>/<netmask>[/if1[|if2...]] } } [-emport <em_port>] [-onslocalport <ons_local_port>]  [-onsremoteport <ons_remote_port>] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__029,USAGE_SRVCTL_HELPER1, "  srvctl <command> -help [-compatible] or"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__030, USAGE_REMOVE_DB, "Usage: srvctl remove database -db <db_unique_name> [-force] [-noprompt] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__031, USAGE_REMOVE_INST, "Usage: srvctl remove instance -db <db_unique_name> -instance <inst_name> [-force] [-noprompt]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__032, USAGE_REMOVE_SERV, "Usage: srvctl remove service -db <db_unique_name> -service <service_name>  [-global_override] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__033, USAGE_REMOVE_NODEAPPS, "Usage: srvctl remove nodeapps [-force] [-noprompt] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__035, USAGE_MODIFY_INST, "Usage: srvctl modify instance -db <db_unique_name> -instance <inst_name> -node <node_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__036, USAGE_SETENV_DB, "Usage: srvctl setenv database -db <db_unique_name> {-envs \"<name>=<val>[,...]\" | -env \"<name>=<val>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__037, SRVCTL_PURPOSE_STR, "\nServer Control Utility (SRVCTL) is used to configure and administer clusterwide and node level  resources managed by Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__038, SRVCTL_SIPURPOSE_STR, "\nServer Control Utility (SRVCTL) is used to configure and administer Oracle Restart resources.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__039, USAGE_SETENV_NODEAPPS, "Usage: srvctl setenv nodeapps {-envs \"<name>=<val>[,...]\" | -env \"<name>=<val>\"} [-viponly | -onsonly] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__040, USAGE_UNSETENV_DB, "Usage: srvctl unsetenv database -db <db_unique_name> -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__041, USAGE_SRVCTL_VERB_SIHA, "    commands: enable|disable|start|stop|status|add|remove|modify|update|getenv|setenv|unsetenv|config|upgrade|downgrade"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__042, USAGE_SRVCTL_NOUN_SIHA, "    objects: database|service|asm|diskgroup|listener|home|ons|oraclehome"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__043, USAGE_UNSETENV_NODEAPPS, "Usage: srvctl unsetenv nodeapps -envs \"<name>[,...]\" [-viponly | -onsonly] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__044, USAGE_GETENV_DB, "Usage: srvctl getenv database -db <db_unique_name> [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__047, USAGE_GETENV_NODEAPPS, "Usage: srvctl getenv nodeapps [-viponly] [-onsonly] [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__048, USAGE_CONFIG_DB, "Usage: srvctl config database [-db <db_unique_name> [-all] | -serverpool <serverpool_name> | -home] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__049, USAGE_CONFIG_DB_ONE, "Usage: srvctl config database -db <db_unique_name> [-all] [-t]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__050, USAGE_CONFIG_SERV, "Usage: srvctl config service {-db <db_unique_name> [-service <service_name>] | -serverpool <serverpool_name> [-db <db_unique_name>]} [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__051, USAGE_CONFIG_NODEAPPS, "Usage: srvctl config nodeapps [-viponly] [-onsonly]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__053, USAGE_MODIFY_DB, "Usage: srvctl modify database -db <db_unique_name> [-dbname <db_name>] [-instance <instance_name>] [-oraclehome <oracle_home>] [-user <oracle_user>] [-server \"<server_list>\"] [-timeout <timeout>] [-domain <domain>] [-spfile <spfile>] [-pwfile <password_file_path>] [-role {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY}] [-startoption <start_options>] [-stopoption <stop_options>] [-startconcurrency <start_concurrency>] [-stopconcurrency <stop_concurrency>][-policy {AUTOMATIC | MANUAL | NORESTART | USERONLY}] [-serverpool \"<serverpool_list>\" [-node <node_name>]] [-pqpool <pq_server_pools>] [-diskgroup \"<diskgroup_list>\"|-nodiskgroup] [-acfspath \"<acfs_path_list>\"] [-css_critical {YES | NO}] [-cpucount <cpu_count> [-overridepools <overridepool_list>]] [-memorytarget <memory_target>] [-maxmemory <max_memory>] [-defaultnetnum <network_number>] [-disabledreason {DECOMMISSIONED}] [-force] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__054, USAGE_MODIFY_SERVICE_1, "Usage: srvctl modify service -db <db_unique_name> -service <service_name> -oldinst <old_inst_name> -newinst <new_inst_name> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__055, USAGE_MODIFY_SERVICE_2, "Usage: srvctl modify service -db <db_unique_name> -service <service_name> -available <avail_inst_name> -toprefer [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__056, USAGE_MODIFY_NODEAPPS, "Usage: srvctl modify nodeapps {[-node <node_name> -address {<vip_name>|<ip>}/<netmask>[/if1[|if2...]]] | [-subnet <subnet>/<netmask>[/if1[|if2|...]]]} [-nettype {STATIC|DHCP|AUTOCONFIG|MIXED}] [-emport <em_port>] [ -onslocalport <ons_local_port> ] [-onsremoteport <ons_remote_port> ] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__057, USAGE_ADD_SERV_U, "Usage: srvctl add service -db <db_unique_name> -service \"<service_name_list>\" -update {-preferred \"<new_pref_inst>\" | -available \"<new_avail_inst>\"} [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__058, USAGE_ADD_ASM, "Usage: srvctl add asm {[-proxy [-spfile <spfile>]] | [-listener <lsnr_name>] [-pwfile <password_file_path>] [-pwfilebackup <backup_password_file_path>] [-flex [-count {<number_of_instances>|ALL}] [-spfile <spfile>]]} "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__059, USAGE_REMOVE_ASM, "Usage: srvctl remove asm [-proxy] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__060, USAGE_CONFIG_ASM, "Usage: srvctl config asm [-proxy] [-detail]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__061, USAGE_MODIFY_INST_ASM, "Usage: srvctl modify asm [ -node <node_name> {-instance <asm_inst_name> | -z } ] [-oraclehome <oracle_home>] [-spfile <spfile> | -m \"<name>=<value> [, ...]\"] [-pwfile <password_file_path>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__062, USAGE_START_ASM, "Usage: srvctl start asm [-proxy] [-node <node_name>] [-startoption <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__063, USAGE_STOP_ASM, "Usage: srvctl stop asm [-proxy] [-node <node_name>] [-stopoption <stop_options>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__064, USAGE_STAT_ASM, "Usage: srvctl status asm [-proxy] [-node <node_name>] [-detail] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__065, USAGE_ENABLE_ASM, "Usage: srvctl enable asm [-proxy] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__066, USAGE_DISABLE_ASM, "Usage: srvctl disable asm [-proxy] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__067, USAGE_MODIFY_ASM, "Usage: srvctl modify asm {[-proxy -spfile <spfile_path>] | [-pwfile <password_file_path>] [-pwfilebackup <backup_password_file_path>] [-listener <lsnr_name>] [-count {<number_of_instances>|ALL}] [-spfile <spfile_path>]} [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__068, USAGE_MODIFY_SERVICE_3, "Usage: srvctl modify service -db <db_unique_name> -service <service_name> -modifyconfig -preferred \"<preferred_list>\" [-available \"<available_list>\"] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__069, USAGE_MODIFY_SERVICE_4, "Usage: srvctl modify service -db <db_unique_name> -service <service_name> \n       {[-oldinst <old_inst_name> -newinst <new_inst_name>  | -available <avail_inst_name> -toprefer | -modifyconfig -preferred \"<preferred_list>\" [-available \"<available_list>\"]] \n       | [-serverpool <pool_name>] [-pqservice <pqsvc_name>] [-pqpool \"<pq_pool_list>\"] [-cardinality {UNIFORM | SINGLETON}] [-tafpolicy {BASIC | NONE}] \n       [-role [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-policy {AUTOMATIC | MANUAL}] [-notification {TRUE | FALSE}] \n       [-dtp {TRUE | FALSE}] [-clbgoal {SHORT | LONG}] [-rlbgoal {NONE | SERVICE_TIME | THROUGHPUT}] \n       [-failovertype {NONE | SESSION | SELECT | TRANSACTION | AUTO}] [-failoverretry <integer>] [-failoverdelay <integer>] [-failover_restore {NONE | LEVEL1 | AUTO}] [-failback {YES | NO}] \n       [-edition <edition>] [-pdb <pluggable_database>] [-sql_translation_profile <sql_translation_profile>] [-commit_outcome {TRUE|FALSE}] [-retention <retention>] \n       [-replay_init_time <replay_initiation_time>] [-session_state {STATIC | DYNAMIC | AUTO}] [-maxlag <max_lag_time>] [-gsmflags <gsm_flags>] [-tablefamilyid <table_family_id>] [-drain_timeout <timeout>] [-stopoption <stop_option>] \n       [-global_override] [-css_critical {YES | NO}] [-rfpool <pool_name> -hubsvc <hub_service>]} [-eval] [-verbose] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__070, USAGE_CONFIG_LISTENER, "Usage: srvctl config listener [-listener <lsnr_name> | -asmlistener] [-all]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__071, USAGE_START_LISTENER, "Usage: srvctl start listener [-listener <lsnr_name>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__072, USAGE_STOP_LISTENER, "Usage: srvctl stop listener [-listener <lsnr_name>] [-node <node_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__073, USAGE_MODIFY_LISTENER, "Usage: srvctl modify listener [-listener <lsnr_name>] [-oraclehome <path>] [-endpoints \"[TCP:]<port>[, ...][:FIREWALL={ON|OFF}][/IPC:<key>][/NMP:<pipe_name>][/{TCPS|SDP|EXADIRECT}<port>[:FIREWALL={ON|OFF}]]\"] [-group <group>] [-user <oracle_user>] [-netnum <network_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__074, USAGE_ADD_LISTENER, "Usage: srvctl add listener [-listener <lsnr_name>] {[-netnum <network_number>] [-oraclehome <path>] [-user <oracle_user>] | -asmlistener [-subnet <subnet>]} [-skip] [-endpoints \"[TCP:]<port>[, ...][:FIREWALL={ON|OFF}][/IPC:<key>][/NMP:<pipe_name>][/{TCPS|SDP|EXADIRECT}<port>[:FIREWALL={ON|OFF}]]\" [-group <group>]] [-invitednodes \"<node_list>\"] [-invitedsubnets \"<subnet_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__075, USAGE_REMOVE_LISTENER, "Usage: srvctl remove listener [-listener <lsnr_name> | -all] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__076, USAGE_ADD_SCAN, "Usage: srvctl add scan {-scanname <scan_name> | -clientdata <filename>} [-netnum <network_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__077, USAGE_CONFIG_SCAN, "Usage: srvctl config scan [[-netnum <network_number>] [-scannumber <scan_ordinal_number>] | -all]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__078, USAGE_START_SCAN, "Usage: srvctl start scan [-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__079, USAGE_STOP_SCAN, "Usage: srvctl stop scan [-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__080, USAGE_RELOCATE_SCAN, "Usage: srvctl relocate scan -scannumber <scan_ordinal_number> [-netnum <network_number>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__081, USAGE_STATUS_SCAN, "Usage: srvctl status scan [[-netnum <network_number>] [-scannumber <scan_ordinal_number>] | -all] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__082, USAGE_ENABLE_SCAN, "Usage: srvctl enable scan [-netnum <network_number>] [-scannumber <scan_ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__083, USAGE_DISABLE_SCAN, "Usage: srvctl disable scan [-netnum <network_number>] [-scannumber <scan_ordinal_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__084, USAGE_MODIFY_SCAN, "Usage: srvctl modify scan -scanname <scan_name> [-netnum <network_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__085, USAGE_REMOVE_SCAN, "Usage: srvctl remove scan [-netnum <network_number>] [-force] [-noprompt]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__086, USAGE_ADD_SCAN_LISTENER, "Usage: srvctl add scan_listener [-netnum <network_number>] [-listener <lsnr_name_prefix>] [-skip] [-endpoints [TCP:]<port>[/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]] [-invitednodes \"<node_list>\"] [-invitedsubnets \"<subnet_list>\"] [-clientcluster <cluster_name>] [-clientdata <filename>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__087, USAGE_CONFIG_SCAN_LISTENER, "Usage: srvctl config scan_listener [[-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-clientcluster <cluster_name>] | -all]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__088, USAGE_START_SCAN_LISTENER, "Usage: srvctl start scan_listener [-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-node <node_name>] [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__089, USAGE_STOP_SCAN_LISTENER, "Usage: srvctl stop scan_listener [-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-clientcluster <cluster_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__090, USAGE_RELOCATE_SCAN_LISTENER, "Usage: srvctl relocate scan_listener -scannumber <scan_ordinal_number> [-netnum <network_number>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__091, USAGE_STATUS_SCAN_LISTENER, "Usage: srvctl status scan_listener [[-netnum <network_number>] [-scannumber <scan_ordinal_number>] | [-clientcluster <cluster_name>] | -all] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__092, USAGE_ENABLE_SCAN_LISTENER, "Usage: srvctl enable scan_listener [-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__093, USAGE_DISABLE_SCAN_LISTENER, "Usage: srvctl disable scan_listener [-netnum <network_number>] [-scannumber <scan_ordinal_number>] [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__094, USAGE_MODIFY_SCAN_LISTENER, "Usage: srvctl modify scan_listener {-update|-endpoints [TCP:]<port>[/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]} [-netnum <network_number>] [-invitednodes \"<node_list>\"] [-invitedsubnets \"<subnet_list>\"] [-clientcluster <cluster_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__095, USAGE_REMOVE_SCAN_LISTENER, "Usage: srvctl remove scan_listener [-netnum <network_number>] [-clientcluster <cluster_name>] [-force] [-noprompt]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__096, USAGE_RELOCATE_VIP, "Usage: srvctl relocate vip -vip <vip_name> [-node <node_name>] [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__099, USAGE_ADD_SRVPOOL, "Usage: srvctl add srvpool -serverpool <pool_name> [-min <min>] [-max <max>] [-importance <importance>] [-servers \"<server_list>\" | -category <server_category>] [-force] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__100, USAGE_CONFIG_SRVPOOL, "Usage: srvctl config srvpool [-serverpool <pool_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__101, USAGE_STATUS_SRVPOOL, "Usage: srvctl status srvpool [-serverpool <pool_name>] [-detail]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__102, USAGE_RELOCATE_SERVER, "Usage: srvctl relocate server -servers \"<server_list>\" -serverpool <pool_name> [-force] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__103, USAGE_STATUS_SERVER, "Usage: srvctl status server -servers \"<server_list>\" [-detail]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__104, USAGE_MODIFY_SRVPOOL, "Usage: srvctl modify srvpool -serverpool <pool_name> [-min <min>] [-max <max>] [-importance <importance>] [-servers \"<server_list>\" | -category <server_category>] [-force] [-eval] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__105, USAGE_REMOVE_SRVPOOL, "Usage: srvctl remove srvpool -serverpool <pool_name> [-eval] [-verbose]"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__106, USAGE_ENABLE_LISTENER, "Usage: srvctl enable listener [-listener <lsnr_name>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__107, USAGE_DISABLE_LISTENER, "Usage: srvctl disable listener [-listener <lsnr_name>] [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__108, USAGE_STAT_LISTENER, "Usage: srvctl status listener [-listener <lsnr_name>] [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__109, USAGE_GETENV_LISTENER, "Usage: srvctl getenv listener [-listener <lsnr_name>] [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__110, USAGE_SETENV_LISTENER, "Usage: srvctl setenv listener [-listener <lsnr_name>] {-envs \"<name>=<val>[,...]\" | -env \"<name>=<value>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__111, USAGE_UNSETENV_LISTENER, "Usage: srvctl unsetenv listener [-listener <lsnr_name>] -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__112, USAGE_SI_ADD_LISTENER, "Usage: srvctl add listener [-listener <lsnr_name>] [-skip] [-endpoints \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]\"] [-oraclehome <path>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__113, USAGE_SI_CONFIG_LISTENER, "Usage: srvctl config listener [-listener <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__114, USAGE_SI_START_LISTENER, "Usage: srvctl start listener [-listener <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__115, USAGE_SI_STOP_LISTENER, "Usage: srvctl stop listener [-listener <lsnr_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__116, USAGE_SI_MODIFY_LISTENER, "Usage: srvctl modify listener [-listener <lsnr_name>] [-oraclehome <path>] [-endpoints \"[TCP:]<port>[, ...][/IPC:<key>][/NMP:<pipe_name>][/TCPS:<s_port>][/SDP:<port>][/EXADIRECT:<port>]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__117, USAGE_SI_GETENV_LISTENER, "Usage: srvctl getenv listener [-listener <lsnr_name>] [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__118, USAGE_SI_SETENV_LISTENER, "Usage: srvctl setenv listener [-listener <lsnr_name>] -envs \"<name>=<val>[,...]\" | -env \"<name>=<value>\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__119, USAGE_SI_UNSETENV_LISTENER, "Usage: srvctl unsetenv listener [-listener <lsnr_name>] -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__120, USAGE_SI_ENABLE_LISTENER, "Usage: srvctl enable listener [-listener <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__121, USAGE_SI_DISABLE_LISTENER, "Usage: srvctl disable listener [-listener <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__122, USAGE_SI_REMOVE_LISTENER, "Usage: srvctl remove listener [-listener <lsnr_name> | -all] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__128, USAGE_SI_STAT_LISTENER, "Usage: srvctl status listener [-listener <lsnr_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__129, USAGE_SI_ENABLE_DB, "Usage: srvctl enable database -db <db_unique_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__130, USAGE_SI_DISABLE_DB, "Usage: srvctl disable database -db <db_unique_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__131, USAGE_SI_START_DB, "Usage: srvctl start database -db <db_unique_name> [-startoption <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__132, USAGE_SI_STOP_DB, "Usage: srvctl stop database -db <db_unique_name> [-stopoption <stop_options>] [-drain_timeout <timeout>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__133, USAGE_SI_STAT_DB, "Usage: srvctl status database {-db <db_unique_name> [-sid] [-home] | -thisversion | -thishome} [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__134, USAGE_SI_REMOVE_DB, "Usage: srvctl remove database -db <db_unique_name> [-force] [-noprompt] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__135, USAGE_SI_SETENV_DB, "Usage: srvctl setenv database -db <db_unique_name> {-envs \"<name>=<val>[,...]\" | -env \"<name>=<val>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__136, USAGE_SI_UNSETENV_DB, "Usage: srvctl unsetenv database -db <db_unique_name> -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__137, USAGE_SI_GETENV_DB, "Usage: srvctl getenv database -db <db_unique_name> [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__138, USAGE_SI_CONFIG_DB, "Usage: srvctl config database [-db <db_unique_name> [-all] | -home] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__139, USAGE_SI_MODIFY_DB, "Usage: srvctl modify database -db <db_unique_name> [-dbname <db_name>] [-instance <inst_name>] [-oraclehome <oracle_home>] [-user <oracle_user>] [-domain <domain>] [-spfile <spfile>] [-pwfile <password_file_path>] [-role {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY}] [-startoption <start_options>] [-stopoption <stop_options>] [-policy {AUTOMATIC | MANUAL | NORESTART | USERONLY}] [-diskgroup \"<diskgroup_list>\"|-nodiskgroup] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__140, USAGE_SI_ADD_DB, "Usage: srvctl add database -db <db_unique_name> -oraclehome <oracle_home> [-domain <domain_name>] [-spfile <spfile>] [-pwfile <password_file_path>] [-role {PRIMARY | PHYSICAL_STANDBY | LOGICAL_STANDBY | SNAPSHOT_STANDBY | FAR_SYNC}] [-startoption <start_options>] [-stopoption <stop_options>] [-dbname <db_name>] [-instance <inst_name>] [-policy {AUTOMATIC | MANUAL | NORESTART | USERONLY}] [-diskgroup \"<diskgroup_list>\"] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__141, USAGE_SI_CONFIG_DB_ONE, "Usage: srvctl config database -db <db_unique_name> [-all] [-t]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__148, USAGE_ENABLE_NODEAPPS, "Usage: srvctl enable nodeapps [-adminhelper] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__149, USAGE_DISABLE_NODEAPPS, "Usage: srvctl disable nodeapps [-adminhelper] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__150, USAGE_SI_ADD_ASM, "Usage: srvctl add asm [-listener <lsnr_name>] [-spfile <spfile>] [-pwfile <password_file_path>] [-diskstring <asm_diskstring>]" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__151, USAGE_SI_ENABLE_ASM, "Usage: srvctl enable asm"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__152, USAGE_SI_DISABLE_ASM, "Usage: srvctl disable asm"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__153, USAGE_SI_START_ASM, "Usage: srvctl start asm [-startoption <start_options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__154, USAGE_SI_STOP_ASM, "Usage: srvctl stop asm [-stopoption <stop_options>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__155, USAGE_SI_STAT_ASM, "Usage: srvctl status asm [-all] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__156, USAGE_SI_REMOVE_ASM, "Usage: srvctl remove asm [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__157, USAGE_SI_MODIFY_ASM, "Usage: srvctl modify asm [-listener <lsnr_name>] [-spfile <spfile>] [-pwfile <password_file_path>] [-diskstring <asm_diskstring>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__158, USAGE_SI_CONFIG_ASM, "Usage: srvctl config asm [-detail]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__159, USAGE_GETENV_ASM, "Usage: srvctl getenv asm [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__160, USAGE_SETENV_ASM, "Usage: srvctl setenv asm {-envs \"<name>=<val>[,...]\" | -env \"<name>=<value>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__161, USAGE_UNSETENV_ASM, "Usage: srvctl unsetenv asm -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__162, USAGE_ADD_VIP, "Usage: srvctl add vip -node <node_name> -netnum <network_number> [-address {<name>|<ip>}/<netmask>[/if1[|if2...]]] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__163, USAGE_CONFIG_VIP, "Usage: srvctl config vip {-node <node_name> | -vip <vip_name>}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__164, USAGE_REMOVE_VIP, "Usage: srvctl remove vip -vip <\"vip_name_list\"> [-force] [-noprompt] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__165, USAGE_START_VIP, "Usage: srvctl start vip {-node <node_name> [-netnum <network_number>] | -vip <vip_name>} [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__166, USAGE_STOP_VIP, "Usage: srvctl stop vip {-node <node_name> [-netnum <network_number>] | -vip <vip_name>} [-force] [-relocate] [-verbose]"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__167, USAGE_STAT_VIP, "Usage: srvctl status vip {-node <node_name> | -vip <vip_name>} [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__168, USAGE_ENABLE_VIP, "Usage: srvctl enable vip -vip <vip_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__169, USAGE_DISABLE_VIP, "Usage: srvctl disable vip -vip <vip_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__170, USAGE_GETENV_VIP, "Usage: srvctl getenv vip -vip <vip_name> [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__171, USAGE_SETENV_VIP, "Usage: srvctl setenv vip -vip <vip_name> {-envs \"<name>=<val>[,...]\" | -env \"<name>=<val>\"} [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__172, USAGE_UNSETENV_VIP, "Usage: srvctl unsetenv vip -vip <vip_name> -envs \"<name>[,...]\" [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__173, USAGE_CONFIG_OC4J, "Usage: srvctl config oc4j"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__174, USAGE_START_OC4J, "Usage: srvctl start oc4j [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__175, USAGE_STOP_OC4J, "Usage: srvctl stop oc4j [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__176, USAGE_STAT_OC4J, "Usage: srvctl status oc4j [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__177, USAGE_ADD_OC4J, "Usage: srvctl add oc4j [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__178, USAGE_REMOVE_OC4J, "Usage: srvctl remove oc4j [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__179, USAGE_ENABLE_OC4J, "Usage: srvctl enable oc4j [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__180, USAGE_DISABLE_OC4J, "Usage: srvctl disable oc4j [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__181, USAGE_MODIFY_OC4J, "Usage: srvctl modify oc4j [-rmiport <oc4j_rmi_port>] [-httpport <oc4j_http_port>] [-verbose] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__182, USAGE_RELOCATE_OC4J, "Usage: srvctl relocate oc4j [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__183, USAGE_START_HOME, "Usage: srvctl start home -oraclehome <oracle_home> -statefile <state_file> -node <node_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__184, USAGE_STOP_HOME, "Usage: srvctl stop home -oraclehome <oracle_home> -statefile <state_file> -node <node_name> [-stopoption <stop_options>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__185, USAGE_STAT_HOME, "Usage: srvctl status home -oraclehome <oracle_home> -statefile <state_file> -node <node_name>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__186, USAGE_SI_ADD_SERV, "Usage: srvctl add service -db <db_unique_name> -service \"<service_name_list>\" \n       [-role [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-policy {AUTOMATIC | MANUAL}] \n       [-notification {TRUE | FALSE}] [-clbgoal {SHORT | LONG}] [-rlbgoal {NONE | SERVICE_TIME | THROUGHPUT}] \n       [-failovertype {NONE | SESSION | SELECT | TRANSACTION | AUTO}] [-failovermethod {NONE | BASIC}][-failoverretry <failover_retries>] [-failoverdelay <failover_delay>] [-failover_restore {NONE | LEVEL1}] \n       [-edition <edition>] [-pdb <pluggable_database>] [-global <TRUE | FALSE>] [-maxlag <max_lag_time>] [-sql_translation_profile <sql_translation_profile>] \n       [-commit_outcome {TRUE | FALSE}] [-retention <retention>] [replay_init_time <replay_initiation_time>] [-tablefamilyid <table_family_id>] [-drain_timeout <timeout>] \n       [-stopoption <stop_option>] [-session_state {STATIC | DYNAMIC}] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__187, USAGE_SI_MODIFY_SERVICE, "Usage: srvctl modify service -db <db_unique_name> -service <service_name> \n       [-role [PRIMARY][,PHYSICAL_STANDBY][,LOGICAL_STANDBY][,SNAPSHOT_STANDBY]] [-policy {AUTOMATIC | MANUAL}] \n       [-notification {TRUE | FALSE}] [-clbgoal {SHORT | LONG}] [-rlbgoal {NONE | SERVICE_TIME | THROUGHPUT}] \n       [-failovertype {NONE | SESSION | SELECT | TRANSACTION | AUTO}] [-failovermethod {NONE | BASIC}] [-failoverretry <integer>] [-failoverdelay <integer>] [-failover_restore {NONE | LEVEL1}] \n       [-edition <edition>] [-pdb <pluggable_database>] [-sql_translation_profile <sql_translation_profile>] [-commit_outcome {TRUE | FALSE}] \n       [-retention <retention>] [replay_init_time <replay_initiation_time>] [-tablefamilyid <table_family_id>] [-drain_timeout <timeout>] [-stopoption <stop_option>] \n       [-session_state {STATIC | DYNAMIC}] [-global_override]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__188, USAGE_SI_START_SERV, "Usage: srvctl start service -db <db_unique_name> [-service  \"<service_name_list>\" | -pdb <pluggable_database>] [-startoption <start_options>] [-global_override] [-role] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__189, USAGE_SI_STOP_SERV, "Usage: srvctl stop service -db <db_unique_name> [-service  \"<service_name_list>\" | -pdb <pluggable_database>] [-drain_timeout <timeout>] [-stopoption <stop_option>] [-global_override] [-wait <wait_option>] [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__190, USAGE_SI_DISABLE_SERV, "Usage: srvctl disable service -db <db_unique_name> -service  \"<service_name_list>\" [-global_override]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__191, USAGE_SI_ENABLE_SERV, "Usage: srvctl enable service -db <db_unique_name> -service  \"<service_name_list>\" [-global_override]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__192, USAGE_SI_REMOVE_SERV, "Usage: srvctl remove service -db <db_unique_name> -service <service_name> [-global_override] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__193, USAGE_ADD_FS, "Usage: srvctl add filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>} -path <mountpoint_path> [-node \"<node_list>\" | -serverpool \"<serverpool_list>\"] [-user \"<user_list>\"] [-mountowner <user_name>] [-mountgroup <group_name>] [-mountperm <octal_permission>] [-fstype {0}] [-fsoptions <options>] [-description <description>] [-appid <application_id>] [-autostart '{ALWAYS|NEVER|RESTORE}'] [-acceleratorvols <volume_device>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__194, USAGE_CONFIG_FS, "Usage: srvctl config filesystem [-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__195, USAGE_START_FS, "Usage: srvctl start filesystem {-device <volume_device_list> | -volume <volume_name_list> -diskgroup <dg_name_list>} [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__196, USAGE_STAT_FS, "Usage: srvctl status filesystem [-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__197, USAGE_STOP_FS, "Usage: srvctl stop filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>} [-node <node_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__198, USAGE_MODIFY_FS, "Usage: srvctl modify filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>} [-user {/+|/-}<user_name> | \"<user_list>\"] [-mountowner <user_name>] [-mountgroup <group_name>] [-mountperm <octal_permission>] [-path <mountpoint_path>] [-node \"<node_list>\" | -serverpool \"<serverpool_list>\"] [-fsoptions <options>] [-description <description>] [-autostart  {ALWAYS|NEVER|RESTORE}] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__199, USAGE_REMOVE_FS, "Usage: srvctl remove filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>} [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__200, USAGE_ENABLE_FS, "Usage: srvctl enable filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__201, USAGE_DISABLE_FS, "Usage: srvctl disable filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>}"
//  *Document: No
//  *Cause: 
// *Action: 
/
__210, USAGE_START_DISKGROUP, "Usage: srvctl start diskgroup -diskgroup <dg_name> [-node \"<node_list>\"]"
//  *Cause: 
// *Action: 
/
__211, USAGE_SI_START_DISKGROUP, "Usage: srvctl start diskgroup -diskgroup <dg_name>"
//  *Cause: 
// *Action: 
/
__212, USAGE_STAT_DISKGROUP, "Usage: srvctl status diskgroup -diskgroup <dg_name> [-node \"<node_list>\"] [-detail] [-verbose]"
//  *Cause: 
// *Action: 
/
__213, USAGE_SI_STAT_DISKGROUP, "Usage: srvctl status diskgroup -diskgroup <dg_name> [-all] [-verbose]"
//  *Cause: 
// *Action: 
/
__214, USAGE_STOP_DISKGROUP, "Usage: srvctl stop diskgroup -diskgroup <dg_name> [-node \"<node_list>\"] [-force]"
//  *Cause: 
// *Action: 
/
__215, USAGE_SI_STOP_DISKGROUP, "Usage: srvctl stop diskgroup -diskgroup <dg_name> [-force]"
//  *Cause: 
// *Action: 
/
__216, USAGE_ENABLE_DISKGROUP, "Usage: srvctl enable diskgroup -diskgroup <dg_name> [-node \"<node_list>\"]"
//  *Cause: 
// *Action: 
/
__217, USAGE_SI_ENABLE_DISKGROUP, "Usage: srvctl enable diskgroup -diskgroup <dg_name>"
//  *Cause: 
// *Action: 
/
__218, USAGE_DISABLE_DISKGROUP, "Usage: srvctl disable diskgroup -diskgroup <dg_name> [-node \"<node_list>\"]"
//  *Cause: 
// *Action: 
/
__219, USAGE_SI_DISABLE_DISKGROUP, "Usage: srvctl disable diskgroup -diskgroup <dg_name>"
//  *Cause: 
// *Action: 
/
__220, USAGE_REMOVE_DISKGROUP, "Usage: srvctl remove diskgroup -diskgroup <dg_name> [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__221, USAGE_PREDICT_DB, "Usage: srvctl predict database -db <database_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__222, USAGE_PREDICT_SERV, "Usage: srvctl predict service -db <database_name> -service <service_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__223, USAGE_PREDICT_ASM, "Usage: srvctl predict asm [-node <node_name>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__224, USAGE_PREDICT_DISKGROUP, "Usage: srvctl predict diskgroup -diskgroup <diskgroup_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__225, USAGE_PREDICT_FS, "Usage: srvctl predict filesystem {-device <volume_device> | -volume <volume_name> -diskgroup <dg_name>} [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__226, USAGE_PREDICT_VIP, "Usage: srvctl predict vip -vip <vip_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__227, USAGE_PREDICT_NETWORK, "Usage: srvctl predict network [-netnum <network_number>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__228, USAGE_PREDICT_LISTENER, "Usage: srvctl predict listener -listener <listener_name> [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__229, USAGE_PREDICT_SCAN, "Usage: srvctl predict scan -scannumber <scan_ordinal_number> [-netnum <network_number>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__230, USAGE_PREDICT_SCAN_LISTENER, "Usage: srvctl predict scan_listener -scannumber <scan_ordinal_number> [-netnum <network_number>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__231, USAGE_PREDICT_OC4J, "Usage: srvctl predict oc4j [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__232, VERB_ENABLE_DESCRIPTION, "\nThe SRVCTL enable command enables the named object so that it can run under {0} for automatic startup, failover, or restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__233, VERB_DISABLE_DESCRIPTION, "\nThe SRVCTL disable command disables the named object so that it is unavailable to run under {0} for automatic startup, failover, or restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__234, VERB_START_DESCRIPTION, "\nThe SRVCTL start command starts, {0} enabled, non-running objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__235, VERB_STOP_DESCRIPTION, "\nThe SRVCTL stop command stops, {0} enabled, starting or running objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__236, VERB_RELOCATE_DESCRIPTION, "\nThe SRVCTL relocate command relocates a running Oracle Clusterware managed object to another node or instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__237, VERB_STATUS_DESCRIPTION, "\nThe SRVCTL status command displays the current state of the object.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__238, VERB_ADD_DESCRIPTION, "\nThe SRVCTL add command adds the configuration and the {0} application to the OCR for the cluster database, named instances, named services, or for the named nodes.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__239, VERB_REMOVE_DESCRIPTION, "\nThe SRVCTL remove command removes the configuration, for the object from the {0}. Environment settings for the object are also removed.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__240, VERB_MODIFY_DESCRIPTION, "\nThe SRVCTL modify command enables user to modify configuration of the object without removing and adding {0} resources. The changes takes effect when the application is restarted.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__241, VERB_SETENV_DESCRIPTION, "\nThe SRVCTL setenv command sets values for the environment in the configuration file. It allows users to administer environment configuration for the objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__242, VERB_UNSETENV_DESCRIPTION, "\nThe SRVCTL unsetenv command unsets values for the environment in the configuration file. It allows users to administer environment configuration for the objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__243, VERB_GETENV_DESCRIPTION, "\nThe SRVCTL getenv command Gets and displays values for the environment from the configuration file. It allows users to administer environment configuration for the objects.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__244, VERB_CONFIG_DESCRIPTION, "\nThe SRVCTL config command displays the configuration for the object stored in the OCR.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__245, ENABLE_NODEAPPS_PURPOSE, "\nEnable node applications for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__246, ENABLE_VIP_PURPOSE, "\nEnable VIPs for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__247, ENABLE_SCAN_PURPOSE, "\nEnable SCAN VIP for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__248, ENABLE_SCAN_LISTENER_PURPOSE, "\nEnable the SCAN listener for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__249, ENABLE_OC4J_PURPOSE, "\nEnable OC4J instance for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__250, DISABLE_NODEAPPS_PURPOSE, "\nDisable node applications from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__251, DISABLE_VIP_PURPOSE, "\nDisable the VIPs from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__252, DISABLE_SCAN_PURPOSE, "\nDisable the SCAN VIP from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__253, DISABLE_SCAN_LISTENER_PURPOSE, "\nDisable the SCAN listener from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__254, DISABLE_OC4J_PURPOSE, "\nDisable the OC4J instance from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__255, START_NODEAPPS_PURPOSE, "\nStart the node applications on the cluster or the specified node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__256, START_VIP_PURPOSE, "\nStarts the specified VIP or the VIPs on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__257, START_LSNR_PURPOSE, "\nStarts the specified listener or listeners.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__258, START_SCAN_PURPOSE, "\nStarts the specified scan VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__259, START_SCAN_LSNR_PURPOSE, "\nStarts the specified SCAN listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__260, START_OC4J_PURPOSE, "\nStarts the OC4J Instance on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__261, STOP_NODEAPPS_PURPOSE, "\nStop the node applications running on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__262, STOP_VIP_PURPOSE, "\nStop the specified VIP, or all VIPs, including failed-over VIPs, on the specified node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__263, STOP_LSNR_PURPOSE, "\nStop the specified listener or all listeners running on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__264, STOP_SCAN_PURPOSE, "\nStop the SCAN VIP running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__265, STOP_SCAN_LSNR_PURPOSE, "\nStop the SCAN listener running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__266, STOP_OC4J_PURPOSE, "\nStop the OC4J instance in running or starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__267, RELOCATE_SCAN_PURPOSE, "\nTemporarily relocate SCAN VIP from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__268, RELOCATE_SCAN_LSNR_PURPOSE, "\nTemporarily relocate SCAN listener from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__269, RELOCATE_OC4J_PURPOSE, "\nTemporarily relocate the oc4j instance from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__270, STATUS_NODEAPPS_PURPOSE, "\nDisplays the current state of the node applications.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__271, STATUS_VIP_PURPOSE, "\nDisplays the current state of the VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__272, STATUS_LSNR_PURPOSE, "\nDisplays the current state of the Listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__273, STATUS_SCAN_PURPOSE, "\nDisplays the current state of the SCAN VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__274, STATUS_SCAN_LSNR_PURPOSE, "\nDisplays the current state of the SCAN listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__275, STATUS_OC4J_PURPOSE, "\nDisplays the current state of the OC4J instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__276, ADD_NODEAPPS_PURPOSE, "\nAdds node application configuration to the specified node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__277, ADD_VIP_PURPOSE, "\nAdds a VIP to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__278, ADD_LSNR_PURPOSE, "\nAdd a listener to be managed by Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__279, ADD_SCAN_PURPOSE, "\nAdds a SCAN VIP to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__280, ADD_SCAN_LSNR_PURPOSE, "\nAdds a SCAN listener listening on the given endpoints.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__281, ADD_OC4J_PURPOSE, "\nAdds an OC4J instance to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__282, REMOVE_NODEAPPS_PURPOSE, "\nRemoves the node applications configured on the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__283, REMOVE_VIP_PURPOSE, "\nRemoves the specified VIP configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__284, REMOVE_LSNR_PURPOSE, "\nRemoves the listener specified or all the listeners from Oracle clusterware managment.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__285, REMOVE_SCAN_PURPOSE, "\nRemoves the SCAN VIP for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__286, REMOVE_SCAN_LSNR_PURPOSE, "\nRemoves the SCAN listener for the cluster.\n "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__287, REMOVE_OC4J_PURPOSE, "\nRemoves the OC4J instance configured for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__288, MODIFY_NODEAPPS_PURPOSE, "\nModifies the configuration for a node application.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__289, MODIFY_LSNR_PURPOSE, "\nModifies the ORACLE_HOME path, Oracle user name, or the listener endpoints.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__290, MODIFY_SCAN_PURPOSE, "\nModifies the SCAN name.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__291, MODIFY_SCAN_LSNR_PURPOSE, "\nModifies the SCAN listeners so that the number of SCAN listeners is the same as the number of SCAN VIPs or modifies the SCAN listener endpoints.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__292, MODIFY_OC4J_PURPOSE, "\nModifies the configuration of RMI port for OC4J instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__293, SETENV_NODEAPPS_PURPOSE, "\nAdministers node application environment configurations.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__294, SETENV_VIP_PURPOSE, "\nAdministers VIP's environment configurations.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__295, SETENV_LSNR_PURPOSE, "\nAdministers listeners environment configurations.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__296, UNSETENV_NODEAPPS_PURPOSE, "\nUnsets node application environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__297, UNSETENV_VIP_PURPOSE, "\nUnsets the VIP's environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__298, UNSETENV_LSNR_PURPOSE, "\nUnsets the listener environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__299, GETENV_NODEAPPS_PURPOSE, "\nGets the node application environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__300, GETENV_VIP_PURPOSE, "\nGets the node VIP's environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__301, GETENV_LSNR_PURPOSE, "\nGets the listener environment values.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__302, CONFIG_NODEAPPS_PURPOSE, "\nDisplays the configuration information for the node applications.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__303, CONFIG_VIP_PURPOSE, "\nDisplays the configuration information for a VIP or VIP's configured on a node.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__304, CONFIG_LSNR_PURPOSE, "\nDisplays a list of configured listeners that are registered with Oracle Clusterware on a given node. Displays detailed configuration information on a listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__305, CONFIG_SCAN_PURPOSE, "\nDisplays the configuration for the SCAN VIP.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__306, CONFIG_OC4J_PURPOSE, "\nDisplays configuration information for the OC4J instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__307, CONFIG_SCAN_LSNR_PURPOSE, "\nDisplays configuration information for the SCAN listener.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__308, INSTALL_TYPE_CLUSTERWARE, "Oracle Clusterware"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__309, INSTALL_TYPE_SIHA, "Oracle Restart"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__325, USAGE_ENABLE_ONS, "Usage: srvctl enable ons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__326, USAGE_ENABLE_EONS, "Usage: srvctl enable eons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__327, USAGE_DISABLE_ONS, "Usage: srvctl disable ons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__328, USAGE_DISABLE_EONS, "Usage: srvctl disable eons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__329, USAGE_START_ONS, "Usage: srvctl start ons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__330, USAGE_START_EONS, "Usage: srvctl start eons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__331, USAGE_STOP_ONS, "Usage: srvctl stop ons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__332, USAGE_STOP_EONS, "Usage: srvctl stop eons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__333, USAGE_STATUS_ONS, "Usage: srvctl status ons [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__334, USAGE_STATUS_EONS, "Usage: srvctl status eons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__335, USAGE_ADD_ONS, "Usage: srvctl add ons [-emport <em_port>] [-onslocalport <ons_local_port>]  [-onsremoteport <ons_remote_port>] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__336, USAGE_ADD_EONS, "Usage: srvctl add eons [-p <port_num>] [-m <multicast_ip_address>] [-e <eons_listen_port>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__337, USAGE_REMOVE_ONS, "Usage: srvctl remove ons [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__338, USAGE_REMOVE_EONS, "Usage: srvctl remove eons [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__339, USAGE_MODIFY_ONS, "Usage: srvctl modify ons [-emport <em_port>] [-onslocalport <ons_local_port>]  [-onsremoteport <ons_remote_port>] [-remoteservers <host>[:<port>][,<host>[:<port>]...]] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__340, USAGE_MODIFY_EONS, "Usage: srvctl modify eons [-p <portnum>] [-m <multicast_ip_address>] [-e <eons_listen_port>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__341, USAGE_CONFIG_ONS, "Usage: srvctl config ons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__342, USAGE_CONFIG_EONS, "Usage: srvctl config eons"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__343, ENABLE_SIHA_ONS_PURPOSE, "\nEnable the ONS for management by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__344, ENABLE_SIHA_EONS_PURPOSE, "\nEnable the eONS for management by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__345, DISABLE_SIHA_ONS_PURPOSE, "\nDisable the ONS from Oracle Restart management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__346, DISABLE_SIHA_EONS_PURPOSE, "\nDisable the eONS from Oracle Restart management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__347, START_SIHA_ONS_PURPOSE, "\nStarts the ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__348, START_SIHA_EONS_PURPOSE, "\nStarts the eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__349, STOP_SIHA_ONS_PURPOSE, "\nStop the ONS daemon running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__350, STOP_SIHA_EONS_PURPOSE, "\nStop the eONS daemon running or in starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__351, STATUS_ONS_PURPOSE, "\nDisplay the current state of the ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__352, STATUS_EONS_PURPOSE, "\nDisplay the current state of the eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__353, ADD_ONS_PURPOSE, "\nAdds an ONS to be managed by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__354, ADD_EONS_PURPOSE, "\nAdds an eONS to be managed by Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__355, REMOVE_ONS_PURPOSE, "\nRemoves the ONS daemon configured from Oracle Restart.\n"
//  *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__356, REMOVE_EONS_PURPOSE, "\nRemoves the eONS daemon configured from Oracle Restart.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__357, MODIFY_ONS_PURPOSE, "\nModifies the local, remote or the host:port list of the ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__358, MODIFY_EONS_PURPOSE, "\nModifies the multicast IP address or port of the eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__359, CONFIG_ONS_PURPOSE, "\nDisplays the current configuration information for ONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__360, CONFIG_EONS_PURPOSE, "\nDisplays the current configuration information for eONS daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__361, USAGE_ENABLE_GNS, "Usage: srvctl enable gns [-node <node_name>] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__362, USAGE_DISABLE_GNS, "Usage: srvctl disable gns [-node <node_name>] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__363, USAGE_START_GNS, "Usage: srvctl start gns [-loglevel <log_level>] [-node <node_name>] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__364, USAGE_STOP_GNS, "Usage: srvctl stop gns [-node <node_name>] [-force] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__365, USAGE_RELOCATE_GNS, "Usage: srvctl relocate gns [-node <node_name>] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__366, USAGE_STATUS_GNS, "Usage: srvctl status gns [-node <node_name>] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__367, USAGE_REMOVE_GNS, "Usage: srvctl remove gns [-clustername <name>] [-force] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__368, USAGE_MODIFY_GNS, "Usage: srvctl modify gns {-loglevel <log_level> | [-resolve <name>] [-verify <name>] [-parameter <name>:<value>[,<name>:<value>...]] [-vip <vip_name>] [-clientdata <filename>] [-role {PRIMARY} [-force]] [-verbose]}"
// *Document: NO
//  *Cause: 
// *Action: 
/
__369, USAGE_CONFIG_GNS, "Usage: srvctl config gns [-detail] [-subdomain] [-multicastport] [-node <node_name>] [-port] [-status] [-version] [-query <name>] [-list] [-clusterguid] [-clustername] [-clustertype] [-loglevel] [-network] [-role] [-serialnumber] [-instances] [-querycluster [-name <clustername>]] [-verbose]"
// *Document: NO
//  *Cause: 
// *Action: 
/
__370, USAGE_ADD_GNS, "Usage: srvctl add gns {-vip {<vip_name> | <ip>} [-domain <domain>] [-verbose] | -clientdata <filename>}"
// *Document: NO
//  *Cause:
// *Action:
/
__371, RELOCATE_VIP_PURPOSE, "Relocate VIP from its current node to another node of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
00371, GNS_NO_MODIFY_OPTION, "No option specified for \"modify gns\""
//  *Cause: No option was specified for the \"modify gns\" command.
// *Action: Specify at least one option.
/
00372, GNS_MODIFY_REQ_OPTION_NOT_SPECIFIED, "The \"-{0}\" option requires the specification of the \"-{1}\" option."
//  *Cause: An option was specified which requires that another option to be
//          specified at the same time.
// *Action: Specify the required option.
/
00373, GNS_INVALID_ADDRESS, "Invalid host name or address: \"{0}\"."
//  *Cause: The host name or address specified for the address on which GNS is
//          to listen was not valid.
// *Action: Specify a valid host name or IP address. If an IP address is used,
//          it must be one of the following:
//          1. A valid IPv4 address (N.N.N.N);
//          2. A valid IPv6 address (N[:N]*).
/
00374, GNS_INCOMPATIBLE_OPTIONS, "The \"-{0}\" option may not be used with the \"-{1}\" option."
//  *Cause: The two options may not be used together.
// *Action: Run srvctl with each option specified separately.
/
00375, GNS_MODIFY_NO_OPTION_SPECIFIED, "No option was specified for the GNS \"modify\" command."
//  *Cause: An option was not specified for the modify command.
// *Action: Specify an option.
/
00377, GNS_MODIFY_EITHER_OPTION_NOT_SPECIFIED, "The \"-{0}\" option requires the specification of either the \"-{1}\" or the \"-{2}\" option."
//  *Cause: An option was specified which requires that one of the other
//          possible options to be specified at the same time.
// *Action: Specify the one of the other options.
/
00378, GNS_MODIFY_BOTH_OPTIONS_NOT_ALLOWED, "Both \"-{0}\" and \"-{1}\" options may not be specified with the \"-{2}\" option."
//  *Cause: An invalid combination of options was specified.
// *Action: Specify only one of the other possible options.
/
00379, GNS_MODIFY_NO_OPTION_BESIDES_D, "OBSOLETE - DO NOT REUSE"
// *Document: No
// *Cause:
// *Action:
/
00380, GNS_MODIFY_ONLY_L_ALLOWED, "No other option is allowed when the '-loglevel' option is specified."
// *Cause:  If the '-loglevel' option is specified, no other option may be given.
// *Action: Only specify the '-loglevel' option.
/
00381, SIDB_MODIFY_REQ_G_X, "Both '-serverpool' and '-node' options are required to set server pool {0} for single instance database {1} on the cluster."
// *Cause:  Option '-node' is not specified in 'srvctl modify database' command for a single instance database on the cluster. 
// *Action: Specify both -serverpool and -node options in 'srvctl modify database' and retry.
/
00382, INVALID_SG_CS_FOR_SI_DB, "The number of candidate servers {0} in server pool {1} should be one for single instance database {2}"
// *Cause:  The server pool specified in 'srvctl modify database' command for a single instance database contained more than 1 candidate servers. 
// *Action: Either modify the given server pool via 'srvctl modify srvpool' command to have only one candidate server specified via -node argument or specify another server pool that contains only one candidate server specified via -node argument.
/
00383, GNS_INVALID_IP_ADDRESS, "Invalid IP address for name \"{0}\": \"{1}\""
//  *Cause: The address used for a name was not valid.
// *Action: Specify a valid IP address. It must be one of the following:
//          1. A valid IPv4 address (N.N.N.N);
//          2. A valid IPv6 address (N[:N]*).
/
00384, GNS_UPDATE_NO_OPTION_SPECIFIED, "No option was specified for the GNS \"update\" command."
//  *Cause: An option was not specified for the update command.
// *Action: Specify an option.
/
__376, CONFIG_GNS_PURPOSE, "\nDisplays the configuration information for the GNS daemon.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__420, USAGE_START_SIHOME, "Usage: srvctl start home -oraclehome <oracle_home> -statefile <state_file>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__421, USAGE_STOP_SIHOME, "Usage: srvctl stop home -oraclehome <oracle_home> -statefile <state_file> [-stopoption <stop_options>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__422, USAGE_STAT_SIHOME, "Usage: srvctl status home -oraclehome <oracle_home> -statefile <state_file>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__423, ADD_SRVPOOL_PURPOSE, "\nAdds a server pool to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__424, CONFIG_SRVPOOL_PURPOSE, "\nDisplays the configuration for the server pool.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__425, MODIFY_SRVPOOL_PURPOSE, "\nModifies the configuration for the server pool.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__426, RELOCATE_SERVER_PURPOSE, "\nRelocates the servers to a server pool in the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__427, REMOVE_SRVPOOL_PURPOSE, "\nRemoves the server pool for the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__428, STATUS_SRVPOOL_PURPOSE, "\nDisplays the current state of the server pool.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__429, ADD_GNS_PURPOSE, "\nAdds GNS configuration to the specified domain.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__431, DISABLE_GNS_PURPOSE, "\nDisables GNS from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__432, ENABLE_GNS_PURPOSE, "\nEnables GNS for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__433, MODIFY_GNS_PURPOSE, "\nModifies the configuration for GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__434, RELOCATE_GNS_PURPOSE, "\nTemporarily relocates GNS from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__435, REMOVE_GNS_PURPOSE, "\nRemoves GNS for the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__436, START_GNS_PURPOSE, "\nStarts GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__437, STATUS_GNS_PURPOSE, "\nDisplays the current state of GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__438, STOP_GNS_PURPOSE, "\nStops GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__439, ADD_FS_PURPOSE, "\nAdds the file system configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__440, CONFIG_FS_PURPOSE, "\nDisplays the configuration for the file system.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__441, DISABLE_FS_PURPOSE, "\nDisables the file system from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__442, ENABLE_FS_PURPOSE, "\nEnables the file system for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__443, MODIFY_FS_PURPOSE, "\nModifies the configuration for the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__444, REMOVE_FS_PURPOSE, "\nRemoves the file system from the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__445, START_FS_PURPOSE, "\nStarts (mounts) the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__446, STATUS_FS_PURPOSE, "\nDisplays the current state of the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__447, STOP_FS_PURPOSE, "\nStops (unmounts) the file system.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__448, ADD_DB_PURPOSE, "\nAdds a database configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__449, CONFIG_DB_PURPOSE, "\nDisplays the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__450, START_DB_PURPOSE, "\nStarts the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__451, STOP_DB_PURPOSE, "\nStops the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__452, STAT_DB_PURPOSE, "\nDisplays the current state of the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__453, ENABLE_DB_PURPOSE, "\nEnables the database for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__454, DISABLE_DB_PURPOSE, "\nDisables the database from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__455, MODIFY_DB_PURPOSE, "\nModifies the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__456, REMOVE_DB_PURPOSE, "\nRemoves the database from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__457, GETENV_DB_PURPOSE, "\nGets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__458, SETENV_DB_PURPOSE, "\nSets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__459, UNSETENV_DB_PURPOSE, "\nUnsets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__460, ADD_SI_DB_PURPOSE, "\nAdds a database configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__461, CONFIG_SI_DB_PURPOSE, "\nDisplays the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__462, START_SI_DB_PURPOSE, "\nStarts the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__463, STOP_SI_DB_PURPOSE, "\nStops the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__464, STAT_SI_DB_PURPOSE, "\nDisplays the current state of the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__465, ENABLE_SI_DB_PURPOSE, "\nEnables the database for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__466, DISABLE_SI_DB_PURPOSE, "\nDisables the database from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__467, MODIFY_SI_DB_PURPOSE, "\nModifies the configuration for the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__468, REMOVE_SI_DB_PURPOSE, "\nRemoves the database from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__469, GETENV_SI_DB_PURPOSE, "\nGets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__470, SETENV_SI_DB_PURPOSE, "\nSets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__471, UNSETENV_SI_DB_PURPOSE, "\nUnsets the database's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__472, ADD_INST_PURPOSE, "\nAdds a database instance configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__473, START_INST_PURPOSE, "\nStarts the database instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__474, STOP_INST_PURPOSE, "\nStops the database instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__475,STAT_INST_PURPOSE, "\nDisplays the current state of the database instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__476, ENABLE_INST_PURPOSE, "\nEnables the database instance for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__477, DISABLE_INST_PURPOSE, "\nDisable the database instance from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__478, MODIFY_INST_PURPOSE, "\nFor administrator-managed databases, changes the node on which an instance runs.\nFor policy-managed databases, specifies an instance name to use when the database runs on the given node.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__479, REMOVE_INST_PURPOSE, "\nRemoves the database instance from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__480, ADD_SERV_PURPOSE, "\nAdds a service configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__481, CONFIG_SERV_PURPOSE, "\nDisplays the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__482, ENABLE_SERV_PURPOSE, "\nEnables the service for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__483, DISABLE_SERV_PURPOSE, "\nDisables the service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__484, MODIFY_SERV_PURPOSE, "\nModifies the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__485, RELOCATE_SERV_PURPOSE, "\nTemporarily relocates service from one node of the cluster to another.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__486, REMOVE_SERV_PURPOSE, "\nRemoves the service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__487, START_SERV_PURPOSE, "\nStarts the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__488, STOP_SERV_PURPOSE, "\nStops the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__489, STAT_SERV_PURPOSE, "\nDisplays the current state of the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__490, ADD_SI_SERV_PURPOSE, "\nAdds a service configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__491, CONFIG_SI_SERV_PURPOSE, "\nDisplays the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__492, ENABLE_SI_SERV_PURPOSE, "\nEnables the service for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__493, DISABLE_SI_SERV_PURPOSE, "\nDisables the service from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__494, MODIFY_SI_SERV_PURPOSE, "\nModifies the configuration for the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__495, REMOVE_SI_SERV_PURPOSE, "\nRemoves the service from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__496, START_SI_SERV_PURPOSE, "\nStarts the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__497, STOP_SI_SERV_PURPOSE, "\nStops the service.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__521, ADD_ASM_PURPOSE, "\nAdds an ASM configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__522, CONFIG_ASM_PURPOSE, "\nDisplays the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__523, STAT_ASM_PURPOSE, "\nDisplays the current state of ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__524, ENABLE_ASM_PURPOSE, "\nEnables ASM for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__525, DISABLE_ASM_PURPOSE, "\nDisables ASM for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__526, MODIFY_ASM_PURPOSE, "\nModifies the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__527, REMOVE_ASM_PURPOSE, "\nRemoves ASM from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__528, GETENV_ASM_PURPOSE, "\nGets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__529, SETENV_ASM_PURPOSE, "\nSets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__530, UNSETENV_ASM_PURPOSE, "\nUnsets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__531, START_ASM_PURPOSE, "\nStarts ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__532, STOP_ASM_PURPOSE, "\nStops ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__533, ADD_SI_ASM_PURPOSE, "\nAdds an ASM configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__534, CONFIG_SI_ASM_PURPOSE, "\nDisplays the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__535, STAT_SI_ASM_PURPOSE, "\nDisplays the current state of ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__536, ENABLE_SI_ASM_PURPOSE, "\nEnables ASM for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__537, DISABLE_SI_ASM_PURPOSE, "\nDisables ASM for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__538, MODIFY_SI_ASM_PURPOSE, "\nModifies the configuration for ASM.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__539, REMOVE_SI_ASM_PURPOSE, "\nRemoves ASM from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__540, GETENV_SI_ASM_PURPOSE, "\nGets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__541, SETENV_SI_ASM_PURPOSE, "\nSets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__542, UNSETENV_SI_ASM_PURPOSE, "\nUnsets ASM's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__543, START_SI_ASM_PURPOSE, "\nStarts ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__544, STOP_SI_ASM_PURPOSE, "\nStops ASM instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__561, START_DISKGROUP_PURPOSE, "\nStarts the diskgroup, causing ASM to mount it.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__562, STOP_DISKGROUP_PURPOSE, "\nStops the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__563, STAT_DISKGROUP_PURPOSE, "\nDisplays the current state of the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__564, ENABLE_DISKGROUP_PURPOSE, "\nEnables the diskgroup for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__565, DISABLE_DISKGROUP_PURPOSE, "\nDisables the diskgroup from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__566, REMOVE_DISKGROUP_PURPOSE, "\nRemoves the diskgroup from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__567, START_SI_DISKGROUP_PURPOSE, "\nStarts the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__568, STOP_SI_DISKGROUP_PURPOSE, "\nStops the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__569, STAT_SI_DISKGROUP_PURPOSE, "\nDisplays the current state of the diskgroup.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__570, ENABLE_SI_DISKGROUP_PURPOSE, "\nEnables the diskgroup for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__571, DISABLE_SI_DISKGROUP_PURPOSE, "\nDisables the diskgroup from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__572, REMOVE_SI_DISKGROUP_PURPOSE, "\nRemoves the diskgroup from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__591, START_HOME_PURPOSE, "\nStarts all Oracle clusterware resources that run from the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__592, STOP_HOME_PURPOSE, "\nStops all Oracle clusterware resources that run from the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__593, STAT_HOME_PURPOSE, "\nDisplays the current state of of all resources for the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__594, START_SI_HOME_PURPOSE, "\nStarts all resources that run from the Oracle Home for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__595, STOP_SI_HOME_PURPOSE, "\nStops all resources that run from the Oracle home for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__596, STAT_SI_HOME_PURPOSE, "\nDisplays the current state of all resources for the Oracle home.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__611, ADD_LISTENER_PURPOSE, "\nAdds a listener configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__612, CONFIG_LISTENER_PURPOSE, "\nDisplays the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__613, START_LISTENER_PURPOSE, "\nStarts the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__614, STOP_LISTENER_PURPOSE, "\nStops the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__615, ENABLE_LISTENER_PURPOSE, "\nEnables the listener for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__616, DISABLE_LISTENER_PURPOSE, "\nDisables the listener from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__617, MODIFY_LISTENER_PURPOSE, "\nModifies the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__618, REMOVE_LISTENER_PURPOSE, "\nRemoves the listener from Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__619, GETENV_LISTENER_PURPOSE, "\nGets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__620, SETENV_LISTENER_PURPOSE, "\nSets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__621, UNSETENV_LISTENER_PURPOSE, "\nUnsets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__622, STAT_LISTENER_PURPOSE, "\nDisplays the current state of the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__641, ADD_SI_LISTENER_PURPOSE, "\nAdds a listener configuration to be managed by Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__642, CONFIG_SI_LISTENER_PURPOSE, "\nDisplays the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__643, START_SI_LISTENER_PURPOSE, "\nStarts the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__644, STOP_SI_LISTENER_PURPOSE, "\nStops the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__645, ENABLE_SI_LISTENER_PURPOSE, "\nEnables the listener for Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__646, DISABLE_SI_LISTENER_PURPOSE, "\nDisables the listener from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__647, MODIFY_SI_LISTENER_PURPOSE, "\nModifies the configuration for the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__648, REMOVE_SI_LISTENER_PURPOSE, "\nRemoves the listener from Oracle Restart.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__649, GETENV_SI_LISTENER_PURPOSE, "\nGets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__650, SETENV_SI_LISTENER_PURPOSE, "\nSets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__651, UNSETENV_SI_LISTENER_PURPOSE, "\nUnsets the listener's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__652, STAT_SI_LISTENER_PURPOSE, "\nDisplays the current state of the listener.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__653, STATUS_SERVER_PURPOSE, "\nDisplays the current state of the given server(s).\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__654, DB_START_INST_NO_OPT, "Dummy message line"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__655, UPDATE_LISTENER_PURPOSE, "\nUpdate the listener to listen on the new endpoints.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__656, UPDATE_SCAN_LISTENER_PURPOSE, "\nUpdate the SCAN listeners to listen on the new endpoints.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__657, UPDATE_DATABASE_PURPOSE, "\nChange the open mode of the database.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__658, USAGE_UPDATE_LISTENER, "Usage: srvctl update listener [-listener <lsnr_name> -asm -remove [-force]]"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__659, USAGE_UPDATE_SCAN_LISTENER, "Usage: srvctl update scan_listener"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__660, USAGE_UPDATE_DATABASE, "Usage: srvctl update database -db <db_unique_name> [-startoption <start_options> [-node <node_name> | -serverpool \"<serverpool_list>\"]]"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__661, VERB_UPDATE_DESCRIPTION, "\nThe SRVCTL update command requests specified running object to use the new configuration information stored in the OCR.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__662, USAGE_CONVERT_RACONENODE, "Usage: srvctl convert database -db <db_unique_name> -dbtype RACONENODE [-instance <inst_name>] [-timeout <timeout>]"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__663, USAGE_CONVERT_RAC, "Usage: srvctl convert database -db <db_unique_name> -dbtype RAC [-node <node>]"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__664, USAGE_OMOTION_DB, "Usage: srvctl relocate database -db <db_unique_name> {[-node <target>] [-timeout <timeout>] [-stopoption <stop_option>] | -abort [-revert]} [-drain_timeout <timeout>] [-verbose]"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__665, VERB_CONVERT_DESCRIPTION, "\nThe SRVCTL convert command enables the user to convert from RAC One Node database to RAC database and vice versa.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__666, VERB_OMOTION_DESCRIPTION, "\nThe SRVCTL relocate command enables the user to initiate an online relocation of the RAC One Node database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__667, CONVERT_RACONE2RAC_PURPOSE, "\nConvert RAC One Node database to RAC database having one instance.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__668, CONVERT_RAC2RACONE_PURPOSE, "\nConvert RAC database having one instance to RAC One Node database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__669, OMOTION_DB_PURPOSE, "\nInitiate online relocation of the RAC One Node database.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__672, VERB_UPGRADE_DESCRIPTION, "\nUpgrades the resources types and resources from an older version to a newer version.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__673, UPGRADE_MODEL_PURPOSE, "\nUpgrade the Oracle Clusterware resource types and resources.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__674, USAGE_UPGRADE_MODEL, "Usage: srvctl upgrade model {-restype | -sourceversion <source_version> -toversion <destination_version> -phase {FIRST|LAST} [-optionsvals <name>=<value>[,<name>=<value>, ...]]}"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__675, USAGE_CONFIG_CVU, "Usage: srvctl config cvu"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__676, USAGE_START_CVU, "Usage: srvctl start cvu [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__677, USAGE_STOP_CVU, "Usage: srvctl stop cvu [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__678, USAGE_STAT_CVU, "Usage: srvctl status cvu [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__679, USAGE_ADD_CVU, "Usage: srvctl add cvu [-checkinterval <check_interval_in_minutes>] [-destloc <path>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__680, USAGE_REMOVE_CVU, "Usage: srvctl remove cvu [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__681, USAGE_ENABLE_CVU, "Usage: srvctl enable cvu [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__682, USAGE_DISABLE_CVU, "Usage: srvctl disable cvu [-node <node_name>]"
//   Document: No
//  *Cause: Status message
// *Action: Not an error
/
__683, USAGE_MODIFY_CVU, "Usage: srvctl modify cvu [-checkinterval <check_interval_in_minutes>] [-destloc <path>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__684, USAGE_RELOCATE_CVU, "Usage: srvctl relocate cvu [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__685, ENABLE_CVU_PURPOSE, "\nEnable the CVU resource for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__686, DISABLE_CVU_PURPOSE, "\nDisable the CVU resource from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__687, START_CVU_PURPOSE, "\nStarts the CVU resource on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__688, STOP_CVU_PURPOSE, "\nStop the CVU resource in running or starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__689, RELOCATE_CVU_PURPOSE, "\nTemporarily relocate the CVU resource from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__690, STATUS_CVU_PURPOSE, "\nDisplays the current state of the CVU resource.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__691, ADD_CVU_PURPOSE, "\nAdds the CVU resource to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__692, REMOVE_CVU_PURPOSE, "\nRemoves the CVU resource configured for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__693, MODIFY_CVU_PURPOSE, "\nModifies the check interval for the CVU resource.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__694, CONFIG_CVU_PURPOSE, "\nDisplays configuration information for the CVU resource.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__695, ADD_NETWORK_PURPOSE, "\nAdds a network configuration to the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__696, REMOVE_NETWORK_PURPOSE, "\nRemoves a network configuration from the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__697, MODIFY_NETWORK_PURPOSE, "\nModifies a network configuration in the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__698, CONFIG_NETWORK_PURPOSE, "\nDisplays the configuration information for the networks registered in the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__699, USAGE_ADD_NETWORK, "Usage: srvctl add network [-netnum <network_number>] -subnet <subnet>/<netmask>[/if1[|if2...]] [-nettype {STATIC|DHCP|AUTOCONFIG|MIXED}] [-pingtarget \"<pingtarget_list>\"] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__700, USAGE_REMOVE_NETWORK, "Usage: srvctl remove network {-netnum <network_number> | -all} [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__701, USAGE_MODIFY_NETWORK, "Usage: srvctl modify network [-netnum <network_number>] [-subnet <subnet>/<netmask>[/if1[|if2...]]] [-nettype {STATIC|DHCP|AUTOCONFIG|MIXED}] [-iptype {IPV4|IPV6|BOTH}] [-pingtarget \"<pingtarget_list>\"] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__702,USAGE_CONFIG_NETWORK, "Usage: srvctl config network [-netnum <network_number>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__703, VERB_DOWNGRADE_DESCRIPTION, "\nThe SRVCTL downgrade command enables the user to downgrade resources from their current software version to an older version.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__704, USAGE_DOWNGRADE_DB, "Usage: srvctl downgrade database -db <db_unique_name> -oraclehome <oracle_home> -targetversion <to_version>"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__705, DOWNGRADE_DB_PURPOSE, "\nDowngrade database configuration from its current software version to an older version.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__706, USAGE_UPGRADE_DB, "Usage: srvctl upgrade database -db <db_unique_name> -oraclehome <oracle_home>"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__707, UPGRADE_DB_PURPOSE, "\nUpgrade database configuration from its current software version to a newer version.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__709, CONFIG_VOLUME_PURPOSE, "\nDisplays the configuration for the volume.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__710, DISABLE_VOLUME_PURPOSE, "\nDisables Oracle Clusterware management of the volume.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__711, ENABLE_VOLUME_PURPOSE, "\nEnables Oracle Clusterware management of the volume.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__712, REMOVE_VOLUME_PURPOSE, "\nRemoves the volume from the cluster.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__713, START_VOLUME_PURPOSE, "\nStarts the volume.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__714, STATUS_VOLUME_PURPOSE, "\nDisplays the current state of the volume.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__715, STOP_VOLUME_PURPOSE, "\nStops the volume.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__716, USAGE_CONFIG_VOLUME, "Usage: srvctl config volume [-volume <volume_name>] [-diskgroup <group_name>] [-device <volume_device>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__717, USAGE_START_VOLUME, "Usage: srvctl start volume {-volume <volume_name> -diskgroup <group_name> | -device <volume_device>} [-node \"<node_list>\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__718, USAGE_STAT_VOLUME, "Usage: srvctl status volume [-device <volume_device>] [-volume <volume_name>] [-diskgroup <group_name>] [-node \"<node_list>\" | -all]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__719, USAGE_STOP_VOLUME, "Usage: srvctl stop volume {-volume <volume_name> -diskgroup <group_name> | -device <volume_device>} [-node \"<node_list>\"] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__720, USAGE_REMOVE_VOLUME, "Usage: srvctl remove volume {-volume <volume_name> -diskgroup <group_name> | -device <volume_device>} [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__721, USAGE_ENABLE_VOLUME, "Usage: srvctl enable volume {-volume <volume_name> -diskgroup <group_name> | -device <volume_device>} [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__722, USAGE_DISABLE_VOLUME, "Usage: srvctl disable volume {-volume <volume_name> -diskgroup <group_name> | -device <volume_device>} [-node <node_name>]"
//  *Document: No
//  *Cause: 
// *Action: 
/
__723, ADD_GHS_PURPOSE, "\nAdds a Rapid Home Provisioning Server daemon to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__724, RELOCATE_GHS_PURPOSE, "\nRelocate the Rapid Home Provisioning Server daemon from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__725, CONFIG_GHS_PURPOSE, "\nDisplays configuration information for the Rapid Home Provisioning Server daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__726, ENABLE_GHS_PURPOSE, "\nEnable Rapid Home Provisioning Server daemon for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__727, DISABLE_GHS_PURPOSE, "\nDisable the Rapid Home Provisioning Server daemon from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__728, START_GHS_PURPOSE, "\nStarts the Rapid Home Provisioning Server daemon on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__729, STOP_GHS_PURPOSE, "\nStop the Rapid Home Provisioning Server daemon in running or starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__730, STATUS_GHS_PURPOSE, "\nDisplays the current state of the Rapid Home Provisioning Server daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__731, REMOVE_GHS_PURPOSE, "\nRemoves the Rapid Home Provisioning Server daemon configured for the cluster and all the data in its repository.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__732, MODIFY_GHS_PURPOSE, "\nModifies the configuration of Rapid Home Provisioning Server daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__733, USAGE_ADD_GHS, "Usage: srvctl add rhpserver -storage <base_path> [-diskgroup <dg_name>] [-email <email_address> -mailserver <mail_server_address> -mailserverport <mail_server_port>] [-pl_port <RHP_progress_listener_port>] [-clport <RHP_copy_listener_port>] [-enableTLS {YES|NO}] [-enableHTTPS '{YES|NO}'] [-port_range <low_val-high_val>] [-tmploc <temporary_location>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__734, USAGE_RELOCATE_GHS, "Usage: srvctl relocate rhpserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__735, USAGE_CONFIG_GHS, "Usage: srvctl config rhpserver"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__736, USAGE_ENABLE_GHS, "Usage: srvctl enable rhpserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__737, USAGE_DISABLE_GHS, "Usage: srvctl disable rhpserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__738, USAGE_START_GHS, "Usage: srvctl start rhpserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__739, USAGE_STOP_GHS, "Usage: srvctl stop rhpserver"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__740, USAGE_STAT_GHS, "Usage: srvctl status rhpserver"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__741, USAGE_REMOVE_GHS, "Usage: srvctl remove rhpserver [-resource] [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__742, USAGE_MODIFY_GHS, "Usage: srvctl modify rhpserver [-port <rmi_port> [-force]] [-email <email_address> -mailserver <mail_server_address> -mailserverport <mail_server_port>] [-pl_port <RHP_progress_listener_port>] [-clport <RHP_copy_listener_port>] [-enableTLS {YES|NO}] [-enableHTTPS '{YES|NO}'] [-port_range <low_val-high_val>] [-tmploc <temporary_location>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__743, ADD_GHC_PURPOSE, "\nAdds a Rapid Home Provisioning Client daemon to the Oracle Clusterware configuration.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__744, RELOCATE_GHC_PURPOSE, "\nRelocate the Rapid Home Provisioning Client daemon from one node of the cluster to another.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__745, CONFIG_GHC_PURPOSE, "\nDisplays configuration information for the Rapid Home Provisioning Client daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__746, ENABLE_GHC_PURPOSE, "\nEnable Rapid Home Provisioning Client daemon for Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__747, DISABLE_GHC_PURPOSE, "\nDisable the Rapid Home Provisioning Client daemon from Oracle Clusterware management.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__748, START_GHC_PURPOSE, "\nStarts the Rapid Home Provisioning Client daemon on one of the nodes of the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__749, STOP_GHC_PURPOSE, "\nStop the Rapid Home Provisioning Client daemon in running or starting state.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__750, STATUS_GHC_PURPOSE, "\nDisplays the current state of the Rapid Home Provisioning Client daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__751, REMOVE_GHC_PURPOSE, "\nRemoves the Rapid Home Provisioning Client daemon configured for the cluster.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__752, MODIFY_GHC_PURPOSE, "\nModifies the configuration of Rapid Home Provisioning Client daemon.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__753, USAGE_ADD_GHC, "Usage: srvctl add rhpclient -clientdata <file> [-diskgroup <dg_name> -storage <base_path>] [-email <email_address> -mailserver <mail_server_address> -mailserverport <mail_server_port>] [-clport <RHP_copy_listener_port>] [-enableTLS {YES|NO}] [-enableHTTPS '{YES|NO}'] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__754, USAGE_RELOCATE_GHC, "Usage: srvctl relocate rhpclient [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__755, USAGE_CONFIG_GHC, "Usage: srvctl config rhpclient"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__756, USAGE_ENABLE_GHC, "Usage: srvctl enable rhpclient [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__757, USAGE_DISABLE_GHC, "Usage: srvctl disable rhpclient [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__758, USAGE_START_GHC, "Usage: srvctl start rhpclient [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__759, USAGE_STOP_GHC, "Usage: srvctl stop rhpclient"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__760, USAGE_STAT_GHC, "Usage: srvctl status rhpclient"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__761, USAGE_REMOVE_GHC, "Usage: srvctl remove rhpclient [-force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__762, USAGE_MODIFY_GHC, "Usage: srvctl modify rhpclient [-clientdata <file>] [-port <rmi_port>] [-diskgroup <dg_name> -storage <base_path>] [-email <email_address> -mailserver <mail_server_address> -mailserverport <mail_server_port>] [-clport <RHP_copy_listener_port>] [-enableTLS {YES|NO}] [-enableHTTPS '{YES|NO}']"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__763, USAGE_ADD_IOSERVER, "Usage: srvctl add ioserver [-spfile <spfile>] [-count <number_of_ioserver_instances>] [-listener <lsnr_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__764, USAGE_REMOVE_IOSERVER, "Usage: srvctl remove ioserver [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__765, USAGE_CONFIG_IOSERVER, "Usage: srvctl config ioserver [-detail]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__766, USAGE_START_IOSERVER, "Usage: srvctl start ioserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__767, USAGE_STOP_IOSERVER, "Usage: srvctl stop ioserver [-node <node_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__768, USAGE_STAT_IOSERVER, "Usage: srvctl status ioserver [-node <node_name>] [-detail] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__769, USAGE_ENABLE_IOSERVER, "Usage: srvctl enable ioserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__770, USAGE_DISABLE_IOSERVER, "Usage: srvctl disable ioserver [-node <node_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__771, USAGE_MODIFY_IOSERVER, "Usage: srvctl modify ioserver [-spfile <spfile>] [-count <number_of_ioserver_instances>] [-listener <lsnr_name>] [-force]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__772, USAGE_GETENV_IOSERVER, "Usage: srvctl getenv ioserver [-envs \"<name>[,...]\"]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__773, USAGE_SETENV_IOSERVER, "Usage: srvctl setenv ioserver {-envs \"<name>=<val>[,...]\" | -env \"<name>=<value>\"}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__774, USAGE_UNSETENV_IOSERVER, "Usage: srvctl unsetenv ioserver -envs \"<name>[,...]\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__775, ADD_IOSERVER_PURPOSE, "\nAdds an ASM I/O Server configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__776, CONFIG_IOSERVER_PURPOSE, "\nDisplays the configuration for ASM I/O Server.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__777, STAT_IOSERVER_PURPOSE, "\nDisplays the current state of ASM I/O Server.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__778, ENABLE_IOSERVER_PURPOSE, "\nEnables ASM I/O Server for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__779, DISABLE_IOSERVER_PURPOSE, "\nDisables ASM I/O Server for Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__780, MODIFY_IOSERVER_PURPOSE, "\nModifies the configuration for ASM I/O Server.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__781, REMOVE_IOSERVER_PURPOSE, "\nRemoves ASM I/O Server from Oracle Clusterware management.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__782, GETENV_IOSERVER_PURPOSE, "\nGets ASM I/O Server's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__783, SETENV_IOSERVER_PURPOSE, "\nSets ASM I/O Server's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__784, UNSETENV_IOSERVER_PURPOSE, "\nUnsets ASM I/O Server's environment values.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__785, START_IOSERVER_PURPOSE, "\nStarts ASM I/O Server instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__786, STOP_IOSERVER_PURPOSE, "\nStops ASM I/O Server instance.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__787, USAGE_MODIFY_VIP, "Usage: srvctl modify vip -node <node_name> -address {<name>|<ip>}/<netmask>[/if1[|if2...]] [-netnum <network_number>] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__788, MODIFY_VIP_PURPOSE, "\nModifies a VIP configuration in the Oracle Clusterware.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__789, IMPORT_GNS_PURPOSE, "\nImport GNS instance from a file.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__790, USAGE_IMPORT_GNS, "Usage: srvctl import gns -instance <filename>"
//  *Document: No
//  *Cause: 
// *Action: 
/
__792, USAGE_UPDATE_GNS, "Usage: srvctl update gns {-advertise <name> -address <address> [-timetolive <time_to_live>] | -delete <name> [-address <address>] | -alias <alias> -name <name> [-timetolive <time_to_live>] | -deletealias <alias> | -createsrv <service> -target <target> -protocol <protocol> [-weight <weight>] [-priority <priority>] [-port <port_number>] [-timetolive <time_to_live>] [-instance <instance_name>] | -deletesrv <service_name> -target <target> -protocol <protocol> [-instance <instance_name>] | -createtxt <name> -target <target> [-timetolive <time_to_live>] [-namettl <name_ttl>] | -deletetxt <name> -target <target> | -createptr <name> -target <target> [-timetolive <time_to_live>] [-namettl <name_ttl>] | -deleteptr <name> -target <target>} [-verbose]"
// *Document: NO
//  *Cause: Status message
// *Action: Not an error
/
__793, EXPORT_GNS_PURPOSE, "\nExport GNS instance into a file.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__794, USAGE_EXPORT_GNS, "Usage: srvctl export gns {-instance <filename> | {-clientdata <filename> -role {CLIENT|SECONDARY} [-version]}}"
//  *Document: No
//  *Cause: 
// *Action: 
/
__797, VERB_IMPORT_DESCRIPTION, "\nThe SRVCTL import command retrieves configuration information from a file.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__798, VERB_EXPORT_DESCRIPTION, "\nThe SRVCTL export command saves configuration information into a file.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__799, UPDATE_GNS_PURPOSE, "\nUpdates the configuration for GNS.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__838, VERB_PREDICT_DESCRIPTION, "\nThe SRVCTL predict command evaluates the consequences of resource failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__839, PREDICT_DB_PURPOSE, "\nPredicts the consequences of database failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__840, PREDICT_SERVICE_PURPOSE, "\nPredicts the consequences of service failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__841, PREDICT_ASM_PURPOSE, "\nPredicts the consequences of ASM failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__842, PREDICT_DISKGROUP_PURPOSE, "\nPredicts the consequences of diskgroup failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__843, PREDICT_FS_PURPOSE, "\nPredicts the consequences of filesystem failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__844, PREDICT_VIP_PURPOSE, "\nPredicts the consequences of VIP failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__845, PREDICT_NETWORK_PURPOSE, "\nPredicts the consequences of network failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__846, PREDICT_LISTENER_PURPOSE, "\nPredicts the consequences of listener failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__847, PREDICT_SCAN_PURPOSE, "\nPredicts the consequences of SCAN failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__848, PREDICT_SCAN_LISTENER_PURPOSE, "\nPredicts the consequences of scan listener failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__849, PREDICT_OC4J_PURPOSE, "\nPredicts the consequences of OC4J failure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__850, USAGE_ADD_VOLUME, "Usage: srvctl add volume -volume <volume_name> -diskgroup <group_name> -device <volume_device>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__851, ADD_VOLUME_PURPOSE, "\nAdds the volume configuration to the Oracle Clusterware.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
