// Copyright (c) 2008, 2018, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCwMsg.msg
//
// DESCRIPTION
//    Messages for OCR wallet related operations
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     ccharits    06/28/18 - Added WALLET_CREATION_FAILED
//     spavan      03/19/14 - fix bug18428146 - add uninitialzed context
//                            message
//     nvira       12/30/13 - review comments
//     nvira       12/23/13 - review comments
//     nvira       12/18/13 - fix the message argument
//     spavan      08/27/12 - fix bug14399555 - message for wallet name
//     spavan      03/23/11 - fix bug11804807
//     sravindh    03/18/08 - Transfer cause and action comments from java
//                            source file PrCwMsg.java
//     wanwu       11/09/07 - createion
//  */
//
// /**
//  *  @version $Header: opsm/jsrc/oracle/cluster/wallet/resources/PrCwMsg.msg /main/7 2018/07/20 12:03:02 ccharits Exp $
//  *  @author  rxkumar
//  *  @since   1.0
//  */
//
// PACKAGE=package oracle.cluster.wallet.resources;
// MSGIDTYPE=interface
1001, NO_MEMORY, "Could not allocate new memory"
//  *Cause: Could not allocation any new memory.
// *Action: Retry after make more memory available.
/
1002, NZ_ERROR, "Network Security error code {0}"
//  *Cause: Failed to perform the network security operation.
// *Action: Look at the network security error for the appropriate action.
/
1003, CLSW_FAIL, "Failed to do the cluster wallet operation {0}"
//  *Cause: Failed to perform the cluster wallet operation.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1004, WALLET_OPEN_FAIL, "Could not open the wallet {0} due to error {1} : {2} "
//  *Cause: Failed to open the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1005, WALLET_NOT_EXIST, "Wallet {1} did not exist due to error code {1}"
//  *Cause: The cluster wallet did not exist.
// *Action: Need to create the cluster wallet.
/
1006, ALIAS_NOT_EXIST, "Alias {0} in Wallet {1} did not exist"
//  *Cause: The alias within the cluster wallet did not exist.
// *Action: Need to create the alias within the cluster wallet.
/
1007, ALIAS_READ_ERROR, "Alias {0} in Wallet {1} could not be read due to error {2}"
//  *Cause: Could not read the alias within the cluster wallet.
// *Action: Look at the network security error for the appropriate action.
/
1008, ALIAS_WRITE_ERROR, "Alias {0} in Wallet {1} could not be written due to error code {2}"
//  *Cause: Could not write the secret of the alias to the cluster wallet.
// *Action: Look at the network security error for the appropriate action.
/
1009, WALLET_SAVE_ERROR, "Wallet {0} could not be saved due to error code {1}"
//  *Cause: Could not save the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1010, WALLET_CREATE_ERROR, "Wallet {0} could not be created due to error {1}: {2} "
//  *Cause: Could not create the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1011, WALLET_ACCESS_DENIED, "Wallet {0} could not be accessed due to error code {1}"
//  *Cause: Could not access the cluster wallet.
// *Action: Use the correct cluster wallet password.
/
1012, WALLET_DELETE_ERROR, "Wallet {0} could not be deleted due to error code {1}"
//  *Cause: Could not delete the cluster wallet.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1013, INIT_FAIL, "Failed to initialize cluster wallet context due to error code {0}"
//  *Cause: Could not initialize the cluster wallet context.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1014, TERMINATE_FAIL, "Failed to terminate cluster wallet context due to error code {0}"
//  *Cause: Could not terminate the cluster wallet context.
// *Action: Look at the cluster wallet error for the appropriate action.
/
1015, WALLET_COULD_NOT_BE_FOUND, "Wallet {0} does not exist. {1}"
//  *Cause: An attempted wallet operation could not find the specified wallet.
// *Action: Ensure that the correct wallet type was supplied, or create the wallet if appropriate.
/
1016, WALLET_NAME_REQUIRED, "Wallet name is missing for wallet type {0}"
//  *Cause: An attempted wallet operation failed as wallet name was not specified.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1017, TERMINATE_FAIL_NOT_INITIALIZED, "Cluster wallet context to be terminated does not exist"
//  *Cause: An attempt to terminate the cluster wallet context failed as it has
//          not been initialized.
// *Action: This is an internal error. Contact Oracle Support Services.
/
1018, WALLET_CMD_FAILED, "Failed executing command '{0}'. Details:\n{1}"
//  *Cause: The indicated command failed.
// *Action: Examine the accompanying error messages for details, resolve the indicated problems, and then retry the operation.
/
1019, WALLET_CREATION_FAILED, "Wallet creation failed: {0}."
//  *Cause: The operation failed to create the wallets.
// *Action: Examine the accompanying error messages for details, resolve the indicated problems, and then retry the operation.
/
