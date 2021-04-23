// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCdMsg.msg
//
// DESCRIPTION
//    Message file for database implementation 
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     apfwkr      11/09/18 - Backport rakebhat_bug-28562244 from main
//     vgunredd    09/22/18 - XbranchMerge vgunredd_bug-28608786 from main
//     rakebhat    10/26/18 - fix bug 28562244
//     vgunredd    09/14/18 - fix bug 28608786
//     rakebhat    08/07/18 - fix bug 28427771
//     prajm       06/25/18 - fix bug#28018947
//     rakebhat    04/18/18 - fix bug 27835129
//     ccharits    04/11/18 - Added VOTING_DISK_FILEPATHS
//     rakebhat    01/27/18 - fix bug 27005840
//     rakebhat    10/05/17 - fix bug 26867498
//     mpradeep    09/27/17 - Add message for mgmtdb upgrade
//     ptare       07/18/17 - Config all project
//     rakebhat    07/19/17 - fix bug 26433615
//     rakebhat    06/28/17 - fix bug 26351042
//     rakebhat    06/01/17 - fix bug 26081259
//     rakebhat    05/02/17 - fix bug 25946802
//     rakebhat    04/21/17 - fix bug 25782560
//     rakebhat    04/11/17 - fix bug 23705699
//     rakebhat    01/05/17 - fix bug 23852560
//     kfgriffi    09/14/16 - Add support for RF -hubsvc option
//     ocordova    05/06/16 - Adding PDB name and Service name to mgmtdb
//     vgunredd    04/27/16 - fix bug 22838637
//     vgunredd    03/31/16 - progress msgs for RHP move db
//     vgunredd    01/27/16 - fix bug 21756686
//     ocordova    10/28/15 - Fix bug 21967163
//     vgunredd    11/18/15 - fix bug 20658276
//     epineda     11/17/15 - Reader farm support
//     kamramas    10/02/15 - services msg correction
//     vgunredd    08/26/15 - Fix bug 21678799
//     vgunredd    08/13/15 - Fix bug 20992656
//     smadabhu    02/24/15 - ER 20571081 - DRAIN_TIMEOUT_INVALID
//     kamramas    07/06/15 - Er isJavaService
//     vgunredd    06/10/15 - Fix bug 20992626
//     vgunredd    06/04/15 - Fix bug 20847320
//     smadabhu    05/20/15 - Bug 20873549
//     smadabhu    04/21/15 - ER 20861685
//     smadabhu    01/29/15 - ER 20194578
//     pevilla     01/28/15 - Add monitor and unmonitor action messages for
//                            database
//     vgunredd    12/08/14 - Proj 47205 - batch move
//     smadabhu    12/04/14 - Bug 20025802 - Add ROOT_NOT_ALLOWED
//     smadabhu    11/26/14 - Proj 51778 - Drain action framework
//     smadabhu    09/19/14 - Proj 51778 - INVALID_INTEGER
//     vgunredd    06/11/14 - Fix bug 18539293
//     vgunredd    06/04/14 - Fix bug 18829756
//     vgunredd    05/30/14 - Fix bug 14168393
//     vgunredd    05/29/14 - Add NO_DBS_IN_HOME message
//     smadabhu    05/19/14 - Bug 18695011
//     vgunredd    05/19/14 - Fix bug 18697602
//     vgunredd    05/15/14 - Fix bug 18769523
//     vgunredd    05/14/14 - XbranchMerge vgunredd_bug-18641326 from
//                            st_has_12.1
//     sidshank    05/07/14 - fix bug 18712014
//     vgunredd    04/29/14 - XbranchMerge vgunredd_bug-18611895 from
//                            st_has_12.1
//     smadabhu    04/24/14 - Backport smadabhu_bug18258558 from main
//     vgunredd    04/17/14 - Fix bug 18611895
//     smadabhu    04/16/14 - Bug 18258558
//     vgunredd    04/01/14 - Backport vgunredd_bug-18426979 from main
//     vgunredd    03/25/14 - Fix bug 18426979
//     vgunredd    03/05/14 - Fix bug 9830629
//     vgunredd    01/16/14 - Fix bug 9892886
//     smadabhu    12/11/13 - Change FAR_SYNC_STANDBY to FAR_SYNC
//     smadabhu    11/26/13 - FARSYNC error messages - Bug 17663595
//     lureyes     11/21/13 - Fix bug 17667839
//     vgunredd    11/19/13 - Fix bug 14137667
//     smadabhu    11/05/13 - bug 17674935
//     vgunredd    09/23/13 - Fix bug 17327525
//     smadabhu    08/29/13 - Bug 14842931
//     satg        08/22/13 - Fix bug 16859978
//     vobulapu    08/06/13 - Fix bug 17246790
//     smadabhu    07/29/13 - Bug 16887765
//     fmaring     07/25/13 - fixbug 11664349
//     smadabhu    07/24/13 - Bug 17206332
//     vobulapu    07/16/13 - Fix bug 16883030
//     smadabhu    07/08/13 - Add OMOTION_STOP_OPTION - ER 15986311
//     fmaring     05/14/13 - fixbugs 16472815,16784139, 16777337
//     lureyes     04/30/13 - Fix bug 16663068
//     smadabhu    04/21/13 - Bug 15877341
//     smadabhu    03/28/13 - Bug 14277518
//     smadabhu    01/29/13 - Bug 14462921
//     sowong      11/28/12 - fix bug15882617
//     satg        11/14/12 - Fix bug 14730028
//     smadabhu    09/11/12 - Add PWFILE_INVALID
//     yizhang     08/22/12 - fix bug 13990550
//     smadabhu    08/13/12 - Fix bug 14294396
//     yizhang     07/17/12 - Define CLIENT_CLUSTER_NO_DEP_ON_DG
//     smadabhu    07/02/12 - Fix bug 14241456
//     smadabhu    06/21/12 - Fix bug 14173969
//     smadabhu    06/04/12 - Fix bug 14117062
//     smadabhu    05/09/12 - Fix bug 13912403
//     yizhang     05/11/12 - fix bug 13990535
//     yizhang     05/09/12 - Define GET_SERVICE_TYPE_FAILED and SET_SERVICE_TYPE_FAILED 
//     smadabhu    03/02/12 - Add REMOVE_MGMTDB_FAILED
//     xesquive    02/07/12 - Bug fix 13566257
//     smadabhu    12/20/11 - Fix bug 12950956
//     smadabhu    11/22/11 - Fix bug 12951080
//     yizhang     09/12/11 - Define messages for qp and rf
//     yizhang     08/02/11 - Add SET_PQ_SERVICE_FAILED
//     sowong      06/28/11 - fix bug10429223
//     smadabhu    05/23/11 - Add exception messages required to support
//                            application continuity
//     sowong      05/14/11 - fix cause errors
//     smadabhu    05/13/11 - Add GET_SQL_TRANSLATION_PROFILE_FAILED
//     smadabhu    05/06/11 - Add INVALID_SESSION_STATE
//     vobulapu    05/04/11 - add support for shared password file on ASM
//                            Diskgroup
//     smadabhu    04/26/11 - Add GET_MAX_LAG_TIME_FAILED
//     smadabhu    03/31/11 - Add error message for pluggable database
//     rxkumar     03/23/11 - fix bug11892178
//     rxkumar     02/02/11 - fix bug9877357
//     abhisbg     01/25/11 - Add new message for version mismatch while create
//                            database
//     rxkumar     12/03/10 - fix bug10272919
//     rxkumar     08/12/10 - fix bug9953614
//     rxkumar     07/27/10 - fix bug9750741
//     sowong      07/25/10 - XbranchMerge sowong_bug-9930571 from
//                            st_has_11.2.0
//     sowong      07/22/10 - fix bug9930571
//     sowong      07/14/10 - XbranchMerge sowong_bug-9879817 from main
//     sowong      07/08/10 - fix bug9886573
//     rxkumar     06/01/10 - rename omotion to online relocation
//     rxkumar     05/13/10 - fix bug9710733
//     rxkumar     05/10/10 - fix bug9691464
//     sowong      05/05/10 - add support for upgrade & downgrade of database
//     sowong      04/30/10 - fix bug9652364
//     rxkumar     04/23/10 - fix bug9648239
//     rxkumar     04/08/10 - fix bug9541892
//     sowong      04/02/10 - fix bug9466781
//     rxkumar     04/09/10 - add INVALID_SVC_NAME
//     sowong      03/22/10 - fix bug9485106 & bug9489901
//     ccharits    03/19/10 - Fixed bug 8631229
//     sowong      03/16/10 - fix bug9409437 & bug9433138
//     rxkumar     03/11/10 - fix bug9437465
//     agridnev    03/03/10 - fixed bug-8332584
//     sowong      03/02/10 - fix bug9436592
//     rxkumar     03/01/10 - fix bug9417211
//     sowong      02/25/10 - fix bug8715357
//     rxkumar     02/15/10 - fix bug8939813
//     rxkumar     02/11/10 - fix bug9368623
//     sowong      02/08/10 - fix bug9314490
//     rxkumar     02/08/10 - fix bug9347795
//     rxkumar     01/27/10 - fix bug9283852
//     agridnev    01/14/10 - fixed bug-9182664
//     sowong      01/14/10 - fix bug9271490
//     sowong      01/13/10 - fix bug9251008
//     rxkumar     01/08/10 - fix bug8968662
//     rxkumar     12/29/09 - mv RM_LAST_RAC1SVC_FAILED to PrkoMsg.msg
//     rxkumar     12/21/09 - fix bug9198537
//     agridnev    12/17/09 - fixed bug bug-9196984
//     sowong      12/09/09 - add upgrade messages
//     rxkumar     12/09/09 - fix bug9189760
//     sowong      12/03/09 - add INVALID_OMOTION_TIMEOUT message
//     sowong      11/17/09 - move messages from srvctl to SRVM for omotion
//     rxkumar     11/16/09 - add RAC->RACOne convert msgs
//     sowong      11/11/09 - add messages for rac one node
//     yizhang     11/10/09 - Add GET_SERVICE_EDITION_FAILED
//     rxkumar     10/20/09 - update msg
//     rxkumar     10/13/09 - add RACOne msgs
//     sowong      10/21/09 - fix bug8791771
//     agridnev    07/31/09 - fixed bug-6653587
//     yizhang     06/03/09 - Add cause and action for messages
//     yizhang     05/28/09 - fix messages
//     yizhang     05/18/09 - fix message DISKGROUP_NOT_EXIST
//     yizhang     05/07/09 - fix bug 8481969
//     rxkumar     05/12/09 - sync db config types with docs
//     agridnev    04/28/09 - fixed bug 8460971
//     sowong      04/26/09 - add mesage for bug-7190209
//     sowong      04/24/09 - fix bug8211423
//     agridnev    04/16/09 - fixed bug-8427829
//     agridnev    04/12/09 - fixed bug-8417254
//     agridnev    04/01/09 - fixed bug-8338015
//     sowong      03/13/09 - fix bug8329309
//     rxkumar     03/04/09 - fix bug8295755
//     rxkumar     02/17/09 - fix bug8249717
//     sowong      12/16/08 - add message for acfs resource not found during
//                            setting up of dependencies for db
//     agridnev    11/24/08 - fixed bug-7381394
//     sowong      10/10/08 - add message for bug6874976
//     sowong      08/07/08 - add message for bug6922518
//     lmortime    08/04/08 - 
//     agridnev    07/28/08 - review based changes
//     agridnev    07/24/08 - fix for bug-7198789
//     rxkumar     07/22/08 - fix bug7142054: sg->sp
//     agridnev    07/07/08 - added message for empty prefered list in
//                            HAService.modify()
//     sowong      07/02/08 - fix bug6954822
//     agridnev    06/19/08 - added messages for HAServiceImpl
//     agridnev    06/12/08 - added message for isDBCentric
//     agridnev    06/10/08 - fixed typos
//     agridnev    06/09/08 - added message as a part of fix for 6883108
//     agridnev    06/02/08 - fixed (once again) names for database/service
//                            centric configs
//     rxkumar     06/02/08 - add CANNOT_RELOCATE_UNIFORM_DB/SVC
//     sowong      05/28/08 - fix bug7132107
//     rxkumar     05/12/08 - add CREATE_PRECONNECT_SVC_FAILED
//     rxkumar     05/08/08 - add INVALID_RELOCATE_OPTION
//     rxkumar     05/06/08 - add CANNOT_CHANGE_ENUM_VALUE
//     sowong      05/07/08 - add messages for bug7019447
//     spavan      05/07/08 - Fix bug6960890
//     sowong      04/22/08 - add messages for bug6974139
//     sowong      04/09/08 - add GET_DB_UNIQUE_NAME_FAILED
//     sowong      04/03/08 - add QUERY_PRE_TB_DB_FAILED
//     sowong      03/25/08 - add message for ofs dependency
//     sravindh    03/18/08 - Transfer cause and action from java file
//     sowong      02/21/08 - add message for database domain
//     sowong      01/22/08 - add new message for database instance
//     sowong      01/11/08 - remove text containing service or db centric
//     agridnev    01/03/08 - added suppor for FailoverMethod
//     agridnev    12/13/07 - added support for ServerSideTAF
//     agridnev    11/28/07 - added failed to modify service
//     agridnev    11/26/07 - added messages to support service getArgs() and
//                            modify()
//     agridnev    11/16/07 - updated SET_DBROLE_FAILED
//     agridnev    11/09/07 - added UPDATE_PULLUP_FAILED
//     sowong      10/09/07 - add INVALID_MGMT_POLICY, etc
//     sowong      09/07/07 - add message for validating network and server group
//     sowong      07/20/07 - add messages for rac db and services implementation
//     sowong      12/28/06 - add new messages for database and services
//     rxkumar     12/14/06 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, DB_ALREADY_EXISTS, "Database {0} already exists"
//  *Cause: The specified database resource was already registered in Oracle Clusterware. 
// *Action: No action is needed.
/
1001, DB_NOT_EXISTS, "Database {0} does not exist"
//  *Cause: The specified database resource was not registered in Oracle Clusterware.
// *Action: Register the database resource using the command 'srvctl add database'.
/
1002, DB_DEP_ON_SP, "Database {0} is dependent upon server pool {1}"
//  *Cause: An attempt to remove the specified server pool failed because the server pool is in use.
// *Action: Remove the specified database before removing the server pool.
/
1003, SVC_ALREADY_EXISTS, "Service {0} already exists"
//  *Cause: The specified service was already created and registered in Oracle Clusterware.
// *Action: No action is needed.
/
1004, SVC_DEP_ON_SP, "Service {0} is dependent upon server pool {1}"
//  *Cause: An attempt to remove the specified server pool failed because the server pool is in use.
// *Action: Remove the specified service before removing the server pool.
/
1005, SRVG_NOT_EXIST, "Server pool {0} for the database {1} does not exist"
//  *Cause: The specified server pool used by the database was removed by force.
// *Action: Create the server pool using the command 'srvctl add srvpool'.
/
1006, DBNAME_NOT_EXIST, "Dummy message line"
//  *Document: No
//  *Cause: Message is not used. 
// *Action: 
/
1007, GET_DBNAME_FAILED, "Failed to retrieve the database name"
//  *Cause: Failed in retrieving the DB_NAME resource attribute.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1008, SPFILE_NOT_EXIST, "Server parameter file does not exist for database {0}"
//  *Cause: Failed in retrieving the SPFILE resource attribute.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1009, GET_SPFILE_FAILED, "Failed to retrieve server parameter file of database {0}"
//  *Cause: Cannot retrieve the server parameter file for the specified database.
// *Action: Retry the request after ensuring that the CRS stack is running, the database resource has been configured, and the user has read permission on the database resource.
/
1010, SET_SPFILE_FAILED, "Failed to update server parameter file {0} of database {1}"
//  *Cause: Unable to update the server parameter file for the specified database.
// *Action: Retry the request after ensuring that the CRS stack is running, the database resource has been configured, and the user has update permission on the database resource.
/
1011, GET_IS_CLUSTERDB_FAILED, "Failed to identify whether this database {0} is a multi-instance database"
//  *Cause: Failed in retrieving the CLUSTER_DATABASE resource attribute.
// *Action: Examine the accompanying error messages for details.
/
1012, GET_DISKGROUP_FAILED, "Failed to retrieve disk group list for database {0}."
//  *Cause: Failed to retrieve the diskgroups from the start dependencies of the specified database.
// *Action: Examine the accompanying error messages for details. Create the diskgroup using sqlplus if the specified diskgroup does not exist. Mount the diskgroup in database which registers the diskgroup with Oracle Clusterware.
/
1013, SET_DISKGROUP_FAILED, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1014, GET_DBDOMAIN_FAILED, "Failed to retrieve database domain of database {0}"
//  *Cause: Failed to get the domain of the specified database from its USR_ORA_DOMAIN attribute.
// *Action: Examine the accompanying error messages for details.
/
1015, CARDINALITY_TAF_ERROR, "Combination of service cardinality {0} and TAF {1} is not allowed for service {2}"
//  *Cause: The specified service cardinality can not be used with the specified TAF policy.
// *Action: Change the cardinality or find a matching TAF policy. PRECONNECT can only be used with SINGLETON cardinality.
/
1016, SRVG_FAILURE, "Failure encountered while accessing server pool {0} for database {1}"
//  *Cause: An attempt to look up the server pools referenced by the database SERVER_POOLS attribute failed.
// *Action: Examine the accompanying error messages for details.
/
1017, SRVG_PARENT_DB_UNMATCHED, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1018, AGENT_FILENAME_NOT_EXISTS, "Dummy message line"
//  *Document: No
//  *Cause: This message is not used.
// *Action: 
/
1019, GET_ORACLE_HOME_FAILED, "Failed to retrieve Oracle home of database {0}"
//  *Cause: An attempt to retrieve the ORACLE_HOME attribute of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1020, GET_SERVICE_TAF_FAILED, "Failed to retrieve TAF policy for service {0}"
//  *Cause: An attempt to retrieve the TAF_POLICY attribute of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1021, SET_SERVICE_TAF_FAILED, "Failed to update TAF policy  {0} for service {1}"
//  *Cause: An attempt to set the TAF_POLICY attribute of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1022, SINGLE_INST_ALREADY_EXISTS, "Cannot add a second instance to a single instance database"
//  *Cause: Unable to add an instance to a single instance database.
// *Action: Multiple instances are not supported for a single instance database. Convert to a Oracle RAC database if multiple instances are desired.
/
1023, INST_ALREADY_EXISTS, "An instance has already been added to node {0} for database {1}"
//  *Cause: Unable to add an instance to the database on the specified node because another instance has already been added to the node. 
// *Action: Use the command 'srvctl modify instance' to change the instance name on the specified node.
/
1024, GET_INSTANCE_LIST_FAILED, "Failed to retrieve instance list for database {0}"
//  *Cause: An attempt to get the list of the instances for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1025, CREATE_DB_FAILED, "Failed to create database {0}"
//  *Cause: An attempt to create Clusterware resources for the specified database failed. Either the request was issued by the wrong OS userid or a problem was detected inside Oracle Clusterware.
// *Action: Examine the accompanying error messages for details. Login in as the user of the Oracle Home to issue the command 'srvctl add database'. 
/
1026, CREATE_SERVICE_FAILED, "failed to create service {0} for database {1}"
//  *Cause: An attempt to create the specified service failed. 
// *Action: Examine the accompanying error messages for details. 
/

