// Copyright (c) 2008, 2013, Oracle and/or its affiliates. All rights reserved.
//
// NAME
//    PrCpMsg.msg
//
// DESCRIPTION
//    Message file to be used by Policy Convergence framework
//
// NOTES
//
//    MODIFIED    (MM/DD/YY)
//     ocordova    05/16/13 - Fix Bug 16688256
//     sparial     12/22/11 - Creation
//   */
//
// PACKAGE=package oracle.cluster.resources;
1000, DUPLICATE_SERVER_POOLS_FOUND_FOR_POLICYSET, "Server pool list {0} for policy set contains duplicate server pool definition"
//  *Cause: The supplied server pool list had duplicate entries.
// *Action: Ensure that the server pool list provided for the policy set does not have any duplicate entries.
/
1001, DUPLICATE_SERVER_POOLS_FOUND_FOR_POLICY, "Configuration policy {0} has a Server Pool List {1} which does not match server pool list of Configuration policy set"
//  *Cause: The supplied server pool list had duplicate entries.
// *Action: Ensure that the server pool list specified for the policy is exactly same to the server pool list of policy set.
/
1002, INVALID_SERVER_POOL_LIST, "The list of server pools {0} provided for policy {1} and the server pools for the policy set are not same."
//  *Cause: The supplied server pool list for the policy did not match the server pool list supplied for the policy set.
// *Action: Make sure that the server pool list for the policy and the server pool list for the policy set must contain same server pools.
/
1003, DUPLICATE_POLICIES_FOUND, "Policy List {0} contains duplicate policy definitions"
//  *Cause: The supplied policy list had duplicate entries.
// *Action: Ensure sure that the policy list provided for the policy set does not contain duplicate entries.
/
1004, POLICYSET_INPUT_VALIDATION_FAILED, "Input validation failed for policy set because of {0} errors."
//  *Cause: One or more inputs supplied for the policy set was incorrect.
// *Action: Examine the accompanying error message for details.
/
1005, INVALID_PARAMETER, "Parameter {0} value is not valid"
//  *Cause: This is an internal error. The value for the specified parameter is null or empty string.
// *Action: Contact Oracle Support Services.
/
1006, POLICYSET_RETRIEVAL_FAILED, "policy set could not be retrieved because clusterware stack is not up"
//  *Cause: An attempt to retrieve the policy set has failed as the clusterware stack was not up.
//  *Action: Bring up clusterware stack and retry the operation.
/
1007, INCONSISTENT_POLICIES_EXIST, "policy set contains policies which are not consistent with SRVM framework."
//  *Cause: An attempt to retrieve policies from a policy set failed because the policy set contained policies inconsistent with SRVM framework.
//  *Action: Contact Oracle Support Services.
/
1008, INVALID_RESOURCE_LIST, "The list of resources {0} provided for policy {1} is not same as the other policies of this policy set."
//  *Cause: The resource list for the policy did not match the resource list supplied for other policies of this policy set.
// *Action: Make sure that the resource list for all the policies of this policy set contains same resources.
/

