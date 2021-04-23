// Copyright (c) 2008, 2019, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrGtMsg.msg
//
// DESCRIPTION
//    Message file containing Grid Home messages originally located
//    under OPSM
//
// CONVENTION
//    
//    Note: Messages in upper case, will not be translated.
//
//    ####, <LABEL>, "<Message>"    - Individual and incremental numeric 
//                                    sequence for generic messages
//    _###, <LABEL>, "<Definition>" - One underscore plus individual and 
//                                    incremental numeric sequence for definitions
//    __##, <LABEL>, "<Usage>"      - Two underscores plus individual 
//                                    and incremental numeric sequence for 
//                                    usage messages
//    <Omitted | // *Document: No>  - When omitted, 'Cause' and 'Action' will 
//                                    generate error message books
//                                  - When present, there is no need for 
                                      'Cause' and 'Action' clauses 
//    // *Cause: <A brief description of the cause>
//    // *Action: <Action to be performed by end user>
//    /
//
// TOMBSTONE
//    ####, <LABEL>, "" - Empty string to decommission generic messages
//    _###, <LABEL>, "" - Empty string to decommission definitions
//    __##, <LABEL>, "" - Empty string to decommission usages
//    // NOT TO BE REUSED - please add this message
//    // *Document:
//    // *Cause:
//    // *Action:
//    /
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//    apfwkr      02/13/19 - Backport rdesale_bug_29299830 from main
//    rdesale     02/10/19 - fix bug 29299830
//    glabrada    12/11/18 - Fix bug-29043954 Adding -listphases to migrate
//                           database operation
//    apfwkr      12/08/18 - Backport glabrada_bug-28003317 from main
//    apfwkr      12/06/18 - Backport rdesale_bug-29015033 from main
//    apfwkr      11/19/18 - Backport kamramas_bug-28933267 from main
//    vgunredd    11/06/18 - Backport vgunredd_bug-28871945 from main
//    vgunredd    11/13/18 - Backport vgunredd_bug-27867724 from main
//    prajm       10/26/18 - XbranchMerge prajm_bug_28826931 from main
//    drtorres    10/24/18 - Backport drtorres_bug-28670064 from main
//    glabrada    10/23/18 - Backport glabrada_bug-28410474 from main
//    apfwkr      10/23/18 - Backport yifyang_bug-28585727 from main
//    glabrada    09/21/18 - XbranchMerge glabrada_bug-28470058 from main
//    kamramas    09/19/18 - XbranchMerge kamramas_bug-28560490 from main
//    glabrada    12/06/18 - Updating migrate database operation
//    rdesale     11/26/18 - zdm delta bug validation
//    kamramas    11/13/18 - disallow phase
//    kamramas    11/02/18 - zdm useraction image
//    vgunredd    10/30/18 - fix bug 27867724
//    drtorres    10/17/18 - adding -build to display version to user
//    prajm       10/12/18 - fix bug#28703211
//    sowong      09/20/18 - add sidb support
//    drtorres    10/17/18 - adding -build to display version to user
//    kamramas    09/19/18 - XbranchMerge kamramas_bug-28560490 from main
//    glabrada    08/16/18 - Fix bug-28410474 Adding export/import credentials
//    yifyang     09/13/18 - bug-28585727
//    kamramas    09/19/18 - fix clouduser
//    shshrini    09/20/18 - XbranchMerge shshrini_bug-28324305 from main
//    glabrada    08/27/18 - Fix Bug-28470058 Adding cloudcli help
//    shshrini    08/17/18 - Fix pause and resume issues
//    drtorres    08/28/18 - Fix Bug 28536755 - add tgip to gihome help
//    lhurtado    08/27/18 - bug 28556224 add batches, abort, continue to cli
//    nvira       08/14/18 - read tde passwords
//    jesusfer    08/15/18 - fix bug 28504032, server option delete img
//    aaniyeri    08/14/18 - Fix bug 28402287
//    prajm       08/13/18 - RTI - 21071742
//    rdesale     08/06/18 - fix bug 28461729
//    prajm       08/02/18 - bug #27848011
//    sidshank    07/30/18 - fix bug 27928302.
//    jesusfer    07/09/18 - fix bug 28277732, site op msg
//    shshrini    07/04/18 - Add pause and resume functionality
//    rdesale     07/04/18 - fix bug 27909255
//    vgunredd    06/10/18 - fix zdu help
//    glabrada    05/15/18 - Fix Bug-28025304 Adding query credentials
//    jesusfer    05/25/18 - fix bug 27913556, fetch wc metadata
//    glabrada    05/15/18 - Fix Bug-28025304 Adding query credentials
//    sowong      04/30/18 - rhpctl and gridhome client specific messages for
//                           ZDM
//    rdesale     04/29/18 - fix bug 27836499
//    dnunora     04/18/18 - Bug 27581468 adding existing RHPC
//    dnunora     04/17/18 - fix bugs 27867917, 27808844 by adding missing optns
//    glabrada    04/16/18 - ZDM project modifying some msgs: jobs, useraction,
//                           audit, JOB_TYPE, UPTO, BRIEF and PHASE.
//    vgunredd    04/10/18 - fix bug 27299455
//    jesusfer    03/21/18 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
000, USAGE_IMAGE_IMPORT,  "Usage: rhpctl import image -image <image_name> {-path <path> | -zip <zipped_home_path> | -notify [-cc <users_list>] } [-imagetype <image_type>] [-pathowner <username>] [-version <image_version>] [-state {TESTABLE|RESTRICTED|PUBLISHED}] [-location <zipped_home_path>] [-client <cluster_name>] [-targetnode <node_name> [-sudouser <sudo_user_name> -sudopath <sudo_binary_path> | -root | -cred <cred_name> | -auth <plugin_name> [-arg1 <name1>:<value1>[ -arg2 <name2>:<value2>...]]]] [-useractiondata <user_action_data>] [-series <series_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
001, UPGRADE_GI_SELF_FAILED, "failed to upgrade the Oracle Grid Infrastructure to cluster '{0}'"
//  *Cause: An attempt to upgrade the Oracle Grid Infrastructure to the specified
//          specified cluster failed. The accompanying error messages provide 
//          detailed failure information.
// *Action: Examine the accompanying error messages, address the issues
//          reported, and retry.
/
_001, DEFINE_ADDNODE_IGNORE_OPTION, "    -ignoreprereq          To ignore the CVU pre-requisite checks. Must be release 12.1 or later"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__002, USAGE_UPGRADE_GIHOME,  "Usage: rhpctl upgrade gihome {-sourcewc <workingcopy_name> | -sourcehome <oracle_home_path> -targetnode <target_node_name>} -destwc <destination_workingcopy_name> [-root | -cred <cred_name> | -sudouser <sudo_user_name> -sudopath <sudo_executable_path> | -auth <plugin_name> [-arg1 <name1>:<value1> [-arg2 <name2>:<value2>...]]] [-ignoreprereq] [-useractiondata <user_action_data>] [-eval] [-batches <list_of_batches>] [-abort | -continue] [-schedule { <timer_value> | NOW }] [-ignoremissingpatches <patch_name1>[,<patch_name2>...]]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__003, USAGE_UPGRADE_DATABASE,  "Usage: rhpctl upgrade database [-sourcewc <source_workingcopy_name> | -sourcehome <oracle_home_path> [-oraclebase <oraclebase_path>] [{-client <cluster_name> | -targetnode <node_name>}]] [-root | -cred <cred_name> | -sudouser <sudo_user_name> -sudopath <sudo_binary_location> | -auth <plugin_name> [-arg1 <name1>:<value1> [-arg2 <name2>:<value2>...]]] -destwc <destination_workingcopy_name> -dbname <unique_db_name> [-useractiondata <user_action_data>] [-eval [-preupg]] [-schedule { <timer_value> | NOW }] [-ignoremissingpatches <patch_name1>[,<patch_name2>...]] [-dbuaargs <dbua_arguments>]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
1000, OPT_AUTH_PLUGIN_MISSING_ERROR, "The remote authentication plug-in Java archive {0} was not found for option {1}."
//  *Cause: An attempt to execute the 'cloudcli' command with the '-srcauth' 
            option or '-tgtauth' option failed because the indicated Java
