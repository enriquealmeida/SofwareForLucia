// Copyright (c) 2011, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCzMsg.msg
//
// DESCRIPTION
//    The 10xx messages are used in Windows security project. 
//    The 20xx messages are used in the root automation project
//    The 40xx messages are used for authentication plugins
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     spavan      06/05/18 - add message for root execution
//     spavan      01/03/18 - add messages for cmdexec plugin
//     spavan      05/12/17 - add authentication plugin messages
//     rdesale     04/26/17 - fix bug 25522145
//     ccharits    01/26/17 - Added messages for TFTP resource
//     jorgepe     01/18/17 - ACFS Remote
//     bbeelamk    07/15/16 - Fix bug 23614578
//     ptare       03/03/16 - Add messages for Secure FTP and run command as
//                            user implementation.
//     ocordova    02/05/16 - Adding getDomainServices
//     ocordova    01/06/16 - Fix bug 20713959
//     chchatte    10/12/15 - bug 21461120
//     spavan      10/05/15 - fix bug21035833 - add message for domain
//                            controller check API's
//     ocordova    10/01/15 - Adding message when GIMR does not exists
//     chchatte    06/10/15 - bug 21140398
//     ocordova    05/25/15 - Fix bug 20923015
//     alcerda     04/16/15 - fix bug 20768032
//     chchatte    04/10/15 - Fix bug 19842914
//     spavan      02/12/15 - add messages for project 47208
//     sejlim      01/14/15 - bug 19276508
//     ocordova    12/04/14 - Proj 47408 adding target support
//     sejlim      10/22/14 - resource template 
//     maboddu     11/18/14 - Fix bug#19997089 - Add error message for
//                            known_hosts file error
//     sejlim      06/20/14 - get username from userpass credential
//     sejlim      06/17/14 - bug 18861564
//     chchatte    05/28/14 - Fix bug 18849522
//     sejlim      05/09/14 - ovmm second txn
//     rdasari     04/04/14 - XbranchMerge rdasari_bug_18142383_win from main
//     sejlim      03/23/14 - OVMM and credentials
//     ocordova    07/31/14 - Credentials Refactor
//     ptare       03/11/14 - Add messages for user existence check
//     spavan      02/06/14 - fix bug18142383 - methods for upgrade and
//                            downgrade of flex ASM
//     yizhang     01/13/14 - fix bug 18021106
//     lureyes     10/18/13 - Fix bug 17578221
//     spavan      09/09/13 - fix bug17308877 - add invalidate cache messages
//     fmaring     05/15/13 - fixbug 7507578
//     ptare       03/20/13 - XbranchMerge ptare_bug-16463379 from
//                            st_has_12.1.0.1
//     ptare       03/03/13 - Add messages for local user existence API in
//                            windows security
//     smadabhu    10/26/12 - Fix UPGRADE_PENDING_ON_NODES
//     sidshank    07/04/12 - add message for force upgrade failure on last
//                            node.
//     xesquive    05/14/12 - add message when the password is not valid
//     sidshank    03/02/12 - Adding message for failure of script execution on
//                            remote nodes on Windows.
//     spavan      11/04/11 - XbranchMerge spavan_bug-12875264 from main
//     spavan      09/26/11 - fix bug12875264
//     spavan      09/14/11 - fix sudo existance message
//     narbalas    08/17/11 - Add error messages for channel
//     spavan      05/24/11 - add error message for sid to username convertion
//     spavan      05/13/11 - add API for checking if user exists
//     spavan      04/05/11 - messages for group API's
//     spavan      03/14/11 - add service messages
//     spavan      03/10/11 - User privilege messages
//     spavan      01/05/11 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
// IMPORT=import oracle.ops.mgmt.nls.MessageKey;
1000, INVALID_USERNAME, "User name cannot be null or empty"
//  *Cause: An invalid value was supplied as user name.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1001, INVALID_PASSWORD, "Password cannot be null"
//  *Cause: A null value was supplied as password parameter to this API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1002, INVALID_LOCAL_NODENAME, "Local node name cannot be null or empty"
//  *Cause: An invalid value was supplied as local node name parameter to this API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1003, INVALID_REMOTE_NODENAMES, "Remote node name cannot be null"
//  *Cause: An invalid value was supplied as remote node names parameter to this API.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1004, NOT_DOMAIN_USER_FORMAT, "User name \"{0}\" does not contain a domain name"
//  *Cause: User name that was supplied was not in DOMAINNAME\\USERNAME format.
// *Action: User name needs to be supplied in DOMAINNAME\\USERNAME format.
/
1005, INVALID_REMOTE_NODENAMES_ARRAY, "Remote node name list contains null or empty node names"
//  *Cause: An invalid value was contained in remote node names list.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1006, INVALID_PARAMETER_VALUE, "Parameter {0} value is not valid"
//  *Cause: This is an internal error. The value for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
1007, IS_ADMIN_FAILED, "Unable to determine if user \"{0}\" has Windows administrator authority."
//  *Cause: An attempt to determine if user specified has Windows administrator authority failed.
// *Action: Examine the accompanying error messages for details.
/
1008, IS_ADMIN_FAILED_NODE, "Unable to determine if user \"{0}\" has Windows administrator authority on nodes \"{1}\""
//  *Cause: An attempt to determine if user specified has Windows administrator authority on specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
1010, INVALID_PLATFORM, "Cannot create an instance of Windows Security Services on this platform"
//  *Cause: An attempt was made to create an instance of Winoows Security Services on a non-Microsoft Windows platforms.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1011, IS_DOMAIN_USER_FAILED, "Unable to determine if user \"{0}\" is a Windows domain user"
//  *Cause: An attempt to determine if user specified is a Windows domain user failed.
// *Action: Examine the accompanying error messages for details.
/
1012, IS_VALID_USER_FAILED, "Unable to determine if user \"{0}\" is a valid Windows user"
//  *Cause: An attempt to determine if user name and password for user specified are valid failed.
// *Action: Examine the accompanying error messages for details.
/
1013, IS_MSA_USER_FAILED, "Unable to determine if user \"{0}\" is a Windows managed service account user"
//  *Cause: An attempt to determine if user name specified is a Windows managed service account user failed.
// *Action: Examine the accompanying error messages for details.
/
1014, CREATE_USER_FAILED, "Windows user \"{0}\" could not be created"
//  *Cause: An attempt to create the specified Windows user failed.
// *Action: Examine the accompanying error messages for details.
/
1015, DOMAIN_USER_CANNOT_BE_CREATED, "Could not create Windows user \"{0}\" because user name is a domain user"
//  *Cause: The user name was in DOMAINNAME\\USERNAME format.
// *Action: If a domain user should own the Oracle home make sure that the domain administrator has created the user. If a new user should be created specify the user name without the domain name.
/
1016, DELETE_USER_FAILED, "Windows user \"{0}\" could not be deleted"
//  *Cause: An attempt to delete the specified Windows user failed.
// *Action: Examine the accompanying error messages for details.
/
1017, DOMAIN_USER_CANNOT_BE_DELETED, "Could not delete Windows user \"{0}\" because user name is a domain user"
//  *Cause: The user name was in DOMAINNAME\\USERNAME format.
// *Action: Only the domain administrator can delete a domain user. Specify a user name without the domain name and the user will be deleted from the local machine.
/
1018, SET_SERVICE_USER_FAILED, "Failed to set user \"{0}\" as Oracle home service user for home \"{1}\""
//  *Cause: An attempt to set specified user as the Oracle home service user for specified home failed.
// *Action: Examine the accompanying error messages for details.
/
1019, SET_SERVICE_USER_FAILED_NODE, "Failed to set user \"{0}\" as Oracle home service user for home \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to set specified user as the Oracle home service user for specified home on the specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
1020, GET_SERVICE_USER_FOR_OHOME_FAILED, "Failed to get the Oracle home service user"
//  *Cause: An attempt to get the Oracle home service user for current Oracle home failed.
// *Action: Examine the accompanying error messages for details.
/
1021, GET_SERVICE_USER_FOR_PATH_FAILED, "Failed to get the Oracle home service user for Oracle home \"{0}\""
//  *Cause: An attempt to get the Oracle home service user for Oracle home at the path specified failed.
// *Action: Examine the accompanying error messages for details.
/
1022, GET_SERVICE_USER_FOR_PATH_FAILED_NODE, "Failed to get the Oracle home service user for Oracle home \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to get the Oracle home service user for Oracle home at the path specified on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1023, INVALID_HOME_PATH_VALUE, "The Oracle home path \"{0}\" is invalid"
//  *Cause: An invalid value was supplied as Oracle home path.
// *Action: The path of Oracle home must be between 0 and 260 characters long and the directory must exist. The path must not contain wild card characters.
/
1024, IS_SERVICE_USER_MSA_FAILED, "Failed to determine if the Oracle home service user for Oracle home \"{0}\" is a Windows managed service account user"
//  *Cause: An attempt to determine if the Oracle home service user for the Oracle home specified is a Windows managed service account user failed.
// *Action: Examine the accompanying error messages for details.
/
1025, IS_SERVICE_USER_LSA_FAILED, "Failed to determine if the Oracle home service user for Oracle home \"{0}\" is the built in LocalSystem account"
//  *Cause: An attempt to determine if the Oracle home service user for the Oracle home specified is the built in LocalSystem account failed.
// *Action: Examine the accompanying error messages for details.
/
1026, IS_SERVICE_USER_LSERVICE_FAILED, "Failed to determine if the Oracle home service user for Oracle home \"{0}\" is the built in LocalService account"
//  *Cause: An attempt to determine if the Oracle home service user for the Oracle home specified is the built in LocalService account failed.
// *Action: Examine the accompanying error messages for details.
/
1027, IS_SERVICE_USER_PASSWORD_FAILED, "Unable to determine if the Oracle home service user for Oracle home \"{0}\" is a Windows built in user or managed service account user"
//  *Cause: An attempt to determine if user specified is a Windows built in user or managed service account user failed.
// *Action: Examine the accompanying error messages for details.
/
1028, IS_SERVICE_USER_PASSWORD_FAILED_NODE, "Unable to determine if the Oracle home service user for Oracle home \"{0}\" is a Windows built in user or managed service account user on nodes \"{1}\""
//  *Cause: An attempt to determine if user specified is a Windows built in user or managed service account user on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1029, SET_HOME_TYPE_FAILED, "Failed to set the Oracle home type as \"{0}\" for Oracle home \"{1}\""
//  *Cause: An attempt to set specified type as the Oracle home type for specified Oracle home failed.
// *Action: Examine the accompanying error messages for details.
/
1030, SET_HOME_TYPE_FAILED_NODE, "Failed to set the Oracle home type as \"{0}\" for home \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to set specified type as the Oracle home type for specified home on the specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
1031, GET_HOME_TYPE_FAILED, "Failed to get the Oracle home type for Oracle home \"{0}\""
//  *Cause: An attempt to get the Oracle home type for Oracle home at the path specified failed.
// *Action: Examine the accompanying error messages for details.
/
1032, GET_HOME_TYPE_FAILED_NODE, "Failed to get the Oracle home type for Oracle home \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to get the Oracle home type for Oracle home at the path specified on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1033, GET_SERVICE_USER_FOR_OHOME_FAILED_NODE, "Failed to get the Oracle home service user on node \"{0}\""
//  *Cause: An attempt to get the Oracle home service user for current Oracle home on the node specified failed.
// *Action: Examine the accompanying error messages for details.
/
1034, IS_SERVICE_USER_LSA_FAILED_NODE, "Failed to determine if Oracle home service user for Oracle home \"{0}\" is the built in LocalSystem account on node \"{1}\""
//  *Cause: An attempt to determine if the Oracle home service user for the Oracle home specified on the nodes specified is the built in LocalSystem account failed.
// *Action: Examine the accompanying error messages for details.
/
1035, ORACLE_HOME_ENV_ERROR, "Failed to locate Oracle home"
//  *Cause: An error occurred while attempting to retrieve value of environment variable ORACLE_HOME.
// *Action: Set ORACLE_HOME environment variable to point to current Oracle home path.
/
1036, CHECK_USER_PRIVILEGE_FAILED, "Failed to determine the operating system privileges granted to Windows user \"{0}\""
//  *Cause: An attempt to determine the operating system privileges granted to Windows user specified failed.
// *Action: Examine the accompanying error messages for details.
/
1037, CHECK_USER_PRIVILEGE_FAILED_NODE, "Failed to determine the operating system privileges granted to Windows user \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to determine the operating system privileges granted to Windows user specified on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1038, GRANT_USER_PRIVILEGE_FAILED, "Failed to grant Windows user \"{0}\" operating system privileges required for Oracle home type \"{1}\""
//  *Cause: An attempt to grant the required operating system privileges for specified Oracle home type to specified Windows user failed.
// *Action: Examine the accompanying error messages for details.
/
1039, GRANT_USER_PRIVILEGE_FAILED_NODE, "Failed to grant Windows user \"{0}\" operating system privileges required for Oracle home type \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to grant the required operating system privileges for specified Oracle home type to specified Windows user on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1040, REVOKE_USER_PRIVILEGE_FAILED, "Failed to revoke operating system privileges from Windows user \"{0}\" granted for owning Oracle home type \"{1}\""
//  *Cause: An attempt to revoke operating system privileges granted to specified Windows user for owning specified Oracle home type failed.
// *Action: Examine the accompanying error messages for details.
/
1041, REVOKE_USER_PRIVILEGE_FAILED_NODE, "Failed to revoke operating system privileges from Windows user \"{0}\" granted for Oracle home type \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to revoke operating system privileges granted to specified Windows user for owning specified Oracle home type on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1042, SET_ACL_FOR_USER_FAILED, "Failed to add Windows access control list (ACL) entry for user \"{0}\" for path \"{1}\""
//  *Cause: An attempt to add Windows access control list entry for user specified to the path specified failed.
// *Action: Examine the accompanying error messages for details.
/
1043, SET_ACL_FOR_USER_FAILED_NODE, "Failed to add Windows access control list (ACL) entry for user \"{0}\" for path \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to add Windows access control list entry for user specified to the path specified failed on nodes specified.
// *Action: Examine the accompanying error messages for details.
/
1044, REVOKE_ACL_FOR_USER_FAILED, "Failed to remove Windows access control list (ACL) entry for user \"{0}\" for path \"{1}\""
//  *Cause: An attempt to remove Windows access control list entry for user specified from the path specified failed.
// *Action: Examine the accompanying error messages for details.
/
1045, REVOKE_ACL_FOR_USER_FAILED_NODE, "Failed to remove Windows access control list (ACL) entry for user \"{0}\" for path \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to remove Windows access control list entry for user specified from the path specified failed on nodes specified.
// *Action: Examine the accompanying error messages for details.
/
1046, CHECK_ACL_FOR_USER_FAILED, "Failed to verify if Windows access control list (ACL) entry exists for user \"{0}\" for path \"{1}\""
//  *Cause: An attempt to verify if Windows access control list entry exists for user specified for the path specified failed.
// *Action: Examine the accompanying error messages for details.
/
1047, CHECK_ACL_FOR_USER_FAILED_NODE, "Failed to verify Windows access control list (ACL) entry for user \"{0}\" for path \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to verify if Windows access control list entry exists for user specified for the path specified failed on nodes specified.
// *Action: Examine the accompanying error messages for details.
/
1048, MISSING_PRIVILEGE, "Windows user \"{0}\" does not have privileges \"{1}\" required for owning Oracle home \"{2}\""
//  *Cause: An attempt to verify if the specified Windows user has all privileges required for owning Oracle home type specified found that user did not have some of the privileges required.
// *Action: Grant the privileges specified to the user.
/
1049, MISSING_PRIVILEGE_NODE, "Windows user \"{0}\" does not have privileges \"{1}\" required for owning Oracle home \"{2}\" on node \"{3}\""
//  *Cause: An attempt to verify if the specified Windows user has all privileges required for owning Oracle home type specified on node specified found that user did not have some of the privileges required.
// *Action: Grant the privileges specified to the user.
/
1050, INVALID_SERVICE_PATH, "The path \"{0}\" specified as Windows service executable file for Windows service \"{1}\" is invalid"
//  *Cause: An invalid value was supplied as Windows service executable file for the specified Windows service.
// *Action: Specify the full file system path to a valid executable file, without wild card characters and not exceeding 260 characters long.
/
1051, UPDATE_SERVICE_PATH_FAILED, "Failed to update executable file to \"{1}\" for the Windows service \"{0}\""
//  *Cause: An attempt to update the file from which specified Windows service runs to specified file failed.
// *Action: Examine the accompanying error messages for details.
/
1052, UPDATE_SERVICE_PATH_FAILED_NODE, "Failed to update executable file to \"{1}\" for the Windows service \"{0}\" on nodes \"{2}\""
//  *Cause: An attempt to update the file from which specified Windows service runs to specified file on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1053, UPDATE_SERVICE_PASSWD_FAILED, "Failed to update the Windows service \"{0}\" user password for Windows user \"{1}\""
//  *Cause: An attempt to update the password for specified Windows user in the specified Windows service failed.
// *Action: Examine the accompanying error messages for details.
/
1054, UPDATE_SERVICE_PASSWD_FAILED_NODE, "Failed to update the Windows service \"{0}\" user password for Windows user \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to update the password for specified Windows user in the specified Windows service on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1055, UPDATE_SERVICE_BOTH_FAILED, "Failed to update executable file to \"{2}\" and username and password for Windows user \"{1}\" for the Windows service \"{0}\""
//  *Cause: An attempt to update the executable file, username and password to specified values for specified Windows service failed.
// *Action: Examine the accompanying error messages for details.
/
1056, UPDATE_SERVICE_BOTH_FAILED_NODE, "Failed to update executable file to \"{2}\" and username and password for Windows user \"{1}\" for the Windows service \"{0}\" on nodes \"{3}\""
//  *Cause: An attempt to update the executable file, username and password to specified values for specified Windows service on specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
1057, INVALID_SERVICE_ACCESS, "Invalid value {0} specified for Windows service access type parameter while creating the service \"{1}\""
//  *Cause: An invalid value was supplied for Windows service access type parameter while creating specified Windows service.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1058, INVALID_SERVICE_DEPENDENCY, "Service dependency list contains null or empty Windows service names while creating Windows service \"{0}\""
//  *Cause: An invalid value was contained in service dependency list supplied while creating the specified Windows service.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1059, CREATE_SERVICE_FAILED, "Failed to create Windows service \"{0}\""
//  *Cause: An attempt to create specified Windows service failed.
// *Action: Examine the accompanying error messages for details.
/
1060, CREATE_SERVICE_FAILED_NODE, "Failed to create Windows service \"{0}\" on nodes \"{1}\"" 
//  *Cause: An attempt to create specified Windows service on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1061, DELETE_SERVICE_FAILED, "Failed to delete Windows service \"{0}\""
//  *Cause: An attempt to delete specified Windows service failed.
// *Action: Examine the accompanying error messages for details.
/
1062, DELETE_SERVICE_FAILED_NODE, "Failed to delete Windows service \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to delete specified Windows service on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1063, IS_SERVICE_LSA, "Failed to determine if the Windows service \"{0}\" will run as the built in LocalSystem account"
//  *Cause: An attempt to determine if the specified Windows service will run as the built in LocalSystem account failed.
// *Action: Examine the accompanying error messages for details.
/
1064, IS_SERVICE_LSA_NODE, "Failed to determine if the Windows service \"{0}\" will run as the built in LocalSystem account on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows service on the nodes specified will run as the built in LocalSystem account failed.
// *Action: Examine the accompanying error messages for details.
/
1065, GET_SERVICE_USER_FAILED, "Failed to get the user account for the Windows service \"{0}\""
//  *Cause: An attempt to get the user account the specified Windows service runs as failed.
// *Action: Examine the accompanying error messages for details.
/
1066, GET_SERVICE_USER_FAILED_NODE, "Failed to get the user account for the Windows service \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to get the user account the specified Windows service runs as on specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
1067, GET_ALL_SERVICE_FOR_HOME_FAILED, "Failed to retrieve a list of all Windows services that run as Windows user \"{0}\" from Oracle home \"{1}\""
//  *Cause: An attempt to get a list of all Windows services that run as specified Windows user from specified Oracle home failed.
// *Action: Examine the accompanying error messages for details.
/
1068, GET_ALL_SERVICE_FOR_HOME_FAILED_NODE, "Failed to obtain a list of all Windows services that run as Windows user \"{0}\" from Oracle home \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to get a list of all Windows services that run as specified Windows user from specified Oracle home on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1069, UPDATE_SERVICE_PASSWD_FOR_HOME_FAILED, "Failed to update Windows user\'s password of all Windows services that run as Windows user \"{0}\" from Oracle home \"{1}\""
//  *Cause: An attempt to update Windows user\'s password of all Windows services that run as specified Windows user from specified Oracle home failed.
// *Action: Examine the accompanying error messages for details.
/
1070, UPDATE_SERVICE_PASSWD_FOR_HOME_FAILED_NODE, "Failed to update Windows user\'s password of all Windows services that run as Windows user \"{0}\" from Oracle home \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to update Windows user\'s password of all Windows services that run as specified Windows user from specified Oracle home on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1071, INVALID_CREDENTIALS_FOR_SERVICE, "Failed to update Windows service \"{0}\" username to \"{1}\" because it differs from Oracle home user \"{2}\""
//  *Cause: An attempt to update the Windows service execution user account failed because the specified user is not the Oracle home service user.
// *Action: All services from a home will run as the Oracle home service user.
/
1072, GET_ALL_SERVICE_FOR_USER_FAILED, "Failed to obtain a list of all Windows services that run as Windows user \"{0}\""
//  *Cause: An attempt to obtain a list of all Windows services that run as specified Windows user failed.
// *Action: Examine the accompanying error messages for details.
/
1073, GET_ALL_SERVICE_FOR_USER_FAILED_NODE, "Failed to obtain a list of all Windows services that run as Windows user \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to get a list of all Windows services that run as specified Windows user on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1074, UPDATE_SERVICE_PASSWD_FOR_USER_FAILED, "Failed to update Windows user's password for all Windows services that run as Windows user \"{0}\""
//  *Cause: An attempt to update Windows user's password for all Windows services that run as specified Windows user from specified Oracle home failed.
// *Action: Examine the accompanying error messages for details.
/
1075, UPDATE_SERVICE_PASSWD_FOR_USER_FAILED_NODE, "Failed to update Windows user's password for all Windows services that run as Windows user \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to update Windows user's password for all Windows services that run as specified Windows user from specified Oracle home on nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1076, CREATE_GROUP_FAILED, "Windows group \"{0}\" could not be created"
//  *Cause: An attempt to create the specified Windows group failed.
// *Action: Examine the accompanying error messages for details.
/
1077, CREATE_GROUP_FAILED_NODE, "Windows user \"{0}\" could not be created on nodes \"{1}\""
//  *Cause: An attempt to create the specified Windows group on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1078, DELETE_GROUP_FAILED, "Windows group \"{0}\" could not be removed"
//  *Cause: An attempt to remove the specified Windows group failed.
// *Action: Examine the accompanying error messages for details.
/
1079, DELETE_GROUP_FAILED_NODE, "Windows group \"{0}\" could not be removed on nodes \"{1}\""
//  *Cause: An attempt to remove the specified Windows group on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1080, IS_GROUP_EXISTS_FAILED, "Unable to determine if Windows group \"{0}\" exists"
//  *Cause: An attempt to determine if the specified Windows group exists failed.
// *Action: Examine the accompanying error messages for details.
/
1081, IS_GROUP_EXISTS_FAILED_NODE, "Unable to determine if Windows group \"{0}\" exists on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows group exists on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1082, ADD_MEMBER_TO_GROUP_FAILED, "Failed to add Windows user or Windows group \"{1}\" to Windows group \"{0}\""
//  *Cause: An attempt to add the specified Windows user or Windows group as member of the specified Windows group failed.
// *Action: Examine the accompanying error messages for details.
/
1083, ADD_MEMBER_TO_GROUP_FAILED_NODE, "Failed to add Windows user or Windows group \"{1}\" to Windows group \"{0}\" on nodes \"{2}\""
//  *Cause: An attempt to add the specified Windows user or Windows group as a member of the specified Windows group on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1084, REMOVE_MEMBER_FROM_GROUP_FAILED, "Failed to remove Windows user or Windows group \"{1}\" from Windows group \"{0}\""
//  *Cause: An attempt to remove the specified Windows user or Windows group from the specified Windows group failed.
// *Action: Examine the accompanying error messages for details.
/
1085, REMOVE_MEMBER_FROM_GROUP_FAILED_NODE, "Failed to remove Windows user or Windows group \"{1}\" from Windows group \"{0}\" on nodes \"{2}\""
//  *Cause: An attempt to remove the specified Windows user or Windows group from the specified Windows group on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1086, IS_MEMBER_OF_GROUP_FAILED, "Unable to determine if Windows user or Windows group \"{1}\" is a member of Windows group \"{0}\""
//  *Cause: An attempt to determine if the specified Windows user or Windows group is a member of the specified Windows group failed.
// *Action: Examine the accompanying error messages for details.
/
1087, IS_MEMBER_OF_GROUP_FAILED_NODE, "Unable to determine if Windows user or Windows group \"{1}\" is a member of Windows group \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to determine if the specified Windows user or Windows group is a member of the specified Windows group on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.
/
1088, INVALID_GROUP_NAME, "The Windows group name \"{0}\" is invalid"
//  *Cause: An invalid value was supplied as Windows group name.
// *Action: The Windows group name must be between 0 and 256 characters long.
/
1089, INVALID_GROUP_DESCRIPTION, "The description text \"{0}\" for Windows group \"{1}\" is invalid"
//  *Cause: An invalid value was supplied as description text for specified Windows group name.
// *Action: The description text supplied must be between 0 and 256 characters long.
/
1090, INVALID_ELEMENT_REMOTE_NODENAMES, "{0} Element in remote node name list contains null or empty node name"
//  *Cause: An invalid value was contained in remote node names list.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1091, CHECK_USER_TYPE_FAILED, "Failed to verify that user name \"{0}\" is a valid Windows user"
//  *Cause: An attempt to verify if the specified user name is a valid Windows user failed.
// *Action: Examine the accompanying error messages for details.
/
1092, USER_NOT_EXISTS, "The user name \"{0}\" does not exist as a Windows user"
//  *Cause: The specified user name was not a valid Windows user name.
// *Action: Specify a valid Windows user name.
/
1093, CONVERT_SID_TO_USERNAME_FAILED, "Failed to convert Windows security identifier \"{0}\" to a Windows user name"
//  *Cause: An attempt to convert the specified Windows security identifier to a Windows user name failed.
// *Action: Examine the accompanying error messages for details.
/
1094, ADD_ACL_FOR_USER_FAILED, "Failed to add a Windows access control entry for user \"{0}\" to Windows access control list for path \"{1}\""
//  *Cause: An attempt to add Windows access control list entry the specified user and path failed.
// *Action: Examine the accompanying error messages for details.
/
1095, ADD_ACL_FOR_USER_FAILED_NODE, "Failed to add a Windows access control entry for user \"{0}\" to Windows access control list for path \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to add Windows access control list entry for the specified user and path failed on nodes specified.
// *Action: Examine the accompanying error messages for details.
/
1096, IS_VALID_PASSWORD_FAILED, "Unable to determine if the password meets the requirements of the password policy"
//  *Cause: An attempt to determine if password meets the policy has failed.
// *Action: Examine the accompanying error messages for details.
/
1097, IS_EXISTS_LOCAL_ACCOUNT_ON_NODE_FAILED, "Unable to determine if a local account for user \"{0}\" exists on node \"{1}\""
//  *Cause: An attempt to determine if the indicated local user account exists on the identified node has failed.
// *Action: Examine the accompanying error messages for details.
/
1098, GET_USER_DOMAIN_NAME_FAILED, "Unable to determine the Windows domain name for user \"{0}\""
//  *Cause: An attempt to determine the Windows domain name of indicated user account has failed.
// *Action: Examine the accompanying error messages for details.
/
1099, MIGRATE_DB_SIDS_UPGRADE_FAILED, "failed to migrate database services from Windows group \"ORA_ASMDBA\" to Windows group \"ORA_ASMADMIN\"" 
//  *Cause: During the Oracle Clusterware upgrade, an attempt to migrate
//          database services from Windows group 'ORA_ASMDBA' to Windows group 
//          'ORA_ASMADMIN' failed.
// *Action: Examine the accompanying error messages for details.
/
1100, MIGRATE_DB_SIDS_DOWNGRADE_FAILED, "failed to migrate database services from Windows group \"ORA_ASMADMIN\" to Windows group \"ORA_ASMDBA\"" 
//  *Cause: During the Oracle Clusterware downgrade, an attempt to migrate 
//          database services from Windows group 'ORA_ASMADMIN' to Windows 
//          group 'ORA_ASMDBA' failed.
// *Action: Examine the accompanying error messages for details.
/
1101, IS_GROUPMSA_FAILED, "failed to determine if user \"{0}\" is a Windows Group Managed Service Account (GMSA) user"
//  *Cause: An attempt to determine if the user specified is a Windows Group
//          Managed Service Account (GMSA) user failed.
// *Action: Examine the accompanying error messages for details.
/
1102, IS_GROUPMSA_FAILED_NODE, "failed to determine if user \"{0}\" is a Windows Group Managed Service Account (GMSA) user on nodes \"{1}\""
//  *Cause: An attempt to determine if the user specified is a Windows Group
//          Managed Service Account (GMSA) user on specified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
1103, IS_SERVICE_USER_GMSA_FAILED, "failed to determine if the Oracle home service user for Oracle home \"{0}\" is a Windows Group Managed Service Account (GMSA) user"
//  *Cause: An attempt to determine if the Oracle home service user for the 
//          Oracle home specified was a Windows Group Managed Service Account 
//          (GMSA) user failed.
// *Action: Examine the accompanying error messages for details.
/
1104, IS_SERVICE_USER_GMSA_FAILED_NODE, "failed to determine if Oracle home service user for Oracle home \"{0}\" is a Windows Group Managed Service Account (GMSA) user on nodes \"{1}\""
//  *Cause: An attempt to determine if the Oracle home service user for the
//          Oracle home specified on the nodes specified was a Windows Group 
//          Managed Service Account (GMSA) user failed.
// *Action: Examine the accompanying error messages for details.
/
1105, IS_SERVICE_USER_VIRTUALACCOUNT_FAILED, "failed to determine if the Oracle home service user for Oracle home \"{0}\" is a Windows virtual account user"
//  *Cause: An attempt to determine if the Oracle home service user for the 
//          Oracle home specified was a Windows virtual account user failed.
// *Action: Examine the accompanying error messages for details.
/
1106, GET_SERVICE_SID_FAILED, "failed to retrieve the Windows service Security Identifier (SID) for Windows service \"{0}\""
//  *Cause: An attempt to get the Windows service Security Identifier (SID) for
//          for the specified Windows service failed. 
// *Action: Examine the accompanying error messages for details.
/
1107, IS_DOMAIN_CONTROLLER_FAILED, "failed to determine if the local node is a Windows domain controller"
//  *Cause: During pre-requisite verification for installation an attempt to
//          determine if the local node is a Windows domain controller failed.
// *Action: Examine the accompanying error messages for details.
/
1108, IS_DOMAIN_CONTROLLER_FAILED_NODE, "failed to determine if any of the nodes \"{0}\" are Windows domain controllers"
//  *Cause: During pre-requisite verification for installation an attempt to
//          determine if any of the specified nodes are Windows domain
//          controllers failed.
// *Action: Examine the accompanying error messages for details, resolve issues reported and retry the install.
/
1109, IS_USER_TYPE_SUPPORTED_FAILED, "failed to determine the Windows operating system version"
//  *Cause: During pre-requisite verification for installation an attempt to
//          determine the Windows operating system version failed.
// *Action: Examine the accompanying error messages for details, resolve issues reported and retry the install.
/
2000, ROOT_PASSWORD_NOT_VERIFIED_NODE, "Failed to verify the password for user \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to verify the specified user's password on nodes specified failed.
// *Action: Make sure that the password specified is correct and is same across all nodes
//          of the cluster. Examine the accompanying error messages for details.
/
2001, SUDO_PBRUN_EXISTENCE_NOT_VERIFIED_NODE, "File \"{0}\" was not found on nodes \"{1}\""
//  *Cause: An attempt to verify that the specified file exists failed on the nodes specified.
// *Action: Make sure that the path to the specified file exists on all nodes.
//          Make sure that the currently logged in user has read and execute 
//          permission on the file specified on nodes specified.
//          Also look at the accompanying error messages for details.
/
2002, SUDO_EXECUTION_NOT_VERIFIED_NODE, "Failed to execute command \"{0}\" using 'sudo' from path \"{1}\" as user \"{2}\" on nodes \"{3}\""
//  *Cause: An attempt to run the specified command as using 'sudo' from 
//          directory specified using the specified username and password on specfied nodes failed.
// *Action: Make sure that the path specified for the sudo command exists on all nodes.
//          Make sure that the specified user has permission to run the sudo command on all nodes.
//          Make sure that the command specified exists on all nodes. 
//          Make sure that the correct password was specified for the specified user.
//          Make sure that the specified user has sudo privileges granted on all nodes.
//          Also look at the accompanying error messages for details.
/
2003, ROOT_PASSWORD_NOT_VERIFIED, "Failed to verify the password for user \"{0}\""
//  *Cause: An attempt to verify specified user's password failed.
// *Action: Make sure that the password specified is correct and is same across all nodes
//          of the cluster. Examine the accompanying error messages for details.
/
2004, SUDO_PBRUN_EXISTENCE_NOT_VERIFIED, "File \"{0}\" was not found"
//  *Cause: An attempt to verify that the specified file exists failed.
// *Action: Make sure that the path to the specified file exists.
//          Make sure that the currently logged in user has read and execute 
//          permissions on the file specified.
//          Also look at the accompanying error messages for details.
/
2005, SUDO_EXECUTION_NOT_VERIFIED, "Failed to execute command \"{0}\" using 'sudo' from path \"{1}\" as user \"{2}\""
//  *Cause: An attempt to run the specified command as using 'sudo' from 
//          the path specified using the specified username failed.
// *Action: Make sure that the path specified for the sudo command exists.
//          Make sure that the specified user has permission to run the sudo command.
//          Make sure that the command specified exists. 
//          Make sure that the correct password was specified for the specified user.
//          Also look at the accompanying error messages for details.
/
2006, CHANNEL_FAILED, "Unable to establish SSH connection to node \"{0}\" to execute command \"{1}\""
//  *Cause: An attempt to connect to specified node to execute specified command using SSH failed.
// *Action: Make sure that the specified node is reachable.
//          Make sure that SSH daemon on the specified node is alive.
//          Also look at the accompanying error messages for details.
/
2007, SUDO_EXISTENCE_RUN_FAILED, "Failed to execute the command \"{0}\""
//  *Cause: An attempt to execute the specified command failed.
// *Action: Make sure that the path to the specified command exists.
//          Make sure that the currently logged in user has read and execute 
//          permissions on the file specified on nodes specified.
//          Also look at the accompanying error messages for details.
/
2008, SUDO_EXISTENCE_RUN_FAILED_NODE, "Failed to execute the command \"{0}\" on nodes \"{1}\""
//  *Cause: An attempt to execute the specified command failed on the nodes specified.
// *Action: Make sure that the path to the specified command exists on all nodes.
//          Make sure that the currently logged in user has read and execute 
//          permissions on the file specified on nodes specified.
//          Also look at the accompanying error messages for details.
/
2009, ROOT_COMMAND_EXECUTION_FAILED, "Failed to execute command \"{0}\" as root within {1} seconds on nodes \"{2}\""
//  *Cause: An attempt to run the specified command within the specified time on the nodes specified failed.
// *Action: Make sure that the specified command exists on all nodes.
//          Make sure that the specified command has execute permission on all nodes.
//          Make sure that the root user password specified is correct.
//          Also look at the accompanying error messages for details.
/
2010, SUDO_COMMAND_EXECUTION_FAILED, "Failed to execute command \"{0}\" using 'sudo' from location \"{1}\" as user \"{2}\" within {3} seconds on nodes \"{4}\""
//  *Cause: An attempt to run the specified command using 'sudo' from location specified 
//          as specified user within the specified time on the nodes specified failed.
// *Action: Make sure that the specified command exists on all nodes.
//          Make sure that the specified command has execute permission on all nodes.
//          Make sure that the location specified for sudo is correct.
//          Make sure that the user specified has sudo privileges.
//          Make sure that the correct password was specified for the user.
//          Also look at the accompanying error messages for details.
/
2011, PBRUN_COMMAND_EXECUTION_FAILED, "Failed to execute command \"{0}\" using 'pbrun' from location \"{1}\" as user \"{2}\" within {3} seconds on nodes \"{4}\""
//  *Cause: An attempt to run the specified command using 'pbrun' from location specified 
//          as specified user within the specified time on the nodes specified failed.
// *Action: Make sure that the specified command exists on all nodes.
//          Make sure that the specified command has execute permission on all nodes.
//          Make sure that the location specified for pbrun is correct.
//          Make sure that the user specified has pbrun privileges.
//          Make sure that the correct password was specified for the user.
//          Also look at the accompanying error messages for details.
/
2012, EXEC_START, "{0} configuration started"
// *Document: NO
// *Cause:
// *Action:
/
2013, EXEC_STOP, "{0} configuration ended"
// *Document: NO
// *Cause:
// *Action:
/
2014, SCRIPT_EXECUTION_FAILED, "Failed to execute command \"{0}\" on nodes \"{1}\""
// *Cause: An attempt to run the specified command on the nodes specified failed.
// *Action: Examine the accompanying error messages for details.  Ensure that the command
//  exists and is executable on the indicated nodes.
/
2015, UPGRADE_PENDING_ON_NODES, "Upgrade pending on following active nodes \"{0}\""
// *Cause: An attempt to forcibly complete the upgrade was rejected because 
// the indicated nodes are active and have not yet been upgraded.
// *Action: Upgrade the active nodes to complete the upgrade of the cluster. 
// If the nodes cannot be upgraded, shut down the nodes and retry the upgrade.
/
2016, CRED_DOMAIN_NOT_FOUND, "could not navigate to domain {0}, error details: \n{1}"
// *Cause: An error was encountered when looking for the specified domain of a credentials set.
// *Action: Ensure that an existing domain is being specified.
/
2017, CRED_INIT_FAILED, "could not obtain root credentials domain, CLS credentials return string: {0}, error details: {1}"
// *Cause: An error was encountered when initializing credentials root domain.  The root domain is part of the OCR within which all credentials domains are stored.  A domain is part of the OCR tree used to store credentials. 
// *Action: Check the included error details.
/
2018, CRED_DELETION_FAILED, "The deletion of credentials set failed. Error details: \n{0}"
// *Cause: An error was encountered when deleting a credentials set.
// *Action: Check the included error details.
/
2019, CREDSET_NOT_FOUND, "Credential set was not found in domain {0}. Error details: \n{1}"
// *Cause: Could not find the credentials set within the specified domain.
// *Action: Ensure that an existing domain is being specified, or insert appropriate credentials into the specified domain.
/
2020, CRED_DOMAIN_CREATION_FAILED, "the creation of domain {0} failed, CLS credentials return string: {1}, error details: {2}"
// *Cause: An error occurred while creating the credentials domain.
// *Action: Check the included error details.
/
2021, CREDSET_CREATION_FAILED, "The creation of the credentials set failed. Error details: \n{0}"
// *Cause: An error occurred while creating the credentials set.
// *Action: Check the included error details.
/
2022, CRED_IMPORT_WALLET_FAILED, "could not import wallet in file {0}, CLS credentials return string: {1}, error details: {2}"
// *Cause: An error occurred while importing the wallet.  The wallet must be stored in an auto-login wallet file.
// *Action: Check the wallet specified exists and that it is an auto-login wallet file with read permission on the file system.
/
2023, OCR_INIT_FAILED, "initialization of OCR context failed, error details: {0}"
// *Cause: An error occurred when initializing the OCR context
// *Action: Check the included error details.
/
2024, CREDMEMBER_DELETION_FAILED, "deletion of credentials set member in domain {0} failed, CLS credentials return string: {1}, error details: {2}"
// *Cause: An error occurred while deleting a credentials set member.
// *Action: Ensure the domain being specified exists and that the credentials set member was previously imported into the OCR.
/
2025, SUDO_INVALIDATE_CACHE_FAILED, "The 'sudo' credentials cache could not be invalidated using the command \"{0}\"."
// *Cause: An attempt to invalidate the 'sudo' credentials cache using the 
//         specified command failed.
// *Action: Make sure that the path to the specified command exists.
//          Make sure that the user currently logged in has read and execute 
//          permissions on the file specified.
//          Also, look at the accompanying error messages for details.
/
2026, SUDO_INVALIDATE_CACHE_FAILED_NODE, "The 'sudo' credentials cache could not be invalidated using the command \"{0}\" on nodes \"{1}\""
// *Cause: An attempt to invalidate the 'sudo' credentials cache using the 
//         specified command failed on the nodes specified.
// *Action: Make sure that the path to the specified command exists.
//          Make sure that the currently logged in user has read and execute 
//          permissions on the file specified on the nodes specified.
//          Also, look at the accompanying error messages for details.
/
2027, GET_CONNECTION_INFO_OTHER, "failed to get the connection information"
// *Cause: An error occurred while retrieving the connection information.
// *Action: This is an internal error. Contact Oracle Support Services.
/
2028, GET_CONNECTION_INFO_NONE, "There is no connection information."
// *Cause: An error occurred while retrieving the connection information because the connection information does not exist.
// *Action:  Use 'crsctl check crs' to make sure that the CRS stack is up; use the command 'srvctl status asm' to make sure that the ASM resource is running.
/
2029, GET_CONNECTION_INFO_OVERFLOW, "failed to get the connection information because the connection information fetch would exceed buffer"
// *Cause: An internal error occurred.
// *Action: Contact Oracle Support Services.
/
2030, IS_USER_EXIST_FAILED, "unable to determine the existence of operating system user account \"{0}\""
//  *Cause: An attempt to determine existence of the indicated operating system user account failed.
// *Action: Examine the accompanying error messages for details.
/
2031, IS_USER_EXIST_FAILED_NODE, "unable to determine if operating system user account \"{0}\" exist on nodes \"{1}\""
//  *Cause: An attempt to determine if the indicated operating system user account exist on the identified nodes failed.
// *Action: Examine the accompanying error messages for details.
/
2032, CRED_DOMAIN_DELETION_FAILED, "The deletion of credentials domain {0} failed. Error details:\n{1}"
// *Cause: An error occurred while deleting the credentials domain.
// *Action: Examine the accompanying error messages for details.
/
2033, CRED_DOMAIN_SET_ATTR_FAILED, "Failed to set attributes of credentials domain {0}. Error details:\n{1}"
// *Cause: An error occurred while setting attributes of the credentials domain.
// *Action: Examine the accompanying error messages for details.
/
2034, CRED_DOMAIN_GET_ATTR_FAILED, "Failed to get attributes of credentials domain {0}. Error details:\n{1}"
// *Cause: An error occurred while getting attributes of the credentials domain.
// *Action: Examine the accompanying error messages for details.
/
2035, CREDSET_ADD_USERPASS_FAILED, "Failed to set user name and password credentials for user {0}. Error details:\n{1}"
// *Cause: An error occurred while setting user name and password credentials.
// *Action: Examine the accompanying error messages for details.
/
2036, CREDSET_IMPORT_FROM_WALLET_FAILED, "Failed to import credentials from wallet path {0}. Error details:\n{1}"
// *Cause: An error occurred while importing credentials from the specified wallet path.
// *Action: Examine the accompanying error messages for details.
/
2037, CRED_DOMAIN_SET_OWNER_FAILED, "Failed to set user {0} as the owner of credentials domain {1}. Error details:\n{2}"
// *Cause: An error occurred while setting the specified user as the owner of the credentials domain.
// *Action: Examine the accompanying error messages for details.
/
2038, CRED_DOMAIN_NOT_EXISTS, "Failed to find credentials domain {0} under parent domain {1}. Error details:\n{2}"
// *Cause: The specified domain did not exist under the specified parent domain.
// *Action: Ensure that an existing domain is specified.
/
2039, CRED_DOMAIN_ALREADY_EXISTS, "Credentials domain {0} already exists under parent domain {1} when the domain is not expected to exist. Error details:\n{2}"
// *Cause: The specified domain was already in existence under the specified parent domain.
// *Action: Ensure that a new domain is specified.
/
2040, OVMM_RETRIEVE_FAILED_NOT_EXISTS, "failed to retrieve Oracle VM Manager information because Oracle VM Manager is not configured"
// *Cause: An attempt to retrieve Oracle VM Manager information failed because it was not configured.
// *Action: Configure Oracle VM Manager in the cluster.
/
2041, OVMM_REMOVE_FAILED_NOT_EXISTS, "failed to remove Oracle VM Manager because Oracle VM Manager is not configured"
// *Cause: An attempt to remove Oracle VM Manager failed because it was not configured.
// *Action: Configure Oracle VM Manager in the cluster.
/
2042, OVMM_REMOVE_FAILED_VM_EXISTS, "Failed to remove Oracle VM Manager because one or more VM resources are configured. Names of the configured VM resources: {0}."
// *Cause: An attempt to remove Oracle VM Manager failed because one or more VM resources were still configured.
// *Action: Ensure that all VM resources are removed before issuing this command.
/
2043, CRED_DOMAIN_NOT_EXISTS_UNDER_ROOT, "Failed to find credentials domain {0} under the root domain. Error details:\n{1}"
// *Cause: The specified domain did not exist under the root domain.
// *Action: Ensure that an existing domain is specified.
/
2044, OVMM_CREATE_FAILED_CRED, "failed to create Oracle VM Manager because a credentials error occurred"
// *Cause: An attempt to create Oracle VM Manager failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2045, OVMM_CREATE_FAILED_GIUSER, "failed to create Oracle VM Manager because the Oracle Grid Infrastructure user could not be identified"
// *Cause: An attempt to create Oracle VM Manager failed because an error occurred while retrieving the Grid Infrastructure user.
// *Action: Examine the accompanying error messages for details. 
/
2046, OVMM_MODIFY_FAILED_CRED, "failed to modify Oracle VM Manager information because a credentials error occurred"
// *Cause: An attempt to modify Oracle VM Manager information failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2047, OVMM_MODIFY_FAILED_GIUSER, "failed to modify Oracle VM Manager because the Oracle Grid Infrastructure user could not be identified"
// *Cause: An attempt to modify Oracle VM Manager failed because an error occurred while retrieving the Grid Infrastructure user.
// *Action: Examine the accompanying error messages for details. 
/
2048, OVMM_RETRIEVE_FAILED_CRED, "failed to retrieve Oracle VM Manager information because a credentials error occurred"
// *Cause: An attempt to retrieve Oracle VM Manager failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2049, OVMM_REMOVE_FAILED_CRED, "failed to remove Oracle VM Manager because a credentials error occurred"
// *Cause: An attempt to remove Oracle VM Manager failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2050, OVMM_REMOVE_FAILED_VM, "failed to remove Oracle VM Manager because the details on VM resources could not be retrieved"
// *Cause: An attempt to remove Oracle VM Manager failed because an error occurred while retrieving the details on the configured VM resources.
// *Action: Examine the accompanying error messages for details. 
/
2051, OVMM_CREATE_FAILED_INVALID_WALLET, "failed to import credentials because a wallet did not exist at the specified path {0}" 
// *Cause: An error occurred while importing credentials because the specified path did not contain a wallet.
// *Action: Retry the operation making sure to specify the path of an existing wallet file.
/
2052, CRED_CREATE_WALLET_FAIL, "failed to create wallet credentials on credentials domain {0}"
// *Cause: An attempt to create wallet credentials failed.
// *Action: Examine the accompanying error messages for details. 
/
2053, CRED_CREATE_USERPASS_FAIL, "failed to create user name and password credentials on credentials domain {0}"
// *Cause: An error occurred while creating user name and password credentials on the specified credentials domain.
// *Action: Examine the accompanying error messages for details. 
/
2054, CRED_CREATE_SHAREDKEY_FAIL, "failed to create shared key credentials on credentials domain {0}"
// *Cause: An error occurred while creating shared key credentials on the specified credentials domain.
// *Action: Examine the accompanying error messages for details. 
/
2055, CRED_SET_DOM_ATTR_FAIL, "Failed to set attributes for credentials domain {0}. Error details:\n{1}"
// *Cause: An error occurred while setting attributes for the specified credentials domain.
// *Action: Examine the accompanying error messages for details. 
/
2056, OVMM_MODIFY_FAILED_CRED_1, "Partially failed to modify Oracle VM Manager information. Wallet credentials were successfully modified."
// *Cause: An attempt to modify user name and password credentials failed while modifying Oracle VM Manager information. Wallet credentials were successfully modified with the specified wallet file, but user name and password credentials, Oracle VM Manager host, and Oracle VM Manager port were not modified.
// *Action: Examine the accompanying error messages for details. 
/
2057, OVMM_MODIFY_FAILED_CRED_2, "Partially failed to modify Oracle VM Manager information. Wallet credentials and user name and password credentials were successfully modified."
// *Cause: An attempt to modify Oracle VM Manager host and Oracle VM Manager port failed while modifying Oracle VM Manager information. Wallet credentials and user name and password credentials were successfully modified with the specified wallet file and the specified user name and password respectively, but Oracle VM Manager host and Oracle VM Manager port were not modified.
// *Action: Examine the accompanying error messages for details. 
/
2058, CREDSET_ADD_SHAREDKEY_FAILED, "Failed to set shared key credentials. Error details:\n{0}"
// *Cause: An error occurred while setting shared key credentials.
// *Action: Examine the accompanying error messages for details.
/
2059, CRED_USERPASS_SET_NOT_EXISTS, "Failed to retrieve a user name and password credentials set in credentials domain {0}. Error details:\n{1}"
// *Cause: The user name and password credentials set was not found in the specified credentials domain.
// *Action: Examine the accompanying error messages for details. 
/
2060, CRED_USERPASS_SET_NOT_FOUND, "Failed to retrieve a user name and password credentials set in credentials domain {0}. Error details:\n{1}"
// *Cause: An attempt to retrieve the user name and password credentials set in the specified credentials failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2061, CRED_USERNAME_NOT_FOUND, "Failed to retrieve the user name for the credentials in credentials domain {0}. Error details:\n{1}"
// *Cause: An attempt to retrieve the user name for the credentials in the specified credentials domain failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2062, OVMM_RETRIEVE_USERNAME_FAILED_NOT_EXISTS, "failed to retrieve Oracle VM Manager user name because Oracle VM Manager is not configured"
// *Cause: An attempt to retrieve the Oracle VM Manager user name failed because it was not configured.
// *Action: Configure Oracle VM Manager in the cluster using the command 'srvctl add ovmm'.
/
2063, OVMM_RETRIEVE_USERNAME_FAILED_CRED, "failed to retrieve Oracle VM Manager user name because a credentials error occurred"
// *Cause: An attempt to retrieve the Oracle VM Manager user name failed because an error related to the credentials occurred.
// *Action: Examine the accompanying error messages for details. 
/
2064, CRED_TARGET_CREATION_FAILED, "Could not create target {0} for path {1}. Error details:\n{2}"
// *Cause: An error was encountered when creating the target for the path specified.
// *Action: Examine the accompanying error messages for details. Address the issues reported and retry the command.
/
2065, CREDSET_ALREADY_EXISTS, "The credential set with type \"{0}\" already exists for domain \"{1}\". Error details:\n{2}"
//  *Cause: An attempt to create a credential set failed because it already exists.
// *Action: Evaluate the need for the command. If necessary, remove the credential set and then add it.
/
2066, CREDSET_NOT_EXISTS, "Failed to find credential set with type \"{0}\" under domain {1}. Error details:\n{2}"
// *Cause: The requested operation failed because the credential set did not exist.
// *Action: Ensure that a domain with a credential set is specified.
/
2067, CRED_DOMAIN_ALREADY_EXISTS_UNDER_ROOT, "Credentials domain {0} already exists under root domain. Error details:\n{1}"
// *Cause: The specified domain was already in existence under the root domain.
// *Action: Ensure that a new domain is specified.
/
2068, CRED_MEMBER_DELETION_FAILED, "The deletion of credentials with ID \"{0}\" failed. Error details:\n{1}"
// *Cause: An error occurred while deleting the credentials member.
// *Action: Examine the accompanying error messages for details.
/
2069, CRED_MEMBER_NOT_FOUND, "Failed to get a credential with ID \"{0}\". Error details:\n{1}"
// *Cause: The requested operation failed because an error occurred while getting the credential member specified.
// *Action: Examine the accompanying error messages for details. Address the issues reported and retry the command.
/
2070, CRED_KEYPAIR_CREATION_FAILED, "Failed to create key pair credentials. Error details:\n{0}"
// *Cause: An error occurred while creating key pair credentials.
// *Action: Examine the accompanying error messages for details.
/
2071, CREDSET_ATTR_FAILED, "Failed to set attributes of the credential set. Error details:\n{0}"
// *Cause: An error occurred while setting attributes of the credential set.
// *Action: Examine the accompanying error messages for details.
/
2072, CRED_MEMBER_ATTR_FAILED, "Failed to set attributes of credentials with ID \"{0}\". Error details:\n{1}"
// *Cause: An error occurred while setting attributes of the credential member.
// *Action: Examine the accompanying error messages for details.
/
2073, CREDSET_GET_ATTR_FAILED, "Failed to get attributes of the credential set. Error details:\n{0}"
// *Cause: An error occurred while getting attributes of the credential set.
// *Action: Examine the accompanying error messages for details.
/
2074, CRED_MEMBER_GET_ATTR_FAILED, "Failed to get attributes of credentials with ID \"{0}\". Error details:\n{1}"
// *Cause: An error occurred while getting attributes of the credential member.
// *Action: Examine the accompanying error messages for details.
/
2075, CRED_SHAREDKEY_CREATION_FAILED, "Failed to create shared key credentials. Error details:\n{0}"
// *Cause: An error occurred while creating shared key credentials.
// *Action: Examine the accompanying error messages for details.
/
2076, CRED_WALLET_CREATION_FAILED, "Failed to create wallet credentials. Error details:\n{0}"
// *Cause: An error occurred while creating wallet credentials.
// *Action: Examine the accompanying error messages for details.
/
2077, CRED_IMPORT_FAILED, "Failed to import credentials from file {0}. Error details: \n{1}"
// *Cause: An error occurred while importing the credentials from the file specified.
// *Action: Examine the accompanying error messages for details.
/
2079, CRED_IMPORT_BUFFER_FAILED, "Failed to import credentials from the content provided. Error details: \n{0}"
// *Cause: An error occurred while importing the credentials from the content specified.
// *Action: Examine the accompanying error messages for details.
/
2080, CRED_EXPORT_FAILED, "Failed to export credentials to file {0}. Error details: \n{1}"
// *Cause: An error occurred while exporting the credentials to the file specified.
// *Action: Examine the accompanying error messages for details.
/
2081, CRED_EXPORT_BUFFER_FAILED, "Failed to export credentials. Error details: \n{0}"
// *Cause: An error occurred while exporting the credentials.
// *Action: Examine the accompanying error messages for details.
/
2082, TARGET_ALREADY_EXISTS, "The target \"{0}\" already exists for domain \"{1}\". Error details:\n{2}"
//  *Cause: An attempt to create a target failed because it already exists.
// *Action: Examine the accompanying error messages for details.
/
2083, CRED_COUNT_FAILED, "Failed to count credentials in the credential set. Error details: \n{0}"
// *Cause: An error occurred while counting the credentials in the credential set.
// *Action: Examine the accompanying error messages for details.
/
2084, CREDSET_METHOD_FAILED, "failed to create \"{0}\" credentials in credential set with type \"{1}\""
// *Cause: An error occurred while creating the credentials because the credential set type is not valid.
// *Action: Use the correct credential set or create the credential according to the credential set type.
/
2085, FILE_ALREADY_EXISTS, "failed to export credentials to the XML file \"{0}\" because it already exists"
//  *Cause: A request to export credentials to an XML file failed because it already exists.
// *Action: Delete or rename the existing file or choose a different file name.
/
2086, CRED_DOMAIN_GET_ATTR_NOTFOUND, "failed to get attributes of credentials domain \"{0}\" because the attribute name was not found"
// *Cause: An error occurred while getting attributes of the credentials domain.
// *Action: Verify that the keys provided exists in the domain attributes.
/
2087, CRED_MEMBER_GET_ATTR_NOTFOUND, "failed to get attributes of credentials with ID \"{0}\" because the attribute name was not found"
// *Cause: An error occurred while getting attributes of the credential member.
// *Action: Verify that the keys provided exist in the credential attributes.
/
2088, CREDSET_GET_ATTR_NOTFOUND, "failed to get attributes of the credential set because the attribute name was not found"
// *Cause: An error occurred while getting attributes of the credential set.
// *Action: Verify that the keys provided exist in the credential set attributes.
/
2090, CHANNEL_FAILED_KNOWN_HOSTS, "failed to create host key repository from file \"{0}\" to establish SSH connection to node \"{1}\""
//  *Cause: Creation of a host key repository for an SSH connection to the 
//          indicated node failed.
// *Action: Make sure that the specified file path is accessible.
//          Make sure that the host key entries in the file are not corrupted.
//          Also look at the accompanying error messages for details.
/
2091, RTE_NATIVE_ADDARG_FAIL, "Failed to add an argument to a resource template argument list because an error occurred in the resource template engine. Error details:\n{0}"
// *Cause: An attempt to add an argument to a resource template argument list failed. The additional error details included with the message provide further explanation.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command. 
/
2092, RTE_NATIVE_ADDLISTARG_FAIL, "Failed to add a list argument to a resource template argument list because an error occurred in the resource template engine. Error details:\n{0}"
// *Cause: An attempt to add a list argument to a resource template argument list failed. The additional error details included with the message provide further explanation.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command.
/
2093, RTE_NATIVE_EVALATTR_FAIL, "Failed to evaluate a resource template attribute value because an error occurred in the resource template engine. Error details:\n{0}"
// *Cause: An attempt to retrieve a resource template attribute value failed. The additional error details included with the message provide further explanation.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command. 
/
2094, RTE_NATIVE_GETARGLIST_FAIL, "Failed to get a resource template argument list because an error occurred in resource template engine. Error details:\n{0}"
// *Cause: An attempt to retrieve a resource template argument list failed. The additional error details included with the message provide further explanation.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command. 
/
2095, RTE_EVALATTR_FAIL, "failed to evaluate a resource template attribute value for resource {0} with resource template arguments {1}"
// *Cause: An attempt to evaluate a resource template attribute value for the specified resource with the specified resource template arguments failed. The additional error details included with the message provide further explanation.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command.
/
2096, RTE_GETARGLIST_FAIL, "failed to get a resource template argument list for resource {0} with resource template arguments {1}"
// *Cause: An attempt to retrieve a resource template argument list for the specified resource with the specified resource template arguments failed. The additional error details included with the message provide further explanation.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command. 
/
2097, CRED_TARGET_FAILED, "Failed to get the targets from domain \"{0}\". Error details:\n{1}"
// *Cause: The requested operation failed because an error occurred while getting the targets from the indicated domain.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command.
/
2098, OVMM_CREATE_FAILED_ALREADY_EXISTS, "Oracle VM Manager is already configured."
// *Cause: An attempt to create Oracle VM Manager was rejected because it was already configured.
// *Action: None. 
/
2099, CRED_NOT_EXISTS, "failed to find credentials with credential ID {0}"
// *Cause: The operation failed because credentials with the indicated credential ID did not exist.
// *Action: Reissue the command specifying a credential ID for which credentials exist.
/
2100, OVMM_HOST_INVALID, "The specified Oracle VM Manager host \"{0}\" is not valid."
//  *Cause: The creation or modification of Oracle VM Manager failed because the host specified was empty, invalid as a host name, or invalid as an IP address.
// *Action: Specify a valid Oracle VM Manager host name or IP address and retry the operation.
/
2101, OVMM_USERNAME_INVALID, "The specified Oracle VM Manager user name \"{0}\" is not valid."
//  *Cause: An empty value was provided for the Oracle VM Manager user name.
// *Action: Specify a valid Oracle VM Manager user name.
/
2102, INVALID_CRED_VALUE, "Invalid negative value for credential ID."
//  *Cause: An attempt to retrieve a credential was rejected because the specified value was less than 0.
// *Action: Retry the operation providing a valid credential ID.
/
2103, REMOTE_COMMAND_EXECUTION_FAILED, "Failed to execute command \"{0}\" on node \"{1}\" as user \"{2}\". Detailed error:\n{3}"
//  *Cause: An attempt to run the specified command as the specified user failed on the specified node due to the accompanying error data.
// *Action: Examine the accompanying error data for details, resolve issues raised and retry the command.
/
2104, GIMR_CLIENT_NOT_EXISTS, "failed to find GIMR properties for client \"{0}\""
// *Cause: A request to get the Grid Infrastructure Management Repository (GIMR) properties specified a GIMR client that did not exist in the credential store. 
// *Action: Ensure that an existing GIMR client is specified.
/
2105, ROOT_ASUSER_COMMAND_EXECUTION_FAILED, "failed to execute command \"{0}\" as user \"{1}\" using root credentials within {2} seconds on nodes \"{3}\""
//  *Cause: An attempt to run the specified command within the specified time on the nodes specified failed.
// *Action: Ensure that the specified command exists on all nodes.
//          Ensure that the specified command has execute permission on all nodes.
//          Ensure that the root user password specified is correct.
//          Examine the accompanying error messages for details, resolve issues raised and retry the command.
/
2106, CRED_CREATE_OVM_TARGET_FAILED , "failed to create Oracle VM Manager target for domain \"{0}\""
// *Cause: An attempt to create Oracle VM Manager credentials failed. The accompanying error messages provide failure details.
// *Action: Examine the accompanying error messages for details, resolve issues raised and retry the command. 
/
2107, CRED_SECTION_NOT_EXISTS, "failed to find section \"{0}\" in the cluster manifest file \"{1}\""
// *Cause: The indicated section did not exist in the cluster manifest file provided.
// *Action: Ensure that an existing section is specified, or use the correct cluster manifest file.
/
2120, CHANNEL_SFTP_FAILED, "unable to establish SFTP connection to node \"{0}\""
//  *Cause: An attempt to connect to the indicated node using 
//          SFTP failed.
// *Action: Ensure that the indicated node is reachable.
//          Ensure that the SSH daemon on the indicated node is running.
//          Examine the accompanying error messages, resolve the issues,
//          and retry the operation.
/
2121, CHANNEL_SFTP_CD_FAILED, "SFTP failure to change to directory \"{0}\" on node \"{1}\""
//  *Cause: An attempt to change to the indicated directory on the 
//          indicated node using SFTP failed. The accompanying messages 
//          provide detailed information about the failure.
// *Action: Ensure that the indicated directory exists on the indicated node
//          and that the connected user has read permission for that
//          directory. Resolve the problems described in the accompanying 
//          messages and retry the operation.
/
2122, CHANNEL_SFTP_LCD_FAILED, "SFTP failure to change to the local directory \"{0}\""
//  *Cause: An attempt to change to the indicated directory on the local node
//          using SFTP failed. The accompanying messages provide detailed 
//          information about the failure. 
// *Action: Ensure that the indicated directory exists on the local node
//          and that the connected user has read permission for that
//          directory. Resolve the problems described in the accompanying 
//          messages and retry the operation.
/
2123, CHANNEL_SFTP_PUT_FAILED, "SFTP failure to copy file \"{0}\" from local node to \"{1}\" on node \"{2}\""
//  *Cause: An attempt to copy the indicated file from the local node to
//          the indicated directory on the indicated node using SFTP
//          failed. The accompanying messages provide detailed 
//          information about the failure.
// *Action: Ensure that the indicated path on the indicated node exists
//          and is writable by the connected user. Resolve the problems 
//          described in the accompanying messages and retry the operation.
/
2124, CHANNEL_SFTP_GET_FAILED, "SFTP failure to copy file \"{0}\" from node \"{1}\" to \"{2}\" on local node"
//  *Cause: An attempt to copy the indicated file from the indicated node
//          to the indicated local directory using SFTP failed. 
//          The accompanying messages provide detailed information
//          about the failure.
// *Action: Ensure that the indicated file exists with read permission
//          on the indicated node and that the destination location exists
//          with write permission on the local node. Resolve the problems 
//          described in the accompanying messages and retry the operation.
/
2125, CHANNEL_SFTP_LIST_FAILED, "SFTP failure to list the content of directory \"{0}\" on node \"{1}\""
//  *Cause: An attempt to retrieve the list of files in the indicated 
//          directory on the indicated node using SFTP failed. The accompanying
//          messages provide detailed information about the failure.
// *Action: Ensure that the indicated directory on the indicated node exists
//          and the connected user has read permission.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2126, CHANNEL_SFTP_RENAME_FAILED, "SFTP failure to rename the file \"{0}\" to \"{1}\" on node \"{2}\""
//  *Cause: An attempt to rename the indicated file on the indicated node 
//          using SFTP failed. The accompanying messages provide detailed
//          information about the failure.
// *Action: Ensure that the connected user has write permission for
//          the indicated file on the indicated node. Resolve the problems   
//          described in the accompanying messages and retry the operation.
/
2127, CHANNEL_SFTP_RM_FAILED, "SFTP failure to remove file \"{0}\" from node \"{1}\""
//  *Cause: An attempt to delete the indicated file on the indicated node using
//          SFTP failed. The accompanying messages provide detailed information
//          about the failure.
// *Action: Ensure that the connected user has write permission for the
//          indicated file on the indicated node. Resolve the problems 
//          described in the accompanying messages and retry the operation.
/
2128, CHANNEL_SFTP_CHGRP_FAILED, "SFTP failure to change owner group for the file \"{0}\" to GID \"{1}\" on node \"{2}\""
//  *Cause: An attempt to change the owner group of the indicated file
//          to the indicated group ID on the indicated node using SFTP failed.
//          The accompanying messages provide detailed information about the
//          failure.
// *Action: Ensure that the connected user has write permission for the
//          indicated file on the indicated node.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2129, CHANNEL_SFTP_CHOWN_FAILED, "SFTP failure to change owning user of the file \"{0}\" to UID \"{1}\" on node \"{2}\""
//  *Cause: An attempt to change the ownership of the indicated file
//          to the indicated user ID on the indicated node using SFTP failed.
//          The accompanying messages provide detailed information about
//          the failure.
// *Action: Ensure that the connected user has write permission for the
//          indicated file on the indicated node.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2130, CHANNEL_SFTP_CHMOD_FAILED, "SFTP failure to change the permissions of the file \"{0}\" to \"{1}\" on node \"{2}\""
//  *Cause: An attempt to change the permissions of the indicated file to the
//          indicated permissions on the indicated node using SFTP failed.
//          The accompanying messages provide detailed information about
//          the failure.
// *Action: Ensure that the connected user has write permission for the
//          indicated file on the indicated node.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2131, CHANNEL_SFTP_RMDIR_FAILED, "SFTP failure to remove directory \"{0}\" from node \"{1}\""
//  *Cause: An attempt to remove the indicated directory on the indicated 
//          node using SFTP failed. The accompanying messages provide detailed 
//          information about the failure.
// *Action: Ensure that the indicated directory exists on the indicated node
//          and that the connected user has write permission for it.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2132, CHANNEL_SFTP_MKDIR_FAILED, "SFTP failure to create directory \"{0}\" on node \"{1}\""
//  *Cause: An attempt to create the indicated directory on the indicated 
//          node using SFTP failed. The accompanying messages provide detailed 
//          information about the failure.
// *Action: Ensure that the indicated directory does not already exist 
//          and also that the connected user has write permission for the
//          path at which the directory is being created.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2133, CHANNEL_SFTP_PWD_FAILED, "SFTP failure to retrieve the current working directory from node \"{0}\""
//  *Cause: An attempt to retrieve the current working directory from the
//          indicated node using SFTP failed. The accompanying messages provide
//          detailed information about the failure.
// *Action: Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2134, CHANNEL_SFTP_GET_HOMEDIR_FAILED, "SFTP failure to retrieve the home directory of the connected user from node \"{0}\""
//  *Cause: An attempt to retrieve the connected user's home directory from the
//          indicated node using SFTP failed. The accompanying messages provide
//          detailed information about the failure.
// *Action: Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2135, CHANNEL_SFTP_GET_ATTR_FAILED, "SFTP failure to retrieve the file attributes for path \"{0}\" from node \"{1}\""
//  *Cause: An attempt to retrieve the file attributes of the indicated file
//          or directory path from the indicated node using SFTP failed.
//          The accompanying messages provide detailed information about
//          the failure.
// *Action: Ensure that the indicated file or directory path on the indicated 
//          node exists and that the connected user has read permission for it.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2136, SHELL_COMMAND_EXECUTION_FAILED, "Failed to execute command \"{0}\" as user \"{1}\" within {2} seconds on nodes \"{3}\""
//  *Cause: An attempt to run the specified command from the indicated location
//          as the specified user within the specified time on the 
//          indicated nodes failed. The accompanying messages provide detailed
//          information about the failure.
// *Action: Ensure that the specified command exists on all nodes.
//          Ensure that the connected user has execute permission for the
//          specified command on all nodes.
//          Ensure that the correct password was specified for the user.
//          Resolve the problems described in the accompanying messages
//          and retry the operation.
/
2137, ACFSREMOTE_CREATE_FAILED, "failed to create Oracle ACFS remote resource {0}"
//  *Cause: An attempt to add the Cluster Ready Services (CRS) resource for an 
//          Oracle Automatic Storage Management Cluster File System 
//          (Oracle ACFS) remote failed, possibly because the CRS stack was not 
//          running or the user running 'srvctl add acfsremote' was not the 
//          owner of the CRS home. The accompanying messages provide detailed 
//          failure information.
// *Action: Examine the accompanying messages and resolve any problems 
//          indicated. Then, retry the operation, ensuring that the 
//          CRS stack is running and the user running 'srvctl add acfsremote' 
//          is the owner of the CRS home.
/
2138, ACFSRM_CREATE_FAILED, "failed to create Oracle ACFS rolling migration resource {0}"
//  *Cause: An attempt to add the Cluster Ready Services (CRS) resource for an 
//          Oracle Automatic Storage Management Cluster File System 
//          (Oracle ACFS) Rolling Migration failed, possibly because the CRS 
//          stack was not running or the user running 'srvctl add acfsremote' 
//          was not the owner of the CRS home. The accompanying messages 
//          provide detailed failure information.
// *Action: Examine the accompanying messages and resolve any problems 
//          indicated. Then, retry the operation, ensuring that the 
//          CRS stack is running and the user running 'srvctl add acfsremote' 
//          is the owner of the CRS home.
/
2139, UNSUPPORTED_ACFSREMOTE_ASM_CLUSTER, "Oracle ACFS remote is not supported on a cluster where an ASM instance is configured."
//  *Cause: An attempt to create an Oracle ACFS remote resource was rejected 
//          because it was not supported for a cluster with configured ASM 
//          instances.
// *Action: Use the currently configured ASM instances 
//          and disk groups for this cluster.
/
3000, INVALID_TFTP_ROOT_DIR_PATH, "invalid TFTP root directory path: '{0}'"
//  *Cause: An attempt to add or modify the TFTP resource was rejected because 
//          the format of the path for the root directory was invalid.
// *Action: Retry the operation specifying a valid root directory path.
/
3001, INVALID_TFTP_SERVER_IP, "invalid TFTP server IP address: '{0}'"
//  *Cause: An attempt to add or modify the TFTP resource was rejected because 
//          the specified IP address for the TFTP server was invalid.
// *Action: Retry the operation specifying a valid TFTP server IP address.
/
3002, ORACLE_BASE_ENV_ERROR, "failed to locate Oracle base" 
//  *Cause: A requested operation could not be completed because the 
//          ORACLE_BASE environment variable had not been set.
// *Action: Update Oracle base in 'orabasetab' using 'orabase' tool or 
//          finish uncompleted installation if any and retry the command.
/
4000, AUTH_PLUGIN_CLASS_INST_FAILED, "failed to instantiate the privileged execution plugin \"{0}\""
//  *Cause: An attempt to execute a configuration operation using the 
//          indicated privilege execution plugin failed because the plugin
//          encountered an internal error.
// *Action: Contact Oracle Support Services.
/
4001, AUTH_PLUGIN_FAILED_TIMEOUT, "failed to execute command \"{0}\" using the privileged execution plugin \"{1}\" on nodes \"{2}\" within {3} seconds"
//  *Cause: An attempt to execute the indicated command on the indicated nodes
//          using the indicated remote authentication plugin failed to complete
//          within the indicated time.  The accompanying error messages provide
//          detailed failure information.
// *Action: Examine the accompanying error messages and resolve any issues 
//          raised. Ensure that the indicated command exists and has execute 
//          permission on all nodes, the indicated privileged execution plugin 
//          is correct, and that all arguments to it are correct, and retry the
//          command.
/
4002, AUTH_PLUGIN_FAILED, "failed to execute command \"{0}\" using the privileged execution plugin \"{1}\" on nodes \"{2}\""
//  *Cause: An attempt to execute the indicated command on the indicated nodes
//          using the indicated remote authentication plugin failed. The 
//          accompanying error messages provide detailed failure information.
// *Action: Examine the accompanying error messages and resolve any issues 
//          raised. Ensure that the indicated command exists and has execute 
//          permission on all nodes, the indicated privileged execution plugin 
//          is correct, and that all arguments to it are correct, and retry the
//          command.
/
4003, AUTH_PLUGIN_NOT_INIT, "the privileged execution plugin \"{0}\" has not been initialized"
//  *Cause: An attempt was made to execute a command using the indicated
//          privilege execution plugin before it was initialized. This is an
//          internal error.
// *Action: Contact Oracle Support Services.
/
4004, AUTH_PLUGIN_INVALID_ARG, "invalid argument \"{0}\" was passed to the privilege execution plugin \"{1}\""
//  *Cause: An attempt to execute a command using the indicated privilege
//          execution plugin was made by passing the indicated invalid argument.
//          This is an internal error.
// *Action: Contact Oracle Support Services.
/
4005, AUTH_PLUGIN_MCOLLECTIVE_CFG_FILE_WRITE_ERROR, "the file \"{0}\" required by privilege execution plugin \"{1}\" could not be created"
//  *Cause: An attempt to create the indicated file required by the indicated
//          privilege execution plugin failed. The accompanying messages provide
//          detailed failure information.
// *Action: Examine the accompanying error messages for more information,
//          address the reported issues, and then retry the operation.
/
4006, AUTH_PLUGIN_MCOLLECTIVE_STATUS_ERROR, "the string \"{0}\" could not be parsed to obtain the exit status of the command \"{1}\" executed using the privilege execution plugin \"{2}\""
//  *Cause: An attempt to parse the indicated string to obtain the exit status
//          of the indicated command executed using the indicated privilege
//          execution plugin failed. This is an internal error.
// *Action: Contact Oracle Support Services.
/
4007, AUTH_PLUGIN_MCOLLECTIVE_FILE_DELETE_ERROR, "the file \"{0}\" generated by the privilege execution plugin \"{1}\" could not be deleted"
//  *Cause: An attempt to delete the indicated file which was generated by the
//          indicated privilege execution plugin failed. The accompanying 
//          messages provide detailed failure information.
// *Action: Examine the accompanying messages, resolve the indicated problems,
//          and then delete the indicated file.
/
4008, AUTH_PLUGIN_MCOLLECTIVE_FILE_READ_ERROR, "the privilege execution plugin \"{0}\" could not read the file \"{1}\""
//  *Cause: An attempt by the indicated privilege execution plugin to read the 
//          indicated file failed. The accompanying messages provide detailed
//          failure information.
// *Action: Examine the accompanying error messages for more information,
//          address the reported issues, and then retry the operation.
/
4009, AUTH_PLUGIN_NOT_EXECUTABLE, "the executable file \"{0}\" specified for the privilege execution plugin \"{1}\" was not an executable"
//  *Cause: An attempt to initialize the indicated privilege execution plugin
//          failed because the file specified as the executable for the plugin 
//          was not an executable. 
// *Action: Reissue the command, specifying the correct path to the indicated
//          file.
/
4010, AUTH_PLUGIN_SHARED_PATH_NOT_DIR, "the path \"{0}\" specified as the shared file system path for the privilege execution plugin \"{1}\" was not a directory"
//  *Cause: An attempt to initialize the indicated privilege execution plugin
//          failed because the path specified as the shared file system path
//          was not a directory. 
// *Action: Reissue the 'rhpctl' command, specifying the correct shared file
//          system path.
/
4011, AUTH_PLUGIN_SHARED_PATH_NO_PERMISSION, "Current user does not have write permission for the directory \"{0}\" that was specified as the shared file system path for privilege execution plugin \"{1}\"."
//  *Cause: An attempt to initialize the indicated privilege execution plugin
//          failed because the path specified as the shared file system path
//          did not have write permission for the current user.
// *Action: Reissue the 'rhpctl' command, specifying the correct shared file
//          system path.
/
4012, AUTH_PLUGIN_INVALID_SETUP, "The directory structure of the shared file system path \"{0}\" does not match the expected directory set up for the privilege execution plugin \"{1}\"."
//  *Cause: An attempt to initialize the indicated privilege execution plugin
//          failed because the path specified as the shared file system path
//          did not have the expected directory structure. The accompanying
//          messages provide detailed failure information.
// *Action: Examine the accompanying error message for more information,
//          address the reported issues and then retry the operation.
/
4013, AUTH_PLUGIN_COPY_FAILED, "Failed to copy file \"{0}\" to directory \"{1}\"."
//  *Cause: An attempt to copy the indicated file to from the indicated 
//          location to the indicated directory failed. The accompanying 
//          messages provide detailed failure information.
// *Action: Examine the accompanying error message for more information,
//          address the reported issues and then retry the operation.
/
4014, AUTH_PLUGIN_EXECUTE_FAILED, "Failed to execute the command \"{0}\" on nodes \"{1}\" using the privilege execution plugin \"{2}\"."
//  *Cause: An attempt to execute the indicated command on the indicated nodes 
//          using the indicated privilege execution plugin failed. The 
//          accompanying messages provide detailed failure information.
// *Action: Examine the accompanying error message for more information,
//          address the reported issues and then retry the operation.
/
4015, AUTH_PLUGIN_EXECUTE_TIMEOUT, "failed to execute the command \"{0}\" within \"{1}\" seconds on nodes \"{2}\" using the privilege execution plugin \"{3}\""
//  *Cause: An attempt to execute the indicated command on the indicated nodes
//          using the indicated privilege execution plugin with in the indicated
//          time limit failed. The accompanying messages provide detailed
//          failure information.
// *Action: Examine the accompanying error message for more information,
//          address the reported issues and then retry the operation.
/
4016, AUTH_PLUGIN_IS_NOT_FILE, "the path \"{0}\" is not a file"
//  *Cause: An attempt to copy the indicated file failed because the indicated
//          location was a directory, the file did not exist, or the file 
//          could not be opened.
// *Action: Ensure that the indicated location points to a file, and it is not
//          a directory and the current user has read permission on the file,
//          and then retry the operation.
/
4017, AUTH_PLUGIN_CFGPATH_NOT_DIR, "The path \"{0}\", specified as the location for configuration files for the privilege execution plugin \"{1}\", is not a directory."
//  *Cause: An attempt to initialize the indicated privilege execution plugin
//          failed because the indicated path specified as the location for 
//          writing configuration files did not point to a directory.
// *Action: Reissue the 'rhpctl' command, specifying a path indicating a 
//          writable directory.
/
4018, AUTH_PLUGIN_CFG_PATH_NO_PERMISSION, "Current user does not have write permission for the directory \"{0}\" that was specified as the location of configuration files for privilege execution plugin \"{1}\"."
//  *Cause: An attempt to initialize the indicated privilege execution plugin
//          failed because the path specified as the location of configuration
//          files did not have write permission for the current user.
// *Action: Reissue the 'rhpctl' command, specifying a path indicating a 
//          writable directory.
/
4019, AUTH_PLUGIN_WRONG_THREADID, "Unexpected output from the command \"{0}\" executed on node \"{1}\" using the privilege execution plugin \"{2}\". Thread id mismatch: Expected={3}, Actual={4}"
//  *Cause: An attempt to execute the indicated command on the indicated node 
//          using the indicated privilege execution plugin was not successful as
//          indicated by the fact that its output displayed an unexpected thread
//          ID. This was most likely due to the command picking up an 
//          incorrect or corrupted configuration file.
// *Action: Ensure that the correct configuration file is being picked up by
//          the command execution script.
/
/
4020, AUTH_RUN_CMD_AS_ROOT, "Manual root script execution selected. Run the command \"{0}\" manually on the node \"{1}\" as 'root' user."
// *Document: NO
// *Cause:
// *Action:
/
4021, AUTH_RUN_CMD_AS_ROOT_WITH_ENV, "Manual root script execution selected. Run the command \"{0}\" manually on the node \"{1}\" after setting environment variables \"{2}\" as the 'root' user."
// *Document: NO
// *Cause:
// *Action:
/
4022, AUTH_PLUGIN_NO_CREDS_FOR_NODE, "Privileged user credentials for node \"{0}\" were not found while executing commands using privilege execution plugin \"{1}\"."
//  *Cause: An attempt to retrieve the privileged user credentials for the 
//          indicated node failed.
// *Action: Use the command '<GI_HOME>/rhp/auth/creds' to store the credentials
//          of the privileged user on the indicated node and then retry this 
//          command.
/
4023, AUTH_PLUGIN_ENTER_PASSWORD, "Enter password: "
// *Document: NO
// *Cause:
// *Action:
/
4024, TWINAUTH_CREDS_USAGE, "twinauthpwdmgr {add|delete} -nodename <node_name> [-root|{-sudouser <user> -sudopath <sudo_path>}]\n  -nodename <node_name>   Node for which credential operations are being performed.\n  -root                   Flag indicating root user password is provided.\n  -sudouser <user>        The user who has sudo privilege.\n  -sudopath <sudo_path>   Path to sudo binary on the specified node."
// *Document: NO
// *Cause:
// *Action:
/
