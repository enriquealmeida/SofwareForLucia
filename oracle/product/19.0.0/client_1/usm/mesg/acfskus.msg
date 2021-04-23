/* Copyright (c) 2009, 2017, Oracle and/or its affiliates. All rights reserved.*/
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   acfskus.msg
/ DESCRIPTION
/   Message file for ACFS commands
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   crusman         10/22/17  - Bug 27006014: add 0099
/   crusman         03/08/17  - include new info in messages 0095 and 0096
/   mkeller         03/30/16  - Deprecating msg 50 by commenting out the msg
/                               broke msgs after 50. It looks like the msgs
/                               must remain sequencial in this file.  
/   certan          03/21/16  - Add 4K CU size to warning message indicating
/                               an unsupported CU size for compressed datafiles
/   mmkeller        03/15/16  - Deprecated msg 50 since it can be called from
/                               an io completion routine. 
/   crusman         10/09/15  - Add msg 97. Part of bug 22139681.
/   crusman         08/19/15  - remove carriage returns from 95
/   crusman         08/13/15  - Add msgs 95,96
/   certan          05/07/15  - Add OFS_CMPRSS_STG_WRITES_THROTTLED
/   qmcintos        11/21/14  - add msg OFS_PER_SNAP_STG_SIZE
/   amilicia        04/15/14  - Add message when storage from large file cannot
/                               be returned because no storage is available.
/                               Bug 18369619.
/   certan          03/22/13  - Add OFS_META_RETRY_MIRROR_SUCCESS messages
/   bonelso         11/29/12  - fix some parameter identifiers
/   averhuls        07/09/12  - Comment second msg field.
/   crusman         05/28/12  - modify msg OFS_SNAP_STG_SIZE
/   nagkumar        03/22/12  - Add message for Audit trail archival
/                               notifications.
/   crusman         01/12/12  - Add msg OFS_SNAP_STG_SIZE
/   averhuls        11/28/11  - Add label mismatch messages.
/   bonelso         09/29/11  - Coverted some KsPrint()s to KsMSgIssue()s
/   ethibaul        05/26/11  - 12555021: modify action text for 21
/   crusman         02/10/11  - XbranchMerge crusman_dio_part2 from st_usm_11.2
/   crusman         02/04/11  - Add OFS_CLEARED_DIRECT_OFLAG
/   jzolla          09/13/10  - Add message 0071, as part of fix for bug
/                               10069698
/   crusman         08/23/10 -  OFS_UNEXPECTED_EXCEPTION
/   nimunjal        05/18/10  - Added 0064-0069
/   crusman         11/24/09  - OFS_AIX_CFG_FAILED
/   abakst          11/10/09  - Hm..
/   abakst          10/05/09  - Add OfsInformLocalAdmin messages
/   ethibaul        09/25/08  - OfsMaxOpenFiles->AcfsMaxOpenFiles
/   sverhuls        08/18/08  - Add console messages
/   agraves         08/23/08  - Created
/
/ Windows (only as far as I can tell) uses the second msg field as follows
/   Success       = 0x0:STATUS_SEVERITY_SUCCESS
/   Informational = 0x1:STATUS_SEVERITY_INFORMATIONAL
/   Warning       = 0x2:STATUS_SEVERITY_WARNING
/   Error         = 0x3:STATUS_SEVERITY_ERROR
/

