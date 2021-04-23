/* Copyright (c) 2009, 2012, Oracle and/or its affiliates. All rights reserved. */
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   advmkus.msg
/ DESCRIPTION
/   Message file for ADVM commands
/ NOTES
/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/    bonelso    11/29/12 - fix some parameter identifiers
/    averhuls   07/09/12 - Comment second msg field.
/    averhuls   11/28/11 - Add label mismatch messages.
/    bonelso    09/29/11 - Coverted some KsPrint()s to KsMSgIssue()s
/    anjiwaji   10/12/10 - Add messages for new kernel messaging system
/

/
/ Windows (only as far as I can tell) uses the second msg field as follows
/   Success       = 0x0:STATUS_SEVERITY_SUCCESS
/   Informational = 0x1:STATUS_SEVERITY_INFORMATIONAL
/   Warning       = 0x2:STATUS_SEVERITY_WARNING
/   Error         = 0x3:STATUS_SEVERITY_ERROR
/

// WINFACILITY=Oracle_ADVM
// WINFACNUM=0x9
// MSGPREFIX=ADVMK
//
/ The next several messages are generic. You can supply a small
/ insertion string.
/
/ WSN=ADVM_SUCCESSFUL
0000, 0, "%2 %3"
/
/ WSN=ADVM_DRIVER_LOAD
0001, 1, "Module load succeeded. Build information: %2 %3 %4 built on %5."
// *Cause: The ADVM driver was started.
// *Action: None, this is informational.
/
/ WSN=ADVM_DRIVER_LOAD_FAIL
0002, 3, "Module load failed with status %2. Build information: %3 %4 %5 built on %6."
// *Cause: There was a problem the prevented the ADVM driver from loading.
// *Action: Reboot the system.If this happens again please report this error to
//          Oracle Support Services. 
/
/ WSN=ADVM_DRIVER_UNLOAD
0003, 1, "Module unloaded."
// *Cause: The ADVM driver was unloaded.
// *Action: None, this is informational.
/
/ WSN=ADVM_VOLUME_CREATE
0004, 1, "Volume %2 in diskgroup %3 created."
// *Cause: An ADVM volume was created.
// *Action: None, this is informational.
/
/ WSN=ADVM_VOLUME_CREATE_FAIL
0005, 3, "The attempt to create volume %2 in diskgroup %3 failed."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=ADVM_VOLUME_DELETE
0006, 1, "Volume %2 in diskgroup %3 disabled."
// *Cause: The ADVM volume was disabled or deleted.
// *Action: None, this is informational.
/
/ WSN=ADVM_VOLUME_DELETE_FAIL
0007, 3, "The attempt to disable volume %2 in diskgroup %3 failed."
// *Cause:  Informational. 
// *Action: None.
/
/ WSN=ADVM_VOLUME_OPEN_FAIL
0008, 3, "The attempt to open/mount volume %2 in diskgroup %3 failed."
// *Cause:  Informational. 
// *Action: None. 
/
/ WSN=ADVM_VOLUME_RESIZE
0009, 1, "Volume %2 in diskgroup %3 resized, new size is %4 MB."
// *Cause: An ADVM volume was resized.
// *Action: None, this is informational.
/
/ WSN=ADVM_RECOVERY_START
0010, 1, "Mirror recovery for volume %2 in diskgroup %3 started."
// *Cause: A volume needing recovery was mounted. 
// *Action: None, this is informational.
/
/ WSN=ADVM_RECOVERY_END
0011, 1, "Mirror recovery for volume %2 in diskgroup %3 completed."
// *Cause: Mirror recovery finished successfully.
// *Action: None, this is informational.
/
/ WSN=ADVM_RECOVERY_FAIL
0012, 3, "Mirror recovery for volume %2 in diskgroup %3 failed."
// *Cause: Volume mirror recovery failed.
// *Action: Report this error to Oracle Support Services.
/
/ WSN=ADVM_RECONFIG_START
0013, 1, "Cluster reconfiguration started."
// *Cause:  Informational.
// *Action: None.
/
/ WSN=ADVM_RECONFIG_END
0014, 1, "Cluster reconfiguration completed."
// *Cause:  Informational.
// *Action: None. 
/
/ WSN=ADVM_RECONFIG_FAIL
0015, 3, "Cluster reconfiguration failed."
// *Cause:  Informational. 	.
// *Action: None.
/
/ WSN=ADVM_ASM_SHUTDOWN
0016, 1, "The ASM instance was shutdown."
// *Cause: ASM was shutdown.
// *Action: None, this is informational.
/
/ WSN=ADVM_ASM_CRASH
0017, 3, "The ASM instance terminated unexpectedly. All ADVM volumes will be taken offline."
// *Cause: ASM aborted or was shutdown with the 'abort' keyword.
// *Action: Close all applications using these volumes and unmount
//          the file systems.  After restarting the instance, you may need to
//          re-enable the volumes for use.
/
/ WSN=ADVM_FORCED_DISMOUNT
0018, 3, "Diskgroup %2 was dismounted with the force option. All ADVM volumes in this diskgroup will be taken offline."
// *Cause: The diskgroup was force dismounted.
// *Action: Close all applications using these volumes and unmount the
//          file systems. After re-mounting the diskgroup, you may need to 
//          re-enable the volumes for use.
/
/ WSN=ADVM_FENCE_VOLUME
0019, 2, "Volume %2 in disk group %3 was taken offline, all attempts to read or write to this volume will fail."
// *Cause: The volume was in use when either ASM aborted, or the diskgroup 
//         containing the volume was force dismounted.
// *Action: The volume must be dismounted.
/
/ WSN=ADVM_IO_ERROR_READ
0020, 3, "A read error was reported to the ASM instance for volume %2 in diskgroup %3."
// *Cause: A I/O read request returned failure from one of the disks hosting 
//         the volume.
// *Action: None, this is informational.
/
/ WSN=ADVM_IO_ERROR_WRITE
0021, 3, "A write error was reported to the ASM instance for volume %2 in disk group %3."
// *Cause: A I/O write request return failure from one of the disks hosting
//         the volume. 
// *Action: None, this is informational.
/
/ WSN=ADVM_INTERNAL_ERROR
0022, 3, "An internal error occurred."
// *Cause: An internal ADVM error occurred.
// *Action: Report this error to Oracle Support Services.
/
/ WSN=ADVM_COLLISION_ERROR
0023, 1, "Volume name collision between %2 and %3."
// *Cause: Volume name collision occurred.
// *Action: None, this is informational.
/
/ WSN=ADVM_BUILD_MISMATCH
0024, 2, "WARNING: the OKS and ADVM drivers have different build information."
// *Cause: Warning - The ADVM label version should match the OKS label version.
// *Action: None.
/
/ WSN=ADVM_BUILD_LABEL
0025, 1, "ADVM build %2."
// *Cause: Informational.
// *Action: None.
/
/ WSN=ADVM_CONTAINS_FIXES
0026, 1, "ADVM contains fixes '%2'."
// *Cause: Informational.
// *Action: None.
/
/ WSN=ADVM_OKS_BUILD_LABEL
0027, 1, "OKS  build %2."
// *Cause: Informational.
// *Action: None.
/
/ WSN=ADVM_OKS_FIXES
0028, 1, "OKS  contains fixes '%2'."
// *Cause: Informational.
// *Action: None.
