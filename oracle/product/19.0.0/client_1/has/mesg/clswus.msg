/* Copyright (c) 2001, 2016, Oracle and/or its affiliates. All rights reserved.*/
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ NAME
/   clswus.msg
/ DESCRIPTION
/   Generic error messages for Cluster Wallet (CLSW)
/ NOTES
/   Language      : American
/   Character set : US7ASCII
/   WARNING: A single message in this table should NOT exceed 75 characters
/            If it does the message will be TRUNCATED.
/
/
/ RANGE
/   00001 - 00016 : CLSW
/
/ OWNER
/
/ MODIFIED
/     spavan     08/23/16 - fix bug21635883 - add message for wallet creation
/                           failure
/     spavan     02/12/13 - fix bug11804807 - add new messages for new return
/                           values
/     spavan     12/17/10 - add unsupported wallet message
/     spavan     03/02/08 - Add prompt for password in wallet operations
/     samjo      01/04/08 - Add SCLS error message
/     samjo      10/20/06 - Creation
/
/
/ Message headers
/
/////////////////////////////////////////////////////////
/ Error message for cluster wallet 
/ Range from 1 - 16
/////////////////////////////////////////////////////////
/
0001,0, "Cluster Wallet operation failed"
// *Cause: This is generic internal error for Cluster Wallet.
// *Action: Contact Oracle Customer Support.
/
0002,0, "Out of heap memory."
// *Cause: The program ran out of heap memory.
// *Action: Retry the operation when more memory is available.
/
0003,0, "Error in the cluster registry (OCR) layer. [%d] [%s]"
// *Cause: An error occurred in the cluster registry layer while performing a 
//         cluster wallet operation.
// *Action: Ensure correct operation of cluster registry by inspecting ocr 
//          error (oerr proc <ocrerror>), by using ocrcheck and ocrdump, and 
//          retry the operation.
/
0004,0, "Error in the network security layer. [%d] [%s]"
// *Cause: An error occurred in the network security layer while performing a 
//         cluster wallet operation.
// *Action: Inspect the network security error (oerr ora <nzerr>), and take 
//          corrective action to ensure correct operation.
/
0005,0, "Cannot perform cluster wallet operation because one of the parameters is NULL."
// *Cause: Program tried a cluster wallet operation using a NULL parameter.
// *Action: Check the parameters, and retry the operation.
/
0006,0, "Cannot perform cluster wallet operation because the context is invalid."
// *Cause: The cluster wallet context passed was invalid.
// *Action: Intialize the cluster wallet and retry the operation.
/
0007,0, "Cannot perform cluster wallet operation because one of the parameters is invalid. [%d] [%s]"
// *Cause: Program tried a cluster wallet operation using an invalid
//         parameter.
// *Action: Check the parameters, and retry the operation.
/
0008,0, "The cluster wallet to be created already exists."
// *Cause: The program tried to create a cluster wallet that already exists.
// *Action: Retry the operation after unsetting the CLSW_FLAGS_WALLET_CREATE 
/	    flag.
/
0009,0, "The cluster wallet to be operated on does not exist."
// *Cause: Program tried to access a cluster wallet which does not exist.
// *Action: Check to see if the cluster wallet exists and try the operation 
/	    again.
/
0010,0, "Error in the NLS services."
// *Cause: An error occurred in the NLS services while performing a cluster
//	   wallet operation.
// *Action: Check to see if the message file exists in 
//	    $ORACLE_HOME/has/mesg/clsw*.msb
/
0011,0, "Cannot perform cluster wallet operation because data stored in the registry is invalid."
// *Cause: The data stored in the registry cannot be converted to a wallet.
// *Action: Delete the registry key associated with the wallet and recreate the
//	    wallet.
/
0012,0, "User is not authorized to perform the cluster wallet operation. [%d] [%s]"
// *Cause: Program tried an operation on a cluster wallet for which it
//         does not have permission.
// *Action: Check to see if program is run as the correct user.
/
0013,0, "Error in the clusterware operating system (SCLS) services. [%s]"
// *Cause: An error occurred in the SCLS services while performing a cluster
//	   wallet operation.
// *Action: Check to see if NIS/LDAP on Unix and Active Directory Service on 
//	    Windows has been correctly configured.
/
0014, 0, "Wallet type '%s' is not supported on this operating system."
// *Cause: The program tried a cluster wallet operation using a wallet type
//         that is not supported on current operating system.
// *Action: This is an internal error. Contact oracle support services.
/
0015, 0, "Alias '%s' already exists in wallet type '%s'."
// *Cause: A request to add the specified alias to the wallet failed because the
//         alias already existed in the wallet.
// *Action: Add an alias that does not already exist in the wallet. The
//          password for an alias that already exists can be modified using the
//          command 'crsctl modify wallet'.
/
0016, 0, "Alias '%s' was not found in wallet type '%s'." 
// *Cause: A request to modify the specified alias in the wallet failed because the alias
//         did not exist in the wallet.
// *Action: Ensure that the alias exists in the wallet type specified. A new 
//          alias can be added to a wallet type using the command 'crsctl add wallet'.
/
0017, 0, "User '%s' is not allowed to create wallet of type '%s'."
// *Cause: An attempt to create the wallet of the indicated type was rejected
//         because the wallet should not be created by indicated user. 
// *Action: Run the program as the correct user. Wallets of type 'CVUDB' must be
//          created by the owner of the Oracle database home.
/
/////////////////////////////////////////////////////////
/ Prompts for input and message from wallet operations
/ Range from 1000 - 1010
/////////////////////////////////////////////////////////
/
1000, 0, "Enter Password:"
// *Documented: NO
// *Cause: This is a prompt to user to enter password.
// *Action: Enter password.
/