// WINFACILITY=Oracle_ACFS
// WINFACNUM=0x7
// MSGPREFIX=ACFSK
//
/ The next several messages are generic. You can supply a small
/ insertion string.
/
/ WSN=OFS_SUCCESSFUL
0000, 0, "%2 %3"
/
/ WSN=OFS_INFORMATION
0001, 1, "%2 %3"
/
/ WSN=OFS_WARNING
0002, 2, "%2 %3"
/
/ WSN=OFS_ERROR
0003, 3, "%2 %3"
/
/ WSN=OFS_CANNOT_CREATE_SMF
0004, 3, "The Security file for volume mounted at %2 cannot be created (error status %3), and so the volume cannot be used by this node." 
// *Cause:  This is not a simple disk-full condition.
// *Action:  Try mounting again and, if that fails, run acfschkdsk to fix 
//           the filesystem.
/
/ WSN=OFS_CANNOT_CREATE_SMF_DEVP
0005, 3, "The Security file for volume %2 cannot be created (error status %3), and so the volume cannot be used by this node." 
// *Cause:  This is not a simple disk-full condition.
// *Action:  Try mounting again and, if that fails, run acfschkdsk to fix 
//           the filesystem.
/
/ WSN=OFS_CANNOT_CREATE_SMF_DEVNUM
0006, 3, "The Security file for volume with device minor number %2 cannot be created (error status %3), and so the volume cannot be used by this node." 
// *Cause:  This is not a simple disk-full condition.
// *Action:  Try mounting again and, if that fails, run acfschkdsk to fix 
//           the filesystem.
/
/ WSN=OFS_CANNOT_CREATE_SMF_DISK_FULL
0007, 3, "The Security file for volume mounted at %2 cannot be created because the filesystem is full."
// *Cause: because the filesystem is full.  The volume cannot be used 
//         by this node until the Security file is successfully created.
// *Action: Either expand the storage available for this ACFS volume
//          using the "acfsutil size" command or reduce the space being used.
/
/ WSN=OFS_CANNOT_CREATE_SMF_DISK_FULL_DEVP
0008, 3, "The Security file for volume %2 cannot be created because the filesystem is full."
// *Cause: because the filesystem is full.  The volume cannot be used 
//         by this node until the Security file is successfully created.
// *Action: Either expand the storage available for this ACFS volume
//          using the "acfsutil size" command or reduce the space being used.
/
/ WSN=OFS_CANNOT_CREATE_SMF_DISK_FULL_DEVNUM
0009, 3, "The Security file for volume with device minor number %2 cannot be created because the filesystem is full."
// *Cause: because the filesystem is full.  The volume cannot be used 
//         by this node until the Security file is successfully created.
// *Action: Either expand the storage available for this ACFS volume
//          using the "acfsutil size" command or reduce the space being used.

