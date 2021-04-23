/ Copyright (c) 2013, 2015, Oracle and/or its affiliates. All rights reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clswsus.msg
/ DESCRIPTION
/   Message file for CLSWS web services.
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   dbrower     11/ 7/14 -  created
/
/
/ Message number ranges:
/   0-99    : invalid
/   0100-999: HTTP error codes
/   1000-2000: clsws program errors.
/
/
/ These are HTTP codes and DO NOT NEED TO BE TRANSLATED
/   
00100, 0, "HTTP CONTINUE"
00200, 0, "HTTP OK"
00201, 0, "HTTP CREATED"
00202, 0, "HTTP ACCEPTED"
00400, 0, "HTTP BAD_REQUEST"
00401, 0, "HTTP BAD_USER"
00403, 0, "HTTP FORBIDDEN"
00404, 0, "HTTP NOTFOUND"
00405, 0, "HTTP BAD_METHOD"
00406, 0, "HTTP CANT_ANSWER"
00409, 0, "HTTP CONFLICT"
00410, 0, "HTTP GONE"
00412, 0, "HTTP PRECOND_FAIL"
00500, 0, "HTTP INTERNAL"
00501, 0, "HTTP NOT_IMPL"
00503, 0, "HTTP SVC_UNAVAIL"

/ These are clsws messages, SHOULD be translated.

01001, 0,  "URL '%s' HTTP method %s"
// *Cause: The program is making an HTTP requeest as shown.
// *Action:  None.

01002, 0,  "The %s of size %s is bigger than the limit %s."
// *Cause:  Either the program was in error, or it was being asked to handle
//          more data than was considered reasonable.
// *Action: If the size is reasonable, contact Oracle Support Services.

01003, 0,  "The specified option '%s' is not recognized."
//* *Cause:  An option not recognized was given to the program.
//* *Action: Provide only valid options.  Consult -h help.

01004, 0,  "An invalid value %s was given for option '%s'."
// *Cause: The value given is not valid for the option.
// *Action: Provide a valid value for the option.   

01005, 0,  "The URL is invalid: '%(1)s'."
// *Cause:  The URL provided is invalid in some way.
// *Action: Provide a valid URL.

01006, 0,  "A bad user:pass string was provided.  It had no colon."
// *Cause:  The string given for a "user:password" didn't have the separating colon.
// *Action: Provide a string with a colon separated user and password.

01007, 0,  "The program received an HTTP client error, code %(1)s (%(2)s) from '%(3)s'."
// *Cause:  An error was detected in the HTTP exchange.
// *Action: Determine if there is a client, network, or server problem.   

01008, 0,  "The program was given a malformed HTTP header, '%s'."
// *Cause:  The program was given an invalid HTTP header.
// *Action: If possible, complain to the sender.

01009, 0,  "No 'user:pass' was provided for authentication."
// *Cause:  The operation required a "user:password" string, but none
//	    was given.
// *Action: Provide the needed "user:password" value.

01010, 0,  "An incorrect value '%s' was given for argument '%s'."
// *Cause:  Internal Error.
// *Action: Contact Oracle Support Services.

01011, 0,  "The program got a network client error %s (%s) from location '%s'."
// *Cause:  There was a network error in the operation.
// *Action: If possible, resolve the network or server failure.

01012, 0,  "The program found an invalid value '%s' instead of the expected '%s' for argument '%s'."
// *Cause:  Internal Error
// *Action: Contact Oracle Support Services

01013, 0,  "There was no Oracle Wallet provided for use by SSL or TLS."
// *Cause:  The program needed an Oracle Wallet to use for secure
//	    network operation, but none was provided.
// *Action: Provide a valid Oracle Wallet for the operation.

01014, 0,  "The provided Oracle Wallet was invalid for use by SSL or TLS."
// *Cause:  There was something wrong with the Oracle Wallet give for
//          use with secure network operation.  It may be malformed,
//          there may have been an incorrect or missing Wallet password.
// *Action  Provide a valid Oracle Wallet with the correct Wallet password.

01015, 0,  "The program had an error processing JSON, error %(1)s (%(2)s)."
// *Cause:  There was invalid JSON given, or a program error.
// *Action: If the JSON is valid, contact Oracle Support Services.  If
//	    it is not, try to contact the JSON provider.

01016, 0,  "The program experienced an error making a network connection."
// *Cause:  The address and port may be wrong, or the server may be down.
// *Action: Verify the address information is correct, and check if the server
//          is operating properly.

01017, 0,  "The program received an unexpected response from the server."
// *Cause:  The response did not contain something the program
//	    expected to receive.
// *Action: Contact Oracle Support Services.

01018, 0,  "The operation did not succeed, and no error data was collected."
// *Cause:  Internal program error.
// *Action: Contact Oracle Support Services. 