//          archive (JAR) file was not found.
// *Action: Ensure that the indicated JAR file is present and retry the 
//          command.
/
1001, ZDM_CLOUDUSR_CMDLINE_PASSWD, "Enter user \"{0}\" password:"
// *Document: NO
//  *Cause:
// *Action:
/
1002, ZDM_SOURCE_CMDLINE_PASSWD, "Enter source user \"{0}\" password:"
// *Document: NO
//  *Cause:
// *Action:
/
1003, ZDM_TARGET_CMDLINE_PASSWD, "Enter target user \"{0}\" password:"
// *Document: NO
//  *Cause:
// *Action:
/
1004, ZDM_SRCDB_SYS_CMDLINE_PASSWD, "Enter source database {0} SYS password:"
// *Document: NO
//  *Cause:
// *Action:
/
1005, WC_CONFIGURED_FOR_CLIENT, ""
// NOT TO BE REUSED
// *Document:
// *Cause: 
// *Action: 
/
1006, WC_WERE_FOUND, ""
// NOT TO BE REUSED
//  *Document:
//  *Cause:
// *Action:
/
1007, INVALID_PAUSE_PHASE, "invalid value \"{0}\" specified for -pauseafter option"
// *Cause: Unsupported phase was specified for -pauseafter option.
// *Action: Ensure that a valid phase value is specified for
//          -pauseafter option and retry the command.
//          Use -eval option to list the supported phases to pause.
/
1008, INVALID_HOME_NO_ORACLEBASE, "Oracle home location {0} does not contain program {1}"
//  *Cause: The current Oracle home directory did not contain the indicated utility.
// *Action: Provide the correct Oracle home directory.
/
1009, ORACLEBASE_HOME_FAILED, "Attempt to retrieve Oracle base home from Oracle home {0} failed. Detailed error: \n {1}"
//  *Cause: An attempt to execute the 'oraclebasehome' command failed. 
//          See the accompanying error message for further details.
// *Action: Verify that the 'bin' directory under the indicated Oracle home 
//          contains the 'oraclebasehome' binary, and verify execution of the 
//          command 'oraclebasehome' manually on that Oracle home.
/
1010, ZDM_TDE_KEYSTORE_PASSWD_CMDLINE_PASSWD, "Enter source database {0} TDE keystore password:"
// *Document: NO
//  *Cause:
// *Action:
/
1011, ZDM_TDE_MASTERKEY_CMDLINE_PASSWD, "Enter source database {0} TDE masterkey:"
// *Document: NO
//  *Cause:
// *Action:
/
1012, SCHEDULE_TIMER_VALUE_INVALID_OFFSET, "invalid offset value \"{0}\" specified for -schedule option"
// *Cause: Offset value specified was not in the expected format "+dd:mm:yy:hh:mm:ss" 
// *Action: Ensure that a valid offset value is specified for
//          -schedule option and retry the command.
//          Example 1: +44:22:33 to specify offset value of 44 hours, 
//          22 minutes and 33 seconds.
//          Example 2: +11:02:02:44:22:33 to specify offset value of 
//          11 days, 02 months, 02 years, 44 hours, 
//          22 minutes and 33 seconds.
/
1013, SCHEDULE_TIMER_VALUE_INVALID_OFFSET_VALUE, "invalid offset value \"{0}\" specified for \"{1}\" field of -schedule option"
// *Cause: The offset value did not contain a valid value for the indicated
//         field of the offset value for the -schedule option.
// *Action: Ensure that a valid offset value is specified for
//          each of the fields of the offset value for the -schedule option and
//          retry the command.
//          Maximum allowed values for "+dd:mm:yy:hh:mm:ss" is 
//          "+31:12:99:23:59:59"
/
1014, BUILD_INFORMATION, "version: {0}\nfull version: {1}\nlabel date: {2}"
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
1015, INVALID_RACONETIMEOUT, "The value specified for the '-raconetimeout' option is invalid."
//  *Cause: An attempt to move a database was rejected because the integer
//          specified for '-raconetimeout' was not a value between 1 and 720.
// *Action: Retry the operation specifying a valid value for option
//          '-raconetimeout'.
/
1016, PHASE_OPTION_NOT_ALLOWED, "Option \"{0}\" not allowed for specified operation type {0}."
//  *Cause: An attempt to run an rhpctl command was rejected because
//          the indicated option was not allowed.
// *Action: Retry the operation specifying valid options.
/
1017, ZDM_PATCHES_MISSING_TGT_HOME, "The target Oracle Database home \"{0}\" is missing the patches for bug numbers \"{1}\" which are present in the source Oracle Database home \"{2}\"."
//  *Cause: An attempt to migrate a database with zero downtime was rejected
//          because the destination Oracle Database home did not include the
//          patches for the indicated bugs.
// *Action: Rerun the migrate command with the '-ignoremissingpatches
//          <patch_name>[,<patch_name>...]' option to ignore specific patches
//          or with the '-ignore ALL|PATCH_CHECK' option to ignore patch
//          checking, or apply the mandatory patches in the destination 
//          Oracle Database home, and retry.
/
1018, INVALID_CLIENT_NAME, "Specified client name \"{0}\" contains invalid characters or is too long."
// *Cause: An attempt to add client was rejected because the
//         indicated client name was not valid. Client names must not contain
//         the characters $@"'>();*? and must be no longer than 128 characters.
// *Action: Specify a valid client name.
/
1019, INVALID_WORKINGCOPY_PATH, "Specified working copy path \"{0}\" contains invalid characters or is too long."
// *Cause: An attempt to create or patch a working copy was rejected
//         because the indicated working copy path was not valid.
//         Working copy path must not contain the characters $@"'>();*?
//         and must be no longer than 128 characters.
// *Action: Specify a valid working copy path.
/
1020, INVALID_WORKINGCOPY_ORACLE_BASE, "Specified working copy Oracle base path \"{0}\" contains invalid characters or is too long."
// *Cause: An attempt to create or patch a working copy was rejected
//         because the indicated working copy Oracle base path was not
//         valid. Working copy Oracle base path must not contain the
//         characters $@"'>();*? and must be no longer than 128
//         characters.
// *Action: Specify a valid Oracle base path.
/

