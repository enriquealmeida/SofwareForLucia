/
/
/
/ Initialization Errors: 100-199
0100,   0, "initialization of CORE/NLS failed"
0101,   1,  "LRM error [%d] while parsing command line arguments"
0102,   1,  "LRM error [%d] while parsing argument %s"
0103,   1,  "LRM message: %s"
0104,   1,  "Could not open pfile '%s'"
0105,   0,  "Error while initializing meta context\n"
0106,   1,  "Error while initializing kgfk context %d\n"
/
/ Usage Errors: 200-299
/
/
/ Runtime Errors: 300-399
/
0301,   2, "Unable to contact Cluster Synchronization Services (CSS). Return code %d from %s."
0302,   0, "Could not discover library, either path of library is not valid or library does not exist.\n"
0303,   0, "Failed to load AFD library.\n"
0304,   2, "asmlib error could not be determined [%s] [%s]"
0305,   3, "asmlib error!! function = [%s], error = [%s], mesg = [%s]"
0306,   2, "Could not close %s library, got error (%s) "
0307,   2, "asmlib [%s] version mismtach, oracle version [%s]"
0309,   2, "Error scanning device %s"
0310,   2, "Error discovering diskstring %s"
0311,   1, "Path %s is not accessible\n"
0312,   0, "Null value\n"
0313,   1, "File %s does not exist\n"
0314,   1, "File %s is not accessible\n"
0315,   1, "Unable to open file %s\n"
0316,   1, "stat failed for path %s\n"
0317,   0, "ASM discovery failed\n"
0318,   1, "Unable to get device statistics for %s\n"
0319,   1, "Invalid arguments - Error: [%d]\n"
0320,   1, "File Access failure - Error : [%d]\n"
0321,   1, "IO failure - Error : [%d]\n"
0322,   1, "Disk is %s member of active diskgroup\n"
0323,   0, "Filter Driver could not unlink the disk from the list\n"
0324,   1, "Unable to get block size of %s\n"
0325,   1, "Unable to do IO on %s\n"
0326,   1, "Could not unlabel disk %s due to IO error\n"
0327,   1, "Checksum computation failed for %s\n"
0328,   1, "Labeling failed for disk %s\n"
0329,   1, "Label name should be regular expression when there are paths to be labeled. Suggested Label:%s*\n"
0330,   0, "Path or Label can not be NULL\n"
0331,   0, "One ore more disks are not labeled, Refer AFD library's trace file.\n"
0332,   0, "One ore more disks are not unlabeled, Refer AFD library's trace file.\n"
0333,   1, "Could not enable filter on '%s'.\n"
0334,   1, "Could not disable filtering on '%s'.\n"
0335,   0, "Failed to free FD resources.\n"
0336,   0, "There are no labelled devices.\n"
0337,   0, "Failed to get device list.\n"
0338,   0, "No devices to be labeled.\n"
0339,   0, "No devices to be unlabeled.\n"
0340,   0, "Labeled devices successfully.\n"
0341,   0, "Unlabeled devices successfully.\n"
0342,   1, "disk %s is already provisioned for ASM\n"
0343,   1, "label name %s is already in use\n"
0344,   1, "label name '%s' is not used by ASM\n"
0345,   0, "No devices to be scanned.\n"
0346,   1, "There is no AFD device matching '%s'.\n"
0347,   1, "Filtering is enabled on '%s'.\n"
0348,   1, "Filtering is disabled on '%s'.\n"
/
/ Slos reporting: 400-449
/
400, 00000, "OS system dependent operation: %s failed with status: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
/
401, 00000, "OS failure message: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
//
402, 00000, "failure occurred at: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
//
403, 00000, "additional information: %s"
// *Cause:  OS system call error
// *Action: contact Oracle Support
/
/     
/ INTERNAL Errors: 600-699
/
/
0601,   1, "Could not allocate memory %d"
0602,   1, "Could not initialize sub heap %s"
0610,   2, "Internal error [%s] [%s]"
0611,   0, "Unable to load AFDLibrary"
/
/ Informational Messages: 1000-1099
/
1000,  1,  "Device %s not supported by ASM\n" 
1001,  1,  "USAGE: afdtool %s <path> <label>\n"
1002,  2,  "USAGE: afdtool %s [%s]  <label>\n" 
1003,  4,  "USAGE: afdtool %s  < %s | %s | %s >\n" 
1004,  3,  "USAGE: afdtool %s <%s | %s> < path >\n"
1005,  1,  "USAGE: afdtool %s \n" 
1006,  0,  "ASM Filter Driver is not Loaded\n" 
1007,  1,  "Disk %s is mounted" 
