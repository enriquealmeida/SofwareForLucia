/* Copyright (c) 1999, 2018, Oracle and/or its affiliates. 
All rights reserved.*/
/* 
   NAME 
     pn.h - definitions for  native code.

   DESCRIPTION 

   RELATED DOCUMENTS 
 
   INSPECTION STATUS 
     Inspection date: 
     Inspection status: 
     Estimated increasing cost defects per page: 
     Rule sets: 
 
   ACCEPTANCE REVIEW STATUS 
     Review date: 
     Review status: 
     Reviewers: 
 
   PUBLIC FUNCTION(S) 

   PRIVATE FUNCTION(S)

   EXAMPLES

   NOTES

   MODIFIED   (MM/DD/YY)
   astocks     07/22/18 - 28375836: Tidy up sleeping beauties
   sylin       05/11/07 - Sleeping beauties
   astocks     11/28/06 - Allow more than 65K static variables (5714076)
   mvemulap    11/14/05 - bug 4728671 fix 
   cracicot    07/11/05 - ANSI prototypes; miscellaneous cleanup 
   bwadding    06/13/05 - ANSI prototypes; miscellaneous cleanup 
   dbronnik    05/06/04 - Add mcode location of exception and line tables
   mvemulap    10/30/03 - change pnmagn 
   dbronnik    08/07/03 - Add pnspcdid
   sylin       06/19/03 - Add state_buf_siz field in pnpkd
   mvemulap    10/11/02 - change magic number
   dbronnik    12/14/00 - add compilation version
   dbronnik    08/07/03 - 
   kmuthukk    12/01/00 - don't use "word" type in shipped file.
   kmuthukk    12/01/00 - remove s.h include
   kmuthukk    12/01/00 - lstcat macro should not be in shipped pn.h file
   mvemulap    10/24/00 - add nept field to pnpkd
   mvemulap    07/27/00 - 
   mvemulap    12/20/99 - 
   mvemulap    11/11/99 - 
   kmuthukk    01/07/99 - defns common to native C modules and native compiler
   kmuthukk    01/07/99 - Creation

*/

 
#ifndef PN_ORACLE
# define PN_ORACLE

#ifndef ORATYPES
# include <oratypes.h>
#endif


/*---------------------------------------------------------------------------
                     PUBLIC TYPES AND CONSTANTS
  ---------------------------------------------------------------------------*/
/* lu magic number */
struct pnmagn
{
  ub8   pnmag0;                                        /* compilation stamp1 */
  ub8   pnmag1;                                        /* compilation stamp2 */
};
typedef struct pnmagn pnmagn;

#define PNMAGN_CMP(m1,m2) \
  (((m1).pnmag0 == (m2).pnmag0) && \
   ((m1).pnmag1 == (m2).pnmag1))

#define PNMAGN_ASSIGN(m1,m2) \
  do {\
      (m1).pnmag0 = (m2).pnmag0; \
      (m1).pnmag1 = (m2).pnmag1; \
      } while (0)

/* pnpkd -- package (any lib unit actually) definition for native 
 * compiled libunits. When a lib-unit is instantiated, the information
 * need is taken from this definition. It is analogous to the pemtpkd
 * used for interpreted lib-units.
 */
struct  pnpkd
{
  pnmagn   pnmag;                                       /* compilation stamp */
  ub4      pnver;                          /* native compiler version number */
  ub4      pngfsz;                           /* size of package global frame */
  ub4      pnept;                                  /* number of entry points */
  ub2      pnnod;                                    /* # depends-on entries */
  ub2      pnmsl;                                     /* maximum scope level */
  ub4      pnnps;            /* number of package slots (global frame slots) */
  ub2      pnspcdid;                        /* spec object dependency number */
  size_t   pnstbsz;        /* padded size of space reserved by this module for
                            * state structures (perst). Useful only if
                            * pdnncs_ncomp_use_cstack==TRUE. Set to 0 if
                            * pdnncs_ncomp_use_cstack==FALSE.
                            */
  ub2      pnehtp;                                  /* DS page number of EHT */
  ub2      pnehto;                                 /* DS page offset of EHT  */
  ub4      pnnlns;                                 /* # line number segments */
  ub2      pnlnstp;                               /* DS page number of LNST  */
  ub2      pnlnsto;                               /* DS page offset of LNST  */

  void*    pncodeptr;                                     /* LU code pointer */
  size_t   pncodesize;                                       /* LU code size */
  ub4      pnexcp;                   /* number of entries in exception table */

  /* Remember: you can't reorder the sleeping beauties, you can only rename
     them! */
  ub8     pnpkdNevada;                                    /* Sleeping Beauty */
  ub8     pnpkdMontana;                                   /* Sleeping Beauty */
  void   *pnpkdWyoming;                                   /* Sleeping Beauty */
  void   *pnpkdAlaska;                                    /* Sleeping Beauty */

};
typedef struct pnpkd pnpkd;


/*---------------------------------------------------------------------------
                     PRIVATE TYPES AND CONSTANTS
  ---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------
                           PUBLIC FUNCTIONS
  ---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------
                          PRIVATE FUNCTIONS
  ---------------------------------------------------------------------------*/


#endif                                                          /* PN_ORACLE */
