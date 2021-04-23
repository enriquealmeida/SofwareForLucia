/ Copyright (c) 2013, 2018, Oracle and/or its affiliates. All rights reserved.
/
/ ident "%Z%%M% %I%     %E%"
/
/ NAME
/   clszmus.msg
/ DESCRIPTION
/   Message file for CLS ZM zecurity monitor
/ NOTES
# CHARACTER_SET_NAME=American_America.US7ASCII
/
/ MODIFIED
/   rwessman  03/27/18  - Bug 27760510 - Corrected marking of messages which
/                         should not be translated.
/   dbrower   06/22/13 -  created.
/
/ Message number ranges:
/   0100-0199: External errors
/   0600-0699: Internal errors
/
/
00101, 0, "Operation denied."
// *Cause:  The operation was denied by security policy.
// *Action: Invoke the operation as a user that has privilege to
//          execute the operation.   
/
00102, 0, "The program did not find an object of type %(1)s with the name '%(2)s'."
// *Cause:  An object with the requested name does not exist.
// *Action: Specify a name that exists, or create it first.


00103, 0, "The program failed to create a %(1)s object with the name '%(2)s', which already exists."
// *Cause:  Making an object failed because it already existed with that name.
// *Action: Specify a name that does not already exist.
/
00104, 0, "The given name '%(1)s' was too long.  The maximum length is %(2)s."
// *Cause:  A request was given a longer name than is allowed.
// *Action: Provide a shorter name.
/
00105, 0, "The program could not add another entry to the ACL. The maximum number of entries is %(1)s."
// *Cause:  The program failed to add to an entry to an ACL.
// *Action: Consider using roles to simplify the ACL.
/
00106, 0, "The program failed to add role %(1)s to role %(2)s because it would cause a loop."
// *Cause:  Adding sub-role would cause role to include itself.
// *Action: Simplify the role inclusions.
/
00107, 0, "The program could not destroy a busy %(1)s object. A %(2)s object was still using it."
// *Cause:  There are references to the object in other objects,
//          and destroying it would cause inconsistencies.    
// *Action: Delete the references first, or do a recursive destroy.

00108, 0, "The program failed an operation on a %(1)s object with the name '%(s)' because it was deleted from the repository."
// *Cause:  The object has been deleted by another process or user, so this
//          operation could not proceed.
// *Action: Understand why it was deleted, and consider alternative action.


//----------------------------------------------------------------

//--------------
// 0600-699 internal errors do NOT need to be translated.
//
// NLS_DO_NOT_TRANSLATE [600,699]
00600, 0, "The program detected an unspecified internal error [%(1)s] [%(2)s] [%(3)s] [%(4)s] [%(5)s]."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00601, 0, "The program found a buffer that was too short. It was %(1)s, and needed to be at least %(2)s."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00602, 0, "The program received a repository error, details follow."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00603, 0, "The program detected a bad repository handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00604, 0, "The program detected a bad entity handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00605, 0, "The program detected a bad entity iterator handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00606, 0, "The program detected a bad anyuser handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00607, 0, "The program detected a bad anyuser iterator handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00608, 0, "The program detected a bad authuser handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00609, 0, "The program detected a bad role handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00610, 0, "The program detected a bad role iterator handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00611, 0, "The program detected a bad ACL handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00612, 0, "The program detected a bad ACE handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00613, 0, "The program detected a bad ACE iterator handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00614, 0, "The program detected a bad privilege iterator handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00615, 0, "The program detected bad privilege bits %s."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00616, 0, "The program detected a bad password iterator handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.

00617, 0, "The program detected a bad password handle."
// *Cause:  Internal program error.
// *Action: Report to Oracle Support Services.


