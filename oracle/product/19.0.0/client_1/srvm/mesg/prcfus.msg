// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCfMsg.msg
//
// DESCRIPTION
//    Message file for the File Transfer API (the "f" in the PrCfMsg.msg stands for File transfer).
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     ccharits    01/31/18 - Added message UNABLE_TO_CHECK_IF_DIR_IS_WRITABLE
//     ccharits    07/21/17 - Added messages for local transfer
//     ccharits    03/30/17 - Added message TOO_MANY_ERRORS
//     chchatte    03/25/16 - Add new line prior to error details for 2056
//     ccharits    03/08/16 - Added message ERRORS_PER_NODE
//     chchatte    03/03/16 - bug 21846157
//     ccharits    02/02/16 - Added GENERIC_TRANSFER_ERROR
//     ekucukog    11/18/15 - Fix bug 21420552
//     ccharits    06/15/15 - Added message DUPLICATE_NODENAME
//     chchatte    04/13/15 - Useraction execution
//     ccharits    03/23/15 - Improved diagnostics
//     satg        02/02/15 - added mttrans time out messages
//     ccharits    01/26/15 - Added message FILE_COPY_ERROR
//     ccharits    11/27/14 - Added messages
//                            MULTINODE_NON_PASSWORDLESS_TRANSFER_NOT_ALLOWED,
//                            REMOTE_EXECUTION_ERROR
//     satg        11/25/14 - added mttrans error messages
//     ccharits    10/07/14 - Added messages for mttrans
//     chchatte    10/02/14 - Added oracle.cluster.remote messages
//     ccharits    02/11/14 - Message CREATING_TRANSFER_PLAN is not is use any
//                            more
//     ccharits    09/05/13 - Fixed bug 17388028
//     ccharits    09/03/13 - Added messages CREATING_TRANSFER_PLAN,
//                            TRANSFERRING_DATA_TO_NODES and PERCENT_COMPLETE
//     ccharits    05/31/13 - Added message WORKLOAD_DISTRIBUTION_PROCESS_ERROR
//     ccharits    05/10/13 - Added message FILE_WRITE_FAILED
//     ccharits    02/02/11 - Added messages NON_EXISTING_PATHNAME,
//                            TOP_DIR_NOT_A_DIR_SYMLINK and PATHNAME_IS_TOO_LONG
//     agridnev    09/03/09 - XbranchMerge agridnev_bug-8760749 from
//                            st_has_11.2.0.1.0
//     agridnev    08/14/09 - fixed bug 8760749
//     yizhang     05/31/09 - fix messages
//     ccharits    10/13/08 - Creation
//  */
// 
// PACKAGE=package oracle.cluster.resources;
1001, DIR_NOT_EXISTS, "The directory \"{0}\" does not exist"
//  *Cause: A directory that did not exist was chosen for the top-level directory of the directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1002, TOP_DIR_NOT_A_DIR, "Source directory \"{0}\" is not a directory"
//  *Cause: An existing file which was not a directory was provided as top-level directory.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1003, FILE_NOT_FOUND, "The file \"{0}\" does not exist" 
//  *Cause: The file was not found in the file system.
// *Action: Make sure that the file exists in the file system.
/
1004, LINK_DEST_NOT_FOUND, "The link destination \"{0}\" does not exist" 
//  *Cause: The link destination was not found in the file system.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1005, CONFLICT_WITH_EXCLUDE_LIST, "\"{0}\" conflicts with the exclude-list" 
//  *Cause: The pathname (directory, file or symbolic link pathname) to add to the directory map could not be added as it conflicted with the exclude list.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1006, DIR_EXISTS_IN_DIRECTORY_MAP, "The directory \"{0}\" exists already in the directory map" 
//  *Cause: The directory existed already in the directory map.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1007, FILE_EXISTS_IN_DIRECTORY_MAP, "The file \"{0}\" exists already in the directory map" 
//  *Cause: The file existed already in the directory map.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1008, LINK_EXISTS_IN_DIRECTORY_MAP, "The link \"{0}\" exists already in the directory map" 
//  *Cause: The link existed already in the directory map.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1009, PARENT_DIR_NOT_EXISTS, "The parent of \"{0}\" does not exist" 
//  *Cause: The parent directory of the content (directory, file or symbolic link) that was being processed did not exist.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1010, NOT_A_DIR, "\"{0}\" is not a directory" 
//  *Cause: The indicated object was expected to be a directory, but it was not.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1011, REMOVE_CONTENT_IMPOSSIBLE, "Cannot remove \"{0}\" as the directory map does not contain it"
//  *Cause: The content (i.e., directory, file or symbolic link) could not be removed from the directory map as it did not exist there.
// *Action: No action. This is just to let the user know that no action is taken as the task is already complete.
/
1012, BUILD_ADD_LIST_ERRORS, "The following contents (directories, files or symbolic links)  cannot be included to to the list of contents to add to the directory map: {0}"
//  *Cause: The contents that could not be included to the add-list were those which conflicted with the exclude-list (see the accompanying PRCF-1005 message).
// *Action: No action. This is just to let the user know about the conflicts with the exclude-list.
/
1013, NO_DIR_MAP_ENTRY, "The directory map has no entry"
//  *Cause: The user tried to acquire information about an empty directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1014, CONTENT_ADDITION_IMPOSSIBLE_NO_DIR_MAP, "Cannot add \"{0}\" as there is no directory map"
//  *Cause: The user tried to add a content (i.e., directory, file or symbolic link) to an empty directory map. This operation is allowed only if there is a directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1015, CONTENT_ADDITION_IMPOSSIBLE_CONTENT_NOT_FOUND, "Cannot add \"{0}\" to the directory map as \"{0}\" does not exist" 
//  *Cause: The content to add to the directory map was not found in the file system.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1016, CONTENT_REMOVAL_IMPOSSIBLE_NO_DIR_MAP, "Cannot remove \"{0}\" as there is no directory map"
//  *Cause: The user tried to remove a content (i.e., directory, file or symbolic link) from an empty directory map. This operation is allowed only if there is a directory map.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1017, CONTENT_REMOVAL_IMPOSSIBLE_CONTENT_NOT_FOUND, "Cannot remove \"{0}\" from the directory map as \"{0}\" does not exist" 
//  *Cause: The content to remove from the directory map was not found in the file system.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1018, EXCEPTION_DETAILS, "Exception encountered. Details: {0}" 
//  *Cause: An unexpected error condition was detected during reading the exclude-list or include-list file.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services. 
/
1019, UNIX_SUPPORT_ONLY, "The API supports only Unix OS" 
//  *Cause: The user was running on Windows OS.
// *Action: Make sure that the OS is Unix or Linux.
/
1020, NOT_A_FILE, "\"{0}\" is not a file" 
//  *Cause: The content that was expected to be a file which turned out not to be a file.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1021, INVALID_PATHNAME, "\"{0}\" is not a valid pathname"
//  *Cause: The content that was expected to be a valid pathname which turned out to be an invalid one.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1022, NON_EXISTING_PATHNAME, "\"{0}\" does not exist"
//  *Cause: The specified pathname does not exist in the file system.
// *Action: Make sure that the pathname exists in the file system.
/
1023, TOP_DIR_DEAD_SYMLINK, "Symbolic link \"{0}\" points to \"{1}\" which does not exist"
//  *Cause: An existing symbolic link that resolves to a pathname that does not exist.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1024, TOP_DIR_NOT_A_DIR_SYMLINK, "Symbolic link \"{0}\" points to \"{1}\" which is is not a directory"
//  *Cause: An existing symbolic link that resolves to a non-directory pathname was provided as top-level directory.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
1025, FILE_CANNOT_BE_OPENED_FOR_READING, "Error while trying to open file \"{0}\" for reading. Details: {1}"
//  *Cause: An I/O error occurred while trying to open the file for reading.
// *Action: Make sure that the file exists, is a regular file rather than a directory and that the user has read permissions on the file.
//          Also, look at the accompanying error messages for additional details.
/
1026, FILE_READ_ERROR, "Error while reading file \"{0}\". Details: {1}"
//  *Cause: An I/O error occurred while reading or closing the file.
// *Action: Look at the accompanying error messages for additional details.
/
1027, CANNOT_CREATE_FILE_FOR_WRITING, "Error while trying to create file \"{0}\" for writing. Details: {1}"
//  *Cause: An I/O error occurred while trying to create the file for writing.
// *Action: Make sure that if the file exists it is a regular file rather than a directory, if it does not exist it can be created and that the user has write permissions on the file.
//          Also, look at the accompanying error messages for additional details.
/
1028, FILE_WRITE_ERROR, "Error while writing file \"{0}\". Details: {1}"
//  *Cause: An I/O error occurred while writing or closing the file.
// *Action: Look at the accompanying error messages for additional details.
/
1029, DIR_CREATE_ERROR, "Cannot create directory \"{0}\""
//  *Cause: An error occurred while trying to create the directory.
// *Action: Ensure that the user has write permissions on the parent directories in the directory path.
/
1030, INVALID_INPUT_ARG, "Input argument \"{0}\" value is not valid."
//  *Cause: This is an internal error. The value for the specified parameter was null.
// *Action: Contact Oracle Support Services.
/
1031, INVALID_ARRAY_ELEMENT, "Input array element \"{0}\" is not valid."
//  *Cause: This is an internal error. The value for the specified array element was null.
// *Action: Contact Oracle Support Services.
/
1032, INVALID_LIST_ELEMENT, "Input list element \"{0}\" is not valid."
//  *Cause: This is an internal error. The value for the specified list element was null.
// *Action: Contact Oracle Support Services.
/
1033, DUPLICATE_NODENAME, "The node \"{0}\" is duplicated in the input list."
//  *Cause: A node name appeared more than once in the input list.
// *Action: Ensure that each node name is specified once. 
/
2001, CONNECTION_REFUSED, "Connection to host/IP address: {0} -- port: {1} refused"
//  *Cause: Could not establish connection to the provided host/IP address using the port number reported.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2002, CONNECTION_LOST, "Connection to node \"{0}\" is lost"
//  *Cause: The connection to the remote node with the specific node ID was lost.
// *Action: Verify that the remote node (which acts as server) is still up and running. Then do the same for the local node (which acts as client).
/
2003, REPLY_MISMATCH, "Expected \"{0}\" but received \"{1}\""
//  *Cause: The command was not executed successfully. The local node received a reply from the remote node that was different from the expected one.
// *Action: No action. The program should take care of it (i.e., catch the exception and handle it).
/
2004, FILESAVE_DIR_LISTING_PROBLEM, "Problem encountered while saving the directory listing to file \"{0}\". Details : {1}"
//  *Cause: While trying to save the directory listing to a file, the operation could not be completed successfully.
// *Action: If you can correct the problem indicated in the accompanying details, do so and then retry the request. Otherwise, contact Oracle Support Services.
/
2005, MISSMATCH_NODE_NAMES_AND_PORTS, "File transfer cannot proceed because the remote node names do not match the remote node ports"
//  *Cause: An internal error caused a a mismatch between the number of remote nodes and the number of remote node ports.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2006, EMPTY_LIST_OF_REMOTE_NODES, "File transfer cannot proceed because the list of remote nodes is empty"
//  *Cause: An empty list of remote nodes was passed as argument.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2007, PORT_NOT_INTEGER_NUMBER, "Invalid selection for the remote node port. \"{0}\" is not an integer number as expected."
//  *Cause: The port number for the remote node was either not a number at all or not an integer number.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2008, PORT_NUMBER_OUT_OF_EXPECTED_RANGE, "The remote node port number \"{0}\" is out of the expected range [1, 65535]"
//  *Cause: The port number for the remote node was indeed an integer number but either less than 1 or greater than 65535.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2009, NO_REMOTE_NODE, "Cannot proceed with the file transfer. There has to be at least one remote node to send the installer files!"
//  *Cause: The user either provided an empty list of remote nodes or each remote node of the list had invalid format.
// *Action: Make sure that the list of remote nodes is not empty and the remote nodes have valid format.
/
2010, NO_REMOTE_NODE_LEFT_AFTER_CONNECTION_ATTEMPTS, "All connections to the remote nodes got refused. Cannot proceed with the file transfer. There has to be at least one remote node to send the installer files!"
//  *Cause: All the attempts to connect to the remote nodes that had valid format failed.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2011, CANNOT_READ_FILE, "The file \"{0}\" cannot be read successfully"
//  *Cause: The file existed in the file system but could not be read successfully.
// *Action: Make sure that the file is not corrupted. To verify that try to open the file manually and read its contents.
/
2012, TOP_DIR_NOT_FOUND, "The top-level directory \"{0}\" does not exist"
//  *Cause: The top-level directory was not found in the file system.
// *Action: Make sure that the top-level directory exists in the file system.
/
2013, CRS_HOME_NOT_FOUND,"Cannot find the CRS Home"
//  *Cause: The CRS Home did not exist or 'oui' was not a directory under the CRS Home.
// *Action: Make sure that 'oui' is a directory under the CRS Home. Refer to your platform-specific documentation for information about locating the Oracle software inventory.
/
2014, COMMAND_EXECUTION_ERROR,"Executing command \"{0}\" on \"{1}\" failed on node \"{2}\".\n{3}"
//  *Cause: The command ('mkdir', 'mkfile', 'mklink' or 'wrfile') failed while executing on the remote node.
// *Action: Try to fix the problem based on the error message. If the problem still exists, contact Oracle Support Services.
/
2015, COMMAND_ERROR_NOTIFICATION, "One or more commands were not executed successfully on one or more nodes"
//  *Cause: At least one of the commands 'mkdir', 'mkfile', 'mklink' or 'wrfile' failed while executing on one or more remote nodes.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2016, BINARY_NOT_FOUND, "Required binary file \"{0}\" not found"
//  *Cause: The binary file was not found under the expected location.
// *Action: Contact Oracle Support Services.
/
2017, UNSUCCESSFUL_BINARY_EXECUTION_PORT_ERROR, "Node \"{0}\": The transfer binary was not executed successfully as it returned a wrong port number"
//  *Cause: Misbehavior of the transfer binary on the provided node.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2018, UNSUCCESSFUL_BINARY_EXECUTION, "Node \"{0}\": The transfer binary was not executed successfully"
//  *Cause: Unsuccessful execution of the transfer binary.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2019, UNSUCCESSFUL_LOCAL_NODE_NAME_RETRIEVAL, "Cannot retrieve the name for the local node"
//  *Cause: No IP address for the local host could be found.
// *Action: Use the ping command manually to check whether you get a reply from the host or not.
/
2020, UNKNOWN_HOST, "Cannot retrieve the host for node \"{0}\""
//  *Cause: No IP address for the node host could be found.
// *Action: Use the ping command manually to check whether you get a reply from the host or not.
/
2021, NODE_NAME_DEST_DIR_MISMATCH, "There is a mismatch between the number of node names ({0}) and the number of node destination directories ({1})"
//  *Cause: An internal error caused a a mismatch between the number of remote nodes and the number of remote destination directories.
// *Action: Retry the transfer. If the problem still exists, contact Oracle Support Services.
/
2022, FILE_SHRINKING_WITH_TIME, "The file \"{0}\" became smaller while being transferred"
//  *Cause: The indicated source file was smaller following the transfer than
//          when it was initiated. As a result, the resulting file includes
//          contents no longer present in the source.
// *Action: None.
/
2023, NON_READABLE_CONTENTS, "The following contents cannot be transferred as they are non-readable. \nDirectories:\n   {0} \nFiles:\n   {1}"
//  *Cause: The file permissions for the listed contents did not allow the requested operation.
// *Action: Ensure that the user has read permissions on the specified files and directories.
/
2024, NON_READABLE_DIR, "The directory \"{0}\" is not transferred as it is non-readable"
//  *Cause: The file permissions of the listed directory did not allow the requested operation.
// *Action: None.
/
2025, UNEXPECTED_INTERNAL_ERROR, "Internal error: {0}"
//  *Cause: An internal error occurred. The included value is an internal identifier.
// *Action: Contact Oracle Support Services.
/
2026, NAME_IS_TOO_LONG, "File name is too long: {0}"
//  *Cause: An internal error occurred.
// *Action: Ensure that the copy doesn't result in pathnames that are too long, by making sure that the destination directory name is not too long.
/
2027, LINK_IS_TOO_LONG, "Link path is too long: {0}"
//  *Cause: An internal error occurred.
// *Action: Ensure that the copy doesn't result in pathnames that are too long, by making sure that the destination directory name is not too long.
/
2028,LSTAT_FAILED, "Failed to get system information for {0}: {1}"
//  *Cause: An attempt to get system information failed
// *Action: Make sure that the specified file, directory or symbolic link exists. To verify that execute 'ls -l <file>' manually.
/
2029, PARALLEL_TRANSFER_PARTIAL_FAILURE, "The transfer operation completed with partial failures."
//  *Cause: The operation failed to transfer all of the contents to one or more nodes.
// *Action: Look at the accompanying error messages for details.
/
2030, WORKLOAD_DISTRIBUTION_PROCESS_ERROR, "The source and destination directories ({0}) on node {1} are the same."
//  *Cause: The source and destination directory on the node where Java is installed were the same.
// *Action: Ensure that the destination directory is different than the source directory.
/
2031, CREATE_PLAN_FAILED, "Parallel transfer workload distribution error."
//  *Cause: An error occurred while distributing the transfer workload to multiple threads.
// *Action: Look at the accompanying error messages for details.
/
2032, CREATING_TRANSFER_PLAN, ""
//  *Document: 
//  *Cause: 
// *Action: 
/
2033, TRANSFERRING_DATA_TO_NODES, "Transferring data to {0} nodes"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2034, PERCENT_COMPLETE, "{0}% complete"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2035, COPY_FAILED_NODES, "The copy operation failed on the following nodes: {0}."
//  *Cause: The copy operation failed to copy the file or directory to the remote nodes due to an error 
//          in the supplied credentials for the remote node connection or because the user did not have
//          sufficient privileges.
// *Action: Correct the user credentials for the remote node connection and retry the copy operation.
/
2036, COPY_FAILED, "The copy operation failed." 
//  *Cause: The copy operation failed to copy the file or directory to the remote nodes.
// *Action: Examine the accompanying error messages for details.
/
2037, TRANSFER_STATUS_UPDATE, "Completed transfer to node {0} with status {1}. Completed nodes so far: {2} of {3}."
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2038, NODE_STATE_UPDATE, "Current transfer state for node {0}: {1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2039, TRANSFER_ERROR_UPDATE, "Error in transfer to node {0}:\n{1}"
//  *Document: No
//  *Cause: Status message
// *Action: Not an error
/
2040, CANNOT_OPEN_SOCKET, "Error while opening socket. Details:\n{0}"
//  *Cause: An I/O error occurred while opening the socket.
// *Action: Examine the accompanying error message for additional details.
/
2041, CLUSTER_EXCEPTION_MESSAGE, "The transfer failed for all nodes. Details:\n{0}"
//  *Cause: All nodes failed to receive the data due to critical errors.
// *Action: Examine the accompanying error message for additional details.
/
2042, INVALID_CMD_USAGE, "invalid command line syntax, correct syntax:\"{0}\""
//  *Cause: An attempt to execute a command was rejected because the command 
//          syntax was invalid.
// *Action: Examine the usage provided for this command and use the correct syntax.
/
2043, ALLOCATE_FAIL, "failed to allocate memory."
//  *Cause: The attempted operation was unable to complete because insufficient
//          system memory was available.
// *Action: Correct the system memory resources problem and retry.
/
2044, NODEPLAN_PARSE_ERROR, "Failed to parse node plan details. Internal error occured: {0}"
//  *Cause: An internal error occurred. The value displayed is an internal identifier.
// *Action: Contact Oracle Support Services.
/
2045, CANNOT_BIND_SOCKET, "Error while binding socket for node \"{0}\" and port {1}. OS error string: {2}"
//  *Cause: The requested operation could not be completed because an I/O error
//          occurred while attempting to bind the socket to establish the 
//          necessary communication channel.
// *Action: Examine the accompanying error message for additional details, 
//          address issues reported, and retry.
/
2046, CANNOT_LISTEN_SOCKET, "Listen socket could not be created for node \"{0}\" and port {1}. OS error string: {0}"
//  *Cause: The requested operation could not be completed because an I/O error 
//          occurred while attempting to perform a 'listen' the socket to 
//          establish the necessary communication channel.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry.
/
2047, CANNOT_ACCEPT_SOCKET, "Failed to accept socket connection. OS error string: {0}"
//  *Cause: The requested operation could not be completed because an I/O error 
//          occurred while attempting to accept the socket connection to 
//          establish the necessary communication channel.
// *Action: Examine the accompanying error message for additional details, 
//          address issues reported, and retry.
/
2048, INVALID_COMMAND, "Invalid command identified. Details: {0}"
//  *Cause: An internal error occurred. The included value is an internal 
//          identifier. 
// *Action: Contact Oracle Support Services. 
/
2049, CANNOT_CREATE_DIR, "Error while trying to create directory \"{0}\" on node {1}. Details: {2}"
//  *Cause: The requested operation could not be completed because an error 
//          occurred while attempting to create the indicated destination 
//          directory. Either there was already a file or symbolic link with
//          the indicated path that was not a directory, or the directory could
//          not be created. Specific failure data is displayed following the
//          message.
// *Action: If the destination path exists, make sure it is a writable directory
//          rather than a regular file or symbolic link. Otherwise, make sure
//          the user has permissions to create the desired directory. Examine
//          the additional details provided, address issues reported, and 
//          retry.
/
2050, CHOWN_FAIL, "Error while trying to modify permissions for \"{0}\" on node {1}. Details: {2}"
//  *Cause: The requested operation could not be completed because an error 
//          occurred while trying to modify permissions.
// *Action: Make sure that user has appropriate permissions to modify the 
//          directory or regular file or symbolic link, Also, examine the 
//          accompanying error messages for additional details, address issues
//          reported, and retry.
/
2051, LINK_FAIL, "Failed to create link from source path \"{0}\" to destination path \"{1}\" on node {2}. Details: {3}"
//  *Cause: The requested operation could not be completed because an error 
//          occurred while trying to create a link from the indicated source 
//          path to the indicated destination.
// *Action: Examine the accompanying error messages for additional details,
//          address issues reported, and retry.
/
2052, UNLINK_FAIL, "Failed to unlink path \"{0}\" on node {1}. Details: {2}"
//  *Cause: The requested operation could not be completed because an error 
//          occurred while trying to unlink the indicated path.
// *Action: Examine the accompanying error messages for additional details, 
//          address issues reported, and retry.
/
2053, CANNOT_READ_DATA_FROM_SOCKET, "Failed to read data from socket while writing to file \"{0}\" on node {1}. Details: {2}"
//  *Cause: The requested operation could not be completed because an error 
//          occurred while reading data from the socket.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry.
/
2054, FILE_GROWING_WITH_TIME, "The source file \"{0}\" became larger during the transfer."
//  *Cause: The indicated source file continued to grow after the transfer was initiated. Because the transfer
//          size was determined at the start of the operation, the resulting file was not a complete copy of the
//          source.
// *Action: None.
/
2055, FAILED_TO_EXECUTE_TRANSFER_BINARY, "The transferred binary was not executed successfully on node: \"{0}\". Details: {1}"
//  *Cause: The requested operation could not be completed because an error
//          occurred while executing the transferred binary on the indicated node.
//          Specific failure data is displayed following the message.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry. If the problem persists, contact
//          Oracle Support Services.
/
2056, COPY_FAILED_ON_NODE, "The copy operation failed on node: \"{0}\". Details:\n{1}"
//  *Cause: The requested operation could not be completed because an error
//          occurred while copying the file or directory to the indicated node.
//          Either the user did not have credentials for connecting to the node
//          or the user did not have sufficient privileges. Specific failure 
//          data is displayed following the message.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry. If the problem persists, contact
//          Oracle Support Services.
/
2057, FILE_COPY_ERROR, "failed to copy file \"{0}\" to \"{1}\""
//  *Cause: An error occurred while copying the file from the specified path to the
//          indicated destination path.
// *Action: Make sure that the source path exists and that the file has read access
//          permissions and that the target directory has write access permissions.
//          If the problem persists, contact Oracle Support Services.
/
2058, TIMEOUT_TO_EXECUTE_TRANSFER_BINARY, "Timeout occurred while executing transferred binary on node: \"{0}\". Details: {1}"
//  *Cause: The requested operation could not be completed within the time limit while
//          executing the transferred binary on the indicated node.
//          Specific failure data is displayed following the message.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry. If the problem persists, contact
//          Oracle Support Services.
/
2059, COPY_TIMEOUT_ON_NODE, "Timeout occurred during copy operation on node: \"{0}\". Details: {1}"
//  *Cause: The requested operation could not be completed within the time limit.
//          Specific failure data is displayed following the message.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry. If the problem persists, contact
//          Oracle Support Services.
/
2060, TRANSFER_BINARY_EXECUTION_ERROR, "Error executing the transfer binary. Details: {0}"
//  *Cause: An error occurred while executing the transfer binary.
//          Specific failure data is displayed following the message.
// *Action: Examine the accompanying error message for additional details,
//          address issues reported, and retry. If the problem persists, contact
//          Oracle Support Services.
/
2061, MULTINODE_NON_PASSWORDLESS_TRANSFER_NOT_ALLOWED, "Invalid request for user authenticated transfer to multiple nodes."
//  *Cause: A user authenticated transfer was attempted between the local and more than one remote node.
// *Action: Retry the transfer after establishing passwordless communication or use a single remote node.
/
2062, REMOTE_EXECUTION_ERROR, "remote command execution error on node \"{0}\":\n{1}"
//  *Cause: A user authenticated remote execution attempt failed.
// *Action: Examine the accompanying error messages for details.
/
2063, CONNECTION_LOST_DATA_IN, "Connection to node \"{0}\" was lost while receiving data."
//  *Cause: An attempted file transfer operation failed because the connection to the indicated remote node was lost.
// *Action: Verify that the remote node (which acts as server) is still up and running.
/
2064, CONNECTION_LOST_DATA_OUT, "Connection to node \"{0}\" was lost while sending data."
//  *Cause: An attempted file transfer operation failed because the connection to the indicated remote node was lost.
// *Action: Verify that the remote node (which acts as server) is still up and running. Then do the same for the local node (which acts as client) and retry the file transfer operation.
/
2065, COMMAND_SEND_ERROR, "Error sending command \"{0}\". Details:\n{1}"
//  *Cause: An attempted file transfer operation failed because an error occurred while sending the indicated command.
// *Action: Examine the accompanying error message for additional details, address the issues raised and retry the command.
/
2066, FILE_SEND_ERROR, "Error sending file \"{0}\". Details:\n{1}"
//  *Cause: An attempted file transfer operation failed because an error occurred while sending the indicated file.
// *Action: Examine the accompanying error message for additional details, address the issues raised and retry the command.
/
2067, UNEXPECTED_REPLY, "Reply mismatch: Expected \"{0}\", but received \"{1}\" from node \"{2}\""
//  *Cause: An attempted file transfer operation failed because an error occurred on the indicated node while creating a directory or symbolic links or writing to a file.
// *Action: Examine the accompanying error message for additional details, address the issues raised and retry the command.
/
2068, NODE_NAME, "Node name: {0}"
//  *Document: No
//  *Cause: Informational message
// *Action: Not an error
/
2069, SUCCESS, "Success"
//  *Document: No
//  *Cause: Informational message
// *Action: Not an error
/
2070, ERRORS, "Errors"
//  *Document: No
//  *Cause: Informational message
// *Action: Not an error
/
2071, COMMAND_FAILED_NODES, "The command \"{0}\" failed on the following nodes: {1}."
//  *Cause: An attempt to run the specified command failed on the indicated nodes.
// *Action: Examine the accompanying error message for additional details, address the issues raised and retry the command.
/
2072, COMMAND_FAILED, "The command \"{0}\" failed." 
//  *Cause: An attempt to run the specified command failed.
// *Action: Examine the accompanying error messages for additional details, address the issues raised and retry the command.
/
2073, FAILED_INVOKE_COPY, "Invoking copy method failed. Details:\n{0}"
//  *Cause: An attempt to invoke the copy method failed.
// *Action: Ensure that the remote node is up and retry the command.
/
2074, FAILED_COPY_SRC_NODES, "failed to copy file {0} to remote nodes {1}"
//  *Cause: An attempt to copy the file failed.
// *Action: Ensure that the remote nodes are up and retry the command.
/
2075, GENERIC_TRANSFER_ERROR, "File transfer error from node {0} to node {1}. Unable to retrieve error details."
//  *Cause: An error occurred during a file transfer between the indicated nodes, but due to an unexpected protocol error, the error details could not be retrieved.
// *Action: Retry the operation and if the problem persists, contact Oracle Support Services.
/
2076, COPY_FAIL_LOST_CONNECTION, "Copy operation failed on node \"{0}\" because the connection is lost."
//  *Cause: The copy operation could not be completed because the connection was
//          lost.
// *Action: Retry the copy after making sure that the node is up and running.
/
2077, ERRORS_PER_NODE, "Copy operation failed on node \"{0}\" with the following errors:\n{1}"
//  *Cause: The copy operation could not be completed  because it encountered
//          the indicated errors.
// *Action: Examine the accompanying error message for additional details,
//          address the issues raised and retry the command.
/
2078, TOO_MANY_ERRORS, "Copy operation failed on node \"{0}\" with too many errors such as the following:\n"
//  *Cause: The copy operation could not be completed  because it encountered
//          too many errors.
// *Action: Examine the indicated errors, resolve the problems, and then retry
//          the operation. 
/
2079, COPY_SOURCE_AND_DESTINATION_ARE_SAME, "Source directory \"{0}\" is the same as the destination directory in the copy operation."
//  *Cause: The source directory for the copy operation on the local node was
//          the same as the destination directory.
// *Action: Ensure that the source and destination directories are different.
/
2080, LOCAL_COPY_FAILED, "The copy operation on the local node failed with the following errors: {0}"
//  *Cause: The copy operation could not be completed  because it encountered
//          the indicated errors.
// *Action: Examine the indicated errors, resolve the problems, and then retry
//          the operation. 
/
2081, UNABLE_TO_CHECK_IF_DIR_IS_WRITABLE, "unable to detect whether the user can write to directory '{0}' on the following nodes: {1}"
//  *Cause: An attempt to copy the files under the indicated directory failed
//          because an error occurred while determining whether the directory
//          was writable by the user on all nodes.
// *Action: Ensure that the directory exists, and that the user has write
//          permissions on all nodes. Also, refer to the accompanying error
//          messages for additional details, correct the errors, and retry.
/
2082, NON_WRITABLE_DIR, "Directory '{0}' is not writable on the following nodes: {1}"
//  *Cause: An attempt to copy the files under the indicated directory failed,
//          because write permissions were not granted to its path on the
//          specified nodes.
// *Action: Ensure that the directory exists, write permissions to its path are
//          are granted on all nodes, and retry. 
/
