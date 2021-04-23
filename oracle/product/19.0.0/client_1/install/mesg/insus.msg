
/ 
/ Error Codes of Framework, Database Installer, Grid Infrastructure Installer,
/ Client Installer and Demos Installer
/ 
/ -----Range----
/ INS-00001 to INS-30000: Modular Installer Framework Error Codes
/ INS-30001 to INS-35000: Common Oracle Installer Error Codes  
/ INS-35001 to INS-40000: Database Installer Error Codes
/ INS-40001 to INS-45000: Grid Infrastructure Installer Error Codes
/ INS-50001 to INS-52000: Client Installer Error Codes
/ INS-52001 to INS-54000: Demos Installer Error Codes

/-------------------------------------------------------------------------------
00001, 0,"Unknown irrecoverable error"
// *Cause: No additional information available.
// *Action: Refer to the logs or contact Oracle Support Services
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.UNKNOWN_ERROR
/-------------------------------------------------------------------------------
00002, 0,"Unhandled exception"
// *Cause: No additional information available.
// *Action: Refer to the logs or contact Oracle Support Services
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.UNHANDLED_EXCEPTION
/-------------------------------------------------------------------------------
00003, 0,"Application startup failed"
// *Cause: An unexpected error occured while loading the application configuration or other startup resources.
// *Action: Refer to the logs or contact Oracle Support Services
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.APPLICATION_STARTUP_FAILED
/-------------------------------------------------------------------------------
00004, 0,"Unable to load help"
// *Cause: One or more help configuration files were not readable or not in the correct format.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.CORRUPT_APPLICATION_HELP
/-------------------------------------------------------------------------------
00005, 0,"Invalid application configuration"
// *Cause: The given application configuration is not compliant to the expected schema.
// *Action: Contact Oracle Support Services
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.INVALID_APPLICATION_CONFIG
/-------------------------------------------------------------------------------
00006, 0,"No resource bundle is associated to the Resource instance"
// *Cause: Specified resource bundle %s is not found in the classpath.
// *Action: Ensure that the required libraries are in the classpath.
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.RESOURCE_BUNDLE_NOT_FOUND
/-------------------------------------------------------------------------------
00007, 0,"Help not available for this application"
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services support or refer software manual.
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.HELP_NOT_AVAILABLE
/-------------------------------------------------------------------------------
00008, 0,"Help topic not found"
// *Cause: The current user interface do not have help content associated with it.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.HELP_TOPIC_NOT_FOUND
/-------------------------------------------------------------------------------
00009, 0,"Unable to create instance of %s"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.util.exception.CommonErrorCode.UNABLE_TO_CREATE_COMPONENT_INSTANCE
/-------------------------------------------------------------------------------
01001, 0,"Failed to create parent directories while copying %s to %s"
// *Cause: Unexpected error occured while creating the nonexistent parent directories of the destination file %s
// *Action: Manually verify whether the destination directory is possible to be created.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.PARENT_DIRECTORY_CREATION_FAILED
/-------------------------------------------------------------------------------
01002, 0,"Copy failed as the source file %s do not exist"
// *Cause: No additional information available.
// *Action: Ensure that the source file exist.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.SOURCE_FILE_NOT_FOUND
/-------------------------------------------------------------------------------
01003, 0,"Copy failed as the source path %s do not correspond to a file."
// *Cause: Copy routine expects a source path, which represents a file.
// *Action: Ensure that the source is a file and destination is a file or a directory. Note: if the destination is a directory, then the source file will be copied in the same name, under the destination directory.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.NOT_A_FILE
/-------------------------------------------------------------------------------
01004, 0,"%s is not directory."
// *Cause: The archive extraction routine expects the destination to be a directory.
// *Action: Ensure that destination is a directory
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.NOT_A_DIRECTORY
/-------------------------------------------------------------------------------
01005, 0,"Failed to copy file from %s to %s"
// *Cause: Unexpected error occured while copying the file.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.FILE_COPY_FAILED
/-------------------------------------------------------------------------------
01006, 0,"The file %s cannot be copied onto itself."
// *Cause: The source file and destination file are same.
// *Action: Ensure that the destination file is different from the source file.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.CANNOT_COPY_FILE_ONTO_ITSELF
/-------------------------------------------------------------------------------
01007, 0,"The directory %s cannot be copied onto itself"
// *Cause: The source directory and destination directory are same.
// *Action: Ensure that the destination directory is different from the source directory.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.CANNOT_COPY_DIRECTORY_ONTO_ITSELF
/-------------------------------------------------------------------------------
01008, 0,"Copy failed as the destination file %s already exists."
// *Cause: No additional information available.
// *Action: Ensure that the destination file do not exist or use overwrite option to overwrite the destination file.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.TARGET_FILE_ALREADY_EXISTS
/-------------------------------------------------------------------------------
01009, 0,"%s is not valid archive."
// *Cause: The given archive path, either do not correspond to a file or do not exist.
// *Action: Ensure that the given source path correspond to a valid archive location.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.INVALID_ARCHIVE
/-------------------------------------------------------------------------------
01010, 0,"Unable to save file to the specified location."
// *Cause: The specified location may not be writable.
// *Action: Specify a location that is writable.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.TARGET_DIR_NOT_WRITABLE
/-------------------------------------------------------------------------------
01011, 0,"Unable to save file to the specified location."
// *Cause: The specified location may not be executable.
// *Action: Specify a location that is executable.
// *FQN: oracle.install.commons.system.filemgmt.FileSystemErrorCode.TARGET_DIR_NOT_EXECUTABLE
/-------------------------------------------------------------------------------
04001, 0,"Invalid command line arguments xml file (%s). Either application could not detect command line arguments xml file or contains syntactically incorrect information."
// *Cause: n/a
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.INVALID_COMMANDLINE_ARG_XML
/-------------------------------------------------------------------------------
04002, 0,"Application could not parse command line arguments xml file (%s). Either XPathExpressionException or IOException occurred while parsing command line arguments xml file."
// *Cause: n/a
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.COMMAND_LINE_ARG_PARSE_EXCEPTION
/-------------------------------------------------------------------------------
04003, 0,"Invalid argument passed from command line. Specified argument (%s) is not a supported argument for this application."
// *Cause: n/a
// *Action: Specify valid set of command line arguments. Refer application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.UNSUPPORTED_ARGUMENT_PASSED_ERROR
/-------------------------------------------------------------------------------
04004, 0,"Value is not specified for command line argument: %s. Specify valid value for the mentioned argument. Refer application help for more details."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.VALUE_EXPECTED_ERROR
/-------------------------------------------------------------------------------
04005, 0,"Invalid argument passed from command line: %s. Specified argument is not a supported for the current operating system."
// *Cause: n/a
// *Action: Specify valid set of supported command line arguments. Refer application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.CMDLINE_ARG_NOT_SUPPORTED_ON_THIS_PLAT_ERROR
/-------------------------------------------------------------------------------
04006, 0,"Invalid combination of arguments passed from command line. Arguments [%s,%s] cannot be passed together in the same application session."
// *Cause: n/a
// *Action: Specify valid set of supported command line arguments. Refer application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.MUTUAL_EXCLUSIVE_ARGUMENTS_PASSED_ERROR
/-------------------------------------------------------------------------------
04007, 0,"Invalid argument passed from command line: %s"
// *Cause: n/a
// *Action: Specify valid set of supported command line arguments. Refer application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.SYNTACTICALLY_INCORRECT_ARG_PASSED_ERR
/-------------------------------------------------------------------------------
04008, 0,"Invalid combination of arguments passed from command line. One or more mandatory dependent arguments are not passed for the argument: %s"
// *Cause: n/a
// *Action: Specify valid set of supported command line arguments. Refer application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.MANDATORY_DEPENDENT_ARGUMENTS_NOT_PASSED_ERROR
/-------------------------------------------------------------------------------
04009, 0,"The argument [%s] passed is not supported for the current context %s"
// *Cause: n/a
// *Action: Specify a supported command line argument for the current context.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.ARGUMENT_NOT_SUPPORTED_IN_CURRENT_CONTEXT
/-------------------------------------------------------------------------------
04010, 0,"Repetition of command line argument is not supported: %s ."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.ARGUMENT_MULTIPLE_USAGE_ERROR
/-------------------------------------------------------------------------------
04011, 0,"Multiple usage for arguments is not allowed."
// *Cause: n/a
// *Action: Refer to application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.APPLICATION_ARGUMENT_MULTIPLE_USAGE_ERROR
/-------------------------------------------------------------------------------
04012, 0,"There is a conflicting dependency rule on the command line arguments xml file. The key arguments are: %s"
// *Cause: n/a
// *Action: Review and correct the specified arguments or refer to application help for more details.
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.APPLICATION_CONFLICTING_ARG_DEPENDENCIES_ERROR
/-------------------------------------------------------------------------------
04013, 0,"The argument [-deinstall] is not supported. Run %s for deinstallation. "
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.util.cli.CommandLineArgErrorCode.INVALID_DEINSTALL_ARGUMENT_ERROR
/-------------------------------------------------------------------------------
06001, 0,"Failed to perform operation due to internal driver error."
// *Cause: No additional information available.
// *Action: Refer to the logs or contact Oracle Support Services
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.INTERNAL_DRIVER_ERROR
/-------------------------------------------------------------------------------
06002, 0,"Authentication failed."
// *Cause: Failed to login into the selected nodes.
// *Action: Check shared unix password. Locked accounts or accounts with no password are not supported. Contact Administrator or refer logs for more details.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.AUTHENTICATION_FAILED
/-------------------------------------------------------------------------------
06003, 0,"Failed to setup passwordless SSH connectivity with the following node(s): %s"
// *Cause: It is possible that the failed nodes are running different Operating System or not reachable. If they are reachable and running the same Operating System as the local machine, it is possible that the SSH daemon is not configured on the selected nodes.
// *Action: Ensure that the failed nodes are reachable, running the same Operating System and have support for SSH connectivity.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.FAILED_TO_ESTABLISH_SSH_CONNECTIVITY
/-------------------------------------------------------------------------------
06004, 0,"File operation on users .ssh directory is not permitted."
// *Cause: Write permission not set for either users home directory or .ssh directory under users home directory.
// *Action: Ensure that .ssh directory is either allowed to be created under users home directory or .ssh directory allows files to be written into it.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.FILE_OPERATION_PERMISSION_DENIED
/-------------------------------------------------------------------------------
06005, 0,"Unable to get SSH connectivity details."
// *Cause: An unexpected error occured while getting SSH connectivity details across the selected nodes.
// *Action: Refer to the logs for more details or contact Oracle Support Services.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.UNABLE_TO_GET_CONNECTIVITY_DETAILS
/-------------------------------------------------------------------------------
06006, 0,"Passwordless SSH connectivity not set up between the following node(s): %s."
// *Cause: Either passwordless SSH connectivity is not setup between specified node(s) or they are not reachable. Refer to the logs for more details.
// *Action: Refer to the logs for more details or contact Oracle Support Services.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.PASSWORDLESS_SSH_CONNECTIVITY_NOT_SETUP
/-------------------------------------------------------------------------------
06007, 0,"SSH connectivity check operation disabled"
// *Cause: Either the property named oracle.install.ssh.setupCheckEnabled is set to true in Java system properties or the internal driver had disabled this operation.
// *Action: Try setting oracle.install.ssh.setupCheckEnabled=true as Java system property or contact Oracle Support Services.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.SETUP_CHECK_DISABLED
/-------------------------------------------------------------------------------
06008, 0,"SSH connectivity setup operation disabled"
// *Cause: Either the property named oracle.install.ssh.setupEnabled is set to true in Java system properties or the internal driver had disabled this operation.
// *Action: Try setting oracle.install.ssh.setupEnabled=true as Java system property or contact Oracle Support Services.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.SETUP_DISABLED
/-------------------------------------------------------------------------------
06009, 0,"SSH performance is detected to be slow, which may impact performance during remote node operations like copying the software and executing prerequisite checks."
// *Cause: n/a
// *Action: Consider optimizing the ssh configuration.
// *FQN: oracle.install.commons.net.support.SSHSupportErrorCode.SLOW_SSH_PERFORMANCE
/-------------------------------------------------------------------------------
06101, 0,"IP address of localhost could not be determined"
// *Cause: The localhost is not mapped to a valid IP address in Hosts file (Eg. /etc/hosts in Unix).
// *Action: Assign a valid IP address for the localhost or set it to loopback IP address (127.0.0.1 in IPv4 or ::1 in IPv6).
// *FQN: oracle.install.commons.net.NetworkUtilityErrorCode.UNKNOWN_LOCALHOST
/-------------------------------------------------------------------------------
07001, 0,"Value for property '%s' not found in the bean store."
// *Cause: No additional information available.
// *Action: It is not mandatory that all properties are to be in a given bean store. This error can be ignored if the given property is not expected to be in the bean store.
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.UNSPECIFIED_PROPERTY
/-------------------------------------------------------------------------------
07002, 0,"Unable to get the type definition for property named '%s' of bean type '%s'"
// *Cause: No additional information available.
// *Action: Ensure that the properties in the bean type are correctly defined.
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.INVALID_TYPE_DEFINITION
/-------------------------------------------------------------------------------
07003, 0,"Unexpected error occured while accessing the bean store"
// *Cause: No additional information available.
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.UNKNOWN_ERROR
/-------------------------------------------------------------------------------
07004, 0,"Invalid bean store"
// *Cause: Either the bean store is corrupt or it does not have access to the underlying data source.
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.INVALID_BEANSTORE
/-------------------------------------------------------------------------------
07005, 0,"The given beans cannot be written because there is no bean store assigned to the bean store writer."
// *Cause: No additional information available
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.BEANSTORE_NOT_ASSIGNED_TO_WRITER
/-------------------------------------------------------------------------------
07006, 0,"Unabled to save the bean store to the given target."
// *Cause: Either the target is not accessible or an unexpected error occured while saving the bean store.
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.UNABLE_TO_SAVE_BEANSTORE
/-------------------------------------------------------------------------------
07007, 0,"Failed to open or create a bean store reader."
// *Cause: Either the bean store is corrupt or it does not have access to the underlying data source.
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.UNABLE_TO_OPEN_BEANSTOREREADER
/-------------------------------------------------------------------------------
07008, 0,"The format of the bean store is not specified"
// *Cause: No additional information available.
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.UNSPECIFIED_XML_BEANSTORE_FORMAT
/-------------------------------------------------------------------------------
07009, 0,"Unable to load bean store"
// *Cause: Unexpected error while loading the bean store.
// *Action: Refers logs or contact Oracle Support Services
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.UNABLE_TO_LOAD_BEANSTORE
/-------------------------------------------------------------------------------
07010, 0,"Invalid argument %s"
// *Cause: The argument for a given property did not comply with either the specification, schema, or rules.
// *Action: Ensure that given arguments are of the expected data type or schema
// *FQN: oracle.install.commons.bean.BeanStoreErrorCode.INVALID_ARGUMENT
/-------------------------------------------------------------------------------
08001, 0,"Flow configuration is syntactically incorrect"
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.INVALID_FLOW_CONFIG
/-------------------------------------------------------------------------------
08005, 0,"View class may not exist or a fully qualified View class name is not given."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.INVALID_VIEW_DEFINITION
/-------------------------------------------------------------------------------
08007, 0,"Fully qualified Action class name is not given."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.INVALID_ACTION_DEFINITION
/-------------------------------------------------------------------------------
08011, 0,"Route identifier '%s' mentioned in the transition may not exist."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.INVALID_ROUTE_IDENTIFIER
/-------------------------------------------------------------------------------
08012, 0,"Unknown View Identifier '%s' associated to a state."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.UNKNOWN_VIEW
/-------------------------------------------------------------------------------
08013, 0,"Unknown Validator class '%s' associated to a state."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.UNKNOWN_VALIDATOR
/-------------------------------------------------------------------------------
08014, 0,"Fully qualified Condition class name is not given."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.INVALID_CONDITION_DEFINITION
/-------------------------------------------------------------------------------
08015, 0,"No transition specified for condition defined at state '%s'."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowConfigErrorCode.NO_TRANSITION_SPECIFIED_FOR_CONDITION
/-------------------------------------------------------------------------------
08101, 0,"Unexpected error while executing the action at state: '%s'"
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowErrorCode.ACTION_EXECUTION_FAILED
/-------------------------------------------------------------------------------
08102, 0,"Unexpected error occurred while transitioning from state '%s'"
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowErrorCode.TRANSITION_FAILED
/-------------------------------------------------------------------------------
08103, 0,"Null route returned by state '%s'."
// *Cause: The route was not chosen from the current state in order to proceed further.
// *Action: No additional information available.
// *FQN: oracle.install.commons.flow.FlowErrorCode.NULL_ROUTE
/-------------------------------------------------------------------------------
08104, 0,"Route '%s' returned by state '%s' is not found in the flow configuration."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowErrorCode.UNKNOWN_ROUTE
/-------------------------------------------------------------------------------
08106, 0,"Unexpected error occurred while loading the view '%s' associated to state '%s'."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowErrorCode.VIEW_LOADING_FAILED
/-------------------------------------------------------------------------------
08107, 0,"Failed while processing user inputs at state '%s'."
// *Cause: Unexpected error occurred while processing the inputs from view '%s' associated to state '%s'.
// *Action: No additional information available.
// *FQN: oracle.install.commons.flow.FlowErrorCode.VIEW_PROCESSING_FAILED
/-------------------------------------------------------------------------------
08108, 0,"Failed while localizing the view "
// *Cause: Unexpected error occurred while localizing the view '%s' associated to state '%s'.
// *Action: No additional information available.
// *FQN: oracle.install.commons.flow.FlowErrorCode.VIEW_LOCALIZATION_FAILED
/-------------------------------------------------------------------------------
08109, 0,"Unexpected error occurred while validating inputs at state '%s'."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services or refer to the software manual.
// *FQN: oracle.install.commons.flow.FlowErrorCode.VALIDATION_FAILED
/-------------------------------------------------------------------------------
08110, 0,"Invalid checkpoint file '%s'."
// *Cause: Session restoration failed since the given checkpoint file may have been syntactically incorrect or did not exist.
// *Action: No additional information available.
// *FQN: oracle.install.commons.flow.FlowErrorCode.INVALID_CHECKPOINT_FILE
/-------------------------------------------------------------------------------
08801, 0,"View class referred by view ID '%s' not found."
// *Cause: The given View class was not found in the classpath.
// *Action: No additional information available.
// *FQN: oracle.install.commons.flow.ViewManagerErrorCode.VIEW_CLASS_NOT_FOUND
/-------------------------------------------------------------------------------
08802, 0,"Unable to instantiate the View class referred by View ID '%s'."
// *Cause: The given class do not represent a valid View class or an unexpected error occured while instantiating it.
// *Action: No additional information available.
// *FQN: oracle.install.commons.flow.ViewManagerErrorCode.INVALID_VIEW_CLASS
/-------------------------------------------------------------------------------
10002, 0,"Inventory initialization failed"
// *Cause: Inventory exists, but an unexpected error occurred while initializing it.
// *Action: Ensure that the inventory is not corrupt. Otherwise contact Oracle Support Services or refer logs.
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.INVENTORY_INIT_FAILED
/-------------------------------------------------------------------------------
10006, 0,"Scratch path '%s' is not valid."
// *Cause: The specified scratch path is either not accessible or do not exists.
// *Action: Contact Oracle Support Services or refer logs
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.INSTALL_COMMON_INVALID_SCRATCHPATH
/-------------------------------------------------------------------------------
10008, 0,"Session initialization failed"
// *Cause: An unexpected error occurred while initializing the session.
// *Action: Contact Oracle Support Services or refer logs
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.INSTALL_COMMON_SESSION_INIT_FAILED
/-------------------------------------------------------------------------------
10010, 0,"Scratch path not defined or set"
// *Cause: Not additional information available
// *Action: Contact Oracle Support Services
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.SCRATCHPATH_NOT_DEFINED
/-------------------------------------------------------------------------------
10012, 0,"Setup driver initialization failed."
// *Cause: An unexpected error occurred while initializing the underlying setup driver.
// *Action: Contact Oracle Support Services or refer logs
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.DRIVER_INIT_FAILED
/-------------------------------------------------------------------------------
10013, 0,"The installer has detected that current home is not registered in the central inventory on this system."
// *Cause: This can happen for the following reasons - either %s has not been run or script failed to update the inventory.
// *Action: Run the script as a root user.
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.INVENTORY_NOT_UPDATED_WITH_HOME
/-------------------------------------------------------------------------------
10014, 0,"The installer has detected that current home is not registered in the central inventory on the node(s): %s."
// *Cause: This can happen for the following reasons - either %s has not been run or script failed to update the inventory.
// *Action: Run the script as a root user.
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.INVENTORY_NOT_UPDATED_WITH_HOME_MULTINODE_WARN
/-------------------------------------------------------------------------------
10015, 0,"Argument (%s) passed from the command line is invalid."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.INVALID_COMMAND_LINE_ARG
/-------------------------------------------------------------------------------
10016, 0,"Installer failed to update the cluster related details, for this Oracle home, in the inventory on all/some of the nodes"
// *Cause: n/a
// *Action: You may chose to retry the operation, without continuing further. Alternatively you can refer to information given below and manually execute the mentioned commands on the failed nodes now or later to update the inventory.
// *FQN: oracle.install.commons.base.driver.common.InstallEngineErrorCode.UPDATENODELIST_FAILED
/-------------------------------------------------------------------------------
10101, 0,"The given response file %s is not found."
// *Cause: The given response file is either not accessible or do not exists.
// *Action: Give a correct response file location. (Note: relative path is not supported)
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.RESPONSE_FILE_NOT_FOUND
/-------------------------------------------------------------------------------
10102, 0,"Installer initialization failed."
// *Cause: An unexpected error occurred while initializing the Installer.
// *Action: Contact Oracle Support Services or refer logs
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.INSTALLER_INIT_FAILED
/-------------------------------------------------------------------------------
10103, 0,"Response file is not specified for this session."
// *Cause: Response file was not specified for this session. A silent session requires input from a response file or from the command line.
// *Action: Specify the response file and rerun the installer.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.RESPONSE_FILE_EXPECTED
/-------------------------------------------------------------------------------
10104, 0,"The given response file is not accessible."
// *Cause: Current user may not have read permission.
// *Action: Ensure that the current user have permission to read the given response file.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.RESPONSE_FILE_NOT_ACCESSIBLE
/-------------------------------------------------------------------------------
10105, 0,"The given response file %s is not valid."
// *Cause: Syntactically incorrect response file. Either unexpected variables are specified or expected variables are not specified in the response file.
// *Action: Refer the latest product specific response file template
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.INVALID_RESPONSE_FILE
/-------------------------------------------------------------------------------
10106, 0,"The format of the given response file is not supported."
// *Cause: The response file format was incorrect or not supported.
// *Action: Use response files of type %s.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.UNKNOWN_RESPONSE_FILE_FORMAT
/-------------------------------------------------------------------------------
10107, 0,"Argument %s is not supported for this session."
// *Cause: Argument %s is specified for this session. This option is supported only in case of silent installation.
// *Action: Ensure that you have specified correct arguments to the installer.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.INVALID_USSAGE_OF_SHOW_PROGRESS_ARGUMENT
/-------------------------------------------------------------------------------
10108, 0,"The given response file name is not valid."
// *Cause: It contains special characters.
// *Action: Specify the response file name which does not have special characters.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.INVALID_RESPONSE_FILE_NAME
/-------------------------------------------------------------------------------
10109, 0,"Installer encountered errors while copying %s to nodes %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Review the log file %s for further details on failure.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.ACTIONABLE_REMOTE_COPY_OPERATION_FAILED
/-------------------------------------------------------------------------------
10110, 0,"Installer encountered errors while copying %s to nodes %s."
// *Cause: n/a
// *Action: Review the log file %s for further details on failure.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.REMOTE_COPY_OPERATION_FAILED
/-------------------------------------------------------------------------------
10111, 0,"Installer encountered errors while copying %s to nodes %s."
// *Cause: n/a
// *Action: Review the log file %s for further details on failure.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.CLUSTER_OPERATION_FAILED
/-------------------------------------------------------------------------------
10112, 0,"Unexpected error occurred while copying %s to remote nodes."
// *Cause: No additional information available.
// *Action: Contact Oracle Support Services.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.REMOTE_COPY_UNEXPECTED_ERROR
/-------------------------------------------------------------------------------
10113, 0,"Installer encountered errors while copying %s to nodes %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Review the log file %s for further details on failure.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.ACTIONABLE_CLUSTER_OPERATION_FAILED
/-------------------------------------------------------------------------------
10114, 0,"Installer encountered an error while parsing the value %s for the argument [%s]."
// *Cause: n/a
// *Action: Enter a valid value for the argument [%s]. Expected values are %s.
// *FQN: oracle.install.commons.base.driver.common.InstallerErrorCode.INSTALLER_INVALID_ARGUMENT_VALUE
/-------------------------------------------------------------------------------
10201, 0,"Execution of '%s' script failed."
// *Cause: n/a
// *Action: Review the log file for further details.
// *FQN: oracle.install.commons.base.util.ScriptExecutionErrorCode.SCRIPT_EXECUTION_FAILED
/-------------------------------------------------------------------------------
13001, 0,"%s is not supported on this operating system. Installer will not perform prerequisite checks on the system."
// *Cause: This operating system may not have been in the certified list at the time of the release of this software.
// *Action: Refer to My Oracle Support portal for the latest certification information for this operating system. Proceed with the installation if the operating system has been certified after the release of this software.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.INSTALL_CVU_EXECUTION_NOT_POSSIBLE
/-------------------------------------------------------------------------------
13010, 0,"Automatic prerequisite fix up is not supported"
// *Cause: No additional information available
// *Action: Refer logs and fix up all prerequisites manually.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_NOT_SUPPORTED
/-------------------------------------------------------------------------------
13011, 0,"No automatic prerequisite fix up routine available."
// *Cause: Automatic fix up is not supported, hence no fix up routine generated.
// *Action: Refer logs and fix up all prerequisites manually.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_ROUTINES_NOT_AVAILABLE
/-------------------------------------------------------------------------------
13012, 0,"Automatic prerequisite fix up is not performed or is incomplete."
// *Cause: User has either cancelled the operation or did not execute the automatic prerequisite fix up routines.
// *Action: Run the automatic fix up routines or refer logs and fix up all prerequisites manually.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_NOT_PERFORMED
/-------------------------------------------------------------------------------
13013, 0,"Target environment does not meet some mandatory requirements."
// *Cause: Some of the mandatory prerequisites are not met. See logs for details. %s
// *Action: Identify the list of failed prerequisite checks from the log: %s. Then either from the log file or from installation manual find the appropriate configuration to meet the prerequisites and fix it manually.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.MANDATORY_PREREQUISITES_NOT_MET
/-------------------------------------------------------------------------------
13014, 0,"Target environment does not meet some optional requirements."
// *Cause: Some of the optional prerequisites are not met. See logs for details. %s
// *Action: Identify the list of failed prerequisite checks from the log: %s. Then either from the log file or from installation manual find the appropriate configuration to meet the prerequisites and fix it manually.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.OPTIONAL_PREREQUISITES_NOT_MET
/-------------------------------------------------------------------------------
13015, 0,"The path %s provided for cvu_prereq.xml is invalid."
// *Cause: The path %s provided for cvu_prereq.xml is invalid.
// *Action: Provide a valid path of cvu_prereq.xml. It must be specified as an absolute pathname.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.INVALID_PATH_OF_PREREQ_XML
/-------------------------------------------------------------------------------
13016, 0,"You have chosen to ignore some of the prerequisites for this installation. This may impact product configuration."
// *Cause: You have chosen to ignore failed prerequisites and proceed with the installation.
// *Action: Ensure that the failed prerequistes are fixed before proceeding.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.USER_IGNORED_PREREQ_WARNING
/-------------------------------------------------------------------------------
13017, 0,"Installer is unable to run the fixup script."
// *Cause: This might be because of the incorrect credentials provided for configuration script execution.
// *Action: Ensure that the correct credentials provided for configuration script execution. Also refer log files for more details.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_ROOT_AUTOMATION_EXCEPTION
/-------------------------------------------------------------------------------
13018, 0,"Installer is unable to run the fixup script."
// *Cause: An exception occurred while running the fixup script or during fixup script result collection.
// *Action: Refer log files for more details.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_EXCEPTION
/-------------------------------------------------------------------------------
13019, 0,"Some mandatory prerequisites are not met. These prerequisites cannot be ignored."
// *Cause: The following prerequisites are mandatory and cannot be ignored: %s
// *Action: For detailed information of the failed prerequisites check the log: %s. Then either from the log file or from installation manual find the appropriate configuration to meet the prerequisites and fix it manually.
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FATAL_PREREQUISITES_FAILED
/-------------------------------------------------------------------------------
13020, 0,"In order for the prerequisite fixups to take effect, a reboot is required."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_REBOOT_REQUIRED_LOCALNODE
/-------------------------------------------------------------------------------
13021, 0,"In order for the prerequisite fixups to take effect, the following nodes should be rebooted: %s"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_REBOOT_REQUIRED_MULTINODE
/-------------------------------------------------------------------------------
13022, 0,"In order for the prerequisite fixups to take effect, you are required to restart the installer from a new session. This may require you to re-login."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_RELOGIN_REQUIRED_LOCALNODE
/-------------------------------------------------------------------------------
13023, 0,"In order for the prerequisite fixups to take effect, a relogin is required on the following nodes: %s"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.commons.base.prereq.PrereqCheckerErrorCode.FIXUP_RELOGIN_REQUIRED_MULTINODE
/-------------------------------------------------------------------------------
20701, 0,"Unexpected internal driver error"
// *Cause: A call to internal Oracle cluster API failed.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag '-ignoreInternalDriverError'.
// *FQN: oracle.install.driver.oui.etc.InternalDriverErrorCode.SRVM_INTERNAL_ERROR
/-------------------------------------------------------------------------------
20702, 0,"Unexpected internal driver error"
// *Cause: A call to cluster verification utility failed.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag '-ignoreInternalDriverError'.
// *FQN: oracle.install.driver.oui.etc.InternalDriverErrorCode.CVU_INTERNAL_ERROR
/-------------------------------------------------------------------------------
20801, 0,"Configuration Assistant '%s' failed."
// *Cause: Refer to the logs for additional information.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.CONFIGURATION_FAILED
/-------------------------------------------------------------------------------
20802, 0,"%s failed."
// *Cause: The plug-in failed in its perform method
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.PERFORMED_FAILED
/-------------------------------------------------------------------------------
20803, 0,"The optional tool named '%s' failed."
// *Cause: Refer to the logs for additional information.
// *Action: Refer to the logs or contact Oracle Support Services. As '%s' is an optional tool, it is safe to ignore this failure and proceed with the installation.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.FAILED_NOTREQUIRED
/-------------------------------------------------------------------------------
20804, 0,"%s aborted."
// *Cause: No additional information available.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.WAS_ABORTED
/-------------------------------------------------------------------------------
20805, 0,"%s is not activated"
// *Cause: No additional information available.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.INACTIVE_PLUGIN
/-------------------------------------------------------------------------------
20806, 0,"%s not executed."
// *Cause: The plug-in was not executed or unavailable
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.NOT_PERFORMED
/-------------------------------------------------------------------------------
20807, 0,"%s is not valid."
// *Cause: The action of the specfied type could not be found in the referred aggregate
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.ACTION_NOT_FOUND
/-------------------------------------------------------------------------------
20808, 0,"Action already referenced."
// *Cause: The action was already referred to by a previous micro step
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.ACTION_ALREADY_REFERENCED
/-------------------------------------------------------------------------------
20809, 0,"Execution of '%s' not enabled"
// *Cause: The invocation of plug-in %s is not active
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.INACTIVE_PLUGININVOCATION
/-------------------------------------------------------------------------------
20810, 0,"Target or command for '%s' not valid."
// *Cause: The specified external command or internal plug-in could not be executed
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.INVALID_TARGET
/-------------------------------------------------------------------------------
20811, 0,"%s parameters are not initialized"
// *Cause: An argument of plug-in '%s' referenced an uninitialized Parameter
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.USE_OF_UNINITIALIZED_PARAMETER
/-------------------------------------------------------------------------------
20812, 0,"Unexpected error while executing '%s'"
// *Cause: An unspecified error occurred while attempting to perform the micro step.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.UNSPECIFIED_ERROR
/-------------------------------------------------------------------------------
20813, 0,"%s not found"
// *Cause: The referred aggregate could not be found
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.AGGREGATE_NOT_AVAILABLE
/-------------------------------------------------------------------------------
20814, 0,"The aggregate of '%s' is not activated"
// *Cause: The reference to the referred aggregate is set inactive
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.driver.oui.config.ConfigManagerErrorCode.AGGREGATE_INACTIVE
/-------------------------------------------------------------------------------
21001, 0,"ORACLE_HOME was not specified for clone."
// *Cause: n/a
// *Action: Ensure that ORACLE_HOME is passed.
// *FQN: oracle.install.driver.oui.resource.OUIErrorCode.CLONE_ORACLE_HOME_NOT_PASSED
/-------------------------------------------------------------------------------
21002, 0,"ORACLE_BASE was not specified for clone."
// *Cause: n/a
// *Action: Ensure that ORACLE_BASE is passed.
// *FQN: oracle.install.driver.oui.resource.OUIErrorCode.CLONE_ORACLE_BASE_NOT_PASSED
/-------------------------------------------------------------------------------
21003, 0,"Installer has detected that an invalid inventory pointer location file was specified."
// *Cause: Installer has failed to detect the inventory group owner from the inventory pointer location file.
// *Action: Ensure the Inventory location file oraInst.loc is corrected or specify a valid Inventory Pointer Location file
// *FQN: oracle.install.driver.oui.resource.OUIErrorCode.NO_INVENTORY_GROUP_PRESENT_ORAINST_LOC_FILE
/-------------------------------------------------------------------------------
22001, 0,"Installer has detected that Oracle home name (%s) of local node does not match with Oracle home name (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that Oracle home name (%s) on node %s matches with Oracle home name (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ORACLE_HOME_NAME_INCONSISTENCY
/-------------------------------------------------------------------------------
22002, 0,"Installer has detected that Oracle base location (%s) of local node does not match with Oracle base location (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that Oracle base location (%s) on node %s matches with Oracle base location (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ORACLE_BASE_WINDOWS_INCONSISTENCY
/-------------------------------------------------------------------------------
22003, 0,"Installer has detected that Oracle base location (%s) of local node does not match with Oracle base location (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that Oracle base location (%s) on node %s matches with Oracle base location (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ORACLE_BASE_NON_WINDOWS_INCONSISTENCY
/-------------------------------------------------------------------------------
22004, 0,"Installer has detected that Oracle home architecture (%s) of local node does not match with Oracle home architecture (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that Oracle home architecture (%s) on node %s matches with Oracle home architecture (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.HOME_ARCHITECTURE_INCONSISTENCY
/-------------------------------------------------------------------------------
22005, 0,"Installer has detected that ARU ID (%s) of local node does not match with ARU ID (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that ARU ID (%s) on node %s matches with ARU ID (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ARU_ID_INCONSISTENCY
/-------------------------------------------------------------------------------
22006, 0,"Installer has detected that components of Oracle home (%s) of local node does not match with components of Oracle home (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that components of Oracle home (%s) on node %s matches with components of Oracle home (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ORACLE_HOME_INCONSISTENCY
/-------------------------------------------------------------------------------
22007, 0,"Installer has detected that inventory (%s) of local node does not match with inventory (%s) of remote node."
// *Cause: n/a
// *Action: Ensure that inventory (%s) on node %s matches with inventory (%s ) of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ORACLE_HOME_INVENTORY_INCONSISTENCY
/-------------------------------------------------------------------------------
22008, 0,"Installer has detected that one offs count (%s) of Oracle home of local node does not match with one offs count (%s) of Oracle home of remote node."
// *Cause: n/a
// *Action: Ensure that one offs count (%s) of Oracle home on node %s matches with one offs count (%s ) of Oracle home of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ONE_OFFS_COUNT_INCONSISTENCY
/-------------------------------------------------------------------------------
22009, 0,"Installer has detected that one offs count (%s) of inventory of local node does not match with one offs count (%s) of inventory of remote node."
// *Cause: n/a
// *Action: Ensure that one offs count (%s) of inventory on node %s matches with one offs count (%s ) of inventory of local node.
// *FQN: oracle.install.driver.oui.resource.InventoryErrorCode.ONE_OFFS_INVENTORY_INCONSISTENCY
/-------------------------------------------------------------------------------
30001, 0,"The %s password is empty."
// *Cause: The %s password should not be empty.
// *Action: Provide a non-empty password.
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORD_IS_EMPTY_ERR
/-------------------------------------------------------------------------------
30002, 0,"The %s password and %s confirm password are not same."
// *Cause: The %s password and %s confirm password should be the same.
// *Action: Ensure that %s password and %s confirm password are the same.
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORDS_NOT_SAME_ERR
/-------------------------------------------------------------------------------
30003, 0,"The %s password length is too long."
// *Cause: The %s password length cannot exceed %s characters.
// *Action: Provide a password lesser than %s characters.
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORD_EXCEED_LENGTH_ERR
/-------------------------------------------------------------------------------
30004, 0,"The %s password entered is invalid."
// *Cause: The following characters are not allowed: %s
// *Action: Provide a password that does not contain the following characters: %s
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORD_INVALID_ERR
/-------------------------------------------------------------------------------
30005, 0,"The %s password entered is missing recommended characters."
// *Cause: The %s password entered is missing recommended characters. Oracle recommends that passwords contain at least one %s.
// *Action: Provide a password which contains at least one %s.
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORD_MISSING_CHAR_ERR
/-------------------------------------------------------------------------------
30006, 0,"The password specified is too short."
// *Cause: Oracle recommends that the %s password entered should be at least %s characters in length.
// *Action: Provide a password which is at least %s characters in length.
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORD_MIN_LENGTH_ERR
/-------------------------------------------------------------------------------
30007, 0,"Unable to get the raw device partition size."
// *Cause: Unexpected error occurred while trying to get the raw device partition size.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TO_GET_RAW_PARTITION_SIZE
/-------------------------------------------------------------------------------
30008, 0,"Refer to the logs for more details."
// *Cause: Unexpected error occurred while trying to get the FS device partition size.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TO_GET_FS_PARTITION_SIZE
/-------------------------------------------------------------------------------
30009, 0,"Unable to get the FS partition free space size"
// *Cause: Unable to get the FS partition free space size
// *Action: Unable to get the FS partition free space size
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TO_GET_FS_PARTITION_FREE_SIZE
/-------------------------------------------------------------------------------
30010, 0,"Unable to get the file system type."
// *Cause: Unexpected error occurred while trying to get the file system type.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TO_GET_FILESYSTEM_TYPE
/-------------------------------------------------------------------------------
30011, 0,"The %s password entered does not conform to the Oracle recommended standards."
// *Cause: Oracle recommends that the password entered should be at least %s characters in length, contain at least 1 uppercase character, 1 lower case character and 1 digit [0-9].
// *Action: Provide a password that conforms to the Oracle recommended standards.
// *FQN: oracle.install.library.resource.CommonErrorCode.PASSWORD_COMPLEXITY_ERR
/-------------------------------------------------------------------------------
30013, 0,"Unable to check whether the partition is raw."
// *Cause: Unexpected error occurred while trying to check whether the partition is raw.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TO_CHECK_WHETHER_PARTITION_ISRAW
/-------------------------------------------------------------------------------
30014, 0,"Unable to check whether the location specified is on CFS"
// *Cause: The location specified might not have the required permissions.
// *Action: Provide a location which has the appropriate required permissions.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TO_CHECK_WHETHER_OH_ON_CFS
/-------------------------------------------------------------------------------
30015, 0,"An error occurred during setting permission."
// *Cause: Unexpected error occurred during setting permission.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_SETPERMISSION_EXCEPTION
/-------------------------------------------------------------------------------
30016, 0,"Unable to load the install inventory."
// *Cause: Unable to lock or read the install inventory.
// *Action: Check the permissions on the inventory location.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_UNABLE_TO_LOAD_ERROR
/-------------------------------------------------------------------------------
30017, 0,"Install inventory does not exist."
// *Cause: Install inventory does not exist.
// *Action: Ensure that the install inventory exists.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_DOES_NOT_EXIST_ERROR
/-------------------------------------------------------------------------------
30018, 0,"Unable to get all the previously installed Oracle Home locations."
// *Cause: Error occurred while retrieving the oracle home locations.
// *Action: Check if the existing inventory location is accessible.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_GET_ALL_ORACLE_HOME_LOCS_ERROR
/-------------------------------------------------------------------------------
30020, 0,"Unable to get the default oradata location."
// *Cause: Unexpected error occurred while trying to get the default oradata location.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_UNABLE_TOGET_DEFAULT_ORADATA_LOCATION
/-------------------------------------------------------------------------------
30021, 0,"Unable to get Oracle RAC databases info."
// *Cause: Unexpected error occurred while trying to get RAC databases info.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_DB_UNABLE_TO_GET_RAC_DB_INFO
/-------------------------------------------------------------------------------
30022, 0,"Unable to get SIDs and DB Homes on remote nodes."
// *Cause: Unexpected error occurred while trying to get SIDs and DB Homes on remote nodes.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_DB_UNABLE_TO_GET_SID_HOME_REMOTE_NODES
/-------------------------------------------------------------------------------
30023, 0,"Unable to get SIDs and DB Homes on node %s."
// *Cause: Unexpected error occurred while trying to get SIDs and DB Homes on node %s.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_DB_UNABLE_TO_GET_SID_HOME_ON_NODE
/-------------------------------------------------------------------------------
30024, 0,"Installer has detected that the location determined as Oracle Grid Infrastructure home (%s), is not a valid Oracle home."
// *Cause: n/a
// *Action: Ensure that either there are no environment variables pointing to this invalid location or register the location as an Oracle home in the central inventory. Also, make sure that /etc/oracle path is cleaned up properly as part of previous Grid deinstall.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_HOME_NOT_FOUND_IN_INVENTORY
/-------------------------------------------------------------------------------
30025, 0,"Installer has detected that the location determined as Oracle Grid Infrastructure home (%s), is not a valid Oracle home."
// *Cause: n/a
// *Action: Ensure that either there are no environment variables pointing to this invalid location or register the location as an Oracle home in the central inventory.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WIN_ORACLE_HOME_NOT_FOUND_IN_INVENTORY
/-------------------------------------------------------------------------------
30042, 0,"IO Exception occurred."
// *Cause: IO Exception occurred.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_IO_EXCEPTION
/-------------------------------------------------------------------------------
30043, 0,"The Grid Infrastructure home %s does not exist or is empty."
// *Cause: Installer has detected Grid Infrastructure home (%s) registered in the Inventory. But the home location does not exist or is empty.
// *Action: Check if the location specified is a valid Grid Infrastructure home. If not unregister the home from inventory using deinstall procedures.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_HOME_DOES_NOT_EXIST
/-------------------------------------------------------------------------------
30044, 0,"Create Install Session Exception."
// *Cause: Refer to the logs for more details.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_CREATE_INSTALL_SESSION_EXCEPTION
/-------------------------------------------------------------------------------
30045, 0,"Unable to find the specified Oracle Home."
// *Cause: Refer to the logs for more details.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_HOME_NOT_FOUND_EXCEPTION
/-------------------------------------------------------------------------------
30046, 0,"Unable to find product in Oracle Inventory."
// *Cause: Refer to the logs for more details.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_PRODUCT_NOT_FOUND_EXCEPTION
/-------------------------------------------------------------------------------
30047, 0,"Multiple versions of the product were found."
// *Cause: Refer to the logs for more details.
// *Action: Refer to the logs for more details.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_MULTIPLE_VERSIONS_FOUND_EXCEPTION
/-------------------------------------------------------------------------------
30048, 0,"Incorrect format used in the given cluster configuration file."
// *Cause: The content of cluster configuration file do not conform to the format recommended.
// *Action: Ensure that the contents of the cluster configuration file conform to the expected format.
// *FQN: oracle.install.library.resource.CommonErrorCode.CCF_INCORRECT_FORMAT
/-------------------------------------------------------------------------------
30049, 0,"The given cluster configuration file could not be read."
// *Cause: Unexpected error while reading the given cluster configuration file.
// *Action: Ensure that the given cluster configuration file exists and has the read permissions.
// *FQN: oracle.install.library.resource.CommonErrorCode.CCF_READ_FAILED
/-------------------------------------------------------------------------------
30051, 0,"Failed while checking for %s directory existence on remote node (%s)."
// *Cause: User equivalence may not be setup between the local node and the remote nodes or sufficient file permissions are not set.
// *Action: Setup user equivalence or ensure sufficient file permissions are set.
// *FQN: oracle.install.library.resource.CommonErrorCode.UNEXPECTED_REMOTE_DIR_CHECK_FAILURE
/-------------------------------------------------------------------------------
30052, 0,"Check for free disk space across nodes failed."
// *Cause: Unexpected error occurred while trying to check free disk space across nodes.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.library.resource.CommonErrorCode.FREE_SPACE_CHECK_FAILED
/-------------------------------------------------------------------------------
30053, 0,"Check for shared partitions across nodes failed."
// *Cause: Unexpected error occurred while trying to get shared partitions across nodes.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.library.resource.CommonErrorCode.SHARED_PARTITION_LIST_CHECK_FAILED
/-------------------------------------------------------------------------------
30054, 0,"Check for file system type across nodes failed."
// *Cause: Unexpected error while detecting file system type across nodes.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.library.resource.CommonErrorCode.FILE_SYSTEM_TYPE_CHECK_FAILED
/-------------------------------------------------------------------------------
30055, 0,"Incorrect node role provided."
// *Cause: Node role %s provided on line number %s of the Cluster Configuration File is not valid.
// *Action: Specify a valid node role.
// *FQN: oracle.install.library.resource.CommonErrorCode.CCF_INCORRECT_NODE_TYPE
/-------------------------------------------------------------------------------
30056, 0,"Host name contains invalid characters."
// *Cause: The  host name %s provided on line number %s of the Cluster Configuration File contains one or more invalid characters.
// *Action: Ensure that the host name contains only valid characters. Valid characters for host names can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), hyphen (-) and dot (.).
// *FQN: oracle.install.library.resource.CommonErrorCode.CCF_NODE_HOSTNAME_BADCHAR
/-------------------------------------------------------------------------------
30057, 0,"Virtual hostname is missing on line number %s."
// *Cause: n/a
// *Action: Specify a valid virtual hostname for the node.
// *FQN: oracle.install.library.resource.CommonErrorCode.CCF_NODE_PRIVATE_HOSTNAME_BLANK
/-------------------------------------------------------------------------------
30060, 0,"Check for group existence failed."
// *Cause: Unexpected error occurred while trying to check for group existence.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.library.resource.CommonErrorCode.GROUP_EXISTANCE_CHECK_FAILED
/-------------------------------------------------------------------------------
30061, 0,"Installer has detected that the OS group %s does not exist on some of the remote nodes."
// *Cause: OS group %s does not exist on nodes: %s.
// *Action: Ensure that the specified OS group is configured on the remote nodes.
// *FQN: oracle.install.library.resource.CommonErrorCode.GROUP_NOT_EXIST_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
30062, 0,"Installer was unable to verify if the specified OS group %s exists on the remote nodes %s."
// *Cause: n/a
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODES_GROUP_EXISTENCE_CHECK_FAILED
/-------------------------------------------------------------------------------
30063, 0,"Installer encountered a problem while trying to verify if the specified OS group %s exists on the remote nodes %s."
// *Cause: n/a
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODES_GROUP_EXISTENCE_VERIFICATION_EXCEPTION
/-------------------------------------------------------------------------------
30064, 0,"Installer has detected that user %s does not belong to the OS group %s on some of the remote nodes."
// *Cause: The OS group %s does not exist or user %s is not a member of the OS group %s, on remote nodes: %s
// *Action: Ensure that OS group %s exists and add install user %s as a member of the OS group %s on nodes %s or specify a different OS group in which install user is a member.
// *FQN: oracle.install.library.resource.CommonErrorCode.USER_NOT_MEMBER_REMOTE_NODES
/-------------------------------------------------------------------------------
30065, 0,"Installer was unable to verify if the user %s is a member of OS group %s specified for %s on remote nodes."
// *Cause: Installer was unable to verify if the user %s is a member of OS group %s on remote nodes: %s.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODES_GROUP_MEMBERSHIP_CHECK_FAILED
/-------------------------------------------------------------------------------
30066, 0,"Installer encountered a problem while trying to verify if the user %s is a member of OS group %s on remote nodes."
// *Cause: Installer encountered a problem while trying to verify if the user %s is a member of OS group %s on remote nodes: %s.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODES_GROUP_MEMBERSHIP_VERIFICATION_EXCEPTION
/-------------------------------------------------------------------------------
30067, 0,"Installer has detected that the OS group %s does not exist on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: OS group %s does not exist on nodes: 
//         %s.
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.ACTIONABLE_GROUP_NOT_EXIST_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
30068, 0,"Installer was unable to verify if the specified OS group %s exists on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.ACTIONABLE_REMOTE_NODES_GROUP_EXISTENCE_CHECK_FAILED
/-------------------------------------------------------------------------------
30069, 0,"Installer has detected that user %s does not belong to the OS group %s on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.ACTIONABLE_USER_NOT_MEMBER_REMOTE_NODES
/-------------------------------------------------------------------------------
30070, 0,"Installer was unable to verify if the user %s is a member of OS group %s on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Ensure that user %s is member of OS group %s on remote nodes: %s.
// *FQN: oracle.install.library.resource.CommonErrorCode.ACTIONABLE_REMOTE_NODES_GROUP_MEMBERSHIP_CHECK_FAILED
/-------------------------------------------------------------------------------
30071, 0,"An error occured while trying to determine the running processes or services."
// *Cause: A runtime error
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.library.resource.CommonErrorCode.RUNNING_PROCESSES_RUNTIME_EXCEPTION
/-------------------------------------------------------------------------------
30072, 0,"There are services running from the currently selected Oracle Home."
// *Cause: Files that need to be reinstalled or upgraded in this home are currently in use by running services.
// *Action: Please stop the following services before continuing: %s
// *FQN: oracle.install.library.resource.CommonErrorCode.RUNNING_PROCESSES_SERVICES_FOUND
/-------------------------------------------------------------------------------
30073, 0,"There is software running from the currently selected Oracle Home."
// *Cause: Files that need to be reinstalled or upgraded in this home are currently in use by one or more applications.
// *Action: Please close any running applications before continuing.
// *FQN: oracle.install.library.resource.CommonErrorCode.RUNNING_PROCESSES_NO_SERVICE_EXCEPTION
/-------------------------------------------------------------------------------
30074, 0,"There are processes running in the currently selected Oracle Home."
// *Cause: Software is already running from the home selected for the install.
// *Action: Shutdown the following processes before continuing: %s
// *FQN: oracle.install.library.resource.CommonErrorCode.RUNNING_PROCESSES_FOUND
/-------------------------------------------------------------------------------
30080, 0,"%s did not resolve to an IP address. Provide alternative name that resolves to an IP address."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_HOST_NAME_INVALID
/-------------------------------------------------------------------------------
30081, 0,"%s could not be resolved using TCP/IP host name lookup. Provide valid name that can be resolvable using TCP/IP host name lookup."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_HOST_NAME_NOT_RESOLVED
/-------------------------------------------------------------------------------
30090, 0,"Check for connectivity across all nodes through the interface %s has failed."
// *Cause: Unexpected error while checking connectivity of nodes through the interface.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.library.resource.CommonErrorCode.NODE_CONECTIVITY_CHECK_FAILED_FOR_INTERFACE
/-------------------------------------------------------------------------------
30100, 0,"Insufficient disk space on the selected location (%s)."
// *Cause: Specified location is on a volume without enough disk space on nodes: %s.
// *Action: Choose a location that has enough space (minimum of %s) or free up space on the existing volume.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_INSUFFICIENT_SPACE_AVAILABLE_ERR
/-------------------------------------------------------------------------------
30110, 0,"Installer has failed to perform status check on Oracle Clusterware configured."
// *Cause: Unexpected error occurred while trying to perform status check on existing Oracle Clusterware.
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.library.resource.CommonErrorCode.CRS_INTEGRITY_CHECK_FAILED
/-------------------------------------------------------------------------------
30120, 0,"Specified file (%s) doesnt exist."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_FILE_DOESNOT_EXIST
/-------------------------------------------------------------------------------
30131, 0,"Initial setup required for the execution of installer validations failed."
// *Cause: Installation cannot proceed further since the system failed to meet the requirements for installation.
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.CVU_FRAMEWORK_INITIALIZATION_FAILED
/-------------------------------------------------------------------------------
30132, 0,"Initial setup required for the execution of installer validations failed on nodes: %s"
// *Cause: Indicated nodes were not reachable, or the user equivalence is not available for those nodes, or the user failed to access the temporary location on the indicated nodes.
// *Action: Ensure that all the indicated nodes are reachable, user equivalence exists for those nodes and current user has required permissions to access the temporary location on all the indicated nodes.
// *FQN: oracle.install.library.resource.CommonErrorCode.CVU_FRAMEWORK_INITIALIZATION_FAILED_REMOTELY
/-------------------------------------------------------------------------------
30133, 0,"Initial setup required for the execution of installer validations failed on nodes: 
//         %s. 
//         
//         These nodes will be ignored and will not participate in the configured Grid Infrastructure."
// *Cause: Indicated nodes were not reachable, or the user equivalence is not available for those nodes, or the user failed to access the temporary location on the indicated nodes.
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.ACTIONABLE_CVU_FRAMEWORK_INITIALIZATION_FAILED_REMOTELY
/-------------------------------------------------------------------------------
30140, 0,"%s Client data file is not specified."
// *Cause: n/a
// *Action: Specify a valid %s client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WRAPFILE_PATH_EMPTY
/-------------------------------------------------------------------------------
30141, 0,"%s Client data file is not a valid file."
// *Cause: Installer has detected that the specified %s client data file is not a valid file, or does not exist or is not a readable file.
// *Action: Specify a valid %s client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WRAPFILE_INVALID
/-------------------------------------------------------------------------------
30142, 0,"Specified %s client data file is not a valid file."
// *Cause: Installer has detected that the specified %s client data file is not a valid file.
// *Action: Specify a valid %s client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WRAPFILE_NOT_WELL_FORMED
/-------------------------------------------------------------------------------
30143, 0,"Provided %s client data file does not exist."
// *Cause: n/a
// *Action: Specify an existent %s client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WRAPFILE_NOT_EXIST
/-------------------------------------------------------------------------------
30144, 0,"Provided %s client data file is not a file."
// *Cause: n/a
// *Action: Specify a valid %s client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WRAPFILE_NOT_FILE
/-------------------------------------------------------------------------------
30145, 0,"Provided %s client data file is not readable."
// *Cause: n/a
// *Action: Specify a readable %s client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_WRAPFILE_NOT_READ
/-------------------------------------------------------------------------------
30150, 0,"Installer has detected that the specified GNS client data file is invalid."
// *Cause: n/a
// *Action: Specify a valid GNS client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.GNSWRAPFILE_GET_GNSPROPERTIES_EXCEPTION
/-------------------------------------------------------------------------------
30151, 0,"An unexpected exception occurred while extracting Sub-domain info from GNS client data file"
// *Cause: n/a
// *Action: Check the installer logs for more details
// *FQN: oracle.install.library.resource.CommonErrorCode.GNSWRAPFILE_GET_GNSSUBDOMAIN_EXCEPTION
/-------------------------------------------------------------------------------
30155, 0,"Host name contains invalid characters."
// *Cause: n/a
// *Action: Ensure that the host name contains valid characters. Valid characters for host names can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen (-).
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_NODE_NAME_WITH_BAD_CHARACTERS
/-------------------------------------------------------------------------------
30156, 0,"Host name cannot be in IP Address format."
// *Cause: n/a
// *Action: Provide the node name for the host.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_NODE_IN_IP
/-------------------------------------------------------------------------------
30157, 0,"The following nodes cannot be clustered due to user equivalence issue: %s."
// *Cause: The user performing this installation is not configured identically on all nodes. This may be due to differences in the user or group IDs, or to SSH configuration issues.
// *Action: If necessary, refer to the installation guide for information about how to set up user equivalence manually on cluster nodes.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_USER_EQUIVALENCE_ERR
/-------------------------------------------------------------------------------
30158, 0,"One or more host names you provided are invalid, as they do not resolve to a valid IP address."
// *Cause: n/a
// *Action: Enter valid host names.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_NODE_PUB_INVALID_ERR
/-------------------------------------------------------------------------------
30159, 0,"Node information was entered for two or more nodes that belonged to different domains."
// *Cause: n/a
// *Action: Enter host names belonging to the same domain.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_NODE_DIFF_DOMAIN_ERR
/-------------------------------------------------------------------------------
30160, 0,"Installer has detected that the nodes %s specified for addnode operation have uncleaned inventory."
// *Cause: n/a
// *Action: Ensure that the inventory location %s is cleaned before performing addnode procedure.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODE_HAS_STALE_INVETORY
/-------------------------------------------------------------------------------
30161, 0,"The local node cannot be specified in the list of new nodes."
// *Cause: n/a
// *Action: Remove the local node from the list of new nodes.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_ADDNODE_LOCALNODE_PROVIDED
/-------------------------------------------------------------------------------
30162, 0,"No new nodes were specified."
// *Cause: n/a
// *Action: Ensure at least one new node is specified.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_ADDNODE_NO_NEW_NODES_PROVIDED
/-------------------------------------------------------------------------------
30163, 0,"Installer has detected that the inventory location is not empty on node(s) %s specified for addnode operation."
// *Cause: n/a
// *Action: Ensure that the inventory location %s is cleaned before performing addnode procedure.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODE_INVENTORY_NOT_EMPTY
/-------------------------------------------------------------------------------
30164, 0,"Installer has detected that the inventory location is not writable on node(s) %s specified for addnode operation."
// *Cause: n/a
// *Action: Ensure that the inventory location %s has write access before performing addnode procedure.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODE_INVENTORY_NOT_WRITABLE
/-------------------------------------------------------------------------------
30165, 0,"Installer has detected that the parent directory of the inventory location is not writable on node %s specified for addnode operation."
// *Cause: n/a
// *Action: Ensure that the inventory location %s has write access before performing addnode procedure.
// *FQN: oracle.install.library.resource.CommonErrorCode.REMOTE_NODE_INVENTORY_PARENT_NOT_WRITABLE
/-------------------------------------------------------------------------------
30201, 0,"The specified inventory locations parent directory {0} do not have proper permissions on the local node."
// *Cause: n/a
// *Action: Ensure that you have read and execute permissions on the parent directories of the inventory location.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_LOCAL_INVENTORY_LOC_PERMISSION_ERR
/-------------------------------------------------------------------------------
30202, 0,"The specified inventory locations parent directory {0} do not have proper permissions on the remote node(s): {1}."
// *Cause: n/a
// *Action: Ensure that you have read and execute permissions on the parent directories of the inventory location.
// *FQN: oracle.install.library.resource.CommonErrorCode.INSTALL_COMMON_REMOTE_INVENTORY_LOC_PERMISSION_ERR
/-------------------------------------------------------------------------------
30211, 0,"Installer has detected that the specified ASM client data file is invalid."
// *Cause: An error occurred while extracting details from ASM client data file
// *Action: Check the installer logs for more details
// *FQN: oracle.install.library.resource.CommonErrorCode.ASMWRAPFILE_GET_ASMPROPERTIES_EXCEPTION
/-------------------------------------------------------------------------------
30212, 0,"An error occurred while extracting ASM Cluster name from ASM client data file"
// *Cause: n/a
// *Action: Check the installer logs for more details
// *FQN: oracle.install.library.resource.CommonErrorCode.ASMWRAPFILE_GET_ASMCLUSTERNAME_EXCEPTION
/-------------------------------------------------------------------------------
30213, 0,"An error occurred while extracting ASM client cluster name from ASM client data file"
// *Cause: n/a
// *Action: Check the installer logs for more details
// *FQN: oracle.install.library.resource.CommonErrorCode.ASMWRAPFILE_GET_CLIENTCLUSTERNAME_EXCEPTION
/-------------------------------------------------------------------------------
30214, 0,"Installer was unable to verify if the Oracle Grid Infrastructure owner %s is a member of OS group %s on local node."
// *Cause: n/a
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.library.resource.CommonErrorCode.USER_GROUP_LOCAL_NODE_MEMBERSHIP_CHECK_FAILED
/-------------------------------------------------------------------------------
30215, 0,"Installer has detected that Oracle Grid Infrastructure owner %s does not belong to the OS group %s on local node."
// *Cause: The OS group %s does not exist or Oracle Grid Infrastructure owner %s is not a member of the OS group %s on local node.
// *Action: Ensure that OS group %s exists and add Oracle Grid Infrastructure owner %s as a member of the OS group %s on local node or specify a different OS group in which Oracle Grid Infrastructure owner is a member.
// *FQN: oracle.install.library.resource.CommonErrorCode.USER_NOT_MEMBER_ON_LOCAL_NODE
/-------------------------------------------------------------------------------
30216, 0,"Installer has detected that the specified SCAN client data file is invalid."
// *Cause: Installer is unable retrieve SCAN related properties from the provided SCAN Client data file.
// *Action: Specify a valid SCAN client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_GET_SCAN_PROPERTIES_EXCEPTION
/-------------------------------------------------------------------------------
30217, 0,"SCAN section does not exists in the provided client data file."
// *Cause: n/a
// *Action: Specify a valid client data file that contains the SCAN section.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_SCAN_SECTION_NOT_EXISTS_EXCEPTION
/-------------------------------------------------------------------------------
30218, 0,"Installer is unable to retrieve the SCAN name from the specified client data file."
// *Cause: n/a
// *Action: Specify a valid SCAN client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_GET_SCAN_NAME_EXCEPTION
/-------------------------------------------------------------------------------
30219, 0,"Installer is unable to retrieve the SCAN endpoints from the specified client data file."
// *Cause: n/a
// *Action: Specify a valid SCAN client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_GET_SCAN_ENDPOINTS_EXCEPTION
/-------------------------------------------------------------------------------
30220, 0,"Installer is unable to retrieve the SCAN Client Cluster name from the specified client data file."
// *Cause: n/a
// *Action: Specify a valid SCAN client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_GET_SCANCLIENT_CLUSTER_NAME_EXCEPTION
/-------------------------------------------------------------------------------
30221, 0,"Installer has detected that the specified SCAN client data file is invalid."
// *Cause: Installer is unable to retrieve ONS related properties from the provided SCAN Client data file.
// *Action: Specify a valid SCAN client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_GET_ONS_PROPERTIES_EXCEPTION
/-------------------------------------------------------------------------------
30222, 0,"ONS section does not exists in the provided client data file."
// *Cause: n/a
// *Action: Specify a valid client data file that contains the ONS section.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_ONS_SECTION_NOT_EXISTS_EXCEPTION
/-------------------------------------------------------------------------------
30223, 0,"Installer is unable to retrieve the remote ONS port from the specified client data file."
// *Cause: n/a
// *Action: Specify a valid SCAN client data file.
// *FQN: oracle.install.library.resource.CommonErrorCode.SCAN_WRAPFILE_GET_REMOTE_ONS_PORT_EXCEPTION
/-------------------------------------------------------------------------------
30224, 0,"The Oracle Home is not set."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_EMPTY_ORACLE_HOME
/-------------------------------------------------------------------------------
30225, 0,"Too few arguments for function."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_MISSING_ARGUMENTS
/-------------------------------------------------------------------------------
30226, 0,"Unable to read the image information."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_CANNOT_READ_IMAGE_INFO_FILE
/-------------------------------------------------------------------------------
30227, 0,"Unable to write the image information."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_CANNOT_WRITE_IMAGE_INFO_FILE
/-------------------------------------------------------------------------------
30228, 0,"Failed to get the image information."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_CANNOT_READ_ENCODE_FILE
/-------------------------------------------------------------------------------
30229, 0,"Unable to get the image information."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_UNABLE_TO_DECODE_IMAGE_INFO
/-------------------------------------------------------------------------------
30230, 0,"The string to encode is empty."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_EMPTY_ENCODE_STRING
/-------------------------------------------------------------------------------
30231, 0,"Failed to verify the image information."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.IMAGE_INFO_WRONG_CHECKSUM
/-------------------------------------------------------------------------------
30240, 0,"Unable to read any passwords from the specified wallet file location (%s). Ensure that the wallet file exists in the specified location."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.WALLET_NO_PASSWORDS_FOUND
/-------------------------------------------------------------------------------
30241, 0,"Exception occurred while trying to read passwords from the specified wallet file location (%s). Ensure that the wallet file exists in the specified location and is readable."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.WALLET_IOEXCEPTION_OCCURRED
/-------------------------------------------------------------------------------
30242, 0,"Exception occurred while trying to read passwords from the specified wallet file location (%s)."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.WALLET_PKI_EXCEPTION
/-------------------------------------------------------------------------------
30243, 0,"No wallet files found in the specified location (%s)."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.library.resource.CommonErrorCode.WALLET_FILE_NOT_FOUND
/-------------------------------------------------------------------------------
30501, 0,"Automatic Storage Management software is not configured on this system."
// *Cause: Prior to configuring a database to use Automatic Storage Management (ASM), you must install and configure Grid Infrastructure, which includes ASM software.
// *Action: Grid Infrastructure can be installed from the separate installation media included in your media pack. Alternatively, it can be downloaded separately from Electronic Product Delivery (EPD) or the Oracle Technology Network (OTN). This is typically installed as a separate operating system user than the Oracle database and may have been installed by your system administrator. See the installation guide for more details.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_INSTANCE_NOT_FOUND
/-------------------------------------------------------------------------------
30502, 0,"No ASM disk group found."
// *Cause: There were no disk groups managed by the ASM instance %s.
// *Action: Use Automatic Storage Management Configuration Assistant to add disk groups.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.NO_ASM_DISKGROUP_FOUND
/-------------------------------------------------------------------------------
30503, 0,"Unknown ASM disk group."
// *Cause: There was no disk groups named %s managed by ASM instance %s
// *Action: Enter a valid existing ASM disk group or use Automatic Storage Management Configuration Assistant to add the desired ASM disk group.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.UNKNOWN_ASM_DISKGROUP
/-------------------------------------------------------------------------------
30504, 0,"Missing ASM disk group name."
// *Cause: ASM disk group name was not specified.
// *Action: Enter a valid ASM disk group name.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_DISKGROUP_NAME_EXPECTED
/-------------------------------------------------------------------------------
30505, 0,"Invalid disk group name."
// *Cause: The disk group name specified was invalid. It must start with an alphabetic character, and consist of up to 30 characters which are alphabetic, numeric, or the underscore character _.
// *Action: Enter a valid disk group name containing only alphanumeric characters and possibly a few special characters allowed by your platform.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INVALID_ASM_DISKGROUP_NAME
/-------------------------------------------------------------------------------
30506, 0,"Invalid redundancy level."
// *Cause: Redundancy level was invalid.
// *Action: Choose a valid redundancy level: Extended, Flex, High, Normal or External.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INVALID_ASM_DISKGROUP_REDUNDANCY
/-------------------------------------------------------------------------------
30507, 0,"Empty ASM disk group."
// *Cause: No disks were selected from a managed ASM disk group.
// *Action: Select appropriate number of disks from a managed ASM disk group.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EMPTY_ASM_DISKGROUP
/-------------------------------------------------------------------------------
30508, 0,"Invalid ASM disks."
// *Cause: The disks %s were not valid.
// *Action: Please choose or enter valid ASM disks.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INVALID_ASM_DISKS
/-------------------------------------------------------------------------------
30509, 0,"Insufficient space available in the selected disk group."
// *Cause: Insufficient space available in the selected disk group. At least, %s of space is required.
// *Action: Use Automatic Storage Management Configuration Assistant to add more disks to the selected disk group or create a new disk group with as least %s of space.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_SPACE_IN_ASM_DISKGROUP
/-------------------------------------------------------------------------------
30510, 0,"Insufficient number of ASM disks selected."
// *Cause: The number of disks selected were insufficient for the selected redundancy level.
// *Action: For a disk group with redundancy level '%s', at least '%s' disks are recommended.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_MEMBER_DISKS
/-------------------------------------------------------------------------------
30511, 0,"An older ASM instance was found."
// *Cause: Automatic Storage Management (ASM) %s instance is found.
// *Action: Upgrade the existing ASM instance to version %s.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.OLDER_ASM_INSTANCE_VERSION_FOUND
/-------------------------------------------------------------------------------
30512, 0,"Automatic Storage Management software is not configured on this cluster."
// *Cause: Prior to configuring a cluster database to use Automatic Storage Management (ASM), you must configure ASM software in the Grid Infrastructure home.
// *Action: Grid Infrastructure installation on this cluster was only configured to run Oracle Clusterware. You will need to go back to the Grid Infrastructure home and configure ASM for storing database. Grid Infrastructure is typically installed as a separate operating system user than the Oracle database and may have been installed by your system administrator. See the installation guide for more details.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.RAC_ASM_INSTANCE_NOT_FOUND
/-------------------------------------------------------------------------------
30513, 0,"ASM instance is not running on one or more nodes in the cluster."
// *Cause: The following nodes did not have an ASM instance running on them. 
//          Node list: %s
// *Action: Before creating a database that uses ASM on all of the nodes chosen for this installation, you should extend the ASM cluster of instances using the Add Instance procedure to the desired set of nodes. 
//          Node list: %s
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.NODE_DOES_NOT_HAVE_ASM
/-------------------------------------------------------------------------------
30514, 0,"The ASM diskgroup name has exceeded %s characters."
// *Cause: n/a
// *Action: Specify diskgroupname lesser than %s characters.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.DISKGROUP_NAME_SIZE_EXCEEDED
/-------------------------------------------------------------------------------
30515, 0,"Insufficient space available in the selected disks."
// *Cause: Insufficient space available in the selected Disks. At least, %s of free space is required.
// *Action: Choose additional disks such that the total size should be at least %s.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_SPACE_IN_ASM_DISKS
/-------------------------------------------------------------------------------
30516, 0,"Please specify unique disk groups."
// *Cause: Installer has detected that the diskgroup name provided already exists on the system.
// *Action: Specify different disk group.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.NON_UNIQUE_ASM_DISKS
/-------------------------------------------------------------------------------
30517, 0,"Automatic Storage Management software is not configured on this system."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_NOT_COMPATIBLE
/-------------------------------------------------------------------------------
30518, 0,"Invalid Disk Discovery Path specified."
// *Cause: Blank space and the following list of characters are not allowed: (%s)
// *Action: Ensure Disk Discovery Path provided does not contain invalid characters.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INVALID_DISK_DISCOVERY_STRING
/-------------------------------------------------------------------------------
30519, 0,"Allocation unit size can only be one of the following value set %s."
// *Cause: The allocation unit size (AU Size) is set to an invalid number.
// *Action: Set the allocation unit size be one of the following value set %s.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_DISKGROUP_AUSIZE_NOT_VALID
/-------------------------------------------------------------------------------
30520, 0,"Incorrect Disk Group name specified."
// *Cause: The Disk Group name specified is incorrect. Disk Group name cannot be a SQL reserved word.
// *Action: Enter a Disk Group name that is not a SQL reserved word.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INCORRECT_ASM_DISKGROUP_NAME
/-------------------------------------------------------------------------------
30521, 0,"The size of disks selected is not the same so as to allow  for equal number of %sMB AU size blocks."
// *Cause: n/a
// *Action: Specify disks of same size, or consider changing the value for AU Size.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.DIFFERENT_ASM_MEMBER_DISK_SIZE
/-------------------------------------------------------------------------------
30522, 0,"Selected Disk group can not be used as storage location."
// *Cause: Installer has detected that the value of ASM compatiblity attribute of the diskgroup %s is %s. The value of the attribute should be at least %s to use it as storage location for the database.
// *Action: Update the value of ASM compatibility attribute of the diskgroup to %s. Refer to the Storage Adminstration documentation for further information.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INCORRECT_ASM_COMPATIBLITY_VERSION
/-------------------------------------------------------------------------------
30523, 0,"Insufficient space available in the server clusters disk group."
// *Cause: The selected diskgroup does not have sufficient space. A minimum of %s space is required.
// *Action: Add new disks to the disk group to meet the space requirement. Alternatively, select a new diskgroup with required space of %s.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_SPACE_IN_SERVER_CLUSTER_ASM_DISKGROUP
/-------------------------------------------------------------------------------
30524, 0,"Installer has detected that failure group is not assigned to some of the disks."
// *Cause: n/a
// *Action: Either none or all the disks should have a failure group assigned.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_FAILURE_GROUPS_SPECIFIED
/-------------------------------------------------------------------------------
30525, 0,"Insufficient number of failure groups specified for %s Redundancy level."
// *Cause: n/a
// *Action: For a disk group with %s redundancy level at least %s unique failure groups should be configured.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_FAILURE_GROUPS_FOR_SELECTED_REDUNDANCY
/-------------------------------------------------------------------------------
30526, 0,"Installer has detected that unequal number of disks assigned to some of the failure groups."
// *Cause: n/a
// *Action: The number of disks in each failure group should be equal.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_DISKS_IN_FAILURE_GROUPS
/-------------------------------------------------------------------------------
30527, 0,"Selected disks cannot overlap between disk groups."
// *Cause: Installer has detected that the disk %s chosen is part of another diskgroup.
// *Action: Please choose a valid ASM disk.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.SELECTED_ASM_DISKS_OVERLAP
/-------------------------------------------------------------------------------
30528, 0,"Invalid GIMR diskgroup name (%s)."
// *Cause: Installer has detected that GIMR diskgroup name (%s) is same as ASM diskgroup name %s.
// *Action: Provide a different diskgroup name.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_GIMR_DISK_GROUP_NAME_MATCH
/-------------------------------------------------------------------------------
30529, 0,"Duplicate Failure group(s) (%s) provided."
// *Cause: n/a
// *Action: Only Unique failure group(s) are allowed.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_DUPLICATE_FAILURE_GROUP_NAME_FOUND
/-------------------------------------------------------------------------------
30530, 0,"Following specified disks have invalid header status: %s"
// *Cause: n/a
// *Action: Ensure only Candidate or Provisioned disks are specified.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_DISKS_INVALID_HEADER_STATUS
/-------------------------------------------------------------------------------
30531, 0,"No sites provided to create disk group for Extended cluster"
// *Cause: n/a
// *Action: Specify sites and failure groups to create disk group for Extended cluster.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_NO_SITES_PROVIDED
/-------------------------------------------------------------------------------
30532, 0,"Installer has detected that no site is marked as QUORUM.A site is identified as QUORUM only if all the failure groups assigned to it are QUORUM."
// *Cause: n/a
// *Action: Specify a QUORUM site to proceed.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_NO_QUORUM_SITE_PROVIDED
/-------------------------------------------------------------------------------
30533, 0,"Invalid number of data sites provided for creating disk group for Extended cluster."
// *Cause: n/a
// *Action: Specify only %s data sites to proceed.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_INSUFFICIENT_NUMBER_OF_DATA_SITES
/-------------------------------------------------------------------------------
30534, 0,"Invalid number of sites provided for creating disk group for Extended cluster. Ensure that failure groups are assigned to sites."
// *Cause: n/a
// *Action: Specify only %s sites to proceed.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_INSUFFICIENT_NUMBER_OF_SITES
/-------------------------------------------------------------------------------
30535, 0,"Incorrect number of failure groups specified per data site."
// *Cause: n/a
// *Action: Specify %s failure group(s) for each data site.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_FAILURE_GROUPS_IN_SITES
/-------------------------------------------------------------------------------
30536, 0,"Insufficient number of failure groups specified per QUORUM site."
// *Cause: n/a
// *Action: Specify at least %s failure group(s) for the QUORUM site.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_FAILURE_GROUPS_IN_SITES_QUORUM
/-------------------------------------------------------------------------------
30537, 0,"Insufficient Failure group names specified for disks."
// *Cause: The list of failure groups specified %s for the disk group does not match with the list of failure groups %s selected for the disks.
// *Action: All failure groups specified should have disk(s) assigned.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_ALL_SPECIFIED_FAILURE_GROUPS_NOT_SELECTED_FOR_DISKS
/-------------------------------------------------------------------------------
30538, 0,"No Failure group is marked for disks."
// *Cause: n/a
// *Action: Assign a failure group for each selected disk.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_NO_FAILURE_GROUPS_SELECTED_FOR_DISKS
/-------------------------------------------------------------------------------
30539, 0,"Insufficient number of cluster nodes assigned to sites."
// *Cause: Installer has detected that there is no cluster node assigned to site %s.
// *Action: It is recommended that at least 1 cluster node should be assigned to each site.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_NODES_PER_SITE
/-------------------------------------------------------------------------------
30540, 0,"Mixed failure group types are not permitted in a site."
// *Cause: Site %s has failure groups marked as quorum and regular(non-quorum).
// *Action: A site can have only Quorum failure groups or only Regular failure groups.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_EXTENDED_CLUSTER_MIXED_FAILURE_GROUPS_SPECIFIED_PER_SITE_ERROR
/-------------------------------------------------------------------------------
30541, 0,"Insufficient number of disks assigned to quorum failure group %s."
// *Cause: n/a
// *Action: Specify at least one disk per QUORUM failure group.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_NUMBER_OF_DISKS_IN_QUORUM_FAILURE_GROUPS
/-------------------------------------------------------------------------------
30542, 0,"Failure group name: %s is invalid. It does not start with an alphabet."
// *Cause: n/a
// *Action: Provide a value for the failure group name that starts with an alphabet.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INVALID_FAILURE_GROUP_NAME
/-------------------------------------------------------------------------------
30543, 0,"Installer has detected that one or more of the selected disk(s) is of size larger than %s terabyte(TB). Because of this, the Oracle Database compatibility level (COMPATIBLE.RDBMS attribute) of the diskgroup (%s) will be set to %s. This means that, in order to use the diskgroup for data storage, the COMPATIBLE initialization parameter of the Oracle Database should be greater than or equal to %s."
// *Cause: The following disks are of size larger than %s terabyte(TB): %s
// *Action: n/a
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.ASM_DISK_SIZE_PASSES_RDBMS_COMPATIBILITY_LIMIT
/-------------------------------------------------------------------------------
30544, 0,"Empty Disk Discovery Path."
// *Cause: The Disk Discovery Path was not specified.
// *Action: Specify a valid Disk Discovery Path.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EMPTY_DISK_DISCOVERY_STRING
/-------------------------------------------------------------------------------
30545, 0,"Installer has detected that there are no ASM disk groups found with sufficient space for the Oracle Autostart Upgrade to continue. At least, one disk group is required with %s of space."
// *Cause: n/a
// *Action: Use Automatic Storage Management Configuration Assistant to create disk group with at least %s of free space.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.NO_ASM_DISKGROUP_FOUND_WITH_SUFFICIENT_SPACE
/-------------------------------------------------------------------------------
30546, 0,"Insufficient number of non-quorum(regular) failure groups specified for %s Redundancy level."
// *Cause: n/a
// *Action: For a disk group with %s redundancy level at least %s unique non-quorum failure groups should be configured.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.INSUFFICIENT_REGULAR_FAILURE_GROUPS_FOR_SELECTED_REDUNDANCY
/-------------------------------------------------------------------------------
30547, 0,"Installer has detected that the selected disks are not equally distributed among the cells."
// *Cause: n/a
// *Action: Ensure that equal number of disks from each cell is specified.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EXADATA_UNEQUAL_NUMBER_OF_DISKS_PER_CELL
/-------------------------------------------------------------------------------
30548, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EXADATA_DISK_CELL_AND_DISK_FG_MAPPING_ERROR
/-------------------------------------------------------------------------------
30549, 0,"Installer has detected that the disk %s is mapped to site %s, however user specified an incorrect site name %s."
// *Cause: n/a
// *Action: Ensure that the correct site name is specified.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EXADATA_EXTENDED_CRS_SITE_NAME_INVALID_ERR
/-------------------------------------------------------------------------------
30550, 0,"Insufficient number of cells specified for %s Redundancy level."
// *Cause: n/a
// *Action: For a disk group with %s redundancy level, disks from %s unique cells should be selected.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EXADATA_INSUFFICIENT_CELLS_FOR_SELECTED_REDUNDANCY
/-------------------------------------------------------------------------------
30551, 0,"Insufficient number of non-quorum(regular) disks specified for %s Redundancy level."
// *Cause: n/a
// *Action: For a disk group with %s redundancy level, at least %s unique non-quorum disks should be selected.
// *FQN: oracle.install.asm.bean.ASMInputValidationErrorCode.EXADATA_INSUFFICIENT_NON_QUORUM_DISKS_FOR_SELECTED_REDUNDANCY
/-------------------------------------------------------------------------------
30601, 0,"File access permissions error encountered."
// *Cause: n/a
// *Action: Ensure proper file access permissions are granted.
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.ASMUTILITY_INIT_FAILED
/-------------------------------------------------------------------------------
30602, 0,"ASM access denied."
// *Cause: A connection to the Automatic Storage Management (ASM) instance on this system could not be established.
// *Action: To ensure a proper connection, the operating system user performing this installation must be a member of the OSDBA group of the ASM instance. See the installation guide for more information on the proper system setup required for running ASM and database instances as separate operating system users. Refer to Oracle error description for ORA-01031 for additional details.
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.ASM_ACCESS_DENIED
/-------------------------------------------------------------------------------
30603, 0,"Cluster Ready Services (CRS) is not running on local node."
// *Cause: n/a
// *Action: Perform a CRS, Grid Infrastructure, installation and configuration.
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.INTERNAL_ERROR
/-------------------------------------------------------------------------------
30604, 0,"Required drivers are not found to perform the operation."
// *Cause: n/a
// *Action: Ensure that all required drivers were installed.
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.DRIVER_NOT_FOUND
/-------------------------------------------------------------------------------
30605, 0,"The ASM instance is detected to be not running."
// *Cause: n/a
// *Action: Bring up the ASM instance in order to proceed.
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.ASM_INSTANCE_DOWN
/-------------------------------------------------------------------------------
30606, 0,"Partial installation of ASM home is detected."
// *Cause: n/a
// *Action: Clean up ASM home and reinstall ASM.
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.CORRUPT_ASM_HOME
/-------------------------------------------------------------------------------
30607, 0,"No ASM found on the box."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.asm.util.ASMUtilityErrorCode.NO_ASM_FOUND
/-------------------------------------------------------------------------------
32001, 0,"No value has been given for the Password field."
// *Cause: A value was not specified for the Password field.
// *Action: Specify a value for the password field.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PASSWORD_IS_EMPTY_ERR
/-------------------------------------------------------------------------------
32002, 0,"Invalid password."
// *Cause: The password entered in the Confirm password field did not match the password entered in the Password field.
// *Action: Enter the same password in both Password and Confirm password fields for confirmation purposes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PASSWORDS_NOT_SAME_ERR
/-------------------------------------------------------------------------------
32007, 0,"%s contains invalid characters."
// *Cause: n/a
// *Action: Choose an %s that does not have invalid characters ('#','$').
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_BASE_AND_HOME_INVALID_CHARS_ERR
/-------------------------------------------------------------------------------
32008, 0,"Oracle base location cant be same as the user home directory."
// *Cause: The specified Oracle base is same as the user home directory.
// *Action: Provide an Oracle base location other than the user home directory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_USER_HOME_AS_ORACLE_BASE_LOCATION_WRN
/-------------------------------------------------------------------------------
32009, 0,"%s contains non-ASCII characters."
// *Cause: The specified %s contained one or more non-ASCII characters.
// *Action: Ensure the %s only contains ASCII characters.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_CONTAINS_NON_ASCII_CHARS_ERR
/-------------------------------------------------------------------------------
32010, 0,"%s contains invalid characters."
// *Cause: The specified %s contained one or more invalid characters.
// *Action: Choose a %s containing only alphanumeric characters and a few additional characters that are allowed for your platform.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_BADCHARS_ERR
/-------------------------------------------------------------------------------
32011, 0,"The %s that you have specified contains the space character."
// *Cause: The string you entered contains the space character.
// *Action: Please choose a string containing only alphanumeric, and a few additional characters that are allowed for your platform.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_SPACECHAR_ERR
/-------------------------------------------------------------------------------
32012, 0,"Unable to create directory: %s, on this server."
// *Cause: Either proper permissions were not granted to create the directory or there was no space left in the volume.
// *Action: Check your permission on the selected directory or choose another directory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_DIRECTORY_CREATION_ERR
/-------------------------------------------------------------------------------
32013, 0,"The %s is empty."
// *Cause: n/a
// *Action: Specify a path for %s.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_HOME_LOC_EMPTY_ERR
/-------------------------------------------------------------------------------
32014, 0,"The specified %s (%s) is invalid."
// *Cause: The %s cannot be placed directly on a drive.
// *Action: Specify a valid %s.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_LOCATION_ON_WIN_DRIVE
/-------------------------------------------------------------------------------
32015, 0,"The location specified for %s is invalid."
// *Cause: The specified location cannot be used for %s. Either the specified location is not found on the system or is detected to be a file.
// *Action: Specify a valid location for %s.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVALID_ORACLE_HOME_LOCATION_ERR
/-------------------------------------------------------------------------------
32016, 0,"The selected Oracle home contains directories or files."
// *Cause: n/a
// *Action: To start with an empty Oracle home, either remove its contents or choose another location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_SPECIFIED_NON_EMPTY_DIRECTORY_WRN
/-------------------------------------------------------------------------------
32017, 0,"Invalid path specified for %s"
// *Cause: Path specified for %s contains one or more folders which exceeds maximum folder name length.
// *Action: Specify the location which contains folders name length not more than %s characters.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_FOLDER_NAME_LENGTH_EXCEEDED_ERR
/-------------------------------------------------------------------------------
32018, 0,"The selected Oracle home is outside of Oracle base."
// *Cause: n/a
// *Action: Oracle recommends installing Oracle software within the Oracle base directory. Adjust the Oracle home or Oracle base accordingly.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_HOME_NOT_IN_BASE_WRN
/-------------------------------------------------------------------------------
32019, 0,"Insufficient disk space at the specified Oracle base location (%s).%s of free disk space is required for Oracle base."
// *Cause: The Oracle base will be used to store diagnostics data of the Oracle Member clusters that are configured to use the services of this Domain Services cluster.
// *Action: Provide a different location for Oracle base, that has enough space or free up space on the existing volume.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_CRS_BASE_MIN_FREE_DISK_SPACE_FOR_DC_WRN
/-------------------------------------------------------------------------------
32020, 0,"Installer has detected that the available disk space on the volume for the specified Oracle base location (%s) is less than the recommended value."
// *Cause: n/a
// *Action: It is recommended that the volume for the Oracle base have at least %s of available disk space. Choose a location that has sufficient available disk space or free up space on the existing volume.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_CRS_BASE_MIN_FREE_DISK_SPACE_WRN
/-------------------------------------------------------------------------------
32021, 0,"Installer has detected that the available disk space on the volume for Oracle home (%s) is insufficient."
// *Cause: n/a
// *Action: Choose a location for Oracle home that has enough space (minimum of %s) or free up space on the existing volume.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_MIN_FREE_DISK_SPACE_ERR
/-------------------------------------------------------------------------------
32022, 0,"Grid infrastructure software for a cluster installation must not be under an Oracle base directory."
// *Cause: Grid infrastructure for a cluster installation assigns root ownership to all parent directories of the Grid home location. As a result, ownership of all named directories in the software location path is changed to root, creating permissions errors for all subsequent installations into the same Oracle base.
// *Action: Specify software location outside of an Oracle base directory for grid infrastructure for a cluster installation.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_HOME_IN_BASE_WRN
/-------------------------------------------------------------------------------
32023, 0,"Insufficient disk space on the volume for the specified Oracle base."
// *Cause: The selected Oracle base is on a volume without enough disk space.
// *Action: Choose a location for Oracle base that has enough space (minimum of %s) or free up space on the existing volume.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_CRS_BASE_MIN_FREE_DISK_SPACE_ERR
/-------------------------------------------------------------------------------
32024, 0,"The specified location for Oracle base is invalid."
// *Cause: The specified Oracle base location is identical to an existing Oracle home location.
// *Action: Specify a location for Oracle base which is not an existing Oracle home.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_HOME_AS_ORACLE_BASE_LOCATION_ERR
/-------------------------------------------------------------------------------
32025, 0,"The chosen installation conflicts with software already installed in the given Oracle home."
// *Cause: n/a
// *Action: Install into a different Oracle home.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_HOME_NOT_COMPATIBLE_ERR
/-------------------------------------------------------------------------------
32026, 0,"The Software location specified should not be under Oracle base location."
// *Cause: Grid Infrastructure for a Cluster installation will assign root ownership to all parent directories of Oracle Clusterware software location. As a result, all named directories in the software location path will acquire root ownership. This may create problems for subsequent installations into the same Oracle base. 
// *Action: Specify software location outside of Oracle base.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_HOME_IN_BASE_ERR
/-------------------------------------------------------------------------------
32027, 0,"The ORACLE_HOME environment variable is currently set and this value is not same as the specified path for software location. This may impact the proper configuration of software."
// *Cause: n/a
// *Action: Unset the ORACLE_HOME environment variable and then restart the installer.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_HOME_ENV_SET_ERR
/-------------------------------------------------------------------------------
32028, 0,"The Installer has detected that the Oracle Base location is not empty in following nodes: %s."
// *Cause: n/a
// *Action: Oracle recommends that the Oracle Base location is empty.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_BASE_NOT_EMPTY_IN_REMOTE_NODES
/-------------------------------------------------------------------------------
32029, 0,"The Installer has detected that the Oracle Base location is not empty."
// *Cause: n/a
// *Action: Oracle recommends that the Oracle Base location is empty.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_BASE_NOT_EMPTY
/-------------------------------------------------------------------------------
32030, 0,"Invalid location for Central Inventory."
// *Cause: The Central Inventory location provided was empty.
// *Action: Provide a valid location for the inventory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_LOC_EMPTY_ERR
/-------------------------------------------------------------------------------
32031, 0,"Invalid inventory location."
// *Cause: n/a
// *Action: Specify a valid inventory location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_INVALID_INV_LOCATION_ERR
/-------------------------------------------------------------------------------
32033, 0,"Central Inventory location is not writable."
// *Cause: n/a
// *Action: Ensure that the inventory location is writable.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_INV_NO_WRITE_PERMISSION_ERR
/-------------------------------------------------------------------------------
32034, 0,"Invalid characters specified for the inventory directory."
// *Cause: The inventory directory contained one or more invalid characters.
// *Action: The inventory directory can contain only alphanumeric, hyphen, and underscore characters.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_INV_INVALID_CHARS
/-------------------------------------------------------------------------------
32035, 0,"The location (%s) specified for the central inventory is not empty."
// *Cause: The specified central inventory location is either locked by different install session, or the location specified does not have write permissions for the logs.
// *Action: Specify an empty location for the inventory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_LOC_DIRTY
/-------------------------------------------------------------------------------
32036, 0,"User home directory is not recommended as inventory location"
// *Cause: User home directory has been chosen as inventory directory. Oracle recommends that the inventory directory is not users home directory, because members of inventory group will be given write permission to the inventory directory.
// *Action: Choose a directory other than users home as inventory location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.USER_HOME_NOT_ALLOWED_AS_INV_LOC
/-------------------------------------------------------------------------------
32037, 0,"The operating system group specified for central inventory (oraInventory) ownership is invalid."
// *Cause: No value specified for central inventory (oraInventory) ownership group.
// *Action: Specify an operating system group whose members should have write permission to the central inventory directory (oraInventory).
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ORAINVENTORY_GROUP_NOT_SPECIFIED
/-------------------------------------------------------------------------------
32038, 0,"The operating system group (%s), specified for central inventory (oraInventory) ownership, is invalid."
// *Cause: The user performing the installation (%s) is not a member of the operating system group (%s).
// *Action: Specify an operating system group that the installing user (%s) is a member of. All the members of this operating system group will have write permission to the central inventory directory (oraInventory).
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INVALID_ORAINVENTORY_GROUP
/-------------------------------------------------------------------------------
32039, 0,"Inappropriate file permissions for the specified inventory location (%s)."
// *Cause: The installer user (%s) and the inventory group (%s) do not match with the current owner user%s and group%s of the inventory location.
// *Action: Ensure that the owner user and group of the inventory location are the same as the installer user and the inventory group, respectively.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INV_USER_GROUP_MATCH_ERR
/-------------------------------------------------------------------------------
32040, 0,"The central inventory location provided is not empty on remote nodes %s."
// *Cause: n/a
// *Action: Please provide another location for the inventory, or clean up the current location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_LOC_REMOTE_DIRTY
/-------------------------------------------------------------------------------
32041, 0,"Unable to create a new central inventory directory : %s"
// *Cause: The central inventory location provided is not empty or corrupted
// *Action: Please clean up the inventory location : %s
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_WINDOWS_INVENTORY_LOC_DIRTY
/-------------------------------------------------------------------------------
32042, 0,"The Installer has detected that the user (%s) is not member of the central inventory group: %s"
// *Cause: n/a
// *Action: Make sure that the user (%s) is member of the central inventory group (%s).
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.NOT_MEMBER_OF_ORAINVENTORY_GROUP
/-------------------------------------------------------------------------------
32042, 0,"The central inventory location provided is not empty on the following nodes 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_INSTALL_COMMON_INVENTORY_LOC_REMOTE_DIRTY
/-------------------------------------------------------------------------------
32043, 0,"The Installer has detected that remote nodes %s have an existent central inventory in a different location than %s."
// *Cause: n/a
// *Action: Remove the central inventory from the remote nodes or ensure it is in the same location as in the local node.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.REMOTE_INVENTORY_MISMATCH_LOCATION
/-------------------------------------------------------------------------------
32043, 0,"Check for free disk space failed on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Unexpected error occurred while trying to check free disk space across nodes.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_FREE_SPACE_CHECK_OPERATION_FAILED
/-------------------------------------------------------------------------------
32044, 0,"The Installer has detected that the inventory location %s is not empty in following remote nodes: %s."
// *Cause: n/a
// *Action: Make sure that the inventory location is empty in the remote nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.REMOTE_INVENTORY_NONEMPTY_LOCATION
/-------------------------------------------------------------------------------
32044, 0,"Specified location (%s) is on a volume without enough disk space on nodes: 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Specified location is on a volume with insufficient disk space. Required disk space: %s.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_INSTALL_COMMON_INSUFFICIENT_SPACE_AVAILABLE_ERR
/-------------------------------------------------------------------------------
32045, 0,"The Installer has detected that the inventory location %s is not writable in following remote nodes: %s."
// *Cause: n/a
// *Action: Make sure that the inventory location is writable in the remote nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.REMOTE_INVENTORY_NONWRITABLE_LOCATION
/-------------------------------------------------------------------------------
32046, 0,"The Installer has detected that the home name (%s) is already in use on following remote nodes: %s"
// *Cause: n/a
// *Action: Detach the homes that are using the home name (%s) from the central inventory of such remote nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.HOME_NAME_ALREADY_USED_IN_REMOTE_INVENTORY
/-------------------------------------------------------------------------------
32047, 0,"The location (%s) specified for the central inventory is not empty."
// *Cause: n/a
// *Action: It is recommended to provide an empty location for the inventory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_LOC_DIRTY_WARN
/-------------------------------------------------------------------------------
32048, 0,"Inappropriate user ownership of the specified inventory location (%s)."
// *Cause: The provided inventory location (%s) is owned by user (%s).
// *Action: Either ensure that user (%s) is the owner of the specified inventory location, remove it, or specify a different valid location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_WRONG_USER
/-------------------------------------------------------------------------------
32049, 0,"Inappropriate group ownership of the specified inventory location (%s)."
// *Cause: The provided inventory location (%s) owner group is (%s).
// *Action: Either ensure that group (%s) is the owner group of the specified inventory location, remove it, or specify a different valid location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_WRONG_GROUP
/-------------------------------------------------------------------------------
32050, 0,"Install user (%s) does not have sufficient access permissions for the given central inventory."
// *Cause: User does not have read or write permissions for %s under the central inventory.
// *Action: Ensure that all the folders under the central inventory has read and write permissions for the install user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVENTORY_PERMISSIONS_NOT_VALID
/-------------------------------------------------------------------------------
32052, 0,"Oracle base and Oracle home locations are same."
// *Cause: n/a
// *Action: Oracle base and Oracle home locations cannot be same. Oracle recommends installing Oracle software within the Oracle base directory. Adjust the Oracle home or Oracle base accordingly.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_BASE_SAME_AS_ORACLE_HOME
/-------------------------------------------------------------------------------
32053, 0,"The specified Oracle home name (%s) is already assigned to a different Oracle home."
// *Cause: n/a
// *Action: Abort this installation session and try again specifying an unique Oracle home name.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_HOME_NAME_ALREADY_EXISTS
/-------------------------------------------------------------------------------
32054, 0,"The Central Inventory %s is located on a shared file system."
// *Cause: n/a
// *Action: Oracle recommends placing this Central Inventory on a local file system that is not shared by other systems, because it is a server-specific inventory of the installation on this server. Oracle strongly recommends that you move the Central Inventory to a local disk so that installations from other servers do not corrupt the Central Inventory for this server.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INVENTORY_ON_SHARED_LOC
/-------------------------------------------------------------------------------
32055, 0,"The Central Inventory is located in the Oracle base."
// *Cause: n/a
// *Action: Oracle recommends placing this Central Inventory in a location outside the Oracle base directory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INVENTORY_IN_ORACLE_BASE
/-------------------------------------------------------------------------------
32056, 0,"The specified Oracle Base contains the existing Central Inventory location: %s."
// *Cause: n/a
// *Action: Oracle recommends that the Central Inventory location is outside the Oracle Base directory. Specify a different location for the Oracle Base.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_BASE_PARENT_OF_EXISTING_INVENTORY
/-------------------------------------------------------------------------------
32060, 0,"Insufficient permissions granted to create directory %s on node(s) %s."
// *Cause: Insufficient write permissions were granted to create this directory on the specified node.
// *Action: Ensure that you have the required write permissions. Alternatively, you may want to choose another location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.DIRECTORY_NOT_WRITABLE_ON_NODE
/-------------------------------------------------------------------------------
32061, 0,"The selected ASM disk group is invalid."
// *Cause: An invalid or non-existent ASM disk group has been selected.
// *Action: Ensure that the selected ASM disk group exists.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVALID_DISKGROUP_ERR
/-------------------------------------------------------------------------------
32062, 0,"Unable to create %s at the specified location."
// *Cause: The %s location provided is not absolute path.
// *Action: Please provide absolute location for the %s.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_NO_ABSOLUTE_PATH
/-------------------------------------------------------------------------------
32063, 0,"Could not get the attributes from file (%s)."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_NO_FILE_OBJECT_EXCEPTION
/-------------------------------------------------------------------------------
32063, 0,"Insufficient permissions granted to create directory %s on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Insufficient write permissions were granted to create this directory on the specified nodes.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_DIRECTORY_NOT_WRITABLE_ON_NODE
/-------------------------------------------------------------------------------
32064, 0,"The specified path for %s is not absolute: %s"
// *Cause: n/a
// *Action: Provide a valid absolute path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_PATH_NOT_ABSOLUTE
/-------------------------------------------------------------------------------
32065, 0,"The specified path for %s is not canonical: %s"
// *Cause: The path should be provided in its canonical form: %s
// *Action: Provide a valid canonical path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_PATH_NOT_CANONICAL
/-------------------------------------------------------------------------------
32066, 0,"Microsoft Transaction Services (MTS) port is blank or containing non-numeric character."
// *Cause: The MTS port text field is either empty or containing non-numeric characters
// *Action: Provide a valid value for MTS port.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INVALID_MTS_PORT
/-------------------------------------------------------------------------------
32067, 0,"The value you have entered for Microsoft Transaction Services (MTS) Port, %s, is already in use."
// *Cause: Refer to the error message for details.
// *Action: Specify a valid port number.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.MTS_PORT_NOT_AVAILABLE
/-------------------------------------------------------------------------------
32068, 0,"The value specified for Microsoft Transaction Services (MTS) Port number, %s, is out of valid range."
// *Cause: The value you have entered for the MTS Port is out of the valid range.
// *Action: Enter a MTS Port number between 1024 and 65535.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.OUT_OF_RANGE_MTS_PORT
/-------------------------------------------------------------------------------
32069, 0,"Could not determine if the specified path for %s is canonical: %s"
// *Cause: n/a
// *Action: Provide a valid path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_PATH_CANNOT_GET_CANONICAL
/-------------------------------------------------------------------------------
32070, 0,"Could not remove the nodes %s corresponding to following error code: %s."
// *Cause: Installer requires that a minimum of %s nodes remain for the Oracle Grid Infrastructure configuration to proceed.
// *Action: Ensure that at least %s nodes remain for the configuration to proceed, otherwise specify a single cluster node information.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ACTIONABLE_LEAVING_LESS_NODES_THAN_LIMIT
/-------------------------------------------------------------------------------
32075, 0,"At least one product language need to selected"
// *Cause: No product language selected for installation.
// *Action: Select at least one product language for installation.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PRODUCT_LANGUAGES_SELECTED_IS_EMPTY
/-------------------------------------------------------------------------------
32076, 0,"English cannot be removed from the selected languages list."
// *Cause: An attempt was made to remove English from the selected languages list.
// *Action: Select English as one of the selected product languages.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PRODUCT_LANGUAGE_ENGLISH_IS_MANDATORY
/-------------------------------------------------------------------------------
32077, 0,"The following selected languages are not supported; %s"
// *Cause: Not all selected product languages are supported.
// *Action: Refer to the sample response file for more information.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PRODUCT_LANGUAGES_UNSUPPORTED
/-------------------------------------------------------------------------------
32090, 0,"Software installation was unsuccessful."
// *Cause: Refer the log files for details.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SETUP_FAILED
/-------------------------------------------------------------------------------
32091, 0,"Software installation was successful. But some configuration assistants failed, were cancelled or skipped."
// *Cause: n/a
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CONFIG_TOOL_FAILED
/-------------------------------------------------------------------------------
32092, 0,"User Name is empty."
// *Cause: A value was not specified for the username field.
// *Action: Specify a value for the username field.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.USER_NAME_EMPTY
/-------------------------------------------------------------------------------
32093, 0,"Virtual Account is not supported."
// *Cause: Virtual Account is not supported.
// *Action: Specify Oracle Home User.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.VIRTUAL_ACCOUNT_USER_NOT_SUPPORTED
/-------------------------------------------------------------------------------
32094, 0,"Specified Oracle Home user has invalid characters."
// *Cause: You have entered invalid characters in username.
// *Action: Make sure you specify a username with valid characters.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_USER_NAME_HAS_INVALID_CHAR_ERR
/-------------------------------------------------------------------------------
32095, 0,"Specified user has administrative privileges."
// *Cause: You have selected a user which has administrative privileges to be the Oracle Home user.
// *Action: Make sure you specify a non-administrative user or revoke the administrative privileges for this user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ADMINISTRATOR_USER
/-------------------------------------------------------------------------------
32096, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_PASSWORD_DOESNOT_MATCH
/-------------------------------------------------------------------------------
32097, 0,"Invalid username or password."
// *Cause: You have selected an existing user to be the Oracle Home user, however username or password entered are not valid.
// *Action: Specify a valid username and password combination.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_NOT_VALID_USER
/-------------------------------------------------------------------------------
32098, 0,"The password field is empty."
// *Cause: The password should not be empty.
// *Action: Provide a non-empty password.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_NO_PASSWORD_SPECIFIED
/-------------------------------------------------------------------------------
32099, 0,"The username field is empty."
// *Cause: The username should not be empty.
// *Action: Provide a non-empty username.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_NO_USERNAME_SPECIFIED
/-------------------------------------------------------------------------------
32100, 0,"Specified Oracle Home user is not domain User."
// *Cause: You have selected a local user to be the Oracle Home user.
// *Action: Make sure you specify a domain user for Oracle Home user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_NO_DOMAIN_USER
/-------------------------------------------------------------------------------
32101, 0,"Specified Oracle Home user does not exist."
// *Cause: You have selected an Oracle Home user that does not exist.
// *Action: Make sure you specify an existing user for Oracle Home user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_SPECIFIED_USER_DOESNOT_EXISTS
/-------------------------------------------------------------------------------
32101, 0,"My Oracle Support username is empty."
// *Cause: My Oracle Support username cannot be empty.
// *Action: Provide a valid My Oracle Support username.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.MYORACLESUPPORT_USERNAME_EMPTY
/-------------------------------------------------------------------------------
32102, 0,"Specified Oracle Home user already exist."
// *Cause: You have selected an Oracle Home user that already exist.
// *Action: Make sure you specify a non existing user for Oracle Home user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_SPECIFIED_USER_EXISTS
/-------------------------------------------------------------------------------
32102, 0,"My Oracle Support password is empty."
// *Cause: My Oracle Support password cannot be empty.
// *Action: Provide a valid My Oracle Support password.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.MYORACLESUPPORT_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
32103, 0,"Specified Oracle Home user does not match with existing Home user."
// *Cause: You have selected an Oracle Home user which is not matching with existing Home user you are trying to upgrade.
// *Action: Make sure you specify Oracle Home user of Oracle Home that you are trying to upgrade.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_EXISTING_HOME_USER_NOT_MATCHING
/-------------------------------------------------------------------------------
32103, 0,"Connection to My Oracle Support could not be established."
// *Cause: Credentials provided may be invalid, or there may be a network connection issue.
// *Action: Check the My Oracle Support credentials. Also check the proxy setting and the network connection.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.MYORACLESUPPORT_CONNECTION_FAILED
/-------------------------------------------------------------------------------
32104, 0,"Specified Oracle Home user is not the owner of the specified Oracle Base."
// *Cause: n/a
// *Action: Make sure you specify Oracle Home user who has ownership of the selected Oracle Base.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_HOME_USER_NOT_OWNER_OF_SPECIFIED_OB
/-------------------------------------------------------------------------------
32104, 0,"The installer is unable to locate the software updates in the specified directory."
// *Cause: n/a
// *Action: For software updates to work in offline mode, the downloaded updates must be in a particular path location format. Refer to your installation manual for details.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.PATCHDOWNLOAD_LOCATION_INVALID
/-------------------------------------------------------------------------------
32105, 0,"Invalid password."
// *Cause: You have selected a new user to be the Oracle Home user, however password entered cannot be used because of your Windows system policies.
// *Action: Specify a password which complies with your Windows system policies.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_SPECIFIED_INVALID_PASSWORD
/-------------------------------------------------------------------------------
32105, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.PROXY_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
32106, 0,"Specified user %s cannot be designated as Oracle Home User."
// *Cause: Installer has detected that the specified user has administrative privileges on the following nodes: %s.
// *Action: Specify a user without administrative privileges or revoke the administrative privileges for this user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ADMINISTRATOR_USER_NODE
/-------------------------------------------------------------------------------
32106, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.PROXY_USERNAME_EMPTY
/-------------------------------------------------------------------------------
32107, 0,"Virtual Account is not supported on environments where Oracle Grid Infrastructure for a Cluster is configured."
// *Cause: n/a
// *Action: Specify a different account type.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.VIRTUAL_ACCOUNT_USER_NOT_SUPPORTED_CRS_CONFIGURED
/-------------------------------------------------------------------------------
32107, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.PROXY_SERVER_EMPTY
/-------------------------------------------------------------------------------
32108, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.PROXY_PORT_EMPTY
/-------------------------------------------------------------------------------
32109, 0,"Failed to retrieve the updates from My Oracle Support."
// *Cause: The My Oracle Support credentials you provided may not have download privileges, or there may be a network or proxy authentication issue. 
// *Action: Provide credentials with download privileges. Also check the network connection and, if you have a proxy realm, your proxy credentials.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.FAILURE_IN_UPDATES_RETRIEVAL
/-------------------------------------------------------------------------------
32110, 0,"Failed to retrieve the updates from My Oracle Support."
// *Cause: This may be due to a network connection problem or a missing patch on My Oracle Support.
// *Action: Check the connection to My Oracle Support or contact Oracle Support Services.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.UPDATES_DOWNLOAD_FAILED
/-------------------------------------------------------------------------------
32111, 0,"The patch download location provided is empty."
// *Cause: The patch download location cannot be empty.
// *Action: Provide the location where the updates have been downloaded.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.PATCHDOWNLOAD_LOCATION_EMPTY
/-------------------------------------------------------------------------------
32112, 0,"Unable to retrieve the details from the downloaded metadata."
// *Cause: The downloaded metadata for software updates is not properly formatted.
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.METADATA_PARSE_FAILED
/-------------------------------------------------------------------------------
32113, 0,"Unable to read the updates location."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.UPDATES_SECTION_MISSING
/-------------------------------------------------------------------------------
32114, 0,"Check the My Oracle Support user name."
// *Cause: The user name provided is invalid. It either contains invalid characters or does not follow the standard e-mail address format.
// *Action: Specify an e-mail address that is consistent with RFC 2822 and RFC 2821 format.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.MYORACLESUPPORT_USERNAME_INVALID
/-------------------------------------------------------------------------------
32115, 0,"Insufficient space in the download location provided."
// *Cause: The location provided does not have space for downloading all the updates.
// *Action: Choose a location with enough space or free up space on the existing volume.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.INSUFFICIENT_SPACE_IN_DOWNLOAD_LOC
/-------------------------------------------------------------------------------
32116, 0,"The location specified may contain already downloaded software updates. Downloading at this location will overwrite the existing software updates."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.EXISTENT_UPDATES_LOCATION_PROVIDED
/-------------------------------------------------------------------------------
32117, 0,"My Oracle Support credentials provided does not have download privileges."
// *Cause: n/a
// *Action: Provide My Oracle Support credentials with download privileges in order to check for latest updates.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.NO_DOWNLOAD_PRIVILEGES
/-------------------------------------------------------------------------------
32118, 0,"Proxy information required for the connection to My Oracle Support is not provided."
// *Cause: n/a
// *Action: Provide the proxy information required to connect to My Oracle Support.
// *FQN: oracle.install.ivw.common.resource.AutoUpdatesErrorCode.NO_PROXY_PROVIDED
/-------------------------------------------------------------------------------
32121, 0,"Execution of '%s' script failed."
// *Cause: Execution of the script failed. This might be due to invalid parameters specified for executing the script.
// *Action: Review the log file for further details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_CONFIG_EXCEPTION
/-------------------------------------------------------------------------------
32122, 0,"Execution of '%s' script failed."
// *Cause: Installer is unable to connect to a node for executing the script using specified configuration method.
// *Action: Review the log file '%s' for further details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_CLUSTER_EXCEPTION
/-------------------------------------------------------------------------------
32123, 0,"Execution of '%s' script failed on nodes: %s"
// *Cause: Installer has failed to execute the specified script on one or more nodes. This might be because of exception occurred while executing the script on nodes.
// *Action: Review the log files '%s' and '%s' for further details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_COMPOSITE_OPERATION_EXCEPTION
/-------------------------------------------------------------------------------
32124, 0,"Execution of '%s' script failed."
// *Cause: Installer has failed to execute the specified script on the local node (first node). This might be because of exception occurred while executing the script on the local node.
// *Action: Review the log file '%s' for further details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_FIRST_NODE_EXCEPTION
/-------------------------------------------------------------------------------
32125, 0,"Execution of '%s' script failed."
// *Cause: Installer has failed to execute the specified script on the last node. This might be because of exception occurred while executing the script on the last node.
// *Action: Review the log file '%s' for further details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_LAST_NODE_EXCEPTION
/-------------------------------------------------------------------------------
32126, 0,"Execution of '%s' script failed."
// *Cause: Configuration object which is used for executing the script is not initialized.
// *Action: Review the log file for further details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_CONFIG_OBJECT_NULL_EXCEPTION
/-------------------------------------------------------------------------------
32127, 0,"'%s' password is not specified. Specify a valid password."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_CONFIG_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
32128, 0,"Installer has failed to login as root user with the specified password. Specify a valid root user password."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_USER_PASSWORD_INVALID
/-------------------------------------------------------------------------------
32129, 0,"Sudo program path is not specified for script execution. Specify a valid Sudo program path."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_LOCATION_EMPTY
/-------------------------------------------------------------------------------
32130, 0,"Specified details for Sudo option are not valid."
// *Cause: Either Sudo program path or specified user credentials are invalid.
// *Action: Specify the valid details for Sudo option.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_CONFIG_DETAILS_INVALID
/-------------------------------------------------------------------------------
32131, 0,"Specified user ('%s') doesnt have permission to execute configuration script using Sudo option."
// *Cause: n/a
// *Action: Either select different configuration option or specify different user who has privilege to run the configuration scripts using Sudo program.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_EXCECUTION_PERMISSION_ERROR
/-------------------------------------------------------------------------------
32132, 0,"Power Broker program path is not specified for script execution. Specify the valid Power Broker program path."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PBRUN_LOCATION_EMPTY
/-------------------------------------------------------------------------------
32133, 0,"Specified details for Power Broker option are invalid."
// *Cause: Either Power Broker program path or specified user credentials are invalid.
// *Action: Specify the valid details for Power Broker option.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PBRUN_CONFIG_DETAILS_INVALID
/-------------------------------------------------------------------------------
32134, 0,"Specified user ('%s') doesnt have permission to execute configuration script using Power Broker option."
// *Cause: n/a
// *Action: Either select different configuration option or specify different user who has privilege to run the configuration scripts using Power Broker program.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PBRUN_EXCECUTION_PERMISSION_ERROR
/-------------------------------------------------------------------------------
32135, 0,"Specified Sudo program path is not valid."
// *Cause: Sudo program path ('%s') is not a complete path. (Note: relative path is not supported)
// *Action: Specify the valid Sudo program path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_LOCATION_ABSOLUTE_PATH_NOT_SPECIFIED
/-------------------------------------------------------------------------------
32136, 0,"Specified Sudo program name in the path is not valid."
// *Cause: Either Sudo program path ('%s') is not a complete path or Sudo program name is invalid.(Note: Sudo program name should be '%s')
// *Action: Specify the valid Sudo program path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_PROGRAM_NAME_INVALID
/-------------------------------------------------------------------------------
32137, 0,"Specified Power Broker program path is not valid."
// *Cause: Power Broker program path ('%s') is not a complete path. (Note: relative path is not supported)
// *Action: Specify the valid Power Broker program path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PBRUN_LOCATION_ABSOLUTE_PATH_NOT_SPECIFIED
/-------------------------------------------------------------------------------
32138, 0,"root user password is not specified. Specify a valid password."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_CONFIG_ROOT_USER_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
32139, 0,"User name is not specified for Sudo option. Specify the existing user who has privilege to run the configuration scripts using Sudo program."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_USER_NAME_EMPTY
/-------------------------------------------------------------------------------
32140, 0,"Specified Sudo user name ('%s') doesnt exist on one or more nodes. Specify the existing user who has privilege to run the configuration scripts using Sudo program."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_USERNAME_EXISTANCE_CHECK_ERROR
/-------------------------------------------------------------------------------
32141, 0,"User name is not specified for Sudo option. Specify the existing user who has privilege to run the configuration scripts using Power Broker program."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PBRUN_USER_NAME_EMPTY
/-------------------------------------------------------------------------------
32142, 0,"Specified Power Broker user name ('%s') doesnt exist on one or more nodes. Specify the existing user who has privilege to run the configuration scripts using Power Broker program."
// *Cause: User doesnt have Power Broker permission to execute configuration scripts.
// *Action: Either select different configuration option or provide Power Broker permission for the user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PBRUN_USERNAME_EXISTANCE_CHECK_ERROR
/-------------------------------------------------------------------------------
32143, 0,"Execution of '%s' script failed on nodes: %s"
// *Cause: Installer has failed to execute the specified script on one or more nodes. This might be because of either some of the nodes (%s) require a reboot to complete the configuration, or an exception occurred while executing the script on nodes.
// *Action: Reboot the specified nodes and then rerun the script. Refer to the documentation for information about completing the configuration after node(s) reboot. Or review the log files '%s' and '%s' for further details on failure.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_REBOOT_REQUIRED_COMPOSITE_OPERATION_EXCEPTION
/-------------------------------------------------------------------------------
32144, 0,"Execution of '%s' script failed on one or more nodes (%s). These nodes require a reboot to complete the configuration."
// *Cause: n/a
// *Action: Reboot the specified nodes and then rerun the script. Refer to the documentation for information about completing the configuration after node(s) reboot.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_REBOOT_REQUIRED_ERR
/-------------------------------------------------------------------------------
32145, 0,"Sudo password was not specified. Passwordless sudo configuration is not supported."
// *Cause: n/a
// *Action: Please specify a valid password.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.SUDO_CONFIG_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
32146, 0,"Execution of '%s' script failed on nodes: %s."
// *Cause: n/a
// *Action: Reboot the specified nodes and then rerun the script. Refer to the documentation for information about completing the configuration after node(s) reboot. Or review the log files '%s' and '%s' for further details on failure.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_FAILED_NODES_WITH_REBOOT_REQUIRED_EXCEPTION
/-------------------------------------------------------------------------------
32147, 0,"Execution of '%s' script failed on nodes: %s.
//         Following nodes require a reboot before proceeding: %s."
// *Cause: n/a
// *Action: For nodes %s, review the log files '%s' and '%s' for further details on failure.
//         For nodes %s, reboot the nodes and then rerun the script. Refer to the documentation for information about completing the configuration after node(s) reboot.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_FAILED_NODES_AND_REBOOT_REQUIRED_NODES_EXCEPTION
/-------------------------------------------------------------------------------
32148, 0,"Execution of '%s' script failed on nodes: %s"
// *Cause: n/a
// *Action: Review the log files '%s' and '%s' for further details on failure.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_FAILED_NODES_EXCEPTION
/-------------------------------------------------------------------------------
32149, 0,"Following nodes require a reboot before proceeding: %s."
// *Cause: n/a
// *Action: Reboot the specified nodes and then rerun the script. Refer to the documentation for information about completing the configuration after node(s) reboot.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_EXEC_REBOOT_REQUIRED_NODES_EXCEPTION
/-------------------------------------------------------------------------------
32150, 0,"Execution of '%s' script failed on nodes: %s"
// *Cause: n/a
// *Action: Review the log files '%s' and '%s' for further details on failure. 
//         Use the retry option, if you would like to retry the execution of the script on the failed nodes. Alternatively, you can continue executing the script on the remaining nodes by using the skip option.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ROOT_SCRIPT_UPGRADE_FAIL
/-------------------------------------------------------------------------------
32151, 0,"CLUSTER_NEW_NODES parameter was not specified for performing addnode operation."
// *Cause: n/a
// *Action: Ensure that the CLUSTER_NEW_NODES parameter is passed. Refer to installation guide for more information on the syntax of passing CLUSTER_NEW_NODES parameter.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ADD_NODE_CLUSTER_NEW_NODES_NOT_PASSED
/-------------------------------------------------------------------------------
32152, 0,"Clusterware is not running on the local node."
// *Cause: Local node does not have Clusterware running for performing addnode.
// *Action: Ensure that the Clusterware is configured and is running on local node before performing the addnode.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ADD_NODE_CRS_NOT_RUNNING_ON_LOCAL_NODE
/-------------------------------------------------------------------------------
32153, 0,"Public Hostname of node was not specified for performing addnode operation."
// *Cause: n/a
// *Action: Ensure that the public hostname is provided for each node on which addnode operation is being performed.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ADD_NODE_PUBLIC_HOSTNAME_NOT_SPECIFIED
/-------------------------------------------------------------------------------
32154, 0,"Installing user cannot perform the addnode operation."
// *Cause: The addnode wizard detects that the existing oracle home was not installed or cloned using the current user id: %s.
// *Action: Either restart the addnode wizard as the user account that was used previously to configure the Oracle home, or re-clone the Oracle home using the current user account.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ADD_NODE_USER_NOT_SAME_AS_INSTALLING_USER
/-------------------------------------------------------------------------------
32155, 0,"The Oracle home is not registered in the central inventory: %s."
// *Cause: n/a
// *Action: Ensure the Oracle home is registered in the central inventory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ADD_NODE_LOCAL_HOME_NOT_IN_INVENTORY
/-------------------------------------------------------------------------------
32156, 0,"Installer has detected that there are non-readable files in oracle home."
// *Cause: Following files are non-readable, due to insufficient permission 
//         %s
// *Action: Ensure the above files are readable by %s.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ORACLE_HOME_NON_READABLE_FILES
/-------------------------------------------------------------------------------
32166, 0,"The current Oracle home is not registered in the central inventory on the following nodes: %s"
// *Cause: The wizard does not find this Oracle home to be registered with the central inventory on some or all of the nodes specified.
// *Action: Register the Oracle home on the specified nodes with the central inventory, either by using a cloning operation, or by using an attach-home operation. Restart the wizard after fixing this issue.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_REMOTEHOME_NOT_REGISTERED
/-------------------------------------------------------------------------------
32167, 0,"The Oracle home is inconsistent on the following nodes: %s"
// *Cause: The wizard detects that the Oracle home is inconsistent on some or all of the nodes specified. Review the log file for further details.
// *Action: Ensure that the Oracle home is consistent on all nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_REMOTEHOME_NOT_MATCHING
/-------------------------------------------------------------------------------
32168, 0,"Installer has detected an invalid entry in the central inventory corresponding to this Oracle home in the following nodes: %s"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_INVALID_REMOTE_HOME_REGISTERED
/-------------------------------------------------------------------------------
32181, 0,"The local node was not specified in CLUSTER_NODES parameter for clone."
// *Cause: n/a
// *Action: Ensure that the local node is passed in the CLUSTER_NODES.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CLONE_LOCAL_NODE_NOT_PASSED
/-------------------------------------------------------------------------------
32182, 0,"The nodes %s  specified in CLUSTER_NODES parameter for cloning are not valid."
// *Cause: n/a
// *Action: Ensure that the correct nodes are passed in the CLUSTER_NODES parameter, check the documentation for the correct syntax of CLUSTER_NODES parameter.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CLONE_CLUSTER_NODE_PASSED_NOT_VALID
/-------------------------------------------------------------------------------
32183, 0,"Use of clone.pl is deprecated in this release. Clone operation is equivalent to performing a Software Only installation from the image. 
//         You must use %s script available to perform the Software Only install. For more details on image based installation, refer to help documentation.
//         "
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CLONE_DEPRECATED
/-------------------------------------------------------------------------------
32184, 0,"Standard Edition (SE) is not supported for this installation."
// *Cause: Standard Edition (SE) is not supported for Oracle Real Application Clusters database installation.
// *Action: Select a different Install Edition.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CLONE_INSTALL_EDITION_SE_RAC_NOT_SUPPORTED
/-------------------------------------------------------------------------------
32196, 0,"The script %s was not executed on the following nodes %s."
// *Cause: n/a
// *Action: Ensure that the %s script is executed on the nodes specified.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORAINSTROOT_NOT_EXECUTED
/-------------------------------------------------------------------------------
32250, 0,"ADR setup (diagsetup) tool failed. Check the install log for more details."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_DIAGSETUP_FAILED
/-------------------------------------------------------------------------------
32251, 0,"Could not create the ADR (diagsetup) clients directory: %s"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_DIAGSETUP_CLIENT_DIRECTORY_FAILED
/-------------------------------------------------------------------------------
32301, 0,"%s tool failed . Check the install log for more details."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_TOOL_FAILED
/-------------------------------------------------------------------------------
32350, 0,"Execution of '%s' script failed on nodes: 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Review the log files '%s' and '%s' for further details on failure.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_ROOT_SCRIPT_EXEC_FAILED_NODES_EXCEPTION
/-------------------------------------------------------------------------------
32354, 0,"Installer has failed to login as root user with the specified password on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_ROOT_USER_PASSWORD_INVALID
/-------------------------------------------------------------------------------
32355, 0,"Specified Sudo user name ('%s') does not exist on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_SUDO_USERNAME_EXISTANCE_CHECK_ERROR
/-------------------------------------------------------------------------------
32356, 0,"Specified user ('%s') does not have permission to execute configuration script using Sudo option on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_SUDO_EXCECUTION_PERMISSION_ERROR
/-------------------------------------------------------------------------------
32357, 0,"Specified details for Sudo option are not valid on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_SUDO_CONFIG_DETAILS_INVALID
/-------------------------------------------------------------------------------
32358, 0,"Specified details for Power Broker option are invalid on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_PBRUN_CONFIG_DETAILS_INVALID
/-------------------------------------------------------------------------------
32359, 0,"Specified user ('%s') does not have permission to execute configuration script using Power Broker option on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_PBRUN_EXCECUTION_PERMISSION_ERROR
/-------------------------------------------------------------------------------
32360, 0,"Specified Power Broker user name ('%s') does not exist on the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_PBRUN_USERNAME_EXISTANCE_CHECK_ERROR
/-------------------------------------------------------------------------------
32401, 0,"The Installer has detected that remote nodes %s have an existent central inventory in a different location than %s.
//         
//         These nodes will be ignored and not participate in the Grid Infrastructure setup."
// *Cause: n/a
// *Action: Remove the central inventory from the remote nodes or ensure it is in the same location as in the local node.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_REMOTE_INVENTORY_MISMATCH_LOCATION
/-------------------------------------------------------------------------------
32402, 0,"The Installer has detected that the inventory location %s is not empty in following remote nodes: %s.
//         
//         These nodes will be ignored and not participate in the Grid Infrastructure setup."
// *Cause: n/a
// *Action: Make sure that the inventory location is empty in the remote nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_REMOTE_INVENTORY_NONEMPTY_LOCATION
/-------------------------------------------------------------------------------
32403, 0,"The Installer has detected that the inventory location %s is not writable in following remote nodes: %s.
//         
//         These nodes will be ignored and not participate in the Grid Infrastructure setup."
// *Cause: n/a
// *Action: Make sure that the inventory location is writable in the remote nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_REMOTE_INVENTORY_NONWRITABLE_LOCATION
/-------------------------------------------------------------------------------
32404, 0,"The Installer has detected that the home name (%s) is already in use on following remote nodes: %s.
//         
//         These nodes will be ignored and not participate in the installation setup."
// *Cause: n/a
// *Action: Abort this installation session and try again specifying an unique Oracle home name, or detach the homes that are using the home name (%s) from the central inventory of such remote nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_HOME_NAME_ALREADY_USED_IN_REMOTE_INVENTORY
/-------------------------------------------------------------------------------
32450, 0,"The current Oracle home is not registered in the central inventory on the following nodes: %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The wizard does not find this Oracle home to be registered with the central inventory on some or all of the nodes specified.
// *Action: Register the Oracle home on the specified nodes with the central inventory, either by using a cloning operation, or by using an attach-home operation. Restart the wizard after fixing this issue.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_INSTALL_COMMON_REMOTEHOME_NOT_REGISTERED
/-------------------------------------------------------------------------------
32451, 0,"The Oracle home is inconsistent on the following nodes: %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The wizard detects that the Oracle home is inconsistent on some or all of the nodes specified. Review the log file for further details.
// *Action: Ensure that the Oracle home is consistent on all nodes.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_INSTALL_COMMON_REMOTEHOME_NOT_MATCHING
/-------------------------------------------------------------------------------
32452, 0,"Installer check for free disk space failed on the following nodes 
//         %s."
// *Cause: Unexpected error occurred while trying to check free disk space across nodes.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_FREE_SPACE_CHECK_OPERATION_FAILED
/-------------------------------------------------------------------------------
32453, 0,"Installer has detected an invalid entry in the central inventory corresponding to this Oracle home in the following nodes: %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Choose a different location as Oracle home.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.ACTIONABLE_INSTALL_COMMON_INVALID_REMOTE_HOME_REGISTERED
/-------------------------------------------------------------------------------
32500, 0,"%s tool failed."
// *Cause: n/a
// *Action: Review %s for more details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_PATCH_TOOL_FAILED
/-------------------------------------------------------------------------------
32501, 0,"The %s location provided has duplicate entries."
// *Cause: n/a
// *Action: Check the %s locations provided.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PATCH_LOCATION_HAS_DUPLICATES_ERR
/-------------------------------------------------------------------------------
32502, 0,"No location is provided for %s."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PATCH_LOCATION_EMPTY_ERR
/-------------------------------------------------------------------------------
32503, 0,"The location provided for %s is not a valid directory."
// *Cause: n/a
// *Action: Provide a valid %s location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.PATCH_LOCATION_NOT_VALID_DIR_ERR
/-------------------------------------------------------------------------------
32504, 0,"The file %s under the location (%s) is not readable."
// *Cause: In order to apply the opatch update to the Oracle home, all the files under the location provided should be readable.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.FILE_NOT_READABLE_UNDER_DIR_ERR
/-------------------------------------------------------------------------------
32505, 0,"The opatch location provided (%s) is not valid."
// *Cause: The opatch location provided does not have the opatch files.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.OPATCH_BINARY_NOT_EXISTS_ERR
/-------------------------------------------------------------------------------
32506, 0,"Multiple PSUs cannot be applied together."
// *Cause: n/a
// *Action: Provide a location which has single PSU.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.MULTIPLE_PSUS_NOT_ALLOWED_ERR
/-------------------------------------------------------------------------------
32507, 0,"Installer is unable to determine the version of the OPatch software at (%s)."
// *Cause: n/a
// *Action: Review %s for more details.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_OPATCH_VERSION_CHECK_FAILED
/-------------------------------------------------------------------------------
32508, 0,"Installer has detected that the version of the OPatch software available in oracle home is higher than version of the specified OPatch software."
// *Cause: The version of the OPatch software provide at %s is %s. 
//          The version of the OPatch software available at %s is %s.
// *Action: Ensure that the version of the OPatch software provided at %s is same or greater than the version of the OPatch software avialable at %s.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_OPATCH_VERSION_MISMATCH
/-------------------------------------------------------------------------------
32600, 0,"The Installer has detected that the specified Oracle home is not registered in the central inventory."
// *Cause: The -executeConfigTools flag can only be used for an Oracle home software that has been already installed using the configure or upgrade options.
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CONFIG_TOOLS_COMMON_HOME_NOT_REGISTERED
/-------------------------------------------------------------------------------
32601, 0,"The Installer has detected that there are no config tools to execute for the specified Oracle home."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CONFIG_TOOLS_COMMON_NO_TOOLS_PENDING
/-------------------------------------------------------------------------------
32602, 0,"Installer has detected that no root configuration method was defined."
// *Cause: n/a
// *Action: Specify a root configuration method.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CONFIG_TOOLS_COMMON_NO_ROOT_CONFIG_METHOD
/-------------------------------------------------------------------------------
32603, 0,"The central inventory was not detected."
// *Cause: n/a
// *Action: The -executeConfigTools flag can only be used for an Oracle home software that has been already installed using the configure or upgrade options. Ensure that the orainstRoot.sh script, from the inventory location, has been executed.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CONFIG_TOOLS_COMMON_NO_INVENTORY_UNIX
/-------------------------------------------------------------------------------
32604, 0,"The central inventory was not detected."
// *Cause: n/a
// *Action: The -executeConfigTools flag can only be used for an Oracle home software that has been already installed using the configure or upgrade options.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CONFIG_TOOLS_COMMON_NO_INVENTORY_WINDOWS
/-------------------------------------------------------------------------------
32700, 0,"The gold image creation failed. Check the install log %s for more details."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_CREATOR_JOB_FAILED
/-------------------------------------------------------------------------------
32701, 0,"The specified source home path is empty."
// *Cause: n/a
// *Action: Provide a valid source home path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_SOURCE_HOME_PATH_EMPTY
/-------------------------------------------------------------------------------
32702, 0,"The specified source home path (%s) does not exist."
// *Cause: n/a
// *Action: Provide an existent source home path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_SOURCE_HOME_NOT_EXISTS
/-------------------------------------------------------------------------------
32703, 0,"The specified source home path (%s) is not a directory."
// *Cause: n/a
// *Action: Provide a valid source home directory path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_SOURCE_HOME_NOT_DIRECTORY
/-------------------------------------------------------------------------------
32704, 0,"The specified source home path (%s) contains the following files that are not owned by the current user (%s): %s."
// *Cause: n/a
// *Action: Ensure that all the files from the source home are owned by the current user.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_SOURCE_HOME_FILES_NOT_OWNED
/-------------------------------------------------------------------------------
32705, 0,"The specified destination location path is empty."
// *Cause: n/a
// *Action: Provide a valid destination location path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_DEST_LOC_PATH_EMPTY
/-------------------------------------------------------------------------------
32706, 0,"The specified destination location (%s) path is not writable."
// *Cause: n/a
// *Action: Provide a writable destination location path.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_DEST_LOC_NOT_WRITABLE
/-------------------------------------------------------------------------------
32707, 0,"The specified destination location (%s) does not have enough free space."
// *Cause: n/a
// *Action: Provide a destination location path with at least (%s) MB of free space.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_DEST_LOC_NOT_ENOUGH_FREE_SPACE
/-------------------------------------------------------------------------------
32708, 0,"The file (%s) already exists."
// *Cause: n/a
// *Action: Provide a different name or destination location for the goldimage.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_GOLDIMAGE_ALREADY_EXISTS
/-------------------------------------------------------------------------------
32709, 0,"The zip utility (%s) does not exist."
// *Cause: n/a
// *Action: Ensure the source home is valid.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_ZIP_NOT_EXISTS
/-------------------------------------------------------------------------------
32710, 0,"The specified compression format (%s) is invalid."
// *Cause: n/a
// *Action: Provide a valid compression format.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_INVALID_FORMAT
/-------------------------------------------------------------------------------
32711, 0,"The tar utility location was not specified."
// *Cause: n/a
// *Action: Provide the tar utility location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_UNDEFINED_TAR_LOCATION
/-------------------------------------------------------------------------------
32712, 0,"The specified tar utility location (%s) does not exist."
// *Cause: n/a
// *Action: Provide a valid tar utility location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_TAR_LOCATION_NOT_EXISTS
/-------------------------------------------------------------------------------
32713, 0,"The gzip utility location was not specified."
// *Cause: n/a
// *Action: Provide the gzip utility location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_UNDEFINED_GZIP_LOCATION
/-------------------------------------------------------------------------------
32714, 0,"The specified gzip utility location (%s) does not exist."
// *Cause: n/a
// *Action: Provide a valid gzip utility location.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_GZIP_LOCATION_NOT_EXISTS
/-------------------------------------------------------------------------------
32715, 0,"The source home (%s) is not registered in the central inventory."
// *Cause: n/a
// *Action: Ensure that the source home is registered in the central inventory.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.CREATEGOLDIMAGE_COMMON_SOURCE_HOME_NOT_REGISTERED
/-------------------------------------------------------------------------------
32800, 0,"Unable to apply the installer updates (%s) because the home (%s) is locked."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_HOME_IS_LOCKED
/-------------------------------------------------------------------------------
32801, 0,"Cannot apply the installer update (%s) because it contains the following nonreadable files: %s."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_NON_READABLE_FILES
/-------------------------------------------------------------------------------
32802, 0,"Cannot apply one off (%s) with %s. Use %s instead."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_IS_ONE_OFF
/-------------------------------------------------------------------------------
32803, 0,"Cannot apply installer update (%s) because the destination path of following files is not writable: %s"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_CANNOT_COPY
/-------------------------------------------------------------------------------
32804, 0,"No value was provided for the (%s) argument. Provide the complete absolute paths of the installer updates separated by comma."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_EMPTY_PATH
/-------------------------------------------------------------------------------
32805, 0,"A path was provided empty for the (%s) argument value. Provide the complete absolute paths of the updates separated by comma."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_EMPTY_UPDATE_PATH
/-------------------------------------------------------------------------------
32806, 0,"The path (%s) provided in the (%s) argument value does not exist. Provide the complete absolute paths of the updates separated by comma."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_UPDATE_PATH_NOT_EXISTS
/-------------------------------------------------------------------------------
32807, 0,"There are duplicate paths in the (%s) argument value. Remove the duplicate paths."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_INSTALLER_UPDATES_DUPLICATE_UPDATE_PATHS
/-------------------------------------------------------------------------------
32825, 0,"Applying PSU is not supported in this platform."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_PSU_NOT_SUPPORTED_PLATFORM
/-------------------------------------------------------------------------------
32826, 0,"The software home (%s) is already registered in the central inventory. Refer to patch readme instructions on how to apply."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_PSU_HOME_REGISTERED
/-------------------------------------------------------------------------------
32827, 0,"The path of the patch for the (%s) argument value was not provided. Provide the complete absolute path of the patch."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_PSU_EMPTY_PATCH_PATH
/-------------------------------------------------------------------------------
32828, 0,"It is not allowed to apply multiple PSU to a software home. Ensure that only one PSU is provided as the (%s) argument value."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_PSU_MULTIPLE_PSU_PATCH_PATHS
/-------------------------------------------------------------------------------
32829, 0,"The path (%s) provided in the (%s) argument value does not exist. Provide the complete absolute path of the patch."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_PSU_PATCH_PATH_NOT_EXISTS
/-------------------------------------------------------------------------------
32850, 0,"The software home (%s) is already registered in the central inventory. Refer to patch readme instructions on how to apply."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_ONEOFFS_HOME_REGISTERED
/-------------------------------------------------------------------------------
32851, 0,"A path was provided empty for the (%s) argument value. Provide the complete absolute paths of the patches separated by comma."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_ONEOFFS_EMPTY_PATCH_PATH
/-------------------------------------------------------------------------------
32852, 0,"The path (%s) provided in the (%s) argument value does not exist. Provide the complete absolute paths of the patches separated by comma."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_ONEOFFS_PATCH_PATH_NOT_EXISTS
/-------------------------------------------------------------------------------
32853, 0,"There are duplicate paths in the (%s) argument value. Remove the duplicate paths."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.APPLY_ONEOFFS_DUPLICATE_PATCH_PATHS
/-------------------------------------------------------------------------------
32875, 0,"The OPatch software can only be updated while applying a PSU or one offs."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_NO_PSU_OR_ONEOFFS
/-------------------------------------------------------------------------------
32876, 0,"No value was provided for the (%s) argument."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_EMPTY_OPATCH_PATCH
/-------------------------------------------------------------------------------
32877, 0,"The path (%s) provided in the (%s) argument value does not exist. Provide the complete absolute path of the OPatch software."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_PATH_NOT_EXISTS
/-------------------------------------------------------------------------------
32878, 0,"The path specified in the (%s) argument value should be a directory."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_PATH_NOT_DIRECTORY
/-------------------------------------------------------------------------------
32879, 0,"Could not locate the (%s) file in the provided opatch location (%s). Specify a valid OPatch location."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_PATH_NOT_VALID
/-------------------------------------------------------------------------------
32880, 0,"Unable to copy the OPatch software from (%s). Ensure user (%s) has read access over the OPatch location (%s)."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_PATH_CONTAINS_NONREADABLE_FILES
/-------------------------------------------------------------------------------
32881, 0,"Could not determine the version of OPatch software from (%s)."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_COULD_NOT_GET_VERSION
/-------------------------------------------------------------------------------
32882, 0,"The version of the OPatch software provided (at %s) is: %s. This version should be same or greater than the version of the OPatch software available at %s (%s)."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.UPDATE_OPATCH_LOWER_VERSION
/-------------------------------------------------------------------------------
32901, 0,"Read-only Oracle Home initialization failed on the nodes being added. Check the addnode log for more details."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ROOHCTL_TOOL_FAILED
/-------------------------------------------------------------------------------
32910, 0,"Specified sudo user name ('%s') cant be used to execute configuration script(s)."
// *Cause: Only current installation user name is allowed to execute configuration script(s) using sudo option.
// *Action: Ensure that you specify the sudo user name same as the current installation user name.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_ROOTCONFIG_INVALID_SUDOUSER_ERR
/-------------------------------------------------------------------------------
32921, 0,"The specified Oracle base location is invalid since it contains one or more Oracle bases associated with other Oracle homes installed on this server."
// *Cause: The specified Oracle base location contains the following active Oracle bases: %s.
// *Action: Specify a location for Oracle base which is not a parent directory of an existing Oracle base.
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.INSTALL_COMMON_ORACLE_BASE_NOT_VALID
/-------------------------------------------------------------------------------
35011, 0,"E-mail address cannot be empty."
// *Cause: E-mail address for database management using e-mail notifications was empty.
// *Action: Specify an e-mail address for notification functions.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_MANAGEMENT_OPTIONS_EMAIL_ADDRESS_EMPTY
/-------------------------------------------------------------------------------
35012, 0,"Outgoing main (SMTP) server cannot be empty."
// *Cause: The value for the outgoing main (SMTP) server is empty. You must provide a SMTP server to enable database management with e-mail notifications.
// *Action: Specify an outgoing main (SMTP) server for e-mail notifications.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_MANAGEMENT_OPTIONS_EMAIL_SERVER_EMPTY
/-------------------------------------------------------------------------------
35013, 0,"Check e-mail address."
// *Cause: Either the e-mail address provided contains invalid characters, or it does not follow the standard e-mail address format.
// *Action: Specify an e-mail address that is consistent with RFC 2822 and RFC 2821 format.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_MANAGEMENT_OPTIONS_EMAIL_ADDRESS_INVALID
/-------------------------------------------------------------------------------
35014, 0,"Outgoing mail (SMTP) server is invalid."
// *Cause: The provided outgoing mail (SMTP) server was not valid. You must specify a valid SMTP server to enable database management with e-mail notifications.
// *Action: Specify an outgoing mail (SMTP) server for e-mail notifications.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_MANAGEMENT_OPTIONS_EMAIL_SERVER_INVALID
/-------------------------------------------------------------------------------
35015, 0,"Recovery location cannot be empty."
// *Cause: The database recovery backup location was empty.
// *Action: Specify a path for the database recovery backup location.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RECOVERY_OPTIONS_LOCATION_EMPTY
/-------------------------------------------------------------------------------
35016, 0,"User name cannot be empty."
// *Cause: The database recovery user name text field was empty.
// *Action: Provide the user name permitted to perform database recovery.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RECOVERY_OPTIONS_USERNAME_EMPTY
/-------------------------------------------------------------------------------
35017, 0,"Password cannot be empty."
// *Cause: The database recovery password was empty.
// *Action: Enter a password for database recovery.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RECOVERY_OPTIONS_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
35019, 0,"Invalid value specified for Management Service field."
// *Cause: The installer was unable to detect an agent home corresponding to the URL in the Management Service field.
// *Action: Specify a valid URL for Management Service field that has a corresponding agent configured on the host.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_EM_CONFIG_AGENT_INVALID
/-------------------------------------------------------------------------------
35020, 0,"Invalid value specified for Management Service field."
// *Cause: No value specified for Management Service field.
// *Action: Specify a valid Management service URL.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_EM_CONFIG_AGENT_EMPTY
/-------------------------------------------------------------------------------
35021, 0,"The recovery location is on a file system that is not shared across the cluster."
// *Cause: The database recovery area is not located on a shared file system.
// *Action: Enter a recovery area that is located on a shared file system.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RECOVERY_OPTIONS_LOC_NOT_SHARED
/-------------------------------------------------------------------------------
35022, 0,"Shared file system is not supported on windows for recovery area."
// *Cause: n/a
// *Action: Use Oracle Automatic Storage Management for recovery area.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_CFS_STORAGEOPTION_NOT_SUPPORTED_ON_WIN
/-------------------------------------------------------------------------------
35022, 0,"Empty value provided for OMS Host."
// *Cause: n/a
// *Action: Specify a valid OMS port of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.EMPTY_OMS_HOST
/-------------------------------------------------------------------------------
35023, 0,"Empty value provided for Enterprise Manager Admin user."
// *Cause: n/a
// *Action: Specify a valid value for Enterprise Manager Admin user of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.EMPTY_EM_ADMIN_USER
/-------------------------------------------------------------------------------
35024, 0,"Empty value provided for Enterprise Manager Admin password."
// *Cause: n/a
// *Action: Specify a valid value for Enterprise Manager Admin password of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.EMPTY_EM_ADMIN_PASSWORD
/-------------------------------------------------------------------------------
35025, 0,"Empty value provided for OMS Port."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.EMPTY_OMS_PORT
/-------------------------------------------------------------------------------
35026, 0,"Unable to connect to Enterprise Manager Cloud Control."
// *Cause: Invalid connection information specified.
// *Action: Specify valid connection information.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_OMS_CONNECTION_ERR
/-------------------------------------------------------------------------------
35027, 0,"Selected storage type is not valid."
// *Cause: You cannot use file system storage for backup and recovery files, with Standard Edition 2 Oracle Real Application Clusters databases.
// *Action: Choose Oracle Automatic Storage Management for database backup and recovery files.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RECOVERY_OPTIONS_FS_NOT_ALLOWED_SE_RAC
/-------------------------------------------------------------------------------
35071, 0,"Global database name cannot be left blank."
// *Cause: The Global database name was left blank.
// *Action: Specify a value for the Global database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_GDB_NAME_EMPTY_ERR
/-------------------------------------------------------------------------------
35072, 0,"The SID cannot be left blank. "
// *Cause: The Oracle system identifier (SID) was left blank.
// *Action: Specify a value for Oracle system identifier (SID).
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SID_EMPTY_ERR
/-------------------------------------------------------------------------------
35073, 0,"Invalid global database name."
// *Cause: The value given for the name portion of Global database name exceeds 30 characters. The maximum length is 30 characters.
// *Action: Enter a legal Global database name not exceeding 30 characters.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_GLOBAL_DBNAME_LENGTH_ERR
/-------------------------------------------------------------------------------
35074, 0,"The specified SID is already in use."
// *Cause: The specified SID was already registered in the oratab file (%s) on the server. The oratab file is used by Oracle products to detect existing database instances.
// *Action: Specify a unique Oracle system identifier (SID).
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SID_ALREADY_EXISTS_UNIX_ERR
/-------------------------------------------------------------------------------
35075, 0,"A database instance with the specified identifier already exists."
// *Cause: n/a
// *Action: Specify a unique Oracle system identifier (SID).
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SID_ALREADY_EXISTS_WIN_ERR
/-------------------------------------------------------------------------------
35076, 0,"The specified SID exceeds the number of characters allowed."
// *Cause: The length of the Oracle system identifier (SID) on Linux and UNIX platforms either exceeded 12 characters for single-instance installations or 8 characters for Oracle RAC installations.
// *Action: Specify an Oracle system identifier (SID) shorter than 12 characters for single-instance installation or 8 characters for Oracle RAC installation.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_SID_LENGTH_UNIX_ERR
/-------------------------------------------------------------------------------
35077, 0,"The specified SID exceeds the number of characters allowed."
// *Cause: The length of the Oracle system identifier (SID) on Windows platforms either exceeded %s characters for single-instance installations or %s characters for Oracle RAC installations.
// *Action: Specify a Windows Oracle system identifier (SID) shorter than %s characters for a single-instance installation or %s characters for an Oracle RAC installation.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_SID_LENGTH_WIN_ERR
/-------------------------------------------------------------------------------
35081, 0,"The ORACLE_HOME environment variable is currently set."
// *Cause: The ORACLE_HOME environment variable was already set. This prevents proper use of multiple Oracle homes and, as it is not required for any Oracle products to function, it will be unset in your environment.
// *Action: The ORACLE_HOME environment variable will be unset automatically.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ORACLE_HOME_ENV_UNSET_INFO
/-------------------------------------------------------------------------------
35082, 0,"Global database name did not begin with an alphabetic character."
// *Cause: The global database name began with a character that was not an alphabetic character.
// *Action: Specify a global database name that begins with an alphabetic character.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_GDB_STARTS_WITH_DIGIT_ERR
/-------------------------------------------------------------------------------
35083, 0,"The specified domain of the Global database name exceeds 128 characters."
// *Cause: The domain portion entered for Global database name exceeded 128 characters.
// *Action: Specify a domain for the Global database name that is less than 128 characters in length.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_GLOBAL_DBNAME_DOMAIN_LENGTH_ERR
/-------------------------------------------------------------------------------
35084, 0,"The specified global database name contains invalid characters."
// *Cause: The specified domain portion of the global database name contained invalid characters.
// *Action: Specify a global database name that contains only alphanumeric, underscore (_), pound (#) and period (.) characters.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_GLOBAL_DBNAME_DOMAIN_NAME_ERR
/-------------------------------------------------------------------------------
35085, 0,"Invalid value specified for %s."
// *Cause: The %s derived from %s contains one or more invalid characters.
// *Action: Remove the invalid characters (%s) from the %s or select Advanced install flow to be able to specify different %s
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SID_BADCHARS_ERR
/-------------------------------------------------------------------------------
35086, 0,"Invalid value specified for Global database name."
// *Cause: Database name cannot be empty.
// *Action: Enter a legal Global database name not exceeding 30 characters.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_GLOBAL_DBNAME_ZERO_LENGTH_ERR
/-------------------------------------------------------------------------------
35087, 0,"Invalid value specified for SID"
// *Cause: The system identifier (SID) that you entered begins with a non-alphabetic character.
// *Action: Enter a SID that begins with an alphabetic character.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SID_STARTS_WITH_DIGIT_ERR
/-------------------------------------------------------------------------------
35088, 0,"The specified Global database name exceeds %s characters."
// *Cause: The name and domain portion entered for Global database name exceeded %s characters.
// *Action: Specify the Global database name that is less than %s characters in length.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_GLOBAL_NAME_LENGTH_ERR
/-------------------------------------------------------------------------------
35089, 0,"The specified domain of the Global database name exceeds %s characters."
// *Cause: The domain portion entered for Global database name exceeded %s characters.
// *Action: Specify a domain for the Global database name that is less than %s characters in length.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INVALID_GLOBAL_NAME_DOMAIN_LENGTH_ERR
/-------------------------------------------------------------------------------
35090, 0,"The service name provided for RAC One is empty."
// *Cause: n/a
// *Action: Provide a value for the RAC One service name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.EMPTY_RACONE_SERVICE_NAME
/-------------------------------------------------------------------------------
35091, 0,"The service name provided for RAC One did not begin with an alphabetic character."
// *Cause: The service name provided for RAC One began with a character that was not an alphabetic character.
// *Action: Provide a service name which begins with an alphabetic character.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.RACONE_SERVICE_NAME_STARTS_WITH_DIGIT
/-------------------------------------------------------------------------------
35092, 0,"The service name provided for RAC One cannot be the same as the global database name."
// *Cause: n/a
// *Action: Provide a service name that is different from the global database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.RACONE_SERVICE_NAME_SAME_AS_GDB
/-------------------------------------------------------------------------------
35093, 0,"Invalid value provided for the RAC One service name."
// *Cause: The service name provided for RAC One may contain invalid characters.
// *Action: Provide a service name that consists of alphanumeric or underscore (_) characters.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.RACONE_SERVICE_NAME_BADCHARS
/-------------------------------------------------------------------------------
35094, 0,"Invalid value provided for Oracle RAC One service name."
// *Cause: The domain portion in the Oracle RAC One service name may contain invalid characters.
// *Action: Provide a service name whose network domain consists of alphanumeric characters or _ or $ or #.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.RACONE_DOMAIN_NAME_BADCHARS
/-------------------------------------------------------------------------------
35095, 0,"The specified domain of the Oracle RAC One service name exceeds 128 characters."
// *Cause: The domain portion entered for Oracle RAC One service name exceeded 128 characters.
// *Action: Specify a domain for the Oracle RAC One service name that is less than 128 characters in length.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.RACONE_DOMAIN_NAME_LENGTH_TOO_LONG
/-------------------------------------------------------------------------------
35096, 0,"The pluggable database name did not begin with an alphabetic character."
// *Cause: n/a
// *Action: Provide a pluggable database name that begins with an alphabetic character.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.PDB_STARTS_WITH_DIGIT
/-------------------------------------------------------------------------------
35097, 0,"The pluggable database name cannot be left blank."
// *Cause: n/a
// *Action: Specify a value for pluggable database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.PDB_ZERO_LENGTH
/-------------------------------------------------------------------------------
35098, 0,"Invalid pluggable database name."
// *Cause: The value provided for pluggable database name exceeds %s characters.
// *Action: Provide a value for pluggable database name not exceeding %s characters.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INVALID_PDB_LENGTH
/-------------------------------------------------------------------------------
35099, 0,"The pluggable database name provided is same as the container database name."
// *Cause: n/a
// *Action: Provide a value for pluggable database name that is different from the container database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.PDB_SAME_AS_CDB
/-------------------------------------------------------------------------------
35100, 0,"The Oracle home location contains directories or files on following remote nodes:%s."
// *Cause: n/a
// *Action: Please provide valid Oracle home location which is empty.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.RAC_NODE_LOCATION_NON_EMPTY_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
35101, 0,"Installer has detected that an Oracle Real Application Cluster (RAC) database with the given Global Database name (%s) is already configured on this server."
// *Cause: n/a
// *Action: Specify an unique Global Database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_GLOBAL_NAME_ALREADY_EXISTS
/-------------------------------------------------------------------------------
35102, 0,"Invalid value specified for Pluggable Database name."
// *Cause: The Specified Pluggable Database name is same as RAC One database service name.
// *Action: Specify an unique Pluggable Database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INVALID_PDB_NAME_ERR
/-------------------------------------------------------------------------------
35151, 0,"The current install user is not part of ORA_ASMADMIN group."
// *Cause: n/a
// *Action: Add the install user to ORA_ASMADMIN group.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_USER_NOT_IN_SYSASM_DEFAULT_NAME
/-------------------------------------------------------------------------------
35152, 0,"The current install user is not part of ORA_ASMDBA group."
// *Cause: n/a
// *Action: Add the install user to ORA_ASMDBA group.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_USER_NOT_IN_ASM_SYSDBA
/-------------------------------------------------------------------------------
35153, 0,"Virtual Account is not supported for Oracle Real Application Cluster Database."
// *Cause: n/a
// *Action: Select Existing/Built-In User option to configure Oracle Real Applicaiton Cluster Database.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_VIRTUAL_ACCOUNT_USER_NOT_SUPPORTED_ON_RAC
/-------------------------------------------------------------------------------
35154, 0,"Virtual Account is not supported on Windows 2008 Server."
// *Cause: n/a
// *Action: Select Existing/Built-In User option to continue with the installation.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_VIRTUAL_ACCOUNT_USER_NOT_SUPPORTED_ON_WIN2008
/-------------------------------------------------------------------------------
35155, 0,"Virtual Account is not supported on this version of Windows Operation System."
// *Cause: n/a
// *Action: Specify Existing or Built-In User option to continue with the installation.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_VIRTUAL_ACCOUNT_USER_NOT_SUPPORTED_ON_CURRENT_OS
/-------------------------------------------------------------------------------
35156, 0,"Virtual Account is not supported on Domain Controller"
// *Cause: n/a
// *Action: Specify a Windows User Account.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_VIRTUAL_ACCOUNT_NOT_SUPPORTED_ON_DOMAIN_CONTROLLER
/-------------------------------------------------------------------------------
35171, 0,"Target database memory (%sMB) exceeds at least one of the selected nodes available shared memory (%sMB)."
// *Cause: The total available shared memory on at least one of the selected nodes (%sMB) was less than the chosen target database memory (%sMB).
// *Action: Enter a value for the target database memory less than %sMB.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_AUTO_MEMORY_CLUSTER_LESSER_ERR
/-------------------------------------------------------------------------------
35172, 0,"Target database memory (%sMB) exceeds available shared memory (%sMB) on the system."
// *Cause: The total available shared memory (%sMB) on the system was less than the chosen target database memory (%sMB).
// *Action: Enter a value for target database memory that is less than %sMB.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_AUTO_MEMORY_SI_GREATER_ERR
/-------------------------------------------------------------------------------
35173, 0,"Invalid value for allocated memory."
// *Cause: The allocated memory specified was greater than or equal to the total memory available on the system.
// *Action: Enter a value less than the total available memory on the system for target database memory.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_MEMORY_GREATER_ERR
/-------------------------------------------------------------------------------
35174, 0,"A minimum of %sMB (%s% of total physical memory) is required."
// *Cause: Allocated memory was less than the required memory.
// *Action: Enter a memory value larger than %sMB.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_MEMORY_LESSER_ERR
/-------------------------------------------------------------------------------
35175, 0,"No value given for the allocated memory of the database."
// *Cause: A value was not specified for the allocated memory of the database.
// *Action: Specify a value for the allocated memory of the database. This corresponds to the oracle.install.db.config.starterdb.memoryLimit variable in the response file.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_MEMORY_UNDEFINED_ERR
/-------------------------------------------------------------------------------
35176, 0,"Invalid value for allocated memory."
// *Cause: The allocated memory specified was greater than 3GB.
// *Action: Enter a value less than 3GB for target database memory.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_MEMORY_GREATER_ERR_WIN32
/-------------------------------------------------------------------------------
35177, 0,"The specified SGA size is greater than the shmmax on the system. This might make database creation to fail with ORA-27125 - Unable to create shared memory segment error."
// *Cause: n/a
// *Action: Specify SGA size lesser than or equal to the shmmax on the system.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_SGA_ALLOCATED_MEMORY_GREATER_ERR
/-------------------------------------------------------------------------------
35178, 0,"The Automatic Memory Management option is not allowed when the total physical memory is greater than %sGB."
// *Cause: The current total physical memory is %sGB.
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ALLOCATED_AMM_PHYSICAL_MEMORY_GREATER_THAN_LIMIT_ERR
/-------------------------------------------------------------------------------
35179, 0,"Current available memory is less than the required available memory (%sMB) for creating the database."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_NOT_ENOUGH_MEMORY_AVAILABLE_WRN
/-------------------------------------------------------------------------------
35180, 0,"Unable to check for available memory."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_COULD_NOT_VALIDATE_AVAILABLE_MEMORY_ERR
/-------------------------------------------------------------------------------
35181, 0,"The specified SGA size is greater than the shmmax on the system. This might make database creation to fail with ORA-27125 - Unable to create shared memory segment error."
// *Cause: n/a
// *Action: Specify SGA size lesser than or equal to the shmmax on the system.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_SGA_ALLOCATED_MEMORY_GREATER_WRN
/-------------------------------------------------------------------------------
35205, 0,"Specified data file storage location is invalid."
// *Cause: The data file storage location for Oracle Real Application Clusters was not on a shared file system.
// *Action: Specify a location on a shared file system to place the data files.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_LOCATION_NOT_SHARED_ERR
/-------------------------------------------------------------------------------
35206, 0,"Directory is already in use."
// *Cause: The specified directory for the database files was already in use by the Global database name that was provided.
// *Action: Specify a different location or go to the previous screen and change the Global database name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_LOCATION_ALREADY_IN_USE_ERR
/-------------------------------------------------------------------------------
35207, 0,"The location %s you selected is on an Oracle ASM Cluster File System (ACFS)."
// *Cause: Oracle does not recommend placing Oracle Database files on ACFS. Oracle recommends that you place database files directly on the underlying Oracle ASM disk groups, as this provides optimal database performance.
// *Action: Specify a location that is not on ACFS.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.ACFS_LOCATION_NOT_ALLOWED_SI
/-------------------------------------------------------------------------------
35208, 0,"The location %s you selected is on an Oracle ASM Cluster File System (ACFS)."
// *Cause: You cannot use ACFS as shared storage for Oracle RAC.
// *Action: Specify an ASM diskgroup or any other supported shared storage location.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.ACFS_LOCATION_NOT_ALLOWED_RAC
/-------------------------------------------------------------------------------
35209, 0,"Selected storage type is not valid."
// *Cause: You cannot use file system storage with Standard Edition 2 Oracle Real Application Clusters databases.
// *Action: Choose Oracle Automatic Storage Management for database storage.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.FS_NOT_ALLOWED_SE_RAC
/-------------------------------------------------------------------------------
35210, 0,"Installing a database with storage on Oracle Automatic Storage Management (Oracle ASM) is not supported on this system."
// *Cause: Oracle Database 11g Release 2 and later supports Oracle ASM only on 64-bit Windows operating systems.
// *Action: Place database-related files on a supported file system.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ASM_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35211, 0,"Selected storage type is not valid."
// *Cause: n/a
// *Action: Choose Oracle Automatic Storage Management (ASM) or Oracle ASM Cluster File System for Real Application Cluster database storage. For Single Instance databases, local file systems can be used.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.OCFS_STORAGE_NOT_ALLOWED
/-------------------------------------------------------------------------------
35212, 0,"Insufficient disk space on this volume for the selected datafiles location."
// *Cause: The selected datafiles location was on a volume without enough disk space.
// *Action: Choose a location for datafiles that has enough space (minimum of %s) or free up space on the existing volume.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.FS_ORADATA_LOCATION_NOT_ENOUGH_SPACE
/-------------------------------------------------------------------------------
35213, 0,"Insufficient disk space on this volume for the selected recovery backup location."
// *Cause: The selected recovery backup location was on a volume without enough disk space.
// *Action: Choose a location for recovery backup that has enough space (minimum of %s) or free up space on the existing volume.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.FS_RECOVERY_LOCATION_NOT_ENOUGH_SPACE
/-------------------------------------------------------------------------------
35214, 0,"Oracle ACFS location (%s) is not supported for data files and redo logs in an Oracle Restart (Standalone Server) configuration."
// *Cause: n/a
// *Action: Specify another location.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.ACFS_LOCATION_NOT_ALLOWED_IN_SIHA
/-------------------------------------------------------------------------------
35255, 0,"Invalid password."
// *Cause: One of the Database Administrative account password was either CHANGE_ON_INSTALL or MANAGER or DBSNMP or SYSMAN or PDBADMIN.
// *Action: Enter a password that is not a former default password for these administrative users, such as CHANGE_ON_INSTALL, MANAGER, DBSNMP or SYSMAN or PDBADMIN.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SUPER_PASSWORD_NOT_ALLOWED_ERR
/-------------------------------------------------------------------------------
35256, 0,"The password for account %s is not allowed to be %s."
// *Cause: The administrative account password you entered was %s which is not allowed for %s user.
// *Action: Enter a password that is not a former default password for the %s administrative user account.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_PASSWORD_NOT_ALLOWED_ERR
/-------------------------------------------------------------------------------
35341, 0,"The installation user is not a member of the following groups: %s"
// *Cause: The installation user account must be a member of all groups required for installation.
// *Action: Ensure that the installation user is a member of the system privileges operating system groups you selected.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ADVANCED_NONMEMBER_OS_GROUPS
/-------------------------------------------------------------------------------
35342, 0,"The specified group for %s may not be defined in the system."
// *Cause: The OS group you specified as %s may not be configured on the server, or in the Network Information Service (NIS).
// *Action: Check the group name you selected, and specify a different group, or create the group on the server or in the Network Information Service.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ADVANCED_INVALID_OS_GROUP
/-------------------------------------------------------------------------------
35343, 0,"Invalid value specified for %s."
// *Cause: OS group %s specified for %s contains one or more invalid characters.
// *Action: Remove the invalid characters (%s) from %s or select an existing OS Group for %s.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_OSGROUP_BADCHARS_ERR
/-------------------------------------------------------------------------------
35344, 0,"The value is not specified for %s."
// *Cause: n/a
// *Action: Specify a valid group name for %s.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_GROUPS_CAN_NOT_BE_NULL
/-------------------------------------------------------------------------------
35351, 0,"Inconsistent versions detected."
// *Cause: The active version of Oracle Clusterware detected on the system (%s) is lower than the version of Oracle Database that you were attempting to create(%s). This is not supported.
// *Action: Upgrade Oracle Clusterware to version %s or later.Alternatively, you can choose to just install the software of the Database now and configure it after upgrading Oracle Clusterware.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_LOWER_CRS_ACTIVEVERSION
/-------------------------------------------------------------------------------
35352, 0,"There are no disk groups selected for storage and backup."
// *Cause: n/a
// *Action: Select at least one disk group for storage and backup.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.NO_ASM_DISKGROUP_SELECTED
/-------------------------------------------------------------------------------
35354, 0,"The system on which you are attempting to install Oracle %s is not part of a valid cluster."
// *Cause: Before you can install Oracle %s, you must install Oracle Grid Infrastructure (Oracle Clusterware and Oracle ASM) on all servers to create a cluster.
// *Action: Oracle Grid Infrastructure for Clusterware is not installed. Install it either from the separate installation media included in your media pack, or install it by downloading it from Electronic Product Delivery (EPD) or the Oracle Technology Network (OTN). Oracle Grid Infrastructure normally is installed by a different operating system user than the one used for Oracle Database. It may need to be installed by your system administrator. See the installation guide for more details.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.GRID_INFRASTRUCTURE_NOT_INSTALLED
/-------------------------------------------------------------------------------
35355, 0,"The node %s specified in response file is not part of the Oracle Clusterware detected."
// *Cause: The node list for the Oracle RAC database specified in the response file does not match the configuration stored in the OCR.
// *Action: Please specify a valid node or add this node %s to the cluster.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INCORRECT_NODE_LIST_PROVIDED
/-------------------------------------------------------------------------------
35356, 0,"Oracle recommends that you install the database on all nodes that are part of the Oracle Grid Infrastructure cluster."
// *Cause: All Oracle Grid Infrastructure nodes were not selected for installing Oracle RAC.
// *Action: Oracle recommends that you deploy Oracle Real Application Clusters across all Oracle Grid Infrastructure cluster nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.SUBSET_OF_NODES_SELECTED
/-------------------------------------------------------------------------------
35357, 0,"Oracle RAC is not supported on this system."
// *Cause: Oracle Database 11g Release 2 and later supports Oracle RAC only on 64-bit Windows operating systems.
// *Action: Choose the option to install a single instance database on this system.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RACDB_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35358, 0,"Oracle RAC is not supported on this system."
// *Cause: Oracle Database 11g Release 2 and later supports Oracle RAC only on 64-bit Windows operating systems.
// *Action: Migrate your existing Oracle RAC installation to a 64-bit Windows platform before upgrading it.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RACUPGRADE_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35359, 0,"Only one node is selected for database creation."
// *Cause: Only one node is selected for database creation. To protect a database against node or instance failure, at least two nodes should be selected.
// *Action: Provide at least two nodes for database creation.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSUFFICIENT_NUM_OF_NODES_PROVIDED
/-------------------------------------------------------------------------------
35360, 0,"No nodes are specified for RAC One Node install."
// *Cause: n/a
// *Action: Specify the nodes on which RAC One Node install has to be done.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.NO_CLUSTER_NODES_SPECIFIED
/-------------------------------------------------------------------------------
35361, 0,"One or more selected nodes are down."
// *Cause: One or more selected nodes cannot be reached
// *Action: Ensure that all the nodes selected for operation are reachable.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SELECTED_NODE_DOWN_ERR
/-------------------------------------------------------------------------------
35362, 0,"Admin managed database can not be installed on following set of nodes: %s"
// *Cause: Admin managed database can be created only on HUB nodes.
// *Action: Select only HUB nodes to create admin managed database. HUB nodes detected in your setup are as follows: %s
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.SELECTED_NODES_NOT_SUBSET_OF_ELIGIBLE_HUB_NODES
/-------------------------------------------------------------------------------
35363, 0,"Incompatible version of Oracle Grid Infrastructure detected."
// *Cause: The active version of Oracle Grid Infrastructure detected on the system (%s), is lower than the version of Oracle Real Application Database software that you were attempting to install(%s).This is not supported.
// *Action: If Oracle Grid Infrastructure is of older version, only Oracle Single Instance Database software can be installed. If you want to install Oracle Real Application Database software,you should upgrade Oracle Grid Infrastructure to same or higher version first.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_RAC_DB_LOWER_CRS_ACTIVEVERSION
/-------------------------------------------------------------------------------
35364, 0,"One or more nodes in the RAC have empty values as name."
// *Cause: One or more nodes in the RAC have empty values as name. A node cannot have an empty value as a name.
// *Action: Please specify a valid name for each node in the RAC.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_RAC_NODE_NAME_EMPTY_VALUES
/-------------------------------------------------------------------------------
35371, 0,"Oracle RAC databases not detected."
// *Cause: The installer could not detect any Oracle Real Application Clusters databases that could be upgraded.
// *Action: None
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_NO_DB_TO_UPGRADE
/-------------------------------------------------------------------------------
35372, 0,"Oracle RAC databases not detected."
// *Cause: The installer could not detect any Oracle Real Application Clusters databases that could be upgraded on the selected nodes.
// *Action: None
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_FOUND_NOT_CONTAINED_ON_SELECTED_NODES
/-------------------------------------------------------------------------------
35373, 0,"Single-instance database not detected"
// *Cause: The installer could not detect a single-instance database that could be upgraded.
// *Action: None
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_NO_SI_DBS_DETECTED
/-------------------------------------------------------------------------------
35375, 0,"The installer detects an older version of Oracle ASM on the system. If you intend to upgrade a database using Oracle ASM for storage, then you must first upgrade Oracle ASM. Refer to Oracle Grid Infrastructure Installation Guide for further information."
// *Cause: An earlier release version of Oracle Automatic Storage Management (Oracle ASM) is detected on the server.
// *Action: To upgrade Oracle ASM, refer to installation guides for information about Oracle Grid Infrastructure upgrade.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ONLY_UNUPGRADED_ASM_DETECTED
/-------------------------------------------------------------------------------
35376, 0,"Passsword cannot be empty for the ASMSNMP user."
// *Cause: The ASMSNMP user password was not specified.
// *Action: Provide a password for the ASMSNMP user in the password field.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ASMSNMP_PASSWORD_INVALID
/-------------------------------------------------------------------------------
35377, 0,"An earlier release version of Oracle Automatic Storage Management (Oracle ASM) exists on this system. If you intend to upgrade an earlier release database that uses Oracle ASM to Oracle Database 11g Release 2, then the upgrade will fail on 32-bit systems."
// *Cause: Oracle Database 11g Release 2 and later supports Oracle ASM only on 64-bit Windows operating systems.
// *Action: Migrate database storage from Oracle ASM to a file system before upgrading, or migrate earlier release databases versions that use Oracle ASM storage to 64-bit Windows systems. See the upgrade guide for additional information.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_UPGRADE_ASM_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35378, 0,"The installer has detected that the configured Oracle Restart software is a release version earlier than the database release you want to install. Oracle Restart must be the same release or a later release than Oracle Database."
// *Cause: The active Oracle Restart release detected on the system (%s) is an earlier release than the Oracle Database release to which you want to upgrade (%s).
// *Action: Upgrade Oracle Restart software to version %s or later.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_UPGRADE_HA_NOT_UPGRADED_WARN
/-------------------------------------------------------------------------------
35379, 0,"The installer has detected that configured Oracle Restart software is not upgraded to current install version."
// *Cause: The active version of Oracle Restart detected on the system (%s) is earlier than the version of Oracle Database that you are attempting to upgrade to (%s).
// *Action: Upgrade Oracle Restart software to version %s or later.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_UPGRADE_HA_NOT_UPGRADED_ERR
/-------------------------------------------------------------------------------
35380, 0,"Installer has detected one or more policy managed databases eligible for upgrade. If you wish to upgrade one of these policy managed databases, it is recommended that you select all the nodes of the Clusterware. This will ensure the database software availability on all the nodes."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_PMDB_FOUND_SUBSET_OF_NODES_SELECTED
/-------------------------------------------------------------------------------
35421, 0,"This option installs a single-instance database only."
// *Cause: You have chosen to perform a Desktop class install on a cluster. This option will not install Oracle RAC.
// *Action: If you want to install Oracle RAC, then choose to perform a Server class install.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_DESKTOP_CRS_PRESENT
/-------------------------------------------------------------------------------
35422, 0,"The installer has detected that configured Oracle Restart software is not upgraded to current install version. This database installation does not register the database with lower version of High Availability service."
// *Cause: The active version of Oracle Restart detected on the system(%s) is lower than the version of Oracle Database that you are attempting to install to (%s).
// *Action: Upgrade Oracle Restart software to version %s or later.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_HA_NOT_UPGRADED
/-------------------------------------------------------------------------------
35423, 0,"The installer has detected that Oracle Clusterware is not running on local node."
// *Cause: You have chosen to install Oracle RAC when Oracle Clusterware stack is not running on the local node.
// *Action: Start the Oracle Clusterware stack by running the following command as the root user from the Oracle Clusterware home (Grid home) : /bin/crsctl start crs. When the Oracle Clusterware stack is running, restart the installer and continue with the Oracle RAC installation.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_CRS_DOWN_ERR
/-------------------------------------------------------------------------------
35431, 0,"Invalid Location Specified for Oracle home."
// *Cause: The installer detects that the location you specified for the Oracle home is under an Oracle ASM Cluster File System (ACFS) mount point that is not registered with Oracle Grid Infrastructure on this server.
// *Action: Oracle Database homes can only be placed on ACFS locations registered with Oracle Grid Infrastructure software. Specify a different location for the Oracle home, or register this location with Oracle Grid Infrastructure software.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.HOME_SPECIFIED_ON_UNREGISTERED_ACFS
/-------------------------------------------------------------------------------
35432, 0,"The installer has detected that the software location you have specified contains Oracle Database software version %s. Oracle recommends that when upgrading to %s, you perform an installation of the software into a new Oracle home and then upgrade the database using the new software binaries."
// *Cause: n/a
// *Action: Perform an out-of-place upgrade. Out-of-place upgrades allow you to perform the upgrade with less downtime and more stability, due to the non-destructive nature of the software installation. 
//         
//         You can perform the upgrade and maintain the existing Oracle home location by taking a backup of the prior release Oracle home before upgrading, and moving the prior release binaries to a different location before installing the new binaries into the existing Oracle home location. Refer to the documentation for a precise set of steps to follow in this case.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_HOME_REGISTERED_ERR
/-------------------------------------------------------------------------------
35433, 0,"The installer has detected that the specified location %s is on an Oracle ASM Cluster File System that is not registered as a resource in Oracle Grid Infrastructure."
// *Cause: The specified location %s is on an Oracle ASM Cluster File System that is not registered as a resource in Oracle Grid Infrastructure.
// *Action: Register the Oracle ASM Cluster File System location that you want to use with Oracle Grid Infrastructure.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_ACFS_UNREGISTERED_WITH_SRVCTL
/-------------------------------------------------------------------------------
35434, 0,"Oracle Home cannot be on Oracle Cluster File System."
// *Cause: Oracle Home provided was detected to be on Oracle Cluster File System.
// *Action: Provide a Oracle Home location which is not on Oracle Cluster File System.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.ORACLE_HOME_ON_OCFS
/-------------------------------------------------------------------------------
35435, 0,"Oracle home of the Policy managed database on a Flex Cluster cannot be on ASM Cluster File System."
// *Cause: Oracle home location specified was detected to be on ASM Cluster File System.
// *Action: Specify an Oracle home location which is not on ASM Cluster File System.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_HOME_ON_ACFS_ON_BC_AND_PMDB
/-------------------------------------------------------------------------------
35436, 0,"Oracle home of a Software Only database installation cannot be on ASM Cluster File System when LEAF type nodes are chosen for the installation."
// *Cause: Oracle home location specified was detected to be on ASM Cluster File System and LEAF type nodes were chosen for the installation.
// *Action: Specify an Oracle home location which is not on ASM Cluster File System or remove LEAF type nodes from the selected list of nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_HOME_OF_SWONLY_ON_ACFS_USING_RIM_NODES
/-------------------------------------------------------------------------------
35437, 0,"Invalid location specified for Oracle home."
// *Cause: Installer has detected that the location specified for Oracle home is a sub directory under an Automatic Cluster File System(ACFS) mount point that does not provide permissions to your user id.
// *Action: Provide a different location for Oracle home or update the Access Control List (ACL) of the ACFS mount point.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_HOME_SPECIFIED_ON_ACFS_USER_PERMISSION
/-------------------------------------------------------------------------------
35438, 0,"The specified software location is found to be on ASM Cluster File System (ACFS) configured to be available only on one node (%s). Oracle RAC software can not be installed on a single-node ACFS."
// *Cause: n/a
// *Action: Specify a location that is on a clusterwide ACFS.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_HOME_NOT_SHARED_AND_ON_ACFS
/-------------------------------------------------------------------------------
35439, 0,"The specified base location is found to be on ASM Cluster File System (ACFS) on node (%s) and LEAF nodes were selected. Oracle RAC base location can not be installed on ACFS when LEAF nodes are selected."
// *Cause: n/a
// *Action: Specify a base location that is not on ACFS.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.LEAF_NODES_SELECTED_AND_ORACLE_BASE_ON_ACFS
/-------------------------------------------------------------------------------
35440, 0,"The Oracle home location cannot be placed on Oracle ASM Cluster File System (ACFS) when creating a database on an Oracle Restart (Standalone Server) environment."
// *Cause: The Oracle home location (%s) was detected to be on Oracle ACFS.
// *Action: Ensure the Oracle home location is not on Oracle ACFS.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.CREATE_DB_HOME_ON_ACFS_SIHA_NOT_ALLOWED
/-------------------------------------------------------------------------------
35441, 0,"The installer user does not have enough permissions to read and execute the Oracle base directory of the Oracle Grid Infrastructure."
// *Cause: n/a
// *Action: Ensure that the installer user %s has enough permissions to read and execute the Oracle base directory of the Oracle Grid Infrastructure: %s
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INVALID_ORACLE_BASE_PERMISSIONS_FOR_GI
/-------------------------------------------------------------------------------
35461, 0,"Standard Edition One (SE One) is not supported for this installation."
// *Cause: Standard Edition One (SE One) is not supported for Oracle Real Application Clusters database installation.
// *Action: Select a different Install Edition.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_EDITION_SEONE_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35462, 0,"Personal Edition is not supported for this installation."
// *Cause: You selected an Install Edition that is not supported for UNIX or Linux operating systems, and for Oracle RAC installations.
// *Action: Select a different Install Edition.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_EDITION_PE_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35463, 0,"This option is not supported on Exadata configuration."
// *Cause: n/a
// *Action: Select Enterprise Edition option.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.NON_EE_NOT_SUPPORTED_EXADATA
/-------------------------------------------------------------------------------
35464, 0,"The installer does not support installing the %s of Oracle Database."
// *Cause: n/a
// *Action: Specify a valid choice for the Oracle Database Edition.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_EDITION_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35465, 0,"Standard Edition (SE) is not supported for this installation."
// *Cause: Standard Edition (SE) is not supported for Oracle Real Application Clusters database installation.
// *Action: Select a different Install Edition.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_EDITION_SE_RAC_NOT_SUPPORTED
/-------------------------------------------------------------------------------
35481, 0,"Server pool name is not specified."
// *Cause: You have not specified a valid name for the server pool.
// *Action: Specify a valid name for server pool.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SERVERPOOL_NAME_EMPTY
/-------------------------------------------------------------------------------
35482, 0,"Server pool cardinality is invalid."
// *Cause: Server pool cardinality should be a number between %s and %s
// *Action: Specify a valid number as Server pool cardinality.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SERVERPOOL_CARDINALITY_INVALID
/-------------------------------------------------------------------------------
35483, 0,"Server pool name  is invalid."
// *Cause: The specified Server pool name contains an invalid character.
// *Action: Specify a name for server pool that contains only alphabets, numbers, or the _, #, ., $ characters.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SERVERPOOL_NAME_INVALID
/-------------------------------------------------------------------------------
35484, 0,"The Installer has detected that there are no servers available for server pool creation."
// *Cause: n/a
// *Action: Ensure that you have free servers in your cluster so that you can create a new server pool.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SERVERPOOL_NO_SERVER_AVAILABLE_FOR_SERVERPOOL_CREATION_ERROR
/-------------------------------------------------------------------------------
35485, 0,"The Installer has detected that you may not have sufficient number of free servers to satisfy the cardinality specified to create a new server pool. Policy-managed database creation may fail."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SERVERPOOL_NOT_ENOUGH_SERVERS_AVAILABLE_FOR_ALLOCATION_WARN
/-------------------------------------------------------------------------------
35491, 0,"There are no Hub nodes detected in this cluster"
// *Cause: Admin-managed Real Application Cluster database can be deployed only on Hub nodes.
// *Action: Choose Policy-managed Real Application Cluster database option if there are no Hub nodes in the cluster
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_NO_HUB_NODES
/-------------------------------------------------------------------------------
35492, 0,"Local node is not a Hub node"
// *Cause: Local Node has to be a Hub node in order to deploy a Admin-managed Real Application Cluster database.
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_LOCALNODE_NOT_HUB_NODE
/-------------------------------------------------------------------------------
35493, 0,"The selected node(s) are already assigned to existing server pool(s), which are currently hosting other Policy-managed Oracle Real Application Cluster databases configured on this cluster."
// *Cause: The node(s) %s are already part of a server pool(s).
// *Action: Specify a different node(s) for creating a database or add more node(s) to the cluster.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_NO_NODE_AVAILABLE_FOR_DATABASE_CREATION_ERROR
/-------------------------------------------------------------------------------
35501, 0,"Nodes %s specified for addnode are not part of the Clusterware yet. Ensure that the configuration scripts from the Grid Infrastructure home are executed after the database addnode is performed."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_ADDNODE_NOT_PART_OF_THE_CLUSTER
/-------------------------------------------------------------------------------
35502, 0,"Cluster nodes %s are already having a database software in the same location as local node."
// *Cause: Nodes are already having a database software.
// *Action: Specify -noCopy option to addnode to have the configuration done without the software copy to these nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_ADDNODE_ALREADY_WITH_DATABASE_HOME
/-------------------------------------------------------------------------------
35503, 0,"Nodes %s are duplicately specified for addnode operation."
// *Cause: n/a
// *Action: Ensure that the duplicate entries of the specified nodes are removed.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_ADDNODE_DUPLICATE_NODE_ENTRIES
/-------------------------------------------------------------------------------
35504, 0,"Node name cannot be left unfilled."
// *Cause: n/a
// *Action: Enter a valid node name.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_ADDNODE_NODE_NAME_BLANK
/-------------------------------------------------------------------------------
35505, 0,"You have selected a non-secure installation and configuration of Oracle software on Windows. Starting with 12c version of Oracle Database, it is recommended to create a named user to be the owner of the Oracle Home."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.common.resource.CommonErrorCode.WINSECURITY_DECLINE_WARNING
/-------------------------------------------------------------------------------
35505, 0,"Oracle RAC software location can not be installed on ASM Cluster File System (ACFS) when LEAF nodes are selected. You have selected following LEAF nodes:
//         %s"
// *Cause: n/a
// *Action: Select only HUB nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_ADDNODE_OH_ON_ACFS_AND_LEAF_NODE_SELECTED
/-------------------------------------------------------------------------------
35506, 0,"Oracle RAC software location can only be installed on ASM Cluster File System (ACFS) on HUB nodes. You have selected following nodes that are not detected to be configured as HUB nodes:
//         %s"
// *Cause: n/a
// *Action: Ensure that following nodes %s are configured, or meant to be later configured, as HUB nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_ADDNODE_OH_ON_ACFS_AND_UNCONFIGURED_NODE_SELECTED
/-------------------------------------------------------------------------------
35810, 0,"You have selected to use Built-in Account for installation and configuration of Oracle Home. Oracle recommends that you specify a Windows User Account with limited privilege to install and configure a secure Oracle Home."
// *Cause: n/a
// *Action: Specify a Windows User Account.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DB_BUILTIN_WRN
/-------------------------------------------------------------------------------
35850, 0,"The installer has detected that you are trying to install a cluster database from a leaf node of a Flex cluster."
// *Cause: n/a
// *Action: Please install the cluster database from a hub node of this Flex cluster.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_LOCALNODE_LEAF_NODE
/-------------------------------------------------------------------------------
35851, 0,"Oracle Database cannot be configured on Member Cluster for Applications."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_NOT_ALLOWED_ON_APP_CLUSTER
/-------------------------------------------------------------------------------
35852, 0,"RAC One install option is not allowed."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RACONE_NOT_ALLOWED
/-------------------------------------------------------------------------------
35853, 0,"Oracle RAC or RAC One Database option is not supported on Oracle Restart configurations."
// *Cause: n/a
// *Action: Choose the option to install a single instance database on this system.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_RACDB_NOT_SUPPORTED_ON_SIHA_HOME
/-------------------------------------------------------------------------------
35900, 0,"The specified source home path (%s) does not correspond to a valid Oracle Database software home."
// *Cause: n/a
// *Action: Provide a valid Oracle Database software home as source home.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.CREATEGOLDIMAGE_DB_NOT_VALID_SOURCE_HOME
/-------------------------------------------------------------------------------
35950, 0,"Installer has detected an invalid entry in the central inventory corresponding to Oracle home (%s)."
// *Cause: n/a
// *Action: Choose a different location as Oracle home.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DBSETUP_INVALID_HOME_REGISTERED
/-------------------------------------------------------------------------------
35951, 0,"The installer has detected that there are files in the Oracle Database home (%s) which are not owned by the user (%s)."
// *Cause: Following files are not owned by the user (%s):
//         %s
// *Action: Ensure that the files listed above are owned by the user (%s).
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DBSETUP_GOLDIMAGE_FILES_OWNER_MISMATCH
/-------------------------------------------------------------------------------
35952, 0,"The installer has detected that the Oracle Database home software at (%s) is not complete."
// *Cause: Following files are missing:
//         %s
// *Action: Ensure that the Oracle Database home at (%s) includes the files listed above.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DBSETUP_GOLDIMAGE_FILES_MISSING
/-------------------------------------------------------------------------------
35953, 0,"The installer has detected that the Oracle home location provided in the command line is not correct."
// *Cause: The Oracle home value set in the command line %s is not textually the same as %s (identified by the installer from the executed DB Setup command).
// *Action: Specify the correct Oracle home location through the ORACLE_HOME command line variable. If you do not set it, the Installer will specify the right one.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DBSETUP_WRONG_CMDLINE_HOME
/-------------------------------------------------------------------------------
35954, 0,"The installer has detected that the Oracle home location provided in the response file is not correct."
// *Cause: The Database Oracle home is the location from where the installer is executed. It has been detected that the value set in the response file is different (%s). Value expected is: %s
// *Action: It is not required to specify ORACLE_HOME in the response file for Database installation. Alternatively, set it to the location of the installer (%s).
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DBSETUP_WRONG_RSPFILE_HOME
/-------------------------------------------------------------------------------
35955, 0,"The Database software home (%s) is already registered in the central inventory. This tool can only be used in a non-registered Database home."
// *Cause: n/a
// *Action: Choose a different location as Oracle home.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.DBSETUP_HOME_ALREADY_REGISTERED
/-------------------------------------------------------------------------------
35970, 0,"Specified install option (%s) is invalid."
// *Cause: n/a
// *Action: Provide a valid install option.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_INSTALL_OPTION_INVALID
/-------------------------------------------------------------------------------
35971, 0,"Specifying a list of cluster nodes is only applicable for software only installation option."
// *Cause: n/a
// *Action: Do not specify a list of cluster nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SELECTED_NODES_LIST_INVALID_ERR
/-------------------------------------------------------------------------------
35972, 0,"Specifying a list of cluster nodes is only applicable for software only installation option. The provided list will be ignored and the selected install option will be performed on the local node only."
// *Cause: n/a
// *Action: Do not specify a list of cluster nodes.
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_SELECTED_NODES_LIST_INVALID_WRN
/-------------------------------------------------------------------------------
35980, 0,"Installer encountered an error while trying to read password from the wallet file in the location specified."
// *Cause: n/a
// *Action: Review the additional error information below and ensure a valid wallet file and/or wallet password is specified to the installer..
// *FQN: oracle.install.ivw.db.resource.DBErrorCode.INSTALL_DB_WALLET_PASSWORD_INSTALLEXCEPTION
/-------------------------------------------------------------------------------
40102, 0,"The software location for Oracle Grid Infrastructure is specified under the users home directory."
// *Cause: It is not recommended to put the software under users home directory as the product configuration may change the ownership of the software location to root user.
// *Action: Specify a location that is not under users home directory.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HOME_IN_USER_HOME_WRN
/-------------------------------------------------------------------------------
40103, 0,"The software location specified is on an OCFS2 formatted partition, which is not supported for product configuration."
// *Cause: n/a
// *Action: Specify a location that is not on an OCFS2 formatted partition.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_HOME_ON_OCFS2
/-------------------------------------------------------------------------------
40104, 0,"The software location specified is on an OCFS2 formatted partition, which may not be a supported format for a clustered product configuration."
// *Cause: n/a
// *Action: Specify a location that is not on an OCFS2 formatted partition.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SOFTWARE_HOME_ON_OCFS2
/-------------------------------------------------------------------------------
40105, 0,"The location specified for Oracle Base is invalid."
// *Cause: The installer has detected that you have configured Oracle Grid Infrastructure software on this server, and that the Oracle base you provided for this install is not the same as the existing Oracle Grid Infrastructure software Oracle base.
// *Action: Provide the same Oracle base location for this Oracle Grid Infrastructure installation that is used for the existing Oracle Grid Infrastructure.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BASE_INVALID_FOR_GI_UPGRADE_ERR
/-------------------------------------------------------------------------------
40106, 0,"Invalid location specified for Grid home."
// *Cause: The installer has detected that the Oracle home location you provided is on an Oracle ASM Cluster File System (ACFS) mountpoint. You cannot place Oracle Grid Infrastructure binaries on an ACFS mount point.
// *Action: Specify a Grid home location that is on a location other than an ACFS mount point.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HOME_SPECIFIED_ON_ACFS
/-------------------------------------------------------------------------------
40107, 0,"It is recommended that you choose a location with sufficient disk space to accommodate installation of future patches."
// *Cause: The selected Oracle home was on a volume without enough disk space for future patching.
// *Action: Choose a location for Oracle home that has enough space (minimum of %sMB) or free up space on the existing volume.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HOME_NOT_ENOUGH_FREESPACE_WARN
/-------------------------------------------------------------------------------
40108, 0,"The software location specified is on a temporary file system."
// *Cause: n/a
// *Action: Specify a location that is not on a temporary file system.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_HOME_ON_TMPFS
/-------------------------------------------------------------------------------
40109, 0,"The specified Oracle Base location is not empty on this server."
// *Cause: n/a
// *Action: Specify an empty location for Oracle Base.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LOCALHOST_BASE_NOT_EMPTY
/-------------------------------------------------------------------------------
40110, 0,"The specified Oracle Base location is not empty on following nodes: %s."
// *Cause: n/a
// *Action: Specify an empty location for Oracle Base.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODES_BASE_NOT_EMPTY
/-------------------------------------------------------------------------------
40111, 0,"The specified Oracle Base location is not empty on following nodes: %s."
// *Cause: n/a
// *Action: Specify an empty location for Oracle Base.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ADDNODE_CRS_ORACLE_BASE_NOT_EMPTY_IN_NEW_NODES
/-------------------------------------------------------------------------------
40112, 0,"The Oracle Grid Configuration Wizard has detected that the software location is on an OCFS2 formatted partition, which is not supported for product configuration."
// *Cause: n/a
// *Action: Install the software at location that is not on an OCFS2 formatted partition before proceeding with Oracle Grid Configuration Wizard.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_CONFIG_ON_OCFS2
/-------------------------------------------------------------------------------
40401, 0,"Oracle Grid Infrastructure is already configured on the system."
// *Cause: Only one instance of Oracle Grid Infrastructure software can be configured on a system.
// *Action: One of the following actions may be considered. 
//         
//         1. Choose Upgrade option to upgrade Oracle Grid Infrastructure.
//         
//          2. It is possible that previous configuration of Oracle Grid Infrastructure was not cleaned properly. Refer to documentation on how to deinstall the product. After performing the deinstall, Oracle Grid Infarstructure can be installed and configured.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ALREADY_PRESENT_ERR
/-------------------------------------------------------------------------------
40404, 0,"Oracle Grid Infrastructure is already configured on the system."
// *Cause: Only one instance of Oracle Grid Infrastructure software can be configured on a system.
// *Action: One of the following actions may be considered. 
//         
//         1. Choose Upgrade option to upgrade Oracle Grid Infrastructure.
//         
//          2. It is possible that previous configuration of Oracle Grid Infrastructure was not cleaned properly. Refer to documentation on how to deinstall the product. After performing the deinstall, Oracle Grid Infarstructure can be installed and configured.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.HA_CUR_GI_ALREADY_PRESENT_ERR
/-------------------------------------------------------------------------------
40405, 0,"Oracle Grid Infrastructure is already configured on the system."
// *Cause: Only one instance of Oracle Grid Infrastructure software can be configured on a system.
// *Action: One of the following actions may be considered. 
//         
//         1. Choose Upgrade option to upgrade Oracle Grid Infrastructure.
//         
//          2. It is possible that previous configuration of Oracle Grid Infrastructure was not cleaned properly. Refer to documentation on how to deinstall the product. After performing the deinstall, Oracle Grid Infarstructure can be installed and configured.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.HA_OLD_GI_ALREADY_PRESENT_ERR
/-------------------------------------------------------------------------------
40406, 0,"Oracle Grid Infrastructure software is either not configured, or is already configured with the version that cannot be upgraded with this tool."
// *Cause: The installer is unable to detect any existing Oracle Clusterware or Oracle ASM installation to upgrade.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_NOT_PRESENT_ERR
/-------------------------------------------------------------------------------
40407, 0,"Oracle ASM instance is already configured on the system."
// *Cause: Only one Oracle ASM instance can be configured on a system.
// *Action: Select the Software Only installation of Oracle Grid Infrastructure into a new home, and configure Oracle ASM in the new home after installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HA_ASM_ALREADY_PRESENT_ERR
/-------------------------------------------------------------------------------
40409, 0,"The installer has detected local Cluster Synchronization Services (CSS) configured on this host. Local CSS is running from: %s."
// *Cause: You selected to install and configure an Oracle Grid Infrastructure installation (Oracle Clusterware and Oracle ASM). However, Oracle Clusterware cannot be configured on a server with a configured CSS daemon.
// *Action: Deconfigure and delete the existing local CSS daemon, and then restart the installer.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.LOCAL_OLD_GI_CSS_ALREADY_PRESENT_ERR
/-------------------------------------------------------------------------------
40410, 0,"Oracle Grid Infrastructure is already configured on the system."
// *Cause: Only one instance of Oracle Grid Infrastructure software can be configured on a system.
// *Action: One of the following actions may be considered. 
//         
//         1. Choose Upgrade option to upgrade Oracle Grid Infrastructure.
//         
//          2. It is possible that previous configuration of Oracle Grid Infrastructure was not cleaned properly. Refer to documentation on how to deinstall the product. After performing the deinstall, Oracle Grid Infarstructure can be installed and configured.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.LOCAL_CUR_GI_CSS_ALREADY_PRESENT_ERR
/-------------------------------------------------------------------------------
40412, 0,"This server does not meet network requirements to install and configure this product."
// *Cause: None of the network interfaces detected on this system supports IPv4 protocol.
// *Action: Configure at least one of the public interfaces available on this system to support IPv4.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_IPV4_NOT_PRESENT_ERR
/-------------------------------------------------------------------------------
40413, 0,"Existing Oracle ASM instance detected."
// *Cause: The installer has detected that an earlier version of Oracle ASM is configured on the server.
// *Action: If you intend to upgrade Oracle ASM as part of this installation, then you must shut down the Oracle ASM instance before proceeding. Shut down any database instances using Oracle ASM before shutting down the Oracle ASM instance.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.UPGRADE_CRS_ASM_SHUTDOWN
/-------------------------------------------------------------------------------
40414, 0,"The installer has detected an unused Oracle Cluster Registry (OCR) location pointer file (%s) on the system. "
// *Cause: OCR location pointer file (%s) is left behind from a previous installation.
// *Action: Delete the OCR location pointer file (%s) and restart the installer. 
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.OCRLOC_FILE_FOUND
/-------------------------------------------------------------------------------
40415, 0,"Upgrade database instances using Oracle Automatic Storage Management (Oracle ASM)."
// *Cause: The installer has detected the presence of Oracle Database release %s instances.
// *Action: If you intend to upgrade Oracle ASM as part of this upgrade, then you must upgrade Oracle Database instances using Oracle ASM to release %s or later before proceeding with upgrading Oracle ASM.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ASM_NOT_COMPATIBLE_TO_UPGRADE
/-------------------------------------------------------------------------------
40416, 0,"The installer has detected that the version of the configured instance of Grid Infrastructure is not compatible for upgrading to this release of Grid Infrastructure."
// *Cause: Oracle Clusterware or Oracle ASM release %s or above is needed to upgrade to Oracle Grid Infrastructure.
// *Action: Install the patchset to upgrade the configured instance of Grid Infrastructure to version %s or higher.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_NOT_COMPATIBLE_TO_UPGRADE
/-------------------------------------------------------------------------------
40417, 0,"The installer has detected an unused Oracle Cluster Registry (OCR) location registry key (%s) on the system. "
// *Cause: OCR location registry key (%s) is left behind from a previous installation.
// *Action: Delete the OCR location registry key (%s) and restart the installer. 
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.OCRLOC_REGISTRY_KEY_FOUND
/-------------------------------------------------------------------------------
40418, 0,"The installer has detected that Oracle Clusterware is not running on local node."
// *Cause: The installer  has detected that the Oracle Clusterware stack on the local node is not running.
// *Action: Either run the Installer on the node where Oracle Clusterware stack is running or open a terminal, log in as root or Administrator, change directory to the Oracle Clusterware home (Grid home), and start Oracle Clusterware by entering this command: crsctl start crs
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_STACK_NOT_UP_ERR
/-------------------------------------------------------------------------------
40419, 0,"The installer has detected that the configured Oracle Automatic Storage Management (Oracle ASM) release is earlier than the Oracle Grid Infrastructure release."
// *Cause: Installer has detected that configured version of Automatic Storage Management software is lower than the Grid Infrastructure software version.
// *Action: Open a terminal, log in as the Grid Infrastructure installation owner, change directory to the Grid home, and run ASMCA to upgrade Oracle ASM.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_ASM_NOT_UPGRADED_ERR
/-------------------------------------------------------------------------------
40420, 0,"The current installation user is not the same as the installation owner of the existing Oracle Grid Infrastructure software."
// *Cause: The installer has detected that the current installation user (%s) is not the same as the existing Oracle Grid Infrastructure software user (%s). To upgrade the existing software, run the installer as the user owning the Oracle Grid Infrastructure home.
// *Action: Restart the installation as the user that owns the existing Grid home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.UPGRADE_GI_USER_MISMATCH_ERR
/-------------------------------------------------------------------------------
40421, 0,"The installer cannot detect the owner of the existing Oracle Grid Infrastructure home (Grid home)."
// *Cause: The installer is unable to detect the owner of the existing Grid home. To upgrade the software, you must run the installer as the user owning the Grid home.
// *Action: Run the installer as the user owning the existing Grid home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.UPGRADE_GI_UNABLE_TO_GET_CRS_USER_WARN
/-------------------------------------------------------------------------------
40422, 0,"The installer has detected that the configured instance of Grid Infrastructure is not compatible for upgrading to this release of Grid Infrastructure."
// *Cause: Patchset for the bug %s is not installed on the configured instance of the Grid Infrastructure home.
// *Action: Install the patchset for the bug %s on all the nodes to upgrade the configured instance of Grid Infrastructure to current version.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ONEOFF_NOT_INSTALLED_TO_UPGRADE
/-------------------------------------------------------------------------------
40423, 0,"The Oracle Cluster Registry and the Voting disk are located on an Oracle Cluster File System."
// *Cause: n/a
// *Action: Migrate the location of Oracle Cluster Registry and Voting disk to Automatic Storage Management (ASM) storage before continuing with upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.OCR_VDSK_ON_OCFS
/-------------------------------------------------------------------------------
40424, 0,"Installer has detected that the Oracle Cluster Registry (OCR) locations of existing clusterware configuration are on a block or character storage device.The OCR locations cannot be on a block or character storage device during upgrade."
// *Cause: n/a
// *Action: Migrate the OCR locations of existing clusterware configuration to one of the supported storage medium. Refer to the documentation for information about migrating the OCR to supported storage types.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_OCR_ON_RAW
/-------------------------------------------------------------------------------
40425, 0,"Installer has detected that the Oracle Cluster Registry (OCR) is not managed through Automatic Storage management (ASM)."
// *Cause: n/a
// *Action: Migrate the OCR to be managed through ASM. Refer to the documentation for information about migrating the OCR to supported storage types.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_OCR_NOT_ON_ASM
/-------------------------------------------------------------------------------
40426, 0,"Grid installation option has not been specified."
// *Cause: n/a
// *Action: Specify the valid installation option.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OPTION_NOT_SELECTED
/-------------------------------------------------------------------------------
40427, 0,"The installer has detected that you are trying to upgrade from a leaf node of an Oracle Flex cluster."
// *Cause: The upgrade action of an Oracle Flex cluster is not allowed from a leaf node.
// *Action: Please upgrade from a hub node of this Oracle Flex cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_FROM_LEAF_NODE
/-------------------------------------------------------------------------------
40428, 0,"The installer has detected that Oracle Grid Infrastructure of version %s is already configured on this server."
// *Cause: Only a lower version of Oracle Grid Infrastructure can be upgraded to the current version.
// *Action: Select one of the other option to continue with the installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_SAME_VERSION_PRESENT_ERR
/-------------------------------------------------------------------------------
40429, 0,"The installer has detected that the OCR and Voting Disks locations of the existing Oracle Grid Infrastructure (GI) are not on Oracle Automatic Storage Management (Oracle ASM) storage."
// *Cause: n/a
// *Action: To upgrade the Oracle GI, the OCR and Voting Disks locations must be on Oracle ASM storage.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.UPGRADE_GI_CRS_IN_FS
/-------------------------------------------------------------------------------
40430, 0,"The installer has detected that the configured Orace Grid Infraestructure version %s does not match current home version %s."
// *Cause: n/a
// *Action: Ensure the configured Oracle GI is valid.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_NOT_SAME_VERSION_PRESENT_ERR
/-------------------------------------------------------------------------------
40431, 0,"The installer has detected that you are trying to add more nodes from a leaf node of an Oracle Flex cluster."
// *Cause: The add node action of an Oracle Flex cluster is not allowed from a leaf node.
// *Action: Please add more nodes from a hub node of this Oracle Flex cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADDNODE_FROM_LEAF_NODE
/-------------------------------------------------------------------------------
40432, 0,"The current installation user is not the same as the installation owner of the existing Oracle Grid Infrastructure software."
// *Cause: The installer has detected that the current installation user (%s) is not the same as the existing Oracle Grid Infrastructure software user (%s). To add more nodes to the existing cluster, run the installer as the user owning the Oracle Grid Infrastructure home.
// *Action: Restart the installation as the user that owns the existing Grid home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ADDNODE_GI_USER_MISMATCH_ERR
/-------------------------------------------------------------------------------
40433, 0,"The installer cannot detect the owner of the existing Oracle Grid Infrastructure home (Grid home)."
// *Cause: The installer is unable to detect the owner of the existing Grid home. To add more nodes to the existing cluster, you must run the installer as the user owning the Grid home.
// *Action: Run the installer as the user owning the existing Grid home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ADDNODE_GI_UNABLE_TO_GET_CRS_USER_WARN
/-------------------------------------------------------------------------------
40434, 0,"The installer has detected that Oracle Clusterware stack from home (%s) is down."
// *Cause: n/a
// *Action: To add more nodes, ensure the Oracle Clusterware stack from home (%s) is up.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ADDNODE_GI_NOT_RUNNING_IN_CURRENT_HOME
/-------------------------------------------------------------------------------
40435, 0,"Cannot upgrade an Oracle Grid Infrastructure for a Cluster that is using client ASM storage."
// *Cause: n/a
// *Action: Ensure the cluster is not using client ASM storage.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_ASM_CLIENT_NOT_ALLOWED
/-------------------------------------------------------------------------------
40436, 0,"Installer has detected an earlier version of Oracle Automatic Storage Management (ASM) Instance configured. Before proceeding with the upgrade you must shutdown all Oracle Databases that are using Oracle ASM for storage.
//         
//         You may ignore this message and continue with the upgrade, if the database(s) are already in shutdown state."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HA_UPGRADE_ASM_SHUTDOWN
/-------------------------------------------------------------------------------
40437, 0,"Oracle Grid Infrastructure is not supported on Windows domain controller."
// *Cause: Installing Oracle Grid Infrastructure software on servers that are configured as Windows domain controllers is not supported.
// *Action: Oracle Grid Infrastruture should not be installed on a Server that is configured as Windows domain controller.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_GI_NOT_SUPPORTED_ON_DOMAIN_CONTROLLER
/-------------------------------------------------------------------------------
40438, 0,"ASM Instance is not detected on this server."
// *Cause: n/a
// *Action: Use ASMCA(Automatic Storage Management Configuration Assistant) to configure ASM instance and create diskgroups for the upgrade to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_INSTANCE_NOT_FOUND
/-------------------------------------------------------------------------------
40439, 0,"Following Oracle Member Clusters would be incompatible when this Oracle Domain Services Cluster(DSC) is upgraded: %s."
// *Cause: n/a
// *Action: To proceed, either upgrade the Oracle Member Clusters or remove their configuration information from the Oracle Domain Services Cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DSC_UPGRADE_MC_NOT_COMPATIBLE_ERR
/-------------------------------------------------------------------------------
40440, 0,"Installer has detected the configured version %s of Oracle clusterware is not matching with the current version %s."
// *Cause: n/a
// *Action: To proceed with the remove node, ensure the active version of Oracle clusterware is same as the current version %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DELETE_NODE_NOT_COMPATIBLE_ERR
/-------------------------------------------------------------------------------
40441, 0,"The installer has detected that Oracle Clusterware stack from home (%s) is down."
// *Cause: n/a
// *Action: To remove nodes, ensure the Oracle Clusterware stack from home (%s) is up.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DELETE_NODE_GI_NOT_RUNNING_IN_CURRENT_HOME
/-------------------------------------------------------------------------------
40442, 0,"Installer has detected that the cluster contains active LEAF nodes. Upgrade cannot continue."
// *Cause: n/a
// *Action: A cluster with HUB nodes only can be upgraded.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_CLUSTER_WITH_LEAF_NODES_NOT_ALLOWED
/-------------------------------------------------------------------------------
40443, 0,"Installer has detected that the following Member Clusters are of a lower version than the version you are upgrading this Domain Services Cluster to: %s. It is recommended to first updrage the Member Clusters, to this version, before proceeding with upgrading the Domain Services Cluster."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DSC_UPGRADE_WITH_OLDER_MC_NOT_ALLOWED
/-------------------------------------------------------------------------------
40601, 0,"The Intelligent Platform Management Interface (IPMI) driver is not installed on one or more of the following nodes: %s."
// *Cause: The installer has detected that Intelligent Platform Management Interface (IPMI) drivers were not installed on all the nodes that you indicated should be part of the cluster. Cluster Synchronization Service (CSS) requires this driver, as it interacts with the IPMI driver to ensure cluster integrity.
// *Action: Download the IPMI driver from the hardware vendor website, and ensure that the driver is installed and configured on all the nodes, so that installation can continue.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_IPMI_DRV_NOT_CFG_ERR
/-------------------------------------------------------------------------------
40602, 0,"Baseboard Management Controller (BMC) user name is not specified."
// *Cause: n/a
// *Action: You have selected Intelligent Platform Management Interface (IPMI) to use for failure isolation support. The installer requires the Baseboard Management Controller (BMC) user name to proceed with configuration. Enter the BMC user name that has privileges to interact with the IPMI-compliant hardware.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_IPMI_USERNAME_EMPTY_ERR
/-------------------------------------------------------------------------------
40603, 0,"The specified value for the user name contained one or more invalid characters."
// *Cause: n/a
// *Action: Specify a valid BMC user name. The Baseboard Management Controller (BMC) user name can only contain lower or uppercase alphanumeric characters (a - z, A - Z, 0 - 9), hyphen(-), period(.) and underscore(_).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_IPMI_USERNAME_BADCHAR_ERR
/-------------------------------------------------------------------------------
40604, 0,"The Baseboard Management Controller (BMC) password is not specified."
// *Cause: n/a
// *Action: Specify the Baseboard Management Controller (BMC) password in order to configure IPMI for Failure Isolation for the cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_IPMI_PASSWORD_EMPTY_ERR
/-------------------------------------------------------------------------------
40605, 0,"The Intelligent Platform Management Interface (IPMI) driver is not installed on the following nodes: 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The installer detected that Intelligent Platform Management Interface (IPMI) drivers were not installed on all the nodes that you indicated should be part of the cluster. Cluster Synchronization Service (CSS) requires this driver, as it interacts with the IPMI driver to ensure cluster integrity.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_IPMI_DRV_NOT_CFG_ERR
/-------------------------------------------------------------------------------
40701, 0,"The specified value for the Grid Naming Service (GNS) subdomain contains one or more invalid characters."
// *Cause: n/a
// *Action: Enter a valid GNS subdomain name. Valid characters for the GNS subdomain can be any combination of lower or uppercase alphanumeric characters (a - z, A - Z, 0 - 9), hyphen(-), and period(.).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_GNS_DOMAIN_ERR
/-------------------------------------------------------------------------------
40702, 0,"Specify a value for Grid Naming Service (GNS) subdomain."
// *Cause: n/a
// *Action: A Grid Naming Service (GNS) subdomain is mandatory when configuring DHCP assigned virtual IPs to the nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BLANK_GNS_DOMAIN_ERR
/-------------------------------------------------------------------------------
40704, 0,"GNS subdomain cannot be resolved."
// *Cause: The GNS subdomain could not be resolved using TCP/IP host name lookup.
// *Action: Specify a subdomain that can be resolved.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_GNS_DOMAIN_ERR
/-------------------------------------------------------------------------------
40705, 0,"Invalid characters in Grid Naming Service (GNS) Virtual IP Address."
// *Cause: The specified value for the GNS virtual IP address contained one or more invalid characters.
// *Action: Enter a valid value for the GNS virtual IP Address. Valid characters for GNS virtual IP addresses can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), hyphen(-), and period(.).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_GNS_VIP_ERR
/-------------------------------------------------------------------------------
40706, 0,"Grid Naming Service (GNS) Virtual IP Address is blank."
// *Cause: n/a
// *Action: Provide a valid value for the GNS virtual IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BLANK_GNS_VIP_ERR
/-------------------------------------------------------------------------------
40707, 0,"Grid Naming Service (GNS) Virtual IP Address %s cannot be resolved."
// *Cause: The GNS virtual IP address could not be resolved using TCP/IP host name lookup.
// *Action: Specify a valid GNS virtual IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_GNS_VIP_ERR
/-------------------------------------------------------------------------------
40708, 0,"Grid Naming Service (GNS) Virtual IP Address %s already assigned to another system."
// *Cause: The specified GNS virtual host name could not be resolved to an IP address. This may occur if the IP address is in use on another cluster, or the IP address has not been registered to this name in the Domain Name System (DNS).
// *Action: Ensure that you have entered a virtual host name that is not in use. If you continue to receive an error, then contact your network administrator for assistance.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GNS_VIP_LIVE_ERR
/-------------------------------------------------------------------------------
40709, 0,"The specified value for Cluster name (%s) contains invalid characters."
// *Cause: n/a
// *Action: Specify a valid value for the cluster name. Valid characters can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen(-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_CLUSTER_NAME_ERR
/-------------------------------------------------------------------------------
40710, 0,"Specified cluster name (%s) does not start with a letter."
// *Cause: n/a
// *Action: Specify a value for the cluster name that starts with a letter
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOESNOT_STARTWITH_ALPHABET_CLUSTER_NAME_ERR
/-------------------------------------------------------------------------------
40711, 0,"Cluster Name is blank."
// *Cause: n/a
// *Action: Specify a valid value for the cluster name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BLANK_CLUSTER_NAME_ERR
/-------------------------------------------------------------------------------
40712, 0,"The specified value for the cluster name (%s) is too long."
// *Cause: n/a
// *Action: Specify a cluster name that is %s or fewer characters in length.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXCEED_MAXSIZE_CLUSTER_NAME_ERR
/-------------------------------------------------------------------------------
40713, 0,"Installer will use %s as cluster name."
// *Cause: The cluster name cannot be longer than %s characters. With the Typical install type, the host portion of the SCAN is used as the cluster name. If that portion is longer than %s characters, then the installer truncates the cluster name to %s characters.
// *Action: If you want to use a specific name for the cluster, then provide a name no greater than %s characters, or select the Advanced installation type.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXCEED_MAXSIZE_SCAN_NAME_TYPICAL_ERR
/-------------------------------------------------------------------------------
40714, 0,"Single Client Access Name (SCAN) Name: %s contains invalid characters."
// *Cause: The name you provided as the SCAN contained one or more invalid characters.
// *Action: Specify a valid name for the SCAN. Valid characters can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), hyphen(-), and period(.).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_SCAN_NAME_ERR
/-------------------------------------------------------------------------------
40715, 0,"Single Client Access Name (SCAN) Name: %s contains invalid characters."
// *Cause: The name you provided as the SCAN contained one or more invalid characters. For the Typical installation type, invalid characters include those that are invalid for a cluster name, because the cluster name is derived from SCAN.
// *Action: Enter a valid name for the SCAN and for the cluster name. Valid characters can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), hyphen(-), and period(.).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_SCAN_NAME_TYPICAL_ERR
/-------------------------------------------------------------------------------
40716, 0,"Single Client Access Name (SCAN) Name:%s does not start with a letter."
// *Cause: The SCAN did not start with an alphabetic character.
// *Action: Provide a value for the SCAN that starts with an alphabetic character.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOESNOT_STARTWITH_ALPHABET_SCAN_NAME_ERR
/-------------------------------------------------------------------------------
40717, 0,"Single Client Access Name (SCAN) is unfilled."
// *Cause: No name was provided as the SCAN.
// *Action: Provide a valid name to use for the SCAN.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BLANK_SCAN_NAME_ERR
/-------------------------------------------------------------------------------
40718, 0,"Single Client Access Name (SCAN):%s could not be resolved."
// *Cause: The name you provided as the SCAN could not be resolved using TCP/IP host name lookup.
// *Action: Provide name to use for the SCAN for which the domain can be resolved.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_SCAN_NAME_DOMAIN_ERR
/-------------------------------------------------------------------------------
40719, 0,"IP address configured for Single Client Access Name (SCAN): %s is already assigned to another system."
// *Cause: The installer could not find the IP addresses you selected as SCAN addresses. This may be because they are assigned to another system, or because the IP addresses are not listed in the DNS or hosts files as assigned to this domain name.
// *Action: Enter resolvable IP addresses to use as SCAN addresses.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SCAN_VIP_LIVE_ERR
/-------------------------------------------------------------------------------
40720, 0,"Single Client Access Name (SCAN):%s is not associated with any IP address."
// *Cause: The name configured as the SCAN was not associated with an IP address.
// *Action: Ensure the names you provide as SCANs are associated with IP addresses.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_IP_FOR_SCAN_NAME_ERR
/-------------------------------------------------------------------------------
40721, 0,"Single Client Access Name (SCAN) port is blank."
// *Cause: The SCAN port text field was empty.
// *Action: Provide a valid value for the SCAN port.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BLANK_SCAN_PORT_ERR
/-------------------------------------------------------------------------------
40722, 0,"Single Client Access Name (SCAN) port: %s contains non-numeric characters."
// *Cause: The value entered for the SCAN port contained one or more invalid characters. A valid SCAN port is a number.
// *Action: Enter a valid numeric value for the SCAN port.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_SCAN_PORT_ERR
/-------------------------------------------------------------------------------
40723, 0,"Invalid Single Client Access Name (SCAN) port number:%s."
// *Cause: The value entered for the SCAN Port was out of the valid range.
// *Action: Enter a SCAN port number between 1024 and 65535.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_SCAN_PORT_ERR
/-------------------------------------------------------------------------------
40724, 0,"No locally defined network interface matches the SCAN subnet."
// *Cause: None of the locally defined network interfaces has a subnet matching the SCAN subnet.
// *Action: Define a public interface with a subnet matching the one you want to use for the SCAN.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_LOCAL_INTERFACE_SUBNET_MATCHING_SCAN_VIP
/-------------------------------------------------------------------------------
40725, 0,"Unable to determine the existence of an interface with a subnet matching the SCAN subnet."
// *Cause: No interface was found with a subnet matching the subnet designated as the SCAN subnet.
// *Action: Define a public interface with a subnet matching the one you want to use for the SCAN.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_FAIL_LOCAL_INTERFACE_SUBNET_MATCHING_SCAN_VIP
/-------------------------------------------------------------------------------
40726, 0,"Single Client Access Name (SCAN) %s is not valid."
// *Cause: While configuring GNS on a dynamic network, the domain part of the SCAN should be in the <Cluster Name>.<GNS delegated domain> form.
// *Action: Ensure the domain part of the SCAN is not specified, or specified as: %s
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SCAN_NAME_NOT_IN_GNS_DOMAIN_ERR
/-------------------------------------------------------------------------------
40727, 0,"Single Client Access Name (SCAN):%s is already associated with an IP address."
// *Cause: The name for the configured SCAN is already associated with an IP address.
// *Action: If you intend to use GNS resolution for your cluster, then ensure the names you provide for SCANs are not associated with IP addresses that are already in use.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SCAN_NAME_IS_IP
/-------------------------------------------------------------------------------
40728, 0,"Invalid Single Client Access Name (SCAN) port number:%s."
// *Cause: The installer has detected that the SCAN port number you provided is already in use. This can occur if Oracle9i RAC is installed on the server, and it is using the port.
// *Action: Provide a different SCAN port number in the range 1024 and 65535.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SCAN_PORT_NOT_AVAILABLE_ERR
/-------------------------------------------------------------------------------
40729, 0,"Invalid Single Client Access Name (SCAN) specified:[%s]."
// *Cause: Single Client Access Name (SCAN) cannot have a domain name suffix when configuring cluster to use shared GNS
// *Action: Remove the period(.) and any following text from the specified Single Client Access Name (SCAN)
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.NO_FQDN_SCANNAME_FOR_SHARED_GNS
/-------------------------------------------------------------------------------
40730, 0,"Hostname portion of the specified Single Client Access Name (SCAN) Name: %s is longer than 63 characters."
// *Cause: n/a
// *Action: Specify a SCAN Name whose hostname portion is not longer than 63 characters.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXCEED_MAXSIZE_SCAN_NAME
/-------------------------------------------------------------------------------
40731, 0,"SCAN name is invalid."
// *Cause: SCAN name (%s) can not be same as the local node name.
// *Action: Specify an alternative SCAN name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SCAN_NAME_SAME_AS_LOCAL_NODE_FQDN
/-------------------------------------------------------------------------------
40732, 0,"The specified SCAN name is invalid."
// *Cause: The hostname of the SCAN name (%s) cannot end with hyphen character (-).
// *Action: Specify a valid SCAN name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SCANNAME_HOSTNAME_ENDS_WITH_HYPHEN
/-------------------------------------------------------------------------------
40733, 0,"The specified cluster name is invalid."
// *Cause: The cluster name (%s) cannot end with hyphen character (-).
// *Action: Specify a valid cluster name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLUSTERNAME_ENDS_WITH_HYPHEN
/-------------------------------------------------------------------------------
40734, 0,"Shared SCAN option is not supported on this platform."
// *Cause: n/a
// *Action: Specify the Local SCAN option to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SHARED_SCAN_NOT_SUPPORTED_PLATFORM_ERR
/-------------------------------------------------------------------------------
40735, 0,"The value specified for site name (%s) contains invalid characters."
// *Cause: n/a
// *Action: Specify a valid value for the site name. Valid characters can be alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen(-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_BAD_CHAR_SITE_NAME_ERR
/-------------------------------------------------------------------------------
40896, 0,"The following hostnames have an invalid length: %s."
// *Cause: The hostnames cannot have more than %s characters.
// *Action: Ensure that the hostnames are no more than %s characters long.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_INVALID_HOSTNAME_LENGTH_ERR
/-------------------------------------------------------------------------------
40897, 0,"Host name or one of its components has an invalid length."
// *Cause: The name you provided as the host name or one of its domain components has an invalid length.
// *Action: Ensure that the host name is no more than 253 characters long in total and that each domain component is no more than 63 characters long.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_INVALID_LENGTH_ERR
/-------------------------------------------------------------------------------
40898, 0,"Virtual IP name or one of its components has an invalid length."
// *Cause: The name you provided as the Virtual IP name or one of its domain components has an invalid length.
// *Action: Ensure that the Virtual IP name is no more than 253 characters long in total and that each domain component is no more than 63 characters long.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_VIP_INVALID_LENGTH_ERR
/-------------------------------------------------------------------------------
40899, 0,"One or more nodes will not be added due a host name of invalid length."
// *Cause: One or more generated nodes contain a host name on which the name or one of its domain components has an invalid length.
// *Action: Ensure that the range expression generates host names which length is no more than 253 characters long in total and that each domain component is no more than 63 characters long.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_RANGE_INVALID_LENGTH_WARN
/-------------------------------------------------------------------------------
40900, 0,"One or more nodes will not be added due a VIP name of invalid length."
// *Cause: One or more generated nodes contain a VIP name on which the name or one of its domain components has an invalid length.
// *Action: Ensure that the range expression generates VIP names which length is no more than 253 characters long in total and that each domain component is no more than 63 characters long.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_RANGE_VIP_INVALID_LENGTH_WARN
/-------------------------------------------------------------------------------
40901, 0,"The cluster node information table is unfilled."
// *Cause: Values in the cluster node information table are unfilled.
// *Action: Provide valid data in the cluster node information table.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_TABLE_EMPTY_ERR
/-------------------------------------------------------------------------------
40902, 0,"The information related to nodes is not specified completely."
// *Cause: Some fields pertaining to the nodes were empty.
// *Action: Ensure that all information related to the nodes are specified completely.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_EMPTY_FIELDS_ERR
/-------------------------------------------------------------------------------
40903, 0,"Host name contains invalid characters."
// *Cause: The name you provided as the host name contains one or more invalid characters.
// *Action: Ensure that the host name contains valid characters. Valid characters for host names can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen (-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
40904, 0,"ORACLE_HOSTNAME does not resolve to a valid host name."
// *Cause: The value provided for ORACLE_HOSTNAME does not resolve to a valid host name.
// *Action: Provide a valid host name for ORACLE_HOSTNAME, and restart the installer.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ORACLE_HOSTNAME_INVALID
/-------------------------------------------------------------------------------
40905, 0,"Unresolved host IP addresses."
// *Cause: One or more IP addresses do not resolve to valid host names.
// *Action: You must enter valid IP addresses that resolve to hostnames before installation can continue.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INVALID_HOST_ERR
/-------------------------------------------------------------------------------
40906, 0,"Duplicate host name(s) %s provided for the Oracle Clusterware installation."
// *Cause: n/a
// *Action: Remove duplicate host name entries provided for the Oracle Clusterware installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_DUPLICATE_ERR
/-------------------------------------------------------------------------------
40907, 0,"Local node not included in the list of host names for grid installation."
// *Cause: The local node (the node where you are running the installer) was missing from the list of host names you provided.
// *Action: Include the local node in the list of host names for grid installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_LOCAL_NOT_INCLUDED_ERR
/-------------------------------------------------------------------------------
40908, 0,"Invalid host names."
// *Cause: One or more host names you provided are invalid, as they do not resolve to a valid IP address.
// *Action: Enter valid host names.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_PUB_INVALID_ERR
/-------------------------------------------------------------------------------
40909, 0,"Host names from multiple domains entered."
// *Cause: Node information was entered for two or more nodes that belonged to different domains.
// *Action: Enter host names belonging to the same domain.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_DIFF_DOMAIN_ERR
/-------------------------------------------------------------------------------
40910, 0,"Virtual IP: %s entered is invalid."
// *Cause: The Virtual IP did not resolve to an IP address.
// *Action: Enter a valid name for the virtual IP that resolves to an IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_VIP_INVALID_ERR
/-------------------------------------------------------------------------------
40911, 0,"Some public node names could not be resolved."
// *Cause: Some public nodes either were unreachable, or they belonged to a different subnet.
// *Action: Ensure that nodes in the list are up and reachable, and ensure that the node addresses are all in the same subnet.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_PUB_NOTLIVE_ERR
/-------------------------------------------------------------------------------
40912, 0,"Virtual host name: %s is assigned to another system on the network."
// *Cause: One or more virtual host names appeared to be assigned to another system on the network.
// *Action: Ensure that the virtual host names assigned to each of the nodes in the cluster are not currently in use, and the IP addresses are registered to the domain name you want to use as the virtual host name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_VIP_LIVE_ERR
/-------------------------------------------------------------------------------
40913, 0,"The following nodes cannot be clustered due to user equivalence issue: %s."
// *Cause: The user performing this installation is not configured identically on all nodes. This may be due to differences in the user or group IDs, or to SSH configuration issues.
// *Action: If necessary, refer to the installation guide for information about how to set up user equivalence manually on cluster nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_USER_EQUIVALENCE_ERR
/-------------------------------------------------------------------------------
40914, 0,"The installer has detected the presence of Oracle9i RAC on the following nodes: %s."
// *Cause: An Oracle9i RAC installation was present on the listed nodes, but not on the local node.
// *Action: To install on a set of nodes on which the Oracle9i release of Oracle RAC has been configured, start the installer on the node where Oracle9i RAC is installed so that the installer can upgrade the existing installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_REMOTE_92_ERR
/-------------------------------------------------------------------------------
40915, 0,"The installer has detected the presence of Oracle Clusterware on the following nodes: %s."
// *Cause: Oracle Clusterware may be running on the listed nodes, or previous installation of Oracle Clusterware is not completely deinstalled.
// *Action: For each node listed, ensure that existing Oracle Clusterware is completely deinstalled. Alternatively, do not to include the listed nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLUSTERWARE_DETECTED_ON_NODES_ERR
/-------------------------------------------------------------------------------
40916, 0,"Single-instance versions of Cluster Synchronization Services (CSS) are detected."
// *Cause: The installer has detected single-instance versions of Cluster Synchronization Services (CSS) on the following nodes: %s
// *Action: Before proceeding with the installation, you must deconfigure CSS, shut down any Oracle Automatic Storage Management (Oracle ASM) instances, and shut down all databases that use Oracle ASM for storage on all of the listed nodes. Oracle Clusterware installation starts a cluster-wide version of CSS. After Oracle Clusterware installation is complete, you may start up any databases and Oracle ASM instances that previously used CSS. When they are brought back up, Oracle Clusterware provides CSS.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_LOCAL_CSS_ERR
/-------------------------------------------------------------------------------
40917, 0,"Host name cannot be in IP Address format."
// *Cause: n/a
// *Action: Provide the host name for host name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_PUB_IN_IP_ERR
/-------------------------------------------------------------------------------
40918, 0,"Virtual IP name: %s cannot be in IP Address format."
// *Cause: Virtual IP name cannot be in IP address format.
// *Action: Provide a valid virtual IP name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_VIP_IN_IP_ERR
/-------------------------------------------------------------------------------
40919, 0,"Hostname cannot be left unfilled."
// *Cause: You did not provide a hostname for the node.
// *Action: Enter a valid hostname.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_HOSTNAME_BLANK_ERR
/-------------------------------------------------------------------------------
40920, 0,"No name was provided as the virtual IP name."
// *Cause: You did not enter a name for the virtual IP address.
// *Action: Enter a valid virtual IP name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_VIP_BLANK_ERR
/-------------------------------------------------------------------------------
40921, 0,"Virtual IP name contains invalid characters."
// *Cause: The name you provided for the virtual IP name contains one or more invalid characters.
// *Action: Provide a name to use for the virtual IP name that contains valid characters. Valid characters for virtual IP name can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen(-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_VIP_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
40922, 0,"Invalid SCAN - unresolvable to an IP address."
// *Cause: SCAN provided does not resolve to an IP address.
// *Action: Ensure that the SCAN is valid, and that it is resolvable to an IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_SCAN_VIP_INVALID
/-------------------------------------------------------------------------------
40923, 0,"Unable to match a local interface or subnet with the SCAN."
// *Cause: No local network interface was found with an address matching the subnet for the SCAN.
// *Action: Ensure that the SCAN subnet matches the subnet configured on an existing local network interface.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_FAIL_LOCAL_SUBNET_MATCH
/-------------------------------------------------------------------------------
40924, 0,"Failure while initializing search for common interface or subnets across cluster nodes."
// *Cause: Unable to locate common interfaces or subnets on all cluster member nodes.
// *Action: Ensure that the local node has valid network interfaces, with valid subnets that are the same on all cluster member nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_FAIL_INIT_COMMON_SUBNETS
/-------------------------------------------------------------------------------
40925, 0,"One or more nodes have interfaces not configured with a subnet that is common across all cluster nodes."
// *Cause: One or more nodes have network interfaces configured with a subnet that is not common to all nodes in the cluster.
// *Action: Ensure all cluster nodes have a public interface that is defined with the same subnet, and accessible by all nodes in the cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_NODES_MISSING_COMMON_SUBNET
/-------------------------------------------------------------------------------
40926, 0,"Cluster node interfaces are configured in subnets different from the SCAN subnet."
// *Cause: One or more nodes have interfaces configured with subnets that are different than the SCAN subnet.
// *Action: Ensure all nodes have a public interface configured with a subnet that matches the SCAN subnet.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_NODES_NOT_MATCHING_SCAN_VIP_SUBNET
/-------------------------------------------------------------------------------
40927, 0,"Interfaces with common subnets have different names on different nodes."
// *Cause: The following nodes have interfaces in common subnets that have different interface names: %s
// *Action: Ensure that the names of interfaces defined on common subnets are the same on all cluster member nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_COMMON_NODES_NAME_MISMATCH
/-------------------------------------------------------------------------------
40928, 0,"An unknown interface error occurred during validation of cluster member nodes."
// *Cause: An unknown error occurred during validation of addresses or subnets on cluster member nodes.
// *Action: Ensure network interfaces are configured correctly, and that subnets are available on all nodes of the cluster. Ensure all nodes have at least one public interface on a subnet available on all nodes, and ensure all nodes have one public interface on the same subnet.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_UNKNOWN_NODE_VALIDATION_ERROR
/-------------------------------------------------------------------------------
40929, 0,"Installer has detected that the Oracle 9i Global Services Daemon (GSD) is running on the following nodes: %s"
// *Cause: Oracle 9i Global Services Daemon (GSD) processes are detected on some or all of the nodes specified.
// *Action: To allow Oracle Clusterware to serve Oracle9i RAC databases, on each cluster member node you must shut down the Oracle9i Database GSD, and shut down any Oracle RAC databases. The installer will configure a GSD to run in the new grid Oracle home. After installation, you may restart all Oracle9i databases.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_GSD_ALREADY_RUNNING
/-------------------------------------------------------------------------------
40930, 0,"The following nodes were not resolvable during host IP address lookup: %s."
// *Cause: One or more node VIPs could not be resolved to a valid IP address.
// *Action: Be sure all node VIPs are resolvable to a valid IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_NODE_VIP_UNKNOWN_HOST
/-------------------------------------------------------------------------------
40931, 0,"The following nodes have interfaces that are configured on a subnet that is different from the SCAN subnet: %s."
// *Cause: Some node VIPs are on subnets that are different from the SCAN subnet.
// *Action: For each cluster member node, ensure that the VIP is configured with the SCAN subnet.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_NODE_VIP_SCAN_VIP_MISMATCH
/-------------------------------------------------------------------------------
40932, 0,"An unknown error has occurred while validating Node Virtual IPs: %s"
// *Cause: Unknown errors were encountered while validating Node VIPS.
// *Action: Ensure all node VIPs resolve to a valid IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_NODE_VIP_UNKNOWN_ERR
/-------------------------------------------------------------------------------
40933, 0,"Interface collection failed on node %s."
// *Cause: Interface information collection failed.
// *Action: Be sure all nodes are accessible and have valid network interfaces defined.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_NODE_COLLECTION_FAILED
/-------------------------------------------------------------------------------
40934, 0,"A remote directory operation failed on node %s: Message: %s"
// *Cause: n/a
// *Action: Be sure all nodes are accessible across the network.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_REMOTE_DIR_OP_FAILED
/-------------------------------------------------------------------------------
40935, 0,"A cluster operation (For example, copy file, file exists, or other operation) failed on node %s: Message: %s"
// *Cause: n/a
// *Action: Ensure that all cluster member nodes are accessible on the network.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_CLUSTER_OP_FAILED
/-------------------------------------------------------------------------------
40936, 0," A command tool operation failed on node %s: Message: %s"
// *Cause: A cluster operation (for example, list interfaces) failed.
// *Action: Ensure that all cluster member nodes are accessible on the network. 
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_CMD_TOOL_OP_FAILED
/-------------------------------------------------------------------------------
40937, 0,"The following hostnames are invalid:%s"
// *Cause: The hostname or names listed are invalid.
// *Action: Ensure that you are not providing aliases, and that the hostnames you provide are valid.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INVALID_ERR
/-------------------------------------------------------------------------------
40938, 0,"The installer has detected that some or all cluster member nodes of the Oracle 9i RAC database are not included in the selected list of nodes."
// *Cause: Some of the nodes that are cluster members of the Oracle9i RAC database are not among the nodes you selected.
// *Action: In the list of nodes, specify all the cluster member nodes of the Oracle9i RAC database.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ALL_9IRAC_NODES_NOT_INCLUDED_ERR
/-------------------------------------------------------------------------------
40939, 0,"Some of the nodes you selected are not members of the vendor cluster that is on the local server."
// *Cause: The installer has detected that this node is a member of a vendor cluster, and that some of the nodes you selected to make members of the Oracle Clusterware cluster are not members of the vendor cluster.
// *Action: If you install Oracle Clusterware on a node that is a member of a vendor cluster, then all nodes that you select to be Oracle Clusterware nodes must also be members of the vendor cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ALL_NODES_NOT_PART_OF_VC_ERR
/-------------------------------------------------------------------------------
40940, 0,"Nodes : %s are not in the domain : %s"
// *Cause: Nodes are not configured on the same domain.
// *Action: Ensure that all nodes are configured on the same domain
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ALL_NODES_ARE_NOT_IN_SAME_DOMAIN_ERR
/-------------------------------------------------------------------------------
40941, 0,"Unable to retrieve domain information on one or more nodes."
// *Cause: The installer cannot collect domain information from one or more nodes you selected.
// *Action: Before proceeding with the installation, ensure that all selected nodes are configured on the same domain.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ALL_NODES_ARE_NOT_IN_SAME_DOMAIN_WARN
/-------------------------------------------------------------------------------
40942, 0,"Invalid value specified for Target Hub node size."
// *Cause: Target Hub node size for a cluster should be an integer value between %s and %s.
// *Action: Specify a valid value for Target Hub node size.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INCORRECT_TARGET_HUB_SIZE
/-------------------------------------------------------------------------------
40943, 0,"No Hub nodes/Auto nodes specified."
// *Cause: A Flex Cluster type Oracle Clusterware can be configured only if there is at least one Hub node or Auto Node.
// *Action: Add a Hub node or Auto node to the configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ZERO_HUB_AUTO_NODES
/-------------------------------------------------------------------------------
40944, 0,"The length of upper bound and lower bound of ranges is not same."
// *Cause: n/a
// *Action: Specify equal length for upper bound and lower bound of ranges.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_UPPERBOUND_AND_LOWERBOUND_LEN_UNEQUAL
/-------------------------------------------------------------------------------
40945, 0,"The value of upper bound is lesser than or equal to lower bound."
// *Cause: n/a
// *Action: Specify an upper bound value greater than lower bound.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_UPPERBOUND_LESSER_THAN_LOWERBOUND
/-------------------------------------------------------------------------------
40946, 0,"The virtual hostname suffix provided has invalid characters."
// *Cause: The value provided for virtual hostname suffix has one or more invalid characters.
// *Action: Provide a value for the virtual hostname suffix that contains valid characters. Valid characters for virtual hostname suffix can be any combination of lower alphanumeric characters (a - z, 0 - 9), and hyphen(-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_VIPSUFFIX_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
40947, 0,"No value was provided as the virtual hostname suffix."
// *Cause: You did not enter a value for virtual hostname suffix.
// *Action: Enter a valid virtual hostname suffix for the node range.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_VIPSUFFIX_BLANK_ERR
/-------------------------------------------------------------------------------
40948, 0,"The provided node range expression is not valid."
// *Cause: The provided node range expression does not comply with the allowed syntax to specify node ranges.
// *Action: Refer to the corresponding Oracle documentation for details on how to specify an expression to define a range of nodes for an Oracle cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_INVALID_RANGE_EXPRESSION_ERR
/-------------------------------------------------------------------------------
40949, 0,"Host Prefix cannot be left unfilled."
// *Cause: You did not provide a host prefix for the node range.
// *Action: Enter a valid host prefix.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_HOSTPREFIX_BLANK_ERR
/-------------------------------------------------------------------------------
40950, 0,"Host prefix contains invalid characters."
// *Cause: Host prefix provided contains one or more invalid characters.
// *Action: Ensure that the host prefix contains valid characters. Valid characters for host prefix can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen (-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_HOSTPREFIX_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
40951, 0,"The lower or upper bound of the range cannot be empty."
// *Cause: Either the lower or the upper bound of the node range is blank.
// *Action: Provide valid lower and upper bound of the node range you wish to configure.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_RANGE_BLANK_ERR
/-------------------------------------------------------------------------------
40952, 0,"The lower or upper bound of the range contain invalid characters."
// *Cause: The lower or the upper bound of the node range contain one or more invalid characters.
// *Action: Ensure that the lower and upper bound of the node range contain valid numbers.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_RANGE_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
40953, 0,"Local node cannot be a Leaf node."
// *Cause: n/a
// *Action: Specify the node type of the local node to be Hub node.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LOCALNODE_IS_RIM
/-------------------------------------------------------------------------------
40954, 0,"Local node %s did not resolve to an IP address. Provide alternative name that resolves to an IP address."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LOCALNODE_CANNOT_RESOLVE_TO_IPADDR
/-------------------------------------------------------------------------------
40955, 0,"Local node %s could not be resolved using TCP/IP host name lookup. It is recommended that the local node is resolvable using TCP/IP lookup. This may avoid configuration failures at a later stage."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REVERSE_LOOKUP_NOT_WORKING_FOR_LOCALNODE
/-------------------------------------------------------------------------------
40956, 0,"The specified public host %s did not resolve to an IP address. Provide alternative name that resolves to an IP address."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PUBLIC_NODE_CANNOT_RESOLVE_TO_IPADDR
/-------------------------------------------------------------------------------
40957, 0,"The specified public host %s could not be resolved using TCP/IP host name lookup. It is recommended that the public host name is resolvable using TCP/IP lookup. This may avoid configuration failures at a later stage."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REVERSE_LOOKUP_NOT_WORKING_FOR_PUBLIC_NODE
/-------------------------------------------------------------------------------
40958, 0,"Installer has detected that specified %s (%s) is configured with the dual stack addresses."
// *Cause: The specified %s is configured with both ipv4 and ipv6 addresses.
// *Action: Be sure to specify a %s which is configured with sigle IP address family.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DUAL_STACK_ADDRESSES_FOUND
/-------------------------------------------------------------------------------
40959, 0,"Leaf nodes cannot be specified when the GNS configuration is of Shared type."
// *Cause: n/a
// *Action: Specify only HUB nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SHARED_GNS_NOT_SUPPORTED_FOR_LEAF_NODES
/-------------------------------------------------------------------------------
40960, 0,"Leaf nodes cannot be specified on this platform."
// *Cause: Oracle Grid Infrastructure does not support LEAF nodes to be part of Oracle FLEX cluster on this platform.
// *Action: Specify only HUB nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_FLEX_CLUSTER_LEAF_NODES_NOT_SUPPORTED
/-------------------------------------------------------------------------------
40961, 0,"Leaf nodes cannot be a part of the Flex Cluster without GNS."
// *Cause: LEAF nodes require GNS to be configured in an Oracle Flex Cluster.
// *Action: Specify only HUB nodes to proceed Or You can configure GNS and continue to specify LEAF nodes to be part of Flex Cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_FLEX_CLUSTER_LEAF_NODES_GNS_REQUIRED
/-------------------------------------------------------------------------------
40962, 0,"Installer has detected that password-less SSH configuration is not setup on this server."
// *Cause: n/a
// *Action: Setup password-less SSH configuration on this server. You can refer to the documentation for the procedure to setup password-less SSH configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LOCALNODE_SSH_DOES_NOT_EXIST
/-------------------------------------------------------------------------------
40963, 0,"Installer encountered exception while verifying password-less SSH configuration."
// *Cause: n/a
// *Action: Refer to the logs or contact Oracle Support Services. Note for advanced users: Launch the installer by passing the following flag -ignoreInternalDriverError.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LOCALNODE_SSH_CHECK_FAILED
/-------------------------------------------------------------------------------
40964, 0,"Installer has detected the following nodes are not in the domain : %s
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Nodes are not configured on the same domain.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_ALL_NODES_ARE_NOT_IN_SAME_DOMAIN_ERR
/-------------------------------------------------------------------------------
40965, 0,"Installer has detected that specified %s for the following is configured with the dual stack addresses. 
//          (%s) . The following are the corresponding nodes 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The specified %s is configured with both ipv4 and ipv6 addresses.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_DUAL_STACK_ADDRESSES_FOUND
/-------------------------------------------------------------------------------
40966, 0,"Installer has detected the following Virtual IP names cannot be the same as the Single Client Access Name (SCAN): %s
//         %s. The following are the corresponding nodes 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The data provided for the virtual IP name is the same name used as the SCAN.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_VIP_SAME_AS_SCAN_ERR
/-------------------------------------------------------------------------------
40967, 0,"Installer has detected the following host names are in IP Address format 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure. "
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_PUB_IN_IP_ERR
/-------------------------------------------------------------------------------
40968, 0,"Installer has detected the following Virtual IP names are in IP Address format 
//         %s. The following are the corresponding nodes 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_VIP_IN_IP_ERR
/-------------------------------------------------------------------------------
40969, 0,"Installer has detected that the following specified public host names did not resolve to an IP address 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_PUBLIC_NODE_CANNOT_RESOLVE_TO_IPADDR
/-------------------------------------------------------------------------------
40970, 0,"Installer has detected that the following specified public host names could not be resolved using TCP/IP host name lookup 
//         %s. It is recommended that the public host name is resolvable using TCP/IP lookup. This may avoid configuration failures at a later stage. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_REVERSE_LOOKUP_NOT_WORKING_FOR_PUBLIC_NODE
/-------------------------------------------------------------------------------
40971, 0,"Installer has detected that the following hosts do not belong to the domain %s. 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Some nodes belong to different domains.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_DIFF_DOMAIN_ERR
/-------------------------------------------------------------------------------
40972, 0,"Installer has detected the presence of Oracle9i RAC on the following remote nodes: 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: An Oracle9i RAC installation was present on the following remote nodes, but not on the local node. 
//         %s
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_REMOTE_92_ERR
/-------------------------------------------------------------------------------
40973, 0,"Installer has detected the presence of Oracle Clusterware on the following nodes: %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Either Oracle Clusterware is running on the listed nodes, or previous installations of Oracle Clusterware are not completely deinstalled.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_CLUSTERWARE_DETECTED_ON_NODES_ERR
/-------------------------------------------------------------------------------
40974, 0,"The installer has detected single-instance versions of Cluster Synchronization Services (CSS) on the following nodes in the cluster:%s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_LOCAL_CSS_ERR
/-------------------------------------------------------------------------------
40975, 0,"Installer has detected that the Oracle 9i Global Services Daemon (GSD) is running on the following nodes: %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Oracle 9i Global Services Daemon (GSD) processes are detected on some or all of the nodes specified.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_GSD_ALREADY_RUNNING
/-------------------------------------------------------------------------------
40976, 0,"Installer has detected that local node is a member of vendor cluster, whereas the following nodes are not members of the vendor cluster 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The installer has detected that this node is a member of a vendor cluster, and that some of the nodes you selected to make members of the Oracle Clusterware cluster are not members of the vendor cluster.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_ALL_NODES_NOT_PART_OF_VC_ERR
/-------------------------------------------------------------------------------
40977, 0,"The following Virtual IPs were not resolvable during IP address lookup: %s. 
//          This corresponds to the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: One or more node VIPs could not be resolved to a valid IP address.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_INFO_NODE_VIP_UNKNOWN_HOST
/-------------------------------------------------------------------------------
40978, 0,"An unknown error has occurred while validating Node Virtual IPs: %s. 
//          This corresponds to the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Unknown errors were encountered while validating Node VIPS.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_INFO_NODE_VIP_UNKNOWN_ERR
/-------------------------------------------------------------------------------
40979, 0,"The following VIPs have interfaces that are configured on a subnet that is different from the SCAN subnet: 
//         %s. 
//          This corresponds to the following nodes 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Some node VIPs are on subnets that are different from the SCAN subnet.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_INFO_NODE_VIP_SCAN_VIP_MISMATCH
/-------------------------------------------------------------------------------
40980, 0,"Installer has detected that alias names is specified for the following nodes: 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: Alias host names are specified.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_ALIAS_HOSTNAME_ERR
/-------------------------------------------------------------------------------
40981, 0,"Installer has detected that the following nodes cannot be clustered due to user equivalence issue: 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The user performing this installation is not configured identically on all nodes. This may be due to differences in the user or group IDs, or to SSH configuration issues.
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_USER_EQUIVALENCE_ERR
/-------------------------------------------------------------------------------
40982, 0,"Installer has detected that following nodes have interfaces in common subnets that have different interface names on the following nodes. 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_NODE_INFO_COMMON_NODES_NAME_MISMATCH
/-------------------------------------------------------------------------------
40983, 0,"Leaf nodes cannot be configured as part of this Oracle Extended Cluster configuration."
// *Cause: n/a
// *Action: Remove the Leaf nodes from the specified nodes
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_LEAF_NODE_EXTENDED_CLUSTER
/-------------------------------------------------------------------------------
40984, 0,"Site name is not assigned to one or more nodes."
// *Cause: n/a
// *Action: Assign a site name for every node specified for the configuration of Oracle Extended Cluster
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SITE_NOT_SPECIFIED_FOR_NODE
/-------------------------------------------------------------------------------
40985, 0,"While configuring an Oracle Extended Cluster, it is not allowed to configure an ASM diskgroup with External redundancy."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_INVALID_EXTERNAL_REDUNDANCY
/-------------------------------------------------------------------------------
40986, 0,"Site name is not assigned to one or more Failure Groups"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_FG_SITE_MISSING
/-------------------------------------------------------------------------------
40987, 0,"While configuring an Oracle Extended Cluster the the diskgroup should be configured with Extended redundancy"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_INVALID_REDUNDANCY_BACKUPDG
/-------------------------------------------------------------------------------
40988, 0,"Site name is not assigned to one or more Failure Groups"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_FG_SITE_MISSING_BACKUPDG
/-------------------------------------------------------------------------------
40989, 0,"While configuring an Oracle Extended Cluster the the diskgroup should be configured with Extended redundancy"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_INVALID_REDUNDANCY
/-------------------------------------------------------------------------------
40990, 0,"It is not allowed to specify failure groups for an ASM diskgroup with External redundancy."
// *Cause: n/a
// *Action: Change the redundancy or do not specify failure groups.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_FAILURE_GROUPS_IN_EXTERNAL_REDUNDANCY_DISKGROUP
/-------------------------------------------------------------------------------
40991, 0,"Invalid Allocation Unit Size value specified."
// *Cause: n/a
// *Action: The minimum Allocation Unit Size for an ASM diskgroup with Extended redundancy is %s MB.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_REDUNDANCY_MINIMUM_AUSIZE
/-------------------------------------------------------------------------------
40992, 0,"Local node was included in the list of host names for Software Only setup."
// *Cause: The Grid Infrastructure home is already registered in the central inventory in this server.
// *Action: Remove the local node from the list of host names for Software Only setup.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_LOCAL_INCLUDED_ERR
/-------------------------------------------------------------------------------
40993, 0,"Installer has detected that the Oracle base (%s) is not writable in the following nodes: %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Ensure the Oracle base is writable in the remote nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REMOTE_NODE_BASE_NOT_WRITABLE
/-------------------------------------------------------------------------------
40994, 0,"Installer has detected that the Oracle home (%s) is not writable in the following nodes: %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Ensure the Oracle home is writable in the remote nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REMOTE_NODE_HOME_NOT_WRITABLE
/-------------------------------------------------------------------------------
40995, 0,"Installer has detected that the Oracle base (%s) is not empty in the following nodes: %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Ensure the Oracle base is empty in the remote nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REMOTE_NODE_BASE_NOT_EMPTY
/-------------------------------------------------------------------------------
40996, 0,"Installer has detected that the Oracle home (%s) is not empty in the following nodes: %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Ensure the Oracle home is empty in the remote nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REMOTE_NODE_HOME_NOT_EMPTY
/-------------------------------------------------------------------------------
40997, 0,"Leaf nodes cannot be specified while configuring an Oracle Grid Infrastructure for a Cluster using client ASM storage."
// *Cause: n/a
// *Action: Specify only HUB nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LEAF_NODE_WITH_ASM_CLIENT
/-------------------------------------------------------------------------------
40998, 0,"Installer has detected that the following nodes already have the same software home registered in their central inventory: %s."
// *Cause: n/a
// *Action: Remove these nodes from the specified list of nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REMOTE_NODES_ALREADY_HAVE_SAME_HOME_REGISTERED
/-------------------------------------------------------------------------------
40999, 0,"While configuring an Oracle Extended Cluster, it is not allowed to configure an ASM diskgroup with High redundancy."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_INVALID_HIGH_REDUNDANCY
/-------------------------------------------------------------------------------
41000, 0,"While configuring an Oracle Extended Cluster, it is not allowed to configure an ASM diskgroup with Extended redundancy."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_INVALID_EXTENDED_REDUNDANCY
/-------------------------------------------------------------------------------
41001, 0,"Installer has detected that the software home %s is already registered in the central inventory of the following remote nodes : %s."
// *Cause: n/a
// *Action: Re-launch the installer by passing the -noCopy flag for the installation to proceed without copying the software to the remote nodes, if the homes are identical on all remote nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_REMOTE_NODES_HAVE_SAME_HOME_REGISTERED
/-------------------------------------------------------------------------------
41002, 0,"At least one cluster node has to be specified for delete node operation."
// *Cause: n/a
// *Action: Specify one or more nodes that are part of the cluster to be deleted from the cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DELETE_NODES_NOT_EMPTY
/-------------------------------------------------------------------------------
41003, 0,"Local node cannot be specified for delete node operation."
// *Cause: n/a
// *Action: Do not specify the local node. Specify one or more of the remaining nodes that are part of the cluster to be deleted.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DELETE_NODES_LOCAL_NODE_NOT_ALLOWED
/-------------------------------------------------------------------------------
41004, 0,"Public Hostnames are not specified for all the nodes."
// *Cause: n/a
// *Action: Specify a valid public hostname for each node.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_EMPTY_PUBLIC_HOSTNAME_ERR
/-------------------------------------------------------------------------------
41005, 0,"Node type for the node %s is not specified."
// *Cause: n/a
// *Action: Specify a valid node type or role for the node.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_EMPTY_NODE_TYPE_ERR
/-------------------------------------------------------------------------------
41006, 0,"Virtual hostnames are not specified for all the nodes being configured."
// *Cause: n/a
// *Action: Virtual hostnames are optional. However, once specified for one node of the cluster, then configuration requires that you specify for all the nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_INFO_EMPTY_VIP_ERR
/-------------------------------------------------------------------------------
41101, 0,"The specified interface information is incorrect."
// *Cause: Either the format of the information entered was incorrect, or the interface name or subnet information was incorrect.
// *Action: Enter the correct interface information before proceeding
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INCORRECT_INTERFACE_FORMAT_ERR
/-------------------------------------------------------------------------------
41102, 0,"No public interface designated."
// *Cause: None of the network interfaces were designated as public.
// *Action: Designate at least one interface as a public interface.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_PUB_INTERFACE_ERR
/-------------------------------------------------------------------------------
41103, 0,"Interface %s has multiple subnets associated with it."
// *Cause: Interface %s has been marked as both Public and Private.
// *Action: Designate interface %s either as Public or Private, but not both Public and Private.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_COMBINED_PRIVATE_PUBLIC_INTERFACE_WRN
/-------------------------------------------------------------------------------
41104, 0,"No Private Interface designated."
// *Cause: There is no interface marked as Private.
// *Action: Ensure that at least one interface is designated as Private.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ONE_PRIVATE_INTERFACE_ERR
/-------------------------------------------------------------------------------
41105, 0,"%s on subnet %s chosen as public does not match subnet of SCAN VIP."
// *Cause: The chosen public interface is not on the same subnet as the SCAN VIP.
// *Action: Ensure the chosen public interface is on the same subnet as the SCAN VIP subnet, and that the same subnet is configured for SCAN VIPs on all cluster nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PUBLIC_NOT_MATCH_SCAN
/-------------------------------------------------------------------------------
41106, 0,"Invalid choice for public/private interface."
// *Cause: The chosen public or private interface subnet is not identical on all nodes.
// *Action: Ensure that the subnets configured for public and private interfaces are identical on all cluster nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PUBLIC_PRIVATE_NOT_ACROSS_NODES
/-------------------------------------------------------------------------------
41107, 0,"The interface (%s) chosen as Public or Private is not on a shared subnet. Nodes not defining are: %s"
// *Cause: The Public or Private interface on the nodes indicated are on a different subnet than the ones used on other nodes.
// *Action: Ensure that the specified Public or Private interface share the same subnet across the nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INLINE_PUBLIC_PRIVATE_NOT_ACROSS_NODES
/-------------------------------------------------------------------------------
41108, 0,"%s on subnet %s chosen as public does not match subnet of Grid Naming Service (GNS) VIP."
// *Cause: The chosen public interface is not on the same subnet as the GNS VIP.
// *Action: Be sure that the chosen public interface is on a subnet which matches the GNS VIP subnet and is common across all cluster nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PUBLIC_NOT_MATCH_GNSVIP
/-------------------------------------------------------------------------------
41109, 0,"Configured network mask %s for the interface %s is not same across all cluster nodes."
// *Cause: Installer has detected that interface %s does not have the same netmask %s configured on all cluster nodes.
// *Action: Ensure that the chosen interface has been configured with same netmask across all cluster nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INTERFACE_WITH_DIFFERENT_NETMASK
/-------------------------------------------------------------------------------
41110, 0,"Installer has transferred the provided interface list to following format: %s. 
//         
//         This might be because either the Installer has detected hybrid interface configuration (both IPv4 and IPv6 configuration present) on the cluster nodes, or different interface names are configured for particular subnet on the cluster nodes. In the latter case, Installer will not consider interface names during Grid Infrastructure configuration."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INTERFACE_LIST_TRANSFORMED_TO_DIFFERENT_FORMAT
/-------------------------------------------------------------------------------
41111, 0,"The installer has detected that multiple interfaces configured on a subnet (%s)."
// *Cause: You have specified generic name for the interface configured on the subnet (%s). But installer has detected that multiple interfaces configured on this subnet.
// *Action: Ensure that you have specified interface name appropriately.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MULTIPLE_INTERFACES_CONFIGURED_FOR_PERTICULAR_SUBNET
/-------------------------------------------------------------------------------
41112, 0,"Installer has detected that the selected interfaces are not configured properly."
// *Cause: n/a
// *Action: Review the additional information and modify the network interface configuration suitably.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INTERFACE_NOT_CONNECTED_ACROSS_NODES
/-------------------------------------------------------------------------------
41113, 0,"Specified public and private interfaces are configured on the same subnet: %s"
// *Cause: Installer has detected that both public and private interfaces are configured on the same subnet.
// *Action: Ensure that the public and private interfaces are configured on different subnets.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PUBLIC_PRIVAT_SUBNET_CONFIGURED_ON_SAME_SUBNET
/-------------------------------------------------------------------------------
41114, 0,"Interface selected as Private (cluster interconnect) (%s) is not configured with Internet Protocol version 4 (IPv4)."
// *Cause: Installer has detected that the interface (%s) is not configured with Internet Protocol version 4 (IPv4). Only those interfaces which are configured with Internet Protocol version 4 (IPv4) can be specified as Private(cluster interconnect) interface.
// *Action: Ensure that the interface selected for Private(cluster interconnect) is configured with IPv4.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PRIVATE_SUBNET_NOT_CONFIGURED_ON_IPV4
/-------------------------------------------------------------------------------
41115, 0,"The number of selected Private and ASM & Private interfaces (%s) exceeds the limit."
// *Cause: There are more than %s Private and ASM & Private interfaces selected.
// *Action: Ensure that the number of selected Private and ASM & Private interfaces does not exceed %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MAX_PRIVATE_INTERFACES_LIMIT_ERR
/-------------------------------------------------------------------------------
41116, 0,"Installer has detected that the selected following nodes do not have connectivity with other cluster nodes through the selected interface. 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_INTERFACE_NOT_CONNECTED_ACROSS_NODES
/-------------------------------------------------------------------------------
41117, 0,"Installer has detected that interface %s does not have the same netmask %s configured on the following nodes: 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_INTERFACE_WITH_DIFFERENT_NETMASK
/-------------------------------------------------------------------------------
41118, 0,"The interface (%s) chosen as Public or Private is not on a shared subnet on the following nodes: 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: The Public or Private interface on the nodes indicated are on a different subnet than the ones used on other nodes.
// *Action: Ensure that the specified Public or Private interface share the same subnet across the nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_INSTALL_CRS_INLINE_PUBLIC_PRIVATE_NOT_ACROSS_NODES
/-------------------------------------------------------------------------------
41119, 0,"No ASM or ASM & Private interface designated."
// *Cause: There is no interface marked as ASM or ASM & Private.
// *Action: Ensure that at least one interface is designated as ASM or ASM & Private.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_ASM_INTERFACE_ERR
/-------------------------------------------------------------------------------
41120, 0,"The specified private interfaces are not of the same type."
// *Cause: n/a
// *Action: Ensure that all the specified private interfaces have the same type, IPV4 or IPV6.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PRIVATE_INTERFACES_MIXED_TYPES
/-------------------------------------------------------------------------------
41121, 0,"The specified interface type number (%s) in (%s) is not valid."
// *Cause: n/a
// *Action: Ensure that all the specified interface type numbers are valid:
//             - 1 : PUBLIC
//             - 2 : PRIVATE
//             - 3 : DO NOT USE
//             - 4 : ASM
//             - 5 : ASM and PRIVATE
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_WRONG_INTERFACE_TYPE_NUMBER
/-------------------------------------------------------------------------------
41122, 0,"The specified Private, ASM or ASM & Private interfaces are not of the same type."
// *Cause: n/a
// *Action: Ensure that all the specified Private, ASM or ASM & Private interfaces have the same type, IPV4 or IPV6.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_PRIVATE_AND_ASM_INTERFACES_MIXED_TYPES
/-------------------------------------------------------------------------------
41123, 0,"ASM interfaces cannot be specified while configuring a cluster that uses ASM Storage Service."
// *Cause: n/a
// *Action: Ensure that no ASM or ASM & Private interfaces are specified.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_INTERFACE_IN_CLIENT_ASM
/-------------------------------------------------------------------------------
41124, 0,"Multiple network interfaces should not be designated for Private (cluster interconnect) usage."
// *Cause: On Windows operating system, Oracle Grid Infrastructure does not support designating multiple network interfaces for Private (cluster interconnect) usage as it does not provide failover capabilities during connectivity loss.
// *Action: Designate a single network interface for Private (cluster interconnect) usage. Additionally, you can setup NIC teaming to support failover capability during connectivity loss.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_MULTIPLE_PRIVATE_INTERFACES_FOR_WINDOWS
/-------------------------------------------------------------------------------
41125, 0,"The current install user '%s' is not part of '%s' group."
// *Cause: In order to upgrade Grid Infrastructure, install user should be part of this group.
// *Action: Add the install user to group '%s'.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_USER_NOT_IN_ASM_SYSDBA_SYSADMIN_GRP
/-------------------------------------------------------------------------------
41126, 0,"The specified SCAN name and GNS VIP address do not resolve to be of the same IP network address type (IPv4 or IPv6)."
// *Cause: n/a
// *Action: Ensure that SCAN name and GNS VIP address should be of the same IP network address type (IPv4 or IPv6).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SCANNAME_GNSVIP_MIXED_TYPES
/-------------------------------------------------------------------------------
41170, 0,"You have chosen not to configure the Grid Infrastructure Management Repository. Not configuring the Grid Infrastructure Management Repository will permanently disable the Cluster Health Monitor, QoS Management, Memory Guard, and Rapid Home Provisioning features. Enabling of these features will require reinstallation of the Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MGMT_DB_NOT_SELECTED_WARN
/-------------------------------------------------------------------------------
41204, 0,"No shared partition are available between nodes."
// *Cause: The specified nodes did not have at least one shared partition.
// *Action: Provide nodes that have at least one shared partition before proceeding with the installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_SHARED_PARTITION_ERR
/-------------------------------------------------------------------------------
41205, 0,"Client ASM data file not specified."
// *Cause: To configure storage on a client ASM, a valid client data file has to be specified.
// *Action: Specify a valid client ASM data file to configure client ASM.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_DATAFILE_NOT_SPECIFIED
/-------------------------------------------------------------------------------
41206, 0,"File name specified as client ASM data file is not a valid file."
// *Cause: Installer has detected that the specified client ASM data file is not a valid file, or does not exist, or is not a readable file.
// *Action: Specify a valid client ASM data file to configure shared ASM.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_DATAFILE_INVALID
/-------------------------------------------------------------------------------
41208, 0,"None of the available network subnets is marked for use by Oracle Automatic Storage Management (ASM)"
// *Cause: At least one of the available network subnets should be configured for use by Oracle Automatic Storage Management (ASM).
// *Action: Configure one of the available network subnets for Oracle Automatic Storage Management (ASM) use if you intend  to configure Near Oracle ASM or Client Oracle ASM
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NO_ASM_NETWORK
/-------------------------------------------------------------------------------
41210, 0,"One of the available network subnets is marked for use by Automatic Storage Management(ASM)."
// *Cause: This storage option does not require configuring a network subnet for use by ASM.
// *Action: None of the interfaces should be marked for ASM usage if you want to store OCR on shared file system or Local ASM.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_NETWORK_SELECTED
/-------------------------------------------------------------------------------
41212, 0,"Specified ASM client data file is invalid."
// *Cause: The cluster name in the ASM client data file '%s' does not match with the cluster name specified '%s' for this installation.
// *Action: The cluster name retrieved from the specified ASM client data file should match the cluster name of the client cluster. Specify the correct ASM client data file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_CLUSTERNAME_MISMATCH
/-------------------------------------------------------------------------------
41213, 0,"Oracle Cluster File system is not supported on windows."
// *Cause: n/a
// *Action: Use Oracle Automatic Storage Management for storing Oracle Cluster Registry /Voting disk files.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_STORAGEOPTION_SHARED_NOT_SUPPORTED_ON_WIN
/-------------------------------------------------------------------------------
41214, 0,"Disk group name not specified."
// *Cause: n/a
// *Action: Specify a valid disk group name to store OCR and Voting Disk.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_DISKGROUP_NOT_SPECIFIED
/-------------------------------------------------------------------------------
41215, 0,"No Disk groups detected on remote cluster."
// *Cause: Installer has not detected any diskgroups configured on the remote cluster.
// *Action: To configure the cluster to store OCR and Voting Disk on remote cluster, a disk group available on the remote cluster shoud be specified.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_NO_REMOTE_DISKGROUPS
/-------------------------------------------------------------------------------
41216, 0,"Specified disk group is not found on the remote cluster"
// *Cause: n/a
// *Action: Installer is unable to detect the specified disk group on the remote cluster. Specify a disk group that is configured on the remote cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_DISKGROUP_NOT_MATCHED
/-------------------------------------------------------------------------------
41217, 0,"Password for account %s does not start with an alphabet."
// *Cause: n/a
// *Action: Provide a value for the password that starts with an alphabet
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_PASSWD_DOESNOT_STARTWITH_ALPHABET_ERR
/-------------------------------------------------------------------------------
41218, 0,"The password for account %s is not allowed to be %s."
// *Cause: The administrative account password you entered was %s which is not allowed for %s user.
// *Action: Enter a password that is not a former default password for the %s administrative user account.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_PASSWORD_NOT_ALLOWED_ERR
/-------------------------------------------------------------------------------
41219, 0,"Invalid storage option selected."
// *Cause: The selected storage option is not supported for Oracle Flex Cluster with LEAF nodes.
// *Action: Choose an alternative storage option to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_STORAGE_OPTION_NOT_SUPPORTED_FOR_LEAF_NODES
/-------------------------------------------------------------------------------
41220, 0,"Invalid storage option selected."
// *Cause: Cannot configure an Oracle Flex Cluster with client ASM storage when configuring a GNS server.
// *Action: Choose an alternative storage option to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_NOT_ALLOWED_IN_GNS_SERVER
/-------------------------------------------------------------------------------
41221, 0,"Cannot configure an Oracle Extended Cluster with client ASM storage."
// *Cause: n/a
// *Action: Choose an alternative storage option to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_NOT_ALLOWED_FOR_EXTENDED_CLUSTER
/-------------------------------------------------------------------------------
41222, 0,"Specified cluster name is invalid."
// *Cause: The cluster name '%s' does not match with the cluster name specified in the Member Cluster Manifest file '%s' for this installation.
// *Action: Specify the correct cluster name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_CLUSTERNAME_MISMATCH
/-------------------------------------------------------------------------------
41223, 0,"ASM Filter Driver is not supported on this platform."
// *Cause: n/a
// *Action: To proceed, do not specify or select the Oracle ASM Filter Driver option.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_AFD_NOT_SUPPORTED
/-------------------------------------------------------------------------------
41224, 0,"Oracle ASM Filter Driver not supported on Member Cluster for Applications."
// *Cause: n/a
// *Action: You cannot choose to configure Oracle ASM Filter Driver for a Member Cluster for Applications.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APPLICATION_CLUSTER_AFD_NOT_SUPPORTED
/-------------------------------------------------------------------------------
41225, 0,"Oracle ASM Filter Driver is not supported when IO service is specified."
// *Cause: n/a
// *Action: You cannot choose to configure Oracle ASM Filter Driver for a Member Cluster configured to use IO Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_IO_SERVICE_AFD_NOT_SUPPORTED
/-------------------------------------------------------------------------------
41226, 0,"Oracle ASM Filter Driver cannot manage the selected devices since the devices are configured on NAS."
// *Cause: n/a
// *Action: In order to use Oracle ASM Filter Driver to manage the selected devices, they need to be attached locally.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_AFD_NOT_SUPPORTED_ON_NFS
/-------------------------------------------------------------------------------
41302, 0,"Normal redundancy requires three locations for the Oracle Cluster Registry."
// *Cause: Fewer than three locations were provided for the Oracle Cluster Registry.
// *Action: Specify three locations for the Oracle Cluster Registry.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_NORMAL_REDUNDANCY_ERR
/-------------------------------------------------------------------------------
41303, 0,"External redundancy requires a location for the Oracle Cluster Registry."
// *Cause: A location for the Oracle Cluster Registry was not specified.
// *Action: Specify a location for the Oracle Cluster Registry.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_EXTERNAL_REDUNDANCY_ERR
/-------------------------------------------------------------------------------
41304, 0,"The allowed amount of Oracle Cluster Registry locations is three or one.  Oracle recommends three locations for the Oracle Cluster Registry."
// *Cause: Incorrect amount of locations were provided for the Oracle Cluster Registry.
// *Action: Specify a valid amount of locations for the Oracle Cluster Registry.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_NORMAL_REDUNDANCY_WRN
/-------------------------------------------------------------------------------
41305, 0,"Invalid characters in one or more Oracle Cluster Registry (OCR) locations."
// *Cause: One or more Oracle Cluster Registry (OCR) locations contained bad characters.
// *Action: Provide an OCR location that uses valid characters in the path.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
41306, 0,"Invalid Oracle Cluster Registry (OCR) Locations."
// *Cause: One or more Oracle Cluster Registry (OCR) locations are not valid.
// *Action: Provide valid OCR locations.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_INVALID_ERR
/-------------------------------------------------------------------------------
41307, 0,"Insufficient space in shared file system for Oracle Cluster Registry (OCR)."
// *Cause: Insufficient free space was available in the file system. Oracle Cluster Registry requires a minimum of %s MB of free space in the file system.
// *Action: Enter a shared file system that has at least %s MBs of free space.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_NOT_ENOUGH_FREESPACE_ERR
/-------------------------------------------------------------------------------
41309, 0,"The Oracle Cluster Registry (OCR) cannot be placed on a block or character device."
// *Cause: The Oracle Cluster Registry (OCR) location you provided is on a block or character device.
// *Action: Select one of the following supported locations: OCFS2 partition, or a shared NFS partition. If you intend to use block or character device, choose Oracle Automatic Storage Management (Oracle ASM) as storage option for install.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_RAW_PARTITION_ERR
/-------------------------------------------------------------------------------
41310, 0,"More than one Oracle Cluster Registry is in the same partition."
// *Cause: The Oracle Cluster Registry was located more than once on the same partition. For normal redundancy, Oracle recommends that you specify three locations on separate partitions for the Oracle Cluster Registry.
// *Action: Select separate partitions for each Oracle Cluster Registry.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_MULTILOC_ON_SINGLE_PARTITION_ERR
/-------------------------------------------------------------------------------
41311, 0,"One or more Oracle Cluster Registry (OCR) locations specified are in an existing OCR directory."
// *Cause: One or more Oracle Cluster Registry (OCR) locations specified were in directories with existing OCR files.
// *Action: Specify locations for Oracle Cluster Registry that are not in use.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_IS_DIR_ERR
/-------------------------------------------------------------------------------
41312, 0,"One or more locations specified for the Oracle Cluster Registry (OCR) cannot be used."
// *Cause: One or more Oracle Cluster Registry (OCR) locations specified did not have proper permissions or ownership for the installation to proceed.
// *Action: Specify a location for Oracle Cluster Registry locations where the installation owner and oraInventory group members have read and write permissions
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_CREATION_ERR
/-------------------------------------------------------------------------------
41313, 0,"Duplicate entries found in one or more Oracle Cluster Registry (OCR) locations."
// *Cause: One or more Oracle Cluster Registry locations specified were duplications.
// *Action: Specify a unique location for each Oracle Cluster Registry location.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_DUPLICATE_ERR
/-------------------------------------------------------------------------------
41314, 0,"File %s already exists. The installer will make an attempt to replace this file."
// *Cause: The specified OCR file already exists.
// *Action: You may choose a different location or let the installer replace this file. Replacing it will overwrite its current contents.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_EXISTS_WARN
/-------------------------------------------------------------------------------
41315, 0,"File %s already exists."
// *Cause: The specified OCR file already exists.
// *Action: Ensure that the OCR file you have specify is a nonexistent file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_EXISTS_ERR
/-------------------------------------------------------------------------------
41316, 0,"Unable to delete file %s"
// *Cause: The attempt to delete the file was not successful.
// *Action: Ensure that the user account running the installation has the permissions to replace the file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_LOC_EXISTS_NO_DELETE_ERR
/-------------------------------------------------------------------------------
41317, 0,"Invalid Oracle Cluster Registry (OCR) locations."
// *Cause: One or more Oracle Cluster Registry (OCR) locations were not valid.
// *Action: Provide valid OCR locations.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.OCR_LOC_NOT_SHARED
/-------------------------------------------------------------------------------
41318, 0,"One or more files %s already exist. The installer will attempt to replace existing files."
// *Cause: One or more specified files already exist.
// *Action: Either choose a different storage location, or allow the installer to overwrite this location and remove any existing files.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_TYPICAL_OCR_VDSK_LOC_EXISTS_WARN
/-------------------------------------------------------------------------------
41319, 0,"File(s) %s already exist(s)."
// *Cause: The specified shared location is in use.
// *Action: Ensure that the location you provided is not already in use, and that any past Oracle Clusterware configuration is completely removed from the partition.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_TYPICAL_OCR_VDSK_LOC_EXISTS_ERR
/-------------------------------------------------------------------------------
41320, 0,"Unable to delete one or more files %s."
// *Cause: The attempt to delete files was unsuccessful.
// *Action: Ensure that the user account running the installation has the permissions to replace files.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_TYPICAL_OCR_VDSK_LOC_EXISTS_NO_DELETE
/-------------------------------------------------------------------------------
41321, 0,"Invalid Oracle Cluster Registry (OCR) location."
// *Cause: The installer has detected that the storage type of the location (%s) is not supported for Oracle Cluster Registry.
// *Action: Provide a supported storage location for the Oracle Cluster Registry.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OCR_FILE_SYSTEM_TYPE_ERR
/-------------------------------------------------------------------------------
41322, 0,"The provided OCR Location (%s) can not be configured."
// *Cause: %s name is reserved for the backup locations for OCR.
// *Action: Provide the OCR location name other than week.ocr,data.ocr,backup00.ocr,backup01.ocr,backup02.ocr.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GIVEN_OCR_LOCATION_CONTAINS
/-------------------------------------------------------------------------------
41323, 0,"Installer has detected that the following nodes do not share Oracle Cluster Registry (OCR) locations. 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_OCR_LOC_PARTIALLY_SHARED
/-------------------------------------------------------------------------------
41324, 0,"The Oracle Cluster Registry (OCR) location [%s] is invalid."
// *Cause: The installer has detected that the storage type of the location (%s) is not supported for Oracle Cluster Registry.
// *Action: Provide a supported storage location for the Oracle Cluster Registry.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.OCR_FILE_SYSTEM_TYPE_ERR
/-------------------------------------------------------------------------------
41325, 0,"The Oracle Cluster Registry (OCR) location %s is not shared by the following nodes: %s."
// *Cause: One or more nodes do not have access to the Oracle Cluster Registry (OCR) location.
// *Action: Provide an OCR location that is shared by all the nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.OCR_FILE_SYSTEM_LOC_NOT_SHARED
/-------------------------------------------------------------------------------
41502, 0,"Insufficient number of voting disk locations provided for normal redundancy configuration."
// *Cause: You did not provide enough separate locations for voting disk files. To provide normal redundancy, you must specify three separate locations for voting disk files.
// *Action: Specify three separate locations for voting disk files for normal redundancy.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_NORMAL_REDUNDANCY_ERR
/-------------------------------------------------------------------------------
41503, 0,"Missing voting disk file locations for external redundancy configuration."
// *Cause: A voting disk file location was not specified. For external redundancy, you must specify a location for the voting disk file.
// *Action: Specify one voting disk file location for external redundancy.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_EXTERNAL_REDUNDANCY_ERR
/-------------------------------------------------------------------------------
41504, 0,"The allowed amount of voting disk locations is three or one. Oracle recommends three locations for the voting disk files."
// *Cause: Incorrect amount of locations were provided for the voting disk files.
// *Action: Specify a valid amount of locations for the voting disk files.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_NORMAL_REDUNDANCY_WRN
/-------------------------------------------------------------------------------
41505, 0,"The voting disk file locations contain one or more invalid characters."
// *Cause: n/a
// *Action: Specify voting disk file location paths that do not contain illegal characters.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
41506, 0,"One or more voting disk file locations are not valid."
// *Cause: One or more voting disk file locations were not placed in an existing directory.
// *Action: Provide valid voting disk file locations.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_INVALID_ERR
/-------------------------------------------------------------------------------
41508, 0,"More than one voting disk file is located on the same partition."
// *Cause: Normal redundancy for voting disk files requires that each file is placed on a different partition, to avoid a single point of failure.
// *Action: Specify three locations on separate physical partitions to configure normal redundancy for voting disk files.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_MULTILOC_ON_SINGLE_PARTITION_ERR
/-------------------------------------------------------------------------------
41509, 0,"Duplicate locations used for one or more voting disk file locations."
// *Cause: One or more voting disk file locations you provide are duplicate. Each voting disk location must be on separate devices.
// *Action: Specify a location on separate devices for each voting disk file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_DUPLICATE_ERR
/-------------------------------------------------------------------------------
41510, 0,"One or more voting disk file locations are the same as an OCR location."
// *Cause: One or more voting disk file locations you provided are the same as an OCR location. Voting disk files cannot be on the same location as Oracle Cluster Registry (OCR) locations.
// *Action: Specify voting disk file locations that are different from Oracle Cluster Registry (OCR) locations.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_SAME_AS_OCR_ERR
/-------------------------------------------------------------------------------
41511, 0,"One or more of the locations you specified for voting disk files are the same as an Oracle 9i quorum location."
// *Cause: Oracle 9i quorum disks are located on one or more of the locations you specified for voting disk files.
// *Action: Provide new locations for voting disk files. You cannot reuse an Oracle9i quorum disk location.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_QUORUM_LOC_ERR
/-------------------------------------------------------------------------------
41512, 0,"Voting disk files cannot be located on block or character devices."
// *Cause: The voting disk file location you provided is on a block or character device.
// *Action:  Select one of the following supported locations: Oracle Automatic Storage Management, an OCFS2 partition, or a shared NFS partition.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_RAW_PARTITION_ERR
/-------------------------------------------------------------------------------
41513, 0,"Voting disk file locations cannot be in a directory with existing voting disks."
// *Cause: One or more voting disk file locations you provided have an existing voting disk file.
// *Action: Specify a new voting disk file location.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_IS_DIR_ERR
/-------------------------------------------------------------------------------
41514, 0,"One or more locations you specified for voting disk files cannot be used."
// *Cause: One or more locations you specified for placing voting disk files did not have proper permissions or ownership for installation to proceed.
// *Action: Specify voting disk file locations where the user account running the installation and oraInventory group members have read and write privileges.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_CREATION_ERR
/-------------------------------------------------------------------------------
41515, 0,"Insufficient space in shared file system for voting disk file."
// *Cause: Insufficient space was available in the storage location for a voting disk file. Voting disk files require a minimum of %s MB of free space.
// *Action: Enter a shared storage location that has at least %s MB of free space.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_NOT_ENOUGH_FREESPACE_ERR
/-------------------------------------------------------------------------------
41516, 0,"File %s already exists. The installer will make an attempt to replace this file."
// *Cause: The specified voting disk file already exists.
// *Action: You may choose a different location or let the installer replace this file. Replacing it will overwrite its current contents.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_EXISTS_WARN
/-------------------------------------------------------------------------------
41517, 0,"File %s already exists."
// *Cause: The specified voting disk file already exists.
// *Action: Ensure that the location you specify for a voting disk file does not already have a voting disk file in that location.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_EXISTS_ERR
/-------------------------------------------------------------------------------
41518, 0,"Unable to delete file %s"
// *Cause: The attempt to delete the file was not successful.
// *Action: Ensure that the user account running this installation has proper permissions in this storage area to replace the file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_LOC_EXISTS_NO_DELETE_ERR
/-------------------------------------------------------------------------------
41519, 0,"One or more voting disk file locations are not valid."
// *Cause: One or more voting disk file locations may not be shared on all nodes.
// *Action: Provide valid voting disk file locations on shared paths and directories.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.VDSK_LOC_NOT_SHARED
/-------------------------------------------------------------------------------
41520, 0,"For high availability, Oracle recommends that you have this storage mirrored at the hardware level. Alternatively, you can select Normal Redundancy option and specify three locations that are on different disks."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.VDSK_EXTERNAL_REDUNDANCY_SELECTED
/-------------------------------------------------------------------------------
41521, 0,"Invalid Voting Disk location."
// *Cause: The installer has detected that the storage type of the location (%s) is not supported for voting disk files.
// *Action: Provide a supported storage location for the voting disk file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_VDSK_FILE_SYSTEM_TYPE_ERR
/-------------------------------------------------------------------------------
41522, 0,"Installer has detected that the following nodes do not share one or more voting disk file locations. 
//          [%s]. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_VDSK_LOC_PARTIALLY_SHARED
/-------------------------------------------------------------------------------
41702, 0,"No nodes selected for upgrade."
// *Cause: Node selection was blank.
// *Action: Select a list of nodes to upgrade with the local node.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODESEL_NO_NODES_SPECIFIED_ERR
/-------------------------------------------------------------------------------
41703, 0,"The local node is not selected as one of the nodes for upgrade."
// *Cause: The nodes selected for upgrade did not include the local node.
// *Action: Select the local node (the node from which you are running the installer) as one of the nodes to upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODESEL_LOCAL_NODE_MISSING_ERR
/-------------------------------------------------------------------------------
41704, 0,"Selected nodes should be members of the same cluster. The following nodes are not in the cluster: %s."
// *Cause: One or more nodes selected were not in the same cluster.
// *Action: Select nodes from the same cluster, or exclude the following nodes:%s
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODESEL_NODE_NOT_IN_CLUSTER_ERR
/-------------------------------------------------------------------------------
41705, 0,"The installer has detected that one or more nodes (%s) that are part of the cluster are down."
// *Cause: n/a
// *Action: Either select Ignore unreachable nodes option or ensure all the nodes of the cluster are up.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODESEL_NODE_DOWN_ERR
/-------------------------------------------------------------------------------
41706, 0,"Only subset of nodes selected for upgrade."
// *Cause: You have chosen a subset of the cluster nodes for the upgrade.
// *Action: During installation, the software will be copied to all cluster nodes. However, during installation setup, you are prompted to run the rootupgrade script only on the nodes you selected for upgrade. To complete the upgrade, run the rootupgrade script on the remaining nodes. You do not need to start the installer again to upgrade the remaining nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SUBSET_NODES_SELECTED_FOR_UPGRADE_WARNING
/-------------------------------------------------------------------------------
41707, 0,"Not all cluster member nodes are selected for upgrade."
// *Cause: The installer has detected that this server has an earlier release of Oracle Grid Infrastructure software installed on this system. However, you have selected to upgrade a subset of the cluster nodes.
// *Action: To complete the upgrade, select all the nodes that are part of the Oracle Grid Infrastructure cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SUBSET_NODES_SELECTED_FOR_UPGRADE_ERR
/-------------------------------------------------------------------------------
41708, 0,"Oracle Automatic Storage Management (Oracle ASM) is not selected for upgrade."
// *Cause: The installer has detected that an earlier release of Oracle ASM is installed on this server. Oracle ASM needs to be upgraded as part of this installation.
// *Action: Select Oracle ASM upgrade option to complete the installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_NOT_SELECTED_FOR_UPGRADE_ERR
/-------------------------------------------------------------------------------
41709, 0,"Oracle Automatic Storage Management (Oracle ASM) is not installed on this server."
// *Cause: You selected to upgrade Oracle ASM. However, the installer does not detect Oracle ASM on this server.
// *Action: To continue with the installation, deselect the option to upgrade Oracle ASM.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_NOT_FOUND_ERR
/-------------------------------------------------------------------------------
41710, 0,"Oracle Automatic Storage Management (Oracle ASM) configured in your cluster cannot be upgraded in a rolling manner. During the upgrade process, any databases using the active Oracle ASM will be forcibly shutdown."
// *Cause: The installer has detected that the version of the configured instance of Oracle ASM is not compatible for rolling upgrade to this release of Oracle Grid Infrastructure.
// *Action: All the databases using the active Oracle ASM will go down during this installation. Plan for databases to be unavailable during the time when the installer is running configuration tools.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_NOT_ROLLING_UPGRADABLE_WARN
/-------------------------------------------------------------------------------
41711, 0,"The upgrade process upgrades the stack one node at a time, even though you selected to upgrade all nodes. Database service will be disrupted for any database that uses Oracle Automatic Storage Management (Oracle ASM), and that is not managed by Oracle Clusterware, or that uses Oracle Clusterware manual management policy. All other databases and services should not be affected, and should continue to function. If this is not desirable, then before proceeding with the upgrade, ensure that Oracle Clusterware manages databases using Oracle ASM, and set the automatic management policy on databases managed by Oracle Clusterware."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ALL_NODES_UPGRADE_ON_WIN
/-------------------------------------------------------------------------------
41712, 0,"Installer has detected that the Oracle Clusterware software on this cluster is not functioning properly on the following nodes %s."
// *Cause: The Oracle Clusterware software configured on the system is not in a suitable state to upgrade.
// *Action: Ensure that the Oracle Clusterware software is in a consistent state to perform an upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INTEGRITY_FAILED
/-------------------------------------------------------------------------------
41713, 0,"The installer has detected that one or more nodes (%s) that are part of the cluster are down. Installer will perform upgrade of Grid Infrastructure only on the nodes that are up. The remaining nodes can be upgraded later, following the manual steps as detailed in the documentation."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODESEL_NODE_DOWN_WRN
/-------------------------------------------------------------------------------
41714, 0,"The installer has detected that you are performing a non-rolling upgrade. Oracle recommends that you perform rolling upgrade of Oracle Grid Infrastructure operated in Flex Cluster Mode."
// *Cause: n/a
// *Action: Ensure that the Oracle Clusterware stack, on all nodes in the cluster (Hub and Leaf nodes), is up and running prior to the upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_FLEX_NOT_ROLLING_UPGRADE_WARN
/-------------------------------------------------------------------------------
41715, 0,"The installer has detected that you are performing a non-rolling upgrade and the Oracle Clusterware stack is running on one or more leaf node(s) selected for upgrade."
// *Cause: n/a
// *Action: Ensure that the Oracle Clusterware stack is down on all the leaf nodes in the cluster, prior to the upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_NON_ROLLING_LEAF_NODES_NOT_DOWN_ERR
/-------------------------------------------------------------------------------
41716, 0,"The installer has detected that one or more nodes (%s) that are part of the cluster are down."
// *Cause: n/a
// *Action: Either run crsctl delete on the unreachable nodes or ensure all the nodes of the cluster are up.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DELNODESEL_NODE_DOWN_ERR
/-------------------------------------------------------------------------------
41717, 0,"Installer has detected that the following list of node(s) are still part of the cluster even though they are unreachable : %s."
// *Cause: n/a
// *Action: Either the clusterware stack should be offline on the node(s) so they would not be considered for upgrade or the node(s) need to be online and reachable.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODESEL_NODE_DOWN_ACTIVE_CSS_ERR
/-------------------------------------------------------------------------------
41718, 0,"You must delete or downgrade Clusterware-managed Oracle databases and de-install Clusterware-managed Oracle homes before attempting to remove the Oracle Clusterware home on nodes %s."
// *Cause: An attempt was made to deconfigure the Oracle Clusterware when one or more Clusterware-managed Oracle databases still exist.
// *Action: Run the Oracle Clusterware deconfiguration tool from Clusterware-managed Oracle homes on nodes %s to delete, deconfigure or downgrade Oracle database and then run the same tool from Oracle Clusterware home to deconfigure Clusterware.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DELNODESEL_RAC_DB_EXISTS_ERR
/-------------------------------------------------------------------------------
41719, 0,"Unable to detect if CRS is running on one or more of the remote nodes."
// *Cause: n/a
// *Action: Refer to the additional details below.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_REMOTE_NODE_CRS_STACK_NOT_RUNNING
/-------------------------------------------------------------------------------
41802, 0,"Unable to determine release of Oracle Automatic Storage Management running from home %s."
// *Cause: An Oracle Automatic Storage Management (Oracle ASM) home was found, but the Oracle ASM instance was down. The installer was unable to determine the Oracle ASM release.
// *Action: Ensure that the Oracle ASM instance installed in home %s is up, and then retry the installation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HA_ASM_HOME_FOUND_ERR
/-------------------------------------------------------------------------------
41803, 0,"An entry for Oracle ASM is found in the system registry or oratab, but it is not associated with a software home location."
// *Cause: An Oracle ASM entry was listed in the system registry or oratab, but Oracle ASM home %s was missing.
// *Action: Ensure that either the oratab or the system registry is correct, or that the inventory is not corrupted.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HA_ASM_ENTRY_FOUND_ERR
/-------------------------------------------------------------------------------
41804, 0,"An instance of a prior release Oracle ASM is running."
// *Cause: There is an Oracle ASM instance already running on the server.
// *Action: Upgrade the existing Oracle ASM instance to the current release.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_HA_UPGRADE_ASM_ERR
/-------------------------------------------------------------------------------
41806, 0,"Virtual IP name cannot be the same as the Single Client Access Name (SCAN): %s"
// *Cause: The name you provided for the virtual IP name is the same name used as the SCAN.
// *Action: Enter a name for the virtual IP that is different from the name you entered for the SCAN. 
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_NODE_VIP_SAME_AS_SCAN_ERR
/-------------------------------------------------------------------------------
41807, 0,"The installer has detected that Oracle Clusterware is not running on the following nodes: %s."
// *Cause: Either there was an error in starting the Oracle Clusterware stack on the specified nodes, or the root scripts on the specified nodes were not run.
// *Action: Run the root scripts on the nodes listed. If root scripts have already been run on these nodes, then examine the log file %s on each failed node to determine the reason for the Oracle Clusterware stack not starting
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CHECK_IF_ROOT_SCRIPT_INVOKED
/-------------------------------------------------------------------------------
41808, 0,"Possible invalid choice for OSASM Group."
// *Cause: The name of the group you selected for the OSASM group is commonly used to grant other system privileges (For example: asmdba, asmoper, dba, oper).
// *Action: Oracle recommends that you designate asmadmin as the OSASM group.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_INVALID_SYSASM_GROUP
/-------------------------------------------------------------------------------
41809, 0,"Possible invalid choice for OSDBA Group."
// *Cause: The group name you selected as the OSDBA for ASM group is commonly used for Oracle Database administrator privileges.
// *Action: Oracle recommends that you designate asmdba as the OSDBA for ASM group, and that the group should not be the same group as an Oracle Database OSDBA group.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_INVALID_DBA_GROUP
/-------------------------------------------------------------------------------
41810, 0,"Possible invalid choice for OSOPER Group."
// *Cause: The group name you selected as the OSOPER for ASM group is commonly used for Oracle Database administrator privileges.
// *Action: Oracle recommends that you designate asmoper as the OSOPER for ASM group, and that the group should not be the same group as an Oracle Database OSOPER group.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_INVALID_OPER_GROUP
/-------------------------------------------------------------------------------
41811, 0,"OSDBA for ASM and OSOPER for ASM groups are the same OS group."
// *Cause: The groups you selected granting the OSDBA for ASM and OSOPER for ASM system privileges are the same group.
// *Action: Oracle recommends that you designate different OS groups to grant the OSDBA for ASM and OSOPER for ASM system privileges.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_SAME_DBA_AND_OPER
/-------------------------------------------------------------------------------
41812, 0,"%s and OSASM are the same OS group."
// *Cause: The chosen values for %s group and the chosen value for OSASM group are the same.
// *Action: Select an OS group that is unique for ASM administrators. The OSASM group should not be the same as the OS groups that grant privileges for Oracle ASM access, or for database administration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_DBA_OR_OPER_SAME_AS_ASM
/-------------------------------------------------------------------------------
41813, 0,"OSDBA for ASM, OSOPER for ASM, and OSASM are the same OS group."
// *Cause: The group you selected for granting the OSDBA for ASM group for database access, and the OSOPER for ASM group for startup and shutdown of Oracle ASM, is the same group as the OSASM group, whose members have SYSASM privileges on Oracle ASM.
// *Action: Choose different groups as the OSASM, OSDBA for ASM, and OSOPER for ASM groups.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_DBA_AND_OPER_SAME_AS_ASM
/-------------------------------------------------------------------------------
41814, 0,"The installer has detected that some of the services of Oracle Grid Infrastructure are not running on this system."
// *Cause: There may have been an error in starting the Oracle Grid Infrastructure services, or you may not have run the root scripts starting these services on this server.
// *Action: Confirm that you have run the root scripts on this server. If the root scripts have been run, then examine the log file %s to determine the reason for the services failing to start.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_CHECK_IF_ROOT_SCRIPT_INVOKED
/-------------------------------------------------------------------------------
41815, 0,"The installer has detected that Oracle Clusterware is not upgraded to %s version."
// *Cause: Either there was an error in starting the Oracle Clusterware stack on some of the nodes, or the root scripts on some nodes were not run. If the Clusterware is upgraded from earlier versions, root upgrade script might not be run successfully on the specified nodes.
// *Action: Run the root scripts on the nodes listed. If root scripts have already been run on these nodes, then examine the log file %s on each failed node to determine the reason for the Oracle Clusterware stack not starting.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_CHECK_IF_ROOT_SCRIPT_INVOKED
/-------------------------------------------------------------------------------
41816, 0,"The installer has detected that Oracle Clusterware is not upgraded to %s version."
// *Cause: There might be an error in starting the Oracle Clusterware stack on the some of the nodes or there might be unreachable node(s) which are part of Oracle Clusterware.
// *Action: Examine the log file %s on each failed node to determine the reason for the Oracle Clusterware stack not upgraded to current release version. The unreachable nodes can be upgraded by following the manual steps as detailed in the documentation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_CHECK_IF_WIN_ROOTCRS_INVOKED
/-------------------------------------------------------------------------------
41817, 0,"The installer has detected that Oracle Clusterware is not running on the following nodes: %s."
// *Cause: There may have been an error in starting the Oracle Clusterware stack on the specified nodes.
// *Action: Examine the log file %s on each failed node to determine the reason for the Oracle Clusterware stack not starting.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CHECK_IF_WIN_ROOTCRS_INVOKED
/-------------------------------------------------------------------------------
41818, 0,"The installer has detected that some of the services of Oracle Grid Infrastructure are not running on this system."
// *Cause: There may have been an error in starting the Oracle Grid Infrastructure services.
// *Action: Examine the log file %s to determine the reason for the services failing to start.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_CHECK_IF_WIN_ROOTHAS_INVOKED
/-------------------------------------------------------------------------------
41871, 0,"The user account you are using to install the software is not a member of the following OS groups: %s"
// *Cause: The installation user account must be a member of all groups required for installation.
// *Action: Change the installation users group memberships to include the required OS system privileges groups, or select system privileges OS groups in which the installation owner is a member.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_NONMEMBER_OS_GROUPS
/-------------------------------------------------------------------------------
41872, 0,"The OS group you selected as the ASM Administration Operator Group (ASMOPER) may not exist on the server."
// *Cause: The installer cannot find the group you selected to be the ASMOPER group in the groups defined on the server, or in the Network Information Service (NIS).
// *Action: Confirm that the group you want to use as the ASMOPER group exists on the server, or in NIS. Create or specify another group if it does not exist.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADVANCED_INVALID_OS_GROUP
/-------------------------------------------------------------------------------
41873, 0,"Invalid value specified for OSOPER Group."
// *Cause: OS group %s specified for OSOPER Group contains one or more invalid characters.
// *Action: Remove the invalid characters (%s) from %s or select an existing OS Group for OSOPER Group.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OSGROUP_BADCHARS_ERR
/-------------------------------------------------------------------------------
41874, 0,"Oracle ASM Administrator (OSASM) Group specified is same as the inventory group."
// *Cause: Operating system group %s specified for OSASM Group is same as the inventory group.
// *Action: It is not recommended to have OSASM group same as inventory group. Select any of the group other than the inventory group to avoid incorrect configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_SAME_AS_INVENTORY_GROUP
/-------------------------------------------------------------------------------
41875, 0,"Oracle ASM Administrator (OSASM) Group specified is same as the users primary group."
// *Cause: Operating system group %s specified for OSASM Group is same as the users primary group.
// *Action: It is not recommended to have OSASM group same as primary group of user as it becomes the inventory group. Select any of the group other than the primary group to avoid misconfiguration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_SAME_AS_PRIMARY_GROUP
/-------------------------------------------------------------------------------
41876, 0,"The node listener user name provided cannot be root."
// *Cause: n/a
// *Action: Provide a non root user for the node listener user.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LISTENER_USER_CANNOT_BE_ROOT
/-------------------------------------------------------------------------------
41877, 0,"The node listener user name provided cannot be same as the installing user."
// *Cause: n/a
// *Action: Provide a user other than the installing user.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LISTENER_USER_SAME_AS_INSTALL_USER
/-------------------------------------------------------------------------------
41878, 0,"The node listener user ('%s') provided does not exist on nodes which are provided for cluster configuration."
// *Cause: n/a
// *Action: Ensure that a user who is existing on nodes is provided for node listener.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LISTENER_USER_DOES_NOT_EXIST
/-------------------------------------------------------------------------------
41879, 0,"User name for node listener was not provided for clusterware configuration."
// *Cause: n/a
// *Action: Ensure that a valid user name is provided for node listener.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LISTENER_USER_NOT_PROVIDED
/-------------------------------------------------------------------------------
41880, 0,"User for node listener cannot be a member of Oracle ASM Administrator (OSASM) group."
// *Cause: n/a
// *Action: Ensure that the user is not a member of OSASM group specified.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LISTENER_USER_MEMBER_OF_OSASM_GROUP
/-------------------------------------------------------------------------------
41881, 0,"Installer has detected that the group specified for %s is not same as the group '%s' retrieved from the current configuration of grid software. The upgrade operation will not be successful if the same group name is not selected."
// *Cause: n/a
// *Action: Select the same group and proceed further.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_OS_GROUP_NOT_MATCH
/-------------------------------------------------------------------------------
41882, 0,"The node listener user name provided cannot be nobody."
// *Cause: n/a
// *Action: Provide a valid username for the node listener user.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LISTENER_USER_CANNOT_BE_NOBODY
/-------------------------------------------------------------------------------
41883, 0,"The value is not specified for %s."
// *Cause: n/a
// *Action: Specify a valid group name for %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GROUPS_CAN_NOT_BE_NULL
/-------------------------------------------------------------------------------
41884, 0,"The %s group could not be retrieved from the existent Oracle Grid Infrastructure configuration."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CANNOT_RETRIEVE_GROUP_FOR_UPGRADE
/-------------------------------------------------------------------------------
41901, 0,"The Oracle Grid Infrastructure Typical installation cannot be performed on this system."
// *Cause: The installer has detected the existence of vendor-specific clusterware. The typical Oracle Grid Infrastructure installation is a simplified configuration that is not designed to co-exist with clusterware other than Oracle Clusterware.
// *Action: Select Advanced Installation for Oracle Grid Infrastructure. This option allows you to specify configuration information required for Oracle Clusterware to operate with other vendor clusterware.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_TYPICAL_INSTALL_DISALLOWED_VENDOR
/-------------------------------------------------------------------------------
41902, 0,"The Oracle Grid Infrastructure Typical installation cannot be performed on this system."
// *Cause: The installer has detected the existence of Oracle RAC 9i release 9.x on this server. The Oracle Grid Infrastructure Typical installation is a simplified configuration that is not designed to support older versions of Oracle RAC.
// *Action: Select Advanced Installation for Oracle Grid Infrastructure. This option allows you to specify configuration information required for Oracle Clusterware to operate with Oracle RAC release 9.x.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_TYPICAL_INSTALL_DISALLOWED_COEX
/-------------------------------------------------------------------------------
42001, 0,"The same drive letter %s cannot be assigned to more than one partition"
// *Cause: n/a
// *Action: Provide different drive letters to each partition.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.DRIVE_LETTER_ALREADY_ASSIGNED
/-------------------------------------------------------------------------------
42002, 0,"The specified partition cannot be used."
// *Cause: The specified partition was selected for storing the software binaries.
// *Action: Instead, choose a location that is formatted for storing data files.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SOFTWARE_PARTITION_NOT_RECOMMENDED
/-------------------------------------------------------------------------------
42003, 0,"No partitions selected"
// *Cause: No partitions were selected or partition details provided were incomplete.
// *Action: Specify one or more partitions. For each partition, select the format option and drive letter you want to have assigned to that partition.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.NO_PARTITION_SELECTED
/-------------------------------------------------------------------------------
42004, 0,"No free drive letters available"
// *Cause: The local server did not have any available drive letters to assign to partitions.
// *Action: Make drive letters available on the server, and then restart the installer. 
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.DRIVE_LETTERS_NOT_AVAILABLE
/-------------------------------------------------------------------------------
42005, 0,"The drive letter is not assigned to one or more partitions"
// *Cause: Each partition you select must have an assigned drive letter.
// *Action: Ensure all partitions you want to use are configured with drive letters.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.DRIVE_LETTER_NOT_SELECTED
/-------------------------------------------------------------------------------
42006, 0,"Selected drive letter (%s) is invalid or not available for usage."
// *Cause: Either the drive letter is invalid, or it is already assigned to an existing partition.
// *Action: Select a valid drive letter.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.DRIVE_LETTER_NOT_VALID
/-------------------------------------------------------------------------------
42011, 0,"The operating system group specified for oraInventory group is invalid."
// *Cause: The user account running the installation must have the oraInventory group as its primary group.
// *Action: Change the oraInventory group to the primary group of the installation owner account, or change the installation owner groups so that the group you want to use for the oraInventory group is the primary group of the installation owner.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ORAINVENTORY_GROUP_NOT_SAME_AS_PRIMARY_GROUP
/-------------------------------------------------------------------------------
42012, 0,"The current Grid home is not registered in the central inventory on this host."
// *Cause: The wizard finds that this Grid home is not registered in the central inventory.
// *Action: Register the Grid home in the central inventory by using a cloning operation, or by using an attach-home operation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_HOME_NOT_REGISTERED
/-------------------------------------------------------------------------------
42013, 0,"Installation user cannot configure the Grid home."
// *Cause: The wizard has detected that the existing Grid home was not installed or cloned using the current user id: %s.
// *Action: Either restart the wizard as the user account that was used previously to install the Grid home, or re-clone the Grid home using the current user account.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_USER_INVALID
/-------------------------------------------------------------------------------
42014, 0,"Oracle Grid Infrastructure cannot be configured."
// *Cause: The wizard has detected that Oracle Grid Infrastructure is already configured on this server.
// *Action: Before you can proceed, you must completely remove the configured instance.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_HA_ALREADY_CONFIGURED
/-------------------------------------------------------------------------------
42015, 0,"File missing from Grid home: %s"
// *Cause: The installer cannot find the specified file in the Grid home. The wizard requires this file to be present in the Grid home before it can proceed.
// *Action: Restore the home by re-cloning the home, or re-install the software from installation media.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_HOME_CRITICAL_FILE_MISSING
/-------------------------------------------------------------------------------
42016, 0,"The current Grid home is not registered in the central inventory on the following nodes: %s"
// *Cause: The wizard does not find this Grid home to be registered with the central inventory on some or all of the nodes specified.
// *Action: Register the Grid home on the specified nodes with the central inventory, either by using a cloning operation, or by using an attach-home operation. Restart the wizard after fixing this issue.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_REMOTEHOME_NOT_REGISTERED
/-------------------------------------------------------------------------------
42017, 0,"The Grid home is inconsistent on the following nodes: %s"
// *Cause: The wizard has detected that the Grid home is inconsistent on some or all of the nodes specified. Review the log file for further details.
// *Action: Ensure that the Grid home is consistent on all nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_REMOTEHOME_NOT_MATCHING
/-------------------------------------------------------------------------------
42018, 0,"Specified disk group is invalid."
// *Cause: The installer has detected that the specified disk group is not on the discovery path you provided.
// *Action: For the selected disks, specify a valid disk group name, to which these disk previously were assigned. Also ensure that the discovery path you provide includes the disks.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_ASM_DISKGROUP_NOT_FOUND
/-------------------------------------------------------------------------------
42019, 0,"The wizard is unable to detect a configured prior release instance of Oracle Grid Infrastructure for a cluster or Cluster Ready Services."
// *Cause: You can only use Oracle Grid Infrastructure Configuration Wizard to upgrade earlier releases of Oracle Grid Infrastructure for a cluster or Cluster Ready Services.
// *Action: Ensure Oracle Grid Infrastructure for a cluster or Cluster Ready Services is configured properly before using the configuration wizard. To perform any other upgrade, use the Oracle Grid Infrastructure installer, or run root configuration scripts directly.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_SIHA_UPGRADE_INVALID_OPTION
/-------------------------------------------------------------------------------
42020, 0,"The Wizard is unable to detect the user of Grid home."
// *Cause: The wizard is not able to detect the user of the existing Grid home. This might be because configuration file (%s) is modified/corrupted in the Grid home.
// *Action: Verify the correctness of the configuration file. If the file is corrupted, either restore the home by re-cloning the home or re-install the software from installation media.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_UNABLE_TO_DETECT_INSTALL_USER
/-------------------------------------------------------------------------------
42021, 0,"Multibyte characters in SCAN Name"
// *Cause: In Typical install SCAN Name is also used as Cluster Name. The SCAN name contains multibyte characters which are invalid for Cluster Name.
// *Action: Ensure that SCAN Name contains valid characters for Cluster Name. Valid characters for Cluster Name can be lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen (-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MULTIBYTE_CHARS_IN_SCANNAME_ERR
/-------------------------------------------------------------------------------
42022, 0,"Multibyte characters in Cluster Name."
// *Cause: Multibyte characters are not allowed in Cluster Name.
// *Action: Ensure the Cluster Name contains valid characters. Valid characters for Cluster Name can be lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen (-).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MULTIBYTE_CHARS_IN_CLUSTERNAME_ERR
/-------------------------------------------------------------------------------
42023, 0,"Invalid option specified for Oracle Grid Infrastructure Wizard."
// *Cause: The Oracle Grid Infrastructure Wizard only supports Configuring Oracle Grid Infrastructure for a cluster or Upgrading an existing Grid Infrastructure.
// *Action: Ensure that you select one of the supported options.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_INVALID_CONFIG_OPTION
/-------------------------------------------------------------------------------
42024, 0,"Installer has detected that the group configured for %s privilege in the current home does not match with the group name retrieved (%s) from the home where earlier version of Oracle Clusterware is configured presently."
// *Cause: n/a
// *Action: Reinstall the software in a different home, selecting the correct group for %s . Alternatively you can modify the group configured for the current home by making suitable modification to the software.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_UPGRADE_OS_GROUP_NOT_MATCH
/-------------------------------------------------------------------------------
42025, 0,"Grid Infrastructure Home is not suitable to be configured on this cluster"
// *Cause: The Grid Infrastructure Home is registered with the local user. Confinguration cannot continue.
// *Action: Ensure that the Grid Infrastructure Home is registered with a secure domain user for configuration to continue.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_LOCAL_USER_INVALID
/-------------------------------------------------------------------------------
42026, 0,"Configuring GNS on a dynamic network (DHCP) is not supported for servers managed by operating system provided clustering software."
// *Cause: n/a
// *Action: Ensure DHCP option is not chosen as enabled while configuring clusterware on servers managed by operating system provided clustering software.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DHCP_IN_VENDOR_CLUSTER_ERR
/-------------------------------------------------------------------------------
42027, 0,"The specified Oracle base location is not correct."
// *Cause: The Oracle base location %s specified in the response file or passed through command line is not the same as %s that is associated with the Oracle home %s.
// *Action: Specify the correct Oracle base location to proceed through the ORACLE_BASE response file variable.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRSCONFIG_ORACLE_BASE_MISMATCH_ERR
/-------------------------------------------------------------------------------
42028, 0,"The software of this home is already set up in this server."
// *Cause: n/a
// *Action: Choose a different install option.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_SWONLY_ALREADY_REGISTERED
/-------------------------------------------------------------------------------
42099, 0,"Oracle Service username is not specified."
// *Cause: For Management Database option its mandatory to specify Oracle Service username.
// *Action: Specify Oracle Service username.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_COMMON_NO_SVCUSERNAME_SPECIFIED
/-------------------------------------------------------------------------------
42100, 0,"GNS Client data file not specified."
// *Cause: To configure Shared GNS, a GNS Client data file has to be specified.
// *Action: Specify a valid GNS Client data file to configure shared GNS.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EMPTY_GNS_CLIENTDATAFILE
/-------------------------------------------------------------------------------
42101, 0,"File name specified as GNS Client data file is not a valid file."
// *Cause: Installer has detected that the specified GNS Client data file is not a valid file, or does not exist, or is not a readable file.
// *Action: Specify a valid GNS Client data file to configure shared GNS.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_GNS_CLIENTDATAFILE
/-------------------------------------------------------------------------------
42102, 0,"You have not chosen to configure Grid Naming Service (GNS)."
// *Cause: Configuring Grid Naming Service (GNS) is mandatory to configure an Oracle Domain Services Cluster.
// *Action: Choose to configure GNS.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GNS_NOT_SELECTED
/-------------------------------------------------------------------------------
42103, 0,"Configuring Grid Infrastructure with shared GNS option for Oracle Flex cluster is not supported."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SHARED_GNS_NOT_SUPPORTED_FOR_BIG_CLUSTER
/-------------------------------------------------------------------------------
42104, 0,"Configure DHCP option is not supported for IPV6 GNS VIP"
// *Cause: The specified value for the GNS virtual IP address is IPV6, for which DHCP is not supported.
// *Action: Ensure that the option to Configure DHCP assigned Virtual IPs to the nodes is deselected.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DHCP_NOT_SUPPORTED_FOR_IPV6
/-------------------------------------------------------------------------------
42105, 0,"Specified Grid Naming Service (GNS) subdomain is not valid."
// *Cause: The subdomain (%s) does not follow the standard format for domain name labels. A valid GNS subdomain consists of two or more alphanumeric labels separated by the dot (.) character. The GNS subdomain cannot start nor end with a dot character. Labels can contain the hyphen (-) character, but cannot start nor end with it. There cannot be two consecutive hyphen characters in a label.
// *Action: Specify a valid Grid Naming Service (GNS) subdomain. It is mandatory when configuring DHCP assigned virtual IPs to the nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GNS_DOMAIN_NOT_VALID_FORMAT
/-------------------------------------------------------------------------------
42106, 0,"The provided %s file location is not supported."
// *Cause: The %s file location should not be a UNC path.
// *Action: Provide the %s file location which is not on a UNC path.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_DATA_UNC_PATH_NOT_SUPPORTED
/-------------------------------------------------------------------------------
42107, 0,"Installer was unable to verify the GNS client data file."
// *Cause: n/a
// *Action: Ensure that the GNS server is reachable for verification of client data file, and the client data file is valid.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UNABLE_TO_VALIDATE_GNS_CLIENTDATAFILE
/-------------------------------------------------------------------------------
42108, 0,"Configuring Grid Infrastructure with shared GNS is not supported for Oracle Domain Services Cluster."
// *Cause: n/a
// *Action: Choose to configure a new GNS for this cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOMAIN_CLUSTER_SHARED_GNS_NOT_ALLOWED
/-------------------------------------------------------------------------------
42109, 0,"It is not allowed to configure an Oracle Member Cluster with multiple manifest files for Cluster Domain Services."
// *Cause: n/a
// *Action: Ensure that only one Member Cluster Manifest file is specified for all the required Cluster Domain Services.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_DIFF_DATA_FILE
/-------------------------------------------------------------------------------
42501, 0,"The installer has detected that this Oracle home is already registered in the central inventory."
// *Cause: You can only register an Oracle home once.
// *Action: If you want to configure Oracle Grid Infrastructure for a Cluster or Upgrade Oracle GI or Oracle ASM, you can run the Config Wizard: %s
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_ALREADY_REGISTERED_HOME
/-------------------------------------------------------------------------------
42502, 0,"The installer has detected that the Oracle home location provided in the command line is not correct."
// *Cause: The Oracle home value set in the command line %s is not textually the same as %s (identified by the installer from the executed Grid Setup command).
// *Action: Specify the correct Oracle home location through the ORACLE_HOME command line variable. If you do not set it, the Installer will specify the right one.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_WRONG_CMDLINE_HOME
/-------------------------------------------------------------------------------
42503, 0,"The installer has detected that the Oracle home location provided in the response file is not correct."
// *Cause: The Grid Infrastructure Oracle home is the location from where the gridSetup script is executed. It has been detected that the value set in the response file is different (%s). Value expected is: %s
// *Action: It is not required to specify ORACLE_HOME in the response file for Grid Infrastructure installation. Alternatively, set it to the location of the gridSetup script (%s).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_WRONG_RSPFILE_HOME
/-------------------------------------------------------------------------------
42504, 0,"Could not validate the Oracle Grid Infrastructure home contents."
// *Cause: Some files are missing from the Oracle Grid Insfrastructure home.
// *Action: Ensure that the Oracle Grid Insfrastructure home is not corrupt.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_GOLDIMAGE_FILES_LIST_FILE_MISSING
/-------------------------------------------------------------------------------
42505, 0,"The installer has detected that the Oracle Grid Infrastructure home software at (%s) is not complete."
// *Cause: Following files are missing:
//         %s
// *Action: Ensure that the Oracle Grid Infrastructure home at (%s) includes the files listed above.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_GOLDIMAGE_FILES_MISSING
/-------------------------------------------------------------------------------
42506, 0,"The installer has detected that there are files in the Oracle Grid Infrastructure home (%s) which are not owned by the user (%s)."
// *Cause: Following files are not owned by the user (%s):
//         %s
// *Action: Ensure that the files listed above are owned by the user (%s).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_GOLDIMAGE_FILES_OWNER_MISMATCH
/-------------------------------------------------------------------------------
42507, 0,"Installer has detected an invalid entry in the central inventory corresponding to Oracle home (%s)."
// *Cause: n/a
// *Action: Choose a different location as Oracle home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.GRIDSETUP_INVALID_HOME_REGISTERED
/-------------------------------------------------------------------------------
43001, 0,"Cluster type not specified"
// *Cause: Either cluster type is not specified or invalid value is specified
// *Action: Specify a valid cluster type.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_CLUSTERTYPE
/-------------------------------------------------------------------------------
43002, 0,"Leaf nodes cannot be configured as part of this Oracle Flex Cluster configuration."
// *Cause: Installer has detected 9i Oracle Real Application Cluster Database on this host. Leaf nodes cannot be configured as part of Oracle Flex Cluster configuration, on a host that has 9i Oracle RAC database configured on it.
// *Action: You can configure Oracle Flex cluster without including Leaf nodes. Alternatively, you can configure Oracle Flex cluster with leaf nodes after removing 9i Oracle RAC Database.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_LEAF_NODE_92RAC
/-------------------------------------------------------------------------------
43003, 0,"Leaf nodes cannot be configured as part of this Oracle Flex Cluster configuration."
// *Cause: Installer has detected operating system provided clustering software on this host. Leaf nodes cannot be configured as part of Oracle Flex cluster configuration, on a host that is managed by operating system provided clustering software.
// *Action: You can configure Oracle Flex cluster without including Leaf nodes on hosts managed by operating system provided clustering software. Alternatively, you can configure Oracle Flex Cluster with leaf nodes after disabling the operating system provided clustering software.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_LEAF_NODE_VC
/-------------------------------------------------------------------------------
43004, 0,"Oracle Flex Cluster cannot be configured on this host."
// *Cause: Installer has detected Oracle Clusterware on this host. Oracle Flex Cluster cannot be configured on a host that already has Oracle Clusterware installed.
// *Action: Remove the existing Oracle Clusterware software before choosing to configure Oracle Flex Cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_BIG_CLUSTER_UPGRADE
/-------------------------------------------------------------------------------
43005, 0,"Specify a list of Site names for your Oracle Extended Cluster configuration"
// *Cause: n/a
// *Action: To configure an Oracle Extended Cluster, you need to specify %s to %s site names, where your servers will be located.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SITES_NOT_SPECIFIED
/-------------------------------------------------------------------------------
43006, 0,"The number of site names specified is invalid."
// *Cause: n/a
// *Action: You have to specify %s to %s site names only.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_NUM_OF_SITES
/-------------------------------------------------------------------------------
43007, 0,"The specified site name contains invalid characters."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_SITE_NAME
/-------------------------------------------------------------------------------
43008, 0,"Oracle Extended Cluster cannot be configured on this server, since it is managed by operating system provided clustering software."
// *Cause: n/a
// *Action: You may choose an alternate type of configuration or remove the operating system provided clustering software to proceed with this configuration
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_EXTENDED_CLUSTER_VC
/-------------------------------------------------------------------------------
43009, 0,"Installer has detected 9i Oracle Real Application Cluster Database on this host. Oracle Extended Cluster cannot be configured on a host that has 9i Oracle RAC database configured on it"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_EXTENDED_CLUSTER_92RAC
/-------------------------------------------------------------------------------
43010, 0,"Site Name:%s is too long."
// *Cause: The specified site name was too long.
// *Action: Provide a site name that is 15 or fewer characters in length.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SITE_NAME_EXCEED_MAXSIZE_ERR
/-------------------------------------------------------------------------------
43011, 0,"Duplicate site name(s) (%s) provided."
// *Cause: n/a
// *Action: Only unique site name(s) are allowed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_SITE_NAME_DUPLICATE_ERR
/-------------------------------------------------------------------------------
43012, 0,"Configuring an Oracle Member Cluster for Applications is not allowed in this platform."
// *Cause: n/a
// *Action: Specify a different cluster configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBERAPP_CLUSTER_NOT_SUPPORTED_PLATFORM_ERR
/-------------------------------------------------------------------------------
43013, 0,"Configuring an Oracle Cluster as an extended cluster is not allowed in this platform."
// *Cause: n/a
// *Action: Do not choose to configure this cluster as an extended cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_EXTENDED_CLUSTER_NOT_SUPPORTED_PLATFORM_ERR
/-------------------------------------------------------------------------------
43014, 0,"Configuring an Oracle Domain Services Cluster is not allowed in this platform."
// *Cause: n/a
// *Action: Specify a different cluster configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOMAIN_CLUSTER_NOT_SUPPORTED_PLATFORM_ERR
/-------------------------------------------------------------------------------
43015, 0,"Leaf nodes are not supported in an Oracle Domain Services Cluster."
// *Cause: n/a
// *Action: Specify only Hub nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOMAIN_CLUSTER_LEAF_NODES_NOT_SUPPORTED
/-------------------------------------------------------------------------------
43016, 0,"Configuring an Oracle Domain Services Cluster as an extended cluster is not supported."
// *Cause: n/a
// *Action: Do not choose to configure this cluster as an extended cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DISALLOW_EXTENDED_DOMAIN_CLUSTER
/-------------------------------------------------------------------------------
43017, 0,"Configuring an Oracle Member Cluster is not allowed in this platform."
// *Cause: n/a
// *Action: Specify a different cluster configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_NOT_SUPPORTED_PLATFORM_ERR
/-------------------------------------------------------------------------------
43018, 0,"Leaf nodes are not supported in an Oracle Member Cluster."
// *Cause: n/a
// *Action: Specify only Hub nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_LEAF_NODES_NOT_SUPPORTED
/-------------------------------------------------------------------------------
43021, 0,"All the nodes (%s) are down in the last batch."
// *Cause: Installer has detected that all the nodes specified in the last batch are down. There sould be at least one node up and running to complete the Grid Infrastructure upgrade.
// *Action: Ensure that at least one node in the last batch is running to complete the upgrade operation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_NODES_NOT_ALIVE_ON_LAST_BATCH
/-------------------------------------------------------------------------------
43022, 0,"You have selected to execute the root script manually. If some of the nodes are not reachable at the time of upgrade root script execution and if you would want to complete the Grid Infrastructure upgrade on the reachable nodes, you may be required to rerun the %s with -force flag from the last node after you have completed the execution of this script on all the reachable nodes.
//         
//         The remaining unreachable nodes can be upgraded later, following the manual steps as detailed in the documentation."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_NODES_UNREACHABLE_WARN
/-------------------------------------------------------------------------------
43024, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_AUTO_ROOT_EXECUTION_LAST_BATCH
/-------------------------------------------------------------------------------
43025, 0,"Installer has detected that there are nodes with different roles in batch(%s)."
// *Cause: n/a
// *Action: Define batches such that they have nodes with the same role.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_AUTO_ROOT_EXECUTION_BATCH_MULTIPLE_NODE_ROLES
/-------------------------------------------------------------------------------
43026, 0,"Installer has detected that batch(%s) contains LEAF nodes and batch(%s) contains HUB nodes."
// *Cause: n/a
// *Action: Reorder the batches such that batch with HUB nodes is processed first.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_AUTO_ROOT_EXECUTION_LEAF_BATCH_BEFORE_HUB_BATCH
/-------------------------------------------------------------------------------
43027, 0,"Unable to detect if the Oracle Clusterware stack is running on the following nodes: %s."
// *Cause: The Oracle Clusterware stack is not running on the local node.
// *Action: Open a console, log in as root or Administrator and start the Oracle Clusterware stack with this command: %scrsctl start crs
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_LOCAL_CRS_STACK_NOT_UP_FOR_INTEGRITY_CHECK
/-------------------------------------------------------------------------------
43041, 0,"CLUSTER_NEW_VIRTUAL_HOSTNAMES parameter was not specified."
// *Cause: The CLUSTER_NEW_VIRTUAL_HOSTNAMES parameter was not provided for performing addnode operation.
// *Action: Ensure that CLUSTER_NEW_VIRTUAL_HOSTNAMES parameter is passed. Refer to installation guide for more information on the syntax of passing CLUSTER_NEW_VIRTUAL_HOSTNAMES parameter.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_CLUSTER_VIRTUAL_IP_NOT_PASSED
/-------------------------------------------------------------------------------
43042, 0,"The cluster nodes %s specified for addnode is already part of a cluster."
// *Cause: Cluster nodes specified already has clusterware configured.
// *Action: Ensure that the nodes that do not have clusterware configured are provided for addnode operation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_ALREADY_PART_OF_CLUSTER
/-------------------------------------------------------------------------------
43043, 0,"Parameters specified for addnode operation are missing details for nodes."
// *Cause: Some of the parameters passed for addnode operation have incomplete details of the node to be added.
// *Action: Ensure that the nodes details are appropriately specified and each node have the associated details in parameters.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_PARAMETERS_MISSING
/-------------------------------------------------------------------------------
43044, 0,"Addnode operation cannot be performed from a Leaf node."
// *Cause: Leaf node cannot be local node while performing addnode operation.
// *Action: Ensure that the addnode operation is performed from a Hub node.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_CANNOT_BE_PERFORMED
/-------------------------------------------------------------------------------
43045, 0,"%s parameter was not specified."
// *Cause: The %s parameter was not provided for performing addnode operation.
// *Action: Ensure that %s parameter is passed. Refer to installation guide for more information on the syntax of passing CLUSTER_NEW_VIRTUAL_HOSTNAMES parameter.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_NEW_NODE_ROLES_NOT_SPECIFIED
/-------------------------------------------------------------------------------
43046, 0,"The Oracle home location contains directories or files on following remote nodes:%s."
// *Cause: n/a
// *Action: The Oracle home location would be overwritten with new software. If you want to retain the software on remote nodes, use -noCopy option for addnode operation.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_LOCATION_NON_EMPTY_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
43047, 0,"Clusterware configured in Auto mode cannot have nodes of type HUB or LEAF."
// *Cause: n/a
// *Action: Ensure that the nodes provided for addnode configuration are of type Auto.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NON_AUTO_NODE_NOT_ALLOWED_FOR_AUTO_CLUSTER
/-------------------------------------------------------------------------------
43048, 0,"An Auto node cannot be added to a cluster having only Hub and Leaf nodes."
// *Cause: n/a
// *Action: Ensure that the nodes provided for addnode configuration are of type HUB or LEAF.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_AUTO_NODE_NOT_ALLOWED_FOR_MANUAL_CLUSTER
/-------------------------------------------------------------------------------
43049, 0,"Hub nodes cannot be added to the cluster as it is already having %s Hub nodes which is the maximum number of Hub nodes for an Oracle Flex cluster."
// *Cause: n/a
// *Action: Ensure that the nodes of type other than Hub are provided for addnode configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_HUB_NODE_NOT_ALLOWED_FOR_MXHUBSIZE_CLUSTER
/-------------------------------------------------------------------------------
43050, 0,"Installer has detected that the clusterware configured on the system is not running from the grid home on which addnode is being performed."
// *Cause: n/a
// *Action: Ensure that the clusterware is configured and is running from the home on which the addnode is being performed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_CLUSTERWARE_NOT_RUNNING_FROM_HOME
/-------------------------------------------------------------------------------
43051, 0,"Virtual Hostname was not specified for performing addnode operation."
// *Cause: n/a
// *Action: Ensure that the Virtual Hostname is provided for each node on which addnode operation is being performed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_VIRTUAL_HOSTNAMES_NOT_SPECIFIED
/-------------------------------------------------------------------------------
43052, 0,"The Oracle home location contains directories or files on following remote nodes:%s."
// *Cause: n/a
// *Action: Please provide valid Oracle home location which is empty.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_NODE_LOCATION_NON_EMPTY_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
43053, 0,"Leaf nodes cannot be added to this Oracle Cluster configuration."
// *Cause: Oracle Grid Infrastructure does not allow LEAF nodes to be configured as part of this Oracle Cluster configuration.
// *Action: Specify only HUB nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_LEAF_NODE_NOT_ALLOWED
/-------------------------------------------------------------------------------
43054, 0,"Installer has detected public hostname is same as the SCAN name i.e. %s"
// *Cause: n/a
// *Action: Provide the SCAN name that does not match the hostname OR public hostname that does not match the SCAN name
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SCAN_NAME_IS_SAME_AS_PUB_NODE_NAME
/-------------------------------------------------------------------------------
43055, 0,"The Oracle home location is not registered in the central inventory and is not empty in following remote nodes: %s."
// *Cause: n/a
// *Action: Ensure the Oracle home location is empty in such nodes. If not, the Oracle home location would be overwritten with new software.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_ORACLE_HOME_NON_EMPTY_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
43056, 0,"Leaf nodes cannot be added to this Oracle cluster configuration."
// *Cause: Oracle Grid Infrastructure does not support LEAF nodes to be part of this Oracle cluster configuration on this platform.
// *Action: Specify only HUB nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_LEAF_NODE_NOT_SUPPORTED
/-------------------------------------------------------------------------------
43057, 0,"Leaf nodes cannot be added to this Oracle cluster configuration."
// *Cause: Leaf nodes cannot be part of an Oracle cluster configuration on a host that is managed by operating system provided clustering software.
// *Action: Specify only HUB nodes to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_LEAF_NODE_NOT_SUPPORTED_VC
/-------------------------------------------------------------------------------
43058, 0,"The specified site name %s is not part of the already configured list of sites %s."
// *Cause: n/a
// *Action: Specify site name(s) which are already configured as part of this Oracle Extended cluster configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_EXT_CLUSTER_SITES_NOT_CONFIGURED
/-------------------------------------------------------------------------------
43059, 0,"Site names are not specified."
// *Cause: n/a
// *Action: To add nodes to a Oracle Extended cluster, you need to specify site names, where your servers or nodes are located.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_EXT_CLUSTER_SITES_NOT_SPECIFIED
/-------------------------------------------------------------------------------
43060, 0,"Virtual hostname(s) are not required to be specified for adding a node to a VIP-less cluster."
// *Cause: n/a
// *Action: Do not specify the virtual hostname(s).
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_VIPLESS_CLUSTER_VIP_PROVIDED
/-------------------------------------------------------------------------------
43066, 0,"The installer has detected that Oracle Clusterware is not running on the following nodes: %s. Ignore the warning if any policy managed databases software are not extended to new nodes yet."
// *Cause: Either there was an error in starting the Oracle Clusterware stack on the specified nodes, or the root scripts on the specified nodes were not run.
// *Action: Run the root scripts on the nodes listed. If root scripts have already been run on these nodes, then examine the log file %s on each failed node to determine the reason for the Oracle Clusterware stack not starting
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ADDNODE_CHECK_IF_ROOT_SCRIPT_INVOKED
/-------------------------------------------------------------------------------
43080, 0,"Some of the configuration assistants failed, were cancelled or skipped."
// *Cause: n/a
// *Action: Refer to the logs or contact Oracle Support Services.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_CONFIG_TOOL_FAILED
/-------------------------------------------------------------------------------
43100, 0,"Installer has detected that the free space available in the ASM diskgroup %s is %s, and it is insufficient to proceed with the upgrade. To upgrade Oracle Grid Infrastructure you should have at least %s free space in this diskgroup."
// *Cause: n/a
// *Action: Add additional disks to the diskgroup such that the total size should be at least %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSUFFICIENT_SPACE_IN_ASM_DISKS_UPGRADE
/-------------------------------------------------------------------------------
43101, 0,"Insufficient space available in shared file system for the Voting Disk File Location %s."
// *Cause: n/a
// *Action: Ensure that the shared file system has at least %s of free space.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_OCR_NOT_ENOUGH_FREESPACE_ERR
/-------------------------------------------------------------------------------
43102, 0,"You cannot upgrade Oracle Grid Infrastructure as Built-In Account."
// *Cause: The installer has detected that the Oracle Home user of the active Oracle Grid Infrastructure home is (%s). Oracle GI cannot be upgraded using Built-In Account for the current installation.
// *Action: Specify (%s) as the Oracle Home User to perform the upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_OH_USER_MISMATCH_ERR
/-------------------------------------------------------------------------------
43103, 0,"Oracle Grid Infrastructure Home is not suitable for upgrade."
// *Cause: The wizard has detected that the Oracle Home user of the active Oracle Grid Infrastructure home is %s, whereas the Oracle Home user of the current home is Built-In Account.
// *Action: Re-install the Oracle Grid Infrastructure software using the appropriate Oracle Home User to perform the upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_UPGRADE_OH_USER_MISMATCH_ERR
/-------------------------------------------------------------------------------
43104, 0,"If you intend to use this Oracle Grid Infrastructure home to upgrade the active instance of Oracle Grid Infrastructure, then the specified user is invalid."
// *Cause: The installer has detected that the specified Oracle Home user does not match the Oracle Home user of the active Oracle Grid Infrastructure home(%s).
// *Action: Specify (%s) as the Oracle Home User to be able to upgrade the active Oracle GI to this home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_SWONLY_OH_USER_MISMATCH_WRN
/-------------------------------------------------------------------------------
43105, 0,"Specified Oracle Home User (%s) is invalid."
// *Cause: The installer has detected that the specified Oracle Home user does not match the Oracle Home user of the active Oracle Grid Infrastructure home (%s).
// *Action: Specify (%s) as the Oracle Home User to perform the upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_UPGRADE_DOMAIN_USER_MISMATCH_ERR
/-------------------------------------------------------------------------------
43106, 0,"Oracle Grid Infrastructure Home is not suitable for upgrade "
// *Cause: The wizard has detected that the Oracle Home user of this home (%s)does not match the Oracle Home user of the active Oracle Grid Infrastructure home (%s).
// *Action: Re-install the Oracle Grid Infrastructure software using the appropriate Oracle Home User to perform the upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_UPGRADE_DOMAIN_USER_MISMATCH_ERR
/-------------------------------------------------------------------------------
43107, 0,"Invalid storage option selected."
// *Cause: Oracle Cluster storage cannot be configured to be on a remote cluster if the storage for Oracle Grid Infrastructure Management Repository(GIMR) is configured to be on local cluster.
// *Action: Choose an alternate storage option that would be configured on local cluster to proceed further.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_LOCAL_GIMR_CLIENT_ASM_INCOMPATIBLE
/-------------------------------------------------------------------------------
43108, 0,"Invalid Grid Infrastructure Management Repository (GIMR) option specified."
// *Cause: Oracle GIMR cannot be configured to be on a local cluster if the Oracle Cluster storage is configured to be on a remote cluster.
// *Action: Specify remote GIMR option to proceed further.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_CLIENT_ASM_LOCAL_GIMR_INCOMPATIBLE
/-------------------------------------------------------------------------------
43110, 0,"Empty value provided for OMS Host."
// *Cause: n/a
// *Action: Specify a valid OMS host name of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OMS_HOST_EMPTY
/-------------------------------------------------------------------------------
43111, 0,"Empty value provided for Enterprise Manager Admin password."
// *Cause: n/a
// *Action: Specify a valid value for Enterprise Manager Admin password of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OMS_PASSWORD_EMPTY
/-------------------------------------------------------------------------------
43112, 0,"Empty value provided for Enterprise Manager Admin user."
// *Cause: n/a
// *Action: Specify a valid value for Enterprise Manager Admin user of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OMS_USERNAME_EMPTY
/-------------------------------------------------------------------------------
43113, 0,"Empty value provided for OMS Port."
// *Cause: n/a
// *Action: Specify a valid OMS port of the Enterprise Manager Cloud Control.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OMS_PORT_INVALID
/-------------------------------------------------------------------------------
43114, 0,"Unable to connect to Enterprise Manager Cloud Control."
// *Cause: Invalid connection information specified.
// *Action: Specify valid connection information.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_OMS_CONNECTION_ERR
/-------------------------------------------------------------------------------
43201, 0,"Virtual Hostname : %s cannot be in IP Address format."
// *Cause: n/a
// *Action: Provide a valid virtual Hostname.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_VIP_IN_IP_ERR
/-------------------------------------------------------------------------------
43202, 0,"Installer has detected that hostname %s is assigned to another system on the network"
// *Cause: n/a
// *Action: Ensure that the virtual hostname specified is not assigned to any other system on the network.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_VIP_LIVE_ERR
/-------------------------------------------------------------------------------
43203, 0,"Installer has detected that hostname %s could not be resolved to a valid IP address."
// *Cause: n/a
// *Action: Ensure that the Virtual Hostname is resolvable to a valid IP address.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_VIP_UNKNOWN_HOST
/-------------------------------------------------------------------------------
43204, 0,"Virtual Hostname:%s does not start with a letter."
// *Cause: n/a
// *Action: Provide a value for the virtual hostname that starts with an alphabetic character.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_VIP_DOESNOT_STARTWITH_ALPHABET_ERR
/-------------------------------------------------------------------------------
43205, 0,"Value not specified for ACFS mount size."
// *Cause: n/a
// *Action: Provide a value for the ACFS mount size.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_STORAGE_ACFS_MOUNT_SIZE_EMPTY
/-------------------------------------------------------------------------------
43206, 0,"Provided storage option is not supported in Member Cluster for applications."
// *Cause: n/a
// *Action: Select an alternate storage option for Member Cluster for applications.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_CLUSTER_STORAGE_LOCAL_OR_NEAR_ASM
/-------------------------------------------------------------------------------
43207, 0,"No Public interface is designated for Member Cluster for applications."
// *Cause: n/a
// *Action: Specify at least one interface as Public.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_VIP_NOT_CONFIGURED
/-------------------------------------------------------------------------------
43208, 0,"%s on subnet %s chosen as public does not match subnet of Application VIP."
// *Cause: The chosen public interface is not on the same subnet as the Application VIP.
// *Action: Ensure the chosen public interface is on the same subnet as the Application VIP subnet, and that the same subnet is configured for Application VIPs on all cluster nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_PUBLIC_NOT_MATCH_APP_VIP
/-------------------------------------------------------------------------------
43209, 0,"Specified shared storage path is invalid."
// *Cause: n/a
// *Action: Specify a valid location on a shared file system.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_SHARED_LOCATION_VALIDATION
/-------------------------------------------------------------------------------
43210, 0,"Value is not specified for Cluster name."
// *Cause: n/a
// *Action: Provide a valid Cluster name.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_APP_CLUSTER_NAME_EMPTY
/-------------------------------------------------------------------------------
43301, 0,"The specified Member Cluster Manifest file path is empty."
// *Cause: n/a
// *Action: Provide a valid Member Cluster Manifest file.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_CREDENTIALS_FILE_EMPTY
/-------------------------------------------------------------------------------
43302, 0,"The I/O Storage Service is not supported in this platform."
// *Cause: n/a
// *Action: Do not specify to use the I/O Storage Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_IO_SERVICE_NOT_SUPPORTED
/-------------------------------------------------------------------------------
43303, 0,"The I/O Storage Service can only be selected when the ASM Storage Service is chosen."
// *Cause: n/a
// *Action: If I/O Storage Service is required, ensure that the ASM Storage Service is enabled; otherwise, do not select the I/O Storage Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_IO_SERVICE_WITHOUT_ASM_SERVICE
/-------------------------------------------------------------------------------
43304, 0,"The Grid Names Service cannot be chosen for Oracle Member Cluster for Applications."
// *Cause: n/a
// *Action: Do not specify to use the Grid Names Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBERAPP_CLUSTER_GNS_SERVICE_NOT_ALLOWED
/-------------------------------------------------------------------------------
43305, 0,"The Grid Names Service will be chosen."
// *Cause: The specified Member Cluster Manifest File contains GNS data.
// *Action: If the Grid Names Service is not required, specify a Member Cluster Manifest File that does not contain GNS data.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_GNS_DATA_IN_MEMBER_CLUSTER_DATA_FILE
/-------------------------------------------------------------------------------
43306, 0,"The following Cluster Domain Service will be chosen: %s."
// *Cause: The service data is available in the specified Member Cluster Manifest file.
// *Action: If the service is not required, specify a Member Cluster Manifest file that does not contain its data.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_SERVICE_IN_MEMBER_CLUSTER_DATA_FILE
/-------------------------------------------------------------------------------
43307, 0,"The following Cluster Domain Service cannot be chosen: %s."
// *Cause: The service data is not available in the specified Member Cluster Manifest file.
// *Action: If the service is required, specify a Member Cluster Manifest file that contains its data.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_SERVICE_NOT_IN_MEMBER_CLUSTER_DATA_FILE
/-------------------------------------------------------------------------------
43308, 0,"The Management Repository Service is not supported in this platform."
// *Cause: n/a
// *Action: Specify a Member Cluster Manifest file that does not contain data for the Management Repository Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_GIMR_SERVICE_NOT_SUPPORTED
/-------------------------------------------------------------------------------
43309, 0,"The following Cluster Domain Service is mandatory: %s."
// *Cause: The service data is not available in the specified Member Cluster Manifest file.
// *Action: Specify a Member Cluster Manifest file that contains data for this Cluster Domain Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_MANDATORY_SERVICE_NOT_AVAILABLE
/-------------------------------------------------------------------------------
43310, 0,"The I/O Storage Service cannot be chosen for Oracle Member Cluster for Applications."
// *Cause: n/a
// *Action: Do not specify to use the I/O Storage Service.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBERAPP_CLUSTER_IO_SERVICE_NOT_ALLOWED
/-------------------------------------------------------------------------------
43311, 0,"The provided Member Cluster Manifest file location is not supported."
// *Cause: The Member Cluster Manifest file location should not be a UNC path.
// *Action: Provide the Member Cluster Manifest file location which is not on a UNC path.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_DATA_FILE_UNC_PATH_NOT_SUPPORTED
/-------------------------------------------------------------------------------
43312, 0,"The specified Member Cluster Manifest file does not exist."
// *Cause: n/a
// *Action: Ensure that the Member Cluster Manifest file exists.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_DATA_FILE_NOT_EXISTS
/-------------------------------------------------------------------------------
43313, 0,"The specified Member Cluster Manifest file is not valid."
// *Cause: n/a
// *Action: Ensure that the provided Member Cluster Manifest file is valid.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_DATA_FILE_NOT_VALID
/-------------------------------------------------------------------------------
43314, 0,"Could not validate the Management Repository Service connectivity."
// *Cause: n/a
// *Action: Ensure the Management Repository Service is available on the Domain Services Cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_GIMR_SERVICE_CONNECTIVITY_CHECK_FAILED
/-------------------------------------------------------------------------------
43315, 0,"Specified Member Cluster Manifest file is not a valid file."
// *Cause: Installer has detected that the specified Member Cluster Manifest file does not have read or write permissions.
// *Action: Ensure that the Member Cluster Manifest file has proper permissions for the installation to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_MEMBER_CLUSTER_DATA_FILE_PERMISSION_NOT_VALID
/-------------------------------------------------------------------------------
43400, 0,"The specified source home path (%s) does not correspond to a valid Oracle Grid Infrastructure software home."
// *Cause: n/a
// *Action: Provide a valid Oracle GI software home as source home.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CREATEGOLDIMAGE_CRS_NOT_VALID_SOURCE_HOME
/-------------------------------------------------------------------------------
43401, 0,"The specified Oracle Grid Infrastructure source home is locked."
// *Cause: n/a
// *Action: Ensure the provided source home is unlocked.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CREATEGOLDIMAGE_CRS_SOURCE_HOME_LOCKED
/-------------------------------------------------------------------------------
44000, 0,"Passwordless SSH connectivity is not setup from the local node %s to the following nodes: 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Refer to the logs for more details or contact Oracle Support Services.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_REMOVE_BAD_NODES_NO_SSH
/-------------------------------------------------------------------------------
44001, 0,"Reachability check failed from the local node %s to the following nodes: 
//         %s
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: Check the network connectivity from the local node %s to the remote nodes 
//         %s
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_REMOVE_BAD_NODES_UNREACHABLE
/-------------------------------------------------------------------------------
44002, 0,"The Oracle home location contains directories or files on following remote nodes: 
//         %s. 
//         
//          These nodes will be ignored and not participate in the configured Grid Infrastructure."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.ACTIONABLE_CRS_NODE_LOCATION_NON_EMPTY_ON_REMOTE_NODES
/-------------------------------------------------------------------------------
44003, 0,"Upgrade of Grid Infrastructure has failed."
// *Cause: Installer has detected that the upgrade of Grid Infrastructure has failed on the following nodes 
//         %s
// *Action: You may choose to sever the failed nodes from the cluster and complete the upgrade by clicking Yes. Alternatively, you may click on No if you want to retry the execution of the root configuration script on the failed nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_FORCE_UPGRADE
/-------------------------------------------------------------------------------
44004, 0,"Local node is not specified in batch 1."
// *Cause: n/a
// *Action: Specify the local node in batch 1.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_UPGRADE_LOCAL_NODE_NOT_BATCH_ONE
/-------------------------------------------------------------------------------
44005, 0,"Installer has detected that batch number is missing for some of the nodes selected for upgrade."
// *Cause: Batch number is not specified for the following nodes selected for upgrade 
//         %s
// *Action: Specify a batch number for the above nodes selected for upgrade.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_UPGRADE_BATCH_NUM_MISSING
/-------------------------------------------------------------------------------
44006, 0,"Oracle Rapid Home Provisioning(RHP) Server cannot be configured for the chosen cluster type."
// *Cause: n/a
// *Action: Oracle Rapid Home Provisioning Server configuration is supported only for Oracle Domain Services Cluster.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_RHPSERVER_NOT_SUPPORTED_CLUSTERTYPE
/-------------------------------------------------------------------------------
44007, 0,"Installer has detected that Oracle Clusterware is not running on local node (%s)."
// *Cause: n/a
// *Action: Perform one of the following, before executing the configuration tools 
//          - Run the Installer on the node where Oracle Clusterware is running from this Oracle home 
//          - Open a terminal, log in as root or Administrator, change directory to this Oracle Clusterware home, and start Oracle Clusterware by entering this command: crsctl start crs
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_STACK_NOT_ACTIVE_LOCAL_NODE
/-------------------------------------------------------------------------------
44008, 0,"Installer has detected that Oracle Grid Infrastructure is not upgraded to current release version (%s)."
// *Cause: n/a
// *Action: Ensure that the Oracle Grid Infrastructure upgrade procedure is completed on all nodes before executing the configuration tools.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_STACK_UPGRADE_FAILED_LOCAL_NODE
/-------------------------------------------------------------------------------
44009, 0,"Installer is unable to detect if Oracle Grid Infrastructure is upgraded to current release version (%s)."
// *Cause: n/a
// *Action: Review the log file %s on the local node.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_STACK_UPGRADE_CHECK_UNEXPECTED_ERROR
/-------------------------------------------------------------------------------
44010, 0,"Installer has detected that Oracle Restart is not running."
// *Cause: n/a
// *Action: Perform one of the following, before executing the configuration tools 
//          - Run the Installer on the node where Oracle Restart is running from this Oracle home 
//          - Open a terminal, log in as root or Administrator, change directory to this Oracle Restart home, and start Oracle Restart by entering this command: crsctl start has
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SIHA_STACK_NOT_ACTIVE_LOCAL_NODE
/-------------------------------------------------------------------------------
44011, 0,"Installer has detected that Oracle Restart is not upgraded to current release version (%s)."
// *Cause: n/a
// *Action: Ensure that the Oracle Restart upgrade procedure is completed on the local node before executing the configuration tools.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SIHA_STACK_UPGRADE_FAILED_LOCAL_NODE
/-------------------------------------------------------------------------------
44012, 0,"Installer is unable to detect if Oracle Restart is upgraded to current release version (%s)."
// *Cause: n/a
// *Action: Review the log file %s on this machine.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.SIHA_STACK_UPGRADE_CHECK_UNEXPECTED_ERROR
/-------------------------------------------------------------------------------
44013, 0,"Domain Services Cluster mandates creation of separate diskgroup for storing OCR backup, GIMR data, Rapid Home Provisioning data, and Trace File Analyzer data. Specify the required details to create a new diskgroup for this purpose."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOMAIN_SERVICES_CLUSTER_GIMR_DISKGROUP_MANDATORY
/-------------------------------------------------------------------------------
44014, 0,"Configuring a cluster with one hub node and one or more leaf node(s) is not supported."
// *Cause: At least two hub nodes are required while configuring the cluster with leaf node(s).
// *Action: Add additional hub node to the cluster configuration, or configure cluster without any leaf nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_INVALID_COMBINATION_FOR_HUB_AND_LEAF_NODES
/-------------------------------------------------------------------------------
44015, 0,"Passwordless SSH connectivity is not setup from the local node %s to itself."
// *Cause: n/a
// *Action: Verify that the passwordless SSH of the local node to itself has been setup.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_BAD_LOCAL_NODE_NO_SSH
/-------------------------------------------------------------------------------
45001, 0,"Location for %s is not specified."
// *Cause: n/a
// *Action: Specify a valid location for %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_NOT_PROVIDED_ERR
/-------------------------------------------------------------------------------
45002, 0,"The location %s specified for %s is invalid. Either the specified location is not found on the system or is detected to be a file."
// *Cause: n/a
// *Action: Specify a valid location for %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_LOCATION_ERR
/-------------------------------------------------------------------------------
45003, 0,"The location %s specified for %s contains one or more invalid characters."
// *Cause: n/a
// *Action: Specify a valid location for %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_BAD_CHAR_ERR
/-------------------------------------------------------------------------------
45004, 0,"Unable to create directory specified for %s. Either proper permissions were not granted to create the directory or there was no space left in the volume."
// *Cause: n/a
// *Action: Check the permissions on the selected directory or choose another directory.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_NOT_WRITEABLE_ERR
/-------------------------------------------------------------------------------
45005, 0,"The location %s specified for %s contains directories or files."
// *Cause: n/a
// *Action: Choose another location for %s or empty contents under %s to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_NOT_EMPTY_ERR
/-------------------------------------------------------------------------------
45006, 0,"Insufficient space available in location %s."
// *Cause: n/a
// *Action: Choose a location that has at least %s MB of free space.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_INSUFFICIENT_FREESPACE_ERR
/-------------------------------------------------------------------------------
45007, 0,"Invalid location specified for %s. The location %s is not shared across all nodes."
// *Cause: n/a
// *Action: Specify a valid location for %s that is shared across all nodes.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_NOT_SHARED_ERR
/-------------------------------------------------------------------------------
45008, 0,"The location %s specified for %s is not valid. Only locations on NAS are supported for the chosen ASM configuration type."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_NOT_NFS_TYPE_ERR
/-------------------------------------------------------------------------------
45009, 0,"Specified location for GIMR diskgroup is same as the location specified for OCR diskgroup."
// *Cause: n/a
// *Action: Specify different locations for OCR and GIMR diskgroups to proceed.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_OCR_GIMR_MOUNT_POINT_SAME
/-------------------------------------------------------------------------------
45010, 0,"Rapid Home Provisioning Server(RHPS) cannot be configured on this cluster."
// *Cause: Configuring RHPS requires Oracle ASM Cluster File System(ACFS) to be configured. ADVM/ACFS volumes cannot be configured on a diskgroup that includes thin-provisioned NFS files as disks.
// *Action: Do not select to configure RHPS or choose only locally attached disks for the diskgroup configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_RHPSERVER_SUPPORTED_ONLY_ON_REAL_DISKS
/-------------------------------------------------------------------------------
45011, 0,"The location %s specified for %s does not exist."
// *Cause: n/a
// *Action: Ensure that the location for %s exists or choose a location that exists.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_ASM_ON_NAS_MOUNT_POINT_DOES_NOT_EXISTS
/-------------------------------------------------------------------------------
45012, 0,"Rapid Home Provisioning Server(RHPS) configuration is not supported on this cluster."
// *Cause: Configuring Rapid Home Provisioning Server(RHPS) requires Oracle ASM Cluster File System(ACFS) drivers to be supported. ACFS drivers are not supported on this server.
// *Action: To proceed, do not specify or select the Configure RHPS option as part of this cluster configuration.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_RHPSERVER_CONFIGURATION_NOT_SUPPORTED
/-------------------------------------------------------------------------------
45101, 0,"Clusterware is not running on the local node."
// *Cause: n/a
// *Action: Ensure that the Clusterware is configured and is running on local node before proceeding.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GRIDPATCH_CRS_NOT_RUNNING
/-------------------------------------------------------------------------------
45102, 0,"The operation of moving Oracle Grid Infrastructure cannot be performed from the active clusterware Oracle home (%s)."
// *Cause: n/a
// *Action: Launch the installer from a Oracle Grid Infrastructure software location that is not configured still.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_GRIDPATCH_NOT_NEW_HOME
/-------------------------------------------------------------------------------
45103, 0,"The following node(s) cannot be added as they are already included in the table: %s."
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_ADD_NODE_DUPLICATE_HOSTNAMES
/-------------------------------------------------------------------------------
45201, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_MEMBER_RESTART_CREDENTIALS_FILE_EMPTY
/-------------------------------------------------------------------------------
45202, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_MEMBER_RESTART_DATA_FILE_NOT_EXISTS
/-------------------------------------------------------------------------------
45203, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_MEMBER_RESTART_DATA_FILE_UNC_PATH_NOT_SUPPORTED
/-------------------------------------------------------------------------------
45204, 0,"Configuring an Oracle Member Autostart is not allowed in this platform."
// *Cause: n/a
// *Action: To proceed, do not specify or select the Oracle Member Autostart configuration option.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_HA_MEMBER_AUTOSTART_NOT_SUPPORTED_PLATFORM_ERR
/-------------------------------------------------------------------------------
45500, 0,"Installer is unable to detect the pre-upgradedd oracle home."
// *Cause: n/a
// *Action: Review the log file %s for more details.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_EMPTY_OLD_HOME
/-------------------------------------------------------------------------------
45501, 0,"Installer is unable to detect the version of the pre-upgraded oracle home."
// *Cause: n/a
// *Action: Review the log file %s for more details.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_EMPTY_OLD_HOME_VERSION
/-------------------------------------------------------------------------------
45502, 0,"Installer is unable to detect the oracle base for the pre-upgraded oracle home."
// *Cause: n/a
// *Action: Review the log file %s for more details.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_EMPTY_OLD_BASE
/-------------------------------------------------------------------------------
45503, 0,"Installer is unable to detect the cluster name."
// *Cause: n/a
// *Action: Review the log file %s for more details.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_EMPTY_CLUSTER_NAME
/-------------------------------------------------------------------------------
45504, 0,"Installer is unable to detect the asm disk group name."
// *Cause: n/a
// *Action: Review the log file %s for more details.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_EMPTY_ASM_DISK_GROUP
/-------------------------------------------------------------------------------
45505, 0,"Installer has detected the current Oracle home is not registered in the central inventory on this server."
// *Cause: Installer does not find this Oracle home to be registered with the central inventory on this server.
// *Action: Register the Oracle home on this server with the central inventory, either by using a cloning operation, or by using an attach-home operation. Restart the installer after fixing this issue.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_HOME_NOT_REGISTERED_IN_INVENTORY_ON_LOCAL_NODE
/-------------------------------------------------------------------------------
45506, 0,"Installer has detected insufficient permissions to write to directory %s on this server."
// *Cause: n/a
// *Action: Ensure that you have the required write permissions for directory %s on this server.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_DIRECTORY_NOT_WRITABLE_ON_LOCAL_NODE
/-------------------------------------------------------------------------------
45507, 0,"Installer has detected insufficient permissions to write to directory %s on some of the nodes."
// *Cause: n/a
// *Action: Ensure that you have the required write permissions for directory %s on node(s) %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_DIRECTORY_NOT_WRITABLE_ON_NODE
/-------------------------------------------------------------------------------
45508, 0,"Installer has detected that downgrade user is not the grid user."
// *Cause: Installer has detected that neither downgrade user is same as grid user, nor downgrade user is member of the group to which grid user belongs.
// *Action: Ensure that downgrade user is same as grid user or downgrade user is a member of the group to which grid user belongs.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_USER_IS_NOT_GRID_USER
/-------------------------------------------------------------------------------
45509, 0,"Installer has detected that downgrade user is not member of group %s."
// *Cause: n/a
// *Action: Ensure that downgrade user is member of group %s.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_USER_MEMBERSHIP_ERR
/-------------------------------------------------------------------------------
45510, 0,"Installer has detected that Oracle Clusterware is not downgraded to %s version"
// *Cause: Either there was an error in starting the Oracle Clusterware stack on some of the nodes, or the root scripts failed on some nodes.
// *Action: Review the log file %s for downgrade failure.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DOWNGRADE_CRS_CHECK_FAILED
/-------------------------------------------------------------------------------
45511, 0,"Installer has detected that an Oracle Grid Infrastructure Home (%s) is marked incorrectly as a configured home in the central inventory."
// *Cause: n/a
// *Action: As the Oracle Grid Infrastructure is not configured in the home, the central inventory should be updated to indicate the same. Execute the following command on the nodes where the home exists to update the central inventory, and then continue with the install: %s
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_DUPLICATE_CRS_ENTRY_IN_INVENTORY_FILE
/-------------------------------------------------------------------------------
45512, 0,"Installer has detected that Oracle Grid Infrastructure Home (%s) path does not exist."
// *Cause: n/a
// *Action: For more details,contact Oracle Support Services.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_INVENTORY_CLEANUP_NOT_PROPER
/-------------------------------------------------------------------------------
45513, 0,"Installer has detected the upgrade of Oracle Clusterware was successful."
// *Cause: n/a
// *Action: Oracle Clusterware downgrade is allowed only on failed upgrades.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_DOWNGRADE_NOT_ALLOWED
/-------------------------------------------------------------------------------
45514, 0,"The installer has detected that required arguments are not passed with -executeConfigTools flag."
// *Cause: n/a
// *Action: Specify the response file used for installation with -responseFile flag for execution of config tools.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.EXECUTECONFIGTOOLS_ARG_MISSING
/-------------------------------------------------------------------------------
45515, 0,"The GI downgrade has detected that the Oracle Clusterware stack is not running on the local node."
// *Cause: n/a
// *Action: Either run the GI downgrade on the node where Oracle Clusterware stack is running or open a terminal, log in as root or Administrator, change directory to the Oracle Clusterware home (%s), and start Oracle Clusterware by entering this command: crsctl start crs.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.CRS_STACK_NOT_UP_DOWNGRADE_ERR
/-------------------------------------------------------------------------------
45516, 0,"There is no active Oracle Clusterware home on the cluster."
// *Cause: n/a
// *Action: In order to perform dry run upgrade, Oracle Clusterware needs to be configured and running.
// *FQN: oracle.install.ivw.crs.resource.CRSErrorCode.INSTALL_CRS_DRY_RUN_ALLOWED_ONLY_FOR_CRS_UPGRADE
/-------------------------------------------------------------------------------
50000, 0,"No component selected for installation."
// *Cause: n/a
// *Action: Select at least one component for installation.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.EMPTY_COMPONENTS_LIST
/-------------------------------------------------------------------------------
50001, 0,"Built-In User is not supported on Domain Controller."
// *Cause: n/a
// *Action: Specify a Windows User Account.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENT_CUSTOM_INSTALL_NOT_SUPPORTED_ON_DOMAIN_CONTROLLER
/-------------------------------------------------------------------------------
50004, 0,"Oracle Database Scheduler Agent port is blank or containing non-numeric character."
// *Cause: n/a
// *Action: Provide a valid value for Scheduler Agent port.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.INVALID_SCH_AGT_PORT
/-------------------------------------------------------------------------------
50005, 0,"The value you entered for Oracle Database Scheduler Agent port, %s, is already in use."
// *Cause: n/a
// *Action: Specify a valid port number.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.SCH_AGT_PORT_NOT_AVAILABLE
/-------------------------------------------------------------------------------
50006, 0,"The value specified for Oracle Database Scheduler Agent port number, %s, is out of valid range."
// *Cause: n/a
// *Action: Enter a port number between 1024 and 65535.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.OUT_OF_RANGE_SCH_AGT_PORT
/-------------------------------------------------------------------------------
50007, 0,"Oracle Database Scheduler Agent host name cant be empty."
// *Cause: n/a
// *Action: Provide a valid text in Scheduler Agent host name field.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.INVALID_SCH_AGT_HOST
/-------------------------------------------------------------------------------
50008, 0,"The currently selected software location cannot be upgraded."
// *Cause: The selected software location does not meet the criteria for a client upgrade.
// *Action: Only client homes of version 12.1.0.1.0 or higher containing only client software may be upgraded.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.INVALID_HOME_FOR_UPGRADE
/-------------------------------------------------------------------------------
50009, 0,"Could not resolve the Scheduler Agent host name specified."
// *Cause: n/a
// *Action: Provide valid local host name.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.SCH_AGT_HOST_NOT_REACHABLE
/-------------------------------------------------------------------------------
50010, 0,"Scheduler Agent host name specified does not match with local hosts name."
// *Cause: n/a
// *Action: Scheduler Agent host name must be a local host name.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.HOST_NAME_DOES_NOT_MATCH
/-------------------------------------------------------------------------------
50011, 0,"Invalid characters found in Scheduler Agent host name."
// *Cause: n/a
// *Action: Ensure host name contains valid characters. Valid characters for host names can be any combination of lower and uppercase alphanumeric characters (a - z, A - Z, 0 - 9), and hyphen (-).
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.BAD_CHARS_IN_HOSTNAME
/-------------------------------------------------------------------------------
50012, 0,"localhost and 127.0.0.1 are invalid inputs for Scheduler Agent Host Name."
// *Cause: n/a
// *Action: Enter host name which can be recognized by other hosts on the network.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.LOCALHOST_LOOPBACK_IP_INVALID_INPUT
/-------------------------------------------------------------------------------
50100, 0,"Installer has detected an invalid entry in the central inventory corresponding to Oracle home (%s)."
// *Cause: n/a
// *Action: Choose a different location as Oracle home.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_INVALID_HOME_REGISTERED
/-------------------------------------------------------------------------------
50101, 0,"The installer has detected that there are files in the Oracle Database Client home (%s) which are not owned by the user (%s)."
// *Cause: Following files are not owned by the user (%s):
//         %s
// *Action: Ensure that the files listed above are owned by the user (%s).
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_GOLDIMAGE_FILES_OWNER_MISMATCH
/-------------------------------------------------------------------------------
50102, 0,"The installer has detected that the Oracle Database Client home software at (%s) is not complete."
// *Cause: Following files are missing:
//         %s
// *Action: Ensure that the Oracle Database Client home at (%s) includes the files listed above.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_GOLDIMAGE_FILES_MISSING
/-------------------------------------------------------------------------------
50103, 0,"The installer has detected that the Oracle home location provided in the command line is not correct."
// *Cause: The Oracle home value set in the command line %s is not textually the same as %s (identified by the installer from the executed Client Setup command).
// *Action: Specify the correct Oracle home location through the ORACLE_HOME command line variable. If you do not set it, the Installer will specify the right one.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_WRONG_CMDLINE_HOME
/-------------------------------------------------------------------------------
50104, 0,"The installer has detected that the Oracle home location provided in the response file is not correct."
// *Cause: The Client Oracle home is the location from where the installer is executed. It has been detected that the value set in the response file is different (%s). Value expected is: %s
// *Action: It is not required to specify ORACLE_HOME in the response file for Client installation. Alternatively, set it to the location of the installer (%s).
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_WRONG_RSPFILE_HOME
/-------------------------------------------------------------------------------
50105, 0,"The Client software home (%s) is already registered in the central inventory. This tool can only be used in a non-registered Client home."
// *Cause: n/a
// *Action: Choose a different location as Oracle home.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_HOME_ALREADY_REGISTERED
/-------------------------------------------------------------------------------
50106, 0,"The installer has detected that the install type provided in the command line is not correct."
// *Cause: The install type value set in the command line %s is not the same as %s (identified by the installer from the Client image software).
// *Action: It is not required to specify the install type through the command line, the Installer will identify the right one.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_WRONG_CMDLINE_INSTALLTYPE
/-------------------------------------------------------------------------------
50107, 0,"The installer has detected that the install type provided in the response file is not correct."
// *Cause: The install type value set in the response file %s is not the same as %s (identified by the installer from the Client image software).
// *Action: It is not required to specify the install type through the response file, the Installer will identify the right one.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CLIENTSETUP_WRONG_RSPFILE_INSTALLTYPE
/-------------------------------------------------------------------------------
50150, 0,"The specified source home path (%s) does not correspond to a valid Oracle Database Client software home."
// *Cause: n/a
// *Action: Provide a valid Oracle Database Client software home as source home.
// *FQN: oracle.install.ivw.client.resource.ClientErrorCode.CREATEGOLDIMAGE_CLIENT_NOT_VALID_SOURCE_HOME
/-------------------------------------------------------------------------------
52001, 0,"Oracle Database Examples can only be installed into an existing Oracle Database Home of version %s."
// *Cause: n/a
// *Action: Choose an existing Oracle Database Home of version %s for the installation.
// *FQN: oracle.install.ivw.demos.resource.DemosErrorCode.INSTALL_DEMOS_NON_DB_ORACLE_HOME
/-------------------------------------------------------------------------------
70000, 0,"n/a"
// *Cause: n/a
// *Action: n/a
// *FQN: oracle.install.ivw.tg.resource.TGErrorCode.EMPTY_COMPONENTS_LIST
/-------------------------------------------------------------------------------
70002, 0,"%s is either empty or containing non-numeric character."
// *Cause: n/a
// *Action: Provide a valid value for %s.
// *FQN: oracle.install.ivw.tg.resource.TGErrorCode.INVALID_PORT
/-------------------------------------------------------------------------------
70003, 0,"The value specified for %s Listener Port number, %s, is out of valid range."
// *Cause: The value you have entered for %s Listener Port is out of the valid range.
// *Action: Enter a port number between 1024 and 65535.
// *FQN: oracle.install.ivw.tg.resource.TGErrorCode.OUT_OF_RANGE_PORT
/-------------------------------------------------------------------------------
70008, 0,"%s is empty."
// *Cause: n/a
// *Action: Enter a valid value for %s.
// *FQN: oracle.install.ivw.tg.resource.TGErrorCode.EMPTY_FIELD