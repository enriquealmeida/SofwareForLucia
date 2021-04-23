// Copyright (c) 2011, 2013, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrClMsg.msg
//
// DESCRIPTION
//    Message file for CHA resources
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     sravindh   09/10/13 - Add messages for already monitored and already
//                           unmonitored exceptions
//     sejlim     08/29/13 - cha srvpool label
//     sejlim     07/19/13 - bug 17084363
//     sejlim     06/18/13 - bug 16964216
//     sejlim     05/22/13 - cha_status
//     sejlim     05/06/13 - cha_monitor
//     satg       19/03/13 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, CHA_GET_DATABASE_FAILED, "failed to retrieve Grid Infrastructure Management Repository resource"
//  *Cause: An attempt to find the Grid Infrastructure Management Repository resource used for the Oracle Cluster Health Analysis Service failed because 
//          the Grid Infrastructure Management Repository was not configured or the Oracle Clusterware stack encountered errors.
// *Action: Examine the accompanying error messages for details. Make sure that the Grid Infrastructure Management Repository has been configured.
/
1001, CHA_NOTEXISTS_GET_DATABASE_FAILED, "Grid Infrastructure Management Repository resource has not been configured"
//  *Cause: A 'srvctl add cha' command failed because the Grid Infrastructure Management Repository resource was not configured.
// *Action: If the Grid Infrastructure Management Repository was not configured while installing Grid Infrastructure, then reinstall 
//          Grid Infrastructure selecting the option to configure the Grid Infrastructure Management Repository.
/
1002, CHA_CREATE_FAILED, "failed to create Oracle Cluster Health Analysis Service {0} resource {1}"
//  *Cause: An attempt to create Oracle Cluster Health Analysis Service resource failed.
// *Action: Examine the accompanying error messages for details.
/
1003, CHA_MONITOR_DB_FAILED, "failed to start monitoring database {0}"
//  *Cause: An attempt to start monitoring the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1004, CHA_MONITOR_DB_FAILED_ON_NODE, "failed to start monitoring database {0} on node {1}"
//  *Cause: An attempt to start monitoring an instance of the specified database on the specified node failed.
// *Action: Examine the accompanying error messages for details.
/
1005, CHA_MONITOR_HOST_FAILED, "failed to start monitoring host {0}"
//  *Cause: An attempt to start monitoring the specified host failed.
// *Action: Examine the accompanying error messages for details.
/
1006, CHA_UNMONITOR_DB_FAILED, "failed to stop monitoring database {0}"
//  *Cause: An attempt to stop monitoring the specified database failed.
// *Action: Examine the accompanying error messages for details.
/
1007, CHA_UNMONITOR_DB_FAILED_ON_NODE, "failed to stop monitoring database {0} on node {1}"
//  *Cause: An attempt to stop monitoring an instance of the specified database on the specified node failed.
// *Action: Examine the accompanying error messages for details.
j/
1008, CHA_UNMONITOR_HOST_FAILED, "failed to stop monitoring host {0}"
//  *Cause: An attempt to stop monitoring the specified host failed.
// *Action: Examine the accompanying error messages for details.
/
1009, CHA_MONITOR_HOST_FAILED_NODENAME, "failed to retrieve details for the specified host"
//  *Cause: During an attempt to start monitoring the specified host, details for the host could not be determined.
// *Action: Examine the accompanying error messages for details.
/
1010, CHA_UNMONITOR_HOST_FAILED_NODENAME, "failed to retrieve details for the specified host"
//  *Cause: During an attempt to stop monitoring the specified host, details for the host could not be determined.
// *Action: Examine the accompanying error messages for details.
/
1011, CHA_MONITOR_DB_FAILED_DBNAME, "Database name to start monitoring is missing."
//  *Cause: An attempt to start monitoring a database failed because the name of the database to start monitoring was not specified.
// *Action: Examine the accompanying error messages for details.
/
1012, CHA_UNMONITOR_DB_FAILED_DBNAME, "Database name to stop monitoring is missing"
//  *Cause: An attempt to stop monitoring a database failed because the name of the database to stop monitoring was not specified.
// *Action: Examine the accompanying error messages for details.
/
1013, CHA_GET_STATUS_FAILED, "failed to retrieve the status of Oracle Cluster Health Analysis Service"
//  *Cause: An attempt to get the status of Oracle Cluster Health Analysis Service failed.
// *Action: Examine the accompanying error messages for details.
/
1014, CHA_GET_STATUS_FAILED_ON_NODE, "failed to retrieve the status of Oracle Cluster Health Analysis Service for nodes {0}"
//  *Cause: An attempt to retrieve the status of Oracle Cluster Health Analysis Service for the specified nodes failed.
// *Action: Examine the accompanying error messages for details, rectify the problems reported and retry, otherwise contact Oracle Support Services.
/
1015, CHA_GET_CRSUSER_FAILED, "failed to retrieve the Oracle Grid Infrastructure user"
//  *Cause: During an attempt to add Oracle Cluster Health Analysis Service, the Oracle Grid Infrastructure user could not be retrieved.
// *Action: Examine the accompanying error messages for details.
/
1016, CHA_MONITOR_HOST_FAILED_ON_CLUSTER, "failed to start monitoring hosts"
//  *Cause: An attempt to start monitoring hosts failed.
// *Action: Examine the accompanying error messages for details.
/
1017, CHA_MONITOR_HOST_FAILED_ON_SRVPOOL, "failed to start monitoring hosts in server pool {0}"
//  *Cause: An attempt to start monitoring hosts in the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1018, CHA_MONITOR_DB_FAILED_ON_SRVPOOL, "failed to start monitoring database {0} on server pool {1}"
//  *Cause: An attempt to start monitoring the specified database on the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1019, CHA_UNMONITOR_HOST_FAILED_ON_CLUSTER, "failed to stop monitoring hosts"
//  *Cause: An attempt to stop monitoring hosts failed.
// *Action: Examine the accompanying error messages for details.
/
1020, CHA_UNMONITOR_HOST_FAILED_ON_SRVPOOL, "failed to stop monitoring hosts in server pool {0}"
//  *Cause: An attempt to stop monitoring hosts in the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1021, CHA_UNMONITOR_DB_FAILED_ON_SRVPOOL, "failed to stop monitoring database {0} on server pool {1}"
//  *Cause: An attempt to stop monitoring the specified database on the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1022, CHA_GET_STATUS_FAILED_ON_SRVPOOL, "failed to retrieve the status of Oracle Cluster Health Analysis Service for server pool {0}"
//  *Cause: An attempt to retrieve the status of Oracle Cluster Health Analysis Service for the specified server pool failed.
// *Action: Examine the accompanying error messages for details.
/
1023, CHA_ACTION_REQUEST_FAILED, "failed to request action on Oracle Cluster Health Analysis Service"
//  *Cause: An attempt to request action on Oracle Cluster Health Analysis Service failed.
// *Action: Examine the accompanying error messages for details.
/
1024, CHA_MONITOR_DB_FAILED_MODEL, "failed to start monitoring database {0} using model {1}"
//  *Cause: An attempt to start monitoring the specified database using the specified model failed.
// *Action: Examine the accompanying error messages for details.
/
1025, CHA_MONITOR_DB_FAILED_ON_NODE_MODEL, "failed to start monitoring database {0} on node {1} using model {2}"
//  *Cause: An attempt to start monitoring an instance of the specified database on the specified node using the specified model failed.
// *Action: Examine the accompanying error messages for details.
/
1026, CHA_MONITOR_HOST_FAILED_MODEL, "failed to start monitoring host {0} using model {1}"
//  *Cause: An attempt to start monitoring the specified host using the specified model failed.
// *Action: Examine the accompanying error messages for details.
/
1027, CHA_MONITOR_HOST_FAILED_ON_CLUSTER_MODEL, "failed to start monitoring hosts using model {0}"
//  *Cause: An attempt to start monitoring hosts using the specified model failed.
// *Action: Examine the accompanying error messages for details.
/
1028, CHA_MONITOR_HOST_FAILED_ON_SRVPOOL_MODEL, "failed to start monitoring hosts in server pool {0} using model {1}"
//  *Cause: An attempt to start monitoring hosts in the specified server pool using the specified model failed.
// *Action: Examine the accompanying error messages for details.
/
1029, CHA_MONITOR_DB_FAILED_ON_SRVPOOL_MODEL, "failed to start monitoring database {0} on server pool {1} using model {2}"
//  *Cause: An attempt to start monitoring the specified database on the specified server pool using the specified model failed.
// *Action: Examine the accompanying error messages for details.
/
1030, CHA_ALREADY_MONITORED_1, "Hosts are already being monitored using model {0}."
//  *Cause: A request to monitor hosts was rejected because they were already being monitored using the specified model.
// *Action: No action required. 
/
1031, CHA_ALREADY_MONITORED_2, "Hosts are already being monitored."
//  *Cause: A request to monitor hosts was rejected because they were already being monitored.
// *Action: No action required. 
/
1032, CHA_ALREADY_MONITORED_3, "Hosts in server pool {0} are already being monitored using model {1}."
//  *Cause: A request to monitor hosts in the specified server pool was rejected because they were already being monitored using the specified model.
// *Action: No action required. 
/
1033, CHA_ALREADY_MONITORED_4, "Hosts in server pool {0} are already being monitored."
//  *Cause: A request to monitor hosts in the specified server pool was rejected because they were already being monitored.
// *Action: No action required. 
/
1034, CHA_ALREADY_MONITORED_5, "Host {0} is already being monitored using model {1}."
//  *Cause: A request to monitor the specified host was rejected because it was already being monitored using the specified model.
// *Action: No action required. 
/
1035, CHA_ALREADY_MONITORED_6, "Host {0} is already being monitored."
//  *Cause: A request to monitor the specified host was rejected because it was already being monitored.
// *Action: No action required. 
/
1036, CHA_ALREADY_MONITORED_7, "Database {0} is already being monitored using model {1}."
//  *Cause: A request to monitor the specified database was rejected because it was already being monitored using the specified model.
// *Action: No action required. 
/
1037, CHA_ALREADY_MONITORED_8, "Database {0} is already being monitored."
//  *Cause: A request to monitor the specified database was rejected because it was already being monitored.
// *Action: No action required. 
/
1038, CHA_ALREADY_MONITORED_9, "Database {0} is already being monitored in server pool {1} using model {2}."
//  *Cause: A request to monitor the specified database in the specified server pool was rejected because it was already being monitored using the specified model.
// *Action: No action required. 
/
1039, CHA_ALREADY_MONITORED_10, "Database {0} is already being monitored in server pool {1}."
//  *Cause: A request to monitor the specified database in the specified server pool was rejected because it was already being monitored.
// *Action: No action required. 
/
1040, CHA_ALREADY_MONITORED_11, "Database {0} is already being monitored on host {1} using model {2}."
//  *Cause: A request to monitor the specified database on the specified node was rejected because it was already being monitored using the specified model.
// *Action: No action required. 
/
1041, CHA_ALREADY_MONITORED_12, "Database {0} is already being monitored on host {1}."
//  *Cause: A request to monitor the specified database on the specified node was rejected because it was already being monitored.
// *Action: No action required. 
/
1042, CHA_ALREADY_UNMONITORED_1, "Hosts are not being monitored."
//  *Cause: A request to stop monitoring hosts was rejected because they were already not being monitored.
// *Action: No action required. 
/
1043, CHA_ALREADY_UNMONITORED_2, "Hosts in server pool {0} are not being monitored."
//  *Cause: A request to stop monitoring hosts in the specified server pool was rejected because they were already not being monitored.
// *Action: No action required. 
/
1044, CHA_ALREADY_UNMONITORED_3, "Host {0} is not being monitored."
//  *Cause: A request to stop monitoring the specified host was rejected because it was already not being monitored.
// *Action: No action required. 
/
1045, CHA_ALREADY_UNMONITORED_4, "Database {0} is not being monitored."
//  *Cause: A request to stop monitoring the specified database was rejected because it was already not being monitored.
// *Action: No action required. 
/
1046, CHA_ALREADY_UNMONITORED_5, "Database {0} is not being monitored in server pool {1}."
//  *Cause: A request to stop monitoring the specified database in the specified server pool was rejected because it was already not being monitored.
// *Action: No action required. 
/
1047, CHA_ALREADY_UNMONITORED_6, "Database {0} is not being monitored on node {1}."
//  *Cause: A request to stop monitoring the specified database on the specified node was rejected because it was already not being monitored.
// *Action: No action required. 
/
1048, CHA_MONITOR_FAILED_BUILTIN_SERVERPOOL, "failed to start monitoring the target since server pool {0} is a built in server pool."
//  *Cause: A request to start monitoring the target was rejected since the specified server pool is a built in server pool.
// *Action: Check the specified server pool name.
/
1049, CHA_UNMONITOR_FAILED_BUILTIN_SERVERPOOL, "failed to stop monitoring the target since server pool {0} is a built in server pool."
//  *Cause: A request to stop monitoring the target was rejected since the specified server pool is a built in server pool.
// *Action: Check the specified server pool name.
/
1050, CHA_STATUS_FAILED_BUILTIN_SERVERPOOL, "failed to retrieve the status of the target since server pool {0} is builtin server pool."
//  *Cause: A request to retrieve the status of the target was rejected since the specified server pool is builtin server pool.
// *Action: Check the specified server pool name.
/
1051, CHA_MONITOR_FAILED_EMPTY_MODEL_NAME, "An empty string is not allowed as a model name."
//  *Cause: A request to start monitoring the target was rejected since the specified model name was the empty string. 
// *Action: Reissue the command without a model name if the user wants the target to be monitored with the current model in use, or reissue the command with an existing model name that is different from the current model in use.
/
