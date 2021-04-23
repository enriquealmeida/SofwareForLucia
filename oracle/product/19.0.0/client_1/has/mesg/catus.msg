// Copyright (c) 2012, 2019, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    CatMsg.msg
//
// DESCRIPTION
//    Message file for Console Application Tools
//
// NOTES
//    Numbers ranges:
//    - Common:                  1000-1099
//    - qosctl:                  1100-1199
//    - policy switcher/updater: 1200-1299
//    - watcher:                 1300-1399
//    - keytool:                 1400-1499-NOT USED
//    - vmcputool:               1501-1509
//
//    MODIFIED    (MM/DD/YY)
//     gmaldona    03/01/19 - Backport gmaldona_bug-29018680 from main
//     gmaldona    02/28/19 - Backport gmaldona_bug-27760043 from main
//     gmaldona    11/28/18 - Add -jmxstart and -jmxstop
//     gmaldona    04/11/18 - Change usage for qosctl to add command
//                            historical metrics. Add error messages related
//                            with this option.
//     ereier      08/31/16 - Change usage for qosctl to add command
//                            updatepolicyset, other changes for update policy
//                            set addition to command set
//     jmunozn     04/12/16 - Add error message for authorization in qosctl
//     lluis       03/09/16 - Move 14XX messages to CskmMsg.msg in jwccred
//                            package; mark them here as removed.
//     srghosha    02/12/16 - add msg for vm cpu info overriding activities
//     lluis       01/29/16 - Add messages 1409, 1410. Fix 14XX line length.
//     jmunozn     01/19/16 - Add command usage for unsupported platforms
//     lluis       11/23/15 - Add crskeytoolctl messages
//     gmaldona    09/08/15 - Use qosmserver instead of oc4j on errors 1200-1299
//     jmunozn     05/12/15 - Add root scripts messages for qosctl
//     gmaldona    05/22/14 - Add -activatepolicy into qosctl usage help.
//                            Add message 1211
//     jmunozn     09/05/13 - Add messages 1004 and 1115
//     jmunozn     09/28/12 - Add message 1114
//     gmaldona    06/01/12 - Add policy switch messages
//     jmunozn     06/15/12 - Creation
//
// PACKAGE=package oracle.cluster.consoleapps.resources;
// MSGIDTYPE=interface
//
1000, COMMON_INVALID_OPTION, "Invalid command line option {0}"
// *Cause: The command line option supplied was invalid.
// *Action: Review the command usage and use a valid option.
/
1001, COMMON_INVALID_NUMBER_ARGS, "Incorrect number of arguments for the command line option {0}"
// *Cause: The number of arguments supplied was invalid for the specified command line option.
// *Action: Review the command usage and use the correct syntax.
/
1002, COMMON_INVALID_INPUT_ARGS, "Invalid input arguments for the command line option {0}"
// *Cause: The arguments supplied were invalid for the specified command line option.
// *Action: Review the command usage and use the correct input arguments.
/
1003, COMMON_UNEXPECTED_ERROR, "Unexpected error: {0}"
// *Cause: Command execution failed due to an unexpected error.
// *Action: If the error persists, contact Oracle Support Services.
/
1004, COMMON_CRSD_OFFLINE, "Cluster Ready Services is not running on the local node"
// *Cause: Command execution failed due to Cluster Ready Services was not running on the local node.
// *Action: Start Cluster Ready Services on the local node and retry the command.
/
1005, COMMON_INVALID_ARGUMENT, "The {0} is not a valid argument for the command-line option {0}."
// *Cause: The argument supplied was invalid for the specified command-line option.
// *Action: Review the command usage and use the correct syntax.
/
1006, COMMON_MISSING_ARGUMENT, "The {0} are required arguments for the command-line option {0}."
// *Cause: There were missing arguments for the specified command-line option.
// *Action: Review the command usage and use the correct syntax.
/
1007, COMMON_MISSING_VALUE_ARG, "Values for {0} are required for the command-line option {0}."
// *Cause: There were arguments without values for the specified command-line option.
// *Action: Review the command usage and use the correct syntax.
/
1008, COMMON_QOS_NOT_RUNNING, "The Quality of Service Management (QoS) server is not online."
// *Cause: An attempt to switch the active policy found that the Quality of Service Management (QoS) server resource 'qosmserver' was not online.
// *Action: Start the Quality of Service Management (QoS) server resource 'qosmserver' using the 'srvctl start qosmserver' command and retry the original command.
/
1009, COMMON_QOS_NOT_AVAILABLE, "The Quality of Service Management (QoS) server resource 'qosmserver' does not exist."
// *Cause: An attempt to switch the active policy found that the Quality of Service Management (QoS) server resource 'qosmserver' does not exist.
// *Action: Create the Quality of Service Management (QoS) server resource using the 'srvctl add qosmserver' command.
/
1100, QOSCTL_INVALID_USER, "Invalid user {0}"
// *Cause: The authentication failed because the QoS Management user name does not exist.
// *Action: Specify an existing QoS Management user name.
/
1101, QOSCTL_AUTH_FAILED, "Invalid authentication for user {0}"
// *Cause: The authentication failed for the specified user.
// *Action: Enter the valid password for the specified user.
/
1102, QOSCTL_USER_EXISTS, "User {0} already exists."
// *Cause: The request to add a new QoS Management user failed because the user name already exists.
// *Action: Specify a new QoS Management user name.
/
1103, QOSCTL_USER_NOT_EXISTS, "User {0} does not exist."
// *Cause: The request to modify or delete the QoS Management user failed because the user name does not exist.
// *Action: Specify an existing QoS Management user name.
/
1104, QOSCTL_REQUIRED_USER, "Operation not permitted; {0} is a required user."
// *Cause: The request to delete the user failed because required users cannot be deleted.
// *Action: Specify a previously added user name.
/
1105, QOSCTL_PASSWORD_UNMATCHED, "Passwords do not match."
// *Cause: The passwords supplied did not match each other.
// *Action: Enter matching passwords.
/
1106, QOSCTL_COMMAND_USAGE, "Usage: qosctl [<qos_admin_user> <command>] | -help\n\n  General:\n    This tool should be executed as the Oracle Grid Infrastructure User.\n\n    <qos_admin_user> - QoS authenticated user. The user's password will be prompted for.\n\n  Commands are:\n    -adduser <username> |\n    -listusers |\n    -remuser <username> |\n    -setpasswd <username> |\n    -activatepolicy <policyname> |\n    -updatepolicyset |\n    -gethistory --start_date 'YYYY-MM-DD HH:mm' --end_date 'YYYY-MM-DD HH:mm' --output_dir <output directory>|\n    -startjmx\n    -stopjmx\n    -help"
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1107, QOSCTL_ADMIN_PROMPT, "QoS administrator password: "
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1108, QOSCTL_NEW_PASSWD_PROMPT, "New password: "
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1109, QOSCTL_CONFIRM_PASSWD_PROMPT, "Confirm new password: "
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1110, QOSCTL_USER_PASSWD_PROMPT, "Enter password: "
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1111, QOSCTL_USER_ADDED, "User {0} added successfully."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1112, QOSCTL_USER_MODIFIED, "User {0} modified successfully."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1113, QOSCTL_USER_REMOVED, "User {0} removed successfully."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1114, QOSCTL_CREDENTIALS_NOT_FOUND, "The credentials for user {0} do not exist."
// *Cause: The credentials for the specified user were not found in the shipped system-jazn-data.xml file.
// *Action: Contact Oracle Support Services.
/
1115, QOSCTL_OP_DENIED_OC4J_RUNNING, "cannot perform the operation because the OC4J resource is running"
// *Cause: The operation could not be performed because the OC4J resource was running.
// *Action: Stop the OC4J resource and then retry the operation.
/
1120, QOSCTL_RSC_SUCCEEDED, "QoS Management users generated correctly."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1121, QOSCTL_RSC_FAILED, "unexpected error generating QoS Management users:\n{0}"
// *Cause: The QoS Management users were not generated correctly.
// *Action: Correct the problem indicated in the accompanying message and then retry.
/
1122, QOSCTL_USP_COMMAND_USAGE, "Quality of Service Management (QoS) is not supported on this platform."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1123, QOSCTL_UNAUTHORIZED_USER, "The current user is not authorized to execute the command line option {0}."
// *Cause: The current user executing qosctl was not authorized to execute the
//         indicated command line option.
// *Action: Retry executing qosctl as the Oracle Grid Infrastructure User.
/
1200, SWITCHPOLICY_USAGE, "Usage:\n    activatepolicy.sh -user <user_name> -policy <policy_name>\nParameters:\n    -user      <user_name>   Name of the user.\n    -policy    <policy_name> Name of the policy to activate.\n                             Policy names containing spaces need to be quoted. \nOther options:\n    -h, -help  Prints the activatepolicy usage information\n"
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1201, SWITCHPOLICY_INCORRECT_NUM_ARGS, "incorrect number of arguments"
// *Cause: An incorrect number of command line arguments was specified.
// *Action: Review the command usage and use the correct input arguments.
/
1202, SWITCHPOLICY_UN_EXPECTED_ARGUMENT, "invalid argument: {0}"
// *Cause: An invalid command line argument was specified.
// *Action: Review the command usage and use the correct input arguments.
/
1203, SWITCHPOLICY_USER_NOT_AUTHORIZED, "User {0} is not authorized to execute this command."
// *Cause: The specified user did not have sufficient privileges to execute the command.
// *Action: Specify an existing user in the credential store with sufficient privileges as indicated in the accompanying messages.
/
1204, SWITCHPOLICY_USER_NOT_FOUND, "User name {0} does not exist."
// *Cause: The specified user was not found in the credential store.
// *Action: Specify an existing user in the credential store.
/
1205, SWITCHPOLICY_WALLET_NOT_FOUND, "The credential store APPQOSADMIN does not exist."
// *Cause: The credential store type APPQOSADMIN was not found.
// *Action: Contact Oracle Support Services for assistance.
/
1206, SWITCHPOLICY_POLICY_NOT_FOUND, "The policy name {0} does not exist."
// *Cause: The specified policy name did not exist in the current policy set.
// *Action: Specify a policy name that exists within the current policy set.
/
1207, SWITCHPOLICY_OC4J_NOT_RUNNING, "The Quality of Service Management (QoS) server is not online."
// *Cause: An attempt to switch the active policy found that the Quality of Service Management (QoS) server resource 'qosmserver' was not online.
// *Action: Start the Quality of Service Management (QoS) server resource 'qosmserver' using the 'srvctl start qosmserver' command and retry the original command.
/
1208, SWITCHPOLICY_OC4J_NOT_AVAILABLE, "The Quality of Service Management (QoS) server resource 'qosmserver' does not exist."
// *Cause: An attempt to switch the active policy found that the Quality of Service Management (QoS) server resource 'qosmserver' does not exist.
// *Action: Create the Quality of Service Management (QoS) server resource using the 'srvctl add qosmserver' command.
/
1209, SWITCHPOLICY_INSTANCE_NOT_FOUND, "The Quality of Service Management (QoS) server is not running in the 'qosmserver' resource."
// *Cause: An attempt to switch the active policy found that the Quality of Service Management (QoS) server is not running in the 'qosmserver' resource.
// *Action: Contact Oracle Support Services.
/
1210, SWITCHPOLICY_TOO_MANY_INSTANCES, "QoS Management server has multiple instances."
// *Cause: Multiple Quality of Service Management (QoS) servers were found.
// *Action: Contact Oracle Support Services.
/
1211, SWITCHPOLICY_LOG_LEVEL, "The log level {0} is not valid."
// *Cause: An error was encountered during trace logging because the environment variable QOS_TRACE_LEVEL was not set to a valid log level.
// *Action: Specify a valid log level in the QOS_TRACE_LEVEL environment variable. The valid values are OFF, SEVERE, WARNING, INFO, CONFIG, FINE, FINER, FINEST, and ALL. If the problem persists, contact Oracle Support Services.
/
1300, WATCHER_HIST_MET_DATE_FORMAT_INI, "The start datetime argument is not valid."
// *Cause: The start datetime specified was not using the format YYYY-MM-DD HH:mm.
// *Action: Correct the start datetime argument.
/
1301, WATCHER_HIST_MET_DATE_FORMAT_END, "The end datetime argument is not valid."
// *Cause: The end datetime specified was not using the format YYYY-MM-DD HH:mm.
// *Action: Correct the end datetime argument.
/
1302, WATCHER_HIST_MET_DATE_INI_GT_END, "The start datetime is after to the end datetime."
// *Cause: The start datetime specified was after to the end datetime.
// *Action: Specify a start datetime before to the end datetime.
/
1303, WATCHER_HIST_MET_OUTPUT_DIR_MISSING, "The output directory is missing."
// *Cause: The output directory name was not provided.
// *Action: Specify an output directory name.
/
1305, WATCHER_HIST_MET_OUTPUT_DIR_NOTEMPTY, "The output directory {0} is not empty."
// *Cause: The output directory was not empty.
// *Action: Specify a different output directory or delete the files in that directory.
/
1306, WATCHER_HIST_MET_SUCCEEDED, "The history metrics generated correctly."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
/ message 1400 has been removed - do not reuse message number
1400, CRSKEYTOOLCTL_COMMAND_USAGE, ""
// *Document:
// *Cause:
// *Action:
/
/ message 1401 has been removed - do not reuse message number
1401, CRSKEYTOOLCTL_REKEY_SUCCEEDED, ""
// *Document:
// *Cause:
// *Action:
/
/ message 1402 has been removed - do not reuse message number
1402, CRSKEYTOOLCTL_REKEY_FAILED, ""
// *Cause:
// *Action:
/
/ message 1403 has been removed - do not reuse message number
1403, CRSKEYTOOLCTL_EXPORTTRUSTCERTS_SUCCEEDED, ""
// *Document:
// *Cause:
// *Action:
/
/ message 1404 has been removed - do not reuse message number
1404, CRSKEYTOOLCTL_EXPORTTRUSTCERTS_FAILED, ""
// *Cause:
// *Action:
/
/ message 1405 has been removed - do not reuse message number
1405, CRSKEYTOOLCTL_GENNODEKEY_SUCCEEDED, ""
// *Document:
// *Cause:
// *Action:
/
/ message 1406 has been removed - do not reuse message number
1406, CRSKEYTOOLCTL_GENNODEKEY_FAILED, ""
// *Cause:
// *Action:
/
/ message 1407 has been removed - do not reuse message number
1407, CRSKEYTOOLCTL_PRINTROOTCERT_SUCCEEDED, ""
// *Document:
// *Cause:
// *Action:
/
/ message 1408 has been removed - do not reuse message number
1408, CRSKEYTOOLCTL_PRINTROOTCERT_FAILED, ""
// *Cause:
// *Action:
/
/ message 1409 has been removed - do not reuse message number
1409, CRSKEYTOOLCTL_GENROOTKEY_SUCCEEDED, ""
// *Document:
// *Cause:
// *Action:
/
/ message 1410 has been removed - do not reuse message number
1410, CRSKEYTOOLCTL_GENROOTKEY_FAILED, ""
// *Cause:
// *Action:
/



