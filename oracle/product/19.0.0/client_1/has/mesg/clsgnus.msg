/* Copyright (c) 2006, 2019, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsgnus.msg
/ DESCRIPTION
/   Message file for the Grid Naming Service
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   apfwkr       02/28/19 - Backport ksrangal_bug-28808652 from main
/   ksrangal     11/14/18 - Bug 28808652 - Added 566
/   ksrangal     05/15/17 - Fixed #562
/   rwessman     04/27/17 - Bug 25468157 - added messages 563, 564 and 565.
/   ksrangal     04/24/17 - Bug 25943523 - Added #562
/   ksrangal     03/11/16 - Bug 22879647 - Added #552
/   ksrangal     02/26/16 - Bug 22808875 - Changed #267
/   rwessman     11/11/15 - Bug 21288971 - added credentials and registration
/                           messages.
/   ksrangal     10/22/15 - Bug 21978274  - Added #551
/   ksrangal     08/18/15  - Bug 21630796 - Added #550
/   ksrangal     06/23/15  - Bug 21167364 - Added #546
/   rwessman     05/29/15  - Bug 18329534 - added messages 547 and 548.
/   ksrangal     05/07/15  - Bug 20986623 - Added #545
/   ksrangal     04/13/15  - Bug 20703295 - Added msg 538-544
/   rwessman     01/29/15  - fixed Cause in message #173.
/   ksrangal     01/13/15  - Bug 20350903 - added #537
/   rwessman     11/25/14  - HA GNS: added message #534.
/   ksrangal     12/12/14  - Bug 20197489 - added #535 and #536
/   ksrangal     11/21/14  - Lrg 14063283 - Changed msg which does not require 
/                            an incident.
/   ksrangal     11/12/14  - hagns_4: added messages 528 to 531.
/   rwessman     10/17/14  - HA GNS: added message #533.
/   rwessman     10/07/14  - HA GNS: added message #532.
/   ksrangal     09/05/14  - ksrangal_hagns_3: Renumbered 525,526 and added 527
/   rwessman     05/09/14  - Bug 17626439 - clarify cause for message #77.
/   rwessman     03/06/14  - Bug 16563686 - added messages #525, #526, #528.
/   rwessman     12/20/13  - Bug 17641596 - added "invalid instance name"
/   rwessman     09/24/13  - Bug 17417287 - Added "no ports available
/   rwessman     09/09/13  - Bug 16854176 - added error for an invalid PTR
/                            target.
/   rwessman     09/05/13  - Fixed typos.
/   rwessman     07/29/13  - Bug 17068460 - added messages about threads and
/                            thread groups failing to stop.
/   rwessman     02/14/13  - Bug 16233582
/   ksrangal     01/06/13  - Bug 16043143
/   rwessman     08/14/12  - Bug 14142278
/   ksrangal     07/25/12  - Bug 14368223
/   ksrangal     07/17/12  - Bug 14335076
/   ksrangal     07/04/12  - Bug 13394833
/   ksrangal     05/29/12  - Bug 14001849
/   rwessman     04/26/12  - Incorporated review comments.
/   rwessman     03/09/12  - Bug 12934679
/   rwessman     02/28/12  - Bug 13736621
/   rwessman     02/16/12  - Bug 13639037
/   rwessman     12/28/11  - Bug 13539035
/   rwessman     12/21/11  - Bug 13521580
/   rwessman     12/09/11  - Fixed action for message #70.
/   rwessman     07/14/11  - Added credential errors.
/   rwessman     06/23/11  - Added messages #263 and #264.
/   rwessman     06/22/11  - Added credentials support.
/   rwessman     05/23/11  - Fixed message #80 to be more generic.
/   rwessman     03/27/11  - Consolidated refresh commands into one.
/   rwessman     03/23/11  - Added message #250.
/   rwessman     03/10/11  - Added PTR-related messages.
/   rwessman     03/07/11  - Changed message #220 to take only one argument.
/   rwessman     02/25/11  - Added message #245.
/   rwessman     03/18/11  - Made message #78 more generic.
/   rwessman     03/16/11  - Added message 251.
/   rwessman     01/18/11  - Added informational message that the server is
/                            running.
/   rwessman     01/18/11  - Bug 10393872 - deleted now obsolete message 125.
/   rwessman     12/15/10  - Backport rwessman_bug-9864003 from main
/   rwessman     10/06/10  - Corrected message #136. The error can occur for
/                            reasons other than the name not being found.
/   rwessman     09/21/10  - Added messages for service advertisement.
/   rwessman     09/20/10  - Added message #211 to fix LRG 4689455.
/   rwessman     07/15/10  - Bug 9864003 - added message for OCR key value
/                            retrieval failure.
/   rwessman     07/08/10  - Removed explicit DRUID arguments. CLSEM now
/                            handles appending them.
/   rwessman     04/22/10  - Changed message #105 to be externally-visible.
/   rwessman     12/02/09  - Added messages to fix LRG 4272790.
/   rwessman     11/09/09  - Bug 7218310 - deleted message #148.
/   rwessman     10/14/09  - Bug 8586446
/   rwessman     10/06/09  - Bug 8981341
/   rwessman     09/29/09  - Bug 8972167
/   rwessman     09/23/09  - Bug 8934484
/   rwessman     08/27/09  - Added DRUID to message #76 as part of fix for bug
/                            8841277.
/   rwessman     08/13/09  - Added messages #191 and #192 to fix bug 8603555
/   rwessman     08/11/09  - Added message #187 as part of fix for 8638270.
/   rwessman     08/03/09  - Added message #188.
/   rwessman     07/31/09  - Added message #187.
/   rwessman     05/28/09  - Added message #186
/   rwessman     05/28/09  - Fixed message 130.
/   rwessman     05/14/09  - Added message #186.
/   rwessman     03/19/09  - Added message #178 and #179.
/   rwessman     03/10/09  - Added message #173.
/   rwessman     03/10/09  - Added message #174.
/   rwessman     03/03/09  - Cleaned up message #161.
/   rwessman     02/02/09  - Bug 8211952.
/   rwessman     01/23/09  - Added message #170.
/   rwessman     12/02/08  - Added message #169.
/   rwessman     11/06/08  - Changed message #2 to state that the address is
/                            optional.
/   rwessman     10/23/08  - Review comments from bmanry.
/   rwessman     10/06/08  - Added message #168.
/   rwessman     09/23/08  - Fixed typo found during translation.
/   rwessman     09/10/08  - Added message #167.
/   rwessman     10/14/08  - Changed message #62 due to fix for bug 7446733.
/   rwessman     09/05/08  - Added message #166.
/   rwessman     08/27/08  - Added message #165.
/   rwessman     08/25/08  - Improved error messages.
/   rwessman     08/08/08  - Added message #163 and message #164 as part of fix
/                            for bug 7316012.
/   rwessman     07/17/08  - Made "packet ignored" message more informative.
/   rwessman     06/25/08  - Added message #162.
/   rwessman     06/10/08  - Added message #161.
/   rwessman     06/06/08  - Added messages for multicast port and DNS bridge
/                            port.
/   rwessman     03/12/08  - Fixed bugs in messages.
/   rwessman     02/11/08  - Added message #31.
/   rwessman     02/07/08  - Added message 158.
/   rwessman     02/06/08  - Fixed message number and added an informational
/                            message for the server state.
/   rwessman     01/30/08  - Added messages to be logged.
/   rwessman     01/16/08  - Added messages 152 and 153.
/   rwessman     01/15/08  - Added message 152.
/   rwessman     12/11/07  - Added message 151.
/   rwessman     12/10/07  - Added message 151
/   rwessman     11/19/07  - Added host deletion command message.
/   rwessman     11/14/07  - Changed to use special LSF format modifiers
/                            because no one else uses them and CLSK formatting
/                            may not support them in the future.
/   rwessman     11/01/07  - Added "unsupported query type.
/   rwessman     09/10/07  - Added internal error 32767.
/   rwessman     09/06/07  - Added message #148.
/   rwessman     08/16/07  - Added message #140.
/   rwessman     08/01/07  - Added messages 138 and 139.
/   rwessman     05/23/07  - Added GPnP errors.
/   rwessman     01/05/06  - Created
/
00000, 0, "no error\n"
// *Cause:  Operation was successful.
// *Action: No action needed.
00001, 00000, "print this message."
// *Document: NO
// *Cause:  
// *Action: 
/
00002, 00000, "stop advertising a name. The address of the name is optional."
// *Document: NO
// *Cause:  
// *Action: 
/
00003, 00000, "unknown command: \"%s\"\n"
// *Cause:  The command entered was invalid.
// *Action: Specify a valid command.
/
00004, 00000, "Disconnected from"
// *Document: NO
// *Cause:  
// *Action: 
/
00005, 00000, "start the gnsd server."
// *Document: NO
// *Cause:  
// *Action: 
/
00006, 00000, "stop the gnsd server."
// *Document: NO
// *Cause:  
// *Action: 
/
00007, 00000, "advertise a name using the IP address."
// *Document: NO
// *Cause:  
// *Action: 
/
00008, 00000, "create an alias for the name."
// *Document: NO
// *Cause:  
// *Action: 
/
00009, 00000, "delete an alias for a name."
// *Document: NO
// *Cause:  
// *Action: 
/
00010, 00000, "get the value of one or all parameters."
// *Document: NO
// *Cause:  
// *Action: 
/
00011, 00000, "set the value of a parameter."
// *Document: NO
// *Cause:  
// *Action: 
/
00012, 00000, "unset the value of a parameter."
// *Document: NO
// *Cause:  
// *Action: 
/
00013, 00000, "save the configuration."
// *Document: NO
// *Cause:  
// *Action: 
/
00014, 00000, "set tracing level."
// *Document: NO
// *Cause:  
// *Action: 
/
00015, 00000, "query for the version of the server."
// *Document: NO
// *Cause:  
// *Action: 
/
00016, 00000, "query for the status of the server."
// *Document: NO
// *Cause:  
// *Action: 
/
00017, 00000, "set the logging level."
// *Document: NO
// *Cause:  
// *Action: 
/
00018, 00000, "parameter has no default value."
// *Cause:  An attempt was made to reset the value of a parameter for
//          which there is no default value.
// *Action: Specify a parameter which has a default value.
/
00019, 00000, "reset value of a parameter to default."
// *Document: NO
// *Cause:  
// *Action: 
/
00020, 00000, "undo changes made in the current session."
// *Document: NO
// *Cause:  
// *Action: 
/
00021, 00000, "no changes to save.\n"
// *Document: NO
// *Cause: There were no changes to save.
// *Action: 
/
00022, 00000, "no changes to rollback.\n"
// *Document: NO
// *Cause: There were no changes to undo.
// *Action: 
/
00023, 00000, "\"%s\" is only available in interactive mode.\n"
// *Cause:  An attempt was made to run or get help for a command from the
//          command line which is available only in interactive mode.
// *Action: Change to interactive mode to run the command.
/
00024, 00000, "Oracle Grid Naming Service Daemon (GNSD) aborted on node %s."
// *Cause:  The server aborted on the specified node.
// *Action: Contact Oracle Support Services.
/
00025, 00000, "Creation of name object for configuration file \"%s\" failed.\n"
// *Cause:  It was not possible to create a name object for the
//          configuration file.
// *Action: Examine the rest of the stack for the exact reason.
/
00026, 00000, "Configuration file \"%s\" does not exist.\n"
// *Cause:  The configuration file specifed could not be found.
// *Action: Specify a file that exists.
/
// 00027, 00000, "UNUSED"
// *Cause:
// *Action:
/
00028, 00000, "Open of configuration file \"%s\" failed.\n"
// *Cause:  The open of the configuration file failed.
// *Action: Examine the rest of the error stack for the exact reason.
/
00029, 00000, "Read of configuration file \"%s\" failed.\n"
// *Cause:  A read of the configuration file failed.
// *Action: Examine the rest of the error stack for the exact reason.
/
00030, 00000, "Close of configuration file \"%s\" failed.\n"
// *Cause:  It was not possible to close the configuration file.
// *Action: Examine the rest of the error stack for the exact reason.
/
00031, 00000, "Server failed to start:\n%s"
// *Cause: The GNS server failed to start due to an error encountered by the
//          server.
// *Action: Examine the message that accompanies this one for details. Also,
//          take a look at the server log files for more information.
/
00032, 00000, "Unexpected end of line found in record \"%s\".\n"
// *Cause:  The line ended unexpectedly. For example, the line might
//          have ended before the end of a quoted string was found.
// *Action: Specify a correctly formatted line.
/
00033, 00000, "Too few arguments for value of parameter \"%s\" Minimum: %d\n"
// *Cause:  Not enough arguments were specified for a parameter.
// *Action: Specify the required number of arguments.
/
00034, 00000, "Too many arguments for value of parameter \"%s\" Maximum: %d\n"
// *Cause:  The number of arguments specified for a parameter was greater than
//          maximum allowed.
// *Action: Specify the required number of arguments.
/
00035, 00000, "Record \"%s\" contains too few fields. Minimum: %u. Specified: %u.\n"
// *Cause:  The entry for a parameter in the configuration file does not
//          contain the required number of fields.
// *Action: Correct the entry to have the required number of fields.
/
00036, 00000, "Record \"%s\" contains too many fields. Maximum: %u. Specified: %u.\n"
// *Cause:  The entry for a parameter in the configuration file contains more
//          than the maximum number of fields.
// *Action: Correct the entry to have the required number of fields.
/
00037, 00000, "Yes"
// *Document: NO
// *Cause:  Not an error. Permits the user to specify "yes" as a parameter in
//          his or native language.
// *Action: No action required.
/
00038, 00000, "No"
// *Document: NO
// *Cause:  Not an error. Permits the user to specify "no" as a parameter in
//          his or native language.
// *Action: No action required.
/
// 00039, 00000, "UNUSED"
// *Cause:
// *Action:
/
00040, 00000, "invalid value for integer parameter: \"%s\": \"%s\"\n"
// *Cause:  The value specified for an integer parameter was not an integer.
// *Action: Specify a correct value, either decimal or hexadecimal.
//          Hexadecimal values start with the string "0x".
/
00041, 00000, "invalid value for boolean parameter \"%s\": \"%s\"\n"
// *Cause:  The value specified for a boolean parameter was not a boolean
//          value.
// *Action: Specify a correct value. Correct values include: TRUE/FALSE,
//          YES/NO, ON/OFF, and 1/0.
/
00042, 00000, "Usage: %s %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00043, 00000, "invalid configuration method: \"%s\"\n"
// *Cause:  An unknown type was specified for the method used to store
//          configuration information.
// *Action: Specify a valid type.
/
00044, 00000, "no file name specified.\n"
// *Cause:  No name was specified for a configuration method which uses
//          a file as the repository.
// *Action: Specify a file name.
/
00045, 00000, "initialization failed: %s\n"
// *Cause:  The initialization of GNS failed.
// *Action: Please examine the accompanying message for the exact
//          reason.
/
00046, 00000, "no value found for parameter \"%s\".\n"
// *Cause:  A value was not specified for the parameter.
// *Action: Specify a parameter.
/
00047, 00000, "multiple values found for parameter \"%s\".\n"
// *Cause:  Multiple values were specified for a parameter.
// *Action: Specify a single value.
/
// 00048, 00000, "UNUSED"
// *Cause:
// *Action:
/
00049, 00000, "unknown parameter: \"%s\".\n"
// *Cause:  The specified parameter is not supported.
// *Action: Specify a supported parameter.
/
// 00050, 00000, "UNUSED"
// *Cause:
// *Action:
/
00051, 00000, "unsupported query type: \"%s\""
// *Cause:  The query type passed in is not supported by GNS.
// *Action: Specify a supported query type.
/
00052, 00000, "Initialization of OCR at level %u failed.\n  %s\n"
// *Cause:  Initialization of OCR to the specified level failed.
// *Action: Examine the error message to determine what occurred.
/
00053, 00000, "validate that a name has been advertised."
// *Document: NO
// *Cause:  
// *Action: 
/
00054, 00000, "Invalid IP address: %s"
// *Cause:  The IP address specified is neither in the v4 or v6 format.
// *Action: Specify a correct address.
/
00055, 00000, "Get addresses for a given name."
// *Document: NO
// *Cause:  
// *Action:  
/
00056, 00000, "Unable to resolve name \"%s\""
// *Cause:  No entry was found in GNS or the system for the specified
//          name.
// *Action: Specify a valid machine.
/
// 00057, 00000, "UNUSED"
// *Cause:
// *Action:
/
00058, 00000, "Invalid number of arguments specified: %d.\n"
// *Cause:  The client program sent the wrong number of arguments over
//          for a command.
// *Action: This error should not ordinarily be seen. Contact Oracle
//          Support Services.
/
00059, 00000, "Unknown command: %u.\n"
// *Cause:  The server received an unknown command from the client.
// *Action: This error should never happen. If it does, contact Oracle Support
//          Services.
/
00060, 00000, "Conversion of string value \"%s\" failed with error %d.\n"
// *Cause:  The value of a parameter sent over from the client to number
//          failed.
// *Action: Specify a valid parameter value.
/
00061, 00000, "Internal error.\n"
// *Cause:  An unexpected error occurred. The rest of the error stack contains
//          details about the error.
// *Action: This error should never happen. If it does, contact Oracle
//          Support Services.
/
00062, 00000, "Server spawn failed: could not access subdirectory %s under %s.\n"
// *Cause:  The server process could not be spawned because the
//          directory where the program resides could not be located
//          or accessed.
// *Action: Make sure that the server directory exists and can be
//          accessed by the user starting the program.
/
00063, 00000, "Server spawn failed: executable not accessible: directory: %s file: %s\n"
// *Cause:  The server program could not be accessed.
// *Action: Make sure the server executable exists and can be accessed
//          by the user starting the program.
/
00064, 00000, "spawn of server %s failed.\n"
// *Cause:  The client was unable to start the server process.
// *Action: More details about the failure can be found in messages that follow.
/
00065, 00000, "Unable to create backup for configuration file %s"
// *Cause:  The GNS server was unable to create a backup configuration
//          file.
// *Action: Check the permissions in the configuration directory. Make
//          sure that the GNS process is permitted to create files
//          there.
/
00066, 00000, "Service advertisement initialization failed.\n"
// *Cause:  GNS failed when tried to initialize the Resource Discovery
//          subsystem.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
// 00067, 00000, "UNUSED"
// *Cause:
// *Action:
/
00068, 00000, "Service advertisement stop failed.\n"
// *Cause:  GNS encountered an error when it tried to stop the advertisement of
//          its service.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00069, 00000, "Service registration failed.\n"
// *Cause:  GNS was unable to register itself with Resource Discovery.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00070, 00000, "Service location failed.\n"
// *Cause:  The client program was not able to locate a GNS server.
// *Action: Examine the message following this one for a possible
//          cause.
/
00071, 00000, "Transport initialization failed.\n"
// *Cause:  GNS was unable to initialize the transport that it uses to
//          communicate between the client and server.
// *Action: Examine the messages following this one for the cause of the error.
/
00072, 00000, "Connection to server failed.\n"
// *Cause:  GNS was unable to initialize the transport that it was used
//          to communicate between the client and server.
// *Action: The message following indicates the exact error that occurred.
/
00073, 00000, "Send failed\n"
// *Cause:  GNS was unable to send data either from the client to the server or
//          from the server to the client.
// *Action: The message following indicates the exact error that occurred.
/
00074, 00000, "Wait for client connection failed\n"
// *Cause:  An error occurred while the server was waiting for a connection
//          from the client.
// *Action: The message following indicates the exact error that occurred.
/
00075, 00000, "Receive failed.\n"
// *Cause:  GNS was unable to receive data from its peer process.
// *Action: The message following indicates the exact error that occurred.
/
00076, 00000, "%s Packet ignored: %s.\n"
// *Cause:  The packet was ignored by the server because it was invalid. This
//          may be caused by another process sending malformed packets.
// *Action: Use system tools to determine if a non-GNS process is sending data
//          to the server.
/
00077, 00000, "Invalid DNS message received.\n"
// *Cause:  The Grid Naming Service (GNS) server received a query which was not
//          of the correct format. This could be due to an error by the server
//          or because a malicious process is sending the GNS server invalid
//          packets.
// *Action: The error is informational and should not ordinarily be
//          visible to a user. If it is seen, contact Oracle Support
//          Services.
/
00078, 00000, "No space in left in buffer. Buffer size: %u."
// *Cause:  The buffer provided was too small to fit a piece of data.
// *Action: This error should ordinarily not be visible to users. If
//          it appears, contact Oracle Support Services.
/
00079, 00000, "Bonjour initialization failed.\n"
// *Cause:  The function called to initialize Bonjour for use by GNS
//          failed.
// *Action: Examine the accompanying Bonjour error and take corrective action.
/
00080, 00000, "Wait failed."
// *Cause:  The wait for data to be received from another process failed.
// *Action: This error should ordinarily not be visible to users. If it
//          appears, contact Oracle Support Services.
/
00081, 00000, "The GNS service is not running.\n"
// *Cause:  The GNS service could not be contacted because it is not
//          running.
// *Action: Start the GNS service.
/
00082, 00000, "The GNS service is already running.\n"
// *Cause:  An attempt was made to start the GNS service, but it was
//          already running.
// *Action: Shut down the GNS service before trying to start it.
/
00083, 00000, "Invalid option: \"%s\"\n"
// *Cause:  An unknown option was specified either to a client program
//          or the server.
// *Action: Specify a supported option.
/
00084, 00000, "Invalid trace level: \"%s\"\n"
// *Cause:  The value specified for the trace level was not a number.
// *Action: Specify a number for the trace level.
/
// 00085, 00000, "UNUSED"
// *Cause:
// *Action:
/
00086, 00000, "Service location initialization failed.\n"
// *Cause:  The GNS client failed when it tried to initialize the Resource
//          Discovery subsystem.
// *Action: Examine the message following this one. It will indicate
//          the cause. If it is a number, consult rdret.h.
/
00087, 00000, "Listen on endpoint \"%s\" failed.\n"
// *Cause:  The server was unable to listen for requests on the
//          specified endpoint.
// *Action: The accompanying GIPC error should be examined for the
//          exact error.
/
00088, 00000, "Listen on %s port %u failed due to a lack of privileges.\n"
// *Cause:  The server was unable to listen on the specified port because it
//          does not have privilege to do so. On Linux and Unix systems, this
//          can occur because the server is not running as the root user.
// *Action: Run the server as a user with the needed privileges.
/
00089, 00000, "Not enough arguments specified for the \"%s\" option. Number specified: %u. Minimum number: %u.\n"
// *Cause:  Enough arguments were not specified for a command.
// *Action: Specify the minimum number of arguments.
/
00090, 00000, "Too many arguments specified for the \"%s\" option. Number specified: %u Maximum number: %u.\n"
// *Cause:  Too many arguments arguments specified for a command.
// *Action: Specify the required number of arguments.
/
00091, 00000, "Version: %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00092, 00000, "Status: %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00093, 00000, "Server failed during start up.\n"
// *Cause:  The GNS server started but later terminated unexpectedly.
// *Action: Examine the trace and log files for the reason.
/
// 00094, 00000, "UNUSED"
// *Cause:
// *Action:
/
00095, 00000, "Invalid IP address for name \"%s\": \"%s\"\n"
// *Cause:  An attempt was made to register an IP address which was in the
//          incorrect format.
// *Action: Change the address to be in the correct format.
/
// 00096, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00097, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00098, 00000, "UNUSED"
// *Cause:
// *Action:
/
00099, 00000, "Multicast DNS server not running.\n"
// *Cause:  GNS was unable to send a query to the multicast DNS server
//          because it is not running.
// *Action: Start the multicast DNS server.
/
00100, 00000, "The alias \"%s\" already exists."
// *Cause:  The specified alias already exists.
// *Action: Specify an alias which does not exist.
/
00101, 00000, "The alias \"%s\" does not exist."
// *Cause:  An alias for a name could not be found.
// *Action: Specify an alias which exists.
/
00102, 00000, "The name \"%s\" does not exist."
// *Cause:  The specified name could not be found.
// *Action: Specify a name which exists.
/
00103, 00000, "Command processed.\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00104, 00000, "Server shut down."
// *Document: NO
// *Cause:  
// *Action:  
/
00105, 00000, "Server terminated with error."
// *Cause:  GNS terminated with an unexpected error.
// *Action: See the accompanying exception stack for more information.
/
// 00106, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00107, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00108, 00000, "UNUSED"
// *Cause:  
// *Action:  
/
00109, 00000, "No interfaces available."
// *Cause:  GNS was unable to find any interfaces on which it can listen for
//          requests. This error is likely caused by the incorrect
//          specification of the list of interfaces on which GNS is not to
//          listen.
//          Alternatively, it may be caused by an error in system
//          configuration.
// *Action: Correct the list of prohibited interfaces if it was set
//          incorrectly. If this is not the case, check the system
//          configuration.
/
00110, 00000, "One or threads failed - check log.\n"
// *Cause:  One or more GNS failed unexpectedly.
// *Action: Check the log file to determine the exact reasons.
/
00111, 00000, "Acquisition of privileges needed to perform operation failed."
// *Cause:  An attempt to acquire the privileges needed failed.
// *Action: Examine the attached message for more details.
/
00112, 00000, "Platform initialization failed.\n"
// *Cause:  GNS was unable to initialize the layer the provides system-specific
//          services.
// *Action: Examine the accompanying message for details.
/
00113, 00000, "Switch from user \"%s\" to user \"%s\" to perform a network operation failed.\n"
// *Cause:  GNS was not able to switch to a more privileged user in to perform
//          an operation on the network.
// *Action: Examine the accompanying error message for details.
/
// 00114, 00000, "UNUSED"
// *Cause:  
// *Action:
/
// 00115, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00116, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00117, 00000, "UNUSED"
// *Cause:
// *Action:
/
// 00118, 00000, "UNUSED"
// *Cause:
// *Action:
/
00119, 00000, "Subdomain: %s\n"
// *Document: NO
// *Cause:  
// *Action:  
/
00120, 00000, "Creation of configuration file \"%s\" failed.\n"
// *Cause:  The creation of the new version of the configuration file failed.
// *Action: Examine the rest of the error stack for the exact reason.
/
/
00121, 00000, "Trace level set to %u."
// *Cause: This is an information message to indicate that the trace level was
//          set.
// *Action: No action is needed.
/
00122, 00000, "Dynamic messaging initalization failed - error %d"
// *Cause:  The facility used to control the GNS server dynamically failed.
// *Action: This error should not be seen in normal use. Contact Oracle
//          Support Services if it appears.
/
00123, 00000, "---- BEGIN STATE DUMP ----"
// *Document: NO
// *Cause:  
// *Action:  
/
00124, 00000, "---- END STATE DUMP ----"
// *Document: NO
// *Cause:  
// *Action:  
/
00125, 00000, "GNSD started on node %s."
// *Document: NO
// *Cause:
// *Action:
/
00126, 00000, "self-check succeeded."
// *Document: NO
// *Cause:  
// *Action: 
/
00127, 00000, "Privileged user \"%s\" does not exist."
// *Cause:  The user which GNS is to run as in order to run operations which
//          require special privileges does not exist.
// *Action: Specify a user which does exist on the host. This user must have
//          the ability to listen for requests from the DNS server.
/
00128, 00000, "Unprivileged user \"%s\" does not exist."
// *Cause:  The user which GNS is to run as in order to perform operations
//          which do not require special privileges does not exist.
// *Action: Specify a user which exists.
/
00129, 00000, "Privileged group \"%s\" does not exist."
// *Cause:  The group to which a user must belong in order to perform
//          administrative operations does not exist.
// *Action: Specify a group which exists on the host.
/
00130, 00000, "no privileges to access OCR key \"%s\"."
// *Cause:  It was not possible to retrieve the specified key from OCR
//          because the user does not have the required privileges.
// *Action: Either run the command as a user which has the required privileges
//          or configure OCR to allow retrieval of the key.
/
00131, 00000, "no privileges to get value for OCR key \"%s\"."
// *Cause:  It was not possible to retrieve the specified value from OCR
//          because the user does not have the required privileges.
// *Action: Either run the command as a user which has the required privileges
//          or configure OCR to allow retrieval of the key.
/
00132, 00000, "user \"%s\" not authorized to run command."
// *Cause:  A user tried to run a command but has no permission to do so.
// *Action: Run the command as a user which has the proper privileges.
/
00133, 00000, "Exception received:\n%s"
// *Cause:  An exception occurred on the server process.
// *Action: Examine the exception for details.
/
00134, 00000, "Invalid name: \"%s\"."
// *Cause:  The name to be used for a GNS operation was not valid.
//          The name may have no domain or be qualified with the name of
//          subdomain serviced by GNS.
// *Action: Specify a correct name.
/
00135, 00000, "Mandatory parameter \"%s\" is not configured."
// *Cause:  A value was not configured for a mandatory parameter.
// *Action: Configure a value in the parameter repository.
/
00136, 00000, "Query for network address for name \"%s\" failed."
// *Cause:  The query for network addresses for the given name failed.
// *Action: Examine the accompanying errors for for more information. If the
//          errors indicate that the name does not exist, register it using
//          srvctl.
/
00137, 00000, "get the name of the subdomain served by GNS."
// *Document: NO
// *Cause:  
// *Action: 
/
00138, 00000, "No thread names specified."
// *Cause:  The command requires at least one thread name to be specified.
// *Action: Specify at least one thread name.
/
00139, 00000, "Invalid thread name \"%s\""
// *Cause:  The name of the thread was unknown to GNS.
// *Action: Specify a valid thread name.
/
00140, 00000, "OCR key \"%s\" does not exist."
// *Cause:  The specified key cannot be found in the Oracle Cluster Registry.
// *Action: Specify a key that exists This exception often happens when trying
//          to retrieve a configuration parameter.
/
00141, 00000, "The address \"%s\" already exists."
// *Cause:  A mapping for a address to a name already exists.
// *Action: Specify an address which does not exist.
/
00142, 00000, "Open of OCR key \"%s\" failed."
// *Cause:  An error occurred while trying to open the root OCR used by GNS.
// *Action: Examine the accompanying exceptions for more information about the
//          error. This error may be caused by mis-configuration.
/
00143, 00000, "Subdomain \"%s\" already exists."
// *Cause:  An attempt was made to create a GNS subdomain which already exists.
// *Action: Specify a subdomain which does not exist.
/
00144, 00000, "Subdomain \"%s\" does not exist."
// *Cause:  The specified GNS subdomain does not exist.
// *Action: Specify a subdomain which exists.
/
00145, 00000, "The name \"%s\" already exists."
// *Cause:  The specified name already exists.
// *Action: Specify an name which does not exist.
/
// 00146, 00000, "UNUSED"
// *Cause:  
// *Action:
/
00147, 00000, "Address \"%s\" for name \"%s\" is not serviced by GNS."
// *Cause:  The specified address is not served by GNS.
// *Action: Specify a different address or change the subnet mask used by GNS.
/
00148, 00000, "GNSD stopped on node %s."
// *Document: NO
// *Cause:
// *Action:
/
00149, 00000, "Address \"%s\" does not exist."
// *Cause:  The specified address is not known to GNS.
// *Action: Specify a valid address.
/
00150, 00000, "Alias \"%s\" is invalid."
// *Cause:  The name of the alias to be advertised was not valid. The name may
//          have no domain or be qualified with the name of subdomain serviced
//          by GNS.
// *Action: Specify a correct alias.
/
00151, 00000, "Name domain \"%s\" does not match GNS subdomain \"%s\""
// *Cause:  The domain specified for the name does not specify the subdomain
//          served by GNS.
// *Action: Either specify the correct domain or just specify the name of the
//          host.
/
00152, 00000, "Self-check failed."
// *Cause:  The self-check performed by GNS failed.
// *Action: Verify that DNS has been configured so that it forwards queries 
//          for the GNS domain to the IP address on which the GNS server is 
//          listening. Otherwise contact Oracle Support Services.
/
00153, 00000, "Length of subdomain \"%s\": %s exceeds the maximum: %s."
// *Cause:  The name specified for the subdomain to be served by GNS is longer
//          than the maximum.
// *Action: Specify a shorter subdomain name.
/
00154, 00000, "Invalid subdomain: \"%s\""
// *Cause:  The name of the subdomain does not conform to Internet
//          standards. It must meet the following requirments:
//          1. Only alphanumeric characters, periods are hyphens are allowed;
//          2. It must start and end with an alphanumeric character;
//          3. Consecutive periods are not allowed.
//          In addition, the subdomain must not end with with ".local" as it is
//          reserved for multicast DNS.
// *Action: Specify a subdomain in the correct format.
/
00155, 00000, "trace level %u is less than the minimum %u - ignoring."
// *Cause:  The trace level specified is lower than the minimum supported.
// *Action: Specify a valid trace level.
/
00156, 00000, "trace level %u is greater than the maximum %u. Using the maximum value instead."
// *Cause:  The trace level specified is greater than the maximum supported.
// *Action: Specify a valid trace level.
/
00157, 00000, "Server state: %s"
// *Document: NO
// *Cause:  
// *Action:  
/
00158, 00000, "Initialization or shut down in progress."
// *Cause:  GNS was unable to process a command because it is either starting
//          up or shutting down.
// *Action: If the server is starting up, try the command again in a few
//          seconds. The server is shutting down, try the command again after
//          the server has restarted.
/
00159, 00000, "Port used for multicast communication: %s."
// *Document: NO
// *Cause:  
// *Action: 
/
00160, 00000, "Port used for communication with the DNS server: %s."
// *Document: NO
// *Cause:  
// *Action: 
/
00161, 00000, "Failed to set GNS trace level: %s."
// *Cause: The call to set the trace level on the GNS server failed.
// *Action: Examine the accompanying error message for details.
/
00162, 00000, "Name \"%s\" and address \"%s\" will not be advertised due to configuration change."
// *Cause:  When GNS attempted to advertise a name and address upon re-start,
//          it failed because the address can no longer be serviced. This can
//          happen if the subnet used by GNS was changed between the time that
//          GNS was stopped and it was started.
// *Action: If this result was expected, the error can be ignored. Otherwise,
//          the subnet needs to be changed in OCR and GNS needs to be stopped
//          and re-started.
/
00163, 00000, "connection with Cluster Synchronization Services failed. Error: %u.\n"
// *Cause:  GNS was unable to contact Cluster Synchronization Services in order
//          to retrieve the name of the cluster.
// *Action: This error is most probably caused by the Cluster Synchronization
//          Services daemon being down. If the daemon is running, contact
//          Oracle Support Services and provide them with the error code.
/
00164, 00000, "Failed to retrieve cluster name: Error: %u."
// *Cause:  GNS was unable to get the name of the cluster from Cluster
//          Synchronization Services.
// *Action: This error is most probably caused by the Cluster Synchronization
//          Services daemon being down. If the daemon is running, contact
//          Oracle Support Services and provide them with the error code.
/
00165, 00000, "Running as user \"%s\" which is not privileged."
// *Cause:  GNS is not running as a privileged user e.g. root.
// *Action: Start GNS as a privileged user.
/
00166, 00000, "Creation of OCR key \"%s\" failed.\n  %s"
// *Cause: GNS was unable to create the specified OCR key.
// *Action: Examine the accompanying error for details about what occurred.
//          This error may be caused by mis-configuration.
/
00167, 00000, "Operation is unsupported."
// *Cause:  An operation was attempted which is not currently supported by GNS.
// *Action: Do not attempt the operation.
/
00168, 00000, "Name advertisement or alias re-creation failed."
// *Cause:  When GNS starts, it re-creates the advertisements and aliases that
//          existed when it was shut down. The attempt to re-create an
//          advertisement or alias failed.
// *Action: This error should not occur in normal use. Contact Oracle Support
//          Services.
/
00169, 00000, "Spawn of thread \"%s\" failed."
// *Cause:  GNS was unable to spawn a thread. This may be due to low system
//          resources.
// *Action: If the memory or processes in use on the system are too high,
//          reduce one or both and restart GNS. If this is not the case,
//          contact Oracle Support Services.
/
00170, 00000, "Thread \"%s\" failed on startup."
// *Cause: A GNS thread failed when it tried to start.
// *Action: Examine the alert log and and trace file (if any) for details about
//          the error.
/
00171, 00000, "Invalid alias \"%s\" specified for name \"%s\""
// *Cause:  The name of the alias to be advertised was not valid. The name must
//          have no domain or be qualified with the name of subdomain serviced
//          by GNS.
// *Action: Specify an alias whose name is in the correct format.
/
00172, 00000, "Domain given in alias \"%s\" for name \"%s\" does not match GNS domain \"%s\"."
// *Cause:  The  domain specified for an alias does not match the domain
//          serviced by GNS.
// *Action: Either specify the correct domain or do not specify a domain and
//          GNS will use its domain as the default.
/
00173, 00000, "GNS has not been configured."
// *Cause:  An operation on the Grid Naming Service (GNS) failed because GNS had
//          not been configured.
// *Action: Configure GNS and retry the operation.
/
00174, 00000, "Packet replay detected - dropping connection."
// *Cause:  GNS received a duplicate packet from a client. The connection was
//          dropped as a consequence.
// *Action: Examine the trace file for details. It is possible that a malicious
//          user is attempting to send an invalid packet to GNS.
/
00175, 00000, "Invalid packet received - dropping connection."
// *Cause:  The packet was ignored by the server because it was invalid. This
//          may be caused by another process sending malformed packets. This
//          error is usually accompanied by another error which describes the
//          exact error that occurred.
// *Action: Use system tools to determine if a non-GNS process is sending data
//          to the server.
/
00176, 00000, "Packet security check failed."
// *Cause:  The check of the security attributes of a packet failed.
// *Action: Check the trace file for details about the failure. It is possible
//          that a malicious user is attempting to send an invalid packet to
//          GNS.
/
00177, 00000, "Invalid packet type received."
// *Cause:  GNS received a packet whose type is unknown.
// *Action: Check the trace file for details about the failure. It is possible
//          that a malicious user is attempting to send an invalid packet to
//          GNS.
/
00178, 00000, "Resolution of name \"%s\" failed."
// *Cause: GNS failed to retrieve the address of the specified name.
// *Action: Check to make sure that an address for the name has been registered
//          with GNS. If it is configured, check to make sure that DNS has been
//          properly configured.
/
00179, 00000, "No forwarded query received from DNS for name in \"%s\" domain, check DNS configuration"
// *Cause:  A query was not forwarded from DNS to GNS for a name in the
//          subdomain that it services.
// *Action: Check the configuration of DNS. Make sure that it contains the
//          required forwarding directive contained in the following message.
/
/
00180, 00000, "If BIND is being used and the zone is being forwarded, the entry will likely look like the following:"
// *Cause:  This message is displayed when the GNS self-check fails.
// *Action: Ensure that the configuration of DNS has the entry listed in the
//          message that follows this one.
/
/
00181, 00000, "zone %s { type forward; forward only; forwarders { %s port %d; }; };"
// *Document: NO
// *Cause:
// *Action: Entry that needs to exists in DNS so that it forwards to GNS.
/
00182, 00000, "%s Unable to resolve self-check name."
// *Cause:    This is an informational message which accompanies other messages
//            describing a self-check failure.
// *Action:   Examine the accompanying error messages for more information as
//            to the cause of the problem.
/
00183, 00000, "Number of retries exceeded maximum: %u."
// *Cause:  An operation failed after the maximum number of retries.
// *Action: Examine the accompanying message(s) for the reasons to why this
//          error occurred.
/
00184, 00000, "Operation has to be retried."
// *Cause:  An operation failed because it could not be performed at this time
//          and should be tried again later`.
// *Action: Examine the accompanying message(s) for details about the operation
//          that was performed.
/
00185, 00000, "Invalid argument."
// *Cause:  An argument was passed to a function which was incorrect. In the
//          case of a string, for example, a string will be invalid if it is
//          null or has a zero length.
// *Action: Supply a valid argument.
/
00186, 00000, "Insufficient privileges."
// *Cause: The user attempted an operation for which he or she does not have
//          sufficient privileges.
// *Action: Either have the system administrator grant the needed privileges or
//          re-try the operation as a user which has the needed privileges.
/
00187, 00000, "Listening address \"%s\" is not on the public network."
// *Cause:  The address specified as the address on which GNS is to listen is
//          not on the public network.
// *Action: Specify a different address which is on the public network.
/
00188, 00000, "The value for parameter \"%s\": %d may only be from %d to %d."
// *Cause: The value for a parameter is outside the range of permitted values.
// *Action: Specify a value within the range.
/
00189, 00000, "query for records stored in GNS."
// *Document: NO
// *Cause:  
// *Action:  
/
00190, 00000, "No records found for \"%s\"."
// *Cause:  No records could be found for the specified name in GNS.
// *Action: Specify a name which exists in GNS.
/
00191, 00000, "No records registered."
// *Cause:  A query was made for the names registered in GNS but none were
//          found.
// *Action: Re-run the query after names have been advertised.
/
00192, 00000, "%s Open of OCR key \"%s\" failed.\n  %s"
// *Cause: GNS was unable to open the specified OCR key.
// *Action: Examine the accompanying error for details about what occurred.
/
00193, 00000, "Deletion of OCR key \"%s\" failed.\n  %s"
// *Cause: GNS was unable to delete the specified OCR key.
// *Action: Examine the accompanying error for details about what occurred.
/
00194, 00000, "Time needed for resolution of name \"%s\": %s ms exceeded threshold of %s ms"
// *Cause:  Name resolution took longer than the expected time.
// *Action: This may indicate a problem in the network or DNS configuration and
//          should be investigated by each administrator.
/
00195, 00000, "Query received for subdomain \"%s\" from server %s port %s at %s"
// *Document: NO
// *Cause:  
// *Action:  
/
// 00196, 00000, "UNUSED"
// *Cause:
// *Action:
/
00197, 00000, "Self-check failed due to failure in name resolution."
// *Cause: The self-check failed because it was not possible to resolve the
//          self-check name into the address used for reference.
// *Action: Examine the errors that follow the message for further information
//          as to the cause.
/
00198, 00000, "If a zone is being delegated to GNS, the entries needed to be added to the DNS configuration will likely look like the following:"
// *Document: NO
// *Cause:  
// *Action:  
/
00199, 00000, "%s NS %s"
// *Document: NO
// *Cause:  
// *Action:  Entry that needs to exist in DNS so that it delegates the
//           subdomain to node where GNS is running.
/
00200, 00000, "%s. %s"
// *Document: NO
// *Cause:  
// *Action:  Entry that needs to exist in DNS so that GNS traffic routed to the
//           GNS VIP.
/
00201, 00000, "first self-check name resolution failed."
// *Cause: GNS was unable to resolve the name that it uses for the self-check
//          the first time after it started.
// *Action: Examine the logs for more information about the error.
/
00202, 00000, "first self-check failed."
// *Cause:  GNS was unable run the self-check the first time after it started.
// *Action: Examine the logs for more information about the error.
/
00203, 00000, "self-check succeeded after failure."
// *Document: NO
// *Cause:  
// *Action:  
/
00204, 00000, "self-check succeeded while in \"recovery\" state."
// *Document: NO
// *Cause:  
// *Action:  
/
00205, 00000, "self-check failed while in \"recovery\" state."
// *Cause:  The self-check had previously succeeded after a failure but has
//          failed again.
// *Action: Examine the logs for more information about the failure.
/
00206, 00000, "Creation of a network endpoint failed."
// *Cause:  The creation of a listening endpoint failed.
// *Action: Examine the accompanying error stack for more information about the
//          error.
/
00207, 00000, "Creation of a network endpoint failed due to lack of permissions."
// *Cause:  The creation of a listening endpoint failed because the server did
//          not have the needed permissions.
// *Action: Examine the accompanying error stack for more information about the
//          error.
/
00208, 00000, "Network endpoint \"%s\" already in use."
// *Cause:  The creation of an endpoint failed because another process is using
//          it.
// *Action: If another GNS instance is running, this error is expected.
//          Otherwise, terminate the process using the address or start GNS on
//          another node.
/
00209, 00000, "Listen for DNS requests failed. IP address %s port %u is in use."
// *Cause:  Listening for requests from the DNS server(s) failed because
//          another process is using the address.
// *Action: If another GNS instance is running, this error is expected.
//          Otherwise, terminate the process using the address or start GNS on
//          another node.
/
00210, 00000, "failed to get value for OCR key \"%s\".\n  %s"
// *Cause:  It was not possible to retrieve the specified value from OCR.
// *Action: Examine the accompanying error stack for more information about the
//          error.
/
00211, 00000, "OCR batch operation failed.\n  %s"
// *Cause:  Setting a set of OCR key values failed.
// *Action: Examine the accompanying error stack for more information about the
//          error.
/
00212, 00000, "name address port [ time-to-live ]"
// *Document: NO
// *Cause:  
// *Action:  
/
00213, 00000, "name"
// *Document: NO
// *Cause:  
// *Action:  
/
// 00214, 00000, "UNUSED"
// *Cause:
// *Action:
/
00215, 00000, "no service specified"
// *Cause:  The service was required in an SRV record, bug not specified.
// *Action: Specify a the service.
/
00216, 00000, "invalid SRV service: \"%(1)s\""
// *Cause:  The service specified was not valid.
// *Action: Specify a valid service.
/
00217, 00000, "no target specified in SRV record"
// *Cause:  The target was required in an SRV record, but not specified.
// *Action: Specify a target for the SRV record.
/
00218, 00000, "invalid SRV record target: \"%(1)s\""
// *Cause:  The target in the SRV record specified was not a valid DNS name.
// *Action: Specify a valid SRV record target. It must be a valid DNS name.
/
00219, 00000, "SRV record for service: \"%(1)s\" does not exist"
// *Cause:  An SRV record for the specified service did not exist.
// *Action: Specify a service which exists.
/
00220, 00000, "SRV record for service \"%(1)s\" already exists"
// *Cause:  An SRV record for the specified service already existed.
// *Action: Specify a service which does not exist.
/
00221, 00000, "invalid SRV record port number: %(1)u. Maximum port number is %(2)u"
// *Cause:  The value specified for the port number of an SRV record was
//          invalid.
// *Action: Specify a value which less than or equal to the maximum value.
/
00222, 00000, "invalid SRV record priority: %(1)u. Maximum priority is %(2)u"
// *Cause:  The value specified for the priority of an SRV record was invalid.
// *Action: Specify a value which less than or equal to the maximum value.
/
00223, 00000, "invalid SRV record weight: %(1)u. Maximum weight is %(2)u"
// *Cause:  The value specified for the weight of an SRV record was invalid.
// *Action: Specify a value which less than or equal to the maximum value.
/
00224, 00000, "No SRV record name specified"
// *Cause:  The name of the SRV record was not specified.
// *Action: Specify a name.
/
00225, 00000, "Invalid SRV record name: \"%(1)s\""
// *Cause:  The name specified for the SRV record was not a valid DNS name.
// *Action: Specify a valid DNS name. See RFC 1034 for details.
/
00226, 00000, "Invalid SRV record protocol: \"%(1)s\""
// *Cause:  The protocol specified for the SRV record was not valid.
// *Action: Specify a valid protocol or nothing to get the default.
/
00227, 00000, "Component \"%(1)s\" of record does not exist."
// *Cause:  An error occurred because the specified component did not exist.
// *Action: Examine the accompanying error messages for details about the
//          error.
/
// 00228, 00000, "UNUSED"
// *Cause:  
// *Action:  
/
00229, 00000, "No SRV record protocol specified"
// *Cause:  The protocol for the SRV record was not specified.
// *Action: Specify a protocol.
/
00230, 00000, "name ptr"
// *Document: NO
// *Cause:  
// *Action:  
/
// 00231, 00000, "UNUSED"
// *Document: NO
// *Cause:  
// *Action:  
/
00232, 00000, "name txt"
// *Document: NO
// *Cause:  
// *Action:  
/
00233, 00000, "name"
// *Document: NO
// *Cause:  
// *Action:  
/
00234, 00000, "No PTR records found for \"%(1)s\""
// *Cause:  No PTR records could be found for the specified name.
// *Action: Either add PTR records for the name or specify another name.
/
00235, 00000, "PTR record already exists for \"%(1)s\""
// *Cause:  An attempt was made to add a PTR record which already exists.
// *Action: Specify a PTR record which does not exist.
/
00236, 00000, "TXT record already exists for \"%(1)s\""
// *Cause:  An attempt was made to add a TXT record which already exists.
// *Action: Specify a TXT record which does not exist.
/
00237, 00000, "No TXT records found for \"%(1)s\""
// *Cause:  No TXT records could be found for the specified name.
// *Action: Either add TXT records for the name or specify another name.
/
00238, 00000, "Length of TXT record (%(1)s bytes) exceeds maximum length (%(2)u)"
// *Cause:  The TXT record was longer than the maximum.
// *Action: Specify a shorter record.
/
00239, 00000, "Invalid TXT record"
// *Cause:  The TXT record specified does not conform with the standard (RFC
//          1035).
// *Action: Specify a record which conforms with the standard.
/
00240, 00000, "Invalid PTR record: \"%(1)s\""
// *Cause:  The PTR record specified does not conform with the standard (RFC
//          1035).
// *Action: Specify a record which conforms with the standard.
/
00241, 00000, "Record \"%(1)s\" already exists."
// *Cause:    An attempt was made to add a record which already exists.
// *Action:   Specify a record which does not exist or use force option to
//            replace existing record.
/
00242, 00000, "Record type %(1)s for record \"%(2)s\" does not exist."
// *Cause:    An attempt was made to query a record which does not exist.
// *Action:   Specify a record which is already registered with GNS.
/
00243, 00000, "Length of name \"%(1)s\" (%(2)u) exceeds maximum allowed %(3)u"
// *Cause:  The length of a name specified exceeds the allowed limit.
// *Action: Specify a shorter name.
/
00244, 00000, "Length of qualfied name \"%(1)s.%(2)s\" (%(3)u) exceeds maximum allowed %(4)u"
// *Cause:  The length of a name plus the GNS subdomain specified exceeded the
//          allowed limit.
// *Action: Specify a shorter name.
/
00245, 00000, "name value"
// *Document: NO
// *Cause:  
// *Action:  
/
00246, 00000, "No name specified for a PTR record."
// *Cause:  A name was not specified for a Pointer Resource (PTR) record.
// *Action: Specify a name which complies with the syntax described in RFC
//          1034 issued by the Internet Engineering Task Force (www.ietf.org).
/
00247, 00000, "No target specified for a PTR record."
// *Cause: A name was not specified as the target of the Pointer Resource (PTR)
//         record.
// *Action: Specify a name which complies with the syntax described in RFC
//          1034 issued by the Internet Engineering Task Force (www.ietf.org).
/
00248, 00000, "No name specified for TXT record."
// *Cause:  A name was not specified for a text (TXT) record.
// *Action: Specify a name which complies with the syntax described in RFC
//          1034 issued by the Internet Engineering Task Force (www.ietf.org).
/
00249, 00000, "No value specified for a TXT record."
// *Cause:  A value was not specified for a text (TXT) record.
// *Action: The value of a TXT record is a set of keyword and value pairs
//          separated by commas. The values must comply with the syntax
//          described in RFC 1464 issued by the Internet Engineering Task
//          Force (www.ietf.org).
/
00250, 00000, "No name specified for refresh."
// *Cause:  A name was not specified for a refresh operation.
// *Action: Specify a name which complies with the syntax described in RFC 1034
//          issued by the Internet Engineering Task Force (www.ietf.org). The
//          name must correspond to a record which exists in Grid Naming
//          Service (GNS).
/
00251, 00000, "GNS attempt to re-bind listening endpoints failed."
// *Cause:  GNS rebind failed.
// *Action: Examine the accompanying error messages for details about the
//          error.
/
00252, 00000, "Re-bind GNS to its listening endpoints."
// *Document: NO
// *Cause: 
// *Action: 
/
00253, 00000, "Invalid key"
// *Cause:  A key supplied for an operation is invalid.
// *Action: Supply a valid key.
/
00254, 00000, "Open of credentials file \"%s\" failed."
// *Cause:  Opening the specified credentials file failed.
// *Action: Specify a file which exists and has the proper permissions. The
//          file must be readable by the user performing the operation.
/
00255, 00000, "Credentials file \"%s\" does not exist."
// *Cause:  The credentials file specifed could not be found.
// *Action: Specify a file that exists.
/
00256, 00000, "Initialization of credentials import failed."
// *Cause: The steps required to initialize the import of credentials failed.
// *Action: Examine the accompanying errors for details about the failure.
/
00257, 00000, "Credentials file \"%s\" already exists."
// *Cause:  The credentials file specified already exists.
// *Action: Specify a file that does not exist.
/
00258, 00000, "Credentials file \"%s\" could not be created."
// *Cause:  The credentials file specified could not be created.
// *Action: Specify a file which does not exist or is writable to the user
//          performing the export.
/
00259, 00000, "Initialization of credentials export failed."
// *Cause:  The steps required to initialize the export of credentials failed.
// *Action: Examine the accompanying errors for details about the failure.
/
00260, 00000, "Credential verification failed."
// *Cause:  GNS was unable to verify the contents of a credentials file.
// *Action: Examine the accompanying errors for the cause.
/
00261, 00000, "Import of credentials failed."
// *Cause:  An error occurred while importing credentials used to contact the
//          GNS server.
// *Action: Examine the accompanying errors for more information.
/
00262, 00000, "Export of credentials failed."
// *Cause:  An error occurred while exporting credentials used to contact the
//          GNS server.
// *Action: Examine the accompanying errors for more information.
/
00263, 00000, "Length of service instance \"%(1)s\": %(2)s exceeds maximum: %(3)u."
// *Cause:  The length of the specified service instance exceeded the maximum
//          allowed.
// *Action: Specify a shorter service instance.
/
00264, 00000, "Invalid service instance: \"%s\"."
// *Cause:  The service instance contained characters which are not allowed
//          under the draft standard for DNS-based service discovery (see
//          http://files.dns-sd.org/draft-cheshire-dnsext-dns-sd.txt)
// *Action: Specify a service instance which complies with the standard.
/
00265, 00000, "The number of discovery addresses found exceeds the maximum of two."
// *Cause:  More than two discovery addresses were found in the cluster
//          configuration.
// *Action: Use 'srvctl modify gns' to correct the discovery addresses. If this
//          does not resolve the problem, contact Oracle Support Services. 
/
00266, 00000, "Both of the discovery addresses are of the same type."
// *Cause:  The Grid Naming Service (GNS) configuration was found to have two
//          IPv4 or two IPv6 discovery addresses.
// *Action: Use 'srvctl modify gns' to correct the discovery addresses. If this
//          does not resolve the problem, contact Oracle Support Services.
/
00267, 00000, "All discovery addresses in the GPnP profile are invalid."
// *Cause:  No addresses were found in the Grid Plug and Play (GPnP) profile 
//          which could be used to locate an instance of the Grid Naming Service
//          (GNS).
// *Action: Use 'srvctl modify gns' to correct the discovery addresses. If this
//          does not resolve the problem, contact Oracle Support Services. 
/
00268, 00000, "Initialization of GPnP failed."
// *Cause:  An attempt to initialize Grid Plug and Play (GPnP) while modifying
//          the Grid Naming Service (GNS) configuration failed.
// *Action: Examine the accompanying error messages for details. 
/
00269, 00000, "Failed to get GPnP profile or profile value."
// *Cause:  An attempt to access the Grid Plug and Play (GPnP) profile or a
//          value within the profile failed while modifying Grid Naming Service
//          (GNS) configuration.
// *Action: Examine the accompanying error messages for details. 
/
00270, 00000, "Failed to set discovery address."
// *Cause:  An attempt to modify Grid Naming Service (GNS) discovery address
//          failed.
// *Action: Examine the accompanying error messages for details. 
/
00271, 00000, "Discovery address \"%s\" already exists in configuration."
// *Document: NO
// *Cause: 
// *Action:
/
00272, 00000, "Thread has been stopped."
// *Cause:  This error is used internally by GNS to indicate that a thread
//          has been stopped.
// *Action: This error should not occur in normal use. Contact Oracle Support
//          Services.
/
00500, 00000, "credentials extraction failed"
// *Cause:  The attempt to validate the provided Grid Naming Service (GNS)
//          credentials failed.
// *Action: Examine the accompanying errors for more information.
/
00501, 00000, "credentials initialization failed"
// *Cause:  Initialization of the subsystem used for credentials validation
//          failed.
// *Action: Generally, this error should not be visible. If it occurs, contact
//          Oracle Support Services.
/
00502, 00000, "CRS initialization failed: %s"
// *Cause:  Grid Naming Service (GNS) was unable to initialize Cluster Ready
//          Services (CRS) for its use.
// *Action: Examine the accompanying errors for more information about the
//          error.
/
00503, 00000, "CRS operation \"%s\" failed with error: %u"
// *Cause:  A Cluster Ready Services (CRS) operation failed.
// *Action: This error should not occur in normal use. Contact Oracle Support
//          Services.
/
00504, 00000, "unsupported version: %s"
// *Cause:  The version of an object or operation was not supported by Grid
//          Naming Service (GNS).
// *Action: This error should not occur in normal use. Contact Oracle Support
//          Services.
/
0505, 00000, "No domain is being forwarded."
// *Document: NO
// *Cause:  
// *Action:  
/
00508, 00000, "OCR is not available"
// *Cause:  The Oracle Cluster Registry (OCR) was not available yet for use by
//          Grid Naming Service (GNS).
// *Action: This error should not occur in normal use. Contact Oracle Support
//          Services.
/
00509, 00000, "Import of GNS key failed."
// *Cause:  An error occurred while importing GNS key. 
// *Action: Examine the accompanying error messages.
/
00510, 00000, "CRS is not running"
// *Cause:  An operation which attempted to access the Oracle Cluster Registry
//          failed because the Cluster Ready Services (CRS) was not running.
// *Action: Run the 'crsctl check crs' command to determine if CRS is running.
//          If it is running, contact Oracle Support Services. Otherwise,
//          restart CRS.
/
00511, 00000, "GNS client cluster data already exists."
// *Cause:  An attempt to import client data failed because client data has 
//          already been imported.
// *Action: Use 'srvctl modify gns -clientdata' to modify existing client data.
/
00512, 00000, "Unsupported record type: %s"
// *Cause:  The record type specified was unsupported.
// *Action: Specify a supported record type.
/
00513, 00000, "Empty or corrupt import file: %s"
// *Cause:  Credential import failed because the import file was empty or corrupt.
// *Action: Specify a valid import file and try again.
/
00514, 00000, "Removal of GNS credentials failed."
// *Cause:  An error occurred while removing the GNS credentials from client cluster.
// *Action: Examine the accompanying error messages.
/
00515, 00000, "%(1)s failed to set the ownership for OCR key \"%(2)s\".\n %(3)s"
// *Cause: GNS was unable to set the ownership for OCR key.
// *Action: Examine the accompanying error message for details about what occurred.
/
00516, 00000, "File \"%s\" is not a valid file."
// *Cause: The attempted operation failed because the file referenced by the
//         indicated pathname was of the wrong type.
// *Action: Specify a valid file and retry.
/
00517, 00000, "length of component \"%(1)s\": %(2)s exceeds the maximum: %(3)u"
// *Cause:  The length of a component of a name exceeded the maximum allowed.
// *Action: Specify a shorter component.
/
00518, 00000, "Thread group \"%s\" failed to stop."
// *Cause:  A group of threads belonging to the Grid Naming Service (GNS)
//          process failed to stop. This can happen if one or more threads in
//          the group becomes unresponsive because of a system problem.
// *Action: This error can be ignored if the GNS process stops despite this
//          error. If the GNS process does not stop, contact Oracle Support
//          Services.
/
00519, 00000, "Thread \"%s\" failed to stop."
// *Cause:  A thread belonging to the Grid Naming Service (GNS) process failed
//          to stop. This can happen if the thread becomes unresponsive because
//          of a system problem.
// *Action: This error can be ignored if the GNS process stops despite this
//          error. If the GNS process does not stop, contact Oracle Support
//          Services.
/
00520, 00000, "invalid PTR target: \"%(1)s\""
// *Cause:  An invalid string was specified for the target of a PTR record. The
//          target must be a valid DNS name.
// *Action: Specify a target which complies with the syntax described in RFC
//          1034 issued by the Internet Engineering Task Force (www.ietf.org).
//          The target must correspond to a record which exists in Grid Naming
//          Service (GNS).
/
00521, 00000, "No port available."
// *Cause:  The Grid Naming Service (GNS) was unable to find a port to listen
//          on.
// *Action: This error should not generally occur. Contact Oracle Support
//          Services.
/
00522, 00000, "invalid instance role: \"%(1)s\""
// *Cause:  The instance role specified was not a valid role.
// *Action: Specify a valid GNS instance role name.
/
00523, 00000, "No value found for \"%(1)s\" attribute."
// *Cause:   The Grid Naming Service (GNS) did not get any value for 
//           for the indicated CRS attribute.
// *Action: Examine the accompanying error messages for details. 
/
00524, 00000, "NS query for subdomain \"%(1)s\" failed."
// *Cause:  The Grid Naming Service (GNS) was unable to contact the Domain Name
//          System (DNS) to get the name server (NS) record for the subdomain
//          that it serves.
// *Action: Examine the accompanying errors and address any issues found. This
//          error may be transient and thus may be ignored. If it persists,
//          contact Oracle Support Services. 
/
00525, 00000, "no instance information found for subdomain \"%(1)s\""
// *Cause:  No name server (NS) record for the Grid Naming Service instance was
//          found in the Domain Name System (DNS).
// *Action: Request the DNS administrator to add an NS record for the GNS
//          subdomain.
/
00526, 00000, "invalid instance name: \"%(1)s\""
// *Cause:  The name of this instance of the Grid Naming Service either
//          contained characters which are not valid in a DNS label or was
//          longer than the maximum length of a DNS label.
// *Action: The Grid Naming Service (GNS) uses the name of the cluster as its
//          instance name. Specify a cluster name which complies with the
//          syntax described in RFC 1034 issued by the Internet Engineering
//          Task Force (www.ietf.org).
/
00527, 00000, "primary instance \"%(1)s\" already running on cluster \"%(2)s\""
// *Cause:  Start of primary GNS instance failed because it was already running.
//          There must be only one primary GNS instance running in a
//          multi-cluster environment.
// *Action: If desired, stop the running GNS instance with command
//          'srvctl stop gns' and then start the new primary instance on 
//          this cluster.
/
00528, 00000, "failed to get data from zone"
// *Cause: A zone transfer failed because the fetch of a record from a transfer
//         message failed.
// *Action: Examine the accompanying error messages for details. 
/ 
00529, 00000, "failed to verify zone data"
// *Cause: Zone data received was not in the expected format.
// *Action: Examine the accompanying error messages for details.
/ 
00530, 00000, "failed to save the received zone"
// *Cause: An attempt to save the zone data on a peer instance failed.
// *Action: Examine the accompanying error messages for details.
/ 
00531, 00000, "domain name in zone does not match configured domain"
// *Cause: A zone operation failed because an invalid domain name was found in
//         a transfer message.
// *Action: Examine the accompanying error messages for details.
/ 
00532, 00000, "Signature verification failed."
// *Cause:  The verification of the signature attached to a record failed.
// *Action: This error should not be seen ordinarily. If it appears, contact
//          Oracle Customer Service and provide details about how and when the
//          error occurred.
/
00533, 00000, "The record TTL %(1)s does not match existing records with TTL %(2)s."
// *Cause:  A record with the same type with a different time to live was
//          detected. This is a violation of RFC 4034 issued by the Internet
//          Engineering Task Force (www.ietf.org).
// *Action: Either create the new record with the same time to live as the
//          existing record or remove the existing record and create a new one.
/
00534, 00000, "Validation of record failed."
// *Cause:  An error occurred while validating a record.
// *Action: This error should not be seen ordinarily. If it appears, contact
//          Oracle Customer Service and provide details about how and when the
//          error occurred. Please supply any other messages which accompanied
//          this one.
/
00535, 00000, "failed to get the CRS active version"
// *Cause:  An operation failed because it could not get CRS active version.
// *Action: Examine the accompanying error messages for details.
/
00536, 00000, "Initialization of OLR at level %u failed."
// *Cause:  Initialization of OLR to the specified level failed.
// *Action: Examine the accompanying error messages for details.
/ 
00537, 00000, "failed to set zone data"
// *Cause: An advertise operation failed because an error occurred
//         when setting zone data.
// *Action: Examine the accompanying error messages for details.
/
00538, 00000, "GNS instance role is already \"%s\"."
// *Cause:  An attempt was made to modify the GNS instance role, but it was
//          running with the specified role.
// *Action: None.
/
00539, 00000, "Primary GNS instance was not found."
// *Cause:  An attempt to modify the GNS instance role to primary failed 
//          because no existing primary instance was found and the
//          '-force' option was not supplied.
// *Action: If desired, use '-force' option to promote the current GNS i
//          instance to primary role.
/
00540, 00000, "Primary instance was found."
// *Cause:  An attempt to modify the GNS instance role to primary failed 
//          because a primary instance was found and the '-force' option 
//          was supplied.
// *Action: Omit the '-force' option and try the operation again.
/
00541, 00000, "failed to send modify role command to primary"
// *Cause:  An attempt to modify the GNS instance role failed because 
//          propagation to the primary instance was unsuccessful.
// *Action: Examine the accompanying error messages for details.
/
00542, 00000, "failed to modify instance role"
// *Cause:  An operation to modify the GNS instance role failed. 
// *Action: If desired, use the '-force' option to promote the GNS instance to 
//          primary instance.
/
00543, 00000, "no GNS instance found"
// *Document: NO
// *Cause:
// *Action:
/
00544, 00000, "Modify GNS instance role."
// *Document: NO
// *Cause:
// *Action:
/
00545, 00000, "failed to get the CRS software version"
// *Cause:  An operation failed because it could not get CRS software version.
// *Action: Examine the accompanying error messages for details.
/
00546, 00000, "GNS cannot be removed because one or more leaf nodes are present."
// *Cause:  Removing GNS failed because one or more leaf nodes were still
//          running in the cluster.
// *Action: Delete the leaf nodes or change them to hub role, then retry the GNS
//          remove operation.
/
00547, 00000, "failed to get node information from CSS"
// *Cause:  A GNS operation failed because it could not get node information
//          from CSS.
// *Action: Examine the accompanying error messages for details.
/
00548, 00000, "Name \"%(1)\" expired."
// *Cause:  The specified name expired.
// *Action: Contact Oracle Support Services.
/
00549, 00000, "Record expired."
// *Cause:  The specified record expired.
// *Action: Contact Oracle Support Services.
/
00550, 00000, "GNS failed to upgrade records."
// *Cause:  An error occurred while upgrading Grid Naming Service (GNS) records.
// *Action: Contact Oracle Support Services.
/
00551, 00000, "Role cannot be modified on a GNS client cluster."
// *Cause:  An attempt to change the role of a Grid Naming Service (GNS) client 
//          cluster was rejected because the role can only be modified on a 
//          (GNS) server cluster.
// *Action: If the cluster is not a GNS client cluster, the message
//          was issued in error. Contact Oracle Support Services.
/
00552, 00000, "Section %(1)s cannot be found in the Cluster Manifest File %(2)s."
// *Cause:  An attempt to process the Cluster Manifest File failed because the 
//          indicated section for the Grid Naming Service (GNS) was not found.
// *Action: Recreate the Cluster Manifest File in the Domain Services Cluster by
//          exporting the GNS credential and provide the new Cluster Manifest
//          File during the interview.
/
/ 
00553, 00000, "Cluster \"%(1)s\" is already registered."
// *Cause:  An attempt was made to register the specified cluster with the Grid
//          Naming Service (GNS) but an entry for the cluster already existed. A
//          cluster can only be registered once. 
// *Action: Specify a different cluster name.
//          
/
00554, 00000, "Cluster \"%(1)s\" is not registered."
// *Cause:  An attempt was made to perform an operation from the specified
//          cluster with the Grid Naming Service (GNS) but the cluster was not
//          registered with GNS.
// *Action: Either specify a different cluster name or register the cluster.
/
00555, 00000, "Clusters are still registered."
// *Cause:  An attempt was made to delete the primary instance of the Grid
//         Naming Service (GNS) but clusters were still registered with it.
// *Action: Either select another instance to be the primary or delete the
//          registrations for the clients.
/
00556, 00000, "Only the primary instance may perform the operation."
// *Cause:  An operation failed because it was attempted on an instance of the
//          Grid Naming Service (GNS) which is not primary.
// *Action: Examine the accompanying error messages for for more details.
/
00557, 00000, "Cluster is not authorized."
// *Cause:  An attempt by the Grid Naming Service (GNS) server to perform an
//          operation encountered an unexpected authorization error.
// *Action: Contact Oracle Support Services.
//          
/
00558, 00000, "Invalid cluster GUID \"%(1)s\"."
// *Cause:  The cluster GUID was invalid. A GUID may only contain ASCII
//          characters.
// *Action: Retry the operation, specifying a valid cluster GUID.
/
00559, 00000, "Cluster registration failed."
// *Cause:  The registration of a cluster with the Grid Naming Service (GNS)
//          failed. The accompanying messages provide detailed failure
//          information.
// *Action: Examine the accompanying messages, resolve the problems indicated
//          there and then retry the operation.
/
00560, 00000, "Rename of cluster \"%(1)s\" to \"%(2)s\" failed."
// *Cause:  The Grid Naming Service (GNS) server attempted to rename a cluster
//          but the operation failed.
// *Action: Contact Oracle Support Services and supply the accompanying
//          messages.
/
00561, 00000, "Invalid cluster GUID: \"%(1)s\". Length: %(2)s. Required length: %(3)s characters."
// *Cause:  The cluster GUID was invalid. Its length must match the specified
//          value.
// *Action: Retry the operation, specifying a valid cluster GUID of the
//          required length.
/
00562, 00000, "failed to generate certificate for cluster \"%(1)s\""
// *Cause:  An attempt to create a member cluster failed because an error
//          occurred in generating a member cluster certificate as part of 
//          creating the manifest file.
// *Action: Contact Oracle Support Services and supply the accompanying
//          errors.
/
00563, 00000, "Wallet creation failed."
// *Cause:  An attempt to create an instance of the Grid Naming Service was not
//          fully successful. The wallet that holds security information about
//          the instance could not be created.
// *Action: Contact Oracle Support Services and supply the messages that
//          accompany this one.
/
00564, 00000, "Wallet retrieval failed."
// *Cause:  An attempt to execute a command on the Grid Naming Service failed
//          because the wallet needed to verify the identity of the cluster
//          where the command is being invoked could not be retrieved.
// *Action: Contact Oracle Support Services and supply the messages that
//          accompany this one.
/
00565, 00000, "Authentication failed."
// *Cause:  A command attempted on the Grid Naming Service (GNS) server failed
//          because it was not possible to verify the identity of the cluster
//          from the command was being sent.
// *Action: Contact Oracle Support Services and supply the messages that
//          accompany this one.
/
00566, 00000, "Failed to drop Grid Naming Service privileges."
// *Cause:  An attempt to start the Grid Naming Service failed
//          because the server was not to able to switch
//          from the root user to a less-privileged user.
// *Action: Contact Oracle Support Services and supply the messages that
//          accompany this message.
/
