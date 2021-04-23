/ Copyright (c) 2013, 2018, Oracle and/or its affiliates. All rights reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsuus.msg
/ DESCRIPTION
/   Message file for cross-component messages
/ NOTES
/   This file is intended for messages used in multiple components and
/   so inappropriate for a component-specific file.  It was created for
/   the slos formatting messages introduced in CLSU.  Other sets of
/   messages can be added if desired--carve out a range for them below.
/
/   We would have used clsdus.msg for these messages, but bug 6054661
/   makes it best to avoid that file for now.  Depending on how that
/   bug is fixed, this file might be merged into another (e.g. crsus.msg)
/   in the future.
/
/   Source code references to these messages use the wrapper macro CLSUER(),
/   defined in cls.h.
/
/   Note to translators: The slos formatting code uses CORE LSF for
/                        data insertion to messages, so the message
/                        format items include an LSF-style index value
/                        as in (e.g.) "%(2)s".  This means you can move
/                        (re-order) the format items as necessary for
/                        translation.
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   femorale    10/24/16  - Bug 6869121 Adding new message for 
/                           CLSU_SLOSMSG_IDOS3
/   dbrower     07/22/13  - Add allocator errs and 600 internal error.
/   bmanry      04/05/13  - Bug 16600902 - un-index slos messages
/   dbrower     02/23/13  - 12.2 syntax errors (300-) & alloc fail (913)
/   rwessman    09/16/10  - Bug 10034334
/   bmanry      04/15/10  - leading zeros on msg nums for oerr (bug 9503096)
/   dbrower     09/04/08  - another parm for 912
/   dbrower     08/25/08  - add fatal from clsem
/   dbrower     08/05/08  - change test messages
/   dbrower     04/25/08  - some test msgs.
/   dbrower     02/25/08  - add tst message 217
/   dbrower     11/01/07  - message formatting messages
/   bmanry      08/07/07  - Add LSF argument indices and related comments
/   bmanry      06/20/07  - Created
/
/ Message number ranges:
/   0100-0199: CLSU slos formatting messages
/
/ CLSU slos formatting messages
/   These used to use LSF index notation, but the addition of function
/   clsuSlosFormatAlert requires that they be issued via clsd_malertprintft,
/   which does not use LSF.  Before removing the indices I confirmed that
/   NO translation of this file has changed the insert order of #00100
/   (the only message with more than one insert).
/   The alternative was to have a separate set of messages for use in the
/   alert log, and that seems uglier.
/
00100, 0, "operating system function: %s failed with error data: %s"
// *Cause:  A call to an Operating System dependent service or function returned
//          an error indication.  The message includes the name of the function
//          and the returned error data.  The latter varies by platform but
//          typically is numeric; on most platforms it is the value of
//          C "errno" after the failing call.
// *Action: This error normally is accompanied by other (higher-level)
//          messages describing the operation that is affected by the
//          failure.  It may also include one or more of messages 101,
//          103, and 104 providing additional error details.  All
//          of the messages should be examined to assess the error, which
//          may have a very ordinary cause and correction, such as an input
//          file failing to open because the supplied name was misspelled.
/
00101, 0, "operating system error message: %s"
// *Cause:  This message accompanies message 100 above when the Operating
//          System dependent error data can be converted into a text message.
//          On most Oracle platforms the message is a text representation of
//          the C "errno" value reported in message 100.
// *Action: See message 100.
/
00102, 0, "operating system interface detected an error"
// *Cause:  This message is issued instead of messages 100-101 when
//          a "logical" error condition (rather than failure of an Operating
//          System function call) is detected at an Operating System specific
//          interface.  The error condition is further described by accompanying
//          message(s), including 103 and 104.
// *Action: This error normally is accompanied by other (higher-level)
//          messages describing the operation that is affected by the
//          failure.  In most cases it will also include messages 103
//          and 104, providing additional details about the error.  All
//          of the messages should be examined to assess the error, which
//          may have a very ordinary cause and correction, such as a
//          missing required environment variable.
/
00103, 0, "error location: %s"
// *Cause:  This message accompanies message 100, 102, or 105 and
//          identifies a location in Oracle program code that encountered
//          the error.
// *Action: See message 100, 102, or 105.  This information normally is
//          useful only when reporting the error condition to Oracle as a
//          potential code bug.
/
00104, 0, "additional error information: %s"
// *Cause:  This message accompanies message 100, 102, or 105 and
//          supplies additional information related to the error
//          condition.  A single error may include multiple lines of
//          additional information.
// *Action: See message 100, 102, or 105.
/
00105, 0, "operating system interface has reported an internal failure"
// *Cause:  This message indicates that an Operating System dependent interface
//          within Oracle code has detected internal corruption or some
//          other evidence of internal program failure.
// *Action: This message may be accompanied by other (higher-level)
//          messages indicating the product operation that was affected
//          by the failure.  It may also be accompanied by either or
//          both of messages 103 and 104.  All situations reporting
//          this condition should be referred to Oracle Support for
//          resolution.
/
00106, 0, "An improper operating system error display was attempted"
// *Cause:  During processing of an error condition, an attempt was made
//          to format or display Operating System dependent error data, but
//          the error data structure was found to indicate "no error".
// *Action: This error should be reported to Oracle Support for resolution.
/
00107, 0, "operating system function: %s; failed with error data: %s; at location: %s"
// *Cause:  A call to an operating system-dependent service or function returned
//          an error. The message includes the name of the function, the
//          returned error data, and error location. Error data varies by
//          platform but typically is numeric. On most platforms, it is the
//          value of C "errno" after the failing call.
// *Action: This error is normally accompanied by other (higher-level) messages
//          describing the operation that is affected by the failure. It can
//          also include one or more of messages 101 and 104 providing
//          additional error details. All of the messages should be examined to
//          assess the error, which may have a very ordinary cause and
//          correction, such as an input file failing to open because the
//          supplied name was misspelled.

