// Copyright (c) 2015, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    CskmMsg.msg
//
// DESCRIPTION
//    Message file for Cluster Security Key Manager.
//
// NOTES
//    Numbers ranges:
//    - Common:         1000-1099
//    - crskeytoolctl   1100-1199
//
//    MODIFIED    (MM/DD/YY)
//     gmaldona    05/21/18 - Add OraPKIUtil's messages
//     lluis       11/01/17 - Modify copycacerts messages.
//     lluis       10/25/17 - Fix bug 27003584.
//     lluis       02/29/16 - Creation
//
// PACKAGE=package oracle.cluster.jwccred.resources;
// MSGIDTYPE=interface
//
1000, COMMON_INVALID_OPTION, "invalid command line option {0}"
// *Cause: The requested operation was rejected because of the indicated command
//         line option was invalid.
// *Action: Review the command usage and retry using valid options.
/
1001, COMMON_INVALID_NUMBER_ARGS, "invalid number of arguments for the command line option {0}"
// *Cause: The requested operation was rejected because of the number of
//         arguments supplied was invalid for the specified command line option.
// *Action: Review the command usage and retry using the correct number of
//          arguments.
/
1002, COMMON_INVALID_INPUT_ARGS, "invalid input arguments for the command line option {0}"
// *Cause: The requested operation was rejected because the arguments supplied
//         were invalid for the specified command line option.
// *Action: Review the command usage and retry using valid arguments.
/
1003, COMMON_UNEXPECTED_ERROR, "Unexpected error: {0}"
// *Cause: The requested command execution failed unexpectedly. The appended
//         error from the Java Virtual Machine provides detailed failure
//         information.
// *Action: Retry the command, and if the error persists, contact Oracle Support
//          Services.
/
1004, COMMON_CRSD_OFFLINE, "Request failed; Cluster Ready Services not available."
// *Cause: Command execution failed because Cluster Ready Services was not
//         running on the local node.
// *Action: Start Cluster Ready Services on the local node and retry the
//          command.
/
1005, ORAPKI_CREATE_WALLET, "Failed to create wallet: {0}"
// *Cause: An error occurred while performing wallet operation.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry, and if the error persists, contact Oracle 
//          Support Services.
/
1006, ORAPKI_OPERATION, "Failed to perform operation on wallet: {0}"
// *Cause: An error occurred while performing wallet operation.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry, and if the error persists, contact Oracle 
//          Support Services.
/
1100, CRSKEYTOOLCTL_COMMAND_USAGE, "Usage: crskeytoolctl [<command>] | -help\n\n  Commands are:\n    -printrootcert : Prints the cluster root public certificate to a file in the printable encoding format defined by the Internet RFC 1421 Certificate Encoding Standard. \n\n    -copycacerts : Copies the JRE cacerts file. Prompts for the JRE cacerts password."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1101, CRSKEYTOOLCTL_REKEY_SUCCEEDED, "Node rekey action ran successfully."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1102, CRSKEYTOOLCTL_REKEY_FAILED, "error while performing node rekey action"
// *Cause: A node rekey action failed because of an unexpected error. The
//         accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry the command.
/
1103, CRSKEYTOOLCTL_EXPORTTRUSTCERTS_SUCCEEDED, "Cluster trusted certificates exported to file {0}."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1104, CRSKEYTOOLCTL_EXPORTTRUSTCERTS_FAILED, "error while exporting cluster trusted certificates to file {0}"
// *Cause: An attempt to export the cluster trusted certificates failed because
//         of an unexpected error. The accompanying error messages provide
//         detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry the command.
/
1105, CRSKEYTOOLCTL_GENNODEKEY_SUCCEEDED, "Node key generated in file {0}."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1106, CRSKEYTOOLCTL_GENNODEKEY_FAILED, "error while generating node key in file {0}"
// *Cause: An attempt to generate the node key failed because of an unexpected
//         error. The accompanying error messages provide detailed failure
//         information.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry the command.
/
1107, CRSKEYTOOLCTL_PRINTROOTCERT_SUCCEEDED, "Cluster root public certificate printed to file {0}."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1108, CRSKEYTOOLCTL_PRINTROOTCERT_FAILED, "error while printing cluster root public certificate to file {0}"
// *Cause: An attempt to print the cluster root public certificate failed
//         because of an unexpected error. The accompanying error messages
//         provide detailed failure information.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry the command.
/
1109, CRSKEYTOOLCTL_GENROOTKEY_SUCCEEDED, "Cluster root certificate generated successfully."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1110, CRSKEYTOOLCTL_GENROOTKEY_FAILED, "error while generating cluster root certificate"
// *Cause: An attempt to generate the cluster root certificate failed because of
//         an unexpected error. The accompanying error messages provide detailed
//         failure information.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry the command.
/
1111, CRSKEYTOOLCTL_COPYCACERTS_SUCCEEDED, "JRE cacerts copied to file {0}."
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
1112, CRSKEYTOOLCTL_COPYCACERTS_FAILED, "error while copying the JRE cacerts to file {0}"
// *Cause: An attempt to copy the JRE cacerts file failed because of an
//         unexpected error. The accompanying error messages provide detailed
//         failure information.
// *Action: Examine the accompanying error messages for details, resolve the
//          issues raised and retry the command.
/
1113, CRSKEYTOOLCTL_JRE_CACERTS_PASSWD_PROMPT, "Enter JRE cacerts truststore password: "
// *Document: No.
// *Cause: Output message.
// *Action: None.
/
