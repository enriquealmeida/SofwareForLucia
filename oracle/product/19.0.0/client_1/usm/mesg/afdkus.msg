/* Copyright (c) 2009, 2013, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   afdkus.msg
/ DESCRIPTION
/   Message file for AFD commands
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/    ssprasad  08/15/13 - AFD Logging support.
/    averhuls  07/09/12 - Comment second msg field.
/    shagarw   02/12/11 - Add messages for new kernel messaging system
/

/
/ Windows (only as far as I can tell) uses the second msg field as follows
/   Success       = 0x0:STATUS_SEVERITY_SUCCESS
/   Informational = 0x1:STATUS_SEVERITY_INFORMATIONAL
/   Warning       = 0x2:STATUS_SEVERITY_WARNING
/   Error         = 0x3:STATUS_SEVERITY_ERROR
/

// WINFACILITY=Oracle_AFD
// WINFACNUM=0x9
// MSGPREFIX=AFDK
//
/ The next several messages are generic. You can supply a small
/ insertion string.
/
/ WSN=AFD_SUCCESSFUL
00000, 0, "%1 %2"
/
/ WSN=AFD_DRIVER_LOAD
00001, 1, "Module load succeeded. Build information: %2 %3 %4 built on %5."
// *Cause: The AFD driver was started.
// *Action: None, this is informational.
/
/ WSN=AFD_DRIVER_LOAD_FAIL
00002, 3, "Module load failed with status %2. Build information: %3 %4 %5 built on %6."
// *Cause: There was a problem the prevented the AFD driver from loading.
// *Action: Reboot the system.If this happens again please report this error to
//          Oracle Support Services. 
/
/ WSN=AFD_DRIVER_UNLOAD
00003, 1, "Module unloaded."
// *Cause: The AFD driver was unloaded.
// *Action: None, this is informational.
/
/ WSN=AFD_INTERNAL_ERROR
00004, 3, "An internal error occurred."
// *Cause: An internal AFD error occurred.
// *Action: Report this error to Oracle Support Services.
/
/ WSN=AFD_LOG_DUMPED
00005, 1,"Information has been saved in the file %2 . Include the contents of this file if reporting a problem to Oracle."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=AFD_ERROR
00006, 3, "%1 %2"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=AFD_LOG_FILENAME_ALLOCATION_ERROR
00007, 1,"unable to generate an AFD log file name"
// *Cause:  During AFD logging, an attempt to generate
//          an AFD log file name failed.
// *Action: Contact Oracle Support Services.
/
/ WSN=AFD_LOG_TERMINATED
00008, 1,"terminating AFD logging"
// *Cause:  A previously-reported error caused AFD logging to terminate.
// *Action: Respond based on the previously-reported error.
/
/ WSN=AFD_LOG_THREAD_CREATE_FAILURE
00009, 1,"AFD log thread creation failed."
// *Cause:  During AFD Logging, an attempt to create a kernel thread failed.
// *Action: Contact Oracle Support Services.
/
/ WSN=AFD_LOG_FILE_OPENED
00010, 1,"AFD log opened at location %2."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=AFD_LOG_MEMORY_ALLOCATION_ERROR
00011, 2,"failed to allocate kernel memory (%2 bytes) for %3"
// *Cause:  Unable to allocate memory for a required AFD logging function.
// *Action: Contact Oracle Support Services.
/
/ WSN=AFD_LOG_FILE_OPEN_ERROR
00012, 2,"failed to open log file %2"
// *Cause:  An attempt to open an AFD log file failed.
// *Action: Ensure that a valid, usable log file path is specified.
//          If so, contact Oracle Support Services.
/
/ WSN=AFD_LOG_CONFIG_ERROR_BUFSIZE
00013, 2,"Configuration error: buffer size (%2 bytes) is out of range."
// *Cause:  During AFD configuration, the user specified a buffer size
//          less than 1KB or more than 128KB.
// *Action: Specify a buffer size that is in the allowed range.
/
/ WSN=AFD_LOG_CONFIG_ERROR_MAXNUMFILES
00014, 2,"Configuration error: maximum number of log files (%2) is out of range."
// *Cause:  During AFD configuration, the user specified a maximum number
//          of log files more than 10.
// *Action: Specify a maximum log file number that is in the allowed range.
/
/ WSN=AFD_LOG_CONFIG_ERROR_MAXFILESIZE
00015, 2,"Configuration error: maximum log file size (%2 bytes) is out of range."
// *Cause:  During AFD configuration, the user specified a maximum log file size
//          less than 1MB or more than 1000MB.
// *Action: Specify a maximum log file size that is in the allowed range.
/
/ WSN=AFD_LOG_CONFIG_ERROR_TIMEINT
00016, 2,"Configuration error: logging time interval (%2 seconds) is out of range."
// *Cause:  During AFD configuration, the user specified a logging time interval
//          less than 1 second or more than 50 seconds.
// *Action: Specify a logging time interval that is in the allowed range.
/
/ WSN=AFD_LOG_WRITE_FAILURE
00017, 2,"AFD log file write error: File name '%s'"
// *Cause:  A write to the AFD log file failed - possibly due to
//          a full file system. Otherwise, it is an internal error.
// *Action: 1. Free up the file system space and run 'afdtool -log -d <dir>'
//             to restart AFD logging.
//          2. Provide alternate AFD logging directory path in command
//             'afdtool -log -d <dir>' and run to restart AFD logging.
//          3. If the above does not resolve the problem,
//             contact Oracle Support Services.

