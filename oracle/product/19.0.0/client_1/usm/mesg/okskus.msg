/* Copyright (c) 2009, 2018, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   okskus.msg
/ DESCRIPTION
/   Message file for OKS commands
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   mkeller         12/27/17  - 27284286: Add 45+46.
/   mkeller         04/14/17  - 25882568: Modify 39, 41 & 42 causes
/   mkeller         11/25/16  - Add 41-44.
/   mkeller         10/28/16  - Add 39 and 40.
/   vyerrams        07/05/16  - Bug 23706792: Tag "Rebuild Master" on to 
/                               OKS_MEMBERSHIP_NODE_COUNT
/   madoming        06/02/16  - Add new messages for Kernel thread size   
/   mkeller         12/12/15  - HM warning message spans multiple lines.
/                               22151638 Add OfsVolNum to HM
/                               22270695 Indicate if a lock is blocking or if
/                               it is already held.
/                               22288862 Indicate the thread name
/                               22288850 Indicate the last removed record
/   mkeller         06/25/15  - 21296690 - HANG MANAGER: ENABLE WINDOWS
/   mkeller         03/17/15 -  bug-20593706 Hang detection improvements.
/   mkeller         02/10/15  - Bug-20437676 Enable HM on Linux. Add msg 33.
/   vyerrams        01/30/15  - Bug 20182031: Add a new arg to
/                               OKS_MEMBERSHIP_NODE_NAMES for printing hostname
/   vyerrams        11/19/14  - Bug 20020193: Split OKS_LOG_BUFFER_FAILED
/                               into OKS_LOG_BUFFER_ALLOCATE_FAILED and
/                               OKS_LOG_BUFFER_EXTEND_FAILED
/   vyerrams        11/13/14  - Bug 17328208: Add OKS_ACTIVE_THREAD_COUNT
/   averhuls        06/19/14  - Add OKS_PLOG_EXIT_ERROR.
/   bonelso         11/29/12  - fix some parameter identifiers
/   averhuls        07/09/12  - change 010 from 'warning' to 'info'.
/   averhuls        12/12/11  - Minor change to OKS_PLOG_WRITE_FAILURE.
/   bonelso         11/07/11  - Fix a typo.
/   bonelso         09/29/11  - Coverted some KsPrint()s to KsMSgIssue()s
/   averhuls        04/13/11  - Add persistent log messages.
/   anjiwaji        08/30/10  - Add extra kernel messages
/   jeabraha        09/14/09  - Created
/
/ Windows (only as far as I can tell) uses the second msg field as follows
/   Success       = 0x0:STATUS_SEVERITY_SUCCESS
/   Informational = 0x1:STATUS_SEVERITY_INFORMATIONAL
/   Warning       = 0x2:STATUS_SEVERITY_WARNING
/   Error         = 0x3:STATUS_SEVERITY_ERROR
/
// WINFACILITY=Oracle_OKS
// WINFACNUM=0x8
// MSGPREFIX=OKSK
//
/ The next several messages are generic. You can supply a small
/ insertion string.
/
/ WSN=OKS_SUCCESSFUL
00000, 0, "%2 %3"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_INFORMATION
00001, 1, "%2 %3"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_WARNING
00002, 2, "%2 %3"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_ERROR
00003, 3, "%2 %3"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_LOAD_OK
00004, 1,"Module load succeeded. Build information:  %2 %3 %4"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_LOAD_FAILED
00005, 3,"Module failed to load and start with status %2. Build information: %3 %4 %5"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_UNLOAD
00006, 1,"Module unloaded."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_LOG_DUMPED
00007, 1,"Information has been saved in the file %2 . Include the contents of this file if reporting a problem to Oracle."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_MEMBERSHIP_CHANGE
00008,1 ,"Cluster Membership Change starting - Incarnation %2."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_MEMBERSHIP_CHANGE_COMPLETE
00009, 1,"Cluster Membership Change complete."
// *Cause:  Informational.
/
/ WSN=OKS_PERSISTENT_LOG_FILE_OPENED
00010, 1,"Persistent OKS log opened at %2."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_PLOG_MEMORY_ALLOCATION_ERROR
00011, 2,"Failed to allocate kernel memory for %2."
// *Cause:  Unable to allocate memory for a required function.
// *Action: Contact Oracle Support Services.
/
/ WSN=OKS_PLOG_FILE_OPEN_ERROR
00012, 2,"Failed to open %2."
// *Cause:  Unable to open a persistent OKS log file. Likely an invalid file
//          path was specified or there was an internal error.
// *Action: Ensure that the file or directory exists else.
//          If it does, contact Oracle Support Services.
/
/ WSN=OKS_PLOG_TERMINATED
00013, 1,"Terminating Persistent OKS log."
// *Cause:  Persistent OKS logging terminated due to the previous message.
// *Action: Informational.
/
/ WSN=OKS_PLOG_FILENAME_ALLOCATION_ERROR
00014, 1,"Unable to generate an persistent OKS log file name."
// *Cause:  Failed to generate an persistent OKS log fime name.
// *Action: Internal error.
/
/ WSN=OKS_PLOG_THREAD_CREATE_FAILURE
00015, 1,"Persistent log thread creation failed."
// *Cause:  Failed to create a kernel thread.
// *Action: Internal error.
/
/ WSN=OKS_PLOG_CONFIG_ERROR_BUFSIZE
00016, 2,"Configuration error: buffer size %2 bytes is out of range."
// *Cause:  The user selected an invalid buffer size.
// *Action: Select a different buffer size.
/
/ WSN=OKS_PLOG_CONFIG_ERROR_TIMER
00017, 2,"Configuration error: interval timer of %2 ms is out of range."
// *Cause:  The user selected an invalid timer interval.
// *Action: Select a different timer value.
/
/ WSN=OKS_PLOG_CONFIG_ERROR_LOWWATER
00018, 2,"Configuration error: low water level of %2 bytes isout of range."
// *Cause:  The user selected an invalid low water value.
// *Action: Select a different low water value.
/
/ WSN=OKS_PLOG_CONFIG_ERROR_HIGHWATER
00019, 2,"Configuration error: high water level of %2 bytes is out of range."
// *Cause:  The user selected an invalid high water value.
// *Action: Select a different high water value.
/
/ WSN=OKS_PLOG_CONFIG_ERROR_MAXNUMFILES
00020, 2,"Configuration error: maximum number of log files (%2) is out of range."
// *Cause:  The user selected an invalid maximum file number value.
// *Action: Select a different file number value.
/
/ WSN=OKS_PLOG_CONFIG_ERROR_MAXFILESIZE
00021, 2,"Configuration error: The maximum file size of %2 bytes is out of range."
// *Cause:  The user selected an invalid maximum log file size value.
// *Action: Select a different maximum log file size value.
/
/ WSN=OKS_PLOG_WRITE_FAILURE
00022, 2,"File write error: File name '%s'."
// *Cause:  A write to the persistent OKS log file failed - possibly due to
//          a full file system. Otherwise, it is an internal error.
//          The in-memory OKS log will contain details regarding the error.
// *Action: Free up file systems space and restart the OKS persistent log
//          ('acfsutil plogconfig -d <dir>'). If freeing up file system space 
//          does not resolve the problem, contact Oracle Support Services.
/
/ WSN=OKS_MEMBERSHIP_NODES
00023,1 ,"Cluster membership node list:"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_MEMBERSHIP_NODE_NAMES
00024,1 ,"  Node %2 (Interconnect address: %3.%4.%5.%6) %7"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_MEMBERSHIP_NODE_COUNT
00025,1 ,"Cluster membership node count: %2, Local Node Number: %3, Rebuild Master: %4"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_MEMBERSHIP_REBUILD_MANAGER_FAILED
00026,1 ,"Cluster membership rebuild manager failed to initialize."
// *Cause:  Informational.
// *Action: Contact Oracle Support.
/
/ WSN=OKS_ODLM_HASH_SIZE
00027,1 ,"Oracle kernel distributed lock manager hash size is %2"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_LOG_BUFFER
00028,1 ,"In memory kernel log buffer address: %2, size: %3"
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_LOG_BUFFER_EXTEND_FAILED
00029,1 ,"Unable to extend the log buffer."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_PLOG_EXIT_ERROR
00030,1 ,"persistent OKS log buffer flush failure on OKS driver exit"
// *Cause:  The OKS driver failed to write the final log buffer to
//          disk in a timely manner. The log file may be incomplete.
// *Action: None.
/ WSN=OKS_ACTIVE_THREAD_COUNT
00031,1 ,"Number of active kernel threads in Oracle ACFS drivers at driver unload time: %2 - reboot is recommended for driver cleanup"
// *Cause:  Kernel threads in Oracle ACFS drivers should have been terminated
//          during driver unloading.  However, some of those kernel threads were
//          still active at the end of the unloading.
// *Action: Continued operation with the remaining active threads is possible.
//          However, reboot is recommended to properly cleanup driver resources.
//          For root cause analysis, a core dump should be generated.
/ WSN=OKS_LOG_BUFFER_ALLOCATE_FAILED
00032,1 ,"Unable to allocate the log buffer."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=OKS_HM_HUNG_THREAD_WARNING_FIRST
00033,2 ,"WARNING. Possible hung thread tid:%2 name:%3 pid:%4 tsd:%5 Volume Number:%6 record sequence count:%7"
// *Cause:  A potential ACFS thread hang has been detected.
//          This message is accompanied by message(s) OKSK-00034 which also
//          provides details on this warning. This message may also be
//          accompanied by other message(s) providing details on this warning.
// *Action: Contact Oracle Support Services.
/
/ WSN=OKS_HM_HUNG_THREAD_WARNING_SECOND
00034,2 , "WARNING. Possible hung thread tid:%2 total elapsed secs:%3 hang elapsed secs:%4 record cnt:%5 lock cnt:%6 function cnt:%7 last record removed:%8"
//          This message is accompanied by message(s) OKSK-00033 which also
//          provides details on this warning.  This message may also be
//          accompanied by other message(s) providing details on this warning.
// *Action: Contact Oracle Support Services.
/
/ WSN=OKS_HM_TRACE_DATA
00035,2, "%2"
// *Cause:  Follow up message to OKSUS-0033 and OKSUS-0034.
// *Action: See the preceeding message 
//          Contact Oracle Support.
/
/
/ WSN=OKS_HM_HUNG_THREAD_SEE_OKS
00036,2, "Warning: A possible ACFS thread hang has been detected:%2 pid:%3 tid:%4"
// *Cause:  A potential ACFS thread hang has been detected.
// *Action: See the OKS persistent log for more detailed information describing
//          this potentially hung thread using the specified pid and tid numbers.
//          Contact Oracle Support.
/ WSN=OKS_MISMATCH_KERNEL_THREAD_SIZE
00037,3, "Module failed to load, mismatch between compiled thread size (%2) and kernel thread size (%3)."
// *Cause:  An attempt to load the OKS driver failed because the kernel thread 
//          size compiled into the driver was incompatible with the currently 
//          running kernel.
// *Action: Contact Oracle Support.
/
/ WSN=OKS_UNABLE_OPEN_PROC
00038,3, "unable to open /proc/meminfo (error %2)"
// *Cause:  An attempt to load the OKS driver failed because an attempt to open 
//          the /proc/meminfo file to ascertain the current kernel stack size 
//          failed with the indicated error.
// *Action: Ensure that the file exists and is accessible, address the indicated 
//          error and retry. If the problem persists, contact Oracle Support 
//          Services.
/

/ WSN=OKS_HM_RELATED_THREAD_WARNING_FIRST
00039,2 ,"WARNING. Possible lock contention. tid:%2 name:%3 pid:%4 tsd:%5 Volume Number:%6 record sequence count:%7"
// *Cause:  A different thread was hung and blocked on a lock that
//          this thread was holding.
//          This message is accompanied by at least 3 more messages. OKSK-00033
//          and OKSK-00034 provide information about the related hung thread.
//          OKSK-00040 provides more information about this thread.
//          Additional OKSK-00039 and OKSK-00040 messages may identify other
//          threads which held the same lock.
// *Action: Contact Oracle Support Services.
/
/ WSN=OKS_HM_RELATED_THREAD_WARNING_SECOND
00040,2 , "WARNING. Possible lock contention. tid:%2 total elapsed secs:%3 hang elapsed secs:%4 record cnt:%5 lock cnt:%6 function cnt:%7 last record removed:%8"
//          This message is accompanied by message(s) OKSK-00033 which also
//          provides details on this warning.
// *Action: Contact Oracle Support Services.

/ WSN=OKS_HM_DLM_REMOTE_HUNG_THREAD_WARNING_FIRST
00041,2 ,"WARNING. Hung thread on node %2. thread:%3 tid:%4 pid:%5 lock_id1:%6 lock_id2:%7"
// *Cause:  A remote thread was hung on a DLM lock and was blocked on a lock
//          that a local thread was holding.
//          This message describes the remote thread and its DLM lock.
//          This message is accompanied by at least 3 more messages.
//          OKSK-00042 provides more information about the remote thread
//          and its DLM lock instance.
//          OKSK-0043 and OKSK-00044 provide information about local thread(s)
//          that were holding the same DLM lock.
// *Action: Contact Oracle Support Services.

/ WSN=OKS_HM_DLM_REMOTE_HUNG_THREAD_WARNING_SECOND
00042,2 ,"WARNING. Hung thread on node %2. thread:%3 tid:%4 record_type:%5 lock_mode:%6 state:%7"
// *Cause:  A remote thread was hung on a DLM lock and was blocked on this lock
//          that a local thread was holding.
//          This message is accompanied by message OKSK-00041
//          which provides more information about this remote thread and lock.
// *Action: Contact Oracle Support Services.

/ WSN=OKS_HM_DLM_RELATED_THREAD_WARNING_FIRST
00043,2 ,"WARNING. Possible DLM lock contention. tid:%2 name:%3 pid:%4 tsd:%5 Volume Number:%6 record sequence count:%7"
// *Cause:  This message provides information about local thread(s) that might
//          have been blocking a remote DLM lock.
//          This message is accompanied by at least 3 additional messages.
//          OKSK-00044 provides additional information about the local
//          DLM lock instance.
//          OKSK-00041 and OKSK-00042 provide information about the remote
//          node's hung thread and blocked DLM lock instance.
// *Action: Contact Oracle Support Services.

/ WSN=OKS_HM_DLM_RELATED_THREAD_WARNING_SECOND
00044,2 , "WARNING. Possible DLM lock contention. tid:%2 total elapsed secs:%3 hang elapsed secs:%4 record cnt:%5 lock cnt:%6 function cnt:%7 last record removed:%8"
//          This message is accompanied by message OKSK-00043 which also
//          provides details about this warning.
// *Action: Contact Oracle Support Services.


/ WSN=OKS_HM_SYSCALL_TO_WARNING_FIRST
00045,2 ,"WARNING. syscall HM timeout. tid:%2 name:%3 pid:%4 tsd:%5 Volume Number:%6 record sequence count:%7"
// *Cause:  A potential ACFS thread hang has been detected due to a user mode
//          thread accessing USM kernel modules for too long via a single
//          instance of a system call.
//          This message is accompanied by message OKSK-00046 which also
//          provides details on this warning. This message may also be
//          accompanied by other message(s) providing details on this warning.
// *Action: Contact Oracle Support Services.
/
/ WSN=OKS_HM_SYSCALL_TO_WARNING_SECOND
00046,2 , "WARNING. syscall HM timeout. tid:%2 total elapsed secs:%3 hang elapsed secs:%4 record cnt:%5 lock cnt:%6 function cnt:%7 last record removed:%8"
//          This message is accompanied by message OKSK-00045 which also
//          provides details on this warning.  This message may also be
//          accompanied by other message(s) providing details on this warning.
// *Action: Contact Oracle Support Services.
