// Copyright (c) 2008, 2012, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrkhMsg.msg
//
// DESCRIPTION
//    Message file
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     xesquive    02/07/12 - Bug fix 13566257
//     rxkumar     03/17/11 - fix bug11786846
//     sowong      06/22/10 - fix action for CHECK_NODE_NUM0_FAILED
//     rxkumar     05/25/10 - fix bug9700391
//     agorla      02/22/10 - bug#7241644 - add HASContext native error msgs
//     sravindh    10/07/09 - Bug 8931922
//     wsun        09/09/08 - bug# 7013863
//     rxkumar     05/26/07 - add MAKE_DAEMON_FAILED
//     rxkumar     04/26/06 - fix bug5184535 
//     dliu        10/07/04 - 
//     jtellez     06/13/03 - add no such oracle home
//     jtellez     08/16/02 - msg tweeks
//     mhbauer     08/13/02 - edit messages
//     jtellez     08/12/02 - Message Improvements
//     jtellez     06/28/02 - add UserNotFound, IsufficientPrivilege, and Util Exception msgs
//     jtellez     06/25/02 - add init failure
//     jtellez     06/06/02 - add CRSHOME not defd
//     jtellez     05/17/02 - Add caused by
//     jtellez     05/08/02 - jtellez_ha_lsnr
//     jtellez     04/29/02 - Creation
//  */
// 
// /**
//  * Message file for has package.
//  *
//  *  @version $Header: opsm/jsrc/oracle/ops/mgmt/has/resource/PrkhMsg.msg /main/9 2012/02/14 14:30:03 xesquive Exp $
//  *  @author  jtellez 
//  *  @since   release specific (what release of product did this appear in)
//  */
// 
// PACKAGE=package oracle.ops.mgmt.has.resource;
// IMPORT=import java.util.ListResourceBundle;
// MSGIDTYPE=interface
1000, FAILURE_LOADING_SHARED_LIB, "Unable to load the SRVM HAS shared library"
//  *Cause: 
// *Action: 
/
1001, HAS_CONTEXT_INTERNAL_ERROR, "HASContext Internal Error"
//  *Cause: 
// *Action: 
/
1002, HAS_NATIVE_CALL_FAILURE, "Internal HASContext Error: JNI Native Call Failure"
//  *Cause: 
// *Action: 
/
1003, HAS_NOMEM, "Failed to allocate memory in native layer: "
//  *Cause: 
// *Action: 
/
1004, REMOTE_JOIN_ALIAS_FAILED, "Failed to execute remote join cluster alias {0} for nodes: "
//  *Cause: 
// *Action: 
/
1005, REMOTE_LEAVE_ALIAS_FAILED, "Failed to execute remote leave cluster alias {0} for nodes: "
//  *Cause: 
// *Action: 
/
1006, NODE_NOT_FOUND, "The following nodes are either not active or not configured: "
//  *Cause: 
// *Action: 
/
1007, CAUSED_BY, "Exception Caused by: "
//  *Cause: 
// *Action: 
/
1008, ILLEGAL_NULL_ARGUMENT, "Internal HASContext Error: Argument {0} must be set."
//  *Cause: 
// *Action: 
/
1009, CRSHOME_NOT_DEFINED, "CRS HOME must be defined in the environment or in the Oracle Cluster Registry"
//  *Cause: 
// *Action: 
/
1010, INIT_CRS_FAILED, "Unable to communicate with CRS services."
//  *Cause: 
// *Action: 
/
1011, INSUFFICIENT_PRIVILIGES, "Process does not have sufficient privileges to perform the requested operation. {0}"
//  *Cause: 
// *Action: 
/
1012, USER_NOT_FOUND, "Unable to find or resolve user {0}."
//  *Cause: 
// *Action: 
/
1013, NOSUCH_ORACLE_HOME, "The oracle home {0} does not exist."
//  *Cause: 
// *Action: 
/
1014, MISMATCH_OUSER, "Current user \"{0}\" is not the oracle owner user \"{1}\" of oracle home \"{2}\""
//  *Cause: The command was run as a different user than the owner user of the oracle home path.
// *Action: Retry the command as the user who owns the specified oracle home.
/
1015, MAKE_DAEMON_FAILED, "Failed to create daemon process from executable {0} with arguments {1} and environments {2}, {3}"
//  *Cause: 
// *Action: 
/
1016, GET_CSS_MODE_FAILED, "Failed to get CSS mode"
// *Cause: An error occurred on a Cluster Synchronization Services request.  This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise.
//     contact Oracle Support Services.
/
1050, BUFFER_2_SMALL, "Buffer is too small"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1051, CLUSTER_SKGXN_ERROR, "Cluster software (skgxn) error"
//  *Cause: An error occurred when Cluster Synchronization Services attempted to use non-Oracle vendor clusterware.  This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
1052, INVALID_ARGUMENTS, "Invalid arguments"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1053, SYNC_NOT_ACTIVE, "Cluster synchronization services are not active"
//  *Cause: CSS daemon is not running or unable to authenticate with CSS daemon
// *Action: Use 'crsctl check css' to ensure that CSS daemon is running. If CSS daemon is not running, execute 'crsctl start crs' command.
/
1054, COMMUNICATIONS_ERROR, "Communications error"
//  *Cause: CSS daemon is not running on the local node or unable to authenticate with CSS daemon
// *Action: Use 'crsctl check css' to ensure that CSS daemon is running. If CSS daemon is not running, execute 'crsctl start crs' command.
/
1055, OCR_ERROR, "Oracle Cluster Registry error"
//  *Cause: OCR returned an error while processing a CSS request
// *Action: Ensure that CRSD daemon is running e.g. with crsctl check clusterware
/
1056, UNEXPECTED_CSS_ERROR, "Unexpected CSS error"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1057, CHECK_NODE_NUM0_FAILED, "Check for node with node number 0 failed."
// *Cause: CSS daemon is not running on local node or unable to authenticate with CSS daemon.
// *Action: Use 'crsctl check css' to ensure that CSS daemon is running. If CSS daemon is not running, execute 'crsctl start crs' command.
/
1058, NODENUMBER_TOO_BIG, "Node number specified for the node name lookup is beyond the allowed node number range"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
1059, GET_ASM_MODE_FAILED, "Failed to get ASM mode"
// *Cause: An error occurred on an Oracle Clusterware request. This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3002, CLSS_SKGXN_ERROR, "Vendor cluster software error occurred in Cluster Synchronization Services"
//  *Cause: An error occurred when Cluster Synchronization Services attempted to use non-Oracle vendor clusterware.  This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3003, CLSS_COM_ERROR, "An attempt to communicate with the CSS daemon failed"
//  *Cause: CSS daemon is not running.
// *Action: Ensure that CSS daemon is running.
/
3004, CLSS_MEMORY_ERROR, "Failed due to insufficient memory for Cluster Synchronization Services"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3005, CLSS_NOMBR_ERROR, "Entity {0} was not registered with CSS"
//  *Cause: The given entity (e.g. instance) was not registered with CSS.
// *Action: Start the entity before retrying the operation.
/
3009, CLSS_NOLOCK_ERROR, "An attempt was made by Cluster Synchronization Services to release a lock that was not held"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3011, CLSS_NACTV_ERROR, "Cluster Synchronization Services was started but has not completed startup"
//  *Cause: An attempt to connect to CSS failed because initialization is still in progress.
// *Action: None 
/
3013, CLSS_BUF2SHORT_ERROR, "An improper buffer argument was supplied to Cluster Synchronization Services"
//  *Cause: This is an internal error.
// *Action: Contact Oracle Support Services.
/
3016, CLSS_BADARGS_ERROR, "Invalid arguments"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3050, CLSS_UNEXPECTED_ERROR, "Unexpected error ({0}) returned from Cluster Synchronization Services"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3101, CLSDHCP_GIPC_ERROR, "GIPC Error returned from DHCP module"
// *Cause: A communication error occurred on a DHCP operation. This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3150, CLSDHCP_UNEXPECTED_ERROR, "Unexpected error ({0}) returned from DHCP module"
// *Cause: An internal error occurred. 
// *Action: Contact Oracle Support Services.
/
3202, SCLS_ERROR, "An error occurred in Oracle Clusterware during an Operating System function call or request"
//  *Cause: An error occurred in Oracle Clusterware.  This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3203, SCLS_NEED_PASSWORD_ERROR, "Required password not supplied"
//  *Cause: A requested operation requires a password but none was supplied. This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3204, SCLS_BUF2SHORT_ERROR, "An improper buffer argument was supplied to Oracle Clusterware"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3205, SCLS_META_QUERY_ERROR, "Internal error in Oracle Clusterware"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3250, SCLS_UNEXPECTED_ERROR, "Unexpected error ({0}) returned from Oracle Clusterware"
// *Cause: An internal error occurred. 
// *Action: Contact Oracle Support Services.
/
3301, CLSR_BADARGS_ERROR, "Invalid arguments"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3302, CLSR_OCR_ERROR, "Oracle Clusterware database support layer returned OCR error"
//  *Cause: This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3303, CLSR_OSD_ERROR, "Oracle Clusterware database support layer returned OSD error"
//  *Cause: This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3304, CLSR_INTERNAL_ERROR, "Internal error returned from Oracle Clusterware database support layer"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3306, CLSR_CLUA_EXISTED_ERROR, "Internal error returned from Oracle Clusterware database support layer"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3307, CLSR_CLUA_NOEXIST_ERROR, "Internal error returned from Oracle Clusterware database support layer"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3340, CLSR_VIP_ERROR, "Following VIP error occurred from Oracle Clusterware database support layer"
//  *Cause: An error occurred while processing a VIP request. This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3350, CLSR_UNEXPECTED_ERROR, "Unexpected error returned from Oracle Clusterware database support layer"
// *Cause: An internal error occurred. 
// *Action: Contact Oracle Support Services.
/
3401, CLSE_BUF2SHORT_ERROR, "An improper buffer argument was supplied to an internal interface"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
3402, CLSE_OCR_ERROR, "OCR error returned from an internal interface"
//  *Cause: An internal interface encountered an error in OCR processing. This message may be accompanied by others identifying the specific problem.
// *Action: Correct the problem indicated by the accompanying messages, if possible. Otherwise, contact Oracle Support Services.
/
3450, CLSE_UNEXPECTED_ERROR, "Unexpected error ({0}) returned from an internal interface"
//  *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
