/* Copyright (c) 2011, 2016, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clsnus.msg
/ DESCRIPTION
/   Message file for the name service
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/    rwessman   09/20/16 - Bug 23744094 - improved error message #16.
/    ksrangal   02/29/16 - Added #39 and #40
/    rwessman   02/02/16 - Bug 22626381 - added specific error for failing to
/                          contact a name server.
/    rwessman   01/29/15 - Bug 20432817 - added message #38.
/    ksrangal   11/21/14 - Lrg 14063283 - Changed msg which does not require 
/                          an incident: CLSGN-227, 241, 242.
/    rwessman   10/07/14 - HA GNS: added message #37.
/    rwessman   06/12/14 - Bug 16563686 - added message #36.
/    rwessman   05/16/14 - Bug 17626439 - added argument to "bad status"
/                          message (#17)
/    rwessman   01/10/14 - LRG 10459071 - made message 4 more clear.
/    rwessman   08/26/11 - Corrected omission of GPnP errors.
/    rwessman   08/25/11 - Bug 12829967
/    rwessman   03/29/11 - CLSNS message file.
/
00000, 0, "no error"
// *Cause:  Operation was successful.
// *Action: No action needed.
/
00001, 0, "unspecified error"
// *Cause:  An unknown error occurred. This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00002, 0, "memory allocation of %(1)u bytes failed"
// *Cause:  An operation failed because it was not possible to allocate enough
//          process memory.
// *Action: If memory is low on the system, terminate other processes and/or
//          threads and try the operation again. Otherwise, this is an internal
//          error and Oracle Customer Support should be contacted.
00003, 00000, "Buffer %(1)s is too small. Required: %(2)u bytes, provided: %(3)u bytes."
// *Cause:  An operation failed because the buffer supplied was too small.
// *Action: Retry with a buffer of the required size or more.
/
00004, 00000, "length of value \"%(1)s\": %(2)u exceeds maximum: %(3)u"
// *Cause:  The value specified exceeds the maximum allowed.
// *Action: Specify a shorter value. This error can occur when creating a TXT
//          record. If it occurs in another context, it is an internal error.
//          In that case, contact Oracle Customer Support and provide details
//          about how and when the error occurred
/
00005, 00000, "operation timed out"
// *Cause:  A name resolution operation took too long to complete.
// *Action: This can happen on a heavily loaded system, for example. Retry the
//          operation a few more times. If it still does not succeed, contact
//          Oracle Customer Support and provide details about how and when the
//          error occurred.
/
00006, 00000, "duplicate object"
// *Cause:  An operation failed because specified object already exists.
// *Action: Specify an object name that does not already exist.
/
00007, 00000, "object not found"
// *Cause:  An operation failed because the specified object was not found.
// *Action: Specify a valid object name which is alrady registered with name
//          server.
/
00008, 00000, "invalid argument: %s"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00009, 00000, "invalid context"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00010, 00000, "invalid DNS message received"
// *Cause:  An operation failed because invalid DNS message received.
// *Action: Examine the accompanying error messages for more information.
/
00011, 00000, "corrupt list"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00012, 00000, "corrupt record"
// *Cause:  An operation failed because a corrupted or malformed record was 
//          found.
// *Action: Examine the accompanying error messages for more information.
/
00013, 00000, "invalid property"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00014, 00000, "invalid operation code"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00015, 00000, "invalid record type: %(1)u"
// *Cause:  An operation failed because an invalid record type was supplied.
// *Action: Specify a valid record type and try the operation again.
/
00016, 00000, "invalid flags: 0x%(1)x"
// *Cause:  An internal interface was passed an invalid argument. This is an
//          internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00017, 00000, "invalid status: %(1)u"
// *Cause:  A DNS message was received whose status is not known.
// *Action: If this is a response, the name server may be incorrectly
//          configured and the response should be ignored. If this is a query,
//          it is an internal error. Contact Oracle Support Services and
//          provide details about how and when the error occurred.
/
00018, 00000, "invalid section: %(1)u"
// *Cause:  This is an internal error.
// *Action: Contact Oracle Customer Support and provide details about how and
//          when the error occurred.
/
00019, 00000, "communications failure"
// *Cause:  It was not possible to contact a naming service.
// *Action: Examine the accompanying errors to determine what the cause may be.
/
00020, 00000, "DNS configuration retrieval failed"
// *Cause:  Retrieval of configuration information failed.
// *Action: Examine any accompanying errors and logs for more information.
/
00021, 00000, "permission denied"
// *Cause:  An operation failed because the user did not have the necessary
//          permissions.
// *Action: Examine any accompanying errors and logs for more information.
/
00022, 00000, "credential retrieval failure"
// *Cause:  An operation failed because the user did not have the necessary
//          credentials.
// *Action: Examine any accompanying errors and logs for more information.
/
00023, 00000, "connection to GNS failed"
// *Cause:  The connection to the GNS server failed.
// *Action: Examine the accompanying errors for more information about the
//          error.
/
00024, 00000, "unable to initialize GNS"
// *Cause:  It was not possible to initialize the GNS server for the cluster.
// *Action: Determine if GNS is running. If it is not, ask the administrator to
//          start it. If GNS is running, it is an error and Oracle Customer
//          Support should be contacted with the details of the error.
/
00025, 00000, "unable to locate GNS"
// *Cause:  It was not possible to locate the GNS server for the cluster.
// *Action: Determine if GNS is running. If it is not, ask the administrator to
//          start it. If GNS is running, it is an error and Oracle Customer
//          Support should be contacted with the details of the error.
/
00026, 00000, "failed to resolve name with GNS"
// *Cause:  It was not possible to resolve a name with GNS.
// *Action: Examine the accompanying errors for details. If the name is indeed
//          advertised with GNS, please contact Oracle Customer Support.
/
00027, 00000, "operation is unsupported"
// *Cause:  The specified operation is not supported.
// *Action: This is an internally-visible error and should not ordinarily be
//          seen by users. Contact Oracle Customer Support and provide details
//          about how and when the error occurred.
/
00028, 00000, "no space for record in message"
// *Cause: Not enough space exists in a DNS message for a record.
// *Action: This is an internally-visible error and should not ordinarily be
//          seen by users. Contact Oracle Customer Support and provide details
//          about how and when the error occurred.
/
00029, 00000, "advertisement of name \"%(1)s\" failed"
// *Cause:  Advertisement of the records attached to specified name failed.
// *Action: Examine the accompanying error messages for more information.
/
00030, 00000, "deletion of name \"%(1)s\" failed"
// *Cause:  Deletion of the records attached to the pecified name failed.
// *Action: Examine the accompanying error messages for more information.
/
00031, 00000, "refresh of name \"%(1)s\" failed"
// *Cause:  Refresh of the records attached to the specified name failed.
// *Action: Examine the accompanying error messages for more information.
/
00032, 00000, "retrieval of GPnP profile failed"
// *Cause: The retrieval of the Grid Plug and Play profile failed.
// *Action: See the accompanying error messages for more information.
/
00033, 00000, "initialization of GPnP failed"
// *Cause: The initialization of Grid Plug and Play failed.
// *Action: See the accompanying error messages for more information.
/
00034, 00000, "number of retries exceeeded maximum: %(1)u"
// *Cause:  The retries allotted for an operation exceeded the maximum.
// *Action: Check to see if the name service being used is functioning
//          correctly.
/
00035, 00000, "Invalid IP address: %(1)s"
// *Cause:  GNS discovery address was not in IPv4 nor IPv6 format.
// *Action: Specify an address using IPv4 or IPv6 format.
/
00036, 00000, "domain \"%(1)s\" not found"
// *Cause:   A query for information about the specified instance failed
//           because the instance could not be found in the Domain Name System
//          (DNS).
// *Action:  Specify the name of an instance that exists in DNS.
/
00037, 00000, "Signature verification failed."
// *Cause:  The verification of the signature attached to a record failed.
// *Action: This error should not be seen ordinarily. If it appears, contact
//          Oracle Customer Service and provide details about how and when the
//          error occurred.
/
00038, 00000, "GNS has not been configured."
// *Cause:  A service advertisement or location failed because the Grid Naming
//          Service (GNS) had not been configured.
// *Action: Configure GNS and retry the operation.
/
00039, 00000, "failed to initialize OCR"
// *Cause:  An internal operation invoked an API which attempted to initialize
//          the Oracle Cluster Registry (OCR) and encountered an error.  
//          Accompanying error messages provide additional failure detail.
// *Action: Examine the accompanying error messages for more information,
//          resolve issues raised and retry the operation.
/
00040, 00000, "failed to retrieve the old cluster names"
// *Cause:  An internal API attempted to retrieve an old cluster names from 
//          Oracle cluster registry (OCR) and encountered an error. OCR 
//          unavailability could be the potential cause of this error. 
//          Accompanying error messages provide additional failure detail.
// *Action: Examine the accompanying error messages for more information,
//          resolve issues raised and retry the operation.
/
00041, 00000, "failure to contact name servers %(1)s"
// *Cause:  The resolution of a name or service failed because none of the
//          configured name servers could be contacted.
// *Action: Examine the accompanying messages for more information about the
//          problem, correct any issues found and retry the operation. If the
//          Grid Naming Service (GNS) is the name server, use the command
//          'srvctl status gns' to check that it is running.
/
