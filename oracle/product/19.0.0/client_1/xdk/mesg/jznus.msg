/ $RCSfile: jznus.msg $
/ $Date: 2018/05/25 17:35:51 $
/ Copyright (c) 1999, 2018, Oracle and/or its affiliates. All rights reserved.
/
/   NAME
/     jznus.msg
/
/   DESCRIPTION
/     US-language error message file for JSON facilities (JZN)
/
/   NOTES
/     COMPLY WITH STANDARDS WHEN ADDING OR CHANGING MESSAGES!
/     See /vobs/rdbms/mesg/oraus.msg for full message rules.
/
/     Error messages are XML-parser-specific format strings, not general
/     printf-type format strings.  The magic character is '~' instead of
/     '%', and formatting is very restricted.  Choices are:
/
/	~d  sb4	      signed decimal output
/	~u  ub4	      unsigned decimal output
/	~x  ub4	      U+FFFF-style Uncode character output
/	~X  ub4	      Generic 0x-style hexadecimal output
/       ~c  ub4	      single-character output
/	~s  oratext*  single/multibyte string output
/	~S  oratext*  single/multibyte/Unicode string output
/
/     Hex 'x' is for Unicode character output.  It formats "\uFFFF" for
/     USC2 characters and "\vFFFFFF" for UCS4 characters.
/
/     Hex 'X' format is used for NLS wide characters, as many bytes as
/     needed, leading 0 bytes omitted, e.g. "0xF".
/
/     For the 'S' format type, the string is expected to be in the DOM
/     data encoding, which may be single-byte, multi-byte, or Unicode.
/     For plain 's' format, the string may only be single or multi-byte.
/
/ ----------------------------------------------------------------------
/
/     For error messages with multiple arguments, the fields must be
/     identified as to the original order of arguments in the code.
/     If there is only a single argument, the number "1" may be omitted.
/
/     That is, if a message contains ~1s and ~2s then ~1s corresponds to
/     the first code argument, ~2s to the second.  This is so that the
/     order may be changed as needed in translation while the code still
/     passes the arguments in original order.
/
/ --- Generic Errors ---------------------------------------------------------
/
00000, 00000, "Normal, successful completion"
// *Cause:  The operation completed successfully.
// *Action: No action required.
/
00001, 00000, "End of input"
// *Cause:  Processing has reached the end of available input.
// *Action: No action required.
/
00002, 00000, "Invalid argument"
// *Cause:  The input argument was not a buffer, file, or stream.
// *Action: This is a programming error by the caller of the JavaScript
//          Object Notation (JSON) facility.
//          Contact Oracle Support Services.
/
00003, 00000, "Input not specified"
// *Cause:  A parse or decode operation was requested without specifying
//          input.
// *Action: Specify a buffer, file, or stream as input before attempting
//          to parse or decode the input.
/
00004, 00000, "Cannot open input file"
// *Cause:  The requested input file could not be found, or was not readable.
// *Action: Ensure that the file exists and that read permission is available.
/
00005, 00000, "Syntax error"
// *Cause:  The JavaScript Object Notation (JSON) parser encountered
//          syntactically invalid JSON.
// *Action: Correct the JSON input document.
/
00006, 00000, "Invalid escape sequence"
// *Cause:  The JavaScript Object Notation (JSON) parser encountered an
//          invalid sequence of characters following a backslash character.
// *Action: Correct the JSON input and remove or correct the invalid
//          escape sequence.
/
00007, 00000, "Object member key is not unique"
// *Cause:  The JavaScript Object Notation (JSON) parser detected a
//          duplicate member key.
// *Action: Correct the JSON input and remove the duplicate key.
/
00008, 00000, "Parse already in progress"
// *Cause:  An attempt was made to begin parsing an input while a parsing
//          operation was already in progress.
// *Action: Close the previous parsing operation before beginning a new one.
/
00009, 00000, "Unsupported encoding"
// *Cause:  The requested character encoding was not supported by
//          JavaScript Object Notation (JSON).
// *Action: Convert the input to Unicode.
/
00010, 00000, "Invalid byte sequence in character data"
// *Cause:  The parser encountered a sequence of bytes that were invalid
//          for the specified character set.
// *Action: Correct the input source or ensure that the character encoding
//          is correctly specified.
/
00011, 00000, "Error reading input"
// *Cause:  An I/O error was encountered while reading input
//          for parsing or decoding.
// *Action: None.
/
00012, 00000, "Premature end of input"
// *Cause:  The parser or decoder encountered the end of the input source
//          while still expecting more data.
// *Action: None.
/
00013, 00000, "Stack overflow"
// *Cause:  The internal depth limit on the JavaScript Object Notation (JSON)
//          hierarchy of containers (which may be objects, arrays, or both)
//          was exceeded during a Document Object Model (DOM) read or write
//          operation.
// *Action: None.
/
00014, 00000, "Stack underflow"
// *Cause:  An event sequence to render the JavaScript Object Notation (JSON)
//          included a closing event for an unknown object or array.
// *Action: The input source is bad, likely due to a programming error.
/
00015, 00000, "Name too long"
// *Cause:  The JavaScript Object Notation (JSON) parser encountered a member
//          key name that exceeded the internal maximum.
// *Action: Parse the input without duplicate key checks.
/
00016, 00000, "Serializer stream error"
// *Cause:  An I/O error was encountered while writing to the output stream.
// *Action: None.
/
00017, 00000, "Serializer buffer error"
// *Cause:  The data overflowed the fixed-size output buffer.
// *Action: Specify a larger output buffer consistent with the input supplied.
/
00018, 00000, "Input to serializer is too large"
// *Cause:  The data overflowed the fixed-size output buffer.
// *Action: Specify a larger output buffer consistent with the input supplied.
/
00019, 00000, "Cannot print without array wrapper"
// *Cause:  The result of the JavaScript Object Notation (JSON) expression
//          could not be rendered without an array wrapper.
// *Action: If the expression results in a sequence of multiple results,
//          the array wrapper option is required.
/
00020, 00000, "Empty result"
// *Cause:  The path expression resulted in a null result.
// *Action: None.
/
00021, 00000, "Value to be printed was not scalar"
// *Cause:  An operation requested a scalar value, but the selected value was
//          an object, array, or sequence and could not be returned.
// *Action: None.
/
00022, 00000, "Extra data after end of input"
// *Cause:  Additional data bytes were encountered after the expected end
//          of input.
// *Action: None.
/
00023, 00000, "Length does not match data"
// *Cause:  The binary decoder encountered a data length that exceeded or
//          did not match the actual data value.
// *Action: The input is corrupt.
/
00024, 00000, "Unrecognized data type or code"
// *Cause:  The binary decoder encountered an unrecognized operation code.
// *Action: The input is corrupt.
/
00025, 00000, "Invalid binary data"
// *Cause:  The binary decoder encountered invalid or inconsistent data
//          while reading the input.
// *Action: The input is corrupt.
/
00026, 00000, "Too many levels of nesting"
// *Cause:  The internal depth limit on the JavaScript Object Notation (JSON)
//          hierarchy of containers (which may be objects, arrays, or both)
//          was exceeded.
// *Action: None.
/
00027, 00000, "Internal error"
// *Cause:  An internal error occurred in the code.
// *Action: Contact Oracle Support Services.
/
00028, 00000, "Out of memory"
// *Cause:  The operating system ran out of memory.
// *Action: Increase the memory available to the program.
/
00029, 00000, "Data member too large"
// *Cause:  A data value in a Document Object Model (DOM) was too large to
//          be encoded in binary form.
// *Action: None.
/
00030, 00000, "NULL pointer for required context"
// *Cause:  A NULL pointer was detected as an internal error condition.
// *Action: This is a programming error by the caller of the
//          JavaScript Object Notation (JSON) facility.
//          Contact Oracle Support Services.
/
00031, 00000, "Invalid path expression"
// *Cause:  The JavaScript Object Notation (JSON) path expression could not
//          be successfully parsed.
// *Action: Correct the invalid syntax.
/
00032, 00000, "Invalid array position in path expression"
// *Cause:  The specified array position was invalid.
// *Action: Array positions must be non-negative integers.
/
00033, 00000, "Invalid order of array indexes"
// *Cause:  In a comma-delimited set of array indexes, the array indexes
//          were in descending order.
// *Action: Correct the array indexes so that they appear in ascending order.
/
00034, 00000, "Field name too long"
// *Cause:  The field name exceeded 256 bytes.
// *Action: Select a shorter name for the field.
/
00035, 00000, "Total field names too long"
// *Cause:  The total length of all field names exceeded the 65536 byte limit.
// *Action: None.
/
00036, 00000, "Array or object position out of bounds"
// *Cause:  An attempt was made to access either an element outside of the
//          array bounds, or an object member outside of the list of members.
// *Action: None.
/
00037, 00000, "Invalid number"
// *Cause:  The string could not be interpreted as a numeric value.
// *Action: None.
/
00038, 00000, "Invalid date/time"
// *Cause:  The string could not be interpreted as a date or date/time.
// *Action: The data/time string must be in accordance with ISO-8601.
/
00039, 00000, "Size overflow for JSON set encoding"
// *Cause:  The total size of the JavaScript Object Notation (JSON) objects
//          exceeded the maximum allowed for JSON set-oriented storage.
// *Action: None.
/
00040, 00000, "Invalid specification"
// *Cause:  The Query-By-Example (QBE) specification was invalid.
// *Action: Correct the specification.
/
00041, 00000, "JSON Patch operation could not be completed"
// *Cause:  The JavaScript Object Notation (JSON) Patch operation encountered
//          an infeasible operation and could not be completed.
// *Action: None.
/
00042, 00000, "Modification not allowed on read-only object"
// *Cause:  Read-only JavaScript Object Notation (JSON) objects could not be
//          modified by Document Object Model (DOM) operations.
// *Action: This is a programming error. Correct the error by copying the
//          DOM to a read/write DOM and then executing the modification.
/
00043, 00000, "Feature not implemented"
// *Cause:  This feature was not implemented yet.
// *Action: None.
/
00044, 00000, "Type conversion failed"
// *Cause:  A type conversion requested for JavaScript Object Notation (JSON)
//          Path output could not be performed.
// *Action: None.
/
00045, 00000, "Invalid sequence of events"
// *Cause:  The JavaScript Object Notation (JSON) serializer encountered an
//          incorrect event sequence and could not serialize the result.
// *Action: This is a programming error by the caller of the JSON facility.
//          Contact Oracle Support Services.
/
00046, 00000, "Requested key does not exist"
// *Cause:  An attempt was made to read a key from a Document Object Model (DOM)
//          object node, but the key was not present in the DOM object node.
// *Action: This is a programming error.
/
00047, 00000, "Cyclic reference to DOM node is not allowed"
// *Cause:  A Document Object Model (DOM) node could not be inserted below
//          one of its own descendant nodes.
// *Action: This is a programming error.
/
00048, 00000, "Multiple references to DOM node are not allowed"
// *Cause:  A Document Object Model (DOM) node could not be inserted because
//          it is already present in the document node tree.
// *Action: This is a programming error.
/
00049, 00000, "Input to JSON parser is empty"
// *Cause:  The input provided to the JSON parser was empty.
// *Action: This is an internal error message not visible to user.
/
00050, 00000, "Character set conversion failed"
// *Cause:  The string could not be converted to or from UTF-8.
// *Action: This is an internal error message not visible to user.
/
00051, 00000, "Invalid regular expression"
// *Cause:  The string supplied to 'eq_regex' or 'like_regex' could not
//          be interpreted as a regular expression.
// *Action: Correct the expression.
/
00052, 00000, "no cached value found for this column"
// *Cause:  Internal code signals that a call to get a JSON_TABLE
//          column value found no pre-generated value in the cache.
// *Action: Call the generation function to get and cache the value.
/
00053, 00000, "target of DOM operation must be an object node"
// *Cause:  A DOM operation that requires an object node was given an
//          array or scalar node as the target.
// *Action: Correct the code to use an operation appropriate to the node type.
/
00054, 00000, "target of DOM operation must be an array node"
// *Cause:  A DOM operation that requires an array node was given an
//          object or scalar node as the target.
// *Action: Correct the code to use an operation appropriate to the node type.
/
00055, 00000, "target of DOM operation is not scalar"
// *Cause:  A DOM operation that requires a scalar node was given an object
//          object or array node as the target.
// *Action: Correct the code to use an operation appropriate to the node type.
/
00056, 00000, "numeric overflow"
// *Cause: A string representaion of a number was too large to be converted 
//         to an Oracle number.
// *Action: Use a smaller number or do not convert to Oracle number format.
/
00070, 00000, "comma not preceded or followed by field or item"
// *Cause:  An unexpected or superfluous comma was encountered while
//          parsing an object or array.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00071, 00000, "missing comma in object or array"
// *Cause:  A comma was expected between members of an object, or between
//          items in an array.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00072, 00000, "object member is missing value"
// *Cause:  An object member name and colon was not followed by a member value.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00073, 00000, "missing colon in member:value pair"
// *Cause:  An object member name was not followed by a colon.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00074, 00000, "member name not enclosed in double quotation marks"
// *Cause:  An object member name was not enclosed in double quotation marks, and
//          either contained or started with a character that was not allowed.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00075, 00000, "string value not enclosed in double quotation marks"
// *Cause:  A string value was not enclosed in double quotation marks.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00076, 00000, "number could not be parsed"
// *Cause:  A JavaScript Object Notation (JSON) number was encountered that 
/           contained invalid characters.
// *Action: This is an error in the JSON input.
/
00077, 00000, "invalid ASCII control character"
// *Cause:  An invalid byte value was read from the JavaScript Object Notation (JSON)
//          input. ASCII control
//          characters are not allowed in JSON text.
// *Action: This is an error in the JSON input.
/
00078, 00000, "Invalid JSON keyword"
// *Cause:  A literal value was encountered that could not be interpreted
//          as a JSON literal. Allowed JSON literals are 'true', 'false',
//          and 'null'.
// *Action: This is an error in the JSON input.
/
00079, 00000, "missing quotation mark in the string"
// *Cause:  A member name or string value beginning with a quotation mark did
//           not have a closing quotation mark.
// *Action: This is an error in the JavaScript Object Notation (JSON) input.
/
00201, 00000, "Unquoted punctuation in step"
// *Cause:  A path step contained punctuation characters.
// *Action: Enclose the step in double quotation marks.
/
00202, 00000, "Escape sequence must be in quotation marks"
// *Cause:  A backslash escape sequence was not enclosed in quotation marks.
// *Action: Enclose the string in double quotation marks.
/
00203, 00000, "Invalid escape sequence"
// *Cause:  An escape sequence beginning with a backslash contained invalid
//          characters.
// *Action: Correct the invalid escape sequence.
/
00204, 00000, "Invalid surrogate pair"
// *Cause:  The surrogate pair was invalid. A surrogate pair must consist
//          of a high surrogate followed by a low surrogate.
// *Action: Correct the invalid surrogate pair.
/
00205, 00000, "Array subscript too long"
// *Cause:  A subscript within an array step was too long to be interpreted.
// *Action: Shorten the array step.
/
00206, 00000, "Array subscript invalid range"
// *Cause:  An array range subscript had a start position greater than
//          the end position.
// *Action: Reverse the start and end positions to create a valid range.
/
00207, 00000, "Variable name is invalid"
// *Cause:  The variable name was invalid. A variable name must be
//          alphanumeric and cannot start with a number.
// *Action: Correct the variable name.
/
00208, 00000, "Path must start with a dollar sign ($) character"
// *Cause:  A path did not start with a dollar sign ($) character.
// *Action: Start the path with a dollar sign ($) character.
/
00209, 00000, "Unexpected characters after end of path"
// *Cause:  Trailing characters followed the end of the path.
// *Action: Remove the trailing or corrupted characters.
/
00210, 00000, "Empty array subscript"
// *Cause:  An array step was empty.
// *Action: Specify a subscript, range, or series of entries.
/
00211, 00000, "Invalid array subscript"
// *Cause:  The specified array position was invalid.
// *Action: Array positions must be non-negative integers.
/
00212, 00000, "Array wildcard must be used alone"
// *Cause:  The array wildcard (*) character was not specified by itself in
//          an array subscript.
// *Action: Remove all other parts of the subscript.
/
00213, 00000, "Object key wildcard must be used alone"
// *Cause:  The key wildcard (*) character did not appear by itself in a key
//          step.
// *Action: Remove extraneous characters from the key step.
/
00214, 00000, "Missing square bracket in array step"
// *Cause:  An array step had mismatching square bracket ([]) charaters.
// *Action: Add the missing closing square bracket character.
/
00215, 00000, "Array step contains unexpected characters"
// *Cause:  An array step contained invalid characters and could
//          not be interpreted.
// *Action: Array steps must contain numbers, ranges, or
//          comma-delimited numbers and ranges.
/
00216, 00000, "Unclosed quoted step"
// *Cause:  A step beginning with a quotation mark did not have a closing
//          quotation mark.
// *Action: Add the missing quotation mark.
/
00217, 00000, "Key step contains unexpected characters"
// *Cause:  A key step contained invalid characters and could not
//          be interpreted.
// *Action: Unquoted key steps must be alphanumeric and begin
//          with an alphabetic character. Otherwise, enclose the step
//          in quotation marks.
/
00218, 00000, "Invalid JSON literal"
// *Cause:  A JavaScript Object Notation (JSON) literal must be 'true',
//          'false', or 'null'.
// *Action: None.
/
00219, 00000, "Literal contains unexpected characters"
// *Cause:  A JavaScript Object Notation (JSON) literal must be
//          'true', 'false', or 'null'.
// *Action: None.
/
00220, 00000, "Invalid number"
// *Cause:  The value could not be interpreted as a number.
// *Action: None.
/
00221, 00000, "Numeric overflow"
// *Cause:  The numeric value could not be converted to binary because of an
//          overflow.
// *Action: None.
/
00222, 00000, "Invalid regular expression"
// *Cause:  The expression supplied to 'eq_regex' or 'like_regex' was
//          not a valid regular expression.
// *Action: Correct the expression.
/
00223, 00000, "Unsupported operator"
// *Cause:  The 'not_in' operator was specified in an expression.
// *Action: Use a logical not surrounding an 'in' expression instead.
/
00224, 00000, "Unexpected characters in comparison operator"
// *Cause:  Unexpected characters were present in the expression.
// *Action: Remove the unexpected characters from the expression.
/
00225, 00000, "Comparison with expression must involve a path"
// *Cause:  A comparison operation with an expression did not involve a path.
// *Action: None.
/
00226, 00000, "Not operator must be followed by parenthetical expression"
// *Cause:  The expression after a not operator was not enclosed in
//          parentheses.
// *Action: Enclose the expression in parentheses.
/
00227, 00000, "Comparison must be against 'true' or 'false'"
// *Cause:  The comparison was not against a JavaScript Object Notation (JSON)
//          'true' or 'false' literal.
// *Action: None.
/
00228, 00000, "Question mark must be followed by parenthetical expression"
// *Cause:  A question mark introduced a filter that was enclosed in
//          parentheses.
// *Action: Enclose the filter condition in parentheses.
/
00229, 00000, "Missing parenthesis in paranthetical expression"
// *Cause:  A parenthetical expression was missing a closing parenthesis.
// *Action: Append a closing parenthesis to close the expression.
/
00230, 00000, "Unexpected characters in expression"
// *Cause:  Unexpected characters were present in the expression.
// *Action: Remove the unexpected characters from the expression.
/
00231, 00000, "Unquoted Unicode character"
// *Cause:  A Unicode character appeared outside of quotation marks.
// *Action: Surround the path step or value with quotation marks.
/
00232, 00000, "Expected a '.' following step"
// *Cause:  After a path step, a '.' separator was expected.
// *Action: None.
/
00233, 00000, "Invalid character at start of step"
// *Cause:  The next path step started with an invalid character.
// *Action: None.
/
00234, 00000, "Invalid '@' outside of predicate"
// *Cause:  An '@' character appeared in the path outside of a
//          predicate clause.
// *Action: None.
/
00235, 00000, "Invalid '$' inside of predicate"
// *Cause:  A '$' appeared in the path inside of a predicate clause.
// *Action: None.
/
00236, 00000, "missing or invalid function or operator"
// *Cause:  A predicate expression was missing an operator or specified
//          a function that was not valid.
// *Action: None.
/
00237, 00000, "invalid comparison of two path expressions"
// *Cause:  A predicate expression contained a path expression on both the
//          left and right sides of the operator.
// *Action: None.
/
00238, 00000, "path expression has more than one predicate"
// *Cause:  A path expression had more than one predicate expression
//          at the top level. At most, one predicate expression is allowed
//          at the top level.
// *Action: None.
/
00239, 00000, "predicate expression before final path step"
// *Cause:  A path expression contained a predicate expression prior to the
//          final step in the path. If an expression has a predicate at
//          the top level, it must be the final step in the path.
// *Action: None.
/
00240, 00000, "invalid characters in array range subscript"
// *Cause:  The specified array range contained invalid characters.
//          Array ranges are specified using the keyword 'to' between
//          the start and end of the range.
// *Action: Array positions must be non-negative integers.
/
00241, 00000, "invalid function at the end of path"
// *Cause:  The specified function is not valid.
// *Action: None.
/
00242, 00000, "parentheses nested too deeply"
// *Cause:  A path expression contained too many levels of nested parentheses.
// *Action: None.
/
00243, 00000, "type incompability for comparison"
// *Cause:  The domain of a type comparison cannot be determined because
//          the types are incompatible and cannot be converted.
// *Action: Add a type casting function to the comparison expression.
/
00244, 00000, "wrong argument data type for function call"
// *Cause:  The argument to a function call does not have the correct
//          data type and cannot be converted to the correct data type.
// *Action: Use an argument of an allowed data type.
/
00245, 00000, "can not convert literal to the required data type"
// *Cause:  The JSON literal value cannot be converted to the data type
//          required by the operation or comparison.
// *Action: Use a literal value within the domain of the datatype.
/
00246, 00000, "expression types used by in/not_in sequence must be uniform"
// *Cause:  The values used for an in or not_in sequence must be of a
//          uniform data type.
// *Action: Do not mix JSON literals or bind variables of different data types
//          in the sequence given to an in or not_in clause.
/
00247, 00000, "Array subscript or range out of order"
// *Cause:  An array subscript appeared in a comma-separated list
//          after a higher subscript or range.
// *Action: Reverse the order of the list items and ensure that ranges
//          do not overlap.
/
00248, 00000, "Character not escaped"
// *Cause:  A character appeared in a quoted path step or literal string
//          without being escaped as required.
// *Action: Escape the character with a backslash sequence. Control
//          characters, including whitespace characters such as the
//          horizontal tab (\t), the carriage return (\r), and the
//          newline (\n) must be escaped. Other control characters
//          can be escaped with Unicode \uXXXX sequences.
/
00249, 00000, "Unquoted empty step not allowed"
// *Cause:  A zero length step appeared in a path without being enclosed
//          in quotes. The sequence '..' implies a descendant that may
//          not be an immediate child of the previous step.
// *Action: Enclose the zero-length step with backquote (`) characters.
/
00250, 00000, "JSON Patch specification must be an array of operations"
// *Cause:  The JavaScript Object Notation (JSON) Patch specification
//          was not an array. A JSON Patch specification must be an
//          array, listing an ordered series of operations to be performed.
// *Action: Refer to the JSON Patch standard.
/
00251, 00000, "JSON Patch operations must be objects"
// *Cause:  The JavaScript Object Notation (JSON) Patch specification
//          array contained some non-object members. Each element of the
//          JavaScript Object Notation (JSON) Patch specification array
//          must be an object describing a patch operation to be performed.
// *Action: Refer to the JSON Patch standard.
/
00252, 00000, "No 'op' code for patch operation"
// *Cause:  An object in a JavaScript Object Notation (JSON) Patch
//          specification was missing an 'op' code.
// *Action: Refer to the JSON Patch standard.
/
00253, 00000, "Invalid path for patch operation"
// *Cause:  The 'path' or 'from' clause in a patch operation could not be
//          parsed.
// *Action: Refer to the JavaScript Object Notation (JSON) Pointer
//          specification.
/
00254, 00000, "Invalid 'op' code for patch operation"
// *Cause:  The 'op' code could not be interpreted.
// *Action: An 'op' code must be a string and must be one of the
//          standard JavaScript Object Notation (JSON) Patch operators.
/
00255, 00000, "Unknown key name in patch operation"
// *Cause:  The operation contained a key that is not specified by
//          JavaScript Object Notation (JSON) Patch.
// *Action: Remove the invalid key.
/
00256, 00000, "Patch operation requires a path"
// *Cause:  The target path for an operation was not specified.
// *Action: Ensure that all operations have a valid target path.
/
00257, 00000, "'path' or 'from' key must have a string value"
// *Cause:  The path specified for a 'path' or 'from' field was not a string.
// *Action: Ensure that all operations have a valid target path.
/
00258, 00000, "From path not allowed for operation"
// *Cause:  The 'from' path was specified for an operation that does not
//          allow it. 'from' is only allowed in the 'move' and 'copy'
//          operations.
// *Action: Remove the 'from' path.
/
00259, 00000, "'value' is not allowed for operation"
// *Cause:  A 'value' was specified for an operation that does not allow it.
//          A 'value' is not allowed in 'remove', 'move', and 'copy'.
// *Action: Remove the 'value' field.
/
00260, 00000, "'from' path is required for operation"
// *Cause:  A 'move' or 'copy' operation was missing a 'from' path.
// *Action: Specify a 'from' path in those operations.
/
00261, 00000, "'value' is required for operation"
// *Cause:  An 'add', 'replace', or 'test' operation was missing a target
//          value.
// *Action: Specify a 'value' in those operations.
/
00262, 00000, "Cyclic 'move' requested"
// *Cause:  The target 'path' specified is a child of the 'from' path.
// *Action: Correct the paths.
/
00300, 00000, "Conflicting inclusion or exclusion rules"
// *Cause:  The including rule for a parent node conflicted with the explicit
//          rule asserted for a child node. The projection specification is
//          invalid.
// *Action: Remove the child node, or change the child node to match
//          any sibling nodes.
/
00301, 00000, "Projection specification must be an object"
// *Cause:  A projection specification was an array or JavaScript Object
/           Notation (JSON) scalar value. A projection specification must
//          be an object.
// *Action: Ensure that the specification root is an object node.
/
00302, 00000, "Include or exclude rule could not be interpreted"
// *Cause:  The rule did not use 'true', 'false', 1, 0, "include",
//          or "exclude".
// *Action: Correct the invalid rule.
/
00303, 00000, "NULL or invalid path"
// *Cause:  A path was either invalid or NULL.
// *Action: None.
/
00304, 00000, "Keys must be numbers or strings"
// *Cause:  An argument to $id was not a number or string.
// *Action: Do not use null, booleans, objects, or arrays in a $id expression.
/
00305, 00000, "Array of values was empty"
// *Cause:  An array of values for $in, $nin, $all, or $id did not any values.
//          The array of values must have at least one value.
// *Action: Do not pass an empty array to the operators.
/
00306, 00000, "Array must contain only scalar values"
// *Cause:  An array of values for $in, $nin, $all, or $id contained object or
//          array members. The array of values must contain only scalar values.
// *Action: Do not use objects or arrays within an array of values.
/
00307, 00000, "$between must have two values in array"
// *Cause:  A minimum and maximum value were not specified for the
//          $between operator. The $between operator must be given an array
//          with a minimum and a maximum value.
// *Action: Use a null for the minimum or maximum value to indicate that
//          the range is open on one end. The values must be scalars,
//          and at least one of the two values must not be null.
/
00308, 00000, "Spatial operators must be at the outermost level"
// *Cause:  The $near, $within, and $intersect operators were not
//          used at the outermost level of the Query-By-Example (QBE).
// *Action: None.
/
00309, 00000, "Spatial operators must specify $geometry"
// *Cause:  The $near, $within, and $intersect operators were not
//          given a GeoJSON object as the value of the $geometry key.
// *Action: None.
/
00310, 00000, "$distance parameter is not allowed"
// *Cause:  The $distance parameter was used with an operator other than $near.
//          Only the $near operator may include values for $distance and $unit.
// *Action: None.
/
00311, 00000, "$distance parameter must be numeric"
// *Cause:  The $distance parameter was specified with a value that was not
//          a JavaScript Object Notation (JSON) number.
// *Action: None.
/
00312, 00000, "$unit parameter must be a string"
// *Cause:  The $unit parameter was not a JavaScript Object Notation (JSON)
//          string. The $unit parameter should be a string specifying a unit
//          of measure such as 'mile'. It may not be a number or JSON
//          literal, nor an object or array.
// *Action: None.
/
00313, 00000, "Unknown key found in spatial operator"
// *Cause:  The spatial operator contained a key that did not match the
//          expected values. All spatial operators must have a $geometry
//          value, and the $near operator may have $distance and $unit values.
//          Other keys are not allowed.
// *Action: None.
/
00314, 00000, "$distance parameter is required"
// *Cause:  The $near operator did not specify a value for $distance.
// *Action: None.
/
00315, 00000, "Empty objects not allowed"
// *Cause:  An empty object was found in the filter specification. An empty
//          object is meaningless and not allowed in the filter specification.
// *Action: None.
/
00316, 00000, "Object with at least one field object must follow modifier"
// *Cause:  A modifier operator was not followed by an object, or was
//          followed by an object with no fields. Modifiers include $not,
//          datatype casts such as $number, simple conversions such as
//          $upper, and structural operators such as $type.
// *Action: None.
/
00317, 00000, "Target of spatial operation must be an object"
// *Cause:  A $near, $within, or $intersect operator was not
//          followed by an object containing the spatial parameters.
// *Action: None.
/
00318, 00000, "Invalid operator within modifier"
// *Cause:  A modifier operator (such as $not) was used around a
//          $and, $or, $nor, $id, or another modifier operator.
//          Modifiers may not be used around those operators.
// *Action: None.
/
00319, 00000, "Value of string matching operator must be a string"
// *Cause:  The value supplied to the $regex, $hasSubstring, $startsWith, or
//          $like operators was not a JavaScript Object Notation (JSON) string.
// *Action: None.
/
00320, 00000, "Value of comparison operator must be a scalar"
// *Cause:  The value supplied to an operator was not a JavaScript Object
//          Notation (JSON) scalar value.
// *Action: Use only strings, numbers, or JSON literals; do not use an
//          object or array.
/
00321, 00000, "Value of the operator must be a string or number"
// *Cause:  The value supplied to $eq, $ne, or $exists was not a JavaScript
//          Object Notation (JSON) string or number.
// *Action: Use only strings or numbers; do not use an object or array,
//          and do not use the JSON literals 'true', 'false', or 'null'.
/
00322, 00000, "Value of set comparison operator must be an array"
// *Cause:  The value supplied to $in, $all, $id, or $between was not an array.
// *Action: None.
/
00323, 00000, "Elements in a conjunction array must be objects"
// *Cause:  An element of an array for $and, $or, or $nor was not an object.
// *Action: None.
/
00324, 00000, "$id operator must be at the outermost level"
// *Cause:  The $id operator supplying document keys was not used
//          at the outermost level of the Query-By-Example (QBE).
// *Action: None.
/
00325, 00000, "Cannot combine sub-expression with other filters"
// *Cause:  A downscoped sub-expression was used in the same scope
//          as a normal filter condition.
// *Action: None.
/
00326, 00000, "Values for $orderby conditions must be integers"
// *Cause:  An order by condition did not give an integer value.
//          Objects, arrays, strings, and other literals are not allowed
//          to specify ordering criteria.
// *Action: Use only positive and negative integer values for the
//          ordering criteria. Use negative values for descending
//          order and positive values for ascending order.
/
00327, 00000, "Query specification must be an object"
// *Cause:  The query specification root was an array or scalar. A query
//          specification must be an object.
// *Action: Ensure that the specification root is an object node.
/
00328, 00000, "Order by specification must be an object or array"
// *Cause:  A $orderby specification was not an object or array. It
//          may not be a JavaScript Object Notation (JSON) scalar.
// *Action: Ensure that the specification root is an object or array node.
/
00329, 00000, "Order by field must specify a path"
// *Cause:  A field of a $orderby array must specify a path.
// *Action: Ensure that all field objects in the array specify a path.
/
00330, 00000, "Order by array contained invalid item"
// *Cause:  The items in a $orderby array must be sort field specification
//          objects. The objects must contain only fields for 'path',
//          'datatype', 'maxLength', and 'order'.
// *Action: Ensure that all items in the array are valid field specification
//          objects.
/
00331, 00000, "$sqlJson operator must be at the outermost level"
// *Cause:  The $sqlJson was not used at the outermost level of
//          the Query-By-Example (QBE).
// *Action: None.
/
00332, 00000, "Value of $sqlJson operator must be an object"
// *Cause:  The value supplied to $sqlJson was not an object.
// *Action: None.
/
00333, 00000, "Items in a $sqlJson object must be field paths"
// *Cause:  The fields of a $sqlJson operator must all be path strings.
// *Action: None.
/
00334, 00000, "$id operator cannot appear more than once"
// *Cause:  The $id operator supplying document keys was used
//          multiple times in the Query-By-Example (QBE).
// *Action: Consolidate the key values into a single $id operator.
/
00335, 00000, "Parameter '~s' must be a boolean"
// *Cause:  The parameter value was not a JSON literal 'true' or 'false'.
// *Action: Use a JSON boolean value for this parameter.
/
00336, 00000, "Parameters '~1s' and '~2s' conflict"
// *Cause:  Two parameters were used together that are either disallowed
//          in combination, or had conflicting values specified.
// *Action: Remove one of the parameters or change them to have
//          compatible values.
/
00337, 00000, "Logical operator '~1s' must have at least one target"
// *Cause:  An array of target values for the logical operator was empty.
// *Action: Do not use an empty array as target for the logical operator.
/
00381, 00000, "unclosed quotation mark"
// *Cause:  An input column value began with an opening quotation mark
//          but had no closing quotation mark.
// *Action: Correct the input CSV file.
/
00382, 00000, "unescaped quotation mark"
// *Cause:  An unquoted input column value contains a quotation mark.
// *Action: Correct the input CSV file.
/
00383, 00000, "missing delimiter"
// *Cause:  A column value contained a quoted value and another quoted
//          or unquoted value, but had no delimiter separating the values.
// *Action: Correct the input CSV file.
/
00384, 00000, "unquoted spaces"
// *Cause:  A quoted column value had space characters before the
//          opening quotation mark or after the closing quotation mark.
// *Action: Correct the input CSV file.
/
/ end of jznus.msg
