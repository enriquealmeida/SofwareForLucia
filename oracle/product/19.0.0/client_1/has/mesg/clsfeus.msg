# CHARACTER_SET_NAME=American_America.US7ASCII
/ Copyright (c) 2011, Oracle and/or its affiliates. All rights reserved.
/
/
/ NAME
/   clsfeus.msg
/ DESCRIPTION
/   Message file for clsfe filter expressions.
/
/ 100 ..  - environmental issues.
/ 200 ..  - user relevant Filter Expression Parsing complaints
/ 600 ..  - internal errors customers should not have to see.
/
/ MODIFIED
/    dbrower   03/15/13 - created, message review tweaks.
/  
/
100, 0, "Failed to allocate %(1)s bytes."
// *Cause:  An attempt to allocate memory failed.
// *Action: Contact Oracle Support Services.
200, 0, "Syntax Error near '@@': extra tokens in filter expression \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
201, 0, "Syntax Error near '@@': too much nesting in filter expression \"%(1)s\"."
// *Cause: The expression was too complicated to process.
// *Action: Try simplifying the filter expression.
202, 0, "Syntax Error near '@@': operator expected after %(2)s at \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
203, 0, "Syntax Error near '@@': invalid literal after %(2)s in \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
204, 0, "Syntax Error near '@@': literal expected after operator for '%(2)s' in \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
205, 0, "Syntax Error near '@@': ')' expected in \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
206, 0, "Syntax Error near '@@': attribute name expected at \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
207, 0, "Syntax Error near '@@': illegal operator at \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
208, 0, "Syntax Error near '@@': unterminated string literal at \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
209, 0, "Syntax Error near '@@': invalid regular expression \"%(2)s\" for \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
210, 0, "Syntax Error near '@@': too many tokens in \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression.
// *Action: Correct the filter expression and retry.
211, 0, "Syntax Error near '@@': literal expected after predicate '%(2)s' in \"%(1)s\"."
// *Cause: There was a syntax error in the provided filter expression
// *Action: Correct the filter expression and retry.

600, 0, "%(1)s %(2)s %(3)s Internal error %(4)s"
// *Cause: An unexpected error was detected.
// *Action: Contact Oracle Support Services.
601, 0, "Bad parameter at %(1)s '%(2)s' = '%(3)s'"
// *Cause: An unexpected error was detected.
// *Action: Contact Oracle Support Services.

   
   
