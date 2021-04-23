Oracle Database 10g: Updates to the Oracle Language and Territory
Definition Files

Changes have been made to the content in some of the language and
territory definition files in Oracle Database 10g. These updates
are necessary to correct the legacy definitions which no longer
meet the local conventions in some of the Oracle supported
languages and territories. These changes include modifications to
the currency symbols, month names, and group separators. One
example is the local currency symbol for Brazil. This has been
updated from Cr$ to R$ in Oracle Database 10g.

Please refer to the tables "Oracle Database 10g Language and
Territory Definition Changes" documented in the
$ORACLE_HOME/nls/data/old/data_changes.htm
file for a detailed list of the changes.

Oracle Database 10g customers should review their existing
application code and to make sure that the correct cultural
conventions that are defined in Oracle Database 10g are being
used. For customers who may not be able to make the necessary
code changes to support their applications, Oracle offers
Oracle9i backward compatibility by shipping a set of Oracle9i
locale definition files with Oracle Database 10g.

To revert to the Oracle9i language and territory behavior:

  1. Shutdown the database
  2. Run the script '$ORACLE_HOME/nls/data/old/cr9idata.pl' as 
     the owner of the ORACLE_HOME directory 
  3. Set the ORA_NLS10 environment variable to the newly created 
     $ORACLE_HOME/nls/data/9idata directory
  4. Restart the database

Steps 2 and 3 will need to be repeated for all 10g database
clients that need to revert back to the Oracle9i definition files.

Alternatively, run perl script under $ORACLE_HOME/nls/data/old/cr9idata.pl
 and set $ORA_NLS10 to $ORACLE_HOME/nls/data/9idata.

Oracle Corporation strongly recommends that customers use the
Oracle Database 10g locale definition files; Oracle9i locale
definition files will be desupported in a future release.
