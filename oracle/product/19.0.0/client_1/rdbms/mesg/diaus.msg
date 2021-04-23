/////////////////////////////////////////////////////////////////////////////
//  48000 - 52999 Reserved for Diagnosability error messages
/////////////////////////////////////////////////////////////////////////////
/
/ Copyright (c) 2006, 2017, Oracle and/or its affiliates. All rights reserved.
/
/ NAME
/   diaus.msg     
/ DESCRIPTION
/   Error messages for Diagnosability workBench Generic.
/
/ NOTES 
/   In RDBMS, these errors are part of the ORA facility.
/   Outside of RDBMS, these errors are typically part of the DIA facility.  
/
/ MODIFIED
/   mfallen    12/08/17 - bug 12932229: add message 49317 to e48000.msg
/   mfallen    12/08/17 - bug 7140727:  add message 49316 to e48000.msg
/   svaziran   05/10/16 - bug 23192127: add message 49804 to e48000.msg
/   tseibold   03/07/16 - bug 22274147: improve message 49801
/   tseibold   02/10/16 - bug 22153134: add message 49803 to e48000.msg
/   tseibold   01/06/16 - bug 22469511: add message 49802 to e48000.msg
/   mfallen    12/01/15 - bug 22148547: add positional qualifiers
/   tseibold   10/23/15 - bug 21902621: add message 49801 to e48000.msg
/   dmmorton   06/03/15 - bug 20764435: add message 48809, 48810 to e48000.msg
/   svaziran   03/22/15 - bug 19217529: add message 49900 to e48000.msg
/   tseibold   11/19/14 - lrg 14152401: add message 48941 to e48000.msg
/   svaziran   11/05/14 - bug 19553749: add message 48941
/   tseibold   10/21/14 - bug 18919088: creation of diaerror.txt
/   mfallen    10/13/14 - fixing typos
/   tseibold   05/01/14 - bug 9118644: added message 49800
/   xinjing    04/03/14 - Bug 18436647 - Message 48323
/   tseibold   01/31/14 - bug 16659853: added events error 49174
/   tseibold   06/03/13 - bug 16770321: added IPS error 49418 and error 48618
/   tseibold   04/16/13 - add errors for ADRCI set subcommands (48807,-,08)
/   shiyadav   06/01/12 - error for invalid value for _max_incident_file_size
/   yafan      04/03/12 - Add descriptions for ASM health checker (51633,-,38)
/   yafan      12/29/11 - Add descriptions for ASM health checker (51628,-,32)
/   shiyadav   06/06/11 - errors for diagfw pl/sql interface 
/   gmengel    04/20/11 - Add descriptions for ASM health checker (51625,26,27)
/   mjstewar   10/07/10 - bug-8672808 - Message 51317
/   husun      11/05/09 - add Failover has happened message
/   husun      08/05/09 - add mesg for DBKH_F_ID_DF_INCONS
/   husun      07/21/09 - Add Create Datafile repair
/   mjstewar   07/16/09 - Add DRA mesg
/   husun      07/20/09 - Restore controlfile from autobackup as standby
/   husun      06/24/09 - add Standby Control File repairs
/   husun      12/11/08 - add standby damage descriptions
/   gmengel    12/01/10 - Add messages for ASM health checker (51409,10,11)
/   pbelknap   06/17/10 - reserve for dbgxtk
/   mfallen    01/04/10 - add ips finalize progress messages
/   husun      07/15/09 - bug-8689610
/   gngai      07/06/09 - new diag message
/   mjstewar   09/11/08 - DRA: new import messages
/   bkuchibh   12/08/08 - fix bug 6632278: NLS support for check names, descriptions
/   husun      03/10/08 - add SRL Unavailable failure message (51337)
/   husun      11/14/07 - add datafile has nologging failure (51336)
/   husun      09/05/08 - add dataguard repair messages
/   mjstewar   09/12/08 - File/TS Offline: New DRA messages
/   husun      09/02/08 - Add datafile is offline failure message
/   husun      06/20/08 - add blocksize / disk sector incompatible failure
/   jklein     09/25/08 - legal names for views
/   ilistvin   09/17/08 - 
/   amysoren   08/12/08 - add runtime defined product type related errors
/   gngai      07/14/08 - added view error
/   gmengel    07/11/08 - Add messages 51407, 51408
/   ilistvin   06/18/08 - Add events++ messages
/   husun      06/17/08 - Add FSFO message
/   husun      06/17/08 - 51248 remove 'switchover' from message
/   mdilman    05/27/08 - add 51334
/   avaliani   05/15/08 - bug 5880710: conditional snapshot errors
/   gngai      05/22/08 - added view msg
/   gmengel    04/25/08 - Add messages 51405, 51406
/   jklein     04/10/08 - 
/   mdilman    04/01/08 - bug-6934846: change 51248
/   bkuchibh   03/27/08 - asm check integration
/   gngai      03/18/08 - 
/   husun      03/14/08 - bug-6893690 - add repair message for open resetlogs
/   ilistvin   02/28/08 - add new Events++ messages
/   jklein     01/31/08 - 
/   siyarlag   12/24/07 - Add messages 51403, 51404
/   gmengel    12/05/07 - Add messages for ASM Health Monitor
/   mfallen    01/03/08 - add ips message
/   husun      10/02/07 - add backup control file to trace message
/   husun      09/19/07 - add controlfile block failure message
/   mjstewar   10/30/07 - Add DRA timeout msg
/   ilistvin   10/16/07 - add argument to msg 49160
/   ilistvin   10/02/07 - reserve error range for Events++ parser errors
/   ysarig     09/10/07 - Add 48763 error message
/   husun      08/16/07 - bug-4454144 change 51273 message 
/   mfallen    07/24/07 - add ips date handling message
/   mlfeng     06/26/07 - add error message for invalid file name
/   mlfeng     06/13/07 - error for fsync
/   mlfeng     06/04/07 - error for not being able to read block file
/   mfallen    06/08/07 - add unpack warnings message
/   mlfeng     05/11/07 - more detailed error
/   mlfeng     05/09/07 - error messages
/   gngai      05/08/07 - added 48324
/   bdagevil   05/16/07 - change %u into %s
/   mlfeng     04/27/07 - error for wrong directory
/   jklein     05/06/07 - backup
/   hayu       04/26/07 - add new message for viewer
/   mlfeng     04/02/07 - get current working directory
/   mlfeng     04/05/07 - error messages for validating paths and files
/   hayu       03/21/07 - add viewer message
/   mlfeng     03/20/07 - OS command to copy a file
/   hayu       02/11/07 - add messages for adrci report
/   gngai      03/02/07 - added 48321
/   jklein     02/20/07 - added 48255
/   mlfeng     03/05/07 - update errors
/   bdagevil   02/20/07 - add error for ADR switch home
/   mlfeng     02/13/07 - errors for path and file conversion
/   mfallen    03/02/07 - add incident type message
/   mdilman    02/12/07 - add 51326, 51327
/   mjstewar   02/01/07 - Add new DRA messages
/   mdilman    12/28/06 - add 51317-25; change format of DRA messages
/   husun      12/27/06 - add Datafile Unknown (51312) and Repair (51317)
/   mfallen    02/15/07 - add flood-control message
/   dsampath   01/25/07 - add 49160
/   mlfeng     02/06/07 - error for not being to find valid adr base
/   hayu       01/22/07 - add viewer messages
/   gngai      02/12/07 - added show incident error
/   dsampath   12/06/06 - add DBGD_POSTFILTER
/   mlfeng     01/04/07 - clean up error reporting
/   mlfeng     10/12/06 - deferred initialization for ADR
/   mfallen    01/03/07 - add ips messages
/   amysoren   12/19/06 - add 49206
/   hayu       11/21/06 - add view interrupt error code
/   mlfeng     12/05/06 - more information when list dir fails
/   mlfeng     11/28/06 - where argument to get lock
/   hayu       11/22/06 - add error for lrm fail
/   mdilman    11/27/06 - add file number parameter to datafile failures
/   mfallen    11/27/06 - add ips messages
/   mlfeng     11/16/06 - move file system error
/   gngai      11/21/06 - added ami version errors
/   mlfeng     11/21/06 - permission error for block file
/   mlfeng     10/31/06 - check for file permissions
/   jklein     10/31/06 - new error for unlink directory
/   husun      11/07/06 - changed Control File is older then datafiles to add
/                         log files also (mesg 51100)
/   husun      11/03/06 - add DRA Check Error 51106
/   mfallen    10/24/06 - move adrci help topics to dbgvcis.c
/   hayu       10/26/06 - add help message
/   hayu       09/21/06 - add message for trace merging
/   mjstewar   10/05/06 - Changes to DRA messages
/   mlfeng     10/18/06 - clean up messages
/   mlfeng     09/26/06 - directory does not exist
/   mlfeng     10/03/06 - error message sync with code
/   mlfeng     10/10/06 - file length errors
/   jklein     10/12/06 - 48223 update
/   dsampath   09/21/06 - add errors to events++, for scope
/   dsampath   08/09/06 - Events++ cleanup
/   mjstewar   09/27/06 - New fails/repairs for DRA
/   husun      09/27/06 - add asm failure message
/   bkuchibh   09/28/06 - add new messages for amh layer 
/   mdilman    09/19/06 - change 51263, remove duplicated 51257
/   mdilman    09/17/06 - review comments for DRA messages
/   mdilman    08/28/06 - "multiple" -> "one or more" in DRA failures
/   mjstewar   08/24/06 - New DRA messages
/   gngai      09/12/06 - added create relation error
/   mlfeng     09/18/06 - error messages for parameters
/   mfallen    09/07/06 - add ips message
/   mlfeng     09/07/06 - add error for null input
/   mlfeng     09/12/06 - extra args to file lock
/   hayu       08/27/06 - add more adrci error
/   husun      07/26/06 - changed 51206 message 
/   husun      07/25/06 - Add Comment for Recover Until Cancel 
/   hayu       08/19/06 - add some uts errors
/   bkuchibh   08/17/06 - 
/   amysoren   08/14/06 - DDE async action generic error
/   gngai      08/13/06 - added adr not enabled error
/   hayu       08/12/06 - error for missing base path
/   ysarig     07/31/06 - Updating DDE errors
/   jklein     07/19/06 - partitioning of alert log 
/   hayu       07/25/06 - add more help message
/   mfallen    07/12/06 - add archiving/unarchiving error messages for ips 
/   balajkri   07/11/06 - txn diag integration with HM 
/   husun      07/07/06 - Changed Log Group Missing to Log Group Unavailable 
/   husun      06/30/06 - add 51303-6
/   bkuchibh   06/27/06 - add 51035 
/   mdilman    06/22/06 - change 51241
/   mdilman    06/20/06 - change 51273
/   bkuchibh   06/19/06 - add pseudo ctx message 
/   bdagevil   06/11/06 - error for parsing UTS Trace event 
/   bkuchibh   06/28/06 - add incident meter messages 
/   mlfeng     07/11/06 - refresh to 060710 
/   bdagevil   06/11/06 - error for parsing UTS Trace event 
/   mfallen    06/28/06 - add ads file time error message 
/   bkuchibh   06/10/06 - add hm layer messages 
/   balajkri   05/25/06 - add transaction layer messages 
/   mjstewar   05/25/06 - IR Integration
/   avaliani   06/20/06 - add callbacks for adr disable 
/   mfallen    06/18/06 - add messages for dde user actions 
/   mfallen    06/21/06 - add more messages for ips
/   mfallen    05/17/06 - add messages for ips 
/   hayu       07/09/06 - add function error
/   bdagevil   06/24/06 - add some UTS error messages 
/   bdagevil   06/18/06 - add more UTS errors 
/   gngai      07/06/06 - added ami error
/   mlfeng     06/28/06 - add alert log errors
/   gngai      06/26/06 - added Sweep error
/   hayu       06/20/06 - add message for program setting
/   gngai      06/18/06 - added AMI messages
/   mfallen    05/15/06 - add messages for dde user actions 
/   bkuchibh   05/06/06 - add amh layer errors
/   shwang     05/05/06 - error messages for data layer diagnostic failures
/   bdagevil   06/05/06 - add errors to parse component targets 
/   dsampath   05/19/06 - events++ errors 
/   dsampath   05/11/06 - error codes for DDE
/   mramache   04/12/06 - add initialization failure messages 
/   bkuchibh   04/17/06 - reserving 51000-51999 for HM,IR, component checks
/   hayu       05/12/06 - Add UTS error 
/   gngai      05/24/06 - added ami errors
/   hayu       05/15/06 - add adrci errors
/   mramache   04/12/06 - add initialization failure messages 
/   mlfeng     05/02/06 - changes based on errors_us comments 
/   jklein     05/02/06 - review comments 
/   mlfeng     04/24/06 - error codes for initialization 
/   mlfeng     04/18/06 - add cause and action for the errors
/   hayu       04/16/06 - add more viewer errors
/   hayu       04/14/06 - add more viewer errors
/   mlfeng     04/13/06 - add ads errors 
/   hayu       04/13/06 - added ADR viewer errors
/   gngai      04/13/06 - added AMI errors
/   jklein     04/13/06 - reserve ranges for each adr layer
/   avaliani   03/06/06 - Creation
/
/
/ 24280 -24290 Reserved for DBMS_LOB (FILE) package
/
/
24280, 00000, "invalid input value for parameter %s"
// *Cause: The parameter has been provided a negative, out of range, or
//         NULL input value.
// *Action: Correct the input value such that it is valid, and is within
//          the range as specified in the documentation.
/
24281, 00000, "invalid access past the maximum size of LOB parameter %s"
// *Cause: The value of positional or size parameters exceeded the maximum
//         allowed LOB size of (4 Gigabytes - 1) * DB_BLOCK_SIZE.
// *Action: Correct the input values for amount and offset such that their
//          sum is less than or equal to (4 Gigabytes - 1) * DB_BLOCK_SIZE.
//          If an error occurs in a read or write loop, check the looping 
//          conditions and offset increments.
/
/ 24291 - 24299 Reserved for Sorted Hash Clusters
/
24291, 00000, "Sort Hash Cluster error %s"
// *Cause: 
// *Action:
/
24292, 00000, "no more tables permitted in this sorted hash cluster"
// *Cause: A sorted hash cluster only supports a maximum of 2 tables
// *Action:
/
24295, 00000, "max key length (%s) for sorted hash cluster exceeded"
// *Cause: Sorted hash clusters have a maximum key size
// *Action:
/
24296, 00000, "error in processing the XML configuration file %s"
// *Cause: Parameters or their values were specified incorrectly in the
//         configuration file.
// *Action: Check and correct the configuration parameters or their values.
/
/ 24300 - 24999 Reserved for OCI/UPI/TTC/OPI/RPI/PSDs etc
/
/ 24500 - 24549 Reserved for OCI codepoint length semantics and UTF16
/ 24550 - 24574 Reserved for OCI et al Diagnosability 
/ 24750 - 24800 Reserved for Transaction OCI
/ 24800 - 24849 Reserved for OCI Lob/File related Calls
/ 24850 - 24874 Reserved for Shared OCI
/ 24900 - 24939 Reserved for OCI Notification
/ 24940 - 24949 Reserved for Generic Notification
/ 24950 - 24959 Reserved for PL/SQL Notification
/
24300, 00000, "bad value for mode"
// *Cause: An undefined mode value was specified.
// *Action: Check that the correct mode is selected and that an allowed
//          value for that mode is specified.
/
24301, 00000, "null host specified in thread-safe logon"
// *Cause: An HDA was not specified in the logon call while running in a
//         thread safe environment.
// *Action:  Make sure that HDA is not NULL when calling the logon routine.
/
24302, 00000, "host connection in use by another thread"
// *Cause: An attempt was made to use the host connection while it was in use
//         by another thread.
// *Action:  Wait for another thread to finish before using this connection.
/
24303, 00000, "call not supported in non-deferred linkage"
// *Cause: One of the calls that is supported in deferred mode
//         linkage exclusively was invoked when the client was linked
//         non-deferred.
// *Action: Use this call in deferred mode of linkage.
/
24304, 00000, "datatype not allowed for this call"
// *Cause:  Data of this datatype cannot be sent or fetched in pieces.
// *Action: Use other bind or define calls for this datatype.
/
24305, 00000, "bad bind or define context"
// *Cause:  The call was executed on a cursor for which this is invalid.
// *Action: Verify that this call is valid for this cursor. For example, Get
//          piece information and set piece information are valid on a cursor
//          if appropriate binds and defines have been done on this cursor.
/
24306, 00000, "bad buffer for piece"
// *Cause:  A zero length buffer or a null buffer pointer was provided.
// *Action: Verify that the buffer pointing to this piece or its length is
//          non-zero. The buffer pointer for the next piece or its length
//          can be zero if it is the last piece to be inserted and there are
//          no more data for the column.
/
24307, 00000, "invalid length for piece"
// *Cause:  The length of the piece exceeded the maximum possible size.
// *Action: Verify that the length of this piece and the cumulative length of
//          all the previous pieces is not more than the desired value supplied
//          by the application.
/
24308, 00000, "illegal define position"
// *Cause:  Call to modify attributes was done for a non-existent position
// *Action: Verify that a define has been done for this position
/
24309, 00000, "already connected to a server"
// *Cause:  This server handle is already attached to a server.
// *Action: Disconnect from the server and then retry the call to establish a
//          connection.
/
24310, 00000, "length specified for null connect string"
// *Cause:  The connect string is null, but a length was specified for it.
// *Action: Set length to zero if connect string is null.
/
24311, 00000, "memory initialization failed"
// *Cause:  Cannot initialize user memory.
// *Action: Contact customer support.
/
24312, 00000, "illegal parameters specified for allocating user memory"
// *Cause:  An illegal size or null pointer was specified for user memory.
// *Action: Specify a legal size and a valid pointer for user memory.
/
24313, 00000, "user already authenticated"
// *Cause:  A user has already been authenticated on this service handle.
// *Action: Terminate the service context before using it for another user.
/
24314, 00000, "service handle not initialized"
// *Cause:  The server context does not done exist.
// *Action: Establish the server context in the service context.
/
24315, 00000, "illegal attribute type"
// *Cause:  An illegal attribute type was specified for the handle.
// *Action: Consult user manual to specify an attribute valid for this handle.
/
24316, 00000, "illegal handle type"
// *Cause:  An illegal handle type was specified.
// *Action: Consult user manual to specify a valid handle type.
/
24317, 00000, "define handle used in a different position"
// *Cause:  A define was done with an existing handle on a different position.
// *Action: Specify the same position as before on a re-define.
/
24318, 00000, "call not allowed for scalar data types"
// *Cause:  This call is valid only for object types.
// *Action: Verify that the data-type for this variable is an object type
/
24319, 00000, "unable to allocate memory"
// *Cause:  Process was unable to allocate memory to store diagnostics.
// *Action: Terminate other processes in order to reclaim needed memory.
24320, 00000, "unable to initialize a mutex"
// *Cause:  An attempt to initialize a mutex failed.
// *Action: Contact customer support.
24321, 00000, "inconsistent parameters passed"
// *Cause:  One of the three memory function pointers is null or non-null.
// *Action: Verify that either all the memory functions are null or non-null.
24322, 00000, "unable to delete an initialized mutex"
// *Cause:  An attempt to delete an initialized mutex failed.
// *Action: Contact customer support.
24323, 00000, "value not allowed"
// *Cause:  A null value or a bogus value was passed in for a mandatory
//          parameter.
// *Action: Verify that all mandatory parameters are properly initialized.
24324, 00000, "service handle not initialized"
// *Cause:  An attempt was made to use an improper service context handle.
// *Action: Verify that the service context handle has all the parameters
//          initialized prior to this call.
24325, 00000, "this OCI operation is not currently allowed"
// *Cause:  An attempt was made to use a context handle outside its scope.
// *Action: Verify that the context handle is set to a service context handle
//          that has been converted to a logon data area for other OCI calls.
//          The logon data area must be converted back to a service context
//          before it can be used.
24326, 00000, "handle passed in is already initialized"
// *Cause:  An attempt was made to pass an initialized handle.
// *Action: Verify that the parameter passed in to retrieve a handle does
//          not already point to a handle.
24327, 00000, "need explicit attach before authenticating a user"
// *Cause:  A server context must be initialized before creating a session.
// *Action: Create and initialize a server handle.
24328, 00000, "illegal attribute value"
// *Cause:  The attribute value passed in is illegal.
// *Action: Consult the users manual and specify a legal attribute value
//          for the handle.
24329, 00000, "invalid character set identifier"
// *Cause:  The character set identifier specifed is invalid
// *Action: Specify a valid character set identifier in the OCI call.
/
24330, 00000, "internal OCI error"
// *Cause:  An internal OCI error has occurred.
// *Action: Please contact Oracle customer support.
24331, 00000, "user buffer too small"
// *Cause:  The user buffer to contain the output data is too small.
// *Action: Specify a bigger buffer.
24332, 00000, "invalid object type"
// *Cause:  An invalid object type is requested for the describe call.
// *Action: Specify a valid object type to the describe call.
/
24333, 00000, "zero iteration count"
// *Cause:  An iteration count of zero was specified for the statement
// *Action: Specify the number of times this statement must be executed
/
24334, 00000, "no descriptor for this position"
// *Cause:  The application is trying to get a descriptor from a handle
//          for an illegal position.
// *Action: Check the position number.
/
24335, 00000, "cannot support more than 1000 columns"
// *Cause:  The number of columns exceeds the maximum number supported.
// *Action:
/
24336, 00000, "invalid result set descriptor"
// *Cause:  The result set descriptor should have valid data fetched into
//          it before it can be converted to a statement handle
// *Action: Fetch valid data into the descriptor before attempting to
//          convert it into a statement handle
/
24337, 00000, "statement handle not prepared"
// *Cause:  A statement cannot be executed before making preparing a request.
// *Action: Prepare a statement before attempting to execute it.
/
24338, 00000, "statement handle not executed"
// *Cause:  A fetch or describe was attempted before executing a
//          statement handle.
// *Action: Execute a statement and then fetch or describe the data.
/
24339, 00000, "cannot set server group name after connecting to server"
// *Cause:  An attempt was made to set the server group in a server handle
//          after connecting to the server.  However, once the connection
//          is established to a server, the server group name cannot be
//          set anymore.
// *Action: Attach to the server after setting the server group name in
//          the server handle.
/
24340, 00000, "cannot support more than 255 columns"
// *Cause:  The number of columns exceeds maximum supported by the server.
// *Action: Limit your operation to 255 columns.
/
24341, 00000, "bad mode specified"
// *Cause:  OCI_ENV_NO_MUTEX mode was specified for a non-threaded client.
// *Action: OCI_ENV_NO_MUTEX may be specified when OCI_THREADED had been
//          specified at process initialization.
/
24342, 00000, "unable to destroy a mutex"
// *Cause:  An attempt to destroy a mutex failed.
/
24343, 00000, "user defined callback error"
// *Cause:  The only valid return value for a user defined callback
//          function is OCI_CONTINUE or OCI_ROWCBK_DONE. Any other value
//          will cause this error.
// *Action: Please insure that OCI_CONTINUE or OCI_ROWCBK_DONE is returned
//          from the user defined callback function.
24344, 00000, "success with compilation error"
// *Cause:  A sql/plsql compilation error occurred.
// *Action: Return OCI_SUCCESS_WITH_INFO along with the error code
//
24345, 00000, "A Truncation or null fetch error occurred"
// *Cause:  A truncation or a null fetch error"
// *Action: Please ensure that the buffer size is long enough to
//          store the returned data.
24346, 00000, "cannot execute without binding variables"
// *Cause:  None of the bind variables in the SQL statement are bound.
// *Action: Please bind all the variables before the execute is done.
//
24347, 00000, "Warning of a NULL column in an aggregate function"
// *Cause: A null column was processed by an aggregate function
// *Action: An OCI_SUCCESS_WITH_INFO is returned.
//
24348, 00000, "Update or Delete without Where"
// *Cause: An update or delete was executed without where clause
// *Action: An OCI_SUCCESS_WITH_INFO is returned.
//
24349, 00000, "Array DML row counts not available"
// *Cause:  One of the following occurred:
//          -The attribute in OCIAttrGet was used incorrectly.
//          -The version of the database used does not support this feature
//          -There was an error in the array DML for all of the 
//           iterations.
// *Action: Ensure that the statement is an array DML and also ensure
//          that the database version is Oracle 12 or higher and the correct
//          mode is used.
/
24350, 00000, "OCI call not allowed"
// *Cause:  OCI used is not permitted from external procedures.
// *Action: Refer to user manual for usage restrictions.
/
24351, 00000, "invalid date passed into OCI call"
// *Cause:  A bad date was passed into one of the OCI calls.
// *Action: Check your date bind values and correct them.
/
24352, 00000, "invalid COBOL display type passed into OCI call"
// *Cause:  A bad COBOL display type was passed into one of the OCI calls.
// *Action: Check your COBOL display type  bind values and correct them.
/
24353, 00000, "user buffer too small to accommodate COBOL display type"
// *Cause:  User supplied buffer for a COBOL display type was too small
//          to accommodate fetched number.
// *Action: Increase the allocation for COBOL display type buffer.
/
24354, 00000, "number fetched too large to fit in COBOL display type buffer."
// *Cause:  The number fetched was beyond the range that can be displayed.
// *Action: Please check the number in the database.
/
24355, 00000, "attempt to store a negative number in an Unsigned Display type."
// *Cause:  An attempt was made to convert a negative number into an unsigned
//          display type.
// *Action: Please check the number in the database or change the defined
//          datatype.
/
24356, 00000, "internal error while converting from to COBOL display type."
// *Cause:  An internal error was encountered during conversion to
//          COBOL display type.
// *Action: Contact customer support.
/
24357, 00000, "internal error while converting from to OCIDate."
// *Cause:  An internal error was encountered during conversion to
//          OCIDate type.
// *Action: Contact customer support.
/
24358, 00000, "OCIBindObject not invoked for a Object type or Reference"
// *Cause:  OCIBindObject was not invoked resulting in an incomplete
//          bind specification for a Object Type or Reference.
// *Action: Please invoke the OCIBindObject call for all Object Types and
//          References.
/
24359, 00000, "OCIDefineObject not invoked for a Object type or Reference"
// *Cause:  OCIDefineObject was not invoked resulting in an incomplete
//          bind specification for a Object Type or Reference.
// *Action: Please invoke the OCIDefineObject call for all Object Types and
//          References.
/
24360, 00000, "Type Descriptor Object not specified for Object Bind/Define"
// *Cause:  Type Descriptor Object is a mandatory parameter for Object Types
//          Binds and Defines.
// *Action: Please invoke the OCIBindObject() or OCIDefineObject() call
//          with a valid Type Descriptor Object.
/
24361, 00000, "basic bind call not invoked before invoking advanced bind call"
// *Cause:  One of the basic bind calls was not invoked on this bind handle
//          before performing an advanced bind call.
// *Action: Please invoke the advanced bind call on this bind handle only
//          after performing a basic bind call.
/
24362, 00000, "improper use of the character count flag"
// *Cause:  When the character count flag is set, then the maximum size of
//          the buffer in the server should be specified as a non-zero value.
// *Action: Please use a non-zero value for the mamimum size of the buffer
//          in the server.
/
24363, 00000, "measurements in characters illegal here"
// *Cause:  Measurements in characters instead of bytes are illegal if
//          either the server's or client's character set is varying width.
// *Action: If either the client's or server's character set is varying
//          width then do not use the OCI_ATTR_CHAR_COUNT attribute for the
//          bind handle. Use OCI_ATTR_MAXDATA_SIZE instead.
/
24364, 00000, "internal error while padding blanks"
// *Cause:  An internal error has occurred while attempting to blank pad
//          string data. This error should not occur normally.
// *Action: Contact customer support.
/
24365, 00000, "error in character conversion"
// *Cause:  This usually occurs during conversion of a multibyte
//          character data when the source data is abnormally terminated
//          in the middle of a multibyte character.
// *Action: Make sure that all multibyte character data is properly terminated.
/
24366, 00000, "migratable user handle is set in service handle"
// *Cause:  This occurs during user authentication, a migratable user handle
//          has been set in the service handle.
// *Action: Service handle must not be set with migratable user handle when it
//          is used to authenticate another user.
/
24367, 00000, "user handle has not been set in service handle"
// *Cause:  This occurs during authentication of a migratable user.
//          the service handle has not been set with non-migratable user handle.
// *Action: Service handle must be set with non-migratable user handle when it
//          is used to authenticate a migratable user.
/
24368, 00000, "OCI mutex counter non-zero when freeing a handle"
// *Cause:  This is an internal OCI error.
// *Action: Contact customer support.
/
24369, 00000, "required callbacks not registered for one or more  bind handles"
// *Cause:  No callbacks have been registered for one or more of the bind
//          handles which are part of the RETURNING clause.
// *Action: The bind handles which are to receive data in a DML statememt
//          with a RETURNING clause must have their mode set as DATA_AT_EXEC
//          and callback functions must be registered for these bind handles
//          using OCIBindDynamic.
/
24370, 00000, "illegal piecewise operation attempted"
// *Cause:  Data of a certain datatype that does not support piecewise
//          operation is being sent or fetched in pieces.
// *Action: Always set the piece value to OCI_ONE_PIECE for datatypes that
//          does not support piecewise operation.
/
24371, 00000, "data would not fit in current prefetch buffer"
// *Cause:  An internal OCI error has occurred.
// *Action: Please contact Oracle customer support.
/
24372, 00000, "invalid object for describe"
// *Cause:  The object to be described is not valid.
//          It either has compilation or authorization errors.
// *Action: The object to be described must be valid.
/
24373, 00000, "invalid length specified for statement"
// *Cause:  The length specified for the statement is either 0 or too large.
// *Action: Specify a valid length for the statement.
/
24374, 00000, "define not done before fetch or execute and fetch"
// *Cause:  The application did not define output variables for data being
//          fetched before issuing a fetch call or invoking a fetch by
//          specifying a non-zero row count in an execute call.
// *Action: Issue OCI define calls for the columns to be fetched.
/
24375, 00000, "Cannot use V6 syntax when talking to a V8 server"
// *Cause:  V6 syntax is no longer supported in V8 server.
// *Action: Change syntax to V7 syntax or higher.
/
24376, 00000, "cannot register/get user callback for non-environment handle"
// *Cause:  A user callback registration or get was attempted on a handle which
//          is not an environment handle.
// *Action: Pass the environment handle to register/get user callback.
/
24377, 00000, "invalid OCI function code"
// *Cause:  An invalid function code was used.
// *Action: Use a valid OCI function code.
/
24378, 00000, "user callbacks not allowed for this call"
// *Cause:  An attempt was made to register a user callback for an OCI call for
//          which it not allowed to register user callbacks.
// *Action: Do not register user callback for this OCI call.
/
24379, 00000, "invalid user callback type"
// *Cause:  An invalid type of user callback was specified.
// *Action: Specify a valid user callback type.
/
24380, 00000, "invalid mode specification"
// *Cause:  The mode parameter in an OCI call is invalid
// *Action: Use only valid mode parameter
/
24381, 00000, "error(s) in array DML"
// *Cause:  One or more rows failed in the DML.
// *Action: Refer to the error stack in the error handle.
/
24382, 00000, "statement handled already executed or described"
// *Cause:  The Statement handle was executed or described successfuly before.
// *Action: Perform a OCIStmtPrepare again before OCI_PARSE_ONLY.
24383, 00000, "Overflow segment of an IOT cannot be described"
// *Cause:  The name specified in the OCIDescribeAny call referred to an
//          IOT overflow segment.
// *Action: Use OCIDescribeAny to describe only documented objects.
24384, 00000, "Application context size is not initialized"
// *Cause:  The size of the application context must be initialized before
//          populating each context element.
// *Action: Issue OCIAttrSet with OCI_ATTR_CTX_SIZE to initialize context size
24385, 00000, "Application context size or index is not valid"
// *Cause:  The size or index of the application context must be non-zero and
//          non-negative.
// *Action: Use an appropriate value for the size.
24386, 00000, "statement/server handle is in use when being freed"
// *Cause:  This is an internal OCI error.
// *Action: The user should reset in-use flag in statement handle before
//          freeing the handle.
24387, 00000, "Invalid attach driver"
// *Cause:  Trying to attach using the wrong driver
// *Action: Relink the application in the right mode
24388, 00000, "Unsupported functionality in fast path mode"
// *Cause:  Feature not supported in fast path mode
// *Action: Avoid using the functionality in this mode
24389, 00000, "Invalid scrollable fetch parameters"
// *Cause:  All the requested rows in this fetch could not be received.
// *Action: Check the fetch orientation, scroll offset,
//          OCI_ATTR_CURRENT_POSITION and number of rows in OCIStmtFetch2 call.
//          If required, change some of above parameters and fetch again.
24390, 00000, "Unsupported scrollable cursor operation"
// *Cause:  The scrollable cursor execute or fetch has failed.
// *Action: Check the documentation for supported types, and other restrictions
//          while using scrollable cursors.
24391, 00000, "invalid fetch operation"
// *Cause:  Scrollable cursor operation requested with non-scrollable cursor.
// *Action: Check if the statement was executed in the scrollable mode. Else
//          the only acceptable orientation is OCI_FETCH_NEXT that ignores the
//          scroll offset parameter.
/
/                  Connection Pooling messages
/
24392, 00000, "no connection pool to associate server handle"
// *Cause:  OCIServerAttach called in OCI_POOL mode but no connection pool
//          found to associate the server handle.
// *Action: 1) Verify that OCIConnectionPoolCreate is called before calling
//             OCIServerAttach.
//          2) Verify that the database link specified in OCIServerAttach
//             matches with that of the connection pool database link.
24393, 00000, "invalid mode for creating connection pool"
// *Cause:  Mode specified in OCIConnectionPoolCreate is invalid.
// *Action: Use a valid mode.
24394, 00000, "invalid mode for destroying connection pool"
// *Cause:  Mode specified in OCIConnectionPoolDestroy is invalid.
// *Action: Use a valid mode.
24395, 00000, "cannot reinitialize non-existent pool"
// *Cause:  OCIConnectionPoolCreate was not called in OCI_DEFAULT mode for this
//          pool handle.
// *Action: Create a connection pool prior to reinitializing it.
24396, 00000, "invalid attribute set in server handle"
// *Cause:  Attribute OCI_ATTR_NONBLOCKING_MODE has been set on the server
//          handle and attached in OCI_POOL mode. Connection pooling does
//          not support non blocking mode.
// *Action: Do not set the OCI_ATTR_NONBLOCKING_MODE attribute on the server
//          handle while attaching in OCI_POOL mode.
24397, 00000, "error occured while trying to free connections"
// *Cause:  An internal error occured while trying to free connections.
// *Action: Contact customer support.
24398, 00000, "connection pool already exists"
// *Cause:  A connection pool has already been created for the specified
//          pool handle.
// *Action: 1) Specify a different pool handle to create a new connection pool.
//          2) If you wish to modify the pool parameters, call
//             OCIConnectionPoolCreate in OCI_CPOOL_REINITIALIZE mode.
24399, 00000, "invalid number of connections specified"
// *Cause:  An invalid combination of minimum, maximum and increment number of
//          connections was specified in the OCIConnectionPoolCreate call.
// *Action: Specify a valid combination of parameters.
24400, 00000, "error occured while creating connections in the pool"
// *Cause:  The database link specified in OCIConnectionPoolCreate might be an
//          invalid one.
// *Action: Specify a valid database link.
24401, 00000, "cannot open further connections"
// *Cause:  Sufficient number of connections are not present in the pool to
//          execute the call. No new connections can be opened as the
//          connMax parameter supplied in OCIConnectionPoolCreate has been
//          reached.
// *Action: Call OCIConnectionPoolCreate in OCI_CPOOL_REINITIALIZE mode and
//          increase the value of the connMax parameter.
24402, 00000, "error occured while creating connections in the pool"
// *Cause:  The username and password specified in OCIConnectionPoolCreate
//          might be invalid.
// *Action: Specify a valid username and password.
24403, 00000, "error occured while trying to destroy the connection pool"
// *Cause:  Some connections in the pool were busy when an attempt to destroy
//          the connection pool was made.
// *Action: Ensure no connections from the pool are being used.
24404, 00000, "connection pool does not exist"
// *Cause:  An attempt was made to use the connection pool before creating it.
// *Action: Create the connection pool.
24405, 00000, "error occured while trying to create connections in the pool"
// *Cause:  An internal error occured while creating connections in the pool.
// *Action: Contact customer support.
24406, 00000, "API mode switch is disallowed when a call is in progress."
// *Cause:  A mode switch from OCI8 to OCI7 was attempted in a callback.
// *Action: The user should perform the API mode switch either prior to
//          initiating the top call or after the main call is done.
24407, 00000, "connection pool already exists"
// *Cause:  A connection pool has already been created for the specified
//          pool name.
// *Action: Specify a different pool name to create a new connection pool.
24408, 00000, "could not generate unique server group name"
// *Cause:  An internal error occured while generating unique server group name.
// *Action: Contact customer support.
24409, 00000, "client cannot understand the object"
// *Cause:  The client cannot process all the new features in the object.
// *Action: Upgrade the client so that features like inheritance and SQLJ
//          objects can be used.
24410, 00000, "scrollable cursor max size exceeded"
// *Cause:  Result set size exceeded the max limits.
// *Action: Check the documentation for allowable maximum result set size for
//          scrollable cursors. Re-execute with a smaller expected result set
//          size or make the cursor non-scrollable.
/
/       Session Pooling OCI error messages
/
24411, 00000, "Session pool already exists."
// *Cause:  A session pool has already been created for the specified
//          pool handle.
// *Action: 1) Specify a different pool handle to create a new session pool.
//          2) If you wish to modify the pool parameters, call
//             OCISessionPoolCreate in OCI_SPOOL_REINITIALIZE mode.
24412, 00000, "Cannot reinitialize non-existent pool"
// *Cause:  OCISessionPoolCreate was not called in OCI_DEFAULT mode for this
//          pool handle.
// *Action: Create a session pool prior to reinitializing it.
24413, 00000, "Invalid number of sessions specified"
// *Cause:  An invalid combination of minimum, maximum, max per shard
//          and increment number of sessions was specified in the
//          OCISessionPoolCreate call.
// *Action: Specify a valid combination of parameters.
24414, 00000, "Only %d sessions could be started."
// *Cause:  The number of sessions specified by the minSess parameter of
//          OCISessionPoolCreate could not be started, possibly because the
//          value supplied was larger than that supported by the server."
// *Action: This is a warning. Check the maximum number of sessions allowed
//          on the server.
24415, 00000, "Missing or null username."
// *Cause:  Username and password must be specified when pool is created in
//          this mode.
// *Action: Specify a valid username and password.
24416, 00000, "Invalid session Poolname was specified."
// *Cause:  An attempt was made to use a Session Pool that does not exist.
// *Action: Create a Session Pool before using it.
24417, 00000, "Session pool size has exceeded the maximum limit"
// *Cause:  The number of sessions has exceeded the maximum size of the
//          Session Pool.
// *Action: This is a warning. You can tune the session pool with
//          appropriate minimum and maximum parameters.
24419, 00000, "Proxy sessions are not supported in this mode."
// *Cause:  A proxy session was requested for from a Session Pool which does
//          not support proxy sessions.
// *Action: Do not specify mode OCI_CRED_PROXY.
24420, 00000, "OCISessionRelease must be used to release this session."
// *Cause:  The session was retrieved using OCISessionGet, and an attempt
//          has been made to release it using a call other than
//          OCISessionRelease.
// *Action: Call OCISessionRelease.
24421, 00000, "OCISessionRelease cannot be used to release this session."
// *Cause:  The session was not retrieved using OCISessionGet, and an attempt
//          has been made to release it using OCISessionRelease.
// *Action: Release the session using an appropriate call.
24422, 00000, "error occurred while trying to destroy the Session Pool"
// *Cause:  An attempt was made to destroy the session pool while some
//          sessions in the pool were busy.
// *Action: Ensure that no sessions from the pool are being used OR call
//          OCISessionPoolDestroy with mode set to OCI_SPD_FORCE.
/
/      ROWID define at position 0 - OCI error messages
/
24423, 00000, "Cannot set the ROWID attribute - OCI_ATTR_FETCH_ROWID"
// *Cause:  An attempt was made to set the implicit ROWID attribute. 
// *Action: Use a SELECT ... FOR UPDATE statement that has not previously been
//          described or executed before setting this ROWID attribute.
24424, 00000,"Invalid attempt to define at position 0"
// *Cause:  An invalid attempt was made to call OCIDefineByPos for position 0.
// *Action: Ensure that the implicit ROWID attribute, OCI_ATTR_FETCH_ROWID, is 
//          set on the statement handle before doing the execute.
24425, 00000,"Invalid mode passed when defining at position 0"
// *Cause:  An invalid mode was passed to OCIDefineByPos.
// *Action: Ensure a valid mode is passed to OCIDefineByPos when defining
//          at position 0.
/
/      Error message for tracing OCI Session pool. 
/
24426, 00000, "Event to enable tracing in OCI Session Pool"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to obtain trace information
//          for OCI Session Pool.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
/
/      OCISessionGet in pooled mode with security attrs
24427, 00000, "Invalid attributes on user handle"
// *Cause: Some of the attributes set on the user handle were not allowed in
//         pooled mode. 
// *Action: Unset the attributes on the user handle and call OCISessionGet or
//          use sessions that are not pooled.
24428, 00000, "Sessions with SYSDBA privileges are not supported in this mode."
// *Cause:  A session with SYSDBA privileges was requested from a Session Pool
//          which does not support sessions with SYSDBA privileges.
// *Action: Do not specify mode OCI_SESSGET_SYSDBA.
24429, 00000, "External authentication is not supported in this mode."
// *Cause:  An externally authenticated session was requested from a Session
//          Pool which does not support external authentication.
// *Action: Do not specify mode OCI_SESSGET_CREDEXT.
/
/
/       Statement Caching OCI error messages
/
24430, 00000, "Null values for sqltext and key were specified."
// *Cause:  An attempt was made to call OCIStmtPrepare2 and neither
//          sqltext nor key were specified.
// *Action: Specify valid values for sqltext or key or both.
24431, 00000, "Statement does not exist in the cache"
// *Cause:  The statement that was requested for does not exist in the
//          statement cache.
// *Action: Please request for a valid statement.
24432, 00000, "The statement that was returned is not tagged."
// *Cause:  A tagged statement was requested for, but an untagged statement
//          has been returned.
// *Action: This is a warning. Please modify and tag the statement as
//          desired.
24433, 00000, "This statement has already been prepared using OCIStmtPrepare2."
// *Cause:  A statement that was earlier prepared using OCIStmtPrepare2 is
//          now being reprepared using OCIStmtPrepare."
// *Action: Please use a different statement handle.
24434, 00000, "OCIStmtRelease called before OCIStmtPrepare2."
// *Cause:  An attempt was made to release a statement without first
//          preparing it using OCIStmtPrepare2.
// *Action: Call OCIStmtPrepare2 before OCIStmtRelease.
24435, 00000, "Invalid Service Context specified."
// *Cause:  The statement was prepared using a service context that is
//          different from the one specified in OCIStmtExecute.
// *Action: Please specify the same service context that the statement
//          was prepared with.
24436, 00000, "Invalid statement Handle."
// *Cause:  OCIHandleFree called on a statement that was prepared using
//          OCIstmtPrepare2.
// *Action: Release the statement using OCIStmtRelease.
24437, 00000, "OCIStmtExecute called before OCIStmtPrepare2."
// *Cause:  An attempt was made to execute a statement without first
//          preparing it using OCIStmtPrepare2.
// *Action: Call OCIStmtPrepare2 before OCIStmtExecute.
24438, 00000, "Invalid Authentication Handle specified."
// *Cause:  The statement was prepared using an authentication handle
//          that is different from the one specified in OCIStmtExecute.
/
/
/       Miscellaneous OCI error messages
/
/
24439, 00000, "success with PLSQL compilation warning"
// *Cause:  A plsql compilation warning occurred.
// *Action: Return OCI_SUCCESS_WITH_INFO along with the error code.
24440, 00000, "OCI Easy Install mode cannot be initialized"
// *Cause:  An internal OCI error has occurred.
// *Action: Please contact Oracle customer support.
//
24441, 00000, "Invalid cookie, resend sql text"
// *Cause:  An internal OCI error has occurred.
// *Action: Please contact Oracle customer support.
//
24442, 00000, "SCN exceeds the capability of the target OCI database or client"
// *Cause:  An attempt was made to transfer a system change number (SCN) to
//          an Oracle database or client that is older than Release 12.2 and
//          the SCN exceeds the maximum value that such a system can handle.
// *Action: If needed, update the target database or client to Release 12.2
//          or higher.
//
24444, 00000, "TTC RPC (%s) not allowed by the security policy configured on the database"
// *Cause:  The database security policy configuration did not allow the
//          specified Two-Task Common (TTC) RPC.
// *Action: Do not use functionality that issues the specified TTC RPC which
//          is disallowed by the database security policy.
//
24445, 00000, "object type input parameter in TTC RPC not allowed by the security policy configured on the database"
// *Cause:  The database security policy configuration did not allow object 
//          types as input parameters (including IN bind variables) in 
//          Two-Task Common (TTC) RPCs.
// *Action: Do not use the functionality that relies on object type input 
//          parameter usage in a TTC RPC. 
//
24450, 00000, "Cannot pre-process OCI statement"
// *Cause:  An error occured during statement pre-processing.
//          E.g., SQL statement has invalid usage of N' or Q' literals.
// *Action: Correct the SQL statement.
//
24451, 00000, "%s, Maximum call depth exceeded"
// *Cause:  Your program has too many levels of recursion.
// *Action: Restructure your program to eliminate some levels of recursion.
//
24452, 00000, "value_sz exceeding SB4MAXVAL is not supported"
// *Cause:  value_sz specified in OCIBindByPos2, OCIBindByName2 or
//          OCIDefineByPos2 exceeds SB4MAXVAL and is not supported in this
//          release.
// *Action: Specify a value less than or equal to SB4MAXVAL for value_sz in
//          OCIBindByPos2, OCIBindByName2 or OCIDefineByPos2.
//
/
24453, 0000, "number of application context settings supplied during authentication has exceeded the supported limit of %d settings"
// *Cause: The number of application context settings supplied during
//         authentication exceeded the specified limit.
// *Action: Reduce the number of application context settings that are passed
//          during authentication.
//
/
24454, 0000, "client host name is not set"
// *Cause: The network host name in files like /etc/hosts was not set. 
// *Action: Set the host name and try again.
//
24455, 00000, "Event for client feature tracing"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
/
24457, 00000, "OCISessionGet() could not find a free session in the specified timeout period"
// *Cause: The contention on OCI Session Pool is high. 
// *Action: Increase the timeout for OCISessionGet() using the 
//          OCI_ATTR_SPOOL_WAIT_TIMEOUT setting or reduce the number 
//          of threads accessing the pool concurrently.
//
/
24458, 00000, "OCISessionGet() timed out trying to find a free session to the desired shard and max connections per shard limit is reached"
// *Cause: OCISessionGet() could not find a free session to the 
//         appropriate shard in the specified timeout period. No 
//         new sessions can be opened to the shard either as the
//         number of connections open to the shard is already at 
//         the value specified by OCI_ATTR_SPOOL_MAX_PER_SHARD. 
// *Action:Increase value of OCI_ATTR_SPOOL_MAX_PER_SHARD or
//         increase the timeout specified by or use OCI_SPOOL_ATTRVAL_WAIT 
//
/
24459, 00000, "OCISessionGet() timed out waiting for pool to create new connections"
// *Cause:  The OCISessionGet() timeout expired waiting for OCI Session
//          Pool to create new sessions
// *Action: Retry the request later. Use OCISessionGet() with
//          OCI_SPOOL_ATTRVAL_TIMEDWAIT mode (with an appropriate
//          OCI_ATTR_SPOOL_WAIT_TIMEOUT setting) or OCI_SPOOL_ATTRVAL_WAIT mode.
/
/       24460 - 24470 Reserved for OCI Native Net
/
24460, 00000, "Native Net Internal Error"
// *Cause: Internal error .
// *Action: This error should not normally occur.  If it persists,
//          please contact your customer service representative.
/
/       24471 - 24479 Reserved for OCI Objects
/
24471, 00000, "KOH tracing event"
// *Document: NO
// *Cause: N/A
// *Action: Event to trace KOH memory events
//          bit 0x1: KOH_TRACE_LEVEL_MEM: trace memory alloc and free
//          bit 0x2: KOH_TRACE_LEVEL_DUR: trace duration start & end
//          bit 0x4: KOH_TRACE_LEVEL_ZEROCACHE: cache max & opt size = 0
//          bit 0x8: KOH_TRACE_LEVEL_KOHIH: trace duration list mgmt
//         bit 0x10: KOH_TRACE_LEVEL_INS: dump memory or instance
/
24472, 00000, "KOC tracing event"
// *Document: NO
// *Cause: N/A
// *Action: Event to trace KOC cache events
//          bit 0x1: KOC_TRACE_EVENT_PIN: trace pin operations
//          bit 0x2: KOC_TRACE_EVENT_DUR: trace duration operations
//          bit 0x4: KOC_TRACE_EVENT_TXN: trace transaction operations
/
24473, 00000, "KOD tracing event"
// *Document: NO
// *Cause: N/A
// *Action: Event to trace KOD data events
//          bit 0x1: KOD_TRACE_EVENT_PIC: trace pickle operations
//          bit 0x2: KOD_TRACE_EVENT_UPIC: trace unpickle operations
//          bit 0x4: KOD_TRACE_EVENT_TYPE: trace pickle/unpickle a type
//   bit 0x00004000: KOD_TRACE_LEVEL_MEDIUM: generate medium amount of tracing
//   bit 0x00008000: KOD_TRACE_LEVEL_HIGH: generate high amount of tracing
/
24474, 00000, "KOL tracing event"
// *Document: NO
// *Cause: N/A
// *Action: Event to trace KOL collection events
//          bit 0x1: KOL_TRACE_EVENT_PIC: trace pickle operations
//          bit 0x2: KOL_TRACE_EVENT_UPIC: trace unpickle operations
//         bit 0x40: KOL_TRACE_LEVEL_MEDIUM: generate medium amount of tracing
//         bit 0x80: KOL_TRACE_LEVEL_HIGH: generate high amount of tracing
/
24475, 00000, "KOKC tracing event"
// *Document: NO
// *Cause: N/A
// *Action: Event to trace KOKC events
//       bit    0x1: KOkc_TRACE_LEVEL_BASIC: basic dumps
//       bit    0x2: KOKC_TRACE_LEVEL_TIME: dump time
//       bit    0x4: KOKC_TRACE_LEVEL_KOKCD: dump kokcd structure
//       bit    0x8: KOKC_TRACE_LEVEL_ASSERT: enforce asserts
//       bit 0x1000: KOKC_TRACE_LEVEL_STACK: dump short stack
//       bit 0x2000: KOKC_TRACE_LEVEL_LSTACK: dump full stack
/
/       Codepoint length semantics and UTF16 related OCI error messages
/
24476, 00000, "KOPF tracing event"
// *Document: NO
// *Cause: N/A
// *Action: Event to trace KOPF operations (FDO)
//          bit 0x1: KOPF_TRACE_EVENT_FDO: dump FDO's in kopfupdate()
/
/       Codepoint length semantics and UTF16 related OCI error messages
/
24480, 00000, "invalid OCI mode"
// *Cause:  An attempt was made to invoke OCI API with an invalid mode.
// *Action: Provide the OCI API with legitimate mode.
24481, 00000, "Failed to initialize multithreaded environment"
// *Cause:  Operating system did not support multithreaded mode.
// *Action: Use single thread mode instead.
24482, 00000, "Pool size was less than 1 in shared mode"
// *Cause:  Pool size must be positive in shared mode.
// *Action: Set a positive pool size.
24483, 00000, "Invalid parameters were passed into environment creation call"
// *Cause:  Invalid parameters were passed into the environment creation call.
// Check the passed in parameters for the following conditions:
// -envp should not be NULL
// -xtramem_sz should not be negative
// -Either both xtramem_sz and usrmempp have to be provided. Or, neither
// should be provided.
// *Action: Pass in legitimate parameters.

24484, 00000, "Setting authentication handle not allowed after pool create"
// *Cause: An attempt was made to set the authentication handle on session pool
//  handle after OCISessionPoolCreate.
// *Action: Set the authentication handle on session pool handle before calling 
//  OCISessionPoolCreate.

24485, 00000, "Invalid attributes in session pool authentication handle"
// *Cause: Some of the attributes set on the authentication handle being set on 
//  the session pool handle are invalid.
// *Action: Unset the illegal attributes on the authentication handle being set
//  on session pool handle and then call OCIAttrSet. Refer to OCI documentation
//  for details.

24486, 00000, "Conflicting attributes in session pool authentication handle" 
// *Cause: Some attributes could not be set both on the authentication handle 
//  passed to OCISessionGet and the authentication handle set on session pool 
//  handle. 
// *Action: Unset the conflicting attributes on the authentication handle and 
//  call OCISessionGet.

24487, 00000, "Invalid properties or values provided for OCISessionGet"
// *Cause: Some of the properties or their values provided during
//  OCISessionGet with mode OCI_SESSGET_MULTIPROPERTY_TAG were invalid.
// *Action: Provide valid properties and values when calling OCISessionGet
//  with mode OCI_SESSGET_MULTIPROPERTY_TAG. Refer to Oracle Call Interface
//  documentation for details.

24488, 00000, "Invalid properties or values provided for OCISessionRelease"
// *Cause: Some of the properties or their values provided during
//  OCISessionRelease with mode OCI_SESSRLS_MULTIPROPERTY_TAG were invalid.
// *Action: Provide valid properties and values when calling OCISessionRelease
//  with mode OCI_SESSRLS_MULTIPROPERTY_TAG. Refer to Oracle Call Interface 
// documentation for details.

24489, 00000, "reserved OCI error"
// *Cause:  A reserved Oracle Call Interface (OCI) error has occurred.
// *Action: Contact Oracle Support Services.
/
24490, 00000, "error while getting shard instances"
// *Cause: There was a mismatch in the shard keys or group keys with the 
//         corresponding connect string.
// *Action: Check if the keys are properly specified along with the 
//          corresponding connection string.
/
24491, 00000, "attempt to get sharding-related topology information failed"
// *Cause: An unexpected error was encountered while building and processing 
//         sharding-related information.
// *Action: Contact Oracle Support Services.
/
24492, 00000, "Shard library initialization failed."
// *Cause: An attempt to initialize the shard library failed.
// *Action: Contact Oracle Support Services.
/
24493, 00000, "general sharding error"
// *Cause: An unexpected error was encountered while processing sharding-related
//         information.
// *Action: Contact Oracle Support Services.
/
24494, 00000, "error in constructing shard key or shard group key"
//*Cause: An invalid column value was passed.
//*Action: Pass in a column value in the appropriate format specified
//         by the data type.
/
24495, 00000, "OCISessionGet() timed out waiting for a suitable writable chunk."
//*Cause: There was no instance available with a writable chunk for the
//        specified shard key at the time the OCISessionGet() request was issued.
//        This may be a transient condition due to chunk migration.
//*Action: Retry the request later. If needed, increase the timeout specified
//         in OCI_ATTR_SPOOL_WAIT_TIMEOUT to minimize or eliminate the 
//         chances of running into this error during chunk migrations. 
/
24496, 00000, "OCISessionGet() timed out waiting for a free connection."
//*Cause: There was no free connection as the pool reached its maximum and all
//        connections were in use at the time the request was issued.
//*Action: Retry the request later. Use OCISessionGet() with  
//         OCI_SPOOL_ATTRVAL_TIMEDWAIT mode (with an appropriate
//         OCI_ATTR_SPOOL_WAIT_TIMEOUT setting) or OCI_SPOOL_ATTRVAL_WAIT mode.
//         If needed, increase the maximum size of the OCI session pool.
/
24497, 0000, "PL/SQL fix up callback name too long"
// *Cause: The PL/SQL fix up callback name was too long.
// *Action: Use a shorter PL/SQL fix up callback name.
/
24500, 00000, "invalid UTF16 mode"
// *Cause:  UTF16 mode is allowed only at environment handle creation time.
// *Action: Remove UTF16 mode for functions other than OCIEnvCreate()
24501, 00000, "invalid UTF16 string passed in"
// *Cause:  Non-UTF16 string is passed in while UTF16 string is expected
// *Action: Check the parameter which is actually a string
24502, 00000, "codepoint length overflows"
// *Cause:  Returned buffer has more codepoints than allowed
// *Action: Set OCI_MAXCHAR_SIZE large enough to accommodate
24503, 00000, "codepoint length overflows for piecewise operation"
// *Cause:  Accumulated codepoint length exceeds allowed codepoint length
// *Action: Set OCI_MAXCHAR_SIZE large enough to accommodate
24504, 00000, "data length larger than expected"
// *Cause:  Incoming data larger than receiving buffer
// *Action: Set OCI_MAXDATA/MAXCHAR_SIZE appropriately or remove the setting
24505, 00000, "cannot change character set id on the handle"
// *Cause:  Attempts to change character set id on non-environment handles
// *Action: Only try to change character set id on environment handles
24506, 00000, "invalid attempt to change character set id on env handle"
// *Cause:  Attempts to change character set id after other handles have been
//          allocated from the env handle
// *Action: Change character set id after creating environment handle
//          but before allocating any handles from it.
24507, 00000, "invalid combination of character set ids"
// *Cause:  Attempts to set one character set id as zero
// *Action: Set both charset and ncharset as zero or non-zero
//          in OCIEnvNlsCreate()
24508, 00000, "Buffer is not aligned correctly."
// *Cause:  Alignment error ocurred in buffer when converting between
//          character sets.
// *Action: Align buffer appropriately. For UTF16 buffer, pass a ub2 pointer. 
24509, 00000, "OCI function currently not supported in UTF16 mode."
// *Cause:  Attempt to call an OCI function that was not supported in 
//          OCI_UTF16ID mode.
// *Action: Remove the offending function or do not create an OCI environment 
//          with OCI_UTF16ID mode or OCI_UTF16ID character set ID.
/
/       Column authorization Related OCI error messages (24530 - 24540)
/
24530, 00000, "User not authorized to access column value."
// *Cause:  Column security is enabled and column value is not authorized.
// *Action: The program needs to handle this error and take appropriate action.
24531, 00000, "Column value authorization is unknown."
// *Cause:  Column security is unknown for the column.
// *Action: Verify the fetched data. It may or may not contain a meaningful
//          value because it is probably the result of an expression that
//          operated on unauthorized values.
24536, 00000, "Warning - column authorization unknown."
// *Cause:  Column security is unknown for one or more columns.
// *Action: Verify the fetched data. It may or may not contain a meaningful
//          value because it is probably the result of an expression that
//          operated on unauthorized values.
24541, 00000, "Event to test OCI attribute-level security."
// *Document: NO
// *Cause: N/A
// *Action: Set this event to get different security status for  
//          fetched columns.
//
24542, 00000, "PRELIM mode logon not allowed to a pluggable database"
// *Cause: PRELIM mode logon was attempted to a pluggable database.
// *Action: Create PRELIM mode connections to CDB$ROOT only.
//
24543, 00000, "instance startup or shutdown not allowed in pluggable database"
// *Cause: An instance startup or shutdown operation was attempted when
//         connected to a pluggable database.
// *Action: Perform instance startup or shutdown operations by connecting to
//          CDB$ROOT.
24544, 00000, "Oracle RAC One Node instance is already running."
// *Cause:  An instance startup failed because an instance of the Oracle RAC
//          One Node database was already running on one of the cluster nodes.
// *Action: In Oracle RAC One Node, avoid any attempt to start a second
//          instance by any means while the instance is already running.
/
/       Diagnosability Related OCI error messages (24550 - 24574)
/
24550, 00000, "unhandled signal #%ld received. %s"
// *Cause:   Serious error: signal received
// *Action:  Refer to the platform-specific signal code, and see if the
//           application code caused the error. Otherwise, record
//           all error state and notify Oracle Support Services.
24551, 00000, "internal error %s"
// *Document: NO 
// *Cause:   There is not enough memory on the system or the application
//           was leaking memory.
// *Action:  Restart application. If error persists, record
//           all error state and notify Oracle Support Services.
24552, 00000, "%s parameter exceeds limit of %d"
// *Document: NO 
// *Cause:   Number of parameters specified in OCI trace event have exceeded
//           the limit.
// *Action: Record all error state and notify Oracle Support Services.
24553, 00000, "internal error parsing OCI trace event string(%s)"
// *Document: NO 
// *Cause: internal use only
24554, 00000, "trace directory exceeds %d bytes(%.*s)."
// *Document: NO 
// *Cause: internal use only
24555, 00000, "trace file %s cannot be opened in %s directory"
// *Document: NO 
// *Cause: internal use only
24556, 00000, "invalid OCI trace event string(%s)"
// *Document: NO 
// *Cause: internal use only
24557, 00000, "error %s encountered while handling error %s; exiting server process"
// *Cause:    A second-level error occurred in an Oracle server process that
//            required that process to exit.
// *Action:   None. If an excessive number of incidents are dumped, contact
//            Oracle Support Services.
/
/       OCI Driver for MySQL error messages (24600 - 24699)
/
24600, 00000, "could not create OCI environment"
// *Cause:   The Oracle Client library used to communicate with the database
//           failed to initialize correctly.
// *Action:  Check that the Oracle environment or registry entries are
//           consistent and correct.  If using the Oracle Instant Client,
//           make sure the Oracle driver for MySQL and Oracle libraries
//           are from the same release. Make sure you have read access to
//           the libraries.
24601, 00000, "bind buffer not allocated by caller"
// *Cause:   A valid buffer was not provided for the bind call.
// *Action:  Provide a non-NULL pointer for the bind call and a valid
//           length for the buffer.
24602, 00000, "attempting to read with no fetch"
// *Cause:    A column was being fetched while not in fetch state.
// *Action:   Fetch the column after fetching of the result set has started.
/
/       Transaction Related OCI error messages (24750 - 24799)
/
24750, 00000, "incorrect size of attribute"
// *Cause:   Transaction ID attribute size is incorrect.
// *Action:  Verify that the size parameter is correct.
24752, 00000, "OCI_TRANS_NEW flag must be specified for local transactions"
// *Cause:   Application attempted to start a local transaction without using
//           OCI_TRANS_NEW.
// *Action:  Use OCI_TRANS_NEW when starting local transactions.
24753, 00000, "local transactions cannot be detached"
// *Cause:   An attempt to detach a local transaction was made.
// *Action:  Local transactions may only be committed or rolled back.
24754, 00000, "cannot start new transaction with an active transaction"
// *Cause:   An attempt to start a new transaction was made when there was an
//           active transaction.
// *Action:  Commit, rollback or detach the existing transaction before
//           starting a new transaction.
24755, 00000, "OCI_TRANS_NOMIGRATE, OCI_TRANS_JOIN options are not supported"
// *Cause:   These flags are currently not supported.
// *Action:
24756, 00000, "transaction does not exist"
// *Cause:   An invalid transaction identifier or context was used or the
//           transaction has completed.
// *Action:  Supply a valid identifier if the transaction has not completed
//           and retry the call.
24757, 00000, "duplicate transaction identifier"
// *Cause:  An attempt was made to start a new transaction with an identifier
//          already in use by an existing transaction.
// *Action: Verify that the identifier is not in use.
24758, 00000, "not attached to the requested transaction"
// *Cause:  An attempt was made to detach or complete a transaction that is
//          not the current transaction.
// *Action: Verify that the transaction context refers to the current
//          transaction.
24759, 00000, "invalid transaction start flags"
// *Cause:  An invalid transaction start flag was passed.
// *Action: Verify that only one of the following values is specified:
//          OCI_TRANS_NEW, OCI_TRANS_JOIN, OCI_TRANS_RESUME, or OCI_TRANS_PROMOTE. 
24760, 00000, "invalid isolation level flags"
// *Cause:  An invalid isolation level flag was passed.
// *Action: Verify that only one of following values - OCI_TRANS_READONLY,
//          OCI_TRANS_READWRITE, OCI_TRANS_SERIALIZABLE is used.
24761, 00000, "transaction rolled back"
// *Cause:
// *Action:
24762, 00000, "server failed due to unspecified error"
// *Cause:  An internal error has occured in the server commit protocol.
// *Action: Contact customer support.
24763, 00000, "transaction operation cannot be completed now"
// *Cause:  The commit or rollback cannot be performed now because the
//          session cannot switch to the specified transaction.
// *Action: Retry the operation later.
24764, 00000, "transaction branch has been heuristically committed"
// *Cause:
// *Action:
24765, 00000, "transaction branch has been heuristically rolled back"
// *Cause:
// *Action:
24766, 00000, "transaction branch has been partly committed and aborted"
// *Cause:
// *Action:
24767, 00000, "transaction branch prepare returns read-only"
// *Cause:  The transaction is read-only, or this is the outcome of an
//          optimization for two-phase commit protocol.
// *Action: None.  Informational only.
24768, 00000, "commit protocol error occured in the server"
// *Cause:
// *Action: Contact customer support
24769, 00000, "cannot forget an active transaction"
// *Cause:  Transaction identifier refers to an active transaction.
// *Action: Verify that the identifier of an active transaction was not
//          passed as an argument.
24770, 00000, "cannot forget a prepared transaction"
// *Cause:  Transaction identifier refers to a prepared transaction.
// *Action: Verify that the identifier of a prepared transaction was not
//          passed as an argument.
24771, 00000, "cannot detach, prepare or forget a local transaction"
// *Cause:  Service handle contains a local transaction context.
// *Action: Verify that the transaction context does not refer to a local
//          transaction.
24772, 00000, "Cannot mix tightly-coupled and loosely-coupled branches"
// *Cause:  Application attempted to start a transaction with a global
//          transaction identifier and a wrong option.
// *Action: Verify that all branches of a global transaction are started with
//          either OCI_TRANS_TIGHT or OCI_TRANS_LOOSE option. If the
//          application is correct and uses distributed updates,
//          contact customer support.
24773, 00000, "invalid transaction type flags"
// *Cause:  OCI_TRANS_TIGHT or OCI_TRANS_LOOSE mode was not specified.
// *Action: Verify that the right parameters are being used.
24774, 00000, "cannot switch to specified transaction"
// *Cause:  The transaction specified in the call refers to a transaction
//          created by a different user.
// *Action: Create transactions with the same authentication so that they
//          can be switched.
24775, 00000, "cannot prepare or commit transaction with non-zero lock value"
// *Cause:  An attempt was made to detach the transaction with a non-zero lock
//          value.
// *Action: Detach the transaction with lock value set to zero and then try to
//          prepare or commit the transaction.
24776, 00000, "cannot start a new transaction"
// *Cause:  An attempt was made to start a new transaction when session was
//          already attached to an existing transaction.
// *Action: End the current transaction before creating a new transaction.
24777, 00000, "use of non-migratable database link not allowed"
// *Cause:  The transaction, which needs to be migratable between sessions,
//          tried to access a remote database from a non-multi threaded
//          server process.
// *Action: Perform the work in the local database or open a connection to
//          the remote database from the client. If multi threaded server
//          option is installed, connect to the Oracle instance through the
//          dispatcher.
24778, 00000, "cannot open connections"
// *Cause:  The migratable transaction tried to access a remote database when
//          the session itself had opened connections to remote database(s).
// *Action: Close the connection(s) in the session and then try to access the
//          remote database from the migratable transaction. If the error
//          still occurs, contact Oracle customer support.
24779, 00000, "detach not allowed with open remote cursor"
// *Cause:  The migratable transaction tried to detach from the current
//          session while having an open remote cursor.
// *Action: Close any open remote cursor prior to detach.
24780, 00000, "cannot recover a transaction while in an existing transaction"
// *Cause:  An attempt was made to commit or roll back a transaction
//          while in a different transaction, and the transaction for
//          which the action is requested is in a recovery state
//          (this happens if it is idle too long).
// *Action: Detach from the current transaction and retry the operation.
24781, 00000, "branches don't belong to the same global transaction"
// *Cause:  The list of xids passed into kpotxmp() don't have the same gtrid
// *Action:
24782, 00000, "Cannot detach from a non-migratable transaction"
// *Cause:  An attempt was made to detach from a non-migrateable transaction.
// *Action: Either commit or rollback the transaction.
24783, 00000, "Cannot switch non-migratable transactions"
// *Cause:  An attempt was made to prepare/commit a txn different from current.
// *Action:
24784, 00000, "Transaction exists"
// *Cause:  An attempt was made to start a transaction, while attached
//          to a non-migrateable transaction
// *Action:
24785, 00000, "Cannot resume a non-migratable transaction"
// *Cause:  An attempt was made to resume a non-migrateable transaction.
// *Action:
24786, 00000, "separated transaction has been completed"
// *Cause:  The current transaction has been completed by another process.
// *Action: Start a new transaction
24787, 00000, "remote cursors must be closed before a call completes"
// *Cause:  The previous operation did not close all the remote cursors it
//          opened. Since separated transactions are enabled, this is not
//          allowed.
// *Action: Close all remote cursors in each call, or start a regular
//          (non-separated) transaction.
24788, 00000, "cannot switch to specified transaction (server type)"
// *Cause:  The transaction specified was created by a shared server and
//          the requestor is a dedicated server, or the transaction was
//          created by a dedicated server and the requestor is a shared
//          server.
// *Action: All parts of this application should connect as dedicated
//          or as shared.
24789, 00000, "start not allowed in recursive call"
// *Cause:  Oracle RM will not start/resume a branch in a recursive call
// *Action: Reconsider your application stack design
24790, 00000, "cannot mix OCI_TRANS_RESUME and transaction isolation flags"
// *Cause:  An attempt was made to change the isolation level of an
//          existing transaction.
// *Action: No action required
24791, 00000, "invalid transaction start flags"
// *Cause:  An invalid transaction start flag was passed.
// *Action: Verify that OCI_TRANS_LOOSE was not passed along with 
//          OCI_TRANS_JOIN, OCI_TRANS_RESUME. Also, verify that other flags
//          (such as OCI_TRANS_SEPARABLE) passed by the client are supported
//          by the version of the Oracle server.
24792, 00000, "cannot mix services in a single global transaction"
// *Cause:  Oracle RM will not serve global (distributed) transaction
//          requests if branches are created using different services
// *Action: Configure clients such that those participating in the same
//          distributed transaction use the same service name.
24793, 00000, "DTP(Distriubted Transaction Processing) test and debug"
// *Document: NO 
// *Cause: internal use only
// *Action: none.
24794, 00000, "no active DTP service found"
// *Cause:  Oracle RM will not serve global (distributed) transaction
//          requests until DTP services are configured in RAC. It is
//          possible that a service was stopped while transactions were
//          in-flight.
// *Action: Provision/Start DTP services first.
24795, 00000, "Illegal %s attempt made"
// *Cause:  An illegal attempt was made to commit/rollback current transaction
// *Action: Use appropriate commit/rollback mechanism
24796, 00000, "operation completed; resume of original transaction rolled back"
// *Cause:  The commit, rollback, or prepare completed successfully, but
//          the current transaction for this thread was rolled back.
// *Action: If desired, retry the current transaction. If the operation 
//          was prepare, then end transaction appropriately with a commit 
//          or rollback operation. 
24797, 00000, "cannot promote the current transaction to a distributed transaction"
// *Cause:  An illegal attempt was made to promote the current transaction.
// *Action: Verify that OCI_ATTR_XID, OCI_ATTR_INTERNAL_NAME, and OCI_ATTR_EXTERNAL_NAME
//          attributes have been set properly, and verify that the current
//          transaction has neither performed IDL or PDML operations, nor already
//          been a distributed transaction. Also, verify that the local transaction
//          is in the same isolation level if the isolation flag value is set.
24798, 00000, "cannot resume the distributed transaction branch on another instance"
// *Cause:  An attempt was made to resume a distributed transaction branch that is
//          physically located on another RAC instance.
// *Action: Get a connection to the instance where the transaction branch is located.
/
/
/
/       OCI Lob/File Related Error message (24800 - 24849)
/
24801, 00000, "illegal parameter value in OCI lob function"
// *Cause:  One of the parameter values in the OCI lob function is illegal.
// *Action: Check every parameter in the OCI Lob function call to make sure
//          they are correct.  Offsets should be greater than or equal to one.
24802, 00000, "user defined lob read callback error"
// *Cause:  The only valid return value for a user defined lob read callback
//          function is OCI_CONTINUE.  Any other value will cause this error.
// *Action: Verify that OCI_CONTINUE is returned from the user defined
//          lob read callback function.
24803, 00000, "illegal parameter value in lob read function"
// *Cause: Internal error .
// *Action: This error should not normally occur.  If it persists,
//          please contact your customer service representative.
24804, 00000, "Lob read/write functions called while another OCI LOB read/write streaming is in progress"
// *Cause: Internal error.
// *Action: Wait for the ongoing LOB streaming call to finish before
//          issuing the next server call, or use OCIBreak() abort the
//          current LOB streaming call.
24805, 00000, "LOB type mismatch"
// *Cause: When copying or appending LOB locators, both source and
//         desctination LOB locators should be of the same type.
// *Action: Pass the same type of LOB locators for copying or appending.
24806, 00000, "LOB form mismatch"
// *Cause: When reading from or writing into LOBs, the character set
//         form of the user buffer should be same as that of the LOB.
// *Action: Make sure that the buffer you are using to read or write
//          has the same form as that of the LOB.
24807, 00000, "LOB form mismatch"
// *Cause: When copying or appending LOBs, both source and
//         desctination LOB locators should have the same character
//         set form.
// *Action: Pass locators of the same character set form for copying
//          or appending LOBs.
/
24808, 00000, "streaming of lob data is not allowed when using lob buffering"
// *Cause: Attempted to stream lob data via the polling mode or a callback
//         when lob buffering was enabled for the input lob locator.
// *Action: Lob buffering is useful when reading/writing small amounts of
//          lob data so streaming should not be necessary.  Rewrite the
//          OCILobRead/OCILobWrite call so that it does not use streaming.
//          If streaming of data is required, lob buffering should not be
//          used.  In this case, flush buffers associated with the input
//          lob locator as necessary, disable buffering on the input lob
//          locator and reissue the OCILobRead/OCILobWrite call.
/
24809, 00000, "amount specified will not fit in the lob buffers"
// *Cause: LOB buffering is enabled for the input lob locator so buffering
//         will be used.  However, the amount of lob data to read or write
//         is larger than what the lob buffers can hold.
// *Action: Either disable buffering on the input lob locator and reissue
//          the command or pass a smaller amount.
/
24810, 00000, "attempting to write more data than indicated"
// *Cause: While writing into a LOB, more data was supplied than
//         indicated.
// *Action: If data is written in pieces, then make sure that you
//          do not provide more data in the pieces (cumulatively), than
//          you indicated.
/
24811, 00000, "less data provided for writing than indicated"
// *Cause: While writing into a LOB, less data was provided than
//         indicated.
// *Action: If writing data in single pieces, then make sure that the buffer
//          length specified is big enough to accommodate tha data being
//          provided. If data is written in pieces, then make sure that all
//          the data has been provided before specifying OCI_LAST_PIECE.
/
24812, 00000, "character set conversion to or from UCS2 failed"
// *Cause: If the database character set is varying-width, the CLOB/NCLOB
//         value is implicitly converted to or from UCS2.  This implicit
//         conversion failed.
// *Action: Contact Oracle Worldwide Support.
/
24813, 00000, "cannot send or receive an unsupported LOB"
// *Cause:  An attempt was made to send a LOB across the network, but either
//          the server does not support the LOB sent by the client, or the
//          client does not support the LOB sent by the server. This error
//          usually occurs when the client and server are running different
//          versions of Oracle.
// *Action: Use a version of the Oracle that supports the LOB on both
//          the client and the server.
/
24814, 00000, "operation not allowed for temporary LOBs"
// *Cause:  Temporary LOB locators are not allowed in the operation.
//          For example:
//          OCILobAssign only takes persistent LOB locators as parameters,
//          not temporary LOBs.
// *Action: Use OCILobLocatorAssign for temporary LOBs instead.
//          Note that OCILobLocatorAssign can also be used for persistent
//          LOBs, in which case it will behave the same as OCILobAssign.
/
24815, 00000, "Invalid character set form"
// *Cause:  An invalid character set form was passed into an OCI LOB function.
//          For example, the only valid cs form for OCILobCreateTemporary()
//          is OCI_DEFAULT(0), SQLCS_IMPLICIT(1) or SQLCS_NCHAR(2).         
// *Action: Specify a valid character set form.           
24816, 00000, "Expanded non LONG bind data supplied after actual LONG or LOB column"
// *Cause:  A Bind value of length potentially > 4000 bytes follows binding for
//          LOB or LONG.
// *Action: Re-order the binds so that the LONG bind or LOB binds are all
//          at the end of the bind list.
24817, 00000, "Unable to allocate the given chunk for current lob operation "
// *Cause:  The given size is increased to accomodate the number of bytes from 
//          server due to varying width db char/nchar set.
// *Action: Use smaller chunk sizes when you have character set conversion
//          between client/server or perform piece-wise read or write.
/
24818, 00000, "Operation not permitted on Abstract LOBs"
// *Cause:  Abstract LOB locators were not allowed in the operation.
//          For example, OCILobAssign only takes persistent LOB locators 
//          as parameters, not Abstract (i.e., client-side created) LOBs.
// *Action: Avoid the operation on Abstract LOBs.
/
24819, 00000, "Illegal reference count encountered for a temporary LOB"
// *Cause:  Internal error.
// *Action: This error should not normally occur. If it persists,
//          contact Oracle Support Services.
/
24820, 00000, "Differnt LOB function called while another OCI LOB call is in progress"
// *Cause: An attempt was made to execute a new OCI LOB call while
//         another OCI LOB call was in progress.
// *Action: Wait for the ongoing LOB streaming call to finish before
//          issuing the next server call, or use OCIBreak() to abort the
//          current LOB streaming call.
/
24821, 00000, "LOB prefetch size supplied is larger than the supported limit."
// *Cause: A very large LOB prefetch size was specified during a query.
// *Action: Reduce the prefetch size to an acceptable value.
/
/       OCI Shared Structures Related Error Messages (24850 - 24874)
/
24850, 00000, "failed to startup shared subsystem"
// *Cause:  While attempting to initialize OCI in shared mode, a problem
//          was encountered in starting up the shared subsystem.
// *Action: Contact Oracle Customer support.
/
24851, 00000, "failed to connect to shared subsystem"
// *Cause:  While attempting to initialize OCI in shared mode, a problem
//          was encountered in connecting the process to the shared subsystem.
// *Action: Contact Oracle Customer Support.
/
24852, 00000, "protocol error during statement execution"
// *Cause:  An internal protocol error occurred while receiving describe data
//          from the server during execution of a statement.
// *Action: Contact Oracle Customer Support.
/
24853, 00000, "failed to connect thread to shared subsystem"
// *Cause:  While attempting to initialize OCI in shared mode, a problem
//          was encountered in connecting the thread to the shared subsystem.
// *Action: Contact Oracle Customer Support.
/
24854, 00000, "invalid pieceinfo provided" 
// *Cause:  While making the first call to write LOB data, an invalid 
//          pieceinfo value provided.
// *Action: Correct the call to use OCI_ONE_PIECE or OCI_FIRST_PIECE. 
//          If using OCCI, make sure to call writeBuffer before calling
//          writeLastBuffer.
/
24855, 00000, "attempt to pass a LOB locator over an invalid database link"
// *Cause:  There was an attempt to send a LOB locator over a database
//          link which was different from the one on which it was obtained.
// *Action: Ensure that remote LOB locators are passed back on the same
//          database link from which they were obtained.
/
/
/
/       OCI Notification Related Error message (24900 - 24939)
/
/
24900, 00000, "invalid or unsupported mode parameter passed in call"
// *Cause: The mode parameter passed into the OCI Client Notification call
//         is incorrect.
// *Action: Please correct the mode parameter passed into OCI.
/
24901, 00000, "handles belonging to different environments passed into an OCI call"
// *Cause: All handles passed into an OCI call should belong to the same
//         environment. In the call that returned this error, handles
//         belonging to different environments were passed in.
// *Action: Please ensure that the handle parameters in the call to come from
//          the same OCI Environment.
/
24902, 00000, "invalid subscription name or name-length in subscription handle"
// *Cause: The subscription handle passed into the OCI call does not have
//         a proper name or name-length attribute.
// *Action: Please set the name and name-length attributes using the
//          OCIAttrSet() call.
/
24903, 00000, "invalid namespace attribute passed into OCI call"
// *Cause: The subscription handle passed into the OCI call does not have
//         a proper namespace attribute.
// *Action: Please set the namespace attribute using the OCIAttrSet()
//          call.
/
24904, 00000, "invalid callback attribute passed into OCI call"
// *Cause: The subscription handle passed into the OCI call does not have
//         a proper callback attribute.
// *Action: Please set the callback attribute using the OCIAttrSet()
//          call.
/
24905, 00000, "invalid recipient protocol attribute passed into OCI call"
// *Cause: The subscription handle passed into the OCI call did not have
//         a proper recipient protocol attribute.
// *Action: Please set the recipient protocol attribute using the OCIAttrSet()
//          call.
/
24906, 00000, "invalid recipient attribute passed into OCI call"
// *Cause: The subscription handle passed into the OCI call did not have
//         a proper recipient attribute.
// *Action: Please set the recipient attribute using the OCIAttrSet()
//          call.
/
24907, 00000, "invalid pair of callback and recipient protocol attributes"
// *Cause: The subscription handle passed into the OCI call can't have
//         both the callback defined and a recipient protocol other than
//         OCI_SUBSCR_PROTO_OCI at the same time.
// *Action: Please set the appropriate callback and recipient protocol
//          attributes using the OCIAttrSet() call.
24908, 00000, "invalid recipient presentation attribute"
// *Cause: The subscription handle passed into the OCI call does not have a
//         valid recipient presentation attribute.
// *Action: Set the recipient presentation attribute using the OCIAttrSet()
//          call
24909, 00000, "call in progress. Current operation cancelled"
// *Cause: The OCI call was invoked when another call on the connection was
//         in progress.
// *Action: Check if the OCI call is supported when the call is in progress
//          under special conditions; for example, if it is being used by a
//          signal handler.
// NLS_DO_NOT_TRANSLATE [24910,24910]
24910, 00000, "Event to enable optimized fetch protocol"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to obtain better fetch
//          performance
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
24911, 00000, "Cannot start listener thread at specified port"
// *Cause: Thread already running at a different port.
// *Action: Set the correct port in the environment handle or let the system
//          choose the port.
24912, 00000, "Listener thread failed. %s"
// *Cause: Thread listening for event notification exited because of an error.
//         The error encountered is appended to the error message.
// *Action: The client needs to be restarted.
24913, 00000, "Event to enable NLS validation"
// *Cause: N/A
// *Action: Set this event in your environment to enable NLS character 
//          validation even when character sets are the same for client/server.
// NLS_DO_NOT_TRANSLATE [24914,24914]
24914, 00000, "Notification crash test"
// *Cause: N/A 
// *Action: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
/
24915, 00000, "Cannot start Listener at specified IP address" 
// *Cause: Thread was already listening at a different IP address.
// *Action: Set the correct IP address in the environment handle or 
// let the system choose the correct IP address.
/
24916, 00000, "cannot use IP address attribute before release 11.2 compatible notifications"
// *Cause: An attempt was made to use OCI_ATTR_SUBSCR_IPADDR attribute 
// before release 11.2 compatible notifications.
// *Action: Change the compatibility to 11.2.
/
// NLS_DO_NOT_TRANSLATE [24917,24917]
24917, 00000, "OCI notification client trace event"
// *Cause: N/A
// *Action: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
/
24918, 00000, "secure notification mode not supported"
// *Cause: An attempt was made to use OCI_SECURE_NOTIFICATION
// before release 12.0 compatible notifications.
// *Action: Change the compatibility to 12.0.
/
24919, 00000, "subscription to Fast Application Notification failed"
// *Cause:  An error occurred while subscribing to Fast Application 
//          Notification. This could be due to problems in the Oracle 
//          clusterware configuration.
// *Action: Look at the client trace files for additional information.
//          Ensure that the Oracle clusterware is properly configured.
/
24920, 00000, "column size too large for client"
// *Cause:  Client attempted to fetch a column whose size is larger than
//          the maximum size that can be handled by the client.
// *Action: Upgrade the client stack to Oracle 12c or higher.
/
// NLS_DO_NOT_TRANSLATE [24921,24921]
24921, 00000, "Event to increase default max length of BL fields"
// *Cause: N/A
// *Action: Set this event in your environment to use a different size than
//          TTC_DEFAULT_MBL. THIS IS NOT A USER ERROR NUMBER/MESSAGE AND DOES
//          NOT NEED TO BE TRANSLATED OR DOCUMENTED.
// *Document: NO
/
24922, 00000, "cannot send or receive an SCN value which is too high for the current compatibility setting"
// *Cause:  An attempt was made to send or receive a high value system change
//          number (SCN) over the network, but either the sever or client 
//          does not support such a high value SCN. This error usually occurs 
//          when either the server or client compatibility is lower than 12.2.
// *Action: Be sure the database compatibility is 12.2 or above on both 
//          the client and server.
/
/       Generic Notification Related Error message (24940 - 24949)
/
24940, 00000, "invalid combination of %s namespace, %s presentation and %s receive protocol"
// *Cause: An invalid combination of namespace, presentation and receive 
//         protocol was specified during notification registration. Currently, 
//         only AQ namespace is supported with XML presentation. Non-AQ 
//         namespace is not supported for e-mail and HTTP receive protocols. 
// *Action: Please change the register call appropriately. 
24941, 00000, "invalid combination of notification grouping attributes"
// *Cause: An invalid combination of notification grouping attributes was
//         specified. Currently, only TIME notification grouping class is 
//         supported. If notification grouping class is zero, all other 
//         notification grouping attributes must be zero.
// *Action: Refer to documentation and change the attributes appropriately.
24942, 00000, "cannot use ntfn grouping attributes on before release 11.0 compatible ntfns"
// *Cause: An attempt was made to use notification grouping on before release
//         11.0 compatible notifications.
// *Action: Change the compatibility to 11.0.
24943, 00000, "cannot use ntfn grouping with this receive protocol, presentation and/or QoS"
// *Cause: An attempt was made to use notification grouping with e-mail or HTTP
//         receive protocol or XML presentation or payload delivery or reliable
//         QoS. Currently, only OCI and PLSQL receive protocols and default 
//         presentation are supported with notification grouping.
// *Action: Refer to documentation and change the call appropriately.
24944, 00000, "cannot use timeout or grouping with ANONYMOUS namespace"
// *Cause: An attempt was made to use timeout or grouping with ANONYMOUS 
//         namespace. Currently, timeout and grouping are supported only with 
//         AQ and DBCHANGE namespaces.
// *Action: Refer to documentation and change the call appropriately.
24945, 00000, "cannot use context, QOS and timeout attributes of notification on lower than 10.2 compatible notifications"
// *Cause: An attempt was made to use context, QOS and timeout attributes of 
//         notification on lower than 10.2 compatible notifications.
// *Action: Change the database compatibility to 10.2.
24946, 00000, "invalid registration callback"
// *Cause: An attempt was made to use a reserved callback for notification 
//         registration.
// *Action: Choose a different name for the notification callback and 
//          change the register call appropriately.
24947, 00000, "Invalid namespace attribute specified for the subscription %s"
// *Cause: An attempt was made to register with invalid namespace attribute.
// *Action: Refer to documentation and change the namespace appropriately.
24948, 00000, "number of registrations for this subscription exceeds the limit"
// *Cause: The maximum number of registrations already existed for this subscription.
// *Action: Change the queue policy or close any existing registrations and try again.
/
/       PL/SQL Notification Related Error message (24950 - 24959)
/
24950, 00000, "unregister failed, registration not found"
// *Cause: The registration that was asked to be unregistered could
//         not be found.
// *Action: Please check the callback function name and the subscription name
//          in the unregister call.
/
// NLS_DO_NOT_TRANSLATE [24951,24951]
24951, 00000, "EMON tracing event"
// *Cause: N/A
// *Action: Event used to trace EMON.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
24952, 00000, "register, unregister or post has incorrect collection count"
// *Cause: The register, unregister or post function was invoked with a
//         collection that was smaller than the size specified by the parameter
//         to the function.
// *Action: Please check the function's use and ensure that the size parameter
//          is correct.
/
/
/
/      More General OCI Related messages  (24960 - 24980)
/
/
24960, 00000, "the attribute  %s is greater than the maximum allowable length of %d"
// *Cause:  The user attempted to pass an attribute that is too long
// *Action: Shorten the specified attribute and retry the operation.
/ 
24961, 00000, "Event for OCI"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
/
24962, 00000, "connect string could not be parsed, error = %s"
// *Cause: The address portion of the connect string could not be parsed.  
//         The client may be using a format of the connect string that the 
//         server does not understand.
// *Action: Correct the connect string.
/
24963, 00000, "Event for client auto tuning"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
/
24964, 00000, "ALTER SESSION SET CONTAINER error"
// *Cause: An attempt to switch to a PDB with different settings
//         such as character set, time zone or time zone file version 
//         on an Oracle 12c Release 1 (12.1) or earlier client failed.
// *Action: Upgrade client to Oracle 12 Release 2 (or later) to support such 
//          operations. 
/
24966, 00000, "Event for kpocon internal tracing"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
24967, 00000, "Event for NPI internal tracing"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
24968, 00000, "Event for set container"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
24969, 00000, "iteration count of %d not supported for this statement"
// *Cause: This statement was not supported with iteration count greater 
//         than one.
// *Action: Execute the statement with an iteration count of one.
/
/       24981 - 24990 Reserved for defer sga allocation errors
/
24981, 00000, "deferred SGA thread spawn failed"
// *Cause: This is an internal error.
// *Action: None 
24982, 00000, "deferred SGA segment allocation failed, index = %s location = %s"
// *Cause: System-defined shared memory limits are inadequate for Oracle.
// *Action: Consult the alert file for details.
24983, 00000, "Process (%s) failed to attach to deferred SGA segments."
// *Cause: The process failed to attach to deferred SGA segments.
// *Action: Consult the alert file for details and contact Oracle Support
//          Services.
24984, 00000, "SGA allocation slaves termination failed"
// *Cause: This is an internal error.
// *Action: None
/
/       25000-25099 Reserved for Trigger errors
/
25000, 00000, "invalid use of bind variable in trigger WHEN clause"
// *Cause: A bind variable was used in the when clause of a trigger.
// *Action: Remove the bind variable.  To access the table columns use
//         (new/old).column_name.
25001, 00000, "cannot create this trigger type on this type of view"
// *Cause:  INSTEAD OF triggers can be created on any view which is not an 
//          Editioning View, while BEFORE and AFTER triggers may only be 
//          created on Editioning Views.
// *Action: Change the trigger type to INSTEAD OF or change the view on which
//          you are attempting to create a DML trigger.
25002, 00000, "cannot create INSTEAD OF triggers on tables"
// *Cause:  Only BEFORE or AFTER triggers can be created on a table.
// *Action: Change the trigger type to BEFORE or AFTER.
25003, 00000, "cannot change NEW values for this column type in trigger"
// *Cause:  Attempt to change NEW trigger variables of datatype object, REF,
//          nested table, VARRAY or LOB datatype which is not supported.
// *Action: Do not change the NEW trigger variables in the trigger body.
25004, 00000, "WHEN clause is not allowed in INSTEAD OF triggers"
// *Cause:  WHEN clause is specified in an INSTEAD OF trigger.
// *Action: Remove the WHEN clause when creating an INSTEAD OF
//          trigger.
25005, 00000, "cannot CREATE INSTEAD OF trigger on a read-only view"
// *Cause:  attempt to create an INSTEAD OF trigger on a view
//          created with read-only option.  The view cannot be
//          updated using INSTEAD OF triggers.
// *Action: Do not create the trigger.
25006, 00000, "cannot specify this column in UPDATE OF clause"
// *Cause:  Attempt to create a trigger on update of a column whose
//          datatype is disallowed in the clause, such as LOB and
//          nested table.
// *Action: Remove the UPDATE OF clause.
25007, 00000, "functions or methods not allowed in WHEN clause"
// *Cause:  PLSQL function call or method invocation is not allowed
//          in the WHEN clause when creating a trigger.
// *Action: Remove the function call or method invocation from
//          the WHEN clause.
25008, 00000, "no implicit conversion to LOB datatype in instead-of trigger"
// *Cause:  When inserting or updating a view using instead-of trigger,
//          the new value for a LOB view column is of a different datatype.
// *Action: Specified a LOB value as the new value for the LOB view column.
//
25009, 00000, "Nested table clause allowed only for INSTEAD OF triggers"
// *Cause:  Triggers on nested tables can only be created on view columns
//          using INSTEAD OF triggers.
// *Action: Use view nested table columns for defining nested table triggers.
//
25010, 00000, "Invalid nested table column name in nested table clause"
// *Cause:  The column name specified in the nested table clause of an
//          INSTEAD OF trigger does not correspond to a nested table column.
// *Action: Specify a nested table column on which the trigger is to be defined.
//
25011, 00000, "cannot create trigger on internal AQ table"
// *Cause:  An attempt was made to try to create a trigger on a table that is 
//          used internally to support the Advanced Queueing (AQ) feature.
// *Action: Do not create the trigger.
25012, 00000, "PARENT and NEW values cannot be identical"
// *Cause:  The referencing clause specifies identical values for PARENT and OLD.
// *Action: Re-specify either the PARENT or NEW referencing value.
//
25013, 00000, "OLD and PARENT values cannot be identical"
// *Cause:  The referencing clause specifies identical values for OLD and PARENT.
// *Action: Re-specify either the OLD or PARENT referencing value.
//
25014, 00000, "cannot change the value of a PARENT reference variable"
// *Cause:  Parent values can only be read and not changed.
// *Action: Do not attempt to change a Parent variable.
//
25015, 00000, "cannot perform DML on this nested table view column"
// *Cause:  DML cannot be performed on a nested table view column except through
//          an INSTEAD OF trigger
// *Action: Create an INSTEAD OF trigger over the nested table view column
//          and then perform the DML.
//
25016, 00000, "cannot specify column list for insert into nested table view column"
// *Cause:  A column list cannot be specified for inserts into the nested table
//          view column.
// *Action: Specify all the columns for insert into the nested table.
//
25017, 00000, "cannot reference NEW ROWID for movable rows in before triggers"
// *Cause:  NEW ROWID was referenced in a before row trigger which is defined
//          on an index-organized table, or a partitioned table with enabled
//          movement of rows. The ROWID cannot be computed in a before row
//          update trigger because it depends on the actual values of the row
// *Action: Remove references to NEW ROWID from the trigger definition.
//
25018, 00000, "conflicting trigger %s already exists"
// *Cause:  Conflicting instead of DDL trigger on schema/database already
//          exists.
// *Action: Remove the old trigger
//
25019, 00000, "too much concurreny"
// *Cause:  cannot pin the database/schema because of too much concurrency
// *Action: try the operation later
//
25020, 00000, "renaming system triggers is not allowed"
// *Cause:  renaming system triggers is not allowed
// *Action: Drop the trigger, and create a new one for the same
//
25021, 00000, "cannot reference a trigger defined on another table"
// *Cause: Referenced trigger in the FOLLOWS clause was defined
//         on another table.
// *Action: Create the referenced trigger on the same table
25022, 00000, "cannot reference a trigger of a different type"
// *Cause: Referenced trigger in the FOLLOWS or PRECEDES clause was either 
//         a different type or not a compound trigger.
// *Action: Create the referenced trigger as the same type or a compound 
//          trigger.
25023, 00000, "Cyclic trigger dependency is not allowed"
// *Cause: A cycle of trigger dependency can be formed.
// *Action: Do not create a trigger that can formed a cyclic dependency.
25024, 00000, "cannot specify FOLLOWS for a REVERSE CROSSEDITION trigger"
// *Cause: The FOLLOWS clause was specified when creating the 
//         REVERSE CROSSEDITION trigger.
// *Action: Do not create a REVERSE CROSSEDITION trigger with a FOLLOWS clause.
25025, 00000, "cannot specify PRECEDES clause"
// *Cause: The PRECEDES clause was specified when creating a FORWARD 
//         CROSSEDITION trigger or a regular trigger.
// *Action: Do not create a FORWARD CROSSEDITION or a regular trigger with 
//          a PRECEDES clause.
25026, 00000, "FOR EACH ROW was specified with compound triggers"
// *Cause:  FOR EACH ROW is not allowed with compound triggers.
// *Action: Remove the FOR EACH ROW clause.
//
25027, 00000, "compound triggers cannot be used as system triggers"
// *Cause:  Compound trigger was defined as system trigger.
// *Action: Do not use compound trigger as system trigger.
//
25028, 00000, "regular trigger body can not start with keyword COMPOUND"
// *Cause:  Regular triggers body should start with BEGIN/DECLARE etc .
// *Action: Fix the syntax and recompile.
//
25029, 00000, "compound triggers should always start with keyword COMPOUND"
// *Cause:  Compound trigger body was started with incorrect keyword.
// *Action: Fix the syntax and recreate.
//
25030, 00000, "crossedition trigger cannot be owned by a non-editioned user"
// *Cause:  An attempt was made to create a crossedition trigger in a
//          schema where triggers were not editionable.
// *Action: Enable editions for the user for triggers and then create the
//          crossedition trigger.
//
25031, 00000, "only a crossedition trigger may be specified"
// *Cause:  The trigger specified was not a crossedition trigger.
// *Action: Specify a crossedition trigger.
//
25032, 00000, "crossedition trigger cannot be created in ORA$BASE"
// *Cause:  An attempt was made to create crossedition trigger
//          in the ORA$BASE edition.
// *Action: Do not create a crossedition trigger in the ORA$BASE edition.
//
25033, 00000, "triggers cannot be executed at this time"
// *Cause:  An attempt was made to execute a trigger
//          when the session was almost finished.
// *Action: Do not attempt to DML with triggers that are expected
//          to execute when session has almost ended.
25034, 00000, "cannot bypass trigger owned by another user"
// *Cause:  An attempt was made to do DML from a crossedition trigger on an
//          object that has a non-crossedition trigger owned by another user.
//          DML from a crossedition trigger bypasses the running of
//          non-crossedition triggers; this cannot be allowed for triggers
//          owned by other users.
// *Action: Permit the non-crossedition trigger to be bypassed by attaching it
//          to the editioning view rather than the table, moving one
//          of the triggers to be in the same schema as the other,
//          or explicitly disabling the non-crossedition trigger.
25035, 00000, "cannot perform DML on remote object from a crossedition trigger"
// *Cause:  An attempt was made to do DML from a crossedition trigger that
//          would modify data in a remote database.  DML from a crossedition
//          trigger has special rules applied regarding what triggers will fire
//          as part of that DML; these special rules cannot be applied across
//          database links and therefore the DML cannot be allowed.
// *Action: Perform the DML in a helper function separate from the crossedition
//          trigger itself; the special rules are not applied when the DML
//          is not issued from within the crossedition trigger itself.
/
/       25100-25199 Reserved for Parser errors (e.g. v7)
/         25175-25199 reserved for index-organized tables ( v8 )
/       Additional parser errors begin at 30560
/
25100, 00000, "TABLESPACE option can only be used with ALTER INDEX REBUILD"
// *Cause: The TABLESPACE option to ALTER INDEX was used without the
//         REBUILD option.
// *Action: Use ALTER INDEX REBUILD TABLESPACE tablespace name.
25101, 00000, "duplicate REBUILD option specification"
// *Cause:  The REBUILD option to ALTER INDEX is specified more than once.
// *Action:  Specify the option at most once.
25102, 00000, "PARALLEL option can only be used with ALTER INDEX REBUILD"
// *Cause: The PARALLEL option to ALTER INDEX was used without the
//         REBUILD option.
// *Action: Use ALTER INDEX REBUILD.
25103, 00000, "NOPARALLEL option can only be used with ALTER INDEX REBUILD"
// *Cause: The NOPARALLEL option to ALTER INDEX was used without the
//         REBUILD option.
// *Action: Use ALTER INDEX REBUILD.
25104, 00000, "UNRECOVERABLE option can only be used with ALTER INDEX REBUILD"
// *Cause: The UNRECOVERABLE option to ALTER INDEX was used without the
//         REBUILD option.
// *Action: Use ALTER INDEX REBUILD.
25105, 00000, "RECOVERABLE option can only be used with ALTER INDEX REBUILD"
// *Cause: The RECOVERABLE option to ALTER INDEX was used without the
//         REBUILD option.
// *Action: Use ALTER INDEX REBUILD.
25106, 00000, "only one of PARALLEL or NOPARALLEL clause may be specified"
// *Cause: PARALLEL was specified more than once, NOPARALLEL was specified
//         more than once, or both PARALLEL and NOPARALLEL were specified
//         in an ALTER INDEX REBUILD statement.
// *Action: Remove all but one of the PARALLEL or NOPARALLEL clauses.
25107, 00000, "duplicate TABLESPACE option specification"
// *Cause: the TABLESPACE was specified more than once
//         in an ALTER INDEX REBUILD statement.
// *Action: Remove all but one of the TABLESPACE clauses.
25108, 00000, "standby lock name space exceeds size limit of %s characters"
// *Cause:  The lock name space for the standby database exceeded the maximum
//          string length.
// *Action: Change initialization parameter _STANDBY_LOCK_NAME_SPACE to
//          a character string of less than the specified characters.
25109, 00000, "standby lock name space has illegal character '%s'"
// *Cause:  An invalid lock name space was specified for the standby database.
//          The lock name space for the standby database can only contain
//          A-Z, 0-9, '_', '#', '$', '.' and '@' characters.
// *Action: Change initialization parameter _STANDBY_LOCK_NAME_SPACE to
//          a valid character string.
25110, 00000, "NOSORT may not be used with a bitmap index"
// *Cause:  An attempt was made to create a bitmap index using
//          the NOSORT option.
// *Action:  Remove NOSORT from the CREATE BITMAP INDEX statement.
25111, 00000, "creation of BITMAP cluster indices is not supported"
// *Cause:  An attempt was made to create a cluster index with the
//          BITMAP attribute.
// *Action:  Remove BITMAP from the CREATE INDEX statement.
25112, 00000, "maximum number of BITMAP index columns is 30"
// *Cause:  Too many columns were specified for the index.
// *Action: Create an index on fewer columns.
25113, 00000, "GLOBAL may not be used with a bitmap index"
// *Cause:  An attempt was made to create a bitmap index using
//          the GLOBAL option.
// *Action:  Remove GLOBAL from the CREATE BITMAP INDEX statement,
//           and/or add a LOCAL partition descriptor if the table is
//           partitioned.
25114, 00000, "invalid file number specified in the DUMP DATAFILE/TEMPFILE command"
// *Cause:  An invalid file number was used in dumping a datafile or tempfile.
// *Action: Specify a valid file number.
25115, 00000, "duplicate BLOCK option specification"
// *Cause:  BLOCK (MIN/MAX) was specified more than once in the DUMP DATAFILE/TEMPFILE
//          command.
// *Action: Specify only one BLOCK option.
25116, 00000, "invalid block number specified in the DUMP DATAFILE/TEMPFILE command"
// *Cause:  An invalid block number was used in dumping a datafile or tempfile.
// *Action: Specify a valid block number.
25117, 00000, "MIN/MAX/Block Number expected"
// *Cause:  A value other than MIN/MAX, or a block number was entered in the DUMP DATAFILE/TEMPFILE command.
// *Action: Correct the syntax.
25118, 00000, "invalid DUMP DATAFILE/TEMPFILE option"
// *Cause:  An invalid option was specified for the DUMP DATAFILE/TEMPFILE command.
// *Action: Correct the syntax.
25119, 00000, "LOGGING/NOLOGGING option already specified"
// *Cause: In CREATE TABLESPACE, the LOGGING and/or NOLOGGING options were
//         specified more than once.
// *Action: Remove all but one of the logging specifications.
25120, 00000, "MINIMUM EXTENT option already specified"
// *Cause: In CREATE TABLESPACE, the MINIMUM EXTENT option was
//         specified more than once.
// *Action: Remove all but one of the MINIMUM EXTENT specifications.
25121, 00000, "MINIMUM EXTENT value greater than maximum extent size"
// *Cause: In CREATE/ALTER TABLESPACE, the value specified for the MINIMUM EXTENT
//         option was greater than the maximum extent size.
// *Action: Choose a lower value for the MINIMUM EXTENT option.
25122, 00000, "Only LOCAL bitmap indexes are permitted on partitioned tables"
// *Cause: An attempt was made to create a global bitmap index on a partioned
//         table.
// *Action: create a local bitmap index instead.
25123, 00000, "Too many components specified in the name."
// *Cause: Specifying more components to a name than allowed.
// *Action: Check the name specified for the operation.
25124, 00000, "Database link name not allowed."
// *Cause: Specifying a database link name when it is not permitted.
// *Action: Check the name specified for the operation.
25125, 00000, "BUFFER_POOL/FLASH_CACHE/CELL_FLASH_CACHE storage option not allowed"
// *Cause:  An attempt was made to specify the BUFFER_POOL, FLASH_CACHE, or CELL_FLASH_CACHE
//          storage option. This option may only be specified during
//          - CREATE or ALTER TABLE
//          - CREATE or ALTER CLUSTER
//          - CREATE or ALTER INDEX
// *Action:  Remove this option and retry the statement.
25126, 00000, "Invalid name specified for BUFFER_POOL/FLASH_CACHE/CELL_FLASH_CACHE"
// *Cause:  The name of the cache hints specified by was invalid.
//          The only valid names for BUFFER_POOL are KEEP, RECYCLE and DEFAULT.
//          The only valid names for FLASH_CACHE and CELL_FLASH_CACHE
//          are KEEP, NONE and DEFAULT.
// *Action: Use a valid name or remove the BUFFER_POOL, FLASH_CACHE, or CELL_FLASH_CACHE clause.
25127, 00000, "RELY not allowed in NOT NULL constraint"
// *Cause: An attempt to set RELY on for NOT NULL constraint.
// *Action: only NORELY may be specified for a NOT NULL constraint.
//
25128, 00000, "No insert/update/delete on table with constraint (%s.%s) disabled and validated"
// *Cause: Try to insert/update/delete on table with DISABLE VALIDATE constraint.
// *Action: Change the constraint's states.
//
25129, 00000, "cannot modify constraint (%s) - no such constraint"
// *Cause: the named constraint does not exist for this table.
// *Action: Obvious
25130, 00000, "cannot modify primary key - primary key not defined for table"
// *Cause: Attempted to modify a primary key that is not defined for the
//      table.
// *Action: None
25131, 00000, "cannot modify unique(%s) - unique key not defined for table"
// *Cause: attempted to modify a unique key that is not deined for the table.
// *Action: None
25132, 00000, "UNIQUE constraint (%s.%s) disabled and validated in ALTER TABLE EXCHANGE PARTITION"
// *Cause: cannot ALTER TABLE EXCHANGE PARTITION when the partition and the
// table have a disabled and validated unique constraints AND the unique keys
// in the partion is not mutually exclusive from the rest of the table.
// *Action: Change the constraint's status.
25133, 00000, "duplicate SINGLE TABLE option specified"
// *Cause:  The SINGLE TABLE option was specified more than once.
// *Action: Specify the SINGLE TABLE option only once.
25134, 00000, "keyword TABLE expected"
// *Cause:  The keyword TABLE is missing from the SINGLE TABLE option.
// *Action: Place the keyword TABLE after the keyword SINGLE in the command.
25135, 00000, "cannot use the SINGLE TABLE option"
// *Cause:  The SINGLE TABLE option is only valid for hash clusters.
// *Action: Do not specify the SINGLE TABLE option.
25136, 00000, "this cluster can contain only one table"
// *Cause:  An attempt was made to store more than one table in a cluster
// that was created with the SINGLE TABLE option.
// *Action: Do not attempt to store more than one table in the cluster.
25137, 00000, "Data value out of range"
// *Cause:  Value from cast operand is larger than cast target size.
// *Action: Increase size of cast target.
25138, 00000, "%s initialization parameter has been made obsolete"
// *Cause:  An obsolete initialization parameter has been specified
// *Action: The system will come up, but parameters must be examined
25139, 00000, "invalid option for CREATE TEMPORARY TABLESPACE"
// *Cause: An invalid option appears.
// *Action:  Specify one of the valid options: TEMPFILE,
//           EXTENT MANAGEMENT LOCAL, UNIFORM
/
25140, 00000, "%s space policy cannot be specified for the %s extent management"
// *Cause: An invalid option appears.
// *Action:  Make sure that for LOCAL extent management UNIFORM or AUTOALLOCATE
//           is specified, and for DICTIONARY extent management UNIFORM or
//           AUTOALLOCATE are not specified
/
25141, 00000, "invalid EXTENT MANAGEMENT clause"
// *Cause: An invalid option appears for EXTENT MANAGEMENT clause
// *Action:  Specify one of the valid options: UNIFORM SIZE, AUTOALLOCATE
/
25142, 00000, "default storage clause specified twice"
// *Cause: default storage clause was specified twice for create tablespace
// *Action:  Specify it once.
/
25143, 00000, "default storage clause is not compatible with allocation policy"
// *Cause: default storage clause was specified for a tablespace with
//         AUTOALLOCATE or UNIFORM policy
// *Action:  Omit the storage clause
/
25144, 00000, "invalid option for CREATE TABLESPACE with TEMPORARY contents"
// *Cause: An invalid option appears.
// *Action:  Specify one of the valid options: EXTENT MANAGEMENT DICTIONARY,
//           USER
/
25145, 00000, "allocation policy already specified"
// *Cause: In CREATE TABLESPACE, the allocation policy was specified more
//         than once, for example, AUTOALLOCATE and UNIFORM.
// *Action: Remove all but one of the allocation policy  specifications.
/
25146, 00000, "EXTENT MANAGEMENT option already specified"
// *Cause: In CREATE TABLESPACE, the EXTENT MANAGEMENT option was
//         specified more than once.
// *Action: Remove all but one of the EXTENT MANAGEMENT  specifications.
/
25147, 00000, "UNIFORM SIZE value greater than maximum extent size"
// *Cause: In CREATE/ALTER TABLESPACE, the value specified for the UNIFORM SIZE         option was greater than the maximum extent size.
// *Action: Choose a lower value for the UNIFORM SIZE option.
/
25148, 00000, "ONLINE option not permitted"
// *Cause:  An attempt was made to specify ONLINE for ALTER TABLE MOVE
//          on a table that is not index-organized. The ONLINE option is
//          currently supported only for index-organized tables.
// *Action: Remove the ONLINE option from the command.
/
25149, 00000, "Columns of UROWID type may not be indexed"
// *Cause:  An attempt was made to create an index on a column of UROWID type
// *Action: Remove the column from the list of indexed columns
/
25150, 00000, "ALTERING of extent parameters not permitted"
// *Cause: An attempt was made to alter the extent parameters for a segment
//         in a tablespace with autoallocate or uniform extent allocation
//         policy.
// *Action: Remove the appropriate extent parameters from the command.
/
25151, 00000, "Rollback Segment cannot be created in this tablespace"
// *Cause: An attempt was made to create a rollback segment in a tablespace
//         with autoallocate extent allocation policy.
// *Action: Specify a different tablespace for the rollback segment
/
25152, 00000, "TEMPFILE cannot be dropped at this time"
// *Cause: An attempt was made to drop a TEMPFILE being used by online users
// *Action: The TEMPFILE has been taken offline. Try again, later.
/
25153, 00000, "Temporary Tablespace is Empty"
// *Cause: An attempt was made to use space in a temporary tablespace with
//         no files.
// *Action: Add files to the tablespace using ADD TEMPFILE command.
/
25154, 00000, "column part of USING clause cannot have qualifier"
// *Cause: Columns that are used for a named-join (either a NATURAL join
//         or a join with a USING clause) cannot have an explicit qualifier.
// *Action: Remove the qualifier.
/
25155, 00000, "column used in NATURAL join cannot have qualifier"
// *Cause: Columns that are used for a named-join (either a NATURAL join
//         or a join with a USING clause) cannot have an explicit qualifier.
// *Action: Remove the qualifier.
/
25156, 00000, "old style outer join (+) cannot be used with ANSI joins"
// *Cause: When a query block uses ANSI style joins, the old notation
//         for specifying outer joins (+) cannot be used.
// *Action: Use ANSI style for specifying outer joins also.
/
25157, 00000, "Specified block size %s is not valid"
// *Cause: An attempt was made to create a tablespace with a block
//         size which is not supported.
// *Action: Specify one of the valid blocksizes i.e the standard
//          blocksize or one of (2k, 4k, 8k, 16k, 32k) subject
//          to the maximum and minimum blocksizes supported by
//          the platform.
/
25158, 00000, "Cannot specify RELY for foreign key if the associated primary key is NORELY"
// *Cause: RELY is specified for the foreign key contraint, when the
//         associated primary key constraint is NORELY.
// *Action: Change the option of the primary key also to RELY.
/
25159, 00000, "Must specify a valid tablespace number"
// *Cause: A valid tablespace number was missing.
// *Action: Specify a valid tablespace number.
/
25160, 00000, "Must specify a valid relative data block address"
// *Cause: A valid relative data block address was missing.
// *Action: Specify a valid relative data block address.
/
25161, 00000, "Cannot have both DBA and RDBA options"
// *Cause: Both the DBA and RDBA options were passed to ALTER SYSTEM DUMP REDO.
// *Action: Use either the DBA option or the RDBA option but not both.
/
25162, 00000, "Must specify both RDBA MIN and RDBA MAX options"
// *Cause: Only one RDBA option was passed to ALTER SYSTEM DUMP REDO.
// *Action:  Specify both RDBA MIN and RDBA MAX.
/
25163, 00000, "Invalid tablespace number or relative data block address"
// *Cause: The relative data block adress is invalid for the given tablespace
//         number or the table space number is invalid.
// *Action: Specify a valid tablespace number or relative data block
//          address.
/
25164, 00000, "The tag expression is too complex."
// *Cause: The statement tag value was not specified using a simple
//         expression.
// *Action: Reduce the complexity of the statement tag expression. For
//          example, assign the tag expression to a variable and reference the
//          variable in the error logging clause.
/
25165, 00000, "number of passwords in statement exceeds maximum limit of %s"
// *Cause: The SQL statement had more passwords than the maximum limit allowed. 
// *Action: Reconstruct the SQL statement to have a number of passwords less 
//          than or equal to the maximum allowed.
25175, 00000, "no PRIMARY KEY constraint found"
// *Cause: A PRIMARY KEY constraint must be defined for a table
//         with this organization
// *Action: Define a PRIMARY KEY
25176, 00000, "storage specification not permitted for primary key"
// *Cause: Storage parameters cannot be defined for a PRIMARY KEY constraint
//         for a table with this organization
// *Action: Remove storage specification for primary key
25177, 00000, "UNRECOVERABLE option not permitted"
// *Cause: The UNRECOVERABLE option may not be specified for a primary
//         key for a table with this organization
// *Action: Remove UNRECOVERABLE option for primary key
25178, 00000, "duplicate PCTTHRESHOLD storage option specification"
// *Cause: The storage option PCTTHRESHOLD is specified more than once.
// *Action:  Specify storage options at most once.
25179, 00000, "invalid PCTTHRESHOLD storage option value"
// *Cause:  The specified value must be a positive integer.
// *Action:  Specify an appropriate value.
25180, 00000, "PCTTHRESHOLD only valid for certain table organizations"
// *Cause:  PCTTHRESHOLD can only be specified for tables with certain
//          organizations.
// *Action:  Remove the PCTTHRESHOLD option.
25181, 00000, "missing ON keyword for NESTED INDEX"
// *Cause:  ON keyword required to specify nested index column nest
// *Action:  Add ON keyword
25182, 00000, "feature not currently available for index-organized tables"
// *Cause:  An attempt was made to use one or more of the following feature(s) not
//          currently supported for index-organized tables:
//          CREATE TABLE with LOB/BFILE/VARRAY columns,
//          partitioning/PARALLEL/CREATE TABLE AS SELECT options,
//          ALTER TABLE with ADD/MODIFY column options, CREATE INDEX
// *Action:  Do not use the disallowed feature(s) in this release.
25183, 00000, "index-organized table top index segment is in a different tablespace"
// *Cause: An attempt was made to drop a tablespace which contains an index
//         only table's overflow segment but not the top index segment"
// *Action: find index-organized tables which span the tablespace being
//          dropped and some other tablespace(s). Drop these tables.
25184, 00000, "column name expected"
// *Cause:  A column name is not present where required by the
//          CREATE TABLE for specifying last column to be included in
//          the index segment of the index-organized table
// *Action:  Specify a column name where required by the syntax.
25185, 00000, "index column other than last can not be specified for INCLUDE clause"
// *Cause:  An index column name other than the last is specified as
//          including column
// *Action: Specify either a column name which is not part of index-organized
//          table primary key index , or the last key column of the primary
//          key for the INCLUDING clause.
25186, 00000, "INCLUDING clause specified for index-organized table without OVERFLOW"
// *Cause:  INCLUDING clause of a CREATE TABLE is an valid option only for
//          index-organized tables with OVERFLOW clause (at creation time)
//          or if an OVERFLOW segment already exists (at ALTER time).
// *Action:  Specify OVERFLOW clause for the index-organized table
//        :  For ALTER, perform ADD OVERFLOW first.
25187, 00000, "specified exceptions table form incorrect"
// *Cause:  The specified table does not have the proper field definitions.
// *Action: Specify the correct table to use.
25188, 00000, "cannot drop/disable/defer the primary key constraint for index-organized tables or sorted hash cluster"
// *Cause:
// *Action:
25189, 00000, "illegal ALTER TABLE option for an index-organized table"
// *Cause: While altering an index-organized table, an attempt was made
//        to enter either the PCTFREE or PCTUSED value for IOT top index segment.
// *Action: Remove the illegal option(s).
25190, 00000, "an index-organized table maintenance operation may not be combined with other operations"
// *Cause:  ALTER TABLE statement attempted to combine an index-organized table
//          maintenance operation (e.g. changing physical attributes) with
//          some other operation (e.g. ADD constraint) which is illegal
// *Action: Ensure that a index-organized table maintenance operation is the sole
//          operation specified in ALTER TABLE statement;
25191, 00000, "cannot reference overflow table of an index-organized table"
// *Cause:  An attempt to directly access the overflow table of an
//          index-organized table
// *Action: Issue the statement against the parent index-organized table
//          containing the specified overflow table.
25192, 00000, "invalid option for an index-organized table"
// *Cause:  An attempt to specify one or more of the following options for
//          an index-organized table:
//          [NO]CACHE, NO LOGGING, CLUSTER
// *Action: Remove the illegal option(s)
25193, 00000, "cannot use COMPRESS option for a single column key"
// *Cause:  An attempt to use COMPRESS option on single column key
// *Action: Remove the COMPRESS option.
25194, 00000, "invalid COMPRESS prefix length value"
// *Cause:  The specified value must be a positive integer less than the number
//          of key columns
// *Action:  Specify an appropriate value.
25195, 00000, "invalid option for index on an index-organized table"
// *Cause:  An attempt to specify one or more of the following options for
//          index on an IOT:
//          BITMAP, REVERSE, PCTUSED
25196, 00000, "keyword MOVE in ALTER TABLE MOVE must immediately follow <table name>"
// *Cause:  MOVE specified after one/more other ALTER options
// *Action: Change order of options, MOVE should be first
// *Action: Remove the illegal option(s)
25197, 00000, "an overflow segment already exists for the indexed-organized table"
// *Cause:  An attempt was made to ADD OVERFLOW segment on an index-organized
//          table that already has an overflow segment
// *Action:
25198, 00000, "partitioning method is not supported for index-organized table"
// *Cause:  An unsupported partitioning method was specified.
// *Action: Select a different partitioning scheme. Consult the documentation
//          for supported partitioning methods.
25199, 00000, "partitioning key of a index-organized table must be a subset of the primary key"
// *Cause:  An attempt to specify a partitioning key which is not a prefix
//          of the primary key of the index-organized table
// *Action: Select a different partitioning key
/
/       25200-25699 Reserved for OLTP
/       25200-25325 Reserved for AQ
/       25350-25375 Reserved for V8 Transaction OCI
/       25400-25425 Reserved for Application Failover
/       25426-25435 Reserved for Dblink Concentration
/       25436-25476 Reserved for Rules Engine
/
/     25200 - 25224 Reserved for DBMS_AQ.ENQUEUE
/
25200, 00000, "invalid value %s, QUEUE_NAME should be [SCHEMA.]NAME"
// *Cause: A NULL parameter was specified for QUEUE_NAME.
// *Action: Specify a non-NULL queue name.
//
25201, 00000, "invalid value, VISIBILITY should be ON_COMMIT or IMMEDIATE"
// *Cause: An invalid value specified for parameter VISIBILITY.
// *Action: Specify either ON_COMMIT or IMMEDIATE.
//
25202, 00000, "invalid value NULL, %s should be non-NULL"
// *Cause: A NULL value was specified for the parameter.
// *Action: Specify a non-NULL value.
//
25203, 00000, "invalid value %s, DELAY should be non-negative"
// *Cause: A negative value or NULL was specified for DELAY.
// *Action: Specify a non negative integer for DELAY.
//
25204, 00000, "invalid value, SEQUENCE_DEVIATION should be BEFORE or TOP"
// *Cause: An invalid SEQUENCE_DEVIATION was specified.
// *Action: Specify either the option 'BEFORE' or 'TOP'.
//
25205, 00000, "the QUEUE %s.%s does not exist"
// *Cause: The specified queue does not exist.
// *Action: Create the queue first before specifying it for enqueue or dequeue.
//
25206, 00000, "enqueue failed, enqueue to exception queue %s.%s not permitted"
// *Cause: An attempt was made to enqueue to an exception queue.
// *Action: Try enqueueing to another queue.
//
25207, 00000, "enqueue failed, queue %s.%s is disabled from enqueueing"
// *Cause: The queue has been stopped to prevent any further enqueueing.
// *Action: Enable the queue first by using an administrative operation.
//
25208, 00000, "RELATIVE_MSGID must be specified if SEQUENCE_DEVIATION is BEFORE"
// *Cause: A relative message identifier should be specified if sequence
//         deviation is specified as BEFORE.
// *Action: Either specify an existing relative message identifier or
//          don't specify sequence deviation as BEFORE.
//
25209, 00000, "invalid value %s, EXPIRATION should be non-negative or NEVER"
// *Cause: The expiration is less than zero or NULL.
// *Action: Specify a valid value for expire_after which should be greater
//          than or equal to zero or NEVER.
//
25210, 00000, "invalid value for RELATIVE_MSGID, no message in queue with that msgid"
// *Cause: No message inm the queue with the msgid equal to the specified
//         RELATIVE_MSGID.
// *Action: Try again with a valid RELATIVE_MSGID.
//
25211, 00000, "invalid DELAY specified when using sequence deviation"
// *Cause:  The DELAY specified in the enqueue is greater than the delay
//          of the message with the given relative message id.
// *Action: Set the DELAY to be less than or equal to the delay of the
//          message with the given relative message id. If the TOP option
//          is used the delay must be less than or equal to the delay of
//          all the messages in the queue.
//
25212, 00000, "invalid PRIORITY specified when using sequence deviation"
// *Cause:  The PRIORITY specified in the enqueue is less than the priority
//          of the message with the given relative message id.
// *Action: Set the PRIORITY to be less than the delay of the message with
//          the given relative message id. If the TOP option is used the
//          prioirty must be greater than or equal to the priority of
//          all the messages in the queue.
25213, 00000, "message with specified RELATIVE_MSGID has been dequeued"
// *Cause: The message specified by the RELATIVE_MSGID field in the
//         sequence deviation BEFORE option has been dequeued.
// *Action:
25214, 00000, "cannot specify delay or expiration for enqueue to exception queue"
// *Cause: A message was enqueued to the exception queue with either delay
//         or expiration specified.
// *Action: Enqueue a message without delay or expiration.
25215, 00000, "user_data type and queue type do not match"
// *Cause: A user tries to enqueue an object to a queue that was
//         created for objects of different type.
// *Action: Try enqueue again with an object of the right type.
25216, 00000, "invalid recipient, either NAME or ADDRESS must be specified"
// *Cause: Both attributes, NAME and ADDRESS, were specified null for one of
//         the recipients in the recipient list.
// *Action: Specify a non-null NAME or ADDRESS for the recipient.
25217, 00000, "enqueue failed, visibility must be IMMEDIATE for queue %s.%s"
// *Cause: An attempt was made to enqueue to a non-persistent queue without
//         setting visibility to IMMEDIATE.
// *Action: Set visibility to IMMEDIATE.
25218, 00000, "enqueue failed, delay must be zero for queue %s.%s"
// *Cause: An attempt was made to enqueue to a non-persistent queue with
//         delay greater than zero seconds.
// *Action: Set delay to zero.
25219, 00000, "enqueue failed, sequence deviation not allowed for queue %s.%s"
// *Cause: An attempt was made to enqueue to a non-persistent queue with
//         sequence deviation specified.
// *Action: Do not specify sequence deviation.
25220, 00000, "enqueue failed, signature not specified for a non-repudiable queue"
// *Cause: An attempt was made to enqueue to a non-repudiable queue without
//         specifying the signature
// *Action: Give the signature
25221, 00000, "enqueue failed, signature specified queue not supporting non-repudiation"
// *Cause: An attempt was made to enqueue to a queue specifying the signature
//         for a queue not supporting non-repudiation
// *Action: Remove the signature
25222, 00000, "enqueue failed, complete sender info. not provided for a queue supporting non-repudiation"
// *Cause: An attempt was made to enqueue to a queue without giving the
//         complete sender information (name) for a queue supporting
//         non-repudiation
// *Action: Provide the sender information
//
25223, 00000, "user_data type used is not supported"
// *Cause: An attempt was made to enqueue data into a non persistent queue
//         that is of a type other than the supported raw or object type.
// *Action: Enqueue the message again with data of raw or object type.
//
25224, 00000, "sender name must be specified for enqueue into secure queues"
// *Cause: An attempt was made to enqueue into a secure queue without
//         specifying a sender name.
// *Action: Enqueue the message with sender name specified.
//
/
/    25225-25249 Reserved for DBMS_AQ.DEQUEUE
/
25225, 00000, "invalid value %s, DEQUEUE_MODE should be REMOVE or BROWSE or LOCKED"
// *Cause: An invalid parameter has been specified for DEQUEUE_MODE.
//
// *Action: Specify either REMOVE, BROWSE or LOCKED.
//
25226, 00000, "dequeue failed, queue %s.%s is not enabled for dequeue"
// *Cause: The queue has not been enabled for dequeue.
//
// *Action: Enable the queue using START_QUEUE.
//
25227, 00000, "Propagation job %s doesn't exist"
// *Cause: The job doesn't exist in AQ$_SCHEDULES or cache.
//
// *Action: 
//
25228, 00000, "timeout or end-of-fetch during message dequeue from %s.%s"
// *Cause: User-specified dequeue wait time has passed or the end of the
//         queue has been reached but no message has been retrieved.
// *Action: Try dequeue again with the appropriate WAIT_TIME or the
//          FIRST_MESSAGE option.
//
25229, 00000, "error on transformation of message %s %s"
// *Cause: There was an error when transforming a message at enqueue,
//         dequeue or propagation time.
// *Action: Correct the transformation function.
//
25230, 00000, "invalid value %s, WAIT should be non-negative"
// *Cause: A negative value has been specified for WAIT.
// *Action: specify a non negative value or FOREVER.
//
25231, 00000, "cannot dequeue because CONSUMER_NAME not specified"
// *Cause: A user tried to dequeue from a queue that has been created for
//         multiple consumers but a CONSUMER_NAME was not been specified in
//         the dequeue options.
// *Action: Specify the CONSUMER_NAME in the dequeue options.
//
25232, 00000, "duplicate recipients specified for message"
// *Cause: An enqueue was performed with duplicate queue agents in the
//         recipients parameter.
// *Action: Remove the duplicate queue agent and retry the call.
//
25233, 00000, "invalid parameter specified for NAVIGATION"
// *Cause: An invalid parameter has been specified for NAVIGATION.
// *Action: Choose one of FIRST_MESSAGE, NEXT_MESSAGE or NEXT_TRANSACTION.
//          Use FIRST_MESSAGE for dequeuing the first message that satisifies
//          the criterion, NEXT_MESSAGE for dequeuing the next message
//          that satisifies the criterion and NEXT_TRANSACTION for moving to a
//          set of messages enqueued by another transaction.
//
25234, 00000, "NEXT_TRANSACTION navigation option invalid for queue table %s.%s"
// *Cause: The NEXT_TRANSACTION navigation option was used in a dequeue from
//         a queue in a queue table that was not created for transactional
//         grouping.
// *Action: Specify either FIRST_MESSAGE or NEXT_MESSAGE as the navigation
//          option. If you want to dequeue messages using transactional grouping
//          create the queue in a queue table that has transactional grouping
//          enabled.
//
25235, 00000, "fetched all messages in current transaction from %s.%s"
// *Cause: The NEXT_TRANSACTION navigation option was used in a dequeue when
//         there were no more messages that belong to the same transaction.
// *Action: Use the NEXT_TRANSACTION navigation option to move to the next
//          also use the FIRST_MESSAGE option to start from the head of the
//          queue again.
//
25236, 00000, "buffer too small for user data"
// *Cause: The variable or buffer used for the out parameter payload is
//         too small for the user data dequeued.
// *Action: Increase the size of the buffer or the size of the variable.
//          Maximum size allowed is 32K.
//
25237, 00000, "navigation option used out of sequence"
// *Cause: The NEXT_MESSAGE or NEXT_TRANSACTION option was specified after
//         dequeuing all the messages.
// *Action: Reset the dequeuing position using the FIRST_MESSAGE naviagtion
//          option and then specify the NEXT_MESSAGE or NEXT_TRANSACTION
//          option.
//
25238, 00000, "too many recipients specified for message destination %s"
// *Cause: An ENQUEUE was performed with more than 32 recipients for
//         the given destination (address).
// *Action: Reduce the number of recipients to 32 or less, and retry the call.
//
25239, 00000, "message ID not supplied when dequeuing from exception queue %s.%s"
// *Cause: An attempt was made to dequeue from a release 8.0-compatible
//         exception queue without including a message ID in the dequeue
//         options.
// *Action: Check the application to ensure that the queue name has been
//          specified correctly. If the queue name is correct supply a message
//          ID when dequeuing from a release 8.0-compatible exception queue.
//          Otherwise, upgrade the queue_table containing the queue to
//          release 8.1-compatible using the DBMS_AQADM.MIGRATE_QUEUE_TABLE
//          procedure.
//
25240, 00000, "message ID and dequeue condition/correlation ID specified in dequeue options"
// *Cause: An attempt was made to dequeue by including both a message ID and
//         a dequeue condition/correlation ID in the dequeue options.
//         In the dequeue options, you are permitted to specify either
//         message ID or dequeue condition/correlation ID, or neither.
// *Action: To dequeue a message, specify a message ID or a dequeue
//          condition/correlation ID in the dequeue options, but do not
//          specify both. If you want to dequeue in the queue's sort order,
//          then do not specify either the message ID or dequeue
//          condition/correlation ID in the dequeue options.
25241, 00000, "cannot change correlation ID from %s to %s without FIRST_MESSAGE option"
// *Cause: An attempt was made to change the correlation ID while using the
//         NEXT_MESSAGE or NEXT_TRANSACTION option for dequeuing.
// *Action: To use a correlation ID that is different from the previous
//          dequeue call, reset the dequeuing position by using the
//          FIRST_MESSAGE navigation option.
//
25242, 00000, "cannot change subscriber name from %s to %s without FIRST_MESSAGE option"
// *Cause: An attempt was made to change the subscriber name while using the
//         NEXT_MESSAGE or NEXT_TRANSACTION option for dequeuing.
// *Action: To use a subscriber name that is different from the previous
//          dequeue call, reset the dequeuing position by using the
//          FIRST_MESSAGE navigation option.
//
25243, 00000, "CONSUMER_NAME cannot be specified when dequeuing from exception queue %s.%s"
// *Cause: An attempt was made to dequeue from an exception queue by specifying
//         the CONSUMER_NAME in the dequeue options. CONSUMER_NAME can only
//         be specified when dequeuing from a normal queue created for multiple
//         consumers.
// *Action: Specify only the message id in the dequeue options to dequeue a
//          message from an exception queue.
//
25244, 00000, "dequeue index key not found, QUEUE %s, rowid %s"
// *Cause: An internal error was encountered. There may be an inconsistency in
//         the queue table index.
// *Action: Contact your Oracle customer support representative. You may need
//          to provide the trace file and information about reproducing the
//          error.
//
//
25245, 00000, "agent name cannot be specified if address is a single-consumer queue or an exception queue"
// *Cause: The agent name for the agent in the LISTEN call was specified
//         when the agent address was a single-consumer queue or an exception
//         queue.
// *Action: Do not specify the agent name.
25246, 00000, "listen failed, the address %s is an 8.0 style  exception queue"
// *Cause:  An 8.0 style exception queue was specified in the agent-list for
//          the LISTEN call.
// *Action: Specify a normal 8.0 style queue or an 8.1 style queue in the
//          agent-list.
//
25247, 00000, "%s is not a recipient of specified message"
// *Cause: The consumer name specified in the dequeue options is not a
//         recipient of the message specified by the message id.
// *Action: Ensure that the agent specified by the consumer name is a
//          recipient of the message specified by the message id.
//
25248, 00000, "duplicate agent specified in the agent list"
// *Cause: An agent was specified more than once in the agent list of the
//         LISTEN call.
// *Action: Remove the duplicate agent specification(s), and retry the call.
25249, 00000, "dequeue failed, dequeue not allowed for queue %s.%s"
// *Cause: An attempt was made to dequeue from a non-persistent queue.
// *Action: Dequeue from a different queue.
25250, 00000, "Cannot specify a remote recipient for the message"
// *Cause: A recipient for the message enqueued to a non-persistent queue
//         had a non-local address.
// *Action: Do not specify the address field or specify the queue which
//          is the target of the enqueue
25251, 00000, "exceeded maximum number of recipients for message"
// *Cause: An attempt was made to issue an ENQUEUE call that exceeded the
//         the maximum number (1024) of recipients per message.
// *Action: Reduce the number of recipients to 1024 or less, and retry
//          the call.
25252, 00000, "listen failed, the address %s is a non-persistent queue"
// *Cause:  A non-persistent queue was specified as an address for an agent in
//          the LISTEN call.
// *Action: Specify a normal queue as address for the agent, and retry the
//          the LISTEN call.
25253, 00000, "listen failed, queue %s.%s is not enabled for dequeue"
// *Cause:  An attempt was made to specify a queue that is not enabled for
//          dequeue in a LISTEN call.
// *Action: Enable the queue for dequeue using START_QUEUE, and retry
//          the LISTEN call.
25254, 00000, "time-out in LISTEN while waiting for a message"
// *Cause: The specified wait time has elapsed and there were no messages for
//         any of the agents in the agent-list.
// *Action: Try the LISTEN call with an appropriate time-out.
25255, 00000, "incorrect subscription string %s"
// *Cause:  An incorrect subscription string was specified with OCIRegister.
// *Action: Specify a subscription string using the [CONSUMER:]SCHEMA.QUEUE
//          form.
25256, 00000, "consumer cannot be specified with a single-consumer queue or an exception queue "
// *Cause:  An attempt was made to specify a consumer in the subscription
//          string when registering for notification on a single-consumer
//          queue or an exception queue.
// *Action: Do not specify the consumer in the subscription string.
25257, 00000, "consumer must be specified with a multi-consumer queue"
// *Cause:  An attempt was made to register on a multi-consumer queue without
//          specifying a consumer in the subscription string.
// *Action: Specify a consumer in the subscription string.
25258, 00000, "cannot register for notifications on an 8.0 style exception queue"
// *Cause:  An attempt was made to specify an 8.0 style exception queue in the
//          subscription string of OCIRegister.
// *Action: Specify a normal queue or a non-persistent queue.
25259, 00000, "cannot specify protocol for agent"
// *Cause:  The user specified the protocol attribute for an agent in the
//          agent list.
// *Action: Do not specify the protocol attribute of the agent object type.
/
25260, 00000, "AQ latch cleanup testing event"
// *Cause: N/A.
// *Action: event used for AQ statistics latch cleanup testing.
25261, 00000, "JOB_QUEUE_PROCESSES must be at least 2 for AQ propagation"
// *Cause:  AQ Propagator encountered a setting for JOB_QUEUE_PROCESSES that
//          is insufficient for AQ propagation.
// *Action: Set the number of JOB_QUEUE_PROCESSES to at least 2 for AQ
//          propagation.
25262, 00000, "agent name cannot be NULL if address is a multi-consumer queue"
// *Cause: The name for the agent in the LISTEN call was not specified
//         when the agent address was a multi-consumer queue.
// *Action: Specify a non-NULL name for the agent.
/
25263, 00000, "no message in queue %s.%s with message ID %s"
// *Cause:  An attempt was made to dequeue a message with a specific
//          message ID, but no such message exists in the queue.
// *Action: Try dequeue again with a valid message ID.
25264, 00000, "cant get signature for this queue"
// *Cause:  An attempt was made to dequeue the signature from this queue, which
//          is not reciever non-repidiable.
// *Action: Try dequeue again without the get signature option
25265, 00000, "specified signature for a queue which does not support reciever non-repudiation"
// *Cause:  An attempt was made to dequeue the message from a queue which
//          does not support reciever non-repudiation, but the signature was
//          specified for verification
// *Action: Try dequeue again without the signature
25266, 00000, "didnt try to dequeue by message id. with the signature"
// *Cause:  The signature was specified for a queue, but the dequeue was not
//          done by message id.
// *Action: Try dequeue again by message id.
25267, 00000, "didnt specify the signature for a reciever non-repudiable queue"
// *Cause:  The signature was not specified for a reciever non-repudiable queue
// *Action: Try dequeue again along with the signature
25268, 00000, "didnt dequeue in browse mode with get signature option"
// *Cause:  The dequeue was not performed in browse mode with get signature option
// *Action: Try dequeue again in browse mode
25269, 00000, "cant specify sognature with get signature option"
// *Cause:  The signature is not required for the dequeue with get signature
//          option
// *Action: Try dequeue again without the signature in dequeue options
25270, 00000, "sender info does not match with the actual sender of the message"
// *Cause:  The sender info. and the message id. do not match
// *Action: Provide the right sender info.
// *Action: Try dequeue again without the signature in dequeue options
25271, 00000, "queue table not found for the given queue"
// *Cause:  The queue table does not exist for the given queue
// *Action: Provide the right queue name
25272, 00000, "Signature does not exist for the given reciever and message id."
// *Cause:  Signature does not exist for the given reciever and message id.
// *Action: Check the message id. and the reciever's information
25273, 00000, "AQ QMN process alternate cleanup event"
// *Cause: N/A.
// *Action: event used for AQ QMN alternate cleanup mode.
25274, 00000, "AQ Buffered Queue event"
// *Cause: N/A.
// *Action: event used for AQ Buffered Queue mode.
25275, 00000, "Test support for buffered queues"
// *Cause: internal use only
// *Action: none.

/
/    25276-25320 Reserved for AQ administration callouts
/
25276, 00000, "table specified is not a queue table"
// *Cause: An invalid queue table name is specified.
// *Action: Check the dictionary views to see if the table is a queue table.
//
25277, 00000, "cannot grant or revoke object privilege on release 8.0 compatible queues"
// *Cause:  An attempt was made to grant or revoke object privilege on
//          release 8.0 style queues.
// *Action: Convert the release 8.0 compatible queue table to release 8.1
//          compatible using DBMS_AQADM.MIGRATE_QUEUE_TABLE before granting
//          or revoking object privilege.
//
25278, 00000, "grantee name cannot be NULL"
// *Cause:  An attempt was made to specify NULL for the grantee parameter.
// *Action: Specify a valid grantee parameter.
//
25279, 00000, "dequeue as select not supported before 8.2"
// *Cause:  Dequeue as select not supported before 8.2.
// *Action: Dont use select condition while dequeuing
25280, 00000, "complete sender information not provided to non-repudiate sender"
// *Cause:  complete sender information not provided to non-repudiate sender
// *Action: Provide the complete sender information
25281, 00000, "complete reciever information not provided to non-repudiate reciever"
// *Cause:  complete reciever information not provided to non-repudiate reciever
// *Action: Provide the complete reciever information
25282, 00000, "message id. not provided for non-repudiation"
// *Cause:  message id. was not provided
// *Action: Provide the message id.
25283, 00000, "either agent's name or address needed for non-repudiation"
// *Cause:  neither agent's name nor address provided for non-repudiation"
// *Action: Provide the agent info.
25284, 00000, "Invalid value %s for %s"
// *Cause: An Invalid value or NULL was specified for the parameter.
// *Action: Check the documentation for valid values.
25285, 00000, "Invalid value %s for array_mode"
// *Cause: An Invalid value or NULL was specified for the array_mode.
// *Action: Check the documentation for valid values.
25286, 00000, "Invalid number of elements in the message properties array"
// *Cause: Number of elements in the message properties array do not match the
// number of elements in the payload array.
// *Action: Create a message property array with one element (that
// applies for all the elements in the payload array) or
// create a message property array with the same number of elements as
// there are in the payload array.
25287, 00000, "Invalid value %s, %s should be non-negative"
// *Cause: An Invalid value or NULL was specified for the parameter.
// *Action: Specify a non negative integer.
25288, 00000, "AQ  HTTP propagation encountered error, status-code %d, %s"
// *Cause:  AQ propagation's HTTP request to the propagation servlet at the
//          specified address encountered an error
// *Action: Specify a valid address in the connect string of the propagation
//            destination dblink, the dblink user has the correct permissions,
//            check if the AQ propagation servlet was properly installed.
25289, 00000, "Buffer Already Exists"
// *Cause: Buffer already exists for the specified queue.
// *Action: None
25290, 00000, "Cannot complete operation on queue %s with existing messages"
// *Cause: Queue already has messages. Cannot complete operation
// *Action: Truncate the queue before adding/dropping a buffer
25291, 00000, "Buffer does not exist for the specified queue"
// *Cause: Buffer does not exist for the specified queue
// *Action: Operation on the buffer cannot be performed. create the buffer
25292, 00000, "Buffer operations are not supported on the queue"
// *Cause: Buffer operations are not supported on the specified queue type
// *Action: Buffered operations are only supported on  to 8.1 style 
//          queues, which do not have transaction grouping.
25293, 00000, "Lob attributes must be null for buffered operations"
// *Cause: Enqueue of a buffered  message with a non-null lob attribute was attempted
// *Action: Set the lob attributes to null before enqueuing the buffered message
25294, 00000, "Cannot propagate user buffered messages to a database with version lower than 10.2"
// *Cause: Propagation of user buffered messages was attempted to a database with version lower than 10.2.
// *Action: Do not propagate buffered messages to the database.
25295, 00000, "Subscriber is not allowed to dequeue buffered messages"
// *Cause: Subscriber is only allowed to dequeue persistent messages
// *Action: Drop the subscriber and re-create it, or dequeue only persistent messages for the subscriber
25296, 00000, "Queue Table %s has a buffered queue %s"
// *Cause: Cannot downgrade the queue table because it has a buffered queue
// *Action: Drop the buffer or the buffered queue
//25297, 00000, "Enqueue of buffered message failed, attempted to enqueue buffered message with %s"
// *Cause: Buffered message was enqueued by specifying delay or sequence deviation.
// *Action: Do not specify delay of sequence deviation when enqueuing buffered messages.
25298, 00000, "Only immediate visibility mode supported for buffered message enqueue or dequeue"
// *Cause: A visibility of dbms_aq.ON_COMMIT was supplied with the buffered message enqueue or dequeue
// *Action: Supply a visibility of dbms_aq.IMMEDIATE
25299, 00000, "Invalid message delivery_mode "
// *Cause: Invalid value was specified for delivery mode
// *Action: Specify  dbms_aq.BUFFERED or dbms_aq.PERSISTENT during Enqueue or dbms_aq.BUFFERED, dbms_aq.PERSISTENT or dbms_aq.PERSISTENT_OR_BUFFERED during Dequeue and Listen.
25300, 00000, "Cannot drop buffer for queue with buffered subscribers"
// *Cause: Cannot drop buffer for queue with buffered subscribers
// *Action: Either drop buffered subscribers or forcibly drop the buffer
25301, 00000, "Cannot enqueue or dequeue user buffered messages to a database with version lower than 10.2"
// *Cause: Enqueue or dequeue of user buffered messages was attempted to queues in a database with version lower than 10.2.
// *Action: Do not attempt to enqueue or dequeue user buffered messages.
25302, 00000, "Operation not possible for non-buffered queue %s"
// *Cause: Last enqd/ackd message is only supported for buffered queues
// *Action: The operation is not supported.
25303, 00000, "Buffered operation allowed only on the owner instance"
// *Cause: Operation was not performed on the owner instance.
// *Action: Perform operation on the owner instance.
25304, 00000, "Cannot use priority order queues for capture LCRs"
// *Cause: Capture LCRs can only use commit time or enqueue time ordered queues.
// *Action: Use the appropriate type of queue for captured LCRs.
25305, 00000, "enqueue failed, expiration must be zero for queue %s.%s"
// *Cause: An attempt was made to enqueue to a buffered
//         queue with expiration greater than zero seconds.
// *Action: Set expiration to zero.
/
25306, 00000, "Cannot connect to buffered queue's owner instance"
// *Cause: cannot connect to the owner instance of the buffered queue
// *Action: set listener information in REMOTE_LISTENERS or LOCAL_LISTENERS initialization parameter.
/
25307, 00000, "Enqueue rate too high, flow control enabled"
// *Cause: Subscribers could not keep pace with the enqueue rate.
// *Action: Try enqueue after waiting for some time.
25308, 00000, "AQ canonicalization event"
// *Document: NO
// *Cause:
// *Action:
/
25309, 00000, "Unable to lock deq IOT, skip retry count increment"
//*Document: NO
// *Cause:
// *Action:
/
25310, 00000, "Subscriber is Notification only; dequeue not supported"
// *Cause: Notification only subscribers are not allowed to dequeue.
// *Action: Recreate subscriber if necessary.
/
25311, 00000, "%s not supported for non-persistent queue"
// *Cause:  Specified QOS is not supported for non-persistent queues.
// *Action: Specify the right QOS.
/
25312, 00000, "Cannot specify nonzero sender protocol"
//*Document: Yes
// *Cause: Sender protocol was specified during an enqueue operation.
// *Action: Specify the enqueue sender protocol as null or zero.
/
25313, 00000, "a queue may not subscribe to itself for propagation"
// *Cause: The specified subscriber had a NULL name and an address equal to
//         the queue name.
// *Action: Provide a valid subscriber and retry the operation.
/
25314, 00000, "a commit-time queue table cannot be migrated to 8.0"
// *Cause: An attempt was made to migrate a commit-time queue table to an
//         unsupported compatibility level.
// *Action: Provide an appropriate compatibility level, and retry the
//          operation.
/
25315, 00000, "unsupported configuration for propagation of buffered messages"
// *Cause: An attempt was made to propagate buffered messages with the 
//         database link pointing to an instance in the destination database 
//         which is not the owner instance of the destination queue.
// *Action: Use queue to queue propagation for buffered messages.
/
25316, 00000, "Late in the current transaction to begin an Enqueue/Dequeue operation"
// *Cause:  Check if the Enqueue/Dequeue operation is performed via triggers
//          on Materialized Views which isn't supported.
// *Action: Triggers on materialized views aren't supported. Workarounds are 
//          on-demand materialized views or execution of trigger code 
//          within an autonomous txn.
/
25317, 00000, "Propagation stopped because of instance shutdown"
// *Cause:  A propagation job has stopped because the instance is
//          shutting down.
// *Action: No user action is required.
/
25318, 00000, "Propagation stopped because of instance affinity change"
// *Cause:  A propagation job has stopped because its instance affinity
//          has changed.
// *Action: No user action is required.  The job will restart on the
//          appropriate instance.
/
25319, 00000, "Queue table repartitioning aborted"
// *Cause:  During instance restart in an Oracle RAC environment, queue table 
//          repartitioning aborted due to errors.
// *Action: Look at the incident generated for this error and report the 
//          problem to Oracle Support Services.
/
25320, 00000, "Failed to create, alter, or remove Subscriber"
// *Cause:  There is a pending enqueue or dequeue operation on
//          this queue from the same session.
// *Action: Either COMMIT or ROLLBACK pending enqueue or dequeue operation
//          before attempting to create, alter, or remove the subscriber.
/
/    25321-25325 Reserved for enq/deq user properties
/
25321, 00000, "enqueue failed, user property specified but queue %s.%s is not an 8.1 style queue"
// *Cause:  user properties can only be specified when enqueueing into 8.1 
//          style queues.
// *Action: Specify an 8.1 style queue or pass user property as NULL.
/
25322, 00000, "message priority is out of range"
// *Cause: The message priority range of 0 to 9 was exceeded.
// *Action: Set the message priority in the range of 0 to 9.
/
/       25326-25350 Reserved for AQ Array/Miscellaneous Errors
/
25326, 00000, "Array %s operation failed for message at index %s"
// *Cause: Array operation fails for the message at specified index. Look
//         at the remainder of the error stack to see what the problem was.
// *Action: Fix cause of error and retry array operation.
25327, 00000, "Array size is invalid"
// *Cause: Array size must be a positive, non-zero integer. 
// *Action: Use corrected array size and retry array operation.
25328, 00000, "%s argument size %s is smaller than array size"
// *Cause: The size of the argument is smaller than the given array size. 
// *Action: Lower array size or use a larger sized input argument.
25329, 00000, "AQ array operations not allowed on 8.0 queues"
// *Cause: An array enqueue/dequeue was attempted on an 8.0 queue. 
// *Action: Use single enqueue/dequeue with this queue. 
25330, 00000, "PL/SQL associative arrays may not be used with AQ array operations"
// *Cause: A PL/SQL associative array was provided for the payload parameter
//         in an enqueue/dequeue array operation.
// *Action: Use VARRAY or NESTED TABLE types with AQ array operations. 
25331, 00000, "cannot downgrade because there are commit-time queue tables"
// *Cause: An attempt was made to downgrade a database that has commit-time
//         queue tables.
// *Action: Drop all commit-time queue tables before attempting the downgrade.
25332, 00000, "Invalid release value %s for queue table compatible parameter"
// *Cause: The release level given for the queue table compatible parameter
//         is invalid
// *Action: Specify a valid release value for the queue table compatible
//          parameter
25333, 00000, "Buffered Queue to Queue propagation did not connect to the correct instance"
// *Cause: Queue to Queue propagation for buffered messages didn't 
//         connect to the correct instance, most likely because service was
//         not started for the destination queue.
// *Action: No user action is required. Propagation will start the service for 
//          the destination queue and retry.
25334, 00000, "Buffered propagation must restart as the destination queue was recreated/moved"
// *Cause: Buffered propagation destination queue was recreated or its 
//         ownership was moved to another instance during propagation.
// *Action: No user action is required. Propagation will reinitialize its 
//          metadata and retry.
25335, 00000, "AQ array operations not allowed for buffered messages"
// *Cause: An array enqueue/dequeue was attempted for buffered messages
// *Action: Use single enqueue/dequeue for buffered messages or an array 
//          size of one.
25336, 00000, "Cannot contact instance %s during Streams AQ operation"
// *Cause: The specified instance was not responding to AQ requests.
// *Action: Set parameter aq_tm_processes to a non-zero value. If the problem
//          persists, contact Oracle Support Services.
25337, 00000, "Cannot propagate in queue-to-queue mode to a database with version lower than 10.2"
// *Cause: Remote subscriber with queue_to_queue mode set to TRUE was added.
//         The remote subscriber is on a database version lower than 10.2.
//         Propagation was scheduled to a destination database with version
//         lower than 10.2.
// *Action: Remove the remote subscriber with queue_to_queue mode and add the
//          subscriber back with queue_to_queue set to FALSE. Unschedule the
//          queue-to-queue propagation and schedule propagation in 
//          queue-to-dblink mode.
25338, 00000, "operation '%s' is not allowed for sync_capture '%s'"
// *Cause: An attempt was made to execute the specified operation for a 
//         sync_capture process.
// *Action: Remove the offending call.
25339, 00000, "STREAMS '%s' must be sync_capture"
// *Cause: The specified capture STREAMS did not exist or was not a
//         sync_capture process.
// *Action: Remove the offending call.
25340, 00000, "must use commit-time queue for sync_capture"
// *Cause: An attempt was made to create a sync_capture without using
//         a commit-time queue.
// *Action: Rerun statement with a commit-time queue.
25341, 00000, "sync_capture does not support \"%s\".\"%s\" because of the following reason:"
// *Cause: sync_capture encountered a table with an unsupported
//         property.  The most common reason is an unsupported column
//         data type.  
// *Action:  Revise the Capture rules to skip over the table in
//           question. One option is to remove the rule that captures changes
//           from the unsupported table.  Check DBA_STREAMS_TABLE_RULES to 
//           determine the rule on the table specified in the error. 
//           
//           Also query the DBA_STREAMS_UNSUPPORTED view to determine
//           which tables are not supported by STREAMS and for what
//           reason. 
//        
//           For potential workarounds to certain unsupported properties, see
//           Metalink.
25342, 00000, "cannot downgrade because there are apply processes for user buffered messages"
// *Cause: An attempt was made to downgrade a database that has apply process
//         for user-buffered messages.
// *Action: Drop all the apply processes for user-buffered messages before 
//          attempting the downgrade.
25343, 00000, "Streams error queue cannot be exported"
// *Cause: An attempt was made to export a database that has apply errors.
// *Action: Delete or reexecute errors before attempting the export.
25344, 00000, "statement has bind variables"
// *Cause: Current API could not handle a statement with bind variables.
// *Action: Use alternative API which handles bind variables.
25345, 00000, "requested AQ minimum Oracle Streams Pool size %s greater than Oracle Streams Pool size %s"
// *Cause: The minimum value requested for the Oracle Streams Advanced 
//         Queuing (AQ) pool size was greater than the Oracle Streams pool 
//         size. 
// *Action: Set the minimum value for the Oracle Streams AQ pool size to 
//          less than or equal to the Oracle Streams pool size. 
25346, 00000, "requested AQ maximum Oracle Streams Pool size %s less than AQ minimum Oracle Streams Pool size %s"
// *Cause: The maximum value requested for the Oracle Streams Advanced 
//         Queuing (AQ) pool size was less than the minimum value of the 
//         Oracle Streams (AQ) pool size.
// *Action: Set the maximum value for the Oracle Streams AQ pool size to 
//          greater than or equal to the minimum value of the Oracle 
//          Streams AQ pool size. 
25347, 00000, "Dequeue operation on sharded queue is not possible."
// *Cause: Dequeue of a buffered subscriber or JMS sharded queue failed
//         with OCIAQDeq().
// *Action: Use OCIAQDeq2() for buffered subscribers and JMS sharded queues.
25348, 00000, "cannot connect to shard owner instance %s of database %s"
// *Cause:  An Oracle Advanced Queuing (AQ) operation was attempted at a non-owner
//          instance of the shard which could not establish an internal connection to it.
// *Action: Set the listener information in the REMOTE_LISTENERS or LOCAL_LISTENERS
//          initialization parameter. If the REMOTE_LISTENERS or LOCAL_LISTENERS
//          initialization parameter is already set, then retry the operation from the
//          suggested owner instance.
/
/       25350-25375 Reserved for V8 Transaction OCI
/
25350, 00000, "maximum number of concurrent transaction branches exceeded"
// *Cause: the limit on the number of concurrent transaction branches has
//         been reached
// *Action: Increase the INIT.ORA parameter 'transactions' and restart the
//          system.
25351, 00000, "transaction is currently in use"
// *Cause:  The transaction is currently used by a different session.
// *Action: Do not switch to a transaction attached to some other session.
25352, 00000, "no current transaction"
// *Cause:  The user session is not attached to any transaction.
// *Action: Do not attempt to detach when there is no current transaction.
25353, 00000, "branch marked for deletion"
// *Cause:  The branch specified cannot be killed immediately because another
//          session is using the branch, but it has been marked for kill. This
//          means it will be deleted as soon as possible after the current
//          uninterruptable operation is completed.
// *Action: No action is required for the branch to be deleted.
/
/       25400-25425 Reserved for Application Failover
/
25400, 00000, "must replay fetch"
// *Cause:  A failure occured since the last fetch on this statement. Failover
//          was able to bring the statement to its original state to allow
//          continued fetches.
// *Action: This is an internally used error message and should not be seen
//          by the user.
25401, 00000, "can not continue fetches"
// *Cause:  A failure occured since the last fetch on this statement. Failover
//          was unable to bring the statement to its original state to allow
//          continued fetches.
// *Action: Reexecute the statement and start fetching from the beginning
25402, 00000, "transaction must roll back"
// *Cause:  A failure occured while a transaction was active on this
//          connection.
// *Action: The client must roll back.
//
25403, 00000, "could not reconnect"
// *Cause:  The connection to the database has been lost, and attempts to
//          reconnect have failed.
// *Action: Manually reconnect.
//
25404, 00000, "lost instance"
// *Cause:  The primary instance has died.
// *Action: This is an internally used error message and should not be seen
//          by the user.
//
25405, 00000, "transaction status unknown"
// *Cause:  A failure occured while a transaction was attempting to commit.
//          Failover could not automatically determine instance status.
// *Action: The user must determine the transaction's status manually.
25406, 00000, "could not generate a connect address"
// *Cause:  Failover was unable to generate an address for a backup instance.
// *Action: Contact Oracle customer support.
//
25407, 00000, "connection terminated"
// *Cause:  The connection was lost while doing a fetch.
// *Action: This is an internally used error message and should not be seen
//          by the user.
//
25408, 00000, "can not safely replay call"
// *Cause:  The connection was lost while doing this call. It may not be
//          safe to replay it after failover.
// *Action: Check to see if the results of the call have taken place, and then
//          replay it if desired.
//
25409, 00000, "failover happened during the network operation,cannot continue"
// *Cause:  The connection was lost when fetching a LOB column.
// *Action: Failover happened when fetching LOB data directly or indirectly.
//          Please replay the top level statement.
/ do NOT translate or document message 25410 - it is never displayed
// NLS_DO_NOT_TRANSLATE [25410,25410]
25410,00000, "Application requested failover retry"
// *Cause:  The application failover callback requested failover retry.
// *Action: None.  Informational only.
25411,00000, "transaction replay was not successful"
// *Cause:  Replay was not able to restore the transaction state to match
//          the pre-failover state.
// *Action: Manually determine if it is safe to resubmit the transaction.
25412,00000, "transaction replay disabled by call to %s"
// *Cause:  The application called an Oracle Call Interface (OCI) function 
//          that is not supported with transactional failover.
// *Action: Manually recover the pending transaction.
25413,00000, "transaction replay disabled by user request" 
// *Cause:  The application explicitly disabled transaction replay by
//          setting attribute OCI_ATTR_TRANSACTIONAL_TAF=FALSE.
// *Action: This message is informational only.
25414,00000, "Uncommitted transaction detected after TAF callback."
// *Cause:  The Transparent Application Failover (TAF) callback started a 
//          transaction and did not commit or rollback prior to exiting.
// *Action: End the transaction with a COMMIT or a ROLLBACK prior to
//          exiting the TAF callback.
25415,00000, "Application Continuity replay initiation timeout exceeded."
// *Cause:  Application Continuity replay was attempted after
//          REPLAY_INITIATION_TIMEOUT expired.  The value for
//          REPLAY_INITIATION_TIMEOUT is configured for the service to which
//          the application is connected.
// *Action: Manually recover the pending transaction.
/ do NOT translate or document message 25416 - it is never displayed
// NLS_DO_NOT_TRANSLATE [25416,25416]
25416,00000, "Retry current call"
// *Cause:  Failover sucessfully recovered an in-flight transaction
// *Action: Re-execute the current call
25417,00000, "replay disabled; call (%s) too large to record"
// *Cause:  Oracle Call Interface (OCI) Application Continuity replay was 
//          attempted after a large call that could not be recorded due
//          to excessive memory requirements.
// *Action: Break up the call into smaller pieces and retry failover, or
//          manually retry the user operation.
25418,00000, "transaction replay disabled by the use of object type in function %s"
// *Cause:  The application used an Oracle Call Interface (OCI) object
//          type that is not supported with transactional failover.
// *Action: Manually recover the pending transaction.
25419,00000, "transaction replay disabled in function %s by the use of unsupported type %s"
// *Cause:  The application used an Oracle Call Interface (OCI)
//          type that is not supported with transactional failover.
// *Action: Manually recover the pending transaction.
25420, 0000, "too many calls in request; replay disabled"
// *Cause:    Application Continuity failover was attempted after executing
//            a request with a large number of Oracle Call Interface (OCI)
//            calls, so replay of the request was not possible.
// *Action:   Resubmit and consider partitioning application work into
//            more requests with fewer OCI calls in each request.
//
25425, 00000, "connection lost during rollback"
// *Cause:  The connection was lost while issuing a rollback and the
//          application failed over.
// *Action: The connection was lost and failover happened during rollback.
//          If the transaction is not externally coordinated, then Oracle
//          implicitly rolled back, so no action is required. Otherwise
//          examine pending_trans$ to determine if "rollback force" is
//          required.
/
/       25426-25435 Reserved for Dblink Concentration
/
25426, 00000, "remote instance does not support shared dblinks"
// *Cause:   A shared dblink is being used to connect to a remote instance
//           that does not support this feature because it is an older version.
// *Action:  Use a normal dblink if you need to connect to this instance.
/
25427, 00000, "cannot downgrade database links after database link data dictionary has been upgraded "
// *Cause:   An attempt was made to downgrade  after the upgrade of the 
//           database link data dictionary.
// *Action:  Drop the database links before attempting the downgrade.
/
25428, 00000, "authentication failure while connecting through database link"
// *Cause:   An attempt to connect using the database link failed.
// *Action:  Ensure connection details for the database link are correct.
/
25429,00000, "Break request cannot be propagated over shared database link."
// *Cause:  No call in progress over shared database link.
// *Action: No action required. This is an informational message only.
/
25430,00000, "connected user database links are not supported in proxy session"
// *Cause:  A connected user database link is being used to connect to a
//          remote database from a proxy user session.
// *Action: No action required. This was an informational message only.
/
25431,00000, "Connection with protocol %s is disallowed by the outbound_dblink_protocols parameter."
// *Cause:  An attempt to connect using the database link failed 
//          because the network protocol used for the database link 
//          is disallowed.
// *Action: Either set the value of the outbound_dblink_protocols 
//          initialization parameter appropriately to include the required
//          protocol or change the protocol used by the database link to 
//          conform to the protocols allowed by the outbound_dblink_protocols
//          parameter.
/
25432,00000, "database link log on info tracing"
// *Document: NO
// *Cause:
// *Action: 
/
25433,00000, "User %s does not have INHERIT REMOTE PRIVILEGES privilege on connected user %s."
// *Cause:  An attempt was made to use a connected user database link inside
//          a definer's rights function, procedure or view, and the owner
//          of the function, procedure or view lacked INHERIT REMOTE PRIVILEGES 
//          privilege on the connected user.
// *Action: Either do not start the function, procedure or view,
//          or grant the owner of the function, procedure or view 
//          INHERIT REMOTE PRIVILEGES privilege on the connected user.
/
25434,00000, "Connected user database link usage by the common user %s is not allowed."
// *Cause: The COMMON_SCHEMA_ACCESS lockdown profile feature was disabled.
// *Action: Either do not use the database link as a common user 
//          or have the administrator enable COMMON_SCHEMA_ACCESS lockdown
//          profile feature.
/  
25435, 00000, "Database link cannot be used after failing over with Transparent Application Continuity."
// *Cause:   The use of database link was detected in the failed-over session
//           while Transparent Application Continuity was in use.
// *Action:  Consider whether the application can use Transaction mode of
//           Application Continuity that supports failover with database links.
//           (Use FAILOVER_TYPE=TRANSACTION). Use Fast Application Notification
//           with Oracle connection pools for planned maintenance. 
/
/       25436-25476 Reserved for Rules Engine
/
25436, 00000, "invalid table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the table values specified had an invalid alias.
// *Action:  Check the valid table aliases in the evaluation context,
//           and try again with a valid alias.
25437, 00000, "duplicate table value for table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           some of the table values specified had the same table alias.
// *Action:  Check the table values specified, and try again with only
//           one value per table.
25438, 00000, "invalid variable name: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the variable values specified had an invalid name.
// *Action:  Check the valid variable names in the evaluation context,
//           and try again with a valid name.
25439, 00000, "duplicate variable value for variable: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           some of the variable values specified had the same variable name.
// *Action:  Check the variable names specified, and try again with only
//           one value per variable.
25440, 00000, "invalid table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the column values specified had an invalid table alias.
// *Action:  Check the valid table aliases in the evaluation context,
//           and try again with a valid name.
25441, 00000, "duplicate column value for table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the column values supplied a value for a
//           table alias, which already had a table value supplied.
// *Action:  Check the table and column values specified, and try again with
//           either a table value or column values for each table alias.
25442, 00000, "too many column values for table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           too many column values were supplied for the specified
//           table alias.
// *Action:  Check the column values specified, and try again with
//           the right number of column values.
25443, 00000, "duplicate column value for table alias: %s, column number: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           duplicate column values were supplied for the specified
//           table alias and column number.
// *Action:  Check the column values specified, and try again with
//           only one column value for each table alias, and column number.
25444, 00000, "invalid ROWID: %s for table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           an invalid ROWID was supplied for the specified
//           table alias.
// *Action:  Check the column values specified, and try again with
//           only one column value for each table alias, and column number.
25445, 00000, "invalid column number: %s for table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           an invalid column number was supplied for the specified
//           table alias as a part of a column value.
// *Action:  Check the column values specified, and try again with
//           a valid column number.
25446, 00000, "duplicate column value for table alias: %s, column: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           duplicate column values were supplied for the specified
//           table alias and column name.
// *Action:  Check the column values specified, and try again with
//           only one column value for each table alias, and column name.
25447, 00000, "encountered errors during evaluation of rule %s.%s"
// *Cause:   An attempt to evaluate was made, which failed during the
//           evaluation of the specified rule.
// *Action:  Check the rule and the values passed to evaluate, and try
//           again with valid values.
25448, 00000, "The %s %s.%s has errors."
// *Cause:   An attempt to load the specified rule or expression failed due
//           to errors in the rule or expression.
// *Action:  Check the rule or expression and retry the operation.
25449, 00000, "invalid variable name: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the attribute values specified had an invalid
//           variable name.
// *Action:  Check the valid variable names in the evaluation context,
//           and try again with a valid name.
25450, 00000, "error %s during evaluation of rule set %s.%s"
// *Cause:   The specified error occurred during evaluation of the
//           rule set.
// *Action:  Check the error and take appropriate action.
25451, 00000, "too many attribute values for variable: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           too many attribute values were supplied for the specified
//           variable.
// *Action:  Check the attribute values specified, and try again with
//           the right number of attribute values.
25452, 00000, "duplicate attribute value for variable: %s, attribute: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           duplicate attribute values were supplied for the specified
//           variable and attribute name.
// *Action:  Check the attribute values specified, and try again with
//           only one attribute value for each variable, and attribute name.
25453, 00000, "invalid iterator: %s"
// *Cause:   An attempt to get rule hits or to close an iterator was made,
//           which failed because an invalid iterator was passed in.
// *Action:  Check the iterator, and try again with a valid iterator.
25454, 00000, "error during evaluation of rule set: %s.%s for iterator: %s"
// *Cause:   An attempt to get rule hits for an iterator was made,
//           which failed because of an error in evaluation of the specified
//           rule set.
// *Action:  Check the validity of the rule set and try again.
25455, 00000, "evaluation error for rule set: %s.%s, evaluation context: %s.%s"
// *Cause:   An attempt to evaluate the specified rule set using the
//           evaluation context specified failed due to some errors.
// *Action:  Check additional errors signalled to determine the problem.
25456, 00000, "rule set was modified or evaluation terminated for iterator: %s"
// *Cause:   An attempt to get rule hits was made, which failed because
//           the underlying rule set was modified after the iterator was
//           returned.
// *Action:  Try again after re-evaluating the rule set.
25457, 00000, "evaluation function %s returns failure"
// *Cause:   The specified evaluation function returned a failure during
//           evaluation, causing evaluation to terminate.
// *Action:  Check arguments to evaluate and retry.
25458, 00000, "Value not supplied for %s %s"
// *Cause:   Variable or table column values were not supplied for evaluation.
// *Action:  Supply all the required variable and column data points for 
//           Independent Expression Evaluation.
25459, 00000, "Data conversion for %s %s failed"
// *Cause:   The attempt to convert data to the data type of the variable or
//           column failed.
// *Action:  Supply the correct data for variable or column.
25461, 00000, "rule set not specified"
// *Cause:   An attempt to evaluate was made, which failed because
//           the ruleset name specified was null.
// *Action:  Check the rule set name, and try again with a valid name.
25462, 00000, "evaluation context not specified"
// *Cause:   An attempt to evaluate was made, which failed because
//           the evaluation context specified was null.
// *Action:  Check the evaluation context name, and try again with a
//           valid name.
25463, 00000, "table alias not specified"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the table values specified had a NULL alias name.
// *Action:  Check the list of table values, and try again with a
//           valid alias name.
25464, 00000, "ROWID not specified for table alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           the table value for the specified table alias had a NULL ROWID.
// *Action:  Check the list of table values, and try again with a
//           valid ROWID.
25465, 00000, "variable name not specified"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the variable values specified had a NULL variable name.
// *Action:  Check the list of variable values, and try again with a
//           valid variable name.
25466, 00000, "data not specified for variable name: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           the variable value for the specified variable name had NULL
//           data.
// *Action:  Check the list of variable values, and try again with
//           valid data.
25467, 00000, "table alias not specified"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the column values specified had a NULL alias name.
// *Action:  Check the list of column values, and try again with a
//           valid alias name.
25468, 00000, "column name not specified for alias: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the column values for the specified alias name
//           had a NULL column name.
// *Action:  Check the list of column values, and try again with a
//           valid column name.
25469, 00000, "data not specified for alias: %s column name: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           the column value for the specified alias and column name
//           had NULL data.
// *Action:  Check the list of column values, and try again with
//           valid data.
25470, 00000, "duplicate attribute value for variable: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the attribute values supplied a value for a
//           variable, which already had a variable value supplied.
// *Action:  Check the variable and attribute values specified,
//           and try again with either a variable value or
//           attribute values for each variable.
25471, 00000, "attribute name not specified for variable: %s"
// *Cause:   An attempt to evaluate was made, which failed because
//           one of the attribute values for the specified variable
//           had a NULL attribute name.
// *Action:  Check the list of attribute values, and try again with a
//           valid attribute name.
25472, 00000, "maximum open iterators exceeded"
// *Cause:   The open rule hit iterators in the session exceeded 
//           2 * OPEN_CURSORS.
// *Action:  Close some rule hit iterators.
//
25473, 00000, "cannot store %s in rule action context"
// *Cause:   The user attempted to put unsupported data types, such as LOBs 
//           and evolved ADTs, into the rule action context.
// *Action:  Use only supported data types in rule action context.
/ 25474 is reserved for dumping info
/ 25475 is reserved for debug mode
25476, 00000, "use pre-5523578 behaviour when looking up enabled roles"
// *Cause:  N/A
// *Action: Derive the enabled roles under the rules engine using the old
//          method that existed before the fix to bug 5523578.
/
/
/       25500-25525 Reserved for Quiesce Database Feature Errors
/
25500, 00000, "database is not open"
// *Cause:   Database must be open to perform ALTER SYSTEM QUIESCE RESTRICTED
//           command.
// *Action:  Open the database and retry this command.
25501, 00000, "ALTER SYSTEM QUIESCE RESTRICTED command failed"
// *Cause:   Database resource manager failed to change plan.
// *Action:  Look at the alert logs to see detailed description of the error.
25502, 00000, "concurrent ALTER SYSTEM QUIESCE/UNQUIESCE command is running"
// *Cause:   There is a concurrent ALTER SYSTEM QUIESCE RESTRICTED or ALTER
//           SYSTEM UNQUIESCE command running in the system.
// *Action:  Contact the database administrator who is responsible for the
//           concurrent command.
25503, 00000, "cannot open database because the database is being quiesced"
// *Cause:   Database cannot be opened because the system is being or has
//           been quiesced.
// *Action:  Open the database after the system has been quiesced.
25504, 00000, "the system is already in quiesced state"
// *Cause:   Cannot quiesce the system because the system is already quiesced.
// *Action:
25505, 00000, "the system is not in quiesced state"
// *Cause:   Cannot unquiesce the system because the system is not in quiesced
//           state.
// *Action:
25506, 00000, "resource manager has not been continuously on in some instances"
// *Cause:   Cannot quiesce the system because resource manager has not been
//           continuously on since startup in this or some other instances.
// *Action:
25507, 00000, "resource manager has not been continuously on"
// *Cause:   Cannot quiesce the system because resource manager has not been
//           continuously on since startup.
// *Action:
25508, 00000, "database is not mounted"
// *Cause:   Database must be mounted to perform ALTER SYSTEM UNQUIESCE
//           command.
// *Action:  Mount the database and retry this command.
25509, 00000, "operation on \"%s\".\"%s\".%s not allowed"
// *Cause:   A column has been added to a replicated table, but replication
//           support processing has not completed.
// *Action:  Wait until replication support processing has completed
//           before updating the column
25510, 00000, "quiesce not supported for the root container"
// *Cause:   Could not quiesce the root container.
// *Action:  This operation is not supported for the root container.
25511, 00000, "quiesce not supported for pluggable databases"
// *Cause:   Could not quiesce the pluggable database.
// *Action:  This operation is not supported for pluggable databases.
/
/       25526-25550 Reserved for MTTR advisory
/
25526, 00000, "bad format of _DB_MTTR_SIM_TARGET: %s"
// *Cause:   One value in _DB_MTTR_SIM_TARGET is not a valid MTTR.
// *Action:  Alter the value of _DB_MTTR_SIM_TARGET.
25527, 00000, "bad format of _DB_MTTR_SIM_TARGET"
// *Cause:   One value in _DB_MTTR_SIM_TARGET is empty.
// *Action:  Set the value of _DB_MTTR_SIM_TARGET properly.
25528, 00000, "too many candidate MTTRs are specified in _DB_MTTR_SIM_TARGET"
// *Cause:   Too many candidate MTTRs are specified in _DB_MTTR_SIM_TARGET.
// *Action:  Alter the value of _DB_MTTR_SIM_TARGET.
25530, 00000, "FAST_START_MTTR_TARGET is not specified"
// *Cause:   An attempt to start MTTR advisory was made, which failed because
//           FAST_START_MTTR_TARGET was not specified.
// *Action:  Set FAST_START_MTTR_TARGET.
25531, 00000, "MTTR specified is too small: %s"
// *Cause:   The current FAST_START_MTTR_TARGET setting or a candidate MTTR
//           setting is too small for MTTR advisory.
// *Action:  Set a larger FAST_START_MTTR_TARGET or candidate MTTR.
25532, 00000, "MTTR specified is too large: %s"
// *Cause:   The current FAST_START_MTTR_TARGET setting or a candidate MTTR
//           setting is too large for MTTR advisory.
// *Action:  Set a smaller FAST_START_MTTR_TARGET or candidate MTTR.
25533, 00000, "FAST_START_IO_TARGET or LOG_CHECKPOINT_INTERVAL is specified" 
// *Cause:   An attempt to start MTTR advisory was made, which failed because
//           either FAST_START_IO_TARGET or LOG_CHECKPOINT_INTERVAL was
//           specified.
// *Action:  Set FAST_START_IO_TARGET and LOG_CHECKPOINT_INTERVAL to 0.
/
/       25950-25999 Reserved for Join Index Errors
/
25950, 00000, "missing where clause in join index specification\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because no valid where clause was found.
// *Action:  Ensure that a where clause with valid join conditions is
//           specified in the create index statement.
25951, 00000, "join index where clause cannot contain OR condition\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because there was an OR branch in the where clause.
// *Action:  Reformulate the where clause without using ORs.
25952, 00000, "join index must only contain inner equi-joins\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because it included a predicate which wasn't an equi-inner join.
// *Action:  Remove the inappropriate predicate.
25953, 00000, "join index cannot be a functional index\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because a functional index was requested or necessary (such as
//           is the case for indexing columns using timezone).
// *Action:  Remove any functional indexing columns.
25954, 00000, "missing primary key or unique constraint on dimension\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because one or more dimensions did not have an appropriate
//           constraint matching the join conditions.
// *Action:  Ensure that the where clause is correct (contains all of the
//           constraint columns) and that an enforced constraint is on
//           each dimension table.
25955, 00000, "all tables must be joined in the where clause\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because one of the tables in the from clause did not appear
//           in the where clause.
// *Action:  Ensure that the where clause contains all from clause tables.
25956, 00000, "join index cannot be created on tables owned by SYS\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because one of the tables was owned by SYS.
// *Action:  Ensure that no join index related table is owned by SYS.
25957, 00000, "join index where clause cannot contain cycles\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because the where clause contains a cycle.
// *Action:  Ensure that the where clause is in the form of a star
//           or snowflake schema.
25958, 00000, "join index where clause predicate may only contain column references\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because a predicate in the where clause contained something
//           other than a simple column.
// *Action:  Ensure that the where clause only contains columns.
25959, 00000, "join index must be of the bitmap type\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because no bitmap keyword was used.
// *Action:  Make the index a bitmap index.
25960, 00000, "join index cannot be based on a temporary table\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because one of the tables was temporary.
// *Action:  Ensure no underlying tables are temporary.
25961, 00000, "join index prevents dml cascade constraint operation\n"
// *Cause:   An attempt to execute dml resulted in the need to perform
//           dml on another table because of a cascade constraint.
//           The join index only allows one of its underlying tables
//           to me modified at a time.
// *Action:  Drop the join index or remove the constraint.
25962, 00000, "join index prevents multitable insert or merge\n"
// *Cause:   An attempt to execute an merge or multitable insert on
//           a table that was used to create a bitmap join index was made.
//           Merge and multitable inserts are not supported on tables
//           that were used to create a bitmap join index.
// *Action:  Drop the join index.
25963, 00000, "join index must be created on tables\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because the from clause contains non table object.
// *Action:  Ensure that the from clause only contains tables.
25964, 00000, "column type incompatible with join column type\n"
// *Cause:   The datatype of the join column is incompatible with the
//           datatype of the joined column.
// *Action:  Select a compatible datatype for the join column.
25965, 00000, "fact table must be included in the from clause\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because the from clause does not contain the fact table.
// *Action:  Ensure that the from clause contains the fact table.
25966, 00000, "join index cannot be based on an index organized table\n"
// *Cause:   An attempt to create a join index was made, which failed
//           because one of the tables was an index organized table.
// *Action:  Ensure no underlying tables are index organized.
/
/       26000-26099 Reserved for Direct Path Load Errors
/
26000, 00000, "partition load specified but table %s is not partitioned\n"
// *Cause:   The Loader control file contains a PARTITION clause but the
//           table being loaded is not partitioned.
// *Action:  Remove the partition specification from the SQL*Loader control
//           file and retry the load.
26001, 00000, "Index %s specified in SORTED INDEXES does not exist on table %s\n"
// *Cause:   A nonexistent index was specified in the SORTED INDEXES clause.
// *Action:  Do not specify as a SORTED INDEX.
26002, 00000, "Table %s has index defined upon it.\n"
// *Cause:   Parallel load was specified into a table which has index
//           defined upon it.
// *Action:  Drop index(es) defined upon table, or don't use parallel load,
//           or use SKIP_INDEX_MAINTENANCE option.
26003, 00000, "parallel load not supported for index-organized table %s.\n"
// *Cause:   Parallel load is not supported for index-organized tables.
// *Action:  load the index-organized table without the PARALLEL option.
26004, 00000, "Tables loaded through the direct path may not be clustered\n"
// *Cause:   User attempted to load a clustered table via the direct path.
// *Action:  Use the conventional path.
26005, 00000, "Invalid handle for direct path load\n"
// *Cause:   In direct path load, the handle passed in does not match the type
//           listed.
// *Action:  Verify the handle and type are correct.
26006, 00000, "Incorrect bind variable in column %s's sql expression - %s\n"
// *Cause:   In direct path load, the bind variables listed in the
//           sql expression do not match the input argument column names.
// *Action:  Verify all the input arguments are listed in the expression as
//           bind variables, and all the bind variables are listed as
//           input arguments to the expression.  Or verify that there were
//           no errors in executing the OCI statements when getting the bind
//           variable list.
26007, 00000, "invalid value for SETID or OID column\n"
// *Cause:   The value passed in a Direct Path API stream for a column
//           containing a SETID or OID has an invalid value.  SETIDs and
//           Object IDs must be either 16 bytes of RAW data or 32 bytes of
//           hexidecimal characters. 
// *Action:  Regenerate the Direct Path API stream with a valid value for the
//           SETID column.
26008, 0, "Invalid syntax or bind variable in SQL string for column %s.\n%s\n"
// Cause:  See following error message for more information.
//         A SQL string cannot have quoted strings improperly terminated.
//         A bind variable in a SQL string cannot have a length of 0, cannot
//         exceed maximum length of 30 characters, and cannot be missing a
//         double quote.
// Action: Fix the SQL string.  See following error for more information.
26009, 00000, "stream verification error: %s\n"
// *Cause:   An error has occurred in a Data Pump stream verification 
//           operation.
// *Action:  Contact Oracle Support Services.
26010, 00000, "Column %s in table %s is NOT NULL and is not being loaded\n"
// *Cause:   A column which is NOT NULL in the database is not being loaded
//           and will cause every row to be rejected.
// *Action:  Load the column by specifying the NOT NULL column in the
//           INTO TABLE clause in the SQL*Loader control file.
26011, 00000, "Cannot load type %s into column %s in table %s\n"
// *Cause:   A column can only store data of type declared for that column.
//           And a substitutable column can only store data of valid subtypes
//           of the supertype declared for that column.
// *Action:  Check that the type or subtype specified is valid for that column.
26012, 0, "header in file %s has an incompatible version number\n"
// *Cause:  A dump file was specified for a load operation whose version
//          number is incompatible with the dump file version currently 
//          produced by the Oracle server on the system. Usually this
//          message indicates that the dump file was produced by a newer
//          version of the Oracle server.
// *Action: Load this dump file using the same version of the Oracle
//          server that created the file.
26013, 00000, "List allocated may not be big enough\n"
// *Cause:   There seems to be a discrepancy between the size for a list or
//           buffer allocated by direct path api and the size needed.
// *Action:  Contact Oracle Customer Support.
26014, 00000, "unexpected error on %s %s while retrieving %s\n%s"
// *Cause:  The SQL error was returned from an OCIStmtExecute call.
// *Action: Correct the SQL error that was returned.
26015, 00000, "Array column %s in table %s is not supported by direct path\n"
// *Cause:   User attempted to load an array column via the direct path.
// *Action:  Use the conventional path.
26016, 00000, "Virtual column %s in table %s.%s cannot be loaded by direct path\n"
// *Cause:   You attempted to load an virtual column using the direct path.
// *Action:  Virtual columns cannot be loaded using the direct path.
26017, 00000, "global indexes not allowed for direct path load of table partition %s"
// *Cause: Global indexes are defined on a table when direct path loading a
//         single partition of the table.
26018, 00000, "Column %s in table %s does not exist\n"
// *Cause:  Column specified in the loader control file does not exist.
// *Action: Make sure the column exists and that you have privileges on it.
//          Correct the loader control file if it is wrong.
26019, 00000, "Column %s in table %s of type %s not supported by direct path\n"
// *Cause:  The Specified column of SQL column type %s is not supported by
//          the direct path loader.
// *Action: If the column is NULLable, remove it from the control file
//          description.  Then it will be loaded as a NULL.
26020, 00000, "index %s.%s loaded successfully with %s keys"
// *Cause: Non-partitioned index information put to loader log file.
// *Action: None.  Informational only.
26021, 00000, "index %s.%s partition %s loaded successfully with %s keys"
// *Cause: Partitioned index information put to loader log file.
// *Action: None.  Informational only.
26022, 00000, "index %s.%s was made unusable due to:"
// *Cause: A Non-partitioned index was made index unusable due to the
//         error displayed below this error.
// *Action: Depending on the error, either rebuild the index, or drop and
//          re-create it.
26023, 00000, "index %s.%s partition %s was made unusable due to:"
// *Cause: A partition of a partitioned index was made index unusable due to
//         error displayed below this error.
// *Action: Depending on the error, either rebuild the index partition,
//          or drop and re-create the entire index.
26024, 00000, "SKIP_UNUSABLE_INDEXES requested and index segment was initially unusable"
//* Cause:  User requested SKIP_UNUSABLE_INDEXES option, and the index segment
//*         was in unusable state prior to the beginning of the load.
//* Action: Informational only.  User will need to either rebuild the index
//*         or index partition, or re-create the index.
26025, 00000, "SKIP_INDEX_MAINTENANCE option requested"
//* Cause:  User requested that index maintenance be skipped on a direct
//          path load.
//* Action: The listed index was put into Index Unusable state due to the user
//          requesting that index maintenance be skipped.  Either rebuild the
//          index or index partitions, or drop and re-create the index.
26026, 0000, "unique index %s.%s initially in unusable state"
//* Cause:  A unique index is in IU state (a unique index cannot have
//*         index maintenance skipped via SKIP_UNUSABLE_INDEXES).
//* Action: Either rebuild the index or index partition, or use
//*         SKIP_INDEX_MAINTENANCE if the client is SQL*Loader.
26027, 0000, "unique index %s.%s partition %s initially in unusable state"
//* Cause:  A partition of a unique index is in IU state (a unique index
//*         cannot have index maintenance skipped via SKIP_UNUSABLE_INDEXES).
//* Action: Either rebuild the index or index partition, or use
//*         SKIP_INDEX_MAINTENANCE if the client is SQL*Loader.
26028, 0000, "index %s.%s initially in unusable state"
//* Cause:  An index is in IU state prior to the beginning of a direct
//*         path load, it cannot be maintained by the loader.
//* Action: Either rebuild the index, re-create the index, or use either
//*         SKIP_UNUSABLE_INDEXES or SKIP_INDEX_MAINTENANCE (Sql*Loader only).
26029, 0000, "index %s.%s partition %s initially in unusable state"
//* Cause:  A partition of an index is in IU state prior to the beginning
//*         of a direct path load, it cannot be maintained by the loader.
//* Action: Either rebuild index partition, re-create the index, or use either
//*         SKIP_UNUSABLE_INDEXES or SKIP_INDEX_MAINTENANCE (Sql*Loader only).
26030, 0000, "index %s.%s had %s partitions made unusable due to:"
//* Cause: A logical index error occurred on a partitioned index which
//*        affected one or more index partitions, which are listed below
//*        this message.
//* Action: The affected index partitions will have to be re-built, or, the
//*         entire index dropped and re-created.
26031, 0000, "index maintenance error, the load cannot continue"
//* Cause: A index errror occurred during the index maintenance phase of
//*        a direct path load.  The load cannot continue.  See error message
//*        below this message.
//* Action: See action for the error message which follows this one.
26032, 0000, "index %s.%s loading aborted after %s keys"
//* Cause:  An index error occurred during direct-load of an index-organized table.
//*         Loading had to be aborted. No rows were loaded.
//* Action: Check the key just following the number of keys mentioned above.
//*         This key caused the index problem mentioned in an earlier message.
//*
26033, 0000, "column %s.%s encryption properties differ for source or target table"
//* Cause:  The source and destination columns did not have the same
//*         encryption properties.
//* Action: For security reasons, check that the source and target table have
//*         the same encryption properties.
//*
26034, 00000, "Column %s does not exist in stream\n"
// *Cause:  Column specified in the column list does not exist in the stream.
// *Action: Make sure the column exists or remove it from the list.
26035, 0000, "Error attempting to encrypt or decrypt column"
//* Cause:  An error occurred while attemping to encrypt or decrypt
//*         a database column. 
// *Action: Verify correct encryption key was specified.
//*
26036, 00000, "subpartition load specified but table %s is not subpartitioned\n"
// *Cause:   The Loader control file contains a PARTITION clause but the
//           table being loaded is not subpartitioned.
// *Action:  Remove the subpartition specification from the SQL*Loader control
//           file and retry the load.
26037, 00000, "must specify partition name(s) for system partitioned table %s\n"
// *Cause: An attempt was made to load a system partitioned table with no
//          partition name(s) specified.
// *Action: Specify the partition name(s) explicitly.
26038, 00000, "attempt to write audit record for SQL*Loader direct path load of %s.%s failed with error code: %d\n"
// *Cause: An attempt to write an audit record during a SQL*Loader direct path load failed.
//*Action: Contact Oracle Support Services.
26040, 00000, "Data block was loaded using the NOLOGGING option\n"
//* Cause: Trying to access data in block that was loaded without
//*        redo generation using the NOLOGGING/UNRECOVERABLE option
//* Action: Drop the object containing the block.
/
//  26041 - 26044 DATETIME/INTERVAL datatypes
26041, 00000, "DATETIME/INTERVAL datatype conversion error\n"
//* Cause: The column could not be converted from DATETIME
//*        datatype to internal DATETIME/CHARACTER datatype.
//*Action: Contact Oracle Customer Support.
26045, 00000, "REF column %s expects %s arguments; found %s.\n"
// *Cause:  The number of arguments for the REF column is incorrect.
// *Action: Specify the correct number of input arguments for REFs.
//          1. Unscoped system-generated REFs can have exactly 1 or 2 input
//          arguments.  a) It has exactly 1 input argument (one for the OID
//          value) if a fixed table name was specified through
//          OCI_DIRPATH_EXPR_REF_TBLNAME.  b) It has exactly 2 input arguments
//          (one for the table name and one for the OID value) if a fixed
//          table name was not specified through OCI_DIRPATH_EXPR_REF_TBLNAME.
//          2. Scoped system-generated REFs can have 1 or 2 input arguments.
//          Because a table name argument is not needed for a scoped ref,
//          only 1 argument (OID value) is expected.  But if the table name
//          argument is given, it's still accepted.
//          3. Scoped primary-key REFs with N columns in its primary-key OID
//          can have N or N+1 input arguments.  Because a table name argument
//          is not needed for a scoped ref, only N arguments (making up the
//          OID value) is expected.  But if the table name argument is given,
//          it's still accepted.
26046, 00000, "REF column %s expects scoped table name %s; user passed in %s.\n"
// *Cause:  The scoped table name passed in by the user does not match the name
//          in the schema.
// *Action: Specify the correct table name for the scoped REF column.
/
26048, 00000, "Scoped REF column has wrong table name.\n"
// *Cause:  The scoped table name passed in by the user does not match the name
//          in the schema.
// *Action: Specify the correct table name for the scoped REF column.
/
26049, 00000, "Unscoped REF column has non-existent table name.\n"
// *Cause:  The table name passed in by the user does not exist
//          in the schema.
// *Action: Specify a valid table name for the unscoped REF column.
/
26050, 00000, "Direct path load of domain index is not supported for this column type.\n"
// *Cause:  Direct path can not load a domain index of that column type.
// *Action: Drop the index and try again or load using conventional path.
/
26051, 00000, "internal error parsing packed decimal format string"
// *Cause:  A packed decimal field with a non-zero scale factor is mapped to
//          a character column. In order to perform the datatype conversion,
//          a numeric format string must be created based on the input field's
//          precision and scale specifications.  Direct path loader
//          encountered an error in creating this format string.
// *Action: Examine the packed decimal field's precision and scale
//          specifications and make sure that they contain valid values.
/
26052, 0000, "Unsupported type %d for SQL expression on column %s.\n"
//* Cause:  The direct path api does not support a SQL expression on a
//          column of that type.
//* Action: Make sure the types are correct.
/
/ do NOT translate or document message 26053 - it is never displayed
// NLS_DO_NOT_TRANSLATE [26053,26053]
26053, 0000, "Row was not loaded due to conversion error.\n"
/
//* Cause:  The current row was not loaded due to a conversion error.
//* Action: Continue with the load anyways.
//  260xx - 260xx Direct Path API
26054, 0000, "Direct Path Context prepared for a different mode than operation requested.\n"
//* Cause:  The user prepared the direct path context for one operation
//          (Load, Unload, Convert), but then tried to perform a different
//          operation.
//* Action: Make sure the direct path context mode and operation matches.
/
26055, 0000, "Invalid buffer specified for direct path unload\n"
//* Cause:  The user specified a zero length or null buffer to be used for
//          the Direct Path Unload operation.
//* Action: Specify a valid buffer and length.
/
26056, 00000, "Requested direct path operation on a view is not supported.\n"
// *Cause:   An attempt was made to load into a view using direct path that has
//           user-defined types, XML data, object type table or SQL expressions.
// *Action:  Do not attempt to use direct path when loading a view that has
//           nonscalar columns or when using SQL expressions on input columns.
/
/ do NOT translate or document message 26057 - it is for internal use only
// NLS_DO_NOT_TRANSLATE [26057,26057]
26057, 00000, "Conversion is not necessary for this direct path stream.\n"
// *Cause:   User attempted to convert a direct path stream that does not 
//           require conversion.
// *Action:  Load the stream without conversion it.
/
26058, 0000, "unexpected error fetching metadata for column %*s in table %*s\n"
//* Cause: The direct path API encountered an unexpected error while
//         retrieving metadata for a column.
//* Action: Contact Oracle support.
/
26059, 0000, "Data is too large for column %s\n"
//* Cause: The direct path API encountered a column that can not be loaded 
//         because the input data is too large for a column.
//* Action: Make the target column larger.
/
26060, 0000, "Can not convert type identifier for column %s\n"
//* Cause: The direct path API encountered a type identifier for a column that
//         can not be loaded because a mapping can not be found for the input
//         value.
//* Action: Verify the input data.
/
26061, 0000, "Concurrent direct unloads is not allowed.\n"
//* Cause:  User attempted a direct unload when another is still in progress.
//* Action: Complete the current direct unload before starting another.
/ 
26062, 0000, "Can not continue from previous errors.\n"
//* Cause:  User attempted to continue a direct path load after receiving an 
//          error which indicates the load can not continue.
//* Action: Address the original error that was returned.
/ 
26063, 0000, "Can not flashback to specified SCN value - Wrap: %s Base: %s.\n"
//* Cause:  User specified an SCN which occurs before the last time the 
//          table definition was modified.
//* Action: Specify a more recent SCN.
/ 
26064, 0000, "Invalid SCN specified - Wrap: %s Base: %s.\n"
//* Cause:  User specified an invalid SCN.
//* Action: Specify a valid SCN.
/ 
26065, 0000, "check constraint cannot reference column, %s, in direct path load\n"
//* Cause: An enabled check constraint was found on a column stored as a lob.
//* Action: Either disable the check constraint before loading the table data
//*         using the direct path mode, or use the conventional path mode 
//*         instead.
/
26076, 0000, "cannot set or reset value after direct path structure is allocated"
//* Cause: Client attempted to set or reset the number of rows in a direct path
//*        structure after it has already been allocated and initialized.
//*        Attributes used is one of the following:
//*        - OCI_ATTR_NUM_ROWS: to set # of rows in a direct path column array
//*        - OCI_ATTR_DIRPATH_DCACHE_SIZE: to set size of a date cache
//*          (default is 0)
//*        - OCI_ATTR_DIRPATH_DCACHE_DISABLE: to set whether date cache will be
//*          disabled on overflow (default is FALSE)
//* Action: Set the following attributes before:
//*        - OCI_ATTR_NUM_ROWS: before calling OCIHandleAlloc for column array
//*        - OCI_ATTR_DIRPATH_DCACHE_SIZE: before calling OCIDirPathPrepare
//*        - OCI_ATTR_DIRPATH_DCACHE_DISABLE: before calling OCIDirPathPrepare
26077, 0000, "direct path column array is not initialized"
//* Cause: Client attempted to allocate a column array for a direct path
//*        function context before allocating a column array for the
//*        table-level direct path context.
//* Action: Allocate the table-level direct path context's column array
//*         via OCIHandleAlloc before allocating column arrays for
//*         direct path function contexts.
26078, 0000, "file \"%s\" is not part of database being loaded\n"
//* Cause:  A parallel load file was specified which is not part
//*         of the database.
//* Action: Check filename and pathname for correctness.
26079, 0000, "file \"%s\" is not part of table %s.%s\n"
//* Cause:  A parallel load file was specified which is not in the
//*         tablespace of the table being loaded.
//* Action: Check to make sure that the specified parallel load file
//*         is in the tablespace of the table being loaded.
26080, 0000, "file \"%s\" is not part of table %s.%s partition %s\n"
//* Cause:  A parallel load file was specified which is not in the
//*         tablespace of the table (partition, subpartition) being loaded.
//*         When a partitioned table is being loaded, the file must be
//*         in the tablespace of every partition or subpartition
//*         (i.e. each (sub)partition must be in the same tablespace).
//* Action: Specify a different parallel load file, or no file at all.
26082, 0000, "load of overlapping segments on table %s.%s is not allowed"
//* Cause:  Client application is attempting to do multiple direct path load
//*         operations on the same table, but the segments overlap.
//* Action: Check the partition names (subname attribute of the direct path
//*         context) being loaded.  Make sure you are not loading a table,
//*         and a partition of the same table.  Make sure you are not
//*         loading a partition, and a sub-partition within the same
//*         partition.
26083, 0000, "unsupported direct path stream version %s"
//* Cause:  The stream version requested is not supported by the server.
//* Action: Check to make sure that the VERSION attribute of the direct
//*         stream is not being set to an invalid value.
26084, 0000, "direct path context already finished"
//* Cause:  An OCIDirPathLoadStream operation was attempted after
//*         OCIDirPathFinish was called.  Once a direct path operaton
//*         has been finished, no more data can be loaded.
//* Action: Check program logic to make sure OCIDirPathLoadStream is
//*         not called after OCIDirPathFinish.
26085, 0000, "direct path operation must start its own transaction"
//* Cause:  A direct path operation is being attempted within a transaction
//*         that has already been started.
//* Action: Commit the transaction and Prepare the direct path operation again.
26086, 0000, "direct path does not support triggers"
//* Cause:  A direct path operation is being attempted on a table which
//*         has enabled triggers.
//* Action: Disable the triggers on the table and try again.
26088, 0000, "scalar column \"%s\" must be specified prior to LOB columns"
//* Cause:  All scalar columns (i.e. non-LOB and non-LONG columns) must be
//*         specified by the client of the direct path API prior to
//*         specifying any LOB columns.
//* Action: Specify all scalar columns prior to specifying any LOB columns.
26089, 0000, "LONG column \"%s\" must be specified last"
//* Cause:  A client of the direct path API specified a LONG column to be
//*         loaded, but the LONG column was not the last column to be
//*         specified.
//* Action: Specify the LONG column last.
26090, 0000, "row is in partial state"
//* Cause:  A direct path operation is being finished or a data save request
//*         has been made, but the table for which the request is being made
//*         on has a row in partial state.  The row must be completed before
//*         the segment high water marks can be moved.
//* Action: Either complete the row, or abort the direct path operation.
26091, 0000, "requested direct path operation not supported"
//* Cause:  A direct path operation was requested that is not supported
//* Action: Do not use that operation.  Currently, UNLOAD is not supported.
26092, 0000, "only LONG or LOB types can be partial"
//* Cause:  A column which is not a LONG or LOB had the
//*         OCI_DIRPATH_COL_PARTIAL flag associated with it.
//*         Only LONG or LOB type columns can be loaded in pieces.
//* Action: Do not use the OCI_DIRPATH_COL_PARTIAL flag for the column.
26093, 0000, "input data column size (%d) exceeds the maximum input size (%d)"
//* Cause:  The user attempted to specify a column size (%d) that exceeded 
//*         the maximum allowable input size (%d)."
//* Action: Make sure the input column metadata matches the column definition.
26094, 0000, "stream format error: input column overflow"
//* Cause:  An input stream contained data for more input columns
//*         than specified by the client of the direct path API.
//* Action: Make sure that the stream being loaded is for the
//*         correct table.  Check initialization sequence.
26095, 0000, "unprocessed stream data exists"
//* Cause:  Either a OCIDirPathLoadStream call was made which provided
//*         more stream data prior to the server being able to fully
//*         process the stream data that it already has, or a
//*         OCIDirPathFinish call was made when the server had
//*         unprocessed stream data.
//* Action: Most likely an application mis-use of the direct path API.
//*         Make sure that the stream is not being reset inadvertently
//*         prior to any previous stream data being processed, or, that
//*         OCIDirPathFinish is not being called prematurely (i.e. stream
//*         pushed, error encountered and LoadStream not called to process
//*         the remainder of the stream before Finish is called.)
26096, 0000, "transfer size too small for row data (%lu bytes required)"
//* Cause:  Either the transfer buffer size specified, or the default
//*         transfer buffer size (if you did not specify a size), is
//*         too small to contain a single row of the converted row data.
//* Action: Set the transfer buffer size attribute of the direct path
//*         context to be larger.
26097, 0000, "unsupported conversion required for column %s"
//* Cause:  The conversion required for the column was not supported. For
//*         example, conversion from date to number was not supported.
//* Action: Ensure that the type is correct for the source and destination.
//*
26098, 0000, "direct path context is not prepared"
//* Cause: A direct path api function was called with a direct path
//*        context which has not been prepared.
//* Action: Make sure all necessary attributes in the direct path
//*         context have been set, and the context is prepared via
//*         OCIDirPathPrepare.
26099, 0000, "direct path context is already prepared"
//* Cause: OCIDirPathPrepare was called with a context that has already
//*        been prepared.
//* Action: Free the direct path context, set necessary attributes, and
//*         call OCIDirPathPrepare.
/
//      26100 - 26110 reserved for tablespace-relative DBA Errors
//
26100, 00000, "unused error"
// *Cause:
// *Action:
26101, 00000, "tablespace # in file header is %s rather than %s for file %s"
// *Cause:  The tablespace number in the file header is inconsistent
//          with that in the control file.
// *Action: Check if the control file has been migrated correctly.  Retry
//          with the correct control file and data file.
26102, 00000, "relative file # in file header is %s rather than %s for file %s"
// *Cause:  The relative file number in the file header is inconsistent
//          with that in the control file.
// *Action: Check if the control file has been migrated correctly.  Retry
//          with the correct control file and data file.
26103, 00000, "V6 or V7 data file used to create control file"
// *Cause:  The file header of the referenced file is in V6 or V7 format.
// *Action: Either remove the file from the create control file command, or
//          somehow migrate the file header to V8 format.
/
/
/ 26500 - 26649 Reserved for Replication (KN)
/
/
26500, 00000, "error on caching \"%s\".\"%s\""
// *Cause: Attempt to cache the replication information which is unavailable
//         in the catalog for the object.
// *Action: Use dbms_reputil.sync_up_rep to validate the replication catalog,
//          or use dbms_reputil.make_internal_pkg to validate internal
//          package.
26501, 00000, "RepAPI operation failure"
// *Cause:  An external RepAPI operation failed.
// *Action: consult detail error message.
26502, 00000, "error resignal"
// *Cause:  An internal service failed and signalled an error"
// *Action: consult detail error message.
26503, 00000, "internal RepAPI operation failure on object %s.%s"
// *Cause:  An unexpected internal RepAPI failure was detected
// *Action: Contact Oracle support.
26504, 00000, "operation not implemented"
// *Cause:  The caller requested a RepAPI operation that was not implemented
// *Action: Do not issue this call.
26505, 00000, "unexpected internal null"
// *Cause:  An internal buffer control structure was NULL
// *Action: Verify that sufficient memory resources are available to RepAPI.
26506, 00000, "null global context"
// *Cause:  An internal buffer control structure was NULL
// *Action: Verify that sufficient memory resources are available to RepAPI.
26507, 00000, "null master connection"
// *Cause:  The master connection handle was or became invalid.
// *Action: Verify that the master connection is valid.
26508, 00000, "null materialized view connection"
// *Cause:  The client connection handle was or became invalid.
// *Action: Verify that the client connection is valid.
26509, 00000, "null materialized view control structure"
// *Cause:  An internal materialized view control structure could not be
//          obtained.
// *Action: Check that the owner and users provided are correct.
26510, 00000, "materialized view name: '%s' is greater than max. allowed length of %s bytes"
// *Cause:  The specified materialized view name was too long.
// *Action: Shorten the materialized view name.
26511, 00000, "master table '%s.%s' not found"
// *Cause:  A RepAPI operation was attempted against a non-existent or
//          invalid master table
// *Action: Verify that the master table object exists.
26512, 00000, "error pushing transaction to def$error"
// *Cause:  An unexpected error occurred while sending an def$error rpc to
//          the master site
// *Action: Verify that the DBMS_DEFER package is valid and executable
//          by the RepAPI client.  Contact the local or master site
//          administrator, if necessary.
26513, 00000, "push error: master proc. %s$RP.%s failed for trans:%s seq:%s"
// *Cause:  A conflict/error occurred at the master site while executing
//          a $RP.rep_insert(), rep_update(), or rep_delete() function which
//          was not handled by conflict resolution logic at the master.
// *Action: Notify master site system adminstrator or DBA.
26514, 00000, "object '%s.%s' not found"
// *Cause:  The specified object was expected but not found.
// *Action: Verify that the specified object exists and is valid.
26515, 00000, "no master log available for '%s.%s'"
// *Cause:  The specified master log was not found or available for the
//          named table.
// *Action: Create the master log at the master site or correct any problems
//          that may exist with the log.
26516, 00000, "no push transaction acknowledgement"
// *Cause:  RepAPI was unable to confirm that the last pushed transaction
//          was successfully commited by the master site.
// *Action: Verify that the communications link between the local site and
//          the master site is still valid.  If the transaction has not been
//          committed at the master, repush the transaction.
26517, 00000, "materialized view control entry for '%s.%s' was not found"
// *Cause:  The specified materialized view catalog control reocrd was not
//          found.
// *Action: Verify that the local materialized view catalog is valid and that
//          the local materialized view is properly defined.
26518, 00000, "push queue synchronization error detected"
// *Cause:  Client tried to repush a transaction has already been committed at
//          the master site.  A common cause of this problem is an error at the
//          local site in initializing or updating the local site transaction
//          sequence mechanism.
// *Action: Verify that transaction data that RepAPI was attempting to
//          repushed to the master site exists at the master table and is
//          valid and consistent with the local site.  If this error occurs,
//          redundantly identified transactions are ignored and then purged
//          from the local updatable materialized view logs.  Check that the
//          local site is correctly assigning new transactionIDs and is not
//          accidently generating non-unique values.
//
26519, 00000, "no memory available to allocate"
// *Cause:  There was no memory left for the RepAPI process.  This error
//          may occur when RepAPI is trying to allocate a new table buffer
//          area.
// *Action: Shutdown one or more local applications to attempt to free
//          heap memory and retry the RepAPI operation.
26520, 00000, "internal memory failure"
// *Cause:  An internal memory error was detected.
// *Action: Check if other errors have occurred or determine if any local
//          application may have corrupted the memory subsystem.
26521, 00000, "rpc initialization error"
// *Cause:  An error occurred during the initialization of a PL/SQL rpc.
// *Action: Verify that the procudure to be invoked exists and is valid
//          at the master site and is executable by the RepAPI user.
26522, 00000, "rpc execution error"
// *Cause: An error occurred during the execution of a PL/SQL rpc.
// *Action: Check the error messages from the remote procedure and fix any
//          remote site problems that may be preventing the execution of the
//          invoked rpc.
26523, 00000, "rpc termination error"
// *Cause:  An error occurred during the termination of a PL/SQL rpc.  This
//          is usually caused by master site being unable to close an
//          opened cursor or if RepAPI cannot deallocate internal memory.
// *Action: Fix any server side problems first, determine if the RepAPI
//          memory subsystem has been corrupted.
26524, 00000, "nls subsystem initialization failure for product=%s, facility=%s"
// *Cause:  The NLS product/facility error message file could not be located or
//          properly initialized.
// *Action: Check that the error message directory and file(s) have been
//          properly installed.
26525, 00000, "session connection attempt failed for %s (@%s)"
// *Cause:  A connection could not be established to the specified database
//          using the provided connection string.
// *Action: Check that the user, password, connect string, names services,
//          network, and any remote site listener process are properly
//          installed and working.
26526, 00000, "materialized view sql ddl parse/expansion failed for %s.%s"
// *Cause:  The client sql materialized view definition query could not be
//          properly parsed by the master Oracle site.
// *Action: Check that materialized view ddl sql is compatible with the
//          currently connected version of Oracle and does not violate any of
//          the RepAPI sql limitations or restrictions.
26527, 00000, "local store callback init phase failed for '%s.%s'"
// *Cause:  The client callback failed during its INIT phase for the
//          named object.
// *Action: Verify that the objects referenced by the client callback exist
//          and are valid.  Refer to the vendor-specific callback error code
//          reference to diagnose the local problem.  Record all error state
//          and notify Oracle support.
26528, 00000, "local store callback proc phase failed for '%s.%s'"
// *Cause:  The client callback failed during its PROC phase for the
//          named object.
// *Action: Refer to the vendor-specific callback error code
//          reference to diagnose the local problem.  Record all error state
//          and notify Oracle support.
26529, 00000, "local store callback term phase failed for '%s.%s'"
// *Cause:  The client callback failed during its TERM phase for the
//          named object.
// *Action: Refer to the vendor-specific callback error code
//          reference to diagnose the local problem.  Record all error state
//          and notify Oracle support.
26530, 00000, "unable to build materialized view refresh control list"
// *Cause:  The materialized view control list could not be constructed. This
//          is generally the result of an error while accessing the local
//          materialized view catalog.
// *Action: Verify that the named materialized view(s) are properly defined
//          and valid.
26531, 00000, "replication parallel push failure recovery test event"
// *Document: NO 
// *Cause: N/A.
// *Action: event used to simulate site failure for parallel push testing.
26532, 00000, "replication parallel push simulated site failure"
// *Cause: A parallel push executed with event 26531 enabled raises this
//         error to simulation failure of network or destination site.
// *Action: Do not enable the event for normal operation.
26534, 00000, "collision: tranID %ld ignored and purged"
// *Cause:  A transaction that was pushed had a transaction ID that collided
//          with a transaction that was previously pushed and committed
//          at the master site.
// *Action: See the action section for E_QUEUESYNC (26518).
26535, 00000, "%ud byte row cache insufficient for table with rowsize=%ud"
// *Cause:  A transaction that was pushed had a transaction ID that collided
//          with a transaction that was previously pushed and committed
//          at the master site.
// *Action: Increase the RepAPI row buffer size or reduce the width of the
//          replicated tables.
26536, 00000, "refresh was aborted because of conflicts caused by deferred transactions"
// *Cause:  There are outstanding conflicts logged in the DEFERROR table at
//          the materialized view's master site.
// *Action: Resolve the conflicts in the master DEFERROR table and refresh
//          again after the table is empty.  Alternatively, refresh with
//          REFRESH_AFTER_ERRORS, even if there are conflicts in the master's
//          DEFERROR table.  Proceeding despite conflicts can result in an
//          updatable materialized view's changes appearing to be temporarily
//          lost, until a refresh succeeds after the conflicts are resolved.
26562, 00000, "last RepAPI error"
26563, 00000, "renaming this table is not allowed"
// *Cause: Attempt to rename a replicated table, an updatable materialized view
//         table or the master table of a materialized view for which a
//         materialized view log has beencreated.
// *Action: If desired, unregister the replicated table with
//          dbms_repcat.drop_master_repobject, or use the recommended
//          procedure to rename the master table of a materialized view.
26564, 00000, "%s argument is not of specified type"
// *Cause: User passed type of the given argument number doesn't match
//         with the type of the argument in the stored arguments.
// *Action: Invoke correct type procedure (i.e. get_XXX_arg)
26565, 00000, "Call to <type>_arg made before calling dbms_defer.call"
// *Cause: User invoked <type>_arg procedure before starting a deferred call
// *Action: Invoke various procedures in the correct order.
26566, 00000, "Couldn't open connect to %s"
// *Cause: Failed to open connection using given dblink
// *Action: Make sure that the dblink is valid and remote m/c is up.
26571, 00000, "%s.%s.%s: number of arguments (%s) does not match replication catalog"
// *Cause: number of arguments does not match replication catalog
// *Action: examine total number of arguments for the rpc call
26572, 00000, "%s.%s.%s: argument %s does not match replication catalog"
// *Cause: the (rpc) call is corrupted
// *Action: examine total number of arguments and each argument for
//          the rpc call
26575, 00000, "remote database does not support replication parallel propagation"
// *Cause: The remote database has a version lower than Oracle 8.0 and hence
//         does not understand replication parallel propagation.
// *Action: Use serial propagation or upgrade the remote database to
//          Oracle 8.0 or above.
26576, 00000, "cannot acquire SR enqueue"
// *Cause:  An attempt to acquire the SR enqueue in exclusive mode failed.
// *Action:
26577, 00000, "PRESERVE TABLE can not be used when dropping old style materialized view %s.%s\n"
// *Cause: The materialized view consists of a view and a container table.
// *Action: Drop the materialized view without PRESERVE TABLE option.
26578, 00000, "No capture in this multitenant container database associated with queue \"%s\"."
// *Cause: An outbound server's queue was not associated with a capture from the same multitenant container database (CDB) before adding or starting an outbound server.
// *Action: Execute the DBMS_STREAMS_ADM.CREATE_CAPTURE procedure to create a capture before adding or starting an outbound server.
/
/
/ 26650 - 26999 Reserved for Log Based Replication Replication (KN)
/
26650, 00000, "%s %s background process %s might not be started successfully"
// *Cause:  An error occurred during creation of a capture or apply
//          background process.
// *Action: Review V$STREAMS_CAPTURE and V$STREAMS_APPLY_COORDINATOR views for
//          the status of these processes. Also check the trace file for more
//          information.
26651, 00000, "Unable to start or stop capture process %s"
// *Cause:  An attempt was made to start or stop a capture process while
//          another capture process was concurrently starting or stopping.
// *Action: You cannot concurrently start or stop capture processes. Wait 
//          before attempting to start or stop additional capture processes.
26652, 00000, "Capture %s did not start properly and is currently in state %s"
// *Cause:  An attempt to restart a capture process failed.
// *Action: Review V$STREAMS_CAPTURE view for the state of the capture
//          process. Also check the trace files for more information. 
26653, 00000, "Apply %s did not start properly and is currently in state %s"
// *Cause:  An attempt to restart an apply process failed.
// *Action: Streams: Review V$STREAMS_APPLY% views for the state of the apply
//          process. Also check the trace files for more information. 
//          XStream: Review V$XSTREAM_APPLY% views for the state of the apply
//          process. Also check the trace files for more information. 
//          GoldenGate: Review V$GG_APPLY% views for the state of the apply
//          process. Also check the trace files for more information. 
26654, 00000, "Capture %s attempted to connect to apply %s already configured for %s"
// *Cause:  An attempt was made by a GoldenGate, XStream or Streams Capture or XStream In to connect to an
//          Apply that is already connected in the other mode.
// *Action: You cannot connect a capture to an apply already configured for  
//          another apply mode. Create or connect to another apply.
26655, 00000, "Invalid %s specified for %s procedure"
// *Cause:  An attempt was made to execute the specified procedure with an 
//          invalid SCN value.
// *Action: Resubmit procedure with a valid SCN value. 
26656, 00000, "supplemental logging version error: %s"
// *Cause:  The supplemental logging versions of capture side and apply side
//          are incompatible.
// *Action: For incompatibility caused by a newer apply side, please bypass or
//          migrate the incompatible logs manually and consider upgrading or
//          patching the capture side. For incompatibility caused by an
//          unrecognizable version group or an older apply side, please
//          upgrade or patch the apply side. For invalid versions, the
//          logs might have been corrupted; please verify the integrity of
//          the supplemental logging data on the capture side.
26660, 00000, "Invalid action context value for %s"
// *Cause:  The value specified in the action context is invalid for
//          use in GoldenGate, XStream or Streams.
// *Action: Check that the type and value are correct.
26661, 00000, "STREAMS tracing event"
// *Document: NO
// *Cause:
// *Action: Check that the type and value are correct.
26662, 00000, "unable to process %s Data Dictonary information for object"
// *Cause:  The database is unable to process GoldenGate, XStream or Streams Data
//          Dictionary for this object. 
// *Action: Check that the compatibility for the database supports the object,
//          and check the trace file for information about the object.
26663, 00000, "error queue for apply process %s must be empty"
// *Cause:  The error queue for this apply process contains error entries.
// *Action: Execute or delete errors in the error queue.
26664, 00000, "cannot create %s process %s"
// *Cause:  An attempt was made to create a GoldenGate, XStream or Streams process
//          when another was being created concurrently.
// *Action: Wait for the creation of the other GoldenGate, XStream or Streams
//          process to finish before attempting to create the process.
26665, 00000, "%s process %s already exists"
// *Cause:  An attempt was made to create a GoldenGate, XStream or Streams process
//          that already exists.
// *Action: Either specify another process or remove the existing
//          GoldenGate, XStream or Streams process.
26666, 00000, "cannot alter %s process %s"
// *Cause:  An attempt was made to alter a GoldenGate, XStream or Streams process
//          that is currently running.
// *Action: Stop the GoldenGate, XStream or Streams process with FORCE parameter
//          set to TRUE and reissue the command.
26667, 00000, "invalid %s parameter %s"
// *Cause:  An attempt was made to specify an invalid parameter.
// *Action: Check the documentation for valid parameters.
26668, 00000, "%s process %s exists"
// *Cause:  An attempt to remove the component failed because it 
//          is associated with the GoldenGate, XStream or Streams process.
// *Action: Either remove the process manually or specify the "cascade" 
//          option in dbms_streams_adm.remove_queue.
26669, 00000, "parameter %s inconsistent with parameter %s"
// *Cause:  An attempt was made to specify a subprogram parameter value
//          that is inconsistent with another parameter value.
// *Action: Check the documentation for valid parameter values.
26670, 00000, "No capture is found for queue '%s'"
// *Cause: An attempt was made to add an XStream outbound server to a 
//         queue using uncommitted data mode when no co-located XStream capture
//         was configured for that queue.
// *Action: Change to committed data mode or configure a local XStream capture 
//         for the specified queue then retry the operation. 
26671, 00000, "maximum number of %s processes exceeded"
// *Cause:  Cannot create additional GoldenGate, XStream or Streams processes since
//          the maximum number of processes has been reached.
// *Action: Remove existing GoldenGate, XStream or Streams processes and retry the operation.
26672, 00000, "timeout occurred while stopping %s process %s"
// *Cause:  Timeout occurred while waiting for a GoldenGate, XStream or Streams
//          process to shut down.
// *Action: Retry the operation. If the error persists, try stopping the
//          process with the FORCE option, or contact Oracle Support Services.
26673, 00000, "duplicate column name %s"
// *Cause:  An attempt was made to specify a duplicate column name in an LCR. 
// *Action: Remove the duplicate column and retry the operation.
26674, 00000, "Column mismatch in '%s.%s' (LCR: %s type=%s; DB: %s type=%s)"
// *Cause:  The columns in the LCR were not the same or not found in the
//          database table.
// *Action: Alter the database table.
26675, 00000, "cannot create %s capture process %s"
// *Cause:  GoldenGate, XStream or Streams capture process could not be created
//          because one or more parameters contain invalid value. 
// *Action: Refer to trace file for more details. 
26676, 00000, "Table '%s.%s' has %s columns in the LCR and %s columns in the replicated site"
// *Cause:  The number of columns in the LCR was not the same as the
//          the replicated site.
// *Action: Alter the table structure
26677, 00000, "%s downstream capture process %s cannot proceed"
// *Cause:  Database global name has been set to a value which is same as the 
//          source database name of the downstream capture process. 
// *Action: Change database  global name to a value other than 
//          the source database name for the downstream capture. 
26678, 00000, "%s downstream capture process for source database %s must be created at database %s first"
// *Cause:  A GoldenGate, XStream or Streams downstream capture process was 
//          nonexistent when this operation was attempted.
// *Action: Create a GoldenGate, XStream or Streams downstream capture process, 
//          then retry the operation.
26679, 00000, "operation not allowed on LOB or LONG columns in LCR"
// *Cause:  Certain operations on LOB/LONG columns of the LCR
//          through rule-based transformations, DML handlers, or error
//          handlers were not allowed.
// *Action: Do not perform restricted operations on LOB or LONG columns in 
//          LCRs. See the documentation for operations that are restricted 
//          on LOB/LONG columns in LCRs.
26680, 00000, "object type not supported"
// *Cause:  The specified object type is not supported.
// *Action: Retry with a supported object type.
26681, 00000, "command type not supported"
// *Cause:  The specified command type is not supported.
// *Action: Retry with a supported command type.
26682, 00000, "invalid value for publication_on"
// *Cause:  The publication_on parameter should be either 'Y' or 'N'
// *Action: Retry with a proper value for publication_on.
26683, 00000, "invalid value for value_type"
// *Cause:  The value_type parameter should be either 'OLD' or 'NEW'
// *Action: Retry with proper value_type.
26684, 00000, "invalid value for value_type"
// *Cause:  The value_type parameter should be one of 'OLD', 'NEW' or '*'
// *Action: Retry with proper value_type.
26685, 00000, "cannot apply transactions from multiple sources"
// *Cause:  Transactions from multiple sources were sent to the same apply
//          process.
// *Action: Create multiple apply processes and create appropriate rules
//          so that transactions from only one source reach an apply
//          process.
26686, 00000, "cannot capture from specified SCN"
// *Cause:  An attempt was made to specify an invalid SCN.
// *Action: Retry with a valid SCN.
26687, 00000, "no instantiation SCN provided for \"%s\".\"%s\" in source database \"%s\""
// *Cause:  Object SCN was not set.  If the object is a table,
//          then both fields will be filled, for example "SCOTT"."EMP".  
//          If the object is a schema, only one field will be set, for
//          example "SCOTT"."".  And if the object is the entire
//          database, no fields will be set, for example ""."".
// *Action: Set the SCN by calling DBMS_APPLY_ADM.SET_%_INSTANTIATION_SCN
26688, 00000, "missing key in LCR"
// *Cause:  Metadata mismatch, or not enough information in the user
//          generated LCR.
// *Action: Alter the database object, or provide all defined keys
//          in the LCR.
26689, 00000, "column datatype mismatch in LCR"
// *Cause:  The datatypes of columns in the LCR are not the same as
//          the datatypes in the database object.
// *Action: Alter the database object.
26690, 00000, "datatype not supported at non-Oracle system"
// *Cause:  One of the columns of the LCR being applied was of a datatype
//          not supported by either the target non-Oracle system or by the
//          Oracle transparent gateway through which the apply is being done.
// *Action: Do not apply data of this type. If possible, filter out
//          columns containing such datatypes before applying.
26691, 00000, "operation not supported at non-Oracle system"
// *Cause:  The apply process attempted an operation that is either
//          not supported by the non-Oracle system or by the Oracle
//          transparent gateway through which the apply is being done. Some
//          kinds of DML (like procedure and function calls) and all DDL
//          will cause this error to be raised.
// *Action: Do not attempt to apply such LCRs to non-Oracle systems. If
//          possible, filter out such LCRs before applying.
26692, 00000, "invalid value %s, %s should be in %s format"
// *Cause:  The parameter specified was not in the correct format.
// *Action: Specify the parameter value in the correct format.
26693, 00000, "%s %s process dropped successfully, but error occurred while dropping rule set %s"
// *Cause:  An attempt to drop an unused rule set failed after dropping the
//          GoldenGate, XStream or Streams proccess successfully.
// *Action: Check existence of rule set and manually drop if necessary.
26694, 00000, "error while enqueueing into queue %s.%s"
// *Cause:  An error occurred while enqueueing a message.
// *Action: If the situation described in the next error on the stack
//          can be corrected, do so.
26695, 00000, "error on call to %s: return code %s"
// *Cause:  A locking related call failed.
// *Action: Try the call again after fixing the condition indicated by
//          the return code.
26696, 00000, "no %s data dictionary for object with number %s and version number %s from source database %s"
// *Cause:  An attempt to access the database object failed because the
//          data dictionary for the object was either never populated
//          or it was purged.
// *Action: Make sure the GoldenGate, XStream or Streams data dictionary is created by calling 
//          DBMS_CAPTURE_ADM.PREPARE_%_INSTANTIATION.
26697, 00000, "LCR contains extra column '%s'"
// *Cause:  The LCR contained more columns than the replicated table.
// *Action: Alter the database object.
26698, 00000, "%s did not have a %s rule set"
// *Cause:  The GoldenGate, XStream or Streams client does not have a rule set of the indicated type.
// *Action: Verify that the GoldenGate, XStream or Streams client has a rule set of the specified
//          type, and retry the operation.
26699, 00000, "%s message consumer %s already exists"
// *Cause:  An attempt was made to create a GoldenGate, XStream or Streams
//          message consumer that already exists.
// *Action: Either specify another message consumer or remove the
//          existing GoldenGate, XStream or Streams message consumer.
26700, 00000, "STREAMS tracing event"
// *Document: NO
// *Cause:
// *Action:
26701, 00000, "%s process %s does not exist"
// *Cause:  An attempt was made to access a GoldenGate, XStream or Streams process
//          which does not exist.
// *Action: Check with the relevant security views for the correct name of
//          the object.
26702, 00000, "shut the STREAMS/CDC apply engine down"
// *Document: NO
// *Cause:
// *Action:
26703, 00000, "event for configuring STREAMS rules cache"
// *Document: NO
// *Cause: Not Applicable
// *Action: Set this event only under the supervision of Oracle support.
26704, 00000, "The Owner instance %s of the queue table is not up or the QMN0 process is down."
// *Cause: 
// *Action: Try again once the owner instance is up, and the QMN0 process on 
//          that instance is up.
26705, 00000, "cannot downgrade capture process after Streams data dictionary has been upgraded"
// *Cause: An attempt was made to downgrade a capture process after it has
//         upgraded the GoldenGate, XStream or Streams data dictionary.
// *Action: Drop the capture process before attempting the downgrade.
26706, 00000, "cannot downgrade capture process"
// *Cause: An attempt was made to downgrade a capture process that has a 
//         higher version than the downgrade release version.
// *Action: Drop the capture process after capture has finished consuming all 
//          the redo logs before attempting the downgrade.
26707, 00000, "STREAMS or_expand complexity"
// *Document: NO
// *Cause: Not Applicable.
// *Action: Set this event only under the supervision of Oracle Support.
26708, 00000, "remote DDL not supported by STREAMS : dblink %s"
// *Cause:  The apply process attempted to apply a DDL LCR via a dblink.
//          This is not supported.
// *Action: Do not attempt to apply DDL LCRs via a dblink. If
//          possible, filter out DDL LCRs before applying.
26709, 00000, "Downstream Capture RFS restart"
// *Cause: Remote file server (RFS) process was restarted to reflect a change
//         in DOWNSTREAM_REAL_TIME_MINE option of the GoldenGate, XStream or Streams capture process.
// *Action: No action required. This is an informational message only.
26710, 00000, "incompatible version marker encountered during Capture"
// *Cause:  Capture process cannot mine redo from a version higher than the 
//          current software release version.
// *Action: Drop and recreate the capture process.
26711, 00000, "remote table does not contain a primary key constraint"
// *Cause:  The master table for remote apply does not constain a primary key
//          constraint or the primary key constraint has been disabled.
// *Action: Create a primary key constraint on the master table or enable the
//          existing constraint.
26712, 00000, "remote object is \"%s\".\"%s\"\@\"%s\""
// *Cause:  See the preceding error message to identify the cause.
//          This message names the remote object, usually a table or view,
//          for which an error occurred when GoldenGate, XStream or Streams tried to access it
//          for remote apply.
// *Action: See the preceding error message.
26713, 00000, "remote object does not exist or is inaccessible"
// *Cause: GoldenGate, XStream or Streams replication could not access the named table
//         or view at a remote database to apply changes.
// *Action: Confirm that the given remote table or view exists and is
//          accessible through the given database link. When using a
//          Heterogeneous Services database link to access a non-Oracle system,
//          it may be necessary to check administration details for
//          network connections at the non-Oracle system.
26714, 00000, "User Error %s encountered during apply process"
// *Cause:  An error was encountered during an apply process.
// *Action:  Query the DBA_APPLY_ERROR view to determine the error and
//           take the appropriate action.
26715, 00000, "time limit reached"
// *Cause:  The specified time limit was reached for the GoldenGate, XStream or Streams process.
// *Action:  Restart the GoldenGate, XStream or Streams process, increasing the TIME_LIMIT
//           parameter if necessary.
26716, 00000, "message limit reached"
// *Cause:  The specified message limit was reached for the Capture process.
// *Action:  Restart the Capture process, increasing the MESSAGE_LIMIT
//           parameter if necessary.
26717, 00000, "SCN limit reached"
// *Cause:  The specified SCN limit was reached for the GoldenGate, XStream or Streams process.
// *Action:  Change the MAXIMUM_SCN parameter, then restart the
//           GoldenGate, XStream or Streams process. 
26718, 00000, "transaction limit reached"
// *Cause:  The specified transaction limit was reached for the Apply process.
// *Action:  Restart the Apply process, increasing the
//           TRANSACTION_LIMIT parameter if necessary.
26719, 00000, "STREAMS tracing event"
// *Document: NO
// *Cause:
// *Action:
26720, 00000, "STREAMS assemble lobs event"
// *Document: NO
// *Cause:
// *Action: 
26721, 00000, "enqueue of the LCR not allowed"
// *Cause:  An apply process attempted to enqueue an LCR with a LONG column.
//          This is not supported.
// *Action: Modify rules or unset the enqueue destination to prevent
//          LCRs with LONG columns from being enqueued by the apply process.
26722, 00000, "STREAMS canonicalization event"
// *Document: NO
// *Cause:
// *Action:
26723, 00000, "user \"%s\" requires the role \"%s\""
// *Cause:  The caller did not have the specified role or called the procedure 
//          from a definer's rights package or procedure. 
// *Action: Grant the specified role to the caller. If the procedure is called 
//          from a definer's rights package or procedure, change the definer's 
//          rights package or procedure to an invoker's rights package or 
//          procedure. 
//          Or grant all the privileges for the specified role explicitly.
26724, 00000, "only SYS is allowed to set the Capture or Apply user to SYS."
// *Cause:  The Capture or Apply user was specified as SYS by a user other
//          than SYS.
// *Action:  Set SYS as the Capture or Apply user while logged in as SYS.
26725, 00000, "cannot downgrade apply handlers"
// *Cause: An attempt was made to downgrade apply handlers that are not
//         associated with a local database object, or the apply handlers
//         are associated with a specific apply process.
// *Action: Drop the associated apply handlers before attempting the downgrade.
26726, 00000, "standby and DOWNSTREAM_REAL_TIME_MINE are incompatible"
// *Cause:  An attempt was made to set the standby database and
//          DOWNSTREAM_REAL_TIME_MINE option of the Oracle GoldenGate, XStream
//          or Oracle Streams capture process on the same database.
// *Action: Do not attempt to set the DOWNSTREAM_REAL_TIME_MINE option for a
//          Oracle GoldenGate, XStream or Oracle Streams capture process on a
//          standby database. Do not attempt to change a database role to
//          standby if there exists a capture process with the
//          DOWNSTREAM_REAL_TIME_MINE parameter set to Y.
26727, 00000, "Cannot alter queue_to_queue property of existing propagation."
// *Cause:  The queue_to_queue property was specified for an existing 
//          propagation.
// *Action: Pass NULL for the queue_to_queue argument.
26728, 00000, "event for configuring STREAMS apply segcol mapping cache"
// *Document: NO
// *Cause: Not Applicable
// *Action: Set this event only under the supervision of Oracle support.
26729, 00000, "event for configuring STREAMS apply destination object cache"
// *Document: NO
// *Cause: Not Applicable
// *Action: Set this event only under the supervision of Oracle support.
26730, 00000, "%s '%s' already exists"
// *Cause: An attempt to use FILE GROUP, FILE GROUP VERSION, or FILE GROUP 
//         FILE failed because the item in question already exists.
// *Action: Remove the object if appropriate and re-attempt the operation.
26731, 00000, "%s '%s' does not exist"
// *Cause: A FILE GROUP, FILE GROUP VERSION, or FILE GROUP FILE was
//         specified that does not exist.
// *Action: Make sure the object exists and re-attempt the operation.
26732, 00000, "invalid file group %s privilege"
// *Cause: The specified privilege number that was specified is invalid.
// *Action: Check specification of dbms_file_group for valid privileges.
26733, 00000, "timed-out waiting for file group lock"
// *Cause: The procedure waited too long while getting a lock to perform a 
//          file group repository operation.
// *Action: Retry the operation.
26734, 00000, "different datafiles_directory_object parameter must be specified"
// *Cause: The attempted operation involved datafiles platform conversion
//         which required the datafiles_directory_object parameter to be
//         specified for placing the converted data files.
// *Action: Retry the operation after specifying a valid
//          datafiles_directory_object parameter. This directory must be 
//          different from the directory objects for any of the datafiles for 
//          the specified file group version.
26735, 00000, "operation not allowed on the specified file group version"
// *Cause: One or more datafiles or export dump file(s) were missing from
//         the specified file group version.
// *Action: Retry the operation after adding all the data files and Data Pump
//          dump file(s) to the specified version.
26736, 00000, "Data Pump error"
// *Cause: A Data Pump error occurred when the procedure performed a 
//         File Group Repository operation.
// *Action: Check the error stack and trace file for error details.
26737, 00000, "version %s already has an export dump file"
// *Cause: A Data Pump dump file was added to a file group version that already
//         has a dump file. 
// *Action: Remove the existing dump file if appropriate, and retry the
//          operation.
26738, 00000, "%s '%s' is not empty"
// *Cause: The FILE GROUP or FILE GROUP VERSION being dropped contained 
//         objects.
// *Action: Remove the child objects, then retry the operation.
26739, 00000, "FILE GROUP tracing event"
// *Document: NO
// *Cause:
// *Action:
26740, 00000, "cannot downgrade because there are file groups"
// *Cause: An attempt was made to downgrade a database that has file groups.
// *Action: Drop all file groups before attempting the downgrade.
26741, 00000, "cannot assemble lobs"
// *Cause: An attempt was made to assemble lobs, but the compatibility
//         of the source database for the LOB information is lower than 10.2.0.
// *Action: Set ASSEMBLE_LOBS to FALSE in the DML or error handler while
//          this handler is processing LOB information from a source
//          database with a compatibility level lower than 10.2.0.
26742, 00000, "Maximum number of ignored transactions exceeded"
// *Cause:  An attempt was made to add more than the allowed number of ignored 
//          transactions.
// *Action:  Please clear the current list of ignored transactions.
26743, 00000, "Streams tracing event"
// *Document: NO
// *Cause:
// *Action:
26744, 00000, "%s capture process \"%s\" does not support \"%s\".\"%s\" because of the following reason:  %s"
// *Cause: GoldenGate, XStream or Streams capture encountered a table with an unsupported
//         property.  The most common reason is an unsupported column
//         data type.  
// *Action:  Revise the Capture rules to skip over the table in
//           question.  One way might be to add a negative rule 
//           excluding changes from the unsupported table from being
//           captured.
//           
//           Streams: Also query the DBA_STREAMS_UNSUPPORTED view to determine
//           which tables are not supported by Streams and for what
//           reason.  Consider adding negative rules for any tables
//           that may be captured, but are present in this view.
//           XStream: Also query the DBA_XSTREAM_OUT_SUPPORT_MODE view to determine
//           which tables are not supported by XStream and for what
//           reason.  Consider adding negative rules for any tables
//           that may be captured, but are present in this view.
//           GoldenGate: Also query the DBA_GOLDENGATE_SUPPORT_MODE view to determine
//           which tables are not supported by GoldenGate and for what
//           reason.  Consider adding EXCLUDETABLE statements for any tables
//           that may be captured, but are present in this view.
//        
//           For potential workarounds to certain unsupported properties, see
//           Metalink.
26745, 00000, "cursors (%s) are not sufficient"
// *Cause: The maximum number of open cursors was too small for GoldenGate, XStream or Streams Apply.
// *Action: Increase the value of open_cursors.
26746, 00000, "DDL rule \"%s\".\"%s\" not allowed for this operation"
// *Cause: A DDL rule was specified for this operation.
// *Action: Specify a non-DDL rule for this operation.
26747, 00000, "The one-to-many transformation function %s encountered the following error:  %s"
// *Cause: The specified transformation function encountered an error.
// *Action: Ensure that the function does not process or return DDL LCRs.  
//          Also ensure that the function does not return NULL.  
26748, 00000, "The one-to-one transformation function %s encountered the following error:  %s"
// *Cause: The specified transformation function encountered an error.
// *Action: Ensure that the function does not return an LCR that has a 
//          different type from the LCR which was passed to the function.  
//          Also ensure that the function does not return NULL.  
//          For DDL transformation functions, creating and returning a
//          new DDL LCR is not allowed. 
26749, 00000, "STREAMS propagation batch size"
// *Document: NO
// *Cause:
// *Action:
26750, 00000, "STREAMS internal transformation"
// *Document: NO
// *Cause:
// *Action:
26751, 00000, "STREAMS testing event"
// *Document: NO
// *Cause:
// *Action: Check that the type and value are correct.
26752, 00000, "Unsupported LCR received for \"%s\".\"%s\""
// *Cause:  GoldenGate, XStream or Streams capture process received an LCR with unsupported
//          operation from LogMiner.
// *Action: Stream:If this object is listed in DBA_STREAMS_UNSUPPORTED view,
//          modify rules to prevent changes made to this object from
//          getting captured.
//          XStream: If this object is listed in DBA_XSTREAM_OUT_SUPPORT_MODE view,
//          modify rules to prevent changes made to this object from
//          getting captured.
//          GoldenGate: If this object is listed in DBA_GOLDENGATE_SUPPORT_MODE view,
//          modify rules to prevent changes made to this object from
//          getting captured.
26753, 00000, "Mismatched columns found in '%s.%s'"
// *Cause:  The columns in the LCR were not the same as the table in the
//          database.
// *Action: Alter the database table.
26754, 00000, "cannot specify both one-to-one transformation function %s and one-to-many transformation function %s"
// *Cause:  Both a one-to-one transformation function and a one-to-many
//          transformation function were specified for a rule.
// *Action: Remove either the one-to-one transformation function, or the
//          one-to-many transformation function.
26755, 00000, "STREAMS apply spill table partitioning event"
// *Document: NO
// *Cause:
// *Action:
26756, 00000, "STREAMS apply spill table partition ceiling event"
// *Document: NO
// *Cause:
// *Action:
26757, 00000, "Timed out waiting for remote operation on instance %s to finish"
// *Cause: 
// *Action: Retry the operation at a later time.
26758, 00000, "%s skip LCR requested"
// *Document: NO
// *Cause: Internal error to handle skip LCR event.
// *Action:
26759, 00000, "Maximum number of skip LCR requests exceeded"
// *Document: NO
// *Cause:
// *Action:
26760, 00000, "Could not find message number %s for transaction with id %s"
// *Cause: Error
// *Action: Contact Oracle support"
26761, 00000, "Standby Redo Logs not available for real time mining"
// *Cause: Standby Redo Logs required for real time mining by downstream 
//         capture process were not available.
// *Action: Check the configuration of Standby Redo Logs and retry the 
//          operation at a later time. To start the capture process without
//          real time mining property, reset DOWNSTREAM_REAL_TIME_MINE
//          parameter of the capture process and retry the operation. 
26762, 00000, "Cannot autogenerate name for parameter %s because of the following reason:  %s"
// *Cause:  An error was encountered while attempting to generate a name for
//          a parameter which was passed a NULL value.
// *Action: If possible, fix the error, otherwise specify the
//          parameter name explicitly.
26763, 00000, "invalid file type \"%s\""
// *Cause: An invalid file type was specified for the ASM file.
// *Action: Check documentation for valid ASM file types.
26764, 00000, "invalid parameter \"%s\" for local capture \"%s\""
// *Cause: An invalid parameter was specified for the local capture process.
// *Action: Check documentation for valid parameters.
26765, 00000, "invalid parameter \"%s\" for downstream capture \"%s\""
// *Cause: An invalid parameter was specified for the downstream capture 
//         process.
// *Action: Check documentation for valid parameters.
26766, 00000, "Unexpected redo pattern encountered by LogMiner"
// *Cause: LogMiner encountered an unexpected redo pattern. This is usually 
//         caused by tables with unsupported data types or newer table features.
// *Action: Remove the capture rule for the table and restart capture. 
26767, 00000, "Not enough redo log information for LogMiner"
// *Cause: Direct-path SQL with NOLOGGING option or a SQL*Loader operation with 
//         UNRECOVERABLE clause was specified for the table.
// *Action: Remove the capture rule for the table and restart capture. 
26768, 00000, "Maximum number of unsupported tables exceeded"
// *Cause: An attempt was made to add more than the allowed number of
//         unsupported tables.
// *Action: Clear the current list of unsupported tables.
26769, 00000, "STREAMS force lob assembly event"
// *Document: NO
// *Cause:
// *Action: 
26770, 00000, "Index-organized table not supported"
// *Cause: 
// *Action: 
26771, 00000, "User-defined column type not supported"
// *Cause: 
// *Action: 
26772, 00000, "Encrypted column not supported"
// *Cause: 
// *Action: 
26773, 00000, "Invalid data type for column \"%s\""
// *Cause: 
// *Action: 
26774, 00000, "Queue table not supported"
// *Cause: 
// *Action: 
26775, 00000, "Temporary table not supported"
// *Cause: 
// *Action: 
26776, 00000, "Subordinate object not supported"
// *Cause: 
// *Action: 
26777, 00000, "External table not supported"
// *Cause: 
// *Action: 
26778, 00000, "File column not supported"
// *Cause: 
// *Action: 
26779, 00000, "Materialized view not supported"
// *Cause: 
// *Action: 
26780, 00000, "Object table not supported"
// *Cause: 
// *Action: 
26781, 00000, "Nested table not supported"
// *Cause: 
// *Action: 
26782, 00000, "Function-based index not supported"
// *Cause: 
// *Action: 
26783, 00000, "Column data type not supported"
// *Cause: 
// *Action: 
26784, 00000, "STREAMS internal event"
// *Document: NO
// *Cause:
// *Action: Check that the type and value are correct.
26785, 00000, "Object has a NULL value"
// *Cause: A method was invoked on a NULL object.
// *Action: Initialize the object with a non-NULL value.
26786, 00000, "A row with key %s exists but has conflicting column(s) %s in table %s"
// *Cause: The row to update or delete exists in the table but had 
//         conflicting value for some columns.
// *Action: For Streams and XStream, please define a conflict resolution, or resolve the
//          conflict and execute the error transaction using
//          DBMS_APPLY_ADM.EXECUTE_ERROR.
//          For logical standby, please verify the status of the database guard 
//          to ensure local modifications are not allowed, then re-instantiate
//          the table and contact support if the problem persists.
//          For GoldenGate, configure Conflict Resolution (CDR) or REPERROR handler
//          for the table and restart replicat.
26787, 00000, "The row with key %s does not exist in table %s"
// *Cause: The row to update or delete does not exist in the table.
// *Action: For Streams and XStream, please define a conflict resolution, or resolve the 
//          conflict and execute the error transaction using
//          DBMS_APPLY_ADM.EXECUTE_ERROR.
//          For logical standby, please verify the status of the database guard 
//          to ensure local modifications are not allowed, then re-instantiate
//          the table and contact support if the problem persists.
//          For GoldenGate, configure Conflict Resolution (CDR) or REPERROR handler
//          for the table and restart replicat.
26788, 00000, "The column %s is not encrypted in the local database."
// *Cause: The column in the destination database is NOT encrypted while
//         it is encrypted in the source database.
// *Action: Set the corresponding column property in the destination database to
//          'encrypted' or change the apply parameter, PRESERVE_ENCRYPTED_COLS, 
//          to 'N' to supress the error.
26789, 00000, "Cannot split propagation %s because only one propagation originates from its source queue \"%s\".\"%s\""
// *Cause: Only one propagation originated from the propagation source queue.
// *Action: Please do not split this propagation.
26790, 00000, "Requesting a lock on %s \"%s\" timed out"
// *Cause: Could not get a lock on the object because another process was
//         holding the lock.
// *Action: Please try later.
26791, 00000, "Cannot split or merge propagation \"%s\""
// *Cause:  A process tried to split or merge this propagation, but failed and
//          left STREAMS in an inconsistent state.
// *Action: Query DBA_RECOVERABLE_SCRIPT_BLOCKS view, and roll back the script 
//          which tried to split or merge this propagation.
26792, 00000, "Invalid source database name %s"
// *Cause: The value for the source database global name was not valid.
// *Action: Specify a valid database global name. If the source database 
//         is not the local database, check the listener is up and running.
26793, 00000, "Number of capture processes that enqueued message to queue \"%s\".\"%s\" not equal to one"
// *Cause: Split-merge API requires only one capture process enqueued message
//         to the queue where the propagation originated
// *Action: Please drop one capture, or split or merge another propagation.
26794, 00000, "Hierarchically enabled tables not supported"
// *Cause: Hierarchically enabled tables are not supported.
// *Action: Disable hierarchy for the table.
26795, 00000, "Cannot modify an LCR received from an XStream outbound server"
// *Cause: An attempt was made to modify an LCR generated by an XStream outbound
//         server.
// *Action: Clone the LCR generated by the XStream outbound server by 
//          using the provided OCILCR* functions, such as OCILCRNew,
//          OCILCRHeaderSet, and OCILCRRowColumnInfoSet. Then modify the 
//          cloned LCR.
26796, 00000, "STREAMS excessive IO event"
// *Document: NO
// *Cause:
// *Action:
26798, 00000, "LOB logical change record (LCR) missing LOB column in table \"%s\".\"%s\""
// *Cause: The apply slave could not fill update LOB because of missing LOB column.
// *Action: Check that all LOB columns have been sent correctly.
26799, 00000, "unique constraint %s.%s violated for table %s.%s with column values %s"
// *Cause: The row to update or insert violated the unique constraint.
// *Action: For XStreams, define a conflict resolution, or resolve the 
//          conflict and execute the error transaction using
//          DBMS_APPLY_ADM.EXECUTE_ERROR.
26800, 00000, "Apply not the only subscriber for \"%s\".\"%s\"."
// *Cause: The combined capture and apply optimization could not be used
//         since Apply was not the lone subscriber to the queue.
// *Action: Apply has to be the only subscriber to the queue.
26801, 00000, "More than one subscriber for \"%s\".\"%s\"."
// *Cause: Multiple subscribers were found when the combined capture and apply 
//         optimization was configured to only work for one subscriber.
// *Action: Configure a single subscriber, apply or propagation for the queue,
//          or enable the optimization for multiple subscribers.
26802, 00000, "Queue \"%s\".\"%s\" has messages."
// *Cause: The combined capture and apply optimization could not be used
//         since the queue had messages.
// *Action: Make sure queue is empty before starting apply and capture.
26803, 00000, "Subscribers have changed for queue \"%s\".\"%s\"."
// *Cause: The combined capture and apply optimization could not be used
//         since the subscribers had changed.
// *Action: Optimization can be used only if the queue has a single subscriber. 
26804, 00000, "Apply \"%s\" is disabled."
// *Cause: The apply process was disabled or aborted.
// *Action: Start the apply process.
26805, 00000, "Queue \"%s\".\"%s\" has rule based subscribers."
// *Cause: The combined capture and apply optimization could not be used
//         since the queue had rule based subscribers.
// *Action: Make sure queue has no rule based subscribers before starting 
//          apply and capture.
26806, 00000, "Remote database could not support combined capture and apply optimization."
// *Cause: The remote database has a version lower than Oracle 11.0 and hence
//         does not understand combined capture and apply optimization.
// *Action: Upgrade the remote database to Oracle 11.0 or above in order to
//          use the combined capture and apply optimization.
26807, 00000, "Database link is not NULL for Apply with the name \"%s\" ."
// *Cause: The combined capture and apply optimization could not be used
//         since apply_database_link was not NULL.
// *Action: Drop and recreate the apply with NULL value for apply_database_link.
26808, 00000, "Apply process %s died unexpectedly."
// *Cause: Apply process died unexpectedly.
// *Action: Check your system for anomalies and restart apply.
//          If this error persists, contact Oracle Support Services.
//          See trace file for more details.
26809, 00000, "Capture aborted: checkpoint-free mode requires combined capture and apply mode."
// *Cause: The requirements for combined capture and apply mode were broken.
// *Action: Restore the combined capture and apply mode and then
//          restart the capture. If combined capture and apply mode is no 
//          longer desired, drop the existing checkpoint-free capture and 
//          create another one that will take checkpoints.
26810, 00000, "Apply \"%s\" on database \"%s\" is in the mode of combined capture and apply."
// *Cause: The combined capture and apply optimization could not be used
//         because Apply was already in the mode of combined capture and
//         apply.
// *Action: Do not configure two captures for one apply.
26811, 00000, "Client has already attached to %s apply \"%s\"."
// *Cause: The client has already attached to the specified apply process. 
// *Action: Detach apply process before reattach.
26812, 00000, "An active session currently attached to XStream server \"%s\"."
// *Cause: An attempt was made to attach to the specified XStream server while
//         another session was attached to it.
// *Action: Retry when there is no session attaching to the specified XStream 
//          server.
26813, 00000, "The value for argument \"ARRAY_SIZE\" is too small"
// *Cause: The value for argument "ARRAY_SIZE" was less than the number of 
//         columns in the requested column list.
// *Action: Check the return value for "NUM_COLUMNS" parameter then allocate
//          all input arrays to at least that size and invoke the same
//          OCI function again.
26814, 00000, "The value for argument %s exceeds maximum %s"
// *Cause: The value for specified value exceeded the maximum allowed.
// *Action: Correct the value of specified argument.
26815, 00000, "Error from Apply Network Receiver for Apply \"%s\" and Capture \"%s\"."
// *Cause: The Apply Network Receiver aborted due to an unexpected error.
// *Action: Query DBA_APPLY_ERROR to determine the error and then restart
//          the Capture and Apply.
/
26816, 00000, "%s apply process \"%s\" (OS id %s) is exiting due to ORA-%s."
// *Cause: An apply process encountered an unexpected error.
// *Action: Query DBA_APPLY to examine the status of Apply and
//          restart Apply if needed.
/
26817, 00000, "%s capture process \"%s\" is unable to communicate with capture server %s during initialization."
// *Cause: Capture server might not be started properly
// *Action: Fix any errors during capture server creation and re-start capture process
/
26818, 00000, "%s capture process %s receives an error from capture server."
// *Cause: Capture server received an error.
// *Action: Check log for error details.
/
26819, 00000, "%s capture server for apply \"%s\" and capture \"%s\"encounters disabled or aborted propagation \"%s\"."
// *Cause: Propagation was disabled or aborted.
// *Action: Start propagation.
/
26820, 00000, "%s capture server for apply \"%s\" and propagation \"%s\" becomes active and needs join capture process \"%s\"."
// *Cause: Capture server was waiting for propagation or apply to start
// *Action: Capture process needs restart (done automatically).
/
26821, 00000, "No propagation process found between source queue \"%s\".\"%s\" and destination queue \"%s\".\"%s\"."
// *Cause: Propagation has not been configured.
// *Action:  Configure a propagation between specified queues and restart capture.
/
26822, 00000, "Failure in creating capture servers (ksv error code %s)."
// *Cause: Failure in ksv slave creation.
// *Action: Identify the actual ksv error and act accordingly.
/
26823, 00000, "%s capture server %s is unable to communicate with capture process \"%s\"."
// *Cause: Capture process was not started properly or was aborted.
// *Action: If Oracle GoldenGate, XStream or Streams capture process was stopped, then restart the 
//          capture process. Otherwise, fix any errors during the capture 
//          process creation and restart the capture process.
/
26824, 00000, "user-defined XStream callback error"
// *Cause:  A value other than OCI_CONTINUE or OCI_SUCCESS was returned for 
//          the user-defined XStream callback function. Any returned value 
//          other than OCI_CONTINUE or OCI_SUCCESS is invalid.
// *Action: Verify that either OCI_CONTINUE or OCI_SUCCESS is returned from 
//          the user-defined XStream callback function.
/
26825, 00000, "STREAMS process \"%s\" is not configured as an XStream outbound server."
// *Cause: An attempt was made to attach to a STREAMS apply process, which was 
//         not configured as an XStream outbound server.
// *Action: Check the apply name or re-create the apply process as an XStream 
//         outbound server.
/
26826, 00000, "%s apply coordinator and apply slave are unable to communicate."
// *Cause: GoldenGate, XStream or Streams Apply process may have died unexpectedly.
// *Action: Check your system for anomalies and restart apply.
//          If this error persists, contact Oracle Support Services.
//          See trace file for more details.
/
26827, 00000, "Insufficient privileges to attach to XStream outbound server \"%s\"."
// *Cause: Sufficient privileges were not granted to attach to the specified
//         XStream outbound server.
// *Action: Query DBA_XSTREAM_OUTBOUND view to get the connect_user value for 
//         the specified outbound server. Then modify the application to 
//         connect to the outbound server's database using this value.
/
26828, 00000, "XStream outbound server \"%s\" requires combined capture and apply mode."
// *Cause: The specified XStream outbound server was not in combined capture 
//         and apply mode.
// *Action: Restore the combined capture and apply mode and then
//          restart the capture. 
/
26829, 00000, "Cannot set \"DISABLE_ON_ERROR\" parameter to 'N'." 
// *Cause: An attempt was made to change the "DISABLE_ON_ERROR" parameter for 
//         an XStream outbound server to 'N'.
// *Action: Remove invalid statement.
/
26830, 00000, "Cannot define handler for an XStream outbound server."
// *Cause: An attempt was made to define a handler for an XStream outbound 
//         server.
// *Action: Remove invalid statement.
/
26831, 00000, "Cannot delete or execute error transaction from XStream outbound server \"%s\"."
// *Cause: An attempt was made to delete or execute an error transaction
//         from the specified XStream outbound server.
// *Action: Remove invalid statement.
/
26832, 00000, "Unable to create XStream outbound server \"%s\" due to existing handler."
// *Cause: An attempt was made to create the specified XStream outbound server
//         while there was a handler defined for the specified server.
// *Action: Use DBMS_APPLY_ADM.SET_DML_HANDLER procedure to remove all
//          handlers defined on the specified server then retry statement.
/
26833, 00000, "%s failed to update acknowledgment SCN for propagation \"%s\" from capture \"%s\" to apply \"%s\"."
// *Cause: propagation might have been modified after GoldenGate, XStream or Streams was started.
// *Action: Ensure propagation is configured properly and restart GoldenGate, XStream or Streams.
/
26834, 00000, "Unable to alter parameter '%s' because %s capture process is not configured to run locally" 
// *Cause: An attempt was made to alter the specified capture parameter when 
//         the GoldenGate, XStream or Streams capture process was not configured to run on the local 
//         database.
// *Action: Remove the invalid parameter or use DBMS_CAPTURE_ADM.ALTER_CAPTURE
//          procedure to alter the parameter.
/
26835, 00000, "The source database for XStream outbound server \"%s\" is invalid"
// *Cause: An attempt was made to add an XStream outbound server with a
//         source database that was different from the associated capture's 
//         source database. 
// *Action: Correct the value for the 'source_database' parameter in the call.
/
26836, 00000, "The specified rules must be created from the same subsetting condition"
// *Cause: An attempt was made to remove an outbound server's subset rules
//         when the specified INSERT, UPDATE, and DELETE rules were not
//         created from the same subsetting condition.
// *Action: Correct the rules in the statement.
/
26837, 00000, "Server \"%s\" is not an XStream inbound server"
// *Cause: An attempt was made to execute a procedure not appropriate on
//         an XStream inbound server.
// *Action: Replace with a procedure appropriate for an XStream inbound server
//          and resubmit.
/
26838, 00000, "Setting apply parameter \"%s\" is not permitted for XStream Outbound Server"
// *Cause: An attempt was made to set an apply parameter that was not applicable 
//         for XStream Outbound Server.
// *Action: Configure XStream Outbound Server using valid parameters. Check the
//          documentation for valid parameter values.
/
26839, 00000, "Apply tag for apply \"%s\" is not permitted for XStream Outbound Server"
// *Cause: An attempt was made to set an apply tag that was not applicable 
//         for XStream Outbound Server.
// *Action: Do not set the apply tag when using XStream Outbound Server.
/
26840, 00000, "Combined capture and apply optimization is disabled because %s is unable to identify an apply for the source database \"%s\"."
// *Cause: There were multiple Streams apply processes using the same queue 
//         which made combined capture and apply (CCA) optimization not 
//         possible.  
// *Action: If Streams performance is an issue, check the 
//         "Combined Capture and Apply Optimization" chapter in the 
//         "Oracle Streams Concepts and Administration" book. Then reconfigure
//         the Streams processes to meet this optimization's requirements.
/
26841, 00000, "No subscribers are found for queue \"%s\".\"%s\"." 
// *Cause: No propagation or apply was configured for the specified queue.
// *Action: Configure propagation or apply for the specified queue.
/
26842, 00000, "Setting apply directive \"%s\" is not permitted for XStream Outbound Server"
// *Cause: An attempt was made to set an apply directive that was not applicable 
//         for XStream Outbound Server.
// *Action: Configure XStream Outbound Server using valid directives. Check the
//          documentation for valid directives.
/
26843, 00000, "Local propagation \"%s\" found for capture queue \"%s\".\"%s\"."
// *Cause: The combined capture and apply optimization could not be used
//         because a local propagation was attached to the capture queue.
// *Action: Remove the local propagation and restart capture.
/
26844, 00000, "Found \"%s\" active automatic split jobs for %s Capture \"%s\" in DBA_STREAMS_SPLIT_MERGE"
// *Cause: Only one active split job is allowed for each GoldenGate, XStream or Streams Capture, but
//         multiple active automatic split jobs were found in
//         DBA_STREAMS_SPLIT_MERGE.
// *Action: Check trace to see how the jobs were submitted and drop them.
/
26845, 00000, "Found \"%s\" active split rows with the same cloned %s Capture \"%s\" in DBA_STREAMS_SPLIT_MERGE"
// *Cause: In DBA_STREAMS_SPLIT_MERGE, for active split rows, the column
//         CLONED_CAPTURE_NAME should be unique.  However, multiple rows were
//         found whose ACTION_TYPE column is 'SPLIT', ACTIVE column is 'ACTIVE'
//         and have the same CLONED_CAPTURE_NAME.
// *Action: Check trace to see how the rows were inserted and call
//          DBMS_STREAMS_ADM.RECOVER_OPERATION() for error recovery.
/
26846, 00000, "Found \"%s\" active automatic merge jobs for cloned %s Capture \"%s\" in DBA_STREAMS_SPLIT_MERGE"
// *Cause: Only one active merge job is allowed for each cloned GoldenGate, XStream or Streams Capture
//         , but multiple active automatic merge jobs were found in
//         DBA_STREAMS_SPLIT_MERGE.
// *Action: Check trace to see how the jobs were submitted and drop them.
/
26847, 00000, "Found invalid %s type: \"%s\""
// *Cause: Invalid GoldenGate, XStream or Streams type to split off was found.  Type should
//         only be 'PROPAGATION'(1) or 'APPLY'(2).
// *Action: Check trace to see how the invalid GoldenGate, XStream or Streams type was created and
//          correct it.
/
26848, 00000, "Split a nonexistent Streams Capture process \"%s\" in job \"%s\""
// *Cause: The job attempted to split a non-existent original Streams Capture.
// *Action: Drop the split job, or wait until the Streams Capture comes to
//          existence.
/
26849, 00000, "Split a nonsplittable %s Capture process \"%s\" in job \"%s\""
// *Cause: The job tried to split a GoldenGate, XStream or Streams Capture that was not splittable.
//         That is, the Capture either had less than two subscribers,
//         or it was not the only Capture of its queue.
// *Action: Drop the split job, or wait untill the GoldenGate, XStream or Streams Capture becomes
//          splittable.
/
26850, 00000, "Changes to queue subscribers were detected by %s capture process."
// *Cause: The subscribers for capture queue might have changed.
// *Action:  Capture process will restart automatically.
/
26851, 00000, "Unable to connect to apply \"%s\" because it has connected to another capture."
// *Cause: Another capture process is already connected to apply.
// *Action: Wait for the connected capture process to terminate or
//          abort the connected capture process.
/
26852, 00000, "Invalid NULL value for column_value parameter."
// *Cause:  NULL is not allowed to be passed as the column value.
// *Action: Replace NULL with a proper AnyData instance containing NULL,
//          e.g., sys.AnyData.ConvertVarchar2(NULL), as the column 
//          value if the column value is NULL.
//
/
26853, 00000, "invalid cca maximum percentage %s"
// *Cause: Specified percentage value was not in range 0 - 100.
// *Action: Specify a percentage value in the range 0 - 100.
/
26854, 00000, "%s %s has no enqueue or dequeue privileges to the queue."
// *Cause:  The GoldenGate, XStream or Streams user did not have enqueue or dequeue
//          privilege to the queue.
// *Action: Grant GoldenGate, XStream or Streams user enqueue or dequeue privileges to the queue.
/
26855, 00000, "%s %s has insufficient database privilege to access the queue."
// *Cause:  The GoldenGate, XStream or Streams user did not have sufficient database privilege to 
//          access the queue.
// *Action: Grant GoldenGate, XStream or Streams user database privileges to access the queue.
/
26856, 00000, "STREAMS %s has insufficient database privilege to access the queue."
// *Cause:  The GoldenGate, XStream or Streams user did not have sufficient database privilege to 
//          access the queue.
// *Action: Grant GoldenGate, XStream or Streams user database privileges to access the queue.
/
26857, 00000, "LCR position cannot be null (XID=%s)."
// *Cause:  The position of an LCR in the specified transaction was null.
// *Action: Use OCILCRHeaderSet to define the LCR position. 
/
26858, 00000, "LCR position must be strictly increasing (XID='%s', LCR position='%s', previous position='%s')."
// *Cause:  The position of an LCR in the specified transaction was less than or
//          equal to the previous LCR in transaction.
// *Action: Use OCILCRHeaderSet to correct the LCR position. 
/
26859, 00000, "Server \"%s\" is not an XStream outbound server"
// *Cause: An attempt was made to execute a procedure not appropriate on
//         an XStream outbound server.
// *Action: Replace with a procedure appropriate for an XStream outbound server
//          and resubmit.
/
26860, 00000, "Different transactions must have different transaction IDs (XID='%s', LCR position='%s', previous commit position='%s')."
// *Cause:  The position of an LCR in the specified transaction was greater than the position
//          of the previous commit LCR in transaction with same transaction ID.
// *Action: Use different transaction IDs for different transactions. 
/
26861, 00000, "XStream testing"
// *Document: NO
// *Cause:
// *Action:
26862, 00000, "LCR position must be greater than the processed low position of the XStream inbound server (XID='%s', LCR position='%s')."
// *Cause:  The position of an LCR in the specified transaction 
//          was less than or equal to the processed low postion of the 
//          XStream inbound server.
// *Action: Use OCILCRHeaderSet to correct the LCR position. 
/
26863, 00000, "Job \"%s\" showing as an active job in DBA_STREAMS_SPLIT_MERGE does not exist in DBA_SCHEDULER_JOBS."
// *Cause: An active job showing in DBA_STREAMS_SPLIT_MERGE did not exist.
//         It may have been dropped accidently or something was wrong with it.
// *Action: Check trace to identify the problem and call
//          DBMS_STREAMS_ADM.RECOVER_OPERATION() for error recovery.
/
26864, 00000, "Error occurred in %s automatic job: \"%s\""
// *Cause: An error has happened inside GoldenGate, XStream or Streams automatic job.
// *Action: Check trace for more detail.
/
26865, 00000, "must send a COMMIT LCR to end transaction '%s' before sending another transaction"
// *Cause: An attempt was made by a client application to send LCRs for a 
//         new transaction before sending a COMMIT LCR for the specified 
//         transaction.
// *Action: Modify the client application to send a COMMIT LCR at the end 
//          of the specified transaction.
/
26866, 00000, "The Queue of %s Apply process \"%s\" is not changeable."
// *Cause: Not all of the conditions for the Queue of a GoldenGate, XStream or Streams Apply process
//         to be changeable were met. Conditions are: -The Apply process is not
//         running. -The Apply process has no error. -The Apply process has no
//         spilling. -The Apply process is not used for XStream Outbound or
//         Inbound Servers.  -The Apply process is a local Apply process. -The
//         corresponding GoldenGate, XStream or Streams Capture process should be stopped.
// *Action: Make sure all of the conditions are met.
/
26867, 00000, "%s must be called during OCIXStreamOutLCRReceive execution"
// *Cause:  An attempt was made to execute the specified function while
//          OCIXStreamOutLCRReceive call was not in progress.
// *Action: Check your program and make sure the specified call is invoked
//          during OCIXStreamOutLCRReceive callback function.
/
26868, 00000, "%s must be called during OCIXStreamInLCRSend execution"
// *Cause:  An attempt was made to execute the specified function while
//          OCIXStreamInLCRSend call was not in progress.
// *Action: Check your program and make sure the specified call is invoked
//          during OCIXStreamInLCRSend callback function.
/
26869, 00000, "must attach to an XStream inbound server before executing %s function"
// *Cause:  An attempt was made to invoke the specified function
//          before executing OCIXStreamInAttach call.
// *Action: Add OCIXStreamInAttach call before the specified function.
/
26870, 00000, "cannot call %s while OCIXStreamInLCRCallbackSend call is still executing."
// *Cause:  An attempt was made to invoke the specified call while
//          OCIXStreamInLCRCallbackSend call was executing.
// *Action: Check your program and remove the specified call when there is an
//          OCIXStreamInLCRCallbackSend call in progress.
/
26871, 00000, "unexpected %s call (expecting %s)"
// *Cause:  Could be one of the following reasons:
//          1) An attempt was made to invoke OCIXStreamInChunkSend when
//          the most recent LCR or chunk sent did not have the
//          OCI_XSTREAM_MORE_ROW_DATA flag set; 
//          2) An attempt was made to invoke OCIXStreamInLCRSend when
//          the most recent LCR or chunk sent had OCI_XSTREAM_MORE_ROW_DATA 
//          flag set.
26872, 00000, "must attach to an XStream outbound server before executing %s function"
// *Cause:  An attempt was made to invoke the specified function
//          before executing OCIXStreamOutAttach call.
// *Action: Add OCIXStreamOutAttach call before the specified function.
/
26873, 00000, "cannot call %s while OCIXStreamOutLCRCallbackReceive call is still executing."
// *Cause:  An attempt was made to invoke the specified call while
//          OCIXStreamOutLCRCallbackReceive call was executing.
// *Action: Check your program and remove the specified call when there is an
//          OCIXStreamOutLCRCallbackReceive call in progress.
/
26874, 00000, "%s Capture process \"%s\" cannot be split."
// *Cause: An attempt was made to split a GoldenGate, XStream or Streams Capture process that could not be split.
//         That is, the Capture process either had less than two subscribers,
//         or it was not the only Capture process of its queue.
// *Action: Wait until the GoldenGate, XStream or Streams Capture process can be split.
/
26875, 00000, "Timeout while %s automatic split job \"%s\" waits for the subscriber \"%s\" of Capture process \"%s\" to acknowledge split"
// *Cause: To split a subscriber of a GoldenGate, XStream or Streams Capture process, an automatic
//         split job needs to wait until the subscriber acknowledges the split.
//         The wait timed out.
// *Action:
/
26876, 00000, "invalid processed low-watermark (current position=%s; new position=%s)"
// *Cause:  An attempt was made to set the processed low-watermark to a value
//          that was less than the current processed low-watermark.
// *Action: Correct the processed low-watermark in OCIXStreamOutProcessedLWMSet
//          call.
/
26877, 00000, "must reattach after an OCIXStreamOut call was interrupted"
// *Cause:  An attempt was made to execute another OCIXStreamOut API when 
//          an earlier call was interrupted because the XStream outbound
//          server was disabled or the client requested cancellation of 
//          the operation.
// *Action: Execute OCIXStreamOutAttach call to reattach to the same XStream 
//          outbound server.
/
26878, 00000, "inconsistent input LCR (LCR is '%s' type, expecting '%s')"
// *Cause:  An attempt was made to send an LCR that was not consistent with
//          the specified LCR type.
// *Action: Correct your application to specify an LCR type that agrees with
//          the LCR to be sent.
/
26879, 00000, "\"SET_ENQUEUE_DESTINATION\" directive is not permitted on rules used by XStream outbound server \"%s\""
// *Cause:  One or more rules, used by the specified XStream outbound server,
//          had SET_ENQUEUE_DESTINATION directive defined.
// *Action: Execute the following: 
//   1) Execute query
//       SELECT xr.rule_owner, xr.rule_name, xr.rule_set_owner, 
//              xr.rule_set_name
//       FROM dba_apply_enqueue e, dba_xstream_rules xr 
//        WHERE e.rule_owner = xr.rule_owner AND e.rule_name = xr.rule_name
//        AND xr.streams_name = <specified outbound server>; 
//   2) For each rule returned, execute DBMS_APPLY_ADM.SET_ENQUEUE_DESTINATION 
//      procedure to set the destination queue to null, or execute 
//      DBMS_RULE_ADM.REMOVE_RULE to remove that rule from its associated
//      rule set. 
/
26880, 00000, "\"SET_EXECUTE\" directive is not permitted on rules used by XStream outbound server \"%s\""
// *Cause:  One or more rules, used by the specified XStream outbound server,
//          had SET_EXECUTE directive defined.
// *Action: Execute the following:  
//   1) Execute query
//       SELECT xr.rule_owner, xr.rule_name, xr.rule_set_owner, 
//              xr.rule_set_name
//       FROM dba_apply_execute e, dba_xstream_rules xr 
//        WHERE e.rule_owner = xr.rule_owner AND e.rule_name = xr.rule_name
//        AND xr.streams_name = <specified outbound server>; 
//   2) For each rule returned, use DBMS_APPLY_ADM.SET_EXECUTE 
//      procedure to set the EXECUTE parameter to TRUE, or use 
//      DBMS_RULE_ADM.REMOVE_RULE to remove that rule from its associated
//      rule set. 
/
26881, 00000, "ORA-%s: %s raised in %s automatic %s job:\"%s\".\"%s\" for Capture process \"%s\" and cloned Capture process \"%s\"." 
// *Cause: An error was raised in a GoldenGate, XStream or Streams automatic split/merge job for the given original and cloned Capture processes.
// *Action: Check the corresponding split/merge row in DBA_STREAMS_SPLIT_MERGE view, alert log and trace file for details.
/
26882, 00000, "Timeout while %s automatic split/merge job:\"%s\".\"%s\" tried to lock Capture process \"%s\"." 
// *Cause: The GoldenGate, XStream or Streams Capture process could be locked by other automatic split/merge jobs.
// *Action: No action required.  The GoldenGate, XStream or Streams automatic split/merge job will retry automatically.
/
26883, 00000, "Timeout due to %s Apply process \"%s\" while merge original Capture process \"%s\" and cloned Capture process \"%s\"." 
// *Cause: When merging two GoldenGate, XStream or Streams Capture processes, the merge needs to wait untill the
//         Apply process of the cloned Capture process goes
//         ahead of the slowest subscriber of the original Capture
//         process.  This wait timed out.
// *Action: Make sure the GoldenGate, XStream or Streams Apply process still works properly.
/
26884, 00000, "Not allowed to specify OCI_LCR_ROW_COLVAL_OLD with OCILCR_NEW_ONLY_MODE."
// *Cause: An attempt was made to call OCILCRRowColumnInfoGet function with
//         OCI_LCR_ROW_COLVAL_OLD and OCILCR_NEW_ONLY_MODE.
// *Action: Change OCI_LCR_ROW_COLVAL_OLD to OCI_LCR_ROW_COLVAL_NEW or
//          remove OCILCR_NEW_ONLY_MODE argument.
/
26885, 00000, "OCIXStreamInCommit called before OCIXStreamInFlush"
// *Cause: An attempt was made to call OCIXStreamInCommit before calling OCIXStreamInFlush.
// *Action: Call OCIXStreamInFlush prior to calling OCIXStreamInCommit.
/
26886, 00000, "LCR commit position ('%s') must be greater than the applied high position of the XStream inbound server (position='%s')."
// *Cause:  The position of the commit LCR was less than or equal to the applied
//          high postion of the XStream inbound server.
// *Action: Set the commit position higher than the applied high position.
/
26887, 00000, "Insufficient privileges to attach to XStream inbound server \"%s\"."
// *Cause: Sufficient privileges were not granted to attach to the specified
//         XStream inbound server.
// *Action: Query DBA_XSTREAM_INBOUND view to get the apply_user value for 
//         the specified XStream outbound server. Then, modify the application 
//         to connect to the inbound server's database using this value.
/
26888, 00000, "Redo compatibilty must be 10.2 or greater"
// *Cause: XStream Out requires redo comptibility to be 10.2 or greater.
// *Action: Drop the outbound server.
/
26889, 00000, "LOB assembly not supported for PDML parent transaction %s, child transaction %s."
// *Cause: LOB assembly is not supported for PDML transactions.
// *Action: Disable LOB assembly, or filter out the PDML transaction.
/
26890, 00000, "Invalid update LCR on Oracle Sequence \"%s\".\"%s\""
// *Cause: The new value column list of an update LCR on an Oracle Sequence
//         did not have non-null columns \"CYCLE#\", \"INCREMENT$\", \"CACHE\"
//         and \"HIGHWATER".
// *Action: Make sure the new value column list has all the required columns.
//          This might be a user error if the LCR is from an XStream In client.
/
26891, 00000, "Target Oracle Sequence \"%s\".\"%s\" has inconsistent parameters with the source."
// *Cause: The source and target Oracle Sequences did not have the identical
//         cache size, increment value, and cycle flag needed for replication
//         purposes.
// *Action: Make sure the source and target Oracle Sequences have identical
//          parameters. This might be a user error if the LCR is from an
//          XStream In client.
/
26892, 00000, "XStream feature not supported"
// *Cause: The XStream feature was not supported.
// *Action: No action necessary.
/
26893, 00000, "Input LCR must be a commit LCR"
// *Cause: The input LCR was not a commit LCR.
// *Action: Make sure the input LCR is a commit LCR.
/
26894, 00000, "Invalid \"%s\" in Apply Progress redo"
// *Cause: The value of the field reported was possibly corrupted.
// *Action: Contact Oracle Support Services.
/
26895, 00000, "Setting parameter \"%s\" of Streams process \"%s\" is only permitted for Oracle GoldenGate or XStream."
// *Cause:  An attempt was made to set a parameter that is only allowed
//          for XStream.
// *Action: Oracle GoldenGate license is needed to use this parameter.
/
26896, 00000, "Attempted to connect multiple Oracle GoldenGate Capture processes, including \"%s\", with XStream outbound server \"%s\" through queue \"%s\".\"%s\""
// *Cause: An attempt was made to connect multiple Oracle GoldenGate Capture
//         processes through a queue with the XStream outbound server. 
// *Action: Each XStream outbound server can only connect with one co-located
//          Capture process. Remove extra Capture processes.
/
26897, 00000, "Unable to start %s capture \"%s\" because its subscribers \"%s\" and \"%s\" have different purpose" 
// *Cause: An attempt was made to start an Oracle Capture process but it failed
//         to start because its subscribers had conflicting purpose.
// *Action: Remove one of the specified subscribers from the capture queue.
/
26898, 00000, "Unable to create \"%s\" because there is an Oracle Capture process using the same queue \"%s\".\"%s\""
// *Cause: An attempt was made to create an inbound server using the same
//         queue that was used by an Oracle Capture process.
// *Action: Resubmit the statement using another queue name.
/
26899, 00000, "internal %s error"
// *Cause:  An internal Streams, XStream or GoldenGate error has occurred.
// *Action: Please contact Oracle customer support.
/
26900, 00000, "Streams failed to update data dictionary table for propagation \"%s\" from capture \"%s\" to apply \"%s\"."
// *Cause: The data dictionary table was corrupted.
// *Action: Validate the data dictionary table to restart GoldenGate, XStream or Streams capture process.
/
26901, 00000, "%s propagation sender in the combined capture and apply mode is to be suspended while apply is disabled."
// *Cause: The corresponding subscriber was dropped or split.
// *Action: No action necessary.
/
26902, 00000, "%s propagation sender in the combined capture and apply mode is to be suspended while apply is enabled."
// *Cause: The corresponding subscriber was dropped or split.
// *Action: No action necessary.
/
26903, 00000, "Invalid edition name \"%s\""
// *Cause:  The edition associated with the LCR did not exist in the 
//          destination database.
// *Action: Check if the edition needs to be created manually on the destination
//          database or if the CREATE EDITION statement for this edition 
//          has been applied properly on the destination database. 
/
26904, 00000, "Invalid bind variable \"%s\" in LCR field expression."
// *Cause:   In the statement handler, the bind variables listed in
//           the SQL expression did not match the allowed Logical Change Record field names.
// *Action:  Verify that all the bind variables listed in the expression are
//           legal Logical Change Record fields.
/
26905, 00000, "Invalid LCR method expression \"%s\" in statement handler."
// *Cause:   The Logical Change Record method listed was not allowed in the statement handler.
// *Action:  Verify that the Logical Change Record method listed in the expression is a legal
//           DBMS_LCR method.
26906, 00000, "No change handler exists."
// *Cause:  There was no change handler for the specified apply, operation,
//          source table, change table, and capture values.
// *Action: Query DBA_APPLY_CHANGE_HANDLERS view to find the correct change
//          handler.
26907, 00000, "Insufficient privileges to set converge tag"
// *Cause:  Privileges were insufficient to set converge tag.
// *Action: The invoker needs EXECUTE_CATALOG_ROLE or execute privilege on
//          DBMS_STREAMS_ADM to set converge tag. Grant appropriate privileges
//          to the invoker.
/
26908, 00000, "XStream API must be executed using a dedicated server process."
// *Cause:  An attempt was made to execute XStream API using a shared server 
//          process.
// *Action: Replace the connect string in the client application to use a 
//          dedicated server process.
/
26909, 00000, "cannot reexecute an eager error"
// *Cause:  An attempt was made to reexecute an eager error transaction.
//          An eager transaction is applied before the apply process sees
//          the commit or rollback for the transaction.
// *Action: Fix the cause of the eager error and restart the apply process.
//          When apply is restarted, capture will automatically resend
//          the transaction, and the transaction will be applied by the 
//          apply process.
/
26910, 00000, "user error %s encountered in eager mode"
// *Cause:  An error was encountered during eager apply. An eager
//          transaction is applied before the apply process sees the commit 
//          or rollback for the transaction. If an error occurs during
//          an eager transaction, the transaction will be rolled back.
// *Action: Query the DBA_APPLY_ERROR view to determine the error and
//          take the appropriate action. The apply process will need to be
//          restarted to apply the transaction that had the error. When 
//          apply is restarted, capture will automatically resend the 
//          transaction, and the transaction will be applied by the apply 
//          process.
/
26911, 00000, "invalid oldest position (current position=%s; new position=%s)"
// *Cause:  An attempt was made to set the oldest position to a value
//          that was less than the current value.
// *Action: Correct the oldest_position argument in 
//          OCIXStreamOutProcessedLWMSet2 call.
/
26912, 00000, "not allowed to invoke '%s' while in committed data-only mode"
// *Cause: An attempt was made to call the specified API while the attached
//         XStream server was in committed data-only mode. 
// *Action: Perform one of the following:
//    1) If the invalid call is OCIXStreamOutProcessedLWMSet2, then change it  
//       to OCIXStreamOutProcessedLWMSet or pass a null oldest_position to 
//       OCIXStreamOutProcessedLWMSet2 call. 
//    2) If the invalid call is OCIXStreamInProcessedLWMGet2, then change it  
//       to OCIXStreamInProcessedLWMGet or pass a null oldest_position to 
//       OCIXStreamInProcessedLWMGet2 call.
/
26913, 00000, "must connect to instance %s where %s %s server \"%s\" is running"
// *Cause:  The client application was not connected to the same Oracle RAC 
//          instance as the specified Oracle GoldenGate or XStream server.
// *Action: Connect to the specified instance using the network service name
//          obtained from the following query: 
//          SELECT network_name FROM all_queues q, all_xstream_outbound ob
//          WHERE q.owner = ob.queue_owner AND q.name = ob.queue_name 
//            AND server_name = '<server_name>';
/
26914, 00000, "Unable to communicate with %s capture process \"%s\" from outbound server \"%s\"."
// *Cause: Capture process might not haven been started properly or was aborted.
// *Action: If Oracle GoldenGate or XStream capture process was stopped, 
//          then restart the capture process. Otherwise, query the
//          DBA_CAPTURE view to determine the reason and take the appropriate 
//          action.
//          If the error is ORA-4031, either increase the initialization 
//          parameter STREAMS_POOL_SIZE or increase the capture parameter 
//          MAX_SGA_SIZE or increase both.
//          Refer to the XStream documentation for additional information on
//          these parameters.
/
26915, 00000, "Unable to return Logical Change Record (LCR) information due to missing data dictionary."
// *Cause: The current session was unable to return the requested information on
//         the given LCR due to missing dictionary data on that LCR.
// *Action: Detach and reattach the XStream outbound server. Then retry the
//         current call. 
/
26916, 00000, "Must call OCIPOGGRedoLogOpen function before OCIPOGGRedoLogRead"
// *Cause: An attempt was made to call OCIPOGGRedoLogRead before calling
//         OCIPOGGRedoLogOpen.
// *Action: Add OCIPOGGRedoLogOpen call before OCIPOGGRedoLogRead.
/
26917, 00000, "OCIPOGG API must be executed using a dedicated server process."
// *Cause:  An attempt was made to execute OCIPOGG API using a shared server
//          process.
// *Action: Replace the connect string in the client application to use a
//          dedicated server process.
/
26918, 00000, "Must use '%s' procedure for outbound server \"%s\"."
// *Cause: An attempt was made to execute START_APPLY on an outbound server
//         that uses uncommitted data mode.
// *Action: Use the specified procedure instead.
/
26919, 00000, "Capture \"%s\" is not associated with queue \"%s\".\"%s\". "
// *Cause: The capture specified in the ADD_OUTBOUND procedure was not
//         associated with the specified queue.
// *Action: Resubmit the ADD_OUTBOUND procedure after removing either the
//         capture_name or the queue_name argument.
/
26920, 00000, "%s outbound server \"%s\" has been stopped."
// *Cause: The specified outbound server was stopped.
// *Action: Execute START_OUTBOUND procedure to restart the outbound server or
//         execute OCIXStreamOutAttach function to reattach to the outbound
//         server.
/
26921, 00000, "Cannot alter the start SCN or time of %s Capture \"%s\"."
// *Cause: An attempt was made to alter the start SCN or time for a capture
//         while other outbound servers were still attached to it.
// *Action: Execute the following:
//   1) Get the names of other outbound servers currently attached to the 
//      specified Capture using the query:
//       SELECT server_name
//       FROM dba_xstream_outbound
//       WHERE (status = 'ATTACHED') AND
//         (server_name <> '<altered_server>') AND
//         (capture_name = '<specified_capture_name>');
//   2) Detach the client application from each server_name returned.
//   3) Retry the operation.
/
26922, 00000, "user %s does not have LOGMINING privilege"
// *Cause: An attempt was made to start the capture process or attach to 
//         an outbound server when the specified user did not have 
//         LOGMINING privilege. 
// *Action: Grant LOGMINING privilege to the specified user and
//         resubmit the failed operation.
/
26923, 00000, "cannot configure %s outbound server \"%s\" with %s capture \"%s\" due to different purpose"
// *Cause: An attempt was made to configure an outbound server with a
//         capture used for different purpose.
// *Action:  Execute the following:
//   1) Get the purpose of each capture and its associated queue:  
//       SELECT capture_name, queue_owner, queue_name, purpose
//       FROM dba_capture;
//   2) Resubmit the statement using a queue or capture with the same purpose. 
/
26924, 00000, "cannot configure %s using \"%s\".\"%s\" queue because it is used by \"%s\" for %s purpose"
// *Cause: An attempt was made to configure the specified process using a 
//         queue already used by another process for different purpose.
// *Action:  Resubmit the statement using another queue of the same purpose. 
/
26925, 00000, "cannot configure outbound server \"%s\" with capture \"%s\" because it is not using apply-state checkpoint" 
// *Cause: An attempt was made to configure an outbound server with a
//         capture not using apply-state checkpoint.
// *Action:  Specify a different capture in the ADD_OUTBOUND procedure 
//   or re-create the capture and resubmit the statement.
/
26926, 00000, "Unable to attach because capture \"%s\" is missing dictionary redo logs"
// *Cause: The specified capture was unable to locate the dictionary redo log.
// *Action:  Check the state of the specified capture from gv$streams_capture
//         to determine the SCN or filename of the missing log file.  Confirm 
//         that the filename exists and is accessible online and also in the
//         DBA_REGISTERED_ARCHIVED_LOG view.  In addition, for local capture, 
//         confirm that an entry exists for the file in the V$ARCHIVED_LOG view.
//         If an entry is missing, it can be added using the ALTER DATABASE 
//         REGISTER  .... LOGFILE command, specifying the keyword LOGICAL 
//         LOGFILE  or PHYSICAL LOGFILE as appropriate. 
/
26927, 00000, "Unable to communicate with %s capture process \"%s\" from outbound server \"%s\"."
// *Cause: A timeout occurred while waiting for capture to respond.
// *Action: Check the state of the specified capture from GV$XSTREAM_CAPTURE view.
//          Determine the reason for capture's unresponsiveness.
//          If streams_pool_size is not set or set with an inadequate value, consider
//          setting or increasing the value of this parameter.
/
26928, 00000, "Unable to communicate with %s apply coordinator process \"%s\" from outbound server \"%s\"."
// *Cause: A timeout occurred while waiting for apply coordinator to respond.
// *Action: Check the state of the specified apply coordinator from
//          GV$STREAMS_APPLY_COORDINATOR view.
//          Determine the reason for apply coordinator's unresponsiveness.
//          If streams_pool_size is not set or set with an inadequate value, consider
//          setting or increasing the value of this parameter.
/
26929, 00000, "altering an outbound server with a remote capture is not allowed"
// *Cause: An attempt was made to alter an outbound server with a remote
//         capture.
// *Action: None
/
26930, 00000, "User \"%s\" does not have privileges to perform this operation"
// *Cause: An attempt was made to create, alter, or drop a process that has
//         a different user (such as capture user or apply user) than the 
//         invoking user.
// *Action: Use the DBMS_XSTREAM_AUTH.GRANT_ADMIN_PRIVILEGE or 
//          DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE procedures to grant the 
//          invoking user proper privileges.
/
26931, 00000, "This procedure can only be invoked from the root container."
// *Cause: An attempt was made to execute a procedure in a multitenant container database (PDB) or a non-container database.
// *Action: Execute the procedure from the root container.
/
26932, 00000, "Streams configuration is not allowed in a container database."
// *Cause: An attempt was made to configure a Streams environment in a container database.
// *Action: None
/
26933, 00000, "Cannot start Streams process \"%s\" while in a container database."
// *Cause: An attempt was made to start the specified Streams process while in
//         a container database.
// *Action: None
/
26934, 00000, "Streams synchronous capture is not supported in a container database."
// *Cause: An attempt was made to perform a DML operation on a table being
//         captured by a Streams synchronous capture in a container database.
// *Action: Remove all Streams synchronous captures then reexecute the DML
//          operation.
/
26935, 0000, "Unsupported type %s.%s for parameter for procedure %s.%s.%s.\n"
//* Cause:  Apply encountered a procedure call with a parameter with an
//          unsupported type.
//* Action: Modify the rules to filter out the procedure call.
/
26936, 00000, "must execute OCIPOGGCaptureAttach before invoking %s function"
// *Cause:  An attempt was made to invoke the specified function
//          before executing OCIPOGGCaptureAttach call.
// *Action: Add OCIPOGGCaptureAttach call before the specified function.
/
26937, 00000, "client has already attached to %s capture \"%s\"."
// *Cause: The client was already attached to the specified capture. 
// *Action: Detach from the specified capture before reattaching.
/
26938, 00000, "cannot pack LCR into LCR buffer (buffer size is %s, LCR size is %s)"
// *Cause: The logical change record (LCR) buffer was not large enough to store the current LCR.
// *Action: Increase the buffer size in the OCIPOGGCaptureAttach call.
/
26939, 00000, "%s capture \"%s\" is disabled."
// *Cause: The capture process was disabled or aborted.
// *Action: Start the capture process.
/
26940, 00000, "OCIPOGGCapture API must be executed using a dedicated server process."
// *Cause:  An attempt was made to execute OCIPOGGCapture API using a shared
//          server process.
// *Action: Replace the connect string in the client application to use a
//          dedicated server process.
26941, 00000, "unable to perform LOB assembly for table %s.%s"
// *Cause: The apply process was unable to perform the LOB assembly for a DML 
//         for the specified table.
// *Action: Verify that the storage type for the columns are compatible at the 
//          source and destination.
26942, 00000, "LCR should not contain old value for column %s in table %s.%s"
// *Cause: The LCR contained old values for LOB, XMLType and object columns.
// *Action: Remove old values for any LOB, XMLType and object columns in
//          the LCR.
/
26943, 00000, "cross PDB operation not allowed"
// *Cause: An attempt was made to perform an operation on a container database different
//         from the container database where the call was made.
// *Action: Log into the root container or into the container where you want to perform
//          the requested action.
26944, 00000, "User \"%s\" attempted to invoke a procedure without proper permissions."
// *Cause: An attempt was made to invoke a procedure without proper permissions.
// *Action: Use the DBMS_GOLDENGATE_AUTH.GRANT_ADMIN_PRIVILEGE to grant the 
//          invoking user proper privileges.
26945, 00000, "unsupported hint %s"
// *Cause: The specified hint was not supported.
// *Action: Remove the hint from the SQL statement.
/
26946, 00000, "OCIPOGGRedoLog API not supported in CDB."
// *Cause:   An attempt was made to call an OCIPOGGRedoLog API in a multitenant 
//           container database (CDB). 
// *Action:  Do not call the OCIPOGGRedoLog API in a CDB.
//
/
26947, 00000, "Oracle GoldenGate replication is not enabled."
// *Cause: The 'enable_goldengate_replication' parameter was not set to 'true'.
// *Action: Set the 'enable_goldengate_replication' parameter to 'true'
//           and retry the operation.
//          Oracle GoldenGate license is needed to use this parameter.    
/
26948, 00000, "Streams API must be executed using a dedicated server process."
// *Cause:  The dblink configured for the propagation from the capture queue 
//          to the apply queue is using a shared server connection. 
// *Action: Modify the dblink for this propagation to use a dedicated server
//          connection.
/
26949, 00000, "Advanced Replication is not allowed in a container database."
// *Cause:  An attempt was made to configure an advanced replication 
//          in a multitenant container database (CDB).
// *Action: Do not call the Advanced Replication API in a CDB.
/
26950, 00000, "Streams tracing event"
// *Document: No
// *Cause:
// *Action:
/
26951, 00000, "table \"%s\".\"%s\" has column data type not supported by conflict resolution"
// *Cause: A conflict was detected, but unsupported columns prevented resolving the conflict.
// *Action: Remove conflict resolution configuration for tables with LOB, LONG, XML, object, or extended types.
/
26952, 00000, "could not clone from the specified clone_capture_name %s while creating capture process %s"
// *Cause:  The specified clone_capture_name could not be used as a clone 
//          candidate while creating the capture process.
// *Action: Re-create the capture without setting clone_capture_name.
/
26953, 00000, "source database character set is not a subset of the mining database character set"
// *Cause:  An attempt was made to configure a downstream capture but the source database character
//          set was not a subset of the mining database character set.
// *Action: Use AL32UTF8 character set or other compatible character set for the mining database.
/
26954, 00000, "invalid protocol (opcode %s) received during XStream execution"
// *Cause:  An internal protocol error occurred while executing an XStream
//          function.
// *Action: Contact Oracle Support Services.
/
26955, 00000, "cannot capture TIMESTAMP WITH LOCAL TIME ZONE data type"
// *Cause:  The capture process was unable to capture TIMESTAMP WITH LOCAL TIME ZONE data type
//          because the source database time zone was not available.
// *Action: Refer to My Oracle Support Note 1928808.1 to set the source database time zone for the
//          specified capture process.
/
26956, 00000, "capture %s created successfully but the source database time zone is not available"
// *Cause:  The capture process was created successfully; however, it will not be able to capture
//          TIMESTAMP WITH LOCAL TIME ZONE data type unless the source database time zone is set.
// *Action: Refer to My Oracle Support Note 1928808.1 to set the source database time zone for the
//          specified capture process.
/
26957, 00000, "LCR identifier length is invalid."
// *Cause:  A logical change record (LCR) identifier with an incompatible length was used. 
// *Action: Use an LCR identifier compatible with release 12.2 or higher specification.
/
26958, 00000, "LCR identifier version is invalid."
// *Cause:  An invalid logical change record (LCR) identifier version number was used. 
// *Action: Use an LCR identifier version compatible with release 12.2 or higher specification.
/
26959, 00000, "SCN value does not fit in SCN version 1."
// *Cause:  The system change number (SCN) value was too big to fit in the original SCN specification.
// *Action: Use an SCN value compatible with the original SCN specification.
/
26960, 00000, "automatic CDR already configured for table \"%s\".\"%s\""
// *Cause:  Automatic conflict detection and resolution was already configured.
// *Action: Remove the automatic conflict detection and resolution
//          configuration and retry.
/
26961, 00000, "automatic CDR not configured for table \"%s\".\"%s\""
// *Cause:  Automatic conflict detection and resolution was not configured.
// *Action: None.
/
26962, 00000, "automatic CDR delta resolution not configured for column \"%s\""
// *Cause:  Automatic conflict detection and resolution delta resolution was
//          not configured.
// *Action: None.
/
26963, 00000, "automatic CDR column group cannot be created"
// *Cause:  Automatic conflict detection and resolution was configured with
//          column granularity.
// *Action: Remove the column-level configuration and retry.
/
26964, 00000, "column \"%s\" already assigned to a column group"
// *Cause:  The column was already part of a column group.
// *Action: Remove the column from the column group and retry.
/
26965, 00000, "column group name \"%s\" not available"
// *Cause:  The column group name was already in use.
// *Action: Remove the existing column group and retry.
/
26966, 00000, "Event for Streams/XStream bugs"
// *Document: NO
// *Cause: This is an internal event.
// *Action: N/A
/
26967, 00000, "delete tombstone table \"%s\".\"%s\" cannot be dropped"
// *Cause:  An attempt was made to drop a delete tombstone table.
// *Action: Remove the automatic conflict detection and resolution from the
//          base table.
/
26968, 00000, "column group \"%s\" not found"
// *Cause:  The column group did not exist.
// *Action: Check if the column group needs to be created.
/
26969, 00000, "column \"%s\" not part of column group \"%s\""
// *Cause:  The column did not belong to the column group.
// *Action: Check the column list and retry.
/
26970, 00000, "table \"%s'\" does not contain a primary key constraint"
// *Cause:  An attempt was made to configure automatic conflict detection and
//          resolution with delete tombstones on a table without a primary key.
// *Action: Add a primary key and retry.
/
26971, 00000, "resolution column \"%s\" not present"
// *Cause:  The resolution column was not set in the logical change record (LCR).
// *Action: Manually resolve the conflict.
/
26972, 00000, "An apply process attempted to modify the SYSAUX tablespace."
// *Cause:  An ALTER TABLESPACE DDL to SYSAUX was attempted by Oracle GoldenGate, XStream or Streams process.
// *Action: Only SYS is allowed to modify SYSAUX.
/
26973, 00000, "automatic CDR not supported for table \"%s\".\"%s\" which has long columns"
// *Cause: Automatic conflict detection and resolution (CDR) support
//  for long columns failed. CDR does not support long columns.
// *Action: None.
/
26974, 00000, "Apply process is stuck in synchronous error handling mode."
// *Cause:  The apply process ran out of memory or queue space while suspended for synchronous error handling.
// *Action: Restart Oracle GoldenGate Replicat process.
/
26975, 00000, "Only one instance of an Oracle GoldenGate downstream live standby is permitted."
// *Cause:  An attempt was made to create an additional capture session for an 
//          Oracle GoldenGate downstream live standby system.
// *Action: None.
/
26976, 00000, "Oracle Streams is no longer supported."
// *Cause:  An attempt was made to use a feature of Oracle Streams.
// *Action: None.
/
26977, 00000, "Parameter '%s' is not a valid parameter for an XStream inbound server."
// *Cause:  An attempt was made to alter a parameter that was not valid for 
//          an XStream inbound server.
// *Action: None.
/
26978, 00000, "cannot specify more than 1000 key columns"
// *Cause:  An attempt was made to define more than 1000 key columns. 
// *Action: Reduce the number of key columns.
/
/ 27000-27299 Reserved for Oracle8 Unix OSDs
/ (skgfr, skgfq, ...)
/
/ 27000 - 27030 keep for SKGFQ (Also 27190-27229)
/
27000, 00000, "skgfqsbi: failed to initialize storage subsystem (SBT) layer"
// *Cause:  sbtinit returned an error, additional information indicates
//          error
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27001, 00000, "unsupported device type"
// *Cause:  the specified device type is supported on this platform
// *Action: check V$BACKUP_DEVICE for supported device types
27002, 00000, "function called with invalid device structure"
// *Cause:  internal error, aditional information indicates which
//          function encountered error
// *Action: check for trace file and contact Oracle Support
27003, 00000, "cannot open file on device allocated with NOIO option"
// *Cause:  internal error, a file is being created/retrieved on a device
//          allocated with NOIO option, additional information indicates
//          which function encountered error
// *Action: check for trace file and contact Oracle Support
27004, 00000, "invalid blocksize specified"
// *Cause:  internal error, blocksize specified is incorrect for the
//          device on which file is being created, aditional
//          information indicates blocksize specified, and the
//          function that encountered the error
// *Action: check for trace file and contact Oracle Support
27005, 00000, "cannot open file for async I/O on device not supporting async"
// *Cause:  internal error, a file is being opened for async I/O on a
//          device that does not support async I/O, additional
//          information indicates which function encountered error
// *Action: check for trace file and contact Oracle Support
27006, 00000, "sbtremove returned error"
// *Cause:  additional information indicates error returned by sbtremove,
//          and the function that encountered the error
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27007, 00000, "failed to open file"
// *Cause:  sbtopen returned error, additional information indicates error
//          returned from sbtopen, and the function that encountered
//          the error
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27008, 00000, "function called with invalid file structure"
// *Cause:  internal error, aditional information indicates which
//          function encountered error
// *Action: check for trace file and contact Oracle Support
27009, 00000, "cannot write to file opened for read"
// *Cause:  internal error
// *Action: check for trace file and contact Oracle Support
27010, 00000, "skgfwrt: write to file failed"
// *Cause:  sbtwrite returned error, additional information indicates
//          error returned from sbtwrite
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27011, 00000, "skgfrd: cannot read from file opened for write"
// *Cause:  internal error
// *Action: check for trace file and contact Oracle Support
27012, 00000, "skgfrd: read from file failed"
// *Cause:  sbtread returned error, additional information indicates
//          error returned from sbtread
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27013, 00000, "skgfqdel: cannot delete an open file"
// *Cause:  internal error
// *Action: check for trace file and contact Oracle Support
27014, 00000, "skgfqpini: translation error while expanding SS_UDMPDIR"
// *Cause:  Failure of sltln in skgfqpini
// *Action: Check additional return error for more information.
27015, 00000, "skgfcls: failed to close the file"
// *Cause:  sbtclose returned error, additional information indicates
//          error returned from sbtclose
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27016, 00000, "skgfcls: sbtinfo returned error"
// *Cause:  additional information indicates error returned from sbtinfo
// *Action: verify that vendor's storage subsystem product is operating
//          correctly
27017, 00000, "skgfcls: media handle returned by sbtinfo exceeds max length(SSTMXQMH)"
// *Cause:  media handle string length exceeds SSTMXQMH
// *Action: verify that vendor's storage subsystem product is operating
//          correctly, and that the platform limit (SSTMXQMH) is atleast
//          64 (the limit specified for sbtinfo). additional information
//          indicates the media handle string length returned by sbtinfo, and
//          the limit (SSTMXQMH)
27018, 00000, "BLKSIZE is not a multiple of the minimum physical block size"
// *Cause:  User-specified BLKSIZE (blocking factor) is not a multiple of
//          the minimum block size that is permitted on this platform.
// *Action: Two ADDITIONAL INFORMATION messages are displayed which show the
//          blocking factor provided by the user and the minimum physical
//          block size.  Specify a BLKSIZE that is an integral multiple
//          of the minimum block size.
27019, 00000, "tape filename length exceeds limit (SBTOPMXF)"
// *Cause:  length of tape filename provided to sequential I/O OSD functions is
//          too long
// *Action: additional information indicates in which function this error is
//          encountered, the length of filename provided, and the limit on
//          filename
27020, 00000, "named devices not supported"
// *Cause:  the platform or the specified device type does not support
//          named devices
// *Action: do not specify device name or use a device type that supports
//          named devices. Use V$BACKUP_DEVICE view to see what device
//          types and names (if any) are available.
27021, 00000, "sequential file handle must be specified"
// *Cause:  The filename which will be passed to sbtopen was not specified.
// *Action: Specify a filename and continue.  If this is a backup set
//          being created via Recovery Manager, use the 'format' option to
//          specify the backup piece handle name.
27022, 00000, "skgfqsbi: could not allocate memory for media manager"
// *Cause:  Oracle could not allocate memory required by the media management
//          software which is linked with Oracle to provide backup/restore
//          services.
// *Action: Increase the amount of memory available to the Oracle process and
//          retry the backup/restore.
27023, 00000, "skgfqsbi: media manager protocol error"
// *Cause:  The media management software which is linked with Oracle to
//          provide backup/restore services did not provide its function
//          pointer structure to Oracle.
// *Action: This is an internal error in the media management
//          product.  Contact the media management vendor.
27024, 00000, "skgfqsbi: sbtinit2 returned error"
// *Cause:  sbtinit2 returned an error.  This happens during a backup or
//          restore operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27025, 00000, "skgfqsbi: invalid media manager context area size"
// *Cause:  The media management software requested a context area size
//          which is greater than the maximum allowable size.
// *Action: This is an internal error in the media management
//          product.  Contact the media management vendor.
27026, 00000, "skgfrls: sbtend returned error"
// *Cause:  sbtend returned an error.  This happens during a backup or
//          restore operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27027, 00000, "sbtremove2 returned error"
// *Cause:  sbtremove2 returned an error.  This happens when deleting a backup
//          file.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27028, 00000, "skgfqcre: sbtbackup returned error"
// *Cause:  sbtbackup returned an error.  This happens when creating a backup
//          file during a backup operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27029, 00000, "skgfrtrv: sbtrestore returned error"
// *Cause:  sbtrestore returned an error.  This happens when retrieving a
//          backup file during a restore operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27030, 00000, "skgfwrt: sbtwrite2 returned error"
// *Cause:  sbtwrite2 returned an error.  This happens while writing a backup
//          file during a backup operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
/
/
/ 27031 - 27099 keep for SKGFR (if more needed, allocate another range later)
/
27031, 00000, "mirror resilvering functions not supported"
// *Cause:  internal error
// *Action: check for trace file and contact Oracle Support
27032, 00000, "failed to obtain file size limit"
// *Cause:  getrlimit system call returned an error
// *Action: check errno
27033, 00000, "failed to obtain file size limit"
// *Cause:  ulimit system call returned an error
// *Action: check errno
27034, 00000, "maximum length of ORACLE_SID exceeded"
// *Cause:   too many characters in the ORACLE_SID string
// *Action:  rename the ORACLE_SID to a string of up to the maximum number of
//           characters specified for your system
27035, 00000, "logical block size is invalid"
// *Cause:  logical block size for oracle files must be a multiple of the
//          physical block size, and less than the maximum
// *Action: block size specified is returned as additional information,
//          check init.ora parameters, additional information also indicates
//          which function encountered the error
27036, 00000, "translation error, unable to expand file name"
// *Cause:  additional information indicates sltln/slnrm error, and also
//          indicates which function encountered the error
// *Action: check additional information
27037, 00000, "unable to obtain file status"
// *Cause:  stat system call returned an error, additional information
//          indicates which function encountered the error
// *Action: check errno
27038, 00000, "created file already exists"
// *Cause:  trying to create a database file, but file by that name already
//          exists
// *Action: verify that name is correct, specify reuse if necessary
27039, 00000, "create file failed, file size limit reached"
// *Cause:  an attempt was made to create a file that exceeds the process's
//          file size limit, additional information indicates which function
//          encountered the error
// *Action: raise the file size limit
27040, 00000, "file create error, unable to create file"
// *Cause:  create system call returned an error, unable to create file
// *Action: verify filename, and permissions
27041, 00000, "unable to open file"
// *Cause:  open system call returned an error, additional information
//          indicates which function encountered the error
// *Action: check errno
27042, 00000, "not enough space on raw partition to fullfill request"
// *Cause:  internal error, file too large for raw partition, additional
//          information indicates which function encountered the error
// *Action: check for trace file and contact Oracle Support
27043, 00000, "unable to seek to beginning of file"
// *Cause:  seek system call failed, additional information indicates which
//          function encountered the error
// *Action: check errno
27044, 00000, "unable to write the header block of file"
// *Cause:  write system call failed, additional information indicates which
//          function encountered the error
// *Action: check errno
27045, 00000, "unable to close the file"
// *Cause:  close system call failed, additional information indicates which
//          function encountered the error
// *Action: check errno
27046, 00000, "file size is not a multiple of logical block size"
// *Cause:  file size as indicated by stat is not correct, additional
//          information indicates which function encountered the error
// *Action: verify that the file has not been overwritten or truncated
27047, 00000, "unable to read the header block of file"
// *Cause:  read system call failed, additional information indicates which
//          function encountered the error
// *Action: check errno
27048, 00000, "skgfifi: file header information is invalid"
// *Cause:  possibly trying to use a non-database file as a database file
// *Action: verify that file is a database file
27049, 00000, "unable to seek to and read the last block"
// *Cause:  an attempt was made to seek to and read the last block in file,
//          additional information indicates which function encountered error
// *Action: check errno
27050, 00000, "function called with invalid FIB/IOV structure"
// *Cause:  internal error, aditional information indicates which
//          function encountered error
// *Action: check for trace file and contact Oracle Support
27051, 00000, "I/O error (simulated, not real)"
// *Document: NO
// *Cause:  this is just a simulated error (not a real one), additional
//          information indicates which function encountered the error
// *Action: none
27052, 00000, "unable to flush file data"
// *Cause:  fsync system call returned error, additional information
//          indicates which function encountered the error
// *Action: check errno
27053, 00000, "blocksize in file header not a multiple of logical block size"
// *Cause:  the logical block size is invalid, additional information indicates
//          the logical block size and the blocksize in the file header
// *Action: use a different logical block size, or do not reuse file
27054, 00000, "NFS file system where the file is created or resides is not mounted with correct options"
// *Cause:  The file was on an NFS partition and either reading the mount tab 
//          file failed or the partition wass not mounted with the correct 
//          mount option.
// *Action: Make sure mount tab file has read access for Oracle user and
//          the NFS partition where the file resides is mounted correctly. 
//          For the list of mount options to use refer to your platform 
//          specific documentation.
/27055
27056, 00000, "could not delete file"
// *Cause:  unlink system call returned error
// *Action: check errno
27057, 00000, "cannot perform async I/O to file"
// *Cause:  internal error, query is being asked about async vector I/O
//          when the file does not support async I/O
// *Action: check for trace file and contact Oracle Support
27058, 00000, "file I/O question parameter is invalid"
// *Cause:  internal error, invalid query is being asked
// *Action: check for trace file and contact Oracle Support
27059, 00000, "could not reduce file size"
// *Cause:  ftruncate system call returned error
// *Action: check errno
27060, 00000, "could not set close-on-exec bit on file"
// *Cause:  fcntl system call returned error
// *Action: check errno
27061, 00000, "waiting for async I/Os failed"
// *Cause:  aiowait function returned error
// *Action: check errno
27062, 00000, "could not find pending async I/Os"
// *Cause:  There should have been some async I/Os in the system
//          but a blocking aiowait indicates that there are
//          no more I/Os. It could be either because of an Oracle
//          bug or the vendor OS bug or due to a NFS server not
//          responding
// *Action: check Oracle trace file, OS message files and
//          contact Oracle Support
27063, 00000, "number of bytes read/written is incorrect"
// *Cause:  the number of bytes read/written as returned by aiowait
//          does not match the original number, additional information
//          indicates both these numbers
// *Action: check errno
27064, 00000, "cannot perform async I/O to file"
// *Cause:  internal error, asked to perform async I/O when IOV
//          indicates that it cannot be performed on the file
// *Action: check for trace file and contact Oracle Support
27065, 00000, "cannot perform async vector I/O to file"
// *Cause:  internal error, asked to perform async vector I/O when
//          it cannot be performed on the file
// *Action: check for trace file and contact Oracle Support
27066, 00000, "number of buffers in vector I/O exceeds maximum"
// *Cause:  internal error, number of buffers in vector I/O exceeds
//          maximum allowed by the OSD, additional information indicates
//          both these numbers
// *Action: check for trace file and contact Oracle Support
27067, 00000, "size of I/O buffer is invalid"
// *Cause:  internal error, buffer size is either 0, or greater than
//          SSTIOMAX or not a multiple of logical block size, additional
//          information indicates where in function the error was
//          encountered and the buffer size
// *Action: check for trace file and contact Oracle Support
27068, 00000, "I/O buffer is not aligned properly"
// *Cause:  internal error, buffer is not aligned to SSIOALIGN boundary,
//          additional information indicates where in function the error
//          was encountered and the buffer pointer
// *Action: check for trace file and contact Oracle Support
27069, 00000, "attempt to do I/O beyond the range of the file"
// *Cause:  internal error, the range of blocks being read or written is
//          outside the range of the file, additional information indicates
//          the starting block number, number of blocks in I/O, and the
//          last valid block in the file
// *Action: check for trace file and contact Oracle Support
27070, 00000, "async read/write failed"
// *Cause:  aioread/aiowrite system call returned error, additional
//          information indicates starting block number of I/O
// *Action: check errno
27071, 00000, "unable to seek to desired position in file"
// *Cause:  lseek system call returned error, additional information
//          indicates block number in file to which seek was attempted
// *Action: check errno
27072, 00000, "File I/O error"
// *Cause:  read/write/readv/writev system call returned error, additional
//          information indicates starting block number of I/O
// *Action: check errno
27073, 00000, "Trying to close a file which has async I/Os pending to be dequeued"
// *Cause:  internal error, the file is being closed but not all async I/Os
//          to the file have been dequeued, additional information indicates
//          number of I/Os pending on the file
// *Action: check for trace file and contact Oracle Support
27074, 00000, "unable to determine limit for open files"
// *Cause:  The getrlimit() system call returned an error.
// *Action: Check errno.
27075, 00000, "SSTMOFRC constant too large"
// *Cause:  internal error
// *Action: check for trace file and contact Oracle Support
27076, 00000, "unable to set limit for open files"
// *Cause:  The setrlimit() system call returned an error.
// *Action: Check errno.
27077, 00000, "too many files open"
// *Cause:  internal error, the number of files opened through skgfofi has
//          reached the limit
// *Action: Check for trace file and contact Oracle Support.
27078, 00000, "unable to determine limit for open files"
// *Cause:  The getrlimit() system call returned an error.
// *Action: Check errno.
27079, 00000, "unable to set async IO limit"
// *Cause:  The setting of the limit for async I/O has failed.
// *Action: Check errno.
27080, 00000, "too many files open"
// *Cause:  The number of files opened has reached the system limit.
// *Action: Check the error, and set system configuration values.
27081, 00000, "unable to close the file"
// *Cause:  The close() system call failed.
// *Action: Check errno.
27083, 00000, "waiting for async I/Os failed"
// *Cause:  The aio_waitn() library call returned an error.
// *Action: Check errno.
27084, 00000, "unable to get/set file status flags "
// *Cause:  The fcntl() system call with F_GETFL/F_SETFL flag returned an error.
// *Action: Check errno.
27086, 00000, "unable to lock file - already in use"
// *Cause:  the file is locked by another process, indicating that it is
//          currently in use by a database instance.
// *Action: determine which database instance legitimately owns this file.
27087, 00000, "unable to get share lock - file not readable"
// *Cause:  share lock request was made on a file not open for read access.
// *Action: file must be open read-only or read-write to get a share lock.
27088, 00000, "unable to get file status"
// *Cause: file not open or file descriptor is invalid.
27089, 00000, "unable to release advisory lock"
// *Cause:  release of file lock failed
// *Action: see errno
27090, 00000, "Unable to reserve kernel resources for asynchronous disk I/O"
// *Cause:  The system call to reserve kernel resources for asynchronous I/O
//          has failed.
// *Action: Check errno
27091, 00000, "unable to queue I/O"
// *Cause:  read/write/readv/writev system call returned error, additional
//          information indicates starting block number of I/O
// *Action: check errno
27092, 00000, "size of file exceeds file size limit of the process"
// *Cause:  an attempt was made to open a file that exceeds the process's
//          file size limit (ulimit), additional information shows the current
//          limit (logical blocks) and the size of the file (logical blocks)
// *Action: increase the processes file size limit (ulimit) and retry
27093, 00000, "could not delete directory"
// *Cause:  rmdir system call returned error
// *Action: check errno
27094, 00000, "raw volume used can damage partition table"
// *Cause: A raw device with VTOC information was provided as a database file.
// *Action: Make sure the disk partition that is provided to Oracle
//          does not start at sector 0
27095, 00000, "fail to get the disk sector size"
// *Cause: The system call to get the sector size failed. Additional information
//          indicates which function encountered the error.
// *Action: Check error number.
27096, 00000, "fail to get file size"
// *Cause: The system call to get file size failed. Additional information
//          indicates which function encountered the error.
// *Action: Check error number.
27097, 00000, "failed to set Access Control List ownership for ASM devices"
// *Cause: The system call to set ACL ownership for ASM devices failed.
//         Additional information indicates which function encountered the error.
// *Action: Refer to Microsoft documentation for an explanation
//          of the accompanying error code and text.
/
27098, 00000, "failed to rename file"
// *Cause: The system call to change the file name failed.
//         Additional information indicates which function encountered the 
//         error.
// *Action: Check the Oracle trace file for additional information on file name
//          and reason for failure.
/
27099, 00000, "failed to create file"
// *Cause: The system call to create this file type in this file system failed.
//         Check if the creation of this file type is supported in this file
//         system. Additional information indicates which function encountered
//         the error.
//
// *Action: Refer to Oracle documentation for additional details.
//
/
/ 27100 - 27139 keep for SKGM
/
27100, 00000, "shared memory realm already exists"
// *Cause: Tried to start duplicate instances, or tried to restart an
//         instance that had not been properly shutdown
// *Action: Use a different instance name, or cleanup the failed instance's
//          SGA
27101, 00000, "shared memory realm does not exist"
// *Cause: Unable to locate shared memory realm
// *Action: Verify that the realm is accessible
27102, 00000, "out of memory"
// *Cause: Out of memory
// *Action: Consult the trace file for details
27103, 00000, "internal error"
// *Cause: internal error
// *Action: contact Oracle support
27104, 00000, "system-defined limits for shared memory was misconfigured"
// *Cause: System-defined shared memory limits were inadequate for Oracle.
// *Action: Consult the alert file for details.
27105, 00000, "unable to support any system page size for shared memory allocation"
// *Cause: Current configuration was not supported by any system page size.
// *Action: Consult the alert file for details.
27106, 00000, "system pages not available to allocate memory"
// *Cause: System page count for supported page sizes was misconfigured.
// *Action: Configure system page count as recommended in the alert file.
27107, 0000, "AUTO value for USE_LARGE_PAGES parameter is no longer supported"
// *Cause: The USE_LARGE_PAGES configuration parameter was set to AUTO.
// *Action: Consult the alert file for details.
27108, 0000, "shared global area (SGA) creation failed due to configuration issue"
// *Cause: System configuration issue.
// *Action: Consult the alert file for details.
27120, 00000, "unable to remove shared memory segment"
// *Cause: shmctl() call failed
// *Action: check permissions on segment, contact Oracle support
27121, 00000, "unable to determine size of shared memory segment"
// *Cause: shmctl() call failed
// *Action: check permissions on segment, contact Oracle support
27122, 00000, "unable to protect memory"
// *Cause: mprotect() call failed
// *Action: contact Oracle support
27123, 00000, "unable to attach to shared memory segment"
// *Cause: shmat() call failed
// *Action: check permissions on segment, contact Oracle support
27124, 00000, "unable to detach from shared memory segment"
// *Cause: shmdt() call failed
// *Action: contact Oracle support
27125, 00000, "unable to create shared memory segment"
// *Cause: shmget() call failed
// *Action: contact Oracle support
27126, 00000, "unable to lock shared memory segment in core"
// *Cause: insufficient privileges to lock shared memory segment in core
// *Action: make sure process is running with necessary privileges.
27127, 00000, "unable to unlock shared memory segment"
// *Cause: insufficient privileges to unlock shared memory segment
// *Action: make sure process is running with necessary privileges.
27128, 00000, "unable to determine pagesize"
// *Cause: sysconf() call failed
// *Action: contact Oracle support
27129, 00000, "VLM Map operation failed"
// *Document: NO
// *Cause: Internal error 
// *Action: Contact Oracle Support Services.
27130, 00000, "VLM Unmap operation failed"
// *Document: NO
// *Cause: Internal error 
// *Action: Contact Oracle Support Services.
27131, 00000, "VLM Add operation failed"
// *Document: NO
// *Cause: Internal error 
// *Action: Contact Oracle Support Services.
27132, 0000, "VLM Remove operation failed"
// *Document: NO
// *Cause: Internal error 
// *Action: Contact Oracle Support Services.
27133, 00000, "unable to determine stacksize"
// *Cause: getrlimit() call failed
// *Action: Contact Oracle Support Services.
27134, 00000, "unable to set stacksize"
// *Cause: setrlimit() call failed
// *Action: Contact Oracle Support Services.
27135, 00000, "Operating System hard stack limit is set too low"
// *Cause: Operating System hard stack limit was set too low.
// *Action: Check additional information for current and minimum limit.
//          Increase the Operating System hard stack limit and retry.
27136, 00000, "MPMT and VLM are both enabled"
// *Cause: When the _mpmt_enabled parameter is set to TRUE, none of the 
//         following parameters should be set to TRUE:
//         * use_indirect_buffers
//         * _db_block_cache_protect
//         * _db_block_cache_clone
//
// *Action: Either turn off Multi Process Multi Threads (MPMT) or 
//          turn off all the other parameters.
27137, 00000, "unable to allocate large pages to create a shared memory segment"
// *Cause: Parameter USE_LARGE_PAGES set to only, but large pages were not 
//         configured properly
// *Action: Check alert file for more information
27138, 00000, "unable to allocate large pages with current parameter setting"
// *Cause: With parameter USE_LARGE_PAGES set to only, none of the 
//         following parameters can be set:
//         * memory_target/memory_max_target
//         * _db_block_cache_protect
// *Action: Either turn off the USE_LARGE_PAGES parameter setting, or turn off
//          all the other parameters. Large pages are compatible with
//          sga_target, sga_max_size and shared_pool_size.
27139, 00000, "unable to reserve Oracle VM mapping in  process address space" 
// *Cause: The address space region was already mapped.
// *Action: Contact Oracle Support Services. 
/
/ 27140-27189 RESERVED FOR SKGP
/
27140, 0000, "attach to post/wait facility failed"
// *Cause:  The program attempted to initialize the post/wait facility,
//          but the facility could not be attached.
// *Action: Check for additional errors and contact Oracle Support.
27141, 0000, "invalid process ID"
// *Cause:  process operation attempted using invalid process ID
// *Action: contact Oracle Support
27142, 0000, "could not create new process"
// *Cause:  OS system call
// *Action: check errno and if possible increase the number of processes
27143, 0000, "OS system call failure"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle support
27144, 0000, "attempt to kill process failed"
// *Cause:  OS system call error
// *Action: check errno and contact Oracle Support
27145, 0000, "insufficient resources for requested number of processes"
// *Cause:  OS system call error
// *Action: check errno and contact Oracle Support
27146, 0000, "post/wait initialization failed"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27147, 0000, "post/wait reset failed"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27148, 0000, "spawn wait error"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27149, 0000, "assignment out of range"
// *Cause:  internal error, requested conversion too large for type
// *Action: contact Oracle Support
27150, 0000, "attempt to notify process of pending oradebug call failed"
// *Cause:  OS system call
// *Action: check errno contact Oracle Support
27151, 0000, "buffer not large enough to hold process ID string"
// *Cause:  internal error
// *Action: contact Oracle Support
27152, 0000, "attempt to post process failed"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27153, 0000, "wait operation failed"
// *Cause:  OS system called failed
// *Action: check errno contact Oracle Support
27154, 0000, "post/wait create failed"
// *Cause:  internal error, multiple post/wait creates attempted simultaneously
// *Action: check errno and contact Oracle Support
27155, 0000, "could not execute file"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle Support
27156, 0000, "request for process information failed"
// *Cause:  internal error
// *Action: contact Oracle Support
27157, 0000, "OS post/wait facility removed"
// *Cause:  the post/wait facility for which the calling process is awaiting
//          action is removed from the system
// *Action: check errno and contact Oracle Support
27158, 0000, "process control failure"
// *Cause:  Oracle was unable to set the specified process control.
// *Action: Consult the Oracle Administrator's Guide.
27159, 0000, "failure setting process scheduling priority"
// *Cause:  Oracle was unable to set the scheduling priority desired.
// *Action: Consult the Oracle Administrator's Guide.
27160, 0000, "process requested to perform operation"
// *Cause:  The current process was requested to perform an operation by
//          another process.
// *Action: This is used internally; no action is required.
27161, 0000, "request for Oracle binary information failed"
// *Cause:  The program was unable to get information about the Oracle binary.
// *Action: Check for additional errors and contact Oracle support.
27162, 0000, "thread creation failed"
// *Cause:  The program was unable to create a thread.
// *Action: Check errno and contact Oracle support.
27163, 0000, "out of memory"
// *Cause:  The program ran out of memory when allocating a temporary
//          data structure.
// *Action: Increase the amount of memory on the system.
27164, 0000, "tried to join detached thread"
// *Cause:  The program tried to join a detached thread.
// *Action: This is an internal error; contact Oracle support.
27165, 0000, "tried to join thread that does not exist"
// *Cause:  The program tried to join a thread that does not exist.
// *Action: This is an internal error; contact Oracle support.
27166, 0000, "tried to join current thread"
// *Cause:  A thread in the program tried to join itself.
// *Action: This is an internal error; contact Oracle support.
27167, 0000, "Attempt to determine if Oracle binary image is stored on remote server failed"
// *Cause: OS dependent operation failed 
// *Document: NO
// *Action: This is an internal error; contact Oracle support.
27168, 0000, "Translation from hostname to network address failed"
// *Cause:  Internal error
// *Action: Contact Oracle Support Services.
27169, 0000, "OS signal mask operation failed"
// *Cause: OS dependent operation failed
// *Document: NO
// *Action: Check errno and contact Oracle support.
27170, 0000, "Oracle RAC option of current Oracle binary differs from running instance"
// *Cause:  The Oracle installation environment may have been modified while the
//          instance was running.
// *Action: Restore the environment to its original state when the instance was
//          started or shutdown (abort) and restart the instance.
/
/ 27190 - 27229 reserved skgfq
/
27190, 00000, "skgfrd: sbtread2 returned error"
// *Cause:  sbtread returned an error.  This happens while reading a backup
//          file during a restore operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27191, 00000, "sbtinfo2 returned error"
// *Cause:  sbtinfo2 returned an error.  This happens while retrieving
//          backup file information from the media manager's catalog.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27192, 00000, "skgfcls: sbtclose2 returned error - failed to close file"
// *Cause:  sbtclose2 returned an error.  This happens while closing a backup
//          file during a backup or restore operation.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27193, 00000, "sbtinfo2 did not return volume label"
// *Cause:  sbtinfo2 did not return the volume label information for the
//          backup file that was just created.
// *Action: This is an internal error in the media management
//          product.  Contact the media management vendor.
27194, 00000, "skgfdvcmd: sbtcommand returned error"
// *Cause:  sbtcommand returned an error.  This happens when an rman SEND
//          command is issued.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27195, 00000, "proxy copy not supported"
// *Cause:  An attempt was made to do a proxy backup or restore, but the
//          media management software installed with Oracle does not support
//          proxy copy.
// *Action: Re-run the backup in non-proxy mode, or contact the
//          media management vendor if the software is supposed to support
//          proxy copy.
27196, 00000, "skgfpbk: sbtpcbackup returned error"
// *Cause:  sbtpcbackup returned an error.  This happens when a proxy backup
//          is begun.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27197, 00000, "skgfprs: sbtpcrestore returned error"
// *Cause:  sbtpcrestore returned an error.  This happens when a proxy restore
//          is begun.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27198, 00000, "skgfpvl: sbtpcvalidate returned error"
// *Cause:  sbtpcvalidate returned an error.  This happens during a proxy
//          backup or restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27199, 00000, "skgfpst: sbtpcstatus returned error"
// *Cause:  sbtpcstatus returned an error.  This happens during a proxy
//          backup or restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27200, 00000, "skgfpgo: sbtpcstart returned error"
// *Cause:  sbtpcstart returned an error.  This happens during a proxy
//          backup or restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27201, 00000, "skgfpcm: sbtpccommit returned error"
// *Cause:  sbtpccommit returned an error.  This happens during a proxy
//          backup or restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27202, 00000, "skgfpen: sbtpcend returned error"
// *Cause:  sbtpcend returned an error.  This happens during a proxy
//          backup or restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27203, 00000, "skgfpqb: sbtpcquerybackup returned error"
// *Cause:  sbtpcquerybackup returned an error.  This happens during a proxy
//          backup.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27204, 00000, "skgfpqr: sbtpcqueryrestore returned error"
// *Cause:  sbtpcqueryrestore returned an error.  This happens during a proxy
//          restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27205, 00000, "skgfpcn: sbtpccancel returned error"
// *Cause:  sbtpccancel returned an error.  This happens during a proxy
//          restore.
// *Action: This error is returned from the media management software which is
//          linked with Oracle.  There should be additional messages which
//          explain the cause of the error.  This error usually requires
//          contacting the media management vendor.
27206, 00000, "requested file not found in media management catalog"
// *Cause:  A backup file used in a recovery manager catalog maintenance
//          command was not found in the media management catalog.
// *Action: Retry the command with a different file.
27207, 00000, "syntax error in device PARMS - parentheses mismatch or missing"
// *Cause:  User-supplied PARMS value has incorrect syntax.
// *Action: Retry the command with correct syntax: ENV=(..) BLKSIZE=nnnn
27208, 00000, "syntax error in device PARMS - environment variable value missing"
// *Cause:  User-supplied PARMS value has incorrect syntax.
// *Action: Retry the command with correct syntax: ENV=(var1=val1,var2=val2,..)
27209, 00000, "syntax error in device PARMS - unknown keyword or missing ="
// *Cause:  User-supplied PARMS value has incorrect syntax.  The server
//          expected to find ENV or BLKSIZE, but found an unknown keyword.
// *Action: Retry the command with correct syntax: ENV=(..) BLKSIZE=nnnn
27210, 00000, "syntax error in device PARMS"
// *Cause:  User-supplied PARMS value has incorrect syntax.
// *Action: Retry the command with correct syntax: ENV=(..) BLKSIZE=nnnn
/
27211, 00000, "Failed to load Media Management Library"
// *Cause:  User-supplied SBT_LIBRARY or libobk.so could not be loaded. Call
//          to dlopen for media library returned error. See Additional
//          information for error code.
// *Action: Retry the command with proper media library. Or re-install
//          Media management module for Oracle.
27212, 00000, "some entrypoints in Media Management Library are missing"
// *Cause:  media library does not have one of the following entrypoints :
//          sbtinfo, sbtread, sbtwrite, sbtremove, sbtopen, sbtclose, sbtinit
// *Action: Retry the command with proper media library.
27213, 00000, "failed to unload Media Management Library"
// *Cause:  dlclose for media library returned error. See Additional
//          Additional information for error code.
// *Action: contact Oracle Support.
27214, 00000, "skgfrsfe: file search failed"
// *Cause:  The FindNextFile function returned unxpected error.
// *Action: Check errors on the error stack for an explanation
//          why the search for files could not be successfully executed.
27215, 00000, "skgfgsmcs: sbtinfo2 returned unknown file"
// *Cause:  During an sbtinfo2() call, the media management software
//          returned information about an unknown backup file.
// *Action: Contact the media management vendor.
27216, 00000, "skgfgsmcs: sbtinfo2 returned a malformed response"
// *Cause:  The media management software returned a malformed
//          response during an sbtinfo2() call.
// *Action: Contact the media management vendor.
27217, 00000, "failed to load Media Management Library from secure location"
// *Cause:  SBT libraries were not installed in a secure location.
// *Action: Remove SBT_SECURE parameter or Request third party vendors
//          to provide patch that installs SBT libraries in secured
//          locations as mandated by Oracle.
27218, 00000, "failed to read ACFS mirror"
// *Cause: An attempt to communicate with the Oracle Automatic Storage 
//         Management Cluster File System (Oracle ACFS) kernel driver failed. 
// *Action: Check errors on the error stack for an explanation of
//          why communication with ACFS was not successful.
27219, 00000, "syntax error in device PARMS - quotes missing or mismatch"
// *Cause:  The user-supplied PARMS value had incorrect syntax. Either quotes
//          were missing or there was a mismatch in the ENV parameter.
// *Action: Retry the command with matching quotes inside ENV parameter.

27230, 00000, "OS system call failure"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle support
/
/ 27231 - 27249 reserved for sskgof
/
27231, 00000, "unable to close file"
// *Cause:  A file could not be closed.
// *Action: See accompanying errors.
27232, 00000, "unable to get file information"
// *Cause:  Information about the file could not be obtained.
// *Action: See accompanying errors.
27233, 00000, "file is not an ELF file"
// *Cause:  A file was not an ELF file.
// *Action: Check for file corruption and contact Oracle Support Services.
27234, 00000, "unable to read file"
// *Cause:  A file could not be read.
// *Action: See accompanying errors.
27235, 00000, "unable to map file region into memory"
// *Cause:  A file region could not be mapped into memory.
// *Action: See accompanying errors.
27236, 00000, "unable to unmap file from memory"
// *Cause:  A file region could not be unmapped from memory.
// *Action: See accompanying errors.
27237, 00000, "ELF file is not a relocatable object file"
// *Cause:  An ELF file was not the expected type.
// *Action: Supply the expected type of file.
27238, 00000, "ELF file is not an executable"
// *Cause:  An ELF file was not the expected type.
// *Action: Supply the expected type of file.
27239, 00000, "ELF file is not a shared object file"
// *Cause:  An ELF file was not the expected type.
// *Action: Supply the expected type of file.
27240, 00000, "ELF file does not have a required section"
// *Cause:  An ELF file did not have a required section.
// *Action: Contact Oracle Support Services.
27241, 00000, "ELF-shared library has multiple sections of the same type"
// *Cause:  An ELF-shared library had multiple sections of the same type.
// *Action: Contact Oracle Support Services.
27242, 00000, "ELF file has invalid hash table entry size"
// *Cause:  An ELF file had an invalid hash table entry size.
// *Action: Contact Oracle Support Services.
27243, 00000, "ELF file has too many relocation sections"
// *Cause:  An ELF file had too many relocation sections.
// *Action: Contact Oracle Support Services.
27244, 00000, "unable to determine base value for data relocation from ELF file"
// *Cause:  An ELF file was missing important information.
// *Action: Contact Oracle Support Services.
27245, 00000, "unable to dlopen() binary image"
// *Cause:  A file could not be accessed via dlopen().
// *Action: See accompanying errors and make file available.
27246, 00000, "unable to open file"
// *Cause:  A file could not be opened.
// *Action: See accompanying errors and make file available.
/
/ 27250 - 27269 reserved for sm
/
27250, 00000, "OS system call failure"
// *Cause:  OS system call failed
// *Action: check errno and contact Oracle support
/
/ 27270 - 27274 reserved for sz
/
27270, 00000, "szingroup: malloc failed"
// *Cause:  The malloc library call failed to allocate space for a group list.
// *Action: This is possibly an operating system error.
//          Contact Oracle Support Services.
/
27271, 00000, "szingroup: group lookup failure"
// *Cause:  The 'getgrnam_r' library call failed to determine the members of a
//          UNIX group.
// *Action: This is an internal error. Contact Oracle Support Services.
/
/ 27275 - 27284 reserved for sskgdiw
/
27275, 00000, "operating system debug library call failure"
// *Cause:  Operating system debug library call failed.
// *Action: This is an internal error. Contact Oracle Support Services.
27276, 00000, "operating system call failure"
// *Cause:  Operating system call failed.
// *Action: This is an internal error. Contact Oracle Support Services.
27277, 00000, "invalid address"
// *Cause:  Incorrect or badly formatted address was supplied.
// *Action: Specify a valid address.
27278, 00000, "no debug attribute found"
// *Cause:  The expected debug attribute was not found.
// *Action: This object file is malformed, use different object file.
27279, 00000, "Cannot find referred type."
// *Cause:  Malformed debug object.
// *Action: This object file is malformed, use different object file.
27280, 00000, "debug information is not found"
// *Cause:  Could not find requested debug information.
// *Action: Use an object file with proper debug information.
/
/ 27300 - 27350 reserved for slos Error Reporting
/
27300, 00000, "OS system dependent operation:%s failed with status: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
/
27301, 00000, "OS failure message: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
//
27302, 00000, "failure occurred at: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
//
27303, 00000, "additional information: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
/
/ 27351 - 27499 RESERVED FOR NEW DATABASE SCHEDULER
/
27351, 00000, "conflicting values of job attributes %s and %s"
// *Cause: The values of two attributes passed in to the CREATE_JOBS call
//         or the JOB object constructor conflicted with each other. This is
//         usually because both attributes cannot be non-NULL at the same
//         time.
// *Action: Resolve the conflict by changing the value of one of the 
//          attributes and issue the call again.
27352, 00000, "unable to get lock on queue"
// *Document: NO
// *Cause: An internal scheduler synchronization error
// *Action: Contact Oracle Customer Support.
27353, 00000, "job attribute %s is missing"
// *Cause: An attribute needed to fully specify a job was not passed in
//         to a call to CREATE_JOBS or the JOB object constructor.
// *Action: Issue the call again with the required attribute set.
27354, 00000, "attribute %s cannot be set for %s jobs"
// *Cause: The CREATE_JOBS call or the JOB object constructor was called 
//         with an argument that is illegal in the case of lightweight
//         or in-memory jobs.
// *Action: Set the argument to the default value and issue the call again. 
27355, 00000, "unable to lock row cache entry"
// *Document: NO
// *Cause: Failure in scheduler concurrency control
// *Action: Contact Oracle Customer Support.
27356, 00000, "invalid job argument"
// *Cause: An invalid job argument was passed into either the CREATE_JOBS
//         call or the JOB object constructor.
// *Action: Correct the argument value and issue the call again.
27357, 00000, "duplicate reference to job object %s"
// *Cause: The scheduler CREATE_JOBS call had two or more references
//         to the same job. 
// *Action: Eliminate the duplicate references and issue the call again.
27358, 00000, "unknown allocation type"
// *Document: NO
// *Cause: Failure in scheduler memory allocation routines
// *Action: Contact Oracle Customer Support.
27359, 00000, "duplicate reference to attribute %s of job %s"
// *Cause: The scheduler SET_JOB_ATTRIBUTES call had two or more 
//         references to a specific atrribute of a job. 
// *Action: Eliminate the duplicate references and issue the call again.
27360, 00000, "unknown operation type"
// *Document: NO
// *Cause: Failure in scheduler linked list routines
// *Action: Contact Oracle Customer Support.
27361, 00000, "scheduler API invoked with illegal or inconsistent arguments"
// *Cause: A DBMS_SCHEDULER API call was invoked with either illegal or 
//         inconsistent arguments.
// *Action: Refer to scheduler documentation for the call, make the necessary
//          changes and issue the call again.
27362, 00000, "batch API call completed with errors"
// *Cause: Some of the commands submitted to a scheduler batch API call 
//         could not be successfully carried out because of errors. Other
//         commands in the batch may have completed successfully.
// *Action: Check the view SCHEDULER_JOB_ERRORS to see which commands failed
//          and why. Make the appropriate corrections and submit the failed
//          commands again.
27363, 00000, "invalid program for %s job"
// *Cause: An attempt was made to create a lightweight or in-memory job using
//         an invalid program. A program used in a lightweight or in-memory job
//         has to be enabled, has to be in the same schema as the job, and the
//         program action has to be either a PL/SQL block or a stored procedure.
// *Action: Use a valid program for the lightweight job.
27364, 00000, "remote database \"%s\" already registered as %s"
// *Cause: The user attempted to register a remote database that was 
//         already registered.
// *Action: To update the registration information, the REPLACE argument
//          of the REGISTER_REMOTE_DATABASE procedure should be set to 
//          TRUE. If the registration information is already current, no
//          further action is needed.
27365, 00000, "job has been notified to stop, but failed to do so immediately"
// *Cause:  The job specified in the stop_job command
//          cannot be stopped immediately(because it is rolling back or blocked
//          on a network operation), but it has been notified to stop.  This
//          means it will be stopped as soon as possible after its current
//          uninterruptable operation is done.
// *Action: No action is required for the job to be stopped, but calling
//          stop_job with force (if you have the privilege) 
//          may cause the job to be stopped sooner.
27366, 00000, "job \"%s\".\"%s\" is not running"
// *Cause: An attempt was made to stop a job that was not running.
// *Action: Verify the status of the job. If the job is running but this
//          message is still being returned, contact Oracle support.
27367, 00000, "program \"%s\".\"%s\" associated with this job is disabled"
// *Cause: An attempt was made to run a job whose program has been disabled.
// *Action: Reenable the program before running the job.
27368, 00000, "job execution abandoned"
// *Document: NO
// *Cause: A slave had picked up a job for execution that was either currently
//         being run or had just finished running on another RAC instance, so
//         the slave abandoned the job without executing it.
// *Action: This error is used as part of communication between various
//          scheduler modules. It should not be seen by an end-user. If
//          this message is seen, contact Oracle Customer Support.
27369, 00000, "job of type EXECUTABLE failed with exit code: %s"
// *Cause: A problem was encountered while running a job of type EXECUTABLE.
//         The cause of the actual problem is identified by the exit code.
// *Action: Correct the cause of the exit code and reschedule the job.
27370, 00000, "job slave failed to launch a job of type EXECUTABLE"
// *Cause: The scheduler ran into an error when the job slave tried to start
//         a job of type EXECUTABLE. The rest of the error stack will provide
//         more detailed information on what the exact problem was.
// *Action: Correct the problem specified in the error stack and reschedule
//          the job.
27371, 00000, "jobs of type EXECUTABLE are not supported on this platform"
// *Cause: The user tried to create a job or program of type EXECUTABLE on a
//         platform where such jobs are not supported.
// *Action: Switch to a different platform or create a different type of job
//          or program.
27372, 00000, "length of action and arguments exceeds platform limit %s"
// *Cause: The total length of the job or program action and the arguments
//         exceeds the platform limit specified.
// *Action: Reduce the total length by specifying fewer and/or shorter 
//          arguments
27373, 00000, "unknown or illegal event source queue"
// *Cause: The source queue specified for the event based job or event
//         based schedule was either not found or was of the wrong type.
// *Action: Check if the queue exists. If it does make sure it is a 
//          multiple consumer queue and it is a post 8.1 compatible queue.
//          Single consumer queues and old-style queues cannot be used
//          as event source queues.
27374, 00000, "insufficient privileges on event source queue"
// *Cause: The job owner had insufficient privileges on the event source
//         queue that was specified for the job.
// *Action: The job owner has to have dequeue privileges on event source 
//          queue or he has to have manage queue or dequeue any queue
//          system privileges. Make sure one of these privileges is 
//          granted.
27375, 00000, "valid agent name must be specified for secure queues"
// *Cause: The queue specified for the event based job or schedule was
//         a secure queue and either no agent name was specified or 
//         an invalid agent name was specified.
// *Action: If no agent name was specified, retry the call with a valid
//          agent name. If the agent name was valid, check if the agent
//          is currently subscribed to the queue and, in the case of jobs,
//          check is the agent has been authorized to act as the job 
//          owner.
27376, 00000, "event condition cannot be NULL"
// *Cause: A null event condition was passed in for an event based job
//         or schedule. This is not allowed.
// *Action: Pass in a legal event condition.
27377, 00000, "windows cannot have event based schedules"
// *Cause: Event based schedules for windows are currently not supported.
// *Action: Use a time-based schedule instead.
27378, 00000, "cannot stop jobs of type EXECUTABLE on this platform"
// *Cause: An attempt was made to stop a job of type EXECUTABLE on a platform 
//         where the stop operation was not supported.
// *Action: If the attempt to stop the job was made with the FORCE option 
//          set to FALSE, try again but change the FORCE option to TRUE.
27379, 00000, "INSTANCE_ID attribute conflicts with job class settings"
// *Cause: The value of the INSTANCE_ID attribute of the job conflicted with the 
//         value of the SERVICE attribute of its job class.
// *Action: Change the value of the INSTANCE_ID attribute or place the job
//          in a job class whose settings do not conflict with the 
//          INSTANCE_ID attribute. Then re-enable the job.
27380,0000, "not enough units to satisfy the constraint"
// *Cause:   There were not enough resources to satisfy the constraint.
// *Action:  Add more resource units.
27381,0000, "job cannot run, state is RESOURCE_UNAVAILABLE"
// *Cause:   The job could not run because one of the resources was in a BLOCKED_ALL_JOBS state.
// *Action:  Change the resource to either ENFORCE_CONSTRAINTS or IGNORE_CONSTRAINTS.
27382,0000, "job type %s has errors in the job action"
// *Cause: There were errors in the job action when the FAIL_ON_SCRIPT_ERROR job
//         attribute was set to TRUE.
// *Action: Ensure that the job action has no errors or set FAIL_ON_SCRIPT_ERROR job 
//          attribute to FALSE. FAIL_ON_SCRIPT_ERROR is only valid for
//          SQL_SCRIPT, BACKUP_SCRIPT, EXECUTABLE and EXTERNAL_SCRIPT job types.

27399, 00000, "job type EXECUTABLE requires the CREATE EXTERNAL JOB privilege"
// *Cause: The owner of a job of type EXECUTABLE does not have the
//         CREATE EXTERNAL JOB system privilege.
// *Action: Grant the CREATE EXTERNAL JOB system privilege to the job owner or
//          create another job in a schema which does have the CREATE EXTERNAL
//          JOB system privilege.
/
27400, 00000, "In a PDB, the JOB_QUEUE_PROCESSES initialization parameter can only be set to 1000 or 0."
// *Cause: A value other than 1000 or 0 was specified for the JOB_QUEUE_PROCESSES initialization parameter.
//         Inside a pluggable database (PDB), the JOB_QUEUE_PROCESSES initialization parameter can only
//         accept the values of 1000 or 0 to indicate whether or not jobs should run in the PDB.
// *Action: Specify a proper value for this parameter.
/
/ 27401 - 27410 Reserved for scheduler events
/
27401, 00000, "Scheduler debug event"
// *Document: NO
// *Cause:
// *Action:
/
27402, 00000, "Scheduler tracing event"
// *Document: NO
// *Cause:
// *Action:
/
27403, 00000, "scheduler stop job event"
// *Document: NO
// *Cause:
// *Action:
/
27404, 00000, "Scheduler internal testing event"
// *Document: NO
// *Cause:
// *Action:
/
/ 27411 - 27420 Reserved for scheduler repeat interval errors 
/
27411, 0000, "empty string is not a valid repeat interval."
// *Cause: An empty string '' was provided as a repeat interval for a window
//         or a schedule.
// *Action: Specify a valid repeat interval, e.g.,
//          'FREQ=DAILY;BYHOUR=8;BYMINUTE=0;BYSECOND=0' for a job that executes 
//          daily at 8am.
/
27412, 00000, "repeat interval or calendar contains invalid identifier: %s"
// *Cause:  The calendar string or calendar definition for the repeat interval
//          of a job, schedule or window contained an unsupported keyword or 
//          reference to an undefined calendar.
// *Action: Correct the repeat interval such that it no longer contains the
//          invalid keyword.
/
27413, 00000, "repeat interval is too long"
// *Cause:  The repeat interval consisted of a calendar string larger than the
//          maximum size allowed.
// *Action: Use a shorter calendar string for the repeat interval.
/
27414, 00000, "Invalid %s clause value"
// *Cause:  The BY clause value was not recognized or was out-of-range for the 
//          frequency specified.
// *Action: Specify a valid BY clause value.
/
/
27415, 00000, "repeat interval or calendar must start with a frequency clause"
// *Cause:  The specified calendar string for the repeat interval did not start
//          with a frequency clause.
// *Action: Create a repeat interval that starts with a frequency clause,for example 
//          'FREQ=YEARLY;BYMONTH=FEB'
/
27416, 00000, "BYDAY clause in repeat interval or calendar contains an invalid weekday"
// *Cause:  The BYDAY clause of the repeat interval contained a value that
//          did not represent a weekday.
// *Action: Use the correct three letter abbreviations for weekdays, for example 
//          MON for Monday and FRI for Friday.
/
27417, 00000, "BYWEEKNO clause requires YEARLY clause"
// *Cause:  A repeat interval or calendar contained a BYWEEKNO clause
//          with a frequency other than yearly. 
// *Action: Remove the BYWEEKNO clause or change the frequency to YEARLY.
/
27418, 00000, "syntax error in repeat interval or calendar"
// *Cause:  The repeat interval or calendar definition was not 
//          recognized as valid syntax.
// *Action: Specify a valid repeat interval.
/
27419, 00000, "unable to determine valid execution date from repeat interval"
// *Cause:  The specified repeat interval contained conflicting clauses that
//          made it impossible to ever find a matching date, e.g.,
//          'FREQ=YEARLY;BYMONTH=FEB;BYMONTHDAY=31'. Alternatively,
//          the scheduler reached its maximum number of attempts to try to
//          find a valid execution date. This occurs when theoretically
//          there is a valid execution date far in the future, but the
//          scheduler took too many attempts to determine this date.
// *Action: Remove the conflicting clauses, or simplify the repeat interval
//          so that it is easier to determine the next execution date.
/
27420,00000, "Following  message from %s interval interpreter"
// *Cause:  The repeat interval or calendar definition was not 
//          recognized as valid syntax.
// *Action: Specify a valid repeat interval.
27421, 00000, "calendar expression restriction %s encountered"
// *Cause:  The calendar expression was not valid because a limit test failed.
//          For example, the maximum value of the interval that can be specified
//          in the INTERVAL clause is limited to a value derived from the frequency clause.
// *Action: Specify a valid calendar definition.
/
27422, 00000, "usage of %s not supported in embedded calendar application \"%s\".\"%s\""
// *Cause:  The main calendar definition used an embedded calendar in an INCLUDE,
//           EXCLUDE, INTERSECT, or FREQ clause for which extra limitations 
//            apply.
// *Action: Remove the specific clause from the calendar definition.
/
27423,00000, "calendar clause %s specified more than once"
// *Cause:  The calendar definition contained a clause that was specified 
//           twice or more times. 
// *Action: Append the values in the second clause to the first clause 
//          and remove the second clause.
27424,00000, "calendar clauses %s and %s are incompatible"
// *Cause:  The calendar definition contained clauses that were incompatible. 
// *Action: Change or remove either clause. 
/
27425,00000, "instance_id cannot be specified if database is not in Oracle RAC mode"
// *Cause: 'stop_job' was called with 'instance_id' outside Oracle RAC mode.
// *Action: Do not specify this parameter for 'stop_job' unless in Oracle RAC mode.
/
/
/ 27431 - 27500 Scheduler API errors continuation
/
27431, 00000, "chain \"%s\".\"%s\" has a user-managed rule set"
// *Cause: An attempt was made to modify a rule set that is not managed by the
//         Scheduler.
// *Action: Modify the rule set directly using the dbms_rule_adm package or
//          create another chain without specifying a rule set.
27432, 00000, "step \"%s\" does not exist for chain \"%s\".\"%s\""
// *Cause: The step specified does not exist for the given chain.
// *Action: Reissue the command using a step that exists for this chain.
27433, 00000, "cannot alter state of step \"%s\" for job \"%s\".\"%s\" to %s"
// *Cause: The step cannot be changed to the requested state. The state of a
//         running step cannot be changed. A step which is running or has
//         already run cannot be run again.
// *Action: Wait until the step has finished running.
27434, 00000, "cannot alter chain step job \"%s\".\"%s\".\"%s\""
// *Cause: A step job of a running chain cannot be altered, only stopped or
//         dropped.
// *Action: Stop or drop the chain step job or alter the running chain step
//          instead.
27435, 00000, "chain job terminated abnormally"
// *Cause: A chain job has ended abnormally. The error code for the running
//         chain could not be retrieved.
// *Action: No action necessary. The job will run again when it is scheduled
//         to.
27436, 00000, "Scheduler agent operation failed with message: %s"
// *Cause:  The Scheduler agent encountered an unexpected error when trying to 
//          perform the specified action. 
// *Action: Review the provided message and the Scheduler agent log for
//          information on how to fix the issue or contact Oracle Support
//          Services.
27451, 00000, "%s cannot be NULL"
// *Cause: An attempt was made to set a NOT NULL scheduler attribute to NULL.
// *Action: Reissue the command using a non-NULL value for the specified
//          attribute.
27452, 00000, "\"%s\" is an invalid name for a database object."
// *Cause: An invalid name was used to identify a database object.
// *Action: Reissue the command using a valid name.
27453, 00000, "\"%s\" is an invalid job or program argument name."
// *Cause: An invalid job or program argument name was specified.
// *Action: Reissue the command using a valid name for this argument.
27454, 00000, "argument name and position cannot be NULL"
// *Cause: The name or position of a program or job argument was defined as
//         NULL.
// *Action: Reissue the command providing either a valid argument name or
//          valid argument position.
27455, 00000, "Only \"SYS\" is a valid schema for a %s."
// *Cause: A non-SYS schema was specified for an object that must be in the
//         SYS schema.
// *Action: Reissue the command, leaving out the schema name or using the
//          schema name of SYS.
27456, 00000, "not all arguments of program \"%s\".\"%s\" have been defined" 
// *Cause: The number_of_arguments attribute of the named program did not
//         match the actual number of arguments that have been defined.
// *Action: Define as many arguments as the number of arguments, or change 
//          the number of arguments. 
27457, 00000, "argument %s of job \"%s\".\"%s\" has no value"
// *Cause: No value was provided for the job argument with the specified
//         position.
// *Action: Provide a value for the job argument using any of the
//          set_job_xxxx_value() routines. Or, when using a named program,
//          specify a default value for the corresponding argument of the
//          program.
27458, 00000, "A program of type PLSQL_BLOCK cannot have any arguments." 
// *Cause: An attempt was made to create or enable a program of type
//         PLSQL_BLOCK with arguments. This is not allowed. 
// *Action: Change the number of arguments to zero, or change the type 
//          of the program. 
27459, 00000, "A program of type EXECUTABLE must have character-only arguments."
// *Cause: A program of type EXECUTABLE was created or enabled with one or
//         more arguments of non-character datatypes.
// *Action: Change the arguments to be of character-only datatypes.
27460, 00000, "cannot execute disabled job \"%s\".\"%s\""
// *Cause: An attempt was made to run a job that is disabled.
// *Action: Enable the job and then reschedule the job.
27461, 00000, "The value for attribute %s is too large."
// *Cause: The value that was provided for the specified attribute was too
//         large.
// *Action: Reissue the command using a smaller or shorter value.
27463, 00000, "invalid program type %s"
// *Cause: An invalid program type was specified.
// *Action: Reissue the command using a valid program type.
27464, 00000, "invalid schedule type %s"
// *Cause: An invalid schedule type was specified.
// *Action: Reissue the command using a valid schedule type.
27465, 00000, "invalid value %s for attribute %s"
// *Cause: An invalid value was provided for the specified attribute.
// *Action: Reissue the command using a valid value for this attribute.
27466, 00000, "internal scheduler error: %s"
// *Document: NO
// *Cause: The scheduler ran into an internal error.
// *Action: Contact Oracle Customer Support.
27467, 00000, "invalid datatype for %s value"
// *Cause: The value provided for the named scheduler attribute was of an
//         invalid datatype.
// *Action: Reissue the command using a value of the correct datatype.
27468, 00000, "\"%s\".\"%s\" is locked by another process"
// *Cause: An attempt was made to read or modify the state of the named
//         scheduler object when another process was also updating the same
//         object and held the lock.
// *Action: Retry the operation. Scheduler locks are held for a very
//          short duration. If the error persists, contact Oracle Support.
27469, 00000, "%s is not a valid %s attribute"
// *Cause: A non-existant attribute was specified.
// *Action: Reissue the command using a valid attribute for that specific
//          scheduler object.
27470, 00000, "failed to re-enable \"%s\".\"%s\" after making requested change"
// *Cause: A change was made to an enabled scheduler object that caused it
//         to become disabled.
// *Action: Alter the object so that it becomes valid and then enable it.
27471, 00000, "window \"%s\".\"%s\" is already closed"
// *Cause: An attempt was made to close a window that was not open.
// *Action: No action required.
27472, 00000, "invalid metadata attribute %s"
// *Cause: An invalid metadata attribute was specified.
// *Action: Reissue the command using a valid metadata attribute.
27473, 00000, "argument %s does not exist"
// *Cause: An argument which was specified does not exist.
// *Action: Reissue the command using an argument name defined by the program
//          or using a valid argument position.
27474, 00000, "cannot give both an argument name and an argument position"
// *Cause: An argument was specified using both a name and a position.
// *Action: Reissue the command using either the argument name or the argument
//          position but not both.
27475, 00000, "unknown %s \"%s\".\"%s\""
// *Cause: The specified object did not exist, privileges were not granted,
//         or the object was of the wrong type.
// *Action: Specify an object of the correct type on which you have privileges.
27476, 00000, "\"%s\".\"%s\" does not exist"
// *Cause: A database object was specified that does not exist.
// *Action: Reissue the command using an object that exists or create a new
//          object and then reissue this command.
27477, 00000, "\"%s\".\"%s\" already exists"
// *Cause: An attempt was made to create an object with a name that has
//         already been used by another object in the same schema.
// *Action: Reissue the command using a different name or schema.
27478, 00000, "job \"%s\".\"%s\" is running"
// *Cause: An attempt was made to drop a job that is currently running.
// *Action: Stop the job and then reissue the command, or reissue the command
//          specifying the force option to stop the job first.
27479, 00000, "Cannot %s \"%s\".\"%s\" because other objects depend on it"
// *Cause: An attempt was made to drop or disable a scheduler object that has
//         jobs associated with it without specifying the force option.
// *Action: Alter the associated jobs so they do not point to the scheduler
//          object being dropped or disabled and then reissue the
//          command. Alternatively reissue the command specifying the force
//          option. If
//          the force option is specified and a scheduler object is being
//          dropped, all associated jobs will be disabled.
27480, 00000, "window \"%s\" is currently open"
// *Cause: An attempt was made to drop a window that is currently open, or
//         to manually open a window while another window is already open.
// *Action: Close the window that is open and then reissue the command, or
//          reissue the command while setting the force option to TRUE.
27481, 00000, "\"%s\".\"%s\" has an invalid schedule"
// *Cause: An attempt was made to enable a job or window that has an invalid
//         schedule.
// *Action: Alter the schedule of the job or window so that it is valid and
//          then reissue the enable command.
27482, 00000, "The scheduler credential \"%s\".\"%s\" is unusable." 
// *Cause: An attempt was made to use a scheduler credential for which the
//         key to decrypt its password was lost. Therefore, the password of the
//         credential could not be retrieved.
// *Action: Reset the PASSWORD attribute of the credential by calling 
//          DBMS_CREDENTIAL.UPDATE_CREDENTIAL.
27483, 00000, "\"%s\".\"%s\" has an invalid END_DATE" 
// *Cause: An attempt was made to enable a job or window that has an invalid
//         end_date. Either the end_date is before the start_date or the
//         end_date is in the past. 
// *Action: Alter the job or window so that the end date becomes valid
//          (possibly null) and then reissue the command.
27484, 00000, "Argument names are not supported for jobs without a program."
// *Cause: An attempt was made to set or reset a job argument by using the
//         name of the argument. Identifying job arguments by their name is
//         only supported in combination with jobs that are based on programs.
//         Jobs that are not using a program cannot have named arguments.
// *Action: Use argument position instead of name and then issue the command
//          again.
27485, 00000, "argument \"%s\" already exists at a different position" 
// *Cause: An attempt was made to create or replace an argument with a name
//         that is already used by an argument at a different position.
// *Action: Use a different name for the argument or drop or alter the
//          argument which already exists with this name and then reissue the
//          command.
27486, 00000, "insufficient privileges"
// *Cause: An attempt was made to perform a scheduler operation without the
//         required privileges.
// *Action: Ask a sufficiently privileged user to perform the requested
//          operation, or grant the required privileges to the proper user(s).
27487, 00000, "invalid object privilege for a %s" 
// *Cause: The granted object privilege is not valid for the specified
//         scheduler object.
// *Action: Check the scheduler documentation to verify which object privileges
//          can be granted on which scheduler objects.
27488, 00000, "unable to set %s because %s was/were already set"
// *Cause: An attempt was made to set an object's attribute even though one
//         or more conflicting attributes of the same object had already been
//         set.
// *Action: Set the other conflicting attributes to NULL and then reissue
//          the command.
27489, 00000, "unable to process job \"%s\".\"%s\" from job class \"%s\""
// *Cause: An error was encountered while processing the named job from
//         the specified job class.
// *Action: Resolve the error for this job and then reissue the command.
//          See the next error message on the stack to find out what the error
//          for the job is.
27490,0000, "cannot open disabled window \"%s\".\"%s\""
//  *Cause:  The user tried to open a disabled window.
// *Action:  Enable the window and then try to open it again.
27491,0000, "repeat_interval and start_date cannot both be NULL"
//  *Cause:  An attempt was made to set both repeat_interval and start_date
//           to equal NULL for a Scheduler window or schedule.
// *Action:  If either repeat_interval or start_date is set to equal NULL,
//           the other should be set to a non-NULL value.
27492,0000, "unable to run job \"%s\".\"%s\": scheduler unavailable" 
//  *Cause:  A job run with current session set to false can not be issued 
//           if the scheduler is not active. Check value of job_queue_processes 
//           parameter, issue dbms_ijob.set_enabled(true), 
//           database is in upgrade/migrade mode,  database is in data guard
//           mode, or scheduler attribute SCHEDULER_DISABLED is set to TRUE  
// *Action:  Run the job in the current session or activate the scheduler
27493,0000, "In-memory job \"%s.%s\" cannot be modified"
// *Cause:   Once enabled, the full in-memory job could not be further modified.
// *Action:  The only actions that can be taken now are to stop or drop the
//           job.
27494,0000, "operation not permitted on lightweight and in-memory jobs"
// *Cause:   An attempt was made to perform an action that was not 
//           permitted.
// *Action:  Check Oracle Scheduler documentation to see which actions can be 
//           performed on the desired job. 
27495,0000, "attribute %s cannot be set for in-memory jobs"
// *Cause:   An attempt was made in a CREATE or SET_ATTRIBUTE call to set
//           an attribute that could not be set for run-time in-memory jobs.
// *Action:  If you need to set this attribute, use either regular or 
//           lightweight jobs.
27496,0000, "credential \"%s\".\"%s\" is disabled"
// *Cause:   An attempt was made to run a job, file watcher or external
//           procedure whose credential was disabled.
// *Action:  Reenable the credential before running the job, file watcher or
//           external procedure.
27497,0000, "operation is not permitted inside a pluggable database"
// *Cause:   This operation was not permitted in a pluggable database.
// *Action:  Log into the root database and retry the operation.
27498,0000, "resource constraint object type mismatch"
// *Cause:   Not all of the resource constraints of a resource were of the same type.
// *Action:  Delete existing constraints for the resource.

27499,0000, "in-memory job metadata is too large"
// *Cause:   The in-memory job was too large. Due to the need to keep 
//           in-memory jobs efficient and performing well,we limit the size 
//           of in-memory job metadata to 8 kilobytes. This includes the 
//           space used for job argument values.
// *Action:  Reduce the size of the job metadata and try again. If all the 
//           metadata is needed, then you should create some other type of
//           job.
/
/ 27500-27599 RESERVED FOR IPC ERRORS
/
27500, 00000, "inter-instance IPC error"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the extra information and contact Oracle Support Services.
27501, 00000, "IPC error creating a port"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27502, 00000, "IPC error deleting OSD context"
// *Cause: This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27503, 00000, "IPC error attempting to cancel request"
// *Cause: This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27504, 00000, "IPC error creating OSD context"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27505, 00000, "IPC error destroying a port"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27506, 00000, "IPC error connecting to a port"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27507, 00000, "IPC error disconnecting from a port"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27508, 00000, "IPC error sending a message"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27509, 00000, "IPC error receiving a message"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27510, 00000, "IPC error waiting for a request to complete"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27512, 00000, "IPC error posting a process"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27513, 00000, "parameter %s contains invalid value %s"
// *Cause:  The program could not identify the value as an IP address.
// *Action: Change the value to be a valid IP address.
27514, 00000, "IPC error copying memory to remote process"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27515, 00000, "inadequate memlock limit or driver settings"
// *Cause: Inter Process Communication(IPC) queue creation failed due to
//         inadequate memlock limit or driver settings.
// *Action: Set a higher memlock limit and review the network driver
//          settings to ensure that this limit is accepted.

27528, 00000, "Transport: %s required by %s is not available"
// *Cause:   The IP addresses assigned to the instance did not support 
//           the specified transport.
// *Action:  Check the IP addresses used in the alert log
//           and contact Oracle Support Services. 
27529, 00000, "IPC IP address %s is not available."
// *Cause:   The IP address assigned to the instance was not associated with
//           any network adapters.
// *Action:  Ensure that the IP address is assigned to a network adapter.
27530, 00000, "IPC Ephemeral ports on IP address %s are exhausted."
// *Cause:   The ephemeral ports on the IP address assigned to the instance 
//           were exhausted.
// *Action:  Increase the ephemeral port range.
// 27531, 00000, "<<reuse me>>"
// *Cause:
// *Action:
27532, 00000, "IPC global name service error"
// *Cause: The global name space service used by KSXP reported an error
// *Action: Check additional error messages in the process trace file and 
//          contact Oracle Support Services.

// 27533, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27534, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27535, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27536, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27537, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27538, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27539, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27540, 00000, "<<reuse me>>"
// *Cause:
// *Action:
// 27541, 00000, "<<reuse me>>"
// *Cause:
// *Action:
27542, 00000, "Failed to unprepare a buffer prepared for remote update"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27543, 00000, "Failed to cancel outstanding IPC request"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27544, 00000, "Failed to map memory region for export"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27545, 00000, "Fail to prepare buffer for remote update"
// *Cause:  This is an operating system/cluster interconnect error.
// *Action: Check the value of errno and contact Oracle Support Services.
27546, 00000, "Oracle compiled against IPC interface version %s.%s found version %s.%s"
// *Cause:  A misconfiguration or installation error occurred.
// *Action: Install the IPC library for this release of Oracle.
//
27547, 00000, "Unable to query IPC OSD attribute %s"
// *Cause:  This is an operating system-dependent IPC error.
// *Action: Contact Oracle support Services.
27548, 00000, "Unable to unprepare IPC buffer"
// *Cause:  This is an operating system-dependent IPC error.
// *Action: Contact Oracle support Services.
//
27550, 00000, "Target ID protocol check failed. tid vers=%s, type=%s, remote instance number=%s, local instance number=%s"
// *Cause:  The local Oracle Real Application Cluster instance and remote
//          instance are running with incompatible implementation of the
//          inter-instance IPC protocol library. A misconfiguration or
//          installation error occurred.
// *Action: Check additional error messages in the alert log and the process
//          trace file.
27551, 00000, "Number of IPC ports exceeds OSD limit %s"
// *Document: NO
// *Cause:  Attempted to create more IPC ports than is supported by OSD
// *Action: Contact Oracle Support Services.
27552, 00000, "exception accessing Global Shared Memory (GSM) in Oracle RAC cluster"
// *Cause:  GSM is used to provide shared memory semantics on an Oracle RAC cluster.
//          An error has occurred accessing shared memory hosted on a remote node.
//          This is an internal programming error.
// *Action: Contact Oracle Support Services.
//
27553, 00000, "incompatible IPC settings in Oracle RAC cluster"
// *Cause: Inter-process Communication (IPC) settings were not compatible with other
//         instances in the Oracle RAC cluster. 
// *Action: Check additional error messages in the alert log and IPC0 trace file.
//
/
/ 27600-27699 RESERVED FOR EXADATA (SAGE) and HOST/CELL ERRORS
/
/
27601, 00000, "Cell storage initialization failed, cell library error code [%s]"
// *Cause:  Cell storage client did not succeed in initializing.
// *Action: Check the value of errno and contact Oracle Support Services.
27602, 00000, "Failure to publish network status information, cell library error code [%s]"
// *Cause:  Network status information publishing failed.
// *Action: Check the value of errno and contact Oracle Support Services.
27603, 00000, "Cell storage I/O error, I/O failed on disk %s at offset %s for data length %s"
// *Cause:  Cell storage I/O read or write failed, possibly due to a configuration problem or a hardware failure.
// *Action: Check the value of errno and contact Oracle Support Services.
27604, 00000, "Cell storage ioctl error, ioctl failed on disk %s"
// *Cause:  Ioctl operation on a cell storage disk failed.
// *Action: Check the value of errno and contact Oracle Support Services.
27605, 00000, "Smart I/O failed as a handle could not be obtained to the cell \"%s\" as the cell is not accessible."
// *Cause:  The cell could have been unavailable.
// *Action: Ensure the cell is available. Check the network connectivity.
27606, 00000, "Smart I/O failed because the diskgroup was found to be unmounted. tablespace number: \"%s\", file number: \"%s\""
// *Cause:  The diskgroup to which the specified file belongs was found 
//          to be unmounted.
// *Action: Ensure that the diskgroup to which the specified file belongs
//          is mounted.
27607, 00000, "Smart I/O failed because there were no online disks. tablespace number: \"%s\", file number: \"%s\""
// *Cause:  There were no online disks found for the specified file.
// *Action: Ensure the diskgroup to which the specified file belongs to is mounted.
//          Ensure that the disks are online.  Check the availability of
//          cells and check the network.
27608, 00000, "Smart I/O failed because the disk \"%s\" on the cell \"%s\" was not open. error code: \"%s\", \"%s\""
// *Cause:  The specified disk on the specified cell could not be opened.
// *Action: Ensure the cell is available. Check the network.
27609, 00000, "Smart I/O failed due to a network error to the cell \"%s\". error code \"%s\", \"%s\""
// *Cause:  The specified cell could not be connected to.
// *Action: Ensure that the cell is available.  Check the network.
27610, 00000, "Smart I/O failed due to shortage of memory on the cell \"%s\""
// *Cause:  The specified cell had a shortage of memory to perform smart I/O.
// *Action: Reduce the parallel degree or number of Oracle sessions executing 
//          smart I/O.
27611, 00000, "Smart I/O failed due to a block corruption detected on the host. The block was received from cell \"%s\". disk: \"%s\", block: \"%s\", disk offset: \"%s\""
// *Cause:  The data block indicated was corrupted on the host, but
//          a corruption was not found on the cell.
// *Action: This may be due to a transient network error or a real block
//          corruption.  Check your network for any errors.  Analyze the 
//          segment to which the file belongs. If there is indeed a
//          corruption, try to restore the block using RMAN block recovery.
//          If there is a trace file, report the errors in it to Oracle
//          Support Services.  If analyze did not report an error and network
//          did not have any error, report the problem to Oracle Support
//          Services as this appears to be a software error.
27612, 00000, "Smart I/O failed due to a block corruption detected on the cell \"%s\". disk: \"%s\", block: \"%s\", disk offset: \"%s\""
// *Cause:  The data block indicated was found to be corrupted on the cell.
// *Action: This may be due to a software error or a real data corruption.
//          Analyze the segment.  If there is indeed a block corruption, try to
//          restore the block using RMAN block level recovery.  If there
//          is a trace file, report the errors in it to Oracle Support
//          Services.  If analyze did not report an error, report
//          the problem to Oracle Support Services as this appears to
//          be a software error.
27613, 00000, "Smart I/O failed due to an I/O error on the cell \"%s\". disk: \"%s\", block: \"%s\", disk offset: \"%s\" I/O size: \"%s\""
// *Cause:  An I/O request failed on the specified cell and disk.
// *Action: Check the specified disk on the cell.
27614, 00000, "Smart I/O failed due to an error \"%s, %s\" from the cell \"%s\". disk: \"%s\", block: \"%s\", disk offset: \"%s\" I/O size: \"%s\""
// *Cause:  An I/O request failed, due to an internal error on the specified
//          cell and disk.
// *Action: Report the problem to Oracle Support Services along with
//          the process trace file and alert log.
27615, 00000, "Smart I/O file to ASM disk translation failed with error: %s."
// *Cause:  An internal error caused a smart I/O operation to fail.
// *Action: Report the problem to Oracle Support Services along with
//          the process trace file and alert log.
27616, 00000, "ASM Allocation Unit: %s"
// *Cause:  This error message is usually accompanied by another message,
//          indicating the real problem.  This message exists to provide
//          additional information to Oracle Support Services.
// *Action: Check the next error message.
27617, 00000, "Smart I/O failed because of an internal error. Cell \"%s\", disk \"%s\", cell library error code \"%s, %s\", error information \"%s\""
// *Cause:  An internal error caused a smart I/O operation to fail.
// *Action: Report the problem to Oracle Support Services along with
//          the process trace file and alert log.
27618, 00000, "Smart I/O failed because of an internal error. Cell \"%s\", cell library error code \"%s, %s\", error information \"%s\""
// *Cause:  An internal error caused a smart I/O operation to fail.
// *Action: Report the problem to Oracle Support Services along with
//          the process trace file and alert log.
27619, 00000, "Smart I/O failed because of an internal error when determining the time zone file version. Error code \"%s\"" 
// *Cause:  An internal error caused a smart I/O operation to fail.
// *Action: Report the problem to Oracle Support Services along with
//          the process trace file and alert log.
27621, 00000, "The value of %s is not valid for parameter %s"
// *Cause:  Incorrect value is specified for an internal parameter.
// *Action: This parameter should only be set by Oracle Support Services.
//          Check the additional diagnostic information in the trace file and
//          contact Oracle Support Services for recommendations
//          on setting this parameter.
27622, 00000, "Cell automation worker action interrupted"
// *Document: NO
// *Cause:  Cell automation worker action was interrupted.
// *Action: This is used internally; no action is required.
27623, 00000, "Cell automation SQL action failed"
// *Cause:  Cell automation manager or worker process failed to execute
//          SQL action through OCI recursive call.
// *Action: Check the alert log and process trace file for additional
//          information. Contact Oracle Support Services if the errors
//          specified in the trace file cannot be corrected.
27624, 00000, "Smart I/O failed because the number of reconnects to the cell \"%s\" exceeded the maximum allowed \"%s\"."
// *Cause:  The number of reconnects to a cell exceeded the maximum allowed.
//          This problem indicates a possible network problem or a software problem
//          on the cell.
// *Action: If the cellsrv is being restarted repeatedly, in a short interval,
//          check the system load. The problem may be corrected by rebooting
//          the cell.  If the system is not overloaded, the repeated restarts
//          are likely due to software problem. Report the problem to Oracle
//          Support Services along with alert log and trace files.  If the cellsrv
//          is not restarting, the problem may be in the IB network. Check the
//          network between the host and all the cells.
27625, 00000, "Exadata configuration failed."
// *Cause:  One or both of the files, cellinit.ora and cellip.ora, were either invalid or missing.
// *Action: Check if the files, cellinit.ora and cellip.ora, are both present.
//          They can be found in the $OSSCONF directory. If both are present,
//          check if their contents are valid and correct.
//          If the files are invalid or missing, produce files with 
//          valid information in the $OSSCONF directory. For information on 
//          how to set up these files, see the Exadata Users Guide.
27626, 00000, "Exadata error: %s (%s)"
// *Cause:  The cause of this error is dependent on the context in which this error
//          is reported. 
// *Action: See the primary error reported with this error.
27627, 00000, "Software edition incompatible with Exadata storage."
// *Cause: Oracle Exadata can be used only with Oracle Database Enterprise Edition.
// *Action: Check if Oracle is linked with the Enterprise Edition options.
/
27628, 00000, "An invalid value was specified for the parameter %s."
// *Cause:  An invalid value was specified for a parameter.
// *Action: Check the additional diagnostic information in the trace file and
//          contact Oracle Support Services if further help is required.
27629, 00000, "External table smart I/O failed because the cell is not accessible."
// *Cause:  The cell was unavailable.
// *Action: Ensure the cell is available.
27630, 00000, "External table smart scan debugging event"
// *Document: NO
// *Cause:    This is an internal debugging event and must be enabled
//            only under the supervision of Oracle Support Services
//            or development.
// *Action:   None
27631, 00000, "External encryption or decryption is disabled."
// *Cause:  Either decryption was disabled in the cellinit.ora initialization
//          parameter file, or the cryptography mode requested by the database
//          was incompatible with what was available on the cell.
// *Action: No action is necessary.  The Exadata cell returns data in
//          pass-through mode when encryption or decryption is required.
27632, 00000, "Cryptography engine verification debugging event"
// *Document: NO
// *Cause:    This is an internal debugging event and must be enabled
//            only under the supervision of Oracle Support Services
//            or development.
// *Action:   None
27633, 00000, "RDBMS instance failed because no Exadata cells were discovered"
// *Document: NO
// *Cause:    This Oracle binary is enabled on Exadata and SuperCluster only.
//            However, the instance could not discover any Exadata cells.
// *Action:   If this is not Exadata or SuperCluster, then no action is
//            required. Otherwise, check the alert.log for additional 
//            error information.
27634, 00000, "RDBMS instance failed due to network device list mismatch"
// *Document: NO
// *Cause:    This is an internal event caused because the parameters 
//            cluster_interconnect and _ipcdat_device_list had a mismatch.
// *Action:   Set the two parameters cluster_interconnect and _ipcdat_device_list
//            to use the same devices. The parameters must be used under the 
//            supervision of Oracle Support Services or development.
/
/ 27700-27800 RESERVED FOR MGA 
/
27777, 00000, "MGA Tracing On"
// *Document: NO
// *Cause:    This is an internal debugging event and must be enabled
//            only under the supervision of Oracle Support Services
//            or development.
// *Action:   None
27778, 00000, "MGA namespace is already marked for deletion."
// *Cause: Managed Global Area (MGA) namespace was already marked for deletion.
//         No further attaches are allowed.
// *Action: None.
27779, 00000, "MGA segment creation failure"
// *Cause: The Managed Global Area (MGA) segment creation failed.
// *Action: Check the other error messages for additional information.
/
/ 27800-27900 RESERVED FOR EVENT NOTIFICATION (KSEVN)
/
27800, 00000, "invalid configuration (%s) for event creation (%s)."
// *Cause: Invalid configuration values were given while creating the event. 
// *Action: None.
/
27801, 00000, "event notification handle not valid"
// *Cause: The event notification handle was not valid.
// *Action: None.
/
27888, 00000, "Event Notification Tracing On"
// *Document: NO
// *Cause:    This is an internal debugging event and must be enabled
//            only under the supervision of Oracle Support Services
//            or development.
// *Action:   None
/
/ 28000-28499 RESERVED FOR SECURITY RELATED ERRORS
/
/
28000, 00000, "The account is locked."
// *Cause:   The wrong password was entered multiple consecutive times as
//           specified by the profile parameter FAILED_LOGIN_ATTEMPTS, or the
//           DBA locked the account, or the user is a common user locked in
//           the root container.
// *Action:  Wait for the PASSWORD_LOCK_TIME or contact the DBA.
/
28001, 00000, "the password has expired"
// *Cause:   The user's account has expired and the password needs to be
//           changed.
// *Action:  Change the password or contact the database administrator.
//
28002, 00000, "the password will expire within %s days"
// *Cause:   The password of the user's account has expired. Since the user's
//           account is associated with a password profile with a limited
//           password grace period and grace period is yet to elapse, the user
//           will not be prompted to input a new password and ORA-28002 warning
//           message will continue to be displayed upon each successful login
//           to the user account, until the user changes their password.
//           Once the grace period elapses, the password will expire and user
//           login will start failing with ORA-28001 error, until the user
//           changes their password.
// *Action:  Change the password or contact the database administrator.
//
28003, 00000, "password verification for the specified password failed"
// *Cause:   The new password did not meet the necessary complexity
//           specifications and the password_verify_function failed
// *Action:  Enter a different password. Contact the DBA to know the rules for
//           choosing the new password
//
28004, 00000, "invalid argument for function specified in PASSWORD_VERIFY_FUNCTION %s"
// *Cause:    The password verification function does not have the required
//            number and type of input/output arguments and/or the return
//            argument
// *Action:   Check the manual to find out the format of the password
//            verification function
//
28005, 00000, "invalid logon flags"
// *Cause:    The flags are not properly set or
//            conflicting flags are set in making calls
// *Action:   Call the function with appropriate flags set.
//
28006, 00000, "conflicting values for parameters %s and %s"
// *Cause:    The parameters PASSWORD_REUSE_TIME and PASSWORD_REUSE_MAX cannot
//            both be set. One parameter should be unlimited while other is set
// *Action:   Set one value to UNLIMITED explicitly
//
28007, 00000, "the password cannot be reused"
// *Cause:    The password cannot be reused for the specified number of
//            days or for the specified nunmber of password changes
// *Action:   Try the password that you have not used for the specified
//            number of days or the specified number of password changes
//            Refer to the password parameters in the CREATE PROFILE statement
//
28008, 0000, "invalid old password"
// *Cause:    old password supplied is wrong; Hence user cannot be
//            authenticated using old password
// *Action:   Supply the correct old password for authentication
//
28009, 00000, "connection as SYS should be as SYSDBA or SYSOPER"
// *Cause:    connect SYS/<password> is no longer a valid syntax
// *Action:   Try connect SYS/<password> as SYSDBA or
//            connect SYS/<password> as SYSOPER
//
28010, 00000, "cannot expire external users, global users, or users with no authentication method"
// *Cause:    If a user account is created as IDENTIFIED EXTERNALLY,
//            IDENTIFIED GLOBALLY, NO AUTHENTICATION, this account 
//            cannot be expired.
// *Action    Expire the password of a user that has "PASSWORD" as its 
//            AUTHENTICATION_TYPE in DBA_USERS views.
28011, 00000, "the password has expired; change your password now"
// *Cause:   The password of the user's account has expired. Since the user's
//           account is associated with a password profile with an UNLIMITED
//           password grace period, the user will not be prompted to input
//           a new password (as normally happens for accounts with a limited
//           grace period). Instead, ORA-28011 warning message will continue
//           to be displayed upon each successful login to the user account,
//           until the user changes their password.
// *Action:  Change the password or contact the database administrator.
//
28012, 00000, "connection as %s should use AS %s"
// *Cause:    An attempt was made to connect as an administrative user 
//            without using AS SYSBACKUP, AS SYSDG, or AS SYSKM.
// *Action:   Try connecting with AS SYSBACKUP, AS SYSDG, or AS SYSKM.
// 
28013, 00000, "the password has expired"
// *Cause:   The password of the proxy user expired.
// 
// *Action:  Connect directly as proxy user to change the password
//           or contact the DBA.  
//
28014, 00000, "cannot drop administrative user or role"
// *Cause:    An attempt was made to drop an administrative user or role.
//            An administrative user or role can be dropped only by SYS during
//            migration mode.
// *Action:   Drop the administrative user or role during migration mode.
//
28015, 00000, "account unlock attempted on read-only database but a conflicting account lockout on the primary exists"
// *Cause:    An attempt to unlock an account on a read-only database
//            was prevented, because the account was previously marked
//            as locked on the primary database. All attempts to unlock
//            the account on the read-only database will be prevented as
//            long as the overriding "account locked" condition exists at
//            the primary database.  
// *Action:   If this database is part of a Data Guard configuration,
//            perform the account unlock action on the primary database.
//            If this database is read-only, then set the database to 
//            read/write and perform the account unlock action.
//
28016, 00000, "Privilege %s cannot be granted to SYS."
// *Cause:    An attempt was made to grant SYSBACKUP, SYSDG or SYSKM
//            to the SYS user. These administrative privileges cannot
//            be granted to SYS.
// *Action:   Try granting the administrative privilege to other users.
//
28017, 00000, "The password file is in the legacy format."
// *Cause:    An attempt was made to perform one of the following operations,
//            but none of these operations are allowed while the password file
//            is in LEGACY format.
//              - Attempting to grant SYSBACKUP, SYSDG or SYSKM privileges.
//              - Attempting to grant an administrative privilege to a user
//                who has large password verifiers, for example, SHA-512
//                hashed verifiers.
//              - Attempting to grant a common administrative privilege to a
//                common user in a multitenant container database (CDB).
// *Action:   Create the password file in the new format ("12" or higher) or
//            migrate the existing password file in LEGACY format to the new
//            format ("12" or higher) using the INPUT_FILE option, then retry
//            the operation.
//
28018, 00000, "This operation requires connection as SYS or SYSBACKUP."
// *Cause:    An attempt was made to execute a command even though the
//            user was not connected as SYS or SYSBACKUP.
// *Action:   Connect as SYS or SYSBACKUP and retry this command.
//
28019, 00000, "audit cannot be configured on administrative privileges"
// *Cause:    An attempt was made to configure audit on an administrative
//            privilege using either the AUDIT, NOAUDIT, CREATE AUDIT POLICY, 
//            or ALTER AUDIT POLICY command.
// *Action:   For traditional audit, use AUDIT_SYS_OPERATIONS to audit 
//            administrative privileges. If this is a unified audit, use
//            action-based auditing to audit administrative users.
//
//
28020, 00000, "IDENTIFIED GLOBALLY already specified"
// *Cause:  The IDENTIFIED GLOBALLY clause was specified twice.
// *Action: Use only one IDENTIFIED GLOBALLY clause.
28021, 00000, "cannot grant global roles"
// *Cause:  The role granted was IDENTIFIED GLOBALLY. Global roles
//          can only be granted via a central authority for the domain.
// *Action: Use ALTER ROLE to change the type of role (from IDENTIFIED
//          GLOBALLY to other, such as IDENTIFIED BY password),
//          or allocate it to a global user via the central authority.
28022, 00000, "cannot grant external roles to global user or role"
// *Cause:  The role granted was IDENTIFIED EXTERNALLY.  External
//          roles cannot be granted to global users, to global roles or
//          to any other roles.
// *Action: Use ALTER ROLE to change the type of the role being granted
//          (from IDENTIFIED EXTERNALLY to other, such as NOT IDENTIFIED)
//          or use ALTER USER to change the type of the user that is the 
//          grantee.
28023, 00000, "must revoke grants of this role to other user(s) first"
// *Cause:  The role altered to IDENTIFIED GLOBALLY was granted to
//          one or more other users and/or roles.  Global roles cannot
//          be granted to any user or role.
// *Action: Use REVOKE to revoke the role from other users or roles first.
28024, 00000, "must revoke grants of external roles to this role/user"
// *Cause:  The user or role altered to IDENTIFIED GLOBALLY has
//          external roles directly granted - these must be revoked, since
//          external roles cannot be granted to global users or roles.
// *Action: Use REVOKE to revoke the external roles from the user or role
//          to be ALTERed.
28025, 0000, "missing or null external name"
// *Cause:  The IDENTIFIED EXTERNALLY AS or IDENTIFIED GLOBALLY AS
//          clause was specified with a valid external name.
// *Action: Provide a valid external name.
28026, 0000, "user with same external name already exists"
// *Cause:  The external name specified for the user being created or
//          altered already exists for another user.
// *Action: External names must be unique among users.  Specify another.
28027, 0000, "privileged database links may be used by global users"
// *Cause:  Only users IDENTIFIED GLOBALLY may use a privileged database
//          link.
// *Action: Either change the user to a global user or try to use a
//          different database link.
28028, 0000, "could not authenticate remote server"
// *Cause:  During the course of opening a privileged database link,
//          the remote server was not securely identified using the
//          network security service.  Additional errors should follow.
// *Action: Consult the network security service documentation on how
//          to properly configure the remote server.
28029, 0000, "could not authorize remote server for user %s"
// *Cause:  During the course of opening a privileged database link,
//          the remote server was found to lack the necessary authorizations
//          to connect as the current global user.
//          This may be because the server was not authorized by the network
//          security service.  Or it may be because the local server is
//          restricting access by the remote server using the
//          DBMS_SECURITY_DOMAINS_ADMIN package.
// *Action: Grant the remote server the proper authorization to connect as
//          the given global user, and check that the local server is not
//          restricting access.
28030, 0000, "Server encountered problems accessing LDAP directory service"
// *Cause:  Unable to access LDAP directory service
// *Action: Please contact your system administrator
28031, 00000, "maximum of %s enabled roles exceeded"
// *Cause:  The user attempted to enable too many roles.
// *Action: Enable fewer roles.
28032, 00000, "Your password has expired and the database is set to read-only"
// *Cause:  Your password expired and needs to be changed before
//          your login request can be processed.
//          Because the database is currently open in read-only mode, the
//          password change operation cannot be performed on this database.
// *Action: Log in to the primary database to change your password, then
//          retry your login request at the standby database.

28033, 0000, "LDAP problem"
// *Document: NO
// *Cause:
// *Action:

28034, 00000, "cannot grant %s to an Oracle supplied user"
// *Cause:  The KEEP DATE TIME, KEEP SYSGUID or KEEP SEQUENCE
//          privilege could not be granted to an Oracle supplied user.
// *Action: Grant privilege directly to the application user.

28035, 0000, "Cannot Get Session Key for Authentication"
// *Cause:  Client and server cannot negotiate shared secret during logon
// *Action: User should not see this error.
//          Please contact your system administrator

28036, 0000, "HTTP digest authentication cannot be configured for this user"
// *Cause:  An attempt was made to configure HTTP digest authentication for a
//          global user, an external user, a no authentication type user,
//          or a SYS user.
// *Action: Contact your system administrator.

28037, 0000, "Cannot Get Session Key for RACF Authentication"
// *Cause:  Client and server cannot negotiate shared secret during logon
// *Action: User should not see this error.
//          Please contact your system administrator

28038, 0000, "disallow O2LOGON"
// *Cause: turn off O2LOGON
// *Action:

28039, 0000, "cannot validate Kerberos service ticket"
// *Cause:  The Kerberos service ticket provided was invalid or expired
// *Action: Provide a valid, unexpired service ticket.

28040, 0000, "No matching authentication protocol"
// *Cause:  There was no acceptable authentication protocol for 
//          either client or server.
// *Action: The administrator should set the values of the
//          SQLNET.ALLOWED_LOGON_VERSION_SERVER and 
//          SQLNET.ALLOWED_LOGON_VERSION_CLIENT parameters, on both the
//          client and on the server, to values that match the minimum 
//          version software supported in the system. 
//          This error is also raised when the client is authenticating to 
//          a user account which was created without a verifier suitable for
//          the client software version. In this situation, that account's 
//          password must be reset, in order for the required verifier to
//          be generated and allow authentication to proceed successfully.

28041, 0000, "Authentication protocol internal error"
// *Cause:  Authentication protocol failed with an internal error
// *Action:

28042, 0000, "Server authentication failed"
// *Cause:  Server failed to authenticate itself to the client
// *Action: Confirm that the server is a valid database server.

28043, 000, "invalid bind credentials for DB-OID connection"
// *Cause: The Database password stored in the wallet did not match 
//         the one in OID .
// *Action: Use DBCA to reset the  database password so that it 
//          is the same in database wallet and in OID.

28044, 000, "unsupported directory type"
// *Cause: The database tried to work with a directory which is not OID.
// *Action: Enterprise User Security works only with Oracle Internet Directory.
//          Update the ldap.ora file to reflect an appropriate OID.

28045, 000, "SSL authentication between database and OID failed"
// *Cause: Server failed to authenticate itself to the Directory.
// *Action: Make sure the sqlnet.ora used is pointing to the wallet
//          with the right certificate.

28046, 0000, "Password change for SYS disallowed"
// *Cause:  REMOTE_LOGIN_PASSWORDFILE is set to SHARED, prohibiting SYS
//          password changes.
// *Action: Change setting of REMOTE_LOGIN_PASSWORDFILE to EXCLUSIVE or NONE.

28047, 0000, "database is not a member of any enterprise domain in OID"
// *Cause: An enterprise user login was attempted on a database that is
//         not a member of any enterprise domain in OID.
// *Action:  An administrator should put the database into an enterprise
//           domain in OID, and then the user should reconnect.

28048, 0000, "database is a member of multiple enterprise domains in OID"
// *Cause: An enterprise user login was attempted on a database that is
//         a member of multiple enterprise domains in OID.
// *Action:  An administrator should put the database into only one
//           enterprise domain in OID, and then the user should reconnect.

28049, 00000, "the password has expired"
// *Cause:   The enterprise user's password has expired and the password 
//           needs to be changed.
// *Action:  change the password in the directory or contact the directory 
//           administrator.

28050, 00000, "specified user or role cannot be dropped"
// *Cause:   The user or role specified in the DROP statement was a reserved 
//           Oracle object that could not be dropped.
// *Action:  None.

28051, 00000, "the account is locked"
// *Cause:   The enterprise user has consecutively entered the wrong password
//           for maximum number of times specified in the realm's
//           password policy profile.
// *Action:  Contact the directory administrator.

28052, 00000, "the account is disabled"
// *Cause:   The enterprise user's account in the directory has been disabled. 
// *Action:  Contact the directory administrator.

28053, 00000, "the account is inactive"
// *Cause:   The enterprise user's account in the directory is currently not
//           active.
// *Action:  Contact the directory administrator.

28054, 00000, "the password has expired. %s Grace logins are left"
// *Cause:   The enterprise user's password has expired. The user is
//           able to login because he has gracelogins left.
// *Action:  change the password in the directory or contact the directory
//           administrator.

28055, 00000, "the password will expire within %s days"
// *Cause:   The enterprise user's password is about to expire.
// *Action:  Change the password in the directory or contact the directory 
//           administrator.

28056, 00000, "Writing audit records to Windows Event Log failed"
// *Cause:  Unable to write an audit entry to the Windows event log
//          used as the audit trail.
// *Action: Check the error number for a possible operating system error.
//          If there is no error, contact Oracle Support Services.

28057, 00000, "name of the password file could not be constructed"
// *Cause:  Possibly environment variable ORACLE_SID was not set.
// *Action: Set value for the ORACLE_SID environment variable.

28058, 00000, "login is allowed only through a proxy"
// *Cause:   This account is marked "proxy only connect".
// *Action:  Connect through a proxy user.

28059, 0000, "Cross-instance call failed" 
// *Cause:   An attempt to inform other Oracle RAC instances of a security
//           event failed.
// *Action:  Log into each instance to perform the administrative
//           action.
/
/ 28060-28099 RESERVED FOR RADM (Real-time Application-controlled Data Masking)
/
28060, 00000, "A data redaction policy already exists on this column."
// *Cause:   A data redaction policy was already in existence on this column.
// *Action:  Specify a colunm which does not already have a redaction policy
//           defined on it, or use DBMS_REDACT.ALTER_POLICY to alter the
//           existing redaction policy for this column.

28061, 00000, "This object cannot have a data redaction policy defined on it."
// *Cause:   An attempt was made to define a data redaction policy on an object
//           other than a table or view. Note that a data redaction policy
//           cannot be defined on an editioned view, or on specialized tables 
//           created internally by the server in conjunction with various 
//           features such as materialized view.
// *Action:  Specify the name of a table or view.

28062, 00000, "The policy expression is too long."
// *Cause:   The policy expression was longer than 4000 characters.
// *Action:  Specify a policy expression of at most 4000 characters.

28063, 00000, "The policy expression is empty."
// *Cause:   The EXPRESSION parameter to DBMS_REDACT.ADD_POLICY was empty.
// *Action:  A nonempty policy expression must be specified in
//           the EXPRESSION parameter to DBMS_REDACT.ADD_POLICY.

28064, 00000, "The redaction function is not valid."
// *Cause:   The FUNCTION_TYPE parameter to DBMS_REDACT.ADD_POLICY was invalid.
// *Action:  Specify the FUNCTION_TYPE parameter to DBMS_REDACT.ADD_POLICY
//           as one of the following: DBMS_REDACT.NONE, DBMS_REDACT.FULL,
//           DBMS_REDACT.RANDOM, DBMS_REDACT.PARTIAL, DBMS_REDACT.REGEXP,
//           or DBMS_REDACT.NULLIFY. Note that only none redaction, full 
//           redaction, and NULL redaction may be applied to columns of type 
//           BLOB, and only none redaction, full redaction, NULL redaction,
//           and regular expression-based redaction may be applied to columns 
//           of type CLOB or NCLOB.
/
/ 28065 is reserved for RADM internal error.
/
28066, 00000, "invalid column \"%s\""
// *Cause:  An invalid column was specified in the COLUMN_NAME parameter.
// *Action: Check the columns in the object and specify the right column name.

28067, 00000, "missing or invalid column name"
// *Cause:  A valid column name was not specified in the COLUMN_NAME parameter
//          when a column name was required.
//          Note that when using DBMS_REDACT.ALTER_POLICY, the default action
//          is DBMS_REDACT.ADD_COLUMN
// *Action: Specify the name of a column.

28068, 00000, "The object \"%s\" does not have a data redaction policy."
// *Cause:  The specified object did not have a data redaction policy defined
//          on it.
// *Action: Specify the name of an object which has a data redaction policy,
//          or use DBMS_REDACT.ADD_POLICY to add a data redaction policy.

28069, 00000, "A data redaction policy already exists on this object."
// *Cause:   A data redaction policy was already in existence on this object.
// *Action:  Specify a table or view which does not already have a redaction
//           policy defined on it, or use DBMS_REDACT.ALTER_POLICY to alter the
//           existing redaction policy for this object.

28070, 00000, "The column \"%s\" does not have a data redaction policy."
// *Cause:  The specified column did not have a data redaction policy defined
//          on it.
// *Action: Specify the name of a column which has a data redaction policy.

28071, 00000, "The action is not valid."
// *Cause:   The ACTION parameter to DBMS_REDACT.ALTER_POLICY was invalid.
// *Action:  Specify the ACTION parameter to DBMS_REDACT.ALTER_POLICY
//           as one of the following values: DBMS_REDACT.MODIFY_EXPRESSION,
//           DBMS_REDACT.MODIFY_COLUMN, DBMS_REDACT.ADD_COLUMN,
//           or DBMS_REDACT.DROP_COLUMN.

28072, 00000, "The specified policy name is incorrect."
// *Cause:   The POLICY_NAME parameter was incorrect.
// *Action:  Specify the POLICY_NAME parameter with the name of the
//           redaction policy currently defined on the object.

28073, 00000, "The column \"%s\" has an unsupported data type or attribute."
// *Cause:   The column had a data type or attribute which is not supported
//           by data redaction.  The supported data types are CHAR, NCHAR,
//           VARCHAR2, NVARCHAR2, NUMBER types, BINARY_FLOAT, BINARY_DOUBLE,
//           DATE, TIMESTAMP, CLOB, NCLOB, and BLOB, except as listed below 
//           for certain function types:
//           For DBMS_REDACT.PARTIAL and DBMS_REDACT.RANDOM,
//           the CLOB, NCLOB, and BLOB datatypes are not supported.
//           For DBMS_REDACT.REGEXP, the NUMBER, BINARY_FLOAT, BINARY_DOUBLE, 
//           DATE, TIMESTAMP, and BLOB datatypes are not supported.
//           Virtual columns and base columns of virtual columns are  
//           not supported by data redaction.
//           Columns with the INVISIBLE attribute are not supported by
//           data redaction (this applies to both user-specified hidden
//           columns and system-generated hidden columns).
//           Vector encoded columns are not supported by data redaction.
//           Columns with the IS JSON constraint are not supported.
// *Action:  Specify the name of a column which has a supported data type
//           and supported attributes. For columns with the IS JSON constraint,
//           create a view on the columns and add the redaction policy to the
//           view.

28074, 00000, "The \"%s\" field of the redaction parameters is not valid."
// *Cause:   The redaction parameters specified had one or more fields that
//           were invalid.
// *Action:  Specify the redaction parameters according to Oracle documentation.

28075, 00000, "The data redaction policy expression has an error."
// *Cause:   The data redaction policy expression had an error.
// *Action:  Contact the data redaction policy administrator.
//           To correct this error, when invoking the ADD_POLICY and
//           ALTER_POLICY procedures of the data redaction DBMS_REDACT
//           package, the policy administrator must specify a valid
//           policy expression for the EXPRESSION parameter.
//           Check the trace file for the name of the affected policy and
//           the error, and correct the data redaction policy expression.

28076, 00000, "An attribute was not specified for SYS_SESSION_ROLES."
// *Cause:   An attribute was not specified for the SYS_SESSION_ROLES
//           namespace in the policy expression.
// *Action:  Specify an attribute for SYS_SESSION_ROLES in the policy expression.

28077, 00000, "The attribute specified (%s) exceeds the maximum length."
// *Cause:   The attribute specified in the policy expression for the
//           SYS_SESSION_ROLES namespace exceeded the maximum length.
// *Action:  Change the policy expression to use a valid attribute for
//           SYS_SESSION_ROLES namespace.

28078, 00000, "A regular expression parameter is missing or invalid."
// *Cause:   The FUNCTION_TYPE was DBMS_REDACT.REGEXP, but one or more
//           of the regular expression parameters were missing or invalid,
//           the REGEXP_PATTERN failed to compile properly, or the
//           regular expression replacement operation failed.
// *Action:  Specify the regular expression parameters according to 
//           Oracle documentation.  At a minimum, the REGEXP_PATTERN and
//           the REGEXP_REPLACE_STRING must be specified.  Ensure that
//           the REGEXP_PATTERN can compile properly as a regular expression,
//           for example by testing it with REGEXP_REPLACE in a SQL query
//           against a column containing some of the data to be redacted.

28079, 00000, "The policy was already enabled."
// *Cause:   The redaction policy specified has already been enabled.
// *Action:  Only disabled redaction policies can be enabled.
//

28080, 00000, "The policy was already disabled."
// *Cause:   The redaction policy specified has already been disabled.
// *Action:  Only enabled redaction policies can be disabled.
//

28081, 00000, "Insufficient privileges - the command references a redacted object."
// *Cause: The command referenced a redacted column in an
// object protected by a data redaction policy.
// *Action: If possible, modify the command to avoid referencing any
// redacted columns.  Otherwise, drop the data redaction policies that
// protect the referenced tables and views, or ensure that the user issuing
// the command has the EXEMPT REDACTION POLICY system privilege, then
// retry the operation.  The EXEMPT REDACTION POLICY system privilege
// is required for creating or refreshing a materialized view when the
// materialized view is based on an object protected by a data redaction 
// policy.  The EXEMPT REDACTION POLICY system privilege is required for
// performing a data pump schema-level export including any object 
// protected by a data redaction policy.  All data redaction policies are 
// listed in the REDACTION_COLUMNS catalog view.

28082, 00000, "The parameter %s is invalid."
// *Cause:   The specified parameter was either empty or too long.
// *Action:  Specify a parameter of correct length. See the 
//           documentation for length requirements.

28083, 00000, "A redacted column was referenced in a virtual column expression."
// *Cause:   This redacted column was referenced in a virtual column
//           expression.
// *Action:  Ensure the column expression definition for any virtual column
//           does not refer to any redacted columns.  To check for columns
//           with redaction policies, use the REDACTION_COLUMNS catalog view
//           which lists all data redaction policies.

28084, 00000, "internal event to enable data redaction statistics gathering"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your instance initialization file
//          to enable gathering of statistics for data redaction.
// *Note: This is not a user error number or message.
//        This message does not need to be translated or documented.

28085, 00000, "The input and output lengths of the redaction do not match."
// *Cause:   As specified, the redaction parameters produced an output
//           with a length different to that of the input.
// *Action:  Use regular expression redaction instead of partial redaction.

28086, 00000, "The data redaction policy expression has an error.\n%s"
// *Cause:   The data redaction policy expression had an error.
// *Action:  Specify a valid policy expression.
//           The data redaction policy expression must be written in SQL,
//           and must be a valid predicate to use in the following SQL query.
//             SELECT 1 FROM DUAL WHERE policy_expression;

28087, 00000, "The policy expression has an unsupported (use of) operator '%s'."
// *Cause:   The policy expression used an unsupported operator, 
//           or used an operator in an unsupported way.
// *Action:  Modify the policy expression to use only the supported operators
//           in a supported way. Supported operators include "=", "!=", ">",
//           "<", ">=", "<=", the length operators, the substring operators,
//           and the context operators (SYS_CONTEXT and XS_SYS_CONTEXT).
//           For a complete list of the supported operators, and the supported
//           ways the allowed operators can be used, refer to the section on
//           data redaction policy expressions in the Oracle documentation.

28088, 00000, "The policy expression has an unsupported PL/SQL function %s.%s.%s."
// *Cause:   The policy expression had an unsupported PL/SQL function.
// *Action:  Modify the policy expression to use a supported PL/SQL function.
//           Supported PL/SQL functions include the Oracle Label Security
//           dominates functions, and the Oracle Apex session state
//           functions (V and NV).
//           For a complete list of the supported PL/SQL functions,
//           refer to data redaction in the Oracle documentation.

28089, 00000, "invalid SYS_CONTEXT namespace %s in policy expression"
// *Cause:   The SYS_CONTEXT (or XS_SYS_CONTEXT) namespace used in the 
//           policy expression was not valid.
// *Action:  Modify the policy expression to use a valid namespace.
//           Supported namespaces include USERENV, SYS_SESSION_ROLES,
//           XS$SESSION and the namespaces listed in the DBA_CONTEXT
//           catalog view.

28090, 00000, "unsupported nesting of function %s.%s.%s within function %s.%s.%s in policy expression"
// *Cause:   The policy expression had an unsupported PL/SQL function nesting.
// *Action:  Modify the policy expression to use only supported PL/SQL
//           function nesting. The Oracle Label Security functions
//           NUMERIC_LABEL, CHAR_TO_LABEL, and SA_SESSION can only be
//           used from within the Label Security dominates functions.
//           For a complete list of supported PL/SQL function nesting,
//           refer to the section on writing policy expressions
//           in the Oracle documentation for data redaction.

28091, 00000, "unsupported use of PL/SQL function %s.%s.%s in policy expression"
// *Cause:   The policy expression used a PL/SQL function in an unsupported way.
// *Action:  Modify the policy expression to use the PL/SQL function properly.
//           The parameters to the Oracle Label Security functions
//           NUMERIC_LABEL, CHAR_TO_LABEL, and SA_SESSION must be constants.
//           For a complete list of the supported ways PL/SQL functions
//           can be used in a policy expression, refer to the section on 
//           writing policy expressions in the Oracle documentation for 
//           data redaction.

28092, 00000, "The parameter %s with value '%s' has an error."
// *Cause:   The value of the parameter had an error.
//
//           If DBMS_REDACT.CREATE_POLICY_EXPRESSION was invoked and
//           the POLICY_EXPRESSION_NAME parameter had an error,
//           the policy expression name either already existed,
//           or was invalid.
//
//           If DBMS_REDACT.DROP_POLICY_EXPRESSION was invoked and
//           the POLICY_EXPRESSION_NAME parameter had an error,
//           the policy expression either did not exist, was still
//           in use (was applied to a column), or was invalid.
//
//           If DBMS_REDACT.APPLY_POLICY_EXPR_TO_COL was invoked and
//           the POLICY_EXPRESSION_NAME parameter had an error,
//           a policy expression may already exist on this column.
//           Only one policy expression may be associated with any
//           given column.
//           The name of any Oracle Data Redaction policy expression
//           associated with a given column can be found
//           in the REDACTION_EXPRESSIONS catalog view.
//
//           If the DBMS_REDACT.ADD_POLICY was invoked and the OBJECT_SCHEMA
//           parameter referenced the APEX or Spatial installation schema,
//           the operation was prevented. Data redaction policies are not
//           supported on objects within the APEX or Spatial installation
//           schema.
//
//           If the DBMS_REDACT.ADD_POLICY was invoked and the OBJECT_NAME
//           references a metadata-linked view, the operation was prevented.
//           Data redaction policies are not supported on metadata-linked views.
//
//           If the DBMS_REDACT.ADD_POLICY was invoked and the OBJECT_NAME
//           references  an OLAP analytic workspace table, the operation was
//           prevented. Data redaction policies are not supported on OLAP
//           analytic workspaces.
//
// *Action:  Provide a valid value for the parameter.
//
//           If DBMS_REDACT.CREATE_POLICY_EXPRESSION was invoked and
//           the parameter was POLICY_EXPRESSION_NAME, provide a valid 
//           (new or existing) policy expression name.
//           The names of all existing Oracle Data Redaction policy
//           expressions can be found in the REDACTION_EXPRESSIONS
//           catalog view.
//
//           For the POLICY_EXPRESSION_NAME parameter of
//           the DBMS_REDACT.DROP_POLICY_EXPRESSION procedure,
//           provide a valid existing policy expression name
//           which is not currently in use (applied to any column).
//           The names of the columns to which a given policy expression
//           is currently applied can be found in the REDACTION_EXPRESSIONS
//           catalog view.
//
//           For the POLICY_EXPRESSION_NAME parameter of
//           the DBMS_REDACT.APPLY_POLICY_EXPR_TO_COL procedure,
//           either provide NULL to remove the current policy expression
//           association of the column, or provide a valid
//           existing policy expression name. There is currently no API
//           to alter an existing association. For now it must first be
//           dropped followed by applying the new association.
//           The names of all existing policy expressions can be
//           found in the REDACTION_EXPRESSIONS catalog view.
//
//           If DBMS_REDACT.ADD_POLICY was invoked, provide an 
//           OBJECT_SCHEMA which is not the APEX or Spatial installation
//           schema.  Data redaction policies are not supported on objects
//           within the APEX or Spatial installation schema.
//
//           If DBMS_REDACT.ADD_POLICY was invoked, provide an 
//           OBJECT_NAME that does not reference a metadata-linked view.
//
//           If DBMS_REDACT_ADD_POLICY was invoked, provide an
//           OBJECT_NAME that does not reference an OLAP analytic
//           workspace table.

28093, 00000, "operation on column %s is not supported by data redaction"
// *Cause:   The operation was not supported by data redaction.
// *Action:  Perform only supported operations on any object which
//           has a data redaction policy or which depends on an object
//           with a data redaction policy.
//           To check for columns with redaction policies, use the
//           REDACTION_COLUMNS catalog view which lists all of the
//           data redaction policies. 
28094, 00000, "SQL construct not supported by data redaction"
// *Cause:   The query had a SQL construct that was not supported by
//           data redaction.
// *Action:  Rewrite the query to avoid using an unsupported construct.
//           Consult the Oracle documentation for details.
/
/ 28100-28149 RESERVED FOR FINE-GRAINED SECURITY
/
28100, 00000, "policy function schema %s is invalid"
// *Cause: The schema was dropped after the policy associated with the
//         function had been added to the object.
// *Action: Drop the policy and re-create it with a policy function owned by
//          a valid user. Or re-create the user and the policy function under
//          the new user.
28101, 00000, "policy already exists"
// *Cause: A policy with the same name for the same object already exists.
// *Action: Check if the policy has already been added or use a different
//          policy name.
28102, 00000, "policy does not exist"
// *Cause: Try to drop/enable/refresh a non-existent policy.
// *Action: Correct the policy name argument.
28103, 00000, "adding a policy to an object owned by SYS is not allowed"
// *Cause: Try to add a policy to a table or a view owned by SYS.
// *Action: You can not perform this operation.
28104, 00000, "input value for %s is not valid"
// *Cause: Input value for the argument is not valid
// *Action: specify a valid argument value.
28105, 00000, "cannot create security relevant column policy in an object view"
// *Cause:  Security relevant column argument is not null in policy creation
//          for an object view
// *Action:
28106, 00000, "input value for argument #%s is not valid"
// *Cause: Input values for the argument is missing or invalid.
// *Action: Correct the input values.
28107, 00000, "policy was disabled"
// *Cause: Try to flush a disabled policy.
// *Action: If the policy is supposed to be enforced, it must be enabled.
28108, 00000, "circular security policies detected"
// *Cause: Policies for the same object reference each other.
// *Action: Drop the policies
28109, 00000, "the number of related policies has exceeded the limit of 16"
// *Cause: Too many policies are involved in the same objects.
// *Action: Drop one or more policies. Or combine a few of them into one.
28110, 00000, "policy function or package %s.%s has error"
// *Cause: The policy function may have been dropped, or is no longer valid.
// *Action: Check the status of the function and correct the problem.
//          Or re-create the policy with a valid function.
28111, 00000, "insufficient privilege to evaluate policy predicate"
// *Cause: Predicate has a subquery which contains objects that the owner of
//         policy function does not have privilege to access.
// *Action: Grant appropriate privileges to the policy function owner.
28112, 00000, "failed to execute policy function"
// *Cause: The policy function has one or more error during execution.
// *Action: Check the trace file and correct the errors.
28113, 00000, "policy predicate has error"
// *Cause: Policy function generates invalid predicate.
// *Action: Review the trace file for detailed error information.
28115, 00000, "policy with check option violation"
// *Cause: Policy predicate was evaluated to FALSE with the updated values.
// *Action:
28116, 00000, "insufficient privileges to do direct path access"
// *Cause: Users with insufficient privileges attempting to do direct path
//         access of tables with fine grain access control policies.
// *Action: Ask the database administrator to do the operation.
//          Note that users can work with security administrator
//          to temporarily drop/disable the policies at time of export,
//          import, or load, but this has security implication, and
//          thus access of the database must be controlled carefully.
28117, 00000, "integrity constraint violated - parent record not found"
// *Cause: try to update/insert a child record with new foreign key
//         values, but the corresponding parent row is not visible
//         because of fine-grained security in the parent.
// *Action: make sure that the updated foreign key values must also visible
//          in the parent
28118, 00000, "policy group already exists"
// *Cause: try to create a policy group that already exists
// *Action:
28119, 00000, "policy group does not exist"
// *Cause: try to drop a policy group that does not exist
// *Action:
28120, 00000, "driving context already exists"
// *Cause: try to create a driving context that already exists
// *Action:
28121, 00000, "driving context does not exist"
// *Cause: try to drop a driving context that does not exist
// *Action:
28122, 00000, "can not update SYS_DEFAULT policy group"
// *Cause: An attempt was made to execute either DBMS_RLS.CREATE_POLICY_GROUP 
//         or DBMS_RLS.DELETE_POLICY_GROUP using SYS_DEFAULT as the policy 
//         group name.
// *Action: Do not attempt to CREATE or DELETE the SYS_DEFAULT policy 
//          group.  This action is not permitted.
28123, 00000, "Driving context '%s,%s' contains invalid group '%s'"
// *Cause:  A previous call to DBMS_SESSION.SET_CONTEXT specified an invalid 
//          policy group.
// *Action: Ensure that a valid policy group is passed to 
//          DBMS_SESSION.SET_CONTEXT when initializing a policy driving context.
28124, 00000, "Column %s in sec_relevant_cols cannot be of an object data type"
// *Cause:  A column specified in sec_relevant_cols was of an object data type.
// *Action: Ensure that none of the columns specified in sec_relevant_cols
//          is of an object data type or XMLType.
28125, 00000, "A protected base column was referenced in an unprotected virtual column expression."
// *Cause:  A protected base column was referenced in an unprotected virtual 
//          column expression.
// *Action: Check the policy definition and make sure that the virtual column 
//          is also protected.
28126, 00000, "Attribute association failed for policy \"%s\"."
// *Cause:  An attempt was made to associate a global application context
//          attribute to either a context-sensitive or shared context-sensitive
//          policy. Only local application context attribute association is
//          supported.
// *Action: Specify a local application context attribute.
28130, 00000, "Fine Grained Access Control at table level"
// *Document: NO
// *Cause:
// *Action:
28131, 00000, "Fine Grained Access Control enforced"
// *Document: NO
// *Cause:
// *Action:
28132, 00000, "The MERGE INTO syntax does not support the security policy."
//  *Cause: The MERGE INTO syntax did not support a security policy on the 
//          destination table, because the policy's statement_types did 
//          not include each of INSERT, UPDATE and DELETE or the policy had
//          security-relevant column.
// *Action: If you do not have the privilege to modify the security policy,
//          then instead of MERGE INTO, use the INSERT, UPDATE and DELETE DML 
//          statements on the table that has a security policy defined on it.
//          If you have the privilege to modify the security policy, then
//          redefine it in such a way that statement_types includes all of
//          the DML statement types (INSERT, UPDATE and DELETE) or ensure that
//          the policy does not have a security-relevant column.
//
28133, 00000, "full table access is restricted by fine-grained security"
// *Document: NO
// *Cause: The command requires full table access but the user is not SYS
//         and does not have permission to by pass security policies.
// *Action: Grant appropriate privileges, or change the policy function so
//          that it returns a NULL predicate under certain session
//          environments.
/
28134, 00000, "object cannot have fine-grained access control policy"
// *Cause: Only tables, views, or synonyms of tables or views
//         may have VPD policies
// *Action:
28135, 00000, "VPD check option silent error event"
// *Cause:
// *Action:
28136, 00000, "Ignore check option error"
// *Cause:
// *Action:
/
28137, 00000, "Invalid FGA audit Handler"
// *Cause: An invalid audit handler was specified.
// *Action: Specify a valid audit handler.
/
28138, 00000, "Error in Policy Predicate"
// *Cause: An invalid policy predicate was specified.
// *Action:Please specify a valide policy Predicate for the FGA policy
/
28139, 00000, "Maximum allowed Fine Grain Audit Policies Exceeded"
// *Cause: A maximum of 256 policies can be enabled on an object
// *Action: Drop or disable an existing policy before creating more
/
28140, 00000, "Invalid column specified "
// *Cause: Column name specified during policy creation is invalid
// *Action: Please specify a valid column name. Object columns are not
//          supported
/
28141, 00000, "error in creating audit index file"
// *Cause: ORACLE was not able to create the file being used to hold
//         audit file names.
// *Action: Examine the directory pointed to by the initialization
//          parameter "audit_file_dest." Make sure that all of the
//          following is true:
//          1. The directory exists.
//          2. The name indeed points to a directory and not a file.
//          3. The directory is accessible and writable to the ORACLE user.
/
28142, 00000, "error in accessing audit index file"
// *Cause: ORACLE was not able to access the file being used to hold
//         audit file names.
// *Action: Make sure the file exists in the directory pointed to by the
//          initialization parameter "audit_file_dest" and is readable 
//          by the ORACLE user.
/
28143, 00000, "Invalid argument passed to FGA ADD_POLICY procedure"
// *Cause: Invalid input argument was specified for FGA ADD_POLICY procedure.
// *Action: Specify correct type and number of arguments to FGA
//          ADD_POLICY procedure.
/
28144, 00000, "Failed to execute fine-grained audit handler"
// *Cause: An error was encountered while executing fine-grained audit handler.
// *Action: Refer to the trace file for details.
/
28145, 00000, "XDS policy already exists for %s"
// *Cause: An XDS policy was enabled for an object that already has an
//         associated XDS policy. 
// *Action: Specify a different policy name or call enable_xds with
//          the overwrite paramter set to TRUE.
/
28146, 00000, "invalid operation for policy \"%s\""
// *Cause: Attribute association (NAMESPACE, ATTRIBUTE) was specified for an 
//         invalid policy type. Attribute association can be specified only
//         for context-sensitive and shared context-sensitive policy types.
// *Action: Do not perform any unsupported operation.
/
28147, 00000, "The specified attribute association (\"%s\", \"%s\") is already attached to policy \"%s\"."
// *Cause: An attempt was made to create the attribute association using
//         names that were already used by existing attribute association 
//         of the policy.
// *Action: Adjust the names and retry the operation.
/
28148, 00000, "The specified attribute association (\"%s\", \"%s\") is not attached to policy \"%s\"."
// *Cause: An attempt was made to drop the attribute association that was not
//         attached to the policy.
// *Action: Adjust the names and retry the operation.
/
28149, 00000, "input value for argument \"%s\" is missing"
// *Cause: Only one input value was specified for the (NAMESPACE, ATTRIBUTE) arguments.
// *Action: Specify an input value for both (NAMESPACE, ATTRIBUTE) arguments.
/
/ 28150-28199 RESERVED FOR N-TIER SECURITY
/
28150, 0000, "proxy not authorized to connect as client"
// *Cause:  A proxy user attempted to connect as a client, but the proxy
//          was not authorized to act on behalf of the client.
// *Action: Grant the proxy user permission to perform actions on behalf of the
//          client by using the ALTER USER ... GRANT CONNECT command.
28151, 0000, "more than one user name specified for command"
// *Cause:  More than one user name was specified for an ALTER USER command.
// *Action: Try the command again with only one user name.
/
28152, 0000, "proxy user '%s' may not specify initial role '%s' on behalf of client '%s'"
// *Cause: A proxy user attempted to specify an initial role for a client, but
//         the client does not possess the role.
// *Action: Change the proxy user so that it does not specify the role or grant
//          the role to the client.
/
28153, 0000, "Invalid client initial role specified: '%s'"
// *Cause:  A role specified by a proxy user as an initial role to be
//          activated upon connecting on behalf of a client is invalid.
// *Action: Connect again as the client specifying a valid role.
/
28154, 00000, "Proxy user may not act as client '%s'"
// *Cause:  A proxy user may not assume the identity of a privileged user in
//          order to limit the privileges that a proxy may possess.
// *Action: Execute the statement again specify a client other than a
//          privileged user.
/
28155, 0000, "user '%s' specified as a proxy is actually a role"
// *Cause:  A user specified in an AUDIT <operation> BY <proxy> ON BEHALF OF
//          <client> is actually a role.
// *Action: Execute the statement again with a valid proxy user.
/
28156, 0000, "Proxy user '%s' not authorized to set role '%s' for client '%s'"
// *Cause:  A proxy user has not been granted the right to use a role on
//          behalf of a client.
// *Action: Execute the command ALTER USER <client> GRANT CONNECT THROUGH
//          PROXY <proxy> to grant the needed role.
/
28157, 0000, "Proxy user '%s' forbidden to set role '%s' for client '%s'"
// *Cause:  A proxy user was forbidden to use a role on behalf of a client
//          through the command ALTER USER <client> GRANT CONNECT THROUGH
//          <proxy> WITH ALL ROLES EXCEPT <role>
// *Action: Execute the command ALTER USER <client> GRANT CONNECT THROUGH
//          PROXY <proxy> to grant the needed role.
28158, 00000, "missing ALL keyword"
// *Cause:
// *Action:
/
28159, 00000, "missing BEHALF keyword"
// *Cause:
// *Action:
/
28160, 00000, "missing EXCEPT keyword"
// *Cause:
// *Action:
/
28161, 00000, "missing ROLES keyword"
// *Cause:
// *Action:
/
28162, 00000, "missing THROUGH keyword"
// *Cause:
// *Action:
/
28163, 00000, "GRANT already specified"
// *Cause:  The GRANT clause was specified twice.
// *Action: Use only one GRANT clause.
/
28164, 00000, "REVOKE already specified"
// *Cause:  The REVOKE clause was specified twice.
// *Action: Use only one REVOKE clause.
/
28165, 0000, "proxy '%s' may not specify password-protected role '%s' for client '%s'"
// *Cause:  A proxy user attempted to activate a role on behalf of a client
//          which has a password associated with it. Since the proxy does not
//          have a password, this activation cannot be allowed.
// *Action: Attempt to activate a different role or change the role
//          administratively so that there is no password.
/
28166, 00000, "duplicate rolename in list"
// *Cause:  The name of a role was specified more than once in a list.
// *Action: Repeat the command specifying the role once.
28168, 0000, "unused error"
// *Cause:
// *Action:
/
28169, 0000, "unsupported certificate type"
// *Cause:  The type of certificate from which the server is to extract the
//          credentials of the client is not supported.
// *Action: Specify a supported type.
/
28170, 0000, "unsupported certificate version"
// *Cause:  The version of the certificate from which the server is to extract
//          the credentials of the client is not supported.
// *Action: Specify a supported version.
/
28171, 0000, "unsupported Kerberos version"
// *Cause: the version the Kerberos ticket which the server is to use to
//         validate the identity of the client is not supported.
// *Action: Specify a supported version.
/
28172, 00000, "distinguished name not provided by proxy"
// *Cause: A client user is to be identified using a distinguished
//          name, but none was provided by the proxy user.
// *Action: Provide a distinguished name.
/
28173, 00000, "certificate not provided by proxy"
// *Cause: A client user is to be identified using a certificate but none
//         was provided by the proxy user.
// *Action: Provide a certificate.
/
28174, 00000, "Kerberos ticket not provided by proxy"
// *Cause: A client user is to be authenticated using a Kerberos ticket but
//         none was provided by the proxy user.
// *Action: Provide a Kerberos ticket.
/
28175, 00000, "incorrect certificate type"
// *Cause: the type of certificate provided by the proxy user to identify
//         a client user does not match the type that is required.
// *Action: Provide a certificate of the correct type.
/
28176, 00000, "incorrect certificate version"
// *Cause: the version of certificate provided by the proxy user to
//         identify a client user does not match the version that is
//         required.
// *Action: Provide a certificate of the correct version.
/
28177, 00000, "incorrect Kerberos ticket version"
// *Cause: the version of Kerberos ticket provided by the proxy user to
//         authenticate a client user does not match the version that is
//         required.
// *Action: Provide a Kerberos ticket of the correct version.
/
28178, 00000, "password not provided by proxy"
// *Cause: A client user is to be authenticated using a database password but
//         none was provided by the proxy user.
// *Action: Provide a password.
/
28179, 00000, "client user name not provided by proxy"
// *Cause: No user name was provided by the proxy user for the client user.
// *Action: Either specify a client database user name, a distinguished name or
//          an X.509 certificate.
/
28180, 00000, "multiple authentication methods provided by proxy"
// *Cause: More than one authentication method was specified by the proxy
//         user for the client user.
// *Action: Specify only one of the following: a client database user name,
//          a distinguished name or an X.509 certificate.
/
28181, 00000, "proxy '%s' failed to enable one or more of the specified initial roles for client '%s'"
// *Cause: Attempt to enable specified initial roles after logon resulted in
//         failure.
// *Action: Check that the initial roles are valid, granted to client, and
//          not password protected.
/
28182, 00000, "cannot acquire Kerberos service ticket for client"
// *Cause: An attempt to use a Kerberos forwardable ticket granting ticket
//         to obtain a Kerberos service ticket failed.
// *Action: Check that the Kerberos forwardable ticket granting ticket
//          belongs to the client, is valid, and that the key distribution
//          center is available.
/
28183, 00000, "proper authentication not provided by proxy"
// *Cause: A client user must be authenticated but
//         no authentication credentials were provided by the proxy user.
// *Action: Provide some form of authentication credentials.
/
28184, 00000, "global user cannot have proxy permissions managed in the directory"
// *Cause: The client name specified was a global user.
// *Action: Use ALTER USER to change the type of user (from IDENTIFIED
//          GLOBALLY to something else, such as IDENTIFIED BY password 
//          or IDENTIFIED EXTERNALLY).
/
28185, 00000, "cannot alter user with administrative privilege to proxy-only connect user"
// *Cause:  An attempt was made to alter a user with administrative privilege to 
//          a proxy-only connect user.
// *Action: This user cannot be altered to proxy-only connect user. 
/
28186, 00000, "cannot grant %s to a proxy-only connect user"
// *Cause:  An attempt was made to grant administrative privilege like SYSDBA,
//          SYSOPER, SYSASM, SYSBACKUP, SYSDG, SYSKM, or SYSRAC to a proxy-only
//          connect user. Since proxy authentication using an administrative
//          privilege is not supported, such grants are not allowed.
// *Action: none
/
28187, 00000,  "cannot alter global user to proxy-only connect user"
// *Cause:  An attempt was made to alter global user to proxy-only connect.
// *Action: none
/
28188, 00000,  "cannot alter user SYS/SYSBACKUP/SYSDG/SYSKM/SYSRAC to be identified as globally"
// *Cause:  An attempt was made to alter SYS/SYSBACKUP/SYSDG/SYSKM/SYSRAC to 
//          be identified as globally.
// *Action: none
28190, 00000, "SYSRAC administrative privilege cannot be granted to other users"
// *Cause:  An attempt was made to grant SYSRAC administrative privilege to a
//          user. This administrative privilege can only be used in operating
//          system authentication and cannot be granted to other users.
// *Action: Use connection string '/ as SYSRAC' from an operating system
//          account in the OSRAC group to connect to the database with the
//          SYSRAC privilege.
28191, 00000, "cannot grant administrative privileges to a user with non-ASCII or non-EBCDIC characters in the user name"
// *Cause:  An attempt to grant privileges to a user failed.
//          Administrative privileges like SYSDBA, SYSOPER, SYSASM, SYSBACKUP,
//          SYSDG, SYSKM, and SYSRAC cannot be granted to a user with non-ASCII
//          or non-EBCDIC characters in the user name.
// *Action: Grant administrative privileges to users that have user names with
//          only ASCII or EBCDIC characters.
/
/ 28200-28230 RESERVED FOR THE APPLICATION ROLE
/
//
28200, 00000, "IDENTIFIED USING already specified"
// *Cause:  The IDENTIFIED USING clause was specified twice.
// *Action: Use only one IDENTIFIED USING clause.
/
28201, 00000, "invalid command to enable secure application role \'%s\'"
// *Cause:  An attempt to enable the secure application role outside of the 
//          scope of the designated package failed.
// *Action: Enable the role using the designated package.
//
//
/
/ 28206-28220 RESERVED FOR THE PASSWORD COMPLEXITY
/
28206, 00000, "password length less than %d bytes"
// *Cause:  The password entered by the user did not meet the minimum length criteria.
// *Action: Enter a password which meets the minimum length criteria.
/
28207, 00000, "password contains the user name"
// *Cause:  The provided password contained the user name.
// *Action: Enter a password that does not contain the user name.
/
28208, 00000, "password contains the user name in reverse"
// *Cause:  The provided password contained the reverse of the user name.
// *Action: Enter a password that does not contain the reverse of the user name.
/
28209, 00000, "password contains the server name"
// *Cause:  The provided password contained the server name.
// *Action: Enter a password that does not contain the server name.
/
28210, 00000, "password too simple"
// *Cause:  The password was simple enough to guess.
// *Action: Enter a complex paswword.
/
28211, 00000, "new password should differ from the old password by %s or more characters"
// *Cause:  The new and old passwords should differ by at least the minimum number of characters as defined by the administrator.
// *Action: Enter a password that differs from the previous password by at least the minimum required number of changed characters, as defined by the administrator.
/
28212, 00000, "password must NOT contain a double-quotation"
// *Cause:  The double-quotation mark character is reserved as a password delimiter. 
// *Action: Enter a password without any double-quotation marks.
/
28213, 00000, "password must contain %d or more letters"
// *Cause:  The password did not meet the minimum required number of alphabetic characters.
// *Action: Enter a password containing at least the minimum number of alphabetic characters.
/
28214, 00000, "password must contain %d or more uppercase characters"
// *Cause:  The password did not meet the minimum required number of uppercase alphabetic characters. 
// *Action: Enter a password containing at least the minimum number of uppercase alphabetic characters.
/
28215, 00000, "password must contain %d or more lowercase characters"
// *Cause:  The password did not meet the minimum required number lowercase alphabetic characters.
// *Action: Enter a password containing at least the minimum number of lowercase alphabetic characters.
/
28216, 00000, "password must contain %d or more digits"
// *Cause:  The password did not contain the minimum number of digits.
// *Action: Enter a password comtaining at least the minimum number of digits.
/
28217, 00000, "password must contain %d or more special characters"
// *Cause:  The password did not contain the minimum number of special characters.
// *Action: Enter a password containing at least the minimum number of special characters.
/
28218, 00000, "password length more than 30 bytes"
// *Cause:  The length of the password exceeds 30 bytes.
// *Action: Enter a password containing a maximum of 30 bytes.

//
//
/
/ 28221-28230 RESERVED FOR PASSWORD/ACCOUNT ENHANCEMENT
/
//
28221, 00000, "REPLACE not specified"
// *Cause:  User is changing password but password verification function is
//          turned on and the original password is not specified and the
//          user does not have the alter user system privilege.
// *Action: Supply the original password.
/
28222, 00000, "may not modify reserved user"
// *Cause:  An attempt was made to change or grant to a reserved user account.
// *Action: None.
//
//
/
28223, 00000, "first login requires password change"
// *Cause: This user was globally authenticated. Password policy settings 
//         in Oracle Internet Directory (OID) requires the password to be 
//         changed for the first connection. Further connections to the 
//         database will be denied if the password in OID is not changed.
// *Action: Connect to the OID to change the password.
/
28224, 00000, "user password or account management tracing event"
// *Document: NO
// *Cause:    This is an internal debugging event and must be enabled
//            only under the supervision of Oracle Support Services
//            or development.
// *Action:   None
/
/ 28230-28260 RESERVED FOR THE OBFUSCATION TOOLKIT
/
28231, 0000, "no data passed to obfuscation toolkit"
// *Cause:  A NULL value was passed to a function or procedure.
// *Action: Make sure that the data passed is not empty.
/
28232, 0000, "invalid input length for obfuscation toolkit"
// *Cause:  Length of data submitted for encryption or decryption is not a
//          multiple of 8 bytes.
// *Action: Make sure that the length of the data to be encrypted or decrypted
//          is a multiple of 8 bytes.
/
28233, 0000, "double encryption not supported"
// *Cause:  The obfuscation toolkit does not support the encryption of
//          already-encrypted data.
// *Action: Do not attempt to encrypt already-encrypted data.
/
28234, 00000, "key length too short"
// *Cause:  The key specified is too short for the algorithm. DES
//          requires a key of at least 8 bytes. Triple DES requires a
//          key of least 16 bytes in two-key mode and 24 bytes in three-key
//          mode.
// *Action: Specify a longer key.
/
28235, 00000, "algorithm not available"
// *Cause:  The encryption algorithm desired is not available.
// *Action: Run the installer to install the needed algorithm in
//          Oracle Advanced Security.
/
28236, 00000, "invalid Triple DES mode"
// *Cause: An unknown value was specified for the mode in which triple
//          DES encryption is to run.
// *Action: Specify a valid value. See the package declaration for a
//          list of valid values.
/
28237, 00000, "seed length too short"
// *Cause:  The seed specified for the key generation routine must be at least
//          80 characters.
// *Action: Specify a longer seed.
/
28238, 00000, "no seed provided"
// *Cause:  A NULL value was passed in as the seed to be used in generating
//          a key.
// *Action: Provide a non-NULL value for the seed.
/
28239, 00000, "no key provided"
// *Cause:  A NULL value was passed in as an encryption or decryption key.
// *Action: Provide a non-NULL value for the key.
/
/ 28261-28270 RESERVED FOR APPLICATION CONTEXT
/
28261, 0000, "CURRENT_USER can not be used in PLSQL Definer's Right procedure."
// *Cause:  An attempt to retrieve CURRENT_USER using SYS_CONTEXT PLSQL
//          interface.
// *Action: Use a SQL statement to query CURRENT_USER inside a DR procedure.
/
28262, 0000, "Global application context cannot be used after failing over with Transparent Application Continuity."
// *Cause: An attempt was made to retrieve the global application context value
//         in a failed over session.
// *Action: Determine if the application can use Application Continuity
//          instead of Transparent Application Continuity, or use the
//          Local Application Context instead of Global Application Context
/
28263, 0000, "unused error"
// *Cause:
// *Action:
28264, 0000, "Client identifier is too long"
// *Cause:  The length of the client identifier is longer than 64
// *Action: Set  a client identifier whose length is less than 64.
//
/
/
28265, 0000, "Namespace beginning with 'SYS_' is not allowed."
// *Cause:  Namespace beginning with 'SYS_' was not allowed.
// *Action: Use a namespace that does not begin with 'SYS_'.
//
/
28266, 0000, "Application Context tracing event"
// *Document: NO
// *Cause:  N/A
// *Action: Debugging event for KZCTX layer.
/
28267, 0000, "Invalid NameSpace Value"
// *Cause:    Context NameSpace conflicts with reserved key words or
//            a secure  Namespace  is not allowed for this 
//            type of Application Context.
// *Action:   Use a valid namespace.
//
/
28268, 0000, "Exceeded the maximum allowed size for Context information in a session"
// *Cause:    The maximum size specified by the _session_context_size 
//            init.ora parameter was exceeded.
// *Action: Please change the value for _session_context_size in the
//            init.ora file.
//
/
28269, 0000, "Event to enable overwrite of client_identifier when client_info is set"
// *Document: NO
// *Cause:    N/A
// *Action: Set this event in your environment to propagate client_info session 
//          context attribute to client_identifier.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
//
/
/ 28270-28290 RESERVED FOR PASSWORD AUTHENTICATED GLOBAL USER(KZAL)
/
28270, 0000, "Malformed user nickname for password authenticated global user."
// *Cause:  An attempt to login as password-auuthenticated global user with
//          a malformed user nickname.
// *Action: Make sure the nickname is valid and re-login.
/
28271, 0000, "No permission to read user entry in LDAP directory service."
// *Cause:  ORACLE server does not have read permission on user nickname's
//          X.500 user entry.
// *Action: Make sure ORACLE server is using right SSL credentials to connect
//          to LDAP directory services.
//          Make sure permissions for LDAP user entries are right.
/
28272, 0000, "Domain policy restricts password based GLOBAL user authentication."
// *Cause:  Domain policy does not allow password-authenticated GLOBAL users.
// *Action: Make sure ORACLE server is using right SSL credentials to connect
//          to LDAP directory services.
//          Make sure orclDBAuthTypes attributes within Oracle enterprise
//          domain object is either set to PWD or ALL.
/
28273, 0000, "No mapping for user nickname to LDAP distinguished name exists."
// *Cause: ORACLE server cannot map the given user nickname to LDAP
//         distinguished name.
// *Action: Make sure user entries in LDAP are correctly provisioned with
//          correct user nickname attribute values.
/
28274, 0000, "No ORACLE password attribute corresponding to user nickname exists."
// *Cause: LDAP user entry corresponding to user nickname does not have a
//         ORACLE password attribute or the attribute is not initialized.
// *Action: Make sure user entries in LDAP are correctly provisioned with
//          correct ORACLE password attribute values.
/
28275, 0000, "Multiple mappings for user nickname to LDAP distinguished name exist."
// *Cause: The given user nickname maps to more than one LDAP distinguished
//         name.
// *Action: Make sure user nickname is unique within the enterprise.
/
28276, 0000, "Invalid ORACLE password attribute."
// *Cause: The ORACLE password attribute of a user entry has an invalid
//         format.
// *Action: Make sure ORACLE password attribute value is RFC-2307 compliant.
/
28277, 0000, "LDAP search, while authenticating global user with passwords, failed."
// *Cause: The LDAP search for finding the appropriate user entry and ORACLE
//         password failed.
// *Action: Make sure LDAP directory service is up and running.
/
28278, 0000, "No domain policy registered for password based GLOBAL users."
// *Cause: No policy about password authenticated GLOBAL users has been
//         registered.
// *Action: Add attribute orclDBAuthTypes to the database server's Enterprise
//          domain.
/
28279, 0000, "Error reading ldap_directory_access init parameter."
// *Cause: ldap_directory_access parameter is not specified corrrectly.
//
// *Action: Make sure spfile.ora has ldap_directory_access set correctly.
//          Possible correct values are PASSWORD, SSL and NONE.
/
28280, 0000, "Multiple entries for ORACLE database password exist."
// *Cause: The ORACLE password attribute of a user entry has multiple entries
//         of ORACLE database password.
// *Action: Make sure ORACLE password attribute has one entry for ORACLE Database
//          password.
/
28281, 0000, "Global application context is not updated on one or more Oracle RAC instances"
// *Cause:    While updating global application context across Oracle RAC instances,
//            the background process errored out or the timeout expired due to
//            some failure.
// *Action:   Ensure every instance in Oracle RAC is operational and retry the operation.
/
/ 28290 - 28300 RESERVED FOR THE Kerberos Enterprise User Security
/
28290, 00000, "Multiple entries found for the same Kerberos Principal Name"
// *Cause:  Multiple user entries has been configured with the same krbPrincipalName
// *Action: Modify enterprise user's entry to assign its Kerberos principal name
//          Make sure the user entries in LDAP are provisioned correctly.
/
28291, 00000, "No Kerberos Principal Value found."
// *Cause:  Oracle server fails to get value of krbPrincipalName attribute
// *Action: Make sure user entries are correctly provisioned with correct 
//          Kerberos principal value
/
28292, 00000, "No Domain Policy registered for Kerberos based authentication"
// *Cause:  The enterprise domain entry is not configured for Kerberos based 
//         global authentication.
// *Action: Modify orclDBAuthType of the database server's enterprise
//          domain entry and assign it "ALL" or "KRB5"
/
28293, 00000, "No matched Kerberos Principal found in any user entry"
// *Cause:  Oracle server fails to find the principal in the user search base
// *Action: Make sure the user search base is correct.
//          Use ESM to configure the enterprise user its Kerberos principal name
/
/
/ 28300 - 28329 RESERVED FOR THE ENTERPRISE USER SECURITY
/
28300, 00000, "No permission to read user entry in LDAP directory service."
// *Cause:  ORACLE server does not have read permission on user entries.
// *Action: Make sure ORACLE server is using right credentials to connect
//          to LDAP directory services.
//     Make sure permissions for LDAP user entries are configured correctly.
/
28301, 00000, "Domain Policy hasn't been registered for SSL authentication."
// *Cause:   An attempt was made to authenticate with SSL, but the database
//           enterprise domain was not configured for SSL authentication.
// *Action:  Modify orclDBAuthType of the server's enterprise domain entry
//           and assign it "ALL" or "SSL".
/
28302, 00000, "User does not exist in the LDAP directory service."
// *Cause:   An attempt was made to authenticate with SSL using the user's
//           certificate, but there was no user entry in the LDAP server that
//           matched the user's Distinguished Name.
// *Action:  Add an user entry whose DN matches the user's PKI DN in
//           the LDAP directory.
/
28303, 00000, "Distinguished name for user exceeds maximum supported length"
// *Cause:   The user's distinguished name (DN) exceeded the maximum supported
//           length.
// *Action:  Shorten the user's distinguished name (DN) and retry.
/
28304, 00000, "Oracle encrypted block is corrupt (file # %s, block # %s)"
// *Cause:   The indicated encrypted block was corrupt. This was an in-memory
//           corruption. The exact cause is unknown. Possible causes could be:
//           - the encryption wallet is incorrect or corrupted
//           - the tablespace encryption key is incorrect or corrupted
//           - decryption engine failure
//           - actual logical error exists in decrypted block
// *Action:  Review the encryption wallet and the keys stored in it to ensure
//           they are valid and correct.
/
28305, 00000, "WALLET_LOCATION in sqlnet.ora file for container database is not supported."
// *Cause:   WALLET_LOCATION was specified in sqlnet.ora file.
// *Action:  Remove WALLET_LOCATION from sqlnet.ora file. Place the wallet in the 
//           pluggable database-specific default location.
/
28306, 00000, "The directory user has %s groups mapped to different database global users."
// *Cause:   A directory user connected to the database while there were multiple
//           directory user's groups mapped to different shared database global users.
// *Action:  No action is required if by design the user's multiple groups need to be
//           mapped to different database global users. Otherwise, create an exclusive 
//           database global user mapping for the directory user, or ensure that
//           the directory user has only one mapped shared database global user.
/
28307, 00000, "The directory current time %s is unreasonable."
// *Cause:   Either the directory service time was earlier than year 1900,
//           or the format was incorrect.
// *Action:  Ensure that the directory service clock is set properly.
/
28308, 00000, "The directory server type %s is not supported."
// *Cause:   The database tried to work with a directory service which was not 
//           supported.
// *Action:  Update the dsi.ora or ldap.ora file to reflect an appropriate directory
//           server type.
/
28309, 00000, "failed to get the service user's credential from the wallet."
// *Cause:   An attempt was made to get the service user's credential from the wallet.
//           However, either the wallet was not found or the service user's credential
//           was missing in the wallet.
// *Action:  Check the wallet path and update the wallet with the service user's
//           credential. 
/
28310, 0000, "Role with same external name already exists."
// *Cause:  The external name specified for the role being created or
//          altered already exists for another role.
// *Action: External names must be unique among roles. Specify another.
/
28311, 00000, "Oracle encrypted data block not encrypted (file # %s, block # %s)"
// *Cause:   The indicated data block was found unencrypted in a fully
//           encrypted tablespace.  The exact cause is unknown. Possible
//           causes could be: 
//           - An encrypted data block is tampered and replaced with an
//             unencrypted data block.
//           - An Oracle internal issue.
// *Action:  Collect block dump and redo dump for this block, and contact
//           Oracle Support Services.
/
28312, 00000, "Proxy user is not supported with DSI."
// *Cause:   Proxy user authentication is currently not supported with Directory
//           Service Integration (DSI).
// *Action:  Do not use proxy user authentication with DSI. 
/
28313, 00000, "LDAP server connection is down."
// *Cause:   The LDAP server is down or the connection to the LDAP server is closed.
// *Action:  Retry the connect operation.
/
28314, 00000, "The current user database link is not supported with DSI."
// *Cause:   An attempt was made to use the current user database link with
//           Directory Services Integration (DSI).
// *Action:  Do not use the current user database link with DSI.
/
28315, 00000, "encryption key mismatched for file # %s"
// *Cause:   Oracle tablespace encryption could not verify the master
//           key or the tablespace key for this data file.  The exact cause is
//           unknown. Possible cause could be: 
//           - The encryption wallet was incorrect.
//           - The encryption wallet was incorrectly shared between databases.
//           - The tablespace encryption key was incorrect or corrupted.
// *Action:  Review the encryption wallet and the keys stored in it to ensure
//           that they are valid, and contact Oracle Support Services.
/
/ 28330-28499 RESERVED FOR TRANSPARENT DATA ENCRYPTION
/
28330, 0000, "encryption is not allowed for this data type or the data type is invalid"
// *Cause: The data type was not supported for column encryption or
//         the data type was invalid. 
//
// *Action:
//
/
28331, 0000, "encrypted column size too long for its data type"
// *Cause: The column was both encrypted and one of the following:
//         -for VARCHAR2 when extended character data types were disabled,
//           the length specified was > 3932;
//         -for VARCHAR2 when extended character data types were enabled,
//           the length specified was > 32699;
//         -for CHAR, the length specified was > 1932;
//         -for NVARCHAR2 when extended character data types were disabled,
//           the length specified was > 1966;
//         -for NVARCHAR2 when extended character data types were enabled,
//           the length specified was > 16349;
//         -for NCHAR, the length specified was > 966;
//         -for RAW when extended character data types were disabled,
//           the length specified was > 3932;
//         -for RAW when extended character data types were enabled,
//           the length specified was > 32699;
// *Action: Reduce the column size.
//
/
28332, 0000, "cannot have more than one password for the encryption key"
// *Cause: More than one password was specified in the user command.
//
// *Action:
//
/
28333, 0000, "column is not encrypted"
// *Cause: An attempt was made to rekey or decrypt an unencrypted column.
//
// *Action:
//
/
28334, 0000, "column is already encrypted"
// *Cause: An attempt was made to encrypt an encrypted column.
//
// *Action:
//
/
28335, 0000, "referenced or referencing FK constraint column cannot be encrypted"
// *Cause: encrypted columns were involved in the referential constraint
//
// *Action:
//
/
28336, 0000, "cannot encrypt SYS owned objects"
// *Cause: An attempt was made to encrypt columns in a table owned by SYS.
//
// *Action:
//
/
28337, 0000, "the specified index may not be defined on an encrypted column"
// *Cause: Index column was either a functional, domain, or join index.
//
// *Action:
//
/
28338, 0000, "Column(s) cannot be both indexed and encrypted with salt"
// *Cause: An attempt was made to encrypt index column with salt or
//         an attempt was made to create an index on encrypted column with salt.
//
// *Action: Alter the table and specify column encrypting without salt.
//
/
28339, 0000, "missing or invalid encryption algorithm"
// *Cause: Encryption algorithm was missing or invalid in the user command.
//
// *Action: Must specify a valid algorithm.
//
/
28340, 0000, "A different encryption algorithm has been chosen for the table or tablespace."
// *Cause: Existing encrypted columns or tablespace were associated with a
//         different algorithm. 
//
// *Action: Do not specify an algorithm, or specify the same one for the
//          existing encrypted columns or tablespace.
/
28341, 0000, "cannot encrypt constraint column(s) with salt"
// *Cause: An attempt was made to encrypt constraint columns with salt.
//
// *Action: Encrypt the constraint columns without salt.
//
/
28342, 0000, "integrity check fails on column key"
// *Cause: Encryption metadata may have been improperly altered.
//
// *Action:
//
/
28343, 0000, "fails to encrypt data"
// *Cause: data or encryption metadata may have been improperly altered or
//         the security module may not have been properly setup
//
// *Action:
//
28344, 0000, "fails to decrypt data"
// *Cause: data or encryption metadata may have been improperly altered or
//         the security module may not have been properly setup
//
// *Action:
//
/
28345, 00000, "cannot downgrade because there exists encrypted column"
// *Cause:   An attempt was made to downgrade when there was an encrypted
//           column in the system.
// *Action:  Decrypt these columns before attempting to downgrade.
/
28346, 00000, "an encrypted column cannot serve as a partitioning column"
// *Cause:   An attempt was made to encrypt a partitioning key column or
//           create partitioning index with encrypted columns.
// *Action:  The column must be decrypted.
/
28347, 00000, "encryption properties mismatch"
// *Cause:  An attempt was made to issue an ALTER TABLE EXCHANGE PARTITION |
//          SUBPARTITION command, but encryption properties were mismatched.
// *Action:  Make sure encrytion algorithms and columns keys are identical.
//           The corresponding columns must be encrypted on both tables with
//           the same salt and non-salt flavor.
/
28348, 0000, "index defined on the specified column cannot be encrypted"
// *Cause: An attempt was made to encrypt a column which is in a functional
//         index, domain index, or join index.
//
// *Action: drop the index
//
/
28349, 0000, "cannot encrypt the specified column recorded in the materialized view log"
// *Cause: An attempt was made to encrypt a column which is already recorded
//         in the materialized view log.
//
// *Action: drop the materialized view log
//
/
28350, 0000, "cannot encrypt the specified column recorded in CDC synchronized change table"
// *Cause: An attempt was made to encrypt a column which is already recorded
//         in CDC synchronized change table.
// *Action: drop the synchronized change table
/ 
28351, 0000, "cannot encrypt the column of a cluster key"
// *Cause:  An attempt was made to encrypt a column of the cluster key.
//          A column of the cluster key in a clustered table cannot be
//          encrypted.
// *Action: None
/ 
28352, 0000, "Event to force ZT error in kzekm"
// *Document: NO
// *Cause:    N/A
// *Action: Set this event in your environment to simulate a ZT error.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
//
/
28353, 0000, "failed to open wallet"
// *Cause:  The database was unable to open the security module wallet due
//          to an incorrect wallet path or password. It is also possible
//          that a wallet had not been created. Type mkwallet from command
//          line for instructions. 
//
//          If the database is configured to use Oracle Key Vault as the TDE
//          keystore, the database may be having difficulty finding the 
//          Oracle Key Vault configuration file.
//
//          If Oracle Key Vault is used as the keystore, check if the
//          Oracle Key Vault configuration file is in the right directory.
//          When the instance initialization parameter WALLET_ROOT is 
//          configured, Oracle Key Vault configuration file should be located 
//          at the following paths
//              $WALLET_ROOT/okv/conf for CDB$ROOT and 
//              $WALLET_ROOT/PDB-GUID/okv/conf for a pluggable database (PDB)
//          in isolated mode. The PDB GUID can be obtained by querying GUID 
//          from DBA_PDBS view. When WALLET_ROOT is not set, Oracle Key Vault
//          configuration file should be under $OKV_HOME/conf.
//          
// *Action: Execute the command again using the correct wallet password or 
//          verfying that a wallet exists in the specified directory. If 
//          necessary, create a new wallet and initialize it.
//
//          When Oracle Key Vault is used, refer to the documentation 
//          for information on endpoint enrollment and provisioning.
//
/
28354, 0000, "Encryption wallet, auto login wallet, or HSM is already open"
// *Cause:  Encryption wallet, auto login wallet, or HSM was already opened.
// *Action: None.
//          
/
28355, 0000, "failed to initialize security module"
// *Cause:
//
// *Action: 
//          
/
28356, 0000, "invalid open wallet syntax"
// *Cause:  The command to open the wallet contained improper spelling
//          or syntax.
// *Action: If attempting to open the wallet, verify the spelling and
//          syntax and execute the command again.
/
28357, 0000, "password required to open the wallet"
// *Cause:  A password was not provided when executing the open wallet
//          command, the isolate keystore command, or the unite keystore
//          command.
// *Action: Retry the command with a valid password.
/
28358, 0000, "improper set key syntax"
// *Cause:  The command to set the master key contained improper spelling
//          or syntax.
// *Action: If attempting to set the master key for Transparent Database
//          Encryption, verify the spelling and syntax and execute
//          the command again.
/
28359, 0000, "invalid certificate identifier"
// *Cause:  The certificate specified did not exist in the wallet.
// *Action: Query the V$WALLET fixed view to find the proper certificate
//          identifier for certificate to be used.
/
28360, 0000, "security module internal error"
// *Cause:
//
// *Action: 
//          
/
28361, 0000, "master key not yet set"
// *Cause:  The master key for the instance was not set.
// *Action: Execute the ALTER SYSTEM SET KEY command to set a master key
//          for the database instance.
/
28362, 0000, "master key not found"
// *Cause:  The required master key required could not be located. This may
//          be casued by the use of an invalid or incorrect wallet.
// *Action: Check wallet location parameters to see if they specify the
//          correct wallet. Also, verify that an SSO wallet is not being used
//          when an encrypted wallet is intended.
28363, 0000, "buffer provided not large enough for output"
// *Cause:  A provided output buffer is too small to contain the output.
// *Action: Check the size of the output buffer to make sure it is initialized
//          to the proper size.
/
28364, 0000, "invalid wallet operation"
// *Cause:  The command to operate the wallet contained improper spelling
//          or syntax.
// *Action: Verify the spelling and syntax and execute the command again.
/
28365, 0000, "wallet is not open"
// *Cause:  The security module wallet has not been opened.
// *Action: Open the wallet.
/          
28366, 0000, "invalid database encryption operation"
// *Cause:  The command for database encryption contained improper spelling
//          or syntax.
// *Action: Verify the spelling and syntax and execute the command again.
/
28367, 0000, "wallet does not exist"
// *Cause:  The Oracle wallet has not been created or the wallet location
//          parameters in sqlnet.ora specifies an invalid wallet path.
// *Action: Verify that the WALLET_LOCATION or the ENCRYPTION_WALLET_LOCATION
//          parameter is correct and that a valid wallet exists in the path
//          specified.
/
28368, 0000, "cannot auto-create wallet"
// *Cause:  The database failed to auto create an Oracle wallet. The Oracle
//          process may not have proper file permissions or a wallet may
//          already exist.
// *Action: Confirm that proper directory permissions are granted to the Oracle
//          user and that neither an encrypted or obfuscated wallet exists in
//          the specified wallet location and try again.
/
28369, 0000, "cannot add files to encryption-ready tablespace when offline"
// *Cause:  You attempted to add files to an encryption-ready tablespace when
//          all the files in the tablespace were offline.
// *Action: Bring the tablespace online and try again
//         
/
28370, 0000, "ENCRYPT, DECRYPT or REKEY option not allowed"
// *Cause:  An attempt was made to specify the ENCRYPT, DECRYPT or REKEY option
//          on an unsupported tablespace.
// *Action: Remove this option and retry the statement.
//         
/
28371, 0000, "ENCRYPTION clause or ENCRYPT option not allowed"
// *Cause:  An attempt was made to specify the ENCRYPTION clause or 
//          ENCRYPT option for system and undo tablespaces.
// *Action: Remove one or both of these options and retry the statement.
//         
/
28372, 0000, "missing ENCRYPT option for encrypted tablespace"
// *Cause:  An attempt was made to specify the ENCRYPTION property for the 
//          CREATE TABLESPACE statement without specifying the ENCRYPT option 
//          to encrypt the tablespace.
// *Action: Add the ENCRYPT option and retry the statement.
//         
/
28373, 0000, "missing or out of order ENCRYPTION clause"
// *Cause:  An attempt was made to specify the ENCRYPT or DECRYPT option in the 
//          CREATE TABLESPACE statement or to specify the ENCRYPT or REKEY
//          option in the ALTER TABLESPACE statement without first specifying 
//          the ENCRYPTION property for the tablespace.
// *Action: Add the ENCRYPTION clause or correct the syntax, and retry the 
//          statement.
//
/
28374, 0000, "typed master key not found in wallet"
// *Cause:  You attempted to access encrypted tablespace or redo logs with
//          a typed master key not existing in the wallet.
// *Action: Copy the correct Oracle Wallet from the instance where the tablespace
//          was created.
//         
/
28375, 0000, "cannot perform cross-endianism conversion on encrypted tablespace"
// *Cause:  You attempted to perform cross-endianism conversion on encrypted
//          tablespace.
// *Action: Cross-endianism conversion on encrypted tablespace is not supported.
//         
/
28376, 0000, "cannot find PKCS11 library"
// *Cause:  The HSM vendor's library cannot be found.
// *Action: Place the HSM vendor's library in the following directory structure:
//          For Unix like system:
//          /opt/oracle/extapi/[32,64]/hsm/{VENDOR}/{VERSION}/lib<apiname>.<ext>
//          For Windows systems:
//          %SYSTEM_DRIVE%\oracle\extapi\[32,64]\hsm\{VENDOR}\{VERSION}\lib<apin//          ame>.<ext>
//          [32, 64]  - refers to 32bit or 64bit binary.
//          {VENDOR}  - The name of the vendor supplying the library.
//          {VERSION} - Version of the library, perferably in num#.num#.num# for//                      mat.
/
28377, 0000, "No need to migrate from wallet to HSM"
// *Cause:  There are either no encrypted columns or all column keys are already
//          encrypted with the HSM master key. 
// *Action: No action required.
/
28378, 0000, "Wallet not open after setting the Master Key"
// *Cause:   The Master Key has been set or reset. However, wallet could not be
//           reopened successfully.
// *Action:  Reopen the wallet.
/
28379, 0000, "a different integrity algorithm has been chosen for the table"
// *Cause: Encrypted columns were associated with a different algorithm.
//
// *Action: You do not need to specify an algorithm, or specify the same 
//          one for the existing encrypted columns.
/
28380, 00000, "Event to force all newly created tablespaces to be encrypted for testing"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to force all newly created 
//          tablespaces to be encrypted tablespaces. It is an easy way to  
//          convert an existing test to run with tablespace encryption. It is 
//          used for testing only and not for security. Often run with event
//          28381.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
/
28381, 00000, "Event to bypass wallet setup for tablespace encryption"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to bypass wallet setup for 
//          tablespace encryption. It uses a dummy encryption master key to 
//          simulate encryption or decryption by the wallet, and has no wallet 
//          dependency. It is an easy way to convert an existing test to run 
//          with tablespace encryption. It is used for testing only and not for 
//          security. Often run with event 28380.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED. 
/
28382, 00000, "Global wallet operation in RAC failed"
// *Cause: Wallet operation in RAC failed.
// *Action: Check V$WALLET_ENCRYPTION table to verify if the wallet operation
//          succeeded on any instance. Retry the operation.
/
28383, 00000, "cannot do a PKI certificate-based Master Key migration"
// *Cause:  A PKI certificate-based Master Key migration was not allowed.
// *Action: Execute a symmetric Master Key migration.
/
28384, 0000, "cannot perform Tablespace Encryption"
// *Cause:  Tablespace Encryption was attempted when PKI certificate-based 
//          Master Key was in use.
// *Action: Perform a symmetric Master Key Rekey.
/
28385, 0000, "cannot perform a PKI certificate-based migration"
// *Cause:  A PKI certificate-based migration to HSM was attempted.  
// *Action: Perform a symmetric Master Key migration.
/
28386, 0000, "cannot perform a PKI certificate-based Master Key Rekey"
// *Cause:  A PKI certificate-based Master Key Rekey was attempted when
//          Tablespace Encryption or HSM was in use.
// *Action: Perform a symmetric Master Key Rekey or disable Tablespace 
//          Encryption for all tablespaces.
/
28387, 00000, "Could not acquire an enqueue for wallet operation in Oracle RAC"
// *Cause: Enqueue to block TDE operations in Oracle RAC database could 
//         not be obtained.
// *Action: Retry the wallet operation.
/
28388, 00000, "database is not open in read/write mode"
// *Cause:   Database was not open in read/write mode and could not perform
//           these wallet operations.
// *Action:  Open the database in read/write mode and retry this command.
/
28389, 00000, "cannot close auto login wallet" 
// *Cause:   Auto login wallet could not be closed because it was opened with
//           another wallet or HSM requiring a password.
// *Action:  Close the wallet or HSM with a password.
/
28390, 00000, "auto login wallet not open but encryption wallet may be open"
// *Cause:   Auto login wallet was not open. But, the encryption wallet may 
//           still be open and subsequent TDE operations might succeed.
// *Action:  If auto login wallet is closed but TDE operations succeed, 
//           check the status of the encryption wallet and close that if
//           required. 
/
28391, 00000, "cannot close wallet or HSM, password mismatch" 
// *Cause:   Password provided did not match the password of the open
//           wallet or HSM.
// *Action:  Provide the correct password for wallet or HSM to 
//           close the wallet or HSM.
/
28392, 0000, "invalid close wallet syntax"
// *Cause:  The command to close the wallet contained improper spelling
//          or syntax.
// *Action: If attempting to close the wallet, verify the spelling and
//          syntax and execute the command again.
/
28393, 0000, "password required to close the wallet"
// *Cause:  A password was not provided when executing the close wallet
//          command.
// *Action: Retry the command with a valid password.
/
28394, 0000, "decryption of data of length %s failed"
// *Cause:  Decryption of data failed. Error may be due to plain text data in 
//          an external file being submitted for decryption, data encrypted 
//          with a different key or a utility being submitted for decryption, 
//          or TDE encrypted data in data files being corrupted.
// *Action: Verify that the correct external file is being specified or contact 
//          Oracle Support Services.  
/ 
28395, 0000, "could not write the new master key to the wallet"
// *Cause:  An attempt was made to write the new master key to the wallet. The 
//          wallet or the parent directory may not have the proper file
//          permissions to write the master key in the wallet.  
// *Action: Check the password-based wallet, auto login wallet, the parent 
//          directory permissions and disk space availability on the file 
//          system. Make sure that the Oracle processes have read/write 
//          permissions on the password-based and auto login wallets. Retry 
//          the command.
/
28396, 0000, "rekey of enc$ dictionary table failed"
// *Cause:  One or more master keys required for the rekey operation could
//          not be found in the wallet. Either incorrect master key identifiers
//          were inserted into the enc$ dictionary table or the wallet
//          containing the referenced master keys were improperly modified
//          or deleted.
// *Action: Restore the most recent copy of the wallet and try again.
/
28397, 0000, "cannot bring file %s online since it has a passphrase-wrapped key"
// *Cause:  The encrypted tablespace file was rewrapped using passphrase
//          through the DBMS_TTS.PASSPHRASE_REWRAP_KEY procedure. Therefore it
//          cannot be part of the database until it is converted by RMAN.
//
// *Action: Do not attempt to bring files with passphrase-wrapped keys online.
/
28398, 0000, "cannot rewrap encryption key for this file"
// *Cause:  Cannot rewrap encryption key for this file because it was not 
//          from an encrypted tablespace, or it had already been rewrapped.
//
// *Action: Verify that the file is a copy of a file from an encrypted 
//          tablespace.
/
28399, 00000, "Event to disable automatic TDE wallet management in RAC"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to disable the automatic 
//          management of wallet in RAC.
/
28400, 00000, "Event to enable TDE tracing"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to obtain trace information
//          for Transparent Data Encryption.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.

28402, 00000, "Event to disable restriction on 'grant any object privilege' system privilege"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to allow user with 'grant any
//          object privilege' system privilege to grant privilege on a view 
//          that the view owner is permitted to grant, even if the view owner
//          does not have the privilege with 'with grant option' on the 
//          underlying objects. It would otherwise raise ORA-01720.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.

28403, 00000, "file %s cannot be modified because it is an online data file"
// *Cause:  An attempt was made to modify an online data file when the file was
//          not expected to be part of the database.
// *Action: Check the status of the file and its tablespace and make sure it
//          is offline or is a copy of a data file

28404, 00000, "role cannot be altered"
// *Cause:  An attempt was made to alter the role to become a global, external, 
//          password protected, or secure application role. The role could not 
//          be altered because it was already granted to one or more other 
//          roles or program units.
// *Action: Use REVOKE to revoke the role from other roles first.

28405, 00000, "cannot grant secure role to a role"
// *Cause:  Role granted was a password protected or secure application role.
//          This role can only be granted directly to a user.
// *Action: Grant the role directly to a user.

28406, 00000, "Event to keep connection made by database to OID open when enterprise user logs into database"
// *Document: NO
// *Cause: N/A
// *Action: Set this event in your environment to keep connection made by 
//          database to OID open when enterprise user logs into database.
//          Default behaviour is to close the connection once enterprise user
//          logs into database.
// *Note: THIS IS NOT A USER ERROR NUMBER/MESSAGE. THIS DOES NOT NEED TO BE
//        TRANSLATED OR DOCUMENTED.
28407, 0000, "Hardware Security Module failed with PKCS#11 error %s(%s)"
// *Cause:  The Hardware Security Module (HSM) connection may have been lost 
//          or another internal HSM error was reached.
// *Action: Check the error. For more information on the error, check the trace 
//          files and try the following:
//          1) Retry the command. If the error repeats, go to step 2.
//          2) Verify that the HSM is configured correctly and connected.
//             Retry the command. If the error repeats, go to step 3.
//          3) Ask your Security Officer to close and open the security
//             module. Retry the command. If the error repeats, go to step 4.
//          4) Bounce the database if possible. Retry the command. 
//             If the error repeats, contact Oracle Support Services or your
//             HSM vendor's support.
/ 
28408, 00000, "encryption using passphrase failed"
// *Cause:  Encryption with the passphrase failed which was likely due to an invalid
//          or missing passphrase or due to an internal error.
// *Action: Verify that the passphrase is provided and try the operation again. If
//          the problem persists contact Oracle Support Services.
28409, 00000, "decryption using passphrase failed"
// *Cause:  Decryption with the passphrase failed which was likely due to an invalid
//          or missing passphrase or due to an internal error.
// *Action: Verify that the passphrase is provided and try the operation again. If
//          the problem persists contact Oracle Support Services.
/
/
28410, 0000, "No need to migrate from HSM to wallet."
// *Cause:  There were either no encrypted columns or all column keys were
//          already encrypted with the wallet master key. 
// *Action: No action required.
/
28411, 0000, "auto login wallet cannot be open during migration"
// *Cause:  Auto login wallet could not be opened during migration.
// *Action: Close the auto login wallet and try the migration again.
/
28412, 0000, "cannot determine the database migration status"
// *Cause:  The migration status of the database could not be determined.
// *Action: Verify if the migration status is correct in props$ and, if not,
//          correct it. Shutdown and startup the database.
/
28414, 0000, "specified keys are in HSM"
// *Cause:  Master key rekey or activation failed because the keys were in 
//          Hardware Security Module(HSM) but the configuration indicated that
//          the keys were in wallet.
// *Action: Correct the sqlnet.ora configuration to HSM or migrate to wallet.
/
28415, 0000, "specified keys are in wallet"
// *Cause:  Master key rekey or activation failed because the keys were in 
//          wallet but the configuration indicated that the keys were in 
//          Hardware Security Module (HSM) or Oracle Key Vault (OKV).
// *Action: Correct the sqlnet.ora file configuration to wallet or migrate 
//          to HSM or Oracle Key Vault. 
//
//          If WALLET_ROOT is set, set the dynamic instance initialization 
//          parameter TDE_CONFIGURATION to have a value of FILE. If the keys 
//          were migrated back to wallet, set TDE_CONFIGURATION to FILE|HSM or 
//          FILE|OKV based on the keystore that was in use. In case of
//          migration to HSM/OKV, set TDE_CONFIGURATION to HSM|FILE or OKV|FILE
//          based on the new keystore type.
/
28416, 0000, "specify the correct keystore in the sqlnet.ora file or in TDE_CONFIGURATION"
// *Cause:  Either the keystore specified in the sqlnet.ora file or 
//          TDE_CONFIGURATION was incorrect.
//          
// *Action: When migrating to HSM or Oracle Key Vault, the keystore specified 
//          in sqlnet.ora file should be HSM or Oracle Key Vault and similarly 
//          when migrating to wallet, the keystore specified in sqlnet.ora 
//          should be wallet. Check if the sqlnet.ora file configuration 
//          is correct and, if not, correct it.
//      
//          If WALLET_ROOT is configured, during migration to HSM or Oracle
//          Key Vault the KEYSTORE_CONFIGURATION value of the dynamic instance 
//          initialization parameter TDE_CONFIGURATION should be set to 
//          HSM|FILE or OKV|FILE based on the keystore that will be used
//          after the migration has completed. Similarly when migrating to 
//          wallet, KEYSTORE_CONFIGURATION value of TDE_CONFIGURATION should 
//          be set to FILE|HSM or FILE|OKV.
//         
/
28417, 0000, "password-based keystore is not open"
// *Cause:  Password-based keystore was not opened.
// *Action: Close the auto login keystore, if required, and open a 
//          password-based keystore.
/
28418, 0000, "password-based HSM is not open"
// *Cause:  Password-based HSM was not opened.
// *Action: Close the auto login keystore, if required, and open a
//          password-based HSM.
/
28419, 00000, "migration from wallet to Hardware Security Module (HSM) failed"
// *Cause:  The TDE_MASTER_KEY_ID entry did not exist in props$ table.
//          A subsequent attempt to add TDE_MASTER_KEY_ID entry into
//          props$ failed.
// *Action: Verify why the TDE_MASTER_KEY_ID entry was deleted from the props$
//          table. Retry the command.
/
28420, 00000, "cannot open resetlogs from a restore point prior to wallet creation"
// *Cause:  The open resetlogs, open read-only, or standby activation operation 
//          failed because the restore point is prior to the wallet creation, and
//          the data file does not contain the database key information as stored
//          in the control file.
// *Action: Restore to a restore point after the wallet creation, or rebuild the
//          control file with existing data files.
/
28421, 00000, "cannot FINISH a tablespace encrypt, decrypt or rekey command which has not started"
// *Cause:  The ALTER TABLESPACE FINISH [ENCRYPT | DECRYPT | REKEY] command 
//          did not find a failed attempt for tablespace encrypt, decrypt or 
//          rekey.
// *Action: Check if tablespace already has a desired key version and reissue
//          the command without FINISH keyword if necessary.
/
28422, 00000, "operation disallowed: concurrent master key rekey"
// *Cause:    Concurrent master key rekey was detected.
// *Action:   Wait for the master key rekey operation to complete and retry
//            the command.
//
/
28423, 00000, "current operation disallowed: %s tablespace is being encrypted, decrypted, or rekeyed"
// *Cause:    The specified tablespace was being concurrently encrypted,
//            decrypted, or rekeyed.
// *Action:   Wait for the concurrent operation to complete and retry the command.
//
/
28424, 00000, "ENCRYPT, DECRYPT or REKEY option already specified"
// *Cause: In the CREATE or ALTER TABLESPACE statement, the ENCRYPT, DECRYPT
//         or REKEY option was specified more than once.
// *Action: Remove all but one of the ENCRYPT, DECRYPT or REKEY options.
/
28425, 00000, "missing a valid FILE_NAME_CONVERT clause"
// *Cause: A valid FILE_NAME_CONVERT clause was not specified with the 
//         ALTER TABLESPACE [ENCRYPT | DECRYPT | REKEY] statement. The 
//         FILE_NAME_CONVERT clause is required unless Oracle Managed Files
//         are being used.
// *Action: Specify a valid FILE_NAME_CONVERT clause and retry the command.
/
28426, 00000, "must FINISH a tablespace encrypt, decrypt or rekey command first"
// *Cause:  The ALTER TABLESPACE [ENCRYPT | DECRYPT | REKEY] command found a
//          previously failed attempt for tablespace encrypt, decrypt or rekey.
// *Action: Issue the ALTER TABLESPACE FINISH [ENCRYPT | DECRYPT | REKEY] command
//          to complete the attempt for tablespace encrypt, decrypt or rekey.
/
28427, 00000, "cannot create, import or restore unencrypted tablespace: %s in Oracle Cloud"
// *Cause:  The specified tablespaces were not encrypted, or were not allowed
//          to be decrypted. Oracle Cloud mandates that all tablespaces must
//          be encrypted.
// *Action: Create, import or restore an encrypted tablespace, or encrypt the
//          specified tablespace, or do not decrypt the specified tablespace.
/
28428, 00000, "cannot encrypt or decrypt a data file in mount mode when the database is open elsewhere"
// *Cause:  An attempt was made to encrypt or decrypt a data file in mount mode
//          when the database was already opened by another Oracle RAC instance.
// *Action: Ensure that the database is not open anywhere and retry the command.
/
28429, 00000, "cannot encrypt or decrypt a data file on standby when it is open read-only"
// *Cause:  An attempt was made to encrypt or decrypt a data file on a standby
//          database when it was already opened in read-only mode.
// *Action: Restart the standby instance in mount mode and retry the command.
/
28430, 00000, "cannot encrypt or decrypt a data file for online tablespace %s"
// *Cause:  An attempt was made to encrypt or decrypt a data file for an
//          online tablespace.
// *Action: Bring the tablespace offline and retry the command.
/
28431, 00000, "cannot encrypt an already encrypted data file %s"
// *Cause:  An attempt was made to encrypt a data file that was already encrypted
//          in an encrypted tablespace.
// *Action: Check if the data file belongs to an encrypted tablespace.
/
28432, 00000, "cannot encrypt data file %s in seed pluggable database"
// *Cause:  An attempt was made to encrypt a data file that was part of a seed
//          pluggable database, which is not allowed.
// *Action: Check if the data file belongs to a seed pluggable database.
/
28433, 00000, "mismatched encryption property between data file %s and tablespace %s"
// *Cause:  Either an unencrypted data file in an encrypted tablespace or an 
//          encrypted data file in an unencrypted tablespace was found.
//          When bringing a tablespace online or opening the database,
//          all data files in an encrypted tablespace must be encrypted, and
//          all data files in an unencrypted tablespace must be unencrypted.
// *Action: Encrypt all of the data files in the tablespace before resuming the 
//          operation.
/
28434, 00000, "cannot decrypt an unencrypted data file %s"
// *Cause:  An attempt was made to decrypt a data file that was unencrypted.
// *Action: Check if the data file belongs to an encrypted tablespace.
/
28435, 00000, "cannot decrypt data file %s which is not encrypted with the database key"
// *Cause:  An attempt was made to decrypt a data file that was not encrypted
//          with the database key. Only data files encrypted with the ALTER
//          DATABASE DATAFILE ENCRYPT or ALTER TABLESPACE ENCRYPTION OFFLINE
//          ENCRYPT statement are encrypted with the database key.
// *Action: Check if the data file belongs to an encrypted tablespace with a
//          different key from the database key in the V$DATABASE_KEY_INFO
//          view, or use the ALTER TABLESPACE ENCRYPTION ONLINE DECRYPT
//          statement instead.
/
28436, 00000, "cannot encrypt data file %s in SYSTEM or SYSAUX tablespace"
// *Cause:  An attempt was made to encrypt a data file that was a part of the
//          SYSTEM or SYSAUX tablespace, which is not allowed in compatibility
//          lower than 12.2.
// *Action: Check if the data file belongs to SYSTEM or SYSAUX tablespace, or
//          change the database compatibility to 12.2 or later.
/
28437, 00000, "unexpected FILE_NAME_CONVERT clause with Oracle Managed Files"
// *Cause:  A FILE_NAME_CONVERT clause was specified with the 
//          ALTER TABLESPACE [ENCRYPT | DECRYPT | REKEY] statement, which is not
//          allowed when the database is using Oracle Managed Files.
// *Action: Remove the FILE_NAME_CONVERT clause and retry the command.
/
28438, 00000, "ALTER TABLESPACE %s ENCRYPTION %s%s operation not complete"
// *Cause:  The ALTER TABLESPACE [ENCRYPT | DECRYPT | REKEY] command started
//          but could not complete for all the data files of this tablespace.
// *Action: Check if all the data files are online and if the specified
//          FILE_NAME_CONVERT clause covers all the data files of this
//          tablespace, and retry the command with FINISH keyword, if 
//          V$ENCRYPTED_TABLESPACES shows that the tablespace is not in NORMAL
//          status.
/
28439, 00000, "cannot close wallet when SYSTEM, SYSAUX, UNDO, or TEMP tablespaces are encrypted"
// *Cause:  An attempt was made to close the wallet for a database
//          with an encrypted SYSTEM, SYSAUX, UNDO, or TEMP tablespace.
// *Action: Decrypt the tablespace and retry the command.
/
28440, 00000, "cannot offline encrypt or decrypt data file %s - file is in use or recovery"
// *Cause:  An attempt was made to offline encrypt or decrypt a data file
//          that was online in an open instance, being encrypted or decrypted
//          by another session, or was being recovered. 
// *Action: Ensure that the tablespace is offline and no other encrypt or
//          decrypt operation is performed on this data file, and end all
//          recovery sessions.
28441, 00000, "RMAN clone instance cannot open wallet"
// *Cause:  The RMAN clone instance failed to open the auto login wallet in an
//          operation such as a pluggable database (PDB) or tablespace
//          point-in-time recovery because the auto login wallet was
//          incorrectly configured, or did not exist.
// *Action: Check and correct the auto-login wallet configuration or create
//          an auto-login wallet from the password wallet, and retry the
//          operation. 
/
28442, 00000, "Rekey of the TDE master encryption key is not permitted when the database is in restricted mode."
// *Cause:  An attempt was made to rekey the Transparent Data Encryption (TDE) 
//          master encryption key when the database was in restricted mode. 
// *Action: Open the database in read-write mode and retry the command.
/
/
28443, 00000, "cannot access the TDE wallet"
// *Cause:  An attempt was made to access the Transparent Data Encryption (TDE)
//          master encryption key in the TDE wallet.
// *Action: Create a TDE wallet, provision a TDE master encryption key in the
//          wallet and ensure that the wallet is open. 
/
28444, 00000, "cannot enforce encryption of dictionary data"
// *Cause:  Either encryption of the dictionary data was already enforced or an
//          attempt was made to enforce encryption of the dictionary data with
//          compatible parameter earlier than release 12.2.0.2.
// *Action: Ensure that the compatible parameter is later than release
//          12.2.0.2 because earlier versions cannot handle encrypted
//          dictionary data.
/
28445, 00000, "Execution of the command failed."
// *Cause:  Command execution failed due to an internal error.
// *Action: Check the trace file to learn the exact cause.
/
28446, 00000, "cannot execute dictionary data rekey/delete key"
// *Cause:  Could not find an existing data encryption key.
// *Action: Ensure that a data encryption key exists before regenerating or
//          deleting it.
/
28447, 00000, "insufficient privilege to execute ALTER DATABASE DICTIONARY statement"
// *Cause:  An attempt was made to execute the ALTER DATABASE DICTIONARY
//          statement without the necessary SYSKM privilege. For
//          CONTAINER = ALL clause, the user must have the commonly granted
//          SYSKM privilege or the user must have the local SYSKM privilege.
// *Action: Ensure that the user has the necessary privilege before executing the DDL.
/
28448, 00000, "The ALTER DATABASE DICTIONARY statement was used incorrectly."
// *Cause:  ALTER DATABASE DICTIONARY statement was used incorrectly.
// *Action: Ensure that a valid ALTER DATABASE DICTIONARY statement is executed.
/
28449, 00000, "cannot use an invalidated database link"
// *Cause:  An attempt was made to use an invalid database link.
// *Action: Reset the password of the invalidated database link.
/
28450, 00000, "encryption specified with CREATE DATABASE or CREATE PLUGGABLE DATABSE"
// *Cause:  The encryption option was specified in a CREATE DATABASE
//          or a CREATE PLUGGABLE DATABASE statement.
// *Action:  Do not specify encryption in the CREATE DATABASE or CREATE 
//           PLUGGABLE DATABASE statement.
/
28451, 00000, "incomplete ALTER DATABASE LINK statement"
// *Cause:  An attempt was made to reset the password for an invalid shared
//          database link without providing either the CONNECT TO clause, the
//          AUTHENTICATED BY schema_name clause or the IDENTIFIED BY password
//          clause.
// *Action:  Ensure that the user provides all of the clauses in the ALTER
//           SHARED DATABASE LINK statement, the CONNECT TO clause, the 
//           AUTHENTICATED BY schema_name clause and the IDENTIFIED BY password
//           clause.
/
28452, 00000, "ALTER DATABASE DICTIONARY statement is not allowed during rolling upgrade if LOB siganture is enabled."
// *Cause:  An attempt was made to execute the ALTER DATABASE DICTIONARY
//          statement during rolling upgrade when LOB signature was enabled.
// *Action: Disable LOB signature. 
/
/ 28500-28749 RESERVED FOR THE HETEROGENEOUS SERVICES
/
28500, 00000, "connection from ORACLE to a non-Oracle system returned this message:"
// *Cause:    The cause is explained in the forwarded message.
// *Action:   See the non-Oracle system's documentation of the forwarded
//            message.
//
28501, 00000, "communication error on heterogeneous database link"
// *Cause:  An unexpected communication failure occurred
//          on a heterogeneous database link to a non-Oracle system.
//          The message above will be followed by a second message generated
//          by the connected non-Oracle system.
// *Action: See the documentation for the non-Oracle system
//          for an explanation of the second error message.
//
28502, 00000, "internal communication error on heterogeneous database link"
// *Cause:  A communication error internal to ORACLE's heterogeneous
//          services has occurred.
// *Action: Contact Oracle customer support.
//
28503, 00000, "bind value cannot be translated into SQL text for non-Oracle system"
// *Cause:  A SQL statement used bind variables on a Heterogenous Services
//          database link to a non-Oracle system, but the non-Oracle system
//          does not support bind variables.
// *Action: Change your SQL statement so that it does not use bind variables.
//
28504, 00000, "ROWID not found in ROWID cache for heterogeneous database link"
// *Cause:  The ROWID cache for Heterogeneous Services held no entry that
//          corresponds to the specified ROWID. The ROWID entry may have been
//          overwritten in the ROWID cache.
// *Action: Enlarge the Heterogeneous Services ROWID cache size by increasing
//          the value of the Heterogenous Services initialization parameter
//          HS_ROWID_CACHE_SIZE.
//
28505, 00000, "cannot get non-Oracle system capabilities from %s"
// *Cause:  ORACLE was unable to retrieve capability information
//          for the non-Oracle system connected through a heterogeneous
//          database link.  This capability information should be
//          stored in data dictionary tables viewable with the
//          HS_CLASS_CAPS or HS_INST_CAPS data dictionary views.
// *Action: Contact the DBA to check the server data dictionary table
//          named in the error message.  If table contents are
//          incorrect, the DBA should restore all data dictionary content for
//          this FDS_CLASS_NAME and/or FDS_INST_NAME.  It usually is
//          sufficient to delete all current data dictionary content for this
//          class and/or instance and initiate a new connection
//          to let the connected agent upload new data dictionary content
//          to the server.
//
28506, 00000, "parse error in data dictionary translation for %s stored in %s"
// *Cause:  A reference to an ORACLE data dictionary table or view name
//          on a heterogeneous database link to a non-Oracle system
//          could not be translated. The ORACLE data dictionary tables
//          shown with view HS_CLASS_DD contain invalid SQL for the data
//          dictionary translation.
// *Action: Contact customer support of the agent vendor.
//
28507, 00000, "error in data dictionary view %s"
// *Cause:  The initialization parameter table for the Heterogeneous Services
//          was not available, or its structure (number of columns or
//          column types) was incorrect.
// *Action: Verify correct installation of the following Heterogeneous Services'
//          initialization parameter views: HS_CLASS_INIT and HS_INST_INIT.
//          If these views are not available, make sure you ran the
//          script CATHS.SQL in the $ORACLE_HOME/rdbms/admin directory.
//
28508, 00000, "invalid value %s for Heterogeneous Services initialization parameter %s"
// *Cause:  The specified Heterogeneous Services initialization parameter
//          had an invalid value when attempting to connect to a non-Oracle
//          system.
// *Action: Check the Heterogeneous Services and agent documentation to
//          determine acceptable values
//
28509, 00000, "unable to establish a connection to non-Oracle system"
// *Cause:   Initialization of a database link to a non-Oracle system
//           failed to connect to the Heterogeneous Services agent
//           process for this non-Oracle system.
// *Action:  Check the Net8 service name definition in the following
//           places:
//           --  the USING clause of the CREATE DATABASE LINK statement
//           --  the TNSNAMES.ORA file
//           --  the Oracle Names Server
//
//           The following are possible reasons for name mismatches:
//            --  The USING clause in the CREATE DATABASE LINK statement has
//                to match the service name defined in the TNSNAMES.ORA file
//                or in the Oracle Names Server.
//            --  The protocol-specific information in the service name
//                definition must match the protocol-specific definition
//                of the responding listener.
//            --  The SID=<name> in the service name definition
//                (in the TNSNAMES.ORA file or in Oracle Names Server) must
//                match the value in the LISTENER.ORA file for the responding
//                listener.
//
28510, 00000, "heterogeneous database link initialization failed"
// *Cause:  Initialization of a heterogeneous database link to a
//          non-Oracle system failed due to an error identified
//          by the agent for this non-Oracle system.
// *Action: Make sure the non-Oracle system is up and running and that
//          all of the environment and initialization values for the agent
//          are set correctly.
//
28511, 00000, "lost RPC connection to heterogeneous remote agent using SID=%s"
// *Cause:  A fatal error occurred in one of the following places:
//          -- the connection between the ORACLE server and the agent
//          -- the heterogeneous services remote agent itself
//          -- the connection to the non-Oracle system
//          This error occurred after communication had been established
//          successfully.
// *Action: Check for network problems and remote host crashes. The problem is
//          probably in the agent software. If so, contact a customer support
//          representative of the agent vendor.
//
28512, 00000, "cannot get data dictionary translations from %s"
// *Cause:  ORACLE was unable to retrieve data dictionary translation
//          information for the non-Oracle system connected through a
//          heterogeneous database link.  This data dictionary translation
//          information should be stored in data dictionary tables viewable
//          with the HS_CLASS_DD or HS_INST_DD data dictionary views.
// *Action: Ask your DBA to check the server data dictionary table
//          named in the error message.  If table contents are
//          incorrect, the DBA should restore all data dictionary content for
//          this FDS_CLASS_NAME and/or FDS_INST_NAME.  It usually is
//          sufficient to delete all current data dictionary content for this
//          class and/or instance and initiate a new connection
//          to let the connected agent upload new data dictionary content
//          to the server.
//
28513, 00000, "internal error in heterogeneous remote agent"
// *Cause:  An internal error has occurred in the Oracle remote agent
//          supporting a heterogeneous database link.
// *Action: Make a note of how the error was produced and contact the
//          customer support representative of the agent vendor.
//
28514, 00000, "heterogeneous database link initialization could not convert system date"
// *Cause:  The system date was not retrievable.
// *Action: Verify that the ORACLE server's host machine and operating system
//          are operational.  This error should not occur unless low level
//          system functions are failing.
//
28515, 00000, "cannot get external object definitions from %s"
// *Cause:  ORACLE was unable to retrieve definitions of distributed external
//          procedures or remote libraries registered for the non-Oracle system
//          instance, probably because the underlying data dictionary table
//          does not exist or is malformed.
// *Action: Verify that the ORACLE server's Heterogeneous Services
//          data dictionary was installed correctly. If the Heterogeneous
//          Services data dictionary is not installed, execute the CATHS.SQL
//          script in the $ORACLE_HOME/rdbms/admin directory.
//
28518, 00000, "data dictionary translation has illegal translation type"
// *Cause:  A data dictionary translation definition, either in the ORACLE
//          server data dictionary or in data dictionary content uploaded
//          from a Heterogeneous Services agent, specified an illegal
//          translation type code.  Legal values are 'T' or 't' for
//          'translate', 'M' or 'm' for 'mimic'.  Information on the exact
//          data dictionary translation causing the error is written
//          to a trace (*.TRC) file for the ORACLE instance and to
//          the ORACLE instance's alert log.  This error occurs
//          when a Heterogeneous Services agent uploads data dictionary
//          content to an ORACLE server on the first connection from the server
//          to the agent.
// *Action: Contact the customer support of the agent vendor.
//
28519, 00000, "no heterogeneous data dictionary translations available"
// *Cause:  The ORACLE server's data dictionary did not define data dictionary
//          translations for the connected non-Oracle system, and automatic
//          self-registration (data dictionary upload) was disabled.
// *Action: Ask a DBA to resolve this problem.  The easiest solution is
//          to enable automatic self-registration by setting the ORACLE
//          server's HS_AUTO_REGISTER initialization parameter to TRUE.
//          An alternative is to load the Heterogeneous Services
//          data dictionary with information specific for the non-Oracle
//          system by executing a SQL script supplied by the agent vendor.
//          If the script is run and the error persists, contact the
//          customer support representative of the agent vendor.
//
28520, 00000, "error initializing heterogeneous data dictionary translations"
// *Cause:  ORACLE was unable to retrieve data dictionary translations for
//          the non-Oracle system instance, probably because the underlying
//          data dictionary table does not exist or is formed incorrectly.
// *Action: Verify that the ORACLE server's Heterogeneous Services
//          data dictionary was installed correctly. If the Heterogeneous
//          Services data dictionary is not installed, execute the CATHS.SQL
//          script in the $ORACLE_HOME/rdbms/admin directory. If the connected
//          agent, identified by FDS_CLASS_NAME, requires a custom installation
//          script for the ORACLE server, verify that the script has been run.
//          If both scripts were executed and the error persists, contact the
//          customer support representative of the agent vendor.
//
28521, 00000, "no heterogeneous capability information available"
// *Cause:  The ORACLE server's data dictionary did not contain
//          capability definitions for the connected non-Oracle system,
//          and automatic self-registration (data dictionary upload)
//          was disabled.
// *Action: Ask a DBA to resolve this problem.  The easiest resolution is
//          to enable automatic self-registration by setting the ORACLE
//          server's HS_AUTO_REGISTER initialization parameter to TRUE.
//          An alternative is to load the Heterogeneous Services
//          data dictionary with information specific for the non-Oracle
//          system by executing a SQL script supplied by the agent vendor.
//          If the script is run and the error persists, contact the
//          customer support representative of the agent vendor.
//
28522, 00000, "error initializing heterogeneous capabilities"
// *Cause:  ORACLE was unable to retrieve capability definitions for
//          the non-Oracle system instance, probably because the underlying
//          data dictionary table does not exist or is formed incorrectly.
// *Action: Verify that the ORACLE server's Heterogeneous Services
//          data dictionary was installed correctly. If the Heterogeneous
//          Services data dictionary is not installed, execute the CATHS.SQL
//          script in the $ORACLE_HOME/rdbms/admin directory.  If the connected
//          agent, identified by FDS_CLASS_NAME, requires a custom installation
//          script for the ORACLE server, verify that the script has been run.
//          If both scripts were executed and the error persists, contact the
//          customer support representative of the agent vendor.
//
28523, 00000, "ORACLE and heterogeneous agent are incompatible versions"
// *Cause:  An operation on a database link attempted to connect to
//          a non-Oracle system, but the ORACLE instance and the
//          agent process for the non-Oracle system are incompatible.
// *Action: Ask your DBA to confirm configuration of both the ORACLE
//          instance and the agent.  Additional information on the
//          version incompatibility is logged in trace (*.TRC) files,
//          the ORACLE instance and the agent, and in the ORACLE
//          instance's alert log. Check the documentation for your agent
//          to find out which releases of the Oracle Server are supported.
//
28525, 00000, "unable to create Heterogeneous Services error message text"
// *Cause:  Incorrect arguments were passed into the error message
//          creation routine.
// *Action: Contact Oracle customer support.
//
28526, 00000, "invalid describe information returned to Heterogeneous Services"
// *Cause:  The Heterogeneous Services received invalid describe
//          information for a select list, bind list, or stored procedure
//          from the Heterogeneous Services agent. This indicates a problem
//          with the Heterogeneous Services' non-Oracle system agent.
// *Action: Contact customer support of the agent vendor.
//
28527, 00000, "Heterogeneous Services datatype mapping error"
// *Cause:  Either an Oracle datatype could not be mapped to a non-Oracle
//          datatype, or a non-Oracle datatype could not be mapped
//          to an Oracle datatype. These mappings are defined as
//          capability definitions in the ORACLE server's data dictionary.
// *Action: Verify that the ORACLE server's data dictionary has been
//          initialized with correct capability definitions for the connected
//          FDS_CLASS_NAME and FDS_INST_NAME. If table contents are incorrect,
//          a DBA should restore all data dictionary content for this
//          FDS_CLASS_NAME and/or FDS_INST_NAME. It usually is sufficient
//          to delete all current data dictionary content for this class and/or
//          instance and initiate a new connection to let the connected agent
//          upload new data dictionary content to the server.  If the error
//          persists contact the customer support representative of the agent
//          vendor.
//
28528, 00000, "Heterogeneous Services datatype conversion error"
// *Cause:  Either an Oracle datatype could not be converted to a non-Oracle
//          datatype, or a non-Oracle datatype could not be converted
//          to an Oracle datatype. The following are possible reasons for
//          for the conversion failure:
//          --  overflow problems (in the case of numbers)
//          --  length limitations (in the case of character strings)
//          --  invalid values passed into the conversion routines
// *Action: Contact customer support of the agent vendor. If the problem is
//          due to size discrepancies between Oracle and the non-Oracle system,
//          it may not be possible to convert the value.
//
28529, 00000, "invalid or missing parameter in Net8 service name definition"
// *Cause:  There was an invalid or missing Heterogeneous Services parameter
//          in the Net8 service name definition stored in either the
//          TNSNAMES.ORA file or in the Oracle Names Server.
// *Action: Ask your DBA to make sure the information in the Net8 service
//          definition is correct and complete. The correct information that
//          should be included in the Net8 service definition can be found in
//          the agent's documentation.
//
28530, 00000, "Heterogeneous Services initialization error in NLS language ID"
// *Cause:  Heterogeneous Services was unable to initialize an NLS language ID.
//          Both the ORACLE server and the Heterogeneous Services agent for the
//          connected non-Oracle system must have language IDs.
// *Action: Contact Oracle customer support.
//
28533, 00000, "Heterogeneous Services coercion handling error"
// *Cause:  The Heterogeneous Services encountered an error in coercion
//          handling. The HS can, if the agent vendor so chooses, perform
//          extra processing on SQL statements that contain implicit
//          coercions or that contain coercion functions such as TO_CHAR,
//          TO_NUMBER or TO_DATE. This functionality is controlled by
//          coercion-related capabilities. HS logic reports this error
//          when it encounters an error in one of these capability
//          definitions.
// *Action: The capability table settings are controlled by the agent
//          vendor and can be modified by the DBA. Contact your DBA and
//          agent vendor and get the correct set of capabilities installed.
//
28534, 00000, "Heterogeneous Services preprocessing error"
// *Cause:  One of the things that the Heterogeneous Services can do is
//          to preprocess parts of SQL statements that contain implicit
//          coercions or calls to explicit coercion functions like TO_CHAR
//          TO_NUMBER or TO_DATE. For example, it could convert a call to
//          TO_DATE to a bind variable, pre-evaluate the TO_DATE function
//          call and pass the resulting value to the non-Oracle system as
//          the bind value. This behavior is controlled by some coercion
//          related capabilities. If the capabilities are set incorrectly,
//          the HS could encounter errors when it attempts to do the
//          preprocessing. If it does then this error will be signaled.
// *Action: The capability table settings are controlled by the agent
//          vendor and can be modified by the DBA. Contact your DBA and
//          agent vendor and get the correct set of capabilities installed.
//
28535, 00000, "invalid Heterogeneous Services context"
// *Cause:  A Heterogeneous Services agent's driver module called
//          an HS service routine with an invalid HS context value.
//          This probably is a logic error in the driver.
// *Action: Contact Oracle customer support or your agent vendor.
//
28536, 00000, "error in processing Heterogeneous Services initialization parameters"
// *Cause:   An error described by a subsequent error message
//           prevented successful processing of Heterogeneous Services
//           initialization parameters from the ORACLE server data dictionary.
// *Action:  Check server data dictionary views HS_CLASS_INIT, HS_INST_INIT, and
//           HS_ALL_INITS.  Look for conditions which could produce
//           the error identified in the error message immediately
//           following this one.
//
28537, 00000, "no more result sets"
// *Cause:   This error code was used internally within Oracle Database
//           Gateway and Heterogeneous Services code and should not be
//           reported to a client program.
// *Action:  Contact Oracle customer support.
//
28538, 00000, "result set not found"
// *Cause:   The client program tried fetching from a result set that is not
//           open anymore. Many gateways will, on execution of a stored procedure,
//           automatically close all result sets that were returned by any
//           previously executed stored procedure.
// *Action:  Check the documentation for the gateway that you are using and see
//           if it will automatically close currently open result sets each time
//           a stored procedure is executed. Then check if your client program is
//           doing anything that violates this rule. If it is, fix your program. If
//           it is not then contact Oracle customer support.
//
28539, 00000, "gateway does not support result sets"
// *Cause:   The client program tried executing a stored procedure that returns
//           one or more result sets through a gateway that does not have result
//           set support.
// *Action:  Check the documentation for the gateway that you are using and see
//           if it supports result sets returned from stored procedures. If it
//           does not, then the only way of accessing such stored procedures is
//           to upgrade to a version of the gateway that does support result
//           sets (if such a version exists). If the gateway does have result set
//           support and you are still seeing this error then contact Oracle
//           customer support.
//
28540, 00000, "internal result set error"
// *Cause:   A protocol error internal to Heterogeneous Services or Oracle
//           Database Gateway code has occurred.
// *Action:  Contact Oracle customer support.
//
28541, 00000, "Error in HS init file on line %d.\n"
// *Cause:   A syntax error occurred in the gateway initialization file.
// *Action:  Check gateway init file to correct the syntax error.
//           For further information, check the error message in the gateway
//           trace file.
//
28542, 00000, "Error in  reading HS init file \n"
// *Cause:   Reading the gateway init file generated an error.
// *Action:  Check the gateway initialization file name to see that the
//           gateway initialization file acctually exists.
//           Check the ifile parameter to see that it points to the correct
//           location.
//
28543, 00000, "Error initializing apply connection to non-Oracle system"
// *Cause:   Attempt to initialize connection to non-Oracle for heterogeneous
//           replication failed.
// *Action:  Check if the listener used to connect to the gateway is up and is
//           correctly configured. Make sure that the database link used has
//           been configured correctly and, if a tnsnames alias has been used
//           in the database link definition, make sure that the configuration
//           of the entry in tnsnames.ora has been done correctly.
//
28544, 0000, "connect to agent failed, probable Net8 administration error"
// *Cause:   Net8 reported a failure to make a RSLV connection or
//           a protocol mode error when the Oracle server attempted
//           to establish communication with a Heterogeneous Services
//           agent or an external procedure agent.  This usually is due
//           to an administration error in setting up Net8 service definitions
//           in TNSNAMES.ORA or LISTENER.ORA:  A basic network connection
//           is opened, but it connects to a program which does not use
//           the appropriate protocol.  This often is a sign that the
//           connection goes to the wrong program.
// *Action:  Check Net8 administration in the following ways:
//           --  When using TNSNAMES.ORA or an Oracle Names server, make sure
//               that the connection from the ORACLE server uses the correct
//               service name or SID.
//           --  Check LISTENER.ORA on the agent's host machine to assure that
//               the service name or SID refers to the correct agent
//               executable in its (PROGRAM=...) clause.
//           --  Confirm in TNSNAMES.ORA or the equivalent service definition
//               that sevice 'extproc_connection_data' does NOT contain
//               (HS=), or that the service definition used by a
//               Heterogeneous Services database link DOES contain (HS=).
//
28545, 0000, "error diagnosed by Net8 when connecting to an agent"
// *Cause:   An attempt to call an external procedure or to issue SQL
//           to a non-Oracle system on a Heterogeneous Services database link
//           failed at connection initialization.  The error diagnosed
//           by Net8 NCR software is reported separately.
// *Action:  Refer to the Net8 NCRO error message.  If this isn't clear,
//           check connection administrative setup in tnsnames.ora
//           and listener.ora for the service associated with the
//           Heterogeneous Services database link being used, or with
//           'extproc_connection_data' for an external procedure call.
//
28546, 0000, "connection initialization failed, probable Net8 admin error"
// *Cause:   A failure occurred during initialization of a network connection
//           from the Oracle server to a second process:  The connection
//           was completed but a disconnect occurred while trying to
//           perform protocol-specific initialization, usually due to
//           use of different network protocols by opposite sides
//           of the connection.  This usually is caused by incorrect
//           Net8 administrative setup for database links or external
//           procedure calls.   The most frequent specific causes are:
//           --  Database link setup for an Oracle-to-Oracle connection
//               instead connects to a Heterogeneous Services agent
//               or an external procedure agent.
//           --  Database link setup for a Heterogeneous Services connection
//               instead connects directly to an Oracle server.
//           --  The extproc_connection_data definition in tnsnames.ora
//               connects to an Oracle instance instead of an external
//               procedure agent.
//           --  Connect data for a Heterogeneous Services database link,
//               usually defined in tnsnames.ora, does not specify (HS=).
//           --  Connect data for an Oracle-to-Oracle database link,
//               usually defined in tnsnames.ora, specifies (HS=).
// *Action:  Check Net8 administration in the following ways:
//           --  When using TNSNAMES.ORA or an Oracle Names server, make sure
//               that the connection from the ORACLE server uses the correct
//               service name or SID.
//           --  Check LISTENER.ORA on the connection end point's host machine
//               to assure that this service name or SID connects to the
//               correct program.
//           --  Confirm in TNSNAMES.ORA or the equivalent service definition
//               that service 'extproc_connection_data' does NOT contain
//               (HS=), or that the service definition used by a
//               Heterogeneous Services database link DOES contain (HS=).
//
28547, 0000, "connection to server failed, probable Oracle Net admin error"
// *Cause:   A failure occurred during initialization of a network connection
//           from a client process to the Oracle server.  The connection
//           was completed but a disconnect occurred while trying to
//           perform protocol-specific initialization, usually due to
//           use of different network protocols by opposite sides
//           of the connection.  This usually is caused by incorrect
//           Oracle Net administrative setup for database links or external
//           procedure calls.   The most frequent specific causes are:
//           --  The connection uses a connect string which refers
//               to a Heterogeneous Services agent instead of
//               an Oracle server.
//           --  The connection uses a connect string which includes
//               an (HS=) specification.
//           --  Hitting Ctrl+C before connection initialization is
//               complete.
//           --  Using DRCP on Windows with SQLNET.AUTHENTICATION_SERVICES
//               set to NTS.
//           --  Connection timeout due to SQLNET.INBOUND_CONNECT_TIMEOUT
//               parameter when all shared servers are busy in
//               shared server configuration.
//           --  The character set of the database is not recognized by 
//               the client process, which may be caused by an incorrect 
//               or unnecessary setting of the ORA_NLS10 client environment 
//               variable or by a new or user-defined character set 
//               installed in the Oracle server and used for the database. 
// *Action:  Check Oracle Net administration in the following ways:
//           --  When using TNSNAMES.ORA or an Oracle Names server, make sure
//               that the client connection to the Oracle server uses
//               the correct service name or SID.
//           --  Check LISTENER.ORA on the connection end point's host machine
//               to assure that this service name or SID refers
//               to the correct server.
//           --  Confirm in TNSNAMES.ORA or the equivalent service definition
//               that the connect string does not contain (HS=).
//           --  Set SQLNET.AUTHENTICATION_SERVICES to NONE when using DRCP
//               on Windows.
//           --  Verify the NLS configuration of the Oracle client 
//               process. Ensure that the database character set is 
//               supported by the Oracle client software. If necessary, 
//               upgrade the Oracle client software or install the missing 
//               user-defined character set. 
//
28550, 00000, "pass-through SQL: cursor not found"
// *Cause:   A value passed to a pass-through SQL function or procedure call
//           as a cursor does not identify a currently open cursor.
// *Action:  Use a cursor number returned by the pass-through SQL
//           OPEN_CURSOR call.
//
28551, 00000, "pass-through SQL: SQL parse error"
// *Cause:   A non-Oracle system rejected text supplied as a
//           pass-through SQL statement.
// *Action:  Ensure that the SQL supplied to the pass-through SQL
//           PARSE call is legal for the non-Oracle system.
//
28552, 00000, "pass-through SQL: call flow error"
// *Cause:   A pass-through SQL function was called in an invalid order.
// *Action:  Correct program flow by changing the order of API calls
//           to match the flow described in the manual.
//
28553, 00000, "pass-through SQL: invalid bind-variable position"
// *Cause:   A pass-through SQL function referring to the position
//           of a bind variable in the currently-parsed SQL statement
//           supplied an invalid bind-variable position.  Valid
//           values are 1 through n, where n is the number of
//           bind-variable place-holders in the SQL text.
// *Action:  Verify that the bind-variable position parameter is in
//           the correct range to represent a place-holder in the
//           SQL text. Confirm that the SQL text uses the correct
//           syntax for a bind-variable place-holder, as required
//           by the non-Oracle system.
//
28554, 00000, "pass-through SQL: out of cursors"
// *Cause:   The maximum number of open cursors has been exceeded.
// *Action:  Close open cursors by using the pass-through SQL
//           CLOSE_CURSOR function.
//
28555, 00000, "pass-through SQL: required parameter missing or NULL"
// *Cause:   An attempt was made to pass a NULL value to a non-NULL parameter.
// *Action:  Use a non-NULL value for the parameter.
//
28556, 00000, "authorization insufficient to access table"
// *Cause:   A query attempted to access a table in the non-Oracle system
//           that is either privileged or has privileged columns.
// *Action:  Contact the DBA for the non-Oracle system. The DBA can
//           grant permission to access the privileged table or columns.
//
28557, 00000, "unknown %s for database link to non-Oracle system"
// *Cause:   When attempting to connect to a non-Oracle system
//           through a Heterogeneous Services database link,
//           the agent supporting this non-Oracle system failed to return
//           FDS_CLASS_NAME and/or FDS_INST_NAME. ORACLE requires these
//           names to configure the heterogeneous database link.
// *Action:  Contact the DBA to check setup of the connection and
//           the Heterogeneous Services agent.
//
28558, 00000, "HS_FDS_CONNECT_STRING undefined for non-Oracle system"
// *Cause:   A database link to a non-Oracle system had no
//           HS_FDS_CONNECT_STRING initialization parameter in the ORACLE
//           server's data dictionary for Heterogeneous Services. Without
//           this parameter, the connection could not be completed.
// *Action:  Contact your DBA to verify correct setup of an
//           HS_FDS_CONNECT_STRING entry in the ORACLE Heterogeneous Services
//           data dictionary.
//
28559, 00000, "FDS_CLASS_NAME is %s, FDS_INST_NAME is %s"
// *Cause:   An associated error was reported in another message, and this
//           message supplies supplementary information to assist
//           diagnosis of that error. FDS_CLASS_NAME and FDS_INST_NAME are used
//           to access information in tables and views of the ORACLE data
//           dictionary that direct operation of Heterogeneous Services on
//           a database link to a non-Oracle data store.
// *Action:  Use the FDS_CLASS_NAME and FDS_INST_NAME values
//           to check ORACLE data dictionary contents when necessary
//           to diagnose the cause of the associated error.
//
28560, 0000, "error in configuration of agent process"
// *Cause:   An ORACLE server invoked a function not supported
//           by the connected agent (Heterogeneous Services
//           or external procedures). The most probable cause is
//           incorrect Net8 setup, resulting in use of the wrong
//           agent executable.
// *Action:  Check Net8 administration in the following ways:
//           --  When using TNSNAMES.ORA or an Oracle Names server, make sure
//               that the connection from the ORACLE server uses the correct
//               SID.
//           --  Check LISTENER.ORA on the agent's host machine to assure that
//               this SID refers to the correct agent executable in its
//               (PROGRAM=...) clause.
28561, 00000, "unable to set date format on non-Oracle system"
// *Cause:   Initialization of a Heterogeneous Services connection
//           to set the date format to be used on the connected
//           non-Oracle system.
// *Action:  If the Oracle data dictionary supplies a value for
//           the HS_NLS_DATE_FORMAT parameter, confirm that this value
//           is formatted correctly by the rules of the non-Oracle system.
//           Also check for additional information in log and trace
//           files generated by the Heterogeneous Services agent.
28562, 00000, "Heterogeneous Services data truncation error"
// *Cause:   A select operation was attempted with an insufficient data buffer
//           to satisfy the request.
// *Action:  Contact your DBA to verify whether your gateway initialization
//           parameter HS_KEEP_REMOTE_COLUMN_SIZE is set appropriately based
//           on your requirement.  If it is, make sure the sizes of bind
//           parameters are sufficient.
//           If the problem persists, contact Oracle Support Services. 
/
/ 28575 - 28600 reserved for untrusted and distributed external procedures
/
28575, 00000, "unable to open RPC connection to external procedure agent"
// *Cause:   Initialization of a network connection to the extproc agent did
//           not succeed. This problem can be caused by network problems,
//           incorrect listener configuration, or incorrect transfer code.
// *Action:  Check listener configuration in LISTENER.ORA and TNSNAMES.ORA, or
//           check Oracle Names Server.
//
28576, 00000, "lost RPC connection to external procedure agent"
// *Cause:  A fatal error occurred in either an RPC network connection,
//          the extproc agent, or the invoked 3GL after communication had
//          been established successfully.
// *Action: First check the 3GL code you are invoking; the most likely
//          cause of this error is abnormal termination of the
//          invoked "C" routine. If this is not the case, check for
//          network problems. Correct the problem if you find it. If all
//          components appear to be normal but the problem persists, the
//          problem could be an internal logic error in the RPC transfer
//          code.  Contact your customer support representative.
//
28577, 00000, "argument %s of external procedure %s has unsupported datatype %s"
// *Cause:  While transferring external procedure arguments to the agent,
//          an unsupported datatype was detected.
// *Action: Check your documentation for the supported datatypes of external
//          procedure arguments.
//
28578, 00000, "protocol error during callback from an external procedure"
// *Cause:  An internal protocol error occurred while trying to execute a
//          callback to the Oracle server from the user's 3GL routine.
// *Action: Contact Oracle customer support.
//
28579, 00000, "network error during callback from external procedure agent"
// *Cause:  An internal network error occurred while trying to execute a
//          callback to the Oracle server from the user's 3GL routine.
// *Action: Contact Oracle customer support.
//
28580, 00000, "recursive external procedures are not supported"
// *Cause:  A callback from within a user's 3GL routine resulted in the
//          invocation of another external procedure.
// *Action: Make sure that the SQL code executed in a callback does not directly
//          call another external procedure, or indirectly results in another
//          external procedure, such as triggers calling external
//          procedures, PL/SQL procedures calling external procedures, etc.
//
28581, 00000, "protocol error while executing recursive external procedure"
// *Cause:  An internal protocol error occurred while trying to execute an
//          external procedure resulting from a callback in another external
//          procedure.
// *Action: Contact Oracle customer support.
//
28582, 00000, "a direct connection to this agent is not allowed"
// *Cause:  A user or a tool tried to establish a direct connection to either
//          an external procedure agent or a Heterogeneous Services agent,
//          for example: "SVRMGR> CONNECT SCOTT/TIGER@NETWORK_ALIAS". This type
//          of connection is not allowed.
// *Action: When executing the CONNECT statement, make sure your database link
//          or network alias is not pointing to a Heterogeneous Option agent or
//          an external procedure agent.
//
28583, 00000, "remote references are not permitted during agent callbacks"
// *Cause:  A Heterogeous Services agent issued a callback to the Oracle server
//          which attemted to to access a remote system.  This is not supported.
// *Action: Make sure that SQL code issued by Heterogeneous Services agents
//          does not reference a database link.
//
28584, 00000, "heterogeneous apply internal error"
// *Cause:  The apply slave process encountered an error while trying to
//          apply changes through a gateway to a non-Oracle system.
// *Action: Make sure that the apply database link is correctly configured and
//          that the gateway listener and the non-Oracle system are correctly
//          set up and are up and running. If everything is configured correctly
//          and the problem still occurs, contact Oracle customer support.
//
// errors 28590 - 28599 are reserved for the HS agent control utility
//
28590, 00000, "agent control utility: illegal or badly formed command"
// *Cause:  The user has issued an unrecognized or syntactically incorrect
//          command.
// *Action: Refer to documentation and correct the syntax of the command.
//
28591, 00000, "agent control utility: unable to access parameter file"
// *Cause:  The agent control utility was unable to access its parameter
//          file. This could be because it could not find its admin
//          directory or because permissions on directory were not correctly
//          set.
// *Action: The agent control utility puts its parameter file in either
//          the directory pointed to by the environment variable AGTCTL_ADMIN
//          or in the directory pointed to by the environment variable
//          TNS_ADMIN. Make sure that at least one of these environment
//          variables is set and that it points to a directory that the
//          agent has access to.
//
28592, 00000, "agent control utility: agent SID not set"
// *Cause:  The agent needs to know the value of the AGENT_SID parameter
//          before it can process any commands. If it does not have a
//          value for AGENT_SID then all commands will fail.
// *Action: Issue the command SET AGENT_SID <value> and then retry the
//          command that failed.
//
28593, 00000, "agent control utility: command terminated with error"
// *Cause:  An error occurred during the processing of the command. There
//          could be several causes. A SET or an UNSET command could have
//          been issued after the agent was started. This is illegal. The
//          user may have attempted to start two agents with the same SID
//          value or the user could have attempted to shutdown an agent
//          that is no longer running.
// *Action: If the user wishes to issue a SET or an UNSET command, he should
//          make sure the agent is shutdown first by issuing the SHUTDOWN
//          command.
//
28594, 00000, "agent control utility: invalid parameter name"
// *Cause:  The user tried to set or unset an invalid agent parameter.
// *Action: Refer to documentation and correct the parameter name.
//
28595, 00000, "Extproc agent : Invalid DLL Path"
// *Cause:  The path of DLL supplied for the extproc execution is invalid.
// *Action: Check if the DLL path is set properly using the EXTPROC_DLLS
//          environment variable.
//
28596, 00000, "Extproc agent : Invalid or disabled credential %s"
// *Cause:  The credentail of the PL/SQL library supplied for the extproc execution is invalid.
// *Action: Check if the credentail of the PL/SQL library is valid and enabled.
//
// errors 28600 - 28620 are reserved for bitmap indexes
//
28601, 00000, "invalid [no]MINIMIZE option"
// *Cause:  user didn't type this
//            alter table <table_name> MINIMIZE RECORDS_PER_BLOCK
//          or
//            alter table <table_name> NOMINIMIZE RECORDS_PER_BLOCK
// *Action: reenter correct sql command
//
28602, 00000, "statement not permitted on tables containing bitmap indexes"
// *Cause:  table has bitmap indexes and user is minimizing or
//          nominimizing records_per_block
// *Action: drop all bitmap indexes before changing records_per_block
//
//
28603, 00000, "statement not permitted on empty tables"
// *Cause:  table is empty and statement does not work on empty tables
// *Action: try statement after loading your data
//
28604, 00000, "table too fragmented to build bitmap index (%s,%s,%s)"
// *Cause:  The table has one or more blocks that exceed the maximum number
//          of rows expected when creating a bitmap index. This is probably
//          due to deleted rows. The values in the message are:
//          (data block address, slot number found, maximum slot allowed)
// *Action: Defragment the table or block(s). Use the values in the message
//          to determine the FIRST block affected. (There may be others).
28605, 00000, "bitmap indexes cannot be reversed"
// *Cause:  user tried to create reverse bitmap index
// *Action: don't do this; it is not supported
//
28606, 00000, "block too fragmented to build bitmap index (%s,%s)"
// *Cause:  The block(s) exceed the maximum number of rows expected when
//          creating a bitmap index. This is probably
//          due to maximum slot allowed set too low.
//          The values in the message are:
//          (slot number found, maximum slot allowed)
// *Action: alter system flush shared_pool; update tab$ set spare1 = 8192
//          where obj# = (select obj# from obj$ where NAME=<table_name> AND
//          owner# = <table_owner>; commit;
28611, 00000, "bitmap index is corrupted - see trace file for diagnostics"
// *Cause: Validate Index detected bitmap corruption in its argument index
// *Action: Drop this bitmap index and create a new one.
//
//
/  28650 - 28699 - Reserved for IOTs
//
28650, 00000, "Primary index on an IOT cannot be rebuilt"
// *Cause:  An attempt is made to issue alter index rebuild on IOT-TOP
// *Action: Use Alter table MOVE to reorganize the table(IOT)
28651, 00000, "Primary index on IOTs can not be marked unusable"
// *Cause:  An attempt is made to mark IOT-TOP unusable thru ALTER INDEX
// *Action: Remove the option UNUSABLE
//

28652, 00000, "overflow segment attributes cannot be specified"
// *Cause: During ALTER MOVE ONLINE of a index-organized table, the user
//        attempted to enter one or more of the following options:
//        OVERFLOW, PCTTHRESHOLD,INCLUDING.
// *Action: Remove the illegal option(s).

28653, 00000, "tables must both be index-organized"
// *Cause: Attempt to exchange a non IOT table/partition with a partition/table
//         respectively
// *Action: Ensure that non-partitioned and partitioned tables are both
//          index-organized.

28654, 00000, "table and partition not overflow compatible"
// *Cause: If one of the tables (partitioned/non-partitioned) has overflow
//         data segment and the other one doesn't.
// *Action: Ensure that non-partitioned and partitioned tables both
//          have overflow data segment or neither one does.
28655, 00000, "Alter table add overflow syntax error"
// *Cause: Syntax error
// *Action: Check the syntax.
28656, 00000, "incomplete attribute specification"
// *Cause: The attribute specification is not done for all partitions"
// *Action: Specify the storage attributes either for ALL partitions or NONE
// NLS_DO_NOT_TRANSLATE [28657,28657]
28657, 00000, "Allow IOT w/o overflow though overflow is required"
// *Cause: N/A
// *Action: THIS IS NOT A USER ERROR NUMBER/MESSAGE.  THIS DOES NOT NEED TO BE
//          TRANSLATED OR DOCUMENTED. IT IS USED ONLY BY IMPORT CODE.
28658, 00000, "This operation is supported only for Index-Organized tables"
// *Cause: Attempt to perform some IOT specific operation on a non-IOT
// *Action: don't do this. This is not supported
28659, 00000, "COMPRESS must be specified at object level first"
// *Cause: Attempt to specify COMPRESS at partition level
//         without first specifying at the table level
// *Action: Specify COMPRESS at table level. Use ALTER TABLE xxx
//          MODIFY DEFAULT ATTRIBUTES COMPRESS ...
28660, 00000, "Partitioned Index-Organized table may not be MOVEd as a whole"
// *Cause: Attempt to MOVE partitioned IOT as a whole
// *Action: don't do this. This is not supported
28661, 00000, "Object already has COMPRESS clause specified"
// *Cause: Attempt to specify compress for iot/index which already
//         has a compression clause.
// *Action: This is a 'create time only' attribute
28662, 00000, "IOT index and overflow segments must share the same LOGGING attribute"
// *Cause: Attempt to specify LOGGING for one segment and NOLOGGING for the other segment.
// *Action: don't do that
28663, 00000, "Logging/Nologging attribute can not be specified in the statement ALTER TABLE ADD OVERFLOW"
// *Cause: Attempt to specify LOGGING for a Alter Table Add Overflow.
// *Action: don't do that
28664, 00000, "a partitioned table may not be coalesced as a whole"
// *Cause:  User attempted to coalesce a partitioned IOT using
//          ALTER TABLE COALESCE statement, which is illegal
// *Action: Coalesce the table a partition at a time (using
//          ALTER TABLE MODIFY PARTITION COALESCE)
28665, 00000, "table and partition must have same compression attribute"
// *Cause:  User attempted to EXCHANGE a compression enabled
//          partition with a compression disabled table or vice versa
//          OR the # of columns compressed is different for table and partition
// *Action: Make sure the compression attributes match
//          If they don't, fix it using ALTER TABLE MOVE [PARTITION] COMPRESS
28666, 00000, "option not allowed for an index on UROWID column(s)"
// *Cause:  User attempted to build a REVERSE or COMPRESSED or GLOBAL
//          partitioned index on UROWID column(s)
// *Action: Build the index without these options
28667, 00000, "USING INDEX option not allowed for the primary key of an IOT"
// *Cause:  User attempted to define storage attributes for the primary key
//          index of an Index-Organized table with USING INDEX clause. All
//          the storage attribute defined for the (IOT)table applies to the
//          primary key index and a separate USING INDEX clause is not
//          required.
// *Action: Remove the USING INDEX clause and specify all attributes directly
//          for the table
28668, 00000, "cannot reference mapping table of an index-organized table"
// *Cause:  An attempt to directly access the mapping table of an
//          index-organized table
// *Action: Issue the statement against the parent index-organized table
//          containing the specified mapping table.
28669, 00000, "bitmap index can not be created on an IOT with no mapping table"
// *Cause:  User attempted to create a bitmap index on an index-organized
//          table without a mapping table.
// *Action: Enable bitmap indexes on the Index-organized table by creating a
//          mapping table using 'ALTER TABLE .. MOVE MAPPING TABLE'.
28670, 00000, "mapping table cannot be dropped due to an existing bitmap index"
// *Cause:  User attempted to drop the mapping table with NOMAPPING option
//          when the IOT has one or more bitmap indexed.
// *Action: Drop the bitmap index(es) before dropping the mapping table.
28671, 00000, "UPDATE BLOCK REFERENCES may not be used on a partitioned index as a whole"
// *Cause:  User attempted to UPDATE BLOCK REFERENCES on a partitioned index
//          using ALTER INDEX UPDATE BLOCK REFERENCES statement, which is
//          illegal.
// *Action: Issue a partition level operation with
//          ALTER INDEX .. PARTITION .. UPDATE BLOCK REFERENCES
28672, 00000, "UPDATE BLOCK REFERENCES may not be used on a global index"
// *Cause:  User attempted to UPDATE BLOCK REFERENCES on a global partitioned
//          or non-partitioned index. This feature is not supported for
//          non-partitioned or global partitioned index on a partitioned IOT
//          and a global partitioned index on a non-partitioned IOT.
// *Action: Use online index [partition] rebuild to fix the block references
28673, 00000, "Merge operation not allowed on an index-organized table"
// *Cause:  User attempted merge operation on an index-organized table. Merge
//          is not supported on a IOT .
// *Action: Use updates and inserts on index-organized table .
28674, 00000, "cannot reference transient index-organized table"
// *Cause:  An attempt was made to directly access a transient table created
//          created on behalf of a index-organized table partition maintenance
//          operation.
// *Action: Issue the statement against the associated permanent
//          index-organized table.
/
/ 28700-28799 RESERVED FOR CODE-BASED ACCESS CONTROL
/
28700, 00000, "Only roles can be attached to or detached from program units."
// *Cause:  An attempt was made to grant object privileges or system privileges
//          to program units.
// *Action: Grant the privileges to a role first, and then grant the role to
//          the program units.
/
28701, 00000, "Keyword PROCEDURE, FUNCTION, or PACKAGE is either missing or not correct."
// *Cause:  The keyword PROCEDURE, FUNCTION, or PACKAGE was either missing 
//          before the program unit, or it was not consistent with the type of 
//          the program unit.
// *Action: Include the correct keyword PROCEDURE, FUNCTION or PACKAGE right 
//          before each program unit according to its type. 
/
28702, 00000, "Program unit %s is not owned by the grantor."
// *Cause:  An attempt was made to attach roles to or detach roles from one or 
//          more program units by someone other than the owner or SYS. Only a 
//          program unit owner or SYS can attach roles to or detach roles from 
//          a program unit.
// *Action: Specify only the program units owned by the grantor in the command.
/
28703, 00000, "Only regular database roles can be attached to or detached from program units."
// *Cause:  An attempt was made to attach non-supported types of 
//          roles to or detach them from program units. Application roles, 
//          secure application roles, external roles, global roles, and 
//          light-weight roles cannot be attached to or detached from program 
//          units.
// *Action: Remove any application role, secure application role, external role,
//          global role, and light-weight role from the command.
/
28704, 00000, "Role %s is not directly granted to the owner of the program units."
// *Cause:  An attempt was made to attach roles that were not directly granted 
//          to the owner of the program units. The roles must be granted to the
//          owner directly in order to attach them to the owner's program units.
// *Action: Grant the role to the owner of the program unit first.
/
28705, 00000, "The grantor does not have privileges to grant the role %s to the program units."
// *Cause:  Privileges to grant a role to a program unit were insufficient.
//          The grantor must have the GRANT ANY ROLE privilege or the ADMIN
//          option or the DELEGATE option for the role to do the operation.
// *Action: Obtain the required privilege and retry.
/
28706, 00000, "duplicate program unit %s found in list"
// *Cause:  A duplicate program unit was found in the GRANTEE clause.
// *Action: Specify each program unit only once.
/
28707, 00000, "Reserved word ALL was used with roles in the REVOKE command to detach roles from program units."
// *Cause:  An attempt was made to use reserved word ALL jointly with roles 
//          in a REVOKE command to detach roles from program units.
// *Action: Do not specify roles in the privilege clause except for the 
//          reserved word ALL.
/
28708, 00000, "More than %s roles were attached to the program unit."
// *Cause:  Too many roles were currently attached to the program unit. 
// *Action: Detach some roles from the program unit. 
/
28709, 00000, "Roles with DELEGATE option can only be granted to users."
// *Cause:  One of the grantees was not a user when trying to grant roles with the DELEGATE option.
// *Action: Verify that the grantees are users and try the operation again.
/


28714, 00000, "OCI_BATCH_ERRORS or OCI_RETURN_ROW_COUNT_ARRAY mode can only be specified for INSERT, UPDATE, DELETE or MERGE statement."
// *Cause:  OCI_BATCH_ERRORS or OCI_RETURN_ROW_COUNT_ARRAY mode was specified
// in a statement which is not INSERT, UPDATE, DELETE or MERGE.
// *Action: Specify OCI_BATCH_ERRORS or OCI_RETURN_ROW_COUNT_ARRAY only for
// INSERT, UPDATE, DELETE or MERGE statements.

28715, 00000, "OCI_STMT_SCROLLABLE_READONLY can only be specified for SELECT statements."
// *Cause: OCI_STMT_SCROLLABLE_READONLY mode was specified for a non-SELECT statement.
// *Action: Specify OCI_SCROLLABLE_READONLY only for SELECT statements.


28716, 0000, "Invalid buffer or buffer size for OCIServerRelease2() \n"
//* Cause: A zero length or null buffer was specified for the OCIServerRelease2().
//* Action: Specify a valid buffer and length.
/
/ 
/ E R R O R S -- NOTE: diaerror.txt is for checkin comments for this file
/
/////////////////////////////////////////////////////////////////////////////
/ 48000 - 48099 are reserved for diagnosability framework errors
/////////////////////////////////////////////////////////////////////////////
/
48001, 00000, "internal error code, arguments: [%s], [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Document: YES
// *Cause:  This is the generic internal error number for program
//	    exceptions.	This indicated that a process encountered an
//	    exceptional condition.
// *Action: Report as a bug - the first argument is the internal error number.
// *Comment: The ORA facility mapping for this error is ORA-00600.
/
48002, 00000, "thread terminated by fatal error"
// *Document: YES
// *Cause:  The thread was in an unrecoverable state.
// *Action: Examine the thread trace file for more information.
// *Comment: The ORA facility mapping for this error is ORA-00603.
/
48003, 00000, "out of process memory when trying to allocate %s bytes (%s,%s)"
// *Document: YES
// *Cause:  Operating system process private memory was exhausted.
// *Action: 
// *Comment: The ORA facility mapping for this error is ORA-04030.
/
48004, 00000, "unable to allocate %s bytes of shared memory (\"%s\",\"%s\",\"%s\",\"%s\")"
// *Document: YES
// *Cause:  More shared memory is needed than was allocated in the shared
//          pool.
// *Action: Reduce your use of shared memory or increase the amount of
//          available shared memory.
// *Comment: The ORA facility mapping for this error is ORA-04031.
/
48005, 00000, "illegal argument for function"
// *Document: NO
// *Cause: An illegal argument was passed to dbgc_alloc.
// *Action: Report as a bug.
// *Comment: Ideally we should have signaled an internal error, however
//           the KGE facility is not initialized when dbgc_alloc is called
//           thus we could not raise an error.
/
48006, 00000, "user requested cancel of current operation"
// *Document: YES
// *Cause:
// *Action:
// *Comment: The ORA facility mapping for this error is ORA-01013.
/
48007, 00000, "name is already used by an existing product type"
// *Document: YES
// *Cause: An attempt was made to define a product type with the same name
//         as an already defined product type.
// *Action: Use the already existing product type with the specified name,
//          or use a different name for the product type.
/
48008, 00000, "id is already used by an existing product type"
// *Document: YES
// *Cause: An attempt was made to define a product type with the same id
//         as an already defined product type.
// *Action: Choose a different name for the product type.
/
/////////////////////////////////////////////////////////////////////////////
/ 48100 - 48179 are reserved for ADS portable layer
/////////////////////////////////////////////////////////////////////////////
48100, 00000, "error encountered when attempting to open a file"
// *Cause: There was an error encountered when attempting to open a file
//         with the ADR file interface.
// *Action: Check that the specified directory name, file name, and open
//          options are valid.
/
48101, 00000, "error encountered when attempting to read a file [%s] [%s] [%s]"
// *Cause: There was an error encountered when attempting to read a file
//         with the ADR file interface.
// *Action: Check the specified arguments to the read interface.
/
48102, 00000, "encountered the end-of-file when reading the file"
// *Cause: The ADR file interface encountered the end-of-file when
//         reading the file.
// *Action: Handle the end of file condition.
/
48103, 00000, "error encountered when attempting to write a file [%s] [%s] [%s]"
// *Cause: There was an error encountered when attempting to write a file
//         with the ADR file interface.
// *Action: Check the specified arguments to the write interface.
/
48104, 00000, "read mismatch on blocks requested and returned, [%s], [%s]"
// *Cause: There was a mismatch between the number of blocks requested
//         for reading and the number of blocks actually returned.
// *Action: Check the file to make sure there are no partial blocks.
/
48105, 00000, "write mismatch on blocks requested and returned, [%s], [%s]"
// *Cause: There was a mismatch between the number of blocks requested
//         for writing and the number of blocks actually written.
// *Action: Check that there is enough space left on the device to
//          write the requested number of blocks.
/
48106, 00000, "error initializing the ADR %s object"
// *Cause: There was an error encountered during the initialization of
//         one of the ADR file objects.
// *Action: Check the validity of the specified directory name and 
//          file name.
/
48107, 00000, "invalid Bfile input, [%s]"
// *Cause: An invalid Bfile was passed into the routine to convert the 
//         bfile into a file handle.
// *Action: Verify the contents of the specified Bfile.
/
48108, 00000, "invalid value given for the diagnostic_dest init.ora parameter"
// *Cause:  The value given for the diagnostic_dest directory is not a 
//          valid directory.  Either the directory does not exist or 
//          the process does not have read/write privileges on the directory.
// *Action: Use a value for diagnostic_dest that is a valid directory 
//          with the proper read and write privileges.
/
48109, 00000, "invalid lock mode for file descriptor, [%s]"
// *Cause: The lock mode associated with the file descriptor was invalid
//         in the context of the routine.
// *Action: Verify that a file is not trying to obtain multiple locks and
//          that the file is holding a lock when attempting to release 
//          the lock.
/
48110, 00000, "error encountered while attempting to get a file lock [%s] [%s]"
// *Cause: There was an error encountered while trying to get 
//         a file lock.
// *Action: Check the state of the file and operating system.
/
48111, 00000, "error encountered while attempting to release a file lock [%s]"
// *Cause: There was an error encountered while trying to release 
//         a file lock.
// *Action: Check the state of the file and operating system.
/
48112, 00000, "invalid flags for open file, %s"
// *Cause: Invalid flags were passed in to the open file routine.
// *Action: Check to see if the flags are a valid combination.
/
48113, 00000, "unable to write to stream file because of out of space condition"
// *Cause: The system is unable to write the requested number of bytes
//         to a stream file.  This is due to an out of space condition.  
//         The additional information shows how many bytes were not written.
// *Action: Check that there is enough space left on the device to
//          write the requested number of bytes.
/
48114, 00000, "error encountered when attempting to close a file"
// *Document: YES
// *Cause: There was an error encountered when attempting to close
//         a file with the ADR file interface.
// *Action: Check the validity of the file descriptor.
/
48115, 00000, "error encountered while seeking a file position"
// *Cause: There was an error encountered while seeking a position
//         in a file.
// *Action: Check that the requested file position falls within the
//          file boundaries.
/
48116, 00000, "error encountered when attempting to create a directory [%s]"
// *Cause: There was an error encountered when attempting to
//         create a directory.
// *Action: Check the directory name.
/
48117, 00000, "error encountered when attempting to remove a directory [%s]"
// *Cause: There was an error encountered when attempting to
//         remove a directory.
// *Action: Check the directory name.
/
48118, 00000, "error encountered with list directory [%s]"
// *Cause: There was an error with listing the elements of a directory.
// *Action: Check the state of the operating system.
/
48119, 00000, "error encountered when attempting to remove a file [%s] [%s]"
// *Cause: There was an error encountered when attempting to remove
//         a file with the ADR file interface.
// *Action: Check the directory name and file name.
/
48120, 00000, "error encountered when attempting to retrieve the file size [%s] [%s]"
// *Cause: There was an error encountered when attempting to retrieve
//         the file size with the ADR file interface.
// *Action: Check the directory name and file name.
/
48121, 00000, "error with opening the ADR stream file [%s] [%s]"
// *Cause: An error was encountered when attempting to open an 
//         ADR stream file.
// *Action: Check the rest of the error stack for details of the 
//          actual error that was encountered.
/
48122, 00000, "error with opening the ADR block file [%s] [%s]"
// *Cause: An error was encountered when attempting to open an 
//         ADR block file.
// *Action: Check the rest of the error stack for details of the 
//          actual error that was encountered.
/
48123, 00000, "error encountered when attempting to flush a file"
// *Cause: There was an error encountered when attempting to flush
//         a file with the ADR file interface.
// *Action: Check the state of the file.
/
48124, 00000, "device full encountered during write to a file"
// *Cause: The device full error was encountered during the write to a file.
// *Action: Check the amount of free space on the device.
/
48125, 00000, "illegal identifier length, argn:%s, len:%s, lim:%s"
// *Cause: An input identifier was passed in that has a length that is
//         greater than the max length.
// *Action: Make sure the input identifier has a length that is less
//          than the max length.
/
48126, 00000, "attempting to create a file that already exists"
// *Cause: The client attempted to create a file that already exists.
// *Action: Either remove the file or check if it is okay if the file
//          already exists.
/
48127, 00000, "attempting to open a file that does not exist"
// *Cause: An attempt was made to open a file that does not exist.
// *Action: Either create the file or check why the file does not exist.
/
48128, 00000, "opening of a symbolic link is disallowed"
// *Cause: An error was encountered when attempting to open a file that is 
//         a symbolic link.  Users are not allowed to open symbolic links.
// *Action: Check the specified file name.
/
48129, 00000, "invalid input for the full path specification"
// *Cause: Input was incorrectly specified for the full path specification,
//         or the default extension may have been incorrectly specified.
//         Or an empty string was passed in for the full path.
// *Action: Check that the full path string is non-NULL.
//          If you want to specify a relative path from ADR Home for the 
//          full path specification, then use '<ADR_HOME>' instead of the
//          actual path to ADR Home. For ADR Base, use '<ADR_BASE>'.
/
48130, 00000, "invalid lock parameters for get file lock [%s]"
// *Cause: Invalid lock parameters passed in for the get file lock routine.
//         The user must pass in file as the lock type. Or, there is a lock
//         mode mismatch.  Exclusive locks are not allowed in read-only mode, 
//         and shared locks are not allowed in write-only mode.
// *Action: Check that correct lock type is specified and that the correct 
//          lock mode is requested for the file given its open flags.
/
48131, 00000, "error encountered when attempting to tell the file position"
// *Cause: An error was encountered when attempting to tell the file
//         position using the ADR file interface.
// *Action: Check the directory and file name of the file along with the
//          open state.
/
48132, 00000, "requested file lock is busy, [%s] [%s]"
// *Cause: The requested file lock is busy because another process is 
//         holding the file lock.
// *Action: Try to get the file lock again at a later time.
/
48133, 00000, "file descriptor has already been opened [%s] [%s]"
// *Cause: The specified file descriptor has already been opened.
// *Action: Do not open a file that has previously been opened, or check
//          your code to make sure you are cleaning up a file descriptor
//          that is being reused correctly.
/
48134, 00000, "invalid file descriptor state for operation, %s, %s, %s"
// *Cause: The state of the file descriptor was invalid for the requested
//         operation.  An example is that a file was opened for read,
//         but a write operation to the file was requested.
// *Action: Check the state of the file descriptor and make sure it 
//          matches the operation.
/
48135, 00000, "uninitialized file descriptor"
// *Cause: The specified file descriptor is uninitialized.
// *Action: Make sure the file descriptor is initialized before passing
//          it into the routine.
/
48136, 00000, "directory already exists [%s]"
// *Cause: Operation failed because the specified directory already exists.
// *Action: Remove the directory or ignore this error.
/
48137, 00000, "uninitialized file handle"
// *Cause: The specified file handle is uninitialized.
// *Action: Make sure the file handle is initialized before passing
//          it into the routine.
/
48138, 00000, "invalid directory name input for client address"
// *Cause: An invalid directory name was specified as part of the 
//         address path specification.
// *Action: Check that the directory name is non-NULL and that the 
//          directory name length does not exceed the maximum length.
/
48139, 00000, "invalid input to ADR initialization routine"
// *Cause: There was an invalid input to the ADR initialization routine.
// *Action: Check the length of the ADR base, product ID, and instance 
//          ID input arguments.
/
48140, 00000, "the specified ADR Base directory does not exist [%s]"
// *Cause: The specified ADR Base Directory does not exist.
// *Action: Check that the specified ADR Base Directory is a valid path
//          name and that the directory exists.
/
48141, 00000, "error creating directory during ADR initialization [%s]"
// *Cause: Error encountered when creating a directory during the 
//         initialization of the ADR subsystem.
// *Action: Check the input arguments to the ADR initialization routine
//          and the state of the operating system.
/
48142, 00000, "invalid permissions input for change permissions"
// *Cause: Invalid permissions passed into change permissions routine.
// *Action: Check the value of the permissions input.
/
48143, 00000, "error changing permissions for a file"
// *Cause: Error encountered while changing the permissions for a file
// *Action: Check the specified directory and file and the state of 
//          the operating system.
/
48144, 00000, "error encountered while performing standard file I/O"
// *Cause: Error encountered while performing standard file I/O
// *Action: Check the validity of standard in, out, and error.
/
48145, 00000, "invalid seek location, [%s], [%s]"
// *Cause: Invalid seek location specified for routine.
// *Action: Check the validity of specified seek location.
/
48146, 00000, "missing read, write, or exec permission on directory during ADR initialization [%s] [%s]"
// *Cause: Error encountered when checking if the process has read, write,
//         and exec privileges on directories needed by the ADR subsystem.
//         This error occurs during the initialization of the ADR subsystem.
// *Action: Check the input arguments to the ADR initialization routine
//          and the state of the operating system.  Ensure that the user
//          has the proper permissions on the ADR directories.
/
48147, 00000, "invalid home location specification for ADR, [%s], [%s], [%s]"
// *Cause: Invalid read or write home location specification for ADR. 
// *Action: An invalid home was specified for the ADR Read or Write 
//          Home location.
/
48148, 00000, "error encountered when attempting to move a file"
// *Cause: There was an error encountered when attempting to move
//         a file with the ADR file interface.
// *Action: Check the directory name and file name.
/
48149, 00000, "error encountered when attempting to copy a file"
// *Cause: There was an error encountered when attempting to copy
//         a file with the ADR file interface.
// *Action: Check the directory name and file name.
/
48150, 00000, "error encountered with set current working directory"
// *Cause: There was an error with setting the current working directory.
// *Action: Check the path used, or the state of the operating system.
/
48151, 00000, "error getting operating system time for a file"
// *Cause: Error encountered while getting the operating system time for a 
//         file.
// *Action: Check the specified directory and file and the state of 
//          the operating system.
48152, 00000, "lock table is full"
// *Cause: Lock table is full - too many locks granted
// *Action: Try again later
/
48153, 00000, "error encountered when getting ADR base directory default"
// *Cause: There was an error encountered when attempting to get
//         the ADR base directory default value.
// *Action: Check your environment to see if the $ORACLE_BASE and 
//          $ORACLE_HOME environment variables are set.
/
48154, 00000, "reached end of file for alert log"
// *Cause: The end of file was reached for reading the Alert Log.  There
//         are no more messages to read in the Alert Log.
// *Action: Do not read from the Alert Log
/
48155, 00000, "error encountered when read alert log [%s]"
// *Cause: There was an error encountered when attempting to read
//         a message from the Alert Log.
// *Action: Check the error message and the contents of the alert message.
/
48156, 00000, "Alert log purge has occurred - retry operation"
// *Cause: The purge of the alert log has occurred.
// *Action: Retry the operation.
/
48157, 00000, "null input to ADR initialization"
// *Cause: There was an null input to the ADR initialization routine.
// *Action: Check the ADR base, product ID, and instance ID input arguments.
/
48158, 00000, "invalid input for ADR base directory"
// *Cause: An invalid input was passed in for the ADR base directory name.
//         The ADR base directory name is either NULL or too long of a string.
// *Action: Check the ADR base directory input argument.
/
48159, 00000, "invalid input for ADR product type"
// *Cause: An invalid input was passed in for the ADR product type.
//         The ADR product type is out of bounds.
// *Action: Check the ADR product type input argument.
/
48160, 00000, "invalid input for ADR product id"
// *Cause: An invalid input was passed in for the ADR product id.
//         The ADR product id is either NULL or too long of a string.
// *Action: Check the ADR product id input argument.
/
48161, 00000, "invalid input for ADR instance id"
// *Cause: An invalid input was passed in for the ADR instance id.
//         The ADR instance id is either NULL or too long of a string.
// *Action: Check the ADR instance id input argument.
/
48162, 00000, "string buffer too small to hold input, [%s], [%s], [%s]"
// *Cause: The string buffer is too small to copy an input string
//         into.
// *Action: Check the size of the string buffer and the input string.
//          Look in the argument for the location in the code where the
//          error occurs.
/
48163, 00000, "error concatenating directory onto path, [%s], [%s], [%s]"
// *Cause: Error encountered while concatenating a directory onto 
//         a path name.
// *Action: Check the error returned by the OS and the size of the input
//          and output buffers.
/
48164, 00000, "error concatenating file onto path, [%s], [%s], [%s]"
// *Cause: Error encountered while concatenating a directory onto 
//         a path name.
// *Action: Check the error returned by the OS and the size of the input
//          and output buffers.
/
48165, 00000, "user missing read, write, or exec permission on specified ADR Base directory [%s]"
// *Cause: The specified ADR Base Directory does not have the correct
//         permissions.
// *Action: Check the read, write, and exec permissions on the specified 
//          ADR Base Directory
/
48166, 00000, "error with opening ADR block file because file does not exist [%s] [%s]"
// *Cause: An error was encountered with opening an ADR block file 
//         because the file does not exist.
// *Action: Check the existence of the ADR Block File.
/
48167, 00000, "invalid argument for checking ADR initialization"
// *Cause: Invalid arguments were specified for the routine to check
//         ADR initialization.
// *Action: Check the inputs to the ADR initialization routine.
/
48168, 00000, "the ADR sub-system is not initialized"
// *Cause: The ADR subsystem has not been initialized.  The requested
//         operation cannot be performed.
// *Action: Check the usage of the call to the ADR services.  The ADR
//          sub-system must be initialized for the call to work.
/
48169, 00000, "incorrect arguments to ADR deferred initialization"
// *Cause: There are incorrect arguments to the ADR deferred initialization.
// *Action: Check the input arguments.  It could be possible that
//          the product is not set up for deferred initialization.
/
48170, 00000, "unable to lock file - already in use"
// *Cause:  the file is locked by another process, indicating that it is
//          currently in use by another process
// *Action: determine which process legitimately owns this file.
/
48171, 00000, "unable to get share lock - file not readable"
// *Cause:  share lock request was made on a file not open for read access.
// *Action: file must be open read-only or read-write to get a share lock.
/
48172, 00000, "unable to find a valid ADR base"
// *Cause:  Unable to find a valid ADR base.  We tried the ORACLE_BASE, 
//          ORACLE_HOME, home, and tmp directories, but none of the 
//          directories exist for read/write access.
// *Action: Check the validity of the ORACLE_BASE, ORACLE_HOME, home,
//          and tmp directories.
/
48173, 00000, "error checking directory existence during ADR initialization [%s]"
// *Cause: Error encountered when checking directory existence during the 
//         initialization of the ADR subsystem.  Either the diag or product
//         type directory does not exist underneath the ADR base.
// *Action: The directory in the error message must exist in order for
//          ADR initialization to succeed.  Make sure the directories exist.
/
48174, 00000, "error encountered with get current working directory"
// *Cause: There was an error with getting the current working directory.
// *Action: Check the state of the operating system or the size of the
//          path buffer.
/
48175, 00000, "the path name must not contain the string '..'."
// *Cause:  The specified path name contains '..'.
// *Action: Correct the path name and retry the operation.
/
48176, 00000, "error translating a path name into its full path name"
// *Cause:  An error was encountered when translating a path name into
//          its full path name.  
// *Action: Check the inputted path name to make sure it is a valid
//          relative path.
/
48177, 00000, "file name with full path information [%s] not allowed" 
// *Cause: Input was incorrectly specified for the file name.
//         The inputted file name is greater than the maximum length, or 
//         the file name has path information. In this case, the file name
//         should not have any path information. The path information should
//         be specified in a separate argument.
// *Action: Check that the string for the file name is not too long 
//          and does not have path information.
/
48178, 00000, "error encountered while reading an ADR block file during ADR initialization [%s]" 
// *Cause: An error was encountered while reading an ADR block file during
//         the initialization of the ADR subsystem.
// *Action: Check the state of the file system.
/
48179, 00000, "OS file synchronization failure"
// *Cause: OS command to synchronize the changes to a file with the operating
//         system failed.
// *Action: Check the state of the file system and the amount of free space
//          left on your device.
/
/////////////////////////////////////////////////////////////////////////////
/ 48180 - 48199 are reserved for ADS OSD layer
/////////////////////////////////////////////////////////////////////////////
48180, 00000, "OS open system call failure"
// *Cause:  OS open system call failed. The system failed to open or create
//          a file in the requested mode.
// *Action: Check the OS error code
/
48181, 00000, "OS write system call failure"
// *Cause:  OS write system call failed. The system failed to write to
//          a file.
// *Action: Check the OS error code
/
48182, 00000, "OS read system call failure"
// *Cause:  OS read system call failed. The system failed to read to
//          a file.
// *Action: Check the OS error code
/
48183, 00000, "OS close system call failure"
// *Cause:  OS close system call failed. The system failed to close
//          a file.
// *Action: Check the OS error code
/
48184, 00000, "OS seek system call failure"
// *Cause:  OS seek system call failed. The system failed to seek to
//          a position in a file.
// *Action: Check the OS error code
/
48185, 00000, "OS file size system call failure"
// *Cause:  OS file size call failed. The system failed to retrieve
//          the file size for a file.
// *Action: Check the OS error code
/
48186, 00000, "OS check file exists system call failure"
// *Cause:  OS check file exists system call failed. The system failed to 
//          perform the check file exists command for a file.
// *Action: Check the OS error code
/
48187, 00000, "specified directory does not exist"
// *Cause:  The specified directory does not exist.
// *Action: Check the directory name.
/
48188, 00000, "user missing read, write, or exec permission on specified directory"
// *Cause:  The user does not have valid permissions on the specified 
//          directory.  The user is missing either the read, write, or
//          execute permission.
// *Action: Check the permissions of the specified directory.
/
48189, 00000, "OS command to create directory failed"
// *Cause:  The OS command to create a directory failed.
// *Action: Check the error number associated with the create directory
//          failure.
/
48190, 00000, "OS unlink system call failure"
// *Cause: OS unlink system call failed. The system failed to perform
//         unlink on the specified file.
// *Action: Check the OS error code
/
48191, 00000, "user missing read or write permission on specified file"
// *Cause:  The user does not have valid permissions on the specified 
//          file.  The user is missing either the read or write permission.
// *Action: Check the permissions of the specified file.
/
48192, 00000, "OS command to move a file failed"
// *Cause:  The OS command to move a file failed.
// *Action: Check the error number associated with the move file.
/
48193, 00000, "OS command to open a directory failed"
// *Cause: The OS command to open a directory failed.
// *Action: Check the OS error associated with the open directory failure.
/
48194, 00000, "OS command to close a directory failed"
// *Cause: The OS command to close a directory failed.
// *Action: Check the OS error associated with the close directory failure.
/
48195, 00000, "OS command to remove a directory failed"
// *Cause: The OS command to remove a directory failed.
// *Action: Check the OS error associated with the remove directory failure.
/
48196, 00000, "OS command to release advisory lock failed"
// *Cause:  The OS command to release the advisory lock failed
// *Action: Check the OS error associated with the release advisory lock
//          failure.
/
48197, 00000, "OS command to get the file status failed"
// *Cause:  The OS command to get the file status failed.  This could be
//          because the file is not open or file descriptor is invalid.
// *Action: Check the OS error associated with the get file status failure.
/
48198, 00000, "OS command to change the file permissions failed"
// *Cause:  The OS command to change the file permissions failed.
// *Action: Check the OS error associated with the failure.
/
48199, 00000, "OS command to copy a file failed"
// *Cause:  The OS command to copy a file failed.
// *Action: Check the error number associated with the copy file.
/
/////////////////////////////////////////////////////////////////////////////
/ 48200 - 48299 are reserved for AMS layer
/////////////////////////////////////////////////////////////////////////////
48200, 00000, "Illegal Input Argument [%s]"
// *Document: YES
// *Cause:  An illegal argument was passed in.
// *Action: Fix the call.
48201, 00000, "Field Length Exceeds Maximum [%s] [%s] [%s]"
// *Document: YES
// *Cause:  An illegal field length was used.
// *Action: Fix the call.
48202, 00000, "Illegal Identifier [%s] [%s]"
// *Document: YES
// *Cause: Illegal identifier specified.
// *Action: Use a valid identifier.
48203, 00000, "Illegal Data Type [%s]"
// *Document: YES
// *Cause: Illegal data type specified.
// *Action: Use a valid data type.
48204, 00000, "Illegal Identifier Length [%s] [%s] [%s]"
// *Document: YES
// *Cause: The input identifier is too long.
// *Action: Specify a shorter identifier.
48205, 00000, "Record Length too Big [%s] [%s] [%s]"
// *Document: YES
// *Cause: The sum of the maximum lengths of all fields exceeds the maximum
//         record length that is supported.
// *Action: Remove or shorten some of the fields.
48206, 00000, "Illegal Number of Fields [%s] [%s] [%s]"
// *Document: YES
// *Cause: The number of fields specified exceeds the supported maximum.
// *Action: Remove some of the fields in the relation.
48207, 00000, "Illegal Field Name [%s]"
// *Document: YES
// *Cause: The field name is invalid.
// *Action: Specify a valid field name.
48208, 00000, "Duplicate Field Names [%s]"
// *Document: YES
// *Cause: The list of fields specified contains a duplicate field.
// *Action: Remove the duplicate field.
48209, 00000, "Relation Already Exists"
// *Document: YES
// *Cause: The relation already exists.
// *Action: Remove the relation.
48210, 00000, "Relation Not Found"
// *Document: YES
// *Cause: The relation was not found.
// *Action: Either specify a valid relation name or create one with that name.
48211, 00000, "Illegal Access Mode [%s] [%s]"
// *Document: YES
// *Cause: The supplied access mode is not recognized.
// *Action: Supply a valid mode.
48212, 00000, "Open Record Access Not Done"
// *Document: YES
// *Cause: The open record access call was not performed.
// *Action: The open record access call is required before attempting this
//          call.
48213, 00000, "Incorrect Access Mode for Operation [%s] [%s]"
// *Document: YES
// *Cause: The relation was opened in a mode not compatible with the
//         attempted operation being done.
// *Action: Reopen the relation in the correct mode.
48214, 00000, "Sequence Overflow [%s] [%s] [%s]"
// *Document: YES
// *Cause: The sequence number will exceed the system maximum.
// *Action: Reset the sequence number.
48215, 00000, "Sequence Invalid Operation [%s] [%s]"
// *Document: YES
// *Cause: The specified sequence operation is not valid.
// *Action: Specify a valid operation.
48216, 00000, "Field Len Exceeds Max Field Length [%s] [%s] [%s] [%s]"
// *Document: YES
// *Cause: The field length specified exceeds the defined maximum for the
//         field.
// *Action: Supply a smaller field length.
48217, 00000, "Out of Space on Device"
// *Document: YES
// *Cause: The storage subsystem is out of space.
// *Action: Add more space to the storage subsystem.
48218, 00000, "Duplicate Key Name [%s] [%s]"
// *Document: YES
// *Cause: The key name already exists.
// *Action: Specify a different key name.
48219, 00000, "Key Name Doesn't Match Any Existing Key"
// *Document: YES
// *Cause: The key name provided doesn't match an existing key.
// *Action: Specify a key name that exists.
48220, 00000, "Too Many Keys Defined [%s] [%s]"
// *Document: YES
// *Cause: A key is trying to be created that exceeds the maximum number
//         of keys supported.
// *Action: Drop another key.
48221, 00000, "Key Exceeds Maximum Allowed Length [%s] [%s] [%s]"
// *Document: YES
// *Cause: The sum of the lengths of the fields in the key exceeds the
//         maximum length supported.
// *Action: Remove one or more fields from the key.
48222, 00000, "Predicates/Order By Not Allowed"
// *Document: YES
// *Cause: A predicate or order by can not be added after fetch has started.
// *Action: Put the predicate or order by call before the first fetch.
48223, 00000, "Interrupt Requested - Fetch Aborted - Return Code [%s] [%s]"
// *Document: Yes
// *Cause: User interrupt has occurred.
// *Action: None
48224, 00000, "DDL has occurred since parse - reparse [%s] [%s] [%s]"
// *Document: YES
// *Cause: Another session has performed a DDL (i.e. add field, create key,
//         drop key) that prevents this session from being to continue.
// *Action: Call open record access again.
48225, 00000, "No More Space in Order By Buffer"
// *Document: YES
// *Cause: The order by buffer size is not sufficient for the number of rows.
// *Action: Increase the order by buffer size specified.
48226, 00000, "No Fetch in Progress"
// *Document: YES
// *Cause: An attempt to perform update or delete has occurred without a fetch.
// *Action: You must first perform a fetch.
48227, 00000, "Invalid Relation File - [%s] [%s] [%s] [%s]"
// *Document: YES
// *Cause: The AMS file is invalid or corrupt.
// *Action: Do a repair relation
48228, 00000, "Missing Define Call [%s]"
// *Document: YES
// *Cause: A call to define was not performed before doing a fetch.
// *Action: Call the define service before fetch.
48229, 00000, "Invalid Relation Handle Provided [%s] [%s]"
// *Document: YES
// *Cause: An invalid or corrupt relation handle was used.
// *Action: Possible memory corruption.
48230, 00000, "Expression arguments must match types"
// *Document: YES
// *Cause: Incorrect type semantics for fields in the predicate.
// *Action: Correct the predicate.
48231, 00000, "Predicate syntax error"
// *Document: YES
// *Cause: A syntax error exists in the predicate string.
// *Action: Correct the predicate.
48232, 00000, "Debug command syntax error [%s]"
// *Document: YES
// *Cause: An invalid debug command has been specified.
// *Action: Correct the debug command.
48233, 00000, "Invalid Field Handle [%s] [%s] [%s]"
// *Document: Yes
// *Cause: The field handle is invalid.
// *Action: Possible memory corruption.
48234, 00000, "Create Field of Field Name [%s] Failed"
// *Document: No
// *Cause: 
// *Action:
48235, 00000, "Operation [%s] on Relation [%s] Failed"
// *Document: No
// *Cause:
// *Action:
48236, 00000, "Operation [%s] on Relation [%s] Field [%s] Failed"
// *Document: No
// *Cause:
// *Action:
48237, 00000, "Operation [%s] on Relation [%s] Key [%s] Failed"
// *Document: No
// *Cause:
// *Action:
48238, 00000, "Invalid Surrogate Length Specified [%s] [%s]"
// *Document: Yes
// *Cause: An invalid length during create field was specified
// *Action: Specify a correct length
48239, 00000, "Invalid Predicate Handle Provided [%s] [%s]"
// *Document: YES
// *Cause: An invalid or corrupt relation handle was used.
// *Action: Possible memory corruption.
48240, 00000, "Field is NOT NULL but NULL value supplied"
// *Document: YES
// *Cause: A field [%s] declared to not allow nulls contains a null value.
// *Action: Specify a correct value
48241, 00000, "File is at wrong version [file = %s] [current = %s]"
// *Document: NO
// *Cause: The file version doesn't match the current version.
// *Action: Drop and recreate the relation
48242, 00000, "Fields that are NOT NULL can not use surrogates"
// *Document: YES
// *Cause: NOT NULL fields can not have surrogates specified.
// *Action: Either remove the constraint or the surrogate.
48243, 00000, "Additional Fields must be declared nulls allowed"
// *Document: YES
// *Cause: A field can not be added to a relation that is defined NOT NULL
// *Action: Do not specify NOT NULL
48244, 00000, "Purge for Retention can't be called while in an Query"
// *Document: YES
// *Cause: A query is already running - purge for retention can't be invoked
// *Action: Fix call sequence
48245, 00000, "Attempt to Update/Delete when at EOF"
// *Document: Yes
// *Cause: The fetch operation is positioned at EOF - can not update/delete
// *Action: Do not call update/delete after fetch has returned EOF
48246, 00000, "Illegal Operation on External Relation"
// *Document: Yes
// *Cause: An illegal call was made using an external relation
// *Action: Do not perform the API Call
48247, 00000, "Predicate Conversion Error %s"
// *Document: YES
// *Cause: A time conversion failed
// *Action: Fix the input
48248, 00000, "Function %s type check error; ityp = %s typ = %s arg = %s"
// *Document: YES
// *Cause: Invalid inputs to the specified function
// *Action: Change the inputs
48249, 00000, "Type mismatch - lhs = %s, rhs = %s, result = %s, op = %s"
// *Document: NO
// *Cause: More documentation on type mismatch
// *Action: Adjust predicate inputs
48250, 00000, "Details: %s"
// *Document: NO
// *Cause: Syntax error
// *Action: Fix the syntax error
48251, 00000, "Failed to open relation due to following error"
// *Document: YES
// *Cause: See error below in the error stack
// *Action: See error below in the error stack
48252, 00000, "Relation does not require migration"
// *Document: YES
// *Cause: Relation on disk is compatible with the current code
// *Action: Don't run the migration services
48253, 00000, "Relation Being Migrated - Can't be opened"
// *Document: NO
// *Cause: Migration in progress
// *Action: Wait till migration finishes
48254, 00000, "Migration Error [%s] [%s] [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause: Migration Failure - Internal error
// *Action: Migration Failure - Internal error
48255, 00000, "Changes not supported on relations opened read-only"
// *Document: NO
// *Cause: Relation was opened as a not-on-disk relation
// *Action: Can't make changes to this relation
48256, 00000, "Having by not allowed"
// *Document: NO
// *Cause: No group by specified
// *Action: Add a group by clause before adding a having by
48257, 00000, "Grouping function (%s) used - but no group by specified"
// *Document: NO
// *Cause: Group functions require group by clause
// *Action: Add a group by clause
48258, 00000, "AMS Corrupt Page Found - Rebuild Relation"
// *Document: YES
// *Cause: A corrupted page has been found.
// *Action: Do a rebuild of the relation
48259, 00000, "AMS Relation not Created Correctly"
// *Document: YES
// *Cause: Create relation failed
// *Action: Recreate the relation
48260, 00000, "Function %s not found"
// *Document: YES
// *Cause: A reference to a function that is not valid was found
// *Action: Fix the function name
48261, 00000, "Grouping Function %s not allowed in a having clause"
// *Document: NO
// *Cause: A grouping function was used in a having clause incorrectly
// *Action: Fix the having clause
48262, 00000, "Sequence references not allowed in predicates"
// *Document: YES
// *Cause: References to currval or nextval not allowed
// *Action: Remove these references
48263, 00000, "Currval not set yet - use nextval"
// *Document: YES
// *Cause: References to currval can't occur until a nextval is done
// *Action: Remove the reference
48264, 00000, "Internal Application Function Failure"
// *Document: NO
// *Cause:
// *Action:
48265, 00000, "Incorrect number of arguments (%s) provided - expected (%s)"
// *Document: YES
// *Cause: Number of arguments to function is incorrect
// *Action: Specify the correct number of arguments
48290, 00000, "Xaction Control General Fault"
// *Document: NO
// *Cause: See error in the error stack
// *Action:
48291, 00000, "Field name %s can't be unique resolved"
// *Cause: Field name appears in more than one relation
// *Action: Prefix the field name with the relation name

48292, 00000, "Can't use outer join syntax mixed with inner join syntax"
// *Cause: The join condition was specified using both inner and outer join elements"
// *Action: Specify the join condition correctly
48293, 00000, "Outer join syntax not allowed without a join"
// *Cause: Using outer join syntax in the predicate without doing a join
// *Action: Fix the predicate

/////////////////////////////////////////////////////////////////////////////
/ 48300 - 48389 are reserved for AMI layer
/////////////////////////////////////////////////////////////////////////////
48300, 00000, "Incident Record Already Exists"
// *Document: YES
// *Cause: trying to create an incident that already exists
// *Action: retry operation with new incident ID

48301, 00000, "An Invalid Incident ID was specified"
// *Document: YES
// *Cause: the specified incident ID was invalid
// *Action: retry operation with correct incident ID

48302, 00000, "Incident Directory does not exist"
// *Document: YES
// *Cause: the incident directory was not found
// *Action: retry operation with a different incident ID

48303, 00000, "Exceeded max Incident Sequence Value"
// *Document: YES
// *Cause: the maximum supported incident sequence value was exceeded
// *Action: reset incident sequence and retry operation

48304, 00000, "incident staging file not found"
// *Document: YES
// *Cause: the incident staging file is missing
// *Action: retry with a different incident ID

48305, 00000, "incident ID range is too large"
// *Document: YES
// *Cause: the maximum incident sequence value was exceeded
// *Action: retry operation with a smaller range

48308, 00000, "Illegal input parameter: [prm = %s] [pos = %s]"
// *Document:  NO
// *Cause: the input parameter is wrong
// *Action: retry operation with correct parameter

48309, 00000, "illegal incident state transition, [%s] to [%s]"
// *Document: YES
// *Cause: the incident cannot be moved to the new state
// *Action: retry operation with a valid incident status

48310, 00000, "Incident %s staging file not found"
// *Document: YES
// *Cause: the incident staging file does not exist
// *Action: retry operation with a valid incident ID

48311, 00000, "Invalid field name [%s]"
// *Document: YES
// *Cause: the specified field name is invalid
// *Action: retry operation with a valid field name

48312, 00000, "Sweep incident %s staging file failed"
// *Document: YES
// *Cause: the sweep action of incident staging file failed
// *Action: check the incident ID and retry

48313, 00000, "Updates not allowed on ADR relation [%s] of Version=%s"
// *Document: YES
// *Cause: Update operations not supported on this version of ADR relation
// *Action: check ADR version and retry
48314, 00000, "Invalid ADR Control parameter [%s]"
// *Document: YES
// *Cause: the specified control parameter is invalid
// *Action: check parameter and reissue command

48315, 00000, "ADR unavailable"
// *Document: YES
// *Cause: the ADR directory is not available
// *Action: enable ADR and retry operation

48316, 00000, "relation [%s] unavailable or cannot be created"
// *Document: YES
// *Cause: the ADR relation is not available
// *Action: check ADR directory and retry operation

48317, 00000, "ADR Relation [%s] of version=%s is obsolete"
// *Document: YES
// *Cause: the version of ADR relation is too old and not supported
// *Action: check the ADR version and retry

48318, 00000, "ADR Relation [%s] of version=%s cannot be supported"
// *Document: YES
// *Cause: the version of ADR relation is too new and cannot be supported
// *Action: need to use a newer release to access the ADR

48319, 00000, "Update operation on ADR relation [%s] not allowed"
// *Document: YES
// *Cause: updates to foreign ADR relation cannot be supported
// *Action: verify ADR location and reissue command

48320, 00000, "Too many incidents to report"
// *Document: YES
// *Cause: the result set of incidents is too large to handle
// *Action: use a predicate to reduce the number of incidents and retry

48321, 00000, "ADR Relation [%s] not found"
// *Document: YES
// *Cause: the required ADR relation is missing, ADR may be corrupted
// *Action: check ADR directory and retry

48322, 00000, "Relation [%s] of ADR V[%s] incompatible with V[%s] tool"
// *Document: YES
// *Cause: the tool version is incompatible with the ADR version
// *Action: use another version of tool and retry

48323, 00000, "Specified pathname [%s] must be inside current ADR home"
// *Document: YES
// *Cause: A file outside of ADR home was not allowed for this type of file.
// *Action: Check the file name and retry.

48324, 00000, "Incompatible staging file encountered"
// *Document: YES
// *Cause: sweep incident failed because staging file is incompatible
// *Action: check the incident ID and version of ADR and retry

48325, 00000, "Staging File Validation Error [%s] line [%s]"
// *Document: NO
// *Cause: staging file is not compliant with the xsd
// *Action: none
48326, 00000, "Illegal Staging File Type %s"
// *Document: NO
// *Cause: staging file type is invalid
// *Action: none
48327, 00000, "Illegal Staging Status Type %s"
// *Document: NO
// *Cause: staging status type is invalid
// *Action: none
48328, 00000, "View already exists - use replace option"
// *Document: NO
// *Cause: View already exists
// *Action: Use Create or Replace
48329, 00000, "Create View Fails with the following errors"
// *Document: NO
// *Cause: See errors below
// *Action: See errors below
48330, 00000, "Expected Clause (%s) not found"
// *Document: NO
// *Cause: Expected syntax element not found
// *Action: Adjust statement
48331, 00000, "Views only allowed %s relations to be specified"
// *Document: NO
// *Cause: Too many relations specified
// *Action: Specify fewer relations
48332, 00000, "invalid relation-field name [%s] in select list"
// *Document: NO
// *Cause: the length of the field name is too long
// *Action: verify field name and reissue command
48333, 00000, "select field name [%s] not found"
// *Document: NO
// *Cause: the name specified in the select list does not exist
// *Action: verify field name and reissue command
48334, 00000, "ambiguous select field name [%s] found"
// *Document: NO
// *Cause: more than one possible target field found for select list
// *Action: verify field name and reissue command
48335, 00000, "illegal function reference to more than one field [%s], relation [%s]"
// *Document: NO
// *Cause: references to more than one row source and field detected
// *Action: verify field name for function and reissue command
48336, 00000, "missing Alias name for function column [%s]"
// *Document: NO
// *Cause: function column must be accompanied by an alias name
// *Action: verify field name and reissue command
48338, 00000, "Invalid function argument"
// *Document: NO
// *Cause: an invalid argument was specified for a function
// *Action: Fix the input arguments
48339, 00000, "view [%s] does not exist"
// *Document: YES
// *Cause: view has not been created
// *Action: verify view name and reissue command
48340, 00000, "operation not supported on view [%s]"
// *Document: YES
// *Cause: unsupported (dml) operation on views
// *Action: verify relation name and reissue command
48341, 00000, "Field [%s] not a grouping field"
// *Document: YES
// *Cause: the field name specified is not a grouping field
// *Action: verify field names and groupby clause and reissue command
48342, 00000, "Field [%s] cannot be mixed with %s fields"
// *Document: YES
// *Cause: the specified field is incompatible with other grouping fields
// *Action: verify this and other field names and reissue command
48343, 00000, "invalid field [%s] reference in %s clause"
// *Document: YES
// *Cause: the specified field in the specified clause is invalid
// *Action: verify this field name and reissue command
48344, 00000, "Invalid Name [%s] specified"
// *Document: YES
// *Cause: Either the name refers to an existing object or violates the
//         reserved namespace rules.
// *Action: Pick another name
48345, 00000, "Timeout encountered during operation"
// *Document: YES
// *Cause: The attempted operation conflicted with another operation 
//         that was already being executed.
// *Action: Retry operation at a later time.
/////////////////////////////////////////////////////////////////////////////
/ 48390 - 48389 are reserved for ADM layer
/////////////////////////////////////////////////////////////////////////////
48390, 00000, "Too many fields"
// *Document: NO
// *Cause: Too many fields being added
// *Action: Use less fields
48391, 00000, "Field %s not found in object"
// *Document: NO
// *Cause: Field is not part of the relation
// *Action: Use the proper field name
48392, 00000, "Field (%s) conversion error - type %s value %s"
// *Document: NO
// *Cause: Invalid input for the type of field
// *Action: Fix the inputted value
48393, 00000, "Field (%s) exceeds maximum length of %s"
// *Document: NO
// *Cause: Invalid input for the type of field
// *Action: Fix the inputted value
48394, 00000, "Field (%s) is declared as NOT NULL"
// *Document: NO
// *Cause: Field contains a null value
// *Action: Fix the inputted value
48395, 00000, "Incident Range Function Only Available on Dual"
// *Document: NO
// *Cause: Must use dual with this function
// *Action: Use dual
48396, 00000, "Invalid range supplied - valid range is [%s.%s]"
// *Document: NO
// *Cause: Invalid range
// *Action: Fix input
48397, 00000, "Range must be a numeric constant"
// *Document: NO
// *Cause: Invalid range - must be a literal, not a field reference
// *Action: Use a literal

/////////////////////////////////////////////////////////////////////////////
/ 48400 - 48499 are reserved for ADV layer
/////////////////////////////////////////////////////////////////////////////
48400, 00000, "ADRCI initialization failed"
// *Document: YES
// *Cause:  The ADR Base directory does not exist
// *Action: Either create an ADR Base directory or point to an existing one
// *Comment:

48401, 00000, "SET command requires arguments"
// *Document: YES
// *Cause: No arguments are input for the SET command
// *Action: Input the arguments

48402, 00000, "Variable is not defined"
// *Document: YES
// *Cause: No substitution value is input. 
// *Action: Input the substitution value following after the variable name.

48403, 00000, "DEFINE or UNDEFINE command has no arguments"
// *Document: YES
// *Cause:DEFINE and UNDEFINE command need users to input the substitution
//        variable name.
// *Action: Input the variable name after the keyword DEFINE or UNDEFINE

48404, 00000, "RUN or @ command has no arguments"
// *Document: YES
// *Cause: RUN and @ commands need users to input script filename
// *Action: Input script filename after RUN and @ commands

48405, 00000, "The option in the command is invalid"
// *Document: YES
// *Cause: The option is not allowed in the command
// *Action: Check the command syntax

48406, 00000, "ECHO or TERMOUT status must be set to ON or OFF"
// *Document: YES
// *Cause: the status of ECHO and TERMOUT commands must be ON or OFF
// *Action: input ON or OFF

48407, 00000, "DESCRIBE and QUERY commands need at least relation name argument"
// *Document: YES
// *Cause: This is no relation name is input as argument
// *Action: Need users to input at least the relation name

48408, 00000, "The incident number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input incident number exceeds the maximum number
// *Action: Input fewer incidents

48409, 00000, "The ADR homes exceed the maximum number [%s]"
// *Document: YES
// *Cause: The input ADR homes number exceeds the maximum number
// *Action: Input shorter ADR home string

48410, 00000, "The trace path exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input trace path exceeds the maximum number
// *Action: Input less trace path

48411, 00000, "The trace files exceed the maximum number [%s]"
// *Document: YES
// *Cause: The input trace file path number exceeds the maximum number
// *Action: Input less trace file path

48412, 00000, "The parameters exceed the maximum number [%s]"
// *Document: YES
// *Cause: The input parameter number exceeds the maximum number
// *Action: Input fewer parameters

48413, 00000, "The number of orderby fields exceeds maximum number [%s]"
// *Document: YES
// *Cause: The orderby field number exceeds the maximum number
// *Action: Input fewer fields

48414, 00000, "The string in the execution option exceeds maximum length [%s]"
// *Document: YES
// *Cause: The string length is too long
// *Action: Divide the commands into two sets or use adrci scripts.

48415, 00000, "Syntax error found in string [%s] at column [%s]"
// *Document: YES
// *Cause: Parsing error found in the user input string
// *Action: Validate the input string

48416, 00000, "Variable value [%s] must be single or double quoted"
// *Document: NO
// *Cause:The variable value must be single or double quoted
// *Action:Check the variable name and single or double quoted the value

48417, 00000, "SHOW command needs arguments"
// *Document: NO
// *Cause: No arguments are input for SHOW command
// *Action: Input show command arguments

48418, 00000, "The variable [%s] is not defined"
// *Document: NO
// *Cause: The substitution variable is not defined
// *Action: Define the variable before attempting to use it

48419, 00000, "Illegal arguments"
// *Document: YES
// *Cause: The input argument is illegal
// *Action: Check the input arguments and make sure it is not null

48420, 00000, "EXPORT command must have a relation name"
// *Document: NO
// *Cause: The relation name is not input as an arguments
// *Action: Input the relation name

48421, 00000, "Predicate string in the command must be single or double quoted"
// *Document: YES
// *Cause:The predicate string is not single or double quoted
// *Action:Put single or double quotes around the predicate string

48422, 00000, "Invalid relation field type [%s]"
// *Document: YES
// *Cause:
// *Action:

48423, 00000, "IMPORT command must have a filename"
// *Document: YES
// *Cause: File name is missing from the command
// *Action: Input the import file name after the IMPORT keyword

48424, 00000, "SHOW TRACE command needs argument"
// *Document: YES
// *Cause:SHOW TRACE command needs arguments
// *Action:Input arguments

48425, 00000, "ADRCI environment is not initialized"
// *Document: NO
// *Cause:
// *Action:

48426, 00000, "The initialization filename is too long"
// *Document: YES
// *Cause:The initialization filename length exceeds the maximum length
// *Action:This is really an internal setting parameter of the ADRCI, report
//         it as a bug. Alternatively move the initialization file to the
//         current working directory

48427, 00000, "Unknown command"
// *Document: YES
// *Cause:
// *Action:

48428, 00000, "Input command string exceeds max length [%s]"
// *Document: YES
// *Cause: The current command string is too long and exceeds the limit
// *Action: Input less characters

48429, 00000, "Variable name [%s] is an invalid identifier"
// *Document: YES
// *Cause: The substitution variable name is not a valid identifier
// *Action: Input the valid identifier defined by ADRCI

48430, 00000, "Cannot read the parameter"
// *Document: YES
// *Cause:
// *Action:

48431, 00000, "Must specify at least one ADR home path"
// *Document: YES
// *Cause: The command syntax requires at least one ADR home path to be input
// *Action: Check the command syntax and input the home path

48432, 00000, "The ADR home path [%s] is not valid"
// *Document: YES
// *Cause: The adr home user inputs is not valid, which may due to the path
//         does not exist.
// *Action: Check if the input home path exists

48433, 00000, "Unknown help topic"
// *Document: YES
// *Cause: The input topic is unknown
// *Action: Check if the topic is valid

48434, 00000, "No DDE commands are input"
// *Document: YES
// *Cause: No DDE commands are input
// *Action: Input a DDE command

48435, 00000, "Input a trace file"
// *Document: YES
// *Cause: Show trace expects a trace file
// *Action: Input a trace file

48436, 00000, "File [%s] does not exist"
// *Document: YES
// *Cause: the file does not exist
// *Action: Validate the trace file name

48437, 00000, "No IPS commands are input"
// *Document: YES
// *Cause: No IPS commands are input
// *Action: Input a IPS command

48438, 00000, "[%s] is not a valid number"
// *Document: YES
// *Cause: The input number is not valid
// *Action: Check the input number

48439, 00000, "The input path name exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The input path name is too long
// *Action: Report as a bug to change the limit

48440, 00000, "Variable [%s] is already defined"
// *Document: YES
// *Cause: The variable name is defined previously
// *Action: Use another variable name

48441, 00000, "The function parameter number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The function parameter number exceeds the maximum number
// *Action: Report it as bug to change the maximum number

48442, 00000, "The number of control parameters exceeds the maximum allowed [%s]."
// *Document: YES
// *Cause: The control parameters exceeded the maximum number allowed.
// *Action: Check the parameters. If the parameters are correct, contact Oracle
//          Support Services.

48443, 00000, "Trace Record type appears in the middle of the path"
// *Document: YES
// *Cause: The trace record cannot be in the middle of the path
// *Action: Validate the input

48444, 00000, "The single \".\" and \"*\" cannot appear in the middle of the path"
// *Document: YES
// *Cause: The single "." and "*" appears in the middle of the path
// *Action: Validate the input

48445, 00000, "Path expression only supports one bucket dump type"
// *Document: YES
// *Cause: The path expression only supports one bucket dump"
// *Action: Change the path expression syntax

48446, 00000, "The command needs path input"
// *Document: YES
// *Cause: No path is input as a parameter
// *Action: Input the path

48447, 00000, "The input path [%s] does not contain any ADR homes"
// *Document: YES
// *Cause: The input path does not contain ADR homes
// *Action: Validate the path

48448, 00000, "This command does not support multiple ADR homes"
// *Document: YES
// *Cause: There are multiple homes in the current adr setting.
// *Action: Use command SET HOMEPATH to set a single home

48449, 00000, "Tail alert can only apply to single ADR home"
// *Document: YES
// *Cause: There are multiple homes in the current setting
// *Action: Use command SET HOMEPATH to set a single home

/
/ Help messages
/
48450, 1, "Syntax:\n"
48451, 2, "   adrci [-help] [-script script_filename]\n\n"
48452, 1, "Options      Description                     (Default)\n"
48453, 1, "-----------------------------------------------------------------\n"
48454, 1, "script       script file name                (None)           \n"
48455, 1, "help         help on the command options     (None)           \n"
48456, 1, "-----------------------------------------------------------------\n"

48457, 00000, "ADRCI core dumped"
// *Document: YES
// *Cause: It is adrci internal error. 
// *Action: Report to Oracle

48458, 00000, "\"show incident\" failed due to the following errors"
// *Document: YES
// *Cause: There could be a bug or users do not have the access permission 
// *Action: Report to Oracle if the errors are not due to ADR permission settings

48459, 00000, "\"describe\" command only supports one ADR home path"
// *Document: YES
// *Cause: Multiple ADR home paths in the command
// *Action: put one ADR home path

48460, 00000, "The home path [%s] is not valid"
// *Document: YES
// *Cause: The input home path is not valid home path 
// *Action: Verify the homepath

48461, 00000, "\"describe\" failed due to the following errors"
// *Document: YES
// *Cause: Underlying code failed 
// *Action: If it is not due to permission issue, report to Oracle

48462, 00000, "Fatal error encountered in [%s]"
// *Document: YES
// *Cause: Fatal error encountered
// *Action: Report to Oracle

48463, 00000, "The value buffer reached the maximum length [%s]"
// *Document: YES
// *Cause: The value buffer is full
// *Action: Report to Oracle

48464, 00000, "The predicate buffer reached the maximum length [%s]"
// *Document: YES
// *Cause: The predicate buffer is too small
// *Action: Report to Oracle

48465, 00000, "The specified type [%s] is undefined"
// *Document: YES
// *Cause: The purge type specified is undefined
// *Action: Check the type name

48466, 00000, "Internal failure, the report context is not initialized"
// *Document: YES
// *Cause: Internal problem failure.
// *Action: Report to Oracle

48467, 00000, "\"%s\" for the keyword \"%s\" is not a valid number"
// *Document: YES
// *Cause: The keyword value is not a valid number
// *Action: Check the value

48468, 00000, "\"%s\" is not a valid keyword"
// *Document: YES
// *Cause: The keyword is not defined for the command
// *Action: Check the available keywords

48469, 00000, "Keyword \"%s\" cannot be duplicated"
// *Document: YES
// *Cause: The command can only allow one key with the name
// *Action: Remove one keyword name from the command

48470, 00000, "Unknown \"%s\" command"
// *Document: YES
// *Cause: The command is not valid
// *Action: Use help manual to check the command syntax

48471, 00000, "\"%s\" is not a valid shell command"
// *Document: NO
// *Cause: The shell command is not valid
// *Action: Check the command

48472, 00000, "Invalid product name"
// *Document: YES
// *Cause: The product name provided does not exist
// *Action: Specify a product name, see HELP SHOW BASE

48473, 00000, "Internal failure, unknown return code [%s]"
// *Document: YES
// *Cause: Internal program failure
// *Action: Report to Oracle

48474, 00000, "Syntax error specifying product, must not be NULL"
// *Document: YES
// *Cause: The product clause is being used, but no product name is provided
// *Action: Supply the product name

48475, 00000, "[%s] is not a valid timestamp"
// *Document: YES
// *Cause: The input timestamp string is not in valid format
// *Action: None

48476, 00000, "Cannot write the results out to a file, please check if \nthe environment variable TMPDIR is set or the current directory is \nnot writable"
// *Document: YES
// *Cause: The current path may not be writable
// *Action: If the current path is writable, report to Oracle

48477, 00000, "The input path does not contain any valid ADR homes"
// *Document: YES
// *Cause: The input path does not contain any valid ADR homes
// *Action: Check the path if it is valid

48478, 00000, "No alert messages are created"
// *Document: YES
// *Cause: No alert messages are created
// *Action: No action

48479, 00000, "No HM runs are created"
// *Document: YES
// *Cause: There is no hm runs
// *Action: No action

48480, 00000, "No incidents are created"
// *Document: YES
// *Cause: There is no incident
// *Action: No action

48481, 00000, "Report is not available"
// *Document: YES
// *Cause: The requested report does not exist"
// *Action: Check the report ID

48482, 00000, "Report is not generated"
// *Document: YES
// *Cause: The requested report is not ready to be generated
// *Action: Check the report ID

48483, 00000, "Spooling failed, it may be because the spool file cannot be created due to a permission issue"
// *Document: YES
// *Cause: The spooling filename may not be valid or the file cannot be created
// *Action: Check the permissions of the target directory and verify the filename

48484, 00000, "Run script failed, it may be because the script file does not exist"
// *Document: YES
// *Cause: The script file may not exist
// *Action: Check if the script file exist

48485, 00000, "The file exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The filename is too long
// *Action: Report to Oracle

48486, 00000, "The file [%s] exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The filename is too long
// *Action: Report to Oracle

48487, 00000, "The internal predicate string exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The predicate string exceeds the maximum length
// *Action: Report to Oracle

48488, 00000, "The predicate string exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The input predicate string exceeds the maximum length
// *Action: Report to Oracle

48489, 00000, "The input exceeds the maximum length [%s]"
// *Document: YES
// *Cause: The input exceeds the maximum length
// *Action: Report to Oracle

48490, 00000, "The field number exceeds the maximum number [%s]"
// *Document: YES
// *Cause: The input field number exceeds the maximum number
// *Action: Input less field names

48491, 00000, "The program name is too long, exceeds the maximum length [%s]"
// *Document: YES
// *Cause: the program name length exceeds the maximum length setting
// *Action: Report to Oracle

48492, 00000, "The report component name is not defined"
// *Document: YES
// *Cause: the report component name does not exist
// *Action: Check the component name to ensure it is registered

48493, 00000, "Sweep command needs parameters"
// *Document: YES
// *Cause: sweep command needs parameter
// *Action: Check the syntax of the command
/
48494, 00000, "ADR home is not set, the corresponding operation cannot be done"
// *Document: YES
// *Cause: The adr home is not set in the current adrci session
// *Action: Set the adr home using the adrci command "set base" and "set homepath"

48495, 00000, "Interrupt requested"
// *Document: YES
// *Cause: User requested to interrupt the current action
// *Action: No action is needed

48496, 00000, "\"%s\" is a mandatory keyword for the command"
// *Document: YES
// *Cause: The keyword is not specified for the command
// *Action: Input the keyword

48497, 00000, "\"%s\" is an invalid product type"
// *Document: YES
// *Cause: The product type is not registered
// *Action: Check the product type

48499, 00000, "The value of the keyword \"%s\" exceeds the maximum length %s"
// *Document: YES
// *Cause: The keyword value is too long
// *Action: Check the limit and input again

/////////////////////////////////////////////////////////////////////////////
/ 48500- 48599 are reserved for AME layer
/////////////////////////////////////////////////////////////////////////////
48500, 00000, "File Write Error [%s] [%s]"
// *Document: YES
// *Cause: Number of bytes written differs from number requested. Possibly
//         due to out of disk space.
// *Action: Ensure sufficient disk space.
48501, 00000, "File Read Error [%s] [%s]"
// *Document: YES
// *Cause: Number of bytes read differs from number requested. Possibly due
//         due to corrupted file.
// *Action: Recreate the file.
48502, 00000, "Invalid Command Line - Missing Required Elements"
// *Document: YES
// *Cause: Missing required command line arguments.
// *Action: Review the help message and supply the required arguments.
48503, 00000, "Invalid Parameter Specified"
// *Document: YES
// *Cause: Invalid input parameter supplied.
// *Action: Review the help message and correct the invalid input parameter.
48504, 00000, "Relation Parameter Must be Specified"
// *Document: YES
// *Cause: Relation parameter must be specified during ADR export.
// *Action: Supply the relation parameter.
48505, 00000, "File Parameter Must be Specified"
// *Document: YES
// *Cause: File parameter must be specified during ADR import.
// *Action: Supply the file parameter.
48506, 00000, "Existing Relation at different version than export [%s] [%s]"
// *Document: YES
// *Cause: Attempting to import into an existing relation and the schema
//         version of that relation differs from the schema of the relation
//         that was exported.
// *Action: Drop the existing relation if you still wish to import the
//          relation.
48507, 00000, "Predicate Not Allowed during Import"
// *Document: YES
// *Cause: The predicate option is not allowed during ADR import.
// *Action: Remove the predicate argument.
48508, 00000, "Export File Version [%s] Can Not be Used by Import [%s]"
// *Document: YES
// *Cause: The version of the export file is not able to be read by this
//         version of ADR import.
// *Action: Rerun the export using the current version of ADR export.
48509, 00000, "Error occurred during operation. See the following errors"
// *Document: YES
// *Cause: An underlying error has occurred.
// *Action: Review and correct the underlying error.
48510, 00000, "Can not export an in memory relation"
// *Document: YES
// *Cause: In memory relations can not be exported.
// *Action: Pick a different relation.
48511, 00000, "Repair Schema currently not implemented"
// *Document: NO
// *Cause: Feature currently not implemented
// *Action: Use repair relation instead
/////////////////////////////////////////////////////////////////////////////
/ 48600 - 48699 for AMH layer 
/////////////////////////////////////////////////////////////////////////////
48600, 00000, "HM run with name [%s] already exists"
// *Document: YES
// *Cause: The specified run name already existed.
// *Action: Specify different run name and re-run the check
48601, 00000, "HM run id[%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48602, 00000, "HM finding id [%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48603, 00000, "HM recommendation id [%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48604, 00000, "Alloc Function Pointer should not be NULL  "
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48605, 00000, "Argument [%s] value should not be NULL"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48606, 00000, "Argument [%s] value should not be ZERO"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48607, 00000, "Not valid(supported) parameter type"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48608, 00000, "Info list object doesn't have space"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48609, 00000, "Param [%s] was not found in the infolist object"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48610, 00000, "Format of info list text is not correct"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48611, 00000, "Message object doesn't have space for new message"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48612, 00000, "Info list object doesn't have space for new params"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48613, 00000, "Finding set object doesn't have space for new finding"
// *Document: NO
// *Cause: Wrong usage of AMH layer by its upper layers 
// *Action:
48614, 00000, "HM run with name [%s] not found"
// *Document: NO
// *Cause:  
// *Action:
48615, 00000, "Parameter [%s] value not specified"
// *Document: YES 
// *Cause: Run was invoked without specifying the parameter and its value  
// *Action: Specify the needed parameter and its value
48616, 00000, "Parameter [%s] is NULL"
// *Document: NO
// *Cause:  
// *Action:
48617, 00000, "Parameter [%s] value [%s] length exceeds the maximum limit [%s]"
// *Document: YES 
// *Cause:  
// *Action:
48618, 00000, "Invalid HM run name specified"
// *Document: YES
// *Cause: An invalid Health Monitor (HM) run name was specified.
// *Action: Specify a HM run name using only alphanumeric and underscore
//          characters.
/
///////////////////////////////////////////////////////////////////////////
// Errors 48700 - 48749 reserved for DFW initialization Usage Errors 
///////////////////////////////////////////////////////////////////////////
/
48700, 00000, "DBG initialization out of sequence"
// *Document: No
// *Cause:  The diagctx was not in a valid state for this operation.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48701, 00000, "DBG initialization : bad Library Group ID"
// *Document: No
// *Cause:  A bad Library Group Id was passed to a DBG initialization interface.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48702, 00000, "DBG initialization : no callbacks specified to disable ADR"
// *Document: No
// *Cause:  The ADR disable option was specified but no output redirection
//          callbacks were provided.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48703, 00000, "DBG initialization : no process-level diag context specified"
// *Document: No
// *Cause:  A thread-level diag context initialization performed without
//          initializing a process-level diag context.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48704, 00000, "DBG initialization : invalid value for initial number"
// *Document: No
// *Cause:  A value less than zero was specified for the initial
//          number of contexts to populate the diag context pool.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
48705, 00000, "DBG initialization : invalid value for working number"
// *Document: No
// *Cause:  A value less than zero was specified for the working
//          number of contexts for the diag context pool.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//            facility at the time it is encountered.
/
///////////////////////////////////////////////////////////////////////////
// Errors 48750 - 48799 reserved for DFW initialization Internal Errors 
///////////////////////////////////////////////////////////////////////////
/
48750, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48751, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48752, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48753, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48754, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48755, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48756, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48757, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48758, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48759, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48760, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48761, 00000, "DBG context management internal failure"
// *Document: No
// *Cause:  Assertion failure in diagnosability layer code.
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48762, 00000, "DBG context notification service internal failure"
// *Document: No
// *Cause:  Assertion failure in initialization notification service
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/
48763, 00000, "DBG memory corruption for thread local root"
// *Document: No
// *Cause:  DBG thread local root is corrupted
// *Action: Report as a bug.
// *Comment: This is really an internal error, but we don't have an error
//           facility at the time it is encountered.  The error code 
//           uniquely identifies the code location.
/

/////////////////////////////////////////////////////////////////////////////
/ 48800 - 48899 are reserved for ADV layer
/////////////////////////////////////////////////////////////////////////////
48800, 00000, "\"%s\" for the keyword \"%s\" is not in the right format of timestamp"
// *Document: YES
// *Cause: The value format is not right
// *Action: Check the format ADRCI supports

48801, 00000, "The option \"%s\" is duplicated"
// *Document: YES
// *Cause: The option has been specified more than once
// *Action: Check the input

48802, 00000, "The options \"%0!s\" and \"%1!s\" are mutually exclusive."
// *Document: YES
// *Cause: An attempt was made to specify the two options together.
// *Action: Specify only one of the options.

48803, 00000, "The keyword \"%s\" is not defined for this command"
// *Document: YES
// *Cause: The keyword is invalid
// *Action: Check the valid keywords for the command

48804, 00000, "The command needs at least one file input"
// *Document: YES
// *Cause: No files are specified to view
// *Action: Input the files
48805, 00000, "BEGIN BACKUP issued already - must do an END BACKUP first"
// *Document: YES
// *Cause: A begin backup was already issued.
// *Action: Issue END BACKUP
48806, 00000, "Unknown Function Reference (%s)"
// *Document: YES
// *Cause: The function reference is not a valid function
// *Action: Change the reference
48807, 00000, "The SET subcommand requires at least one additional parameter"
// *Document: YES
// *Cause: An argument was not specified for the SET subcommand.
// *Action: Specify additional arguments or precede the command with help.
48808, 00000, "malformed SET CONTROL command - see \"HELP SET CONTROL\""
// *Document: YES
// *Cause: Improper syntax was specified for the SET CONTROL command.
// *Action: Specify additional arguments or use the HELP SET CONTROL command for more information.
48809, 00000, "The number of estimate parameters exceeds the maximum allowed [%s]."
// *Document: YES
// *Cause: The estimate parameters exceeded the maximum number allowed.
// *Action: Check the parameters. If the parameters are correct, contact Oracle
//          Support Services.
48810, 00000, "malformed ESTIMATE command - see \"HELP ESTIMATE\""
// *Document: YES
// *Cause: Improper syntax was specified for the ESTIMATE command.
// *Action: Specify additional arguments or use the HELP ESTIMATE command for more information.
/////////////////////////////////////////////////////////////////////////////
/ 48900- 48999 are reserved for UTS layer
/////////////////////////////////////////////////////////////////////////////
48900, 00000, "Illegal Input Argument [%s]"
// *Document: YES
// *Cause: The input argument is invalid
// *Action: Check the input parameter
48902, 0000, "Empty component specification"
// *Document: YES
// *Cause: 
// *Action:
48903, 0000, "String [%s] is not a valid library name"
// *Document: YES
// *Cause: 
// *Action:
48904, 0000, "String [%s] is not a valid component name"
// *Document: YES
// *Cause:
// *Action:
48905, 0000, "String [%s] is not a valid operation name"
// *Document: YES
// *Cause:
// *Action:

48906, 00000, "Parser context is not valid"
// *Document: YES
// *Cause: The parser context is not initialized
// *Action: Call the initialization routine first before using the context

48907, 00000, "The end of file is reached"
// *Document: YES
// *Cause: The end of file is reached
// *Action: Handle the end of file

48908, 00000, "No trace files are found"
// *Document: YES
// *Cause: This is no file in the navigator context, either it is done with
//         parsing, or no file is pushed
// *Action: Check if the file is added to the context

48909, 00000, "Scan context is not initialized"
// *Document: YES
// *Cause: The scan context is not initialized
// *Action: call the initialization routine of the scan context

48910, 00000, "Fetch already started"
// *Document: NO
// *Cause: Cannot add files if the fetch is already started
// *Action: Add the file before fetching

48911, 00000, "The parent node does not exist"
// *Document: NO
// *Cause: The current node does not have parent node
// *Action: Check the input node to see if it has parent

48912, 00000, "The specified trace filename is too long"
// *Document: YES
// *Cause:The resulting trace filename length exceeds the maximum length
// *Action:Use a smaller trace filename suffix or move ADR higher in the 
//         directory  hierarchy

48913, 00000, "Writing into trace file failed, file size limit [%s] reached"
// *Cause:An attempt was made to write into a trace file that exceeds 
//        the trace's file size limit
// *Action:increase the trace's file size limit.

48914, 00000, "File position is not in right format"
// *Document: YES
// *Cause: The file position format is not right
// *Action: Check if the file format string is the right one

48915, 00000, "The output format is not supported"
// *Document: NO
// *Cause: The requested trace output format is not supported 
// *Action: Check the valid output format

48916, 00000, "Cannot open the output file with path [%s] and filename [%s]"
// *Document: NO
// *Cause: The file path may not exist, or the filename may not valid
// *Action: Check the filepath and filename

48917, 00000, "Fail to seek to the requested file position"
// *Document: NO
// *Cause: The file name may not exist
// *Action: Verify the filename

48918, 00000, "Interruption is caught"
// *Document: NO
// *Cause: User entered CTRL-C
// *Action: No action is needed

48919, 00000, "End of Fetch is reached in the trace navigator"
// *Document: NO
// *Cause: The file has reached the end
// *Action: No action is needed

48920, 00000, "The merge context is not initialized"
// *Document: NO
// *Cause: The merge context is not initialized
// *Action: initialize the merge context before other operations

48921, 00000, "The begin timestamp cannot be larger than the end timestamp"
// *Document: NO
// *Cause: The begin timestamp is larger than the end timestamp
// *Action: verify the begin and end timestamp

48922, 00000, "The input homepath is not a valid ADR home"
// *Document: NO
// *Cause: The homepath is not a valid ADR home
// *Action: Verify the homepath 

48923, 00000, "There is no file to be merged"
// *Document: NO
// *Cause: There is no file to be merged
// *Action: Verify if the filenames are correct

48924, 00000, "The merge is done"
// *Document: NO
// *Cause: The merge is done
// *Action: Terminate the merge context

48925, 00000, "The incident does not exist"
// *Document: NO
// *Cause: The incident does not exist
// *Action: Check if the incident ID exists

48926, 00000, "The offset is not valid"
// *Document: NO
// *Cause: The requested offset is not valid
// *Action: Verify the position flag is specified

48927, 00000, "The requested line number does not exist"
// *Document: NO
// *Cause: The file does not have the requested line number
// *Action: Check the file and the line number

48928, 00000, "The predicate exceeds the max limit %s"
// *Document: YES
// *Cause: The predicate is too long, exceeds the  max limit
// *Action: Use a shorter predicate

48929, 00000, "The trace record size exceeded the max size that can be read [%s]"
// *Document: YES
// *Cause: A trace record is too large to be read by the ADR viewer
// *Action: Report to Oracle

48930, 00000, "Cannot allocate memory for processing traces"
// *Document: YES
// *Cause: A memory allocation request failed
// *Action: Report to Oracle

48931, 00000, "The metadata header of file [%s] is not valid"
// *Document: NO
// *Cause: The metadata is not written correctly
// *Action: 

48932, 00000, "The data offset is not in non-decreasing order at byte [%s]" 
// *Document: NO
// *Cause:
// *Action: 

48933, 00000, "Fail to switch to ADR default home" 
// *Document: NO
// *Cause: We are unable to switch to the ADR default home due to an error
//         with the internal ADR state.
// *Action: Report to Oracle

48934, 00000, "invalid input for the file name identifier"
// *Cause: An invalid input was given for the file name identifier.  The 
//         file name is not allowed to have slashes ('\', '/') and is not
//         allowed to refer to the parent directory using the '..' characters.
// *Action: Check the file name and provide a valid input.

48935, 00000, "bucket snapshotting error: [%s], [%s], [%s], [%s], [%s], [%s], [%s], [%s]"
// *Document: NO
// *Cause: The UTS bucket snapshot was not consistent.
// *Action:

48936, 00000, "The number of relations exceeds maximum number [%s]"
// *Cause: Too many relations listed
// *Action: Reduce the number
48937, 00000, "Feature (%s) currently not allowed for SELECT"
// *Cause: Feature is not allowed
// *Action: Remove feature
48938, 00000, "View select column count differs from select alias list"
// *Cause: The view alias list has a different number of fields than the select list"
// *Action: Change the alias list or view select statement
48939, 00000, "Select * not allowed in a CREATE VIEW"
// *Cause: * is currently not allowed for a create view select list
// *Action: List the fields explicitly
48940, 00000, "invalid value %s (length = %s) for parameter _MAX_INCIDENT_FILE_SIZE"
// *Document: NO
// *Cause: The string supplied for the parameter _MAX_INCIDENT_FILE_SIZE was
//         not an integer, an integer followed by 'K', 'M' or 'G', nor the
//         special value UNLIMITED.
// *Action: Provide a proper value for this parameter.

48941, 00000, "The maximum metadata version that can be processed is [%s]"
// *Document: NO
// *Cause: The metadata file version being read is greater than the maximum
// version that can be processed by the parser.
// *Action: Upgrade the client to a later release.

///////////////////////////////////////////////////////////////////////////
// Errors 49100 - 49199 reserved for Events++ errors 
///////////////////////////////////////////////////////////////////////////
49100, 00000, "Failed to process event statement [%s] "
// *Document: NO
// *Cause:
// *Action:
49101, 00000, "Failed to parse action [%s]"
// *Document: NO
// *Cause:
// *Action:
49102, 00000, "Action definition for [%s] not found"
// *Document: NO
// *Cause:
// *Action:
49103, 00000, "Missing Mandatory argument [%s] for %s [%s]"
// *Document: NO
// *Cause: 
// *Action:
49104, 00000, "[%s] is not a valid argument for %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49105, 00000, "Too many arguments specified for %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49106, 00000, "Parameter value [%s] is invalid"
// *Document: NO
// *Cause:
// *Action:
49107, 00000, "Passed end of string while parsing"
// *Document: NO
// *Cause:
// *Action:
49108, 00000, "Event Name [%s] not found"
// *Document: NO
// *Cause:
// *Action:
49109, 00000, "Library Name [%s] not found"
// *Document: NO
// *Cause:
// *Action:
49110, 00000, "Parameter value [%s] length is longer than maximum allowed"
// *Document: NO
// *Cause:
// *Action:
49111, 00000, "Parsing failed because memory allocation failed"
// *Document: NO
// *Cause:
// *Action:
49112, 00000, "Parameter value [%s] is not one of allowed values"
// *Document: NO
// *Cause:
// *Action:
49113, 00000, "Scope event limit exceeded, scoped events may work incorrectly"
// *Document: NO
// *Cause:
// *Action:
49114, 00000, "Target not specified for scope [%s]"
// *Document: NO
// *Cause:
// *Action:
49115, 00000, "Target not specified for event [%s]"
// *Document: NO
// *Cause:
// *Action:
49116, 00000, "SQL ID string [%s] is invalid"
// *Document: NO
// *Cause:
// *Action:
49150, 0000, "Parameter NULL for this call [%s]"
// *Document: NO
// *Cause:
// *Action:
49151, 0000, "Event group not initialized"
// *Document: NO
// *Cause:
// *Action:
49152, 0000, "Event parse context not initialized"
// *Document: NO
// *Cause:
// *Action:
49153, 0000, "Event group sync failed, parent[%s] is not parent of child[%s]"
// *Document: NO
// *Cause:
// *Action:
49154, 0000, "Failed to initialize parse context in [%s]"
// *Document: NO
// *Cause:
// *Action:
49155, 0000, "Failed to initialize event group in [%s]"
// *Document: NO
// *Cause:
// *Action:
49156, 0000, "Failed to destroy parse context in [%s]"
// *Document: NO
// *Cause:
// *Action:
49157, 0000, "Syncing failed, parent and child are same group"
// *Document: NO
// *Cause:
// *Action:
49158, 0000, "Empty Filter Specification"
// *Document: NO
// *Cause:
// *Action:
49159, 0000, "Too many filters specified"
// *Document: NO
// *Cause:
// *Action:
49160, 0000, "Scope or Filter cannot be specified for mapped event, use [%s]"
// *Document: NO
// *Cause:
// *Action:
49161, 0000, "Usage for event %s : %s"
// *Document: NO
// *Cause:
// *Action:
49162, 0000, "[%s] is not a valid scope"
// *Document: NO
// *Cause:
// *Action:
49163, 0000, "Event string must begin with a valid event name/number"
// *Document: NO
// *Cause:
// *Action:
49164, 0000, "Event number is invalid"
// *Document: NO
// *Cause:
// *Action:
49165, 0000, "Too many arguments for event %s"
// *Document: NO
// *Cause:
// *Action:
49166, 0000, "Keyword IMMEDIATE must be at the beginning of event string"
// *Document: NO
// *Cause:
// *Action:
49167, 00000, "Invalid value of parameter [%s] for %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49168, 00000, "Missing value for name-value pair"
// *Document: NO
// *Cause:
// *Action:
49169, 00000, "Event [%s] is not a valid filter"
// *Document: NO
// *Cause:
// *Action:
49170, 00000, "arg=action() construct can not be used in %s [%s]"
// *Document: NO
// *Cause:
// *Action:
49171, 00000, "Type of parameter [%s] is not compatible with action [%s]"
// *Document: NO
// *Cause:
// *Action:
49172, 00000, "Depth of action nesting exceeds allowed limit"
// *Document: NO
// *Cause:
// *Action:
49173, 00000, "Parameter [%s] of %s [%s] must be specified as a literal"
// *Document: NO
// *Cause:
// *Action:
49174, 00000, "Unable to set event in %s due to %s"
// *Document: NO
// *Cause:
// *Action:
///////////////////////////////////////////////////////////////////////////
// Errors 49200 - 49299 reserved for DDE errors 
///////////////////////////////////////////////////////////////////////////
49200, 00000, "DDE Internal Error"
// *Document: NO
// *Cause:
// *Action:
49201, 00000, "Arguments not valid for DDE invocation"
// *Document: NO
// *Cause:
// *Action:
49202, 00000, "DDE global context not initialized for DDE invocation"
// *Document: NO
// *Cause:
// *Action:
49203, 00000, "Too many recursive DDE invocations"
// *Document: NO
// *Cause:
// *Action:
49204, 00000, "Recursive DDE invocation at Phase I"
// *Document: NO
// *Cause:
// *Action:
49205, 00000, "DDE async action error [%s] [%s] [%s] [%s] [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause:
// *Action: None
49206, 00000, "No DDE async actions in queue"
// *Document: NO
// *Cause: An attempt was made to dequeue from an empty queue.
// *Action: None
///////////////////////////////////////////////////////////////////////////
// Errors 49300 - 49399 reserved for DDE User Actions errors 
///////////////////////////////////////////////////////////////////////////
49300, 00000, "DDE User Actions Internal Error"
// *Document: NO
// *Cause:
// *Action:
49301, 00000, "Illegal input argument [%s]"
// *Document: NO
// *Cause: An illegal argument was passed in.
// *Action: Fix the calling function.

49302, 00000, "Invalid action/invocation specified [%s] [%s] [%s]"
// *Document: NO
// *Cause: The specified combination of incident, action name and invocation
//         doesn't exist.
// *Action: Specify an existing combination of incident, action and invocation.

49303, 00000, "Invalid action specified (action not defined) [%s]"
// *Document: NO
// *Cause: The specified action is not defined in this ADR.
// *Action: Specify an action based on an available action definition.

49304, 00000, "Invalid action/invocation/parameter specified [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause: The specified combination of incident, action name, invocation and
//         parameter (position) doesn't exist.
// *Action: Specify an existing combination. Check the number of parameters.

49305, 00000, "Invalid parameter specified (action parameter not defined) [%s] [%s]"
// *Document: NO
// *Cause: The specified action parameter is not defined in this ADR.
// *Action: Specify an action parameter based on an available parameter
//          definition.

49306, 00000, "Invalid parameter length specified, argn:%s, len:%s, lim:%s"
// *Document: NO
// *Cause: A specified parameter value was too long.
// *Action: Input a parameter value of valid length.

49307, 00000, "Invalid length in user credentials, argn:%s, len:%s, lim:%s"
// *Document: NO
// *Cause: A specified username or password was too long.
// *Action: Input a username or password of valid length.

49308, 00000, "Unable to read ADR record [%s]"
// *Document: NO
// *Cause: There was an error reading records from ADR.
// *Action: Check underlying errors on the error stack.

49309, 00000, "Action failed [%s] [%s] [%s]"
// *Document: NO
// *Cause: An action invoked through OCI failed.
// *Action: Verify that the called PL/SQL function exists, and that the
//          logged-in user has execute privileges on the function.

49310, 00000, "Invalid command string length [%s] [%s] [%s] [%s]"
// *Document: NO
// *Cause: A too long OS command string was constructed.
// *Action: 

49311, 00000, "Command processor not found (system call returned null value) [%s] [%s]"
// *Document: NO
// *Cause: The system call could not execute, because there is no command
//         processor.
// *Action: Check the operating system.

49312, 00000, "No incident provided and no default incident set"
// *Document: NO
// *Cause: A command-line command did not specify an incident,
//         and no incident had been set using the SET INCIDENT command.
// *Action: Specify an incident id, or use SET INCIDENT to set an incident.

49313, 00000, "Specified parameter cannot be modified [%s] [%s]"
// *Document: NO
// *Cause: A command tried to modify the value of a parameter that has the
//         "unmodifiable" flag.
// *Action: Modify the value of another parameter.

49314, 00000, "Specified action is in status INCOMPLETE and cannot be executed"
// *Document: NO
// *Cause: Attempt to execute an action in status INCOMPLETE.
// *Action: Provide all parameters in order to change the action status.

49315, 00000, "Invalid incident type specified [%s]"
// *Document: YES
// *Cause: The specified incident type is not defined in this ADR.
// *Action: Specify an available incident type.

49316, 00000, "required environment variable not set [%s]"
// *Document: YES
// *Cause: The required environment variable was not set.
// *Action: Set the required environment variable.

49317, 00000, "Action cannot be run in read-only database instance."
// *Document: YES
// *Cause: The database was not opened in read/write mode.
// *Action: Open the database in read/write mode.

49318, 00000, "action cannot be run, database not available"
// *Document: YES
// *Cause: The action could not connect to the database.
// *Action: Open the database.

49320, 00000, "database error when executing action [%s]"
// *Document: YES
// *Cause: A database error occurred while executing the action.
// *Action: Review the database error.

///////////////////////////////////////////////////////////////////////////
// Errors 49400 - 49499 reserved for IPS errors 
///////////////////////////////////////////////////////////////////////////

49400, 00000, "IPS Internal Error"
// *Document: NO
// *Cause: An internal error was encountered.
// *Action: Report to Oracle as a bug.
// *Comment: This is a bug.

49401, 00000, "Illegal input argument [%s]"
// *Document: NO
// *Cause: A programming error caused invalid arguments to be passed.
// *Action: Report to Oracle.
// *Comment: This is a bug.

49402, 00000, "Invalid length specified [%s] [%s] [%s]"
// *Document: NO
// *Cause: A programming error caused an invalid length to be specified.
// *Action: Report to Oracle.
// *Comment: This is a bug.

49404, 00000, "No such package [%s]"
// *Document: YES
// *Cause: The specified package does not exist.
// *Action: Specify an existing package.

49405, 00000, "Cannot change package name [%s] [%s]"
// *Document: YES
// *Cause: Attempted to change package name after package generation.
// *Action: Use current name, or create a new package with the desired name.
// *Comment: It's not possible to change the package name after the first
//           physical package has been generated.

49406, 00000, "Undefined configuration parameter specified [%s]"
// *Document: YES
// *Cause: The specified configuration parameter was not found in ADR.
// *Action: Specify an existing parameter. Re-populate parameters if necessary.

49407, 00000, "No unpacking history in this home"
// *Document: YES
// *Cause: No packages were unpacked into this home.
// *Action: Verify the current home. Unpack a package if necessary.

49408, 00000, "Invalid home specified [%s]"
// *Document: YES
// *Cause: An invalid ADR_HOME was specified.
// *Action: Verify that the directory exists, and has the correct structure.

49409, 00000, "Incremental package provided when complete expected"
// *Document: YES
// *Cause: No packages were unpacked into this home.
// *Action: Provide a complete package, or use FORCE option.

49410, 00000, "Not an IPS package"
// *Document: YES
// *Cause: The specified file was not an IPS package.
// *Action: Verify that the file is a valid zip file with expected contents.

49411, 00000, "Incompatible package version [%s] [%s]"
// *Document: NO
// *Cause: The package file is from an incompatible version.
// *Action: Regenerate the package with a compatible version, or try unpacking
//          with a compatible version. Alternatively, unpack manually,
//          or use the FORCE flag (not recommended).

49412, 00000, "Package ID does not match existing ID [%s] [%s]"
// *Document: YES
// *Cause: The package ID in package file did not match previously unpacked
//         packages.
// *Action: Use the correct location for unpacking the package.

49413, 00000, "Package name does not match existing name [%s] [%s]"
// *Document: YES
// *Cause: The package name in package file did not match previously unpacked
//         packages.
// *Action: Use the correct location for unpacking the package.

49414, 00000, "Package sequence later than expected [%s] [%s]"
// *Document: YES
// *Cause: The package sequence in package file was later than expected.
// *Action: Apply packages in correct order, or use FORCE option.

49415, 00000, "Package sequence earlier than expected [%s] [%s]"
// *Document: YES
// *Cause: The package sequence in package file was earlier than expected.
// *Action: Apply packages in correct order, or use FORCE option.

49416, 00000, "Earlier package sequence applied with FORCE option [%s] [%s]"
// *Document: YES
// *Cause: An earlier package sequence was applied using the FORCE option.
// *Action: Apply a complete sequence which is later than any already applied,
//          or use FORCE option to apply an incremental package.

49417, 00000, "Cannot modify already generated package"
// *Document: YES
// *Cause: Attempted to change package attributes after package generation.
// *Action: Create a new package with the desired name.
// *Comment: Certain package attributes, such as correlation level, cannot be
//           changed after the first physical package has been generated.

49418, 00000, "Invalid package name specified"
// *Document: YES
// *Cause: An invalid Incident Packaging Service (IPS) package name was
//         specified.
// *Action: Specify a package name using only alphanumeric and underscore
//          characters.

49420, 00000, "Package too large [%s] [%s]"
// *Document: YES
// *Cause: The package is too large.
// *Action: Remove some files or incidents from the package, or try using
//          incremental mode.

49421, 00000, "Maximum number of package files generated [%s]"
// *Document: YES
// *Cause: The command generated the maximum number of package files.
// *Action: Remove some files or incidents from the package, or use
//          incremental mode to generate additional files.

49423, 00000, "File outside ADR not allowed"
// *Cause: The specified file is not within the ADR directory structure.
// *Action: Specify a file inside ADR.

49424, 00000, "Directory outside ADR not allowed"
// *Cause: The specified directory is not within the ADR directory structure.
// *Action: Specify a directory inside ADR.

49425, 00000, "File inside ADR not allowed"
// *Cause: The specified file is within the ADR directory structure.
// *Action: Specify a file outside ADR.

49426, 00000, "Directory inside ADR not allowed"
// *Cause: The specified directory is within the ADR directory structure.
// *Action: Specify a directory outside ADR.

49427, 00000, "No such file or file not accessible [%s]"
// *Cause: The specified file does not exist or cannot be accessed.
// *Action: Create the file or verify file permissions.

49428, 00000, "No such directory or directory not accessible  [%s]"
// *Cause: The specified directory does not exist or cannot be accessed.
// *Action: Create the directory or verify directory permissions.

49429, 00000, "File already exists and OVERWRITE option not specified [%s]"
// *Cause: The client attempted to create a file that already exists.
// *Action: Either remove the file or use the OVERWRITE option.

49430, 00000, "No such problem [%s]"
// *Document: YES
// *Cause: The specified problem does not exist.
// *Action: Specify a problem that exists in this repository.

49431, 00000, "No such incident [%s]"
// *Document: YES
// *Cause: The specified incident does not exist.
// *Action: Specify an incident that exists in this repository.

49432, 00000, "Problem not part of package [%s]"
// *Document: YES
// *Cause: The specified problem is not included in the package.
// *Action: Specify a problem that is included in the package.

49433, 00000, "Incident not part of package [%s]"
// *Document: YES
// *Cause: The specified incident is not included in the package.
// *Action: Specify an incident that is included in the package.

49434, 00000, "Invalid date format"
// *Document: YES
// *Cause: An invalid format was used to specify a date
// *Action: Specify the date in a supported format.

49435, 00000, "Flood-controlled incident not allowed here [%s]"
// *Document: YES
// *Cause: A flood-controlled incident cannot be included in a package
// *Action: Specify an incident that is not flood-controlled

49436, 00000, "Date conversion error [%s]"
// *Document: YES
// *Cause: An invalid format was used to specify a date
// *Action: Specify the date in a supported format.

49440, 00000, "Warnings while unpacking package, details in file %s"
// *Document: YES
// *Cause: There were some non-fatal errors when unpacking a package
// *Action: Review the specified unpacking log file

49441, 00000, "Warnings while finalizing package, details in file %s"
// *Document: YES
// *Cause: There were some non-fatal errors when finalizing a package
// *Action: Review the specified finalize log file

49450, 00000, "Non-zero return code from archiving utility [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) returned a warning or error.
// *Action: Verify that the file and directory exist and are readable,
//          and that the file is a valid zip file.

49451, 00000, "Archive file structure error [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) returned an error indicating
//         that the archive file structure is incorrect.
// *Action: Verify that the file was transferred correctly and that the
//          file is a valid zip file.

49452, 00000, "Archiving utility out of memory [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) returned an error indicating
//         that it was unable to allocate enough memory.
// *Action: Check for operating system limitations on process memory usage.

49453, 00000, "Invalid command invoking archiving utility [%s] [%s]"
// *Document: YES
// *Cause: The archiving utility (zip/unzip) was invoked with an invalid
//         command line, or with invalid options.
// *Action: Verify that there are no operating system settings affecting
//          the behavior of the archiving utility..

49454, 00000, "Archive is missing or empty [%s] [%s]"
// *Document: YES
// *Cause: The specified archive does not exist, or is empty.
// *Action: Check if the specified archive exists.

49455, 00000, "Archive I/O failed [%s] [%s]"
// *Document: YES
// *Cause: An attempt to create, write to or read from an archive failed.
// *Action: Verify that operating system I/O operations are working correctly.

49456, 00000, "Operation failed due to insufficient disk space [%s] [%s]"
// *Document: YES
// *Cause: An operation on an archive failed due to insufficient disk space.
// *Action: Verify that there is sufficient disk space. Check for operating
//          system quotas or other restrictions.

49480, 00000, "Starting to finalize package contents"
// *Document: NO

49481, 00000, "Finished finalizing package contents"
// *Document: NO

49482, 00000, "Starting package generation"
// *Document: NO

49483, 00000, "Finished package generation"
// *Document: NO

49490, 00000, "Getting additional information"
// *Document: NO

49491, 00000, "Getting CRS information"
// *Document: NO

49492, 00000, "Getting OCM information"
// *Document: NO

49493, 00000, "Getting RDA information"
// *Document: NO

49494, 00000, "Getting OSS information"
// *Document: NO

///////////////////////////////////////////////////////////////////////////
// Errors 49500 - 49599 reserved for Incident Meter Errors 
///////////////////////////////////////////////////////////////////////////
49500, 00000, "Invalid Transient LifeTime[%s]"
// *Document: NO
// *Cause:
// *Action:
49501, 00000, "Invalid Critical Factor[%s]"
// *Document: NO
// *Cause:
// *Action:
49502, 00000, "Invalid Warning Factor[%s]"
// *Document: NO
// *Cause:
// *Action:
49503, 00000, "Invalid Weight Factor[%s]"
// *Document: NO
// *Cause:
// *Action:
49504, 00000, "Incident meter configuration record not found "
// *Document: NO
// *Cause:
// *Action:
49505, 00000, "Problem record not found"
// *Document: NO
// *Cause:
// *Action:
49506, 00000, "Incident record not found"
// *Document: NO
// *Cause:
// *Action:
///////////////////////////////////////////////////////////////////////////
// Errors 49600 - 49699 reserved for Events++ Parser errors
///////////////////////////////////////////////////////////////////////////
49600,0,      ","
// *Document: NO
// *Cause:
// *Action:
49601,2,      "syntax error: found \"%s\": expecting one of: \"%s\" etc.."
// *Document: YES
// *Cause: Syntax error discovered when processing event specification
// *Action: Enter correct event specification
49602,0,      "attempt recovery: symbol \"%s\" inserted before \"%s\"."
// *Document: NO
// *Cause:
// *Action:
49603,0,      "attempt recovery: symbol \"%s\" ignored."
// *Document: NO
// *Cause:
// *Action:
49604,0,      "attempt recovery: symbol \"%s\" substituted for \"%s\"."
// *Document: NO
// *Cause:
// *Action:
49605,4,      "error: got NULL for lexer callback."
// *Document: NO
// *Cause:
// *Action:
49606,0,      "file \"%s\", line \"%s\"."
// *Document: NO
// *Cause:
// *Action:
49607,1,      "error: got NULL for debug callback when debug flag is set."
// *Document: NO
// *Cause:
// *Action:
49608,4,      "fatal: internal error"
// *Document: NO
// *Cause:
// *Action:
49609,4,      "error: too many errors at token %s. cannot recover.. bye!"
// *Document: NO
// *Cause:
// *Action:
49610,4,      "error: got NULL for one of memory callbacks and not others"
// *Document: NO
// *Cause:
// *Action:
49611,4,      "error: lexer callback doesn't handle PZLEXERRGET."
// *Document: NO
// *Cause:
// *Action:
49612,1,      "warning: no 'error' token lookahead for any state on parse stack."
// *Document: NO
// *Cause:
// *Action:

/ Messages 49613 -> 49699 are in diaevtus.msg
/
///////////////////////////////////////////////////////////////////////////
// Errors 49700 - 49799 reserved for diagfw PL/SQL interface
///////////////////////////////////////////////////////////////////////////
49700, 00000, ""
// *Document: NO
// *Cause: 
// *Action: 
/
49701, 00000, "Parameter '%s' is NULL."
// *Document: YES
// *Cause: NULL was passed to a function that requires a non-NULL parameter.
// *Action: Pass a valid non-NULL parameter.
/
49702, 00000, "unable to allocate '%s' bytes of external procedure call memory"
// *Cause:  An attempt to allocate memory in a C external procedure failed due
//          to insufficient memory.
// *Action: Try the operation again.
/
49703, 00000, "invalid ADR service name"
// *Cause:  A NULL or undefined Automatic Diagnostic Repository (ADR) service 
//          name was specified.
// *Action: Specify a valid ADR service name.
/
49704, 00000, "invalid incident ID"
// *Cause:  A NULL or nonpositive incident ID was specified.
// *Action: Specify a valid ADR incident ID.
/
///////////////////////////////////////////////////////////////////////////
// Errors 49800 - 49899 reserved for ADS and ADU portable layers
///////////////////////////////////////////////////////////////////////////
49800, 00000, "ADR block file [%s] could not be opened using direct I/O"
// *Cause: An error was encountered when attempting to open an Automatic
//         Diagnostic Repository (ADR) block file using O_DIRECT. The system
//         automatically retries the open without using O_DIRECT.
// *Action: No action is required.
/
49801, 00000, "actual permissions [%s], expected minimum permissions [%s] for effective user [%s]"
// *Document: NO
// *Cause: Informational error with additional details about the next
//         error on the error stack (that is, the error above).
// *Action: Use the information provided by this error to determine the
//          correct permissions or group for the failing directory.
//          Alternatively, use the information to determine the correct user to
//          run the diagnostic initialization for the product.
// *Comment:
/
49802, 00000, "missing read, write, or execute permission on specified ADR home directory [%s]"
// *Cause: The specified Automatic Diagnostic Repository (ADR) home directory
//         did not have the correct permissions.
// *Action: Check the read, write, and execute permissions on the specified 
//          ADR home directory.
/
49803, 00000, "Purge not possible due to incompatible schema version."
// *Cause: The Automatic Diagnostic Repository (ADR) found on disk was
//         different from the version in the library.
// *Action: Start the product to migrate automatically or use the
//          ADRCI utility command MIGRATE SCHEMA.
/
49804, 00000, "cannot modify ADR PDB parameter %s"
// *Cause: An attempt was made to alter the Automatic Diagnostic
//         Repository (ADR) pluggable database (PDB) - only parameters
//         from a non-consolidated database or root container of a
//         consolidated database.
// *Action: ADR PDB parameters cannot be altered from non-consolidated
//          database or root container of a consolidated database. Switch
//          to a PDB to perform the operation.
/
///////////////////////////////////////////////////////////////////////////////
// Errors 49900 - 49999 reserved for ADL portable layer
///////////////////////////////////////////////////////////////////////////////
49900, 00000, "cannot modify parameter %s"
// *Cause:  An attempt was made to alter the parameter from a non-consolidated
//          database or pluggable database.
// *Action: The parameter can only be altered in the root container of a
//          consolidated database.
/
/////////////////////////////////////////////////////////////////////////////
/ 51000 - 51999 are reserved for HM, IR diagnosability framework errors
/ 51000 - 51099 for HM infrastructure related
/ 51100 - 51189 for IR infrastructure related
/ 51190 - 51199 for DBMS_IR package errors
/ 51200 - 51399 for DATA corruption checks (physical, logical)
/ 51400 - 51499 for ASM checks
/ 51500 - 51699 for Check Name, Descriptions and Parameter Descriptions  
/ 51700 - 51749 for Report Framework (dbgx)
/////////////////////////////////////////////////////////////////////////////
51000, 00000, "HM framework error: [%s] [%s]"
// *Document: NO 
// *Cause: possible bug in HM/ADR infrastructure or its checkers 
// *Action: report to oracle support 
// *Comment: 
/
51001, 00000, "check [%s] not found in HM catalog"
// *Document: YES 
// *Cause: checker name might have been misspelled 
// *Action: retry running check with proper checker name 
// *Comment: 
/
51002, 00000, "Too many parameters"
// *Document: NO 
// *Cause: Internal corruption in HM catalog 
// *Action: Report as a bug 
// *Comment: 
/
51003, 00000, "run parameters not formatted correctly"
// *Document: YES 
// *Cause: Run parameters were given in a wrong format 
// *Action: Correct the run params text and try again 
// *Comment: 
/
51004, 00000, "Check doesn't take any input params"
// *Document: YES 
// *Cause: run params were passed to the check, which doesn't take any inputs 
// *Action: don't pass any run params and try again 
// *Comment: 
/
51005, 00000, "run params missing the parameter name"
// *Document: NO 
// *Cause: run params  should contain name=value pairs, but name is missing  
// *Action: correct the run params format and try again 
// *Comment: 
/
51006, 00000, "unexpected delimiter ';' in the run params text"
// *Document: YES 
// *Cause:  run params were not properly formatted.  
// *Action: correct the run params format and try again 
// *Comment: 
/
51007, 00000, "parameter [%s] not registered with this check "
// *Document: YES 
// *Cause:  Wrong inputs were given to this check.  
// *Action: correct the run params and try the check again 
// *Comment: 
/
51008, 00000, "parameter [%s] value is not a proper number"
// *Document: YES 
// *Cause:  the given parameter value is a not a proper number  
// *Action: correct the run params and try again 
// *Comment: 
/
51009, 00000, "parameter [%s] value type not supported yet"
// *Document: NO 
// *Cause:  run params were not properly formatted.  
// *Action: correct the run params format and try again 
// *Comment: 
/
51010, 00000, " NULL context passed "
// *Document: NO 
// *Cause:  checkers passed NULL value to HM    
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51011, 00000, " NULL Info passed "
// *Document: NO 
// *Cause:  checkers passed NULL info to HM    
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51012, 00000, " Param not found "
// *Document: NO 
// *Cause:  internal issue     
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51013, 00000, " default message not found"
// *Document: NO 
// *Cause:  internal issue    
// *Action:  usage issue for checks, internal report to oracle 
// *Comment: 
/
51014, 00000, " Checker Run got Timed Out "
// *Document: NO 
// *Cause:  checker run got timedout    
// *Action:  increase the timeout for the run and try again. 
// *Comment: 
/
51015, 00000, "dummy HM failure with [%s] as arguments"
// *Document: NO 
// *Cause:  DUMMY HM FAILURE  
// *Action:  
// *Comment: 
/
51016, 00000, "dummy HM recommendation with [%s] as arguments"
// *Document: NO 
// *Cause:  DUMMY HM RECO  
// *Action:  
// *Comment: 
/
51017, 00000, "dummy HM damage description with [%s] as argument"
// *Document: NO 
// *Cause:  DUMMY HM RECO  
// *Action:  
// *Comment: 
/
51018, 00000, "list parameter values are of wrong type"
// *Document: NO 
// *Cause:  List parameter values are of wrong type  
// *Action: Correct the run_params and retry the check again 
// *Comment: 
/
51019, 00000, "unsupported list parameter type"
// *Document: NO 
// *Cause:    
// *Action: Correct the run_params and retry the check again 
// *Comment: 
/
51020, 00000, "parameter [%s] not found in info"
// *Document: NO 
// *Cause:    
// *Action:  
// *Comment: 
/
51021, 00000, "Element list full"
// *Document: NO 
// *Cause:  Possible misuse of dbkh_elemlist APIs. 
// *Action: report to oracle 
// *Comment: 
/
51022, 00000, "Invalid element position"
// *Document: NO 
// *Cause:   Possible misuse of dbkh_elemlist APIs. 
// *Action:  report to oracle 
// *Comment: 
/
51023, 00000, "Param type mismatch"
// *Document: NO 
// *Cause:   Possible misuse of dbkh internal APIs 
// *Action:  report to oracle 
// *Comment: 
/
51024, 00000, "unsupported info type"
// *Document: NO 
// *Cause:   possible corruption with dbkh_info data structure  
// *Action:  report to oracle 
// *Comment: 
/
51025, 00000, "check name should be non NULL value"
// *Document: YES 
// *Cause:   NULL value was passed for check name  
// *Action:  give a proper check name and retry again 
// *Comment: 
/
51026, 00000, "Diag ADR not enabled, can't run check"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51027, 00000, "Run name should be non NULL value"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51028, 00000, "Report type should be non NULL value"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51029, 00000, "Report type should be non NULL value"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51030, 00000, "Unsupported report type"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51031, 00000, "Unsupported report level"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51032, 00000, "check name too long"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51033, 00000, "run name too long"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51034, 00000, "pseudo context not allowed"
// *Document: NO 
// *Cause:     
// *Action:   
// *Comment: 
/
51035, 00000, "invalid timeout value"
// *Document: YES 
// *Cause:    User specified an invalid timeout value    
// *Action:   
// *Comment: 
/
51036, 00000, "check [%s] can only be executed in database instance"
// *Document: YES 
// *Cause:    An attempt was made to run database-specific check 
//            in ASM environment   
// *Action:   Don't run the check in ASM environment 
// *Comment: 
/
51037, 00000, "check [%s] can only be executed in ASM instance"
// *Document: YES 
// *Cause:    An attempt was made to run ASM-specific check 
//            in a database environment   
// *Action:   Don't run the check in database environment 
// *Comment: 
/
51100, 00000, "Control file is older than datafiles and/or log files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CURR_CF_OLD failure
/
51101, 00000, "NOARCHIVELOG mode restore datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_NO_REDO
/ 
51102, 00000, "cannot change priority of a critical failure %s"
// *Document: YES
// *Cause:    An attempt was made to change priority of a failure with CRITICAL priority.
// *Action:   No action is required.
/
51103, 00000, "cannot change priority of a closed failure %s"
// *Document: YES
// *Cause:    An attempt was made to change priority of a closed failure.
// *Action:   No action is required.
/
51104, 00000, "NOARCHIVELOG mode restore datafiles %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_REST_NO_REDO
/
51105, 00000, "cannot change priority of a failure to CRITICAL"
// *Document: YES
// *Cause:    An attempt was made to change priority of a failure to CRITICAL.
// *Action:   No action is required.
/
51106, 00000, "check failed to complete due to an error.  See error below"
// *Document: YES
// *Cause:    While executing the check, an unexpected error occurred.
// *Action:   Check the errors below and try rerunning the check.
/
51107, 00000, "failures are changing too rapidly - retry command"
// *Document: YES
// *Cause:    Failures were added or closed during a Data Recovery Advisor 
//            command.
// *Action:   Retry the command.
/
51108, 00000, "unable to access diagnostic repository - retry command"
// *Document: YES
// *Cause:    A lock or timeout error occurred when trying to read failure or 
//            repair data from the Automatic Diagnostic Repository. 
// *Action:   Retry the command.
/
51109, 00000, "repair script file is too large"
// *Document: YES
// *Cause:    Data Recovery Advisor generated a repair script file
//            that was too large.
// *Action:   Retry the command with fewer failures selected.
/
51110, 00000, "buffer size [%s] is too small - [%s] is needed"
// *Document: YES
// *Cause:    An internal buffer was too small.
// *Action:   This is an internal error.  Contact Oracle Support Services.
/
51111, 00000, "failure revalidation timed out"
// *Document: YES
// *Cause:    Data Recovery Manager was unable to revalidate all failures
//            before timing out.
// *Action:   Increase timeout and retry the command.
/
51190, 00000, "Internal error [%s], [%s] from DBMS_IR"
// *Document: YES
// *Cause:  An unexpected error occurred while executing a routine in the
//          DBMS_IR package.
// *Action: This is an internal error.  Contact Oracle Support Services.
/
51191, 00000, "Too many files opened"
// *Document: YES
// *Cause:  Data Recovery Advisor attempted to open too many files using the 
//          DBMS_IR package.
// *Action: This is an internal error.  Contact Oracle Support Services.
/
51192, 00000, "File not open"
// *Document: YES
// *Cause:  Data Recovery Advisor attempted to read or write from a 
//          file that was not open.
// *Action: This is an internal error.  Contact Oracle Support Services.
/
51193, 00000, "invalid parameter value"
// *Document: YES
// *Cause:  An invalid parameter value was supplied in a call to the
//          DBMS_IR package.
// *Action: Fix the parameter value and retry the call.
/
51200, 00000, "%s %s has invalid size"
// *Document: NO 
// *Cause:  
// *Action: 
// *Comment: Description for DBKH_F_ID_IO_INV_SIZE
/
51201, 00000, "Database cannot be mounted"
// *Document: NO
// *Cause:                      
// *Action: 
// *Comment: Failure impact description 
/
51202, 00000, "Control file %s is missing"
// *Document: NO
// *Cause:                      
// *Action: 
// *Comment: Description for DBKH_F_ID_CF_MISSING failure
/
51203, 00000, "Control file %s is corrupt"
// *Document: NO
// *Cause:                      
// *Action: 
// *Comment: Description for DBKH_F_ID_CF_CORRUPT failure
/
51204, 00000, "Control file needs media recovery"
// *Document: NO
// *Cause:
// *Action: 
// *Comment: Description for DBKH_F_ID_CF_NEEDS_MR failure
/
51205, 00000, "Control file %s does not belong to the database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CF_FOREIGN failure
/
51206, 00000, "Control files are mutually inconsistent"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CF_INCONS failure
/
51207, 00000, "Insufficient kernel memory to access %s %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for failure DBKH_F_ID_IO_NO_MEM
/
51208, 00000, "Database might be unrecoverable or become unrecoverable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51209, 00000, "Online log member %s is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LM_MISSING failure
/
51210, 00000, "Online log member %s is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LM_CORRUPT failure
/
51211, 00000, "%s %s cannot be opened because of limit on number of open files per process"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_SOF_LIMIT
/
51212, 00000, "Online log group %s is unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LG_UNAVAIL failure
/
51213, 00000, "%s %s cannot be accessed because of an ASM Failure"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_ASM_INSTANCE
/
51214, 00000, "%s %s cannot be opened because of system limit on number of open files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_SOF_LIMIT failure
/
51215, 00000, "Archived redo log file %s is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_AL_MISSING failure
/
51216, 00000, "Archived redo log file %s is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_AL_CORRUPT failure
/
51217, 00000, "Database cannot be opened"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51218, 00000, "%s %s cannot be accessed because of NFS mount error"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_MOUNT_ERR failure
/
51219, 00000, "System datafile %s: '%s' is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SF_MISSING failure
/
51220, 00000, "System datafile %s: '%s' is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SF_CORRUPT failure
/
51221, 00000, "System datafile %s: '%s' needs media recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SF_NEEDS_MR failure
/
51222, 00000, "See impact for individual child failures"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51223, 00000, "%s %s cannot be accessed because of invalid partitioning of raw volume"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_INV_PART failure
/
51224, 00000, "One or more non-system datafiles are missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_MISSING failure
/
51225, 00000, "One or more non-system datafiles are corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_CORRUPT failure
/
51226, 00000, "One or more non-system datafiles need media recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_NEED_MR failure
/
51227, 00000, "%s %s does not have correct access permissions"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_ION_PERM failure
/
51228, 00000, "Datafile %s: '%s' is missing"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_MISSING failure
/
51229, 00000, "Datafile %s: '%s' is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_CORRUPT failure
/
51230, 00000, "Datafile %s: '%s' needs media recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_NEEDS_MR failure
/
51231, 00000, "Some objects in tablespace %s might be unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51232, 00000, "Datafile %s: '%s' contains one or more corrupt blocks"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MBL_CORRUPT failure
/
51233, 00000, "Block %s in datafile %s: '%s' is media corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_BL_CORRUPT failure
/
51234, 00000, "Object %s owned by %s might be unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51235, 00000, "Redo log group %s is corrupt near change %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_O_REDO_CORRUPT failure
/
51236, 00000, "Archived redo log file %s is corrupt near change %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_A_REDO_CORRUPT failure
/
51237, 00000, "Recovery cannot be completed"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description 
/
51238, 00000, "Perform block media recovery of block %s in file %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_BL_BMR
/
51239, 00000, "Use a multiplexed copy to restore control file %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_COPY_MEMBER
/
51240, 00000, "Restore a backup control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_REST_REC
/
51241, 00000, "If this is a primary database and you have a CREATE CONTROLFILE script, use it to create a new control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_CREATE
/
51242, 00000, "Restore and recover datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_REC 
/
51243, 00000, "Restore and recover datafiles %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_REST_REC
/
51244, 00000, "Recover datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_RECOVER
/
51245, 00000, "Recover datafiles %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_REC
/
51246, 00000, "Take datafile %s offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_OFFLINE
/
51247, 00000, "Take datafiles %s offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_RP_ID_OFL_DFNUM_LIST
/
51248, 00000, "If this is a primary database and a standby database is available, then perform a Data Guard failover initiated from the standby"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_STANDBY_FO
/
51249, 00000, "Recover multiple corrupt blocks in datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_MULT_BMR
/
51250, 00000, "Table object %s has corrupted data"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABLE
/
51251, 00000, "Table %s.%s may not be accessible"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage description for DBKH_F_ID_TABLE
/
51252, 00000, "Row %s of table object %s has corrupted data"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABROW
/
51253, 00000, "Table %s.%s may not be accessible"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage description for DBKH_F_ID_TABROW
/
51254, 00000, "Table object %s mismatched with index object %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABIDX_MISMATCH
/
51255, 00000, "Table %s.%s is not synchronized with index %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage description for DBKH_F_ID_TABIDX_MISMATCH and TABIDX_ROW.
/
51256, 00000, "Table row %s of table object %s mismatched with index object %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_TABIDX_ROW
/
/ 51257 is available to be used
/
51258, 00000, "Restore and recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_REST_REC
/
51259, 00000, "Recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_RECOVER
/
51260, 00000, "Drop and re-create redo log group member %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LF_DROP 
/
51261, 00000, "Clear redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CLEAR 
/
51262, 00000, "Clear unarchived redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CLEAR_UNARC
/
51263, 00000, "Clear unarchived redo log group %s using the UNRECOVERABLE DATAFILE clause in the ALTER DATABASE CLEAR LOGFILE statement"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CLEAR_UNARC_UNREC
/
51264, 00000, "Perform flashback of the database to SCN %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_FLASHBACK
/
51265, 00000, "Perform incomplete database recovery to SCN %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_PITR 
/
51266, 00000, "The repair includes complete media recovery with no data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_NDL_OPT
/
51267, 00000, "The repair includes point-in-time recovery with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_PITR_OPT
/
51268, 00000, "The repair makes some data temporarily unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_TUD_OPT
/
51269, 00000, "Ensure that all disks and network connections are functional"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_HW
/
51270, 00000, "If file %s was unintentionally renamed or moved, restore it"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RESTORE_FILE
/
51271, 00000, "If you have an export of tablespace %s, then drop and re-create the tablespace and import the data."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_IMPORT_DATA
/
51272, 00000, "If you have the correct version of the control file, then replace the old control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_GET_VERS
/
51273, 00000, "If the instance failed when file %s was in online backup mode, then issue ALTER DATABASE END BACKUP.  This option must not be used for a restored backup"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_END_BACKUP
/
51274, 00000, "If you re-created inaccessible files in an alternative location, alter initialization parameters in the parameter file appropriately"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_COPY_CF
/
51275, 00000, "Obtain a copy of redo block from an alternative source (if exists)"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_GET_REDO
/
51276, 00000, "Drop damaged log group member and add new member"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_COPY_LF
/
51277, 00000, "%s %s cannot be accessed because file system does not have correct access permissions"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_FSYS_PERM failure
/
51278, 00000, "%s %s cannot be accessed because it is locked by another process"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_FILE_LOCK failure 
/
51279, 00000, "Block %s of %s %s cannot be accessed because of device IO error"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_DEV_ERR failure
/
51280, 00000, "%s %s is inaccessible"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_IO_INAC_FILE failure
/
51281, 00000, "Force a commit of the corrupted transaction whose id is %s"
// *Document: NO
// *Cause:
// *Action:    
// *Comment: Repair description for DBKH_R_ID_FORCE_COMMIT
/   
51282, 00000, "Transaction %s is corrupted; its undo segment number is %s"
// *Document: NO
// *Cause:
// *Action:    
// *Comment:   
/   
51283, 00000, "Transaction %s is not corrupted"
// *Document: NO
// *Cause:     
// *Action:    
// *Comment:   
/   
51284, 00000, "Undo segment %s is not corrupted"
// *Document: NO
// *Cause:     
// *Action:    
// *Comment:   
/
51285, 00000, "Damage analysis of transaction %s can be found in %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment:
/
51286, 00000, "Transaction %s seems to be corrupted; its undo segment number is %s"
// *Document: NO
// *Cause:
// *Action: 
// *Comment:
/
51287, 00000, "Check corrupt list in V$CORRUPT_XID_LIST for transaction %s. If present, then force commit it. If not, then corruption is likely to happen"
// *Document: NO
// *Cause:
// *Action:
// *Comment:
/
51288, 00000, "If you restored the wrong version of data file %s, then replace it with the correct one"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_GET_VERS
/
51289, 00000, "If you know which copy of the control file is correct, replace other copies with it"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OVWR_CFMEM
/
51290, 00000, "Ensure that file system is mounted properly and OS kernel resources are adequately configured"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_GENERAL_INAC1
/
51291, 00000, "Increase per-process limit on number of open files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_INCR_PROC
/
51292, 00000, "Increase operating system kernel limit on total number of open files"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_INCR_KERNEL
/
51293, 00000, "Mount NFS with the Oracle-recommended mount options"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_NFS
/
51294, 00000, "Ensure that disk partition provided to Oracle does not start at sector 0"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_PART
/
51295, 00000, "Mount your file system with the required access mode"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_PERM
/
51296, 00000, "Change access permissions for file %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHANGE_PERM
/
51297, 00000, "Find process that is holding lock on file %s and resolve lock conflict"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_UNLOCK_FILE
/
51298, 00000, "Ensure that file %s has correct access permissions and is not locked by another process"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_GENERAL_INAC2
/
51299, 00000, "Please contact Oracle Support Services to resolve failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CALL_SUPPORT
/
51300, 00000, "Configure operating system kernel so that there is enough memory available to open a file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_INCR_MEM
/
51301, 00000, "SQL dictionary health check: %s %s on object %s failed"
// *Document: NO
// *Cause: A health check failed
// *Action: See the failure report
// *Comment: Failure description for DBKH_F_ID_DF
/
51302, 00000, "Damaged rowid is %s - description: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description
/
51303, 00000, "illegal check mask value specified"
// *Document: YES
// *Cause: An illegal check mask value was specified.
// *Action: Specify one of the following legal values: COLUMN_CHECKS, ROW_CHECKS, REFERENTIAL_CHECKS, or ALL.
/
51304, 00000, "Checkpoint database and clear redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CHKP_CLEAR 
/
51305, 00000, "Checkpoint database and clear unarchived redo log group %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHKP_LG_CLEAR_UNARC
/
51306, 00000, "Checkpoint database and clear unarchived redo log group %s with unrecoverable datafile(s)"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LG_CHKP_CLEAR_UNARC_UNREC
/
51307, 00000, "Undo segment %s is corrupted"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description
/
51308, 00000, "Restore database and recover with UNTIL CANCEL option"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_PITR_CANCEL 
/   
51309, 00000, "If you have the correct version of the control file, then replace %s with it"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_RP_ID_CF_FIND_FILENAME
/   
51310, 00000, "Ensure that ASM instance is up"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_ASM_INSTANCE
/  
51311, 00000, "Ensure that ASM disk group is mounted"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CHECK_ASM_MOUNTED
/
51312, 00000, "Name for datafile %s is unknown in the control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_UNKNOWN 
/
51313, 00000, "A repair cannot be performed until the database is restarted.  Please shutdown, restart database in nomount mode, and retry ADVISE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RESTART
/
51314, 00000, "If you have the correct version of the control file, then shutdown the database and replace the old control file"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_GET_VERS2
/  
51315, 00000, "Perform incomplete database recovery"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_PITR_NO_LOG
/
51316, 00000, "No check meta-data found on specified table %s"
// *Document: YES
// *Cause: No check meta-data was found for the object
// *Action: Table may not exist or no checks currently defined for the table
/
51317, 00000, "If the file exists, rename data file %s to the name of the real file using ALTER DATABASE RENAME FILE command.  If the file does not exist, create a new data file using ALTER DATABASE CREATE DATAFILE command."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RENAME
/ 
51318, 00000, "The repair includes flashing the database back with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_FLSHBK_OPT repair option 
/
51319, 00000, "The repair includes recovery in NOARCHIVELOG mode with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for repair option DBKH_R_ID_NOARC_OPT
/
51320, 00000, "No backup of block %s in file %s was found. Drop and re-create the associated object (if possible), or use the DBMS_REPAIR package to repair the block corruption"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MAN_BLK_REP 
/
51321, 00000, "If possible, drop and re-create the object associated with the logically corrupted block %s in file %s. Otherwise, use the DBMS_REPAIR package to repair the block"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MAN_BLK_REP2 
/
51322, 00000, "Contact Oracle Support Services if the preceding recommendations cannot be used, or if they do not fix the failures selected for repair"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_LAST_MAND 
/
51323, 00000, "A database state change is required to repair some failures.  An automatic repair might be feasible if you mount the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_DB
/
51324, 00000, "A database state change is required to repair some failures.  An automatic repair might be feasible if you open the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB
/
51325, 00000, "Block %s in datafile %s: '%s' is logically corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_LBL_CORRUPT failure
/
51326, 00000, "Datafile %s: '%s' was not taken offline cleanly. If you do not want to recover it, then take the file OFFLINE FOR DROP and repeat the ADVISE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_OFFLINE_DROP repair 
/
51327, 00000, "The repair includes clearing unarchived redo log with some data loss"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Dataloss repair option description for DBKH_R_ID_CLEAR_NOARC_OPT 
/
51328, 00000, "Block %s in control file is corrupt"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_CFBL_CORRUPT failure
/
51329, 00000, "The control file cannot be repaired while the database is mounted or open.  Please shutdown, restart the database in nomount mode, and retry the ADVISE command.  A backup control file or CREATE CONTROLFILE script will be needed for the repair.  If you do not have a backup control file, a CREATE CONTROLFILE script can be built by using 'alter database backup controlfile to trace'."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_CF_FIX_RESTART repair 
/
51330, 00000, "The control file cannot be repaired while the database is open or mounted.  Please shutdown, restart the database in nomount mode, and retry the ADVISE command.  A CREATE CONTROLFILE script will be needed for the repair because a backup control file could not be found.  If you do not have a script, one can be built by using 'alter database backup controlfile to trace'."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_CF_CREATE_RESTART repair 
/
51331, 00000, "Control file contains one or more corrupt blocks"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MCFBL_CORRUPT failure
/
51332, 00000, "Database or some of its functionality may not be available"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure impact description for DBKH_F_ID_CFBL_CORRUPT failure
/
51333, 00000, "Open resetlogs"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_RESETLOGS
/
51334, 00000, "Automatic repairs may be available if you shutdown the database and restart it in mount mode"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_RESTART_MOUNT 
/
51335, 00000, "Initiate fast-start failover"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_FSFO
/
51336, 00000, "Redo log %s with block size %s is incompatible with native disk sector size"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure description for DBKH_F_ID_LM_DISK_SECTOR
/
51337, 00000, "Move file %s with block size %s to a disk with a compatible sector size"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DISK_SECTOR_MOVE
/
51338, 00000, "Datafile %s: '%s' is offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_OFFLINE failure
/
51339, 00000, "Online datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_ONLINE
/
51340, 00000, "One or more non-system datafiles are offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_MDF_OFFLINE failure
/
51341, 00000, "Tablespace %s: '%s' is offline"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_TS_OFFLINE failure
/
51342, 00000, "Online tablespace %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_TS_ONLINE
/
51343, 00000, "System datafile %s: '%s' is offline"
// *Document: NO
// *Cause:
// *Action:    
// *Comment: Description for DBKH_F_ID_SF_OFFLINE failure
/   
51344, 00000, "If datafile '%s' is in the current undo tablespace, then bring it online using ALTER DATABASE DATAFILE %s ONLINE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_ONLINE_UNDO
/
51345, 00000, "A database state change is required to repair some failures.  An automatic repair might be feasible if you shut down the database and reopen it in read/write mode."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB_RW
/
51346, 00000, "An automatic repair was generated for some of the failures selected for repair.  More failures might be repaired if you open the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB_MORE
/
51347, 00000, "An automatic repair was generated for some of the failures selected for repair.  More failures might be repaired if you open the database in read/write mode."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_DB_RW_MORE
/
51348, 00000, "Open the database read/write to validate and get repair advice for failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_RW_FAIL
/
51349, 00000, "Open the database to validate and get repair advice for failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_OPEN_FAIL
/
51350, 00000, "Mount the database to validate and get repair advice for failure %s: %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_FAIL
/
51351, 00000, "An automatic repair was generated for some of the failures selected for repair.  More failures might be repaired if you mount the database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_MOUNT_DB_MORE
/
51352, 00000, "A database state change is required to repair the following failures."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_STATE_CHANGE
/
51353, 00000, "An automatic repair was generated for some of the failures selected for repair.  A database state change is required to repair the following failures."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_STATE_CHANGE_AUTO
/
51354, 0000, "If you have an export of tablespace %s, open the database read/write, then drop and re-create the tablespace and import the data."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_IMPORT_DATA_2
/
51355, 0000, "If you have an export of tablespace %s, offline its data files, open the database read/write, then drop and re-create the tablespace and import the data."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_IMPORT_DATA_3
/
51356, 00000, "Perform a Data Guard role change (using PL/SQL routine DBMS_DG.INITIATE_FS_FAILOVER)."
// *Document: NO
// *Cause:     
// *Action:    
// *Comment: Repair description for DBKH_R_ID_DG_FSFO_FO
/   
51357, 00000, "Perform a Data Guard role change (using Data Guard broker failover)."
// *Document: NO
// *Cause:     
// *Action:    
// *Comment: Repair description for DBKH_R_ID_DG_BROKER_FO
/   
51358, 00000, "Perform a Data Guard role change (failover)."
// *Document: NO
// *Cause:
// *Action:    
// *Comment: Repair description for DBKH_R_ID_DG_FO
/
51359, 00000, "Shut down, mount the database and try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (using Data Guard broker failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_SHUTDOWN_FLUSH_BROKER_FO
/
51360, 00000, "Try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (using Data Guard broker failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_FLUSH_BROKER_FO
/
51361, 00000, "Shut down, mount the database and try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_SHUTDOWN_FLUSH_FO
/
51362, 00000, "Try flush redo using ALTER SYSTEM FLUSH REDO TO 'standby name' command.  Then perform a Data Guard role change (failover).  Available standbys: %s."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DG_FLUSH_FO
/
51363, 00000, "Data Guard Switchover/Failover performance may be affected"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage Description
/
51364, 00000, "Recovery cannot continue"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Damage Description
/
51365, 00000, "Datafile %s: contains NOLOGGING data"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_NOLOGGING failure
/
51366, 00000, "Standby redo log group %s is unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_SLG_UNAVAIL failure
/
51367, 00000, "If this is a standby database and a primary database is available, go to the primary and create a standby control file using ALTER DATABASE CREATE STANDBY CONTROLFILE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_CF_STBY_CREATE repair 
/
51368, 00000, "Creates a standby control file from the primary"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_CF_REST_FROM_PRIM_REC repair 
/
51369, 00000, "Redo log group may become unavailable"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Impact for DBKH_F_ID_LM_MISSING, DBKH_F_ID_LM_CORRUPT 
/
51370, 00000, "Copy datafile %s from another database using BACKUP AUXILIARY FORMAT command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_COPY_AUXILIARY_FORMAT repair
/
51371, 00000, "If the NOLOGGING data in datafile %s exists on another database (primary or standby), take an incremental backup of it and restore it on this database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_R_ID_INCREMENTAL_BACKUP repair
/
51372, 00000, "Restore datafile %s from primary database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_FROM_PRIM
/
51373, 00000, "No data loss mode may not be available when database is used as Data Guard"
// *Document: NO
// *Cause:
// *Action:
// *Comment:  Impact Message for DBKH_F_ID_SLG_UNAVAIL
/
51374, 00000, "Restore from standby and recover datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_FROM_STBY_REC
/
51375, 00000, "Restore datafile %s and recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_REC_NO_LOG
/
51376, 00000, "If this is a standby database, restore the controlfile for a standby database using RESTORE STANDBY CONTROLFILE FROM AUTOBACKUP command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_CF_REST_STBY
/
51377, 00000, "Restore database from standby and recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_REST_FROM_STBY_REC
/
51378, 00000, "Restore database from primary"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_REST_FROM_PRIM
/
51379, 00000, "Restore and recover database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_REST_REC_NO_LOG
/
51380, 00000, "Create a new datafile %s using ALTER DATABASE CREATE DATAFILE command"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_CREATE
/
51381, 00000, "Datafiles are mutually inconsistent"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_INCONS failure
/
51382, 00000, "Database may not be able to open"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Description for DBKH_F_ID_DF_INCONS failure
/
51383, 00000, "Ensure the primary database is up and recover database using ALTER DATABASE RECOVER MANAGED STANDBY DATABASE UNTIL CONSISTENT command.  Check alert log for potential failures that may cause recovery not to run.  Potential problems may include missing archived logs or datafiles being in an orphaned incarnation."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_F_ID_PRIM_UP_REC_CONS
/
51384, 00000, "Another primary exists in the Data Guard configuration"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Failure description for DBKH_F_ID_OLD_PRIMARY
/
51385, 00000, "Attempt to reinstate the old primary database, %s, as a standby database of the current primary database by issuing the REINSTATE DATABASE command of the Data Guard Broker CLI (DGMGRL) on the current primary. If the database cannot be reinstated, you must re-create the old primary database from a copy of the current primary database."
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_REINSTATE_DB
/
51386, 00000, "Datafile is not protected"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Impact description for offline datafiles on a standby
/
51387, 00000, "Restore datafile %s"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DF_REST_ONLY 
/
51388, 00000, "Restore database"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Repair description for DBKH_R_ID_DB_REST_ONLY 
/
51401, 00000, "ASM disk group mount failure can result in failure mounting Oracle database." 
// *Document: NO
// *Cause: ASM disk group mount failed due to disk(s) missing. 
// *Action: 
// *Comment: Damage Description for mount failure due to missing disks. 
/
51402, 00000, "Disk missing from the disk group. Disk number: %s Name: %s Path: %s. \nSee trace file %s."
// *Document: NO
// *Cause:  The specified disk, which is a necessary part of a disk group, 
//          could not be found on the system.
// *Action: Use operating system commands to restore the unavailable hardware. 
// *Comment: Description for mount failure due to missing disks.
/
51403, 00000, "ASM extent allocation failed. ASM disk group may be in unbalanced state."
// *Document: NO
// *Cause: 
// *Action: 
// *Comment: Damage Description for allocation failure due to disk group space exhausted. 
/
51404, 00000, "Disk group '%s' Imbalance: '%s%'. Partner Imbalance: '%s%'. Size Variance: '%s%'"
// *Document: NO
// *Cause: Either Disk group or Disk partners are in imbalance state.
// *Action: Check ASM views to find the available free space in the disk group.
// *Comment: Description for allocation failure due to space exhausted.
/
51405, 00000, "ASM disk not added to disk group as requested."
// *Document: NO
// *Cause: An attempt to add a disk failed because the disk was not visible cluster-wide. 
// *Action: Check ASM_DISKSTRING initialization parameter on each node to ensure that requested disks can be discovered. 
// *Comment: Damage Description for add disk failure due to missing disks. 
/
51406, 00000, "Requested ASM disk(s) not discovered on all nodes where disk group is mounted.\nSee trace file %s."
// *Document: NO
// *Cause:  The requested disk(s) could not be discovered on all clustered nodes. 
// *Action: See trace file for list of disks that were discovered on each node.  
// *Comment: Description for add disk failure due to disk visibility.
/
51407, 00000, "ASM file not dropped as requested\n%s."
// *Document: NO
// *Cause: 
// *Action: 
// *Comment: Damage Description for drop file failure. 
/
51408, 00000, "Database %s on host %s currently accessing file."
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description for drop file failure.
/
51409, 00000, "Too many offline disks detected."
// *Document: NO
// *Cause: 
// *Action:
// *Comment: 
/
51410, 00000, "%s"
// *Document: NO
// *Cause: 
// *Action:
// *Comment: 
/
51411, 00000, "Insufficient number of disks to establish quorum."
// *Document: NO
// *Cause: 
// *Action:
// *Comment: 
/
51412, 00000, "Insufficient memory available for allocation."
// *Document: NO
// *Cause:
// *Action:
// *Comment:
/
51500, 00000, "HM Test Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Name for the health monitor module test check 
/
51501, 00000, "Check for health monitor functionality"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of check 
/
51502, 00000, "Number of failures to be raised"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51503, 00000, "Number of recommendations to be raised"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51504, 00000, "Damage description parameter value"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51505, 00000, "Failure description parameter value"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51506, 00000, "Dummy element list"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Description of parameter 
/
51507, 00000, "DB Structure Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51508, 00000, "Checks integrity of all database files"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51509, 00000, "CF Block Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51510, 00000, "Checks integrity of a control file block"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51511, 00000, "Control file block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51512, 00000, "Data Block Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51513, 00000, "Checks integrity of a data file block"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51514, 00000, "File number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51515, 00000, "Block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51516, 00000, "Redo Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51517, 00000, "Checks integrity of redo log content"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51518, 00000, "SCN of the latest good redo (if known)"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51519, 00000, "Logical Block Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51520, 00000, "Checks logical content of a block"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51521, 00000, "Tablespace number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51522, 00000, "Relative block address"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51523, 00000, "Segment header relative block address"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51524, 00000, "Dictionary object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51525, 00000, "Data object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51526, 00000, "Table Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51527, 00000, "Checks integrity of a table"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51528, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51529, 00000, "Table check mode"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51530, 00000, "Table-Index Cross Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51531, 00000, "Checks cross references between a table and one of its indexes"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51532, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51533, 00000, "Index object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51534, 00000, "Table Row Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51535, 00000, "Checks integrity of a table row"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51536, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51537, 00000, "Table rowid"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51538, 00000, "Table-Index Row Mismatch"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51539, 00000, "Checks the cross references between a table row and an index entry"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51540, 00000, "Table object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51541, 00000, "Index object number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51542, 00000, "Table rowid"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51543, 00000, "Index entry key"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51544, 00000, "Transaction Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51545, 00000, "Checks a transaction for corruptions"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51546, 00000, "Transaction ID"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51547, 00000, "Undo Segment Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51548, 00000, "Checks integrity of an undo segment"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51549, 00000, "Undo segment number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51550, 00000, "No Mount CF Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51551, 00000, "Checks control file in NOMOUNT mode"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51552, 00000, "CF Member Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51553, 00000, "Checks a multiplexed copy of the control file"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51554, 00000, "Control file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51555, 00000, "All Datafiles Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51556, 00000, "Checks all datafiles in the database"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51557, 00000, "Single Datafile Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51558, 00000, "Checks a data file"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51559, 00000, "File number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51560, 00000, "Log Group Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51561, 00000, "Checks all members of a log group"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51562, 00000, "Log group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51563, 00000, "Log Group Member Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51564, 00000, "Checks a particular member of a log group"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51565, 00000, "Log group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51566, 00000, "Log file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51567, 00000, "Archived Log Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51568, 00000, "Checks an archived log"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51569, 00000, "Archived log name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51570, 00000, "Archived log record ID"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51571, 00000, "Redo Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51572, 00000, "Checks redo log content"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51573, 00000, "SCN of the latest good redo (if known)"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51574, 00000, "IO Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51575, 00000, "Checks file accessibility"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51576, 00000, "Inaccessible file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51577, 00000, "Inaccessible file number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51578, 00000, "IO reason"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51579, 00000, "File block size"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51580, 00000, "File block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51581, 00000, "Block IO Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51582, 00000, "Checks file accessibility"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51583, 00000, "Inaccessible file name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51584, 00000, "Inaccessible file number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51585, 00000, "File block size"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51586, 00000, "Inaccessible block number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51587, 00000, "Txn Revalidation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51588, 00000, "Revalidate corrupted transaction"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51589, 00000, "Transaction id"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51590, 00000, "Failure Simulation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51591, 00000, "Creates dummy failures"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51592, 00000, "Dummy failure id"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51593, 00000, "Dummy failure parameters"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51594, 00000, "Dictionary Integrity Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51595, 00000, "Checks dictionary integrity"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51596, 00000, "Table name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51597, 00000, "Check mask"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51598, 00000, "ASM Mount Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51599, 00000, "Diagnose mount failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51600, 00000, "ASM disk number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51601, 00000, "ASM group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51602, 00000, "ASM Allocation Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51603, 00000, "Diagnose allocation failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51604, 00000, "ASM group name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51605, 00000, "ASM Disk Visibility Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51606, 00000, "Diagnose add disk failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51607, 00000, "ASM File Busy Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51608, 00000, "Diagnose file drop failure"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51609, 00000, "ASM path name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
/
51610, 00000, "Tablespace Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51611, 00000, "Checks a tablespace"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51613, 00000, "Tablespace number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Parameter description 
51614, 00000, "Mount CF Check"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check name 
/
51615, 00000, "Checks control file in mount mode"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51616, 00000, "Checks mount failed because there were too many offline disks"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51617, 00000, "Diagnose mount failed because there were too many offline disks"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51618, 00000, "ASM disk number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51619, 00000, "ASM group number"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51620, 00000, "Checks mount failed because there were insufficient disks"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51621, 00000, "Diagnose mount failed because there were insufficient disks"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51622, 00000, "ASM group name"
// *Document: NO
// *Cause:  
// *Action: 
// *Comment: Check description 
/
51623, 00000, "Failover Check"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Check name
/
51624, 00000, "Check if failover has happened"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Check description
/
51625, 00000, "Memory allocation check"
// *Document: NO
// *Cause:
// *Action:
// *Comment: check name
51626, 00000, "Check to adjust memory on allocation failure"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Check description
/
51627, 00000, "ASM memory size"
// *Document: NO
// *Cause: 
// *Action:  
// *Comment: Parameter description
/
51628, 00000, "ASM diskgroup was forcibly dismounted (no diskgroup name) check"
// *Document: NO
// *Cause:
// *Action:
// *Comment: check name
/
51629, 00000, "Check if a diskgroup (no diskgroup name) was forcibly dismounted"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Check description
/
51630, 00000, "ASM diskgroup was forcibly dismounted check"
// *Document: NO
// *Cause:
// *Action:
// *Comment: check name
/
51631, 00000, "Check if a diskgroup was forcibly dismounted"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Check description
/
51632, 00000, "ASM diskgroup name"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Parameter description
/
51633, 00000, "Checks ASM diskgroup synchronous I/O operation failed"
// *Document: NO
// *Cause:
// *Action:
// *Comment: check name
/
51634, 00000, "Diagnose ASM diskgroup synchronous I/O operation failed"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Check description
/
51635, 00000, "ASM Synchronous I/O event type"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Parameter description
/
51636, 00000, "ASM Synchronous I/O block number"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Parameter description
/
51637, 00000, "ASM disk number"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Parameter description
/
51638, 00000, "ASM diskgroup name"
// *Document: NO
// *Cause:
// *Action:
// *Comment: Parameter description
/
/////////////////////////////////////////////////////////////////////////////
/ 51700 - 51749 for Report Framework (dbgx)
/////////////////////////////////////////////////////////////////////////////
51700, 00000, "Invalid file URL"
// *Cause:  A URL with invalid syntax was provided, either directly to the
//          function or through an XML IMPORT or INCLUDE.
// *Action: Check the URL.
/
51701, 00000, "Invalid file URL or path prefix"
// *Cause:  Either a URL or path prefix with invalid syntax was provided.
// *Action: Check the URL.
/
51702, 00000, "Could not find file at URL provided"
// *Cause:  The file requested could not be found in the given location.
// *Action: Check the URL provided.
/
51703, 00000, "Missing <body> tag from HTML"
// *Cause:  An HTML document was passed to the function missing its <body>
//          tag.
// *Action: Check the HTML source.
/
51704, 00000, "Error %s received from XPath engine"
// *Cause:  An error was received from the XPath library during an XPath
//          operation.
// *Action: Check xmlerr.h to understand the cause of the error and correct
//          the relevant client code.
/
51705, 00000, "XML %s error: %s \"%s\""
// *Cause:  An error was received from an underlying XDK API and is being
//          resignalled.
// *Action: Check xmlerr.h to understand the cause of the error and correct
//          the relevant client code.
/