__100, USAGE_MIGRATE_DATABASE,  "Usage: cloudcli migrate database {-sourcedb <db_name> | -sourcesid <source_oracle_sid>} -sourcenode <node_name> -targetnode <node_name> -targethome <target_home> -rsp <zdm_template> [-eval] [-imagetype] [-tdekeystorepasswd] [-tdemasterkey] [-useractiondata <user_action_data>] -backupuser <user_name> [{ -srcroot |-srccred <cred_name> | -srcuser <user_name> | {-srcsudouser <sudo_user_name> -srcsudopath <sudo_binary_path>} | {-srcauth <plugin_name>  [-srcarg1 <name1>:<value1> [-srcarg2 <name2>:<value2>...]]}}]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__101, USAGE_MIGRATE_DATABASE_PART2,  "{-tgtroot | -tgtcred <cred_name> | -tgtuser <user_name> | {-tgtsudouser <sudo_user_name> -tgtsudopath <sudo_binary_path>} | {-tgtauth <plugin_name> [-tgtarg1 <name1>:<value1> [ -tgtarg2 <name2>:<value2>...]]}} [-schedule { <timer_value> | NOW }] [-pauseafter <phase>] [-listphases] [-ignoremissingpatches <patch_name>[,<patch_name>...]] [-ignore {ALL|WARNING|PATCH_CHECK}]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__102, MIGRATE_DATABASE_PURPOSE, "\nPerforms migration of a database to the cloud.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__103, USAGE_QUERY_JOB,  "Usage: rhpctl query job [-jobid <job_id>] [-status {SCHEDULED | EXECUTING | UNKNOWN | TERMINATED | FAILED | SUCCEEDED | PAUSED | ABORTED}] [-client <client_name>] [-user <user_name>] [-since <timer_value>] [-brief]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__104, USAGE_USERACTION_ADD,  "Usage: rhpctl add useraction -useraction <user_action_name> -actionscript <script_name> [-actionfile <file_name>] {-pre | -post} -optype {IMPORT_IMAGE | ADD_WORKINGCOPY | DELETE_WORKINGCOPY | ADD_DATABASE | DELETE_DATABASE | ADD_PDB_DATABASE | DELETE_PDB_DATABASE | MOVE_DATABASE | MOVE_GIHOME | UPGRADE_DATABASE | UPGRADE_GIHOME | ADDNODE_GIHOME | DELETENODE_GIHOME | ADDNODE_DATABASE | DELETENODE_DATABASE | ADDNODE_WORKINGCOPY | ZDTUPGRADE_DATABASE | ZDTUPGRADE_DATABASE_SNAPDB | ZDTUPGRADE_DATABASE_DBUA | ZDTUPGRADE_DATABASE_SWITCHBACK | MIGRATE_DATABASE } [-phase <operation phase>] [-onerror {ABORT | CONTINUE}] [-runscope {ONENODE | ALLNODES | AUTO | FIRSTNODEONRHPS | LASTNODEONRHPS | ALLNODESONRHPS}]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__105, USAGE_USERACTION_QUERY,  "Usage: rhpctl query useraction [-useraction <user_action_name> | -imagetype <image_type> [-optype {IMPORT_IMAGE | ADD_WORKINGCOPY | DELETE_WORKINGCOPY | ADD_DATABASE | DELETE_DATABASE | ADD_PDB_DATABASE | DELETE_PDB_DATABASE | MOVE_DATABASE | MOVE_GIHOME | UPGRADE_DATABASE | UPGRADE_GIHOME | ADDNODE_GIHOME | DELETENODE_GIHOME | ADDNODE_DATABASE | DELETENODE_DATABASE | ADDNODE_WORKINGCOPY | ZDTUPGRADE_DATABASE | ZDTUPGRADE_DATABASE_SNAPDB | ZDTUPGRADE_DATABASE_DBUA | ZDTUPGRADE_DATABASE_SWITCHBACK | MIGRATE_DATABASE}]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__106, USAGE_AUDIT_QUERY,  "Usage: rhpctl query audit [[  [-operation { add | delete | modify | migrate | grant | revoke | move | verify | discover | upgrade | allow | disallow | deleteimage | insertimage | promote | export | import | query | subscribe | unsubscribe | addnode | deletenode | register | unregister }] [ -entity { client | role | image | series | workingcopy | database | server | user | audit | imagetype | useraction}] | [-user <user_name>] [-client <client_name>] | [-from <timestamp> -to <timestamp>] | -before <timestamp> | -since <timestamp> | -first <number> | -last <number>] | -record <record_id> | -config]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__107, USAGE_USERACTION_MODIFY,  "Usage: rhpctl modify useraction -useraction <user_action_name> [-actionscript <script_name>] [-actionfile <file_name>] [-pre | -post] [-optype {IMPORT_IMAGE | ADD_WORKINGCOPY | DELETE_WORKINGCOPY | ADD_DATABASE | DELETE_DATABASE | ADD_PDB_DATABASE | DELETE_PDB_DATABASE | MOVE_DATABASE | MOVE_GIHOME | UPGRADE_DATABASE | UPGRADE_GIHOME | ADDNODE_GIHOME | DELETENODE_GIHOME | ADDNODE_DATABASE | DELETENODE_DATABASE | ADDNODE_WORKINGCOPY | ZDTUPGRADE_DATABASE | ZDTUPGRADE_DATABASE_SNAPDB | ZDTUPGRADE_DATABASE_DBUA | ZDTUPGRADE_DATABASE_SWITCHBACK | MIGRATE_DATABASE }] [-phase <phase>] [-onerror {ABORT | CONTINUE}] [-runscope {ONENODE | ALLNODES | AUTO}]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__108, USAGE_QUERY_JOB_ZDM,  "Usage: cloudcli query job [-jobid <job_id>] [-status {SCHEDULED | EXECUTING | UNKNOWN | TERMINATED | FAILED | SUCCEEDED | PAUSED | ABORTED}] [-dbname <database_name>] [-since <timer_value>] [-upto <timer_value>] [-brief]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__109, USAGE_DELETE_JOB,  "Usage: rhpctl delete job { -jobids <job_ids> | -status {SCHEDULED | EXECUTING | UNKNOWN | TERMINATED | FAILED | SUCCEEDED | PAUSED | ABORTED} | -client <client_name> | -user <user_name> } [-recurse | -force] [-verbose]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__110, USAGE_WORKINGCOPY_QUERY,  "Usage: rhpctl query workingcopy [-workingcopy <workingcopy_name> [-details] [-metadataonly] | [-image <image_name> [-drift]] [-client <cluster_name>]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__111, USAGE_CRED_QUERY,  "Usage: rhpctl query credentials [-cred <cred_name>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__112, QUERY_CREDENTIALS_PURPOSE, "\nQueries the stored credentials.\n"
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
__113, USAGE_ABORT_JOB,  "Usage: rhpctl abort job { -jobid <job_id> }"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__114, ABORT_JOB_PURPOSE, "\nAborts the specified job if running.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__115, USAGE_RESUME_JOB,  "Usage: rhpctl resume job { -jobid <job_id> } [ -pauseafter <pause_phase> ]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__116, RESUME_JOB_PURPOSE, "\nResumes a specified job if paused.\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
__117, USAGE_IMAGE_DELETE,  "Usage: rhpctl delete image -image <image_name> [-schedule { <timer_value> | NOW }] [-client <cluster_name> | -server <server_cluster_name> | -local]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__118, USAGE_MOVE_GIHOME, "Usage: rhpctl move gihome -destwc <destination_workingcopy_name> {{-sourcewc <source_workingcopy_name> | -sourcehome <oracle_home_path>} [-targetnode <node_name>] [-ignorewcpatches] [-nonrolling] [-keepplacement]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__119, USAGE_MOVE_GIHOME2, "[-auto -dbhomes <mapping_of_Oracle_homes> [-dblist <db_name_list> | -excludedblist <db_name_list>] [-nodatapatch] [-disconnect] [-stopoption <stop_option>] [-drain_timeout <session_drain_time>] [-dbsinparallel <number_of_instances>] [-raconetimeout <timeout>]] [-batches <list_of_batches> | -smartmove [-saf <availability>][-separate]] [-eval] [-schedule { <timer_value> | NOW }]"
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__120, USAGE_MOVE_GIHOME3, " [[-aupath <gold_image_path> [-agpath <read_write_path>]] | [-tgip [-nodriverupdate]]] [-ignoremissingpatches <patch_name1>[,<patch_name2>...]] | -continue | -revert | -abort} [-root | -cred <cred_name> | -sudouser <sudo_username> -sudopath <path_to_sudo_binary> | -auth <plugin_name> [-arg1 <name1>:<value1> [-arg2 <name2>:<value2>...]]] [-cleanpids] [-useractiondata <user_action_data>] "
//  *Document: No
//  *Cause: Status message
//  *Action: Not an error
/
__121, USAGE_GHCTL_ZDM, "Usage: cloudcli <command> <object> [<options>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__122, USAGE_RHPCTL_VERB_ZDM, "    commands: migrate"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__123, USAGE_GHCTL_HELPER_ZDM, "  cloudcli <command> <object> -help"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__124, USAGE_RHPCTL_NOUN_ZDM, "    objects: database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__125, USAGE_GHCTL_MIGRATE,  "Performs migration operation for the cloud.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__126, USAGE_GHCTL_DESCRIPTION_ZDM, "\nPerforms Rapid Home Provisioning operations for the cloud.\n" 
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__127, USAGE_CRED_EXPORT,  "Usage: rhpctl export credentials -wallet <file>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__128, EXPORT_CREDENTIALS_PURPOSE, "\nExport client credentials from the OCR to a wallet file\n"
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
__129, USAGE_CRED_IMPORT,  "Usage: rhpctl import credentials -wallet <file>"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
__130, IMPORT_CREDENTIALS_PURPOSE, "\nImport client credentials from a wallet file and store them in the OCR.\n"
// *Document: No
// *Cause: Status message
// *Action: Not an error
/
_100, DEFINE_ZDM_SOURCEDB, "    -sourcedb <db_name>     name of the source database to be migrated"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_101, DEFINE_SOURCE_NODE, "    -sourcenode <node_name>     node on which the source database is running"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_102, DEFINE_ZDM_TARGET_NODE, "    -targetnode <node_name>     target node where the database will be migrated"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_103, DEFINE_TARGET_HOME, "    -targethome <target_home>     location of the target"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_104, DEFINE_ZDM_RESPONSE, "    -rsp <zdm_template>     zero-downtime migration template"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_105, DEFINE_ORACLE_SID, "    -sourcesid <source_oracle_sid>     ORACLE_SID of the source single instance database without Grid Infrastructure"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_106, DEFINE_CLOUD_USER, "    -clouduser <user_name>     name of the cloud user"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_107, DEFINE_SRC_CRED, "    -srccred <cred_name>     credential name to associate the user/password credentials to access the source node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_108, DEFINE_SRC_USER, "    -srcuser <user_name>     name of the privileged user performing operations on the source node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_109, DEFINE_SRC_AUTH, "    -srcauth <plug-in_name> [<plug-in_args>]      Use an authentication plug-in to access the source node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_110, DEFINE_TGT_ROOT, "    -tgtroot                Use root credentials to access the target node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_111, DEFINE_TGT_CRED, "    -tgtcred <cred_name>     credential name to associate the user/password credentials to access the target node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_112, DEFINE_TGT_USER, "    -tgtuser <user_name>     name of the user performing operations on the target node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_113, DEFINE_TGT_SUDOUSER, "    -tgtsudouser <username>            perform super user operations as sudo user name on the target node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_114, DEFINE_TGT_SUDOPATH, "    -tgtsudopath <sudo_binary_path>           location of sudo binary on the target node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_115, DEFINE_TGT_AUTH, "    -tgtauth <plugin_name> [<plugin_args>]      Use an authentication plugin to access the target node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_116, MOVE_DATABASE_PURPOSE_LOCAL, "\nmoves a database from source Oracle home to the patched Oracle home\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_117, USAGE_MOVEDB_LOCAL,  "Usage: rhpctl move database -desthome <destination_oracle_home_path> {-sourcehome <oracle_home_path> [-dbname <db_name_list>] [-eval] [-ignorewcpatches] [-nonrolling | -forcerolling] [-node <node_name>] [-stopoption <stop_option>] [-disconnect [-noreplay]] [-drain_timeout <time>] | -continue | -revert | -abort}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_118, USAGE_MOVE_GIHOME_LOCAL,  "Usage: rhpctl move gihome -desthome <destination_crs_home_path> {-sourcehome <crs_home_path> [-eval] [-ignorewcpatches] [-nonrolling] [-node <node_name>] | -continue | -revert | -abort} [-auto -dbhomes <mapping_of_Oracle_homes> [-dblist <db_name_list> | -excludedblist <db_name_list>]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_119, MOVE_GIHOME_PURPOSE_LOCAL, "\nmoves Oracle Grid Insfrastructure from source home to destination home\n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_120, USAGE_RHPCTL_VERB_LOCAL, "    commands: move"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_121, USAGE_RHPCTL_NOUN_LOCAL, "    objects: database|gihome"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_122, USAGE_GHCTL_DESCRIPTION_LOCAL, "Performs patching of databases and Grid Infrastructure.\n"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_123, DEFINE_OPTYPE_OPTION, "    -optype {IMPORT_IMAGE | ADD_WORKINGCOPY | DELETE_WORKINGCOPY | ADD_DATABASE | DELETE_DATABASE | ADD_PDB_DATABASE | DELETE_PDB_DATABASE | MOVE_DATABASE | MOVE_GIHOME | UPGRADE_DATABASE | UPGRADE_GIHOME | ADDNODE_GIHOME | DELETENODE_GIHOME | ADDNODE_DATABASE | DELETENODE_DATABASE | ADDNODE_WORKINGCOPY | ZDTUPGRADE_DATABASE | ZDTUPGRADE_DATABASE_SNAPDB | ZDTUPGRADE_DATABASE_DBUA | ZDTUPGRADE_DATABASE_SWITCHBACK | MIGRATE_DATABASE}   Operation for which the user action is configured"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_124, DEFINE_AUDIT_OPERATION, "    -operation  { add | delete | modify | migrate | grant | revoke | move | verify | discover | upgrade | allow | disallow | deleteimage | insertimage | promote | export | import | query | subscribe | unsubscribe | addnode | deletenode | register | unregister }       The operation type for audit query"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_125, DEFINE_JOB_STATUS, "    -status {SCHEDULED | EXECUTING | UNKNOWN | TERMINATED | FAILED | SUCCEEDED | PAUSED | ABORTED}         Job status for which to get the jobs."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_126, DEFINE_DBNAME_OPTION_ZDM, "    -dbname <unique_db_name>                Name of database (DB_UNIQUE_NAME)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_127, DEFINE_PHASE_OPTION_ZDM, "    -phase <phase_number>                Number of phase "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_128, DEFINE_JOBS_UPTO, "    -upto  <timer_value>         Upper limit time to get the jobs, in ISO-8601 format. For example: 2016-12-21T19:13:17+05"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_129, DEFINE_JOBS_BRIEF, "    -brief     Job details summary only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_130, DEFINE_QUERY_METADATA, "    -metadataonly     Query workingcopy metadata only"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_131, USAGE_ZDTUPGRADE_DATABASE_PART2,  "[-targetnode <node_name> {-root | -cred <cred_name> | -sudouser <username> -sudopath <sudo_binary_path> | -auth <plugin_name> [-arg1 <name1>:<value1> [-arg2 <name2>:<value2>...]]}] [-eval] [-ignoreprereq] [-useractiondata <user_action_data>] [-dbuaargs <dbua_arguments>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_132, DEFINE_ZDU_IGNOREWARN, "    -ignoreprereq        Ignore warnings reported by pre-requisite checks and continue with ZDU operation"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_133, DEFINE_PAUSE_AFTER, "    -pauseafter <phase>                Pause the job after executing the specified phase "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_134, DEFINE_MOVEDB_HELP_OPTS, "    -help [EXISTING_PATCHEDWC|SRCHOME|SINGLEINSTANCEDB|ROLLING|NONROLLING|BATCHES|SMARTMOVE|SKIPPREREQ]      Context sensitive options for various use cases. Examples of usage may not include all non-mandatory options."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_135, MOVEDB_SKIPPREREQ_PURPOSE, "\nSkip the pre-req checks and start the database in upgrade mode for patching \n"
// *Document: No
// *Cause:    Status message
// *Action:   Not an error
/
_136, USAGE_MOVEDB_SKIPPREREQ,  "Usage: rhpctl move database {-sourcewc <workingcopy_name> | -sourcehome <oracle_home_path>} -patchedwc <workingcopy_name> -nonrolling -skipprereq"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_137, DEFINE_SKIPPREREQ_OPTION, "    -skipprereq          skip the pre-req checks and start the database in upgrade mode for patching"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_138, USAGE_IMAGE_REPLICATE,  "Usage: rhpctl replicate image -image <image_name>  -client <client_cluster_name> "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_139, USAGE_IMAGE_INSTANTIATE,  "Usage: rhpctl instantiate image {-image <image_name> | -series <series_name> | -imagetype <image_type> | -all } -client <client_cluster_name> "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_140, DEFINE_HOME_TYPE, "    -imagetype <image_type>                     The software type, ('ORACLEDBSOFTWARE' (default) for Oracle Database software, 'ORACLEGISOFTWARE' for Oracle Grid Infrastructure software, ORACLEGGSOFTWARE for Oracle GoldenGate software, and 'SOFTWARE' for all other software. For a custom image type, use the image type name.)"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_141, DEFINE_SCHEDULE, "    -schedule { <timer_value> | NOW }                Preferred time to execute the operation. If an absolute timer_value is specified, it should be in ISO-8601 format. For example: 2016-12-21T19:13:17+05.   If offset is specified as the timer value, it should be in the format +dd:mm:yy:hh:mm:ss.  For example: +02:22:22. If NOW is specified, job will be scheduled immediately."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_142, DEFINE_BACKUP_USER, "    -backupuser <user_name>     name of the user allowed to backup or restore database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_143, DEFINE_WALLET, "    -wallet <file>                Name of the wallet file "
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_144, DEFINE_LOCATION, "    -location <zipped_home_path>        Location of the compressed image file on the target"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_145, DEFINE_LOCAL_MOUNT, "    -localmount       Provision from locally mounted compressed image file"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_146, USAGE_WORKINGCOPY_ADD,  "Usage: rhpctl add workingcopy -workingcopy <workingcopy_name> {-image <image_name> | -series <series_name>} [-oraclebase <oraclebase_path>] [-path <where_path>] [-localmount [-location <zipped_home_path>]] [-storagetype {NFS | LOCAL | RHP_MANAGED}] [-user <user_name>] [-dbname <unique_db_name> [-dbtype {RACONENODE | RAC | SINGLE}] [-datafileDestination <datafileDestination_path>] [-dbtemplate {<file_path> | <image_name>:<relative_file_path>}]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_147, USAGE_ADD_PDB,  "Usage: rhpctl addpdb database -workingcopy <workingcopy_name> -cdbname <cdb_name> -pdbname <new_pdb_name> [-pdbdatafiledestination <pdb_data_files_directory>] [-pdbadminusername <pdb_admin_user_name>] [-dbcaresponsefile <responsefilename>] [-root | -cred <cred_name> | -sudouser <username> -sudopath <sudo_binary_path>] [-targetnode <node_name>] [-schedule <timer_value>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_148, DEFINE_PDBFILE_OPTION, "    -pdbdatafiledestination <pdb_data_files_directory>        Complete directory path to the new PDB data files"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_149, DEFINE_PDBADMINUSERNAME_OPTION, "    -pdbadminusername <pdb_administrator_name>        name of the PDB's local administrator"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_150, DEFINE_DBCARESPONSEFILE_OPTION, "    -dbcaresponsefile <responsefilename>        response file name"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_151, DEFINE_CDBNAME_OPTION, "    -cdbname <cdb_name>                Name of the multitenant container database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_152, DEFINE_PDBNAME_OPTION, "    -pdbname <new_db_name>             Name of the pluggable database"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_153, USAGE_DELETE_PDB,  "Usage: rhpctl deletepdb database -workingcopy <workingcopy_name> -cdbname <cdb_name> -pdbname <pdb_name> [-root | -cred <cred_name> | -sudouser <username> -sudopath <sudo_binary_path>] [-targetnode <node_name>] [-schedule <timer_value>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_155, DEFINE_DBUAARGS, "    -dbuaargs <dbua_arguments>       Double-quoted string containing optional arguments for DBUA"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_156, USAGE_MOVE_DATABASE,  "Usage: rhpctl move database -patchedwc <workingcopy_name> {{-sourcewc <workingcopy_name> | -sourcehome <oracle_home_path> [-oraclebase <oraclebase_path>] [-client <cluster_name>]} [-dbname <db_name_list> | -excludedblist <db_name_list>] [-nonrolling | -forcerolling | -batches <list of batches> | -smartmove [-saf <availability>] [-separate]] [-eval] [-schedule <timer_value>] [-ignoremissingpatches <patch_name1>[,<patch_name2>...]]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_157, USAGE_MOVE_DATABASE_PART2, "[-ignorewcpatches] [-keepplacement] [-disconnect [-noreplay]] [-drain_timeout <time>] [-stopoption <stop option>] [-nodatapatch] [-targetnode <target_node_name>] [-notify [-cc <users_list>]] | -continue [-skip] | -revert | -abort} [-sudouser <sudo_user_name> -sudopath <sudo_binary_location> | -root | -cred <cred_name> | -auth <plugin_name> [-arg1 <name1>:<value1> [-arg2 <name2>:<value2>...]]] [-useractiondata <user_action_data>] [-dbsinparallel <number_of_instances>] [-raconetimeout <timeout>]"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_158, DEFINE_STAGGER, "    -dbsinparallel <number_of_instances>     Number of database instances that can be started in parallel on a given node."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_159, DEFINE_RACONETIMEOUT, "    -raconetimeout <timeout>  RAC One Node database relocation timeout in minutes."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_160, DEFINE_ZDMIMAGETYPE_NAME, "    -imagetype <image_type>            Name of the useraction imagetype"
//  *Document: No 
//  *Cause: Status message 
// *Action: Not an error 
/
_161, DEFINE_PHASE_OPTION, "    -phase <phase of operation>   Operation phase for which the user action is configured"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_162, DEFINE_IGNORE, "    -ignore  {ALL|WARNING|PATCH_CHECK}   Ignore all checks or specific type of checks"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_163, DEFINE_TDE_KEYSTOREPASSWD, "    -tdekeystorepasswd            TDE keystore password, required for password based keystore/wallet"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_164, DEFINE_TDE_MASTERKEY, "    -tdemasterkey            TDE master encryption key"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_165, DEFINE_SRC_ROOT, "    -srcroot                Use root credentials to access the source node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_166, DEFINE_SRC_SUDOUSER, "    -srcsudouser <username>            perform super user operations as sudo user name on the source node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_167, DEFINE_SRC_SUDOPATH, "    -srcsudopath <sudo_binary_path>           location of sudo binary on the source node"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
_168, DEFINE_LISTPHASES, "    -listphases      List of phases for this operation"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/