1501, VMCPUCTL_COMMAND_USAGE, "Usage: vmcpu  <command>  [<options>]\n    commands: add|update|delete|list|help \n"
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
/ Translation note:  {0} is a CLI literal, one of: add, update, or delete.
1502, VMCPUCTL_COMMAND_OK, "Requested '{0}' operation completed successfully."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
/ Translation note:  {0} is a CLI literal, one of: add, update, or delete.
1503, VMCPUCTL_COMMAND_ERROR, "Operation '{0}' was not performed."
// *Cause: The requested operation was rejected either due to a connectivity problem or due to a data discrepancy.
// *Action: Examine the logs and if the problem was due to a data discrepancy, issue the 'vmcpu list' command.
/
1504, VMCPUCTL_COMMAND_DELETE_USAGE, "Missing mandatory option -hostname.\n  Usage: vmcpu  delete -hostname <hostname>."
// *Cause: An attempt to delete a CPU from a VM host was rejected because the mandatory option -hostname was not specified.
// *Action: Reissue the 'vmcpu  delete' command supplying the -hostname option.
/
1505, VMCPUCTL_COMMAND_POPULATE_USAGE, "The 'vmcpu' command with  'add' or 'update' should have only these three mandatory options -hostname, -cores, and -strands."
// *Cause: An attempt to add or update a cpu for a VM host was rejected because the options specified were not appropriate.
// *Action: Reissue the command supplying only mandatory options -hostname, -cores, and -strands.
/
1506, VMCPUCTL_STRAND_CORE_VALIDATION, "Number of cores should not be more than number of strands."
// *Cause: Number of cores was more than number of strands.
// *Action: Reissue the command supplying strands not less than number of cores.
/
1507, VMCPUCTL_MISSING_MANDATORY_PARAM, "Mandatory '{0}' option is missing."
// *Cause: Requested operation was rejected because the indicated mandatory option was not supplied.
// *Action: Reissue the command supplying the mandatory options indicated in the 'readme' file .
/
/ Translation note:  {0} is -strands or -cores.
1508, VMCPUCTL_POSITIVE_NUMBER_VALIDATION, "The value supplied to the {0} option is not a positive integer."
// *Cause: An attempt to add or update a cpu for a VM host was rejected because the value specified for strands or cores was not a positive number.
// *Action: Reissue the command supplying a positive number as value of strands or cores.
/
1509, VMCPUCTL_STRAND_CORE_RATIO_VALIDATION, "Strand count is not a multiple of core count."
// *Cause: An attempt to add or update a cpu for a VM host was rejected because the value specified for strand count was not a multiple of that specified for core count.
// *Action: Reissue the command specifying strand count as a multiple of core count.
/
