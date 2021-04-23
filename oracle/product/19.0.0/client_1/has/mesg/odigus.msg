/* Copyright (c) 2010, 2015, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   odigus.msg
/ DESCRIPTION
/   Message file for Oracle DIG command.
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/    rwessman   02/03/15 - Bug 20361448 - added support for DNSSEC.
/    rwessman   08/05/14 - Bug 19330420 - added messages for failure to get GNS
/                          data.
/    rwessman   06/11/14 - Bug 16563686 - added "-instance option
/    rwessman   05/23/14 - converted value quotations to use single quotes to
/                          conform with standard.
/    rwessman   05/16/14 - Bug 18730586
/    rwessman   04/10/14 - Bug 17626439 - added retry messages.
/    rwessman   03/04/13 - Fixed usage message.
/    rwessman   03/04/13 - made case for option messages consistent.
/    rwessman   03/04/13 - Added "-search" option.
/    rwessman   02/13/13 - Added messages to fix bugs in displaying records.
/    rwessman   01/28/13 - Fixed message #5.
/

00000, 0, "No error."
// *Cause:  Operation was successful.
// *Action: No action needed.
/
00001, 0, "no value specified for option '%(1)s'"
// *Cause:  No value was specified for an option.
// *Action: Specify a value.
/
00002, 0, "invalid argument: '%(1)s'"
// *Cause:  An invalid argument was specified.
// *Action: Specify a valid argument.
/
00003, 0, "invalid option: '%(1)s'"
// *Cause:  An invalid option was specified.
// *Action: Specify a valid option.
/
00004, 0, "invalid value specified for option '%(1)s': '%(2)s'"
// *Cause:  The value specified for an option was not the expected type.
// *Action: Specify a valid value.
/
00005, 0, "Invalid query type: '%(1)s'. Supported types: %(2)s."
// *Cause:  The type of query is invalid.
// *Action: Specify a valid query type.
/
00006, 00000, "Usage: %(1)s [%(2)s] [%(3)s] [%(4)s] [%(5)s <name_server>] [%(6)s] [%(7)s] [%(8)s] [%(9)s <record_type>] [%(10)s <log_level>] [%(11)s <wait_time>] [%(12)s <port_number>] [%(13)s <max_retries>] [%(14)s] <name>\n"
// *Document: NO
/
00007, 00000, "thread spawn failed."
// *Cause: The spawn of a thread used for a query failed.
// *Action: This error should not be seen in ordinary use. Contact Oracle
//          Customer Support if it appears.
/
00008, 00000, "invalid server address or name '%(1)s': %(2)s"
// *Cause:  The address or name specified for the DNS server was not valid.
// *Action: Specify a valid DNS name. See RFC 1034 for details.
/
00009, 00000, "No name specified."
// *Cause:  A name was not specified to be queried for.
// *Action: Specify a name.
/
00010, 00000, "Internal error: %(1)s"
// *Cause:  An unexpected error occurred.
// *Action: Contact Oracle Support Services.
/
00011, 0, "Invalid value specified for option '%(1)s': %(2)d"
// *Cause:  The value specified for the option must be greater than zero.
// *Action: Specify a valid value.
/
00012, 00000, "failed to get the name of the GNS domain"
// *Cause:  An error occurred when trying to get the name of the Grid Naming
//          Service (GNS) domain.
// *Action: Examine the accompanying error messages for further information
//          about the error.
00013, 00000, "Options '%(1)s' and '%(2)s' are incompatible."
// *Cause:  A query specified both the the DNSSEC option and the DNS query
//          option, which is not allowed.
// *Action: Specify either the DNSSEC option or the DNS query option, but not
//          both.
/
00100, 00000, "get help for this command"
// *Document: NO
/
00101, 00000, "fully-qualified name or address of the name server"
// *Document: NO
/
00102, 00000, "type of record to be queried for [%(1)s]"
// *Document: NO
/
00103, 00000, "log level [%(1)s]"
// *Document: NO
/
00104, 00000, "maximum time (seconds) to wait for a name server response. [%(1)s]"
// *Document: NO
/
00105, 00000, "number of requests to send to the name server at one time. [%(1)s]"
// *Document: NO
/
00106, 00000, "port number to use to send requests to the name server. [%(1)s]"
// *Document: NO
/
00107, 00000, "IP address of the name server to use."
// *Document: NO
/
00108, 00000, "Options. Default values are in []:"
// *Document: NO
/
00109, 00000, "supported query types:"
// *Document: NO
/
00110, 00000, "run in verbose mode"
// *Document: NO
/
00111, 00000, "produce terse output"
// *Document: NO
/
00112, 00000, "query DNS rather than GNS"
// *Document: NO
/
00113, 00000, "display the version of the program"
// *Document: NO
/
00114, 00000, "maximum number of times that a query will be attempted [%s]"
// *Document: NO
/
00115, 00000, "use the system search path for DNS queries"
// *Document: NO
/
00116, 00000, "find the instance information for GNS in DNS"
// *Document: NO
/
00117, 00000, "disable recursion in queries"
// *Document: NO
/
00118, 00000, "enable DNSSEC in queries"
// *Document: NO
/
19988, 00000, "Service: %(1)s\n"
// *Document: NO
/
19989, 00000, " Domain: %(1)s"
// *Document: NO
/
19990, 00000, " Address: %(1)s\n"
// *Document: NO
/
19991, 00000, "Used: %(1)s Flags: 0x%(2)02x%(3)02x\n"
// *Document: NO
/
19992, 00000, "  Data: %(1)s\n"
// *Document: NO
/
19993, 00000, "  Operating system: %(1)s\n"
// *Document: NO
/
19994, 00000, "  Hardware: %(1)s\n"
// *Document: NO
/
19995, 00000, "  Address: %(1)s\n"
// *Document: NO
/
19996, 00000, "  Port: %(1)s\n"
// *Document: NO
/
19997, 00000, "  Priority: %(1)s\n"
// *Document: NO
/
19998, 00000, "  Target: %(1)s\n"
// *Document: NO
/
19999, 00000, "  Weight: %(1)s\n"
// *Document: NO
/
20000, 00000, "Server: %(1)s"
// *Document: NO
/
20001, 00000, "%(1)s: %(2)s Message ID: %(3)u\n"
// *Document: NO
/
20002, 00000, "Questions: %(1)s Answers: %(2)s Authority records: %(3)s Additional records: %(4)s\n"
// *Document: NO
/
20003, 00000, "Query: Type: %(1)s Name: %(2)s\n"
// *Document: NO
/
20004, 00000, "  Refresh interval: %(1)s\n"
// *Document: NO
/
20005, 00000, "  RR: %(1)s\n"
// *Document: NO
/
20006, 00000, "Name: %(1)s\n"
// *Document: NO
/
20007, 00000, "  Time to live: %(1)s\n"
// *Document: NO
/
20008, 00000, "  Record type: %(1)s\n"
// *Document: NO
/
20010, 00000, "\nNo section ID\n"
// *Document: NO
/
20011, 00000, "\nQuestion Section:\n"
// *Document: NO
/
20012, 00000, "\nAnswer Section:\n"
// *Document: NO
/
20013, 00000, "\nAuthority Section:\n"
// *Document: NO
/
20014, 00000, "\nAdditional Section:\n"
// *Document: NO
/
20015, 00000, "Class"
// *Document: NO
/
20016, 00000, "  Expiration: %(1)s\n"
// *Document: NO
/
20017, 00000, "  Mail domain: %(1)s\n"
// *Document: NO
/
20018, 00000, "  Minimum: %(1)s\n"
// *Document: NO
/
// 20019, 00000, OBSOLETE
// *Document: NO
/
20020, 00000, "  Name server: %(1)s\n"
// *Document: NO
/
// 20021, 00000, OBSOLETE
// *Document: NO
/
// 20022, 00000, OBSOLETE
// *Document: NO
/
// 20023, 00000, OBSOLETE
// *Document: NO
/
20024, 00000, "  Retry interval: %(1)s\n"
// *Document: NO
/
// 20025, 00000, OBSOLETE
// *Document: NO
/
20026, 00000, "  Serial number: %(1)s\n"
// *Document: NO
/
// 20027, 00000, OBSOLETE
// *Document: NO
/
// 20028, 00000, OBSOLETE
// *Document: NO
/
// 20029, 00000, OBSOLETE
// *Document: NO
/

// Status of an operation - see RFC 2136 for more information.
20030, 00000, "Success"
// *Document: NO
/
20031, 00000, "Message format not recognized"
// *Document: NO
/
20032, 00000, "Server failed"
// *Document: NO
/
20033, 00000, "Name or domain not found"
// *Document: NO
/
20034, 00000, "Operation not implemented"
// *Document: NO
/
20035, 00000, "Operation refused by server"
// *Document: NO
/
20036, 00000, "Name exists but should not"
// *Document: NO
/
20037, 00000, "Resource record exists but should not"
// *Document: NO
/
20038, 00000, "Non-authoritative server"
// *Document: NO
/
20039, 00000, "Invalid zone"
// *Document: NO
/
20040, 00000, "Unknown message status"
// *Document: NO
/
20041, 00000, "Response"
// *Document: NO
/
20042, 00000, "Query"
// *Document: NO
/
20043, 00000, "Standard query"
// *Document: NO
/
20044, 00000, "Inverse query"
// *Document: NO
/
20045, 00000, "Status"
// *Document: NO
/
20046, 00000, "Notify"
// *Document: NO
/
20047, 00000, "Update"
// *Document: NO
/
20048, 00000, "Version %(1)s."
// *Document: NO
/
20049, 00000, "Invalid query type (%(1)u)"
// *Document: NO
/
20050, 00000, "No records found\n"
// *Document: NO
/
20051, 00000, "Number of records found: %s\n"
// *Document: NO
/
20052, 00000, "Attempt %(1)s of %(2)s: sending query - will wait %(3)s milliseconds for a response.\n"
// *Document: NO
// *Cause:  
// *Action:  
/
20053, 00000, "Attempt %(1)s of %(2)s: query succeeded.\n"
// *Document: NO
// *Cause:  
// *Action:  
/
20054, 00000, "Attempt %(1)s of %(2)s: query failed: %(3)s.\n"
// *Document: NO
// *Cause:  
// *Action:  
/
20055, 00000, "Attempt %(1)s of %(2)s: query failed: %(3)s - no retry will be done.\n"
// *Document: NO
// *Cause:  
// *Action:  
/
20056, 00000, "Authoritative"
// *Document: NO
// *Cause:  
// *Action:  
/
20057, 00000, "Truncated"
// *Document: NO
// *Cause:  
// *Action:  
/
20058, 00000, "Recursion disabled"
// *Document: NO
// *Cause:  
// *Action:  
/
20059, 00000, "Recursion available"
// *Document: NO
// *Cause:  
// *Action:  
/
20060, 00000, "Authenticated data"
// *Document: NO
// *Cause:  
// *Action:  
/
20061, 00000, "Checking disabled"
// *Document: NO
// *Cause:  
// *Action:  
/
21000, 00000, "  Flags: %(1)s\n"
// *Document: NO
/
21001, 00000, "  Key tag: %(1)s\n"
// *Document: NO
/
21002, 00000, "  Protocol: %(1)s\n"
// *Document: NO
/
21003, 00000, "  Public key: %(1)s\n"
// *Document: NO
/
21004, 00000, "  Algorithm: %(1)s (%(2)u)\n"
// *Document: NO
/
21005, 00000, "  Digest: %(1)s\n"
// *Document: NO
/
21006, 00000, "  Digest type: %(1)s\n"
// *Document: NO
/
21007, 00000, "  Next name length: %(1)s\n"
// *Document: NO
/
21008, 00000, "  Next name: %(1)s\n"
// *Document: NO
/
21009, 00000, "  Flags: %(1)s\n"
// *Document: NO
/
21010, 00000, "  Hash algorithm: %(1)s\n"
// *Document: NO
/
21011, 00000, "  Number of iterations: %(1)s\n"
// *Document: NO
/
21012, 00000, "  Salt: %(1)s\n"
// *Document: NO
/
21013, 00000, "  Salt length: %(1)s\n"
// *Document: NO
/
21014, 00000, "  DNSSEC OK: %(1)s\n"
// *Document: NO
/
21015, 00000, "  Extended DNS version: %(1)s\n"
// *Document: NO
/
21016, 00000, "  UDP message length: %(1)s\n"
// *Document: NO
/
21017, 00000, "  Version: %(1)s\n"
// *Document: NO
/
21018, 00000, "  Number of labels: %(1)s\n"
// *Document: NO
/
21019, 00000, "  Original time to live: %(1)s\n"
// *Document: NO
/
21020, 00000, "  Signature length: %(1)s\n"
// *Document: NO
/
21021, 00000, "  Signature: %(1)s\n"
// *Document: NO
/
21022, 00000, "  Signature expiration: %(1)s\n"
// *Document: NO
/
21023, 00000, "  Signature inception: %(1)s\n"
// *Document: NO
/
21024, 00000, "  Name of signer: %(1)s\n"
// *Document: NO
/
21025, 00000, "  Record type covered: %(1)s\n"
// *Document: NO
/
21026, 00000, "  Status: %(1)s (%(2)u)\n"
// *Document: NO
/
30000, 00000, "GNS domain \"%(1)s\" not found in DNS.\n"
// *Document: NO
/
