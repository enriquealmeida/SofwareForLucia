// Copyright (c) 2014, 2015, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCvMsg.msg
//
// DESCRIPTION
//    Message file for VM resources
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     chchatte   01/06/15 - bug bug 19810951
//     chchatte   07/23/14 - Fix bug 19270956
//     chchatte   06/25/14 - Fix bug 18899171
//     chchatte   06/03/14 - Fix bug 18890943
//     chchatte   05/06/14 - Second VM transaction
//     chchatte   03/12/14 - Creation
//  */
//
// PACKAGE=package oracle.cluster.resources;
1000, VM_ALREADY_EXISTS, "failed to create VM resource because a resource with the same name already exists"
//  *Cause: An attempt to add a VM resource failed because a resource with the same name already existed.
//  *Action: Supply a different name to create a different VM resource.
/
1001, VM_CREATE_FAILED, "failed to create VM resource \"{0}\""
// *Cause: An attempt to create a VM resource failed.
// *Action: Examine the accompanying error messages for details.
/
1002, GET_VMLIST_FAILED, "failed to retrieve the list of virtual machine names or IDs supplied during VM resource creation for VM resource \"{0}\""
//  *Cause: The virtual machine names or IDs supplied during VM resource creation could not be retrieved. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1003, GET_STOPTIMEOUT_FAILED, "failed to retrieve the stop timeout attribute of VM resource \"{0}\""
//  *Cause: The stop timeout attribute of the specified VM resource could not be retrieved. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1004, GET_INTERVAL_FAILED, "failed to retrieve the check interval attribute of VM resource \"{0}\""
//  *Cause: The interval between checks for the specified VM resource could not be retrieved. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1005, GET_SERVERPOOL_FAILED, "failed to retrieve the name of the server pool on which VM resource \"{0}\" was configured to run"
//  *Cause: The server pool on which the specified VM resource was configured to run could not be retrieved. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1006, GET_CATEGORY_FAILED, "failed to retrieve the server category on which VM resource \"{0}\" was configured to run"
//  *Cause: The server category on which the specified VM resource was configured to run could not be retrieved. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1007, GET_NODES_FAILED, "failed to retrieve the nodes on which VM resource \"{0}\" was configured to run"
//  *Cause: The list of nodes on which the specified VM resource was configured to run could not be retrieved. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1008, SET_VMLIST_FAILED, "failed to set the list of virtual machine names or IDs for VM resource \"{0}\""
//  *Cause: The virtual machine names or IDs of the specified VM resource could not be set. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1009, SET_STOPTIMEOUT_FAILED, "failed to set the stop timeout for VM resource \"{0}\""
//  *Cause: The stop timeout of the specified VM resource could not be set. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1010, SET_INTERVAL_FAILED, "failed to set the check interval for VM resource \"{0}\""
//  *Cause: The interval between checks for the specified VM resource could not be set. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1011, SET_SERVERPOOL_FAILED, "failed to set the server pool for VM resource \"{0}\""
//  *Cause: The server pool on which the specified VM resource was to run could not be set. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1012, SET_CATEGORY_FAILED, "failed to set the server category for VM resource \"{0}\""
//  *Cause: The server category on which the specified VM resource was to run could not be set. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1013, SET_NODES_FAILED, "failed to set the nodes for VM resource \"{0}\""
//  *Cause: The nodes on which the specified VM resource was to run could not be set. Details are provided in the accompanying error messages.
//  *Action: Examine the accompanying error messages and resolve the problems reported.
/
1014, PERX_CARDINALITY_FAILED, "failed to retrieve the virtual machine name or ID for the specified instance at cardinality {0} of VM resource \"{1}\""
//  *Cause: An attempt to retrieve the virtual machine name or ID for the specified instance of the VM resource
//  failed because it did not exist for the specified instance.
//  *Action: Contact Oracle Support Services.
/
1015, ADD_VM_FAILED, "failed to add the virtual machines to the VM resource \"{0}\""
//  *Cause: An attempt to add the virtual machines to the specified VM resource failed. This could have occurred because the Cluster Ready Services (CRS) stack was unavailable
//  or the resource had not been created.
//  *Action: Verify that the CRS stack is available and that the resource exists and retry the operation.
/
1016, REMOVE_VM_FAILED, "failed to remove the virtual machines from the VM resource \"{0}\""
//  *Cause: An attempt to remove the virtual machines from the specified VM resource failed. This could have occurred because the Cluster Ready Services (CRS) stack was unavailable
//  or the resource had not been created.
//  *Action: Verify that the CRS stack is available and that the resource exists and retry the operation. 
/
1017, INSUFFICIENT_NODES_FAILED, "unable to configure VM resource because the number of nodes specified {0} was less than the number of virtual machine instances {1}"
//  *Cause: An attempt to create or modify a VM resource failed because fewer hosting members were specified than the number of virtual machine instances to be run.
//  *Action: Retry the configuration specifying the requisite number of hosting members for the VM resource.
/
1018, DUPLICATE_VM_FAILED, "unable to create or modify VM resource because duplicate virtual machine instances \"{0}\" were specified"
//  *Cause: An attempt to create or modify the configuration of the VM resource failed because duplicate virtual machine instances were specified.
//  *Action: Retry the operation being careful to specify distinct instances.
/
1019, INVALID_VM_REMOVE_FAILED, "Removal of virtual machines failed because the virtual machine \"{0}\" is not in VM resource \"{1}\"."
//  *Cause: An attempt to remove the specified virtual machines from the specified VM resource was rejected because at least one of the virtual machines specified was not part of the resource.
//  *Action: Retry the operation specifying only virtual machines that are in the VM resource.
/
1020, INVALID_VM_ADD_FAILED, "unable to add virtual machines because virtual machine \"{0}\" is already in VM resource \"{1}\""
//  *Cause: An attempt to add the specified virtual machines to the specified VM resource was rejected because at least one of the virtual machines specified was already part of the resource.
//  *Action: Retry the operation specifying virtual machines that are not already in the VM resource.
/
1021, VM_NOT_FOUND, "The operation failed because the virtual machine name or ID specified was not found in VM resource \"{0}\"."
//  *Cause: The operation failed because the virtual machine name or ID was not found. The virtual machine name or ID was specified incorrectly or was never added to the
//  VM resource.
//  *Action: Correct the virtual machine name or ID specified or add the virtual machine to the VM resource and retry the operation.
/
1022, INVALID_STOPTIMEOUT_FAILED, "The operation failed because the value {0} specified for stop timeout is invalid."
//  *Cause: The operation was rejected because the value specified for stop timeout was not a positive integer.
//  *Action: Change the value of stop timeout to a positive integer and retry the same operation.
/
1023, INVALID_INTERVAL_FAILED, "The operation failed because the value {0} specified for check interval is invalid."
//  *Cause: The operation was rejected because the value specified for check interval was not a positive integer.
//  *Action: Change the value of check interval to a positive integer and retry the same operation.
/
1024, VM_START_FAILED, "failed to start VM resource \"{0}\""
//  *Cause: The attempt to start the VM resource failed for the reasons provided in the accompanying error messages.
//  *Action: See the accompanying error messages, address the issues described, and then try to start the VM resource.
/
1025, VM_STOP_FAILED, "failed to stop VM resource \"{0}\""
//  *Cause: The attempt to stop the VM resource failed for the reasons provided in the accompanying error messages.
//  *Action: See the accompanying error messages, address the issues described, and then try to stop the VM resource.
/
1026, ERROR_VM_SEARCH, "error querying for VM resources"
//  *Cause: The query for VM resources in Oracle Clusterware failed. 
//  *Action: See the accompanying error messages, address the issues described, and retry the operation.
/
1027, INSUFFICIENT_SERVERS_WARNING, "Warning: insufficient servers in server pool to run all virtual machine instances"
//  *Cause: During resource creation or modification, there were fewer servers in the server pool for the VM resource than virtual machine instances to be run.
//  *Action: Add additional servers to the server pool to match the number of servers to the number of virtual machines.
/
1028, VM_RES_NOT_FOUND, "VM resource \"{0}\" could not be found."
//  *Cause: The VM resource with the specified name could not be found. Either the VM resource name was misspelled or the VM resource had not been created. 
//  *Action: Correct the spelling of the VM resource name or specify an existing VM resource.
/
1029, REMOVEVM_RUNNING_FAIL, "failed to remove virtual machine instances because the VM resource \"{0}\" was running"
//  *Cause: The operation was rejected because virtual machine instances cannot be removed from the VM resource while the VM resource is still running.
//  *Action: Stop the VM resource before attempting to remove virtual machine instances.
/
1030, RES_ALREADY_ENABLED_VM, "Virtual machine \"{0}\" of VM resource \"{1}\" is already enabled."
//  *Cause: An attempt to enable the specified virtual machine was rejected because the virtual machine was already enabled.
// *Action: No action is needed.
/
1031, RES_ALREADY_DISABLED_VM, "Virtual machine \"{0}\" of VM resource \"{1}\" is already disabled."
//  *Cause: An attempt to disable the specified virtual machine was rejected because the virtual machine was already disabled.
// *Action: No action is needed.
/
1032, ADD_VM_FAILED_ALREADY_REGISTERED, "unable to add or modify VM resource because some of the virtual machines specified to be added are already configured in another VM resource"
//  *Cause: The VM resource could not be added or modified because some of the virtual machine names or IDs specified to be added were 
//   already registered in a VM resource. See the accompanying error messages for more details.
//  *Action: Retry the 'add' or 'modify' operation specifying virtual machine names or IDs to be added that are not already registered.
/
1033, VM_ALREADY_REGISTERED_OUTPUT, "VM resource \"{0}\" already contains the following virtual machines: {1}."
//  *Cause: The operation was rejected because the specified virtual machine instances were already registered in the specified VM resource.
//  *Action: Retry the operation specifying virtual machine names or IDs to be added that are not already registered.
/
1034, VM_REMOVE_EMPTY_FAIL, "The removal of virtual machine instances of VM resource \"{0}\" failed because at least one virtual machine instance has to be configured on the VM resource."
//  *Cause: The removal of virtual machine instances was rejected because the number of virtual machines specified was more than the number of virtual machine instances configured 
//  on the VM resource.
//  *Action: Retry the operation, making sure that at least one virtual machine is configured on the VM resource.
/
1035, VM_RELOCATE_RUNNING_FAIL, "unable to relocate VM resource \"{0}\" because the VM resource is not running on node {1}"
//  *Cause: The relocate operation was rejected because the VM resource was not running on the specified node.
//  *Action: If the resource is running on a different node, then retry the relocate specifying the correct source, otherwise start the VM resource on the intended destination node.
/
1036, VM_CREATE_FAIL_OVMM, "unable to create VM resource \"{0}\" because the Oracle Virtual Machine Manager (OVMM) was not configured"
//  *Cause: The creation of the specified VM resource failed because the OVMM was not configured.
//  *Action: Retry the operation after adding the OVMM using the 'srvctl add ovmm' command.
/
1037, CONFIG_VM_INVALID, "Warning: The following virtual machines do not exist: {0}."
//  *Cause: The operation discovered a problem with the listed virtual machine names or IDs because there was no matching name or ID in the VM resource.
//  *Action: Either add the missing virtual machines to the Oracle VM Manager or remove them from the configuration of the VM resource. 
/
1038, ALREADY_PRESENT_VM, "Warning: The following virtual machines are already configured on the VM resource: {0}."
//  *Cause: The attempt to add virtual machines found that the listed virtual machines were already configured on the specified VM resource.
//  *Action: No action is needed.
/
1039, ALREADY_ABSENT_VM, "Warning: The following virtual machines are not present in the VM resource: {0}."
//  *Cause: The attempt to remove virtual machines found that the listed virtual machines were not present in the VM resource.
//  *Action: No action is needed.
/
1040, VM_LIST_REQUIRED, "failed to create VM resource {0} because the list of virtual machines to be added was not specified"
//  *Cause: The attempt to create the VM resource failed because the list of virtual machines, which is a mandatory parameter required for resource creation, was not specified.
//  *Action: Retry the operation making sure to specify a list of virtual machines.
/
1041, RES_ALREADY_ENABLED_VMS, "Virtual machines \"{0}\" of VM resource \"{1}\" are already enabled."
//  *Cause: An attempt to enable the specified virtual machines failed because the virtual machines were already enabled.
// *Action: No action is needed.
/
1042, RES_ALREADY_DISABLED_VMS, "Virtual machines \"{0}\" of VM resource \"{1}\" are already disabled."
//  *Cause: An attempt to disable the specified virtual machines failed because the virtual machines were already disabled.
// *Action: No action is needed.
/
1043, SERVERPOOL_NOT_CONFIGURED, "unable to retrieve the server pool because VM resource \"{0}\" was not configured with a server pool"
//  *Cause: The request to retrieve the server pool failed because the VM resource was not configured with the server pool option.
//  *Action: Retry the operation after modifying the configuration of the VM resource to include the server pool placement option.
/
1044, CATEGORY_NOT_CONFIGURED, "unable to retrieve the server category because VM resource \"{0}\" was not configured with a server category"
//  *Cause: The request to retrieve the server category failed because the VM resource was not configured with the server category option.
//  *Action: Retry the operation after modifying the configuration of the VM resource to include the server category placement option.
/
1045, NODES_NOT_CONFIGURED, "unable to retrieve the nodes because VM resource \"{0}\" was not configured with the node option"
//  *Cause: The request to retrieve the nodes failed because the VM resource was not configured with the node option.
//  *Action: Retry the operation after modifying the configuration of the VM resource to include the node placement option.
/
1046, MISMATCH_VM_WARNING, "Warning: The user-provided virtual machine identity \"{0}\" does not match the configured virtual machine name \"{1}\" nor virtual machine ID \"{2}\"."
//  *Cause: A check of the VM resource configurations found that the user-provided virtual machine identity did not match the configured virtual machine name nor the virtual machine ID.
//  *Action: Remove and re-add the virtual machine to the VM resource.
/
1047, DUPLICATE_VM_WARNING, "Warning: The virtual machines {0} have the same virtual machine ID \"{1}\"."
//  *Cause: A check of the VM resource configuration found that the virtual machines corresponding to the specified virtual machine name or IDs are duplicates and have the same virtual machine ID.
//  *Action: Reconfigure the VM resource without duplicate virtual machines.
/
1048, VM_CREATE_EMPTY_NAME, "failed to create VM resource because the name supplied was empty"
// *Cause: An attempt to create a VM resource failed because the name specified for the VM resource was empty.
// *Action: Retry the operation making sure to provide a nonempty name for the VM resource.
/
1049, VM_INST_RELOCATE_RUNNING_FAIL, "unable to relocate virtual machine \"{0}\" of VM resource \"{1}\" because the virtual machine is not running" 
//  *Cause: The relocate operation was rejected because the specified virtual machine was not running.
//  *Action: Start the virtual machine on the desired destination node.
/