1027, GET_DB_FAILED, "Failed to retrieve database {0}"
//  *Cause: An attempt to get the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1028, GET_SERVICE_FAILED, "Failed to retrieve service resource {0} for database {1}"
//  *Cause: An attempt to get the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1029, DISKGROUP_NOT_EXIST, "Disk group {0} for database {1} does not exist"
//  *Cause: The disk group for the specified database does not exist.
// *Action: Use the command 'srvctl add diskgroup' to add the specified disk group.
/
1030, IS_CARDINAL_FAILED, "Failed to determine whether the database {0} has cardinality"
//  *Cause: Failed to determine whether the specified database is cardinality based or not based on its VERSION attribute.
// *Action: Examine the accompanying error messages for details.
/
1031, IS_SVC_CARDINAL_FAILED, "Failed to determine whether the service {0} has cardinality"
//  *Cause: Failed to check whether the specified service is cardinality based or not.
// *Action: Examine the accompanying error messages for details.
/
1032, REMOVE_DB_FAILED, "Failed to remove database resource {0}"
//  *Cause: Failed to remove the specified database.
// *Action: Examine the accompanying error messages for details.
/
1033, PARENT_GROUPS_DIFFERENCE, "The server pool of service {0} is different from the server pool of database {1}"
//  *Cause: The specified server pool is not the child of the database's server pool.
// *Action: Use a server pool which is the child of the database's server pool.
/
1034, NOT_SINGLE_INST_DB, "Database {0} is not a single instance database. It is a cluster database"
//  *Cause: The specified database is not a single instance database. 
// *Action: Provide database name for a single instance database.
/
1035, NOT_CLUSTER_DB, "Database {0} is not a cluster database"
//  *Cause: The specified database is not a cluster database.
// *Action: Provide database name for an Oracle RAC database.
/
1036, SET_ORACLE_HOME_FAILED, "Failed to set Oracle home {0} for database {1}"
//  *Cause: An attempt to update Oracle home for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1037, SET_PERX_ORACLE_HOME_FAILED, "Failed to set Oracle home {0} for database {1} on node {2}"
//  *Cause: An attempt to update Oracle home for the specified database on the specified node failed. 
// *Action: Examine the accompanying error messages for details.
/
1038, CREATE_CLUSTDB_ON_NON_CLUSTER, "Cannot create a RAC database {0} in a non cluster environment"
//  *Cause: Failed to create the specified Oracle RAC database because Oracle Clusterware is not installed and configured.
// *Action: Install and configure Oracle Clusterware before creating the Oracle RAC database.
/
1039, GET_SERVICE_DB_FAILED, "Failed to retrieve database for service {0}"
//  *Cause: An attempt to get the database that the specified service depended on failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
1040, EXISTING_DB_CENTRIC_CONFIG, "Specified server pool {0} for {1} is already hosting an administrator-managed configuration for databases {2} and services {3}"
//  *Cause: Server pool is hosting administrator-managed databases and service.
// *Action: Specify a server pool that is not hosting an administrator-managed database and service.
/
1041, INVALID_DB_CENTRIC_CONFIG, "The administrator-managed database {0} can have only one server pool {1}"
//  *Cause: Multiple server pools cannot be configured for an administrator-managed database
// *Action: Contact Oracle Support.
/
1042, SERVICE_DB_SERV_CENTRIC_CONFIG, "The database {1} is administrator-managed and a policy-managed service {0} cannot be created on it."
//  *Cause: The specified database does not support policy-managed services.
// *Action: Provide a database which supports policy-managed services.
/
1043, SERVICE_DB_DB_CENTRIC_CONFIG, "The service {0} is not a uniform or a singleton service and therefore it cannot be created as policy-managed service. This service can only be created as administrator-managed service using preferred, and optionally available instance lists."
//  *Cause: The service to be created was an administrator-managed service and the database that the service depended on was a policy-managed database.   
// *Action: Use preferred and available instance lists to create an administrator-managed service for an administrator-managed database.
/
1044, GET_NODELIST_FAILED, "Failed to retrieve the list of nodes where instances have been configured for database {0}"
//  *Cause: An attempt failed to get the list of nodes where the instances of the specified database were configured.
// *Action: Examine the accompanying error messages for details.
/
1045, ADD_INST_NOT_SUPPORTED_DB_OPT, "Database {0} is policy managed and does not support add instance option"
//  *Cause: The specified database did not support add instance option
// *Action: Take one of the following actions:
//      1) Provide an administrator-managed database. 
//      -or-
//      2) For a policy-managed database, add a server to a server pool which manages the database using the 'srvctl modify srvpool' or 'srvctl relocate server' command.
/
1046, REM_INST_NOT_SUPPORTED_DB_OPT, "Database {0} is policy managed and does not support the remove instance option"
//  *Cause: The specified database did not support the remove instance option.
// *Action: Take one of the following actions:
//      1) Provide an administrator-managed database. 
//      -or-
//      2) For a policy-managed database, stop the database on a server and then remove that server from the server pool which manages the database using the 'srvctl modify srvpool' or 'srvctl relocate server' command.
/
1047, GET_SERVICES_LIST_FAILED, "Failed to retrieve list of services for database {0}"
//  *Cause: An attempt to get the list of services for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1048, SINGLE_INST_NOT_REMOVED, "Cannot remove instance from the single instance database {0}"
//  *Cause: An attempt to remove the instance from the single instance database failed.
// *Action: Remove the database using the command 'srvctl remove database'.
/
1049, SET_DB_SP_FAILED, "Failed to update server pool {0} for database {1}"
//  *Cause: An attempt to update the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1050, SET_AUTO_START_FAILED, "Failed to update auto start value of service {0}"
//  *Cause: An attempt to update the auto start value for the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1051, ADD_INSTANCE_FAILED, "Failed to add instance to database {0}"
//  *Cause: An attempt to add an instance to the specified database failed because the node of the instance is not a node of the cluster or other errors. 
// *Action: Examine the accompanying error messages for details.
/
1052, REMOVE_INSTANCE_FAILED, "Failed to remove instance from database {0}"
//  *Cause: An attempt to remove the specified instance failed because the services depended on the instance or other errors.
// *Action: Examine the accompanying error messages for details.
/
1053, GET_PROVIDER_INST_FAILED, "Failed to retrieve the database instances providing service {0}"
//  *Cause: An attempt to get the database instances that provide the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1054, NULL_DB_NAME, "Database name is null"
//  *Cause: The database name given by the user is null.
// *Action: Provide a valid database name that is not a null string.
/
1055, NULL_INSTANCE_NAME, "Instance name is null"
//  *Cause: The instance name given by the user is null.
// *Action: Provide a valid instance name that is not a null string.
/
1056, INVALID_DB_NAME, "Database name {0} contains invalid characters."
//  *Cause:  The supplied database name contained invalid characters.
// *Action:  Supply a valid database name. A database name must start with an alphabetic character and may include only characters from "(a-z, A-Z, 0-9, $, #, _)".
/
1057, INVALID_INSTANCE_NAME, "Instance name {0} is not valid"
//  *Cause:  The supplied instance name is not of the correct format.
// *Action:  Supplied a valid instance name. The valid character set for instance name is [a-zA-Z0-9_-].
/
1058, INVALID_SINGLEDB_SP_LIST, "Invalid server pool list {0} supplied for single instance database {1}"
//  *Cause: The server pool size was not one when creating a single instance database on a cluster.
// *Action: Use one server pool with only one server when creating the single instance database.
/
1059, INVALID_INSTANCE_PREFIX, "Instance name prefix {0} contains illegal characters"
//  *Cause:  The supplied instance name prefix contained non-alphanumeric characters.
// *Action:  Supply an instance name prefix that consists of alphanumeric characters a-z, A-Z, and 0-9.
/
1060, MISSING_CLUST_SP_ARG, "Server pool has not been supplied for creating cluster service {0} for database {1}"
//  *Cause: No server pool argument has been supplied when configuring a cluster database.
// *Action: Supply an existing server pool when configuring a cluster database.
/
1061, DB_NOT_EXIST, "No database exists"
//  *Cause: No database has been configured.
// *Action: Configured database and retry.
/
1062, INVALID_SERVICE_CARDINALITY, "Invalid service cardinality {0}"
//  *Cause: The service cardinality supplied is not valid.
// *Action: Supply a valid service cardinality.
/
1063, INVALID_SERVICE_TAF, "Invalid service taf policy {0}"
//  *Cause: The service taf policy supplied is not valid.
// *Action: Supply a valid service taf policy.
/
1064, INVALID_DATABASE_ROLE, "Invalid database role {0}"
//  *Cause: The database role supplied is not valid.
// *Action: Supply a valid database role.
/
1065, INVALID_MGMT_POLICY, "Invalid managment policy {0}"
//  *Cause: The management policy supplied is not valid.
// *Action: Supply a valid management policy. The management policy should be automatic or manual.
/
1066, INVALID_START_OPTION, "Invalid start option {0}"
//  *Cause: The start option supplied is not valid.
// *Action: Supply a valid start option.
/
1067, INVALID_STOP_OPTION, "Invalid stop option {0}"
//  *Cause: The stop option supplied is not valid.
// *Action: Supply a valid stop option.
/
1068, MODIFY_INST_DB_CENTRIC_FAILED, "Failed to modify instance {0} on node {1} for database {2}"
//  *Cause: The instance for the specified node does not exist on the database.
// *Action: Use srvctl add instance to add the per-X instance.
/
1069, MODIFY_INST_FAILED, "Failed to modify instance {0} on node {1} for database {2}"
//  *Cause: The instance for the specified node cannot not be updated.
// *Action: Make sure that the crs stack is up and running; the oracle user has the permission to modify the instance; and then retry.
/
1070, GET_START_OPTION_FAILED, "Failed to retrieve startup options for database {0}"
//  *Cause: Unable to retrieve the startup options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1071, SET_START_OPTION_FAILED, "Failed to update startup options for database {0}"
//  *Cause: Unable to update the startup options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1072, GET_STOP_OPTION_FAILED, "Failed to retrieve stop options for database {0}"
//  *Cause: Unable to retrieve the stop options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1073, SET_STOP_OPTION_FAILED, "Failed to update stop options for database {0}"
//  *Cause: Unable to update the stop options for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1074, GET_DBROLE_FAILED, "Failed to retrieve the database role for database {0}"
//  *Cause: Unable to retrieve the database role for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1075, SET_DBROLE_FAILED, "Failed to set the database role {1} for database {0}"
//  *Cause: Unable to update the database role for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1076, GET_MGMT_POLICY_FAILED, "Failed to retrieve the management policy for database {0}"
//  *Cause: Unable to retrieve the management policy for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1077, SET_MGMT_POLICY_FAILED, "Failed to update the management policy for database {0}"
//  *Cause: Unable to update the managment policy for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1078, SET_DBNAME_FAILED, "Failed to update the db name {0} of database {1}"
//  *Cause: Unable to update the db name for the database.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1079, UPDATE_PULLUP_FAILED, "Failed to update pullup for service {0}: {1}"
//  *Cause: Failed to update pullup modifier for the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1080, GET_SERV_ARGS_FAILD, "Failed to get attributes for service {0}"
//  *Cause: Failed to get attributes for the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1081, SET_SERV_ARGS_FAILD, "Failed to set attributes for service {0}"
//  *Cause: Failed to set attributes for the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1082, SERV_MODIFY_BAD_ARG, "Failed to modify service {0}: Unsupported attribute {1}"
//  *Cause: Operation doesn't support modification of attribute.
// *Action: Fix your application.
/
1083, SERV_MODIFY_FAILED, "Failed to modify service {0}"
//  *Cause: Failed to modify service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1084, SERV_START_FAILED, "Failed to start service {0}"
//  *Cause: Failed to start the service.
// *Action: Make sure that the crs stack is up and running and then retry.
/
1085, SERV_STOP_FAILED, "Failed to stop service {0}"
//  *Cause: Failed to stop the service.
// *Action: Make sure that the crs stack is up, the service is running and then retry.
/
1086, INVALID_RLBGOAL, "Invalid rlb goal {0}"
//  *Cause: The rlb goal supplied is not valid.
// *Action: Supply a valid rlb goal.
/
1087, INVALID_FAILOVER_TYPE, "Invalid failover type {0}"
//  *Cause: The failover type supplied is not valid.
// *Action: Supply a valid failover type.
/
1088, INVALID_CLBGOAL, "Invalid connection load balancing goal {0}"
//  *Cause: The clb goal supplied is not valid.
// *Action: Supply a valid clb goal.
/
1089, INVALID_FAILOVER_METHOD, "Invalid failover method {0}"
//  *Cause: The failover method supplied is not valid.
// *Action: Supply a valid failover method.
/
1090, GET_PERX_ORACLE_HOME_FAILED, "Failed to retrieve Oracle home of database {0} on node {1}"
//  *Cause: No Oracle home of the database has been set on the specified node.
// *Action: Set the Oracle home of the database on the specified node.
/
1091, CREATE_DBINST_FAILED, "Failed to create database instance {0} for database {1}"
//  *Cause: Unable to create database instance for the specified instance name.
// *Action: Make sure that the local node can be used for creating a database instance; the instance name provided is valid. The valid character set for instance name is [a-zA-Z0-9_-].
/
1092, CREATE_DBINST_FAILED_NODE, "Failed to create database instance {0} for database {1} on node {2}"
//  *Cause: Unable to create database instance for the specified instance name and node name.
// *Action: Make sure that the specified node can be used to create a database; the instance name provided is valid. The valid character set for instance name is [a-zA-Z0-9_-].
/
1093, SET_DBDOMAIN_FAILED, "Failed to update the domain {0} of database {1}"
//  *Cause:  Unable to update the domain for the database.
// *Action:  Make sure that the crs stack is up and running and then retry.
/
1094, OFS_CREATE_STARTDEP_FAILED, "Failed to create start dependency for database {0} on the ASM cluster filesystem where ACFS path {1} resides"
//  *Cause:  Unable to modify the database resource to include a start dependency on the ASM cluster filesystem for the ACFS path.
// *Action:  Make sure that the ASM instance is running, the OFS driver exists in the driver directory, and the underlying ofs devices are accessible.
/
1095, QUERY_PRE_TB_DB_FAILED, "Failed to retrieve databases for version 11.1 and earlier"
//  *Cause:  Unable to read OCR configuration to get databases for version 11.1 and earlier
// *Action:  Make sure that the Oracle clusterware is up and running and the primary group of the user running srvctl is the same as the primary group of the user who installed the Oracle clusterware home. Also, run 11.1 srvctl config to verify that the database configuration exists in OCR.
/
1096, GET_DB_UNIQUE_NAME_FAILED, "Failed to retrieve the database unique name"
//  *Cause: Unable to read the attribute value for database unique name.
// *Action: Make sure that the Oracle clusterware is up and running and then retry.
/
1097, GET_DB_ACTIVE_SERVERS_FAILED, "Failed to retrieve the active servers of server pool {0} for database {1}"
//  *Cause: Unable to read the active servers attribute value for the database underlying server pools.
// *Action: Make sure that the Oracle clusterware is up and running; the database underlying server pools exist; the user has the permission to access the database underlying server pools and then retry.
/
1098, GET_DB_CONFIGURED_SERVERS_FAILED, "Failed to retrieve the configured servers of server pool {0} for database {1}"
//  *Cause: Unable to read the servers attribute value for the database underlying server pool.
// *Action: Make sure that the Oracle clusterware is up and running; the database underlying server pool exists and then retry.
/
1099, CANNOT_CHANGE_ENUM_VALUE, "{0} enum member has a constant value that cannot be changed to given value {1}"
//  *Cause: An attempt was made to change value of read-only valued enum member.
// *Action: Contact Oracle Support Services.
/
1100, INVALID_RELOCATE_OPTION, "Invalid relocate option {0}"
//  *Cause: Supplied relocate option is unknown.
// *Action: Contact Oracle Support Services.
/
1101, REMOVE_RUNNING_INST_FAILED, "Failed to remove running instance {0} for database {1}"
//  *Cause: Unable to remove the instance configuration for the database because the instance was still running.
// *Action: Stop the running instance using srvctl stop instance command and then retry.
/
1102, CREATE_PRECONNECT_SVC_FAILED, "Failed to create preconnect service for service {0}"
//  *Cause: An attempt to register service failed due to failure to register its corresponding preconnect service.
// *Action: Contact Oracle Support Services.
/
1103, GET_MAX_CARDINALITY_FAILED, "Failed to retrieve the maximum cardinality for database {0}"
//  *Cause: Unable to query the number of servers in the server pool used to manage the database.
// *Action: Make sure that the Oracle clusterware is up and running; the database underlying server pool exists and then retry.
/
1104, CANNOT_RELOCATE_UNIFORM_DB, "A source server must be specified to relocate cluster database {0}"
//  *Cause: Cluster database cannot be relocated without specifying source server to relocate instance from.
// *Action: Supply source and target servers for database relocation.
/
1105, CANNOT_RELOCATE_UNIFORM_SVC, "A source server must be specified to relocate service {0} "
//  *Cause: Cluster database service cannot be relocated without specifying source server to relocate service member from.
// *Action: Supply source and target servers for service relocation.
/
1106, REMOVE_SERVICE_FAILED_SP, "Failed remove service {0}: could not get data for its underlying server pool"
//   *Cause: Server pool data is not found.
//  *Action: Make sure that the Oracle clusterware is up and running; the service underlying server pool exists.
/
1107, REMOVE_SERVICE_FAILED_SP2, "Removed service {0} but failed to remove its underlying server pool {1}"
//   *Cause: Failed to remove the server pool.
//  *Action: Make sure that the Oracle clusterware is running and remove the server pool manually.
/
1108, IS_DBCETRIC_FAILED, "Failed to determine if database {0} is administrator-managed"
//  *Cause: An attempt to determine if a database is administrator-managed failed.
// *Action: Examine the accompanying error messages for details.
/
1109, GET_HASERVICE_FAILED, "Failed to find administrator-managed service {0} of database {1} because the database is a policy-managed database."
//  *Cause: The database does not support administrator-managed services.
// *Action: Provide an administrator-managed database and make sure that the service exists within that database.
/
1110, NO_INSTANCES_FOUND, "Database {0} does not have instances {1}"
//  *Cause: The database does not have instances mentioned in the message.
// *Action: Make sure that database name is correct and the database has requested instances.
/
1111, CANNOT_GET_ENUM_VALUE, "The type of service cardinality for this operation should be {1}, not {0}"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
1112, SERVICE_GETPREF_FAILED, "Failed to get preferred instances of service {0}"
//  *Cause: The service does not exist or the Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running and the service exists.
/
1113, SERVICE_MODIFY_FAILED, "Failed to modify service {0}"
//  *Cause: The service does not exist or the Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running and the service exists.
/
1114, SERVICE_ENABINST_FAILED, "Failed to enable service {0} on one or more instances"
//  *Cause: The service does not exist or enabled on all database instances. The Oracle clusterware is down.
// *Action: make sure that the Oracle clusterware is up and running; the service exists and disabled on at least one database instance.
/
1115, SERVICE_DISABINST_FAILED, "Failed to disable service {0} on one or more instances"
//  *Cause: The service does not exist or disabled on all database instances. The Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running; the service exists and enabled on at least one database instance.
/
1116, SERVICE_GETAVAIL_FAILED, "Failed to get available instances of service {0}"
//  *Cause: The service does not exist or the Oracle clusterware is down.
// *Action: Make sure that the Oracle clusterware is up and running and the service exists.
/
1117, SERVICE_EMPTY_PREF, "Failed to modify service {0}, the service should have at least one preferred instance"
//  *Cause: An attempt was made to remove all preferred instances of the service.
// *Action: Make sure that there is at least one instance provided in the service preferred instance list.
/
1118, SERVICE_MODIFY_CARD_FAILED, "Failed to set service {0} to {1} because it runs on more than one node"
//   *Cause: The service was running on more than one node.
//  *Action: Make sure that the service is not running or running on one node only.
/
1119, DBUNIQUE_NAME_UNIQUENESS_FAILED, "Failed to create database {0} because the database unique name matches that of database {1} in the first 8 characters"
//   *Cause:  The database unique name was not unique in the first 8 characters. It is a requirement because the name is used to generate ORACLE_SID.
//  *Action: Ensure that the name supplied is unique in the first 8 characters, and retry the command.
/
1120, DB_RES_NOT_EXIST, "The resource for database {0} could not be found."
//  *Cause: The resource for the specified database name could not be found. Either the database name was misspelled or the database has not been created.
// *Action: Correct the database name spelling or use the 'srvctl add database' command to create the database configuration.
/
1121, EXISTING_DB_CENTRIC_CONFIG_DB, "Specified server pool {0} for {1} is already hosting an administrator-managed configuration for database(s) {2}"
//  *Cause: Server pool is hosting administrator-managed databases.
// *Action: Specify a server pool that is not hosting an administrator-managed database.
/
1122, EXISTING_DB_CENTRIC_CONFIG_SERV, "Specified server pool {0} for {1} is already hosting an administrator-managed configuration for service(s) {2}"
//  *Cause: Server pool is hosting administrator-managed services.
// *Action: Specify a server pool that is not hosting an administrator-managed service.
/
1123, DB_ACFS_RESOURCE_NOT_EXIST, "Oracle Clusterware resource does not exist for ACFS filesystem of volume device {0}. A resource is required for the filesystem containing ACFS path {1}."
//  *Cause: The resource for the filesystem did not exist for the database which has its dependency on the ACFS path. A resource is required for path used by the database on ACFS filesystems so that Oracle Clusterware can track the database's dependency on the filesystem. Database's dependent ACFS paths cannot be mounted via the ACFS registry.
// *Action: Add the resource with 'srvctl add filesystem'.
/
1124, STOP_DB_FAILED, "Failed to stop database {0} and its services"
// *Cause: Attempt to stop the database has failed.
// *Action: Ensure that user attempting to stop the database has execute privileges on the database resource. Also, review the accompanying error messages for details about failure to stop database. Retry after resolving those issues or contact Oracle Support Services.
/
1125, ACFS_CREATE_STOPDEP_FAILED, "Failed to create dependency from database {0} to its Oracle home {1} that is located on the ASM cluster filesystem"
//  *Cause:  An attempt to modify the database resource to include a stop dependency on the ASM cluster filesystem for the database's Oracle home failed.
// *Action:  Make sure that the asm instance is running; the ACFS driver exists in the driver directory and the underlying ACFS devices are accessible.
/
1126, REMOVE_PREF_INSTANCE, "Instance {0} cannot be removed because it is the only preferred instance for service(s) {1} for database {2}"
//   *Cause: An attempt was made to remove the instance which is the only preferred instance for specified services.
//  *Action: Make sure that specified services have more than one preferred instance or modify services to not have the instance as a preferred instance.
/
1127, THE_ONLY_PREF_INSTANCE_FAILED, "Failed to verify if instance {0} is the only preferred instance for any service"
//   *Cause: An attempt to verify if the instance is the only preferred instance for any service failed.
//  *Action: Make sure that the Oracle clusterware is up and running. Also, review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1128, REMOVE_SERVICES_FAILED, "Failed to remove all services configured for database {0}"
//   *Cause: An attempt to remove all services configured for database.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1129, START_NAMED_INST_FAILED, "Failed to start instance {0} for database {1}"
//   *Cause: An attempt to start an instance with the specified name failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1130, CONVERT_DB_FAILED, "Failed to convert administrator-managed database {0} into a policy-managed database to use server pool {1}"
//   *Cause: An attempt to convert the database from an administrator-managed configuration to a policy-managed configuration failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1131, STOP_DB_ON_NODES_FAILED, "Failed to stop database {0} and its services on nodes {1}"
// *Cause: Attempt to stop the database on  given nodes has failed.
// *Action: Ensure that user attempting to stop the database has execute privileges on the database resource. Also, review the accompanying error messages for details about failure to stop database. Retry after resolving those issues or contact Oracle Support Services.
/
1132, DB_START_WRONG_SERVICES, "Database {0} does not have defined services: {1}"
//   *Cause: An attempt to start or stop the indicated services on the given database failed.
//  *Action: Retry, ensuring that every service to be started or stopped is configured for the given database.
/
1133, DB_START_SERVICES_FAILED, "failed to start services {0} for database {1}"
//   *Cause: An attempt to start the indicated services for the indicated database failed because those services were not configured for that database.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1134, SERV_CHECK_NTWK_FAILED, "Failed to find any listener defined for network {0}"
//   *Cause: An attempt to find listener(s) defined for specified network failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1135, SERV_CHECK_BAD_NTWK, "There is no listener defined for network {0} to be used by service {1}"
//   *Cause: An attempt to create a service failed because provided network doesn't have listener to publish a service on that network.
//  *Action: Make sure that the provided network has a listener.
/
1136, GET_DB_TYPE_FAILED, "Failed to retrieve type of the database {0}"
//   *Cause: An attempt to query the type of database has failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1137, GET_OMTO_FAILED, "Failed to retrieve online relocation timeout for RAC One Node database {0}"
//   *Cause: An attempt to query the current online relocation timeout for RAC One Node database has failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1138, SET_OMTO_FAILED, "Failed to set online relocation timeout to {0} for RAC One Node database {1}"
//   *Cause: An attempt to update the online relocation timeout for RAC One Node Database has failed.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1139, CUR_SERVER_NOT_IN_CLIST, "The current server {0} where RAC One Node database {1} is running is not in the given candidate server list {2}"
//   *Cause: An attempt to update the candidate servers of the server pool hosting RAC One Node Database has failed because current server where this database is running is not in the given candidate server list.
//  *Action: Retry the operation after either including the current server where this database is running in the given candidate server list or stopping the database.
/
1140, SET_SERVERS_FAILED, "Failed to update candidate servers to {0} of the server pool hosting RAC One Node database {1}"
//   *Cause: An attempt to update the candidate servers of the server pool hosting RAC One Node Database has failed. 
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1141, DB_NOT_HOSTED_BY_SP, "The database {0} is not hosted by a server pool"
//  *Cause: An attempt to query the server pool for given database failed because this database is not hosted by a server pool. This is most likely due to a program calling cluster environment API in Oracle Restart environment.
// *Action: Examine the accompanying error messages for details and contact Oracle Support Services.
/
1142, INVALID_TAF_POLICY_FOR_RACONE, "The {0} TAF policy is not valid for RAC One Node service {1}"
//   *Cause: A TAF policy other than BASIC or NONE was specified for RAC One Node service.
//  *Action: Specify BASIC or NONE TAF policy and retry the operation.
/
1143, INVALID_CARD_FOR_RACONE, "The cardinality of {0} is not valid for RAC One Node database or service {1}"
//   *Cause: An invalid cardinality was specified for RAC One Node database or service.
//  *Action: Specify a SINGLETON cardinality and retry the operation.
/
1144, INVALID_MGMT_POLICY_FOR_RACONE, "The {0} management policy is not valid for RAC One Node database {1}"
//   *Cause: A management policy other than AUTOMATIC was specified for RAC One Node database.
//  *Action: Specify AUTOMATIC management policy and retry the operation.
/
1145, API_NOT_SUPPORTED_RACONE, "{0} API is not supported on RAC One Node database environment"
//  *Cause: Internal error.
// *Action: Contact Oracle Support Services.
/
1146, DB_NOT_RACONE, "Database {0} is not a RAC One Node database"
//  *Cause: The specified database is not a RAC One Node database.
// *Action: Provide database name for a RAC One Node database.
/
1147, ADMIN_DBSP_NO_CANDIDATE_SERVERS, "The server pool {0} of administrator-managed database {1} has no candidate servers"
//   *Cause:  Either the instance had not been added to the database or this database's server pool was altered inapproprately.
//  *Action: If an instance was not added to the database yet, try to add an instance to this database, for example by using the command 'srvctl add instance', and then retry. Otherwise, contact Oracle Support Services.
/
1148, RACONE_TO_RAC_CONVERT_DB_FAILED, "Failed to convert the configuration of RAC One Node database {0} into its equivalent configuration for RAC database"
//   *Cause:  Internal error.
//  *Action: Review the accompanying error messages and contact Oracle Support Services.
/
1149, DB_SERV_MGMT_POLICY_ERR, "AUTOMATIC management policy cannot be used for the service {0} when the database {1} is not AUTOMATIC"
//   *Cause: An attempt to create/modify a service failed because the management policy specified for the service is AUTOMATIC but the database's management policy is not AUTOMATIC.
//  *Action: Make sure that the provided service's management policy is MANUAL or NORESTART when running 'srvctl add service' or 'srvctl modify service' command.
/
1150, GET_SERVICE_EDITION_FAILED, "Failed to retrieve EDITION for service {0}"
//  *Cause: An attempt to retrieve the EDITION attribute of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1151, RACONE_TO_RAC_CONVERT_DB_FAILED_NOTUP_TGT, "Failed to convert the configuration of RAC One Node database {0} into its equivalent RAC database configuration because RAC One Node database is running on a different server {1} than the given target server {2}"
//   *Cause: A target server was specified that was different from the server where the RAC One Node database is running.