/
/ WSN=OFS_CANNOT_CREATE_SMF_RESOURCES
0010, 3, "The Security file for volume mounted at %2 cannot be created due to insufficient memory."
// *Cause: probably due to insufficient memory, and so the filesystem
//         cannot be used at this node. 
// *Action: Try mounting again and, if that fails, run acfschkdsk to fix
//          the filesystem.
/
/ WSN=OFS_CANNOT_CREATE_SMF_RESOURCES_DEVP
0011, 3, "The Security file for volume %2 cannot be created due to insufficient memory."
// *Cause: probably due to insufficient memory, and so the filesystem
//         cannot be used at this node. 
// *Action: Try mounting again and, if that fails, run acfschkdsk to fix
//          the filesystem.
/
/ WSN=OFS_CANNOT_CREATE_SMF_RESOURCES_DEVNUM
0012, 3, "The Security file for volume with device minor number %2 cannot be created due to insufficient memory."
// *Cause: probably due to insufficient memory, and so the filesystem
//         cannot be used at this node. 
// *Action: Try mounting again and, if that fails, run acfschkdsk to fix
//          the filesystem.
/
/ WSN=OFS_CANNOT_READ_SMF
0013, 3, "The Security information for volume mounted at %2 file %3 is missing."
// *Cause: An ACL granting full access to Administrators has been
//         associated with the file.
// *Action: Modify the ACL as required.
/
/ WSN=OFS_CANNOT_READ_SMF_DEVP
0014, 3, "The Security information for volume %2 file %3 is missing."
// *Cause: An ACL granting full access to Administrators has been
//         associated with the file.
// *Action: Modify the ACL as required.
/
/ WSN=OFS_CANNOT_READ_SMF_DEVNUM
0015, 3, "The Security information for volume with device minor number %2 file %3 is missing."
// *Cause: An ACL granting full access to Administrators has been
//         associated with the file.
// *Action: Modify the ACL as required.
/
/ WSN=OFS_IOERROR_PART1
0016, 3, "(part 1 of 3) I/O failure %2 with device %3 during a %4."
/
/ WSN=OFS_IOERROR_PART2
0017, 3, "(part 2 of 3) %2 Starting offset: %3. Length of data transfer: %4 bytes."
/
/ WSN=OFS_IOERROR_PART3
0018, 3, "(part 3 of 3) Impact: %2  Object: %3  Operation Context: %4 Snapshot?: %5 AcfsObjectID: %6 .  Internal ACFS Location: %7 ."
/
/ WSN=OFS_VOLERROR_OFF
0019, 3, "Volume %2 now OFFLINE. Internal ACFS Location %3 ."
// *Cause: A problem accessing valid file system metadata was seen at a
//         critical point during processing.  All attempts to read or write
//         files will fail on this node.
// *Action: unmount and remount the file system on this node.  See the
//          ACFS Administration Guide for more information about OFFLINE
//          file systems.
/
/ WSN=OFS_VOLERROR_REC
0020, 3, "RECOVERY requested for volume %2 . Internal ACFS Location %3 ."
// *Cause: ACFS has initiated recovery for the volume.
/
/ WSN=OFS_VOLERROR_FSCK
0021, 3, "FSCK-NEEDED set for volume %2 . Internal ACFS Location %3 ."
// *Cause: A problem has been detected with the file system metadata in the
//         above volume.
// *Action: Normal operation can continue, but it is advisable to run
//          fsck/acfschkdsk in the fixer mode on the file system as soon 
//          as it is feasible to do so.  See the ACFS Administration Guide
//          for more information about FSCK-NEEDED.
/
/ WSN=OFS_MOUNT_NEEDS_FIXUP
0022, 2,"Mount for volume at %2 succeeded but there was a previous metadata error."
// *Cause: Metadata error.
// *Action: Run fsck/acfschkdsk as soon as possible.
/
/ WSN=OFS_MOUNT_NEEDS_FIXUP_DEVP
0023, 2,"Mount for volume %2 succeeded but there was a previous metadata error."
// *Cause: Metadata error.
// *Action: Run fsck/acfschkdsk as soon as possible.
/
/ WSN=OFS_MOUNT_NEEDS_FIXUP_DEVNUM
0024, 2, "Mount for volume with device minor number %2 succeeded but there was a previous metadata error."
// *Cause: Metadata error.
// *Action: Run fsck/acfschkdsk as soon as possible.
/
/ WSN=OFS_MMAP_FILE_CONFLICT
0025, 2,"On the volume mounted at %2, file %3 is memory mapped for write on this node and another node is about to modify it."
// *Cause: Concurrent sharing is not supported for mmaped files.  This may
//         result in the file contents becoming inconsistent.
// *Action: Un-mmap the file.
/
/ WSN=OFS_MMAP_FILE_CONFLICT_DEVP
0026, 2,"On the volume mounted at %2 file %3 is memory mapped for write on this node and another node is about to modify it."
// *Cause: Concurrent sharing is not supported for mmaped files.  This may
//         result in the file contents becoming inconsistent.
/
// *Action: Un-mmap the file.
/
/ WSN=OFS_MMAP_FILE_CONFLICT_DEVNUM
0027, 2,"On the volume with device minor number %2 file %3 is memory mapped for write on this node and another node is about to modify it."
// *Cause: Concurrent sharing is not supported for mmaped files.  This may
//         result in the file contents becoming inconsistent.
// *Action: Un-mmap the file.
/
/ WSN=OFS_TOO_MANY_OPEN_FILES
0028, 3,"An attempt to open a file reached the system limit for open ACFS files."
// *Cause: The number of open files was already at the system limit when
//         an attempt was made to open another file.
// *Action: This limit can be increased by changing the AcfsMaxOpenFiles
//          tuneable using the acfsutil command.
/
/ WSN=OFS_RECOVERY_OFFLINE
0029, 3,"Volume %2 is now offline"
// *Cause: See preceding messages.
// *Action: See preceding messages.
/
/ WSN=OFS_RECOVERY_ASM_INSTANCE_FAILED
0030, 3,"ASM Instance has Failed."
// *Cause: The ASM instance was either intentionally stopped or it failed.
// *Action: See ASM trace messages if this was not intentional. Restart ASM.
/
/ WSN=OFS_RECOVERY_ASM_DISKGROUP_DISMOUNT
0031, 3,"ASM Diskgroup Dismount Received"
/
/ WSN=OFS_FAILED_MOUNT
0032, 3,"Mount failed for device minor number %2 with status %3 ."
// *Cause: Mount request failed with status indicated.
// *Action: Try to mount again. If it fails again, run the file system checker
//          and try to mount again. If that fails, inform Oracle Support
//          Services.
/
/ WSN=OFS_DUMP_METADATA_ERROR_INFO
0033, 3,"Information pertaining to a metadata error has been saved in the file %2 ."
// *Cause: A metadata error was detected and relevant data was saved
//         for future examination.
// *Action: Display the file to learn which volume experienced the problem
// and then run acfschkdsk when it is feasible to do so. Include the contents
// of the mentioned file if reporting this problem to Oracle.
/
/ WSN=OFS_MMAP_SNAP_ERROR
0034, 2,"In volume mounted at %2, snapshots for memory-mapped file with file identifier %2 are no longer valid."
// *Cause:  ACFS was unable to obtain sufficient storage within the volume
//          in order to maintain the validity of the snapshot versions of this
//          file. 
// *Action: To avoid further errors of this type, either expand the storage
//          available for this ACFS volume or reduce the space being used.
//          Run the command "acfsutil info id %3" to get the pathname of the
//          file.
/
/ WSN=OFS_MMAP_SNAP_ERROR_DEVP
0035, 2,"In volume %2, snapshots for memory-mapped file with file identifier %3 are no longer valid."
// *Cause:  ACFS was unable to obtain sufficient storage within the volume
//          in order to maintain the validity of the snapshot versions of this
//          file. 
// *Action: To avoid further errors of this type, either expand the storage
//          available for this ACFS volume or reduce the space being used.
//          Run the command "acfsutil info id %3" to get the pathname of the
//          file.
/
/ WSN=OFS_MMAP_SNAP_ERROR_DEVNUM
0036, 2,"In volume with device minor number %2, snapshots for memory-mapped file with file identifier %3 are no longer valid."
// *Cause:  ACFS was unable to obtain sufficient storage within the volume
//          in order to maintain the validity of the snapshot versions of this
//          file. 
// *Action: To avoid further errors of this type, either expand the storage
//          available for this ACFS volume or reduce the space being used.
//          Run the command "acfsutil info id %3" to get the pathname of the
//          file.
/
/ WSN=OFS_LOAD_OK
0037, 1,"Module load succeeded. Build information:  %2 %3 %4"
/
/ WSN=OFS_LOAD_FAILED
0038, 3,"Module failed to load and start with status %2. Build information: %3 %4 %5"
// *Cause: The operating system could not load the ACFS driver.
// *Action: Contact Oracle Support Services if the corrective action based on
//          the status is not clear.
/
/ WSN=OFS_UNLOAD
0039, 1,"Module unloaded."
/
/ WSN=OFS_UNRECOGNIZED_VOLUME
0040, 3,"Mount failed for device minor number %2 with status %3 . Error found in superblock."
// *Cause: ACFS does not recognize a valid ACFS superblock on 
//         the indicated device.
// *Action: If there should be a valid ACFS file system on the indicated
//          device, run acfschkdsk to attempt to repair the superblock.
/
/ WSN=OFS_CLUSTER_NODE_NOT_MEMBER
0041, 3,"Mount failed for device minor number %2 with status %3. Cluster membership is not established."
// *Cause: This node is not a member of the cluster.
// *Action: Ensure ASM is up and functional.
/
/ WSN=OFS_INSUFFICIENT_RESOURCES
0042, 3,"Mount failed for device minor number %2 with status %3. Insufficient kernel resources to complete the mount."
// *Cause: The mount request failed due to a lack of operating system
//         resources. This is likely to be a transient failure.
// *Action: Try to mount again. If it fails again, inform Oracle Support
//          Services.
/
/ WSN=OFS_OPEN_ERROR
0043, 3, "Returning error from open. Too many FCBs outstanding in the system. Please retry the open."
/
/ WSN=OFS_META_RETRY_SUCCESS
0044, 2, "Metadata validation error encountered on volume mounted at %2. A read retry succeeded for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk but reading again provided valid data.
// *Action: No action required. A layer in the storage stack may be
//          malfunctioning.
/
/ WSN=OFS_META_RETRY_SUCCESS_DEVP
0045, 2, "Metadata validation error encountered on volume %2. A read retry succeeded for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk but reading again provided valid data.
// *Action: No action required. A layer in the storage stack may be
//          malfunctioning.
/
/ WSN=OFS_META_RETRY_SUCCESS_DEVNUM
0046, 2, "Metadata validation error encountered on volume with device minor number %2. A read retry succeeded for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk but reading again provided valid data.
// *Action: No action required. A layer in the storage stack may be
//          malfunctioning.
/
/ WSN=OFS_META_RETRY_FAILURE
0047, 3, "Metadata validation error encountered on volume mounted at %2. A read retry failed for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk and reading again did not provide valid data.
// *Action: Run the file system checker as soon as possible.
/
/ WSN=OFS_META_RETRY_FAILURE_DEVP
0048, 3, "Metadata validation error encountered on volume %2. A read retry failed for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk and reading again did not provide valid data.
// *Action: Run the file system checker as soon as possible.
/
/ WSN=OFS_META_RETRY_FAILURE_DEVNUM
0049, 3, "Metadata validation error encountered on volume with device minor number %2. A read retry failed for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk and reading again did not provide valid data.
// *Action: Run the file system checker as soon as possible.
/
/ WSN=OFS_ASSERT_POPPED_REPEAT
/ DEPRECATED 
0050, 2, "Assert at %2 line %3 repeated %4 times."
/
/ WSN=OFS_RAC_MODE_FAILURE
0051, 3, "ASM instance is no longer RAC enabled."
// *Cause:
// *Action: Ensure all ACFS file systems are unmounted.
//          Then unload and reload the oracleacfs driver to
//          switch into single instance mode.
/
/ WSN=OFS_VOLUME_NO_SPACE
0052, 3, "Volume %2 (Major: %3, Minor: %4) mount failed. Volume is out of space."
// *Cause: Mount failed due to insufficient space available in the volume.
// *Action: Either expand the storage available for this ACFS volume using the
//          "acfsutil size" command or reduce the space being used.
/
/ WSN=OFS_VOLUME_VERSION_MISMATCH
0053, 3, "Volume %2 (Major: %3, Minor: %4) mount failed. Volume version does not match the ACFS driver version."
// *Cause: The mount failed because the version of ACFS in the kernel is not 
//         compatible with the version of the volume stored on disk.
// *Action: If this file system was created with newer drivers, the ADVM
//          compatibility was increased, and new features were used, then it
//          is not possible to mount this file system with an older driver.
//          Otherwise, ensure the correct drivers and tools are installed.
//          Running fsck/acfschkdsk may provide further clues.
/
/ WSN=OFS_INTERNAL_STATUS
0054, 3, "Volume %2 (Major: %3, Minor: %4) mount failed with internal status code (%5)."
// *Cause: The mount failed because ACFS detected an internal error.
// *Action: Verify that the version of ACFS being run is corect. If it is,
//          inform Oracle Support Services.
/
/ WSN=OFS_CLUSTER_NODE_NOT_MEMBER_MM
0055, 3, "Volume %2 (Major: %3, Minor: %4) mount failed. Cluster membership is not established."
// *Cause: The mount failed because this node is not in a cluster.
// *Action: Ensure ASM is configured properly. Wait until the node has joined
//          a cluster and try again.
/
/ WSN=OFS_INSUFFICIENT_RESOURCES_MM
0056, 3, "Volume %2 (Major: %3, Minor: %4) mount failed. Insufficient kernel resources to complete the mount."
// *Cause: The mount failed because of a resource problem, possibly temporary
//         and probably kernel memory.
// *Action: Try the mount again. If it fails again, inform Oracle Support
//          Services.
/
/ WSN=OFS_UNRECOGNIZED_VOLUME_MM
0057, 3, "Volume %2 (Major: %3, Minor: %4) mount failed. Error in superblock."
// *Cause: A problem has been detected in the superblock.
// *Action: Run fsck/acfschkdsk when possible and try to mount again. If it
//          fails again, inform Oracle Support Services.
/
/ WSN=OFS_IOERROR_PART1_GEN
0058, 3, "I/O failure %2 with device %3 during a %4 %5."
/
/ WSN=OFS_IOERROR_PART2_GEN
0059, 3, "%2 Starting offset: %3 . Length of data transfer: %4 bytes."
/
/ WSN=OFS_IOERROR_PART3_GEN
0060, 3, "Impact: %2   Object: %3   Operation Context: %4 Snapshot?: %5 AcfsObjectID: %6 .  Internal ACFS Location: %7 ."
/
/ WSN=OFS_ASSERT_POPPED
0061, 3, "An ACFS Assertion failed at %2 line %3."
// *Cause: An ACFS Assertion failed.
// *Action: See the next message from Oracle OKS which may contain the
//          location of a file containing further information. Include the contents
//          of this file if reporting the problem to Oracle
/
/ WSN=OFS_REPL_TERM_RLOG_ERR
0062, 3, "An I/O error was encountered while invalidating a replication log record. Replication is being terminated for file system %2."
// *Cause: This leaves the primary and standby sites out of sync, so replication is being terminated for file system %2.
// *Action:
/
/
/ WSN=OFS_AIX_CFG_FAILED
0063, 3,"Acfs kernel extension configuration failed. Diagnostic codes:  %2  %3 / %4   %5 / %6 ."
// *Cause: An error was seen during Acfs configuration and/or initialization.
// *Action: Inform Oracle Support Services and provide the message displayed.
/
/ WSN=OFS_ENCR_LOGGING_STOPPED
0064, 3, "Logging to the file %2 has stopped. Backup the log archive %3%4 to a new location if required, and then remove the log archive to restart logging."
// *Cause: Log file size limit reached while the log archive still exists.
// *Action: Backup the log archive to a new location if required, and then remove the log archive.
/
/ WSN=OFS_ENCR_LOG_ARCHIVE_CREATED
0065, 3, "Log file %2 has been archived at location %3%4."
// *Cause: The log file was archived since the file reached its specified size limit. Meanwhile, logging to the original file will continue.
// *Action: Backup the log archive to a new location if required, and then remove the log archive. Failing to do this before the log file fills again will result in loss of log data.
/
/ WSN=OFS_ENCR_LOG_ARCHIVE_EXISTS
0066, 3, "An archive of the log file %2 exists at location %3%4."
// *Cause: Active log file is reaching its specified size limit and the log archive has not been removed. Logging will stop after active log file reaches its specified size limit and the log archive still has not been removed.
// *Action: Backup the log archive to a new location if required, and then remove the log archive. Failing to do this before the log file fills again will result in loss of log data.
/
/ WSN=OFS_SEC_LOGGING_STOPPED
0067, 3, "Logging to the file %2 has stopped. Backup the log archive %3%4 to a new location if required, and then remove the log archive to restart logging."
// *Cause: Log file size limit reached while the log archive still exists.
// *Action: Contact an ACFS Security Administrator to backup the log archive to a new location if required, and then remove the log archive.
/
/ WSN=OFS_SEC_LOG_ARCHIVE_CREATED
0068, 3, "Log file %2 has been archived at location %3%4."
// *Cause: The log file was archived since the file reached its specified size limit. Meanwhile, logging to the original file will continue.
// *Action: Contact an ACFS Security Administrator to backup the log archive to a new location if required, and then remove the log archive. Failing to do this before the log file fills again will result in loss of log data.
/
/ WSN=OFS_SEC_LOG_ARCHIVE_EXISTS
0069, 3, "An archive of the log file %2 exists at location %3%4."
// *Cause: Active log file is reaching its specified size limit and the log archive has not been removed. Logging will stop after active log file reaches its specified size limit and the log archive still has not been removed.
// *Action: Contact an ACFS Security Administrator to backup the log archive to a new location if required, and then remove the log archive. Failing to do this before the log file fills again will result in loss of log data.
/
/ WSN=OFS_UNEXPECTED_EXCEPTION
0070, 3, "%2 saw exception %3 ."
// *Cause: An unexpected exception was detected.
// *Action: Inform Oracle Support Services and provide the message displayed.
/
/ WSN=OFS_ENCR_NOVEKS
0071, 3, "Volume encryption keys are not available for the file system mounted at %2, encrypted files will not be available."
// *Cause:  Volume encryption keys (VEKs) were not available to the file system.  Possible causes are:
//              1) The ACFS Encryption key store was missing.  This is indicated by message ACFS-10573 during mount.
//              2) The ACFS Encryption key store was corrupted.
//              3) ACFS Encryption was configured to use a password-protected key store and an incorrect key store password was supplied when mounting the file system.
//              4) ACFS Encryption was configured to use a password-protected key store and the file system was mounted via the ACFS Mount Registry.
// *Action: Immediately unmount and remount the file system without using the ACFS Mount Registry, providing the correct password if required.  If the problem persists, contact Oracle Support Services.
/
/ WSN=OFS_CLEARED_DIRECT_OFLAG
0072, 3, "A call to fcntl(2) F_SETFL has cleared O_DIRECT while I/O was active for the file with file identifier %2 in the volume %3.  This is not allowed."
// *Cause: User-space code called fcntl and cleared the O_DIRECT open flag of a file being used for Direct I/O.
// *Action: Ensure that user-space code does not reset O_DIRECT when calling fcntl F_SETFL.
/
/ WSN=OFS_FCB_HASH_SIZE
0073, 1, "ACFS _FCB hash size is %2."
// *Cause: Informational 
// *Action: None. 
/
/ WSN=OFS_ASSERTION
0074, 3, "ASSERTION FAILURE: %2 File: %3 Line: %4."
// *Cause: An internal ACFS assertion has failed.
// *Action: Contact Oracle Support.
/
/ WSN=OFS_DLM_HASH_SIZE
0075, 1, "Oracle kernel distributed lock manager hash size is %2."
// *Cause: Informational.
// *Action: None.
/
/ WSN=OFS_BUFFER_CACHE_SIZE
0076, 1, "Buffer cache size: %2MB in %3 buckets."
// *Cause: Informational.
// *Action: None.
/
/ WSN=OFS_BUILD_MISMATCH
0077, 2, "WARNING: the OKS and ACFS drivers have different build information."
// *Cause: Warning - The ACFS label version should match the OKS label version.
// *Action: None.
/
/ WSN=OFS_BUILD_LABEL
0078, 1, "ACFS build %2."
// *Cause: Informational.
// *Action: None.
/
/ WSN=OFS_CONTAINS_FIXES
0079, 1, "ACFS contains fixes '%2'."
// *Cause: Informational.
// *Action: None.
/
/ WSN=OFS_OKS_BUILD_LABEL
0080, 1, "OKS  build %2."
// *Cause: Informational.
// *Action: None.
/
/ WSN=OFS_OKS_FIXES
0081, 1, "OKS  contains fixes '%2'."
// *Cause: Informational.
// *Action: None.
/ WSN=OFS_SNAP_STG_SIZE
0082, 3, "The storage consumption statistics for snapshots of volume mounted at %2 is no longer accurate."
// *Cause: Informational.
// *Action: Running fsck/acfschkdsk will fix the snapshot statistics.  These statistics are for reporting purposes only.
/
/ WSN=OFS_AUDIT_TRAIL_LOGGING_STOPPED
0083, 3, "Logging to the audit trail %2 has stopped. Backup the audit trail archive %3%4 to a new location if required, and then remove the audit trail archive to restart logging."
// *Cause: Audit trail size limit reached while the audit trail archive still exists.
// *Action: Backup the audit trail archive to a new location if required, and then remove the audit trail archive.
/
/ WSN=OFS_AUDIT_TRAIL_ARCHIVE_CREATED
0084, 3, "Audit trail %2 has been archived at location %3%4."
// *Cause: The audit trail was archived since the file reached its specified size limit. Meanwhile, logging to the original audit trail will continue.
// *Action: Backup the audit trail archive to a new location if required, and then remove the audit trail archive using 'acfsutil audit purge' command. Failing to do this before the audit trail fills again will result in loss of log data.
/
/ WSN=OFS_AUDIT_TRAIL_ARCHIVE_EXISTS
0085, 3, "An archive of the audit trail %2 exists at location %3%4."
// *Cause: Active audit trail is reaching its specified size limit and the audit trail archive has not been removed. Auditing will stop after active audit trail reaches its specified size limit and the audit trail archive still has not been removed.
// *Action: Backup the audit trail archive to a new location if required, and then remove the audit trail archive. Failing to do this before the audit trail fills again will result in loss of audit trail data.
/
/ WSN=OFS_META_RETRY_MIRROR_SUCCESS
0086, 2, "Metadata validation error encountered on volume mounted at %2. A read retry on mirror %3 succeeded for file identifier %4 starting disk offset %5."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk, but retrying using the mirror cited in the message provided
/          valid data.
// *Action: No action required. A layer in the storage stack may be
//          malfunctioning.
/
/ WSN=OFS_META_RETRY_MIRROR_SUCCESS_DEVP
0087, 2, "Metadata validation error encountered on volume %2. A read retry on mirror %3 succeeded for file identifier %4 starting disk offset %5."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk, but retrying using the mirror cited in the message provided
/          valid data.
// *Action: No action required. A layer in the storage stack may be
//          malfunctioning.
/
/ WSN=OFS_META_RETRY_MIRROR_SUCCESS_DEVNUM
0088, 2, "Metadata validation error encountered on volume with device minor number %2. A read retry on mirror %3 succeeded for file identifier %3 starting disk offset %4."
// *Cause: ACFS detected a problem with the content of metadata read from the
//         disk, but retrying using the mirror cited in the message provided
/          valid data.
// *Action: No action required. A layer in the storage stack may be
//          malfunctioning.
/
/ WSN=OFS_REMOVE_NO_SPACE
0089, 2, "failed to free storage from a deleted large file on the volume mounted at %s; will continue to attempt to free the storage"
// *Cause: ACFS failed to free the space from a deleted large file because the
//         filesystem had no free storage.
// *Action: Remove smaller files, a directory, or a snapshot to free some 
//          blocks, or run 'fsck -a' to return the space from the large file.
/
/ WSN=OFS_REMOVE_NO_SPACE_DEVP
0090, 2, "failed to free storage from a deleted large file on volume %s; will continue to attempt to free the storage"
// *Cause: ACFS failed to free the space from a deleted large file because the
//         filesystem had no free storage.
// *Action: Remove smaller files, a directory, or a snapshot to free some 
//          blocks, or run 'fsck -a' to return the space from the large file.
/
/ WSN=OFS_REMOVE_NO_SPACE_DEVNUM
0091, 2, "failed to free storage from a deleted large file on the volume with device minor number %s; will continue to attempt to free the storage"
// *Cause: ACFS failed to free the space from a deleted large file because the
//         filesystem had no free storage.
// *Action: Remove smaller files, a directory, or a snapshot to free some 
//          blocks, or run 'fsck -a' to return the space from the large file.
/
/ WSN=OFS_BLOCKSIZE_MISMATCH
0092, 2, "a compressed database file of Oracle file type %2 has blocksize %3 but was opened specifying %4"
// *Cause: An existing compressed Database file was opened specifying a DB
//         Blocksize different from what was expected. Data access will be
//         prevented until this condition is fixed.
// *Action: Verify that the DB blocksize configured is correct and change
//          it if necessary.
/
/ WSN=OFS_PER_SNAP_STG_SIZE
0093, 3, "The storage consumption statistics for snapshot %2 (ID %3) of volume mounted at %4 are no longer accurate."
// *Cause: The mechanism used to report the storage statistics was interrupted.
// *Action: No action is necessary because these statistics are reporting 
//          purpose only. If accuracy is desired run fsck/acfschkdsk to fix 
//          the snapshot statistics.  
/
/ WSN=OFS_CMPRSS_STG_WRITES_THROTTLED
0094, 2, "The amount of disk storage from compressed files that should be freed has reached the maximum allowed for the volume mounted at path %2.  Expect a temporary slow down in writing new data."
// *Cause: ACFS needs to catch up on freeing storage no longer needed for
//         compressed files.
// *Action: No action required. Writes will be unthrottled once ACFS has
//          caught up on freeing storage.
/
/ WSN=OFS_DIO_ALERT_CONVERT_DIO
0095, 2, "Direct IO(s) to a compressed file were converted to Cached IO due to bad alignment or length.  The file has ACFS identifier %2 and is on the file system mounted at path %3 (device %4). Call %5 File Type %6 Data1 %7 Data2 %8"
// *Cause: An application attempted to issue a Direct IO to a compressed
//         file that did not meet the expected alignment and length
//         requirements.
// *Action: No action required but please note that this can result in poor
//          performance.
/
/ WSN=OFS_DIO_ALERT_DB_DIO
0096, 2, "Unaligned direct IO writes to compressed database rejected. The file has ACFS identifier %2 and is on the file system mounted at path %3 (device %4). Call %5 File Type %6"
// *Cause: Attempted direct IO writes to a compressed database datafile were
//         rejected because they were not aligned with the Compression Unit
//         size of the file and would have caused corruption.
// *Action: If the configured database block size is not equal to the
//          Compression Unit size then recreate the file with a block size
//          supported by ACFS.  If the database block size is equal to the
//          Compression Unit size, contact Oracle Support Services.
/
/ WSN=OFS_ORAOPEN_ALERT_2K_BLOCKSIZE
0097, 2, "Unsupported block size (2K bytes) for database file. The file has ACFS identifier %2 and is on the file system mounted at path %3 (device %4)."
// *Cause: An attempt to open a database file that was configured with a 2K
//         byte block size was rejected because ACFS does not support a block
//         size of 2K.
// *Action: If attempting to create a new database file, use a block size
//          supported by ACFS.  If attempting to use an existing file,
//          recreate it in the database with a block size supported by ACFS.
/
/ WSN=OFS_ORAOPEN_ALERT_4K_BLOCKSIZE_COMP
0098, 2, "Unsupported block size (4K bytes) for compressed database file. The file has ACFS identifier %2 and is on the file system mounted at path %3 (device %4)."
// *Cause: An attempt to open a compressed database file that was configured
//         with a 4K byte block size was rejected because ACFS does not
//         support a block size of 4K for compressed database files.
// *Action: If attempting to create a new compressed database file, use a
//          block size supported by ACFS.  If attempting to use an existing
//          file, recreate it in the database with a block size supported by
//          ACFS.
/
/ WSN=OFS_ALERT_MAKE_NO_DBACCESS
0099, 2, "Access to an ACFS-compressed database file is not allowed. The file has ACFS identifier %2 and is on the file system mounted at path %3 (device %4)."
// *Cause: An attempt to start the database using an ACFS-compressed database
//         file was rejected because ACFS did not support compressed
//         database files.
// *Action: Ensure that the database file is not ACFS-compressed before
//          using it.
/
