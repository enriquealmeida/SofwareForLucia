// Copyright (c) 2008, 2012, Oracle and/or its affiliates. All rights reserved. 
//
// NAME
//    PrCqMsg.msg
//
// DESCRIPTION
//    Message file. These messages for opsm/jsrc/oracle/cluster/sql package.
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     satg        11/14/12 - Fix bug 14730028
//     agorla      10/18/11 - bug#11850083 - generic ojdbc error
//     agorla      09/17/10 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, GET_CONNECTION_FAILED, "An error occurred while establishing connection to database with user name \"{1}\" and connect descriptor:\n{0}"
//  *Cause: An attempt to connect to database failed.
// *Action: Examine the accompanying error message for details.
/
1001, ORADRIVER_LOAD_ERROR, "An error occurred while loading Oracle thin JDBC driver"
//  *Cause: An attempt to load Oracle thin JDBC driver failed.
// *Action: Ensure that the Java classpath includes ojdbc5.jar.
/
1002, INTERNAL_ERROR, "An error occurred while getting SCAN or database \"{0}\""
//  *Cause: An attempt to obtain SCAN or database resource failed.
// *Action: Examine the accompanying error message for details.
/
1003, SCAN_OR_DB_NOT_DEFINED, "SCAN is not configured or database \"{0}\" does not exist"
//  *Cause: An attempt to retrieve SCAN or database failed.
// *Action: Ensure the database and SCAN are properly defined in this cluster. Use the command 'srvctl add scan' to add the SCAN or use the command 'srvctl add database' to add the database to cluster.
/
1004, DB_NOT_DEFINED, "Database \"{0}\" does not exist"
//  *Cause: An attempt to retrieve database failed.
// *Action: Ensure that the database is properly defined in this cluster. Use the command 'srvctl add database' to add the database to cluster.
/
1005, PS_CONFIG_ERROR, "An error occured while reading configuration of database \"{0}\""
//  *Cause: An attempt to retrieve database configuration failed.
// *Action: Examine the accompanying error message for details.
/
1006, ORADRIVER_LOAD_ERROR_2, "An error occurred while loading Oracle thin JDBC driver"
//  *Cause: An attempt to load Oracle thin JDBC driver failed.
// *Action: This is an internal error. Contact Oracle Support Services.
/