//  *Action: Either supply the server where RAC One Node Database is running now as target server or stop the database and retry.
/
1152, SET_INSTNAME_FAILED, "Failed to update instance name {0} for database {1}"
//  *Cause: An attempt to update instance name for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1153, RAC2RAC1_CONVERT_DB_FAILED, "Failed to convert the configuration of cluster database {0} into its equivalent RAC One Node database configuration"
//   *Cause: An attempt to convert the specified cluster database to RAC One Node database failed.
//  *Action: Review the accompanying error messages and retry after resolving these errors or contact Oracle Support Services.
/
1154, RAC2RAC1_CONVERT_DB_FAILED_GT1_UP, "Failed to convert the configuration of cluster database {0} into its equivalent RAC One Node database configuration because cluster database is running on more than one server {1}"
//   *Cause: User attempted conversion of a cluster database to RAC One Node database that was running on more than one servers.
//  *Action: Stop this database on all but one server and retry.
/
/ 1155 Unused
1155, RAC2RAC1_CONVERT_DB_FAILED_GT1_POOLS, ""
//  *Document: NO
//   *Cause: 
//  *Action: 
/
1156, RAC2RAC1_CONVERT_DB_FAILED_TAF_PRE, "Failed to convert the configuration of cluster database {0} into its equivalent configuration for RAC One Node database due to its services {1} having {2} TAF policy"
//   *Cause: This database had services that have TAF policy (e.g. PRECONNECT) that is not supported by an Oracle RAC One Node database.
//  *Action: Either modify the TAF policy of these services to either BASIC or NONE using the command 'srvctl modify service' or remove these services using the command 'srvctl remove service' and then retry.
/
1157, RAC2RAC1_CONVERT_DB_FAILED_MANUAL_MGMT, "Failed to convert the configuration of cluster database {0} into its equivalent configuration for RAC One Node database because none of its services have {1} management policy"
//   *Cause: An attempt to convert a cluster database configuration into its equivalent configuration for an Oracle RAC One Node database was rejected because all services of the given database have the MANUAL management policy.
//  *Action: Modify the management policy of at least one of these services to AUTOMATIC using the command 'srvctl modify service ... -policy AUTOMATIC' and then retry.
/
1158, INVALID_DBTYPE, "Invalid database type {0}"
//  *Cause: The database type supplied is not valid.
// *Action: Supply a valid database type.
/
1159, OMOTION_ADMIN_FAILED_NO_NODE, "Target node must be specified when initiating an online relocation of administrator managed RAC One Node database {0}"
//  *Cause: The target node was not specified when requesting online relocation on the administrator managed Oracle RAC One Node database.
// *Action: Include the '-node' option with the 'srvctl relocate database' command.
/
1160, OMOTION_DB_NOT_RUNNING, "Online relocation request for RAC One Node database {0} was rejected because this database is not running"
//  *Cause: An Oracle RAC One Node database was not running.
// *Action: Start the database by issuing the command 'srvctl start database' and then retry.
/
1161, OMOTION_FAILURE, "Online relocation failed for RAC One Node database {0}"
//  *Cause: Online relocation of the given database was unsuccessful.
// *Action: Either run the command 'srvctl relocate database -a' to abort the online relocation or run the command 'srvctl relocate database -n' to perform online relocation of the database to the given target node.
/
1162, INVALID_OMOTION_STATUS, "Invalid online relocation status {0}"
//  *Cause: This is an internal error.
// *Action: Review the accompanying error messages and contact Oracle Support Services.
/
1163, DB_MODIFY_FAILED, "Failed to modify database {0}"
//  *Cause: Failed to modify database.
// *Action: Make sure that the CRS stack is up and running and then retry.
/
1164, OMOTION_ALREADY_ACTIVE, "An online relocation request for RAC One Node database {0} is already active"
//  *Cause: The given database has an already active online relocation request.
// *Action: Either specify another database in the 'srvctl relocate database' command or abort the in-progress request with 'srvctl relocate database -a' command.
/
1165, OMOTION_ALREADY_FAILED, "An online relocation request for RAC One Node database {0} has failed"
//  *Cause: An online relocation request for the database has failed and the supplied target node was not the same as that in the failed request.
// *Action: Use the command 'srvctl status database' to query the target node of the failed online relocation request. Either run the command 'srvctl relocate database -a' to abort the failed request or 'srvctl relocate database -n' command with with the correct target node.
/
1166, OMOTION_POLICY_NO_FREE, "The supplied node {0} is not available in the {1} server pool"
//  *Cause: Supplied node was not in the Free server pool.
// *Action: Supply node from the Free server pool.
/
1167, OMOTION_DB_VERBOSE1A, "Relocate target node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1168, OMOTION_DB_VERBOSE1B, "Added target node {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1169, OMOTION_DB_VERBOSE2, "Configuration updated to two instances"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1170, OMOTION_DB_VERBOSE3, "Instance {0} started"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1171, OMOTION_DB_VERBOSE4, "Services relocated"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1172, OMOTION_DB_VERBOSE5, "Waiting for up to {0} minutes for instance {1} to stop ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1173, OMOTION_DB_VERBOSE6, "Instance {0} stopped"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1174, OMOTION_DB_VERBOSE7, "Configuration updated to one instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1175, OMOTION_STATUS_FAILED, "Failed to determine the status of the online relocation request for RAC One Node database {0}"
//  *Cause: Unable to determine the status of the online relocation request for the given Oracle RAC One Node database.
// *Action: Examine the accompanying error messages for details.
/
1176, INVALID_OMOTION_STATE, "Invalid online relocation state {0}"
//  *Cause: This is an internal error.
// *Action: Review the accompanying error messages and contact Oracle Support Services.
/
1177, OMOTION_ABORT_FAILURE, "Failed to abort the online relocation request for RAC One Node database {0}"
//  *Cause: Failed to abort the online relocation of the Oracle RAC One Node database.
//  *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1178, FAILED_OMOTION_NOT_EXIST, "A failed online relocation request for RAC One Node database {0} does not exist"
//  *Cause: The supplied Oracle RAC One Node database does not have a failed online relocation request.
// *Action: Supply an Oracle RAC One Node database that has a failed online relocation request.
/
1179, INVALID_OMOTION_TIMEOUT, "The online relocation timeout value {0} is not within the range of between {1} and {2}"
//  *Cause: The specified online relocation timeout value was not within the required range.
// *Action: Supply a value within the required range.
/
1180, DATABASE_UPGRADED, "Configuration of database {0} has already been upgraded to version {1}"
//  *Cause: The supplied database was already upgraded.
// *Action: Supply a database of a lower version.
/
1181, SERVICES_UPGRADE_FAILED, "Failed to upgrade configuration of services {0} to version {1}"
//  *Cause: Failed to upgrade the service configuration.
// *Action: Review the accompanying error messages. If you are unable to resolve the problem, contact Oracle Support Services.
/
1182, DATABASE_UPGRADE_FAILED, "Failed to upgrade configuration of database {0} to version {1}"
//  *Cause: Failed to upgrade the database configuration.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1183, SERVICE_TYPE_UPGRADE_FAILED, "Failed to upgrade configuration of service type to version {0}"
//  *Cause: Failed to upgrade the service type configuration.
// *Action: Review the accompanying error messages and contact Oracle Support Services.
/
1184, DATABASE_TYPE_UPGRADE_FAILED, "Failed to upgrade configuration of database type to version {0}"
//  *Cause: Failed to upgrade the database type configuration.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1185, GET_HA_SERVICE_FAILED, "Failed to retrieve service resource {0} for non cluster database {1}"
//  *Cause: An attempt to get the specified service failed because the database provided is a single instance and not a cluster database.
// *Action: Make sure that Oracle Clusterware is configured, specify a service defined for cluster database, and then retry.
/
1186,  PRECONNECT_4_SIDB, "TAF policy 'PRECONNECT' cannot be used to add a service for single instance database {0}"
//  *Cause: Failed to create a service because provided TAF specification can not be used with a single instance database.
// *Action: Retry after removing 'PRECONNECT' TAF policy.
/
1187, SERV_ENABLE_DISABLE_SIDB, "Failed to enable or disable service {0} on particular nodes for non-cluster single instance database {1}"
//  *Cause: An attempt to enable or disable the service on particular nodes for single instance database failed. Such enable or disable operations are not applicable to services defined for single instance databases in Oracle Restart.
// *Action: Specify a service defined for database which is running on cluster or do not specify nodes.
/
1188, CRITICAL_INST_CHK_FAILED, "Failed to detect whether the standby database {0} supports the Data Guard protection mode"
//  *Cause: An attempt has failed to determine whether the standby database supports the configured Data Guard protection mode.
// *Action: Review the accompanying error messages for details about the failure and retry the command after resolving those issues.
/
1189, CANNOT_MOD_SP_OF_RACONE_SVC, "Cannot update server pool to {0} for RAC One Node database service {1}"
//  *Cause: An attempt to update the server pool of an Oracle RAC One Node database service was rejected because placement of this service is controlled by the server pool hosting the underlying database.
// *Action: Try updating the server pool controlling the placement of the database via 'srvctl modify database' command or its equivalent.
/
1190, CANNOT_MOD_SP_OF_SI_SVC, "Cannot update server pool to {0} for single instance database service {1}"
//  *Cause: An attempt to update the server pool of a single instance (non-RAC) database service was rejected because placement of this service is controlled by the server pool hosting the underlying database.
// *Action: Try updating the server pool controlling the placement of the database using the 'srvctl modify database' command or its equivalent.
/
1191, CANNOT_USE_SUBPOOL_FOR_MOD_SVC, "Cannot update server pool to {0} for database service {1}"
//  *Cause: An attempt to update server pool of database service was rejected because a subpool server pool was specified.
// *Action: Supply a first-level server pool that is not a subpool of any other server pool and retry the operation.
/
1192, INVALID_CARD_FOR_SI_SVC, "The cardinality {0} is not valid for single instance database service {1}"
//   *Cause: An invalid cardinality was specified for single instance (non-RAC) database.
//  *Action: Retry after specifying a SINGLETON cardinality in 'srvctl modify service' command or its equivalent.
/
1193, RACONE_SERVICE_START_NODES, "Service {0} defined for RAC One Node database {1} cannot be started on more than one node"
//  *Cause: An attempt to start the specified service failed because RAC One Node service cannot be started on more than one node.
//  *Action: Retry after specifying one node to start the service on.
/
1194, GET_DBVERSION_FAILED, "Failed to retrieve the version of database {0}"
//  *Cause: An attempt to retrieve the VERSION resource attribute has failed.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1195, ABORT_OMOTION_BAD_POLICY_OPT, "Option to remove the target node was not allowed for aborting online relocation of policy-managed RAC One Node database {0}"
//  *Cause: The '-revert' option was specified on a request to abort online relocation of the policy-managed Oracle RAC One Node database.
// *Action: Use the command 'srvctl relocate database -abort' without the '-revert' option.
/
1196,  TAF_PRECONNECT_4_POLICY_DB, "'PRECONNECT' TAF policy cannot be used to create service {0} on policy managed database {1}"
//  *Cause: Failed to create a service because a policy managed database cannot have service with PRECONNECT TAF policy.
// *Action: Retry after supplying 'BASIC' or 'NONE' TAF policy.
/
1197, SERVICE_DB_ADMIN_MGD_CONFIG, "The database {0} is policy-managed and an administrator-managed service {1} cannot be created on it"
//  *Cause: The specified database does not support administrator-managed services.
// *Action: Provide a database which supports administrator-managed services.
/
1198, FAILED_ADD_SVC_MAX_LIMIT, "Failed to add service {0} to database {1} because database is already at maximum services limit of {2}"
//  *Cause: Attempt to add a new service to database was rejected because database has already reached the maximum services limit.
// *Action: Retry after removing a service from this database using the command 'srvctl remove service', or contact Oracle Support Services.
/
1199, CRITICAL_INST_STOP_REJECTED, "The stop request on instance {0} of standby database {1} was rejected to prevent termination of the primary database"
// *Cause: The attempt to stop this instance of the standby database was rejected because the configured Data Guard protection mode required this instance to be running to prevent termination of the primary database.
// *Action: Retry the stop request after stopping the primary database or downgrading the protection mode.
/
1200, DATABASE_DOWNGRADED, "Configuration of database {0} has already been downgraded to version {1} for database {2}"
//  *Cause: The supplied database was already downgraded.
// *Action: Supply a database of a higher version.
/
1201, UNSUPPORTED_VERSION_FOR_DB_DOWNGRADE, "Downgrade from current version {0} to version {1} is not supported for database {2}"
//  *Cause: An unsupported version was specified for downgrading the database.
// *Action: Check that the versions provided are correct. 
/
1202, SERVICES_DOWNGRADE_FAILED, "Failed to downgrade configuration of services {0} to version {1}"
//  *Cause: A request to downgrade the service configuration failed.
// *Action: Review the accompanying error messages. If you are unable to resolve the problem, contact Oracle Support Services.
/
1203, DATABASE_DOWNGRADE_FAILED, "Failed to downgrade configuration of database {0} to version {1}"
//  *Cause: A request to downgrade the database configuration failed.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1204, CANNOT_UPDATE_ADMINSP_OF_ADMIN_DB, "Failed to update administrator-managed database {0} to use server pool {1}"
//  *Cause: Attempt to update administrator-managed database was rejected because administrator-managed database cannot be moved to another subpool.
// *Action: Retry after supplying a first-level server pool in 'srvctl modify database' command to convert administrator-managed database to policy-managed database.
/
1205, CANNOT_UPDATE_POOLS_OF_DB_WITH_SVCS, "Failed to update policy-managed database {0} to use server pools {1} because it excludes the server pools {2} of the service {3}"
//  *Cause: An attempt to update policy-managed database was rejected because specified server pools do not include all server pools hosting services of this database.
// *Action: Include all server pools hosting services of this database in the supplied server pool list.
/
1206, GET_PREFINST_OF_RACONE_SVC, "Failed to retrieve preferred instance of service {0} of RAC One Node database {1}"
//  *Cause: Attempt to retrieve preferred instance of service belonging to RAC One Node database failed because database is either in failed online relocation state or undergoing online relocation.
// *Action: Check the status of online relocation via 'srvctl status database' command. If online relocation status is reported as active, then retry after online relocation completes. If online relocation status is reported as failed, then repair the configuration via 'srvctl relocate database ... -a' command and then retry.
/
1207, SERV_BAD_STARTOPT, "The start options {2} can not be used while starting service {0} and its database {1}"
//  *Cause: An attempt to start the service  was rejected because the specified start options can not be used with service when the databse is not running.
// *Action: Remove the specified start options and then retry.
/
1208, SERV_BAD_STARTOPT2, "The start options {1} can not be used while starting services for database {0}"
//  *Cause: An attempt to start the services  was rejected because the specified start options can not be used with services when the databse is not running.
// *Action: Remove the specified start options and then retry.
/
1209, OMO_NOT_ENOUGH_SERVER_POLICY, "RAC One Node database {0} does not have enough servers in its server pool {1} to initiate an online relocation"
//  *Cause: Online relocation request was rejected because there were less than two servers in the server pool of the specified RAC One Node database.
// *Action: Make sure that the minimum and maximum size of the server pool are set properly.
/
1210, ERR_DB_DEFAULT_SVC, "The service name {0} cannot be same as the database default service name {1}"
//  *Cause: An attempt to create the service was rejected because the given service name is same as the database default service name.
// *Action: Retry after supplying a service name that is different than the database default service name.
/
1211, START_FAILED_OMOTION_FAILED, "Cannot start RAC One Node database {0} because a failure has occurred while trying to clean up an earlier failed online relocation"
//  *Cause: An attempt to start an Oracle RAC One Node database was rejected because a failure occurred while trying to clean up an earlier failed online relocation.
// *Action: Use the command 'srvctl status database' to query the target node of the failed online relocation process. Either run the command 'srvctl relocate database' with the '-abort' option or with the '-node' option with the target node thus discovered.
/
1212, INSTANCE_WITH_SAME_NAME_ALREADY_EXISTS, "An instance with name \"{0}\" already exists on node {1}"
//  *Cause: An instance could not be added to the database on the specified node because an instance with the same name was found on another node. 
// *Action: Use the command 'srvctl modify instance' to change the name of the existing instance, or use a different instance name in the 'srvctl add instance -instance <inst_name>' command.
/
1213, REMOVE_RUNNING_RACONE_SVC, "Service {0} of database {1} is still running"
//  *Cause: An attempt to remove RAC One Node service failed because the given service was still running.
// *Action: Stop the service and then retry the command.
/
1214, RAC2RAC1_CONVERT_ADMIN_NOT_ONE_INST, "Administrator-managed RAC database {0} has more than one instance"
//  *Cause: An attempt to convert an Oracle RAC database to an Oracle RAC One Node database failed because there was more than one instance.
// *Action: Use the command 'srvctl remove instance' to remove all but one instance and then run the 'srvctl convert database -dbtype RACONENODE' command.
/
1215, DOWNGRADE_RACONE_FAILED, "Unable to downgrade RAC One Node database {0}"
//  *Cause: Failed to downgrade RAC One Node database to an earlier version because there was no RAC One Node specific configuration in the earlier version.
// *Action: None.
/
1216, OMOTION_DB_ROLLBACK_VERBOSE, "Online relocation failed, rolling back to original state"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1217, OMOTION_DB_ROLLBACK_VERBOSE1, "Source instance {0} restarted"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1218, OMOTION_DB_ROLLBACK_VERBOSE2, "Services relocated back to source instance {0}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1219, OMOTION_DB_ROLLBACK_VERBOSE3, "Target instance {0} stopped"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1220, OMOTION_DB_ROLLBACK_VERBOSE4, "Configuration reverted back to one instance"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1221, OMOTION_DB_ROLLBACK_VERBOSE5, "Target node {0} removed from candidate servers list"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1222, OMOTION_FAILURE_ROLLBACK_SUCCESSFUL, "Online relocation of database \"{0}\" failed but database was restored to its original state"
//  *Cause: Online relocation of the given database was unsuccessful, therefore the database was restored to its original state.
// *Action: See accompanying messages for online relocation failure.
/
1223, INVALID_SVC_NAME, "The service name {0} contains illegal characters {1}."
//  *Cause: An attempt to create the service was rejected because the given service name contained illegal characters.
// *Action: Retry after supplying a service name that contains the following: 
//          - uppercase or lowercase letter as the first character and the 
//            remainder includes characters only from the character 
//            set {a-z, A-Z, 0-9, _, -}.
//          - domain name (if provided) only includes characters from the character 
//            set {a-z, A-Z, 0-9, _, $, #, -}.
/
1224, INVALID_MGMT_POLICY_FOR_RACONE_SVC, "The {0} management policy is not valid for RAC One Node database service {1}"
//   *Cause: A management policy other than AUTOMATIC was specified for RAC One Node database service.
//  *Action: Either specify AUTOMATIC management policy for this service or modify management policy of another service of this database to AUTOMATIC, such as via 'srvctl modify service' command, and then retry the current operation.
/
1225, LAST_AUTOMATIC_MGMT_POLICY_RACONE_SVC, "An attempt to remove service {0} of database {1} was rejected because this is the last service with {2} management policy. A RAC One Node database must have at least one service with {2} management policy."
//  *Cause: An attempt was made to remove the last service of an Oracle RAC One Node database having the AUTOMATIC management policy. 
// *Action: Add another service with the AUTOMATIC management policy, for example by using the command 'srvctl add service ... -policy AUTOMATIC' or modify the management policy of an existing service to AUTOMATIC using the command 'srvctl modify service', before removing the given service.
/
1226, GET_ACFS_RES_FAILED, "Failed to retrieve ASM Cluster Filesystem resource {0} for database {1}."
//  *Cause: The ASM Cluster Filesystem resource was not registered in Oracle Clusterware.
// *Action: Create the ASM Cluster Filesystem resource using the command 'srvctl add filesystem' and then retry.
/
1227, GET_ACFS_FAILED, "Failed to retrieve ASM Cluster Filesystem list for database {0}."
//  *Cause: Failed to retrieve the ASM Cluster Filesystems of the specified database.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1228, RAC2RAC1_CONVERT_ADMIN_NO_INST, "Failed to convert administrator-managed RAC database {0} to RAC One Node database because the database had no instance added"
//  *Cause: An attempt to convert an Oracle RAC database to an Oracle RAC One Node database was rejected because the database did not have an instance added.
// *Action: Use the command 'srvctl add instance' to add an instance and then run the command 'srvctl convert database -dbtype RACONENODE'.
/
1229, VERSION_MISMATCH, "An attempt to access configuration of database {0} was rejected because its version {1} differs from the program version {2}. Instead run the program from {3}."
//  *Cause: An attempt was made to access configuration of database that is of different version than that of the program.
// *Action: Make sure that database configuration version and the program version are same and then retry. For example, try the operation using srvctl from the ORACLE_HOME mentioned in the error message.
/
1230, UPDATE_DBSP_FAILED, "Failed to modify database {0} to use server pool {1}"
//   *Cause: An attempt to modify the database to use the given server pool has failed.
//  *Action: Review the accompanying error messages for details about the failure. 
// For example, a failure could happen if the database owner does not have execute 
// permissions on the given server pool. In this case, use the command 
// 'srvctl config database -db <db_unique_name>' to find out the database owner's
// user name, create a server pool as that user, and then supply that server pool as an
// argument when retrying the command.
/
1231, UPGRADE_DATABASE_FAILED, "Failed to upgrade configuration of database {0} to version {1} in new Oracle home {2}"
//  *Cause: Failed to upgrade the database configuration.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1232, UNSUPPORTED_UPGRADE_VERSION, "Failed to upgrade configuration of database {0} because database version {1} is an unsupported version for upgrade"
//  *Cause: Version of the database was not supported for upgrade.
// *Action: None.
/
1233, DOWNGRADE_DATABASE_FAILED, "Failed to downgrade configuration of database {0} to version {1} in new Oracle home {2}"
//  *Cause: Failed to downgrade the database configuration.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1234, UNSUPPORTED_DOWNGRADE_VERSION, "Failed to downgrade configuration of database {0} to version {1} because the specified version is unsupported for downgrade"
//  *Cause: Specified version was not supported for downgrade.
// *Action: Specify a version that is 10.1 or later.
/
1235, UNSUPPORTED_DOWNGRADE_SIDB, "Unable to downgrade configuration of single instance database {0} to version {1}"
//  *Cause: Single instance database was specified.
// *Action: Remove the single instance database configuration. 11.2 Clusterware cannot manage pre-11.2 single instance databases.
/
1236, UNSUPPORTED_DOWNGRADE_RAC1, "Unable to downgrade configuration of RAC One Node database {0} to version {1}"
//  *Cause: An Oracle RAC One Node database was specified.
// *Action: Convert the administrator-managed Oracle RAC One Node database to an administrator-managed Oracle RAC database using the command 'srvctl convert database' and then retry.
/
1237, UNSUPPORTED_DOWNGRADE_POLICYDB, "Unable to downgrade configuration of policy-managed RAC database {0} to version {1}"
//  *Cause: A policy-managed Oracle RAC database was specified.
// *Action: Remove the 11.2 database configuration and use pre-11.2 srvctl to re-create the configuration.
/
1238, GET_DB_ARGS_FAILED, "Failed to get attributes for database {0}"
//  *Cause: Failed to get attributes for the database.
// *Action: Make sure that the CRS stack is up and running and then retry.
/
1239, UNSUPPORTED_DOWNGRADE_ACFS, "Failed to downgrade configuration of database {0} to version {1} because the database has dependency on ASM Cluster File System"
//  *Cause: Specified database was dependent on ASM Cluster File System.
// *Action: None.
/
1240, UNSUPPORTED_DOWNGRADE_DBROLE, "Unable to downgrade configuration of database {0} because its database role of {1} is not supported in version {2}"
//  *Cause: Database role of specified database was not supported in the specified version.
// *Action: Modify the database role using the 'srvctl modify database' command and then retry this command.
/
1241, UPGRADE_DB_REM_SG_FAILED, "Failed to upgrade configuration of database {0} to version {1} in new Oracle home {2}. Also failed to remove the internal server pool configuration."
//  *Cause: Failed to upgrade the database configuration.
// *Action: Review the accompanying error messages for details about failure. Retry after resolving those issues.
/
1242, RAC2RAC1_CONVERT_NO_SERVICE, "Unable to convert RAC database {0} to RAC One Node database because the database had no service added"
//  *Cause: An attempt to convert an Oracle RAC database to an Oracle RAC One Node database was rejected because the database did not have any service configured. An Oracle RAC One Node database must always have one service.
// *Action: Use the command 'srvctl add service' to add a service and then run 'srvctl convert database -dbtype RACONENODE'.
/
1243, UP_INSTANCE_WITH_SAME_NAME_ALREADY_EXISTS, "Failed to start instance {0} of database {1} because an instance having same name was already running on node {2}"
//  *Cause: An attempt to start an instance with the given name was rejected because another instance with same name was already running on another node.
// *Action: Either supply a different instance name or stop the running instance with the same name and then retry.
/
1244, RACONE_SERVICE_START_ON_NODE, "Failed to start service {0} of RAC One Node database {1} on the given node {2} because the database was running on node {3}"
//  *Cause: An attempt to start the specified service on the given node was rejected because RAC One Node database is running on a node different than the given node.
//  *Action: Either omit the node option or supply the node where the database is running.
/
1245, SRVM_DB_VERSION_MISMATCH, "" 
// *Document: No
// This message is no longer used, replaced by SRVM_GEN_VERSION_MISMATCH.
//  *Cause:
//  *Action:
/
1246, OMTO_CINST_REJECTED, "Online relocation of RAC One Node Data Guard standby database \"{0}\" was rejected because the database is in Data Guard maximum protection mode"
//  *Cause: An online relocation request was rejected because the specified database is operating in Data Guard maximum protection mode.
// *Action: Downgrade the protection mode to maximum availability and retry the online relocation.
/
1247, GET_PLUGGABLE_DATABASE_FAILED, "Failed to retrieve pluggable database for service {0}"
//  *Cause: An attempt to retrieve the pluggable database attribute of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1248, GET_MAX_LAG_TIME_FAILED, "Failed to retrieve the maximum value of replication lag available for the service {0}"
//  *Cause: An attempt to retrieve the maximum value of replication lag for the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1249, IS_SVC_GLOBAL_FAILED, "Failed to determine whether the service {0} is global or not"
//  *Cause: Failed to check whether the specified service is global or not.
// *Action: Examine the accompanying error messages for details.
/
1250, GLOBAL_MODIFY_ATTRIBUTES_NOT_ALLOWED, "Modification of the global service attribute {0} not allowed"
//  *Cause: An attempt was made to change a global service attribute managed by Global Data Services for just one database.
// *Action: The attribute must be changed for all databases at the same time through GDS's 'GDSCTL' command (or specify '-global_override').
/
1251, GLOBAL_REMOVE_NOT_ALLOWED, "The specified operation on global service {0} is not allowed"
//  *Cause: An attempt was rejected to operate on a global service managed by Global Data Services for just one database.
// *Action: Operate on the service using Global Data Services' 'GDSCTL' command, or specify '-global_override'.
/
1252, GET_PWFILE_FAILED, "Failed to retrieve the password file location of database {0}"
//  *Cause: An attempt to retrieve the password file attribute of the specified database failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the database resource has been configured, and the user has read permission on the database resource.
/
1253, SET_PWFILE_FAILED, "Failed to update password file location {0} of database {1}"
//  *Cause: An attempt to update the password file attribute of the specified database failed.
// *Action: Retry the request after ensuring that the CRS stack is running, the database resource has been configured, and the user has update permission on the database resource.
/
1254, PWFILE_NOT_EXIST, "Password file attribute does not exist for database {0}"
//  *Cause: An attempt to retrieve the PWFILE resource attribute failed.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1255, GET_SQL_TRANSLATION_PROFILE_FAILED, "Failed to retrieve SQL translation profile for service {0}"
//  *Cause: An attempt to retrieve the translation profile attribute of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1256, GET_COMMIT_OUTCOME_FAILED, "Failed to retrieve commit outcome for service {0}"
//  *Cause: An attempt to retrieve the commit outcome attribute of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1257, INVALID_SESSION_STATE, "Invalid session state consistency {0}"
// *Cause: The session state consistency supplied is not valid.
// *Action: Supply a valid session state consistency either STATIC or DYNAMIC.
/
1258, ADD_MODIFY_RETENTION_NOT_ALLOWED, "Addition or modification of retention is not allowed when commit outcome is set to FALSE"
//  *Cause: An attempt to add or modify retention value was rejected because the commit outcome is not set to TRUE.
// *Action: Set the option '-commit_outcome' to TRUE and then modify the retention value.
/
1259, ADD_MODIFY_FAILOVER_TYPE_NOT_ALLOWED, "Addition or modification of failover type to TRANSACTION is not allowed when commit outcome is set to FALSE"
//  *Cause: An attempt to add or modify failover type value to TRANSACTION was rejected because the commit outcome is not set to TRUE.
// *Action: Set the option '-commit_outcome' to TRUE and then modify the failover type value.
/
1260, GET_FAILOVER_TYPE_FAILED, "Failed to retrieve failover type for service {0}"
//  *Cause: An attempt to retrieve the failover type attribute of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1261, FAILOVER_TYPE_NOT_TRANS_REPLAY, "Failed to add or modify replay initiation time because the failover type is not set to TRANSACTION"
//  *Cause: An attempt to modify the replay initiation time attribute of the specified service failed.
// *Action: Set the failovertype to TRANSACTION and retry the command.
/
1262, FAILOVER_TYPE_NOT_TRANS_SESSION_STATE, "failed to add or modify session state consistency because the -failovertype option is not specified as TRANSACTION"
// *Cause: An attempt to modify the session state consistency attribute of the specified service was rejected because the -failovertype option was not specified as TRANSACTION.
// *Action: Retry the command, specifying the TRANSACTION value for the -failovertype option.
/
1263, INVALID_RETENTION_VALUE, "Invalid retention time {0} seconds greater than the maximum {1} seconds"
//  *Cause: The specified value exceeds the maximum permissible retention time.
// *Action: Supply a valid retention time value less than 2592000.
/
1264, INVALID_REPLAY_INITIATION_TIME, "Invalid replay initiation time {0} seconds greater than the maximum {1} seconds"
//  *Cause: The specified value exceeds the maximum permissible replay initiation time.
// *Action: Supply a valid replay initiation time value less than 86400.
/
1265, GET_PQ_SERVICE_FAILED, "Failed to retrieve parallel query helper service for service {0}"
//  *Cause: An attempt to retrieve the parallel query helper service of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1266, SET_PQ_SERVICE_FAILED, "Failed to set parallel query helper service {0} for service {1}"
//  *Cause: An attempt to set the parallel query helper service for the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1267, GET_PQ_SERVER_POOLS_FAILED, "Failed to retrieve the server pools of the parallel query helper service for service {0}"
//  *Cause: An attempt to retrieve the server pools of the parallel query helper service of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1268, SET_PQ_SERVER_POOLS_FAILED, "Failed to set parallel query helper service {0} for service {1}"
//  *Cause: An attempt to set the parallel query helper service for the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1269, SET_PQPOOLS_FAILED, "Failed to set parallel query helper service {0} for database {1}"
//  *Cause: An attempt to set the parallel query helper service for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1270, API_NOT_SUPPORTED_MGMTDB, "{0} API is not supported on management database environment"
//  *Cause: An internal error occurred. 
// *Action: Contact Oracle Support Services.
/
1271, UNSET_COMMIT_OUTCOME_FAILED, "Failed to unset commit outcome because the failover type is set to TRANSACTION"
//  *Cause: An attempt to unset the commit outcome attribute of the specified service failed.
// *Action: Modify the value of failovertype and retry the command.
/
1272, REMOVE_MGMTDB_FAILED, "Failed to remove the management database resource"
//  *Cause: An attempt to remove the management database failed.
// *Action: Examine the accompanying error messages for details.
/
1273, GET_SERVICE_TYPE_FAILED, "Failed to retrieve the service type for service {0}"
//  *Cause: An attempt to retrieve the service type of the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1274, SET_SERVICE_TYPE_FAILED, "Failed to set service type {0} for service {1}"
//  *Cause: An attempt to set the service type for the specified service failed.
// *Action: Examine the accompanying error messages for details.
/
1275, GET_PQPOOLS_FAILED, "Failed to retrieve the server pools of the parallel query helper service for database {0}"
//  *Cause: An attempt to retrieve the server pools of the parallel query helper service of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1276, NO_PQ_SERVICE, "Service {0} of database {1} does not have parallel query helper service"
//  *Cause: The specified service did not have parallel query helper service configured.
// *Action: None.
/
1277, GLOBAL_OPERATION_NOT_ALLOWED, "The specified operation on global service {0} is not allowed"
//  *Cause: An attempt was rejected to operate on a global service managed by Global Data Services for just one database.
// *Action: Operate on the service using Global Data Services' 'GDSCTL' command, or specify '-global_override'.
/
1278, ERR_PDB_DEFAULT_SVC, "The service name {0} cannot be same as the pluggable database default service name {1}"
//  *Cause: An attempt to create or modify the service was rejected because the given service name is same as the pluggable database default service name.
// *Action: Make sure that the service name is different from the pluggable database default service name and retry the command.
/
1279, AQHA_FALSE_FOTYPE_TRANS, "Dummy message line"
//  *Document: NO
//  *Cause: Message is not used.
// *Action: 
/
1280, INVALID_PDB_NAME, "The pluggable database name {0} contains invalid characters."
//  *Cause:  The supplied pluggable database name contained invalid characters.
// *Action:  Valid characters in a pluggable database name are a-z, A-Z, 0-9, $, #, and _ (underscore) and it should start with a letter.
/
1281, CLIENT_CLUSTER_NO_DEP_ON_DG, "The database {0} in an ASM Client Cluster cannot have dependency on diskgroup {1}"
//  *Cause: Diskgroups were supplied for creating a database in an ASM Client Cluster.
// *Action: Do not specify diskgroups when creating a database in an ASM Client  Cluster.
/
1282, ADMIN_MANAGED_DBINSTANCE_REQUIRE_HUB_NODE, "Cannot add instance {0} for database \"{1}\" because node {2} has active role {3}."
//  *Cause: An attempt to add an instance for a database specified a node with an active node role other than hub.
// *Action: Specify the node with hub active node role when adding the instance for database.
/
1283, INVALID_PWFILE, "Password file pathname {0} cannot contain only the diskgroup name"
//  *Cause: An attempt to add a password file resource attribute was rejected because the supplied pathname consisted only of a diskgroup name.
// *Action: Specify a valid password file path and retry the command.
/
1284, CREATE_STARTDEP_NOT_ACFS_FAILED, "Failed to create start dependency for database {0} on the ASM cluster file system because path {1} is not on an ASM cluster file system"
//  *Cause:  An attempt to create a start dependency for the database resource on the ASM cluster file system failed because the specified path was not on an ASM cluster file system.
// *Action:  Specify a path on an ASM cluster file system.
/
1285, NOREPLAY_NOT_ALLOWED, "Cannot disable session replay because session disconnect is not requested"
//  *Cause: An attempt to stop or relocate services was rejected because the session noreplay option was specified without the session disconnect option.
// *Action: Specify the '-force' option for session disconnect or omit the '-noreplay' option.
// For example: 'srvctl stop service -db hr -service hrl -force -noreplay'
/
1286, CREATE_MGMTDB_FAILED, "Failed to create the management database"
//  *Cause: An attempt to create the management database failed because the request was issued by the wrong user.
// *Action: Login in as the owner of the Oracle Home to issue the command 'srvctl add mgmtdb'.
/
1287, REMOVE_SERVICE_NOT_AUTHORIZED, "User is not authorized to remove service {0} for database {1}"
//  *Cause: An attempt to remove the specified service was rejected because the command was not issued by the Oracle home owner.
// *Action: Examine the accompanying error messages for details. Log in as the user of the Oracle home to issue the command.
/
1288, CREATE_SERVICE_NOT_AUTHORIZED, "User is not authorized to create service {0} for database {1}"
//  *Cause: An attempt to create the specified service failed because the command was not issued by the Oracle home owner.
// *Action: Examine the accompanying error messages for details. Log in as the user of the Oracle home to issue the command. 
/
1289, OMOTION_STOP_OPTION, "Invalid stop option {0} for the online relocation of database {1}"
//  *Cause: An attempt to relocate the specified database failed because an invalid stop option was specified. Only NORMAL shutdown of the running instance may be specified for relocation of an Oracle RAC One Node database.
// *Action: Specify NORMAL to override the default stop option for the running instance or issue the request without any stop option.
/
1290, OMOTION_STANDBY_NORMAL, "NORMAL shutdown is not allowed for physical standby databases"
//  *Cause: An attempt to relocate the specified database was rejected because an invalid stop option was specified. 
// *Action: Issue the request without any stop option.
/
1291, INVALID_SG_SIZE_FOR_SI_DB, "The specified server pool {0} has maximum size {1} greater than one, which is invalid for a single instance database {2}."
//  *Cause: An attempt to create a single instance database failed because a server pool with maximum size greater than one server was specified.
// *Action: Specify a different server pool with maximum size of one, or modify the specified server pool using the command 'srvctl modify srvpool' with '-max 1' option to have at most one server.
/
1292, NO_SERVER_FOR_SI_DB, "specified server pool {0} has no candidate server for single instance database {1}"
//  *Cause: An attempt to create a single instance database failed because the specified server pool had no configured candidate server.
// *Action: Specify a different server pool with a maximum of one server, or modify the specified server pool using the command 'srvctl modify srvpool' with '-servers' option to configure exactly one candidate server.
/
1293, TOO_MANY_SERVERS_FOR_SI_DB, "specified server pool {0} has more than one candidate server"
//  *Cause: An attempt to create a single instance database failed because a server pool with more than one candidate server was specified.
// *Action: Specify a different server pool with a maximum of one server, or modify the specified server pool using the command 'srvctl modify srvpool' with '-servers' option to configure exactly one candidate server.
/
1294, NON_GLOBAL_SERVICE, "Invalid option GSM flags for the specified non-global service {0}"
//  *Cause: An attempt to add or modify the specified option was rejected because an option that is only valid for global services was specified.
// *Action: Reissue the request without the invalid option.
/
1295, DOWNGRADE_DATABASE_TO_NEWER, "Cannot downgrade configuration of database {0} from version {1} to newer version {2}"
//  *Cause: An attempt was made to downgrade the database to a version newer than the current one.
// *Action: Specify a target version older than the current one.
/
1296, ORADRIVER_LOAD_ERROR, "An error occurred while loading Oracle JDBC driver"
//  *Cause: An attempt to load Oracle JDBC driver failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1297, GET_JDBC_CONNECTION_FAILED, "An error occurred while establishing connection to database with user name \"{0}\" and connect descriptor:\n{1}"
//  *Cause: An attempt to connect to database failed.
// *Action: Examine the accompanying error message for details.
/
1298, SRVM_GEN_VERSION_MISMATCH, "Version {0} of database or service resource is different from the srvctl version {1}"
//   *Cause: The version of srvctl used did not match the version of the database or service to be added or modified.
//   *Action: Run srvctl from the Oracle Home where the database or service is configured.
/
1299, DB_NOT_ADMIN_MANAGED, "Database {0} is policy-managed"
//  *Cause: An attempt to retrieve the configured nodes of an administrator-managed database failed because the database is policy-managed.
// *Action: Specify an administrator-managed database.
/
1300, GET_ADMIN_DB_NODES_FAILED, "Failed to retrieve nodes on which database {0} is configured"
//  *Cause: An attempt to retrieve the configured nodes of an administrator-managed database failed.
// *Action: Examine the accompanying error messages for details.
/
1301, ORACLE_USER_MISMATCH, "Current owner {0} of the database {1} is different from the owner {2} of the specified Oracle home {3}"
//  *Cause: An attempt to modify the Oracle home of the database failed because the owner of the Oracle home was not the current owner of the database. Changing to use an Oracle home with a different owner changes the ownership of the database.
// *Action: To modify the Oracle home of a database to a new home whose owner is not the current owner of this database, specify the new user also as a modification parameter.
/
1302, GET_SIDB_HOST_FAILED, "failed to retrieve the node hosting this single-instance database"
//  *Cause: An attempt to retrieve the HOSTING_MEMBERS resource attribute of the database failed. Details are provided by the accompanying messages.
// *Action: Examine the accompanying error messages for details and take the corrective action indicated.
/
1303, SIDB_GET_NODE_INVALID_TYPE, "cannot retrieve the node hosting a policy-managed, single-instance database"
//  *Cause: An attempt to retrieve the node hosting a single-instance database was rejected because the database is policy-managed.
// *Action: Specify an administrator-managed single-instance database or a fixed single-instance database.
/
1304, SIDB_FIXED_SET_SP_FAILED, "failed to set or modify the server pool for fixed single-instance database {0}"
//  *Cause: An attempt to set or modify the server pools for this database failed because it is a fixed single-instance database which is not hosted by a server pool.
// *Action: Provide a database which is not a fixed-single-instance database.
/
1305, MODIFY_ROLE_FARSYNC, "Modification of the database role from or to FAR_SYNC_STANDBY for database {0} is not allowed."
//  *Cause: An attempt to modify the database role of a database failed because a FAR_SYNC_STANDBY role can be specified only during the database creation.
// *Action: Reissue the request without attempting to modify the role of a database created with the role FAR_SYNC_STANDBY or attempting to change the current role to FAR_SYNC_STANDBY.
/
1306, NO_SERV_FARSYNC, "Services cannot be created for the far sync database {0}."
//  *Cause: An attempt to create a service for the database was rejected because the database role was FAR_SYNC_STANDBY.
// *Action: If the request was issued with the wrong database name, reissue with the correct database name.
/
1307, FARSYNC_CANNOT_OPEN, "Invalid start option OPEN specified for database {0} with the role FAR_SYNC_STANDBY."
//  *Cause: An attempt to add, modify or start the database with start option OPEN was rejected because its role was FAR_SYNC_STANDBY.
// *Action: Reissue the request with a different start option.
/
1308, FARSYNC_NO_RACONENODE, "Database {0} is not permitted to have the role FAR_SYNC_STANDBY in an Oracle RAC One Node configuration."
//  *Cause: An attempt to add or convert the database failed because a database with role FAR_SYNC_STANDBY cannot be used in an Oracle RAC One Node configuration.
// *Action: Reissue the request with a different database type or database role.
/
1309, FARSYNC_NO_PQPOOLS, "Database {0} cannot be configured on parallel query server pools {1}."
//  *Cause: An attempt to add or modify the database was rejected because a database with role FAR_SYNC_STANDBY cannot run on Leaf nodes.
// *Action: Reissue the request without specifying the parallel query server pools.
/
1310, UPDATE_START_MODE_FAILED, "Failed to update the open mode of database {0}."
//  *Cause: An attempt to modify the open mode of the database failed.
// *Action: Examine the accompanying error message for details.
/
1311, UPDATE_START_MODE_FAILED_DETAILS, "Failed to update the open mode of database {0}.\nDetails: \n{1}"
//  *Cause: An attempt to modify the open mode of the database failed.
// *Action: Examine the accompanying error message for details.
/
1312, ALREADY_IN_DESIRED_START_MODE, "The targeted database instance or instances are already running in the specified open mode.\nDetails: \n{0}"
//  *Cause: An attempt to update the open mode of the database was rejected because the targeted database instance or instances were already running as desired.
// *Action: Reissue the command with a different start option.
/
1313, INCOMPATIBLE_START_OPTION, "The specified start option is incompatible with the current running state of at least one database instance.\nDetails: \n{0}"
//  *Cause: An attempt to update the open mode of the database was rejected because it was not one of the following legal transitions:
//             - NOMOUNT to MOUNT, OPEN, or READONLY
//             - MOUNT to OPEN or READONLY
// *Action: Reissue the command with a different start option and only if the database's current mode is NOMOUNT or MOUNT.
/
1314, GET_DBS_FAILED, "failed to retrieve the list of databases configured on the cluster"
//  *Cause: An attempt to retrieve the list of databases configured on the cluster failed.
// *Action: Examine the accompanying error messages for details.
/
1315, STOP_DB_INST_FAILED, "failed to stop instances for database {0}"
// *Cause: An attempt to stop the database on the specified nodes has failed.
// *Action: Ensure that the user attempting to stop the database has execute privileges on the database resource. Also, review the accompanying error messages for details about failure to stop the database. Retry after resolving those issues.
/
1316, DB_STOP_SERVICES_FAILED, "failed to stop services {0} for database {1}"
//   *Cause: An attempt to stop the specified services for the indicated database failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1317, MODIFY_USER_NOT_WIN, "modification of user for database is not supported on Windows"
// *Cause: An attempt to modify the database failed because a new user was specified.
// *Action: Ensure that there is no attempt to modify the Oracle user of the database and reissue the request.
/
1318, DBUNIQUE_NAME_LENGTH_TOO_LARGE, "failed to create database {0} because the length of the database unique name is greater than 30 characters"
//   *Cause: The length of the database unique name was greater than 30 characters. 
//  *Action: Ensure that the length of the database name supplied is less than or equal to 30 characters, and retry the command.
/
1319, MOVE_DBS_FAILED, "failed to move databases from Oracle home {0} to new Oracle home {1}"
// *Cause: An attempt to move databases between the specified Oracle homes has failed.
// *Action: Examine the accompanying error messages for details.
/
1320, MOVE_DB_FAILED, "failed to move database {0} to new Oracle home {1}"
// *Cause: An attempt to move the database to a new Oracle home has failed.
// *Action: Examine the accompanying error messages for details.
/
1321, HOMES_VERSION_MISMATCH, "Version {0} of Oracle home {1} is different from version {2} of Oracle home {3}."
// *Cause: An attempt to change the Oracle home of a database failed because the version of the new Oracle home is different from the version of the current Oracle home.
// *Action: Specify Oracle homes that are of the same version.
/
1322, PRE112_HOME_NOT_SUPPORTED, "operation not supported for Oracle home {0} of version {1}"
// *Cause: An attempt to change the Oracle home of a database failed because the version of the Oracle home is less than 11.2.
// *Action: Specify an Oracle home whose version is greater than 11.2.
/
1323, PATCH_18697602_FAILED, "Installation of patch 18697602 is not supported for Oracle Grid Infrastructure of version {0}."
// *Cause: An attempt to install patch 18697602 failed because the version of Oracle Grid Infrastructure is not 12.1.0.1.0.
// *Action: Install the patch from 12.1.0.1.0 Oracle Grid Infrastructure.
/
1324, ORACLE_USER_MISMATCH_WIN, "Neither the previous Oracle home {0} nor the new Oracle home {1} has a built-in user account."
//  *Cause: An attempt to modify the Oracle home of the database failed because a database cannot be moved between homes that have different domain users.
// *Action: Move the database to an Oracle home that has either the same domain user or one that uses built-in account.
/
1325, NO_INST_RUNNING_ON_NODE, "There are no database instances running on node {0}."
//  *Cause: An attempt to retrieve the database instances running on the indicated node found that no instances were running.
// *Action: None.
/
1326, GET_RUNNING_INST_FAILED, "failed to retrieve instances running on node {0}"
//  *Cause: An attempt to retrieve the database instances running on the indicated node has failed.
// *Action: Examine the accompanying error messages for details.
/
1327, NO_INST_FOUND, "no matching database instances found"
//  *Cause: An attempt to retrieve database instances using a filter found no matching instances.
// *Action: None.
/
1328, GET_INST_FAILED, "failed to retrieve database instances using the filter {0}"
//  *Cause: Errors occurred while attempting to retrieve the database instances matching the indicated filter.
// *Action: Examine the accompanying error messages, rectify the reported issues, and retry the operation.
/
1329, GET_INST_HOME_FAILED, "failed to retrieve database instances in Oracle home {0}"
//  *Cause: An attempt to retrieve the database instances in the indicated Oracle home was unsuccessful either because there were no matching instances or the query execution failed.
// *Action: Examine the accompanying error messages for details.
/
1330, GET_INST_VERSION_FAILED, "failed to retrieve database instances of version {0}"
//  *Cause: An attempt to retrieve the database instances of the specified version was unsuccessful either because there were no matching instances or the query execution failed.
// *Action: Examine the accompanying error messages for details.
/
1331, NO_ACTIVE_SERVERS_IN_SP, "server pool {0} has no active servers"
//  *Cause: An attempt to start, stop, or update a database on the specified server pool failed because there are no active servers in the server pool.
// *Action: Specify a server pool with active servers and retry.
/
1332, FAILED_TO_START_DB, "failed to start database {0}"
//  *Cause: An attempt to start the specified database has failed.
// *Action: Examine the accompanying error messages for details.
/
1333, SP_OPERATION_NOT_SUPPORTED, "operation not supported for administrator-managed database {0}"
// *Cause: An attempt to start, stop, or change the start mode of the database on the specified server pools was rejected because the database is not a policy-managed database.
// *Action: Specify a policy-managed database and retry.
/
1334, FAILED_TO_STOP_DB, "failed to stop database {0}"
//  *Cause: An attempt to stop the specified database has failed.
// *Action: Examine the accompanying error messages for details.
/
1335, PQPOOL_OPERATION_NOT_SUPPORTED, "operation not supported for PQ server pools {0} when there are no running hub instances"
// *Cause: An attempt to start, stop, or change the start mode of the database on the specified server pools was rejected because these operations are not supported if all of the specified server pools are PQ pools and there is no hub instance running.
// *Action: Retry after ensuring that at least one hub instance is running.
/
1336, NO_DBS_TO_MOVE, "no databases to move from source Oracle home {0}"
//  *Cause: An attempt to move databases from the specified Oracle home failed either because no databases had been configured in the Oracle home or because the specified databases had already been moved. 
// *Action: Retry the command specifying the correct source Oracle home and after verifying that it contains the databases to be moved.
/
1337, MOVE_DB_START_FAILED, "failed to start database {0} on node {1}"
//  *Cause: This is an informational message only.
// *Action: None.
/
1338, MOVE_DB_STOP_FAILED, "failed to stop database {0} on node {1}"
//  *Cause: This is an informational message only.
// *Action: None.
/
1339, GET_INST_OLD_HOME_FAILED, "failed to retrieve database instances running from source Oracle home {0}"
//  *Cause: An attempt to retrieve the database instances running from the indicated Oracle home was unsuccessful either because there were no matching instances or because the query execution failed.
// *Action: Examine the accompanying error messages for details, fix the problems, and retry.
/
1340, MOVE_DBS_INVALID_INPUT, "Databases \"{0}\" do not belong to source Oracle home {1}."
//  *Cause: An attempt to move the specified databases failed because they did not belong to the specified source Oracle home.
// *Action: Specify the correct databases and retry.
/
1341, MOVE_DBS_INVALID_INPUT2, "Not all the specified databases belong to the same source Oracle home."
//  *Cause: An attempt to move the specified databases failed because not all of them belonged to the same source Oracle home.
// *Action: Specify databases that all belong to the same source Oracle home and retry.
/
1342, NO_DBS_TO_MOVE2, "no databases to move"
//  *Cause: An attempt to move databases failed because no databases had been configured. 
// *Action: Retry the command specifying only existing databases.
/
1343, INVALID_DB_HOME, "Oracle home value for database {0} is invalid."
//  *Cause: An attempt to move the specified database failed because its current Oracle home could not be verified. 
// *Action: Retry the command after verifying the configuration of the spcecified database.
/
1344, DBS_ALREADY_MOVED, "Databases \"{0}\" have already been moved to Oracle home {1}."
//  *Cause: An attempt to move the specified databases failed because they had already moved to the specified destination Oracle home. 
// *Action: None.
/
1345, INVALID_INTEGER, "Invalid value {0} specified for the resource attribute option {1}."
// *Cause: An attempt to add or modify the resource failed because the integer value specified was not compatible with the resource configuration.
// *Action: Retry after consulting the documentation.
/
1346, SERV_RELOCATE_FAILED, "failed to relocate services of database {0}"
// *Cause: An attempt to relocate the services of the specified database failed.
// *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1347, BOTH_PARAMS_NOT_NULL, "Conflicting options '{0}' and '{1}' specified."
// *Cause: An attempt to stop the services failed because conflicting options were supplied for database.
// *Action: Retry by specifying only one of the parameters.
/
1348, DB_STOP_SERV4PDB_FAILED, "failed to stop services of database {0} configured on the pluggable database {1}"
//   *Cause: An attempt to stop the intended services for the specified database failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1349, DRAIN_ACTION_FAILED, "failed to get the status of draining the services {0} of database {1}"
//  *Cause: An attempt to find the status of service draining failed. Accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages, address issues reported and retry.
/
1350, INVALID_RESULT_DRAIN_ACTION, "invalid result obtained from database agent after the completion of drain action"
//  *Cause: An attempt to check the status of service draining completed improperly. The result obtained from the database agent was invalid.
// *Action: Contact Oracle Support Services.
/
1351, ROOT_NOT_ALLOWED, "failed to modify Oracle home of the database {0} as user 'root'"
//   *Cause: An attempt to modify the Oracle home of the indicated database was rejected because the attempting user was 'root'.
//  *Action: Retry as a different user or specify a non-root user explicitly.
/
1352, DISCONNECT_NOT_SUPPORTED, "Session disconnect is not supported for Oracle home {0} of version {1}."
//  *Cause: The requested operation was rejected because it specified the '-disconnect' option, which is supported for Oracle homes of version 11.2 and higher.
// *Action: Retry the command without the '-disconnect' option.
/
1353, DRAIN_NOT_SUPPORTED, "Resource draining is not supported for Oracle home {0} of version {1}."
//  *Cause: The requested operation was rejected because it specified the '-drain_timeout' option.  The '-drain_timeout' option is supported for Oracle homes of version 12.2 and higher.
// *Action: Retry the command without the '-drain_timeout' option.
/
1354, DBS_ALREADY_MOVED_NODES, "Databases \"{0}\" have already been moved to Oracle home {1} on nodes \"{2}\"."
//  *Cause: An attempt to move the indicated databases failed because they had already moved to the indicated destination Oracle home on the indicated nodes. 
// *Action: None.
/
1355, START_SERVICES_FAILED, "failed to start some or all of services: \"{0}\""
//   *Cause: An attempt to start one or more of the indicated services has failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1356, STOP_SERVICES_FAILED, "failed to stop some or all of services: \"{0}\""
//   *Cause: An attempt to stop one or more of the indicated services has failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1357, RELOCATE_SERVICES_FAILED, "failed to relocate some or all of services: \"{0}\""
//   *Cause: An attempt to relocate one or more of the indicated services has failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1358, DRAIN_IN_PROGRESS, "Drain in progress on node {0} for services {1}. {2} sessions yet to be drained."
//   *Cause: Status message
//  *Action: None
/
1359, DRAIN_COMPLETE, "drain complete on node {0} for services {1}"
//   *Cause: Status message
//  *Action: None
/
1360, MONITOR_ACTION_FAILED, "failed to activate the generation of monitoring data for database {0}"
//  *Cause: An attempt to start the generation of monitoring data failed. Accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages, address issues reported and retry.
/
1361, UNMONITOR_ACTION_FAILED, "failed to deactivate the generation of monitoring data for database {0}"
//  *Cause: An attempt to stop the generation of monitoring data failed. Accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages, address issues reported and retry.
/
1362, INVALID_FAILOVER_RESTORE, "invalid value {0} for TAF FAILOVER_RESTORE parameter"
//  *Cause: The Transparent Application Failover (TAF) FAILOVER_RESTORE parameter value supplied was not valid.
// *Action: Supply a valid parameter value like NONE or LEVEL1.
/
1363, GET_CSS_CRITICAL_FAILED, "failed to determine if resource \"{0}\" is CSS critical"
//   *Cause: An attempt to retrieve the value of the CSS_CRITICAL resource attribute failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1364, CSS_CRITICAL_NA, "invalid attempt to define policy-managed database \"{0}\" as CSS critical"
//   *Cause: An attempt to set or unset the CSS_CRITICAL attribute for the indicated database was rejected because it was a policy-managed database.
//  *Action: None.
/
1365, UPDATE_CSS_CRITICAL_FAILED, "failed to define resource \"{0}\" as CSS critical"
//  *Cause: An attempt to change the value of the CSS_CRITICAL attribute of the indicated resource failed.
// *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1366, CSS_CRITICAL_NA2, "invalid attempt to define service \"{0}\" that belongs to policy-managed database \"{1}\" as CSS critical"
//   *Cause: An attempt to change the value of the CSS_CRITICAL attribute of the indicated service was rejected because it was configured on a policy-managed database.
//  *Action: None.
/
1367, STOP_SERVICES_FAILED2, "failed to stop all services running on nodes: \"{0}\""
//   *Cause: An attempt to stop all services running on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1368, STOP_DATABASES_FAILED, "failed to stop all database instances running on nodes: \"{0}\""
//   *Cause: An attempt to stop some or all database instances running on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1369, STOP_RES_NODE, "stopped resources \"{0}\" on node \"{1}\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1370, RELOCATE_RES_NODE, "relocated resources \"{0}\" from node \"{1}\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1371, RELOCATE_SVC_SIDB, "Service \"{0}\" belongs to single-instance database \"{1}\"."
//  *Cause: An attempt to relocate the indicated service was rejected because it belongs to a single-instance database.
// *Action: None.
/
1372, RELOCATE_SVC_NO_TGT, "Service \"{0}\" is already running on all servers on which it is configured to run."
//  *Cause: An attempt to relocate the indicated service was rejected because all possible servers are occupied by the resource.
// *Action: None.
/
1373, START_DATABASES_FAILED, "failed to start database instances on nodes: \"{0}\""
//   *Cause: An attempt to start database instances on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1374, DRAIN_ACTION_FAILED2, "failed to get the status of draining services \"{0}\""
//  *Cause: An attempt to find the status of draining services failed. Accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages, address issues reported, and retry.
/
1375, STOP_DATABASES_FAILED2, "failed to stop all instances of databases \"{0}\" running on nodes \"{1}\""
//   *Cause: An attempt to stop all instances of the indicated databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1376, STOP_DATABASES_FAILED3, "failed to stop all instances of databases \"{0}\""
//   *Cause: An attempt to stop all instances of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1377, STOP_SERVICES_FAILED3, "failed to stop services \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to stop the indicated services on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1378, STOP_SERVICES_FAILED4, "failed to stop services of databases \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to stop services of the indicated databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1379, STOP_SERVICES_FAILED5, "failed to stop services of databases \"{0}\""
//   *Cause: An attempt to stop services of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1380, RELOCATE_SERVICES_FAILED2, "failed to relocate services of all databases from nodes: \"{0}\""
//   *Cause: An attempt to relocate all services running on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1381, RELOCATE_SERVICES_FAILED3, "failed to relocate services \"{0}\" from nodes \"{1}\""
//   *Cause: An attempt to relocate the indicated services from the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1382, RELOCATE_SERVICES_FAILED4, "failed to relocate services of databases \"{0}\" from nodes \"{1}\""
//   *Cause: An attempt to relocate services of the indicated databases from the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1383, RELOCATE_SERVICES_FAILED5, "failed to relocate services of databases \"{0}\""
//   *Cause: An attempt to relocate services of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1384, START_SERVICES_FAILED2, "failed to start services of all databases on nodes: \"{0}\""
//   *Cause: An attempt to start services of all databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1385, START_SERVICES_FAILED3, "failed to start services \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to start the indicated services on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1386, START_SERVICES_FAILED4, "failed to start services of databases \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to start services of the indicated databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1387, START_SERVICES_FAILED5, "failed to start services of databases \"{0}\""
//   *Cause: An attempt to start services of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1388, START_DATABASES_FAILED2, "failed to start instances of databases \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to start instances of the indicated databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1389, START_DATABASES_FAILED3, "failed to start all instances of databases \"{0}\""
//   *Cause: An attempt to start instances of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1390, ISJAVASERVICE_ACTION_FAILED, "Query action for Java service connections failed for service {0} of database {1}.\n{2}"
//  *Cause: An attempt to check whether the indicated service had connected Java sessions failed. The appended messages provide additional detail.
// *Action: Examine the accompanying error messages for details, resolve reported issues and retry the operation.
/
1391, ISJAVASERVICE_ACTION_NOT_RUN, "failed to run Java service query action on service {0}"
//  *Cause: An attempt to run the Java service query action to check whether the indicated service had connected Java sessions resulted in an unexpected error.
// *Action: Examine the accompanying error messages for details, resolve reported issues and retry the operation.
/
1392, INVALID_ACTION_RESULT, "invalid result obtained from the database agent after the completion of action \"{0}\""
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1393, NO_OPERATION, "No resources were affected by the request."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1394, PQ_SERVICE_NOT_ALLOWED, "Operation on parallel query services \"{0}\" rejected."
//  *Cause: An attempt was made to operate on database services using their parallel query helper service names instead of their primary service names.
// *Action: Retry the operation using the primary service names.
/
1395, SERVICE_NOT_EXIST, "Services {0} do not exist."
//  *Cause: An attempt to query services specified one or more that were not defined for
the given database.
//  *Action: Specify services that are defined for the database, or create the service if appropriate.
/
1396, DRAIN_TIMEOUT_INVALID, "invalid drain timeout value {0} specified with TRANSACTIONAL stop option during the service resource operation"
//   *Cause: An attempt to add, modify or stop the service was rejected because the TRANSACTIONAL stop option mandates drain timeout to be a positive integer.
//  *Action: Modify the drain timeout to a positive integer and retry the request or specify a different stop option.
/
1397, GET_CPU_COUNT_FAILED, "failed to retrieve the CPU count for resource \"{0}\""
//   *Cause: An attempt to retrieve the value of the WORKLOAD_CPU resource attribute failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1398, UPDATE_CPU_COUNT_FAILED, "failed to set the CPU count for resource \"{0}\""
//  *Cause: An attempt to change the value of the WORKLOAD_CPU attribute of the indicated resource failed.
// *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1399, GET_CPU_CAP_FAILED, "failed to retrieve the percentage indicating the maximum utilization of workload CPUs for resource \"{0}\""
//   *Cause: An attempt to retrieve the value of the WORKLOAD_CPU_CAP resource attribute failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1400, UPDATE_CPU_CAP_FAILED, "failed to set the percentage indicating the maximum utilization of workload CPUs for resource \"{0}\""
//  *Cause: An attempt to change the value of the WORKLOAD_CPU_CAP attribute of the indicated resource failed.
// *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1401, GET_MEM_TARGET_FAILED, "failed to retrieve the target memory size for resource \"{0}\""
//   *Cause: An attempt to retrieve the value of the WORKLOAD_MEMORY_TARGET resource attribute failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1402, UPDATE_MEM_TARGET_FAILED, "failed to set the target memory size for resource \"{0}\""
//  *Cause: An attempt to change the value of the WORKLOAD_MEMORY_TARGET attribute of the indicated resource failed.
// *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1403, GET_MAX_MEM_FAILED, "failed to retrieve the maximum memory size for resource \"{0}\""
//   *Cause: An attempt to retrieve the value of the WORKLOAD_MEMORY_MAX resource attribute failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1404, UPDATE_MAX_MEM_FAILED, "failed to set the maximum memory size for resource \"{0}\""
//  *Cause: An attempt to change the value of the WORKLOAD_MEMORY_MAX attribute of the indicated resource failed.
// *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1405, NOREPLAY_NOT_SUPPORTED, "Disabling session replay is not supported for Oracle home {0} of version {1}."
//  *Cause: The requested operation was rejected because it specified the '-noreplay' option, which is supported for Oracle homes of version 12.1.0.1 and higher.
// *Action: Retry the command without the '-noreplay' option.
/
1406, GET_RFPOOLS_FAILED, "failed to retrieve the reader farm server pools for database {0}"
//  *Cause: An attempt to retrieve the reader farm server pools of the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1407, SET_RFPOOLS_FAILED, "failed to set the reader farm pools for database {0}"
//  *Cause: An attempt to set the reader farm pools for the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1408, GET_DEF_NETNUM_FAILED, "failed to retrieve the default network number for database services of database \"{0}\""
//   *Cause: An attempt to retrieve the value of the default network number for creating database services failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1409, UPDATE_DEF_NETNUM_FAILED, "failed to set the default network number for database services of database \"{0}\""
//  *Cause:  An attempt to update the value of the default network number for creating database services failed.
// *Action: Review the accompanying error messages for details about the failure. Retry the operation after resolving those issues.
/
1410, INVALID_DB_CPUCOUNT_VALUE, "invalid 'cpucount' option value \"{0}\""
//  *Cause: An attempt to update the CPU count was rejected because the requested value (as displayed) was not greater than zero.
// *Action: Retry the request specifying a value greater than zero for the 'cpucount' option.
/
1411, ENABLE_SERVICES_FAILED, "failed to enable some or all of services: \"{0}\""
//   *Cause: An attempt to enable one or more of the indicated services failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1412, ENABLE_SERVICES_FAILED2, "failed to enable services of all databases on nodes: \"{0}\""
//   *Cause: An attempt to enable services of all databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1413, ENABLE_SERVICES_FAILED3, "failed to enable services \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to enable the indicated services on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1414, ENABLE_SERVICES_FAILED4, "failed to enable services of databases \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to enable services of the indicated databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1415, ENABLE_SERVICES_FAILED5, "failed to enable services of databases \"{0}\""
//   *Cause: An attempt to enable services of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1416, DISABLE_SERVICES_FAILED, "failed to disable some or all of services: \"{0}\""
//   *Cause: An attempt to disable one or more of the indicated services failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1417, DISABLE_SERVICES_FAILED2, "failed to disable services of all databases on nodes: \"{0}\""
//   *Cause: An attempt to disable services of all databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1418, DISABLE_SERVICES_FAILED3, "failed to disable services \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to disable the indicated services on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1419, DISABLE_SERVICES_FAILED4, "failed to disable services of databases \"{0}\" on nodes \"{1}\""
//   *Cause: An attempt to disable services of the indicated databases on the indicated nodes failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1420, DISABLE_SERVICES_FAILED5, "failed to disable services of databases \"{0}\""
//   *Cause: An attempt to disable services of the indicated databases failed.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1421, OJVM_PATCH_FAILED, "failed to perform out-of-place patching for database \"{0}\" that has services with Java sessions"
//   *Cause: An attempt to perform out-of-place patching for the indicated database, which has services with Java sessions, in a rolling fashion failed. The accompanying error messages provide detailed failure information.
//  *Action: Review the accompanying error messages for details about the failure. Retry after resolving those issues.
/
1422, STOPPING_DBS_NODE, "stopping database instances on nodes \"{0}\" ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1423, STOPPING_DBS_NODE2, "stopping instances of databases \"{0}\" on nodes \"{1}\" ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1424, STOPPING_DB_INSTS, "stopping instances of databases \"{0}\" ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1425, STARTING_DBS_NODE, "starting database instances on nodes \"{0}\" ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1426, STARTING_DBS_NODE2, "starting instances of databases \"{0}\" on nodes \"{1}\" ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1427, STARTING_DB_INSTS, "starting instances of databases \"{0}\" ..."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1428, MODIFY_INST_RACONE_FAILED, "Instance name {0} is already associated with node {1} for Oracle RAC One Node database {2}."
//  *Cause: An attempt to associate the specified instance name to a node was
//          rejected because the specified instance name was already associated
//          with the indicated node.
// *Action: Retry, specifying a different instance name, or after unsetting the
//          current association using the command 'srvctl modify instance'.
/
1429, GET_PDB_NAME_FAILED, "failure to get the PDB name for resource {0}"
//  *Cause: An attempt to determine the pluggable database (PDB) name for the cluster resource failed.
// *Action: Ensure that the resource you are querying has been configured.
//          Review the accompanying error messages for details about the failure.
/
1430, GET_SERVICE_NAME_FAILED, "failure to get the PDB service name for resource {0}"
//  *Cause: An attempt to determine the pluggable database (PDB) service name for the cluster resource failed.
// *Action: Ensure that the resource you are querying has been configured. 
//          Review the accompanying error messages for details about the failure.
/
1431, GET_RF_HUB_SERVICE_NAME_FAILED, "failure to get the reader farm hub service name for resource {0}"
//  *Cause: An attempt to determine the hub service name for the reader farm
//          resource failed.
// *Action: Ensure that the resource you are querying has been configured. 
//          Review the accompanying error messages for details about the
//          failure.
/
1432, SET_RF_HUB_SERVICE_FAILED, "failure to set reader farm hub service name {0} for service {1}"
//  *Cause: An attempt to set the reader farm hub service for the specified
//          service failed. The accompanying messages provide detailed failure
//          information.
// *Action: Examine the accompanying messages, resolve the issues identified
//          there, and then retry the operation.
/
1433, OMO_NOT_ENOUGH_SERVER_POLICY_WITHIN_POOLS, "RAC One Node database {0} does not have enough servers in its server pools to initiate an online relocation"
//  *Cause: None of the server pools where the indicated RAC One Node database
//          was configured contained an active server other than the one where
//          the indicated database was running.
// *Action: Ensure that the indicated RAC One Node database's current server 
//          pool contains at least two servers, or that another server pool 
//          where the indicated RAC One Node database is configured contains at
//          least one server, and then retry the operation.
/
1434, START_RES_NODE, "started resources \"{0}\" on node \"{1}\""
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
1435, LISTJAVASERVICES_ACTION_NOT_RUN, "failed to run Java service query action on database {0}"
//  *Cause: An attempt to run the Java service query action to check whether 
//          the services had connected Java sessions resulted in an unexpected 
//          error.
// *Action: Examine the accompanying error messages for details, resolve 
//          reported issues and retry the operation.
/
1436, FAILOVER_TYPE_NOT_FAILOVER_RESTORE, "Addition or modification of failover type to TRANSACTION is not allowed when failover restore is set to AUTO."
//  *Cause: An attempt to add or modify the failover type value to TRANSACTION 
//          was rejected because failover restore was set to AUTO.
// *Action: Retry the operation, specifying the failover type value, 
//          and ensuring that the '-failover_restore' option is not specified.
/
1437, ISPUJS_ACTION_NOT_RUN, "failure checking for completion of the 'Prepare Update of Java System' action on database {0}"
//  *Cause: An attempt to check for completion of a Prepare Update of Java 
//          System action resulted in an unexpected error. The accompanying 
//          messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve
//          reported issues, and retry the operation.
/
2000, REPORT_TXT_UNKNOWN, "unknown"
// *Document: NO
//  *Cause:
// *Action:
/
2001, REPORT_TXT_UP, "up"
// *Document: NO
//  *Cause:
// *Action:
/
2002, REPORT_TXT_DOWN, "down"
// *Document: NO
//  *Cause:
// *Action:
/
2003, REPORT_TXT_YES, "yes"
// *Document: NO
//  *Cause:
// *Action:
/
2004, REPORT_TXT_NO, "no"
// *Document: NO
//  *Cause:
// *Action:
/
2005, REPORT_TXT_NAME, "Name"
// *Document: NO
//  *Cause:
// *Action:
/
2006, REPORT_TXT_TYPE, "Type"
// *Document: NO
//  *Cause:
// *Action:
/
2007, REPORT_TXT_VERSION, "Version"
// *Document: NO
//  *Cause:
// *Action:
/
2008, REPORT_TXT_CLASS, "Class"
// *Document: NO
//  *Cause:
// *Action:
/
2009, REPORT_TXT_CLIENT, "Client"
// *Document: NO
//  *Cause:
// *Action:
/
2010, REPORT_TXT_SERVER, "Server"
// *Document: NO
//  *Cause:
// *Action:
/
2011, REPORT_TXT_SPFILE, "SPFILE"
// *Document: NO
//  *Cause:
// *Action:
/
2012, REPORT_TXT_PWDFILE, "Password file"
// *Document: NO
//  *Cause:
// *Action:
/
2013, REPORT_TXT_NODES, "Nodes"
// *Document: NO
//  *Cause:
// *Action:
/
2014, REPORT_TXT_NODE, "Node"
// *Document: NO
//  *Cause:
// *Action:
/
2015, REPORT_TXT_CLASSIFICATION, "Classification"
// *Document: NO
//  *Cause:
// *Action:
/
2016, REPORT_TXT_OS, "Operating system"
// *Document: NO
//  *Cause:
// *Action:
/
2017, REPORT_TXT_GROUPS, "Groups"
// *Document: NO
//  *Cause:
// *Action:
/
2018, REPORT_TXT_ROLE, "Role"
// *Document: NO
//  *Cause:
// *Action:
/
2019, REPORT_TXT_MODE, "Mode"
// *Document: NO
//  *Cause:
// *Action:
/
2020, REPORT_TXT_MGMT_POLICY_TYPE, "Management policy"
// *Document: NO
//  *Cause:
// *Action:
/
2021, CLUSTER_NODES, "Cluster nodes"
// *Document: NO
//  *Cause:
// *Action:
/
2022, CLUSTER_HOME, "Cluster home"
// *Document: NO
//  *Cause:
// *Action:
/
2023, ORACLE_BASE, "Oracle base"
// *Document: NO
//  *Cause:
// *Action:
/
2024, ORACLE_HOME, "Oracle home"
// *Document: NO
//  *Cause:
// *Action:
/
2025, DATABASE_HOME, "Database home"
// *Document: NO
//  *Cause:
// *Action:
/
2026, REDUNDANCY_TYPE, "Redundancy"
// *Document: NO
//  *Cause:
// *Action:
/
2031, CAUSE_DESCRIPTION_UNAVAILABLE, "Cause of problem is not available."
//  *Cause: The documentation for the root error message accompanied by this 
//          message did not include an explanation as to the likely cause of 
//          the root problem.
// *Action: Contact Oracle Support Services.
/
2032, USER_ACTION_UNAVAILABLE, "User action is not available."
//  *Cause: The documentation for the root error message accompanied by this 
//          message did not include a recommended solution action for the 
//          root problem.
// *Action: Contact Oracle Support Services.
/
2033, CLUSTERWARE_ERROR_HEADER, "The following errors occurred while retrieving the Oracle Clusterware configuration details."
// *Document: NO
//  *Cause:
// *Action:
/
2034, DATABASE_ERROR_HEADER, "The following errors occurred while retrieving the Oracle Database configuration details."
// *Document: NO
//  *Cause:
// *Action:
/
2035, CLUSTER_INFO_HEADER, "Oracle Clusterware configuration details"
// *Document: NO
//  *Cause:
// *Action:
/
2036, CLUSTER_BASIC_INFO_HEADER, "Oracle Clusterware basic information"
// *Document: NO
//  *Cause:
// *Action:
/
2037, NETWORK_INFO_HEADER, "Cluster network configuration details"
// *Document: NO
//  *Cause:
// *Action:
/
2038, ASM_INFO_HEADER, "ASM configuration details"
// *Document: NO
//  *Cause:
// *Action:
/
2039, SCAN_INFO_HEADER, "SCAN configuration details"
// *Document: NO
//  *Cause:
// *Action:
/
2040, DATABASE_INFO_HEADER, "Database configuration details"
// *Document: NO
//  *Cause:
// *Action:
/
2041, DATABASE_HEADER, "Database \"{0}\" details"
// *Document: NO
//  *Cause:
// *Action:
/
2042, ASM_DISK_GROUPS, "ASM disk group details"
// *Document: NO
//  *Cause:
// *Action:
/
2050, CRS_USER_NAME, "Cluster user name"
// *Document: NO
//  *Cause:
// *Action:
/
2051, OCR_LOCATIONS, "OCR locations"
// *Document: NO
//  *Cause:
// *Action:
/
2052, VOTING_DISK_LOCATIONS, "Voting disk locations"
// *Document: NO
//  *Cause:
// *Action:
/
2053, ASM_INSTANCE_NAME, "Instance name"
// *Document: NO
//  *Cause:
// *Action:
/
2054, ASM_PRESENCE, "ASM presence"
// *Document: NO
//  *Cause:
// *Action:
/
2061, INTERFACE_NAME, "Interface name"
// *Document: NO
//  *Cause:
// *Action:
/
2062, SUBNET, "Subnet"
// *Document: NO
//  *Cause:
// *Action:
/
2063, IPV4_SUBNET, "IPv4 subnet"
// *Document: NO
//  *Cause:
// *Action:
/
2064, IPV6_SUBNET, "IPv6 subnet"
// *Document: NO
//  *Cause:
// *Action:
/
2065, IP_ADDRESS, "IP address"
// *Document: NO
//  *Cause:
// *Action:
/
2066, VIP_ADDRESS, "VIP address"
// *Document: NO
//  *Cause:
// *Action:
/
2071, SCAN_NAME, "SCAN name"
// *Document: NO
//  *Cause:
// *Action:
/
2072, SCAN_DETAILS, "SCAN \"{0}\" details"
// *Document: NO
//  *Cause:
// *Action:
/
2073, DHCP_SERVER_TYPE, "DHCP server type"
// *Document: NO
//  *Cause:
// *Action:
/
2074, SCAN_LISTENER, "Listener"
// *Document: NO
//  *Cause:
// *Action:
/
2075, SCAN_LISTENER_ENDPOINTS, "End points"
// *Document: NO
//  *Cause:
// *Action:
/
2076, SCAN_CLIENT_CLUSTER_NAME, "Client cluster name"
// *Document: NO
//  *Cause:
// *Action:
/
2077, SCAN_LISTENER_DETAILS, "SCAN listeners"
// *Document: NO
//  *Cause:
// *Action:
/
2078, SCAN_CLIENT_LISTENER_DETAILS, "SCAN client listeners"
// *Document: NO
//  *Cause:
// *Action:
/
2079, MGMTDB_UPGRADE_FAILED, "failed to upgrade configuration of management database {0} to version {1}"
//  *Cause:  An attempt to upgrade the management database configuration failed. 
//           The accompanying messages provide detailed failure information. 
//  *Action: Review the accompanying error messages for details about the 
//           failure. Retry after resolving those issues.
/
2080, UNSET_COMMIT_OUTCOME_AUTO_FAILED, "failed to unset commit outcome because the failover type is set to AUTO"
//  *Cause: An attempt to unset the commit outcome attribute of the specified 
//          service failed because the failover type was set to AUTO.
// *Action: Modify the value of failover type and retry the command.
/
2081, HOME_PATH_NOT_EXIST_ALL_NODES, "The Oracle home path \"{0}\" does not exist on all the nodes where the database {1} is configured."
//  *Cause: An attempt to convert the database from an administrator-managed 
//          configuration to a policy-managed configuration was rejected 
//          because the Oracle home path did not exist on all the nodes where 
//          the database was configured.
// *Action: Ensure that the home path exists on all nodes, and then retry the 
//          operation.
/
2082, VOTING_DISK_FILEPATHS, "Voting disk file paths"
// *Document: NO
//  *Cause:
// *Action:
/
2083, NON_GLOBAL_SERVICE_TABLE, "invalid option table family id for the specified non-global service {0}"
//  *Cause: An attempt to add or modify the specified option was rejected 
//          because an option that is only valid for global services was 
//          specified.
// *Action: Reissue the request without the invalid option.
/
2084,NO_DATABASE_INSTANCE_ON_LOCALNODE, "failed to connect to database \"{0}\" because no instance is running on local node \"{1}\""
//  *Cause: None of the instances of the indicated database were running on the local node.
// *Action: Ensure that an instance of the database is running on the local node, and then retry the operation.
/
2085, NO_INST_RUNNING_ON_NODES, "There are no database instances running on nodes: {0}."
//  *Cause: An attempt to retrieve the database instances running on the indicated nodes found that no instances were running.
// *Action: None.
/
2086, GET_RUNNING_INST_FAILED2, "failed to retrieve instances running on nodes: {0}"
//  *Cause: An attempt to retrieve the database instances running on the indicated nodes has failed.
// *Action: Examine the accompanying error messages for details.
/
