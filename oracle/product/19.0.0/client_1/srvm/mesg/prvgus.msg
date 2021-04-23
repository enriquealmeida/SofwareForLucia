// Copyright (c) 2008, 2019, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrvgMsg.msg
//
// DESCRIPTION
//    Message file for Cluster Verification Tasks
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      02/04/19 - Backport maboddu_bug-29225861 from main
//     apfwkr      02/03/19 - Backport maboddu_bug-29242906 from main
//     apfwkr      12/10/18 - Backport ptare_bug-29025675 from main
//     maboddu     01/23/19 - Fix bug#29225861 - update action for error 4574
//     maboddu     01/23/19 - Fix bug#29242906 - correct the message 5821
//     apfwkr      11/13/18 - Backport shhirema_bug-28863795 from main
//     ptare       12/06/18 - Correct spelling of operating.
//     shhirema    11/05/18 - Bug 28863795: update action
//     shhirema    08/07/18 - Bug 28464569: update cluster state check messages
//     ptare       08/07/18 - Bug#28375063 Add messages for AFD non
//     maboddu     08/01/18 - Fix bug#27936375 - add message for HAIP on
//                            exadata
//     ptare       08/01/18 - Move File permissions project related messages to
//                            PrvhMsg.msg facility.
//     dsaggi      07/09/18 - Fix 28224287 - Add leaf node existence message
//     ptare       06/29/18 - Add messages pertaining to SUID and SGID checks
//     ptare       06/15/18	- Add messages related to file permissions and 
//                            diagnostics check.
//     maboddu     06/13/18 - Fix bug#28124509 - add message for ACFS supported
//                            nodes inconsistent
//     shhirema    04/20/18 - Bug 27230576: changes for pre,post patch checks
//     maboddu     02/28/18 - Fix bug#27331379 - add messages for crs resource
//                            param check
//     shhirema    02/13/18 - Bug 27177472: message if mgmt db is offline
//     maboddu     01/18/18 - Fix bug#27331174 - add message for scan lsnr
//                            VNCR parameter check
//     shhirema    01/16/18 - XbranchMerge shhirema_bug-26670273 from
//                            st_has_pt-cvuotn12201
//     shhirema    12/04/17 - Bug 26670273: add messages for auth services
//                            check
//     shhirema    11/15/17 - Bug 27119820: add error message for ASM pwfile
//                            check
//     shhirema    11/06/17 - Bug 26994260: fix oracle base check messages
//     shhirema    10/29/17 - Bug 26923775: fix typo
//     ptare       10/11/17 - Fix Bug#26950648 add message to report
//                            unsupported kernel version
//     shhirema    10/04/17 - Bug 26830992: add messages to mgmtdb check
//     ptare       09/28/17 - Add message to report the task being skipped due
//                            to missing root credentials
//     ptare       09/21/17 - Fix Bug#26817814 Update CVU version banner
//     maboddu     09/13/17 - Fix bug#26576379 - add messages for rpm db check
//     maboddu     08/23/17 - Fix bug#26476579 - correct the PING_CHECK_FAILED
//                            message
//     maboddu     07/25/17 - Fix bug#26115835 - add message for checking
//                            clusterware state
//     maboddu     07/11/17 - Fix bug#26264406 - add message for GNS VIP check
//     ptare       07/06/17 - Add message for incorrect directory path
//     maboddu     07/06/17 - Fix bug#26278225 - add message scan vip
//                            reachability
//     maboddu     05/29/17 - Fix bug#23302141 - add message for Network
//                            collection
//     shhirema    05/11/17 - Bug 25880285: add success summary messages
//     maboddu     04/24/17 - FIx bug#25871413 - update error 10507
//     maboddu     04/11/17 - Fix bug#25539530 - Add message for port
//                            unavailability for multicast
//     maboddu     03/06/17 - Fix bug#25489725 - add message for non-standard
//                            hostname
//     maboddu     02/13/17 - Fix bug#25509979 - add arg to message 13632
//     ptare       02/09/17 - Add messages related to cvu packager API
//     maboddu     01/27/17 - Fix bug#24478398 - Add CRS configuration message
//     maboddu     12/28/16 - Fix bug#25175063 - add message for VIP subnet
//                            check
//     dsaggi      12/18/16 - Add message for offline node application
//     maboddu     12/14/16 - Fix bug#25206756 - add error message for
//                            multicast check
//     shhirema    12/06/16 - Bug 25160688: message for storage discovery
//                            failure
//     ptare       11/29/16 - Fix Bug#25160451 report correct summary
//     maboddu     11/22/16 - Fix bug#24437551 - add error messages for
//                            /etc/hosts file validation
//     maboddu     11/17/16 - Fix bug#23297046 - add messages for
//                            cluster_database param validation
//     shhirema    11/04/16 - Bug 24917498: add error message for storage type
//                            mismatch
//     shhirema    10/31/16 - Bug 24686368: add messages for multiple paths
//                            pointing to same disk
//     ptare       10/28/16 - Add messages the time offset check
//     shhirema    10/26/16 - Bug 22456433: add GI software file type message
//     dsaggi      10/10/16 - Bug 23063340: Add messages for Time Source check
//     maboddu     09/26/16 - Fix bug#24656084 - add msg for inconsistent
//                            cluster upgrade state
//     maboddu     09/23/16 - Fix bug#24338527 - add
//                            VERIFICATION_STAGE_FLEX_CLUSTER_MODE
//     shhirema    09/06/16 - Bug 24371424: add warning message for voting disk
//                            DG redundancy check
//     shhirema    09/07/16 - Bug 24463323: add messages for ACL checks
//     maboddu     09/01/16 - Fix bug#24478356 - add message for no crs 
//                            configuration
//     ptare       08/24/16 - Add Fixup relogin required messages
//     ptare       08/23/16 - Fix Bug#24352391 Correct error message
//     maboddu     08/16/16 - Fxi bug#23722215 - add messages for incorrect
//                            group/others permissions for file
//     ptare       08/05/16 - Fix Bug#24403376 Add message to report the
//                            failure in retrieval of SPFILE location
//     maboddu     08/03/16 - Fix bug#23641241 - add message for same MAC
//                            address on multiple NIC's
//     ptare       07/29/16 - Fix Bug#24329671 Check only for group read and
//                            execute permissions on RAC home
//     maboddu     06/20/16 - Fix bug#12533358 - Add error messages for audit
//                            rules check
//     maboddu     07/19/16 - Fix bug#23746991 - Correct Action for missing
//                            spfile error
//     ptare       07/14/16 - Fix Bug#23758586 add message to report missing
//                            group permissions on RAC home
//     shhirema    07/06/16 - Bug 23751294: add message for ASM discovery
//                            string check
//     shhirema    07/04/16 - Bug 23730142: change msg to suggest user to do
//                            afd rescan
//     maboddu     06/29/16 - Fix bug#22992133 - Add message for OS no
//                            reference data
//     shshrini    06/23/16 - Fix bug 23615988 - Add error message to indicate
//                            reachability failure for the node names
//     jgagarci    06/21/16 - fix bug#23310581 - add messages for
//                            TaskCheckLoopback
//     prajm       06/21/16 - fix bug#23532253 - adding the message for disk id
//                            not found
//     ptare       06/20/16 - Bug#23616989 Add cause and action to error
//                            message
//     prajm       05/30/16 - fix bug#22086080 - adding messages for the rds
//                            ping check
//     shshrini    05/30/16 - Fix bug 23494715 - Add error message to indicate
//                            ping input copy file failures
//     xesquive    05/19/16 - Fix bug23288078 add dns check error
//     kfgriffi    05/17/16 - Fix bug 23256742 - CRS stack must be up
//     nvira       05/13/16 - add name for vdisk locations
//     kfgriffi    05/12/16 - Fix bug 23223732 - Add OCR/VOTING Disk message on
//                            ASM
//     maboddu     05/06/16 - Fix bug#23192279 - Add error message for sudo
//                            NOPASSWD configuration
//     nvira       05/05/16 - add patch id to the error message
//     ptare       05/02/16 - Add message to report the alert about virtual
//                            environment skipping shared storage check
//     nvira       04/21/16 - bug fix 23102874, add message for no deviations
//                            found
//     spavan      04/17/16 - fix bug22612396 - add cause/action messages for
//                            framework setup
//     spavan      04/15/16 - fix bug23110136 - add subtask msg
//     shshrini    03/06/16 - Fix bug 21446745 - Improve scalability
//                            performance issues in CVU for large number of
//                            nodes
//     ptare       04/13/16 - Fix Bug#21573891 add check to verify acfs kernel
//                            version consistency
//     ptare       04/11/16 - Bug#22911464 enable fix-up for iocp
//     xesquive    04/08/16 - Fix bug23044032 improve message 10048
//     maboddu     03/31/16 - Fix bug#22735862 - Add error messages for prereq
//                            xml file
//     jgagarci    03/24/16 - Fix Bug#22996231 - add TASK_VIPSUBNET_CHECK
//                            errors
//     shhirema    03/16/16 - Bug 22912487: Add message for AFD label
//                            resolution failure
//     xesquive    03/15/16 - Fix bug22924068 add gns subtask msg
//     kfgriffi    03/14/16 - Fix bug 22854770 - add subnet mask consistency
//                            task msg
//     kfgriffi    03/08/16 - Fix bug 22855442 -Update error message
//     spavan      03/07/16 - fix bug22762065 - fix NTP messages and formatting
//                            issues
//     ptare       03/04/16 - Add messages related to SSH user equivalence
//                            setup
//     prajm       03/02/16 - fix bug#22817186 - adding error message for
//                            storage attribute not found.
//     ptare       02/26/16 - Fix Bug#22815593 enhance error reporting when
//                            failure in retrieval of os level
//     shhirema    02/22/16 - Bug 22780429: move ASMADMIN group check message
//                            from PrvfMsg
//     kfgriffi    02/18/16 - Fix bug 22729302 - add ID_SERIAL to keyword
//     shhirema    02/16/16 - Bug 22731493: add message for asm device check
//                            sharedness failure
//     shhirema    01/31/16 - RTI 19212935: marking message obsolete
//     shshrini    01/29/16 - Fix bug 22601082 - Add new message PRVG-13202
//                            with Cause and Action to replace PRVF-4093 
//     ptare       01/26/16 - Fix Bug#22587308 enhance error message to suggest
//                            more elaborate action to the user
//     prajm       01/25/16 - fix bug#21616872 - adding the message for wrong
//                            asm stamp
//     nvira       01/21/16 - add message for ASM column header
//     shhirema    01/13/16 - Bug 22140256: Add message to report failure to
//                            determine node roles
//     jolascua    01/12/16 - Bug 22327017: add messages for DefaultOraInvGroup
//                            (re-worked from jolascua_bug-18779902).
//     maboddu     01/11/16 - Fix bug#14391918 - add messages for db home
//                            availability
//     jgagarci    01/06/16 - Fix Bug#21943901 - add messages for subtask
//                            checkPublicIfIsNotInherited
//     xesquive    01/05/16 - Fix bug22389450 add action dhcp discover failed
//     shhirema    12/31/15 - Bug 22304415: add message for AFD capable ASM
//                            devices check
//     ptare       12/22/15 - Add new message to report the failure in
//                            retrieval of current group
//     shhirema    12/16/15 - Bug 22369449: Add verification failed message for
//                            ASM wide checks
//     dsaggi      12/09/15 - Fix 19498573 -- Mark the literals that should not
//                            be translated 
//     nvira       11/18/15 - bug fix 19813283, add validation for -D & -DB
//                            options
//     spavan      12/04/15 - fix bug21083438 - add messages for chrony support
//     jgagarci    12/04/15 - fix bug 22153375 - add messages for ASM storage
//                            privilege check
//     maboddu     12/03/15 - Fix bug#22276441 - add error messages for ASM
//                            password file location
//     kfgriffi    12/02/15 - Fix bug 22230938 - handle PROGRAM keyword on rule
//     ptare       11/23/15 - Add message to report the quorum NFS path with
//                            incorrect mount option.
//     xesquive    11/18/15 - Fix bug20322286 add subtask msg for gns comp
//     spavan      11/16/15 - fix bug22118525 -move message from Prvf because
//                            of compilation error
//     xesquive    11/09/15 - Fix bug22150318 warn if an empty nameserver 
//     jgagarci    11/06/15 - Fix bug #22017351 - add
//                            NOT_A_MEMBER_OF_GROUP_FOR_PRIVILEGES
//     xesquive    11/06/15 - Fix bug22016398 add msg for gns mandatory if leaf
//                            nodes
//     jgagarci    10/27/15 - Fix bug 21963665 - fix messages for ntp check
//     prajm       10/27/15 - fix bug#22015734 - Adding message for storage
//                            operation timedout
//     spavan      10/11/15 - fix bug21035833 - messages for not controller
//                            task
//     xesquive    10/06/15 - add msg dhcp low performance
//     nvira       08/28/15 - add message for baseline cross node comparison
//     kfgriffi    09/30/15 - Update message file
//     prajm       09/29/15 - fix bug#21535479 - Adding the error message for
//                            block device not supported.
//     ptare       09/28/15 - Update the messages for reporting expected value
//                            in more elaborate form
//     maboddu     09/18/15 - Fix bug#21686952 - Add message for checking port
//                            available
//     kfgriffi    09/16/15 - Fix bug 21789067 - Add leaf role error for not
//                            flex cluster
//     nvira       08/25/15 - add messages for application healthcheck
//     ptare       08/28/15 - Fix Bug#21360183 Add error message to report the
//                            duplication of group locally with different ID
//     nvira       08/25/15 - add messages for application healthcheck
//     jgagarci    08/21/15 - fix bug#21558459 - add service name in the
//                            Windows time service messages
//     prajm       08/13/15 - fix bug#21612406 - Adding error messages
//     xesquive    08/13/15 - Fix bug21629720 add message for gns running
//                            without subdomain
//     xesquive    08/04/15 - Fix bug21513212 improve message in dns check
//     spavan      08/03/15 - fix bug19427746 - add messages
//     kfgriffi    07/30/15 - Add summary messages
//     maboddu     07/29/15 - Fix bug#21509904 - correct the messages for database 
//                            best practice and mandatory requirements
//     shshrini    07/23/15 - Fix bug 21462101 - Add a new error message for
//                            network discovery
//     kfgriffi    07/16/15 - Add verifying message for NTP port check
//     ptare       07/13/15 - Fix Bug#19282952 enable stack shell limits check
//     nvira       07/06/15 - add message for incorrect baseline report format
//     spavan      07/07/15 - fix bug21297404 - add message for star user
//                            equivalence subcheck
//     maboddu     07/03/15 - Fix bug#21270065 - Add messages for invalid src
//                            crs home
//     spavan      06/30/15 - fix bug21341359 - message for NTP check skipping
//     shshrini    06/23/15 - Fix bug 20625504 - Update IPMP related error
//                            messages with clear information
//     dsaggi      06/10/15 - Fix 21221366 - Correct placeholder index for
//                            TASK_PATH_GRP_PERM_INVALID_PERM
//     xesquive    06/03/15 - Fix bug21046194 add msg for warn the no execution
//                            of dns task
//     prajm       06/02/15 - Adding the messages for exectask new format error
//                            reporting
//     ptare       05/26/15 - Correct message new line.
//     shshrini    05/22/15 - Fix bug 21058428 - Consolidate the error messages
//                            in case of mismatch in NIS and DNS scan addresses
//     shhirema    05/20/15 - Add messsages for ASM connection info retrieval
//                            APIs
//     dsaggi      05/04/15 - add sharedness check messages - readwrite
//                            permissions
//     shshrini    05/12/15 - Fix bug 21075123 - Add a new error message for
//                            invalid -networks value
//     shshrini    05/05/15 - Fix bug 20803132 - Add a new error message if
//                            there are no public cluster networks to perform
//                            VIP subnet check
//     dsaggi      05/04/15 - add sharedness check messages - readwrite
//                            permissions
//     spavan      04/30/15 - fix bug20474814 - add fixup messages
//     maboddu     04/29/15 - Fix bug#20899555 - Add equivalent crs error
//                            messages
//     iestrada    04/15/15 - Fix bug 20435104 - Empty task list messages when
//                            application cluster is configured
//     dsaggi      04/06/15 - Additional messages for new storage framework
//     nvira       03/27/15 - add oracle patch collection
//     nvira       03/18/15 - add messages for crsd environment variable
//                            collection
//     shshrini    03/25/15 - Fix bug 20670616 - Add a new messages to indicate
//                            interface and IP connectivity failures for subnet
//     shhirema    03/12/15 - ASM ACL disabled check
//     spavan      02/27/15 - proj-47208 - support GMSA
//     nvira       01/21/15 - add messages for ASM collection
//     shshrini    01/16/15 - Enhance network checks, project 47212
//     dsaggi      02/05/15 - Storage discovery related messages
//     iestrada    02/04/15 - add messages for application cluster stage
//     nvira       09/17/14 - add message for OS collections
//     spavan      01/28/15 - fix bug16006083 - add message for user
//                            equivalence checks
//     shhirema    01/07/15 - fix bug 20197149
//     xesquive    12/19/14 - change message oraarpdrv start type bug20226362
//     nvira       09/17/14 - add message for OS collections
//     maboddu     12/09/14 - Add message for XML parser error
//     dsaggi      12/01/14 - New Storage Framework
//     maboddu     12/08/14 - Fix bug#20078140 - Add error messages for ASM
//                            param file
//     spavan      12/04/14 - fix bug20007778 - add message for failure to get
//                            group
//     xesquive    12/03/14 - add error for query name failed
//     shhirema    11/20/14 - add ASM check messages
//     spavan      11/18/14 - fix bug17447588 - add messages for parsing
//     shhirema    11/09/14 - add ASM disk consistency check error
//     spavan      10/06/14 - XbranchMerge spavan_bug-19316773 from st_has_12.1
//     kfgriffi    09/29/14 - Output reporting redesign
//     shhirema    09/18/14 - Add messages for cvuhelper runASMQuery
//     prajm       09/12/14 - Adding the error messages for dnfs check
//     jgagarci    08/26/14 - fixBug 18912462 - change message to specify for
//                            linux systems
//     spavan      08/26/14 - XbranchMerge spavan_bug-18404908 from st_has_12.1
//     shshrini    08/06/14 - Fix bug 18834934 - Add error message for MONITOR
//                            option for AIX
//     maboddu     07/25/14 - Fix bug#8901129 - Add messages for task oracle fence
//                            service
//     jgagarci    07/22/14 - Fix bug10208003 - Check antivirus service not running
//     prajm       07/08/14 - Fix bug 18888764  - Adding the message for ADVM Compatibility check
//     maboddu     07/03/14 - Fix bug#8507261 - Add messages for
//                            sTaskCheckVMMSettings
//     xesquive    06/03/14 - add message for oraarp service bug16552534
//     spavan      07/22/14 - fix bug17940721 - support offline disks
//     shshrini    05/29/14 - Fix bug 18715868 - Add error message for 'srvctl
//                            config network'
//     nvira       05/22/14 - bug fix 18730096, add method to get database
//                            infos
//     xesquive    05/21/14 - improve message in request to dns bug18805500
//     spavan      05/19/14 - fix bug18562889 - add messages for audit file
//                            checks
//     ptare       05/19/14 - XbranchMerge ptare_bug-18726891 from main
//     maboddu     05/16/14 - XbranchMerge maboddu_bug-18642379 from
//                            st_has_12.1
//     prajm       05/12/14 - XbranchMerge prajm_bug_18635111 from main
//     ptare       05/08/14 - Fix Bug#18726891 Add assert message for ASM disk
//                            group
//     kfgriffi    05/05/14 - Fix bug 16796738 - Add CRS resource collection
//                            error
//     iestrada    05/03/14 - Fix Bug 18417590 - add messages for path group
//                            permissions validation
//     ptare       04/29/14 - Bug#16980582 Add messages related to ASM
//                            parameter file check
//     iestrada    04/25/14 - Fix bug 16094414 - Add messages resolv.conf validation
//     dsaggi      04/21/14 - XbranchMerge dsaggi_bug-18310989 from st_has_12.1
//     spavan      04/10/14 - fix bug18404908 - improve error messages for
//                            slewing option
//     dsaggi      04/09/14 - Add mutiple path related message
//     ptare       04/09/14 - Remove ASMLib installed warning message as it is
//                            not used anymore
//     xesquive    04/07/14 - Fix bug16095676 - add message in resolv.conf
//     ptare       04/04/14 - Add messages for Upgrade network checks
//     maboddu     04/02/14 - Fix bug#18113425 - Add the messages for NIC
//                            metric check
//     dsaggi      04/03/14 - Add ACFS related message
//     shshrini    03/25/14 - Fix bug 18033647 - Adding check for overlapping
//                            subnets
//     xesquive    03/21/14 - bug18400389 isValidGNSVIP messages
//     iestrada    03/20/14 - Fix bug 18428799 add messages for task path
//                            validation
//     kfgriffi    03/19/14 - Update CRS software version error message
//     iestrada    03/18/14 - Fix bug 15991448 - add messages for disk scheduler
//                            verification
//     nvira       03/18/14 - add message for software check skipped nodes
//     iestrada    03/14/14 - Fix bug 18395150 typo in messages NO_DB_EDITION_FOUND
//                            and NO_NODES_WITH_DBHOME
//     xesquive    02/27/14 - add dns waiting msg bug18265602
//     maboddu     02/27/14 - Fix bug#16543421 - Add messages for
//                            TaskNodeConnectivity
//     shshrini    02/25/14 - Fix bug 17303677 - Add new message for Infiniband
//                            verification on Exadata environment
//     ptare       02/17/14 - Fix Bug#16883648 add message to report classified
//                            public subnet with no VIP
//     iestrada    02/12/14 - Fix bug 17945302 - add message for RAC home writable 
//                            validation task
//     shshrini    01/31/14 - Fix bug 13813224 - add getDbNodes() related
//                            cvuhelper messages
//     shshrini    01/31/14 - Fix bug 18080236 - updating error messages for
//                            link-local address checks
//     ptare       01/29/14 - Add global error messages for task instantiation
//     maboddu     01/29/14 - Fix bug#17901703 - Add error msg for non writable
//                            path
//     dsaggi      01/28/14 - Add message for client cluster GNS VIP validation
//     kfgriffi    01/24/14 - fix bug 17979016
//     ptare       01/17/14 - Add message for failure in retrieval of Oracle
//                            home user
//     nvira       01/15/14 - bug fix 18039412, add check to ensure oracle
//                            binary exists first
//     spavan      01/13/14 - fix bug18023241 - add message for context failure
//     shshrini    01/07/14 - Fixing Bug 16628458
//     mpradeep    01/02/14 - 17337434 - Add messages for ons integrity checks
//     shshrini    01/07/14 - Fix bug 16628458
//     nvira       12/30/13 - review comments
//     nvira       12/23/13 - review comments
//     nvira       12/18/13 - add message for database collection
//     maboddu     09/25/13 - Fix bug#16932886 - Add fixup message for
//                            sTaskIPMPSettings
//     nvira       12/10/13 - review comments
//     ptare       12/10/13 - Add message to reported unexpected mount options
//     ptare       12/05/13 - Add subnet information for public subnet check in
//                            case of IPMP
//     nvira       12/05/13 - add message for DB service count
//     ptare       11/24/13 - Add message for OCR backup location on ASM
//     dsaggi      11/21/13 - Add MACRO for CAUSE & ACTION translation
//     iestrada    11/14/13 - Fix bug 16227830. Add message when crs home and
//                            src home are same
//     spavan      11/08/13 - fix bug16066165 - file copy failure message
//     iestrada    11/08/13 - Fix bug 17746838. Add Message CRS is not configured
//     nvira       11/01/13 - add skipped
//     maboddu     10/29/13 - Fix bug#17272925 - Add message for TaskDNSChecks
//     iestrada    10/28/13 - Fix bug 16242734 - Add messages for DatabaseEdition
//     kfgriffi    10/25/13 - Fix bug 17631033 - modify 'eth' usage
//     shshrini    10/24/13 - Fix bug 17506719, Updating error reporting for
//                            TaskMulticast
//     maboddu     10/24/13 - Fix bug#17494773 - add fixup messages for task
//                            CHECK_GSD_RESOURCE
//     spavan      10/16/13 - fix bug17433328 - error message for asm disk
//                            group failure
//     kfgriffi    10/11/13 - Add no Clusterware stack running message
//     xesquive    10/09/13 - add error for gns credential validation
//     iestrada    10/02/13 - Fix 14837409 - add messages CRS not installed and
//                            CRS not running
//     maboddu     09/30/13 - Fix bug#17028790 - Add message for GetDirSize
//     ptare       09/18/13 - Add messages related to ASM device stamp paths
//                            managed by ASM
//     dsaggi      09/18/13 - Incorporate review comments
//     maboddu     09/17/13 - Fix bug#17378708
//     spavan      09/10/13 - fix bug16969841 - update message
//     dsaggi      09/10/13 - XbranchMerge dsaggi_bug-16552441 from
//                            st_has_11.2.0
//     ptare       09/06/13 - Add message related to device file settings
//                            fix-up
//     ptare       09/04/13 - Add messages related to ASM Filter Driver prereq
//                            checks
//     maboddu     08/28/13 - Fix lrg#9676513
//     spavan      08/21/13 - fix bug16922949 - add new error processing
//     ptare       08/21/13 - Fix Bug#16825385 -Add message to report failure
//                            in retrieval of network interface information
//                            from existing home
//     maboddu     08/20/13 - Fix bug#13970112 - add messages for
//                            TaskPolicyDBHomeAvailability
//     xesquive    08/15/13 - add message for ocr locations
//     maboddu     08/14/13 - Fix bug#15901938
//     dsaggi      08/07/13 - Fix 16175248 -- New message for being unable to check sharedness
//     spavan      07/31/13 - fix bug16905096 - add root execution message
//     maboddu     07/29/13 - Fix bug#17174370 - Add message for OSDB group
//                            check
//     ptare       07/29/13 - Add fix-up messages for failure in system calls
//     nvira       07/11/13 - add constants for collection groups
//     maboddu     07/01/13 - Add fixup message for TaskPinNodes
//     ptare       06/24/13 - Add message for network classification
//                            unavailabilty for IPMP check
//     dsaggi      05/29/13 - Add messages for command and API details 
//     maboddu     06/11/13 - Upgrade msg FILE_MISSING_PATH
//     spavan      05/31/13 - fix bug16718065 - add messages for TaskNTP
//     xesquive    05/29/13 - fix bug13530768
//     ptare       05/24/13 - Add error messages related to pluggable fixups
//     maboddu     04/29/13 - Add messages for fixup task
//     xesquive    04/25/13 - fix bug16519090
//     agorla      04/16/13 - add mesages for TCP connectivity check
//     agorla      03/22/13 - add messages for password re-enter
//     shshrini    03/13/13 - For fixing the bug 9558581
//     lureyes     03/13/13 - Change RESOLV_CONF_DOMAIN_EXISTS_ALL,
//                            UPGRADE_SUITABILITY_SUMMARY_FAILED and
//                            DB_PORT_PROMPT id number
//     maboddu     02/27/13 - Fix bug#16246278 - Add message for asm default discovery string
//     agorla      02/11/13 - add message for down interfaces
//     ptare       02/05/13 - Add messages for user consistency check
//     ocordova    01/30/13 - Fix Bug 13901932
//     xesquive    01/28/13 - add credential error bug16075978
//     maboddu     01/16/13 - Fix bug#16044691
//     xesquive    12/07/12 - add message bug15861449
//     spavan      11/29/12 - fix bug14160571 - add messages for ASM sid error
//     nvira       11/19/12 - add comp baseline messages
//     xesquive    11/09/12 - fix bug14755799
//     maboddu     11/02/12 - Fix bug9393895 - add messages NIC bind order
//                            check
//     nvira       11/01/12 - add messages for rolling/non-rolling
//     nvira       10/24/12 - bug fix 14693330
//     agorla      10/23/12 - bug#14777475 - change TASK_SCAN_INSUFFICIENT_IPS
//                            msg as warning
//     ptare       10/23/12 - add local node CRS not running message
//     maboddu     10/14/12 - Correct root user consistency message
//     spavan      10/05/12 - fix bug9966385 - add cause/action to free space
//                            messages
//     kfgriffi    10/05/12 - Fix error message
//     agorla      10/05/12 - messages for disabled checks
//     nvira       09/28/12 - bug fix 14609463
//     agorla      09/27/12 - bug#14666135 - 12.1 do not have any auto nodes
//     dsaggi      09/26/12 - Fix 14676889 - Do not expose use of pbrun in 12.1
//     dsaggi      07/18/12 - Add farm checks
//     dsaggi      07/16/12 - Add farmcheck component
//     ptare       09/22/12 - Fix Bug#14649365 update message for upgrade
//                            listener and asm instance check
//     spavan      09/20/12 - fix bug12371655 - add NTP not configured message
//     ptare       09/13/12 - Fix Bug#14595811
//     rtamezd     09/11/12 - Fix bug 14115195
//     maboddu     08/30/12 - Fix bug14373486
//     nvira       08/24/12 - bug fix 14100438
//     ptare       08/27/12 - Add messages for ASM Instance and Listener check
//                            for upgrade
//     ptare       08/23/12 - Add shared location error message
//     dsaggi      08/22/12 - Add messages for Kernel 64 bit validation
//     dsaggi      08/02/12 - Fix 13856307 -- add messages related to cvuqdisk
//                            validation
//     nvira       08/03/12 - bug fix 14247257
//     ptare       08/02/12 - Add message for Dummy disk supported disk with
//                            NFS
//     xesquive    07/04/12 - replace 'Windows service user' for 'Oracle home
//                            user' bug 14004313
//     nvira       06/28/12 - bug fix 14242623
//     ptare       06/18/12 - Add user addition without home directory related
//                            messages for fix-up
//     agorla      06/04/12 - messages for TaskValidateNodeRoles
//     spavan      06/01/12 - fix bug14140332 - don't hardcode device path
//     dsaggi      05/30/12 - Add message for getASMHome
//     ptare       05/21/12 - Add Daemon lifelessness messages
//     ptare       05/18/12 - Add Fixup execution missing related message
//     ptare       05/15/12 - Bug#14074105 Correct firewall check message
//     dsaggi      05/10/12 - add message related to ACFS support
//     xesquive    05/07/12 - add message
//                            TASK_VERIFY_SERVICE_USER_PASSWORD_FAILED
//     ptare       04/27/12 - Fix Bug#13993981
//     spavan      04/25/12 - fix bug13648588
//     ptare       04/18/12 - Fix Bug#9714264
//     xesquive    04/18/12 - add message when the option is not valid with the
//                            current version
//     nvira       04/09/12 - add message for TaskUpgradeSuitability
//     nvira       03/30/12 - move msgs from PrvfMsg to PrvgMsg
//     ptare       03/22/12 - Add message for port actual value
//     ptare       03/14/12 - Add message to report fix up generation failure
//     dsaggi      03/13/12 - Add messages for nsswitch.conf validation
//     dsaggi      03/08/12 - Add messages for OHASD & OLR
//     dsaggi      02/09/12 - Add resolv.conf related messages
//     ptare       02/15/12 - Add ASMlib Related more info message
//     nvira       02/15/12 - bug fix 13716255, fix the file name, fix hosts
//                            entry comparison to ignore whitespaces
//     ptare       02/14/12 - Fix message 5906 for Bug#12926023
//     xesquive    02/07/12 - Write in a proper way the messages 4531,4532,4533
//     agorla      02/13/12 - bug#13514140 - add messages
//     spavan      02/08/12 - fix bug13491420
//     nvira       12/20/11 - add unsuitablitiy message for ACFS path
//     xesquive    02/07/12 - Bug fix 13566257
//     ptare       01/24/12 - correct sudo existence message
//     agorla      01/18/12 - CVUDB wallet message
//     agorla      12/28/11 - bug#13099095 - multiple NIC err msg
//     ptare       12/27/11 - Add port availability related messages
//     ptare       12/23/11 - Add fixup set-up related error message
//     dsaggi      11/11/11 - Add messages related to node addition
//     dsaggi      12/06/11 - Add CRS configuration message
//     dsaggi      11/28/11 - fix spelling errors
//     spavan      11/15/11 - crsctl messages for light weight display
//     agorla      11/14/11 - sql checks support for any user
//     ptare       11/11/11 - Add message for failure in fixup generation
//     agorla      10/31/11 - 12g messages for TaskScan
//     spavan      10/28/11 - add messages for ioserver checks
//     ptare       10/27/11 - Add runlevel fixup message
//     ptare       10/17/11 - Add messages for fixup tasks
//     xesquive    10/10/11 - bug fix 12920097
//     xesquive    10/05/11 - Bug 12894761
//     agorla      09/27/11 - 12g broadcast messages
//     epineda     09/26/11 - Added messages for OSDBA group task
//     spavan      09/23/11 - add messages for big cluster
//     agorla      09/14/11 - bigcluster messages
//     nvira       09/01/11 - add message for target hub size assertion
//     spavan      09/08/11 - add messages for root command execution
//     nvira       08/11/11 - add messages for ocr integrity
//     narbalas    08/12/11 - Adding message for Channel
//     agorla      08/11/11 - 12g multicast messages
//     nvira       08/11/11 - add messages for ocr integrity
//     ptare       08/06/11 - XbranchMerge ptare_lrg-5749653 from st_has_11.2.0
//     spavan      07/29/11 - remote asm messages
//     nvira       07/25/11 - add messages for bug #12777602
//     nvira       07/18/11 - add messages for db user consistency
//     dsaggi      06/09/11 - Fix 12639866 -- New message related to node
//                            addition
//     ptare       08/03/11 - Add NTP offset limit error message
//     nvira       07/20/11 - bug fix 12699639
//     nvira       06/16/11 - XbranchMerge nvira_bug-8289500 from main
//     agorla      07/14/11 - bug#12729472 - Document DB_CREDENTIAL_ERROR
//     dsaggi      06/14/11 - XbranchMerge dsaggi_bug-12639866 from main
//     agorla      06/13/11 - XbranchMerge agorla_b-10158893 from main
//     ptare       05/31/11 - XbranchMerge ptare_bug-12412514 from main
//     ptare       05/25/11 - Add OCR key related messages
//     spavan      05/23/11 - add Messages for proj 19732
//     nvira       04/13/11 - add msg of oracle patch task
//     agorla      05/03/11 - dbinst -upgrade messages
//     agorla      04/28/11 - db stale schema messages
//     ptare       04/21/11 - Add messages for private IP and subnet check
//     agorla      04/13/11 - bug#12354619 - add message
//     kfgriffi    04/04/11 - Fix bug 11857256
//     ptare       04/03/11 - Add messages for Fix up project
//     kfgriffi    03/28/11 - Fix bug 11871148
//     spavan      03/10/11 - fix bug11688154
//     agorla      03/09/11 - bug#10158893 - multicast check messages
//     nvira       03/04/11 - add messages for sqlnet.ora
//     nvira       02/24/11 - add message for kernel param config values
//     agorla      02/21/11 - bug#10240356 - add messages
//     spavan      02/18/11 - XbranchMerge spavan_b9815115 from st_has_11.2.0
//     agorla      02/09/11 - bug#10623974 - add messages
//     narbalas    01/27/11 - Adding messages for sTaskRootConsistency
//     agorla      01/26/11 - bug#10361306 - mtu mismatch msg for private ifs
//     ptare       01/20/11 - Add SoftwareVersion retrieval message
//     ptare       01/21/11 - Add messages for the Registry Key retrieval on
//                            windows
//     narbalas    01/20/11 - Adding messages for comp freespace
//     ptare       01/17/11 - Add message for getAvailableSpace API
//     spavan      01/15/11 - fix bug9958592
//     spavan      01/12/11 - fix bug9445585
//     kfgriffi    01/10/11 - Fix bug 9857270
//     ptare       01/06/11 - XbranchMerge ptare_bug-10281734 from
//                            st_has_11.2.0
//     kfgriffi    12/17/10 - XbranchMerge kfgriffi_bug-9688889 from main
//     ptare       12/10/10 - Add ASMLib Configuration related messages
//     spavan      12/09/10 - XbranchMerge spavan_cvuhelper from main
//     ptare       12/07/10 - Add messages for ASM stamp to device path
//     ptare       11/25/10 - Bug#9544895 Add messages for Firewall check
//     spavan      07/27/10 - fix bug9815115
//     spavan      12/09/10 - XbranchMerge spavan_cvuhelper from main
//     ptare       11/25/10 - Bug#9544895 Add messages for Firewall check
//     spavan      07/27/10 - fix bug9815115
//     ptare       01/06/11 - XbranchMerge ptare_bug_9544895 from st_has_11.2.0
//     agorla      12/06/10 - bug#10092020 - add messages
//     kfgriffi    12/06/10 - Fix bug 9688889
//     kfgriffi    11/08/10 - Add process termination message
//     agorla      10/22/10 - Messages for SQL health check
//     spavan      10/08/10 - add error messages for cvuhelper
//     narbalas    09/22/10 - Fix SIHA environment
//     ptare       07/20/10 - Add Domainuser failure message
//     kfgriffi    06/24/10 - Add LV error message
//     spavan      06/03/10 - fix bug9713349
//  */
//
// PACKAGE=package oracle.ops.verification.resources;
// MSGIDTYPE=interface
/* NLS_TRANSLATE_CAUSE_ACTION_START */
0100, DIRECTORY_ABSENT_NOT_WRITABLE, "Directory \"{0}\" does not exist or is not writable for the current user on node \"{1}\"."
//  *Cause: A requested operation could not complete because it required
//          writing the indicated directory, which failed because either
//          the directory path did not exist or was not writable by the
//          current user.
// *Action: Ensure that the indicated directory location exists and is writable
//          by the current user.
/
0101, DIRECTORY_ABSENT_NOT_READABLE, "Directory \"{0}\" does not exist or is not readable by the current user on node \"{1}\"."
//  *Cause: A requested operation could not complete because it required
//          reading the indicated directory, which failed because either
//          the directory path did not exist or was not readable by the
//          current user.
// *Action: Ensure that the indicated directory location exists and is readable
//          by the current user.
/
0102, DIRECTORY_DELETE_FAILED, "failed to delete directory \"{0}\" on node \"{1}\""
//  *Cause: A requested operation could not complete because it required
//          deleting the indicated directory, which failed because the
//          directory path did not have required permissions for the current
//          user to delete it.
// *Action: Ensure that the indicated directory has required permissions for the
//          current user to delete it.
/
0103, FILE_DELETE_FAILED, "failed to delete file \"{0}\" on node \"{1}\""
//  *Cause: A requested operation could not complete because it required
//          deleting the indicated file, which failed because the file path 
//          did not have required permissions for the current user to delete it.
// *Action: Ensure that the indicated file path has required permissions for the
//          current user to delete it.
/
0205, REPORT_HEALTH_CHECK, "Health Check"
// *Document: NO
//  *Cause:
// *Action:
/
0206, COMP_HEALTH_CHECK_DISP_NAME, "Health Check"
// *Document: NO
//  *Cause:
// *Action:
/
0207, VERIFYING_TASK_TEMPLATE, "Verifying {0} ..."
// *Document: NO
//  *Cause:
// *Action:
/
0208, VERIFYING_OS_BEST_PRACTICE, "Verifying OS Best Practice"
// *Document: NO
//  *Cause:
// *Action:
/
0209, VERIFYING_CLUSTERWARE_BEST_PRACTICE, "Verifying Clusterware Best Practice"
// *Document: NO
//  *Cause:
// *Action:
/
0210, VERIFYING_DATABASE_BEST_PRACTICE, "Verifying best practice for database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0211, BEST_PRACTICE_HTML_REPORT_TITLE, "CVU Best Practice Verification Report"
// *Document: NO
//  *Cause:
// *Action:
/
0212, BEST_PRACTICE_HTML_REPORT_OWNER, "Oracle"
// *Document: NO
//  *Cause:
// *Action:
/
0213, DB_DISCOVERY_ERROR, "Error discovering databases, database best practices will not be performed."
// *Document: NO
//  *Cause:
// *Action:
/
0214, BEST_PRACTICE_DB_USER_PASSWORD, "Please specify password for user \"{0}\" :  "
// *Document: NO
//  *Cause:
// *Action:
/
0215, VERIFYING_OS_MANDATORY_REQUIREMENTS, "Verifying OS mandatory requirements"
// *Document: NO
//  *Cause:
// *Action:
/
0216, VERIFYING_CLUSTERWARE_MANDATORY_REQUIREMENTS, "Verifying Clusterware mandatory requirements"
// *Document: NO
//  *Cause:
// *Action:
/
0217, VERIFYING_DATABASE_MANDATORY_REQUIREMENTS, "Verifying mandatory requirements for database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0218, VERIFYING_DATABASE, "Verifying Database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0219, DB_CREDENTIAL_ERROR, "Authorization error establishing connection to database \"{0}\" using user \"{1}\". Verification will be skipped for this database."
//  *Cause: Authorization error occurred while establishing connection to the database using the specified user. This may be because the user does not exist, password is wrong, or user account is locked.
// *Action: Make sure that the specified user exists in the database, account is unlocked and the supplied password is correct.
/
0220, BEST_PRACTICE_DB_PORT, "Please specify database port [default 1521] :  "
// *Document: NO
//  *Cause:
// *Action:
/
0221, BEST_PRACTICE_DISPLAY_NOT_SET, "Cannot launch browser to display the report. Check if the DISPLAY variable is set."
//  *Cause: DISPLAY environment variable is not set
// *Action: set DISPLAY
/
0222, DB_CONNECT_ERROR, "Error establishing connection to database \"{0}\" using user \"{1}\". Verification will be skipped for this database."
//  *Cause: Error occurred while establishing connection with the database using the specified user.
// *Action: Examine the accompanying error message for details.
/
0228, VERIFYING_ASM_MANDATORY_REQUIREMENTS, "Verifying ASM mandatory requirements"
// *Document: NO
//  *Cause:
// *Action:
/
0229, VERIFYING_ASM_BEST_PRACTICE, "Verifying ASM best practices"
// *Document: NO
//  *Cause:
// *Action:
/
0230, VERIFYING_APPLICATION_CLUSTER_REQUIREMENTS, "Verifying Oracle Clusterware Application Cluster requirements"
// *Document: NO
//  *Cause:
// *Action:
/
0250, COLLECTING_TASK_TEMPLATE, "Collecting {0} ..."
// *Document: NO
//  *Cause:
// *Action:
/
0251, COLLECTING_OS_BEST_PRACTICE, "Collecting OS best practice baseline"
// *Document: NO
//  *Cause:
// *Action:
/
0252, COLLECTING_CLUSTERWARE_BEST_PRACTICE, "Collecting Clusterware best practice baseline"
// *Document: NO
//  *Cause:
// *Action:
/
0253, COLLECTING_DATABASE_BEST_PRACTICE, "Collecting Database best practice baseline for database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0254, COLLECTING_OS_MANDATORY_REQUIREMENTS, "Collecting OS mandatory requirements baseline"
// *Document: NO
//  *Cause:
// *Action:
/
0255, COLLECTING_CLUSTERWARE_MANDATORY_REQUIREMENTS, "Collecting Clusterware mandatory requirements baseline"
// *Document: NO
//  *Cause:
// *Action:
/
0256, COLLECTING_DATABASE_MANDATORY_REQUIREMENTS, "Collecting Database mandatory requirements baseline for database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0257, COLLECTING_DATABASE, "Collecting Database baseline for database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
0258, DATABASE_COLLECTION_FAILED, "Baseline collection for database \"{0}\" failed."
//  *Cause: An error occurred while collecting baseline for the database.
// *Action: Examine the accompanying messages for details on the cause of failure.
/
0259, COLLECTING_OS_COLLECTIONS, "Collecting OS configuration baseline"
// *Document: NO
//  *Cause:
// *Action:
/
0260, COLLECTING_ASM_BASELINE, "Collecting ASM baseline"
// *Document: NO
//  *Cause:
// *Action:
/
0275, REPORT_TXT_FARM_CHECK, "Farm Health"
// *Document: NO
//  *Cause:
// *Action:
/
0276, COMP_FARM_CHECK_DISP_NAME, "Farm Health"
// *Document: NO
//  *Cause:
// *Action:
/
0277, INVALID_ASM_DISK_GROUP_NAME, "Specified ASM disk group name is null or an empty string"
// *Cause:  Internal error.
// *Action: Contact Oracle Support Services.
/
0278, WILDCARD_ASM_DISK_GROUP_NAME, "ASM disk group name cannot contain wildcards"
// *Cause:  Internal error.
// *Action: Contact Oracle Support Services.
/
0279, INVALID_ASM_DISK_GROUP_LIST, "Specified ASM disk group list is null or empty."
// *Cause:  Internal error.
// *Action: Contact Oracle Support Services.
/
0280, TASK_GROUP_EXISTENCE_DUPLICATE_GROUP_LOCAL_DIFF_ID, "The group \"{0}\" is defined locally with group ID \"{1}\" on node \"{2}\" which differs from the group ID \"{3}\" defined on the NIS or LDAP database for the same group."
// *Cause:  The indicated group was duplicated on the indicated node with a different group ID than the group ID available on the NIS or LDAP database.
// *Action: Ensure that the group definition in file /etc/group on the indicated node does not define the group with different group ID.
/
0281, GET_CURRENT_GROUP_FAILED, "Failed to retrieve the current effective group."
// *Cause: An attempt to retrieve the current effective group failed.
// *Action: Examine the accompanying messages for details of the cause of the failure.
/
0282, GET_OS_DISTRIBUTION_ID_FAILED, "failed to retrieve the operating system distribution ID"
// *Cause: An attempt to retrieve the operating system distribution ID on the 
//         indicated node failed. The accompanying messages provide 
//         further detail.
// *Action: Examine the accompanying error messages, resolve issues identified 
//          and retry.
/
0286, OS_NO_REF_DATA_WARNING, "Reference data is not available for release \"{0}\" on the current operating system distribution \"{1}\". Using earlier operating system distribution \"{2}\" reference data."
//  *Cause: No reference data was found for the current operating system 
//          distribution.
// *Action: Consult the installation guide for the Oracle product and operating 
//          system (for example, the Oracle Grid Infrastructure Installation 
//          Guide for Linux) for a list of supported operating system 
//          distributions.
/
0299, SUMMARY_TASK_FAILED_NODES, "Check for {0} failed on nodes \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
0300, PHYSICAL_MEMORY_SUMMARY_PASSED, "Physical memory meets or exceeds recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0301, PHYSICAL_MEMORY_SUMMARY_FAILED, "Physical memory did not meet the recommended value of {0} on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0302, AVAILABLE_MEMORY_SUMMARY_PASSED, "Available memory meets or exceeds recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0303, AVAILABLE_MEMORY_SUMMARY_FAILED, "Available memory did not meet the recommended value of {0} on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0304, SWAP_SPACE_SUMMARY_PASSED, "Swap configuration meets or exceeds recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0305, SWAP_SPACE_SUMMARY_FAILED, "Swap configuration did not meet the recommended value of {0} on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0306, USER_EXISTENCE_SUMMARY_PASSED, "User {0} exists"
// *Document: NO
//  *Cause:
// *Action:
/
0307, USER_EXISTENCE_SUMMARY_FAILED, "User {0} does not exist on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0308, GROUP_EXISTENCE_SUMMARY_PASSED, "Group {0} exists"
// *Document: NO
//  *Cause:
// *Action:
/
0309, GROUP_EXISTENCE_SUMMARY_FAILED, "Group {0} does not exist on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0310, RUN_LEVEL_SUMMARY_PASSED, "Run level recommendation are met"
// *Document: NO
//  *Cause:
// *Action:
/
0311, RUN_LEVEL_SUMMARY_FAILED, "Run level is not set to the recommended value of {0} on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0312, ARCHITECTURE_SUMMARY_PASSED, "Architecture recommendation is met"
// *Document: NO
//  *Cause:
// *Action:
/
0313, ARCHITECTURE_SUMMARY_FAILED, "Architecture does not meet the recommended {0} on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0314, PATCH_SUMMARY_PASSED, "Patch {0} meets recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0315, PATCH_SUMMARY_FAILED, "Patch {0} recommendation is not met on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0316, KERNEL_PARAMETER_SUMMARY_PASSED, "Kernel parameter {0} meets recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0317, KERNEL_PARAMETER_SUMMARY_FAILED, "Kernel parameter {0} does not meet recommendation on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0318, PACKAGE_SUMMARY_PASSED, "Package {0} meets recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0319, PACKAGE_SUMMARY_FAILED, "Package {0} recommendation is not met on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0320, GROUP_MEMBERSHIP_SUMMARY_PASSED, "User {0} is a member of group {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0321, GROUP_MEMBERSHIP_SUMMARY_FAILED, "User {0} is not a member of group {1} on {2}"
// *Document: NO
//  *Cause:
// *Action:
/
0322, GROUP_MEMBERSHIP_PRIMARY_SUMMARY_PASSED, "Group {1} is the primary group of user {0}"
// *Document: NO
//  *Cause:
// *Action:
/
0323, GROUP_MEMBERSHIP_PRIMARY_SUMMARY_FAILED, "Group {1} is not the primary group of user {0} on {3}"
// *Document: NO
//  *Cause:
// *Action:
/
0324, KERNEL_VERSION_SUMMARY_PASSED, "Kernel version meets recommendation"
// *Document: NO
//  *Cause:
// *Action:
/
0325, KERNEL_VERSION_SUMMARY_FAILED, "Kernel version does not meet recommended {0} on {1}"
// *Document: NO
//  *Cause:
// *Action:
/
0326, REPORT_TXT_FREE_SPACE, "Free Space"
// *Document: NO
//  *Cause:
// *Action:
/
0327, REPORT_TXT_PORT_NUMBER, "Port Number"
// *Document: NO
//  *Cause:
// *Action:
/
0328, REPORT_TXT_PROTOCOL, "Protocol"
// *Document: NO
//  *Cause:
// *Action:
/
0329, PORT_AVAILABILITY_CHECK_ERROR, "Failed to check \"{0}\" port availability for port number \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to check port availability of an indicated port failed on the identified nodes. 
// *Action: Ensure that the nodes are reachable and the user running this command has required privileges on the nodes identified.
/
0330, PORT_AVAILABILITY_CHECK_FAIL, "\"{0}\" port number \"{1}\" required for component \"{2}\" is already in use on nodes \"{3}\""
//  *Cause: Indicated IP port was found to be in use on the identified nodes.
// *Action: Stop any applications listening on the indicated port on the identified nodes.
/
0331, REPORT_TXT_USED, "Used"
// *Document: NO
//  *Cause:
// *Action:
/
0332, REPORT_TXT_LOGIN_SHELL, "Login Shell"
// *Document: NO
//  *Cause:
// *Action:
/
0333, REPORT_TXT_INFORMATION, "information"
// *Document: NO
//  *Cause:
// *Action:
/
0336, PORT_AVAILABILITY_VERIFYING, "Port {0} available for component \'{1}\'"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: {0} is a protocol type, either TCP or UDP
0337, PORT_NOT_AVAILABLE_MULTICAST_ERROR, "Protocol \"{0}\" port numbers \"{1}\" to be used for multicast communication are already in use on one or more cluster nodes"
//  *Cause: The Cluster Verification Utility (CVU) determined that the 
//          indicated IP ports were already in use on one or more cluster
//          nodes.
// *Action: Ensure that at least one of the indicated ports is not in use by 
//          stopping all applications listening on at least one of the ports 
//          on all the cluster nodes.
/
// Translator: {0} is a protocol type, either TCP or UDP
0338, PORT_NOT_AVAILABLE_BROADCAST_ERROR, "Protocol \"{0}\" port numbers \"{1}\" to be used for broadcast communication are already in use on one or more cluster nodes"
//  *Cause: The Cluster Verification Utility (CVU) determined that the
//          indicated IP ports were already in use on one or more cluster
//          nodes.
// *Action: Ensure that at least one of the indicated ports is not in use by
//          stopping all applications listening on at least one of the ports
//          on all the cluster nodes.
/
0341, GET_LOGIN_SHELL_FAILED_NODE, "Failed to retrieve the current login shell from nodes \"{0}\""
//  *Cause: An attempt to retrieve the current login shell from indicated nodes failed.
// *Action: Ensure that the required login shell settings for current user are correct on the indicated nodes.
/
0360, NON_NFS_FILE_SYSTEM_EXIST_ON_LOCATION, "Location \"{0}\" file system is not NFS"
//  *Cause: An existing file system other than NFS was found on the specified location.
// *Action: Ensure that the specified location has either an NFS file system or no file system.
/
0361, NFS_MOUNT_OPTIONS_INVALID, "Incorrect NFS mount options \"{0}\" used for \"{1}\":\"{2}\" mounted on: \"{3}\""
//  *Cause: An incorrect NFS mount option was found being used for the intended use of the NFS file system mount.
// *Action: Ensure that the file system is mounted with the correct options, Refer the Grid Infrastructure Installation Guide for detailed information on NFS mount options requirement.
/
0362, DNFS_NOT_ENABLED, "DNFS file system is not enabled on node \"{0}\"."
//  *Cause: The DNFS file system was not enabled on the indicated node.  
// *Action: Ensure that the DNFS file sytem is enabled on the indicated node. The DNFS file system can be enabled by running the commands 'cd $ORACLE_HOME/rdbms/lib' and 'make -f ins_rdbms.mk dnfs_on'.
/
0363, DNFS_NOT_SUPPORTED, "DNFS file system is not supported for the Oracle database version \"{0}\"."
//  *Cause: The oracle database version was less than the supported version Oracle 11g.  
// *Action: Ensure that the Oracle database installed is either Oracle 11g or later.
/
0364, DNFS_CHECK_FAILED, "Failed to check whether DNFS file system is enabled on node \"{0}\"."
//  *Cause: An error occurred while checking whether DNFS file system is enabled on the indicated node.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
0365, OFFLINE_DISK_WINDOWS, "Disk \"{0}\" is offline on nodes \"{1}\"."
//  *Cause: The check to ensure that the specified disk is shared across nodes
//          failed because the indicated disk was offline.
// *Action: Ensure that the disk is online. Refer to
//          http://technet.microsoft.com/en-us/library/cc732026.aspx for more 
//          information on how to bring the disks online.
/
0366, COMP_DIAG_DISP_NAME, "Diagnostics"
// *Document: NO
//  *Cause:
// *Action:
/
0367, REPORT_TXT_DIAG, "diagnostic checks"
// *Document: NO
//  *Cause:
// *Action:
/
0400, HDR_CURRENT, "Current"
// *Document: NO
//  *Cause:
// *Action:
/
0401, HDR_IS_ADMIN, "Is Administrator"
// *Document: NO
//  *Cause:
// *Action:
/
0402, HDR_IS_MEMBER, "Member of"
// *Document: NO
//  *Cause:
// *Action:
/
0403, HDR_HAS_PERMISSION, "Has permission"
// *Document: NO
//  *Cause:
// *Action:
/
0404, HDR_FILE_EXISTS, "File exists?"
// *Document: NO
//  *Cause:
// *Action:
/
0405, HDR_SOURCE_NODE, "From node"
// *Document: NO
//  *Cause:
// *Action:
/
0406, HDR_DEST_NODE, "To node"
// *Document: NO
//  *Cause:
// *Action:
/
0407, HDR_SUBNET_MASK, "Subnet Mask"
// *Document: NO
//  *Cause:
// *Action:
/
0408, HDR_NETWORK_TYPE, "Network Type"
// *Document: NO
//  *Cause:
// *Action:
/
0409, HDR_DEPRECATED, "Deprecated Flag"
// *Document: NO
//  *Cause:
// *Action:
/
0410, HDR_IPMP_GROUP, "IPMP Group"
// *Document: NO
//  *Cause:
// *Action:
/
0411, HDR_NIC_CONF_FILE_EXISTS, "NICConfFile"
// *Document: NO
//  *Cause:
// *Action:
/
0412, HDR_NETTYPE, "Network Type"
// *Document: NO
//  *Cause:
// *Action:
/
0413, HDR_IPTYPE, "IP Type"
// *Document: NO
//  *Cause:
// *Action:
/
0414, HDR_IS_GMSA, "Is Group MSA"
// *Document: NO
//  *Cause:
// *Action:
/
0415, HDR_IS_DOMAIN_CONTROLLER, "Is Windows domain controller"
// *Document: NO
//  *Cause:
// *Action:
/
0420, TASK_LIMIT_MAX_STACK, "maximum stack size"
// *Document: NO
//  *Cause:
// *Action:
/
0421, TASK_HARD_LIMIT_BEGIN_MAX_FILES, "Check hard limit for maximum open file descriptors"
// *Document: NO
//  *Cause:
// *Action:
/
0422, TASK_HARD_LIMIT_BEGIN_MAX_PROC, "Check hard limit for maximum user processes"
// *Document: NO
//  *Cause:
// *Action:
/
0423, TASK_HARD_LIMIT_BEGIN_STACK_SIZE, "Check hard limit for maximum stack size"
// *Document: NO
//  *Cause:
// *Action:
/
0424, TASK_SOFT_LIMIT_BEGIN_MAX_FILES, "Check soft limit for maximum open file descriptors"
// *Document: NO
//  *Cause:
// *Action:
/
0425, TASK_SOFT_LIMIT_BEGIN_MAX_PROC, "Check soft limit for maximum user processes"
// *Document: NO
//  *Cause:
// *Action:
/
0426, TASK_SOFT_LIMIT_BEGIN_STACK_SIZE, "Check soft limit for maximum stack size"
// *Document: NO
//  *Cause:
// *Action:
/
0427, TASK_HARD_LIMIT_PASSED_MAX_FILES, "Hard limit check passed for maximum open file descriptors."
// *Document: NO
//  *Cause:
// *Action:
/
0428, TASK_HARD_LIMIT_PASSED_MAX_PROC, "Hard limit check passed for maximum user processes."
// *Document: NO
//  *Cause:
// *Action:
/
0429, TASK_HARD_LIMIT_PASSED_STACK_SIZE, "Hard limit check passed for maximum stack size."
// *Document: NO
//  *Cause:
// *Action:
/
0430, TASK_SOFT_LIMIT_PASSED_MAX_FILES, "Soft limit check passed for maximum open file descriptors."
// *Document: NO
//  *Cause:
// *Action:
/
0431, TASK_SOFT_LIMIT_PASSED_MAX_PROC, "Soft limit check passed for maximum user processes."
// *Document: NO
//  *Cause:
// *Action:
/
0432, TASK_SOFT_LIMIT_PASSED_STACK_SIZE, "Soft limit check passed for maximum stack size."
// *Document: NO
//  *Cause:
// *Action:
/
0433, TASK_HARD_LIMIT_ERROR_MAX_FILES, "Hard limit check failed for maximum open file descriptors."
// *Document: NO
//  *Cause:
// *Action:
/
0434, TASK_HARD_LIMIT_ERROR_MAX_PROC, "Hard limit check failed for maximum user processes."
// *Document: NO
//  *Cause:
// *Action:
/
0435, TASK_HARD_LIMIT_ERROR_STACK_SIZE, "Hard limit check failed for maximum stack size."
// *Document: NO
//  *Cause:
// *Action:
/
0436, TASK_SOFT_LIMIT_ERROR_MAX_FILES, "Soft limit check failed for maximum open file descriptors."
// *Document: NO
//  *Cause:
// *Action:
/
0437, TASK_SOFT_LIMIT_ERROR_MAX_PROC, "Soft limit check failed for maximum user processes."
// *Document: NO
//  *Cause:
// *Action:
/
0438, TASK_SOFT_LIMIT_ERROR_STACK_SIZE, "Soft limit check failed for maximum stack size."
// *Document: NO
//  *Cause:
// *Action:
/
0439, TASK_HARD_LIMIT_ERROR_ON_NODE_MAX_FILES, "Hard limit check for maximum open file descriptors failed on node \"{0}\"."
//  *Cause: The Cluster Verification Utility could not determine the hard limit for the maximum open file descriptors on the indicated node.
// *Action: Ensure that the resource limit configuration is accessible on all the nodes and retry the check.
/
0440, TASK_HARD_LIMIT_ERROR_ON_NODE_MAX_PROC, "Hard limit check for maximum user processes failed on node \"{0}\"."
//  *Cause: The Cluster Verification Utility could not determine the hard limit for the maximum user processes on the indicated node.
// *Action: Ensure that the resource limit configuration is accessible on all the nodes and retry the check.
/
0441, TASK_HARD_LIMIT_ERROR_ON_NODE_STACK_SIZE, "Hard limit check for maximum stack size failed on node \"{0}\"."
//  *Cause: The Cluster Verification Utility could not determine the hard limit for the maximum stack size on the indicated node.
// *Action: Ensure that the resource limit configuration is accessible on all the nodes and retry the check.
/
0442, TASK_SOFT_LIMIT_ERROR_ON_NODE_MAX_FILES, "Soft limit check for maximum open file descriptors failed on node \"{0}\"."
//  *Cause: The Cluster Verification Utility could not determine the soft limit for the maximum open file descriptors on the indicated node.
// *Action: Ensure that the resource limit configuration is accessible on all the nodes and retry the check.
/
0443, TASK_SOFT_LIMIT_ERROR_ON_NODE_MAX_PROC, "Soft limit check for maximum user processes failed on node \"{0}\"."
//  *Cause: The Cluster Verification Utility could not determine the soft limit for the maximum user processes on the indicated node.
// *Action: Ensure that the resource limit configuration is accessible on all the nodes and retry the check.
/
0444, TASK_SOFT_LIMIT_ERROR_ON_NODE_STACK_SIZE, "Soft limit check for maximum stack size failed on node \"{0}\"."
//  *Cause: The Cluster Verification Utility could not determine the soft limit for the maximum stack size on the indicated node.
// *Action: Ensure that the resource limit configuration is accessible on all the nodes and retry the check.
/
0445, TASK_SOFT_LIMIT_IMPROPER_ON_NODE_MAX_FILES, "Proper soft limit for maximum open file descriptors was not found on node \"{0}\" [Expected {1} ; Found = \"{2}\"]."
//  *Cause: The Cluster Verification Utility determined that the setting for
//          the indicated soft limit did not meet Oracle's recommendations for
//          proper operation on the indicated nodes.
// *Action: Modify the resource limits to meet the requirement and take
//          operating system specific measures to ensure that the corrected
//          value takes effect for the current user before retrying this check.
/
0446, TASK_HARD_LIMIT_IMPROPER_ON_NODE_MAX_FILES, "Proper hard limit for maximum open file descriptors was not found on node \"{0}\" [Expected {1} ; Found = \"{2}\"]."
//  *Cause: The Cluster Verification Utility determined that the setting for 
//          the indicated hard limit did not meet Oracle's recommendations for
//          proper operation on the indicated nodes.
// *Action: Modify the resource limits to meet the requirement and take 
//          operating system specific measures to ensure that the corrected 
//          value takes effect for the current user before retrying this check.
/
/
0447, TASK_SOFT_LIMIT_IMPROPER_ON_NODE_MAX_PROC, "Proper soft limit for maximum user processes was not found on node \"{0}\" [Expected {1} ; Found = \"{2}\"]."
//  *Cause: The Cluster Verification Utility determined that the setting for the
//          indicated soft limit did not meet Oracle's recommendations for 
//          proper operation on the indicated nodes.
// *Action: Modify the resource limits to meet the requirement and take 
//          operating system specific measures to ensure that the corrected 
//          value takes effect for the current user before retrying this check.
/
0448, TASK_HARD_LIMIT_IMPROPER_ON_NODE_MAX_PROC, "Proper hard limit for maximum user processes was not found on node \"{0}\" [Expected {1} ; Found = \"{2}\"]."
//  *Cause: The Cluster Verification Utility determined that the setting for
//          the indicated hard limit did not meet Oracle's recommendations for
//          proper operation on the indicated nodes.
// *Action: Modify the resource limits to meet the requirement and take 
//          operating system specific measures to ensure that the corrected 
//          value takes effect for the current user before retrying this check.
/
0449, TASK_SOFT_LIMIT_IMPROPER_ON_NODE_STACK_SIZE, "Proper soft limit for maximum stack size was not found on node \"{0}\" [Expected {1} ; Found = \"{2}\"]."
//  *Cause: The Cluster Verification Utility determined that the setting for
//          the indicated soft limit did not meet Oracle's recommendations for
//          proper operation on the indicated nodes.
// *Action: Modify the resource limits to meet the requirement and take 
//          operating system specific measures to ensure that the corrected 
//          value takes effect for the current user before retrying this check.
/
0450, TASK_HARD_LIMIT_IMPROPER_ON_NODE_STACK_SIZE, "Proper hard limit for maximum stack size was not found on node \"{0}\" [Expected {1} ; Found = \"{2}\"]."
//  *Cause: The Cluster Verification Utility determined that the setting for 
//          the indicated hard limit did not meet Oracle's recommendations for
//          proper operation on the indicated nodes.
// *Action: Modify the resource limits to meet the requirement and take 
//          operating system specific measures to ensure that the corrected 
//          value takes effect for the current user before retrying this check.
/
0451, TASK_DESC_HARD_LIMITS_MAX_FILES, "This is a prerequisite condition to test whether the hard limit for maximum open file descriptors is set correctly."
// *Document: NO
//  *Cause:
// *Action:
/
0452, TASK_DESC_SOFT_LIMITS_MAX_FILES, "This is a prerequisite condition to test whether the soft limit for maximum open file descriptors is set correctly."
// *Document: NO
//  *Cause:
// *Action:
/
0453, TASK_DESC_HARD_LIMITS_MAX_PROC, "This is a prerequisite condition to test whether the hard limit for maximum user processes is set correctly."
// *Document: NO
//  *Cause:
// *Action:
/
0454, TASK_DESC_SOFT_LIMITS_MAX_PROC, "This is a prerequisite condition to test whether the soft limit for maximum user processes is set correctly."
// *Document: NO
//  *Cause:
// *Action:
/
0455, TASK_DESC_HARD_LIMITS_STACK_SIZE, "This is a prerequisite condition to test whether the hard limit for maximum stack size is set correctly."
// *Document: NO
//  *Cause:
// *Action:
/
0456, TASK_DESC_SOFT_LIMITS_STACK_SIZE, "This is a prerequisite condition to test whether the soft limit for maximum stack size is set correctly."
// *Document: NO
//  *Cause:
// *Action:
/
0500, REPORT_TXT_UNDEFINED, "undefined"
// *Document: NO
//  *Cause:
// *Action:
/
0501, REPORT_TXT_FAILED_NODES, "Failed on nodes"
// *Document: NO
//  *Cause:
// *Action:
/
0502, REPORT_REBOOT_REQUIRED, "Reboot required?"
// *Document: NO
//  *Cause:
// *Action:
/
0503, REPORT_VRF_FAILED_ON_ASM_PARAMETERS, "Checks did not pass for the following ASM parameters:"
// *Document: NO
//  *Cause:
// *Action:
/
0504, REPORT_VRF_FAILED_ON_ASM_INSTANCE, "Checks did not pass for the following ASM instances:"
// *Document: NO
//  *Cause:
// *Action:
/
0505, REPORT_VRF_FAILED_ON_ASM_DISK_GROUP, "Checks did not pass for the following ASM disk groups:"
// *Document: NO
//  *Cause:
// *Action:
/
0506, REPORT_VRF_FAILED_ON_ASM_DISK, "Checks did not pass for the following ASM disks:"
// *Document: NO
//  *Cause:
// *Action:
/
0507, REPORT_VRF_FAILED_ON_DATABASE, "Checks did not pass for the following databases:"
// *Document: NO
//  *Cause:
// *Action:
/
0508, REPORT_VRF_FAILED_ON_DATABASE_INSTANCE, "Checks did not pass for the following database instances:"
// *Document: NO
//  *Cause:
// *Action:
/
0509, REPORT_VRF_FAILED_ON_ASM, "The following checks did not pass for ASM:"
// *Document: NO
//  *Cause:
// *Action:
/
0510, REPORT_RELOGIN_REQUIRED, "Re-Login required?"
// *Document: NO
//  *Cause:
// *Action:
/
0511, REPORT_VRF_SFUL_ON_ASM_PARAMETERS, "Checks passed for the following ASM parameters:"
// *Document: NO
//  *Cause:
// *Action:
/
0512, REPORT_VRF_SFUL_ON_ASM_INSTANCE, "Checks passed for the following ASM instances:"
// *Document: NO
//  *Cause:
// *Action:
/
0513, REPORT_VRF_SFUL_ON_ASM_DISK_GROUP, "Checks passed for the following ASM disk groups:"
// *Document: NO
//  *Cause:
// *Action:
/
0514, REPORT_VRF_SFUL_ON_ASM_DISK, "Checks passed for the following ASM disks:"
// *Document: NO
//  *Cause:
// *Action:
/
0515, REPORT_VRF_SFUL_ON_DATABASE, "Checks passed for the following databases:"
// *Document: NO
//  *Cause:
// *Action:
/
0516, REPORT_VRF_SFUL_ON_DATABASE_INSTANCE, "Checks passed for the following database instances:"
// *Document: NO
//  *Cause:
// *Action:
/
0517, REPORT_VRF_SFUL_ON_ASM, "The following checks passed for ASM:"
// *Document: NO
//  *Cause:
// *Action:
/
0518, REPORT_VRF_SFUL_ON_NODES, "Checks passed on nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
0528, REPORT_FULL_VERSION, "Full version"
// *Document: NO
//  *Cause:
// *Action:
/
0530, FAILED_GENERATE_FIXUP, "Failed to generate fix up"
// *Document: NO
//  *Cause:
// *Action:
/
0540, COMMAND_LINE_INCORRECT_INPUT, "An incorrect value was specified for \"{0}\""
//  *Cause: Incorrect value was specified for the identified command line option.
// *Action: Ensure that the correct value is specified for the identified command line option.
/
0550, FAILED_READ_OCRDUMP_KEY, "Failed to retrieve the value of an OCR key \"{0}\""
//  *Cause: An attempt to read the specified OCR key from the local node failed.
// *Action: Ensure that current user has required privileges to access 'ocrdump'. 
/
0551, OCRDUMP_KEY_ABSENT, "The OCR key \"{0}\" was not found in OCR"
//  *Cause: Could not find the specified OCR key in OCR.
// *Action: Ensure that current user has required privileges to access 'ocrdump'. 
/
0600, PATH_EXISTS_OR_CAN_BE_CREATED, "Path \"{0}\" either already exists or can be successfully created on nodes: \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
0601, ERROR_VERSION_EXISTS, "The current source software is already version \"{0}\""
//  *Cause: Verification of pre-upgrade conditions determined that the software is already at the specified upgrade version.
// *Action: Ensure that the correct '-dest_version' was specified.
/
0602, ERROR_ACQUIRE_DATABASE_VERSION, "Failed to retrieve database version of database home \"{0}\""
//  *Cause: An error occurred while retrieving database version of the database home.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
0700, INVALID_TARGET_HUB_SIZE, "Invalid target hub size"
//  *Cause: An invalid target hub size was specified
// *Action: Specify a valid target hub size
/
0710, ROLLING_UPGRADE_STACK_NOT_UP, "CRS stack must be running on the local node for performing rolling upgrade."
//  *Cause: CRS stack is not running on the local node.
// *Action: Start the stack on the local node.
/
0711, SPECIFY_NODELIST_ON_CLI, "Specify nodelist with -n <node_list>."
// *Document: NO
//  *Cause:
// *Action:
/
0712, UPGRADE_STACK_NOT_UP, "Cannot upgrade: Oracle Clusterware stack not running on this node."
//  *Cause: An upgrade was requested on a node where the CRS stack was not running.
// *Action: Start the stack on the local node using the command 'crsctl start crs'.
/
0713, UPGRADE_STACK_NOT_UP_LOCAL_NODE, "Cannot upgrade: Oracle Clusterware stack not running on the local node, but the Oracle Clusterware stack was found running on nodes \"{0}\"."
//  *Cause: An upgrade was requested with Oracle Clusterware stack not running on the local node but one or more remote node had the stack up.
// *Action: Start the stack on the local node using the command 'crsctl start crs'.
/
0714, UPGRADE_STACK_NOT_UP_LOCAL_NODE_WARNING, "Oracle Clusterware stack is not running on the local node. It is recommended that the upgrade be performed with the Oracle Clusterware stack running."
//  *Cause: An upgrade was requested on a node with Oracle Clusterware stack not running.
// *Action: Start the stack on the local node using the command 'crsctl start crs'.
/
0715, IGNORE_NODELIST_ON_CLI, "Ignoring node list option -n <node_list>. Pre-upgrade checks will be performed on all the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
0740, FAILED_ZIP_CVUPACK, "Failed to compress the content of directory \"{0}\" to \"{1}\" file using zip tool \"{2}\". Errors is \"{3}\""
// *Cause: An attempt to compress the content of the indicated directory into 
//         the indicated file failed using the indicated zip tool. 
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0750, FILETYPE_ASM, "ASM"
// *Document: NO
// *Cause:
// *Action:
/
0801, ERR_EXECTASK_TAGS, "invalid internal command tags"
// *Cause:  An attempt to parse an internal command results failed because 
//          either incorrect tags were present in the output or expected tags 
//          were missing in the output. This is an internal error.
// *Action: Contact Oracle Support Services.
/
0802, STORAGE_TYPE_UNKNOWN_ON_NODE,  "Storage type for path \"{0}\" could not be determined on node \"{1}\"."
// *Cause:  An error occurred while attempting to determine the storage type 
//          of the indicated path. Accompanying messages provide further 
//          details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0803, INCONSISTENT_STORAGE_TYPE, "Storage type for path \"{0}\" is inconsistent across the nodes."
// *Cause:  The sharability check for the storage at the indicated path failed 
//          because the associated storage type was not consistent across all 
//          cluster nodes. The varying storage types were as indicated following
//          the message.
// *Action: Make sure that all nodes of the cluster have same storage type for 
//          the specified path.
/
0804, STORAGE_TYPE_FOR_NODES, "Storage type was found as \"{0}\" on nodes: \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
0805, STORAGE_SIGNATURE_UNKNOWN_ON_NODE,  "Signature for storage path \"{0}\" could not be determined on node \"{1}\"."
// *Cause:  An error occurred while attempting to determine the storage 
//          signature of the indicated path. Accompanying messages provide 
//          further details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0806, INCONSISTENT_STORAGE_SIGNATURE, "Signature for storage path \"{0}\" is inconsistent across the nodes."
// *Cause:  The sharability check for the storage at the indicated path failed 
//          because the associated storage signature was not consistent across
//          all cluster nodes. The varying signatures were as indicated 
//          following the message.
// *Action: Make sure that all nodes of the cluster have same storage signature
//          for the specified path.
/
0807, STORAGE_SIGNATURE_FOR_NODES, "Signature was found as \"{0}\" on nodes: \"{1}\"."
// *Document: NO
// *Cause:
// *Action:
/
0808, INVALID_MOUNT_OPTIONS, "Incorrect NFS mount options \"{0}\" are used for file system \"{1}\" mount on path \"{2}\" at node \"{3}\"."
// *Cause:  The file system was found mounted with one or more mount options 
//          which were not appropriate for the intended use of the NFS file 
//          system mount.
// *Action: Ensure that the file system is mounted with the correct options, 
//          Refer the Grid Infrastructure Installation Guide for detailed 
//          information on NFS mount options requirement.
/
0809, NFS_MNT_OPTS_NOT_MATCHED, "Mount options for file system \"{0}\" mounted on path \"{1}\" at node \"{2}\" did not meet the requirements for this platform [Expected = \"{3}\" ; Found = \"{4}\"]"
// *Cause:  The mount options found for the indicated file system as displayed
//          in the message did not match the minimum set of mount options (shown
//          in message) that must be used while mounting NFS volumes.
// *Action: Ensure that all of the required mount options are specified.
/
0810, FS_DETAILS_UNKNOWN_ON_NODE,  "File system details for storage path \"{0}\" could not be determined on node \"{1}\""
// *Cause:  There was an error in determining details of file system at the 
//          indiated  path.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0811, STORAGE_DISCOVERY_FAILED_ON_NODE,  "Discovery for storage of type \"{0}\" could not be performed on node \"{1}\"."
// *Cause:  An error occurred while attempting to discover the storage 
//          of the indicated type. Accompanying messages provide
//          further details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0812, FAIL_GET_VENDOR_NODELIST,  "failed to get the list of vendor cluster nodes"
// *Cause:  An error occurred while attempting to get the list of nodes of
//          vendor cluster. Accompanying messages provide further details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0813, NODE_NOT_IN_VENDOR_NODELIST,  "Node \"{0}\" is not recognized by the vendor clusterware."
// *Cause:  The indicated node was not recognized by the vendor 
//          clusterware. 
// *Action: Ensure that the indicated node is recognized  by the vendor clusterware.
/
0814, FAIL_GET_VG_LOCALNODE,  "failed to get the volume groups on node \"{0}\""
// *Cause:  An error occurred while attempting to get the volume groups on the
//          indicated node. Accompanying messages provide further details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0815, VG_NOT_FOUND_WITH_SIGN_LOCALNODE,  "failed to find a volume group with signature  \"{0}\" on node \"{1}\""
// *Cause:  An error occurred while attempting to find a volume group with a
//          specific signature on the indicated node. 
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0816, RESERVE_LOCK_SET_ON_NODE, "The 'reserve_lock' setting prevents sharing of device \"{0}\" on node \"{1}\"."
//  *Cause: The reserve_lock setting for the device was preventing the device from being shared on the node indicated.
// *Action: Change the reserve_lock setting for the device. See the chdev command for further details.
/
0817, RESERVE_POLICY_SET_ON_NODE, "The 'reserve_policy' setting prevents sharing of device \"{0}\" on node \"{1}\"."
//  *Cause: The reserve_policy setting for the device was preventing the device from being shared on the node indicated.
// *Action: Change the reserve_policy setting for the device. See the chdev command for further details.
/
0818, OFFLINE_DISK_WINDOWS_ON_NODE, "Disk \"{0}\" was offline on node \"{1}\"."
//  *Cause: The check to ensure that the specified disk is shared across nodes
//          failed because the indicated disk was offline on the indicated node.
// *Action: Ensure that the disk is online. Refer to
//          http://technet.microsoft.com/en-us/library/cc732026.aspx for more
//          information on how to bring the disks online.
/
0819, STORAGE_DETAILS_NOT_FOUND_ON_NODE,  "The details of storage \"{0}\" could not be obtained on node \"{1}\"."
// *Cause:  An error occurred while attempting to get the details of the 
//          indicated storage. Accompanying messages provide further details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0820, FAIL_GET_FREESPACE_NODE,  "The amount of free space could not be determined for storage \"{0}\" on node \"{1}\"."
// *Cause:  An error occurred while attempting to get the free space on the
//          indicated storage on the indicated node. Accompanying messages 
//          provide further details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0821, FAIL_GET_FREESPACE_ASMDG,  "The amount of free space could not be determined for ASM disk group \"{0}\"."
// *Cause:  An error occurred while attempting to get the free space on the
//          indicated ASM disk group. Accompanying messages provide further 
//          details.
// *Action: Resolve the issues described in any accompanying messages and retry.
/
0822, TASK_SSA_DBLOC_ACCESS, "The specified database file location \"{0}\" did not have read and write access for user \"{1}\" on node \"{2}\". Actual octal permissions are \"{3}\"."
//  *Cause: The database file location did not have read and write permissions 
//          for the indicated user on the indicated node. 
// *Action: If the indicated user intends to be the Oracle installation owner, 
//          ensure that the user has read and write access to the database file
//          location.
/
0825, INVALID_MOUNT_OPTIONS_QUORUM, "Incorrect NFS mount options \"{0}\" found for the quorum disk \"{1}\" mounted on path \"{2}\" at node \"{3}\"."
// *Cause:  The quorum disk was found mounted with one or more mount options 
//          which were not appropriate.
// *Action: Ensure that the quorum disk is soft mounted with the correct options.
/
0826, USER_ID_NOT_FOUND, "No entry was found in the password database for the user name corresponding to the user-ID \"{0}\" for file \"{1}\" on node \"{2}\""
// *Cause:  An attempt to get the user name for the indicated file on the 
//          indicated node failed because no entry was found in the password 
//          database for the indicated user-id.
// *Action: Add the user to the system using the 'adduser' command, 
//          and then retry the operation."
/
0827, GROUP_ID_NOT_FOUND, "No entry was found in the group database for the group name corresponding to the group-ID \"{0}\" for file \"{1}\" on node \"{2}\""
// *Cause:  An attempt to get the group name for the indicated file on the
//          indicated node failed because no entry was found in the  
//          group database for the indicated group-id.
// *Action: Add the group to the system using the 'groupadd' command, 
//          and then retry the operation."
/
0828, POTENTIAL_SHARED_STORAGE_MATCH, "Potential storage ID matches for storge type \"{0}\""
// *Document: NO
//  *Cause: 
// *Action: 
/
0829, POTENTIAL_SHARED_STORAGE_MATCH_ID_LIST, "The storage IDs \"{0}\" were found to exist on all nodes but the device signature could not be determined." 
// *Document: NO
//  *Cause: 
// *Action: 
/
0830, STORAGE_TYPE_PATH_FOR_NODES, "Path \"{0}\" does not exist on nodes \"{1}\". Storage type for longest existing parent path \"{2}\" was found as \"{3}\" on nodes \"{1}\"."
//  *Cause: The sharability check for the storage at the indicated path failed
//          because of the inconsistency described. In particular, the indicated
//          path does not exist on the indicated nodes. Storage of the indicated 
//          type did exist at the indicated parent on the nodes shown.
// *Action: Ensure that the indicated path exists on the indicated nodes and the
//          storage type of the path is consistent across all the nodes.
/
1001, CVUHELPER_INSUFFICIENT_ARGUMENTS, "Insufficient number of arguments while executing \"{0}\""
//  *Cause: An attempt was made to execute the specified script with insufficient number of arguments.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1002, TASK_SCAN_CVUHELPER_FAILURE, "Command \"{0}\" to obtain SCAN configuration failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1003, TASK_OCR_LOC_VALID_CVUHELPER_ERR, "Command \"{0}\" to check if OCR locations are on shared storage failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1004, TASK_GNS_VIP_DOMAIN_CVUHELPER_ERR, "Command \"{0}\" to obtain GNS domain and GNS-VIP configuration failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1005, TASK_GNS_STATUS_CVUHELPER_ERR, "Command \"{0}\" to obtain GNS and GNS-VIP status failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1006, TASK_ASM_RUNNING_CVUHELPER_ERR, "Command \"{0}\" to check if ASM instance is running failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1007, TASK_ASM_DGCOUNT_CVUHELPER_ERR, "Command \"{0}\" to get ASM disk groups configured on local node failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1008, TASK_ASM_RUNCHECK_ERROR, "ASM status could not be verified on nodes \"{0}\""
//  *Cause: An attempt to verify whether ASM was running on the specified nodes failed.
// *Action: Look at the error messages that accompany this message.
/
1009, TASK_GNS_SCANNAME_CVUHELPER_ERR, "Command \"{0}\" to obtain SCAN name failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1010, TASK_NET_CONFIG_CVUHELPER_ERR, "Command \"{0}\" to obtain configuration of network resource for network number {1} failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1011, TASK_NODEADD_FAIL_CRSVER, "The CRS software versions found on cluster nodes \"{0}\" and \"{1}\" do not match"
//  *Cause: The CRS software version found on the two nodes indicated do not match, or the CRS software version could not be obtained from one of the nodes indicated.
// *Action: Make sure the existing cluster nodes have the same CRS software version installed before trying to add another node to the cluster.
/
1012, TASK_NODEADD_CRSHOME_FAIL, "The shared state of the CRS home path \"{0}\" on nodes to be added does not match the shared state on existing cluster nodes"
//  *Cause: The CRS home IS shared on the existing cluster and NOT shared on the nodes to be added, or the CRS home is NOT shared on the existing cluster nodes and IS shared on the nodes to be added.
// *Action: The CRS home must be shared by all nodes or by none.
/
1013, TASK_NODEADD_PATH_FAIL, "The path \"{0}\" does not exist or cannot be created on the nodes to be added"
//  *Cause: The path does not exist on the nodes being added and the parent path is not writable.
// *Action: Ensure that the path identified either exists or can be created. 
/
1014, OCR_LOC_FOUND, "Found OCR location \"{0}\" on node(s): \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
1015, TASK_NTP_OFFSET_NOT_WITHIN_LIMITS, "Time server \"{0}\" has time offsets that are not within permissible limit \"{1}\" on nodes \"{2}\". "
//  *Cause: Offsets on the identified nodes in the cluster were not within limits for specified Time Server.
// *Action: Ensure that the offsets for specified time server are within limits on each node of the cluster. 
/
1016, CRS_NOT_CONFIGURED, "The Oracle Clusterware configuration check is not valid in an environment in which Oracle Clusterware is not configured"
//  *Cause: A check valid only for an environment with Oracle Clustware was attempted.
// *Action: Ensure that the Clusterware has been correctly installed and configured before attempting the check. 
/
1017, TASK_NTP_DAEMON_CONFIG_ONLY, "NTP configuration file \"{0}\" is present on nodes \"{1}\" on which NTP daemon or service was not running"
//  *Cause: The indicated NTP configuration file was found on the indicated
//          nodes where the NTP daemon or service was not running.
// *Action: The NTP configuration files must be removed from all nodes of the
//          cluster.
/
1018, TASK_NTP_DAEMON_ONLY, "NTP daemon or service \"{0}\" was running on nodes \"{1}\" on which an NTP configuration file was not found"
//  *Cause: The indicated NTP daemon or service was running on the indicated 
//          nodes on which no NTP configuration file was found.
// *Action: NTP service must be uninstalled on all nodes of the cluster and all
//          configuration files must be removed.
/
1019, TASK_NTP_CONF_NOT_ON_ALL_NODES, "The NTP configuration file \"{0}\" does not exist on nodes \"{1}\""
//  *Cause: The configuration file specified was not available or was 
//          inaccessible on the specified nodes.
// *Action: To use NTP for time synchronization, create this file and set up 
//          its configuration as described in your vendor's NTP document. To use
//          CTSS for time synchronization the NTP configuration should be 
//          uninstalled on all nodes of the cluster. Refer to section 
//          "Preparing Your Cluster" of the book
//          "Oracle Database 2 Day + Real Application Clusters Guide".
/
1020, TASK_NTP_CONF_FAIL_ON_NODES, "Check for NTP configuration file \"{0}\" could not be performed on nodes \"{1}\""
//  *Cause: Check of existence of NTP configuration file failed as its existence
//          could not be determined.
// *Action: Look at the accompanying error messages and respond accordingly.
/
1021, TASK_NTP_CONF_EXISTS_ADD_NODE, "NTP configuration file \"{0}\" found on nodes \"{1}\""
//  *Cause: During an add node operation a NTP configuration file was found on 
//          the new node being added, but it was missing from existing cluster
//          nodes.
// *Action: To use NTP for time synchronization, create this file and set up 
//          its configuration as described in your vendor's NTP document 
//          on all nodes of the cluster. If you plan to use CTSS for time 
//          synchronization then NTP configuration should be uninstalled on all 
//          nodes of the cluster. Refer to section "Preparing Your Cluster" of  
//          the book "Oracle Database 2 Day + Real Application Clusters Guide".
/
1022, TASK_NTP_CONFIG_FILE_CHECK_START, "Checking existence of NTP configuration file \"{0}\" across nodes"
// *Document: NO
//  *Cause: 
// *Action: 
/
1023, TASK_NTP_CONF_FILE_CHECK_PASS, "NTP configuration file \"{0}\" existence check passed"
// *Document: NO
//  *Cause: 
// *Action: 
/
1024, TASK_NTP_DMN_NOTALIVE_ALL_NODES, "The NTP daemon or Service was not running on any of the cluster nodes."
//  *Cause: The NTP daemon was not running on any of the cluster nodes.
// *Action: Look at the accompanying error messages and respond accordingly.
/
1025, CLIENT_CLUSTER_INVALID_GNS_VIP, "Validation of the state of the GNS server failed."
//  *Cause: Proper functioning of the Grid Naming Service (GNS) server cluster 
//          could not be validated using client data file for the GNS client 
//          cluster. It is possible that GNS is not up, or the DNS domain is 
//          not delegated to the GNS server cluster.
// *Action: Examine the accompanying error messages and respond accordingly to
//          ensure that GNS is up on the GNS server cluster and that the domain
//          delegation is operating correctly. The integrity of GNS can be 
//          validated by executing the command 'cluvfy comp gns -postcrsinst'
//          on the GNS server cluster. For a verification of the correct 
//          subdomain delegation, use 'cluvfy comp dns' in the server cluster.
/
1026, TASK_NODEADD_CLUSTERMEMBER_FAIL, "Node \"{0}\" is a member of cluster \"{1}\"."
//  *Cause: The cluster name returned from the execution of olsnodes on the node specified does not match the cluster name from the execution of olsnodes on the local node. The node indicated in the message could not be added to this cluster because it was already a member of the indicated cluster.
// *Action: Ensure that the node being added is not part of another cluster before attempting to add the node to this cluster.
/
1027, SERVER_GNS_NOT_RESPOND, "The Oracle Grid Naming Service (GNS) \"{0}\" did not respond at IP address \"{1}\"."
//  *Cause: The GNS server did not respond to a query sent to the indicated
//          IP address.
// *Action: Ensure that the GNS daemon is running on the GNS server cluster
//          using the 'srvctl config gns' command. The integrity of GNS can
//          be validated by executing the command 'cluvfy comp gns -postcrsinst'
//          on the GNS server cluster.
/
1028, TASK_NTP_PORTOPEN_VERIFYING, "NTP daemon or service using UDP port 123"
// *Document: NO
//  *Cause:
// *Action:
/
1029, TASK_NTP_DAEMONS_ACTIVE_NO_PID, "NTP daemon \"{0}\" was running on nodes \"{1}\" but PID file \"{2}\" was missing."
//  *Cause: While performing prerequisite checks, Cluster Verification Utility
//          (CVU) found that the indicated network time protocol (NTP) daemon 
//          was running on the specified nodes, but the daemon had not been 
//          started with the PID file command line option. In the absence of
//          the indicated PID file, if the installation proceeds, the Cluster
//          Time Synchronization Services (CTSS) will be started in active mode 
//          and there will be two different time synchronization mechanisms 
//          running at the same time on the specified nodes.
// *Action: To use NTP for time synchronization, start the daemon with the PID 
//          file command line option and set up its configuration as described 
//          in the vendor's NTP document on all nodes of the cluster. Ensure 
//          that the PID file specified on the command line matches the PID file
//          indicated in the message. To use CTSS for time synchronization,
//          deconfigure NTP on all nodes of the cluster. Refer to Oracle 
//          database documentation for more information.
/
1030, TASK_GET_ASM_HOME_CVUHELPER_ERR, "Command \"{0}\" to get ASM home failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1031, TASK_GET_ASM_INSTANCE_CVUHELPER_ERR, "Command \"{0}\" executed to get ASM SID failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1032, TASK_NTPD_NOT_SLEWED_NODES, "slewing option \"{0}\" not found on the NTP daemon command line on nodes \"{1}\""
//  *Cause: The specified slewing option was not found on the command line of 
//          the network time protocol (NTP) daemon on the specified nodes.
// *Action: Shut down and restart the NTP daemon with the slewing option set.
//          In each case, add '-x' to the network time protocol daemon command 
//          line options.
//          For Linux, edit '/etc/sysconfig/ntpd'.
//          For SUSE Linux, edit '/etc/sysconfig/ntp' and add '-x' to the 
//          OPTIONS variable.
//          For AIX, edit '/etc/rc.tcpip'.
//          For HP-UX edit '/etc/rc.config.d/netdaemons'.
//          For Solaris release 10 or earlier, edit '/etc/inet/ntp.conf'.
//          For Solaris release 11, set the 'slew_always' property by running
//          the command '/usr/sbin/svccfg -s  svc:/network/ntp:default setprop
//          config/slew_always = true' as root user and refresh the service by
//          running the command 'svcadm refresh svc:/network/ntp:default'.
/
1033, ERR_CHECK_NTPD_SLEWED_STATUS_NODES, "Inspection of the NTP daemon command line arguments for slewing option \"{0}\" could not be performed on nodes \"{1}\"."
//  *Cause: An attempt to obtain the command line of the network time protocol
//          (NTP) daemon process running on the specified nodes failed.
// *Action: Ensure that the specified nodes are accessible. Make sure that the
//          NTP daemon is running on the specified nodes. Examine any 
//          accompanying error messages.
/
1034, TASK_NTPD_SLEWED_NODES, "NTP daemon check for slewing option \"{0}\" passed on nodes \"{0}\"."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1035, TASK_NTPD_ALL_SLEWED, "NTP daemon check for slewing option \"{0}\" passed."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1036, NTPD_BOOT_NOT_SLEWED_NODES, "NTP daemon boot time configuration file \"{0}\" does not have slewing option \"{1}\" set on nodes \"{2}\"."
//  *Cause: The network time protocol (NTP) daemon boot time configuration on 
//          the specified nodes did not have the specified slewing option set.
// *Action: Ensure that the slewing option is set in the configuration file on
//          the nodes specified. For more information on the NTP daemon slewing
//          option, refer to NTP daemon manual pages.
/
1037, ERR_CHECK_NTPD_BOOT_SLEWED_STATUS_NODES, "NTP daemon boot time configuration file \"{0}\" could not be inspected for slewing option \"{1}\" on nodes \"{2}\"."
//  *Cause: An attempt to obtain the network time protocol (NTP) daemon boot 
//          time configuration file to check if specified slewing option is set 
//          failed on the nodes specified.
// *Action: Ensure that the user running this check has access to the 
//          configuration file specified. Examine any accompanying error
//          messages.
/
1038, TASK_NTPD_BOOT_SLEWED_NODES, "Check for slewing option \"{0}\" in NTP daemon boot time configuration file \"{1}\" passed on nodes \"{2}\"."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1039, TASK_NTPD_BOOT_ALL_SLEWED, "Check for slewing option \"{0}\" in NTP daemon boot time configuration file \"{1}\" passed."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1040, ZONEADM_FAILED_NO_OUTPUT, "Command \"{0}\" to list current Solaris zone failed to run on node \"{1}\"." 
//  *Cause: An attempt to run the indicated command to list the current Solaris
//          zone failed and did not produce any output.
// *Action: Ensure that the user running this check can run this command on the
//          desired node.
/
1041, ZONEADM_CMD_FAILED, "The command \"{0}\" to list current Solaris zone did not run successfully on node \"{1}\". The command exited with status \"{2}\" and the output was: \"{3}\"." 
//  *Cause: An attempt to run the indicated command to list the current Solaris
//          zone failed.
// *Action: Fix any errors indicated by the command and ensure that the user 
//          running this check can run this command on the desired node.
/
1042, ZONENAME_FAILED_NO_OUTPUT, "Command \"{0}\" to get current zone name failed to run on node \"{1}\"."
//  *Cause: An attempt to run the indicated command to get the current Solaris
//          zone name failed to run on the indicated node and did not produce
//          any output.
// *Action: Ensure that the user running this check can run the specified
//          command on the node specified.
/
1043, ZONENAME_CMD_FAILED, "The command \"{0}\" to get current zone name did not run successfully on node \"{1}\". The command exited with status \"{2}\" and the output was: \"{3}\"."
//  *Cause: An attempt to run the indicated command to get the current Solaris
//          zone name failed.
// *Action: Fix any errors indicated by the command and ensure that the user
//          running this check can run this command on the desired node.
/
1044, TASK_NTP_DISABLED_SOLARIS_NGZONE_START,"checking if NTP service has been disabled on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1045, TASK_NTPD_ALL_DAEMON_DISABLED_SOLARIS_NGZ, "Check for NTP service disabled on all nodes passed."
// *Document: NO
//  *Cause:
// *Action:
/
1046, TASK_NTPD_NOT_DISABLED_SOLARIS_NGZ,"NTP service is not disabled on nodes \"{0}\"."
//  *Cause: An attempt to verify that the network time protocol (NTP) service
//          has been disabled on all nodes found that the service was still
//          enabled on the indicated nodes. 
// *Action: The NTP daemon should be disabled on all Solaris non-global zone 
//          nodes and enabled in the global zone. Ensure that the NTP service
//          has been disabled on the indicated nodes by running the command 
//          'svcadm disable ntp'. 
/
1047, NTPD_DISABLED_SOLARIS_NGZ_FAILED,"failed to verify that NTP service has been disabled on nodes \"{0}\""
//  *Cause: An attempt to verify that the network time protocol (NTP) service
//          had been disabled failed for the indicated nodes. 
// *Action: NTP daemon should be disabled on all Solaris non-global zone nodes
//          and enabled in the global zone. Examine any accompanying error 
//          messages, address the reported issues and reissue the command
//          'svcadm disable ntp'.
/
1048, TASK_NTPD_DISABLED_SOLARIS_NGZ,"NTP service is disabled on nodes \"{0}\" as expected"
// *Document: NO
//  *Cause:
// *Action:
/
1049, TASK_CTSS_SKIP_NTP_CHECK_OPC, "Skipping NTP check in Oracle Public Cloud (OPC)"
// *Document: NO
//  *Cause: 
// *Action: 
/
1050, TASK_VOTEDSK_OFFLINE_VOTEDISK_WARN, "Voting disk locations with the voting disk identification numbers \"{0}\" are offline."
//  *Cause: Voting disk locations were found to be offline.
// *Action: Voting disk must be brought online or should be removed from the configuration by executing 'crsctl delete css votedisk <vdiskGUID> [...]'.  
/
1051, TASK_VOTEDSK_STACK_NOT_RUNNING, "The Oracle Clusterware stack is not running on any hub node."
//  *Cause: The Oracle Clusterware stack is not running on any hub node.
// *Action: Start the Oracle Clusterware stack on at least one hub node.
/
// Translator: The value placed in {0} parameter will be a device string like "/dev/sdz", the values placed in {1} will be keywords like: PROGRAM, ID_SERIAL, ID_SCSI_SERIAL
1052, TASK_USMDEV_PROGRAM_KEYWORD_NOTSUPPORT, "unable to validate device attributes for device \"{0}\" because keywords \"{1}\" was used in its UDEV rule"
// *Cause: Device validation for the indicated device could not be completed
//         properly because the indicated keywords were found in the UDEV rule
//         matching that device. The message does not indicate an error in the
//         rule, but a limitation in the validation algorithm. Possibly the
//         rule was correct.
// *Action: To complete validation, modify the rule to identify the device
//         being checked without the use of the identified keywords, or do
//         nothing, as the rule might have been correct as stated.
/
1060, FAILED_GET_INTERFACE_INFO_EXISTING_INSTALL, "Failed to retrieve the network interface classification information from an existing CRS home at path \"{0}\" on the local node"
//  *Cause: An attempt to obtain the network interface classification information by running 'oifcfg getif' from an existing CRS home failed on the local node.
// *Action: Ensure that the user executing the CVU check has read permission for the indicated CRS or Oracle Restart home and that the indicated CRS home path is not left over due to partial clean-up of any previous CRS installation attempts.    
/
1061, TASK_NTP_NON_PID_DAEMON_CHECK, "checking for NTP daemons running without pid file command line option"
// *Document: NO
//  *Cause: 
// *Action: 
/
1062, TASK_GNS_MANDATORY, "Leaf Nodes were specified without specifying Grid Naming Service (GNS) Virtual IP address (VIP)."
// *Cause: Leaf Nodes were specified without specifying GNS-VIP. Leaf Nodes
//         require GNS VIP, but do not require GNS subdomain.
// *Action: If the command line 'cluvfy stage -pre crsinst' is being used, then
//         provide GNS-VIP and GNS subdomain, if needed, using the '-dns'
//         option. If a response file is being used, then verify that the
//         variable 'configureGNS' exists in the specified file and has a valid
//         value.
/
1063, TASK_NTP_MULTIPLE_CONFIG_FILE, "configuration files for more than one time synchronization service were found on nodes of the cluster"
//  *Cause: While verifying the setup of the time synchronization services on 
//          the cluster nodes, the Cluster Verification Utility (CVU) found that 
//          configuration files for more than one type of service were found.
// *Action: The accompanying messages list the configuration file names
//          along with the nodes on which they were found. Ensure that only 
//          one type of time synchronization service is configured on all nodes
//          of the cluster. Remove any identified configuration files that are
//          not required by the configured time synchronization service and 
//          retry this command.
/
1064, TASK_NTP_CONFFILE_EXIST_NODE, "configuration file \"{0}\" was found on nodes \"{1}\""
// *Document: NO
//  *Cause: 
// *Action: 
/
1065, TASK_NTP_START_CHRONYD_CHECK, "verifying configuration of the daemon \"{0}\""
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1066, TASK_NTP_CHRONYC_GLOBAL_FAILURE, "failed to execute command \"{0}\" to determine configuration of the daemon \"{1}\""
//  *Cause: While verifying time synchronization across the cluster nodes, an 
//          attempt to query the indicated daemon using the indicated command
//          failed on all of the nodes of the cluster.
// *Action: Ensure that the indicated command is available on all nodes and
//          that the user running the check has the execute privilege for it. 
//          Respond to the error messages that accompany this message and try 
//          again.
/
1067, TASK_NTP_CHRONYC_NO_OUTPUT, "command \"{0}\" executed on nodes \"{1}\" produced no output"
//  *Cause: While verifying time synchronization across the cluster, the 
//          indicated command failed to produce any output on the indicated 
//          nodes.
// *Action: Ensure that the indicated command is available on all nodes and 
//          that the user running the check has the execute privilege for it 
//          and retry the command.
/
1068, TASK_NTP_CHRONYC_OUPUT_PARSE_ERROR, "command \"{0}\" executed on node \"{1}\" produced an output that could not be parsed"
//  *Cause: While verifying time synchronization across the cluster nodes, the
//          indicated command produced output on the indicated node that
//          could not be parsed by the Cluster Verification Utility (CVU).
// *Action: The output produced by the command accompanies this message. 
//          Refer to the output and respond to it.
/
1069, TASK_NTP_CHRONYC_FAILED, "failed to execute command \"{0}\" on node \"{1}\""
//  *Cause: While verifying time synchronization across the cluster nodes, the
//          indicated command could not be executed on the indicated node.
// *Action: Respond to the error messages that accompany this message and try
//          again.
/
1070, TASK_NTP_COMMON_TIME_SERVER, "there is at least one common time server among cluster nodes"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1071, TASK_NTP_TIME_SERVER_COMMON, "time server \"{0}\" is common to all nodes on which daemon \"{1}\" was running"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1072, TASK_NTP_COMMON_CHRONY_SERVER_FAILED, "daemon \"{0}\" running on nodes \"{1}\" does not synchronize to a common time server"
//  *Cause: While checking the clock synchronization across the cluster using 
//          the command '/usr/bin/chronyc sources', the Cluster Verification
//          Utility (CVU) found that there was no common time server to which
//          all nodes in the cluster synchronize. A list of time servers and the
//          nodes which were configured to use each of them for synchronization
//          accompanies this message.
// *Action: Reconfigure the indicated daemon so that there is at least one
//          common time server to which all cluster nodes synchronize. If you
//          plan to use Cluster Time Synchronization Service (CTSS) for time
//          synchronization, then the indicated daemon should be uninstalled on
//          all nodes.
/
1073, TASK_NTP_SERVER_COMMON_NTPQ_PARSE_ERROR, "output of command \"{0}\" cannot be parsed"
//  *Cause: While checking for common time server for clock synchronization
//          across cluster nodes using the indicated command, the Cluster 
//          Verification Utility (CVU) could not parse the output of the
//          command.
// *Action: The output from executing the command is included along with this
//          message. Respond to those messages and retry this command.
/
1074, TASK_NTP_CHRONY_OFFSET_START, "verifying that node clock time offset from common time servers"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1075, TASK_NTP_OFFSET_SERVER, "clock offset from at least one common server is less than {0} milliseconds"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1076, TASK_NTP_SERVER_REJECT_FOR_TALLY, "time servers listed by the command \"{0}\" on node \"{1}\" were ignored based on tally codes for the server"
//  *Cause: While checking for a common time server for clock synchronization
//          using the indicated command, on the indicated node, the Cluster 
//          Verification Utility (CVU) ignored the time servers listed in the 
//          accompanying message because of the tally codes found in the 
//          command output.
// *Action: Correct any errors associated with these time servers, on the 
//          indicated node and then verify that the tally codes reported by 
//          running the indicated command show that these time servers can now
//          be used for clock synchronization, then retry the Cluster 
//          Verification Utility command.
/
1077, TASK_NTP_TIMESERV_OFFSET_DISPLAY, "Time Server: {0}"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1078, TASK_NTP_SLEWING_CHECK_START, "NTP daemon command line for slewing option \"{0}\""
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
1079, TASK_NTP_BOOT_SLEWING_CHECK_START, "NTP daemon''s boot time configuration, in file \"{0}\", for slewing option \"{1}\""
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
// Translator: do not translate 'hosts'
1100, TASK_NAME_SERVICE_NETSVC_ERR, "Found inconsistent 'hosts' entry in file \"{0}\" on node {1}"
//  *Cause: Cluster verification found an inconsistency in the 'hosts' specification entry in name service switch configuration file on the indicated node.
// *Action: Ensure that the 'hosts' entries define the same lookup order in the name service switch configuration file across all cluster nodes.
/
1101, TASK_NAME_SERVICE_NO_RESOLUTION, "SCAN name \"{0}\" failed to resolve"
//  *Cause: An attempt to resolve specified SCAN name to a list of IP addresses failed because SCAN could not be resolved in DNS or GNS using 'nslookup'.
// *Action: Check whether the specified SCAN name is correct. If SCAN name should be resolved in DNS, check the configuration of SCAN name in DNS. If it should be resolved in GNS make sure that GNS resource is online.
/
1102, TASK_GNS_NETWORK_CVUHELPER_ERR, "Command \"{0}\" to get network information failed."
//  *Cause: An attempt to execute the displayed command failed.
// *Action: Examine the accompanying error messages for details.  Address issues found and retry the command. 
/
1103, TASK_OCR_LOCATIONS_CVUHELPER_ERR, "Command \"{0}\" to get OCR information failed."
//  *Cause: An attempt to execute the displayed command failed.
// *Action: Examine the accompanying error messages for details.
/
1104, OCR_LOC_UNABLE_TO_CREATE_TEMP_AREA, "Unable to create the directory \"{0}\"" 
//  *Cause: An attempt to create the directory specified failed on local node.
// *Action: Ensure that the user running CVU has read and write access to the specified directory, or set the CV_DESTLOC environment variable to a different directory to which the user has read and write access.
/
1105, OCR_LOC_COPY_FILE_ERR, "Error copying file \"{0}\" to the local node from the source node \"{1}\""
//  *Cause: The specified file could not be copied from the specified source node to the destination node.
// *Action: Examine the accompanying error message for details.
/
1106, OCR_LOC_NOT_CONSISTENCY_EXTRA, "The OCR locations are not up to date on node \"{0}\". It has extra locations \"{1}\"."
//  *Cause: The OCR integrity check found that some extra OCR locations are in list on the specified node.
// *Action: Use the 'ocrconfig -repair' utility to repair the OCR locations on the specified node.
/
1107, OCR_LOC_NOT_CONSISTENCY_LACK, "The OCR locations are not up to date on node \"{0}\". The locations \"{1}\" are not present."
//  *Cause: The OCR integrity check found that some OCR locations were missing from the OCR location list on the specified node.
// *Action: Use the 'ocrconfig -repair' utility to repair the OCR locations on the specified node.
/
1108, COLLECTION_OCR_NOT_FOUND, "Failed to check OCR locations consistency on node \"{0}\""
//  *Cause: An attempt to verify OCR locations failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1109, OCR_LOC_CONSISTENCY_NODE, "The OCR locations on node \"{0}\" are consistent"
// *Document: NO
//  *Cause:
// *Action:
/
1110, TASK_GNS_CREDENTIAL_CVUHELPER_ERR, "failed to validate the client GNS file"
//  *Cause: An attempt to execute an internal operation to validate the client GNS file failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1111, TASK_GNS_VIP_VALIDATION_CVUHELPER_ERR, "failed to validate the GNS VIP"
//  *Cause: An attempt to execute an internal operation to validate the Grid Naming Service (GNS) VIP failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1112, CRSUSER_RESOURCE_COLLECTION_ERR, "failed to obtain the list of all users that own CRS resources"
//  *Cause: During CRS user verification, an attempt to obtain the list of all users that own CRS resources failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1150, TASK_ELEMENT_EZCONNECT, "Easy Connect configuration"
// *Document: NO
//  *Cause:
// *Action:
/
1151, TASK_DESC_EZCONNECT, "This check ensures that the Easy Connect is configured as an Oracle Net name resolution method"
// *Document: NO
//  *Cause:
// *Action:
/
1152, TASK_EZCONNECT_START, "Checking sqlnet.ora to ensure that the Easy Connect is configured as an Oracle Net name resolution method"
// *Document: NO
//  *Cause:
// *Action:
/
1153, TASK_EZCONNECT_NOT_ENABLED, "Easy Connect is not configured in the sqlnet.ora in the location \"{0}\" on the following nodes:"
//  *Cause: names.directory_path entry in the sqlnet.ora does not contain 'ezconnect' as one of the name resolution methods
// *Action: add 'ezconnect' to names.directory_path entry in the sqlnet.ora
/
1154, TASK_EZCONNECT_NOT_ENABLED_NODE, "Easy Connect is not configured in the sqlnet.ora in the location \"{0}\" on node \"{1}\""
//  *Cause: names.directory_path entry in the sqlnet.ora does not contain 'ezconnect' as one of the name resolution methods
// *Action: add 'ezconnect' to names.directory_path entry in the sqlnet.ora
/
1155, TASK_EZCONNECT_FAILED, "Easy Connect configuration could not be determined."
//  *Cause: Easy Connect configuration check could not be completed 
// *Action: Contact Oracle Support Services. 
/
/
1156, TASK_EZCONNECT_ENABLED, "Easy Connect is enabled on all nodes."
// *Document: NO
//  *Cause:
// *Action:
/
1157, TASK_EZCONNECT_UNSUCCESSFUL, "Easy Connect configuration check unsuccessful."
// *Document: NO
//  *Cause:
// *Action:
/
1160, TASK_ELEM_KERNEL_64_BIT, "OS Kernel 64-Bit"
// *Document: NO
//  *Cause:
// *Action:
/
1161, TASK_DESC_KERNEL_64_BIT, "This check verifies that the OS kernel is running in 64-bit mode."
// *Document: NO
//  *Cause:
// *Action:
/
1162, KERNEL_NOT_RUNNING_64_BIT_ON_NODE, "The OS kernel is not running in 64-bit mode on node \"{0}\"."
//  *Cause: The OS kernel was not found to be running in 64-bit mode on the specified node.
// *Action: Make the kernel run in 64-bit mode on the cluster node. This might involve setting up the symlink /unix -> /usr/lib/boot/unix_64 and rebooting the node.
/
1163, KERNEL_RUNNING_64_BIT_ALL_NODES, "The OS kernel is running in 64-bit mode on all nodes."
// *Document: NO
//  *Cause:
// *Action:
/
1164, FAIL_CHECK_KERNEL_RUNNING_MODE, "Failed to check the running mode of OS kernel in use"
//  *Cause: An attempt to obtain the type (32-bit or 64-bit) of OS kernel using command '/usr/sbin/prtconf -k' failed.
// *Action: Run the command '/usr/sbin/prtconf -k' manually and follow the command output to fix any issues associated  ith its execution.
/
1165, TASK_KERNEL_64_BIT_PASSED, "OS Kernel 64-bit mode check passed"
// *Document: NO
//  *Cause:
// *Action:
/
1166, TASK_KERNEL_64_BIT_FAILED, "OS Kernel 64-bit mode check failed"
// *Document: NO
//  *Cause:
// *Action:
/
1169, TASK_KERNEL_VERSION_NOT_SUPPORTED, "The kernel version \"{0}\" detected on node \"{1}\" is not supported for this release."
//  *Cause: An attempt to upgrade or install was rejected because 
//          the indicated OS kernel version was not supported.
// *Action: Retry the operation after upgrading to a supported OS kernel 
//          version. Refer to Oracle Database documentation for a list of 
//          supported OS kernel versions.
/
1170, TASK_NODECON_PRIVATE_IP_SUBNET_MISMATCH, "Private host name \"{0}\" with private IP address \"{1}\" on node \"{2}\" does not belong to any subnet classified for private interconnect"
//  *Cause: Private IP retrieved from the current configuration do not belong to any subnet classified for private interconnect.  
// *Action: Ensure that the private host name is configured correctly, use 'oifcfg' tool to classify the subnet containing the private IPs as private using 'oifcfg setif -global <if_name>/<subnet>:cluster_interconnect' command.
/
1171, TASK_NODECON_PRIVATE_IP_HOST_NOT_FOUND, "Failed to resolve the private host name \"{0}\" to an IP address on node \"{1}\""
//  *Cause: IP address for the private host name could not be retrieved.
// *Action: Ensure that the identified private host name can be resolved to a private IP address.
/
1172, TASK_NODECON_SAME_IP_ON_MULTIPLE_NICS, "The IP address \"{0}\" is on multiple interfaces \"{1}\" on nodes \"{2}\""
//  *Cause: The given IP address was found on multiple interfaces, when an IP address can be on at most one interface.
// *Action: Remove the given IP address from all but one interface on each node.
/
1173, TASK_NODECON_SAME_MAC_ON_MULTIPLE_NICS, "The interfaces \"{0}\" are configured with the same hardware address \"{1}\" on nodes \"{2}\""
//  *Cause: The cluster verification utility (CVU) determined that the 
//          indicated interfaces had the same hardware address on the 
//          indicated nodes.
// *Action: Reconfigure the indicated interfaces with unique hardware addresses
//          on the indicated nodes and retry CVU checking.
/
1180, TASK_ELEMENT_DBUSER, "Database OS user consistency for upgrade"
// *Document: NO
//  *Cause:
// *Action:
/
1181, TASK_DESC_DBUSER, "This task verifies that the OS user performing the upgrade is the existing software owner"
// *Document: NO
//  *Cause:
// *Action:
/
1182, TASK_DBUSER_CONSISTENCY_CHECK_START, "Checking OS user consistency for database upgrade"
// *Document: NO
//  *Cause:
// *Action:
/
1183, TASK_DBUSER_CONSISTENCY_CHECK_SUCCESSFUL, "OS user consistency check for upgrade successful"
// *Document: NO
//  *Cause:
// *Action:
/
1184, TASK_DBUSER_CONSISTENCY_CHECK_FAILED, "OS user consistency check for upgrade failed"
// *Document: NO
//  *Cause:
// *Action:
/
1185, DBUSER_INCORRECT_USER, "Current OS user is not the owner of the existing database installation. [Expected = \"{0}\" ; Available = \"{1}\"]"
//  *Cause: Current OS user was not found to be the owner of the existing database installation. 
// *Action: Ensure that the OS user upgrading database installation is the owner of the already existing installation.
/
1186, FAIL_GET_EXISITING_DB_USER, "Failed to get the owning OS user name for the database home \"{0}\""
//  *Cause: An attempt to obtain the database owner information from an existing database installation failed.
// *Action: Ensure that the OS user executing the CVU check has read permission for database.
/
1190, START_ASM_CRS_COMPATIBILITY, "Checking ASM and CRS version compatibility"
// *Document: NO
// *Cause:
// *Action:
/
1191, FAIL_CHECK_ASM_RES_EXISTENCE, "Failed to check existence of ASM resource"
//  *Cause: An attempt to verify existence of ASM resource failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1192, ASM_CRS_COMPATIBILITY_FAILED, "ASM (pre-11.2) is not at the same version as CRS version {0}"
//  *Cause: The ora.asm resource was not found.
// *Action: Ensure that ASM Configuration Assistant 'asmca -upgradeASM' has been run and ASM has been upgraded.
/
1193, ASM_CRS_COMPATIBILITY_PASS, "ASM and CRS versions are compatible"
// *Document: NO
// *Cause:
// *Action:
/
1195, UPGRADE_CHECKS_ONLY_POST_TB, "Upgrade checks can only be performed when upgrading to versions greater than or equal to 11.2.0.1.0"
// *Cause: The -dest_version specified was lower than 11.2.0.1.0.
// *Action: Specify -dest_version greater than or equal to 11.2.0.1.0.
/
1196, NO_CFG_FILE, "CRS configuration file \"{0}\" missing on node \"{1}\"."
//  *Cause: While verifying time zone consistency across cluster nodes, the
//          Cluster Verification Utility found that the indicated file was
//          missing on the indicated nodes.
// *Action: Run the 'cluvfy comp software' command, fix any issues it
//          identifies, and then retry this check.
/
1200, OPERATION_SUPPORTED_ONLY_ON_WINDOWS, "This operation is supported only on Windows operating system platforms"
// *Document: NO
//  *Cause:
// *Action:
/
1201, IMPROPER_KERNEL_PARAM_CONFIG, "OS kernel parameter \"{0}\" does not have expected configured value on node \"{1}\" [Expected = \"{2}\" ; Current = \"{3}\"; Configured = \"{4}\"]."
//  *Cause: A check of the configured value for an OS kernel parameter did not find the expected value.
// *Action: Modify the kernel parameter configured value to meet the requirement.
/
1202, IMPROPER_KERNEL_PARAM_CONFIG_COMMENT, "Configured value incorrect."
// *Document: NO
//  *Cause:
// *Action:
/
1203, IMPROPER_KERNEL_PARAM_CURRENT_COMMENT, "Current value incorrect."
// *Document: NO
//  *Cause:
// *Action:
/
1204, UNKNOWN_KERNEL_PARAM_CONFIG_COMMENT, "Configured value unknown."
// *Document: NO
//  *Cause:
// *Action:
/
1205, IMPROPER_KERNEL_PARAM_CURRENT, "OS kernel parameter \"{0}\" does not have expected current value on node \"{1}\" [Expected = \"{2}\" ; Current = \"{3}\"; Configured = \"{4}\"]."
//  *Cause: A check of the current value for an OS kernel parameter did not find the expected value.  
// *Action: Modify the kernel parameter current value to meet the requirement.
/
1206, ERR_CHECK_CONFIG_KERNEL_PARAM, "Check cannot be performed for configured value of kernel parameter \"{0}\" on node \"{1}\""
//  *Cause: Kernel parameter value could not be determined.
// *Action: Examine the accompanying error message for details.
/
1250, TASK_ORACLE_PATCH_START, "Checking for Oracle patch \"{0}\" in home \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1251, TASK_ELEMENT_ORACLE_PATCH, "Oracle patch"
// *Document: NO
//  *Cause:
// *Action:
/
1252, TASK_DESC_ORACLE_PATCH, "This test checks that the Oracle patch \"{0}\" has been applied in home \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1253, ORACLE_PATCH_MISSING, "Required Oracle patch is not found on node \"{0}\" in home \"{1}\"."
//  *Cause: Required Oracle patch is not applied.
// *Action: Apply the required Oracle patch.
/
1254, ORACLE_PATCH_STATUS_FAILED, "Failed to determine Oracle patch status on the node \"{0}\""
//  *Cause: Oracle patch status could not be determined.
// *Action: Ensure that OPatch is functioning correctly.
/
1255, TASK_NO_ORACLE_PATCH_REGISTERED, "There are no oracle patches required for home \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1256, TASK_ORACLE_PATCH_PASSED, "Check for Oracle patch \"{0}\" in home \"{1}\" passed."
// *Document: NO
//  *Cause:
// *Action:
/
1257, TASK_ORACLE_PATCH_FAILED, "Check for Oracle patch \"{0}\" in home \"{1}\" failed."
// *Document: NO
//  *Cause:
// *Action:
/
1258, ORACLE_PATCH_SUMMARY_PASSED, "Patch \"{0}\" is applied in home \"{1}\" "
// *Document: NO
//  *Cause:
// *Action:
/
1259, ORACLE_PATCH_SUMMARY_FAILED, "Patch \"{0}\" is not applied in home \"{1}\" on nodes \"{2}\""
// *Document: NO
//  *Cause:
// *Action:
/
1260, ORACLE_PATCH_CVUHELPER_FAILURE, "Command \"{0}\" to obtain Oracle patch status failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1261, ORACLE_PATCH_ID_MISSING, "Required Oracle patch \"{2}\" in home \"{1}\" is not found on node \"{0}\"."
//  *Cause: An attempted operation could not be completed because the indicated
//          patch had not been applied to the indicated home on the node shown.
// *Action: Apply the required Oracle patch and retry.
/
1262, ORACLE_PATCH_ID_STATUS_FAILED, "failure to determine the status of Oracle patch \"{2}\" in home \"{1}\" on node \"{0}\""
//  *Cause: An attempted operation could not be completed because the Oracle
//          patch status could not be determined. Possibly, the opatch binary 
//          was not found or could not read the Oracle home's inventory.
//          Accompanying messages provide further failure details. 
// *Action: Examine the accompanying error messages for details, resolve the
//          problems identified and retry. 
/
1265, OSPATCH_STATUS_AIX_FAILED, "Failed to determine operating system patch status for patch \"{1}\" on node \"{0}\""
// *Cause: Unable to determine the patch existence.
// *Action: Manual o/s verification required. Contact IBM support for assistance if needed.
/
1270, TASK_ELEMENT_UPGRADE_SUITABILITY, "Upgrade Suitability"
// *Document: NO
//  *Cause:
// *Action:
/
1271, TASK_DESC_UPGRADE_SUITABILITY, "This test checks that the source home \"{0}\" is suitable for upgrading to version \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1272, TASK_UPGRADE_SUITABILITY_START, "Checking for suitability of source home \"{0}\" for upgrading to version \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1273, TASK_UPGRADE_SUITABILITY_PASSED, "Source home \"{0}\" is suitable for upgrading to version \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1274, TASK_UPGRADE_SUITABILITY_FAILED, "Source home \"{0}\" is not suitable for upgrading to version \"{1}\"."
//  *Cause: The source home version was not suitable for upgrading to the specified version.
// *Action: Upgrade to a supported version before proceeding to upgrade to the specified version.
/
1275, UPGRADE_SUITABILITY_SUMMARY_PASSED, "Source home \"{0}\" is suitable for upgrading to version \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1276, TASK_UPGRADE_SUITABILITY_REQUIRED_VERSION, "Upgrade to version \"{0}\" before upgrading to \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1277, UPGRADE_SUITABILITY_SUMMARY_FAILED, "Source home \"{0}\" is not suitable for upgrading to version \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
1278, UPGRADE_SUITABILITY_CHECK_FAILED, "failed to check suitability of source home \"{0}\" for upgrading to version \"{1}\""
//  *Cause: An attempt to verify the suitability of upgrading identified 
//          source home to indicated version failed.
// *Action: Look at the accompanying messages for details on the cause of 
//          failure.
/
1298, SUBSTRING_SHARED_STORAGE, "Path \"{0}\" does not exist on at least one node but path \"{1}\" exists on all the nodes and is shared."
// *Document: NO
//  *Cause: 
// *Action: 
/
1299, ACFS_NOT_EXIST_ON_LOCATION, "ACFS file system does not exist at path \"{0}\"."
//  *Cause: Attempt to verify ACFS file system at the specified file path failed because no ACFS file system was found.
// *Action: Ensure that ACFS file system is correctly created on the specified location.
/
1300, ACFS_NOT_SUPPORTED, "ACFS verification is not supported on this platform"
//  *Cause: ADVM/ACFS device drivers have not yet been ported to this OS or CPU type.
// *Action: None.
/
1301, ADVM_VER_NOT_COMPATIBLE, "The COMPATIBLE.ADVM attribute is set to a version \"{0}\" which is less than the minimum supported version \"{1}\" for the disk group \"{2}\" that contains the ACFS path \"{3}\"."
//  *Cause: The COMPATIBLE.ADVM attribute was found to be set to a version which is less than minimum supported version for the ACFS path as indicated.
// *Action: Ensure that the COMPATIBLE.ADVM attribute is set to 12.1 or higher on UNIX systems and to 12.1.0.2 or higher on Windows systems.
/
1302, ADVM_UNABLE_TO_CHECK_VERSION, "Failed to perform the ADVM version compatibility check for the path \"{0}\""
//  *Cause: An attempt to perform an ADVM version compatibility check for the specified path failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
1303, MULTIPLE_SLICES_SAME_DISK, "Invalid device paths \"{0}\" designate a single device and cannot be used as multiple ASM devices."
//  *Cause: An attempt to check the suitability of indicated device paths for 
//          ASM disk group creation found that the device paths do not 
//          represent different physical disks, which can affect availability
//          and ASM file striping.
// *Action: Ensure that device paths selected for ASM disk group creation point
//          to different physical disks and retry the operation.
/
1306, ACFS_SUPPORTED_NODES_INCONSISTENT, "Oracle ACFS is supported on the cluster nodes \"{0}\" but not on nodes \"{1}\"."
//  *Cause: Cluster Verification Utility (CVU) found that Oracle ACFS is 
//          supported only on some cluster nodes but not on all the cluster 
//          nodes.
// *Action: Ensure that Oracle ACFS is supported either on all the cluster 
//          nodes or on none of the cluster nodes.
/
1350, TASK_ELEMENT_DAEMON_NOT_RUNNING, "Daemon \"{0}\" not configured and running"
// *Document: NO
//  *Cause:
// *Action:
/
1351, TASK_DESC_DAEMON_NOT_RUNNING, "This test checks that the \"{0}\" daemon is not configured and running on the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
1352, TASK_DAEMON_NOT_RUNNING_START, "Checking daemon \"{0}\" is not configured and running"
// *Document: NO
//  *Cause:
// *Action:
/
1353, TASK_DAEMON_NOT_CONFIG_CHECK, "Check: Daemon \"{0}\" not configured"
// *Document: NO
//  *Cause:
// *Action:
/
1354, TASK_DAEMON_NOT_RUNNING_CHECK, "Check: Daemon \"{0}\" not running"
// *Document: NO
//  *Cause:
// *Action:
/
1355, TASK_DAEMON_NOT_CONFIG_PASS, "Daemon not configured check passed for process \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1356, TASK_DAEMON_NOT_RUNNING_PASS, "Daemon not running check passed for process \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1357, TASK_DAEMON_NOT_CONFIG_FAIL, "Daemon not configured check failed for process \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1358, TASK_DAEMON_NOT_RUNNING_FAIL, "Daemon not running check failed for process \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1359, TASK_DAEMON_NOT_RUNNING_CONFIGURED_NODE, "Daemon process \"{0}\" is configured on node \"{1}\""
//  *Cause: The identified daemon process was found configured on the indicated node.
// *Action: Ensure that the identified daemon process is not configured on the indicated node.
/
1360, TASK_DAEMON_NOT_RUNNING_RUNNING_NODE, "Daemon process \"{0}\" is running on node \"{1}\""
//  *Cause: The identified daemon process was found running on the indicated node.
// *Action: Ensure that the identified daemon process is stopped and not running on the indicated node.
/
1361, AUTH_SERVICES_CHECK_OP_FAILED, "failed to read configuration file \"{0}\" on node \"{1}\""
//  *Cause: An attempt to check the authentication services parameters
//          failed because the indicated configuration file was not accessible
//          on the indicated node.
// *Action: Ensure that the indicated configuration file exists on the 
//          indicated node and then retry the operation.
/
1362, AUTH_SERVICES_NOT_EXPECTED, "Native operating system authentication is not configured as an authentication method in the configuration file \"{0}\" on node \"{1}\"."
//  *Cause: A check of the authentication services parameters determined that
//          the sqlnet.authentication_services parameter in the indicated 
//          configuration file on the indicated node was not set to allow the 
//          use of native OS authentication. 
// *Action: Edit the indicated configuration file to allow the use of native
//          OS authentication. For Unix platforms, add either 'beq' or 'all'
//          as the value of the sqlnet.authentication_services parameter.
//          For Windows platforms, add either 'nts' or 'all' as the value of
//          the sqlnet.authentication_services parameter. After editing the
//          file, retry the operation.
/
1370, LEAF_NODES_EXIST, "Nodes \"{0}\" are configured as leaf nodes."
//  *Cause: Indicated cluster nodes were found to be configured as leaf
//          nodes which are not supported in release 19c onward.
// *Action: Convert the indicated nodes to hub nodes before upgrade.
/
1400, TASK_ELEMENT_SOFTWARE, "Software home: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
1401, TASK_DESC_SOFTWARE, "This test verifies the software files in home \"{0}\" on the specified node."
// *Document: NO
//  *Cause:
// *Action:
/
1450, TASK_CTSS_CRS_NODES_FAIL, "Oracle Clusterware is not installed on nodes \"{0}\"."
//  *Cause: A valid Oracle Clusterware installation was not found on the 
//          specified nodes.
// *Action: Ensure that Oracle Clusterware is installed on the nodes before 
//          running this check.
/
1451, TASK_CTSS_CRS_NODES_PASS, "Oracle Clusterware is installed on all nodes."
// *Document: NO
//  *Cause: 
// *Action: 
/
1452, TASK_CTSS_NO_OUTPUT_ERR_NODE, "CTSS resource status check using command \"{0}\" failed as the command did not produce output on nodes \"{1}\""
//  *Cause: An attempt to check the status of the Oracle Cluster Time 
//          Synchronization Service (CTSS) resource failed because the command 
//          specified did not produce output on the node specified.
// *Action: Ensure that the command specified exists and the current user has 
//          execute permission. 
/
1453, TASK_CTSS_RES_PARSE_ERR_NODE, "Oracle CTSS resource is not in ONLINE state on nodes \"{0}\""
//  *Cause: The Oracle Cluster Time Synchronization Service (CTSS) resource was 
//          either in OFFLINE or UNKNOWN state on the nodes specified.
// *Action: Check the status of the Oracle CTSS resource using the command 
//          'crsctl check ctss'. If CTSS is not running then restart the 
//          Clusterware stack.
/
1454, TASK_CTSS_RES_STAT_ERR_NODE, "CTSS resource status check using command \"{0}\" on node \"{1}\" failed."
//  *Cause: An attempt to check the status of the Oracle Cluster Time 
//          Synchronization Service (CTSS) resource failed because the command 
//          specified failed.
// *Action: Look at the accompanying error messages and respond accordingly.
/
1455, TASK_CTSS_PARSE_ERR_NODE, "The command \"{0}\" to query CTSS time offset and reference failed on node \"{1}\""
//  *Cause: An attempt to query Oracle Cluster Time Synchronization Service (CTSS)
//          for time offset and reference using specified command failed on the 
//          node specified.
// *Action: Look at the accompanying error messages and respond accordingly.
/
1456, TASK_CTSS_EXEC_ERR_ALL, "The CTSS time offset and reference could not be determined on any node of the cluster."
//  *Cause: An attempt to query CTSS for time offset and reference failed on all 
//          nodes of the cluster.
// *Action: Look at the accompanying error messages and respond accordingly.
/
1457, TASK_CTSS_QUERY_FAIL, "Query of CTSS for time offset failed on nodes \"{0}\"."
//  *Cause: An attempt to query CTSS for time offset and reference failed on 
//          the nodes displayed in the message.
// *Action: Look at the accompanying error messages and respond accordingly.
/
1500, TASK_ELEM_IPMP_CHECK, "Solaris IPMP group fail-over consistency check"
// *Document: NO
//  *Cause:
// *Action:
/
1501, TASK_DESC_IPMP, "This is a check to verify the current selection of public and private network classifications is consistent with network interfaces in fail-over dependency of an IPMP group"
// *Document: NO
//  *Cause:
// *Action:
/
1502, TASK_IPMP_CHECK_START, "Checking the consistency of current public and private network classifications with IPMP group fail-over dependency"
// *Document: NO
//  *Cause:
// *Action:
/
1503, TASK_IPMP_CHECK_PASSED, " IPMP group configuration is consistent with current public and private network classifications"
// *Document: NO
//  *Cause:
// *Action:
/
1504, TASK_IPMP_CHECK_PASSED_NODE, " IPMP group configuration is consistent with current public and private network classifications on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1505, TASK_IPMP_CHECK_FAILED, "IPMP group fail-over consistency check failed."
// *Document: NO
//  *Cause:
// *Action:
/
1506, TASK_IPMP_INCOSISTENT_NODE_COMMENT, "Not consistent"
// *Document: NO
//  *Cause:
// *Action:
/
1507, TASK_IPMP_NOT_CONFIGURED_COMMENT, "IPMP not configured on node"
// *Document: NO
//  *Cause:
// *Action:
/
1508, TASK_IPMP_FAILED_MORE_PRIVATE_IF_IPMP_NODE, "IPMP fail-over group \"{0}\" with interface list \"{1}\" on node \"{2}\" has interfaces \"{3}\" which are not part of current private network classifications \"{4}\""
//  *Cause: Found an additional fail-over dependency on an interface in an IPMP group which is not classified as a cluster interconnect on the identified node.  
// *Action: Ensure that all the identified non-participating network interfaces in the IPMP group are classified as a cluster interconnect on the identified node. Use command 'oifcfg setif -global <if_name>/<subnet>:cluster_interconnect' to classify the network interface as private.
/
1509, TASK_IPMP_FAILED_MORE_PUBLIC_IF_IPMP_NODE, "IPMP fail-over group \"{0}\" with interface list \"{1}\" on node \"{2}\" has interfaces \"{3}\" which are not part of current public network classifications \"{4}\""
//  *Cause: Found an additional fail-over dependency on an interface in an IPMP group which is not classified as a public interface on the identified node.  
// *Action: Ensure that all the identified non-participating network interfaces in the IPMP group are classified as public network interface on the identified node. Use command 'oifcfg setif {-node <nodename> | -global} {<if_name>/<subnet>:public}' to classify the network interface as public.
/
1510, ERROR_IPMP_INFO_ALL, "IPMP configuration information cannot be obtained from any of the nodes"
//  *Cause: Failed to retrieve the information about IPMP configuration from all nodes.
// *Action: Ensure that current user has required privileges to retrieve IPMP configuration information if IPMP is required to be configured on the cluster nodes.
/
1511, ERROR_IPMP_INFO_NODE, "Failed to get IPMP configuration information from node \"{0}\""
//  *Cause: Failed to retrieve the information about IPMP configuration from identified node.
// *Action: Ensure that current user has required privileges to retrieve IPMP configuration information if IPMP is required to be configured on the identified node.
/
1512, ERROR_CLUSTER_INTERFACE_INFO_ALL, "Failed to retrieve current selection of public and private network classifications"
//  *Cause: Could not retrieve the list of public and private network classifications selected in current configuration.
// *Action: Ensure that the configuration of public and private network classifications is done correctly during the installation process.
/
1513, ERROR_CLUSTER_INTERFACE_INFO_NODE, "Failed to retrieve current selection of public and private network classifications for node \"{0}\""
//  *Cause: Could not retrieve the list of public and private network classifications selected in current configuration.
// *Action: Ensure that the configuration of public and private network classifications is done correctly during the installation process.
/
1514, TASK_IPMP_DAEMON_CHECK_PASS, "Check for \"{0}\" daemon or process alive passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1515, TASK_IPMP_DMN_NOT_ON_NODE, "Solaris IPMP daemon \"{0}\" is not running on node \"{1}\""
//  *Cause: The indicated daemon process was not running. It may have aborted, been shut down, or simply not have been started.
// *Action: Install and configure the program if necessary, then start it.
/
1516, TASK_IPMP_DMN_FAILED_NODE, "Operation to check presence of \"{0}\" daemon or process failed on node \"{1}\""
//  *Cause: The operation to check indicated daemon or process failed on node identified. 
// *Action: Ensure that the node is accessible and IPMP configuration on the node is correct.
/
1517, TASK_IPMP_DMNALIVE_FAIL_ON_NODES, "The check for \"{0}\" daemon or process status failed on nodes \"{1}\""
//  *Cause: The indicated daemon was not accessible or there was some unknown failure in the check.
// *Action: Review the messages that accompany this message and fix the problem(s) on the indicated nodes.
/
1518, TASK_IPMP_NIC_CONF_CHECK_START, "Checking for existence of NIC configuration files for IPMP interfaces"
// *Document: NO
//  *Cause:
// *Action:
/
1519, TASK_IPMP_NIC_CONF_CHECK_PASS, "Check for existence of NIC configuration files for IPMP interfaces passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1520, TASK_IPMP_NIC_CONF_CHECK_FAILED, "Check for existence of NIC configuration files for IPMP interfaces failed on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1521, TASK_IPMP_NIC_CONF_ABSENT_ON_NODE, "The NIC configuration file at path \"{0}\" does not exist for IPMP interface \"{1}\" on node \"{2}\""
//  *Cause: The network interface card (NIC) configuration file required for consistent IP network multipathing (IPMP) configuration of the interface across reboots was missing at the indicated path for the identified interface on the node.
// *Action: Ensure that the IPMP configuration for the indicated network interface is correct and that the NIC configuration file at the identified path exists.
/
1522, TASK_IPMP_NIC_CONF_ABSENT_ON_NODES, "The NIC configuration file does not exist for some or all the IPMP interfaces on nodes \"{0}\""
//  *Cause: The network interface card (NIC) configuration file required for consistent IP network multipathing (IPMP) configuration of the interface across reboots was missing at the indicated path for the identified interface on the indicated nodes.
// *Action: Ensure that the IPMP configuration for the indicated network interface is correct and that the NIC configuration file at the identified path exists.
/
1523, TASK_IPMP_DEPRECATED_INTERFACE_CHECK_START, "Checking deprecated flag status for the IPMP interfaces"
// *Document: NO
//  *Cause:
// *Action:
/
1524, TASK_IPMP_DEPRECATED_INTERFACE_CHECK_PASS, "Check for deprecated flag status of IPMP interfaces passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1525, TASK_IPMP_DEPRECATED_INTERFACE_CHECK_FAILED, "Check for deprecated flag status of IPMP interfaces failed on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1526, TASK_IPMP_DEPRECATED_INTERFACE_NODE, "The IPMP interface \"{0}\" participating in an IPMP group \"{1}\" has deprecated flag set on node \"{2}\""
//  *Cause: The identified IPMP interface was found with deprecated flag set on the indicated node.
// *Action: Ensure that none of the classified IPMP interfaces have the deprecated flag set to ensure the correct functioning of IPMP on the node. 
/
1527, TASK_IPMP_DEPRECATED_INTERFACE, "Some of the IPMP interfaces have deprecated flag set on nodes \"{0}\""
//  *Cause: Some of the IPMP interfaces were found with deprecated flag set on the indicated nodes.
// *Action: Ensure that none of the classified IPMP interfaces have the deprecated flag set to ensure the correct functioning of IPMP on the indicated nodes. 
/
1528, TASK_IPMP_PVT_INTERFACE_IPMP_GRPMEM_ERROR_SOL11_NODE, "Warning: The IPMP interface \"{0}\" participating in an IPMP group \"{1}\" is classified as private interconnection interfaces on node \"{2}\""
//  *Cause: The identified interface classified as private interconnection interface was found to be a member of an IPMP group on the indicated node.
//          The Highly Available IP Address (HAIP) is not supported on Solaris 11 if IPMP interfaces are classified as private interconnection.
// *Action: If HAIP support is required then ensure that only non-IPMP interfaces are classified as private interconnection. 
/
1529, TASK_IPMP_PVT_INTERFACE_IPMP_GRPMEM_ERROR_SOL11, "Warning: Some of the IPMP interfaces are classified as private interconnection interfaces on nodes \"{0}\""
//  *Cause: The interfaces classified as private interconnection interfaces were found to be a member of an IPMP group on the indicated nodes.
//          The Highly Available IP Address (HAIP) is not supported on Solaris 11 if IPMP interfaces are classified as private interconnection.
// *Action: If HAIP support is required then ensure that only non-IPMP interfaces are classified as private interconnection. 
/
1530, TASK_IPMP_PUB_INTERFACE_SUBNET_CHECK_START, "checking whether IPMP interfaces classified as public network interfaces belong to the public subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1531, TASK_IPMP_PUB_INTERFACE_SUBNET_CHECK_PASS, "Check for public subnet of IPMP interfaces passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1532, TASK_IPMP_PUB_INTERFACE_SUBNET_CHECK_FAILED, "Check for public subnet of IPMP interfaces failed on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1533, TASK_IPMP_PUB_INTERFACE_SUBNET_NOTMATCH_NODE, "The IPMP interfaces \"{0}\" classified as public network do not belong to the subnet \"{1}\" on node \"{2}\""
//  *Cause: The identified IPMP interfaces classified as public networks were found to have different subnet on the indicated node.
// *Action: If IPMP interfaces are classified as public network for the clusterware configuration then all the configured interfaces must belong to same subnet. 
/
1534, TASK_IPMP_PUB_INTERFACE_SUBNET_NOTMATCH, "The IPMP interfaces classified as public network do not belong to the public subnet on nodes \"{0}\""
//  *Cause: The IPMP interfaces classified as public networks were found to have different subnet on the indicated nodes.
// *Action: If IPMP interfaces are classified as public network for the clusterware configuration then all the configured interfaces must belong to same subnet. 
/
1535, TASK_IPMP_PVT_INTERFACE_SUBNET_CHECK_START, "checking whether IPMP interfaces classified as private interconnect belong to the private subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1536, TASK_IPMP_PVT_INTERFACE_SUBNET_CHECK_PASS, "Check for private subnet of IPMP interfaces passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1537, TASK_IPMP_PVT_INTERFACE_SUBNET_CHECK_FAILED, "Check for private subnet of IPMP interfaces failed on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1538, TASK_IPMP_PVT_INTERFACE_SUBNET_NOTMATCH_NODE, "The IPMP interfaces \"{0}\" classified as private interconnection do not belong to the subnet \"{1}\" on node \"{2}\""
//  *Cause: The identified IPMP interfaces classified as private interconnection were found to have different subnet on the indicated node.
// *Action: If IPMP interfaces are classified as private interconnection for the clusterware configuration then all the configured interfaces must belong to same subnet. 
/
1539, TASK_IPMP_PVT_INTERFACE_SUBNET_NOTMATCH, "The IPMP interfaces classified as private interconnection do not belong to the private subnet on nodes \"{0}\""
//  *Cause: The IPMP interfaces classified as private interconnection were found to have different subnet on the indicated nodes.
// *Action: If IPMP interfaces are classified as private interconnection for the clusterware configuration then all the configured interfaces must belong to same subnet. 
/
1540, TASK_IPMP_NON_UNIQUE_MAC_ADDRESS_CHECK_START, "checking whether all the IPMP interfaces have unique MAC or hardware address."
// *Document: NO
//  *Cause:
// *Action:
/
1541, TASK_IPMP_NON_UNIQUE_MAC_ADDRESS_CHECK_PASS, "Check for unique MAC or hardware address for IPMP interfaces passed on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1542, TASK_IPMP_NON_UNIQUE_MAC_ADDRESS_CHECK_FAILED, "Check for unique MAC or hardware address for IPMP interfaces failed on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
1543, TASK_IPMP_NON_UNIQUE_MAC_ADDRESS_NODE, "The IPMP interfaces \"{0}\" share the same MAC or hardware address \"{1}\" on node \"{2}\"."
//  *Cause: The identified interfaces were found to share the same indicated 
//          MAC or hardware address on the indicated node.
// *Action: If an IP Network Multipathing (IPMP) interface is classified as 
//          a private or public network, then ensure that it has a unique MAC 
//          or hardware address configured on the indicated node.
/
1544, TASK_IPMP_NON_UNIQUE_MAC_ADDRESS, "Some or all of the IPMP interfaces share the same MAC or hardware address on nodes \"{0}\"."
//  *Cause: The IP Network Multipathing (IPMP) interfaces were found to share
//          the same MAC or hardware address on the indicated nodes.
// *Action: If IPMP interfaces are classified as private or public networks,
//          then ensure that they have a unique MAC or hardware address 
//          configured on the indicated node.
/
1545, TASK_IPMP_FAILED_INCONSISTENT_INTERFACES, "Some of the IPMP group interfaces are not classified as private or public network interfaces on nodes \"{0}\"."
//  *Cause: The IP Network Multipathing (IPMP) group consistency check found an 
//          additional fail-over dependency on an interface in an IPMP group
//          which was not classified as either public or private interconnect
//          on the identified nodes.
// *Action: Ensure that all the IPMP group interfaces are classified as 
//          either public or private interconnect on the identified nodes. 
//          Use command 'oifcfg setif {-node <nodename> | -global} {<if_name>/<subnet>:public/cluster_interconnect}' 
//          to classify the network interface as public or private interconnect.
/
1546, WARNING_CLUSTER_INTERFACE_INFO_ALL, "IPMP group configuration check is skipped. The network configuration command line failed to specify network classifications PUBLIC or PRIVATE."
//  *Cause: The IPMP configuration check could not be performed because the public and private network classifications were omitted from command line input.
// *Action: Ensure that the configuration of public and private network classifications is specified correctly in the command line input.
/
1550, ERROR_PRIVATE_IP_INFO_NODE, "Failed to retrieve the list of IP addresses on private network from node \"{0}\""
//  *Cause: An attempt to retrieve the list of private network IP addresses for the private network classifications failed on the indicated node.
// *Action: Ensure that the configuration of private network classifications is done correctly on the indicated node.
/
1551, ERROR_PUBLIC_IP_INFO_NODE, "Failed to retrieve the list of IP addresses on public network from node \"{0}\""
//  *Cause: An attempt to retrieve the list of public network IP addresses for the public network classifications failed on the indicated node.
// *Action: Ensure that the configuration of public network classifications is done correctly on the indicated node.
/
1560, ERROR_TEMP_DIR_PATH_SHARED_NODES, "Temporary directory path \"{0}\" is shared on nodes \"{1}\""
//  *Cause: The temporary directory path was found to be shared by two or more nodes.
// *Action: Ensure that the temporary directory path is not shared between the nodes specified.
/
1561, ERROR_CRS_HOME_IS_SET, "Setting ORA_CRS_HOME variable is not supported"
//  *Cause: The environment variable ORA_CRS_HOME has been set before starting an installation or upgrade.
// *Action: Unset environment variable ORA_CRS_HOME.
/
1562, ERROR_GET_PUBLIC_NETWORK_FROM_CLUSTER_NETWORKS, "failed to retrieve the information for the cluster public networks"
//  *Cause: An attempt to retrieve the network information for networks 
//          classified as public during cluster network connectivity checks
//          failed because there were no networks classified as public.
// *Action: Ensure that the clusterware is up and running and that at least
//          one of the networks is classified as public and retry the
//          node connectivity check.
/
1563, TASK_VIPSUBNET_NO_PUBLIC_CLUSTER_NETWORKS_FOUND, "Could not find a public cluster network to perform VIP subnet checks on the node \"{0}\"."
//  *Cause: An attempt to retrieve the cluster network information 
//          classified as public during VIP subnet checks failed because
//          there were no networks classified as public on the specified node.  
// *Action: Ensure that at least one of the cluster networks is classified
//          as public and retry the VIP subnet check on the specified node.
/
1564, TASK_VIPSUBNET_CHECK_UNKNOWNHOSTVIP_ERROR, "The VIP name \"{0}\" could not be resolved to an IP address."
//  *Cause: An attempt to resolve the indicated VIP name to an IP address
//          during VIP subnet checks failed because the IP address could not be
//          found.
// *Action: Ensure that the indicated VIP name is a valid host name that can be
//          resolved to an IP address, correct the value and retry the
//          operation.
/
1600, TASK_ASM_NO_ASM_NETWORK_PRE_API, "ASM network not specified" 
//  *Cause: An ASM network was not specified when ASM presence was 'flex'.
// *Action: Make sure that there is at least one network of type 'ASM' or 'ASM-PRIV' 
//          selected in the Network Interface dialog screen of Oracle Universal Installer. 
/
1601, TASK_ASM_NO_ASM_NETWORK_POST, "ASM network was not configured"
//  *Cause: An attempt to verify if the ASM network was configured failed when ASM presence was 'flex'.
// *Action: Make sure that there is at least one ASM network configured using the 'oifcfg setif' command.
/
1602, TASK_ASM_CRED_VALIDATION_PRE_START, "Checking if the credentials in file \"{0}\" are valid"
// *Document: NO
//  *Cause:
// *Action:
/
1603, TASK_ASM_CRED_VALIDATION_POST_START, "Checking if the ASM credentials for ASM cluster are valid"
// *Document: NO
//  *Cause:
// *Action:
/
1604, TASK_ASM_PRE_CRED_VALIDATION_FAILED, "Failed to validate ASM credentials in file \"{0}\""
//  *Cause: An attempt to verify if the ASM credentials in specified credentials file are valid failed.
// *Action: Make sure that the path to specified file is correct. Also look at accompanying messages and respond accordingly.
/
1605, TASK_ASM_POST_CRED_VALIDATION_FAILED, "Failed to validate ASM credentials"
//  *Cause: An attempt to verify ASM credentials are valid failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
1606, ASM_NETWORK_VALIDATION_START,"Checking if connectivity exists across cluster nodes on the ASM network"
// *Document: NO
//  *Cause:
// *Action:
/
1607, ASM_NETWORK_VALIDATION_PASSED, "Network connectivity check across cluster nodes on the ASM network passed"
// *Document: NO
//  *Cause:
// *Action:
/
1608, ASM_NETWORK_VALIDATION_FAILED, "Network connectivity check across cluster nodes on the ASM network failed"
//  *Cause: An attempt to verify connectivity of cluster nodes on the ASM network failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
1609, TASK_ASM_PRE_CRED_VALIDATION_SUCCESS, "ASM credentials in file \"{0}\" are valid"
// *Document: NO
//  *Cause:
// *Action:
/
1610, TASM_ASM_POST_CRED_VALIDATION_SUCCESS, "ASM credentials are valid"
// *Document: NO
//  *Cause:
// *Action:
/
1611, TASK_ASM_NO_ASM_NETWORK_PRE_CMD, "ASM network not specified" 
//  *Cause: An ASM network was not specified when ASM presence was 'flex'.
// *Action: Make sure that there is at least one ASM network specified using the -networks command line parameter. 
/
1612, TASK_ASMDG_ERROR_DISKGROUPS, "ASM disk groups could not be retrieved"
//  *Cause: During ASM integrity verification, an attempt to retrieve ASM disk groups failed. 
// *Action: Look at the accompanying messages and respond accordingly.
/
1613, ASMDG_NO_DISK_LIST, "ASM disk group \"{0}\" did not resolve to any disk"
//  *Cause: An attempt to retrieve an associated disk path for the indicated 
//          ASM disk group did not resolve to any disk paths.
// *Action: Ensure that the ASM disk group is correctly configured with valid
//          disk paths and that the ASM filter driver if used lists the 
//          associated devices for this disk group when the command  
//          'afdtool -getdevlist' is issued. If ASM filter driver is not in use
//          then ensure that the ASM kfod command 'kfod op=DISKS disks=all dscvgroup=TRUE' 
//          lists the associated disks for the indicated ASM disk group. 
/
1614, SHARED_STORAGE_SKIPPED_VM_ENV, "Virtual environment detected. Skipping shared storage check."
//  *Cause: Shared storage check was skipped because of limitations in 
//          determining the sharedness of the storage devices in 
//          virtual environments.
// *Action: Ensure that the selected storage devices are shared between the 
//          nodes.
/
1615, SHARED_STORAGE_CHECK_SKIPPED_VM_ENV, "Virtual environment detected. Skipping shared storage check for disks \"{0}\"."
//  *Cause: Shared storage check for the indicated disks was skipped because of 
//          limitations in determining the sharedness of the disks in  
//          virtual environments.
// *Action: Ensure that the indicated disks are shared between the nodes.
/
1650, SRVMHAS_JNI_CREATE_CTX_FAILED, "failed to create required native library context."
//  *Cause: An attempt to initialize a required native library context failed.
// *Action: Ensure that the Grid user has write authority on Oracle base path.
/
1297, MULTIPLE_PATHS_SAME_DISK, "The following device paths point to the same physical device: \"{0}\"."
//  *Cause: An attempt to check the suitability of listed or discovered device paths for ASM disk group creation found that multiple device paths point to the same physical device.
// *Action: Ensure that all listed or discovered device paths point to distinct physical devices.
/
1700, TASK_CHECK_USER_EQUIV_CLUSTER_BEGIN, "Check: user equivalence for user \"{0}\" on all cluster nodes" 
// *Document: NO
//  *Cause:
// *Action:
/
1701, TASK_CHECK_USER_EQUIV_CLUSTER_FAIL, "Check for equivalence for user \"{0}\" from node \"{1}\" to nodes \"{2}\" failed."
//  *Cause: The CVU check to verify user equivalence among all cluster nodes 
//          failed on the indicated node because user equivalence did not exist
//          for the indicated user between that node and all of the other nodes
//          shown in the message.
// *Action: Ensure that user equivalence exists between the specified nodes.
//          The command 'cluvfy comp admprv -o user_equiv' can be used with 
//          the '-fixup' option to set up the user equivalence. A password
//          is required.
/
1702, TASK_CHECK_USER_EQUIV_CLUSTER_PASS, "Check for equivalence for user \"{0}\" from node \"{1}\" to all cluster nodes passed."
// *Document: NO
//  *Cause:
// *Action:
/
1703, TASK_CHECK_USER_EQUIV_CLUSTER_ALL_FAIL, "Check for user equivalence for user \"{0}\" failed on all cluster nodes."
//  *Cause: An error occurred while trying to verify user equivalence among the
//          cluster nodes. The accompanying messages provide detailed 
//          information about the failure.
// *Action: Resolve the problems described in the accompanying messages,
//          and retry the operation. The command
//          'cluvfy comp admprv -o user_equiv' with the '-fixup' option
//          can be used to set up the user equivalence. A password
//          is required.
/
1704, TASK_CHECK_USER_EQUIV_CLUSTER_NAME, "Checking user equivalence for user \"{0}\" on all cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
1800, TASK_CLUSTER_NODE_NOT_DC_START, "Checking nodes \"{0}\" to ensure that none of the nodes are Windows domain controllers"
// *Document: NO
//  *Cause:
// *Action:
/
1801, TASK_CLUSTER_NODE_NOT_DC_FAILED, "Nodes \"{0}\" are Windows domain controllers."
//  *Cause: The Cluster Verification Utility determined that the specified nodes
//          are Windows domain controllers. Oracle recommends that Oracle 
//          Clusterware and Database software should not be installed on 
//          machines that are Windows domain controllers.
// *Action: Modify the list of nodes to omit the indicated nodes.
/
1802, TASK_CLUSTER_NODE_NOT_DC_SUCCESS, "None of the nodes specified are Windows domain controllers."
// *Document: NO
//  *Cause:
// *Action:
/
1803, TASK_CLUSTER_NODE_NOT_DC_OPER_FAIL, "failed to determine if any of the nodes \"{0}\" are Windows domain controllers"
//  *Cause: The Cluster Verification Utility could not determine if any of the
//          specified nodes are Windows domain controllers.
// *Action: Examine the accompanying messages and respond accordingly.
/
1804, TASK_CLUSTER_NODE_NOT_DC_NAME, "Cluster nodes are not Windows domain controllers."
// *Document: NO
//  *Cause:
// *Action:
/
1805, TASK_CLUSTER_NODE_NOT_DC_DESCRIPTION, "This task verifies that none of the cluster nodes are Windows domain controllers."
// *Document: NO
//  *Cause:
// *Action:
/
1900, WORKDIR_NOT_USABLE_ON_NODES, "The directory \"{0}\" cannot be used as work directory on nodes \"{1}\"."
//  *Cause: An operation requiring remote execution could not complete because
//          the attempt to set up the Cluster Verification Utility remote 
//          execution framework failed because the necessary files could
//          not be copied to the indicated directory on the indicated nodes.
//          The accompanying message provides detailed failure information.
// *Action: Ensure that the path identified either exists or can be created on
//          the indicated nodes. Ensure that user running this check has 
//          sufficient permission to overwrite the contents of the indicated
//          directoy. Examine the accompanying error messages, address the 
//          issues reported and retry.
/
1901, FRAMEWORK_SETUP_BAD_NODES, "failed to setup CVU remote execution framework directory \"{0}\" on nodes \"{1}\""
//  *Cause: An operation requiring remote execution could not complete because
//          the attempt to set up the Cluster Verification Utility remote
//          execution framework failed on the indicated nodes at the 
//          indicated directory location because the CVU remote execution 
//          framework version did not match the CVU java verification
//          framework version. The accompanying message provides detailed
//          failure information.
// *Action: Ensure that the directory indicated exists or can be created and
//          the user executing the checks has sufficient permission to
//          overwrite the contents of this directory. Also review the
//          accompanying error messages and respond to them.
/
1902, USE_DIFFERENT_WORK_AREA, "Set the environment variable CV_DESTLOC to point to a different work area."
// *Document: NO
//  *Cause:
// *Action:
/
1903, WORKDIR_NOT_USABLE_ALL_NODES, "Directory \"{0}\" cannot be used as work directory on any of the nodes."
//  *Cause: An operation requiring remote execution could not complete because
//          the attempt to set up the Cluster Verification Utility remote
//          execution framework failed on all nodes. The accompanying
//          message provides detailed failure information.
// *Action: Ensure that the directory indicated exists or can be created and
//          the user executing the checks has sufficient permission to
//          overwrite the contents of this directory. Also review the
//          accompanying error messages and respond to them.
/
1904, INVALID_DIRECTORY_PATH, "Path \"{0}\" is not a valid directory."
//  *Cause: An operation to set up the Cluster Verification Utility remote
//          execution framework was rejected because the indicated path did
//          not designate a valid directory.
// *Action: Retry the operation specifying a path designating an existing 
//          directory for which the user executing the checks has sufficient 
//          permission to overwrite its contents.
/
// Translator: do not translate 'search'
2000, RESOLV_CONF_INCONSISTENT_SEARCH, "The 'search' entry in the existing \"{0}\" files is inconsistent."
//  *Cause: A check of resolv.conf files across the cluster nodes found inconsistent 'search' entries.
// *Action: Ensure that all nodes of the cluster have the same 'search' entry in their 'resolv.conf' files.
/
// Translator: do not translate 'search'
2001, RESOLV_CONF_SEARCH_FOR_NODES, "	The 'search' entry was found as \"{0}\" on nodes: {1}."
// *Document: NO
//  *Cause:
// *Action:
/
2002, RESOLV_CONF_COPY_FILE_ERR, "Encountered error in copying file \"{0}\" from node \"{1}\" to node \"{2}\""
//  *Cause: The specified file could not be copied from the specified source node to the destination node.
// *Action: Examine the accompanying error message for details.
/
// Translator: do not translate 'domain' 'search'
2003, RESOLV_CONF_DOMAIN_AND_SEARCH_COEXISTANCE_PASSED, "There are no \"{0}\" files with both 'domain' and 'search' entries."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'search'
2004, RESOLV_CONF_SEARCH_DOESNOT_EXIST_ALL, "None of the \"{0}\" files have 'search' entries."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'search'
2005, RESOLV_CONF_SEARCH_EXISTS_ALL, "All of the \"{0}\" files have 'search' entries."
// *Document: NO
//  *Cause:
// *Action:
/
2006, TASK_RESOLV_CONF_BEGIN_TASK,"Checking integrity of file \"{0}\" across nodes"
// *Document: NO
//  *Cause:
// *Action:
/
2007, TASK_RESOLV_CONF_INTEGRITY_PASSED,"Check for integrity of file \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
2008, TASK_RESOLV_CONF_INTEGRITY_FAILED,"Check for integrity of file \"{0}\" failed"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'search'
2009, RESOLV_CONF_SAME_SEARCH_CHECK_PASSED, "All nodes have same 'search' order defined in file \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'domain'
2010, RESOLV_CONF_DOMAIN_DOESNOT_EXIST_ALL, "None of the \"{0}\" files have 'domain' entries."
// *Document: NO
//  *Cause:
// *Action:
/
2011, RESOLV_CONF_SAME_DOMAIN_CHECK_PASSED, "All nodes have same \"domain\" entry defined in file \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'domain'
2012, RESOLV_CONF_INCONSISTENT_DOMAIN, "The 'domain' entries in the existing \"{0}\" files are inconsistent."
//  *Cause: A check of nodes' resolv.conf files found inconsistent 'domain' entries.
// *Action: Make sure that all nodes of the cluster have same 'domain' entry in the file specified.
/
// Translator: do not translate 'domain'
2013, RESOLV_CONF_DOMAIN_FOR_NODES, "	The 'domain' entry was found to be \"{0}\" on nodes: {1}."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'search'
2014, RESOLV_CONF_SINGLE_SEARCH_CHECK_PASSED, "None of the \"{0}\" files have more than one 'search' entry."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'domain'
2015, RESOLV_CONF_SINGLE_DOMAIN_CHECK_PASSED, "None of the \"{0}\" files have more than one 'domain' entry."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'search' 'domain'
2016, RESOLV_CONF_DOMAIN_AND_SEARCH_EXISTS_NODE, "File \"{0}\" on node \"{1}\"  has both 'search' and 'domain' entries."
//  *Cause: Both 'search' and 'domain' entries were found in the 'resolv.conf' file on the indicated node.
// *Action: Make sure that only one of these entries exists in the file 'resolv.conf'. It is preferable to use a 'search' entry in resolv.conf.
/
// Translator: do not translate 'domain'
2017, RESOLV_CONF_DOMAIN_EXISTS_ALL, "All \"{0}\" files have 'domain' entries."
// *Document: NO
//  *Cause:
// *Action:
/
2018, RESOLV_CONF_FAILURE_QUERY, "failed to execute DNS query command on nodes \"{0}\""
//  *Cause: An error happened while querying a domain name server.
// *Action: Run 'nslookup' on the host name and make sure the name is resolved by all servers defined in the 'resolv.conf' file.
/
2019, USER_EQUIV_FAILED_NODE, "Check for equivalence of user \"{0}\" from node \"{1}\" to node \"{2}\" failed"
//  *Cause: The CVU check to verify user equivalence for the indicated user
//          between the indicated nodes failed because user equivalence did 
//          not exist.
// *Action: Ensure that user equivalence exists between the specified nodes.
//          The command 'cluvfy comp admprv -o user_equiv' can be used with 
//          the '-fixup' option to set up the user equivalence. A password
//          is required.
/
2020, NO_OHASD_IN_INITTAB_NODE, "No OHASD entry was found in /etc/inittab file on node \"{0}\""
//  *Cause: A check of file /etc/inittab did not find the expected entry for OHASD.
// *Action: Deconfigure Grid Infrastructure and reconfigure it.
/
2021, PASS_FILE_EXIST_CHECK, "Check for existence of file \"{0}\" passed for nodes: \"{1}\" "
// *Document: NO
//  *Cause: 
// *Action: 
/
2022, PASS_FILE_EXIST_CHECK_NODE, "Check for existence of file \"{0}\" passed on node \"{1}\" "
// *Document: NO
//  *Cause: 
// *Action: 
/
2023, PASS_OHASD_IN_INITTAB_NODE, "Check for valid OHASD entry in /etc/inittab file passed on node \"{0}\""
// *Document: NO
//  *Cause: 
// *Action: 
/
2024, DNS_SERVER_RESOLV_FILE, "checking DNS response from all servers in \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
2025, DNS_SERVER_RESOLV_FILE_VERBOSE, "checking response for name \"{0}\" from each of the name servers specified in \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
2026, DNS_SERVER_RESOLV_FILE_FAILED, "no response for name \"{0}\" from the DNS server \"{1}\" specified in \"resolv.conf\""
//  *Cause: An attempt to look up the name in DNS has failed.
// *Action: Make sure that all DNS servers specified in the file 'resolv.conf' respond to all the nodes.
/
2027, FILE_OWNR_INCNSSTNT_ACCRSS_NODES, "Owner of file \"{0}\" is inconsistent across nodes. [Found = \"{1}\" on Nodes = \"{2}\"]"
//  *Cause: Ownership of the indicated file was not the same on all cluster nodes.
// *Action: Change the owner of the indicated file to ensure it is the same on all nodes.
/
2028, FILE_GRP_INCNSSTNT_ACCRSS_NODES, "Group of file \"{0}\" is inconsistent across nodes. [Found = \"{1}\"]"
//  *Cause: Ownership group of the indicated file was not the same on all cluster nodes.
// *Action: Change the group of the indicated file to ensure it is the same on all nodes.
/
2029, FILE_PERM_INCNSSTNT_ACCRSS_NODES, "Octal permissions of file \"{0}\" are inconsistent across nodes. [Found = \"{1}\"]"
//  *Cause: Octal permissions of the indicated file were not the same on all cluster nodes.
// *Action: Change the permissions of the indicated file to ensure they are the same on all nodes.
/
2030, FAIL_CHK_FILE_ATTRIB_ON_NODE, "Failed to check attributes of file \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve the file system attributes of the specified file failed.
// *Action: Ensure that the file exists on the system and user has permissions to retrieve the details of specified file.
/
2031, FILE_OWNER_MISMATCH_ON_NODE, "Owner of file \"{0}\" did not match the expected value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for file system attributes found that the owner of the indicated file on the indicated node was different from the required owner.
// *Action: Change the owner of the indicated file to match the required owner.
/
2032, FILE_GROUP_MISMATCH_ON_NODE, "Group of file \"{0}\" did not match the expected value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for file system attributes found that the group of the indicated file on the indicated node was different from the required group.
// *Action: Change the group of the indicated file to match the required group.
/
2033, FILE_PERM_MISMATCH_ON_NODE, "Permissions of file \"{0}\" did not match the expected octal value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: A check for file system attributes found that the permissions of the indicated file on the indicated node were different from the required permissions.
// *Action: Change the permissions of the indicated file to match the required permissions.
/
2034, COMMAND_EXEC_DETAILS, "Command \"{0}\" executed on node \"{1}\" exited with status value \"{2}\" and gave the following output:"
//  *Cause: An executed command produced unexpected results.
// *Action: Respond based on the failing command and the reported results.
/
2035, COMMAND_EXEC_DETAILS_NO_OUTPUT, "Command \"{0}\" executed on node \"{1}\" exited with status value \"{2}\" and gave no output"
//  *Cause: An executed command produced unexpected results.
// *Action: Respond based on the failing command and the reported results.
/
2036, CHECK_OLR_LOC_FILE_EXIST, "Checking for existence of OLR configuration file \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
2037, PASS_OLR_LOC_FILE_EXIST, "Check of existence of OLR configuration file \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
2038, CHECK_OLR_LOC_FILE_ATTRIB, "Checking attributes of OLR configuration file \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
2039, PASS_OLR_LOC_FILE_ATTRIB, "Check of attributes of OLR configuration file \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
2040, CHECK_OLR_REGISTRY_KEY, "Checking for Windows registry key of OLR"
// *Document: NO
//  *Cause:
// *Action:
/
2041, PASS_OLR_REGISTRY_KEY, "Check for Windows registry key of OLR passed"
// *Document: NO
//  *Cause:
// *Action:
/
2042, TASK_OLR_NO_OLR_LOCATION_NODE, "Unable to obtain OLR location from node \"{0}\""
//  *Cause: A check of the Oracle Local Registry (OLR) could not determine that file's location on the indicated node.
// *Action: Check the status of OLR using the command 'ocrcheck -config -local' on the indicated node.
/
2043, CMD_EXEC_DETAILS, "Command \"{0}\" failed on node \"{1}\" and produced the following output:"
//  *Cause: An executed command failed.
// *Action: Respond based on the failing command and the reported results.
/
2044, CMD_EXEC_DETAILS_NO_OUTPUT, "Command \"{0}\" failed on node \"{1}\" and produced no output."
//  *Cause: An executed command failed.
// *Action: Respond based on the failing command.
/
2045, API_EXEC_DETAILS_FUNC_ERRDATA, "Operating system function \"{0}\" failed on node \"{1}\"."
//  *Cause: A call to an Operating System dependent service or function 
//          returned an error indication.
// *Action: This error normally is accompanied by other (higher-level) messages 
//          describing the operation that is affected by the failure.  It may 
//          also include one or more of messages PRVG-2046 and PRVG-2047 
//          providing additional error details. All of the messages should be 
//          examined to assess the error, which may have a very ordinary cause 
//          and correction, such as an input file failing to open because the 
//          supplied name was misspelled.
/
2046, API_EXEC_DETAILS_ERRTEXT, "Operating system error message: \"{0}\""
//  *Cause: This message accompanies message PRVG-2045 above when the Operating
//          System dependent error data can be converted into a text message. 
// *Action: See message PRVG-2045.
/
2047, API_EXEC_DETAILS_OTHERINFO, "Additional information: \"{0}\""
//  *Cause: This message accompanies message PRVG-2045 and supplies additional
//          information related to the error condition. A single error may 
//          include multiple lines of additional information.
// *Action: See message PRVG-2045.
/
2048, DNS_SERVER_RESOLV_FILE_FAILED_REQ, "no response for name \"{0}\" from the DNS server \"{1}\" specified in \"resolv.conf\""
//  *Cause: An attempt to look up the name in DNS using the indicated name server has failed.
// *Action: Remove the obsolete DNS servers specified in the file 'resolv.conf'.
/
2050, NSSWITCH_CONF_HOSTS_EXISTANCE_CHECK, "Checking if \"hosts\" entry in file \"{0}\" is consistent across nodes..."
// *Document: NO
//  *Cause:
// *Action:
/
2051, TASK_NSSWITCH_CONF_CHECK_START, "Checking integrity of name service switch configuration file \"{0}\" ..."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'hosts'
2052, NSSWITCH_CONF_HOSTS_NON_EXISTANT, "There is no 'hosts' entry in the file \"{0}\" on nodes: \"{1}\"."
//  *Cause: The 'hosts' entry was not found in the indicated name service switch configuration file on the nodes indicated while it was present in others.
// *Action: Look at the indicated file on all nodes. Make sure that either a 'hosts' entry is defined on all nodes or is not defined on any nodes. 
/
2053, NSSWITCH_CONF_SINGLE_HOSTS_CHECK, "Checking file \"{0}\" to make sure that only one \"hosts\" entry is defined"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'hosts'
2054, NSSWITCH_CONF_MULTI_HOSTS_NODES, "The following nodes have multiple 'hosts' entries defined in file \"{0}\": {1}."
//  *Cause: The nodes specified had multiple 'hosts' entries defined in the file specified.
// *Action: Make sure that the file specified has only one 'hosts' entry. 
/
2055, NSSWITCH_CONF_SINGLE_HOSTS_CHECK_PASSED, "More than one \"hosts\" entry does not exist in any \"{0}\" file"
// *Document: NO
//  *Cause:
// *Action:
/
2056, NSSWITCH_CONF_HOSTS_DOESNOT_EXIST_ALL, "\"hosts\" entry does not exist in any \"{0}\" file"
// *Document: NO
//  *Cause:
// *Action:
/
2057, NSSWITCH_CONF_SAME_HOSTS_CHECK_PASSED, "All nodes have same \"hosts\" entry defined in file \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'hosts'
2058, NSSWITCH_CONF_INCONSISTENT_HOSTS, "The 'hosts' entries in the existing \"{0}\" files are inconsistent."
//  *Cause: A check of nodes' name service switch configuration files found inconsistent 'hosts' entries.
// *Action: Make sure that all nodes of the cluster have same 'hosts' entry in the file specified.
/
2059, NSSWITCH_CONF_HOSTS_FOR_NODES, "	\"hosts\" entry was found as \"{0}\" on nodes: {1}"
// *Document: NO
//  *Cause:
// *Action:
2060, TASK_DESC_NSSWCONF, "This task checks integrity of name service switch configuration file \"{0}\" across nodes"
// *Document: NO
//  *Cause:
// *Action:
/
2061, TASK_ELEMENT_NSSWCONF, "Name Service Switch Configuration File Integrity"
// *Document: NO
//  *Cause:
// *Action:
/
2062, TASK_NSSWITCH_CONF_INTEGRITY_PASSED,"Check for integrity of name service switch configuration file \"{0}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
2063, TASK_NSSWITCH_CONF_INTEGRITY_FAILED,"Check for integrity of name service switch configuration file \"{0}\" failed"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: Do not translate 'nameserver'
2064, TASK_RESOLVE_NAMESERVER_EMPTY, "There are no configured name servers in the file '/etc/resolv.conf' on the nodes \"{0}\""
// *Cause: Entries for 'nameserver' were not found in the file '/etc/resolv.conf'
//         on the indicated nodes.
// *Action: Specify the 'nameserver' entry on the indicated nodes.
/
2065, TASK_GNS_CLIENT_VALIDITY,"client data file validity"
// *Document: NO
//  *Cause:
// *Action:
/
2066, TASK_GNS_CLIENT_RESPONSE,"response of GNS"
// *Document: NO
//  *Cause:
// *Action:
/
2070, OCR_LOCATION_DG_NOT_AVAILABLE, "Disk group for ocr location \"{0}\" is not available on the following nodes:"
//  *Cause: Disk group was not found on the specified nodes.
// *Action: Ensure that the disks underlying the disk group are accessible from the specified nodes.
/
2071, OCR_LOCATION_DG_NOT_AVAILABLE_NODE, "Disk group for ocr location \"{0}\" is not available on \"{1}\""
//  *Cause: Disk group was not found on the specified node.
// *Action: Ensure that the disks underlying the disk group are accessible from the specified node.
/
// Translator: will be preceded by "Verifying" from
// opsm/jsrc/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
2072, TASK_GNS_SUBDOMAIN_VALID,"subdomain is a valid name"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/jsrc/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
2073, TASK_GNS_VIP_PUBLIC_NETWORK,"GNS VIP belongs to the public network"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/jsrc/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
2074, TASK_GNS_VIP_VALID_ADDRESS,"GNS VIP is a valid address"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/jsrc/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
2075, TASK_GNS_NAME_RESOLUTION,"name resolution for GNS sub domain qualified names"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/jsrc/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
2076, TASK_GNS_RESOURCES_CHECK,"GNS resource"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/jsrc/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
2077, TASK_GNS_VIP_RESOURCE_CHECK,"GNS VIP resource"
// *Document: NO
//  *Cause:
// *Action:
/
2078, COMMAND_EXEC_DETAILS_NO_ID, "Execution of command \"{0}\" on node \"{1}\" for disk \"{2}\" showed there was no UUID in the disk label."
//  *Cause: An attempt to retrieve the universally unique ID (UUID) 
//          for the indicated disk on the node shown using the indicated 
//          command in order to check for sharedness across nodes determined
//          that the disk did not have a UUID. Sharedness could not be 
//          checked for this device.
// *Action: To check sharedness for the indicated device, assigned it a UUID 
//          using the commands specific to the platform and retry the 
//          sharedness check. Alternatively, select a different device with a
//          UUID for shared access and verify sharedness for that disk.
/
4000, REG_KEY_ABSENT, "Windows registry key \"{0}\" is absent on node \"{1}\""
//  *Cause: Could not find the specified Windows registry key on the identified node. 
// *Action: Contact Oracle Support Services. 
/
4001, REG_KEY_EXISTANCE_FAILED_NODE, "Failed to check existence of Windows registry key \"{0}\" on node \"{1}\", [{2}]"
//  *Cause: Could not check the existence of specified Windows registry key on the identified node. 
// *Action: Look at the accompanying messages and respond accordingly. 
/
4002, MISSING_USER_COMMANDLINE_ARGUMENT,  "Missing '-user <user_name>' argument for selected privilege delegation method \"{0}\"."
//  *Cause: A user name was not specified on the command line for the specified privilege delegation method.
// *Action: Specify a user name using the '-user' option following the privilege delegation method on the command line.
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4497, TASK_VERIFY_SERVICE_USER_PERMISSION_FILE_SUBCHECK, "permissions on file \"{1}\" for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4498, TASK_VERIFY_SERVICE_USER_PERMISSION_REG_SUBCHECK, "permissions on registry key \"{1}\" for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4499, TASK_VERIFY_SERVICE_USER_GMSA_SUBCHECK, "Windows user \"{0}\" to ensure that the user is a Group Managed Service Account (GMSA) user on all nodes" 
// *Document: NO
//  *Cause:
// *Action:
/
4500, INVALID_PARAM_VALUE,  "Parameter \"{0}\" value is not valid"
//  *Cause: This is an internal error. The value for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
4501, TASK_ELEMENT_VERIFY_SERVICE_USER, "Verify Oracle home service user"
// *Document: NO
//  *Cause:
// *Action:
/
4502, TASK_DESC_VERIFY_SERVICE_USER, "This is a prerequisite check to verify that Oracle home service user has been configured properly"
// *Document: NO
//  *Cause:
// *Action:
/
4503, TASK_VERIFY_SERVICE_USER_START, "Checking if Windows user \"{0}\" can be used as service user"
// *Document: NO
//  *Cause:
// *Action:
/
4504, TASK_VERIFY_SERVICE_USER_LSA, "Windows user \"{0}\" can be used as a service user"
// *Document: NO
//  *Cause:
// *Action:
/
4505, TASK_VERIFY_SERVICE_USER_NO_LOCAL_SERVICE, "Windows user \"{0}\" cannot be the service user"
//  *Cause: An attempt was made to specify the built-in Windows user 'nt authority\\local service' as the service owner. 
// *Action: Specify either the Windows user 'nt authority\\local system' or a Windows domain user without administrative privilege as the service owner.
/
4506, TASK_VERIFY_SERVICE_USER_NOT_DOMAIN, "Windows user \"{0}\" is not a domain user"
//  *Cause: An attempt was made to specify a Windows user account local to this system as the service owner.
// *Action: Specify either the Windows user 'nt authority\\local system' or a Windows domain user without administrative privilege as the service owner.
/
4507, TASK_VERIFY_SERVICE_USER_CHECK_DOMAIN, "Checking if Windows user \"{0}\" is a domain user"
// *Document: NO
//  *Cause:
// *Action:
/
4508, TASK_VERIFY_SERVICE_USER_IS_DOMAIN, "Windows user \"{0}\" is a domain user"
// *Document: NO
//  *Cause:
// *Action:
/
4509, TASK_VERIFY_SERVICE_USER_CHECK_ADMIN, "Checking Windows user \"{0}\" to ensure that the user is not an administrator" 
// *Document: NO
//  *Cause:
// *Action:
/
4510, TASK_VERIFY_SERVICE_USER_IS_ADMIN, "Windows user \"{0}\" is an administrator on the nodes \"{1}\""
//  *Cause: The specified Windows user was found to be an administrator on the nodes specified.
// *Action: Make sure that the Windows user name specified as service user is not an administrator on any of the nodes.
/
4511, TASK_VERIFY_SERVICE_USER_IS_NOT_ADMIN, "Windows user \"{0}\" is not an administrator on any of the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4512, TASK_VERIFY_SERVICE_USER_CHECK_VALID, "Checking if password is valid for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4513, TASK_VERIFY_SERVICE_USER_CHECK_VALID_INVALID, "User name or password is invalid for Windows user \"{0}\""
//  *Cause: An attempt to verify the Windows user name and password failed as user name or password is not valid.
// *Action: Make sure that the Windows user name and password specified are correct. 
/
4514, TASK_VERIFY_SERVICE_USER_CHECK_VALID_SUCCESS, "User name and password provided on the command line are valid for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4515, TASK_VERIFY_SERVICE_USER_DOMAIN_FAILED, "Unable to determine if the Windows user \"{0}\" is a domain user"
//  *Cause: An attempt to determine if the specified Windows user account is a domain user failed.
// *Action: Examine the accompanying error messages for details.
/
4516, TASK_VERIFY_SERVICE_USER_IS_ADMIN_FAILED, "Failed to verify Windows user \"{0}\" is not an administrator on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user is an administrator on the specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
4517, TASK_VERIFY_SERVICE_USER_CHECK_VALID_FAILED, "Failed to validate the user name and password for Windows user \"{0}\""
//  *Cause: An attempt to determine if the specified Windows user name and password are valid failed.
// *Action: Examine the accompanying error messages for details.
/
4518, TASK_VERIFY_SERVICE_USER_WALLET_PASSWORD, "Verifying password for Windows user \"{0}\" stored in the OSUSER wallet"
// *Document: NO
//  *Cause:
// *Action:
/
4519, TASK_VERIFY_SERVICE_USER_WALLET_PASSWORD_MATCH, "The OSUSER wallet contains the correct password for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4520, TASK_VERIFY_SERVICE_USER_WALLET_PASSWORD_WRONG, "The OSUSER wallet contains incorrect password for Windows user \"{0}\""
//  *Cause: An attempt to verify the password stored in OSUSER wallet for the specified Windows user found that the password is invalid. 
// *Action: Use the command 'crsctl modify wallet -type OSUSER' to update the password in the wallet for the specified user.
/
4521, TASK_VERIFY_SERVICE_USER_WALLET_PASSWORD_FAILED, "Failed to verify the password stored in OSUSER wallet for Windows user \"{0}\""
//  *Cause: An attempt to determine if the password stored in OSUSER wallet for specified Windows user is valid failed.
// *Action: Examine the accompanying error messages for details.
/
4522, TASK_VERIFY_SERVICE_USER_FAILED, "Failed to check if Windows user \"{0}\" can be used as service user"
//  *Cause: An attempt to determine if the specified Windows user can be used as a service user failed.
// *Action: Examine the accompanying error messages for details.
/
4523, TASK_VERIFY_SERVICE_USER_CHECK_ORA_DBA, "Checking if Windows user \"{0}\" is part of Windows group \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4524, TASK_VERIFY_SERVICE_USER_IS_NOT_ORA_DBA, "Windows user \"{0}\" is not a member of Windows group \"{2}\" on nodes \"{1}\""
//  *Cause: The specified Windows user was not a member of specified Windows group on the nodes specified.
// *Action: Add the specified Windows user to the specified Windows group using the 'net group' command.
/
4525, TASK_VERIFY_SERVICE_USER_IS_ORA_DBA, "Windows user \"{0}\" is a member of Windows group \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4526, TASK_VERIFY_SERVICE_USER_IS_ORA_DBA_FAILED, "Failed to verify if Windows user \"{0}\" is a member of Windows group \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user is a member of specified windows group failed.
// *Action: Examine the accompanying error messages for details.
/
4527, TASK_VERIFY_SERVICE_USER_PERMISSION_DIR, "Verifying permissions on directory \"{1}\" for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4528, TASK_VERIFY_SERVICE_USER_PERMISSION_FILE, "Verifying permissions on file \"{1}\" for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4529, TASK_VERIFY_SERVICE_USER_PERMISSION_REGISTRY, "Verifying permissions on registry key \"{1}\" for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4530, TASK_VERIFY_SERVICE_USER_NO_VIRTUAL_ACCOUNT, "Windows virtual account was specified as the Oracle database home service user."
//  *Cause: An attempt was made to specify the Windows virtual account as 
//          Oracle home service user. This type of user is not supported for
//          a Real Application Cluster database home.
// *Action: Specify either the Windows user 'nt authority\\local system', 
//          Windows Group Managed Service Account (GMSA) user, or a Windows 
//          domain user without administrative privilege as the service user.
/
4531, TASK_VERIFY_SERVICE_USER_NO_PERMISSION_DIR, "Windows user \"{0}\" does not have permissions on directory \"{1}\" on nodes \"{2}\""
//  *Cause: The specified Windows user did not have permissions on directory specified on the nodes specified. 
// *Action: Grant full control to the directory specified to the Windows user specified on the nodes specified. Use Windows Explorer or a comparable mechanism to grant full control.
/
4532, TASK_VERIFY_SERVICE_USER_NO_PERMISSION_FILE, "Windows user \"{0}\" does not have permissions on file \"{1}\" on nodes \"{2}\""
//  *Cause: The specified Windows user did not have permissions on file specified on the nodes specified. 
// *Action: Grant full control to the file specified to the Windows user specified on the nodes specified. Use Windows Explorer or a comparable mechanism to grant full control.
/
4533, TASK_VERIFY_SERVICE_USER_NO_PERMISSION_REG, "Windows user \"{0}\" does not have permissions on Windows registry key \"{1}\" on nodes \"{2}\""
//  *Cause: The specified Windows user did not have permissions on Windows registry key specified on the nodes specified. 
// *Action: Grant full control to the Windows registry key specified to the Windows user specified on the nodes specified. Use Windows registry tool to grant permissions.
/
4534, TASK_VERIFY_SERVICE_USER_HAS_PERMISSION_DIR, "Windows user \"{0}\" has required permissions on directory \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4535, TASK_VERIFY_SERVICE_USER_HAS_PERMISSION_FILE, "Windows user \"{0}\" has required permissions on file \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4536, TASK_VERIFY_SERVICE_USER_HAS_PERMISSION_REG, "Windows user \"{0}\" has required permissions on Windows registry key \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4537, TASK_VERIFY_SERVICE_USER_CHECK_PERMISSION_DIR_FAILED, "Failed to verify Windows user \"{0}\" has permissions on directory \"{2}\" on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user has permissions on the directory specified on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
4538, TASK_VERIFY_SERVICE_USER_CHECK_PERMISSION_FILE_FAILED, "Failed to verify Windows user \"{0}\" has permissions on file \"{2}\" on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user has permissions on the file specified on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
4539, TASK_VERIFY_SERVICE_USER_CHECK_PERMISSION_REG_FAILED, "Failed to verify Windows user \"{0}\" has permissions on Windows registry key \"{2}\" on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user has permissions on the Windows registry key specified on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
4540, TASK_VERIFY_SERVICE_USER_CHECK_GMSA, "Checking Windows user \"{0}\" to ensure that the user is a Group Managed Service Account (GMSA) user on all nodes." 
// *Document: NO
//  *Cause:
// *Action:
/
4541, TASK_VERIFY_SERVICE_USER_IS_NOT_GMSA, "Windows user \"{0}\" is not a Group Managed Service Account (GMSA) user on nodes \"{1}\"."
//  *Cause: The specified Windows user was not a Group Managed Service Account 
//          (GMSA) user on the nodes specified.
// *Action: Make sure that the Windows user specified is a GMSA user on all 
//          nodes of the cluster.
/
4542, TASK_VERIFY_SERVICE_USER_IS_GMSA, "Windows user \"{0}\" is a Group Managed Service Account (GMSA) user on all cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
4543, TASK_VERIFY_SERVICE_USER_IS_GMSA_FAILED, "failed to verify Windows user \"{0}\" is a Global Managed Service Account (GMSA) user on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user is a Global
//          Managed Service Account (GMSA) user on the specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4544, TASK_VERIFY_SERVICE_USER_DOMAIN_SUBCHECK, "Windows user \"{0}\" is a domain user"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4545, TASK_VERIFY_SERVICE_USER_ADMIN_SUBCHECK, "Windows user \"{0}\" to ensure that the user is not an administrator"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4546, TASK_VERIFY_SERVICE_USER_VALID_SUBCHECK, "password is valid for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4547, TASK_VERIFY_SERVICE_USER_WALLET_SUBCHECK, "password for Windows user \"{0}\" stored in the OSUSER wallet"
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4548, TASK_VERIFY_SERVICE_USER_ORA_DBA_SUBCHECK, "Windows user \"{0}\" is a member of Windows group \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4549, TASK_VERIFY_SERVICE_USER_PERMISSION_DIR_SUBCHECK, "permissions on directory \"{1}\" for Windows user \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4550, TASK_ELEMENT_ASM_LISTENER_UPGRADE, "Verify that the upgrade is requested on the cluster node where ASM and the default listener are running"
// *Document: NO
//  *Cause:
// *Action:
/
4551, TASK_DESC_ASM_LISTENER_UPGRADE, "This is a prerequisite check to warn if the upgrade is requested from a node on which ASM and a default listener are not running"
// *Document: NO
//  *Cause:
// *Action:
/
4552, TASK_ASM_AND_LISTENER_CHK_UPG_PASSED, "ASM instance and default listener check for upgrade passed"
// *Document: NO
//  *Cause:
// *Action:
/
4553, TASK_ASM_AND_LISTENER_CHK_UPG_FAILED, "ASM instance and default listener check for upgrade failed"
// *Document: NO
//  *Cause:
// *Action:
/
4554, TASK_UPGRADE_ASM_INSTANCE_CHK_START, "Checking if an ASM instance, if configured is running on the node \"{0}\" on which upgrade is requested"
// *Document: NO
//  *Cause:
// *Action:
/
4555, TASK_UPGRADE_DEFAULT_LSTNR_CHK_START, "Checking if default listener, if configured is running on the node \"{0}\" on which upgrade is requested"
// *Document: NO
//  *Cause:
// *Action:
/
4556, TASK_UPGRADE_ASM_INSTANCE_RUNNING_LOCAL, "ASM instance was found to be configured and running on the node \"{0}\" on which upgrade is requested"
// *Document: NO
//  *Cause:
// *Action:
/
4557, TASK_UPGRADE_DEFAULT_LISTENER_RUNNING_LOCAL, "Default listener was found to be configured and running on the node \"{0}\" on which upgrade is requested"
// *Document: NO
//  *Cause:
// *Action:
/
4558, TASK_UPGRADE_ASM_INSTANCE_NOT_RUNNING_LOCAL, "ASM instance was found to be configured and running on nodes \"{0}\" and not running on the node \"{1}\" on which upgrade is requested"
//  *Cause: An ASM instance was found configured and running on the indicated nodes and not on the identified node on which upgrade was requested.
// *Action: Ensure that the upgrade is performed on one of the indicated nodes on which the ASM instance is currently configured and running.
/
4559, TASK_UPGRADE_ASM_INSTANCE_NOT_CONFIGURED, "ASM instance was not found configured on any of the cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
4560, TASK_UPGRADE_DEFAULT_LISTENER_NOT_RUNNING_LOCAL, "Default listener for node \"{0}\" was found configured and running on node \"{1}\""
//  *Cause: A default listener was found configured and running on the indicated node and not on the node on which the upgrade was requested.
// *Action: Ensure that the default listener, if configured, is running on the node on which the upgrade is being performed.
/
4561, TASK_UPGRADE_DEFAULT_LISTENER_NOT_CONFIGURED, "Default listener was not found configured on the node \"{0}\" on which upgrade is requested"
// *Document: NO
//  *Cause:
// *Action:
/
4562, TASK_UPGRADE_ASM_INSTANCE_FAILED, "Failed to determine the status of an ASM instance configuration. Error: {0}"
//  *Cause: Attempt to retrieve an information about the current configuration of an ASM instance failed with the indicated error.
// *Action: Ensure that the ASM instance, if configured, is correctly configured and an ASM instance is up and running on one of the cluster nodes.
/
4563, TASK_UPGRADE_DEFAULT_LISTENER_FAILED, "Failed to determine the status of default listener on the node \"{0}\" on which upgrade is requested. Error: {1}"
//  *Cause: Attempt to retrieve the status of the default listener on the node on which upgrade is requested failed with the indicated error.
// *Action: Ensure that the default listener, if configured, for the node on which upgrade is requested is correctly configured and is running from the node.
/
4564, TEMP_FILE_CREATION_ERROR, "File \"{0}\" could not be created" 
//  *Cause: ASM disk ownership, group, permission and size checks failed because
//          ASM discovery string processing was unable to create a temporary file.
// *Action: Ensure that there is at least 1GB space in the location where the 
//          file is being created. Ensure that the user executing the check 
//          has write permission at the specified location.
/
4565, TASK_UPGRADE_ASM_PARAMFILE_CHK_START, "Checking if ASM parameter file is in use by an ASM instance on the local node"
// *Document: NO
//  *Cause:
// *Action:
/
4566, TASK_UPGRADE_ASM_PARAMFILE_EXIST, "ASM instance is using parameter file \"{0}\" on node \"{1}\" on which upgrade is requested."
// *Document: NO
//  *Cause:
// *Action:
/
4567, TASK_UPGRADE_ASM_PARAMFILE_NOT_EXIST, "An ASM instance was found to be configured but the ASM parameter file used for this instance was not found on the node \"{0}\" on which upgrade is requested."
//  *Cause: An ASM parameter file for an ASM instance configured on the indicated
//          node was not found.  
// *Action: Ensure that the ASM instance is configured using an existing
//          ASM parameter file, SPFILE or PFILE, on the indicated node.
/
4568, TASK_UPGRADE_ASM_PARAMFILE_ABSENT, "An ASM instance was found to be configured but the ASM parameter file does not exist at location \"{0}\" on the node \"{1}\" on which upgrade is requested."
//  *Cause: The indicated ASM parameter file did not exist at the identified 
//          location. 
// *Action: Ensure that the ASM instance is configured and started using an 
//          existing ASM parameter file, SPFILE or PFILE on the indicated node.
//          If a new ASM parameter file is created, restart the ASM instance to 
//          use that ASM parameter file.
/
4569, TASK_ELEMENT_ASM_PARAM_FILE_UPGRADE, "Verify that the ASM instance was configured using an existing ASM parameter file."
// *Document: NO
//  *Cause:
// *Action:
/
4570, TASK_DESC_ASM_PARAM_FILE_UPGRADE, "This is a prerequisite check to verify that the ASM instance is configured using an existing ASM parameter file."
// *Document: NO
//  *Cause:
// *Action:
/
4571, TASK_UPGRADE_ASM_PARAMFILE_ON_ASM, "Parameter file \"{0}\" for ASM instance is on an ASM disk group."
// *Document: NO
//  *Cause:
// *Action:
/
4572, TASK_UPGRADE_ASM_PARAMFILE_NOT_ON_ASM, "Parameter file \"{0}\" for ASM instance is not on an ASM disk group."
//  *Cause: The indicated parameter file was not on an ASM disk group.
// *Action: Ensure that the indicated parameter file is on an ASM disk group.
/
4573, TASK_UPGRADE_ASM_PWDFILE_CHK_START, "Checking if password file for ASM instance is on an ASM disk group"
// *Document: NO
//  *Cause:
// *Action:
/
4574, TASK_UPGRADE_ASM_PWDFILE_NOT_ON_ASM, "Password file \"{0}\" for ASM instance is not on an ASM disk group."
//  *Cause: The indicated password file was not on an ASM disk group.
// *Action: Ensure that the indicated password file is on an ASM disk group
//          using the command "orapwd input_file='<existing password file path>'
//          file='<destination ASM file path>' asm=y force=y".
/
4575, TASK_UPGRADE_ASM_PWDFILE_ON_ASM, "Password file \"{0}\" for ASM instance is on an ASM disk group."
// *Document: NO
//  *Cause:
// *Action:
/
4576, TASK_UPGRADE_ASM_PWFILE_NOT_FOUND, "ASM password file \"{0}\" does not exist on nodes \"{1}\"."
//  *Cause: An attempt to upgrade Oracle Grid Infrastructure failed because the 
//          indicated ASM password file was not present on indicated nodes.
// *Action: Ensure that the ASM password file exists at the specified 
//          location and retry the upgrade. Refer to the Oracle ASM
//          documentation to create ASM password file or modify the
//          location of an existing ASM password file. 
/
4585, TASK_UPGRADE_RETRIEVE_ASM_SPFILE_FAILED, "failed to retrieve the ASM parameter file location on the node \"{0}\""
//  *Cause: A CVU pre-upgrade check could not be completed because an attempt 
//          to query the currently running ASM instance on the indicated node 
//          to obtain the location of its parameter file failed. The 
//          accompanying error messages provide detailed failure information.
// *Action: Ensure that the ASM instance is configured and started using an 
//          existing ASM parameter file, SPFILE or PFILE on the indicated node.
//          Examine the accompanying error messages and correct the problem 
//          indicated.
/
4600, TASK_NODEAPP_AUTO_NO_VIP, "Nodes \"{0}\" do not have VIPs configured"
//  *Cause: An attempt to verify if the specified nodes that are configured as 'auto'
//          and are currently Leaf nodes but can become Hub nodes have Virtual
//          Internet Protocol (VIP) addresses configured failed because no IP
//          addresses were assigned for the node VIPs.
// *Action: Ensure that the nodes specified have node VIPs that are configured
//          but not in use.
/
4601, TASK_NODEAPP_AUTO_UP_VIP, "Node VIPs for nodes \"{0}\" are active"
//  *Cause: An attempt to verify if the specified nodes that are configured as 'auto'
//          and are currently Leaf nodes but can become Hub nodes have Virtual
//          Internet Protocol (VIP) addresses that are not active failed because
//          the VIPs for the specified nodes were active.
// *Action: Ensure that the node VIPs for the nodes specified have VIP's that
//          are not active.
/
4602, TASK_NODEAPP_AUTO_NODE_VIP_CHECK, "Checking if node VIPs are configured for 'auto' nodes capable of becoming 'hub' nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4603, TASK_NODEAPP_AUTO_NODE_VIP_CHECK_SUCCESS, "All 'auto' nodes capable of becoming 'hub' nodes have node VIPs configured and the VIP is not active"
// *Document: NO
//  *Cause:
// *Action:
/
4610, TASK_NODEAPP_NO_VIP, "Nodes \"{0}\" do not have VIPs configured"
//  *Cause: It was found that  specified hub nodes do not have node VIPS configured.
// *Action: Ensure that the nodes specified have node VIPs that are configured but not in use.
/
4611, TASK_NODEAPP_UP_VIP, "Node VIPs for nodes \"{0}\" are active"
//  *Cause: The VIPs for the specified hub nodes were found to be reachable.
// *Action: Ensure that the node VIPs for the nodes specified have VIP's that are not reachable using ping.
/
4612, TASK_NODEAPP_NODE_VIP_CHECK, "Checking if node VIPs are configured for 'hub' nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
4613, TASK_NODEAPP_NODE_VIP_CHECK_SUCCESS, "All hub nodes have node VIPs configured and the VIP is not active"
// *Document: NO
//  *Cause:
// *Action:
/
4650, TASK_ELEMENT_ASM_DEFAULT_STR, "Verify that default ASM disk discovery string is used"
// *Document: NO
//  *Cause:
// *Action:
/
4651, TASK_DESC_ASM_DEFAULT_STR, "This is a prerequisite check to warn users that permission must be granted to devices so that all ASM devices visible with the pre-Version 12 default discovery string \"{0}\" are visible with the Version 12 default string \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
4652, TASK_ASM_DFLTSTR_START, "Checking if default discovery string is being used by ASM"
// *Document: NO
//  *Cause:
// *Action:
/
4653, TASK_ASM_DFLTSTR_SUCCESS, "ASM discovery string \"{0}\" is not the default discovery string"
// *Document: NO
//  *Cause:
// *Action:
/
4654, TASK_ASM_DFLTSTR_DISC_STRING_NOT_SAME, "Disk discovery string mismatch between ASM instance and GPnP profile. GPnP profile: \"{0}\", ASM Instance: \"{1}\"."
//  *Cause: Disk discovery strings in the ASM instance and GPnP profile were different.
// *Action: Use the command 'asmcmd dsset' to set the ASM discovery string to the correct value in both places.
/
4655, TASK_ASM_DFLTSTR_DISC_ERR, "The command \"{0}\" to retrieve ASM discovery string failed"
//  *Cause: The specified command executed to retrieve ASM discovery string failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
4656, TASK_ASM_DFLTSTR_LSDSK_FAILED, "The command \"{0}\" to obtain the list of ASM disks failed"
//  *Cause: The specified command executed to retrieve list of ASM disks failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
4657, TASK_ASM_DFLTSTR_PERMISSION_FAILED, "The permissions for block devices \"{0}\" are incorrect on node \"{1}\" [Expected = {2} octal, Actual = {3}]"
//  *Cause: The permissions of the indicated block devices were incorrect on the
//          specified node.
//          Starting in 12g the default ASM disk discovery string was changed 
//          from '/dev/raw/raw*' to '/dev/sd*'. The disks corresponding to the 
//          block device files in the message were members of ASM disk groups 
//          and were accessed using the raw devices (matched by '/dev/raw/raw*' 
//          prior to 12g) with the correct permissions.  However, the block 
//          devices in the message corresponding to the same disks and found 
//          with '/dev/sd*' do not have the correct permissions.
//          To ensure continued working of ASM, all disks that were members of 
//          disk groups must continue to be members.
// *Action: Make sure that the permissions for the specified block devices 
//          matches the expected value (this will be necessary in the long run
//          because raw devices are being deprecated). Alternatively set the 
//          string '/dev/raw/raw*' as the disk discovery path using command 
//          'asmcmd dsset --normal <discovery string>' in ASM 11.2 or later, 
//          using command 'alter system set asm_diskstring=<discovery string> 
//          scope=spfile;' in 11.1 or earlier ASM.
/
4658, TASK_ASM_DFLTSTR_LSDSK_NOT_SYSTEM, "The check for default ASM discovery string required for clusterware upgrade was successful"
// *Document: NO
//  *Cause:
// *Action:
/
4659, TASK_ASM_DFLTSTR_RAW_DISK, "Raw device"
// *Document: NO
//  *Cause:
// *Action:
/
4660, TASK_ASM_DFLTSTR_BLOCK_DISK, "Block device"
// *Document: NO
//  *Cause:
// *Action:
/
4661, TASK_ASM_DFLTSTR_BLOCK_DEVICE_PERMISSION, "Permission"
// *Document: NO
//  *Cause:
// *Action:
/
4662, TASK_ASM_DFLTSTR_BLOCK_DEVICE_OWNER, "Owner"
// *Document: NO
//  *Cause:
// *Action:
/
4663, TASK_ASM_DFLTSTR_BLOCK_DEVICE_GROUP, "Group"
// *Document: NO
//  *Cause:
// *Action:
/
4664, TASK_ASM_DFLTSTR_EXCEPTION, "Failed to obtain block device corresponding to raw disk \"{0}\" on node \"{1}\""
//  *Cause: An attempt to obtain block device corresponding to specified raw 
//          disk failed on node specified.
//          Starting in 12g the default ASM disk discovery string was changed 
//          from '/dev/raw/raw*' to '/dev/sd*'. The specified disks were 
//          picked up by using the old default disk discovery string 
//          '/dev/raw/raw*'. 
//          To ensure continued working of ASM, all disks that were members of 
//          disks groups must continue to be members.
// *Action: Look at the accompanying error message and respond accordingly.
/
4665, TASK_ASM_DFLTSTR_OWNER_FAILED, "The owner for block devices \"{0}\" are incorrect on node \"{1}\" [Expected = {2}, Actual = {3}]"
//  *Cause: The owner of the block device on the node specified were incorrect.
//          Starting in 12g the default ASM disk discovery string was changed 
//          from '/dev/raw/raw*' to '/dev/sd*'. The disks corresponding to the 
//          block device files in the message were members of ASM disk groups 
//          and were accessed using the raw devices (matched by '/dev/raw/raw*' 
//          prior to 12g) with the correct ownership.  However, the block 
//          devices in the message corresponding to the same disks and found 
//          with '/dev/sd*' do not have the correct ownership.
//          To ensure continued working of ASM, all disks that were members of 
//          disk groups must continue to be members.
// *Action: Make sure that the owner of the specified block devices matches 
//          the expected value (this will be necessary in the long run
//          because raw devices are being deprecated). Alternatively set the 
//          string '/dev/raw/raw*' as the disk discovery path using command 
//          'asmcmd dsset --normal <discovery string>' in ASM 11.2 or later, 
//          using command 'alter system set asm_diskstring=<discovery string> 
//          scope=spfile;' in 11.1 or earlier ASM.
/
4666, TASK_ASM_DFLTSTR_GROUP_FAILED, "The group for block devices \"{0}\" are incorrect on node \"{1}\" [Expected = {2}, Actual = {3}]"
//  *Cause: The group ownership of the block devices on the node specified were 
//          incorrect.
//          Starting in 12g the default ASM disk discovery string was changed 
//          from '/dev/raw/raw*' to '/dev/sd*'. The disks corresponding to the 
//          block device files in the message were members of ASM disk groups 
//          and were accessed using the raw devices (matched by '/dev/raw/raw*' 
//          prior to 12g) with the correct group ownership.  However, the block 
//          devices in the message corresponding to the same disks and found 
//          with '/dev/sd*' do not have the correct group ownership.
//          To ensure continued working of ASM, all disks that were members of 
//          disk groups must continue to be members.
// *Action: Make sure that the group of the specified block devices matches
//          the expected value (this will be necessary in the long run
//          because raw devices are being deprecated). Alternatively set the 
//          string '/dev/raw/raw*' as the disk discovery path using command 
//          'asmcmd dsset --normal <discovery string>' in ASM 11.2 or later, 
//          using command 'alter system set asm_diskstring=<discovery string> 
//          scope=spfile;' in 11.1 or earlier ASM.
/
4667, TASK_ASM_DFLTSTR_PASSED, "Owner, group and permission check of ASM disks successful"
// *Document: NO
//  *Cause:
// *Action:
/
4668, TASK_ASM_DFLTSTR_USED, "ASM disks are selected using default discovery string \"{0}\". Checking owner, group and permissions of block devices corresponding to ASM disks."
// *Document: NO
//  *Cause:
// *Action:
/
4669, ASM_INFO_EMPTY, "Could not determine ASM disk discovery string on node \"{0}\""
//  *Cause: ASM disk ownership, group, permission and size checks failed because 
//          the ASM discovery string could not be determined.
// *Action: Examine the accompanying error messages and correct the problem indicated.
/
4670, ERROR_READING_SPOOL_FILE, "File \"{0}\" could not be read"
//  *Cause: An error occurred while reading the specified file  while trying to
//          determine whether default ASM discovery string was being used.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
4671, TASK_ASM_DFLTSTR_DISCOVER_DISKS_FAILED, "Failed to match the block device \"{0}\" with the new default discovery string"
//  *Cause: The specified block device could not be discovered with the new 
//          default discovery string. 
//          Starting in 12g the default ASM disk discovery string was changed 
//          from '/dev/raw/raw*' to '/dev/sd*'. To ensure proper upgrade of 
//          ASM, all disks that were member disks of diskgroups prior to 
//          upgrade must continue to be discovered as member disks after 
//          upgrade. 
// *Action: Make sure that the specified devices are discoverable using the 
//          new default discovery string (this will be necessary in the long 
//          run because raw devices are being deprecated). Alternatively set 
//          the disk discovery path to '/dev/raw/raw*' using the command 
//          'asmcmd dsset --normal <discovery string>' in ASM 11.2 or later.
//          If SPFILE is in use for 11.1 or earlier ASM, then use the command 
//          'ALTER SYSTEM SET ASM_DISKSTRING=<discovery string> SCOPE=SPFILE;'.
//          Otherwise, update the value of parameter ASM_DISKSTRING in the 
//          PFILE of each ASM instance.
/
4672, TASK_ASM_MISSIZED_DISKS_DFLTSTR_ERR, "failed to retrieve ASM discovery string information while checking ASM disk size consistency"
//  *Cause: An attempt to obtain ASM discovery string information failed.
// *Action: Examine the accompanying error message for details.
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
4673, TASK_ELEMENT_ASM_DEFAULT_STRING, "that default ASM disk discovery string is in use"
// *Document: NO
//  *Cause:
// *Action:
/
5011, TASK_SOFT_ATTRIBUTES_MISMATCHED_ACRSS_NODES, "\"{0}\" did not match across nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5012, TASK_SOFT_ATTRIBUTES_MISMATCHED_REFERENCE, "\"{0}\" did not match reference"
// *Document: NO
//  *Cause:
// *Action:
/
5013, TASK_SOFTWARE_UNABLE_TO_GET_DATABASE_CONFIG, "Unable to retrieve database configuration for home \"{0}\". Proceeding without the database configuration information."
// *Document: NO
//  *Cause:
// *Action:
/
5317, CRS_RELEASE_VERSION_CHECK, "The Clusterware is currently being upgraded to version: \"{0}\".\n The following nodes have not been upgraded and are\n running Clusterware version: \"{1}\".\n    \"{2}\""
//  *Cause: The CRS integrity may have discovered that your Oracle Clusterware is partially upgraded.
// *Action: Review warnings and make modifications as necessary. If the warning is due to partial upgrade of Oracle Clusterware stack then continue with upgrade and finish it.
/
5150, TASK_ASMDEVCHECK_NONODES, "could not determine if path {0} is a valid path on all nodes"
//  *Cause: Checking for shared devices could not be executed because the
//          indicated path could not be validated for all nodes. Validation
//          was not possible because the device referenced by the path could
//          not be identified. On Linux systems this can occur if the file
//          /etc/multipath.conf is not readable by the requesting user.
// *Action: Ensure that the path exists on all of the nodes participating in
//          the operation. On Linux systems, ensure that the user has read
//          access to '/etc/multipath.conf'.
/
5500, FAILED_GET_DISK_INFO_FOR_PATH, "Failed to retrieve the disk information for path \"{0}\""
//  *Cause: Could not retrieve the disk information for the specified path on all nodes.
// *Action: Ensure that the path specified is an existing path and current user has access permission for this path on all nodes.
/
5501, FAILED_GET_DISK_INFO_FOR_PATH_NODE, "Failed to retrieve the disk information for path \"{0}\" on node \"{1}\""
//  *Cause: Could not retrieve the disk information for the specified path on identified node.
// *Action: Ensure that the path specified is an existing path and current user has access permission for this path on identified node.
/
5719, DHCP_NETWORK_RES_CHECK, "Checking if network CRS resource is configured and online"
// *Document: NO
//  *Cause:
// *Action:
/
5720, DHCP_NETWORK_RES_ONLINE, "Network CRS resource is configured and online"
// *Document: NO
//  *Cause:
// *Action:
/
5721, DHCP_NETWORK_RES_OFFLINE, "Network CRS resource is offline or not configured. Proceeding with DHCP checks."
// *Document: NO
//  *Cause:
// *Action:
/
5722, DHCP_NETWORK_RES_USR_ORA_AUTO_CHECK, "Checking if network CRS resource is configured to obtain DHCP IP addresses"
// *Document: NO
//  *Cause:
// *Action:
/
5723, TASK_DHCP_NETWORK_RUNNING, "Network CRS resource is configured to use DHCP provided IP addresses"
//  *Cause: The network Cluster Ready Services (CRS) resource that was
//          configured to request the Dynamic Host Configuration Protocol (DHCP)
//          server for IP addresses was online. DHCP server check must not be 
//          performed while the network CRS resource configured to use the DHCP
//          provided IP address is online.
// *Action: No action is required.
/
5724, NETWORK_RES_NOT_DHCP, "Network CRS resource does not use DHCP provided IP addresses. Proceeding with DHCP checks."
// *Document: NO
//  *Cause:
// *Action:
/
5725, TCP_CON_EXIT_FAIL, "The TCP server process with PID \"{0}\" on node \"{1}\" failed to exit normally"
//  *Cause: The TCP server process with the PID specified, running on the node indicated, failed to exit normally. 
// *Action: Use OS commands to terminate the TCP server process with the indicated PID.
/
5726, TASK_DHCP_NO_SERVER, "Failed to discover DHCP servers on public network listening on port \"{0}\" using command \"{1}\""
//  *Cause: An attempt to use the indicated command to discover Dynamic Host
//          Configuration Protocol (DHCP) servers listening on the public
//          network on the indicated port failed.
// *Action: Contact the network administrator to ensure that the DHCP servers
//          exist on the network. If the DHCP servers are listening on a
//          different port, then retry the command specifying the alternate port
//          using the -port option. If the DHCP has a slow response, then use
//          the CV_MAX_RETRIES_DHCP_DISCOVERY property in the cvu_config file so
//          that the Cluster Verification Utility (CVU) performs a certain
//          number of retries. The default number of retries performed is 5.
/
5727, TASK_DHCP_CLIENTID_FAIL, "Command \"{0}\" to generate DHCP client ID failed"
//  *Cause: An attempt to generate client ID using specified command required for 'crsctl discover dhcp', 'crsctl request dhcp' and 'crsctl release dhcp' commands failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
5728, DHCP_NODEVIP_BIG_CLUSTER_PASSED, "DHCP servers on public network can provide VIP's for all 'hub' capable 'auto' nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5729, TASK_DHCP_NODEVIP_BC_CHECK, "Checking if DHCP servers on public network listening on port \"{0}\" can provide node VIP's for 'auto' nodes capable of becoming 'hub'"
// *Document: NO
//  *Cause:
// *Action:
/
5730, DHCP_NODEVIP_BIG_CLUSTER_FAILED, "DHCP servers on public network listening on port \"{0}\" could not provide an IP address for node VIP on node \"{1}\""
//  *Cause: An attempt to verify if DHCP servers respond to DHCP discover packets
//          sent on the specified port for specified node's node VIP failed, as no
//          response was received.
// *Action: Contact the network administrator to make sure that DHCP servers exist
//          on the network. If the DHCP servers are listening to a different port
//          then specify it by using -port option. Make sure that DHCP servers can
//          provide VIPs for all nodes in the cluster that can start as a 'hub' node.
/
5731, DHCP_NODEVIP_BIG_CLUSTER_SUBNET_FAILED, "DHCP servers on network \"{2}\" listening on port \"{0}\" could not provide an IP address for node VIP on node \"{1}\""
//  *Cause: An attempt to verify if DHCP servers respond to DHCP discover packets
//          sent on the specified network and port for specified node's node VIP 
//          failed, as no response was received.
// *Action: Contact the network administrator to make sure that DHCP servers exist 
//          on the network specified. If the DHCP servers are listening to a different
//          port then specify it by using -port option. Make sure that DHCP servers can
//          provide VIPs for all nodes in the cluster that can start as a 'hub' node.
/
5732, DHCP_EXISTANCE_CHECK_SUBNET_FAILED, "No DHCP server were discovered on the network \"{1}\" listening on port {0}"
//  *Cause: No reply was received for the DHCP discover packets sent on the 
//          specified network and port.
// *Action: Contact the network administrator to make sure that DHCP servers 
//          exist on the network. If the DHCP servers are listening to a 
//          different port then specify it by using -port option.
/
5733, TASK_DHCP_NO_SERVER_SUBNET, "Failed to discover DHCP servers on network \"{2}\" listening on port \"{0}\" using command \"{1}\""
//  *Cause: An attempt to use the indicated command to discover Dynamic Host
//          Configuration Protocol (DHCP) servers listening on the indicated
//          network on the indicated port failed.
// *Action: Contact the network administrator to ensure that the DHCP servers
//          exist on the network. If the DHCP servers are listening on a
//          different port, then retry the command specifying the alternate port
//          using the -port option. If the DHCP has a slow response, then use
//          the CV_MAX_RETRIES_DHCP_DISCOVERY property in the cvu_config file so
//          that the Cluster Verification Utility (CVU) performs a certain
//          number of retries. The default number of retries performed is 5.
/
5734, DHCP_NODEVIP_BIG_CLUSTER_SUBNET_PASSED, "DHCP servers on network \"{0}\" can provide VIP's for all 'hub' capable 'auto' nodes"
// *Document: NO
//  *Cause:
// *Action:
/
5735, TASK_DHCP_NODEVIP_BC_SUBNET_CHECK, "Checking if DHCP servers on network \"{1}\" listening on port \"{0}\" can provide node VIP's for 'auto' nodes capable of becoming 'hub'"
// *Document: NO
//  *Cause:
// *Action:
/
5736, TASK_DHCP_CRSCTL_ERR, "The \"{0}\" command returned error \"{1}\""
//  *Cause: An attempt to discover DHCP servers using specified command failed. 
//          The command returned error specified.
// *Action: Since CVU is operating not operating from a clusterware home it does
//          not have access to all error messages. Look at the Oracle database
//          error messages manual for the exact error message and act accordingly.
/
5737, TASK_DHCP_FILE_COPY_FAILED, "The file \"{0}\" could not be copied to \"{1}\" on local node."
//  *Cause: While attempting to discover Dynamic Host Configuration Protocol
//          (DHCP) servers, the indicated source file could not be copied to
//          the indicated destination file on the local node. Details are
//          provided by the accompanying messages.
// *Action: Examine the accompanying messages and respond accordingly.
/
5738, DHCP_TIMEOUT_DISCOVER, "The time to discover a DHCP server in the network, exceeded {0} seconds."
//  *Cause: The pre-installation CVU verification of Dynamic Host Configuration
//          Protocol (DHCP) service for the specified network failed to discover
//          a DHCP server within the indicated time.
// *Action: This check is network load sensitive and can yield different results
//          at different times. Ensure that the DHCP server and the network are
//          not overloaded and retry the check.
/
5739, DHCP_IP_SUFFICIENCY, "IP address availability"
// *Document: NO
//  *Cause:
// *Action:
/
5740, SIHA_ENV_INVALID, "Oracle Restart installed, requested check is not valid in this environment"
//  *Cause: A check invalid for the Oracle Restart environment was attempted.
// *Action: Check the documentation and use a valid command for this environment.
/
5741, SIHA_ENV_PREDBINST_NODELIST_INVALID, "Oracle Restart installed, multiple nodes not valid in this environment"
//  *Cause: Multiple nodes were specified as part of the nodelist in an Oracle Restart configuration.
// *Action: Specify the node on which Oracle Restart has been configured.
/
5742, DHCP_RESPONSE_TIME, "DHCP response time"
// *Document: NO
//  *Cause:
// *Action:
/
5745, CRS_ENV_CHECK_INVALID, "CRS Configuration detected, Restart configuration check not valid in this environment"
//  *Cause: A check valid for the Oracle Restart configuration was attempted in a multi-node cluster environment.
// *Action: Try a valid check for a multi-node cluster environment.
/
5800, TASK_DNS_LOOK_AT_SERVER_OUTPUT, "Check output of command \"cluvfy comp dns -server\" to see if it received IP address lookup for name \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
5801, TASK_DNS_SERVER_RECIEVED_QUERY, "Received IP address lookup query for name \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
5802, TASK_DNS_ODNSD_SERVER_CHECK, "Checking if test DNS server is running on IP address \"{0}\", listening on port {1}"
// *Document: NO
//  *Cause:
// *Action:
/
5803, TASK_DNS_ODNSD_SERVER_SUCCESS, "Successfully connected to test DNS server"
// *Document: NO
//  *Cause:
// *Action:
/
5804, TASK_DNS_COUNT_RECEIVED_QUERIES, "The DNS server has received a total of \"{0}\" successful queries"
// *Document: NO
//  *Cause:
// *Action:
/
5805, TASK_DNS_WAITING_REQUEST, "Waiting for DNS client requests..."
// *Document: NO
//  *Cause:
// *Action:
/
5818, TASK_DNS_GNSD_RUNNING, "GNS resource is configured to listen on virtual IP address \"{0}\" for domain \"{1}\""
//  *Cause: An attempt was made to run 'cluvfy comp dns' command against GNS resource configured to listen to specified domain at specified GNS-VIP while it was online.
// *Action: If GNS needs to be verified use 'cluvfy comp gns' command. If DNS setup needs to be checked then stop the GNS resource and start 'cluvfy comp dns -server'.
/
5819, HOST_VIP_ALREADY_USED, "VIP address \"{0}\" is already in use"
//  *Cause: The identified VIP address was found to be active on the public network.
// *Action: Specify a VIP address that is not in use.
/
5820, HOST_NAME_UNKNOWN, "Failed to retrieve IP address of host \"{0}\""
//  *Cause: An attempt to retrieve an IP address for the indicated host failed.
// *Action: Run 'nslookup' on the host name and make sure the name is resolved.
/
// Translator: do not translate 'root'
5821, TASK_DNS_NO_ROOT_USER, "The subdomain delegation check was not performed as part of GNS check because it needs 'root' user privileges."
//  *Cause: A Grid Naming Service (GNS) configuration with subdomain was found
//          and the privilege delegation user and password were not provided.
// *Action: Retry specifying the privilege delegation user and password.
/
5822, TASK_DNS_QUERY_FAILED_API, "Name lookup for FQDN \"{0}\" failed with test DNS server running at address \"{1}\" and listening on port {2}."
//  *Cause: An attempt to query the indicated Fully Qualified Domain Name (FQDN)
//          on the test domain name server (DNS) running at the indicated
//          address and port failed.
// *Action: Ensure that the indicated address is correct.
/ 
5823, TASK_DNS_GNSDOMAIN_LOOKUP_FAILED_API, "Name lookup for FQDN \"{0}\" failed."
//  *Cause: An attempt to query the indicated domain name server (DNS) for the
//          indicated Fully Qualified Domain Name (FQDN) failed.
// *Action: Ensure that Grid Naming Service (GNS) subdomain delegation is set up
//          correctly in the DNS.
/
5824, TASK_DNS_GNSD_RUNNING_NFWD, "GNS resource is configured to listen on virtual IP address \"{0}\" without a forwarded domain."
//  *Cause: An attempt was made to run the 'cluvfy comp dns' command against the
//          Grid Naming Service (GNS) VIP configured at the indicated GNS-VIP
//          while it was online.
// *Action: If GNS needs to be verified, use the 'cluvfy comp gns' command. If
//          the domain name server (DNS) setup needs to be checked, then stop
//          the GNS resource and start 'cluvfy comp dns'.
/
5825, TASK_DNS_GNSDOMAIN_FAILED_API, "Subdomain delegation verification for the subdomain \"{0}\" failed."
//  *Cause: An attempt to verify subdomain delegation for the indicated
//          subdomain failed.
// *Action: Ensure that Grid Naming Service (GNS) subdomain delegation is set up
//          correctly in the DNS and retry the operation.
/ 
5830, TASK_VIP_SUBNET_CHECK_PUBLIC_SUBNET_NO_VIP, "None of the currently configured VIP addresses belong to the public subnet \"{0}\" on the network interface \"{1}\" of the node \"{2}\"."
//  *Cause: No VIP addresses were found on the indicated public subnet on the identified node.
// *Action: Ensure that the indicated public subnet has at least one VIP address configured on it or deconfigure the public subnet. 
/
5831, TASK_VIP_SUBNET_CHECK_PUBLIC_SUBNET_SINGLE_ACTIVE_VIP, "Public subnet \"{0}\" has no public IP address except active VIP addresses \"{1}\" on the node \"{2}\"."
//  *Cause: The identified public subnet did not have any additional IP address other than the configured VIP addresses active on the node.
// *Action: Ensure that the indicated public subnet has at least one active public IP in addition to the identified VIP address. 
/
5832, TASK_VIP_SUBNET_MISMATCH_PUBLIC_SUBNET, "The subnets of VIPs \"{0}\" do not match the subnet \"{1}\" associated with their corresponding public network."
//  *Cause: The Cluster Verification Utility (CVU) determined that the 
//          addresses of the indicated VIPs were not on the indicated subnet,  
//          which is the subnet of their associated public network interface.
// *Action: Ensure that all the VIPs associated with each network that 
//          have addresses on the subnet associated with that network.
/
5834, FAIL_GET_NETWORK_RESOURCE_VIP_USING_SRVCTL_CMD, "Failed to retrieve the configured VIP address information for network resource on each of the cluster nodes."
//  *Cause: An attempt to retrieve the configured node VIP address information failed.
// *Action: Ensure that the clusterware is up and running and also examine the accompanying messages and respond accordingly. 
/
5835, FAIL_TO_RUN_SRVCTL_CMD, "failed to run srvctl command"
//  *Cause: An attempt to run srvctl command to get the network information 
//          failed. Specific details of the failure are included in the
//          accompanying error messages.
// *Action: Ensure that the clusterware is up and running, examine the 
//          accompanying messages and respond accordingly. 
/
5836, FAIL_GET_PUBLIC_NETWORK_LIST_USING_SRVCTL_CMD, "failed to retrieve the configured public network list information for the cluster"
//  *Cause: An attempt to retrieve the configured public network information 
//          failed. Specific details of the failure are included in the
//          accompanying error messages.
// *Action: Ensure that the clusterware is up and running, examine the 
//          accompanying messages and respond accordingly. 
/
5900, TASK_ELEMENT_FIREWALL, "Windows firewall status"
// *Document: NO
//  *Cause:
// *Action:
/
5901, TASK_DESC_FIREWALL, "This is a prerequisite check to verify that Windows firewall on Windows operating system is disabled."
// *Document: NO
//  *Cause:
// *Action:
/
5902, TASK_FIREWALL_CHECK_START_NT, "Checking the status of Windows firewall"
// *Document: NO
//  *Cause:
// *Action:
/
5903, TASK_FIREWALL_CHECK_PASSED_NT, "Windows firewall verification check passed"
// *Document: NO
//  *Cause:
// *Action:
/
5904, TASK_FIREWALL_CHECK_FAILED_NT, "Windows firewall status check failed"
// *Document: NO
//  *Cause:
// *Action:
/
5905, IMPROPER_FIREWALL_SETTING, "Windows firewall is enabled on nodes: "
//  *Cause: Windows firewall status was found to be enabled.
// *Action: To disable Windows firewall, on Windows 2003 or earlier run 'netsh firewall set opmode DISABLE';
//          on Windows 2008 or later run 'netsh advfirewall set allprofiles state off' 
//          at command prompt as an administrator on all the indicated nodes.
/
5906, IMPROPER_FIREWALL_SETTING_NODE, "Windows firewall is enabled on the node \"{0}\" "
//  *Cause: Windows firewall status was found to be enabled.
// *Action: To disable Windows firewall, on Windows 2003 or earlier run 'netsh firewall set opmode DISABLE';
//          on Windows 2008 or later run 'netsh advfirewall set allprofiles state off' 
//          at command prompt as an administrator on the indicated node.
/
5907, ERR_CHECK_FIREWALL, "Windows firewall status check cannot be performed on nodes: "
//  *Cause: An attempt to determine the status of Windows firewall failed.
// *Action: Ensure that the access permissions for the Oracle user allow access to the Windows Registry and the
//          registry has the REG_DWORD entry named 'EnableFirewall' with value 0 under 'HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile' and 
//          'HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\DomainProfile' sub-keys on the node.
//          It is recommended to back up the Windows Registry before proceeding with any changes.
//          Restart your system to make your changes effective.
/
5908, ERR_CHECK_FIREWALL_NODE, "Windows firewall status check cannot be performed on node \"{0}\" "
//  *Cause: An attempt to determine the status of Windows firewall failed.
// *Action: Ensure that the access permissions for the Oracle user allow access to the Windows Registry and the
//          registry has the REG_DWORD entry named 'EnableFirewall' with value 0 under 'HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\StandardProfile' and
//          'HKEY_LOCAL_MACHINE\\System\\CurrentControlSet\\Services\\SharedAccess\\Parameters\\FirewallPolicy\\DomainProfile' sub-key on the node.
//          It is recommended to back up the Windows Registry before proceeding with any changes.
//          Restart your system to make your changes effective.
/
5909, ERR_READ_FIREWALL_REGISTRY_NODE, "Error reading key \"{0}\" from Windows Registry on node \"{1}\""
//  *Cause: Specified Windows Registry key could not be read.
// *Action: Ensure that the specified key exists in Windows Registry and access permissions for the Oracle user allow access to the Windows Registry.
/
5910, ERR_READ_FIREWALL_REGISTRY_VALUE_NODE, "Error reading value 'EnableFirewall' under key \"{0}\" for Windows firewall status on node \"{1}\""
//  *Cause: Could not read Windows Registry value 'EnableFirewall' under specified key.
// *Action: Ensure that the access permissions for the Oracle user allow access to the Windows Registry and the Registry value 'EnableFirewall' under 
//          specified key is present on the node.
/
6000, OCR_RAW_UNSUPPORTED, "OCR \"{0}\" is on raw or block device storage"
//  *Cause: An attempt was made to add OCR storage on a raw or block device.
// *Action: Choose a different location for storing OCR.
/
6001, RIM_NODES_STACK_NOT_RUNNING, "The following Leaf nodes do not have Oracle Clusterware stack running on them and will not be checked:"
// *Document: NO
//  *Cause:
// *Action:
/
6002, OCR_BACKUP_LOC_START, "Checking OCR backup location \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6003, OCR_BACKUP_LOC_PASS, "OCR backup location \"{0}\" check passed"
// *Document: NO
//  *Cause:
// *Action:
/
6004, OCR_BACKUP_LOC_FAIL, "OCR backup location \"{0}\" check failed"
// *Document: NO
//  *Cause:
// *Action:
/
6005, OCR_BACKUP_SIZE_COULD_NOT_BE_DETERMINED, "Size of the OCR backup location \"{0}\" could not be determined"
// *Document: NO
//  *Cause:
// *Action:
/
6006, OCR_BACKUP_SIZE_CHECK_START, "Checking size of the OCR backup location \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6007, OCR_BACKUP_SIZE_NOT_SUFFICIENT, "The OCR backup location \"{0}\" does not have enough space. [Expected=\"{1}\" ; Found=\"{2}\"]"
//  *Cause: Size of the OCR backup location was found to be insufficient.
// *Action: Increase the size of the OCR backup location or move the OCR backup to a location with sufficient space.
/
6008, OCR_BACKUP_SIZE_CHECK_FAILED, "Size check for OCR backup location \"{0}\" failed."
// *Document: NO
//  *Cause:
// *Action:
/
6009, OCR_BACKUP_LOC_CHECK_OCR_ON_ASM, "The OCR backup location \"{0}\" is managed by ASM."
// *Document: NO
//  *Cause:
// *Action:
/
6010, OCR_DUMP_START, "Checking OCR dump functionality"
// *Document: NO
//  *Cause:
// *Action:
/
6011, OCR_DUMP_PASS, "OCR dump check passed"
// *Document: NO
//  *Cause:
// *Action:
/
6012, OCR_DUMP_FAIL, "OCR dump check failed"
// *Document: NO
//  *Cause:
// *Action:
/
6013, OCR_DUMP_NODE_FAIL, "Failed to retrieve CRS active version from OCR dump on node \"{0}\""
//  *Cause: An attempt to query the CRS active version key from OCR dump failed.
// *Action: Make sure Oracle Clusterware is up and running. Examine any accompanying error messages for details. 
/
6014, OCR_DUMP_PARSE_FAIL, "Failed to parse OCR dump output: \"{0}\""
//  *Cause: An attempt to parse OCR dump failed.
// *Action: Make sure Oracle Clusterware is up and running. Examine any accompanying error messages for details. 
/
6015, OCR_DUMP_OUTPUT_NULL, "Error retrieving output of OCR dump command on node \"{0}\""
//  *Cause: Command 'ocrdump -stdout -xml' produced no output.
// *Action: Examine any accompanying error messages for details. 
/
6016, OCR_BACKUP_LOC_RETRIEVAL_FAIL, "Failed to retrieve the OCR backup location from node \"{0}\". Command \"{1}\" failed with errors."
//  *Cause: An attempt to retrieve the backup location of OCR failed on indicated node. 
// *Action: Make sure Oracle Clusterware is up and running. Examine any accompanying
//    error messages for details. 
/
6020, CRS_ACTIVE_VERSION_RETRIEVAL_FAILED, "failed to retrieve CRS active version from node \"{0}\""
//  *Cause: An attempt to query the CRS active version from the CRS home on
//    the indicated node failed.
// *Action: Make sure Oracle Clusterware is up and running, address any issues
//          described in accompanying error messages, and retry. 
/
6025, VDISK_RAW_UNSUPPORTED, "Voting disk \"{0}\" is on RAW or Block storage"
//  *Cause: An attempt was made to add voting disk storage on a raw or block device.
// *Action: Choose a different location for storing Voting disk.
/

6050, TASK_ASM_RUNNING_ELEMENT_NAME , "ASM status check"
// *Document: NO
//  *Cause:
// *Action:
/
6051, TASK_ASM_RUNNING_DESC , "Checks status of ASM instances"
// *Document: NO
//  *Cause:
// *Action:
/
6052, ASM_RUNNING_START, "Checking ASM status"
// *Document: NO
//  *Cause:
// *Action:
/
6053, ASM_RUNNING_PASS, "ASM status check passed"
// *Document: NO
//  *Cause:
// *Action:
/
6054, ASM_RUNNING_FAIL, "ASM status check failed"
// *Document: NO
//  *Cause:
// *Action:
/
6055, TASK_ASM_SUFFICIENT_RUNNING, "ASM is running on sufficient nodes"
// *Document: NO
//  *Cause:
// *Action:
/
6056, TASK_ASM_INSUFFICIENT_RUNNING, "Insufficient ASM instances found.  Expected {0} but found {1}, on nodes \"{2}\"."
//  *Cause: Fewer than the configured ASM instance count were found running.
// *Action: Make sure that ASM is started on enough nodes by using the 'srvctl start asm' command.
/
6057, TASK_IOS_RUNNING_CVUHELPER_ERR, "Command \"{0}\" to check if ASM I/O server resource instances are running failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
6058, TASK_IOS_SUFFICIENT_RUNNING, "ASM I/O servers are running on sufficient number of nodes"
// *Document: NO
//  *Cause:
// *Action:
/
6059, TASK_IOS_INSUFFICIENT_RUNNING, "ASM I/O servers are not running on sufficient number of nodes. [Required= {0}; Found= {1}]"
//  *Cause: An attempt to verify that ASM I/O servers are running on sufficient number
//    of nodes failed as they running on less number of nodes than I/O server count.
// *Action: Make sure that ASM I/O servers are started on sufficient number of nodes 
//    by using 'srvctl start ioserver' command. If required count is greater than
//    number of nodes in the cluster make sure that the ASM I/O servers are started on
//    all nodes of the cluster.
/
6060, TASK_IOS_INSTANCE_CHECK, "Checking if sufficient ASM I/O server instances have been started"
// *Document: NO
//  *Cause:
// *Action:
/
6061, TASK_IOS_NOT_ON_ASM, "ASM I/O servers running on nodes \"{0}\" are running on nodes that do not have an ASM instance"
//  *Cause: An attempt to determine if all ASM I/O server instances are running 
//    on nodes with ASM instances found that on nodes specified I/O servers were 
//    running but there were no ASM instances.
// *Action: The ASM I/O servers can be relocated using the command 'srvctl relocate ioserver'
//    to nodes on which ASM instances are running on.
/
6062, TASK_AFD_NOT_LOADED, "ASM filter driver library is not loaded on nodes \"{0}\""
//  *Cause: An attempt to check if ASM filter driver library was loaded failed 
//    on the nodes specified because the filter driver library was not loaded.
// *Action: Make sure that the ASM filter driver is installed on all nodes of
//    the cluster and the ASM filter driver is managing all ASM managed disks.
/
6063, TASK_AFD_NOT_KNOWN, "Failed to check if the ASM filter driver library is installed on nodes \"{0}\""
//  *Cause: An attempt to check if ASM filter driver library was loaded failed 
///   on the nodes specified because the ASM filter driver status could not be determined.
// *Action: Look at the accompanying messages and respond accordingly.
/
6064, TASK_AFD_LOADED, "ASM filter driver library is loaded on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6065, TASK_ASM_AFD_DISKS, "Checking if all ASM disks are managed by ASM filter driver library on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
6066, TASK_ASM_AFD_DISK_LIST_FAILED, "Failed to obtain the list of disks managed by ASM on nodes \"{0}\""
//  *Cause: An attempt to obtain the list of disks managed by ASM on the specified nodes failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
6067, TASK_ASM_AFDTOOL_GLOBALFAILURE, "The command \"{0}\" failed to run on nodes \"{0}\""
//  *Cause: An attempt to obtain the list of disks managed by ASM filter driver
//    failed on the nodes specified because the command could not be executed.
// *Action: Look at the accompanying messages and respond accordingly.
/
6068, TASK_ASM_AFDTOOL_NO_OUTPUT, "The command \"{0}\" failed to produce any output on nodes \"{0}\""
//  *Cause: An attempt to obtain the list of disks managed by ASM filter driver 
//    failed on the nodes specified because the command did not produce any output.
// *Action: This is an internal error. Contact Oracle support services.
// NOTE: Message 6068, TASK_ASM_AFDTOOL_NO_OUTPUT is obsolete.
//       However, it cannot be deleted from this until it is deleted from the
//       translated messages.
/
6069, TASK_ASM_NOT_AFD_MANAGED, "The disks \"{0}\" are not managed by ASM filter driver on node \"{1}\"."
//  *Cause: The indicated disks were listed by the ASM filter driver on one or more nodes but were not listed by ASM filter driver on the indicated node.  
// *Action: Ensure that the disks listed by the ASM filter driver are consistent across all the cluster nodes.
/
6070, TASK_ASM_AFDTOOL_EXEC_ERR_NODE, "failed to execute command \"{0}\" on node \"{1}\""
//  *Cause: An attempt to execute the specified command on the node specified failed.
// *Action: Look at the accompanying messages and respond accordingly.
/
6071, TASK_ASMFD_EXISTANCE_START, "Checking whether the ASM filter driver is active and consistent on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
6072, TASK_ASMFD_CHECK_PASSED, "ASM filter driver configuration was found consistent across all the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
6073, TASK_ASMFD_CHECK_FAILED, "ASM filter driver configuration consistency check failed."
// *Document: NO
//  *Cause:
// *Action:
/
6074, AFD_NOT_INSTALLED_NODES, "The ASM filter driver library is not installed on nodes \"{0}\"."
//  *Cause: The ASM filter driver library was not found installed on the indicated nodes. 
// *Action: Ensure that the ASM filter driver library is consistently installed and loaded across all the cluster nodes.
/
6075, AFD_LOADED_NOT_KNOWN, "failed to check if the ASM filter driver library is loaded on nodes \"{0}\"."
//  *Cause: An attempt to check whether the ASM filter driver library was loaded failed 
//   on the nodes specified because the ASM filter driver status could not be determined.
// *Action: Look at the accompanying messages and respond accordingly.
/
6076, TASK_AFD_INSTALL_CONSISTENT, "ASM filter driver library is installed on all the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
6077, TASK_AFD_LOADED_CONSISTENT, "ASM filter driver library is loaded on all the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
6078, AFD_NOT_SUPPORTED, "ASM filter driver library is not supported on current platform for this release \"{0}\"."
//  *Cause: The ASM filter driver library have not been ported for the indicated release on this OS platform.
// *Action: None.
/
6079, TASK_ELEMENT_AFD_CONSISTENCY, "ASM filter driver configuration consistency"
// *Document: NO
//  *Cause:
// *Action:
/
6080, TASK_DESC_AFD_CONSISTENCY, "This test checks the consistency of the ASM filter driver configuration across nodes."
// *Document: NO
//  *Cause:
// *Action:
/
6081, ASM_MANAGED_DISK_NOT_AFD_MANAGED, "The disks \"{0}\" are not managed by ASM filter driver on node \"{1}\"."
//  *Cause: An attempt to verify that all disks that are managed by ASM are also 
//    managed by ASM filter driver failed because the specified disks were being 
//    managed by ASM but not by ASM filter driver.
// *Action: Use the command 'afdtool' to stamp the disks for management by ASM filter driver.
/
6082, TASK_AFD_NOT_INSTALL_CONSISTENT, "ASM filter driver library is not installed on any of the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
6083, TASK_ASM_NOT_AFD_LISTED, "The disks \"{0}\" are not listed by ASM filter driver on node \"{1}\"."
//  *Cause: The CVU check for ASM filter driver configuration consistency 
//          determined that the indicated disks were listed by the ASM filter 
//          driver on one or more nodes but were not listed by ASM filter driver
//          on the indicated node.  
// *Action: Ensure that the disks listed by the ASM filter driver are 
//          consistent across all the cluster nodes. The command 
//          'afdtool -rescan' can be used to perform a rescan of ASM 
//          filter driver managed disks on the indicated node and the
//          command 'afdtool -getdevlist "*"' can be used to list the 
//          AFD managed disks.
/
6084, TASK_ASM_PARAM_CLUSTER_DATABASE_FALSE, "The ASM parameter \"cluster_database\" does not have expected value. [Expected = \"TRUE\"] [Found = \"FALSE\"]"
//  *Cause: The Cluster Verification Utility determined that the indicated ASM
//          parameter value did not have expected value.
// *Action: Ensure that the indicated ASM parameter value is set to 'TRUE' using
//          the command 'alter system set cluster_database=TRUE scope=spfile', 
//          and then retry the operation.
/
6085, TASK_ASM_PARAM_RETRIEVAL_FAILED, "failed to retrieve the ASM parameter \"{0}\" value on the node \"{1}\""
//  *Cause: An attempt to obtain the indicated ASM parameter value failed. The 
//          accompanying messages provide detailed failure information.
// *Action: Examine the accompanying messages, correct the problems indicated 
//          there, and then retry the operation.
/
6090, TASK_AFD_INSTALLED_NOT_SUPPORTED_UPGRADE, "ASM filter driver is installed on node \"{0}\" but is not supported by Oracle Clusterware release version \"{1}\" on the current operating system version."
//  *Cause: The ASM filter driver was found installed, but was not supported on
//          the current operating system version by the targeted Oracle 
//          Clusterware release.
// *Action: Ensure that the operating system version is upgraded to the minimum
//          supported version required for the ASM filter driver for the 
//          indicated target Oracle Clusterware release version and then retry 
//          upgrade.  
//          Refer to My Oracle Support note 2034681.1 for more information 
//          regarding this requirement. 
/
6091, TASK_AFD_NOT_SUPPORTED, "ASM filter driver is not supported on the current operating system version for Oracle Clusterware release version \"{0}\"."
//  *Cause: The ASM filter driver was not supported on the current operating 
//          system version for the targeted release.
// *Action: Ensure that the operating system version is upgraded to the minimum
//          supported version required for the ASM filter driver for the  
//          indicated target Oracle Clusterware release version. 
//          Refer to My Oracle Support note 2034681.1 for more information   
//          regarding this requirement. 
/
6095, TASK_USM_INSTALLED_NOT_SUPPORTED_UPGRADE, "Oracle ACFS driver is installed on node \"{0}\" but is not supported by Oracle Clusterware release version \"{1}\" on the current operating system version."
//  *Cause: The Oracle Automatic Storage Management Cluster File System 
//          (Oracle ACFS) driver was found installed, but was not supported on
//          the current operating system version by the targeted Oracle 
//          Clusterware release.
// *Action: Ensure that the operating system version is upgraded to the minimum 
//          supported version required for the Oracle ACFS driver for the  
//          indicated target Oracle Clusterware release version and then retry 
//          upgrade. 
//          Refer to My Oracle Support note 1369107.1 for more information  
//          regarding this requirement. 
/
6096, TASK_USM_NOT_SUPPORTED, "Oracle ACFS driver is not supported on the current operating system version for Oracle Clusterware release version \"{0}\"."
//  *Cause: The Oracle Automatic Storage Management Cluster File System 
//          (Oracle ACFS) driver was not supported on the current operating 
//          system version for the targeted release.
// *Action: Ensure that the operating system version is upgraded to the minimum 
//          supported version required for the Oracle ACFS driver for the  
//          indicated target Oracle Clusterware release version. 
//          Refer to My Oracle Support note 1369107.1 for more information  
//          regarding this requirement. 
/
7040, DISK_LV_INFO_UNAVAIL, "Failed to get LV count for \"{0}\""
//  *Cause: Could not get Logical Volume information for the device specified.
// *Action: Ensure that the device specified is available.
/
7050, FAIL_RESOLVE_LONGEST_PATH_NODE, "No part of location \"{0}\" matches an existing path on node \"{1}\""
//  *Cause: Neither the specified location nor any leading portion thereof matched existing file system paths on
//          the indicated node.
// *Action: Ensure that the path is absolute and at least some leading portion of it matches an existing file system path on the indicated node. 
/
7051, FAIL_RESOLVE_LONGEST_WRITABLE_PATH_NODE, "No part of location \"{0}\" matches an existing path with write permissions for current user on node \"{1}\""
//  *Cause: Neither the specified location nor any leading portion thereof matched existing file system paths with
//          write permissions on the indicated node.
// *Action: Ensure that the path is absolute and at least some leading portion of it matches an existing file system path writable by the current user on the indicated node. 
/
7080, FAIL_GET_SRVCTL_VERSION, "Failed to retrieve the 'srvctl' version on node \"{0}\", [{1}]"
//  *Cause: Could not get the version of 'srvctl' utility on the identified node.
// *Action: Look at the accompanying messages and respond accordingly. 
/
7090, INTERNAL_CVU_FIXUP_FRAMEWORK_ERROR, "An internal error occurred within cluster verification fix up framework"
//  *Cause: An error occurred while performing the selected fix up operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
7091, INCORRECT_ROOT_CONFIG_METHOD, "Unknown privilege delegation method specified"
//  *Cause: An unknown privilege delegation method was specified. 
// *Action: Specify a valid value for the privilege delegation method. 'sudo' and 'root' are the only acceptable method values.
/
7092, RUNCLUVFY_USER_INSUFFICIENT_PERMISSION_NON_ROOT, "User \"{0}\" does not have sufficient authorization to run this command."
//  *Cause: An attempt to run the Cluster Verification Utility (CVU) command
//          failed because the user did not have sufficient authority to run 
//          it.
// *Action: Use the command line option '-method' to specify one of the 
//          privilege delegation methods.
/
7500, FILE_NOT_FOUND, "File \"{0}\" not found"
//  *Cause: The specified file was not found.
// *Action: Ensure that the file exists and is readable.
/
7501, XML_SAXEXCEPTION, "An error occurred while parsing file \"{0}\""
//  *Cause: An error occurred while parsing the document.
// *Action: Ensure that the document is well formatted and a valid XML document.
/
7503, XML_IOEXCEPTION, "An I/O error occurred while reading file \"{0}\""
//  *Cause: An I/O error occurred while parsing the document.
// *Action: Ensure that the document is accessible. Copy the document to a new location and retry. 
/
7504, XML_PARSERCONFIGURATIONEXCEPTION, "An internal error occurred while parsing file \"{0}\""
//  *Cause: An internal error occurred while parsing the document.
// *Action: This is an internal error. Contact Oracle Support Services.
/
7505, ERR_GET_USR_GRP_MEMBRSHIP, "Failed to get group membership of user \"{0}\" on node \"{1}\""
//  *Cause: An attempt to get the group membership of the user on the indicated
//          node failed.
// *Action: Look at the accompanying error messages displayed and fix the 
//          problems indicated.
/
8000, INVALID_SRC_CRSHOME, "Path \"{0}\" specified for the '-src_crshome' option is not a valid source CRS home."
//  *Cause: The identified source CRS home was not found to be the configured 
//          CRS home. 
// *Action: Specify a valid configured CRS home.
/
8001, UTIL_INVALID_CRSHOME, "CRS home \"{0}\" is not a valid directory."
//  *Cause: While attempting to determine the nodes on which to perform the 
//          verification operation, the Oracle Clusterware home discovered
//          was not a valid directory.
// *Action: Ensure that any previous Oracle Clusterware installation has been 
//          deinstalled properly.
/
8002, UTIL_MISSING_OLSNODES, "The required executable \"olsnodes\" is missing from the directory \"{0}\"."
//  *Cause: While attempting to determine the nodes on which to perform the 
//          verification operation, the 'olsnodes' executable was not found in
//          the Oracle Clusterware home.
// *Action: Ensure that the Oracle Clusterware was installed properly. Ensure
//          that any previous Oracle Clusterware configuration files have been
//          cleaned up.
/
8003, UTIL_NODELIST_RETRIVAL_FAILED, "Unable to retrieve node list from the Oracle Clusterware."
//  *Cause: While attempting to determine the nodes on which to perform the 
//          verification operation, the nodes that belonged to the cluster 
//          could not be obtained from the Oracle Clusterware.
// *Action: Ensure that the Oracle Clusterware stack is up so that Cluster 
//          Verification Utility (CVU) can retrieve the node list. The node
//          list can be specified using the command line option '-n <nodelist>'
//          or using CV_NODE_ALL property in the 'cvu_config' file so that CVU
//          perform verification operation on those nodes.
/
////////////////////////////////////////////////////////////////////////////////
/ 9000 - 10000 - Keep these messages in sync with cvu fix up framework
////////////////////////////////////////////////////////////////////////////////
9000, FIXABLE_FAILURES_NOT_AVAILABLE, "No fixable verification failures to fix"
// *Document: NO
//  *Cause:
// *Action:
/
9001, COMMANDLINE_DIALOG_FAILURE, "Failed to read input from command line standard input"
//  *Cause: Failed to read the response from standard input.
// *Action: Ensure that the input is correctly entered on standard input.
/
9002, COMMANDLINE_PASSWORD, "Enter \"{0}\" password:"
// *Document: NO
//  *Cause:
// *Action:
/
9003, FIXUP_CREDENTIALS_READ_FAILED, "Failed to read the \"{0}\" user credentials"
//  *Cause: Failed to read the response from standard input.
// *Action: Ensure that the input is correctly entered on standard input.
/
9004, FIXUP_XML_GENERATOR_FAILED, "Failed to generate fix up data file with error :{0}"
// *Document: NO
//  *Cause:
// *Action:
/
9005, FIXUP_FAILED_ALL, "Failed to perform the fix up on all nodes; error :{0}"
// *Document: NO
//  *Cause:
// *Action:
/
9006, FIXUP_EXECUTE_MANUAL_MESSAGE, "Execute \"{0}\" as root user on nodes \"{1}\" to perform the fix up operations manually"
// *Document: NO
//  *Cause:
// *Action:
/
9007, FIXUP_MANUAL_PROMPT_CHOICE, "Press ENTER key to continue after execution of \"{0}\" has completed on nodes \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
9008, FIXUP_TASK_SUCCESSFUL_ALL, "\"{0}\" was successfully fixed on all the applicable nodes"
// *Document: NO
//  *Cause:
// *Action:
/
9009, FIXUP_TASK_FAILED, "\"{0}\" could not be fixed on nodes \"{1}\""
// *Document: NO
//  *Cause:
// *Action:
/
9010, FIXUP_SUCCESSFUL_ALL, "Fix up operations were successfully completed on all the applicable nodes"
// *Document: NO
//  *Cause:
// *Action:
/
9011, FIXUP_FAILED, "Fix up operations for selected fixable prerequisites were unsuccessful on nodes \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9012, FIXUP_SUCCESSFUL_NODE, "All fix up operations were successfully completed on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9013, FIXUP_FAILED_NODE, "Failed to perform fix up operations on node \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
9014, FIXUP_TASK_SUMMARY_TEMPLATE, "Fix: {0} "
// *Document: NO
//  *Cause:
// *Action:
/
9015, ROOT_COMMAND_FAILED_NODE, "Failed to execute command \"{0}\" using \"{1}\" credentials on node \"{2}\" with error \"{3}\""
//  *Cause: An attempt to execute the command with the credentials provided for the identified user across all the nodes failed.
// *Action: Ensure that the credentials provided are correct.
/
9016, FIXUP_COMMON_NATIVE_FAILURE_NODE, "failed with an error \"{0}\" on node \"{1}\""
//  *Cause: An operating system error occurred while executing the fix up on the specified node.
// *Action: Look at the error details and respond accordingly.
/
9017, FIXUP_COMMANDLINE_FIXUP_SUMMARY_LIST, "Following is the list of fixable prerequisites selected to fix in this session"
// *Document: NO
//  *Cause:
// *Action:
/
9018, ROOT_CREDENTIALS_ABSENT, "Privilege delegation method and credentials are not specified"
//  *Cause: The privilege delegation method and credentials were not specified.
// *Action: Ensure that the privilege delegation method and its credentials are specified.
/
9019, FIXUP_FILES_COPY_FAILED_ALL_NODES, "Copying required fix up files to directory \"{0}\" failed on all nodes"
//  *Cause: An attempt to copy fix up files to the indicated directory failed on all cluster nodes.
// *Action: Make sure that the user running fix up has read and write permissions on the indicated directory.
/
9020, EXECUTABLE_MISSING_AT_PATH, "Executable file \"{0}\" not found on node \"{1}\""
//  *Cause: Indicated executable file was not found at the indicated path on the identified node.
// *Action: Ensure that the executable file exists at the indicated path.
/
9021, FILE_MISSING_AT_PATH, "File \"{0}\" not found on nodes \"{1}\""
//  *Cause: Indicated file was not found at the indicated path on the identified nodes.
// *Action: Ensure that the file exists at the indicated path.
/
9022, FIXUP_COMMANDLINE_FIXUP_GENERATION_FAILED_LIST, "Fix up could not be generated for the following fixable prerequisites"
// *Document: NO
//  *Cause:
// *Action:
/
9023, FIXUP_MANUAL_EXECUTION_MISSING, "Manual fix up command \"{0}\" was not issued by root user on node \"{1}\""
//  *Cause: The indicated manual command to perform a fix up action was either not issued or was issued by an user other than root.
// *Action: Ensure that the indicated manual fix up command is executed as root user on the identified node.
/
9025, FAILED_FIX_SYSTEM_PARAM_IN_CONFIG_FILE, "Failed to update the value of parameter \"{0}\" in configuration file \"{1}\" on node \"{2}\""
//  *Cause: An attempt to update the value of indicated parameter in the configuration file on the identified node failed.
// *Action: Ensure that the file exists and the privilege delegation method used to run this command is run with correct credentials.
/
9026, FAILED_FIX_SYSTEM_PARAM, "Failed to adjust the value of parameter \"{0}\" using command \"{1}\" on node \"{2}\""
//  *Cause: An attempt to update the system parameter value using indicated command failed on the indicated node.
// *Action: Examine the accompanying error messages for details and also ensure that the command executable exists at the identified path and the privilege delegation method used to run this command is run with correct credentials.
/
9027, FAILED_RETRIEVE_SYSTEM_PARAM_VALUE, "Failed to retrieve the current value of parameter \"{0}\" using command \"{1}\" on node \"{2}\""
//  *Cause: An attempt to retrieve the current value of indicated system parameter using identified command failed on the indicated node.
// *Action: Examine the accompanying error messages for details and also ensure that the command executable exists at the identified path and the privilege delegation method used to run this command is run with correct credentials.
/
9028, FIXUP_FAILED_SET_ENV_VARIABLE, "Failed to set an environment variable \"{0}\" on node \"{1}\""
//  *Cause: An attempt to set an environment variable failed on indicated node.
// *Action: This is an internal error. Contact Oracle Support Services. 
/
9030, CONFIG_FILE_OPEN_FAILED, "Failed to open configuration file \"{0}\" on node \"{1}\""
//  *Cause: An attempt to open the indicated file for read and write operations failed on the indicated node.
// *Action: Ensure that the file exists and the privilege delegation method used to run this command is run with correct credentials.
/ 
9031, FIXUP_DATA_MISSING_VAL, "Missing required data in fix up data file."
//  *Cause: An internal error occurred while performing the selected fix up operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9032, FAILED_CREATE_USER_NODE, "Failed to create new user \"{0}\" on node \"{1}\", command \"{2}\" failed with error {3}"
//  *Cause: An attempt to add specified new user failed on the indicated node.
// *Action: Ensure that the privilege delegation method used to run this command is run with correct credentials.
/ 
9033, FAILED_CREATE_GROUP_NODE, "Failed to create new group \"{0}\" on node \"{1}\""
//  *Cause: An attempt to add specified new group failed on the indicated node.
// *Action: Ensure that the privilege delegation method used to run this command is run with correct credentials.
/
9034, USER_ABSENT_NODE, "User \"{0}\" does not exist on node \"{1}\""
//  *Cause: The specified user name was not known to the operating system on the indicated node.
// *Action: Ensure that the user account exists on the indicated node.
/
9035, GROUP_ABSENT_NODE, "Group \"{0}\" does not exist on node \"{1}\""
//  *Cause: The specified group name was not known to the operating system on the indicated node.
// *Action: Ensure that the group account exists on the indicated node.
/ 
9036, FAILED_CREATE_GROUP_MEMBERSHIP_NODE, "Failed to add user \"{0}\" to group \"{1}\" on node \"{2}\""
//  *Cause: An attempt to add the indicated user to the group failed on the specified node.
// *Action: Ensure that the privilege delegation method used to run this command is run with correct credentials and the user and group exist on the node.
/
9037, FAILED_GET_USER_GROUPS_NODE, "Failed to get the list of groups for user \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve the operating system groups to which the specified user belongs failed on the indicated node.
// *Action: Ensure that the user account exists on the node.
/
9038, FAILED_UPDATE_USER_ID_NODE, "Failed to modify user \"{0}\" user ID to \"{1}\" on node \"{2}\""
//  *Cause: An attempt to modify identified user's ID failed on the indicated node.
// *Action: Ensure that the privilege delegation method used to run this command is run with correct credentials.
/
9039, FAILED_UPDATE_GROUP_ID_NODE, "Failed to modify group \"{0}\" group ID to \"{1}\" on node \"{2}\""
//  *Cause: An attempt to modify identified group's ID failed on the indicated node.
// *Action: Ensure that the privilege delegation method used to run this command is run with correct credentials.
/  
9040, FAILED_GET_AVAILABLE_USER_ID, "Failed to get available unique user ID from nodes \"{0}\""
//  *Cause: An attempt to retrieve an unused unique user ID from the indicated nodes failed.
// *Action: Ensure that the node is reachable and the user running the command has required privileges to retrieve the information from user accounts database.
/
9041, FAILED_GET_AVAILABLE_GROUP_ID, "Failed to get available unique group ID from nodes \"{0}\""
//  *Cause: An attempt to retrieve an unused unique group ID from the indicated nodes failed.
// *Action: Ensure that the node is reachable and the user running the command has required privileges to retrieve the information from group accounts database. 
/
9042, FAILED_GET_AVAILABLE_USER_ID_NODE, "Failed to get available user ID from node \"{0}\""
//  *Cause: An attempt to retrieve an unused user ID from the indicated node failed.
// *Action: Ensure that the node is reachable and the user running the command has required privileges to retrieve the information from user accounts database.
/
9043, FAILED_GET_AVAILABLE_GROUP_ID_NODE, "Failed to get available group ID from node \"{0}\""
//  *Cause: An attempt to retrieve an unused group ID from the indicated node failed.
// *Action: Ensure that the node is reachable and the user running the command has required privileges to retrieve the information from group accounts database.
/
9044, FAILED_FIX_RUN_LEVEL_NODE, "Failed to adjust the 'runlevel' value in file \"{0}\" on node \"{1}\""
//  *Cause: An attempt to adjust the 'runlevel' value in entry inside the indicated file failed on the specified node.
// *Action: Ensure that the indicated file is in correct format and that the entry for 'initdefault' runlevel exists in the file.
/
9045, FAILED_INSTALL_PACKAGE_NODE, "Failed to install the package \"{0}\" from source location \"{1}\" on node \"{2}\""
//  *Cause: An attempt to install the indicated package failed on the identified node.
// *Action: Ensure that the package source file exists at the identified location and the 'rpm' tool is available on the node.
/
9046, FIXUP_NOT_SUPPORTED, "Fix up for this verification failure is not supported"
//  *Cause: An internal error occurred while performing the selected fix up operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9047, FIXUP_NO_SETUP, "Fix up initial framework setup is not performed, cannot perform fix up operations"
//  *Cause: An internal error occurred while performing the selected fix up operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9048, FIXUP_SYSTEM_PARAM_NOT_FIXABLE, "Fix up is not supported for Operating System parameter \"{0}\""
//  *Cause: An internal error occurred while performing the selected fix up operations.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9049, FAILED_CREATE_USER_HOME_DIR, "Failed to create home directory at path \"{0}\" for newly created user \"{1}\" on node \"{2}\""
//  *Cause: An attempt to create the home directory at the indicated path failed for the newly created user on the indicated node.
// *Action: Manually create the home directory at the indicated path for the newly added user account.
/
9050, FIXUP_OS_VERSION_NOT_FOUND, "Failed to determine the Operating System version on node \"{0}\""
//  *Cause: An attempt to retrieve the operating system version failed on the identified node.
// *Action: Ensure that the command is being run in the correct operating system environment.
/
9051, FIXUP_OS_VERSION_NOT_SUPPORTED, "Fix up is not supported for the Operating System parameter \"{0}\" on current version of the Operating System on node \"{1}\""
//  *Cause: A fix up operation was requested for an Operating System version that does not support that operation. 
// *Action: None, or address the situation manually on the indicated node. 
/
9052, FAILED_FIX_SYSTEM_PARAM_API, "Failed to adjust the value of parameter \"{0}\" using operating system function call \"{1}\" on node \"{2}\" with error \n{3}"
//  *Cause: An attempt to update the system parameter value using the indicated system call failed on the indicated node.
// *Action: Examine the accompanying error messages for details.
/
9053, FAILED_RETRIEVE_SYSTEM_PARAM_VALUE_API, "Failed to retrieve the current value of parameter \"{0}\" using operating system function call \"{1}\" on node \"{2}\" with error \n{3}"
//  *Cause: An attempt to retrieve the current value of the indicated system parameter using the identified operating system function call failed on the indicated node.
// *Action: Examine the accompanying error messages for details.
/
9055, FIXUP_SOLARIS_FAILED_CHECK_PROJECT, "Failed to verify the existence of Solaris Project name \"{0}\" on node \"{1}\""
//  *Cause: An attempt to check the existence of the indicated Solaris Projects failed on the identified node.
// *Action: Ensure that the project specific configuration is correct on the identified node.
/
9056, FIXUP_SOLARIS_FAILED_CREAT_PROJECT, "Failed to create the Solaris Project \"{0}\" for Oracle user on node \"{1}\""
//  *Cause: An attempt to create the indicated Solaris Projects for Oracle user failed on the identified node.
// *Action: Ensure that the Solaris Project specific configuration is correct on the identified node.
/
9057, FAILED_GET_USER_HOME_DIR, "Failed to retrieve the home directory of user \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve the home directory of the identified user failed on the indicated node.
// *Action: Ensure that the file /etc/passwd is in correct format and that the contents of this file are correct on the indicated node.
/
// Translator: do not translate 'Available'
9059, FIXUP_TASK_IOCP_DEVICE_FAILED, "Failed to update the IOCP device status to \"Available\" using command \"{0}\" on node \"{1}\". Detailed error: {2}"
//  *Cause: An attempt to update the status of an I/O Completion Port (IOCP)
//          to 'Available' on the indicated node failed. The accompanying
//          messages provide detailed failure information.
// *Action: Rectify the issues described in the detailed messages and retry the
//          operation.
/
9060, FIXUP_TASK_DAEMON_NOT_SUPPORTED, "Fix up is not supported for daemon or process \"{0}\""
//  *Cause: An unsupported daemon or process was requested for fix up.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9061, FIXUP_TASK_DAEMON_FAILED_TO_STOP, "Daemon or process \"{0}\" could not be stopped on node \"{1}\", command \"{2}\" failed with error: {3}"
//  *Cause: An attempt to stop the indicated daemon or process failed on the identified node.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9062, FIXUP_TASK_DAEMON_FAILED_TO_STOP_PERMANENTLY, "Daemon or process \"{0}\" could not be stopped permanently on node \"{1}\", command \"{2}\" failed with error: {3}"
//  *Cause: An attempt to permanently stop the indicated daemon or process failed on the identified node.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9063, FIXUP_TASK_DAEMON_NOT_RUNNING, "Daemon or process \"{0}\" is not running on node \"{1}\""
//  *Cause: Indicated daemon or process was not found running on the identified node.
// *Action: Ensure that the daemon name is correct and it is running on the node indicated.
/
9064, FIXUP_TASK_ASM_FAILED_TO_RESTART, "Failed to restart the ASMLib driver on node \"{0}\" using command \"{1}\". Detailed error: {2}"
//  *Cause: An attempt to restart the ASMLib driver failed on the identified node.
// *Action: Ensure that ASMLib is configured correctly and look at the accompanying messages for details. If the problem persists, contact Oracle Support Services.
/
9065, FIXUP_TASK_PIN_STATUS_FAILED, "Failed to retrieve the unpinned nodes using OLSNODES command \"{0}\" on node \"{1}\". Detailed error: {2}"
//  *Cause: An attempt to determine the pinned status of the cluster nodes using an OLSNODES command failed on the indicated node.
// *Action: Ensure that the 'olsnodes' executable tool exists at the specified location and look at the accompanying messages for details.
/
9066, FIXUP_TASK_PIN_NODES_FAILED, "Failed to pin the nodes \"{0}\" using CRSCTL command \"{1}\" on node \"{2}\". Detailed error: {3}"
//  *Cause: An attempt to pin the specified nodes using a CRSCTL command failed on the indicated node.
// *Action: Ensure that the 'crsctl' executable tool exists at the specified location and look at the accompanying messages for details.
/
9067, FIXUP_TASK_HUGEPAGES_NOT_ENABLED, "Huge page support is not enabled for Linux kernel on node \"{0}\"."
//  *Cause: Huge pages support was not found configured for the Linux kernel on indicated node.
// *Action: Ensure that the huge pages support is enabled for the Linux kernel on the indicated node.
/
9068, FIXUP_TASK_HUGEPAGES_FAILED_GET_RECOMMENDATION, "Failed to determine the recommended value for huge pages on node \"{0}\"."
//  *Cause: An attempt to calculate the recommended value for huge pages failed on the indicated node.
// *Action: This is an internal error. Contact Oracle Support Services.
/
9070, FIXUP_TASK_DEVICE_FILE_SETTINGS_FAILED, "Failed to update the settings of device file \"{0}\" using command \"{1}\" on node \"{2}\". Detailed error: {3}"
//  *Cause: An attempt to update the major and minor number of the indicated device file failed with the indicated error.
// *Action: Ensure that the indicated command exists at the specified location and look at the accompanying messages for details.
/
9071, FIXUP_TASK_IPMP_SETTINGS_FAILED, "Failed to start the daemon \"{0}\" using command \"{1}\" on node \"{2}\". Detailed error: {3}"
//  *Cause: An attempt to start the identified daemon failed on the indicated node. Further details are supplied in the additional messages included. 
// *Action: Rectify the issues described in the detailed messages and retry.
/
9072, FIXUP_TASK_GSD_RESOURCE_DISABLE_FAILED, "failed to disable the resource \"{0}\" using srvctl command \"{1}\" on node \"{2}\". Detailed error: {3}"
//  *Cause: An attempt to disable the identified resource failed on the indicated node. See included messages for details.
// *Action: Ensure that the 'srvctl' executable exists at the specified location and look at the accompanying messages for details.
/
9073, FIXUP_TASK_GSD_RESOURCE_STOP_FAILED, "failed to stop the resource \"{0}\" using srvctl command \"{1}\" on node \"{2}\". Detailed error: {3}"
//  *Cause: An attempt to stop the identified resource failed on the indicated node. See included messages for details.
// *Action: Ensure that the 'srvctl' executable exists at the specified location and look at the accompanying messages for details.
/
9074, FIXUP_TASK_GSD_RESOURCE_STATUS_FAILED, "failed to get the resource \"{0}\" status using srvctl command \"{1}\" on node \"{2}\". Detailed error: {3}"
//  *Cause: An attempt to determine the identified resource status on the indicated node. See included messages for details.
// *Action: Ensure that the 'srvctl' executable exists at the specified location and look at the accompanying messages for details.
/
9075, FIXUP_TASK_CHECK_DAX_ACCESS_FAILED, "failed to grant privilege \"{0}\" to user \"{1}\" on node \"{2}\""
//  *Cause: The Automatically generated fix-up script to grant the operating
//          system privilege 'dax_access' to the indicated user failed on the
//          indicated node.
// *Action: Examine the accompanying messages and rectify the issues that caused
//          the script to fail and rerun the script or insure that the indicated
//          user has the 'dax_access' privilege on the indicated node and rerun
//          CVU.
/
9076, FIXUP_FAILED_GET_HOME_DIR, "Failure to determine the user's home directory on node \"{0}\". Operation failed with error \"{1}\"."
//  *Cause: An attempt to retrieve the user's home directory failed on the
//          indicated node. The accompanying messages provide detailed 
//          information about the failure.
// *Action: Ensure that the user's home directory is available on the indicated
//          node, either by setting the environment variable 'HOME' 
//          appropriately, or by resolving the problem described 
//          in the accompanying messages, and retry the operation.
/
9077, FIXUP_UNABLE_TO_CREATE_DIRECTORY, "Unable to create the directory \"{0}\" on node \"{1}\". Operation failed with error \"{2}\""
//  *Cause: An attempt by the Cluster Verification Utility (CVU) to create the 
//          indicated directory failed on the indicated node. The accompanying 
//          messages provide detailed information about the failure.
// *Action: Ensure that the user running fix-up has read and write 
//          permissions on the indicated directory. Resolve the problems 
//          described in the accompanying messages and retry the operation.
/
9078, FIXUP_FAILED_TO_GENERATE_SSH_KEYS, "Failure to generate the SSH keys on node \"{0}\". Command \"{1}\" failed with error \"{2}\"." 
//  *Cause: An attempt to generate SSH keys using the indicated command failed
//          on the indicated node because of the indicated error.
// *Action: Ensure that the user running fix-up has the privileges required 
//          to generate the SSH keys on the indicated node. Resolve the 
//          problem described by the indicated error and retry the operation.
/
9079, FIXUP_FAILED_TO_ADD_SSH_KEYS_TO_AGENT, "Failure to update the SSH agent with the SSH keys on node \"{0}\". Command \"{1}\" failed with error \"{2}\"." 
//  *Cause: An attempt to update the SSH agent with the SSH keys by issuing
//          the indicated command failed on the indicated node because
//          of the indicated error.
// *Action: Ensure that the user running fix-up has the privileges required
//          to update the SSH agent with the keys on the indicated node. 
//          Resolve the problem described by the indicated error and retry
//          the operation.
/
9080, FIXUP_UNABLE_TO_READ_FILE, "Failure to open file \"{0}\" to read on node \"{1}\". Operation failed with error \"{2}\"."
//  *Cause: An attempt to read the indicated file failed on the indicated 
//          node because of the indicated error.
// *Action: Ensure that the file exists at the indicated path and the user 
//          running fix-up has read permissions on the indicated file.
//          Resolve the problem described by the indicated error and retry
//          the operation.
/
9081, FIXUP_UNABLE_TO_WRITE_FILE, "Failure to write to file \"{0}\" on node \"{1}\". Operation failed with error \"{2}\"."
//  *Cause: An attempt to write content to the indicated file failed on the  
//          indicated node because of the indicated error.
// *Action: Ensure that the file exists at the indicated path and the user 
//          running fix-up has write permissions on the indicated file. 
//          Resolve the problem described by the indicated error and retry
//          the operation.
/
9082, FIXUP_UNABLE_TO_CREATE_FILE, "Failure to create file \"{0}\" on node \"{1}\". Operation failed with error \"{2}\"." 
//  *Cause: An attempt to create the indicated file failed on the indicated 
//          node because of the indicated error.
// *Action: Ensure that the user running fix-up has write permissions on the 
//          directory in which the indicated file is being created. 
//          Resolve the problem described by the indicated error and retry
//          the operation.
/
9083, FIXUP_UNABLE_TO_UPDATE_FILE_PERMISSION, "Failure to update the permissions for file \"{0}\" to \"{1}\" on node \"{2}\". Operation failed with error \"{4}\"." 
//  *Cause: An attempt to update the permissions of the indicated file  
//          on the indicated node failed because of the indicated error.
// *Action: Ensure that the user running fix-up has the required permissions
//          on the directory in which the indicated file exists.
//          Resolve the problem described by the indicated error and retry the
//          operation.
/
9084, FIXUP_FAILED_AUTHENTICATE_CREDENTIALS, "failure to connect to nodes \"{0}\" using SSH with specified credentials for user \"{1}\""
//  *Cause: An attempt to connect to the indicated node using SSH with
//          specified credentials for the indicated user failed. The
//          accompanying messages provide detailed failure information.
// *Action: Resolve the problems described in the accompanying messages and
//          retry the operation.
/
9085, FIXUP_FAILED_SETUP_WORKDIR, "failure to set up the fix-up work directory \"{0}\" on node \"{1}\""
//  *Cause: An attempt to set up the indicated work directory failed on the
//          indicated node. The accompanying messages provide detailed 
//          failure information.
// *Action: Resolve the problems described in the accompanying messages and
//          retry the operation.
/
9086, FIXUP_FAILED_AUTHENTICATE_SFTP, "failure to connect to node \"{0}\" using secure FTP with specified credentials for user \"{1}\""
//  *Cause: An attempt to connect using secure FTP to the indicated node using
//          specified credentials for the indicated user failed. 
//          The accompanying messages provide detailed failure information.
// *Action: Resolve the problems described in the accompanying messages and
//          retry the operation.
/
9087, FIXUP_UNABLE_TO_RENAME_FILE, "Failure to rename the file \"{0}\" to \"{1}\" on node \"{2}\". Operation failed with error \"{3}\"." 
//  *Cause: An attempt to rename the indicated file on the indicated node
//          failed because of the indicated error.
// *Action: Ensure that the user running fix-up has write permission for
//          the file which is being renamed. Resolve the problem described
//          by the indicated error and retry the operation.
/
9088, FIXUP_FAILED_SETUP_SSH_EQUIV, "Failure to set up the SSH user equivalence for specified user \"{0}\" on nodes \"{1}\". Operation failed with error \"{2}\"." 
//  *Cause: An attempt to set up SSH user equivalence for the specified 
//          user on the indicated nodes failed because of the indicated error.
// *Action: Resolve the problem described by the indicated error and retry
//          the operation.
/
9089, FIXUP_SETUP_SSH_EQUIV_SUCCESS, "SSH user equivalence was successfully set up for user \"{0}\" on nodes \"{1}\"" 
// *Document: NO
// *Cause:
// *Action:
/
9090, FIXUP_SETUP_SSH_EQUIV_HEADER, "Setting up SSH user equivalence for user \"{0}\" between nodes \"{1}\"" 
// *Document: NO
// *Cause:
// *Action:
/
9091, FIXUP_SETUP_REBOOT_ALERT, "Reboot nodes \"{0}\" for the fix-up operations to be effective." 
// *Document: NO
// *Cause:
// *Action:
/
9092, FIXUP_SETUP_RELOGIN_ALERT, "Log out of the current session and Re-Login to nodes \"{0}\" for the fix-up operations to be effective."
// *Document: NO
// *Cause:
// *Action:
/
9093, FIXUP_FAILED_TO_REMOVE_RPM_DB_FILES, "Failed to remove the RPM database files from directory \"{0}\" on node \"{1}\". The operation failed with the error : {2}"
//  *Cause: An attempt by the Cluster Verification Utility (CVU) fix up 
//          operation to remove the RPM database files from the indicated
//          directory on the indicated node failed.
// *Action: Ensure that the user running CVU fixup has read and write 
//          permissions for the inidcated directory on the indicated node.
//          Resolve the problem described by the indicated error and retry
//          the operation.
/
9094, FIXUP_FAILED_REBUILD_RPM_DATABASE, "Failed to rebuild the RPM database using command \"{0}\" on node \"{1}\". The operation failed with the error : {2}"
//  *Cause: An attempt by the Cluster Verification Utility (CVU) fix up
//          operation to rebuild the RPM database on the indicated node failed.
// *Action: Ensure that the user running CVU fixup has the privileges required 
//          to run the indicated command on the indicated node. Resolve the
//          problem described by the indicated error and retry the operation.
/
////////////////////////////////////////////////////////////////////////////////
/ 10002 - 10050 - Keep these messages in sync with crsus.msg
////////////////////////////////////////////////////////////////////////////////
// This message should be same as to CRS-10005 in has/mesg/crsus.msg
10005, CRSCTL_DHCP_NO_HOSTNAME, "unable to determine local host name"
// *Cause: The host name could not be determined.
// *Action: Check that the host name for the local machine is valid. Look at the accompanying messages. If the problem persists, contact Oracle Support Services.
/
// This message should be same as to CRS-10006 in has/mesg/crsus.msg
10006, CRSCTL_DHCP_APPVIP_NO_VIPNAME, "APPVIP type needs a VIP name. Specify a VIP name using -vip command line option."
// *Cause: VIP resource name was missing in the command line for APPVIP type.
// *Action: Specify a VIP name using -vip option.
/
// This message should be same as to CRS-10008 in has/mesg/crsus.msg
10008, CRSCTL_DHCP_CLIENTID_FAILED, "unable to generate client ID for VIP type \"{0}\", cluster name \"{1}\", VIP resource name \"{2}\""
// *Cause: An attempt to generate client ID for the specified cluster name, VIP type and resource name failed.
// *Action: Ensure that the cluster name and VIP resource name do not exceed 252
//          characters. Make sure that VIP type is a valid VIP type. Refer to
//          'crsctl get clientid -help' for more information.
/
// This message should be same as to CRS-10009 in has/mesg/crsus.msg
10009, CRSCTL_DHCP_LEASE_OBTAINED, "DHCP server returned server: {0}, loan address: {1}/{2}, lease time: {3}"
// *Document: NO
// *Cause:
// *Action:
/
// This message should be same as to CRS-10010 in has/mesg/crsus.msg
10010, CRSCTL_DHCP_NO_DHCP_SERVERS, "unable to discover DHCP server in the network listening on port \"{0}\" for client ID \"{1}\""
// *Cause: An attempt to discover DHCP server listening on port specified failed.
// *Action: Ensure that the DHCP servers exist on the network and are listening
//          on port specified. If they are listening on a different port then
//          specify that port using the -port option. For more information refer
//          to help for 'crsctl discover dhcp' command.
/
// This message should be same as to CRS-10011 in has/mesg/crsus.msg
10011, CRSCTL_DHCP_LEASE_FAILED, "unable to request DHCP lease for client ID \"{0}\" on port \"{1}\""
// *Cause: An attempt to request DHCP lease for the specified client ID on specified port failed.
// *Action: Ensure that there are DHCP servers with IP addresses available on the network.
//          If other DHCP servers are available which are listening on a different port specify
//          an alternative port using the -port option. For more information refer to help for 'crsctl request dhcp' command.
/
// This message should be same as to CRS-10012 in has/mesg/crsus.msg
10012, CRSCTL_DHCP_LEASE_RELEASED, "released DHCP server lease for client ID \"{0}\" on port \"{1}\""
// *Document: NO
// *Cause:
// *Action:
/
// This message should be same as to CRS-10013 in has/mesg/crsus.msg
10013, CRSCTL_DHCP_LEASE_RELEASE_FAILED, "unable to release DHCP lease for client ID \"{0}\", on port \"{1}\""
// *Cause: An attempt to release DHCP lease for the specified client ID on specified port failed.
// *Action: Ensure that there are DHCP servers listening on port specified. If the DHCP server
//          is listening on a different port specify an alternative port using -port option. For more
//          information refer to help for 'crsctl release dhcp' command.
/
/
// This message should be same as to CRS-10014 in has/mesg/crsus.msg
10014, CRSCTL_DHCP_NO_NODE_NAME, "HOSTVIP type needs a node name. Specify a node name using -n option."
// *Cause: Node name was missing in the command line for HOSTVIP type.
// *Action: For HOSTVIP type node name needs to be specified via -n option.
/
// This message should be same as to CRS-10015 in has/mesg/crsus.msg
10015, CRSCTL_DHCP_INVALID_VIP_TYPE, "VIP type \"{0}\" is invalid"
// *Cause: An invalid VIP type was specified for DHCP client ID generation.
// *Action: Ensure that the VIP type is a valid VIP type. Refer to
//          'crsctl get clientid -help' for more information.
/
// This message should be same as to CRS-10035 in has/mesg/crsus.msg
10035, CRSCTL_INVALID_NAME_SERVER, "Invalid name server \"{0}\" used to resolve IP addresses."
//  *Cause: An invalid name server was used or specified in /etc/resolv.conf.
// *Action: Ensure that the name servers in /etc/resolv.conf are valid.
/
// This message should be same as to CRS-10036 in has/mesg/crsus.msg
10036, CRSCTL_DHCP_PARAM_NOT_INTEGER, "value for command line parameter \"{0}\" is not an integer"
// *Cause:  An invalid value was specified for the specified command line parameter.
// *Action: Resubmit the request with an integer value.
/
// This message should be same as to CRS-10039 in has/mesg/crsus.msg
10039, CRSCTL_DHCP_INVALID_SUBNET, "invalid subnet \"{0}\" specified"
// *Cause:  An invalid IPv4 or IPv6 subnet was supplied on the command line.
// *Action: Supply a subnet address that conforms to IETF RFC-950 or IETF RFC-5942.
/
// This message should be same as to CRS-10040 in has/mesg/crsus.msg
10040, CRSCTL_DHCP_NO_NETWORK_INTERFACES, "unable to get list of network interfaces"
// *Cause:  An attempt to retrieve the list of network interfaces failed.
// *Action: Look at the accompanying messages for more information.
/
// This message should be same as to CRS-10041 in has/mesg/crsus.msg
10041, CRSCTL_DHCP_NO_SUBNET, "subnet \"{0}\" is not configured on the node"
// *Cause:  The subnet specified did not match subnet of any network interface 
// on this node.
// *Action: Specify a subnet that matches at least one network interface's subnet
// on this node.
/
// This message should be same as to CRS-10044 in has/mesg/crsus.msg
10044, CRSCTL_INVALID_CLUSTERNAME, "invalid cluster name \"{0}\" specified"
// *Cause:  An invalid cluster name was supplied on the command line.
// *Action: Specify a cluster name which is at least one character long but no
//          more than 15 characters in length. The cluster name must be
//          alphanumeric, it cannot begin with a numeric character, and it can
//          contain hyphen (-) characters. However, it cannot end with a hyphen
//          (-) character.
/
// This message should be same as to CRS-10045 in has/mesg/crsus.msg
10045, CRSCTL_INVALID_NODENAME, "invalid node name \"{0}\" specified"
// *Cause:  An invalid node name was supplied on the command line.
// *Action: Specify a node name which is at least one character but no more
//          than 63 characters in length. The node name must be alphanumeric,
//          it cannot begin with a numeric character, and it may contain 
//          hyphen (-) characters. However, it cannot end with a hyphen (-)
//          character.
/
// This message should be same as to CRS-10048 in has/mesg/crsus.msg
10048, CRSCTL_NAME_RESOLVE_FAILED, "Name \"{0}\" was not resolved to an address of the specified type by name servers \"{1}\"."
//  *Cause: An attempt to look up an address of a specified type for the
//          indicated name using the name servers shown did not yield any
//          addresses of the requested type.
// *Action: Retry the request providing a different name or querying for a
//          different IP address type.
/
///////////////////////////////////////////////////////
/ end CRSCTL messages
//////////////////////////////////////////////////////
10090, GET_ASM_PWFILE_CVUHELPER_NO_OUTPUT, "could not retrieve ASM password file location"
//  *Cause: An attempt to execute an internal 'cvuhelper' command failed to 
//          produce any output while retrieving the ASM password file location.
//          This is an internal error.
// *Action: Contact Oracle Support Services.
/
10091, GET_ASM_PWDFILE_LOCATION_FAIL, "failed to retrieve the ASM password file location for an ASM instance."
//  *Cause: An attempt to retrieve the password file location for an ASM 
//          instance failed while verifying this file is on an ASM disk group.
//          Possibly no ASM password file was configured.
// *Action: Ensure that the password file location is set for an ASM instance.
//          Examine the accompanying messages, resolve the problems identified,
//          and retry the operation.
/
10120, TASK_ASMLIB_CONFIGFILE_ABSENT_NODE, "Failed to access ASMLib configuration file on the node \"{0}\""
//  *Cause: ASMLib configuration file '/etc/sysconfig/oracleasm-_dev_oracleasm' or link '/etc/sysconfig/oracleasm' was not found or cannot be accessed on the indicated node.
// *Action: Ensure that the ASMLib is correctly installed and configured, and specified file is present at the given path and that the user has the necessary access privileges for the configuration file.
/
10121, TASK_ASMLIB_CONFIGFILE_READ_FAILED_NODE, "Failed to retrieve ASMLib configuration value from ASMLib configuration file \"{0}\" on the node \"{1}\""
//  *Cause: The check for ASMLib configuration was unable to retrieve the required information from specified configuration file on the indicated node.
// *Action: Ensure that the ASMLib is correctly installed and configured on all the nodes and that the user has the necessary access privileges for the configuration file.
/
10122, TASK_ASMLIB_CONFIG_PARAM_INCONSISTENT_NODE, "ASMLib configuration value set to configuration parameter \"{0}\" on the node \"{1}\" does not match with cluster nodes"
//  *Cause: The ASMLib configuration check found inconsistent settings across cluster nodes.
// *Action: Ensure that the ASMLib is correctly installed and configured on all the nodes with same configuration settings and that the user has the necessary access privileges for the configuration file.
/
10123, TASK_ASMLIB_COMMAND_FILE_ABSENT_NODE, "ASMLib command utility is absent at path \"{0}\" on the nodes \"{1}\""
//  *Cause: ASMLib command utility was absent at the identified file system path on the indicated nodes.
// *Action: Ensure that the ASMLib is correctly configured on all the cluster nodes with same configuration settings and that the ASMLib version is the same on all cluster nodes.
/
10130, FS_SHARED_CHECK_FAILED, "Unable to determine whether file path \"{0}\" is shared by nodes \"{1}\""
//  *Cause: An attempt to determine whether the file path is shared across nodes failed.
// *Action: Examine the accompanying error messages for details.
/
10400, TASK_NTP_INCORRECT_REGISTRY_CONFIG, "The Windows Time service \"W32Time\" setting \"{0}\" in the Windows registry key \"HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Config\" is greater than the value recommended by Oracle. [Recommended = \"{1}\"] on nodes: \"{2}\""
//  *Cause: The indicated Windows Time service setting in the indicated
//          registry key was greater than the value recommended by Oracle.
// *Action: Modify the indicated Windows Time service setting in the indicated
//          Windows registry key to match the value recommended by Oracle.
/
10401, TASK_NTP_MISSING_REGISTRY_CONFIG, "The Windows Time service \"W32Time\" setting \"{0}\" in the Windows registry key \"HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Config\" is not found. [Recommended value = \"{1}\"] on nodes:\"{2}\""
//  *Cause: The indicated Windows Time service setting in the indicated
//          registry key was not found in the specified node.
// *Action: Add the indicated Windows Time service settings in the indicated
//          Windows registry key with the value recommended by Oracle.
/
10402, TASK_NTP_ERROR_REGISTRY_CONFIG, "The Windows Time service \"W32Time\" settings in the Windows registry key \"HKEY_LOCAL_MACHINE\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Config\" do not match the values recommended by Oracle."
//  *Cause: The specified Windows Time service settings in the specified
//          registry key were not found or do not match the value recommended
//          by Oracle.
// *Action: Examine the accompanying error messages for details.
/
10403, TASKNTP_MULTIPLE_SERVICES_ON_CLUSTER, "More than one time synchronization service was running on nodes of the cluster. Only one should be active on all the nodes at any given time."
//  *Cause: A check to determine whether the time synchronization services were
//          running on nodes of the cluster found that more than one was
//          active.
// *Action: The accompanying messages will list the time synchronization
//          service names along with the nodes on which they are running.
//          Ensure that only one time synchronization service is active on all
//          nodes of the cluster at any given time by shutting down others.
/
10404, SERVICE_NOT_RUNNING_ON_NODES, "The network time synchronization service with the name \"{0}\" is not running on nodes: \"{1}\""
//  *Cause: A check to determine whether the indicated network time
//          synchronization service was running on nodes of the cluster found
//          that it was not running on the indicated nodes.
// *Action: Ensure that the identified network time synchronization service is
//          running and correctly configured on the indicated nodes. Only one
//          network time synchronization service can be running on nodes of the
//          cluster at any given time.
/
10405, ERR_CHECK_SERVICE_STATUS, "Service check cannot be performed for service \"{0}\" on nodes: \"{1}\""
//  *Cause: An error was encountered while trying to determine if the
//          identified service was running on the specified nodes.
// *Action: Examine the accompanying error messages for details, rectify issues
//          identified and retry.
/
10406, TASK_NTP_VFY_SERVICE_NAME, "service \"{0}\" is running"
// *Document: NO
// *Cause:
// *Action:
/
10407, TASK_NTP_VFY_REGISTRY_NAME, "service \"{0}\" registry settings"
// *Document: NO
// *Cause:
// *Action:
/
10408, TASK_NTP_SRVC_NOTALIVE_ALL_NODES, "A verified network time synchronization service was not running on all of the cluster nodes. A single verified network time synchronization service should be active on all the nodes at any given time."
//  *Cause: A check to determine whether the network time synchronization
//          services were running on nodes of the cluster found that none was
//          active on any of the cluster nodes.
// *Action: The accompanying messages list the network time synchronization
//          service names along with the nodes on which they are not running.
//          Examine the accompanying error messages and respond accordingly.
/
10409, TASK_NTP_ERR_SERVICE_NOT_EXISTS, "The network time synchronization service \"{0}\" is not installed on nodes: \"{1}\""
//  *Cause: A check to determine whether the indicated network time
//          synchronization service was running on nodes of the cluster found
//          that that service was not installed on the indicated nodes.
// *Action: Ensure that the identified network time synchronization service is
//          installed, running and correctly configured on the specified nodes.
//          Only one network time synchronization service can be running on
//          nodes of the cluster at any given time.
/
10410, TASK_NTP_ERR_SERVICE_RUNNING, "The network time synchronization service with the name \"{0}\" is running on nodes: \"{1}\""
// *Document: NO
// *Cause:
// *Action:
/
10430, NETWORK_DEFAULT_GATEWAY_NOT_FOUND, "failed to retrieve the default gateway address on node \"{0}\"."
//  *Cause: The default gateway address was not configured on the specified node.
// *Action: Ensure that the default gateway address is configured on the specified node.
/
10450, BLOCK_DEVICE_NOT_SUPPORTED, "The device specified by path \"{0}\" is a block device, which is not supported on the current platform."
//  *Cause: An attempt to obtain storage information for a device identified by the
//          indicated path was rejected because the path identified a block device and only
//          character devices were supported on the current platform.
// *Action: To obtain storage information for the indicated device, retry the request specifying the character device path. 
/
10451, STORAGE_GET_NFSINFO_TIMEOUT, "failed to retrieve the NFS mount point information for the mount point \"{1}\" due to timeout after \"{2}\" seconds"
//  *Cause: The cluster verification operation failed because an attempt to retrieve the file system information for the NFS storage at the indicated mount point timed out.
// *Action: Ensure that the NFS server for the indicated mount point is running or unmount the associated file system.
/
10460, NOT_A_MEMBER_OF_GROUP_FOR_PRIVILEGES, "User \"{0}\" does not belong to group \"{1}\" selected for privileges \"{2}\" on node \"{3}\"."
//  *Cause: While performing prerequisite checks, Cluster Verification Utility
//          (CVU) checked group membership for the indicated user and found
//          that the indicated user was not a member of the indicated group
//          selected for the indicated privileges on the indicated node.
// *Action: Make the user a member of the group on the indicated node.
/
10461, GROUP_NO_EXISTENCE_FOR_PRIVILEGES, "Group \"{0}\" selected for privileges \"{1}\" does not exist on node \"{2}\"."
//  *Cause: While performing prerequisite checks, Cluster Verification Utility
//          (CVU) checked for the existence of the indicated group and found
//          that the indicated group selected for the indicated privileges did
//          not exist on the indicated node.
// *Action: Create the group on the indicated node.
/
10462, TASK_ELEMENT_ASM_PRIVILEGE_CHECK_RAC_USER, "ASM storage privileges for the user: {0}"
// *Document: NO
// *Cause:
// *Action:
/
10463, TASK_DESC_ASM_PRIVILEGE_CHECK_RAC_USER, "This task verifies that the user \"{0}\" has suffcient privileges to access the Oracle Automatic Storage Management (Oracle ASM) devices."
// *Document: NO
//  *Cause:
// *Action:
/
10464, ASM_PRIVILEGE_CHECK_RAC_USER_FAILED, "The user \"{0}\" does not have sufficient privileges to access the Oracle Automatic Storage Management (Oracle ASM) devices on nodes \"{1}\"."
//  *Cause: While performing database prerequisite checks, the Cluster
//          Verification Utility (CVU) checked for the granted privileges of
//          the indicated user and found that the indicated user was not a
//          member of the OSDBA group configured in the Grid Infrastructure
//          home and therefore did not have privileges to access the Oracle
//          Automatic Storage Management (Oracle ASM) devices on the indicated
//          nodes.
// *Action: Examine the accompanying error messages, add the indicated user to
//          the group with OSDBA privileges in the indicated nodes and retry.
/
10465, TASK_AFD_CAPABLE_DISKS, "ASM Filter Driver capability of ASM devices"
// *Document: NO
// *Cause:
// *Action:
/
10466, NM_INIT_WITHOUT_CRS, "Failed to determine cluster node roles. Verification will proceed considering nodes \"{0}\" as hub nodes."
//  *Cause: An attempt to determine cluster node roles failed because CRS was
//          not found running on the local node. Since the verification checks 
//          were carried out assuming the indicated nodes were hub nodes, the 
//          final results were valid only if the nodes were, in fact, Hub nodes.
// *Action: To ensure that all checks are done correctly, ensure that CRS is 
//          running on the local node and retry.
/
10467, GET_DEFAULT_ORAINV_GROUP_FAILED, "The default Oracle Inventory group could not be determined."
// *Cause: An attempted Cluster Verification Utility (CVU) validation check 
//         failed because either the Oracle Inventory group could not be 
//         read from the inventory configuration file or the primary group 
//         could not be retrieved. This occurred because either the file did 
//         not exist, the property was not found, or the primary group was not 
//         found in the /etc/group file. Detailed failure information is 
//         provided in the accompanying error messages.
// *Action: Ensure that the inventory file exists and contains the Oracle 
//          Inventory property. On Linux and UNIX machines, verify that the 
//          primary group is found in the file /etc/group.
/
10468, CONFIGURED_ORAINV_GROUP_FAILED, "unable to read the configured Oracle Inventory group"
// *Cause: Reading from the inventory configuration file failed. Detailed 
//         failure information, including the attempted read location, is 
//         provided in the accompanying error messages.
// *Action: Ensure that the inventory location is correct and that it can be 
//          read.
/
10470, TASK_ELEMENT_NETWORK_IF_CLASSTYPE_ATTRIBUTE, "network interfaces CLASS/TYPE attribute"
// *Document: NO
// *Cause:
// *Action:
/
// Translator: do not translate 'inherited'
10471, TASK_DESC_NETWORK_IF_CLASSTYPE_ATTRIBUTE, "This task verifies that the PUBLIC network interfaces CLASS/TYPE attribute is not set to the unsupported value 'inherited' on the non-global zone cluster nodes."
// *Document: NO
// *Cause:
// *Action:
/
// Translator: do not translate 'static' 'inherited'
10472, PUBLIC_NETWORK_IFCLASSTYPE_INHERITED_FAILED, "The CLASS/TYPE attribute configured on the PUBLIC network interfaces \"{0}\" is set to an unsupported value 'inherited' on nodes \"{1}\"."
//  *Cause: While performing Oracle Grid Infrastructure prerequisite checks,
//          the Cluster Verification Utility (CVU) checked for the network 
//          interface attribute CLASS/TYPE configured on the indicated PUBLIC
//          network interfaces and found that the indicated attribute is set to
//          an unsupported value 'inherited' on the indicated nodes.
// *Action: Configure the indicated network interfaces with the CLASS/TYPE
//          attribute set to 'static' on the indicated nodes and retry.
/
10485, BASELINE_HDR_ASM, "ASM / ASM Instance"
// *Document: NO
// *Cause:
// *Action:
/
10486, BASELINE_HDR_ASM_DG_DISK, "ASM / ASM Instance / Disk Group / Disk"
// *Document: NO
// *Cause:
// *Action:
/
10487, TASK_ASMDEVCHK_NOTSHARED, "Storage \"{0}\" is not shared on all nodes."
//  *Cause: The indicated storage was not shared across the nodes.
// *Action: Review additional error messages for details.
/
10488, ERR_ASMADMIN_FROM_CRSHOME, "Error attempting to obtain the OSASM group from CRS home \"{0}\" "
//  *Cause: An attempt to obtain the OSASM group failed. The accompanying error
//          messages provide detailed failure information.
// *Action: Examine the accompanying error message for details, resolve the
//          problems identified and retry.
/
10489, ERR_ASMADMIN_SAME_AS_DBUSER_GROUP, "Database user OS group is recommended to be different from the OSASM group \"{0}\""
//  *Cause: The OSASM group was found to be the same as the current user OS 
//          group. It is recommended that SYSDBA and SYSASM privileges be 
//          separate. 
// *Action: Ensure that the database user OS group is not the same as the 
//          OSASM group.
/
10490, AFD_CONFIG_NOT_AVAILABLE, "The ASM Filter Driver is not available."
//  *Cause: An attempt to resolve a label to a disk failed because the ASM
//          Filter Driver (AFD) was not available. The accompanying messages
//          provide detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve the
//          problems identified and retry.
/
10491, AFD_LABEL_NOT_LISTED, "The AFD did not recognize the disk label \"{0}\"."
//  *Cause: An attempt to find a disk with the specified label was rejected
//          because the ASM Filter Driver (AFD) did not recognize the label. 
// *Action: Either
//          1) Retry the operation specifying a disk that is managed by the 
//             AFD. The command 'afdtool -getdevlist "*"' can be used to 
//             list the labels on all AFD managed disks.
//          or
//          2) Relabel the disk using the command
//             'asmcmd afd_label <label> <disk>' and retry the operation.
/
10496, CDM_INVALID_ROOT_ELEMENT, "invalid or missing root element in the XML file \"{0}\""
//  *Cause: File validity checking determined that the indicated XML file was 
//          not valid because the root element was invalid or missing.
// *Action: Ensure that the root element exists in the indicated XML file.
/
10497, CDM_INVALID_DEF_MULTIPLE_SYSTEMS, "zero or multiple({0}) system elements specified in XML file \"{1}\""
//  *Cause: File validity checking determined that the indicated XML file was 
//          not valid because it contained zero or multiple system elements.
// *Action: Ensure that only one system element exists in the indicated XML 
//          file.
/
10500, CONFIG_DEF_HOSTNAMELENGTH, "Check for length of the host name"
// *Document: NO
//  *Cause:
// *Action:
/
10501, ERR_CHECK_HOSTNAME, "Check of hostname length could not be performed on node \"{0}\""
//  *Cause: The length of the host name could not be retrieved on the node indicated.
// *Action: Ensure that nodes that will run Oracle database releases prior to 11gR2 have an unqualified host name less than or equal to 8 characters.
/
10502, HOSTNAME_TOO_LONG, "The length of the host name was greater than 8 characters on node \"{0}\""
//  *Cause: Length of the hostname should be less than or equal to 8 characters or pre-11gR2 Database releases may not run properly.
// *Action: Rename the host to have a length less than or equal to 8 characters.
/
10503, HOSTNAME_PASS_MSG, "Check for host name length passed"
// *Document: NO
//  *Cause:
// *Action:
/
10504, HOSTNAME_FAIL_MSG, "Check for host name length failed"
// *Document: NO
//  *Cause:
// *Action:
/
10505, TASK_DESC_HOSTNAMELENGTH, "This is a prerequisite condition to verify the length of the hostname"
// *Document: NO
//  *Cause:
// *Action:
/
10506, TASK_ELEMENT_HOSTNAMELENGTH, "Hostname Length"
// *Document: NO
//  *Cause:
// *Action:
/
10507, HOSTNAME_SET_TO_NON_STANDARD_VALUE, "CVU found an invalid host name \"{0}\" which resolves to a loopback address on node \"{1}\"."
//  *Cause: The Cluster Verification Utility (CVU) determined that the 
//          indicated host name resolved to a loopback address on the indicated 
//          node.
// *Action: Ensure that the indicated host name does not resolve to a loopback 
//          address and retry the CVU operation.
/
10508, TASK_ELEMENT_HOSTNAME_VALIDATION, "Host name"
// *Document: NO
//  *Cause:
// *Action:
/
10509, TASK_DESC_HOSTNAME_VALIDATION, "Check for invalid characters in the host name and that the host name does not resolve to a loopback address"
// *Document: NO
//  *Cause:
// *Action:
/
10510, TASK_ERROR_CURRENT_USER_DOMAIN_USER, "User \"{0}\" is not a domain user, domain name absent"
//  *Cause: Could not identify domain name of current user. 
// *Action: Log in to the OS as a domain user.
/
10511, TASK_HOSTNAME_RETRIEVAL_FAILED, "failed to retrieve the host name using command \"{0}\" on node \"{1}\""
//  *Cause: An error occurred while retrieving the host name using the 
//          indicated command on the indicated node. The accompanying messages 
//          provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then retry the operation.
/
10520, FAIL_RESOLVE_ASMSTAMP_NODE, "ASM disk label \"{0}\" did not resolve to any device path on node \"{1}\""
//  *Cause: ASM disk label could not be resolved to any device on specified node.
// *Action: Ensure that the specified ASM label is correctly stamped on a shared device on the node specified. To verify the label to disk mapping 
//          use tools 'Asmtoolg' on Windows operating system platforms and 'oracleasm' on the Linux operating system platform. 
/
10521, ERROR_RESOLVE_ASMSTAMP_NODE, "Failed to resolve ASM disk label \"{0}\" to device path on node \"{1}\""
//  *Cause: Failed to resolve ASM disk label to any device on specified node.
// *Action: Ensure that the specified ASM label is correctly stamped on a shared device on the node specified and that the labeled devices are accessible to current user.
//          To verify the label to disk mapping use tools 'Asmtoolg' on Windows operating system platforms and 'oracleasm' on the Linux operating system platform. 
/
10522, ASMDEV_STAMP_MANAGED_BY_ASM_PASSED, "Disks \"{0}\" are managed by ASM."
// *Document: NO
//  *Cause:
// *Action:
/
10523, ASMDEV_STAMP_MANAGED_BY_ASMLIB_FAILED, "Disk \"{0}\" is not identified by ASMLib."
//  *Cause: The indicated disk was not identified by ASMLib.
// *Action: Ensure that the ASMLib is correctly configured on all the cluster nodes and that the indicated disk is listed by 'oracleasm' on the Linux operating system platform. 
/
10524, ASMDEV_STAMP_MANAGED_BY_ASMLIB_ERROR, "failed to determine whether disk \"{0}\" is managed by ASMLib"
//  *Cause: An attempt to validate whether the indicated disk was managed by ASMLib failed.
// *Action: Ensure that the ASMLib is correctly configured on all the cluster nodes and that the indicated disk is listed by 'oracleasm' on the Linux operating system platform.
/
10530, UNEXPECTED_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Oracle internal error. Contact Oracle Support Services.
/
10540, TASK_OCR_MUST_BE_ON_ASM, "OCR location \"{0}\" is not located on Oracle ASM storage"
//  *Cause: An attempt was made to add Oracle Cluster Repository (OCR) storage
//          on a device that is not managed by Oracle Automatic Storage
//          Management (Oracle ASM). All OCR storage must be located on Oracle
//          ASM storage.
// *Action: Ensure that all OCR storage is located on Oracle ASM and retry
//          the operation.
/
10541, TASK_VOTINGDISK_MUST_BE_ON_ASM, "Voting disk \"{0}\" is not located on Oracle ASM storage"
//  *Cause: An attempt was made to add voting disk storage on a device
//          that is not managed by Oracle Automatic Storage Management
//          (Oracle ASM). All voting disk storage must be located on
//          Oracle ASM.
// *Action: Ensure that all voting disk storage is located on Oracle ASM
//          and retry the operation.
/
10600, TASK_ELEMENT_CRS_VERSION_CONSISTENCY, "Clusterware Version Consistency"
// *Document: NO
//  *Cause:
// *Action:
/
10601, TASK_DESC_CRS_VERSION_CONSISTENCY, "This test checks the consistency of Clusterware release version and active version across nodes."
// *Document: NO
//  *Cause:
// *Action:
/
10602, TASK_CRS_VERSION_CONSISTENCY_PASS, "Clusterware version consistency passed."
// *Document: NO
//  *Cause:
// *Action:
/
10603, TASK_CRS_VERSION_CONSISTENCY_FAIL, "Clusterware version consistency failed."
// *Document: NO
//  *Cause:
// *Action:
/
10604, FAIL_GET_CRS_RELEASE_VERSION_NODES, "Failed to retrieve release version from the following nodes:"
// *Document: NO
//  *Cause:
// *Action:
/
10605, RELEASE_CONSISTENT_ACTVERS_MISMATCH, "Release version [{0}] is consistent across nodes but does not match the active version [{1}]."
//  *Cause: During pre-upgrade validation, the Clusterware release version was consistent but did not match the active version.  Usually this results from a failed upgrade.
// *Action: A forced upgrade may be required.
/
10606, RELEASEVER_INCONSISTENT, "Release versions [{0}] are inconsistent across nodes."
//  *Cause: Inconsistent release versions were found on two or more nodes. This might be caused by an upgrade in progress.
// *Action: Ensure that any pending upgrade is complete.
/
10700, TASK_ELEMENT_DB_CRS_VERSION_COMPATIBILITY, "Database Clusterware Version Compatibility"
// *Document: NO
//  *Cause:
// *Action:
/
10701, TASK_DESC_DB_CRS_VERSION_COMPATIBILITY, "This test checks that the Database version is compatible with the CRS version."
// *Document: NO
//  *Cause:
// *Action:
/
10702, TASK_DB_CRS_VERSION_COMPATIBILITY_PASS, "Database Clusterware version compatibility passed."
// *Document: NO
//  *Cause:
// *Action:
/
10703, TASK_DB_CRS_VERSION_COMPATIBILITY_FAIL, "Database Clusterware version compatibility consistency failed."
// *Document: NO
// *Cause:
// *Action:
/
10704, DB_CRS_VERSION_COMPATIBILE, "Database version \"{0}\" is compatible with the Clusterware version \"{1}\"."
// *Document: NO
// *Cause:
// *Action:
/
10705, DB_CRS_VERSION_INCOMPATIBILE, "Database version \"{0}\" is not compatible with the Clusterware version \"{1}\"."
// *Cause: Clusterware version has to be equal to or greater than the database version.
// *Action: Upgrade Clusterware to a higher version.
/
10706, TASK_START_DB_CRS_VERSION_COMPATIBILITY, "Checking Database and Clusterware version compatibility"
// *Document: NO
//  *Cause:
// *Action:
/
10707, TASK_ELEMENT_CHECK_CLUSTER_STATE, "cluster upgrade state"
// *Document: NO
//  *Cause:
// *Action:
/
10708, TASK_DESC_CHECK_CLUSTER_STATE, "This test checks the upgrade state of the cluster."
// *Document: NO
//  *Cause:
// *Action:
/
10709, TASK_CHECK_CLUSTER_STATE_PASS, "Cluster upgrade state check passed."
// *Document: NO
//  *Cause:
// *Action:
/
10710, TASK_CHECK_CLUSTER_STATE_FAIL, "Cluster upgrade state check failed."
// *Document: NO
//  *Cause:
// *Action:
/
10951, ROOT_PRIMARY_GROUP_CHECK_START, "Starting check for consistency of primary group of root user"
// *Document: NO
//  *Cause:
// *Action:
/
10952, ROOT_CONSISTENCY_FAILED, "Check for consistency of root users primary group failed on the following nodes: \"{0}\""
// *Cause: The primary group and group id of the root user was not consistent across all the nodes.
// *Action: Ensure that the root user's primary group name and ID exists on all the nodes and that the root user is a member of this group.
/
10953, ROOT_CONSISTENCY_ERR, "Check for consistency of root users primary group had a command failure on the following nodes: \"{0}\""
// *Cause: An OS command issued while checking user group information failed unexpectedly.
// *Action: Contact Oracle Support.
/
10954, ROOT_CONSISTENCY_SUCCESSFUL, "Check for consistency of root user's primary group passed"
// *Document: NO
//  *Cause: 
// *Action:  
/
10955, TASK_ELEMENT_ROOT_CONSISTENCY, "Root user consistency"
// *Document: NO
//  *Cause:
// *Action:
/
10956, TASK_DESC_ROOT_CONSISTENCY, "This test checks the consistency of the primary group of the root user across the cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
10957, ROOT_PRIMARY_GROUP_CHECK_PASS, "Check for consistency of root user's primary group passed"
// *Document: NO
//  *Cause:
// *Action:
/
10958, ROOT_CONSISTENCY_FAILED_NODE, "Check for consistency of root users primary group \"{0}\" on node: \"{1}\" failed. The group membership of root user for group \"{2}\" does not exist on the following nodes: \"{3}\""
// *Cause: The indicated primary group and group id of the root user was not found in the existing membership groups of the root users on the identified nodes.
// *Action: Ensure that the indicated primary group name and ID of the root user exists on all the cluster nodes, and that the root user has membership in the indicated group on each of the cluster nodes.
/
10959, ROOT_CONSISTENCY_ERR_NODE, "Check for consistency of root users primary group had a command failure on the following node: \"{0}\""
// *Cause: An OS command issued while checking user group information failed unexpectedly.
// *Action: Contact Oracle Support.
/
11000, DBUTIL_INVALID_API, "Invalid usage of CVU internal function"
//  *Cause: This is an internal error.
// *Action: Please contact Oracle Support.
/
11001, CMD_EXEC_FAILED, "Failed to execute command \"{0}\" on node \"{1}\""
//  *Cause: An error occurred while executing the command.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
11003, SCAN_NOT_DEFINED, "SCAN is not configured"
//  *Cause: An attempt to retrieve SCAN failed.
// *Action:  Ensure that SCAN is properly defined in this cluster. Use 'srvctl add scan' to add SCAN.
/
11004, SCAN_LSNR_NOT_DEFINED, "SCAN listener is not configured"
//  *Cause: An attempt to retrieve SCAN listener configuration failed.
// *Action:  Ensure that SCAN is properly defined in this cluster. Use 'srvctl add scan_listener' to add SCAN listener.
/
11005, DB_NOT_DEFINED, "Database  \"{0}\" is not defined in this cluster"
//  *Cause: An attempt to retrieve cluster-specific metadata about the database failed.
// *Action: Ensure that the database name was specified correctly. Use 'srvctl add database' to enable Clusterware support for the database.
/
11006, NODE_VIP_NOT_DEFINED, "VIPs are not defined for the nodes on which database \"{0}\" is running"
//  *Cause: An attempt to retrieve the VIP on which the indicated database is running failed.
// *Action:  Ensure that VIPs are properly defined in this cluster. Use 'srvctl add vip' to add VIP.
/
11007, DB_INST_NOT_DEFINED, "No instances are defined for database \"{0}\""
//  *Cause: An attempt to retrieve database instances for the database failed.
// *Action:  Ensure that at least one database instance is defined. Use 'srvctl add instance' to add database instance.
/
11008, GET_NODES_CVUHELPER_NO_OUTPUT_VAL, "An internal command \"cvuhelper\" returned \"{0}\" while fetching the node list for database unique name \"{1}\"."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: Examine the accompanying error messages for details.
//          Address issues found and retry the operation.
/
11009, GET_NODES_CVUHELPER_NO_OUTPUT, "An internal command \"cvuhelper\" exited unexpectedly while fetching the node list for database \"{0}\"."
//  *Cause: An attempt to execute an internal cvuhelper command exited unexpectedly.
// *Action: Examine the accompanying error messages for details.
//          Address issues found and retry the operation.
/
11010, GET_DB_INFOS_CVUHELPER_NO_OUTPUT_VAL, "An internal command 'cvuhelper' returned \"{0}\" while fetching cluster databases."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: Examine the accompanying error messages for details.
//          Address issues found and retry the operation.
/
11011, GET_DB_INFOS_CVUHELPER_NO_OUTPUT, "An internal command 'cvuhelper' exited unexpectedly while fetching cluster databases."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: Examine the accompanying error messages for details.
//          Address issues found and retry the operation.
/
11049, IF_NO_MATCH, "Interface \"{0}\" does not exist on nodes \"{1}\""
//  *Cause: The interface was classified as cluster interconnect or public but the interface was not found on the nodes.
// *Action: Ensure that the same network interface is defined on each node of Cluster.
/
11050, IF_NO_MATCH_SUBNET, "No matching interfaces \"{0}\" for subnet \"{1}\" on nodes \"{2}\""
//  *Cause: The interfaces classified as cluster interconnect or public were not found on the specified subnet on the nodes. 
// *Action: Ensure that at least one interface with specified name is on the specified subnet on each node of Cluster.
/
11051, NLIST_INVALID_FORMAT, "network list is in invalid format"
//  *Cause: The processing of a network list argument encountered a syntax error.
// *Action: Network list is a comma separated list of networks. Each network can be specified in the format \"if_name\"[:subnet_id[:public|cluster_interconnect]]. if_name can have \"*\" as in \"eth*\" to match interfaces like eth1, eth02, etc. Provide network list in valid format.
/
11052, IF_INVALID_QUOTES, "Interface name is not enclosed within double quotes"
//  *Cause: Interface name in the interface list was not enclosed within double quotes.
// *Action: Provide interface name within double quotes.
/
11053, IF_INVALID_TYPE, "Invalid subnet type"
//  *Cause: Invalid subnet type was specified in interface list.
// *Action: Provide public or cluster_interconnect as subnet type.
/
11054, IF_NOT_FOUND, "Interface \"{0}\" not found on this node"
//  *Cause: Failed to locate the interface on this node.
// *Action: Provide interface names configured on the node on which CVU is running.
/
11055, IF_MULTIPLE_SUBNETMASKS, "Interfaces configured with subnet \"{0}\" have multiple subnet masks."
//  *Cause: Cluster Verification Utility (CVU) check determined that interfaces of some nodes 
//          were configured with different subnet masks for the same 
//          subnet number.
// *Action: This message is accompanied by another message that lists the 
//          subnet masks information on the nodes. Ensure that all of the  
//          interfaces within the indicated subnet have the same subnet mask on
//          all of the nodes and retry the node connectivity check.
/
11056, IF_SUBNETMASK, "Subnet \"{0}\" has different subnet masks \"{1}\" on nodes \"{2}\"."
//  *Cause: Cluster Verification Utility (CVU) check determined that interfaces on the indicated `
//          subnet did not have the same subnet mask, which would result in
//          routing conflicts.
// *Action: Ensure that all of the interfaces on the indicated subnet have
//          the same subnet mask configured on all of the nodes and retry the 
//          node connectivity check.
/
11057, NETMASK_CHECK_START, "Checking subnet mask consistency..."
//  *Cause: NO
// *Action: 
/
11058, NETMASK_CHECK_PASS, "Subnet mask consistency check passed."
//  *Cause: NO
// *Action: 
/
11059, NETMASK_CHECK_PASS_SUBNET, "Subnet mask consistency check passed for subnet \"{0}\"."
//  *Cause: NO
// *Action: 
/
11060, NETMASK_CHECK_FAIL, "Subnet mask consistency check failed."
//  *Cause: NO
// *Action: 
/
11061, NODE_CON_MTU_DIFF_PRIV, "Different MTU values used across cluster interconnect network interfaces \"{0}\" on subnets \"{1}\" with MTU values \"{2}\" on the node \"{3}\".  The most common MTU value is \"{4}\"."
//  *Cause: Cluster Verification Utility (CVU) connectivity checking determined that the indicated 
//          interfaces on the indicated subnets were configured with 
//          different maximum transmission units (MTU) values.
// *Action: Configure the indicated interfaces on the indicated subnets to have 
//          the same MTU value and retry the node connectivity check.
/
11062, NODE_CON_INTERFACE_SUB, "Check: Node connectivity using interfaces on subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: will be preceded by "Verifying" from
// opsm/oracle/ops/verification/resources/PrvfMsg.msg ID 8110
11063, TASK_NETMASK_CHECK, "subnet mask consistency for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11065, NODE_CON_DOWN_INFS, "Node connectivity checks will not be performed on network interfaces \"{0}\" on node \"{1}\" because they were down."
//  *Cause: The indicated network interfaces on the indicated nodes were not 
//          considered for node connectivity checks because they were down.
// *Action: If the indicated interfaces are to be used by the cluster bring them up and repeat this test.
/
11067, NODE_CON_TCP_FAIL, "TCP connectivity from node \"{0}\": \"{1}\" to node \"{2}\": \"{3}\" failed."
//  *Cause: Errors occurred while attempting to establish Transmission 
//          Control Protocol (TCP) connectivity between the identified two
//          interfaces.
// *Action: Ensure that there are no firewalls blocking TCP operations and no 
//          process monitors running that can interfere with programs' 
//          network operations.
/
11068, EXADATA_HAIP_ENABLED_POST_18, "Highly Available IP (HAIP) is enabled on the nodes \"{0}\"."
//  *Cause: The Cluster Verification Utility (CVU) found that the HAIP was
//          enabled on the indicated nodes. HAIP is not supported on Exadata
//          for Oracle Clusterware 18c release onwards.
// *Action: Ensure that the HAIP is disabled using 'crsctl modify resource 
//          ora.cluster_interconnect.haip -attr "ENABLED=0" -init' command and 
//          no instances of ASM and DB are using the HAIP addresses by updating 
//          the 'cluster_interconnects' parameter with private IP addresses 
//          using SQL before upgrade.
/
11069, IF_LINK_LOCAL_ADDRESS, "IP address \"{0}\" of network interface \"{1}\" on the node \"{2}\" would conflict with HAIP usage."
//  *Cause: One or more network interfaces have IP 
//          addresses in the range (169.254.*.*), the range used by HAIP which
//          can create routing conflicts.
// *Action: Make sure there are no IP addresses in the range (169.254.*.*) 
//          on any network interfaces.
/
11070, NON_PVT_IF_LINK_LOCAL_ADDRESS, "IP address \"{0}\" of non-private network interface \"{1}\" on the node \"{2}\" would conflict with HAIP usage."
//  *Cause: One or more non-private network interfaces have IP 
//          addresses in the range (169.254.*.*), the range used by HAIP which
//          can create routing conflicts.
// *Action: Make sure there are no IP addresses in the range (169.254.*.*) 
//          on any non-private network interfaces.
/
11071, PVT_IF_LINK_LOCAL_ADDRESS, "IP address \"{0}\" of private network interface \"{1}\" on the node \"{2}\" with subnet mask \"{3}\" would conflict with HAIP usage."
//  *Cause: One or more private network interfaces have IP 
//          addresses in the range (169.254.*.*) and subnet mask which is not
//          16-18 bits, the range used by HAIP which can create routing conflicts
// *Action: Make sure there are no IP addresses in the range (169.254.*.*) 
//          with subnet mask which is not 16-18 bits on any private network interfaces.
/
11072, EXADATA_PVT_IF_NON_INFINIBAND, "Private network Interface \"{0}\" on node \"{1}\" with IP address \"{2}\" is not Infiniband."
//  *Cause: One or more private network interfaces on the system were not
//          Infiniband.  In an Exadata environment, if private interfaces
//          are not Infiniband, connection failures will result.
// *Action: Make sure all the private interfaces in an Exadata environment
//          are Infiniband type.
/
11073, OVERLAPPING_SUBNETS, "Subnet on interface \"{0}\" of node \"{1}\" is overlapping with the subnet on interface \"{2}\". IP address range [\"{3}\"-\"{4}\"] is overlapping with IP address range [\"{5}\"-\"{6}\"]."
//  *Cause: IP ranges were overlapping on one or more subnets.  This would
//          result in routing failures.
// *Action: Ensure that subnets do not have overlapping IP address ranges.
/
11074, AIX_PVT_INTERFACE_LINK_NOT_MONITORED, "Private network interface \"{0}\" on node \"{1}\" with IP address \"{2}\" does not have MONITOR option set."
//  *Cause: One or more private network interfaces on the system did not have 
//          the MONITOR option in the interface information.  This may 
//          lead to network failures if the interfaces are disabled 
//          or disconnected.
// *Action: Make sure all the private interfaces have the MONITOR option set.
//          To enable the MONITOR option for a particular interface, run the
//          following command as the root user: 
//          'ifconfig <interfacename> MONITOR'
/
11076, NODE_CON_DEPRECATED_INTERFACES, "Found deprecated interfaces \"{0}\" with corresponding IP addresses \"{1}\" on the following nodes: \"{2}\".  These interfaces will be skipped for node connectivity checks."
//  *Cause: Cluster Verification Utility (CVU) connectivity checking determined that there were interfaces 
//          which had the DEPRECATED flag set in the interface information. 
//          These deprecated interfaces will not be considered for node 
//          connectivity checks.
// *Action: If the indicated interfaces need to be considered for node
//          connectivity checks, use the ifconfig (ipconfig for Windows) 
//          command to unset the DEPRECATED flag for these
//          interfaces and retry the node connectivity checks.
/
11077, NODE_CON_MTU_DIFF_NON_PRIVATE, "Different MTU values used across the network for interfaces \"{0}\" on subnets \"{1}\" with MTU values \"{2}\" on the node \"{3}\".  The most common MTU value is \"{4}\"."
//  *Cause: Cluster Verification Utility (CVU) connectivity checking determined that there were different 
//          maximum transmission unit (MTU) values found on non-private or
//          unclassified interfaces on the indicated subnets. 
// *Action: Configure the indicated interfaces on the indicated subnets to have the 
//          same MTU value and retry the connectivity check.
/
11078, SUMMARY_FAILED_NODE_CON_SUBNET, "node connectivity failed for subnet \"{0}\""
//  *Cause: Node connectivity checks for the specified subnet failed.
// *Action: Review the accompanying messages for details of the cause of failure.
/
11079, INVALID_SUBNET_ID_ON_NETWORK, "Subnet value \"{1}\" of interface \"{2}\" is invalid on node \"{3}\"."
//  *Cause: Cluster Verification Utility (CVU) connectivity checking determined that the subnet 
//          attribute had an invalid value on the indicated node for the 
//          indicated interface.
// *Action: Ensure that the indicated network interface has a valid subnet value
//          for the indicated interface and retry the node connectivity checks.
/
11080, INVALID_INTERFACE_NAME, "empty or null value in the interface field on node \"{1}\""
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
11081, NO_MATCHING_NETWORK_INFO_FOUND_ON_NODES, "unable to find the matching networks for the interface \"{0}\" and the subnet \"{1}\" on nodes \"{2}\""
//  *Cause: Cluster Verification Utility (CVU) connectivity checking determined 
//          that the interface-subnet combination was not found on the 
//          indicated nodes.
// *Action: Ensure that the interface-subnet combination is installed,
//          is online on the indicated nodes, and retry the node
//          connectivity checks.
/
11082, CHECK_MTU_CONSISTENCY_SUBNET, "Check: MTU consistency of the subnet \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
11083, PVT_CHECK_MTU_CONSISTENCY_SUBNET, "Check: MTU consistency on the private interfaces of subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11084, SUMMARY_PASS_MTU_CONSISTENCY_SUBNET, "MTU consistency check passed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11085, SUMMARY_FAIL_MTU_CONSISTENCY_SUBNET, "MTU consistency check failed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11086, NO_NETWORK_WITH_STATUS_UP, "could not find any network interface having status as UP on the nodes \"{0}\""
//  *Cause: Cluster Verification Utility (CVU) connectivity checking determined that 
//          the indicated nodes did not have any network interface with status UP
// *Action: Ensure that there is at least one interface with status UP
//          on the indicated node and retry the node connectivity check.
/
11087, INVALID_SUBNET_IN_INTERCONNECT_LIST, "Invalid subnet \"{0}\" was specified in the interconnect list for the interface \"{1}\".  This interface will not be included in further checks."
// *Cause:  Cluster Verification Utility (CVU) connectivity checking determined 
//          that an invalid IPv4 or IPv6 subnet was supplied on the command 
//          line or in the CVU variable.
// *Action: If a specific subnet needs to be considered, supply a subnet 
//          address that conforms to IETF RFC-950 or IETF RFC-5942 and retry
//          the operation.
/
11088, INVALID_VALUE_IN_NETWORK_INFORMATION, "Interface \"{0}\" has invalid value \"{1}\" for the network attribute \"{2}\" on the node \"{3}\"."
//  *Cause: An internal error occurred while performing the node 
//          connectivity checks.
// *Action: This is an internal error. Contact Oracle Support Services.
/
11089, INVALID_INTERCONNECT_LIST_VALUE, "Could not find a valid network entry in the interconnect list." 
// *Cause:  Cluster Verification Utility (CVU) connectivity checking determined
//          that the specified interconnect list did not have a valid network
//          to be considered for the connectivity checks.  This could be due to 
//          invalid values supplied for one or more interface names, subnets 
//          or network types in the interconnect list.
// *Action: If one or more specific networks need to be considered, supply valid
//          values for the interface name, optional subnet value and optional 
//          network type for each network and retry the operation.
/
11090, NODES_CON_INTERFACE_UNAVAILABLE, "returned network interface list empty on nodes \"{0}\""
//  *Cause: Cluster Verification Utility (CVU) node connectivity check 
//          determined that network interfaces discovery returned an empty
//          list.  This may indicate a configuration problem or an internal 
//          error with the remote check.  
// *Action: Verify the operational status of the network interfaces on the
//          indicated nodes, configure the network interfaces according to the
//          documentation and retry the node connectivity check.
//          If the configuration has been validated on the indicated nodes, and
//          the problem persists, contact Oracle Support Services.
/
11091, FAIL_COPYING_DIR_CONTENTS_ON_NODES, "Copying directory \"{0}\" contents from the local node to the remote nodes \"{1}\" failed."
//  *Cause: Cluster Verification Utility (CVU) framework setup checking 
//          determined that the remote execution files from the local node
//          could not be copied to the indicated directory on the indicated
//          remote nodes.
// *Action: Ensure that the OS user executing the CVU check has write 
//          permissions for the indicated directory on the indicated remote 
//          nodes and retry the operation.
/
11092, FAIL_DELETE_DIR_CONTENTS_ON_NODES, "Deleting directory \"{0}\" contents failed on nodes \"{1}\"."
//  *Cause: Cluster Verification Utility (CVU) framework setup checking 
//          determined that the remote execution files in the indicated
//          directory on the indicated nodes could not be deleted.
// *Action: Ensure that the OS user executing the CVU check has delete 
//          permissions for the files in the indicated directory on the 
//          indicated nodes and retry the operation.
/
11093, PING_REMOTE_FILE_COPY_FAILED, "The file \"{0}\" from the node \"{1}\" could not be copied to \"{2}\" on the local node."
//  *Cause: Cluster Verification Utility (CVU) framework node connectivity
//          checking determined that the indicated ping command output file 
//          from the indicated node could not be copied to the local node for
//          processing.  The accompanying messages provide detailed information
//          about the failure.
// *Action: Examine the accompanying messages, fix the issues identified and
//          retry the operation.
/
11094, PING_CHECK_FAILED_BETWEEN_IPS, "Ping connectivity check from the source IP address \"{0}\" to the destination IP address \"{1}\" failed."
//  *Cause: Cluster Verification Utility (CVU) framework node connectivity
//          checking determined that ping connectivity between the indicated 
//          source IP address and the destination IP address did not exist.
// *Action: Ensure that the IP addresses are up and that a valid route 
//          exists between them. Examine the accompanying messages, 
//          resolve the issues, and retry the operation.
/
11095, TCP_CONNECTIVITY_SYSTEM_CALL_FAILED, "The TCP system call \"{0}\" failed with error \"{1}\" while executing exectask on node \"{2}\""
//  *Cause: Cluster Verification Utility (CVU) framework node connectivity
//          checking encountered the indicated error while trying to run
//          the indicated Transmission Control Protocol (TCP) connectivity
//          system call on the indicated node.
// *Action: Examine the accompanying error message for details, fix the error
//          indicated and then retry the operation.
/
11096, PING_INPUT_FILE_COPY_ERR, "Error copying file \"{0}\" from local node to the directory \"{1}\" on the remote node \"{2}\""
// *Cause:  The specified file could not be copied from the local node to the
//          specified directory on the specified remote node.  The 
//          accompanying messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details, fix the error
//          indicated and then retry the operation.
/
11097, FAILED_NODE_NAME_REACH_ALL, "unable to reach nodes \"{0}\" from the local node"
//  *Cause: During a verification operation to check that specified nodes 
//          are reachable from the local node using the 'ping' command, the
//          verification failed to reach any of the nodes indicated in the 
//          message. 
//          Either the addresses for those nodes did not resolve correctly or
//          they were unreachable.
// *Action: Ensure that the indicated nodes are accessible with the
//          'ping' command. If the host names do not resolve correctly, ensure
//          that the domain naming services cache has been purged using the
//          command '/etc/rc.d/init.d/nscd restart' on Linux and UNIX machines
//          and the command 'ipconfig /flushdns' on Windows operating system
//          machines.
/
11100, COMP_FREESPACE_DISP_NAME , "Free Space"
// *Document: NO
//  *Cause:
// *Action:
/
11101, COMP_FREESPACE_INT_FAIL, "The disk free space could not be determined for file system path \"{0}\" on nodes \"{1}\"."
//  *Cause: An attempt to determine the disk space for the indicated file
//          system path failed on the nodes indicated. The accompanying
//          messages provide detailed failure information.
// *Action: Verify that the path indicated exists on the node indicated.
//          Examine the accompanying messages, resolve the issues, and retry
//          the operation.
/
11102, COMP_FREESPACE_ALERT, "The disk location \"{0}\" on node \"{1}\" has free space below threshold. Required Space is \"{2}\" and available space is \"{3}\""
// *Document: NO
//  *Cause:
// *Action:
// NOTE: Message 11102, COMP_FREESPACE_ALERT is obsolete.
//       However, it cannot be deleted from this until it is deleted from the
//       translated messages.
/    
11103, COMP_FREESPACE_FAIL, "The Free Space Component check failed on node(s) \"{0}\""
//  *Cause: The free space in the CRS home directory is below the threshold.
// *Action: Free up space in this directory to avoid disk free space issues.
/
// NOTE: Message 11103, COMP_FREESPACE_FAIL is obsolete.
//       However, it cannot be deleted from this until it is deleted from the
//       translated messages.
/
11104, COMP_FREESPACE_INSUFFICIENT_PERCENT, "The disk free space for file system path \"{0}\" on node \"{1}\" is below \"{2}\" percent of total disk space. The required free space is \"{3}\", the available free space is \"{4}\" and the total disk size is \"{5}\"."
//  *Cause: The disk free space in the specified file system was below the specified minimum threshold as a percentage of total disk space on the node specified.
// *Action: Ensure that the specified file system has at least the specified required free space.
/
11105, COMP_FREESPACE_INSUFFICIENT_ABS, "The disk free space for file system path \"{0}\" on node \"{1}\" is below required threshold. The required free space is \"{2}\" and the available free space is \"{3}\"."
//  *Cause: The disk free space in the specified file system was below the specified required minimum threshold on the node specified.
// *Action: Ensure that the specified file system has at least the required free space.
/
11106, COMP_FREESPACE_SUCCESS, "The disk free space for file system path \"{0}\" is sufficient on all nodes"
// *Document: NO
//  *Cause:
// *Action:
/ 
11107, VERIFYING_COMP_FREESPACE, "Verifying disk free space for Oracle Clusterware home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11108, SUFFICIENT_FREE_SPACE,"File system path \"{0}\" has sufficient free space"
// *Document: NO
//  *Cause:
// *Action:
/
11110, TASK_SSA_DBLOC_NO_ACCESS1, "The specified database file location \"{0}\" did not have read and write access to user \"{1}\" on node \"{2}\""
//  *Cause: The database file location did not have read and write permissions to the user on some nodes.
// *Action: If the current user intends to be the Oracle installation owner, ensure that the user has read and write access to the database file location
/
11111, TASK_SSA_PATH_TARGET_HUBSIZE_NOT_MET, "Path \"{0}\" is not shared by at least {1} node."
//  *Cause: The path was not shared by sufficient nodes to meet the target hub size.
// *Action: Select a different path.
/
11112, TASK_SSA_PATH_HUBNODES_NOT_SHARED, "Path \"{0}\" is not shared by the following hub nodes: {1}"
//  *Cause: Specified hub nodes do not share the path.
// *Action: Select a path that is shared by all of the hub nodes.
/

11115, DBTASK_CONNECTION_ERROR, "Following error occurred while establishing connection to database \"{0}\""
//  *Cause: An attempt to connect to database failed.
// *Action: Look at the accompanying messages for details on the cause of failure.
/ 
11120, TASK_ELEMENT_AUDIT_FILE_DEST_CHECK, "AUDIT_FILE_DEST location check"
// *Document: NO
//  *Cause:
// *Action:
/ 
11121, TASK_DESC_AUDIT_FILE_DEST_CHECK, "This task checks that AUDIT_FILE_DEST parameter designates a ACFS storage location that is not shared by any other instance of the database"
// *Document: NO
//  *Cause:
// *Action:
/
11122, TASK_AUDIT_FILE_DEST_CHECK_START, "Checking AUDIT_FILE_DEST location..."
// *Document: NO
//  *Cause:
// *Action:
/
11123, TASK_AUDIT_FILE_DEST_CHECK_FAILED, "AUDIT_FILE_DEST location \"{0}\" is shared among instances \"{1}\" of database \"{2}\""
//  *Cause: Two or more instances of the database were found to be using the same AUDIT_FILE_DEST location on shared storage.
// *Action: Ensure that AUDIT_FILE_DEST location is not shared among instances.
/
11124, TASK_AUDIT_FILE_DEST_CHECK_PASSED, "Check for shared AUDIT_FILE_DEST location passed."
// *Document: NO
//  *Cause:
// *Action:
/
11125, TASK_AUDIT_FILE_DEST_CHECK_ERROR, "Following error occurred during shared AUDIT_FILE_DEST location check"
// *Cause: An error occurred while performing shared AUDIT_FILE_DEST locations check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
11126, TASK_AUDIT_FILE_DEST_NO_RACHOME, "Oracle home from which database \"{0}\" is running could not be determined."
//  *Cause: Checks on the directory location pointed to by database
//          initialization parameter 'AUDIT_FILE_DEST' failed to determine the
//          Oracle home from which the specified database was running.
// *Action: Examine the accompanying messages for details on the cause of 
//          failure, address the issues described and retry. 
/
11127, TASK_AUDIT_FILE_DEST_CHECK_SKIPPED, "Skipping AUDIT_FILE_DEST location check for database \"{0}\" because software owner \"{1}\" of the associated Oracle home \"{2}\" is not the same as current OS user \"{3}\"."
//  *Cause: Checks for the directory location pointed to by database 
//          initialization parameter 'AUDIT_FILE_DEST', for the specified
//          database, could not be performed because the software owner of the 
//          associated Oracle home was not same as the current operating system
//          user. 
// *Action: Run this check as the specified software owner.
/
11129, TASK_MULTICAST_CHECK_SUBNET_FAILED, "Check of subnet \"{0}\" for multicast communication with multicast group \"{1}\" failed."
//  *Cause: The Cluster Verification Utility (CVU) determined that the 
//          interfaces on the indicated subnet were not able to communicate 
//          using the indicated multicast group.
// *Action: Ensure that multicast is enabled and that a network path exists 
//          between the interfaces of the indicated subnet. Also, examine
//          the accompanying messages for details on the cause of failure. 
/
11130, TASK_ELEMENT_MULTICAST_CHECK, "Multicast or broadcast check"
// *Document: NO
//  *Cause:
// *Action:
/ 
11131, TASK_DESC_MULTICAST_CHECK, "This task checks that network interfaces in subnet are able to communicate over multicast group or broadcast IP address"
// *Document: NO
//  *Cause:
// *Action:
/
11132, TASK_MULTICAST_CHECK_START, "Checking multicast communication..."
// *Document: NO
//  *Cause:
// *Action:
/
11133, TASK_MULTICAST_CHECK_SUBNET_START, "Checking subnet \"{0}\" for multicast communication with multicast group \"{1}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
11134, TASK_MULTICAST_CHECK_FAILED, "Interface \"{0}\" on node \"{1}\" is not able to communicate with interface \"{2}\" on node \"{3}\""
//  *Cause: The specified interfaces were not able to communicate using a multicast address.
// *Action: Ensure that multicast is enabled on the specified interfaces and network path exists between the interfaces.
/
11135, TASK_MULTICAST_CHECK_SUBNET_PASSED, "Check of subnet \"{0}\" for multicast communication with multicast group \"{1}\" passed."
// *Document: NO
//  *Cause:
// *Action:
/
11136, TASK_MULTICAST_CHECK_PASSED, "Check of multicast communication passed."
// *Document: NO
//  *Cause:
// *Action:
/
11137, TASK_MULTICAST_CHECK_ERROR, "Following error occurred during multicast check"
// *Cause: An error occurred while performing multicast check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
11138, TASK_MULTICAST_CHECK_FAILED_2, "Interface \"{0}\" on node \"{1}\" is not able to communicate with interface \"{2}\" on node \"{3}\" over multicast group \"{4}\""
//  *Cause: The specified interfaces were not able to communicate using a multicast address.
// *Action: Ensure that multicast is enabled on the specified interfaces and that a network path exists between the interfaces.
/
11139, TASK_MULTICAST_CHECK_FAILED_NO_SUBNETS, "Specified subnets \"{0}\" could not be found in the cluster network interface configured subnets \"{1}\""
//  *Cause: The subnets provided in the -network option were not configured in the cluster network interfaces.
// *Action: Ensure that the subnets specified in the -network option are configured in the cluster and are up and running.
/
11140, TASK_ELEMENT_STALE_SCHEMA_CHECK, "Stale database schema statistics check"
// *Document: NO
//  *Cause:
// *Action:
/
11141, TASK_DESC_STALE_SCHEMA_CHECK, "This checks for stale database schema statistics in Oracle database"
// *Document: NO
//  *Cause:
// *Action:
/
11142, TASK_STALE_SCHEMA_CHECK_START, "Checking stale database schema statistics..."
// *Document: NO
//  *Cause:
// *Action:
/
11143, TASK_STALE_SCHEMA_CHECK_ERROR, "The following error occurred during stale database schema statistics check."
// *Cause: An error occurred while performing database stale schema check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
11144, TASK_STALE_SCHEMA_CHECK_FAIL, "Schema objects \"{0}\" have stale statistics in the database \"{1}\""
// *Cause: The specified schema objects were found to have stale statistics in the database.
// *Action: Refer to MOS note 560336.1 at oracle support to fix the issue.
/
11145, TASK_STALE_SCHEMA_CHECK_PASSED, "Database stale schema statistics check is passed"
// *Document: NO
//  *Cause:
// *Action:
/
11150, DB_PASSWORD_PROMPT, "Specify password for user \"{0}\"  in database \"{1}\" : "
// *Document: NO
//  *Cause:
// *Action:
/
11151, DB_USER_PROMPT, "Specify user name for database \"{0}\" [default \"{1}\"] : "
// *Document: NO
//  *Cause:
// *Action:
/
11152, DB_PORT_PROMPT, "Specify listener port for database \"{0}\" [default 1521] : "
// *Document: NO
//  *Cause:
// *Action:
/
11153, DB_PASSWORD_PROMPT2, "Logon denied. Specify password for user \"{0}\"  in database \"{1}\" : "
// *Document: NO
//  *Cause:
// *Action:
/
11170, TASK_DHCP_IPv6, "Skipping DHCP check for cluster which has only IPv6 interfaces"
// *Cause: All the public interfaces in a cluster were IPv6. 
// *Action: IPv6 addresses are automatically generated, hence the check is not required.
/
11171, TASK_DHCP_CHECK_ERROR, "DHCP check failed"
// *Cause: An error occurred while reading network interface information.
// *Action:
/

11180, TASK_ELEMENT_DOMAIN_SOCKETS, "Domain Sockets"
// *Document: NO
//  *Cause:
// *Action:
/
11181, TASK_DESC_DOMAIN_SOCKETS, "This task verifies Clusterware domain sockets"
// *Document: NO
//  *Cause:
// *Action:
/
11182, DOMAIN_SOCKETS_COLLECTION_DESC, "domain sockets"
// *Document: NO
//  *Cause:
// *Action:
/
11185, TASK_ELEMENT_GPNP_PROFILE_COLLECTION, "GPnP Profile"
// *Document: NO
//  *Cause:
// *Action:
/
11186, TASK_DESC_GPNP_PROFILE_COLLECTION, "This task collects GPnP Profile Information"
// *Document: NO
//  *Cause:
// *Action:
/
11187, GPNP_PROFILE_COLLECTION_DESC, "GPnP Profile"
// *Document: NO
//  *Cause:
// *Action:
/
11190, TASK_ELEMENT_CLUSTERWARE_CONFIG_FILES, "Clusterware Configuration Files"
// *Document: NO
//  *Cause:
// *Action:
/
11191, TASK_DESC_CLUSTERWARE_CONFIG_FILES, "This task verifies clusterware configuration files outside of Clusterware home"
// *Document: NO
//  *Cause:
// *Action:
/
11192, INITTAB_COLLECTION_DESC, "inittab file"
// *Document: NO
//  *Cause:
// *Action:
/
11195, TASK_ELEMENT_CRS_MODEL_COLLECTION, "Clusterware Resource Model Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11196, TASK_DESC_CRS_MODEL_COLLECTION, "This task collects Clusterware resource model Information"
// *Document: NO
//  *Cause:
// *Action:
/
11197, CRS_MODEL_COLLECTION_DESC, "Clusterware Resources"
// *Document: NO
//  *Cause:
// *Action:
/
11198, TASK_ELEMENT_OHASD_MODEL_COLLECTION, "Clusterware OHASD Resource Model Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11199, TASK_DESC_OHASD_MODEL_COLLECTION, "This task collects Clusterware OHASD resource model Information"
// *Document: NO
//  *Cause:
// *Action:
/
11200, OHASD_MODEL_COLLECTION_DESC, "Clusterware OHASD Resources"
// *Document: NO
//  *Cause:
// *Action:
/
11201, TASK_ELEMENT_DB_INIT_PARAM_COLLECTION, "DB Initialization Parameters"
// *Document: NO
//  *Cause:
// *Action:
/
11202, TASK_DESC_DB_INIT_PARAM_COLLECTION, "This task collects DB Initialization Parameters"
// *Document: NO
//  *Cause:
// *Action:
/
11203, DB_INIT_PARAM_COLLECTION_DESC, "DB Initialization Parameter Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11204, TASK_ELEMENT_ASM_INIT_PARAM_COLLECTION, "ASM Initialization Parameters"
// *Document: NO
//  *Cause:
// *Action:
/
11205, TASK_DESC_ASM_INIT_PARAM_COLLECTION, "This task collects ASM Initialization Parameters."
// *Document: NO
//  *Cause:
// *Action:
/
11206, ASM_INIT_PARAM_COLLECTION_DESC, "ASM Initialization Parameter Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11210, TASK_ELEMENT_ASM_CONFIGURATION_COLLECTION, "ASM Configuration Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11211, TASK_DESC_ASM_CONFIGURATION_COLLECTION, "This task collects ASM Configuration."
// *Document: NO
//  *Cause:
// *Action:
/
11212, TASK_ELEMENT_ASM_DG_CONFIGURATION_COLLECTION, "ASM Disk Group Configuration Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11213, TASK_DESC_ASM_DG_CONFIGURATION_COLLECTION, "This task collects ASM Disk Group Configuration."
// *Document: NO
//  *Cause:
// *Action:
/
11214, GET_REGISTRY_VAL_CVUHELPER_NO_OUTPUT, "An internal command \"cvuhelper\" exited unexpectedly while fetching the information from Oracle Cluster Registry."
//  *Cause: An attempt to execute an internal cvuhelper command exited unexpectedly.
// *Action: Examine the accompanying error messages for details.
//          Address issues found and retry the operation.
/
// Translator: do not translate 'root'
11250, TASK_SKIPPED_NO_ROOT_CREDENTIALS, "The check \"{0}\" was not performed because it needs 'root' user privileges."
// *Cause: In running the pre-requisite test suite for a planned system 
//         management operation, the indicated check was not performed 
//         because it requires root user privileges, and the root user
//         credentials had not been supplied.
// *Action: To include the check, reissue the request providing the required
//          credentials for the root user.
/
11300, INVALID_PARAMETER_VALUE, "Parameter \"{0}\" value is not valid"
// *Cause: This is an internal error. The value for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
// Translator: do not translate 'root'
11301, ROOT_PASSWORD_INCORRECT, "The 'root' user \"{0}\" password is not valid on the following nodes: {1}."
//  *Cause: An attempt to validate the specified superuser password failed.
// *Action: Make sure that the 'root' user password specified is correct and valid.
//          Make sure that the password is same across all nodes of the cluster.
/
11302, SUDO_CMD_EXISTENCE_FAIL, "'sudo' command does not exist at location \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to verify that the specified user has permission to run sudo
//          command from specified path on specified nodes failed.
// *Action: Make sure that the specified path to sudo command exists on all nodes.
//          Make sure that the permission to read and execute exists for current user.
/
// Translator: do not translate 'root'
11303, CMD_EXECUTION_USING_SUDO_FAIL, "Commands could not be executed as 'root' using 'sudo' on nodes: {0}."
//  *Cause: An attempt to run commands as 'root' using 'sudo' on specified nodes failed.
// *Action: Make sure that the 'sudo' command exists on all nodes.
//          Make sure that 'id' command can be executed using 'sudo'.
/
// Translator: do not translate 'root'
11304, ROOT_EXEC_NOT_CONFIGURED, "Executing commands as root not permitted"
//  *Cause: An attempt was made to execute a command as 'root' user when root 
//          execution method and credentials were not specified. This is an 
//          internal error.
// *Action: Contact Oracle Support Services.
/
// Translator: do not translate 'root'
11305, CMD_EXECUTION_USING_ROOT_FAIL, "Commands could not be executed as user 'root' on nodes: {0}."
//  *Cause: An attempt to run commands as user 'root' on the indicated nodes failed.
// *Action: Look at the accompanying error messages for details and make sure 
//          that:
//          - The command exists on the nodes specified.
//          - The specified command has execute permission on the node 
//            specified.
//          - The 'root' user password specified is correct.
/
11306, SUDO_CONFIGURED_NOPASSWD_NODES, "'NOPASSWD' option is enabled in sudo configuration on nodes \"{0}\"."
//  *Cause: An attempt to use sudo for root automation was rejected because 
//          sudo was configured for 'NOPASSWD' option on the indicated nodes. 
//          The 'NOPASSWD" option was not supported.
// *Action: Remove the 'NOPASSWD' option from the sudo configuration on the 
//          indicated nodes and retry the operation.
/
11310, NO_SUCH_NODES, "\"{0}\" nodes were not found in the cluster"
//  *Cause: Zero nodes of specified type were found in the cluster.
// *Action: If this message is accompanied by error messages, respond according to those messages.
/
11311, TASK_ELEMENT_OSDB_GROUPS_CHECK, "Database operating system groups consistency check"
// *Document: NO
//  *Cause:
// *Action:
/
11312, TASK_DESC_OSDB_GROUPS_CHECK, "This task verifies consistency of database operating system groups across nodes."
// *Document: NO
//  *Cause:
// *Action:
/
11313, TASK_OSDB_GROUPS_CHECK_START, "Checking database operating system groups..."
// *Document: NO
//  *Cause:
// *Action:
/
11314, TASK_OSDB_GROUPS_CHECK_FAILED, "The operating system groups for the following databases are not consistent across all nodes: {0}"
//  *Cause: An operating system group was not found or did not have the same
//          name on all nodes where the corresponding database is present.
// *Action: Ensure that the same operating system groups exist and have the 
//          same name on all nodes where the corresponding database is present.
/
11315, TASK_OSDB_GROUPS_CHECK_PASSED, "Database operating system groups consistency check passed."
// *Document: NO
//  *Cause:
// *Action:
/
11316, TASK_OSDB_GROUPS_DB_PASSED, "Database operating system groups consistency check passed for database {0}."
// *Document: NO
//  *Cause:
// *Action:
/
11317, TASK_OSDB_GROUPS_DB_FAIL, "Database operating system groups consistency check failed for database {0}."
// *Document: NO
//  *Cause:
// *Action:
/
11318, TASK_OSDB_GROUPS_CHECK_ERROR, "The following error occurred during database operating system groups check. \"{0}\""
// *Cause: An error occurred while performing database operating system groups check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
11319, TASK_OSDB_GROUPS_OSGRP_PASSED, "The database operating system group {0} consistency check passed for database {1}."
// *Document: NO
//  *Cause:
// *Action:
/
11320, TASK_OSDB_GROUPS_OSGRP_FAIL, "The database operating system group {0} is inconsistent across nodes {1} for database {2}."
//  *Cause: The specified operating system group was not found or did not have 
//          the same group name on all the identified nodes where the database 
//          is present. 
// *Action: Ensure that the operating system group exist and have the same
//          group name on all the nodes where the database is present, and 
//          invoke the Cluster Verification Utility post-database-install
//          check to ensure the configuration is correct.
/
11321, INVALID_ARRAY_ELEM_VALUE, "One of the elements of parameter \"{0}\" value is not valid"
// *Cause: This is an internal error. The value for one of the array elements for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
11322, INVALID_NODE_NAME_CONTENT, "One or more node names \"{0}\" contain one or more of the following invalid characters \"{1}\""
//  *Cause: One or more of the supplied node names or the local host name
//          contained invalid characters.
// *Action: Ensure that all the node names supplied and the local host name 
//          contain valid characters. Only alphanumeric characters and hyphens 
//          are allowed as per RFC-952.
/
11330, TASK_OSDB_GROUP_CHECK_FAILED, "Database operating system groups consistency check failed for the databases \"{0}\" on nodes \"{1}\""
//  *Cause: One or more operating system groups were not found or did not have 
//          the same group name on all the identified nodes where the database
//          is present.
// *Action: Ensure that the operating system groups exist and have the same
//          group name on all the nodes where the database is present, and 
//          invoke the Cluster Verification Utility post-database-install
//          check to ensure the configuration is correct.
/
11331, TASK_OSDB_GROUPS_ON_NODES, "The database operating system group \"{0}\" name is \"{1}\" on nodes : \"{2}\""
// *Document: NO
//  *Cause: 
// *Action:
/
11350, TASK_BROADCAST_CHECK_START, "Checking broadcast communication..."
// *Document: NO
//  *Cause:
// *Action:
/
11351, TASK_BROADCAST_CHECK_SUBNET_START, "Checking subnet \"{0}\" for broadcast communication with broadcast address \"{1}\"..."
// *Document: NO
//  *Cause:
// *Action:
/
11352, TASK_BROADCAST_CHECK_FAILED, "Interface \"{0}\" on node \"{1}\" is not able to communicate with interface \"{2}\" on node \"{3}\" with broadcast address \"{4}\""
//  *Cause: The specified interfaces were not able to communicate using the  broadcast address.
// *Action: Ensure that broadcast is enabled on the specified interfaces and that the network path allows broadcast.
/
11353, TASK_BROADCAST_CHECK_SUBNET_FAILED, "Broadcast packets sent on subnet \"{0}\" with broadcast address \"{1}\" were not received"
//  *Cause: All the interfaces on the subnet were not able to communicate using the  broadcast address.
// *Action: Ensure that broadcast is enabled on all interfaces and that the network path allows broadcast.
/
11354, TASK_BROADCAST_CHECK_SUBNET_PASSED, "Check of subnet \"{0}\" for broadcast communication with broadcast address \"{1}\" passed"
// *Document: NO
//  *Cause:
// *Action:
/
11355, TASK_BROADCAST_CHECK_PASSED, "Check of broadcast communication passed"
// *Document: NO
//  *Cause:
// *Action:
/
11356, TASK_BROADCAST_CHECK_ERROR, "Following error occurred during broadcast check"
// *Cause: An error occurred while performing broadcast check.
// *Action: Look at the accompanying messages for details on the cause of failure.
/
11365, TASK_SCAN_SUBNET_CHECK_START, "Checking SCAN IP addresses..."
// *Document: NO
// *Cause:
// *Action:
/
11366, TASK_SCAN_NOIP_PUB_SUBNET_PRE, "SCAN IP addresses \"{0}\" of SCAN \"{1}\" was not on subnet \"{2}\""
// *Cause: SCAN IP was found to be on a different subnet than the one chosen as a public subnet.
// *Action: Select a different public subnet or change the IP addresses that the SCAN resolves to.
/
11367, TASK_SCAN_NOIP_PUB_SUBNET_POST, "SCAN IP addresses \"{0}\" of SCAN \"{1}\" were not on subnet \"{2}\""
// *Cause: Subnet of network associated with the SCAN were modified but SCAN IP addresses were not modified.
// *Action: If network associated with the SCAN is DHCP, restart SCAN using 'srvctl stop' and 'srvctl start' commands.
//          If network is static, configure SCAN IP addresses to be on the subnets of network.
//          If IP addresses were already configured, recreate the SCAN using 'srvctl remove scan' and 'srvctl add scan' commands.
/
11368, TASK_SCAN_INSUFFICIENT_IPS, "A SCAN is recommended to resolve to \"{0}\" or more IP addresses, but SCAN \"{1}\" resolves to only \"{2}\""
// *Cause: An insufficient number of SCAN IP addresses were defined for the specified SCAN.
// *Action: Define at least specified number of SCAN IP addresses in DNS for the SCAN.
/
11369, TASK_SCAN_VIPACTIVE, "SCAN IP addresses \"{0}\" of SCAN \"{1}\" were active before Clusterware installation"
//  *Cause: SCAN IP addresses were found to be active on the network before Clusterware installation.
// *Action: Make sure that the SCAN IP addresses are currently unused.
/
11370, TASK_SCAN_SUBNET_CHECK_PASS, "Check of SCAN IP addresses passed"
// *Document: NO
// *Cause:
// *Action:
/
11371, TASK_SCAN_SUBNET_CHECK_FAIL, "Check of SCAN IP addresses failed"
// *Document: NO
// *Cause:
// *Action:
/
11372, TASK_SCAN_VIP_MISMATCH, "Number of SCAN IP addresses that SCAN \"{0}\" resolved to did not match the number of SCAN VIP resources"
//  *Cause: It was found that the SCAN IP addresses that SCAN resolves to were modified after the SCAN was created.
// *Action: Modify SCAN using 'srvctl modify scan -n <scan_name>' and listener using 'srvctl modify scan_listener -u'.
/
11373, TASK_SCAN_INCONSISTENT_ADDR_TYPES, "IPV4 and IPV6 addresses of SCAN VIP resources of SCAN \"{0}\" were not consistent"
//  *Cause: The SCAN resolved to differing numbers of IPv4 and IPv6 addresses.
// *Action: Recreate the SCAN using 'srvctl remove' and 'srvctl add' commands.
/
11374, TASK_SCAN_NOT_RESOLVED, "SCAN \"{0}\" was not resolved"
//  *Cause: A static SCAN was not resolved to IP addresses.
// *Action: Make sure that the SCAN is resolved.
/
11375, TASK_SCAN_ORAARPSRV_NOT_FOUND, "The Oracle Address Resolution Protocol driver service does not exist on node \"{0}\"."
//  *Cause: The Oracle Address Resolution Protocol driver service was not found in the specified node.
// *Action: Follow the Oracle Grid Infrastructure Postinstallation Procedures to install the specified service.
/
11376, TASK_SCAN_ORAARPSRV_NOT_CONFIG_START, "The Oracle Address Resolution Protocol driver service is not configured with the start type 'auto' as expected on node \"{0}\"."
//  *Cause: The configuration of the Oracle Address Resolution Protocol driver service did not specify the expected start type: 'auto'.
// *Action: Configure the service by using 'sc.exe <server_name> config oraarpdrv start= auto'.
/
// Translator: do not translate 'kernel'
11377, TASK_SCAN_ORAARPSRV_NOT_CONFIG_SERVICE, "The Oracle Address Resolution Protocol driver service is not configured with the service type 'kernel' as expected on node \"{0}\"."
//  *Cause: The configuration of the Oracle Address Resolution Protocol driver service did not specify the expected service type: 'kernel'.
// *Action: Configure the service by using 'sc.exe <server_name> config oraarpdrv type= kernel'.
/
// Translator: do not translate 'stopped'
11378, TASK_SCAN_ORAARPSRV_NOT_RUNNING, "The Oracle Address Resolution Protocol driver service is not running on node \"{0}\"." 
//  *Cause: The Oracle Address Resolution Protocol driver service was found with current status of 'stopped'.
// *Action: Start the service by using 'net.exe start oraarpdrv'.
/
11379, TASK_SCAN_ORAARPSRV_SUCCESS, "The Oracle Address Resolution Protocol driver service is configured as expected on node \"{0}\"."
// *Document: NO
//  *Cause: 
// *Action: 
/
11380, TASK_SCAN_VIPS_REACH_FAILED_CLIENT_CLUSTER, "IP addresses \"{0}\" resolved for SCAN \"{1}\" are not reachable."
//  *Cause: The Cluster Verification Utility found that the indicated SCAN  
//          IP addresses configured on the server cluster are not reachable
//          from the client cluster. The accompanying messages provide 
//          additional failure details.
// *Action: Ensure that the indicated SCAN IP addresses configured on the 
//          server cluster are up and reachable and retry the CVU check.
/
//Translator:  {1} is a non-translated keyword:  ON, LOCAL or 1
11381, TASK_SCAN_VNCR_ENABLED_LOCAL, "Valid node checking registration for SCAN listener \"{0}\" is enabled, and set to \"{1}\" on node \"{2}\". Invited nodes which are allowed to register with the SCAN listener do not contain the cluster nodes \"{3}\"."
//  *Cause: The Cluster Verification Utility found that valid node checking
//          registration was enabled for the indicated SCAN listener, which
//          allows only local node IP addresses and invited nodes to register 
//          with the scan listener. And the indicated cluster nodes were not
//          in the list of invited nodes for the indicated SCAN listener.
// *Action: Ensure that valid node checking registration is off or set to 
//          'subnet' or update the invited nodes to include the indicated 
//          cluster nodes for the indicated SCAN listener using 'srvctl' 
//          comamnd.
/
11382, TASK_SCAN_LSNR_SOCKET_FILES_INCONSISTENT_PERM, "The permissions on the SCAN listener socket file \"{0}\" do not match the expected octal value on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]" 
//  *Cause: The Cluster Verification Utility found that the permissions of 
//          the indicated file on the indicated node were different from 
//          the required permissions. This might lead to failure in starting 
//          the SCAN listener.
// *Action: Remove the indicated SCAN listener socket file on the indicated
//          node and restart the SCAN listener.
/
11383, TASK_SCAN_LSNR_SOCKET_FILES_INCONSISTENT_OWNER, "The owner of the SCAN listener socket file \"{0}\" is not the CRS user on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]"
//  *Cause: The Cluster Verification Utility found that the owner of the 
//          indicated file on the indicated node was not the CRS user. 
//          This might lead to failure in starting the SCAN listener.
// *Action: Remove the indicated SCAN listener socket file on the indicated
//          node and restart the SCAN listener.
/
11384, TASK_SCAN_REG_INVITED_NODES_INVALID, "The list of invited nodes allowed to register with the SCAN listener \"{0}\" contains invalid or unresolvable names \"{1}\"."
//  *Cause: The Cluster Verification Utility found that the indicated  
//          invalid or unresolvable names were in the list of invited nodes  
//          for the indicated SCAN listener, which would lead to failure in 
//          starting or restarting the SCAN listener.
// *Action: Ensure that all the names in the list of invited nodes for the 
//          indicated SCAN listener are valid and resolvable.
/
// Translator: do not translate 'hub' 'leaf'
11400, INVALID_NODEROLE_VALUE,  "Node role value is not valid."
//  *Cause: The value passed to CVU for the node role parameter was not one of the allowed values: 'hub', 'leaf' or 'auto'.  This is an internal error.
// *Action: Contact Oracle Support Services.
/
// Translator: do not translate 'hub' 'leaf'
11401, NEW_AUTO_WITH_NEW_HUB_RIM,  "invalid new node list specified including both nodes with 'auto' role and nodes with 'hub' or 'leaf' role"
//  *Cause: The supplied list of new nodes consisted of a mix of nodes with the 'auto' role in combination with nodes having the 'hub' or 'leaf' role.
// *Action: Either supply a list of new nodes that all have the 'auto' role or supply a list of new nodes that have the 'hub' or 'leaf' role specified for each node, but not both.
/
11402, NEW_AUTO_WITH_NO_EXISTING_AUTO,  "New nodes cannot have AUTO node role unless the existing cluster consists entirely of AUTO nodes"
//  *Cause: An attempt to validate new nodes for addition supplied one or more AUTO role nodes for a cluster with no AUTO role nodes.
// *Action: Supply a list of new nodes with AUTO role only when the existing cluster contains nodes with AUTO role.
/
// Translator: do not translate 'hub' 'leaf'
11403, NEW_RIM_WITH_NO_EXISTING_HUB,  "A Leaf Node cannot be added unless existing cluster contains at least one Hub Node."
//  *Cause: An attempt was made to add a node with the 'leaf' role when the cluster did not have at least one node with the 'hub' role.
// *Action: Supply a list of new nodes with the 'leaf' role only when the existing cluster contains at least one node with the 'hub' role.
/
11404, NEW_HUB_EXCEEDS_TARGET_SIZE,  "The addition of hub nodes will exceed the target hub size[{0}]"
//  *Cause: The request to validate new nodes specified enough hub nodes that the cluster target hub size would be exceeded.
// *Action: Specify fewer hub nodes.
/
11405, INV_PARAM_NODEROLE_FOR_BC_ONLY,  "API with node roles argument should be called for Flex Cluster only"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
11406, INV_PARAM_NODEROLE_MUST_FOR_BC,  "API with node roles argument must be called for Flex Cluster"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
11407, INV_PARAM_MISMATCH_NODES_VIPS,  "API called with unequal sized arrays for nodes and VIPs"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
11408, INV_PARAM_MISMATCH_NODES_VIPS_ROLES,  "API called with unequal sized arrays for nodes, VIPs and node roles"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
11409, TASK_NODEADD_ALREADY_EXIST,  "These nodes already appear to be part of the cluster: \"{0}\""
//  *Cause: The supplied list of new nodes contains some nodes which are already part of the cluster.
// *Action: Specify new nodes that are not already in the cluster.
/
// Translator: do not translate 'leaf'
11410, INV_LEAF_NODEROLE_FOR_BC_ONLY,  "illegal specification of nodes with 'leaf' role for a non-Flex Cluster"
//  *Cause: An attempt was made to add a 'leaf' role node to a non-Flex Cluster.
// *Action: Remove the 'leaf' role node from the list of nodes being added to the cluster.
/
11415, CVUDB_WALLET_NOT_EXIST,  "Password entry for user \"{0}\" in the database \"{1}\" did not exist in CVUDB wallet"
//  *Cause: No password entry for the specified user for the specified database was found in the CVUDB walllet.
// *Action: Add a password entry for the user to the CVUDB wallet using 'crsctl add wallet -type CVUDB -name <dbname>'
/
11420, STORAGE_TYPE_COULD_NOT_BE_DETERMINED,  "Storage type of the path \"{0}\" could not be determined"
//  *Cause: There was an error in determining storage type of the path.
// *Action: Examine any accompanying error messages for details.
/
11421, STORAGE_TYPE_UNKNOWN,  "Storage type of the path \"{0}\" could not be determined"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
11422, NO_GNS_AUTO_CONFIG, "Missing GNS subdomain name."
//  *Cause: GNS subdomain name was not provided.
// *Action: The subdomain name for GNS must be provided via the '-domain' parameter in Oracle Clusterware Version 11.2.
/
11423, TASK_VERIFY_SERVICE_USER_PASSWORD_FAILED, "The password provided on the command line is not valid for user \"{0}\""
//  *Cause: The provided password was wrong.
// *Action: Provide the correct password.
/
11424, NO_GNS_SUBDOMAIN, "Missing GNS subdomain for dynamic public network"
//  *Cause: When checking GNS integrity, the public VIPs were configured to use dynamic addresses (DHCP or autoconfig), but the required GNS subdomain was not configured.
// *Action: Configure a GNS subdomain by using the command 'srvctl add gns'.
/
11425, TASK_GNS_SUBDOMAIN_ERR, "Failed to validate GNS credential in file \"{0}\""
//  *Cause: An attempt to validate the Grid Naming Service (GNS) credential failed.
// *Action: Ensure that the credential file provided has been generated in a GNS server cluster by 'srvctl export gns -clientdata <filename>'.
/
11426, TASK_GNS_VIP_NOT_CONSISTENT, "IP address for GNS VIP \"{0}\" is not consistent across the cluster nodes."
//  *Cause: The Cluster Verification Utility determined that the indicated GNS
//          VIP entry in the hosts file or DNS did not resolve to the same IP 
//          address across the cluster nodes.
// *Action: Ensure that the entry in the hosts file or DNS resolving the IP  
//          address for the indicated GNS VIP is consistent across the cluster
//          nodes and retry the CVU check.
/
11427, TASK_GNS_VIP_RESOLVES_TO_DIFFERENT_IP_ON_NODES, "GNS VIP \"{0}\" resolves to IP address \"{1}\" on the majority of cluster nodes but to address \"{2}\" on nodes \"{3}\"."
//  *Cause: The Cluster Verification Utility determined that the indicated GNS
//          VIP resolved to the indicated different IP address on the indicated
//          nodes.
// *Action: Ensure that the indicated GNS VIP resolves to the same IP address 
//          across the cluster nodes and retry the CVU check.
/
11428, TASK_GNS_VIP_RESOLVES_TO_IP_ON_NODES, "GNS VIP \"{0}\" resolves to the IP address \"{1}\" on nodes \"{2}\"."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
11499, ACFS_INCOMPATIBLE_VERSION, "ACFS kernel version \"{0}\" is different from the version of the ACFS commands \"{1}\" on node \"{2}\"."
//  *Cause: The ACFS kernel version was found to be different from the version  
//          of the ACFS commands on the indicated node.
// *Action: Ensure that the ACFS kernel version is the same as the version of 
//          the ACFS commands on the indicated node. 
/
11500, ACFS_UNSUITABLE_FOR_RIM_NODE, "ACFS file systems are not available on Leaf nodes \"{1}\""
// *Cause: The specified ACFS path was not suitable for Leaf nodes.
// *Action: Ensure that you have selected a path that is suitable for all the nodes.
/
11501, UNSUITABLE_FOR_RAC_SOFTWARE, "Path \"{0}\" of type \"{1}\" is not suitable for usage as RAC database software for release \"{2}\". Supported storage types are \"{3}\"."
// *Cause: The specified path is not found suitable for usage as RAC database software
// *Action: Ensure that you have selected a path that is suitable for the desired usage.
/
11502, UNSUITABLE_FOR_RAC_DATAFILE, "Path \"{0}\" of type \"{1}\" is not suitable for usage as RAC database file for release \"{2}\". Supported storage types are \"{3}\"."
// *Cause: The specified path is not found suitable for usage as RAC database file
// *Action: Ensure that you have selected a path that is suitable for the desired usage.
/
11503, UNSUITABLE_FOR_CLUSTERWARE, "Path \"{0}\" of type \"{1}\" is not suitable for usage as Oracle Clusterware storage for release \"{2}\". Supported storage types are \"{3}\"."
// *Cause: The specified path is not found suitable for usage as Oracle Clusterware storage(OCR or Voting Disk).
// *Action: Ensure that you have selected a path that is suitable for the desired usage.
/
11504, UNSUITABLE_FOR_SIDB_SOTWARE, "Path \"{0}\" of type \"{1}\" is not suitable for usage as Single Instance database software for release \"{2}\". Supported storage types are \"{3}\"."
// *Cause: The specified path is not found suitable for usage as Single Instance database software
// *Action: Ensure that you have selected a path that is suitable for the desired usage.
/
11505, UNSUITABLE_FOR_SIDB_DATAFILE, "Path \"{0}\" of type \"{1}\" is not suitable for usage as Single Instance database file for release \"{2}\". Supported storage types are \"{3}\"."
// *Cause: The specified path is not found suitable for usage as Single Instance database file
// *Action: Ensure that you have selected a path that is suitable for the desired usage.
/
11506, UNSUITABLE_FOR_ASM, "Path \"{0}\" of type \"{1}\" is not suitable for ASM for release \"{2}\". Supported storage types are \"{3}\"."
// *Cause: The specified path is not found suitable for ASM
// *Action: Ensure that you have selected a path that is suitable for the desired usage.
/
11510, TASK_ELEMENT_NODEROLE_CHECK, "Flex Cluster node role configuration check"
// *Document: NO
//  *Cause:
// *Action:
/ 
11511, TASK_DESC_NODEROLE_CHECK, "This task checks that all of the nodes have either the 'auto' role or a combination of 'hub' and 'leaf' roles in a Flex Cluster"
// *Document: NO
//  *Cause:
// *Action:
/
11512, TASK_NODEROLE_CHECK_START, "Checking Flex Cluster node role configuration..."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'hub' 'leaf'
11515, TASK_NODEROLE_CHECK_FAILED, "Nodes with mix of 'auto', 'hub' and 'leaf' roles were found in the Flex Cluster."
//  *Cause: The Flex Cluster node role check found nodes with both the 'auto' role and either the 'hub' or 'leaf' roles defined.
// *Action: Use the 'crsctl set node role' command to make all node roles 'auto', or to make node roles a mix of 'hub' and 'leaf'.
/
// Translator: do not translate 'hub' 'leaf'
11516, TASK_NODEROLE_AUTOCONF_FAILED,  "New nodes \"{0}\" with 'hub' or 'leaf' role cannot be added to a Flex Cluster that has 'auto' role nodes."
//  *Cause: An attempt was made to add nodes with the 'hub' or 'leaf' role to a Flex Cluster already having nodes with the 'auto' role.
// *Action: Only add nodes with the 'auto' role to the cluster.
/
// Translator: do not translate 'hub' 'leaf'
11517, TASK_NODEROLE_NOAUTOCONF_FAILED, "New nodes \"{0}\" with 'auto' role cannot be added to a Flex Cluster already having nodes with the 'hub' and 'leaf' roles."
//  *Cause: An attempt was made to add nodes with the 'auto' role to an Flex Cluster already having nodes with the 'hub' and 'leaf' role.
// *Action: Only add nodes with the 'hub' or 'leaf' role to the cluster.
/
11518, TASK_NODEROLE_CHECK_ERROR, "Following error occurred during Flex Cluster node role configuration check"
//  *Cause: An error occurred while performing the Flex Cluster node role configuration check.
// *Action: Look at the accompanying messages for the cause of the failure.
/
11519, TASK_NODEROLE_CHECK_PASSED, "Flex Cluster node role configuration check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11550, MISSING_CVUQDISK_PACKAGE, "Package \"{0}\" is missing on node \"{1}\""
//  *Cause: The cvuqdisk RPM is not installed on the specified node. This package is required for shared disk validations.  During installation, ASM disk validation cannot be performed without this RPM.
// *Action: Install the required version of the cvuqdisk RPM using fix up action or manual steps as listed in the documentation.
/
11551, IMPROPER_CVUQDISK_PACKAGE_VERSION, "Required version of package \"{0}\" was not found on node \"{1}\" [Required = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: The version of installed cvuqdisk RPM does not meet the requirement on the specified node. This package is required for shared disk validations.  During installation, ASM disk validation cannot be performed without this RPM.
// *Action: Install the required version of the cvuqdisk RPM using fix up action or manual steps as listed in the documentation.
/
11600, CV_BASELINE_DESC_OWNER, "Owner"
// *Document: NO
//  *Cause:
// *Action:
/
11601, CV_BASELINE_DESC_PERMISSIONS, "Permissions"
// *Document: NO
//  *Cause:
// *Action:
/
11602, CV_BASELINE_DESC_GROUP, "Group"
// *Document: NO
//  *Cause:
// *Action:
/
11603, CV_BASELINE_DESC_OCR_KEY, "OCR Key"
// *Document: NO
//  *Cause:
// *Action:
/
11604, CV_BASELINE_DESC_OCR_SIZE, "OCR Size"
// *Document: NO
//  *Cause:
// *Action:
/
11605, CV_BASELINE_NAME_OCR_DISK_GROUP, "OCR Disk Group [{0}]"
// *Document: NO
//  *Cause:
// *Action:
/
11606, CV_BASELINE_DESC_OCR_DISK_GROUP, "OCR Disk Group"
// *Document: NO
//  *Cause:
// *Action:
/
11607, CV_BASELINE_NAME_OCR_DISK_LOCATIONS, "OCR Locations"
// *Document: NO
// *Cause:
// *Action:
/
11608, CV_BASELINE_NAME_VDISK_LOCATIONS, "Voting Disk Locations"
// *Document: NO
// *Cause:
// *Action:
/

11610, CV_BASELINE_HTML_REPORT_TITLE, "CVU Baseline Report"
// *Document: NO
// *Cause:
// *Action:
/
11611, CV_BASELINE_GENERATION_MSG, "Generating Baseline Report"
// *Document: NO
//  *Cause:
// *Action:
/
11612, CV_BASELINE_PREPARATION_MSG, "Preparing the report.."
// *Document: NO
//  *Cause:
// *Action:
/
11613, CV_BASELINE_OPENING_BROWSER, "Opening the report in the browser.."
// *Document: NO
// *Cause:
// *Action:
/
11614, CV_BASELINE_REPORT_SUCCESS, "Baseline report generation successful"
// *Document: NO
//  *Cause:
// *Action:
/
11615, CV_BASELINE_REPORT_FAIL, "Baseline report generation failed"
// *Document: NO
//  *Cause:
// *Action:
/
11616, COMPARING_COLLECTION_ELEMENT_TEMPLATE, "Comparing \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11618, BASELINE_CLUSTER_SYSREQ_CHECKS, "System Prerequisites"
// *Document: NO
//  *Cause:
// *Action:
/
11619, BASELINE_CLUSTER_SYSRECO_CHECKS, "System Best Practices"
// *Document: NO
//  *Cause:
// *Action:
/
11620, BASELINE_CLUSTERWARE_REQ_CHECKS, "Clusterware Configuration Prerequisites"
// *Document: NO
//  *Cause:
// *Action:
/
11621, BASELINE_CLUSTERWARE_RECO_CHECKS, "Clusterware Best Practices"
// *Document: NO
//  *Cause:
// *Action:
/
11622, BASELINE_DATABASE_REQ_CHECKS, "Prerequisites for database \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
11623, BASELINE_DATABASE_RECO_CHECKS, "Best Practices for database \"{0}\""
// *Document: NO
//  *Cause: 
// *Action:
/
11624, REPORT_TXT_COMP_BASELINE, "baseline"
// *Document: NO
//  *Cause:
// *Action:
/
11625, BASELINE_CLUSTERWARE_SOFTWARE_CHECKS, "Grid Infrastructure Software Distribution Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11626, BASELINE_DATABASE_SOFTWARE_CHECKS, "Database Software Distribution Collection for database home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11627, BASELINE_DATABASE_INIT_PARAMETERS_CHECKS, "Database Initialization Parameter Collection for database \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11628, BASELINE_NETWORK_CHECKS, "Network Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11629, BASELINE_STORAGE_CHECKS, "Storage Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11630, BASELINE_OCR_CHECKS, "OCR Configuration checks"
// *Document: NO
//  *Cause:
// *Action:
/
11631, TASK_ELEMENT_CHECK_MISSIZED_ASMDISKS, "Check incorrectly sized ASM Disks"
// *Document: NO
//  *Cause:
// *Action:
/
11632, TASK_DESC_CHECK_MISSIZED_ASMDISKS, "Pre-upgrade check for incorrectly sized ASM disks"
// *Document: NO
//  *Cause:
// *Action:
/
11633, TASK_ASM_MISSIZED_DISKS_START, "Checking ASM disk size consistency"
// *Document: NO
//  *Cause:
// *Action:
/
11634, TASK_ASM_MISSIZED_DISKS_SUCCESS, "All ASM disks are correctly sized"
// *Document: No
// *Cause:
// *Action:
/
11635, TASK_ASM_MISSIZED_DISKS_FAILED, "The ASM disks \"{0}\" are incorrectly sized"
// *Cause: The indicated ASM disks had incorrect size information in the disk header. 
// *Action: This is an internal error. Contact Oracle Support Services.
/
11636, COLLECTION_MISMATCHES_FOUND, "Mismatch was found in the following collection elements:"
// *Document: NO
//  *Cause:
// *Action:
/
11637, BASELINE_COLLECTION_SUCCESSFULL, "Baseline data collection successful."
// *Document: NO
//  *Cause:
// *Action:
/
11638, BASELINE_COLLECTION_REPORT, "Collection report for this execution is saved in file \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
11639, BASELINE_COLLECTION_FAILED, "Baseline data collection failed."
// *Document: NO
//  *Cause:
// *Action:
/
11640, DISABLED_TASK_WARN, "The check \"{0}\" was not performed as it is disabled"
// *Cause: The indicated check was suppressed.
// *Action: Suppressed checks usually occur at the request of Oracle Support; if this is unexpected, contact Oracle Support Services.
/
11641, BASELINE_COLLECTED, "Baseline collected."
// *Document: NO
//  *Cause:
// *Action:
/
11642, BASELINE_COLLECTION_FAILED_NODES, "Errors occurred collecting baseline on nodes \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
11643, BASELINE_COLLECTION_FAILED_DATABASES, "Errors occurred collecting baseline for databases \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
11644, BASELINE_SAVE_TO_ALL_NODE_FAILED, "Failed to copy baseline to the remote nodes: \"{0}\""
//  *Cause: An error occurred while copying the report to the remote nodes
// *Action: Examine the accompanying error messages for details.
/
11645, BASELINE_GPNP_COLLECTION, "GPnP Profile Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11646, BASELINE_OHASD_MODEL_COLLECTION, "Clusterware OHASD Resource Model Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11647, BASELINE_CRS_MODEL_COLLECTION, "Clusterware Resource Model Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11648, BASELINE_OCR_DUMP_CHECKS, "OCR Configuration Data Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11649, BASELINE_OS_COLLECTION, "Operating System Configuration"
// *Document: NO
//  *Cause:
// *Action:
/
11650, BASELINE_OS_PACKAGE_COLLECTION, "Operating System Packages"
// *Document: NO
//  *Cause:
// *Action:
/
11651, BASELINE_OS_KERNEL_PARAM_COLLECTION, "Operating System Kernel Parameters"
// *Document: NO
//  *Cause:
// *Action:
/
11652, BASELINE_OS_PATCH_COLLECTION, "Operating System Patch"
// *Document: NO
//  *Cause:
// *Action:
/
11653, BASELINE_ENVIRONMENT_VARIABLE_COLLECTION, "Environment Variables"
// *Document: NO
//  *Cause:
// *Action:
/
11654, BASELINE_OS_RLIMIT_COLLECTION, "Operating System Resource Limits"
// *Document: NO
//  *Cause:
// *Action:
/
11655, BASELINE_INITTAB_ENTRIES_COLLECTION, "inittab Entries Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11656, BASELINE_ENVIRONMENT_VARIABLE_FOR_CRSD_COLLECTION, "Environment Variables For CRSD"
// *Document: NO
//  *Cause:
// *Action:
/
11657, BASELINE_OS_RLIMIT_FOR_CRSD_COLLECTION, "Operating System Resource Limits For CRSD"
// *Document: NO
//  *Cause:
// *Action:
/
11658, BASELINE_COLLECTION_DB_NAMES_NOT_FOUND, "Baseline could not be collected for database \"{0}\"."
//  *Cause: "An attempt to collect baseline information using the command
//          'cluvfy comp baseline -collect database' failed because the
//          indicated database was not configured in clusterware."
// *Action: Ensure that the database is configured and retry the baseline
//          collection command.
/
11659, BASELINE_COLLECTION_DB_HOMES_NOT_FOUND, "Baseline could not be collected for databases in the database home \"{0}\"."
//  *Cause: "An attempt to collect baseline information using the command
//          'cluvfy comp baseline -collect database' failed because the indicated
//          database home was not installed and configured in clusterware."
// *Action: Ensure that the database home is installed and is configured and
//          retry the baseline collection command.
/
11660, BASELINE_ASM_REQ_CHECKS, "ASM Configuration Prerequisites"
// *Document: NO
//  *Cause:
// *Action:
/
11661, BASELINE_ASM_RECO_CHECKS, "ASM Best Practices"
// *Document: NO
//  *Cause:
// *Action:
/
11662, BASELINE_ASM_INIT_PARAMETERS_CHECKS, "ASM Initialization Parameter (gv$parameter)"
// *Document: NO
//  *Cause:
// *Action:
/
11663, BASELINE_ASM_DISK_GROUP_CONFIGURATION_COLLECTION, "ASM Disk Group Configuration (gv$asm_diskgroup, v$asm_attribute, gv$asm_disk)"
// *Document: NO
//  *Cause:
// *Action:
/
11665, BASELINE_CLUSTERWARE_PATCH_COLLECTION, "Grid Infrastructure Patch Collection"
// *Document: NO
//  *Cause:
// *Action:
/
11666, BASELINE_DATABASE_PATCH_COLLECTION, "Database Patch Collection for Database Home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11667, TASK_ELEMENT_CLUSTERWARE_PATCH_COLLECTION, "Clusterware Patch Collection for Home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11668, TASK_DESC_CLUSTERWARE_PATCH_COLLECTION, "This task collects clusterware patches."
// *Document: NO
//  *Cause:
// *Action:
/
11669, TASK_ELEMENT_DATABASE_PATCH_COLLECTION, "Oracle Home Patch Collection for Home \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11670, TASK_DESC_DATABASE_PATCH_COLLECTION, "This task collects oracle home patches."
// *Document: NO
//  *Cause:
// *Action:
/
11671, BASELINE_NO_REFERENCE_BASELINE, "reference baseline not specified"
//  *Cause: The request for baseline cross comparison omitted the required reference baseline.
// *Action: Retry the command, specifying two baselines with the '-compare' argument.
/
11750, FILE_EXISTS, "File \"{0}\" exists on node \"{1}\"."
//  *Cause: The specified file is not expected to be present on the node.
// *Action: Remove the specified file from the node.
/
11751, FILE_NOT_EXIST_ALL_NODES, "File \"{0}\" does not exist on all the nodes."
// *Document: NO
//  *Cause:
// *Action:
/
11752, DIR_EXISTS, "Directory \"{0}\" exists on node \"{1}\"."
// *Document: NO
//  *Cause:
// *Action:
/
11753, DIR_NOT_EXIST_ALL_NODES, "Directory \"{0}\" does not exist on all the nodes."
// *Document: NO
//  *Cause:
// *Action:
/
11754, FAIL_CHK_DIR_EXIST, "Check for existence of directory \"{0}\" could not be performed on node \"{1}\". "
//  *Cause: An error occurred while checking the existence of the directory on the specified node.
// *Action: Examine the accompanying error messages for details.
/
11755, NO_PROPERTY_IN_CONFIG_FILE, "Property \"{0}\" was not found in configuration file \"{1}\""
//  *Cause: Could not find the specified property in the configuration file.
// *Action: Define the specified property in the configuration file. Otherwise, the validations needing this property will not be performed.
/
11770, TASK_ELEMENT_NIC_BIND_ORDER, "Check NIC bind order"
// *Document: NO
//  *Cause:
// *Action:
/
11771, TASK_DESC_NIC_BIND_ORDER, "Checking NIC bind order on the node against the classification of network interfaces"
// *Document: NO
//  *Cause:
// *Action:
/
11772, TASK_NIC_BIND_ORDER_START, "Checking NIC bind order"
// *Document: NO
//  *Cause:
// *Action:
/
11773, NIC_BIND_ORDER_CHECK_PASSED, "NIC bind order check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11774, NIC_BIND_ORDER_CHECK_FAILED, "NIC bind order check failed on nodes: \"{0}\""
// *Cause: The NIC bind order on the specified nodes did not prioritize the public network above the private network.
// *Action: Ensure that the public network NIC takes precedence over the private network NIC in the configured network bind order.
/
11775, NIC_BIND_ORDER_CHECK_ERR, "Failed to retrieve the NIC bind order information on nodes: \"{0}\""
// *Cause: An attempt to retrieve the NIC bind order failed on the indicated nodes.
// *Action: Contact Oracle Support Services.
/ 
11776, ERROR_NIC_BIND_ORDER_INFO_ALL, "Failed to retrieve the NIC bind order information from all the nodes"
//  *Cause: An attempt to retrieve the NIC bind order information failed on all the nodes.
// *Action: Contact Oracle Support Services.
/
11777, TASK_NIC_METRIC_CHECK_START, "Checking network interface metric values"
// *Document: NO
//  *Cause:
// *Action:
/
11778, NIC_METRIC_CHECK_PASSED, "Network interface metric value check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11779, NIC_METRIC_CHECK_FAILED_NODE, "Metric value \"{0}\" for public interface \"{1}\" is higher than or equal to metric value \"{2}\" for private interface \"{3}\" on node \"{4}\"."
//  *Cause: The identified public interface metric value was higher or equal to the identified private interface metric value on the indicated node.
// *Action: Change the identified public interface metric value to a lower value than the identified private interface metric value.
/
11780, TASK_NIC_METRIC_PARSE_INT_ERROR, "Failed to convert string \"{0}\" to integer value"
//  *Cause: The network interface metric value could not be determined as the identified string to integer conversion failed.
// *Action: Look at the accompanying messages for details.
/
11800, TASK_ASMDEVCHK_DEVICE_DISCOVER_FAILED, "Failed to discover any devices using the discovery string \"{0}\" on node \"{1}\""
//  *Cause: The specified discovery string could not discover any devices on the identified node.
// *Action: Specify a discovery string that will discover the devices on the given node and make sure the devices to be used as ASM disks have permissions that allow them to be discovered.
/
11810, ELEMENT_NAME_WINDOWS_USER_ACCOUNT_CONSISTENCY, "Windows user account consistency check across nodes" 
// *Document: NO
//  *Cause:
// *Action:
/
11811, DESC_NAME_WINDOWS_USER_ACCOUNT_CONSISTENCY, "Checks consistency of Windows user account across nodes"
// *Document: NO
//  *Cause:
// *Action:
/
11812, SUCC_WINDOWS_USER_ACCOUNT_CONSISTENCY, "Windows user account \"{0}\" was found consistent across all cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
11813, FAIL_WINDOWS_USER_ACCOUNT_CONSISTENCY, "Check for Windows user account \"{0}\" consistency failed"
// *Document: NO
//  *Cause:
// *Action:
/
11814, WINDOWS_USER_ACCOUNT_CONSISTENCY_CHECK_START_INSTALL_USER, "Checking consistency of current Windows user account across all nodes"
// *Document: NO
//  *Cause:
// *Action:
/
11815, WINDOWS_USER_ACCOUNT_CONSISTENCY_CHECK_START_OH_USER, "Checking consistency of Oracle Home Windows user account across all cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
11816, VFAIL_WINDOWS_USER_ACCOUNT_CONSISTENCY_DOMAIN_USER_NODE, "Windows user \"{0}\" is a domain user but a conflicting local user account \"{1}\" exists on node \"{2}\""
//  *Cause: A conflicting local user account as indicated was found on the identified node.
// *Action: Ensure that the Windows user account used for Oracle installation and configuration is defined as a domain user on all nodes or as a local user on all nodes, but not a mixture of the two.
/
11817, VFAIL_WINDOWS_USER_ACCOUNT_CONSISTENCY_LOCAL_USER_NODE, "Windows user \"{0}\" is a local user but a matching local user account does not exist on nodes \"{1}\""
//  *Cause: A local user account for an Oracle installation user was not found on the identified nodes.
// *Action: Ensure that the Windows user account used for Oracle installation and configuration is defined as a domain user on all nodes or as a local user on all nodes, but not a mixture of the two.
/
11818, VFAIL_WINDOWS_USER_ACCOUNT_CONSISTENCY_DUPLICATE_LOCAL_USER, "Windows user \"{0}\" is a domain user but a conflicting local user account was found on nodes \"{1}\""
//  *Cause: A conflicting local user account as indicated was found on the identified nodes.
// *Action: Ensure that the Windows user account used for Oracle installation and configuration is defined as a domain user on all nodes or as a local user on all nodes, but not a mixture of the two.
/
11819, VFAIL_WINDOWS_USER_ACCOUNT_CONSISTENCY_USER_NOT_DOMAIN, "Current Oracle Home User \"{0}\" is not a domain user"
//  *Cause: The current Oracle Home User was found to be a Windows user account local to this system.
// *Action: Specify a Windows domain user as the Oracle Home User.
/
11820, EFAIL_WINDOWS_USER_ACCOUNT_CONSISTENCY, "Error retrieving the account details for user \"{0}\" from nodes \"{1}\""
//  *Cause: An error occurred while retrieving the account details of indicated user.
// *Action: Examine the accompanying error messages for details.
/
11825, FAIL_GET_ORACLE_HOME_USER, "Failed to get the Oracle Home user name for Oracle Home \"{0}\""
//  *Cause: An attempt to retrieve the Oracle Home User for the indicated Oracle Home failed.
// *Action: Examine the accompanying error messages for details.
/
11826, TASK_NAME_SERVICE_CHECK_FAILED_NO_NAME_SERVICE_ENTRY, "DNS resolved IP addresses \"{0}\" for SCAN name \"{1}\" not found in the name service returned IP addresses \"{2}\""
//  *Cause: The name resolution setup check for the indicated SCAN name failed 
//          because one or more of the indicated IP addresses obtained from 
//          DNS could not be found in the IP addresses obtained from the
//          name service on the system as configured in the '/etc/nsswitch.conf'
//          configuration file.
// *Action: Make sure all the DNS resolved IP addresses are present in the IP 
//          addresses obtained from the name service on the system as configured 
//          in the '/etc/nsswitch.conf' configuration file by reconfiguring the 
//          '/etc/nsswitch.conf' for the indicated SCAN name.
//          Check the Name Service Cache Daemon (/usr/sbin/nscd) by clearing
//          its cache and restarting it.
/
11827, TASK_NAME_SERVICE_CHECK_FAILED_NO_DNS_ENTRY, "Name service returned IP addresses \"{0}\" for SCAN name \"{1}\" not found in the DNS returned IP addresses \"{2}\""
//  *Cause: The name resolution setup check for the indicated SCAN name failed 
//          because one or more of the indicated IP addresses obtained from 
//          name service on the system as configured in the 
//          '/etc/nsswitch.conf' configuration file could not be found
//          in the IP addresses obtained from DNS.
// *Action: Make sure all the name service resolved IP addresses obtained from 
//          the '/etc/nsswitch.conf' configuration file are present in the DNS
//          resolved IP addresses by reconfiguring '/etc/nsswitch.conf'
//          configuration file for the indicated SCAN name.
//          Check the Name Service Cache Daemon (/usr/sbin/nscd) by clearing
//          its cache and restarting it.
/
11850, EXECTASK_INTERNAL_ERROR, "The system call \"{0}\" failed with error \"{1}\" while executing exectask on node \"{2}\""
// *Cause: An attempt to execute exectask on the specified node failed.
// *Action: Examine the accompanying error message for details or contact Oracle Support Services.
/
11860, TASK_ELEMENT_DB_HOME_AVAILABILITY_CHECK, "Database home availability"
// *Document: NO
//  *Cause:
// *Action:
/
11861, TASK_DESC_DB_HOME_AVAILABILITY_CHECK, "Checks the presence of database homes on the nodes being added to the cluster"
// *Document: NO
//  *Cause:
// *Action:
/
11862, TASK_DB_HOME_AVAILABILITY_CHECK_START, "Checking the database home availability"
// *Document: NO
//  *Cause:
// *Action:
11863, TASK_DB_HOME_AVAILABILITY_CHECK_PASSED, "Database home availability check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11864, TASK_DB_HOME_AVAILABILITY_CHECK_FAILED, "Database home availability check failed"
// *Document: NO
//  *Cause:
// *Action:
/
11865, TASK_ADMIN_DB_HOME_AVAILABILITY_CHECK_NODE_FAILED, "Oracle Home \"{0}\" for the administrator managed database \"{1}\" instances \"{2}\" does not exist on nodes \"{3}\""
//  *Cause: The indicated Oracle Home for the indicated database was not found 
//          on the indicated nodes and the automatic root script execution was 
//          selected.
// *Action: Ensure that the indicated Oracle Home exists on the indicated nodes
//          by running 'addNode.sh' or 'addNode.bat' from the indicated Oracle
//          Home on a node that is already in the cluster before you run the
//          'root.sh' or 'root.bat' script. Alternatively, remove the indicated
//          administrator managed database instances by using the command 
//          'srvctl remove instance'.
/
11866, TASK_ADMIN_DB_HOME_AVAILABILITY_CHECK_NODE_WARNING, "Oracle Home \"{0}\" for the administrator managed database \"{1}\" instances \"{2}\" does not exist on nodes \"{3}\""
//  *Cause: The indicated Oracle Home for the indicated database was not found
//          on the indicated nodes.
// *Action: Ensure that the indicated Oracle Home exists on the indicated nodes
//          by running 'addNode.sh' or 'addNode.bat' from the indicated Oracle 
//          Home on a node that is already in the cluster before you run the
//          'root.sh' or 'root.bat' script. Alternatively, remove the indicated
//          administrator managed database instances by using the command
//          'srvctl remove instance'.
/
11867, TASK_POLICY_DB_HOME_AVAILABILITY_CHECK_NODE_WARNING, "Oracle Home \"{0}\" for policy managed database \"{1}\" does not exist on nodes \"{2}\""
//  *Cause: The indicated Oracle Home for the indicated database was not found
//          on the indicated nodes.
// *Action: Ensure that the indicated Oracle Home exists on the indicated nodes
//          by running 'addNode.sh' or 'addNode.bat' from the indicated Oracle 
//          Home on a node that is already in the cluster before you run the 
//          'root.sh' or 'root.bat' script.
/
11868, TASK_GET_DB_INFO_CVUHELPER_ERROR, "An internal command 'cvuhelper' failed to get the administrator and policy managed database information."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
11869, TASK_GET_DB_INFO_CVUHELPER_NO_OUTPUT, "An internal command 'cvuhelper' exited unexpectedly while getting the administrator and policy managed database information."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
11870, TASK_GET_DB_INFO_CVUHELPER_PARSE_ERROR, "failed to parse database information from the 'cvuhelper' command output"
//  *Cause: An attempt to parse output from an internal cvuhelper command 
//          failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
11880, TASK_ELEMENT_POLICY_DB_HOME_AVAILABILITY_CHECK, "Policy managed database home availability"
// *Document: NO
//  *Cause:
// *Action:
/
11881, TASK_DESC_POLICY_DB_HOME_AVAILABILITY_CHECK, "Checks the presence of database homes running policy managed databases on the nodes being added to the cluster"
// *Document: NO
//  *Cause:
// *Action:
/
11882, TASK_POLICY_DB_HOME_AVAILABILITY_CHECK_START, "Checking the policy managed database home availability" 
// *Document: NO
//  *Cause:
// *Action:
11883, TASK_POLICY_DB_HOME_AVAILABILITY_CHECK_PASSED, "Policy managed database home availability check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11884, TASK_POLICY_DB_HOME_AVAILABILITY_CHECK_FAILED, "Policy managed database home availability check failed"
//  *Cause: One or more policy managed database homes were not found on the nodes being added to the cluster.
// *Action: Ensure that all the policy managed database homes exist on the nodes being added to the cluster.
/
11885, TASK_POLICY_DB_HOME_AVAILABILITY_CHECK_NODE_FAILED, "Oracle Home \"{0}\" for policy managed database \"{1}\" does not exist on nodes \"{2}\""
//  *Cause: The indicated Oracle Home for the indicated database was not found
//          on the indicated nodes and the automatic root script execution was
//          selected.
// *Action: Ensure that the indicated Oracle Home exists on the indicated nodes
//          by running 'addNode.sh' or 'addNode.bat' from the indicated Oracle
//          Home on a node that is already in the cluster before you run the
//          'root.sh' or 'root.bat' script.
/
11886, TASK_GET_POLICY_DB_INFO_CVUHELPER_ERROR, "Command \"{0}\" to get the policy managed database information failed"
//  *Cause: An attempt to execute the displayed command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
11890, GET_DIR_SIZE_FAILED, "failed to determine the space used by directory \"{0}\" on node \"{1}\""
//  *Cause: An attempt to determine the space used by the identified directory failed on the indicated node.
// *Action: Ensure that the current user has read and execute permissions for the directory cited in the message and its subdirectories. Look at the accompanying messages for more details.
/
11891, FAIL_NODE_CON_INTERFACE, "Connectivity failed between interface \"{0}\" configured with IP address \"{1}\" on node \"{2}\" and interface \"{3}\" configured with IP address \"{4}\" on node \"{5}\" for the subnet \"{6}\"."
//  *Cause: Cluster Verification Utility (CVU) node connectivity checking 
//          detected the connectivity problem described in the message.  
//          Connectivity for the mentioned subnet could not be verified between
//          the two identified interfaces on the identified nodes.
// *Action: Verify the interface configurations for the identified network
//          interfaces on the identified nodes using utilities such as ipconfig  
//          or ping.
/
11892, FAIL_NODE_CON_IP, "Connectivity failed between IP address \"{0}\" on node \"{1}\" and IP address \"{2}\" on node \"{3}\" for the subnet \"{4}\"."
//  *Cause: Cluster Verification Utility (CVU) node connectivity checking 
//          detected the connectivity problem described in the message.
//          Connectivity for the mentioned subnet could not be verified between
//          the two identified IP addresses on the identified nodes.
// *Action: Verify the IP configurations for the identified network interfaces
//          on the identified nodes using utilities such as ipconfig or ping.
/
11893, FAIL_NODE_CON_INTERFACE_RDS, "RDS connectivity failed between interface \"{0}\" configured with IP address \"{1}\" on node \"{2}\" and interface \"{3}\" configured with IP address \"{4}\" on node \"{5}\" for subnet \"{6}\"."
//  *Cause: Cluster Verification Utility (CVU) node connectivity checking
//          detected the connectivity problem described in the message.
//          Connectivity for the mentioned subnet could not be verified between
//          the two identified interfaces using the 'rds-ping' command on the 
//          identified nodes.
// *Action: Verify the interface configurations for the identified network
//          interfaces on the identified nodes using the utility '/usr/bin/rds-ping'.
/
11894, FAIL_NODE_CON_IP_RDS, "RDS connectivity failed between IP address \"{0}\" on node \"{1}\" and IP address \"{2}\" on node \"{3}\" for subnet \"{4}\"."
//  *Cause: Cluster Verification Utility (CVU) node connectivity checking
//          detected the connectivity problem described in the message.
//          Connectivity for the mentioned subnet could not be verified between
//          the two identified IP addresses using the 'rds-ping' command on the 
//          identified nodes.
// *Action: Verify the IP configurations for the identified network interfaces
//          on the identified nodes using the utility '/usr/bin/rds-ping'.
/
11896, CHECK_RDS_CON_SUBNET, "Check: RDS connectivity of subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11897, SUMMARY_PASS_RDS_CON_SUBNET, "RDS connectivity check passed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11898, SUMMARY_FAIL_RDS_CON_SUBNET, "RDS connectivity check failed for subnet \"{0}\""
// *Document: NO
//  *Cause:
// *Action:
/
11900, NO_CRS_INSTALL_LOCAL_NODE, "Oracle Clusterware is not installed on this node."
//  *Cause: An attempt to execute the command 'cluvfy comp software' was requested, but files associated with Oracle Clusterware installation were not found.
// *Action: Execute the 'cluvfy comp software' command only on nodes where Oracle Clusterware is installed.
/
11901, NO_CRS_RUNNING_LOCAL_NODE, "Oracle Clusterware is not running on this node."
//  *Cause: An attempt to execute a 'cluvfy' command that requires Oracle
//          Clusterware to be running failed because Clusterware was
//          not running on the node.
// *Action: Ensure that the Clusterware stack is running and retry 'cluvfy'.
//          If required issue the command 'crsctl start crs' to start the 
//          clusterware stack.
/
11902, NO_CRS_CONFIGURED_LOCAL_NODE, "Oracle Clusterware is not configured on node {0}."
//  *Cause: A 'cluvfy comp software' command was issued on a system that does not have an Oracle Clusterware configuration.
// *Action: Issue the 'cluvfy comp software' command only on nodes where Oracle Clusterware is configured.
/
11903, COMP_EQ_DESTHOME_SRCHOME, "The specified destination CRS home {0} is the same as the currently configured CRS home {1}."
//  *Cause: The pre-upgrade prerequisites check failed because the specified destination CRS home was the same as the currently configured CRS home.
// *Action: Retry the upgrade using the '-dest_crshome' option to specify a CRS home that is different from the currently configured CRS home.
/
11904, NO_ORACLE_KEY_FILE, "The file 'oracle.key' does not exist for Oracle home {0} on node {1}."
// *Cause: The command 'cluvfy comp software' failed for the indicated node because it does not appear to have a valid Oracle home.
// *Action: Verify that the installation of Oracle software has completed successfully.
/
11905, ORACLE_KEY_FILE_NOT_VALID, "The file 'oracle.key' cannot be read on node {0}."
// *Cause: The command 'cluvfy comp software' failed for the indicated node because it does not have a valid 'oracle.key' file.
// *Action: Verify that the installation of Oracle software has completed successfully.
/
11906, NO_NODES_WITH_DBHOME, "The Oracle home {0} does not exist."
// *Cause: The command 'cluvfy comp software' failed because the specified Oracle home could not be found.
// *Action: Verify that the installation of Oracle software has completed successfully.
/
11907, NO_DB_EDITION_FOUND, "The Oracle database edition cannot be obtained from file {0} on node {1}."
// *Cause: The command 'cluvfy comp software' failed because the file which indicates the database edition could not be accessed on the indicated node.
// *Action: Verify that the installation of Oracle software has completed successfully and that the specified file exists and is readable.
/
11910, FAIL_GET_ORACLE_BASE, "failed to locate Oracle base for home \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve Oracle base using command <ORACLE_HOME>/bin/orabase failed.
// *Action: Verify that the installation of the Oracle software has completed successfully and that the Oracle home is set up correctly.
/
11911, ERROR_DB_SERVICE_COUNT_NOT_AVAILABLE, "Database services count is not available for Oracle Clusterware versions prior to 11.2."
//  *Cause: An attempt was made to retrieve the database services count for an Oracle Clusterware version lower than 11.2.
// *Action: Make sure that the configured Oracle Clusterware is version 11.2 or greater.
/
11912, DB_SERVICE_COUNT_CVUHELPER_ERR, "Command '{0}' to retrieve database services count failed."
//  *Cause: An attempt to execute the displayed command failed. This is an internal error. 
// *Action: Contact Oracle Support Services.
/
11913, ONS_CONF_BAD_FORMAT, "Syntax errors in the following lines from ONS configuration file \"{1}\" on node \"{0}\" :"
// *Cause: Invalid lines were found in the ons.config file at the location and node indicated.
// *Action: Contact Oracle Support Services.
/
11914, ONS_CONF_FILE_NOT_EXIST_NODE, "The ONS configuration file \"{0}\" does not exist on following nodes: {1}"
// *Cause: The file specified did not exist on the nodes listed, but exists on other nodes.
// *Action: Contact Oracle Support Services.
/
11915, ONS_CONF_FILE_NOT_EXIST, "ONS configuration file \"{0}\" does not exist on any node of the cluster. Skipping further checks."
//  *Cause: The ONS configuration file was missing from all of the nodes.
//  *Action: Contact Oracle Support Services.
/
11916, TASK_DESC_ONSCONF, "This task checks consistency of ONS configuration \"{0}\" file across nodes"
// *Document: NO
// *Cause:
// *Action:
/
11917, TASK_ELEMENT_ONSCONF, "Task ons.config consistency"
// *Document: NO
// *Cause:
// *Action:
/
11918, TASK_ONS_CONF_BEGIN_TASK, "Checking consistency of ONS configuration file \"{0}\" across nodes"
// *Document: NO
// *Cause:
// *Action:
/
11919, ONS_CONF_UNABLE_TO_CREATE_TEMP_AREA, "Unable to create work area directory \"{0}\""
// *Cause: An attempt to create the  specified directory failed on the local node.
// *Action: Make sure that the user running Cluster Verification Utility has the authority to create the indicated directory or specify a different (usable) directory with the CV_DESTLOC environment variable.
/
11920, ONS_CONF_UNABLE_TO_REMOVE, "Unable to delete CVU work files from directory \"{0}\""
// *Cause: An attempt to remove files from the specified directory failed.
// *Action: Make sure that the user running Cluster Verification Utility has the authority to create the indicated directory or specify a different (usable) directory with the CV_DESTLOC environment variable.
/
11921, ONS_CONF_COPY_FILE_ERR, "Error copying ONS configuration file \"{0}\" from node \"{1}\" to node \"{2}\""
// *Cause: The specified file could not be copied from the specified source node to the destination node.
// *Action: Examine the accompanying error message for details.
/
/
11922, TASK_ONS_CONF_INTEGRITY_PASSED, "Check for consistency of ONS configuration file \"{0}\" passed"
// *Document: NO
// *Cause:
// *Action:
/
11923, TASK_ONS_CONF_INTEGRITY_FAILED, "Check for consistency of ONS configuration file \"{0}\" failed"
// *Document: NO
//  *Cause:
// *Action:
/
11924, ONS_CONF_FILE_LOCAL_REMOTE_SAME, "Local and remote ONS ports are same on node \"{0}\" "
// *Cause: The local and remote port specified in the ons.config were the same.
// *Action: Ensure that different local and remote ports were specified in the ONS configuration file.
/
11925, CV_BASELINE_NOTHING_TO_COMPARE, "No collected baseline elements found."
// *Document: NO
// *Cause:
// *Action:
/
/
11926, ONS_CONF_SAME_LOCAL_PORT_CHECK_PASSED, "All nodes have same \'localport\' entry defined in ONS configuration file \"{0}\""
// *Document: NO
// *Cause:
// *Action:
/
/
11927, ONS_CONF_LOCAL_FOR_NODES, " \'localport\' entry was \"{0}\" on nodes: {1}"
// *Document: NO
// *Cause:
// *Action:
/
11928, ONS_CONF_INCONSISTENT_REMOTE_PORT, " \'remoteport\' entry in the existing ONS configuration file \"{0}\" is inconsistent"
// *Cause: The ONS configuration file had inconsistent 'remoteport' entries.
// *Action: Make sure that all nodes of the cluster have the same 'remoteport' entry in the specified file.
/
11929, ONS_CONF_REMOTE_FOR_NODES, " \'remoteport\' entry was \"{0}\" on nodes: {1}"
// *Document: NO
// *Cause:
// *Action:
/
11930, NOT_WRITABLE_ON_NODES, "Path \"{0}\" is not writeable on nodes \"{1}\"."
//  *Cause: The identified path was not writeable on the indicated nodes.
// *Action: Ensure that write access is enabled for the current user on the identified path.
/
11931, NOT_WRITABLE_ON_NODE, "Path \"{0}\" is not writeable on node \"{1}\"."
//  *Cause: The identified path was not writeable by current user on the indicated node.
// *Action: Ensure that write access is enabled for the identified path by the current user.
/
11932, CAN_NOT_CREATE_PATH_ON_NODE, "Path \"{0}\" cannot be created on node \"{1}\"."
//  *Cause: The identified path can not be created on the indicated node.
// *Action: Ensure that the current user has authorization to create the identified path.
/
11933, ONS_CONF_SAME_REMOTE_PORT_CHECK_PASSED, "All nodes have same \'remoteport\' entry defined in ONS configuration file \"{0}\""
// *Document: NO
// *Cause:
// *Action:
/
11934,ONS_LOCAL_REMOTE_PORT_CHECK_START, "Checking if ONS local and remote ports conflict..."
// *Document: NO
// *Cause:
// *Action:
/
/
11935,ONS_CONF_UNABLE_TO_READ, "Unable to read file \"{0}\" copied to local scratch area from node: {1}"
// *Cause: An error occurred while trying to read the specified file.
// *Action: Ensure that the user running Cluster Verification Utility has the authority to create the indicated directory, or specify a different (usable) directory with the CV_DESTLOC environment variable. Also, look for messages accompanying this message for details.
/
11936,ONS_REMOTE_PORT_CONSISTENT_CHECK_START, "Checking if ONS remote ports are consistent..."
// *Document: NO
//  *Cause:
// *Action:
/
11937, SOFTWARE_CHECK_NOT_APPLICABLE_NODES, "Oracle Database is not configured to run on nodes \"{0}\"."
// *Cause: Oracle Database was not configured to run on the indicated nodes. For administrator-managed databases, the database instances were not configured to run on the indicated nodes. For policy-managed databases, the indicated nodes were not in any of the server pools of the database.
// *Action: Remove the nodes from the command line and rerun the check.
/
11938, SOFTWARE_CHECK_NOT_APPLICABLE_ON_ANY_NODE, "Oracle Database is not configured to run on any of the specified nodes."
// *Cause: Oracle Database was not configured to run on any of the specified nodes.
// *Action: Ensure that Oracle Database is configured to run on the specified nodes. For administrator-managed databases, ensure that the database instances are configured to run on the nodes. For policy-managed databases, ensure that the nodes are in the server pools of the database.
/
11940, CV_BASELINE_NO_DEVIATIONS, "No deviations found."
// *Document: NO
// *Cause:
// *Action:
/
/
11945, INCORRECT_ORACLE_HOME_GROUP_PERMISSIONS, "Oracle Database software home location \"{0}\" does not have required group permissions on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: CVU checking determined that the group permissions were incorrect on
//          the indicated Oracle Database home location on the indicated node.
// *Action: Ensure that the specified home has the required permissions set and 
//          retry the CVU check. An operating system command 'chmod g+rwx' may
//          be used along with the indicated home location to correct the 
//          permissions on the node.
/
11946, MISSING_ORACLE_HOME_GROUP_READ_PERMISSIONS, "Oracle Database software home location \"{0}\" does not have read permission for group on node \"{1}\"."
//  *Cause: CVU checking determined that the group permissions were incorrect on
//          the indicated Oracle Database home location on the indicated node.
// *Action: Ensure that the specified home has read permission set and retry  
//          the CVU check. An operating system command 'chmod g+r' may be used 
//          along with the indicated home location to correct the permissions
//          on the node.
/
11947, MISSING_ORACLE_HOME_GROUP_EXEC_PERMISSIONS, "Oracle Database software home location \"{0}\" does not have execute permission for group on node \"{1}\"."
//  *Cause: CVU checking determined that the group permissions were incorrect on
//          the indicated Oracle Database home location on the indicated node.
// *Action: Ensure that the specified home has execute permission set and retry 
//          the CVU checks. An operating system command 'chmod g+x' may be used
//          along with the indicated home location to correct the permissions
//          on the node.
/
11950, INVALID_ORACLE_HOME_ALL_NODES, "Executable \"{0}\" does not exist on any node. The specified home \"{1}\" is not a valid Oracle home."
//  *Cause: The 'oracle' executable was not found in the expected location on any node.
// *Action: Specify a valid Oracle home.
/
11951, INVALID_ORACLE_HOME_NODE, "Executable \"{0}\" does not exist on node \"{1}\"."
//  *Cause: The 'oracle' executable was not found in the expected location on the specified node.
// *Action: Ensure that the specified home is a valid Oracle home on the specified node.
/
11952, TASK_ELEMENT_RAC_HOME, "Oracle home: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11953, TASK_DESC_RAC_HOME, "This task verifies the writability of the Oracle Database software home {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11954, TASK_RAC_HOME_START, "Check: Oracle Database software home writability of {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11955, TASK_RAC_HOME_PASSED, "Oracle Database software home check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11956, TASK_RAC_HOME_FAILED, "Oracle Database software home check failed"
// *Document: NO
//  *Cause:
// *Action:
/
11960, FILE_SUID_NOT_SET, "Set user ID bit is not set for file \"{0}\" on node \"{1}\"."
//  *Cause: The set user ID bit was not set for the identified file on the 
//          indicated node.
// *Action: Log in as the root user and set the set user ID bit for the 
//          identified file using command 'chmod +s <file>'.
/
11961, FAIL_CHK_FILE_SUID, "failed to check the set user ID bit for file \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to verify the Set user ID bit for the identified file failed on the indicated nodes.
// *Action: Ensure that the identified file exists and that the user has read and execute permissions on it.
/
11962, TASK_ELEMENT_RAC_ORACLE_BASE, "Oracle base: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11963, TASK_DESC_RAC_ORACLE_BASE, "This task verifies the free space and writability of the Oracle base {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11964, TASK_RAC_ORACLE_BASE_START, "Check: Oracle base free space and writability of {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11965, TASK_RAC_ORACLE_BASE_PASSED, "Oracle base check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11966, TASK_RAC_ORACLE_BASE_FAILED, "Oracle base check failed"
// *Document: NO
//  *Cause:
// *Action:
/
11970, TASK_ELEMENT_DISK_SCHEDULER, "I/O scheduler"
// *Document: NO
// *Cause:
// *Action:
/
11971, TASK_DESC_DISK_SCHEDULER, "This task checks the I/O scheduler parameter configured"
// *Document: NO
// *Cause:
// *Action:
/
11972, TASK_DISK_SCHEDULER_START, "Checking I/O scheduler parameter configured"
// *Document: NO
// *Cause:
// *Action:
/
11973, TASK_DISK_SCHEDULER_PASSED, "I/O scheduler parameter configuration passed"
// *Document: NO
// *Cause:
// *Action:
/
11974, TASK_DISK_SCHEDULER_FAILED, "I/O scheduler parameter configuration failed"
// *Document: NO
// *Cause:
// *Action:
/
11975, TASK_DISK_SCHEDULER_NOT_EXPECTED, "The I/O scheduler parameter of device \"{0}\" did not match the expected value on nodes \"{1}\". [Expected scheduler = \"{2}\" ; Found scheduler = \"{3}\"]"
// *Cause: The I/O scheduler parameter of the indicated device was not the expected value on the indicated nodes.
// *Action: Change the I/O scheduler parameter using 'echo deadline > /sys/block/<device>/queue/scheduler' command of the indicated device to ensure it is the expected value.
/
11976, TASK_DISK_SCHEDULER_NOT_EXPECTED_POST, "The I/O scheduler parameter of device \"{0}\" that belongs to ASM disk \"{1}\" of the ASM disk group \"{2}\" did not match the expected value on nodes \"{3}\". [Expected scheduler = \"{4}\" ; Found scheduler = \"{5}\"]."
// *Cause: The I/O scheduler parameter of the indicated device was not the expected value on the indicated node.
// *Action: Change the I/O scheduler parameter using 'echo deadline > /sys/block/<device>/queue/scheduler' command for the indicated device to ensure it is the expected value.
/
11977, TASK_DISK_SCHEDULER_NOT_SET, "The I/O scheduler parameter is not configured for device \"{0}\" on nodes \"{1}\"."
// *Cause: An attempt to obtain the I/O scheduler corresponding to the specified device failed on the node specified.
// *Action: Ensure that the specified device has a I/O scheduler parameter configured.
/
11978, TASK_DISK_SCHEDULER_NO_DISKS, "There are no ASM disks to verify."
// *Document: NO
//  *Cause:
// *Action:
/

11979, TASK_ELEMENT_DEST_CRS_HOME, "Grid Infrastructure home path: {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11980, TASK_DESC_DEST_CRS_HOME, "This task verifies the writability of the Grid Infrastructure home path {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11981, TASK_DEST_CRS_HOME_START, "Check: Grid Infrastructure home writability of path {0}"
// *Document: NO
//  *Cause:
// *Action:
/
11982, TASK_DEST_CRS_HOME_PASSED, "Grid Infrastructure home check passed"
// *Document: NO
//  *Cause:
// *Action:
/
11983, TASK_DEST_CRS_HOME_FAILED, "Grid Infrastructure home check failed"
//  *Cause: The Grid Infrastructure home path was not writable.
// *Action: Ensure that the Grid Infrastructure user has write permissions for the indicated path.
/
12100, TASK_ELEMENT_TIME_OFFSET, "Time offset between nodes"
// *Document: NO
// *Cause:
// *Action:
/
12101, TASK_DESC_TIME_OFFSET, "This check verifies the time offset between the cluster nodes."
// *Document: NO
// *Cause:
// *Action:
/
12102, TASK_DESC_TIME_OFFSET_FAILED, "The time difference between nodes \"{0}\" and \"{1}\" is beyond the permissible offset of \"{2}\" seconds"
// *Cause: The Cluster Verification Utility detected a time offset between the
//         indicated nodes was more than the indicated permissible value.
// *Action: Ensure that the time difference between the indicated nodes is less
//          than the indicated permissible value.
/
12103, TASK_DESC_TIME_OFFSET_FAILED_NODE, "The current time offset of \"{0}\" seconds on node \"{1}\" is greater than the permissible offset of \"{2}\" when compared to the time on node \"{3}\""
// *Cause: The Cluster Verification Utility detected a time offset between
//         the indicated nodes was more than the permissible value.
// *Action: Ensure that the time difference between the indicated nodes is less
//          than the indicated permissible value.
/
12104, TASK_DESC_TIME_OFFSET_ERROR, "Failed to retrieve the current time from node \"{0}\""
// *Cause: An attempt to retrieve the current time from the indicated node 
//         failed with the indicated error. 
// *Action: Examine the accompanying error messages, correct the indicated  
//          issues, and then retry the operation.
/
12800, TASK_ASMDEVCHK_AFD_CHECK, "Checking that ASM devices are ASM Filter Driver capable."
// *Document: NO
//  *Cause:
// *Action:
/
12801, TASK_ASMDEVCHK_AFD_DEVICE_CHECK_PASS, "All selected ASM devices are found to be ASM Filter Driver capable."
// *Document: NO
//  *Cause:
// *Action:
/
12802, TASK_ASMDEVCHK_AFD_DEVICE_CHECK_WARNING, "ASM devices \"{0}\" are not ASM Filter Driver capable."
//  *Cause: The indicated devices were not ASM filter driver capable.
// *Action: To make them AFD capable, ensure that the devices selected for ASM 
//          are configured as block devices on Linux or character devices on
//          AIX and Solaris operating system platforms.
/
12803, TASK_ASMDEVCHK_AFD_CHECK_PASSED, "ASM Filter Driver compatibility check passed."
// *Document: NO
//  *Cause:
// *Action:
/
12804, TASK_ASMDEVCHK_AFD_CHECK_FAILED, "ASM Filter Driver compatibility check failed."
// *Document: NO
//  *Cause:
// *Action:
/
12805, TASK_ASMDEVCHK_DEVICE_TYPE_INCORRECT_NODE, "Device \"{0}\" cannot be managed by the ASM Filter Driver on node \"{1}\"."
//  *Cause: The indicated ASM device did not have a correct device type and hence
//          was identified as not AFD capable.  
// *Action: If you intend to use the ASM Filter Driver to manage this device, 
//          ensure that the device selected for ASM is a block device on Linux 
//          or a character device on AIX and Solaris operating system platforms.
/
12806, TASK_ASMDEVCHK_DEVICE_TYPE_FAILED, "failed to discover the device type of devices \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to retrieve the device type of the indicated device
//          failed on the identified nodes. 
// *Action: Ensure that the device is correctly configured on the indicated
//          node and that the user has permission to read its attributes.
/
12807, ASMDEVCHK_GET_DEV_TYPE_FAILED_NODE, "failed to retrieve the device type of device \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve the device type of the indicated devices
//          failed on all the nodes.
// *Action: Ensure that the device is correctly configured and that the user
//          has permission to read the device attributes. 
//          Examine the accompanying error messages for details.
/
12808, ASMDEVCHK_ASMLIB_NO_AFD_WARN, "ASMLib is installed on nodes \"{0}\"; ASM Filter Driver will not be used for managing ASM devices."
//  *Cause: ASMLib was found installed on the indicated nodes. 
// *Action: Ensure that ASMLib is not installed on cluster nodes if you plan
//          to use the ASM Filter Driver to manage ASM devices.
/
12809,ONS_REMOTE_PORT_MISSING_NODES,  " \'remoteport\' entry is missing  from ONS configuration file \"{1}\" on nodes \"{0}\"."
//  *Cause: The Oracle Notification Sservices (ONS) configuration file was missing the remote port entry.
// *Action: Add the remote port entry to the ONS configuration file.
/
12810, EXPAND_DEVICE_PATH_FAILED, "failed to expand the device path discovery string \"{0}\" "
//  *Cause: The requested operation could not be completed because the indicated
//          device path discovery string argument could not be 
//          expanded to a list of ASM disk devices.
// *Action: Retry the request specifying a valid device path discovery string.
/
12850, TASK_ELEMENT_NETWORK_CONSISTENCY_CHECKS, "Network configuration consistency checks"
// *Document: NO
//  *Cause:
// *Action:
/ 
12851, TASK_DESC_NETWORK_CONSISTENCY_CHECKS, "This task checks that all the currently configured subnetworks for the CRS home are available on each of the cluster nodes."
// *Document: NO
//  *Cause:
// *Action:
/
12852, TASK_NETWORK_CONSISTENCY_CHECKS_START, "Checking network configuration consistency."
// *Document: NO
//  *Cause:
// *Action:
/
12853, TASK_NETWORK_CONSISTENCY_CHECKS_FAILED, "Check for network configuration consistency failed."
// *Document: NO
//  *Cause:
// *Action:
/
12854, TASK_NETWORK_CONSISTENCY_CHECKS_PASSED, "Check for network configuration consistency passed."
// *Document: NO
//  *Cause:
// *Action:
/
12855, TASK_NETWORK_CONSISTENCY_CHECKS_PVT_FAILED_NODE, "Configured private networks \"{0}\" with subnet masks \"{1}\" do not exist on nodes \"{2}\"."
//  *Cause: The indicated CRS private subnets did not match any subnet
//          available on the identified node.
// *Action: The network configuration used for the existing CRS installation
//          must be available networks on each of the cluster nodes.
//          Use the 'oifcfg setif' command to correctly configure the 
//          subnets for the existing installation.
/
12856, TASK_NETWORK_CONSISTENCY_CHECKS_PUB_FAILED_NODE, "Configured public subnets \"{0}\" with subnet masks \"{1}\" do not exist on nodes \"{2}\"."
//  *Cause: The indicated CRS public subnets did not match any subnet
//          available on the identified node.
// *Action: The network configuration used for the existing CRS installation
//          must be available networks on each of the cluster nodes.
//          Use the 'oifcfg setif' command to correctly configure the 
//          subnets for the existing installation.
/
12857, TASK_NETWORK_CONSISTENCY_CHECKS_FAILED_NODES, "Classfied subnet configuration of the current CRS home \"{0}\" does not match any existing subnets on nodes \"{1}\"."
//  *Cause: The indicated CRS subnet did not match any subnet
//          available on the identified nodes.
// *Action: The network configuration used for the existing CRS installation
//          must be available networks on each of the cluster nodes.
//          Use the 'oifcfg setif' command to correctly configure the 
//          subnet for the existing installation.
/
12858, TASK_NETWORK_CONSISTENCY_CHECKS_ERROR, "Following error occurred during the network configuration consistency checks."
//  *Cause: An error occurred while performing the network configuration consistency checks.
// *Action: Examine the accompanying messages for specific details on the  
//          network configuration problem, and rectify the issues.
/
12860, RESOLV_CONF_OPTIONS_EXISTANCE_CHECK, "Checking resolver configuration file \"{0}\" to make sure only one 'options {1}' entry is defined"
// *Document: NO
// *Cause:
// *Action:
/
12861, RESOLV_CONF_OPTION_NON_EXISTANT, "'options {0}' entry does not exist in resolver configuration file \"{1}\" on nodes \"{2}\""
// *Cause: The indicated option entry was specified on some nodes, but not all of them.
// *Action: Ensure that the indicated option is either specified consistently or not specified in the resolver configuration file on all cluster nodes.
/
12862, RESOLV_CONF_OPTIONS_DOESNOT_EXIST_ALL, "'options {0}' entry does not exist in any resolver configuration file"
// *Document: NO
// *Cause:
// *Action:
/
12863, RESOLV_CONF_SINGLE_OPTIONS_CHECK, "Checking resolver configuration file \"{0}\" to make sure that only one 'options {1}' entry is defined"
// *Document: NO
// *Cause:
// *Action:
/
12864, RESOLV_CONF_MULTI_OPTION_NODES, "The resolver configuration file \"{0}\" on the nodes \"{1}\" has more than one 'options {2}' entry"
// *Cause: The indicated option entry was found more than once on nodes specified in the resolver configuration file indicated.
// *Action: Ensure that there is only one option entry in the file indicated.
/
12865, RESOLV_CONF_SINGLE_OPTIONS_CHECK_PASSED, "All resolver configuration file have only one 'options {0}' entry."
// *Document: NO
// *Cause:
// *Action:
/
12866, RESOLV_CONF_SAME_OPTIONS_CHECK_PASSED, "All nodes \"{0}\" have same 'options {1}' defined in resolver configuration file \"{2}\""
// *Document: NO
// *Cause:
// *Action:
/
12867, RESOLV_CONF_INCONSISTENT_OPTION, "'options {0}' entries in the resolver configuration file \"{1}\" are inconsistent"
// *Cause: A check of each node's resolv.conf files found inconsistent entries of the indicated option.
// *Action: Ensure that all nodes of the cluster have same indicated option entry in the file indicated.
/
12868, RESOLV_CONF_OPTIONS_FOR_NODES, " 'options {0}' entry \"{1}\" was found on nodes {2}"
// *Document: NO
// *Cause:
// *Action:
/
// Translator: do not translate 'attempts' 'timeout'
12869, RESOLV_CONF_TIMEOUTATTEMPTS_MAX, "The product of the 'attempts' option value \"{0}\" and the 'timeout' option value \"{1}\" in the resolver configuration file \"{2}\" is greater than the maximum allowed \"{3}\"."
// *Cause: A check of node's resolv.conf files found values greater than the maximum allowed.
// *Action: "Ensure that the product of resolver 'attempts' and 'timeout' is within limits on all nodes.
/
12880, TASK_ELEMENT_IP_PACKET_SIZE_CHECK, "Check that maximum (MTU) size packet goes through subnet"
// *Document: NO
//  *Cause:
// *Action:
/
12881, TASK_DESC_IP_PACKET_SIZE_CHECK, "Checking maximum (MTU) size packet goes through subnet in a jumbo frame environment"
// *Document: NO
//  *Cause:
// *Action:
/
12882, TASK_IP_PACKET_SIZE_CHECK_START, "Checking maximum (MTU) size packet goes through subnet..."
// *Document: NO
//  *Cause:
// *Action:
/
12883, TASK_IP_PACKET_SIZE_CHECK_PASSED, "Check for maximum (MTU) size packet goes through subnet passed"
// *Document: NO
//  *Cause:
// *Action:
/
12884, TASK_IP_PACKET_SIZE_CHECK_FAILED, "Maximum (MTU) size packet check failed on subnets \"{0}\""
//  *Cause: The network switch was not configured with jumbo frames or the 
//          identified subnets do not support jumbo frames. 
// *Action: Ensure that the network switch is configured with jumbo frames 
//          and the network subnets support jumbo frames.
/
12885, IP_PACKET_WITHOUT_FRAGMENTATION_FAILED, "ICMP packet of MTU size \"{0}\" does not go through subnet \"{1}\"."
//  *Cause: The network switch was not configured with jumbo frames or 
//          the network subnet does not support the identified MTU size.
// *Action: Ensure that the network switch is configured with jumbo frames 
//          and the network subnet supports the identified MTU size.
/
12886, TASK_IP_PACKET_SIZE_PARSE_INT_ERROR, "Interface \"{0}\" has an invalid MTU value \"{1}\"."
//  *Cause: The retrieved MTU value from ip command contained other than decimal digits.
// *Action: Configure an MTU value for the identified interface with decimal digits only. Look at the accompanying messages for more details.
/      
12887, TASK_IP_PACKET_SIZE_MTU_RETRIEVAL_FAILED, "failed to get the MTU value for interface \"{0}\" using ip command \"{1}\" on node \"{2}\""
//  *Cause: An attempt to obtain the MTU value for the identified interface failed on the indicated node.
// *Action: Ensure that the indicated executable accessible on the node. Look at the accompanying messages for more details.
/
12888, TASK_ELEMENT_PATH_GRP_PERM, "Path to be verified: {0}"
// *Document: NO
// *Cause:
// *Action:
/
12889, TASK_DESC_PATH_GRP_PERM, "This task verifies the group permissions of the path {0}."
// *Document: NO
// *Cause:
// *Action:
/
12890, TASK_PATH_GRP_PERM_START, "Checking group permissions of the path: {0}"
// *Document: NO
// *Cause:
// *Action:
/
12891, TASK_PATH_GRP_PERM_PASSED, "Group permissions check for path passed."
// *Document: NO
// *Cause:
// *Action:
/
12892, TASK_PATH_GRP_PERM_FAILED, "Group permissions check for path failed."
// *Document: NO
// *Cause:
// *Action:
/
12893, TASK_PATH_GRP_PERM_ERROR, "User \"{0}\" failed to determine the permissions of path \"{1}\" on nodes \"{2}\"."
// *Cause: An attempt to check the permissions of the indicated path failed 
//         on the indicated nodes.
// *Action: Ensure that the indicated path exists on all nodes.
/
12894, TASK_PATH_GRP_FAIL_GET_GROUPS, "Failed to get the groups of user \"{0}\" on nodes \"{1}\"."
// *Cause: An attempt to get the groups of the indicated user failed on the 
//         indicated nodes.
// *Action: Ensure that the indicated user exists on the indicated nodes.
/
12895, TASK_PATH_GRP_PERM_INVALID_PERM, "The group \"{1}\" of the path \"{0}\", does not have execute permissions for \"others\" \"{2}\" and \"group\" \"{3}\" configured on node \"{4}\"."
// *Cause: The check found a bad permissions configuration of the indicated 
//         path on the indicated node.
// *Action: Ensure that the Grid user has execute permissions on all nodes.
/
// Translator: do not translate 'others' 'group'
12896, TASK_PATH_GRP_PERM_USER_GROUP, "The owning group \"{0}\" of path \"{1}\" is not in the groups \"{2}\" of the Grid user on node \"{3}\"."
// *Cause: The check for permissions of the indicated path found that the
//         group was not in the indicated groups of the Grid user on the 
//         indicated node.
// *Action: Ensure that the Grid user has execute permissions, either by group 
//          membership or by the path having execute permissions for others
//          to the indicated groups of the Grid user on all nodes.
//          1) Change the group of the path to one of the indicated groups
//          2) Add the Grid user to the group of the path
//          3) Change the permissions for 'others'
//          4) Change the permissions for 'group'
/
12899, TASK_ANTIVIRUS_RUNNING_CHECK_START, "Checking for antivirus service not running..."
// *Document: NO
//  *Cause:
// *Action:
/
12900, TASK_ANTIVIRUS_RUNNING_CHECK_PASSED, "Check for antivirus service not running passed."
// *Document: NO
//  *Cause:
// *Action:
/
12901, TASK_DESC_ANTIVIRUS_RUNNING, "Checking that antivirus service is not running on any of the nodes"
// *Document: NO
//  *Cause:
// *Action:
/
12902, TASK_ELEMENT_ANTIVIRUS_RUNNING, "Check that antivirus service is not running"
// *Document: NO
//  *Cause:
// *Action:
/
12910, TASK_ELEMENT_ORAFENCE_SERVICE, "Check Oracle Fence Service status"
// *Document: NO
//  *Cause:
// *Action:
/
12911, TASK_DESC_ORAFENCE_SERVICE, "Checks the existence of orafenceservice.sys file and status of Oracle Fence Service"
// *Document: NO
//  *Cause:
// *Action:
/
12912, TASK_ORAFENCE_SERVICE_CHECK_START, "Checking Oracle Fence Service status..."
// *Document: NO
//  *Cause:
// *Action:
/
12913, TASK_ORAFENCE_SERVICE_CHECK_PASSED, "Oracle Fence Service check passed."
// *Document: NO
//  *Cause:
// *Action:
/
12914, TASK_ORAFENCE_SERVICE_FILE_MISSING_NODES, "Oracle Fence service file \"{0}\" is missing on nodes \"{1}\"."
//  *Cause: The Oracle Fence Service file was not found at the identified path on the indicated nodes.
// *Action: Install the Oracle Fence Service using the command '<GI_HOME>/bin/crssetup.exe installFence'.
/
// Translator: do not translate 'kernel'
12915, TASK_ORAFENCE_NOT_CONFIG_SERVICE, "The service \"{0}\" is not configured with the service type 'kernel' as expected on nodes \"{1}\"."
//  *Cause: The configuration of the identified Windows service did not specify the expected service type: 'kernel'.
// *Action: Configure the service by using 'sc.exe <server_name> config <serivce_name> type= kernel'.
/
12916, TASK_ORAFENCE_NOT_CONFIG_START, "The service \"{0}\" is not configured with the start type 'auto' as expected on nodes \"{1}\"."
//  *Cause: The configuration of the identified Windows service did not specify the expected start type: 'auto'.
// *Action: Configure the service by using 'sc.exe <server_name> config <service_name> start= auto'.
/
12917, TASK_ORAFENCE_SERVICE_NOT_RUNNING, "The service \"{0}\" is not running on nodes \"{1}\"." 
//  *Cause: The identified Windows service was not running on the indicated nodes.
// *Action: Start the service by using 'net.exe start <service_name>'.
/
12918, TASK_ORAFENCE_SERVICE_NOT_FOUND, "The service \"{0}\" does not exist on nodes \"{1}\"."
//  *Cause: The identified Windows service was not found on the indicated nodes.
// *Action: Install the Oracle Fence Service using the command '<GI_HOME>/bin/crssetup.exe installFence'.
/
12930, TASK_ELEMENT_VMM_SETTINGS, "Virtual memory manager parameter"
// *Document: NO
// *Cause:
// *Action:
/
12931, TASK_DESC_VMM_SETTINGS, "Check virtual memory manager tunable parameter settings for stabilizing scheduling"
// *Document: NO
// *Cause:
// *Action:
/
12932, TASK_VMM_SETTINGS_CHECK_START, "Checking the virtual memory manager tunable parameter \"{0}\" values..."
// *Document: NO
// *Cause:
// *Action:
/
12933, TASK_VMM_SETTINGS_PASSED, "Check for virtual memory manager tunable parameter \"{0}\" passed."
// *Document: NO
// *Cause:
// *Action:
/
12934, TASK_VMM_PERMANENT_SETTINGS_INCORRECT, "The virtual memory manager tunable parameter \"{0}\" does not have expected \"DEF\" value on nodes \"{1}\" [Expected = \"{2}\"]"
//  *Cause: The identified parameter did not have the expected \"DEF\" value on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and change the identified parameter \"DEF\" value using command '/usr/sbin/vmo -p -o <parameter>=<value>'.
/
12935, TASK_VMM_REBOOT_SETTINGS_INCORRECT, "The virtual memory manager tunable parameter \"{0}\" does not have expected \"BOOT\" value on nodes \"{1}\" [Expected = \"{2}\"]"
//  *Cause: The identified parameter did not have the expected \"BOOT\" value on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and change the identified parameter \"BOOT\" value using command '/usr/sbin/vmo -r -o <parameter>=<value>'. 
/
12936, PROCESSOR_FOLDING_NOT_TURNED_OFF, "Processor folding parameter \"{0}\" is not disabled on nodes \"{1}\"."
//  *Cause: Processor folding was not turned off on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and turn off the processor folding using command '/usr/sbin/schedo -p -o <parameter>=-1'.
/
12937, STRING_TO_INT_CONVERSION_ERROR, "failed to convert string \"{0}\" to integer value"
//  *Cause: The identified string to integer conversion failed.
// *Action: Examine the accompanying messages for details.
/
12938, RUN_ASM_QUERY_CVUHELPER_EXEC_ERR, "An internal command 'cvuhelper' exited unexpectedly on node \"{0}\" while running a SQL query on ASM."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
12939, RUN_ASM_QUERY_CVUHELPER_NO_OUTPUT, "An internal command 'cvuhelper' failed to produce any output on node \"{0}\" while running a SQL query on ASM."
//  *Cause: An attempt to execute an internal cvuhelper command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
12940, RUN_ASM_QUERY_CVUHELPER_PARSE_ERR, "failed to parse 'cvuhelper' command output"
//  *Cause: An attempt to parse output from an internal cvuhelper command failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
12941, RUN_ASM_QUERY_CVUHELPER_ERR, "An internal command 'cvuhelper' failed to run a SQL query on ASM on node \"{0}\"."
//  *Cause:  An ASM SQL query failed unexpectedly.
// *Action: Examine the accompanying error message
//          and correct the problem indicated, if possible.  Otherwise,
//          contact Oracle Support Services.
/
12942, RUN_ASM_QUERY_NO_ASM_CONFIG, "failed to obtain ASM instance configuration on node \"{0}\""
//  *Cause: An attempt to retrieve information about configuration of an ASM instance on the indicated node failed.
// *Action: Ensure that the ASM instance, if configured, is correctly configured and an ASM instance is up and running on the indicated node.
/
12943, RUN_ASM_QUERY_ORADRIVER_NOT_FOUND, "failed to load Oracle JDBC Driver"
//  *Cause: An attempt to load Oracle JDBC Driver failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
12944, RUN_ASM_QUERY_CREDENTIALS_NOT_FOUND, "failed to obtain credentials to connect to ASM with role {0}"
//  *Cause: An attempt to obtain ASM credentials for the current OS user failed.
// *Action: If the specified role is SYSDBA then ensure that the current OS user
//          is part of the OSDBA group. If the specified role is SYSASM then 
//          ensure that the current OS user is part of the OSASM group.
/
12945, RUN_ASM_QUERY_GET_CONNECTION_FAILED1, "An error occurred while establishing connection to ASM with current OS user and connect descriptor:\n\"{0}\""
//  *Cause: An attempt to connect to ASM failed.
// *Action: Examine the accompanying error message for details.
/
12946, RUN_ASM_QUERY_GET_CONNECTION_FAILED2, "An error occurred while establishing connection to ASM using role {0}."
//  *Cause: An attempt to connect to ASM failed.
// *Action: Examine the accompanying error message for details.
/
12947, GET_ASM_CONN_CVUHELPER_ERR, "An internal command 'cvuhelper' failed to obtain ASM connection information on node \"{0}\"."
//  *Cause: An attempt to get ASM connection information failed.
// *Action: Examine the accompanying error message
//          and correct the problem indicated, if possible.  Otherwise,
//          contact Oracle Support Services.
/
12948, ASM_CONNECT_INFO_ERROR, "Failed to get ASM connection information. Verification cannot proceed."
//  *Cause: Error occurred while attempting to get ASM connection information.
// *Action: Examine the accompanying error messages for details, resolve
//          problems identified and retry.
/
12949, ASM_CONNECT_ERROR, "Failed to get ASM connection. Verification cannot proceed."
//  *Cause: An error occurred attempting to connect to ASM.
// *Action: Examine the accompanying error messages for details, resolve
//          problems identified and retry.
/
12950, RUN_MGMTDB_QUERY_CVUHELPER_EXEC_ERR, "An internal 'cvuhelper' command exited unexpectedly on node \"{0}\" while running a SQL query against the GIMR."
//  *Cause: An internal 'cvuhelper' command exited unexpectedly while 
//          attempting to run a SQL query against the Grid Infrastructure
//          Management Repository (GIMR). This was an internal error.
// *Action: Contact Oracle Support Services.
/
12951, RUN_MGMTDB_QUERY_CVUHELPER_NO_OUTPUT, "An internal 'cvuhelper' command failed to produce any output on node \"{0}\" while running a SQL query against the GIMR."
//  *Cause: An internal 'cvuhelper' command failed to produce any output
//          when running a SQL query against the Grid Infrastructure
//          Management Repository (GIMR). This was an internal error.
// *Action: Contact Oracle Support Services.
/
12952, RUN_MGMTDB_QUERY_CVUHELPER_PARSE_ERR, "failed to parse 'cvuhelper' command output"
//  *Cause: An attempt to parse the output of an internal 'cvuhelper' command 
//          failed. This was an internal error.
// *Action: Contact Oracle Support Services.
/
12953, RUN_MGMTDB_QUERY_CVUHELPER_ERR, "An internal 'cvuhelper' command encountered an error while running a SQL query against the GIMR on node \"{0}\"."
//  *Cause: A SQL query against the Grid Infrastructure Management Repository 
//          (GIMR) failed.
// *Action: Examine the accompanying messages, resolve the indicated 
//          problems, and then retry the operation.
/
12954, RUN_MGMTDB_QUERY_OFFLINE, "GIMR is not online on node \"{0}\"."
//  *Cause: An attempt to run a SQL query against the Grid Infrastructure 
//          Management Repository (GIMR) failed because the GIMR was 
//          not online on the indicated node.
// *Action: Ensure that the GIMR instance is running on the indicated node.
//          Use command "srvctl status mgmtdb" to check the status of
//          the instance and retry the operation.
/
////////////////////////////////////////////////////////////////////////////////
// NOTE: 12950 - 12992 - Reserved for future run asm query messages
////////////////////////////////////////////////////////////////////////////////
12993, COMP_HC_CANNOT_PROCEED_ASM, "ASM is not running on any of the nodes. Verification cannot proceed."
//  *Cause: No ASM instance was found running on any of the nodes while attempting to perform ASM health checks.
// *Action: Ensure that the ASM instances, if configured, 
//          are correctly configured and running on sufficient number of nodes.
//          Use the command 'srvctl config asm' to determine 
//          the number of ASM instances that are supposed to be running.
/
13001, XML_TASK_DEFINITION_NOT_FOUND, "target XML file \"{0}\" for task definition not found"
//  *Cause: An attempt to retrieve the task definition failed because
//          the target XML file was missing.
// *Action: Ensure that the indicated target XML file is available.
/
13000, TASK_ELEMENT_ALL_KERNEL_PARAM_COLLECTION, "All Kernel Parameters"
// *Document: NO
// *Cause:
// *Action:
/
13101, TASK_DESC_ALL_KERNEL_PARAM_COLLECTION, "collects all kernel parameters"
// *Document: NO
// *Cause:
// *Action:
/
13102, TASK_ELEMENT_ALL_OS_PACKAGE_COLLECTION, "All Operating System Packages"
// *Document: NO
// *Cause:
// *Action:
/
13103, TASK_DESC_ALL_OS_PACKAGE_COLLECTION, "collects all operating system packages"
// *Document: NO
// *Cause:
// *Action:
/
13104, TASK_ELEMENT_ALL_OS_PATCH_COLLECTION, "All Operating System Patches"
// *Document: NO
// *Cause:
// *Action:
/
13105, TASK_DESC_ALL_OS_PATCH_COLLECTION, "collects all operating system patches"
// *Document: NO
// *Cause:
// *Action:
/
13106, TASK_ELEMENT_ALL_RLIMITS_COLLECTION, "All operating system resource limits"
// *Document: NO
// *Cause:
// *Action:
/
13107, TASK_DESC_ALL_RLIMITS_COLLECTION, "collects all operating system resource limits"
// *Document: NO
// *Cause:
// *Action:
/
13108, TASK_ELEMENT_ALL_ENV_VAR_COLLECTION, "All environment variables"
// *Document: NO
// *Cause:
// *Action:
/
13109, TASK_DESC_ALL_ENV_VAR_COLLECTION, "collects all environment variables"
// *Document: NO
// *Cause:
// *Action:
/
131010, TASK_ELEMENT_ALL_INITTAB_COLLECTION, "All inittab entries"
// *Document: NO
// *Cause:
// *Action:
/
13111, TASK_DESC_ALL_INITTAB_COLLECTION, "collects all inittab entries"
// *Document: NO
// *Cause:
// *Action:
/
13112, TASK_ELEMENT_ALL_RLIMITS_FOR_CRSD_COLLECTION, "All operating system resource limits for crsd process"
// *Document: NO
// *Cause:
// *Action:
/
13113, TASK_DESC_ALL_RLIMITS_FOR_CRSD_COLLECTION, "collects all operating system resource limits for crsd process"
// *Document: NO
// *Cause:
// *Action:
/
13114, TASK_ELEMENT_ALL_ENV_VAR_FOR_CRSD_COLLECTION, "All environment variables for crsd process"
// *Document: NO
// *Cause:
// *Action:
/
13115, TASK_DESC_ALL_ENV_VAR_FOR_CRSD_COLLECTION, "collects all environment variables for crsd process"
// *Document: NO
// *Cause:
// *Action:
/
13122, INITTAB_COPY_FILE_ERR, "encountered error in copying file \"{0}\" from node \"{1}\" to node \"{2}\""
//  *Cause: An error was encountered while attempting to copy the indicated 
//          file from the indicated source node to the indicated destination node.
// *Action: Examine the accompanying error message for details. 
//          Resolve the issues raised and retry.
/
13123, INITTAB_FILE_NOT_EXIST_NODE, "File \"{0}\" does not exist on following nodes: {1}."
//  *Cause: File specified did not exist on the nodes listed, but exists on other nodes.
// *Action: Make sure that the file is either present on all nodes or is not present on any node.
/
13124, INITTAB_FILE_NOT_EXIST, "File \"{0}\" does not exist on any node of the cluster. Skipping further checks."
// *Document: NO
//  *Cause:
// *Action:
/
13125, INITTAB_UNABLE_TO_CREATE_TEMP_AREA, "unable to create the directory \"{0}\"." 
//  *Cause: An attempt by CVU to create the indicated directory failed on 
//          the local node.
// *Action: Make sure that the user running CVU has read and write permissions on the 
//          directory indicated or specify a different work area using 
//          the CV_DESTLOC environment variable where the user has write permission.
/
13126, INITTAB_UNABLE_TO_REMOVE, "unable to delete files from directory \"{0}\"."
//  *Cause: An attempt by CVU to remove files from the indicated directory failed.
// *Action: Make sure that the user running CVU has read and write permissions for 
//          the directory indicated or specify a different work area using the 
//          CV_DESTLOC environment variable where the user executing this check 
//          has write permission.
/
13127, INITTAB_UNABLE_TO_READ, "unable to read file \"{0}\" copied to local scratch area from node {1}."
//  *Cause: An error occurred while attempting to read the indicated file.
// *Action: Make sure that the CV_DESTLOC area was not being used by 
//          another process. Make sure that the user running CVU has read 
//          and write permissions for the directory. Also look for messages
//          accompanying this message for details.
/
13128, INITTAB_ENTRY_ID, "id"
// *Document: NO
// *Cause:
// *Action:
/
13129, INITTAB_ENTRY_RUNLEVELS, "runlevels"
// *Document: NO
// *Cause:
// *Action:
/
13130, INITTAB_ENTRY_ACTION, "action"
// *Document: NO
// *Cause:
// *Action:
/
13131, INITTAB_ENTRY_PROCESS, "process"
// *Document: NO
// *Cause:
// *Action:
/
13150, BASELINE_HDR_NAME, "Name"
// *Document: NO
// *Cause:
// *Action:
/
13151, BASELINE_HDR_OCR_KEY_NAME, "OCR Key Name"
// *Document: NO
// *Cause:
// *Action:
/
13152, BASELINE_HDR_FILE_NAME, "File Name"
// *Document: NO
// *Cause:
// *Action:
/
13153, BASELINE_HDR_RESOURCE_NAME, "Resource Name"
// *Document: NO
// *Cause:
// *Action:
/
13154, BASELINE_HDR_PROFILE_ELEMENT_NAME, "Profile Element Name"
// *Document: NO
// *Cause:
// *Action:
/
13155, BASELINE_HDR_KEY_ATTRIBUTE, "Key Attribute"
// *Document: NO
// *Cause:
// *Action:
/
13156, BASELINE_HDR_FILE_ATTRIBUTE, "File Attribute"
// *Document: NO
// *Cause:
// *Action:
/
13157, BASELINE_HDR_RESOURCE_ATTRIBUTE, "Resource Attribute"
// *Document: NO
// *Cause:
// *Action:
/
13158, BASELINE_HDR_ATTRIBUTE, "Attribute"
// *Document: NO
// *Cause:
// *Action:
/
13159, RESOLV_CONF_EMPTY, "On node \"{0}\" the file \"/etc/resolv.conf\" could not be parsed because the file is empty."
// *Cause: Pre-requisite checking for Oracle grid infrastructure install failed
because the /etc/resolv.conf file could not be parsed because it was empty. 
// *Action: Ensure that /etc/resolv.conf file is properly configured.
/
13160, TASK_ELEMENT_ASM_DEVICE_SHAREDNESS, "ASM device sharedness check"
// *Document: NO
// *Cause:
// *Action:
/
13161, TASK_DESC_ASM_DEVICE_SHAREDNESS, "This check verifies the sharedness of devices selected for ASM."
// *Document: NO
// *Cause:
// *Action:
/
13162, TASK_ELEMENT_ACL, "Access Control List check"
// *Document: NO
// *Cause:
// *Action:
/
13163, TASK_DESC_ACL, "This check verifies that the ownership and permissions are correct and consistent for the devices across nodes."
// *Document: NO
// *Cause:
// *Action:
/
13164, BASELINE_HDR_ASM_DISK_GROUP, "ASM Disk Group"
// *Document: NO
// *Cause:
// *Action:
/
13165, TASK_ACL_DISABLED_CHECK_START, "Checking whether file access control is disabled for ASM disk groups"
// *Document: NO
//  *Cause:
// *Action:
/
13166, TASK_ACL_DISABLED_CHECK_SUCCESS, "File access control is disabled for all ASM disk groups."
// *Document: NO
//  *Cause:
// *Action:
/
// Translator: do not translate 'FALSE'
13167, TASK_ACL_DISABLED_CHECK_FAILED, "File access control is enabled for ASM disk groups \"{0}\"." 
//  *Cause: The ASM disk group property ACCESS_CONTROL.ENABLED was set to TRUE
//          for the indicated ASM disk groups
// *Action: Ensure that the ASM disk group property ACCESS_CONTROL.ENABLED is
//          set to the value 'FALSE' by running the command 'asmcmd setattr
//          -G <diskgroup_name> access_control.enabled FALSE' for each disk
//          group.
/
// Translator: do not translate 'FALSE'
13168, TASK_ACL_DISABLED_CHECK_OP_FAILED, "failed to determine the value of ASM disk group property ACCESS_CONTROL.ENABLED"
//  *Cause: An ASM query failed unexpectedly.
// *Action: Examine the accompanying error messages for details. Ensure 
//          that the ASM disk group property ACCESS_CONTROL.ENABLED is set
//          to the value 'FALSE' by running the command 'asmcmd setattr -G
//          <diskgroup_name> access_control.enabled FALSE' for each disk 
//          group.
/
13169, TASK_ELEMENT_ASM_ACL_ATTRIB, "ASM disk group access control attribute check"
// *Document: NO
// *Cause:
// *Action:
/
13170, TASK_DESC_ASM_ACL_ATTRIB, "This check verifies that file access control is disabled for ASM disk groups."
// *Document: NO
// *Cause:
// *Action:
/

13200, REPORT_TXT_STAGE_APPLICATION_CLUSTER, "Oracle Clusterware Application Cluster"
// *Document: NO
//  *Cause:
// *Action:
/
13201, INVALID_PARAM_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Contact Oracle Support Services and provide the internal identifier displayed in the message.
/
13202, VERIFICATION_STAGE_APPCLUSTER_MODE, "Stage verification is not supported for cluster of type \'{0}\'."
//  *Cause: Cluster stage verification could not proceed because verificatlion is not possible for clusters of the indicated type.
// *Action: Make sure that the cluster type is Oracle Clusterware Application Cluster or do not apply this verification on this cluster.
/
13203, VERIFICATION_COMP_APPCLUSTER_MODE, "Component verification is not supported for cluster of type \'{0}\'."
//  *Cause: Cluster component verification could not proceed because verificatlion is not possible for clusters of the indicated type.
// *Action: Make sure that the cluster type is Oracle Clusterware Application Cluster or do not apply this verification on this cluster.
/
13204, VERIFICATION_STAGE_FLEX_CLUSTER_MODE, "stage verification not possible for cluster type \'{0}\'."
//  *Cause: Cluster stage verification could not proceed because verification 
//          was not possible for clusters of the indicated type. Requested
//          verification applicable on Oracle Flex Cluster.
// *Action: Request the applicable stage verification for the indicated cluster 
//          type.
/
13210, REPORT_EMPTY_TASK_LIST_APPCLUSTER_SCAN_COMP, "invalid request for SCAN component check for an Oracle Clusterware Application Cluster"
// *Cause: SCAN component verification was requested for an Oracle Application
//         Cluster.
// *Action: Specify a cluster that is not an Oracle Clusterware Application Cluster or 
//          omit the request for SCAN verification.
/
13211, REPORT_EMPTY_TASK_LIST_APPCLUSTER_NODE_APP, "invalid request for node applications check for an Oracle Clusterware Application Cluster"
// *Cause: Node application verification was requested for an Oracle Clusterware Application Cluster.
// *Action: Specify a cluster that is not an Oracle Clusterware Application Cluster or 
//          omit the request for node application verification.
/
13215, REPORT_HEADER_NOT_FOUND, "CVU 'header.xml' not found in the report zip file."
// *Cause: The Cluster Verification Utility (CVU) baseline report could not be read because the 'header.xml' was not found in the report zip file.
// *Action: Ensure that the valid baseline report zip containing the complete CVU baseline report is specified and retry the baseline comparison.
/
13216, REPORT_TXT_STAGE_PATCH, "Patch Application"
// *Document: NO
//  *Cause:
// *Action:
/
13301, CRSD_PID_NOT_AVAILABLE, "The CRSD process identifier (PID) is not available in release \"{0}\"."
//  *Cause: An attempt to retrieve the process identifier for the CRSD process failed because the operation was not available in releases prior to 11.2.0.3.
// *Action: To use this feature, the Clusterware must be upgraded to a release greater or equal to 11.2.0.3
/
13330, ERROR_GETTING_CVUQDISK_VERSION, "error getting the version of 'cvuqdisk' on node \"{0}\""
//  *Cause: An attempt to retrieve the version of 'cvuqdisk' failed on the specified node.
// *Action: Ensure that 'cvuqdisk' is installed properly on the specified node. To check the installation use the command 'rpm -qi cvuqdisk'. 
/
13331, ERROR_GETTING_DISK_INFO, "could not locate the disk for path \"{0}\""
//  *Cause: An attempt to locate the disk for the specified path failed.
// *Action: Ensure that the disk is configured for the indicated path.
/
13332, ERROR_FINDING_DEVICE_INFO, "could not find any disk configured in partion file \"{0}\""
//  *Cause: An attempt to retrieve the list of disks found no disk configured in the indicated partition file.
// *Action: Ensure that at least one disk is configured.
/
13333, INVALID_DEVICE_PATH, "Path \"{0}\" is not a valid device path."
//  *Cause: The indicated path does not end with a valid disk name.
// *Action: Provide a valid device path.
/
13334, UNKNOWN_DEVICE_PATH, "Path \"{0}\" is of unknown device type."
//  *Cause: The type of the device path could not be determined.
// *Action: Provide a valid device path.
/
13335, OCFS_VERSION_NOT_FOUND, "could not determine the version of OCFS on node \"{0}\""
//  *Cause: The OCFS installation directories were not found on the indicated node.
// *Action: Ensure that the OCFS is installed properly on the specified node.
/
13336, INVALID_FILE_SYSTEM_PATH, "Path \"{0}\" is an invalid file system path."
//  *Cause: The indicated path was neither a directory path nor a regular file path. 
// *Action: Provide a valid file system path.
/
13337, ERROR_GETTING_RAWDISK_DETAILS, "error getting details of block device on node \"{0}\""
//  *Cause: An attempt to retrieve the details of the block device failed on the indicated node.
// *Action: Examine the accompanying error message for details.
/
13338, ERROR_PARTITION_FILE, "format error in partition file \"{0}\" for the entry \"{1}\""
//  *Cause: An attempt to read the indicated partition file failed because the indicated entry could not be parsed.
// *Action: Examine the the indicated partition file and correct the format of the entry.
/
13339, INVALID_STORAGE_PATH, "could not resolve the path \"{0}\" on node \"{1}\""
//  *Cause: The indicated path could not be resolved to produce an absolute pathname. 
// *Action: Ensure that the indicated path is an existing path and that the current user has access permission for this path on identified node.
/
13351, TASK_VMM_CURRENT_SETTINGS_INCORRECT, "The virtual memory manager tunable parameter \"{0}\" does not have expected \"CUR\" value on nodes \"{1}\" [Expected = \"{2}\"]"
//  *Cause: The identified parameter did not have the expected \"CUR\" value on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and change the identified parameter \"CUR\" value using command '/usr/sbin/vmo -o <parameter>=<value>'.
/
13352, TASK_DESC_PSM_SETTINGS, "Check processor scheduler manager tunable parameter settings for stabilizing scheduling"
// *Document: NO
// *Cause:
// *Action:
/
13353, TASK_ELEMENT_PSM_SETTINGS, "Processor scheduler manager parameter"
// *Document: NO
// *Cause:
// *Action:
/
13354, TASK_PSM_SETTINGS_CHECK_START, "Checking the processor scheduler manager tunable parameter \"{0}\" values..."
// *Document: NO
// *Cause:
// *Action:
/
13355, TASK_PSM_SETTINGS_PASSED, "Check for processor scheduler manager tunable parameter \"{0}\" passed."
// *Document: NO
// *Cause:
// *Action:
/
13356, TASK_PSM_CURRENT_SETTINGS_INCORRECT, "The processor scheduler manager tunable parameter \"{0}\" does not have expected \"CUR\" value on nodes \"{1}\" [Expected = \"{2}\"]"
//  *Cause: The identified parameter did not have the expected \"CUR\" value on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and change the identified parameter \"CUR\" value using command '/usr/sbin/schedo -o <parameter>=<value>'.
/
13357, TASK_PSM_DEFAULT_SETTINGS_INCORRECT, "The processor scheduler manager tunable parameter \"{0}\" does not have expected \"DEF\" value on nodes \"{1}\" [Expected = \"{2}\"]"
//  *Cause: The identified parameter did not have the expected \"DEF\" value on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and change the identified parameter \"DEF\" value using command '/usr/sbin/schedo -p -o <parameter>=<value>'.
/
13358, TASK_PSM_REBOOT_SETTINGS_INCORRECT, "The processor scheduler manager tunable parameter \"{0}\" does not have expected \"BOOT\" value on nodes \"{1}\" [Expected = \"{2}\"]"
//  *Cause: The identified parameter did not have the expected \"BOOT\" value on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and change the identified parameter \"BOOT\" value using command '/usr/sbin/schedo -r -o <parameter>=<value>'. 
/
13360, TASK_DESC_LOOPBACK_CHECK, "Check required loopback network interface address configuration"
// *Document: NO
// *Cause:
// *Action:
/
13361, TASK_ELEMENT_LOOPBACK_CHECK, "loopback network interface address"
// *Document: NO
// *Cause:
// *Action:
/
13362, TASK_LOOPBACK_CHECK_MISSING_IPV4, "The loopback network interface configured with an IPv4 address was not found on nodes \"{0}\"."
//  *Cause: The Cluster Verification Utility determined that there was no
//          loopback network interface configured with an IPv4 address
//          "127.0.0.1/8" on the indicated nodes. 
// *Action: Log in to the indicated nodes as the root user and configure the
//          loopback network interface with an IPv4 address "127.0.0.1/8" on the
//          indicated nodes.
/
13363, TASK_LOOPBACK_CHECK_MISSING_IPV6, "The loopback network interface configured with an IPv6 address was not found on nodes \"{0}\"."
//  *Cause: The Cluster Verification Utility determined that there was no
//          loopback network interface configured with an IPv6 address
//          "::1/128" on the indicated nodes.
// *Action: Log in to the indicated nodes as the root user and configure the
//          loopback network interface with an IPv6 address "::1/128" on the
//          indicated nodes.
/
13364, TASK_ACL_DEVICE_OWNER, "Owner is \"{0}\" on nodes: {1}"
// *Document: NO
// *Cause:
// *Action:
/
13365, TASK_ACL_DEVICE_GROUP, "Group is \"{0}\" on nodes: {1}"
// *Document: NO
// *Cause:
// *Action:
/
13366, TASK_ACL_DEVICE_PERMS, "Permissions are \"{0}\" on nodes: {1}"
// *Document: NO
// *Cause:
// *Action:
/
13371, TASK_ELEMENT_CHECK_AUDIT_RULES, "Audit rules"
// *Document: NO
// *Cause:
// *Action:
/
13372, TASK_DESC_CHECK_AUDIT_RULES, "Checking node panic status in /etc/audit/audit.rules"
// *Document: NO
// *Cause:
// *Action:
/
13373, TASK_AUDIT_RULES_SYSTEM_PANIC, "The failure flag parameter \"{0}\" status is panic in the file \"{1}\" on nodes: \"{2}\"."
//  *Cause: The failure flag parameter value was set to 2 in the identified
//          file on the indicated nodes.
// *Action: Change the failure flag parameter value to either 0 or 1 to avoid
//          node panic on the indicated nodes, and reboot the system for the
//          changes to take effect.
/
13374, AUDIT_RULES_BAD_FORMAT, "The following lines in file \"{0}\" could not be parsed on node \"{1}\" as they are not in proper format:\n{2}"
//  *Cause: Invalid lines were found in the indicated file on the indicated 
//          node.
// *Action: Correct the errors indicated. The format of audit rules in the
//          indicated file is "<parameter> <value(s)>". For more details
//          refer to the audit.rules man page.
/
13381, INCORRECT_FILE_GROUP_PERMISSIONS, "File \"{0}\" does not have required permissions for group on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: The indicated file was found with incorrect permissions for group
//          on the indicated node.
// *Action: Ensure that the indicated file has the required permissions set.
//          An operating system command 'chmod' may be used along with the
//          indicated file to correct the permissions on the indicated node.
/
13382, INCORRECT_FILE_OTHERS_PERMISSIONS, "File \"{0}\" does not have required permissions for others on node \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: The indicated file was found with incorrect permissions for others
//          on the indicated node.
// *Action: Ensure that the indicated file has the required permissions set.
//          An operating system command 'chmod' may be used along with the
//          indicated file to correct the permissions on the indicated node.
/
13383, TASK_VOTEDSK_DGTYPE_WARNING, "There are fewer than the recommended number of voting files in ASM disk group \"{0}\" of redundancy \"{1}\". [Expected = \"{2}\" ; Found = \"{3}\"]."
//  *Cause: The Cluster Verification Utility determined that one or more disks
//          used for voting files in the indicated ASM disk group are offline.
// *Action: Either
//          1) Ensure that the offline disks in the indicated ASM diskgroup
//             are online by using the command
//             'asmcmd online -G <disk group name> -D <disk name>. The command
//             'asmcmd lsdsk -p -G <disk group name>' can be used to obtain the
//             status of disks in the indicated ASM disk group.
//          or
//          2) Use the command 'crsctl query css votedsk' to obtain the list of
//             voting files. Add more disks to the indicated ASM disk group to
//             match the specified expectation.
/
13400, NO_CRS_CONFIGURED_NODES, "Oracle Clusterware is not configured on nodes \"{0}\"."
//  *Cause: The Cluster Verification Utility (CVU) found that Oracle  
//          Clusterware had not been configured on the indicated nodes.
// *Action: Ensure that Oracle Clusterware is installed and configured on the
//          indicated nodes.
/
13401, CRS_CONFIG_ELEMENT, "Oracle Clusterware configuration"
// *Document: NO
// *Cause:
// *Action:
/
13410, CLUSTER_UPGRADE_STATE_INCONSISTENT, "The state of Oracle Clusterware is not as expected to allow upgrade or patch operation. [Expected = \"{0}\" ; Found = \"{1}\"]"
//  *Cause: The Cluster Verification Utility (CVU) pre-check found
//          that Oracle Clusterware was in the middle of some other 
//          operation with the indicated state. An upgrade or a patch 
//          application could not be performed in the indicated state.
// *Action: Complete the clusterware operation with the indicated state to 
//          ensure that Oracle Clusterware is in a consistent state and retry
//          the operation.
/
13411, CLUSTER_ACTIVE_PATCH_LEVEL_INCONSISTENT, "Oracle Clusterware active patch level \"{0}\" does not match software patch level \"{1}\" on node \"{2}\"."
//  *Cause: The Cluster Verification Utility (CVU) found that the indicated
//          Oracle Clusterware active patch level did not match the indicated 
//          software patch level on the indicated node. The patching operation
//          was either in progress or not complete on the indicated node. 
// *Action: Complete the patching operation to ensure the Oracle Clusterware
//          active patch level matches the software patch level on the 
//          indicated node and retry the operation.
/
13412, ACTIVE_PATCH_LEVEL_INCONSISTENT, "Oracle Clusterware active patch level \"{0}\" value in Oracle Cluster Registry (OCR) does not match the value in Oracle Local Registry (OLR) on node \"{2}\"."
//  *Cause: The Cluster Verification Utility (CVU) found that the indicated
//          Oracle Clusterware active patch level values in OCR and OLR
//          did not match. The patching operation was either in progress or 
//          not complete on the indicated node. 
// *Action: Complete the patching operation to ensure the consistency of
//          Oracle Clusterware active patch level and retry the 
//          operation.
/
13600, NTP_QUERY_CMD_FAIL_ALL_NODES, "Query of NTP daemon for its time sources could not be performed on all nodes on which NTP daemon was running."
//  *Cause: An attempt to query the NTP daemon for its time sources failed on
//          all the nodes of the cluster because the 'ntpq' command could not be
//          executed successfully. The accompanying messages provide detailed
//          failure information.
// *Action: Ensure that the NTP daemon query command 'ntpq' is available on
//          all the nodes and the user running the CVU check has execute
//          privileges for it. Examine the accompanying messages, resolve the
//          issues identified, and then retry the operation.
/
13601, NTP_QUERY_CMD_FAIL_NODE, "Query of NTP daemon for its time sources could not be performed on node \"{0}\"."
//  *Cause: An attempt to query the NTP daemon for its time sources failed on
//          the indicated node because the 'ntpq' command could not be executed 
//          successfully. The accompanying messages provide detailed failure
//          information.
// *Action: Ensure that the NTP daemon query command 'ntpq' is available on
//          the indicated node and the user running the CVU check has execute
//          privileges for it. Examine the accompanying messages, resolve the
//          issues identified, and then retry the operation.
/
13602, NTP_QUERY_NO_SOURCE_SYNC_UP, "NTP daemon is not synchronized with any external time source on node \"{0}\"."
//  *Cause: The output of the command 'ntpq -pn' executed on the indicated node
//          did not list any external NTP daemon synchronization time source.
//          The values of the tally code and 'refid' columns in the command 
//          output reported that the NTP daemon is either not synchronized with
//          any time source or it is synchronized with a locally connected 
//          reference clock. 
// *Action: Examine the output of the command 'ntpq -pn'. Modify the NTP
//          configuration to use one or more appropriate external time sources,
//          or correct any problems accessing the currently configured external
//          time sources. Rerun the command 'ntpq -pn' to confirm that the NTP
//          daemon running on the indicated node is now synchronized with at
//          least one external time source, and then retry the operation.
/
13603, TASK_NTP_TIME_SOURCE, "NTP daemon is synchronized with at least one external time source"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13604, CHRONY_QUERY_CMD_FAIL_ALL_NODES, "Query of chrony daemon for its time sources could not be performed on all nodes on which chrony daemon was running."
//  *Cause: An attempt to query the chrony daemon for its time sources failed
//          on all the nodes of the cluster because the 'chronyc sources'
//          command could not be executed successfully. The accompanying
//          messages provide detailed failure information.
// *Action: Ensure that the chrony daemon query command 'chronyc' is
//          available on all the nodes and the user running the CVU check has
//          execute privileges for it. Examine the accompanying messages,
//          resolve the issues identified, and then retry the operation.
/
13605, CHRONY_QUERY_CMD_FAIL_NODE, "Query of chrony daemon for its time sources could not be performed on node \"{0}\"."
//  *Cause: An attempt to query the chrony daemon for its time sources failed
//          on the indicated node because the 'chronyc sources' command could
//          not be executed successfully. The accompanying messages provide
//          detailed failure information.
// *Action: Ensure that the chrony daemon query command 'chronyc' is
//          available on the indicated node and the user running the CVU check 
//          has execute privileges for it. Examine the accompanying messages,
//          resolve the issues identified, and then retry the operation.
/
13606, CHRONY_QUERY_NO_SOURCE_SYNC_UP, "chrony daemon is not synchronized with any external time source on node \"{0}\"."
//  *Cause: The output of the command 'chronyc sources' executed on the
//          indicated node did not list any external chrony daemon
//          synchronization time source.  The values of the mode and state
//          columns in the command output reported that the chrony daemon is
//          either not synchronized with any time source or is synchronized
//          with a locally connected reference clock.
// *Action: Examine the output of the command 'chronyc sources'. Modify the
//          chrony configuration to use one or more appropriate external time
//          sources, or correct any problems accessing the currently configured
//          external time sources. Rerun the command 'chronyc sources' to
//          confirm that the chrony daemon running on the indicated node is now
//          synchronized with at least one external time source, and then retry
//          the operation.
/
13607, TASK_CHRONY_TIME_SOURCE, "chrony daemon is synchronized with at least one external time source"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13608, FILETYPE_GI_SOFTWARE, "Oracle Clusterware Software"
// *Document: NO
// *Cause: N/A
// *Action: N/A
/
13609, UNSUITABLE_FOR_GI_SOFTWARE, "The path \"{0}\" resolving to storage of type \"{1}\" is not suitable for usage as Oracle Clusterware software for release \"{2}\". Supported storage types are \"{3}\"."
//  *Cause: The Cluster Verification Utility check for storage suitability
//          determined that the storage of the indicated type designated by 
//          the indicated path was not suitable for usage as Oracle Clusterware
//          software.
// *Action: Retry the operation ensuring that the supplied storage path 
//          designates storage appropriate for Oracle Clusterware software.
/
13610, TASK_SSA_NO_SHARED_STORAGE, "No shared storage was found on nodes \"{0}\"."
//  *Cause: The Cluster Verification Utility shared storage discovery did not 
//          find any shared storage on the indicated nodes. 
// *Action: Ensure the existence of shared storage on the indicated nodes and
//          retry the operation.
/
13620, NODEAPP_RESOURCE_OFFLINE_NODE, "Node application \"{0}\" is offline on node \"{1}\"."
//  *Cause: The indicated node application was found to be offline on the indicated node.
// *Action: Bring the indicated resource online on the indicated node using the 'srvctl' command.
/
13630, HOST_RESOLVES_TO_IP_ON_NODES, "Host \"{0}\" resolves to the IP address \"{1}\" on nodes \"{2}\"."
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13631, HOST_IP_NOT_CONSISTENT, "IP address for host \"{0}\" is not consistent across the cluster nodes."
//  *Cause: The Cluster Verification Utility determined that the indicated host
//          did not resolve to the same IP address across the cluster nodes. 
//          The indicated host entry in the hosts file or DNS did not resolve 
//          to the same IP address across the cluster nodes.
// *Action: Ensure that the entry in the hosts file or DNS resolving the IP  
//          address for the indicated host is consistent across the cluster 
//          nodes and retry the CVU check.
/
13632, HOST_RESOLVES_TO_DIFFERENT_IP_ON_NODES, "Host \"{0}\" resolves to IP address \"{1}\" on the majority of cluster nodes but to address \"{2}\" on nodes \"{3}\"."
//  *Cause: The Cluster Verification Utility determined that the indicated host
//          resolved to the different IP address on the indicated nodes.
// *Action: Ensure that the indicated host resolves to the same IP address 
//          across the cluster nodes and retry the CVU check.
/
13633, HOST_FILE_ENTRY_WITH_LOCALHOST_ALIAS, "Entry for non-loopback IP addresses \"{0}\" contains 'localhost' alias in the file \"{1}\" on node \"{2}\"."
//  *Cause: An attempt to validate the hosts file failed because non-loopback
//          IP address entries were found with the 'localhost' alias in the
//          indicated file on the indicated node.
// *Action: Ensure that the entries containing alias 'localhost' specify only
//          loopback IP addresses.
/
13634, HOST_VIP_RESOLVED_TO_MULTIPLE_IPS, "Host VIP \"{0}\" resolves to multiple IP addresses \"{1}\" on node \"{2}\"."
//  *Cause: The Cluster Verification Utility determined that the indicated host
//          VIP resolved to more than one IP address on the indicated node.
// *Action: Ensure that the indicated VIP name does not resolve to more than
//          one IP address in the hosts file or via DNS.
/
13635, HOST_VIP_RESOLVED_TO_MULTIPLE_IPS_NETTYPE_MIXED, "Host VIP \"{0}\" of network type \"{1}\" resolves to more than two IP addresses \"{2}\" on node \"{3}\"."
//  *Cause: The Cluster Verification Utility determined that the indicated host
//          VIP resolved to more than two IP addresses on the indicated node.
// *Action: Ensure that the indicated VIP name does not resolve to more than two
//          IP addresses of the same address type in the hosts file or via DNS. 
/
13645, GET_VIP_NETWORK_INFO_CVUHELPER_ERR, "Command \"{0}\" to get VIP network information failed."
//  *Cause: An attempt to execute the indicated command failed.
// *Action: Examine the accompanying error messages and correct the problems
//          indicated, if possible. Otherwise, contact Oracle Support Services.
/
13646, GET_VIP_NETWORK_INFO_CVUHELPER_PARSE_ERROR, "failed to parse VIP network information from the 'cvuhelper' command output"
//  *Cause: An attempt to parse the output from an internal cvuhelper command 
//          failed.
// *Action: Examine the accompanying error messages and correct the problems
//          indicated, if possible. Otherwise, contact Oracle Support Services.
/
13660, TASK_ELEMENT_NETWORK_COLLECTION, "Network configuration collection"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13661, TASK_DESC_NETWORK_COLLECTION, "Collects the network configuration"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13662, COLLECTING_NETWORK_BASELINE, "Collecting network configuration baseline"
// *Document: NO
//  *Cause:
// *Action:
/
13663, REPORT_EMPTY_TASK_LIST_NETWORK_COLLECTION, "Network configuration baseline collections are not available for Oracle Grid Infrastructure version \"{0}\"."
// *Document: NO
//  *Cause:
// *Action:
/
13664, BASELINE_NETWORK_COLLECTION, "Network configuration"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13690, CLUSTERWARE_NOT_HEALTHY_12C, "The state of Oracle Clusterware is not ONLINE on node \"{0}\". [Found state = \"{1}\"]"
//  *Cause: The Cluster Verification Utility (CVU) determined that the Oracle
//          Clusterware state is not ONLINE on the indicated node.
// *Action: Verify the state of the Oracle clusterware using 
//          'crsctl status server' and ensure Oracle Clusterware state
//          is ONLINE on the indicated node.
/
13700, TASK_RPM_PACKAGE_MANAGER_DB_ELEMENT_NAME, "RPM Package Manager database"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13701, TASK_RPM_PACKAGE_MANAGER_DB_DESC, "Verifies the RPM Package Manager database files" 
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13702, TASK_RPM_DATABASE_CORRUPT_ON_NODES, "RPM Package Manager database files are corrupt on nodes \"{0}\"."
//  *Cause: The Cluster Verification Utility (CVU) determined that the RPM 
//          Package Manager database files were corrupt on the indicated 
//          nodes. 
// *Action: Clean and rebuild the RPM Package Manager database by running the
//          command '/bin/rpm --rebuilddb' on the indicated nodes, and then
//          retry the CVU operation.
/
13710, TASK_ELEMENT_CRS_RESOURCE_PARAMETERS, "CRS resource parameters"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13711, TASK_DESC_CRS_RESOURCE_PARAMETERS, "Verifies the CRS resource parameters"
// *Document: NO
//  *Cause: N/A
// *Action: N/A
/
13712, TASK_CRS_RESOURCE_USE_ENABLED_FAIL, "CRS resource parameter \"{0}\" set to \"{1}\" on node \"{2}\". Oracle Clusterware does not allow starting resources on this node. [Expected = \"{3}\"]" 
//  *Cause: The Cluster Verification Utility (CVU) determined that the 
//          indicated Cluster Ready Services (CRS) resource parameter did 
//          not match the expected value on the indicated node.
// *Action: Ensure that the indicated CRS resource parameter is set to the 
//          expected value on the indicated node using the command 
//          'crsctl set resource use'.
/