00110, 0, "The program failed to allocate %(1)s bytes of memory at location %(2)s."
// *Cause:  An attempt to allocate memory failed unexpectedly.  Either
//          there was not enough memory or there was no memory available
//          at all.
// *Action: Contact Oracle Support Services.   

00111, 0, "The program attempted to free a NULL pointer at location %(1)s."
// *Cause:  The program tried to free a NULL pointer.
// *Action: Contact Oracle Support Services.   

00200, 0, "**** Error stack contains %d records, newest first:\n"
// *Cause:  The collection of errors about to be presented contains this
//          many following records.
// *Action:  This and the following data should be reported to Oracle Support
//           for resolution.

00201, 0, "**** Error stack end ****\n"
// *Cause:  This marks the end of a collection of errors
// *Action:  The preceding data should be reported to Oracle Support
//           for resolution.

00210, 0, "CLSUUS test msg 0"
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00211, 0, "CLSUUS test msg 1:%s"
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00212, 0, "CLSUUS test msg 2:%s 2:%s"
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00213, 0, "CLSUUS test msg 3:%s 2:%s 3:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00214, 0, "CLSUUS test msg 4:%s 2:%s 3:%s 4:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00215, 0, "CLSUUS test msg 5:%s 2:%s 3:%s 4:%s 5:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00216, 0, "CLSUUS test msg 6:%s 2:%s 3:%s 4:%s 5:%s 6:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00217, 0, "CLSUUS test msg 7:%s 2:%s 3:%s 4:%s 5:%s 6:%s 7:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00218, 0, "CLSUUS test msg 8:%s 2:%s 3:%s 4:%s 5:%s 6:%s 7:%s 8:%s" 
// *Cause:  A message for testing, should never be seen in the field.
// *Action: Report to Oracle Support.

00220, 1, "clsem FATAL exception: %s"
// *Cause:  Something unrecoverable happened in CLSEM.
// *Action:  Report to Oracle Support.

00221, 1, "ERROR printed by clsecho: %s"
// *Cause:  An error printed by clsecho
// *Action:  Report to Oracle Support.

00222, 2, "WARNING printed by clsecho: %s"
// *Cause:  A warning
// *Action:  Note the text

00223, 3, "Info printed by clsecho: %s"
// *Cause:  Information printed by clsecho
// *Action:  Report to Oracle Support.


/
/  300 - 400 - fairly generic, self explanatory syntax errors
/   
00300, 0, "Syntax error: expected token %(1)s at marker \"%(2)s\" in source \"%(3)s\""
// *Cause:    The source string had an unexpected value at the marked location.
// *Action:   Provide a string with correct syntax.

00301, 0, "Syntax error: unexpected token %(1)s at marker \"%(2)s\" in source \"%(3)s\""
// *Cause:    The source string had an incorrect value at the marked location.
// *Action:   Provide a string with correct syntax.

00302, 0, "Syntax error: unterminated quote in source \"%(1)s\""
// *Cause:    The source string lacked a closing quote.
// *Action:   Provide a string with correct syntax.

/
/
/
00600, 0, "Internal Error [%(1)s] [%(2)s] [%(3)s] [%(4)s] [%(5)s]"
// *Cause:  An unexpected error occurred.
// *Action: Contact Oracle Support Services. 

/
/ 900-1000 - generic exception and/or system problems.
/   

00910, 0, "Named exception %(1)s %(2)s %(3)s %(4)s"
// *Cause: An exception was used that did not have a message ID.
// *Action: Contact Oracle Support Services.   
// note - obsolescent, should never be seen.

00911, 0, "The program received signal %s."
// *Cause:  The program received an operating system signal reported as an exception.
// *Action: Contact Oracle Support Services.   
// note - obsolescent, should never be seen.

00912, 0, "An error was received from an operating system API:\n%s"
// *Cause:  One or more operating system-specific errors were noticed.
// *Action: Contact Oracle Support Services.   

00913, 0, "The program failed to allocate %(1)s bytes."
// *Cause:  An attempt to allocate memory failed.
// *Action: Contact Oracle Support Services.   

00914, 0, "The buffer of length %(1)s is too short for the operation."
// *Cause:  Either a buffer was too short, or a value was too long for 
//          the buffer.
// *Action: Contact Oracle Support Services.   

00915, 1, "failed to locate device driver '%(1)s'"
// *Cause: The device driver has not been ported to this operating system.
// *Action: Contact Oracle Support Services.
